@implementation SFDeviceModelCodeGet

void __SFDeviceModelCodeGet_block_invoke()
{
  char v0;
  id v1;

  v1 = (id)GestaltCopyAnswer();
  if ((objc_msgSend(v1, "isEqual:", CFSTR("iPhone10,3")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone10,6")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone11,2")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone11,4")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone11,6")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone11,8")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone12,1")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone12,3")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone12,5")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone13,1")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone13,2")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone13,3")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone13,4")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone14,2")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone14,3")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone14,4")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone14,5")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone14,7")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone14,8")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone15,2")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone15,3")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone15,4")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone15,5")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone16,1")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone16,2")) & 1) != 0)
  {
    v0 = 1;
  }
  else if ((objc_msgSend(v1, "isEqual:", CFSTR("iPhone8,4")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone6,1")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPhone6,2")) & 1) != 0)
  {
    v0 = 2;
  }
  else if ((objc_msgSend(v1, "isEqual:", CFSTR("iPad8,1")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad8,2")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad8,3")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad8,4")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad8,5")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad8,6")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad8,7")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad8,8")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad8,9")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad8,10")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad8,11")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad8,12")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad13,1")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad13,2")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad13,4")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad13,5")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad13,6")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad13,7")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad13,8")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad13,9")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad13,10")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad13,11")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad14,1")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad14,2")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad13,16")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad13,17")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad13,18")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad13,19")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad14,3")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad14,4")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad14,5")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad14,6")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad16,3")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad16,4")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad16,5")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad16,6")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad14,8")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad14,9")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad14,10")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPad14,11")) & 1) != 0)
  {
    v0 = 3;
  }
  else if ((objc_msgSend(v1, "isEqual:", CFSTR("iPod7,1")) & 1) != 0
         || (objc_msgSend(v1, "isEqual:", CFSTR("iPod9,1")) & 1) != 0)
  {
    v0 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AudioAccessory5,1")) & 1) != 0)
  {
    v0 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AudioAccessory6,1")) & 1) != 0
         || (objc_msgSend(v1, "isEqualToString:", CFSTR("AudioAccessory99,1")) & 1) != 0
         || (objc_msgSend(v1, "isEqualToString:", CFSTR("AudioAccessory99,2")) & 1) != 0)
  {
    v0 = 6;
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", CFSTR("AppleTV14,1")))
      goto LABEL_28;
    v0 = 7;
  }
  SFDeviceModelCodeGet_sResult = v0;
LABEL_28:

}

@end
