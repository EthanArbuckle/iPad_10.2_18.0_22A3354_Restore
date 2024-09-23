@implementation UIFont(PKPeerPaymentAdditions)

+ (BOOL)pk_loadFontWithFileName:()PKPeerPaymentAdditions
{
  id v3;
  NSObject *v4;
  void *v5;
  const __CFURL *v6;
  _BOOL8 v7;
  __CFString *v8;
  CFErrorRef error;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  PKLogFacilityTypeGetObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl(&dword_213A36000, v4, OS_LOG_TYPE_DEFAULT, "Registering peer payment font: %{public}@.", buf, 0xCu);
  }

  PKPassKitUIFoundationBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v3, CFSTR("otf"));
  v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    error = 0;
    v7 = CTFontManagerRegisterFontsForURL(v6, kCTFontManagerScopeProcess, &error);
    if (!v7)
    {
      v8 = (__CFString *)CFErrorCopyDescription(error);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v12 = v3;
        v13 = 2112;
        v14 = v8;
        _os_log_impl(&dword_213A36000, v4, OS_LOG_TYPE_DEFAULT, "Failed to register font %{public}@ with error %@.", buf, 0x16u);
      }

      if (error)
        CFRelease(error);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (uint64_t)pk_loadPeerPaymentCashFont
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__UIFont_PKPeerPaymentAdditions__pk_loadPeerPaymentCashFont__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pk_loadPeerPaymentCashFont_onceToken != -1)
    dispatch_once(&pk_loadPeerPaymentCashFont_onceToken, block);
  return pk_loadPeerPaymentCashFont_result;
}

+ (id)pk_peerPaymentCashFontOfSize:()PKPeerPaymentAdditions
{
  void *v3;

  if (objc_msgSend(a1, "pk_loadPeerPaymentCashFont"))
  {
    objc_msgSend((id)objc_opt_class(), "fontWithName:size:", CFSTR("SFCash-Plain"), a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)pk_peerPaymentChiseledCashFontOfSize:()PKPeerPaymentAdditions
{
  void *v2;
  void *v3;

  +[PKPeerPaymentFontHelper chiseledCashFontDescriptor](PKPeerPaymentFontHelper, "chiseledCashFontDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "fontWithDescriptor:size:", v2, a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (uint64_t)pk_loadTextCondensedRegularCashFont
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__UIFont_PKPeerPaymentAdditions__pk_loadTextCondensedRegularCashFont__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pk_loadTextCondensedRegularCashFont_onceToken != -1)
    dispatch_once(&pk_loadTextCondensedRegularCashFont_onceToken, block);
  return pk_loadTextCondensedRegularCashFont_result;
}

+ (id)pk_textCondensedRegularCashFontOfSize:()PKPeerPaymentAdditions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "pk_loadTextCondensedRegularCashFont"))
  {
    v3 = *MEMORY[0x24BDF7750];
    v16[0] = CFSTR("SFCashTextCondensed-Regular");
    v4 = *MEMORY[0x24BDF7748];
    v15[0] = v3;
    v15[1] = v4;
    v5 = *MEMORY[0x24BDF7778];
    v12[0] = *MEMORY[0x24BDF7780];
    v12[1] = v5;
    v13[0] = &unk_24D0A9C38;
    v13[1] = &unk_24D0A9C50;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6A78], "fontDescriptorWithFontAttributes:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "fontWithDescriptor:size:", v9, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (uint64_t)pk_loadTextCondensedSemiboldCashFont
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__UIFont_PKPeerPaymentAdditions__pk_loadTextCondensedSemiboldCashFont__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pk_loadTextCondensedSemiboldCashFont_onceToken != -1)
    dispatch_once(&pk_loadTextCondensedSemiboldCashFont_onceToken, block);
  return pk_loadTextCondensedSemiboldCashFont_result;
}

+ (id)pk_textCondensedSemiboldCashFontOfSize:()PKPeerPaymentAdditions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "pk_loadTextCondensedSemiboldCashFont"))
  {
    v3 = *MEMORY[0x24BDF7750];
    v16[0] = CFSTR("SFCashTextCondensed-Semibold");
    v4 = *MEMORY[0x24BDF7748];
    v15[0] = v3;
    v15[1] = v4;
    v5 = *MEMORY[0x24BDF7778];
    v12[0] = *MEMORY[0x24BDF7780];
    v12[1] = v5;
    v13[0] = &unk_24D0A9C38;
    v13[1] = &unk_24D0A9C50;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6A78], "fontDescriptorWithFontAttributes:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "fontWithDescriptor:size:", v9, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (uint64_t)pk_loadTextCondensedMediumCashFont
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__UIFont_PKPeerPaymentAdditions__pk_loadTextCondensedMediumCashFont__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pk_loadTextCondensedMediumCashFont_onceToken != -1)
    dispatch_once(&pk_loadTextCondensedMediumCashFont_onceToken, block);
  return pk_loadTextCondensedMediumCashFont_result;
}

+ (id)pk_textCondensedMediumCashFontOfSize:()PKPeerPaymentAdditions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "pk_loadTextCondensedMediumCashFont"))
  {
    v3 = *MEMORY[0x24BDF7750];
    v16[0] = CFSTR("SFCashTextCondensed-Medium");
    v4 = *MEMORY[0x24BDF7748];
    v15[0] = v3;
    v15[1] = v4;
    v5 = *MEMORY[0x24BDF7778];
    v12[0] = *MEMORY[0x24BDF7780];
    v12[1] = v5;
    v13[0] = &unk_24D0A9C38;
    v13[1] = &unk_24D0A9C50;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6A78], "fontDescriptorWithFontAttributes:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "fontWithDescriptor:size:", v9, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)pk_fixedWidthFont
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDF7778];
  v15[0] = *MEMORY[0x24BDF7780];
  v15[1] = v2;
  v16[0] = &unk_24D0A9C68;
  v16[1] = &unk_24D0A9C50;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDF7748];
  v12 = v3;
  v13 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(v8, "pointSize");
  objc_msgSend(v9, "fontWithDescriptor:size:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
