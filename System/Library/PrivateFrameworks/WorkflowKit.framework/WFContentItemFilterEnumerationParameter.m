@implementation WFContentItemFilterEnumerationParameter

- (id)localizedLabelForPossibleState:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Library"));

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("All %@"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class localizedPluralFilterDescription](-[WFContentItemFilterEnumerationParameter contentItemClass](self, "contentItemClass"), "localizedPluralFilterDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFContentItemFilterEnumerationParameter;
    -[WFEnumerationParameter localizedLabelForPossibleState:](&v12, sel_localizedLabelForPossibleState_, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (Class)contentItemClass
{
  return self->_contentItemClass;
}

- (void)setContentItemClass:(Class)a3
{
  objc_storeStrong((id *)&self->_contentItemClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItemClass, 0);
}

@end
