@implementation SDAirDropHandlerFailed

- (void)activate
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_msgSend(v3, "setCancelAction:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_msgSend(v4, "setSelectedAction:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_msgSend(v5, "setPossibleActions:", 0);

  v6.receiver = self;
  v6.super_class = (Class)SDAirDropHandlerFailed;
  -[SDAirDropHandler activate](&v6, "activate");
}

- (BOOL)canHandleTransfer
{
  return 0;
}

- (NSString)errorString
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_msgSend(v3, "transferState");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", 0));
  v6 = SFLocalizedStringForKey(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8));

  return (NSString *)v9;
}

- (NSString)errorDetailedString
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v4 = objc_msgSend(v3, "transferState");

  if (v4 == (id)9
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "error")),
        v7 = objc_msgSend(v6, "code"),
        v6,
        v5,
        v7 == (id)-2))
  {
    v9 = SFLocalizedStringForKey(CFSTR("Not Enough Space"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (id)suitableContentsTitle
{
  return -[SDAirDropHandlerFailed errorString](self, "errorString");
}

- (id)suitableContentsDescription
{
  return -[SDAirDropHandlerFailed errorDetailedString](self, "errorDetailedString");
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

@end
