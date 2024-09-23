@implementation NFAssertPKWalletForegroundPresentment

- (BOOL)isEntitled:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "NF_whitelistChecker"));
  v4 = objc_msgSend(v3, "internalAccess");

  return v4;
}

- (void)onAssertWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  _QWORD v17[4];

  v4 = (void (**)(id, _QWORD))a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 120);
  else
    v7 = 0;
  v8 = v7;

  if (objc_msgSend(v8, "assert:isFirst:", 0, 0))
  {
    v4[2](v4, 0);
  }
  else
  {
    v9 = objc_alloc((Class)NSError);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v16[0] = NSLocalizedDescriptionKey;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v17[0] = v11;
    v17[1] = &off_1002FE838;
    v16[1] = CFSTR("Line");
    v16[2] = CFSTR("Method");
    v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v17[2] = v12;
    v16[3] = NSDebugDescriptionErrorKey;
    v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 49);
    v17[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 4));
    v15 = objc_msgSend(v9, "initWithDomain:code:userInfo:", v10, 12, v14);
    ((void (**)(id, id))v4)[2](v4, v15);

  }
}

- (void)onDeassertWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  _QWORD v18[4];

  v4 = (void (**)(id, _QWORD))a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 120);
  else
    v7 = 0;
  v8 = v7;

  v9 = objc_msgSend(v8, "deassert:isLast:", 0, 0);
  if (v4)
  {
    if (v9)
    {
      v4[2](v4, 0);
    }
    else
    {
      v10 = objc_alloc((Class)NSError);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
      v17[0] = NSLocalizedDescriptionKey;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
      v18[0] = v12;
      v18[1] = &off_1002FE850;
      v17[1] = CFSTR("Line");
      v17[2] = CFSTR("Method");
      v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
      v18[2] = v13;
      v17[3] = NSDebugDescriptionErrorKey;
      v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 63);
      v18[3] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
      v16 = objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 12, v15);
      ((void (**)(id, id))v4)[2](v4, v16);

    }
  }

}

@end
