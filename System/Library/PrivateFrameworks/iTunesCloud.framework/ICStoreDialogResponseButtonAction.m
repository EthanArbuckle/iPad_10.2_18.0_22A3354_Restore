@implementation ICStoreDialogResponseButtonAction

- (ICStoreDialogResponseButtonAction)initWithResponseButtonActionDictionary:(id)a3
{
  id v4;
  ICStoreDialogResponseButtonAction *v5;
  uint64_t v6;
  NSDictionary *actionDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStoreDialogResponseButtonAction;
  v5 = -[ICStoreDialogResponseButtonAction init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    actionDictionary = v5->_actionDictionary;
    v5->_actionDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_actionDictionary, "objectForKey:", CFSTR("kind"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Buy")) & 1) != 0)
    {
      v3 = 1;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Goto")) & 1) != 0)
    {
      v3 = 2;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("GotoFinance")) & 1) != 0)
    {
      v3 = 3;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("OpenURL")) & 1) != 0)
    {
      v3 = 4;
    }
    else if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("GoBack")))
    {
      v3 = 5;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("QRCode")) & 1) != 0)
    {
      v3 = 6;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("redeem-code")) & 1) != 0)
    {
      v3 = 7;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Review")) & 1) != 0)
    {
      v3 = 8;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("RetryRestoreAll")) & 1) != 0)
    {
      v3 = 9;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("ServiceAction")) & 1) != 0)
    {
      v3 = 10;
    }
    else if (objc_msgSend(v2, "isEqualToString:", CFSTR("FamilyPermissionAction")))
    {
      v3 = 11;
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSString)buyParams
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_actionDictionary, "objectForKey:", CFSTR("buyParams"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)itemName
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_actionDictionary, "objectForKey:", CFSTR("itemName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)subtarget
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_actionDictionary, "objectForKey:", CFSTR("subtarget"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)URLString
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_actionDictionary, "objectForKey:", CFSTR("url"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)kind
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_actionDictionary, "objectForKey:", CFSTR("kind"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSDictionary)actionDictionary
{
  return self->_actionDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionDictionary, 0);
}

@end
