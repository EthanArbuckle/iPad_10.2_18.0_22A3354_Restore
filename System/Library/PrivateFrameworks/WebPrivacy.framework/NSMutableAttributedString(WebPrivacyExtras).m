@implementation NSMutableAttributedString(WebPrivacyExtras)

- (void)_wp_removeTrackingInformationFromURLs
{
  NSString *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *i;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  char v18[8];
  void *v19;
  void **v20;

  objc_msgSend(a1, "string");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  checkForURLUsingFastPath(v2, (uint64_t)v18);

  v3 = v19;
  if (v18[0])
  {
    if (v19)
    {
      v4 = objc_msgSend(a1, "length");
      objc_msgSend(v3, "_wp_urlByRemovingTrackingInformation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = operator new(0x18uLL);
      v8 = v7 + 3;
      v15 = v7;
      v17 = v7 + 3;
      *v7 = 0;
      v7[1] = v4;
      v9 = v6;
      v7[2] = v9;
      v16 = v7 + 3;
      while (v8 != v15)
      {
        v10 = *(v8 - 3);
        v11 = *(v8 - 2);
        v8 -= 3;
        objc_msgSend(a1, "replaceCharactersInRange:withString:", v10, v11, v8[2]);
      }
      v20 = (void **)&v15;
      std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v20);

    }
    else
    {
      objc_msgSend(a1, "string");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      WebPrivacy::findOrderedReplacementRanges((WebPrivacy *)v5, (uint64_t)&v15);
      for (i = v16; i != v15; objc_msgSend(a1, "replaceCharactersInRange:withString:", v13, v14, i[2]))
      {
        v13 = *(i - 3);
        v14 = *(i - 2);
        i -= 3;
      }
      v20 = (void **)&v15;
      std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v20);
    }

  }
}

- (void)_wp_removeTrackingInformationFromURLsInPlace:()WebPrivacyExtras
{
  void (**v4)(_QWORD);
  NSString *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  _QWORD v14[5];
  void (**v15)(_QWORD);
  id v16;
  _BYTE v17[8];
  void *v18;

  v4 = a3;
  objc_msgSend(a1, "string");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  checkForURLUsingFastPath(v5, (uint64_t)v17);

  if (v17[0])
  {
    v6 = v18;
    if (v18)
    {
      objc_initWeak(&v8, a1);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __92__NSMutableAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace___block_invoke;
      v14[3] = &unk_251BCEF80;
      objc_copyWeak(&v16, &v8);
      v14[4] = a1;
      v15 = v4;
      objc_msgSend(v6, "_wp_removeTrackingInformation:", v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&v8);
    }
    else
    {
      objc_initWeak(&location, a1);
      objc_msgSend(a1, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3321888768;
      v10[2] = __92__NSMutableAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace___block_invoke_2;
      v10[3] = &__block_descriptor_48_ea8_32c105_ZTSKZ92__NSMutableAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace__E3__6_e9_v16__0_v8l;
      v8 = (id)MEMORY[0x24BD10684](v4);
      objc_copyWeak(&v9, &location);
      v11 = (id)MEMORY[0x24BD10684](v8);
      objc_copyWeak(&v12, &v9);
      WebPrivacy::findOrderedReplacementRanges(v7, v10);
      objc_destroyWeak(&v9);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      v6 = 0;
    }
  }
  else
  {
    v4[2](v4);
    v6 = v18;
  }

}

@end
