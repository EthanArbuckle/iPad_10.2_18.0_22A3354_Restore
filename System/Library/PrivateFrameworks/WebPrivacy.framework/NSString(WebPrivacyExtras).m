@implementation NSString(WebPrivacyExtras)

- (NSString)_wp_stringByRemovingTrackingInformationFromURLs
{
  id v2;
  void *v3;
  NSString *v4;
  _QWORD v6[3];
  char v7[8];
  id v8;
  void **v9;

  checkForURLUsingFastPath(a1, (uint64_t)v7);
  if (v7[0])
  {
    v2 = v8;
    if (v8)
    {
      objc_msgSend(v8, "_wp_urlByRemovingTrackingInformation");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "absoluteString");
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      WebPrivacy::findOrderedReplacementRanges((WebPrivacy *)a1, (uint64_t)v6);
      WebPrivacy::applyOrderedReplacements<NSString>(a1, v6);
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = (void **)v6;
      std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v9);
      v2 = 0;
    }
  }
  else
  {
    v4 = a1;
    v2 = v8;
  }

  return v4;
}

- (void)_wp_removeTrackingInformationFromURLs:()WebPrivacyExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _BYTE v14[8];
  void *v15;

  v4 = a3;
  checkForURLUsingFastPath(a1, (uint64_t)v14);
  if (v14[0])
  {
    v5 = v15;
    if (v15)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __68__NSString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke;
      v12[3] = &unk_251BCEF08;
      v13 = v4;
      objc_msgSend(v5, "_wp_removeTrackingInformation:", v12);

    }
    else
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3321888768;
      v9[2] = __68__NSString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke_2;
      v9[3] = &__block_descriptor_48_ea8_32c81_ZTSKZ68__NSString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs__E3__3_e9_v16__0_v8l;
      v6 = (void *)MEMORY[0x24BD10684](v4);
      v7 = (void *)-[NSString copy](a1, "copy");
      v10 = (id)MEMORY[0x24BD10684](v6);
      v8 = v7;
      v11 = v8;
      WebPrivacy::findOrderedReplacementRanges(a1, v9);

      v5 = 0;
    }
  }
  else
  {
    (*((void (**)(id, NSString *))v4 + 2))(v4, a1);
    v5 = v15;
  }

}

@end
