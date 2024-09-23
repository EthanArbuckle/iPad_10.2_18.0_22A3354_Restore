@implementation NSURL(WBSUINSURLExtras)

- (uint64_t)_safari_rangeOfUserInfoInUserVisibleString
{
  CFRange v2;
  CFIndex v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v2 = CFURLGetByteRangeForComponent(a1, kCFURLComponentUserInfo, 0);
  if (v2.location == -1)
    return 0x7FFFFFFFFFFFFFFFLL;
  v3 = CFURLGetBytes(a1, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v3);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if ((unint64_t)CFURLGetBytes(a1, (UInt8 *)objc_msgSend(v4, "mutableBytes"), v3) >= v2.location + v2.length
    && (v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", objc_msgSend(objc_retainAutorelease(v4), "bytes") + v2.location, v2.length, 134217984)) != 0)
  {
    v6 = v5;
    objc_msgSend(v5, "stringByRemovingPercentEncoding");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;

      v6 = v9;
    }
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("@"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[__CFURL safari_userVisibleString](a1, "safari_userVisibleString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "rangeOfString:", v10);

  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (id)safari_attributedStringWithSimplificationOptions:()WBSUINSURLExtras attributes:attributesForDeemphasizedText:attributesForHTTPSProtocol:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a4;
  objc_msgSend(a1, "safari_userVisibleString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(MEMORY[0x1E0C99E98], "safari_hostAndPortRangeFromUserTypedString:", v13);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v13, v12);

  }
  else
  {
    v17 = v14;
    v18 = v15;
    v19 = objc_msgSend(a1, "_safari_rangeOfUserInfoInUserVisibleString");
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      v21 = 0;
    else
      v21 = v20;
    v22 = v21 + v18;
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      v23 = v17;
    else
      v23 = v19;
    v30 = 0;
    objc_msgSend(v13, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", a3, 0, &v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v30;
    v26 = v23 - v30;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v24, v12);

    v31 = *MEMORY[0x1E0CEA198];
    v32[0] = &unk_1E547C360;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttributes:range:", v27, v26, v22);

    v28 = objc_msgSend(v24, "length");
    if (v10 && v28 != v26 + v22)
      objc_msgSend(v16, "addAttributes:range:", v10, v26 + v22, v28 - (v26 + v22));
    if (v11 && v23 != v25)
      objc_msgSend(v16, "addAttributes:range:", v11, 0, v26);

  }
  return v16;
}

@end
