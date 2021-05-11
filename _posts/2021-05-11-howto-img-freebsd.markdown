---
layout: post
title:  "HOWTO: Write a Disk Image to USB Media on FreeBSD"
date:   2021-05-11 12:30:07 -0400
categories: howto freebsd
---
This HOWTO will describe the process of writing a disk image to USB media using only tools available in all FreeBSD installations. I wrote this using FreeBSD 13.0 but the command line tools and options should work on older versions.

A disk image will usually end with `.img` or `.iso`. A `.iso` can usually either be written to USB media or to a CD/DVD.

This document will assume the reader has a very basic understanding of the command line.

# Steps

1. Insert the USB drive into the USB port. If using other media, insert the media into the reader/writer and insert that into the USB port.
1. Open a terminal and run `geom disk list` to view all attached disks. You should be able to identify it by the size of the disk (“mediasize”) and the manufacturer’s name (“descr”).

   Sample output of `geom disk list`:

   ```
   Geom name: da0
   Providers:
   1. Name: da0
      Mediasize: 8166703104 (7.6G)
      Sectorsize: 512
      Mode: r0w0e0
      descr: Verbatim micro USB
      ident: 11122488000854
      rotationrate: unknown
      fwsectors: 63
      fwheads: 255
   ```

   The name is what we need. Here that’s `da0`, but for the remainder of this document I’ll refer to it as `XXX` to prevent copy/paste accidents.

1. Run `su` to switch to root.
1. Run the following command.

   <div class="warning">
     <h2>⚠️ WARNING ⚠️</h2>

     This command is destructive. The disk’s data will be entirely overwritten and it will be impossible to retrieve. Only proceed if you’re sure you’re using the correct disk.
   </div>
   
   ```
   cat myfile.img /dev/zero | dd of=/dev/XXX bs=1M
   ```
   
   This command will write `myfile.img` to the `XXX` disk, and then continue to write zeros to the disk until the disk is full.

# Notes

It’s important to write zeros to the remainder of the disk as sometimes old data can be interpreted as part of the disk image.

The `bs=1M` flag is necessary because writing a disk byte-by-byte is extremely slow. Writing a disk in 1 mebibyte blocks (1MiB = 1 mebibyte = 1024² bytes) will be significantly faster in most cases. The ideal block size flag to pass will differ depending on the hardware used, but `1M` will work well enough. ([More about the `bs` flag](https://serverfault.com/questions/650086/does-the-bs-option-in-dd-really-improve-the-speed))

<style>
article .warning {
  background: #ff0;
  color: #000;
  padding: 10px 15px 15px;
  margin-bottom: 15px;
}
article .warning h2 {
  font-size: 22px;
  margin-bottom: 5px;
}
</style>
