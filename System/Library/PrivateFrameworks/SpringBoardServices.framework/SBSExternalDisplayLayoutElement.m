@implementation SBSExternalDisplayLayoutElement

+ (id)elementWithIdentifier:(id)a3 presenting:(BOOL)a4
{
  id v6;
  SBSExternalDisplayLayoutElement *v7;
  void *v8;
  void *v9;
  void *v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSExternalDisplayLayout.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v7 = -[SBSExternalDisplayLayoutElement initWithIdentifier:]([SBSExternalDisplayLayoutElement alloc], "initWithIdentifier:", v6);
  -[SBSExternalDisplayLayoutElement otherSettings](v7, "otherSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", CFSTR("SBExternal"), 0);

  -[SBSExternalDisplayLayoutElement otherSettings](v7, "otherSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFlag:forSetting:", BSSettingFlagForBool(), 1);

  return v7;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSExternalDisplayLayoutElement;
  -[SBSExternalDisplayLayoutElement succinctDescriptionBuilder](&v6, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBSExternalDisplayLayoutElement sb_isPresenting](self, "sb_isPresenting"), CFSTR("presenting"));
  return v3;
}

- (BOOL)sb_isExternalDisplayElement
{
  void *v2;
  void *v3;
  char v4;

  -[SBSExternalDisplayLayoutElement otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("SBExternal"));

  return v4;
}

- (BOOL)sb_isPresenting
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[SBSExternalDisplayLayoutElement sb_isExternalDisplayElement](self, "sb_isExternalDisplayElement");
  if (v3)
  {
    -[SBSExternalDisplayLayoutElement otherSettings](self, "otherSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForSetting:", 1);

    LOBYTE(v3) = v5;
  }
  return v3;
}

@end
