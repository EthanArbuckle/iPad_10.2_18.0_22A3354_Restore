@implementation UIDevice

uint64_t __45__UIDevice_SFAdditions__sf_isInternalInstall__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  sf_isInternalInstall___internalInstall = result;
  return result;
}

uint64_t __55__UIDevice_SFAdditions__sf_isChinaRegionCellularDevice__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  sf_isChinaRegionCellularDevice___greenTea = result;
  return result;
}

uint64_t __44__UIDevice_SFAdditions__sf_isCarrierInstall__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  sf_isCarrierInstall___carrierInstall = result;
  return result;
}

void __40__UIDevice_SFAdditions__sf_configString__block_invoke()
{
  const __CFData *v0;
  const __CFData *v1;
  CFTypeID v2;
  const UInt8 *BytePtr;
  size_t Length;
  void *v5;
  uint64_t v6;
  void *v7;

  v0 = (const __CFData *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFDataGetTypeID())
    {
      BytePtr = CFDataGetBytePtr(v1);
      Length = CFDataGetLength(v1);
      v5 = malloc_type_malloc(Length + 1, 0x500A7F39uLL);
      bzero(v5, Length + 1);
      memcpy(v5, BytePtr, Length);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)sf_configString___config;
      sf_configString___config = v6;

      free(v5);
    }
  }
}

void __47__UIDevice_SFAdditions__sf_deviceSubTypeString__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const __CFString *v3;
  void *v4;
  id v5;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v5 = v0;
    objc_msgSend(v0, "objectForKey:", CFSTR("ArtworkDeviceSubType"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "integerValue");

    if (v2 <= 2359)
    {
      if (v2 > 1791)
      {
        switch(v2)
        {
          case 1792:
            v3 = CFSTR("Retina6InchFull");
            goto LABEL_33;
          case 2224:
            v3 = CFSTR("Retina11Inch");
            goto LABEL_33;
          case 2340:
            v3 = CFSTR("3xRetina5.4InchFull");
            goto LABEL_33;
        }
      }
      else
      {
        switch(v2)
        {
          case 568:
            v3 = CFSTR("Retina4Inch");
            goto LABEL_33;
          case 569:
            v3 = CFSTR("Retina4.7Inch");
            goto LABEL_33;
          case 570:
            v3 = CFSTR("3xRetina5.5Inch");
            goto LABEL_33;
        }
      }
    }
    else if (v2 <= 2531)
    {
      switch(v2)
      {
        case 2360:
          v3 = CFSTR("Retina10.9InchFull");
          goto LABEL_33;
        case 2388:
          v3 = CFSTR("Retina11InchFull");
          goto LABEL_33;
        case 2436:
          v3 = CFSTR("3xRetina5.8InchFull");
          goto LABEL_33;
      }
    }
    else if (v2 > 2731)
    {
      if (v2 == 2732)
      {
        v3 = CFSTR("Retina12Inch");
        goto LABEL_33;
      }
      if (v2 == 2778)
      {
        v3 = CFSTR("3xRetina6.6InchFull");
        goto LABEL_33;
      }
    }
    else
    {
      if (v2 == 2532)
      {
        v3 = CFSTR("3xRetina6InchFull");
        goto LABEL_33;
      }
      if (v2 == 2688)
      {
        v3 = CFSTR("3xRetina6.5InchFull");
LABEL_33:
        v4 = (void *)sf_deviceSubTypeString_deviceSubTypeString;
        sf_deviceSubTypeString_deviceSubTypeString = (uint64_t)v3;

        v0 = v5;
        goto LABEL_34;
      }
    }
    v3 = &stru_24C398458;
    goto LABEL_33;
  }
LABEL_34:

}

void __45__UIDevice_SFAdditions__sf_screenClassString__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("main-screen-width");
  v2[1] = CFSTR("main-screen-height");
  v2[2] = CFSTR("main-screen-scale");
  v2[3] = CFSTR("main-screen-pitch");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 4);
  MGCopyMultipleAnswers();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sf_screenClassString_screenClass;
  sf_screenClassString_screenClass = v0;

}

void __38__UIDevice_SFAdditions__sf_regionCode__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGGetStringAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sf_regionCode___regionCode;
  sf_regionCode___regionCode = v0;

}

void __53__UIDevice_SFAdditions__sf_deviceSupportsDisplayZoom__block_invoke()
{
  void *v0;
  void *v1;
  BOOL v2;
  id v3;

  v3 = (id)MGCopyAnswer();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("default"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("zoomed"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "count") == 4 && objc_msgSend(v1, "count") == 4;
  sf_deviceSupportsDisplayZoom__supportsDisplayZoom = v2;

}

void __47__UIDevice_SFAdditions__sf_serialNumberQRImage__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  objc_msgSend(*(id *)(a1 + 32), "sf_serialNumber");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataUsingEncoding:", 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF658], "QRCodeGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMessage:", v2);
  objc_msgSend(v3, "setCorrectionLevel:", CFSTR("H"));
  objc_msgSend(v3, "outputImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extent");
  v18 = CGRectIntegral(v17);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  v9 = 140.0 / CGRectGetWidth(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v10 = CGRectGetHeight(v19);
  CGAffineTransformMakeScale(&v16, v9, 140.0 / v10);
  objc_msgSend(v4, "imageByApplyingTransform:", &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF648], "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BDF6AC8]);
  objc_msgSend(v11, "extent");
  v14 = objc_msgSend(v13, "initWithCGImage:", objc_msgSend(v12, "createCGImage:fromRect:", v11));
  v15 = (void *)sf_serialNumberQRImage_qrCodeImageByTransform;
  sf_serialNumberQRImage_qrCodeImageByTransform = v14;

}

@end
