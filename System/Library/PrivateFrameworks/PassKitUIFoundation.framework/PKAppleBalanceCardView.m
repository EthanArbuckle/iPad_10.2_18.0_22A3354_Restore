@implementation PKAppleBalanceCardView

- (PKAppleBalanceCardView)init
{
  void *v3;
  NSURL *v4;
  NSURL *v5;
  uint64_t v6;
  NSURL *v7;
  BOOL v8;
  PKAppleBalanceCardView *v10;
  uint64_t v11;
  CGImage *v12;
  NSObject *v13;
  CGImage *v14;
  NSObject *v15;
  uint64_t v16;
  CGImage *v17;
  id *v18;
  NSObject *v19;
  _QWORD v21[7];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("AppleBalance-diffuse"), CFSTR("png"));
  v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("AppleBalance-metalness"), CFSTR("png"));
  v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("AppleBalance-normal"), CFSTR("png"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (NSURL *)v6;
  if (v4)
    v8 = v5 == 0;
  else
    v8 = 1;
  if (!v8 && v6 != 0)
  {
    v11 = PKCreateCGImage(v4);
    v12 = (CGImage *)v11;
    if (!v11)
    {
      PKLogFacilityTypeGetObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213A36000, v13, OS_LOG_TYPE_DEFAULT, "PKAppleBalanceCardView: could not load diffuse image.", buf, 2u);
      }

    }
    v14 = (CGImage *)PKCreateCGImage(v5);
    if (!v14)
    {
      PKLogFacilityTypeGetObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213A36000, v15, OS_LOG_TYPE_DEFAULT, "PKAppleBalanceCardView: could not load metalness image.", buf, 2u);
      }

    }
    v16 = PKCreateCGImage(v7);
    v17 = (CGImage *)v16;
    if (v16)
    {
      if (v12 && v14)
      {
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __30__PKAppleBalanceCardView_init__block_invoke;
        v21[3] = &__block_descriptor_56_e51___PKTexturedCardRenderer_16__0__PKMetalRenderLoop_8l;
        v21[4] = v12;
        v21[5] = v14;
        v21[6] = v16;
        v18 = -[PKTexturedCardView _initWithPixelFormat:renderer:]((id *)&self->super.super.super.super.isa, 80, v21);
LABEL_26:
        CGImageRelease(v12);
        CGImageRelease(v14);
        CGImageRelease(v17);
        self = v18;
        v10 = self;
        goto LABEL_27;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213A36000, v19, OS_LOG_TYPE_DEFAULT, "PKAppleBalanceCardView: could not load normal image.", buf, 2u);
      }

    }
    v18 = 0;
    goto LABEL_26;
  }
  v10 = 0;
LABEL_27:

  return v10;
}

id *__30__PKAppleBalanceCardView_init__block_invoke(uint64_t *a1, void *a2)
{
  id v3;
  id *v4;

  v3 = a2;
  objc_msgSend(v3, "setColorSpace:", PKColorSpaceStandardRGB());
  v4 = -[PKTexturedCardRenderer initWithStyle:renderLoop:diffuse:metalness:normal:]((id *)[PKTexturedCardRenderer alloc], 2uLL, v3, a1[4], a1[5], a1[6]);

  return v4;
}

@end
