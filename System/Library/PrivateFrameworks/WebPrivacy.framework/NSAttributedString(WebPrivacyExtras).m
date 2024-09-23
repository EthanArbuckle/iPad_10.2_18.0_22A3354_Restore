@implementation NSAttributedString(WebPrivacyExtras)

- (id)_wp_stringByRemovingTrackingInformationFromURLs
{
  NSString *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  id v8;
  id v9;
  WebPrivacy *v10;
  _QWORD v12[3];
  _BYTE v13[8];
  void *v14;
  void **v15;

  objc_msgSend(a1, "string");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  checkForURLUsingFastPath(v2, (uint64_t)v13);

  if (v13[0])
  {
    v3 = v14;
    if (v14)
    {
      v4 = objc_msgSend(a1, "length");
      objc_msgSend(v3, "_wp_urlByRemovingTrackingInformation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = operator new(0x18uLL);
      v12[0] = v7;
      v12[2] = v7 + 3;
      *v7 = 0;
      v7[1] = v4;
      v8 = v6;
      v7[2] = v8;
      v12[1] = v7 + 3;
      WebPrivacy::applyOrderedReplacements<NSAttributedString>(a1, v12);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (void **)v12;
      std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v15);

    }
    else
    {
      objc_msgSend(a1, "string");
      v10 = (WebPrivacy *)objc_claimAutoreleasedReturnValue();
      WebPrivacy::findOrderedReplacementRanges(v10, (uint64_t)v12);
      WebPrivacy::applyOrderedReplacements<NSAttributedString>(a1, v12);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (void **)v12;
      std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v15);

      v3 = 0;
    }
  }
  else
  {
    v9 = a1;
    v3 = v14;
  }

  return v9;
}

- (void)_wp_removeTrackingInformationFromURLs:()WebPrivacyExtras
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _BYTE v16[8];
  void *v17;

  v4 = a3;
  objc_msgSend(a1, "string");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  checkForURLUsingFastPath(v5, (uint64_t)v16);

  if (v16[0])
  {
    v6 = v17;
    if (v17)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __78__NSAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke;
      v14[3] = &unk_251BCEF30;
      v14[4] = a1;
      v15 = v4;
      objc_msgSend(v6, "_wp_removeTrackingInformation:", v14);

    }
    else
    {
      objc_msgSend(a1, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3321888768;
      v11[2] = __78__NSAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke_2;
      v11[3] = &__block_descriptor_48_ea8_32c91_ZTSKZ78__NSAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs__E3__4_e9_v16__0_v8l;
      v8 = (void *)MEMORY[0x24BD10684](v4);
      v9 = (void *)objc_msgSend(a1, "copy");
      v12 = (id)MEMORY[0x24BD10684](v8);
      v10 = v9;
      v13 = v10;
      WebPrivacy::findOrderedReplacementRanges(v7, v11);

      v6 = 0;
    }
  }
  else
  {
    (*((void (**)(id, void *))v4 + 2))(v4, a1);
    v6 = v17;
  }

}

@end
