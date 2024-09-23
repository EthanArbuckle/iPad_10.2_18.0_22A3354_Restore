@implementation NSString(QRCode)

- (id)lightQRCode
{
  void *v1;
  void *v2;
  void *v3;
  CGFloat Width;
  void *v5;
  CGAffineTransform v7;
  CGRect v8;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIQRCodeGenerator"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v1, CFSTR("inputMessage"));
  objc_msgSend(v2, "outputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extent");
  Width = CGRectGetWidth(v8);
  CGAffineTransformMakeScale(&v7, 256.0 / Width, 256.0 / Width);
  objc_msgSend(v3, "imageByApplyingTransform:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)darkQRCode
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "lightQRCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIColorInvert"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x24BDBF960];
    objc_msgSend(v2, "setValue:forKey:", v1, *MEMORY[0x24BDBF960]);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "outputImage");
    else
      objc_msgSend(0, "valueForKey:", *MEMORY[0x24BDBF9C8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIMaskToAlpha"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v5, v3);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "outputImage");
      else
        objc_msgSend(v6, "valueForKey:", *MEMORY[0x24BDBF9C8]);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        v9 = (void *)v7;
      else
        v9 = v1;
      v4 = v9;

    }
    else
    {
      v4 = v1;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
