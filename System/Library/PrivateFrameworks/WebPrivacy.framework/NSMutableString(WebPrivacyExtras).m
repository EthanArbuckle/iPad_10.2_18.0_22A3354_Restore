@implementation NSMutableString(WebPrivacyExtras)

- (void)_wp_removeTrackingInformationFromURLs
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *i;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  char v17[8];
  void *v18;
  void **v19;

  checkForURLUsingFastPath(a1, (uint64_t)v17);
  v2 = v18;
  if (v17[0])
  {
    if (v18)
    {
      v3 = -[NSString length](a1, "length");
      objc_msgSend(v2, "_wp_urlByRemovingTrackingInformation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "absoluteString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = operator new(0x18uLL);
      v7 = v6 + 3;
      v14 = v6;
      v16 = v6 + 3;
      *v6 = 0;
      v6[1] = v3;
      v8 = v5;
      v6[2] = v8;
      v15 = v6 + 3;
      while (v7 != v14)
      {
        v9 = *(v7 - 3);
        v10 = *(v7 - 2);
        v7 -= 3;
        -[NSString replaceCharactersInRange:withString:](a1, "replaceCharactersInRange:withString:", v9, v10, v7[2]);
      }
      v19 = (void **)&v14;
      std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v19);

    }
    else
    {
      WebPrivacy::findOrderedReplacementRanges((WebPrivacy *)a1, (uint64_t)&v14);
      for (i = v15;
            i != v14;
            -[NSString replaceCharactersInRange:withString:](a1, "replaceCharactersInRange:withString:", v12, v13, i[2]))
      {
        v12 = *(i - 3);
        v13 = *(i - 2);
        i -= 3;
      }
      v19 = (void **)&v14;
      std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v19);
    }
  }

}

- (void)_wp_removeTrackingInformationFromURLsInPlace:()WebPrivacyExtras
{
  void (**v4)(_QWORD);
  void *v5;
  id location;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id from;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  id v14;
  _BYTE v15[8];
  void *v16;

  v4 = a3;
  checkForURLUsingFastPath(a1, (uint64_t)v15);
  if (v15[0])
  {
    v5 = v16;
    if (v16)
    {
      objc_initWeak(&location, a1);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __82__NSMutableString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace___block_invoke;
      v12[3] = &unk_251BCEF58;
      objc_copyWeak(&v14, &location);
      v13 = v4;
      objc_msgSend(v5, "_wp_removeTrackingInformation:", v12);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_initWeak(&from, a1);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3321888768;
      v8[2] = __82__NSMutableString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace___block_invoke_2;
      v8[3] = &__block_descriptor_48_ea8_32c95_ZTSKZ82__NSMutableString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace__E3__5_e9_v16__0_v8l;
      location = (id)MEMORY[0x24BD10684](v4);
      objc_copyWeak(&v7, &from);
      v9 = (id)MEMORY[0x24BD10684](location);
      objc_copyWeak(&v10, &v7);
      WebPrivacy::findOrderedReplacementRanges(a1, v8);
      objc_destroyWeak(&v7);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&from);
      v5 = 0;
    }
  }
  else
  {
    v4[2](v4);
    v5 = v16;
  }

}

@end
