@implementation NFAssertSuppressPresentmentIntentToDefaultApp

- (BOOL)isEntitled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "NF_userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("serviceType")));

  if (!v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "NF_whitelistChecker"));
    goto LABEL_8;
  }
  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  v7 = objc_msgSend(v5, "unsignedIntegerValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "NF_whitelistChecker"));
  v9 = v8;
  if (v6 != (id)2)
  {
    if (v7 == (id)1)
    {
      v10 = objc_msgSend(v8, "internalAccess");
      goto LABEL_7;
    }
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v10 = objc_msgSend(v8, "nfcCardSessionAccess");
LABEL_7:
  v11 = v10;
LABEL_9:

  return v11;
}

- (void)onAssertWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD);
  uint64_t v6;
  uint64_t v7;
  BOOL fieldDetectOnly;
  uint64_t v9;
  void *v10;
  id v11;
  unsigned int v12;
  char v13;
  id v14;
  void *v15;
  _BYTE *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  char v24;
  _QWORD v25[4];
  _QWORD v26[4];

  v5 = (void (**)(id, _QWORD))a3;
  v6 = objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v7 = v6;
  v24 = 0;
  if (self)
  {
    fieldDetectOnly = self->_fieldDetectOnly;
    if (self->_fieldDetectOnly)
      v9 = 2;
    else
      v9 = 1;
    if (v6)
      goto LABEL_6;
  }
  else
  {
    fieldDetectOnly = 0;
    v9 = 1;
    if (v6)
    {
LABEL_6:
      v10 = *(void **)(v6 + 120);
      goto LABEL_7;
    }
  }
  v10 = 0;
LABEL_7:
  v11 = v10;
  v12 = objc_msgSend(v11, "assert:isFirst:", v9, &v24);

  if (v12)
  {
    if (v24)
      v13 = fieldDetectOnly;
    else
      v13 = 1;
    if ((v13 & 1) == 0)
    {
      if (v7)
      {
        v14 = *(id *)(v7 + 408);
        objc_msgSend(v14, "suspend");

        v15 = *(void **)(v7 + 24);
      }
      else
      {
        objc_msgSend(0, "suspend");
        v15 = 0;
      }
      v16 = v15;
      sub_100040428(v16, 1u, 0);

    }
    if (v5)
      v5[2](v5, 0);
  }
  else if (v5)
  {
    v17 = objc_alloc((Class)NSError);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v25[0] = NSLocalizedDescriptionKey;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v26[0] = v19;
    v26[1] = &off_100300050;
    v25[1] = CFSTR("Line");
    v25[2] = CFSTR("Method");
    v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v26[2] = v20;
    v25[3] = NSDebugDescriptionErrorKey;
    v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 87);
    v26[3] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 4));
    v23 = objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 12, v22);
    ((void (**)(id, id))v5)[2](v5, v23);

  }
}

- (void)onDeassertWithCompletion:(id)a3
{
  void (**v5)(id, _QWORD);
  uint64_t v6;
  uint64_t v7;
  BOOL fieldDetectOnly;
  uint64_t v9;
  void *v10;
  id v11;
  unsigned int v12;
  char v13;
  id v14;
  void *v15;
  _BYTE *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  char v24;
  _QWORD v25[4];
  _QWORD v26[4];

  v5 = (void (**)(id, _QWORD))a3;
  v6 = objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
  v7 = v6;
  v24 = 0;
  if (self)
  {
    fieldDetectOnly = self->_fieldDetectOnly;
    if (self->_fieldDetectOnly)
      v9 = 2;
    else
      v9 = 1;
    if (v6)
      goto LABEL_6;
  }
  else
  {
    fieldDetectOnly = 0;
    v9 = 1;
    if (v6)
    {
LABEL_6:
      v10 = *(void **)(v6 + 120);
      goto LABEL_7;
    }
  }
  v10 = 0;
LABEL_7:
  v11 = v10;
  v12 = objc_msgSend(v11, "deassert:isLast:", v9, &v24);

  if (v12)
  {
    if (v24)
      v13 = fieldDetectOnly;
    else
      v13 = 1;
    if ((v13 & 1) == 0)
    {
      if (v7)
      {
        v14 = *(id *)(v7 + 408);
        objc_msgSend(v14, "resume");

        v15 = *(void **)(v7 + 24);
      }
      else
      {
        objc_msgSend(0, "resume");
        v15 = 0;
      }
      v16 = v15;
      sub_100040428(v16, 0, 0);

    }
    if (v5)
      v5[2](v5, 0);
  }
  else if (v5)
  {
    v17 = objc_alloc((Class)NSError);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
    v25[0] = NSLocalizedDescriptionKey;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Invalid State"));
    v26[0] = v19;
    v26[1] = &off_100300068;
    v25[1] = CFSTR("Line");
    v25[2] = CFSTR("Method");
    v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v26[2] = v20;
    v25[3] = NSDebugDescriptionErrorKey;
    v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 118);
    v26[3] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 4));
    v23 = objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 12, v22);
    ((void (**)(id, id))v5)[2](v5, v23);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

@end
