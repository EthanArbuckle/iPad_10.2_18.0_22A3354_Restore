@implementation SearchUICommandCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = a4;
  objc_msgSend(v4, "command");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_searchui_prefixMatchExtensionStringWithCompletion:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "command");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_searchui_overriddenExtensionString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "length") != 0;

  }
  return v7;
}

- (id)command
{
  void *v2;
  void *v3;

  -[SearchUICompletion cardSection](self, "cardSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "command");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)prefixMatchExtensionString
{
  void *v3;
  void *v4;

  -[SearchUICommandCompletion command](self, "command");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_searchui_prefixMatchExtensionStringWithCompletion:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)image
{
  void *v2;
  void *v3;

  -[SearchUICommandCompletion command](self, "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_searchui_completionImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateFields
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[SearchUICommandCompletion command](self, "command");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_searchui_overriddenBridgeStringWithCompletion:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SearchUICompletion setBridgeString:](self, "setBridgeString:", v4);
    -[SearchUICommandCompletion command](self, "command");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_searchui_overriddenExtensionString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUICompletion setExtensionString:](self, "setExtensionString:", v6);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUICommandCompletion;
    -[SearchUICompletion updateFields](&v7, sel_updateFields);
  }

}

- (BOOL)completionResultIsPotentiallyPunchout
{
  void *v3;
  void *v4;
  char v5;

  +[SearchUICompletion localizedShowMoreString](SearchUICompletion, "localizedShowMoreString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandCompletion prefixMatchExtensionString](self, "prefixMatchExtensionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4) ^ 1;

  return v5;
}

@end
