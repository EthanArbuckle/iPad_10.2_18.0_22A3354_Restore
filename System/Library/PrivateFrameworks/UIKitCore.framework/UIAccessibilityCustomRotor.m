@implementation UIAccessibilityCustomRotor

- (UIAccessibilityCustomRotor)initWithName:(NSString *)name itemSearchBlock:(UIAccessibilityCustomRotorSearch)itemSearchBlock
{
  NSString *v6;
  UIAccessibilityCustomRotorSearch v7;
  UIAccessibilityCustomRotor *v8;
  void *v9;
  UIAccessibilityCustomRotor *v10;
  objc_super v12;

  v6 = name;
  v7 = itemSearchBlock;
  v12.receiver = self;
  v12.super_class = (Class)UIAccessibilityCustomRotor;
  v8 = -[UIAccessibilityCustomRotor init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityCustomRotor setUuid:](v8, "setUuid:", v9);

    -[UIAccessibilityCustomRotor setName:](v8, "setName:", v6);
    -[UIAccessibilityCustomRotor setItemSearchBlock:](v8, "setItemSearchBlock:", v7);
    v10 = v8;
  }

  return v8;
}

- (UIAccessibilityCustomRotor)initWithAttributedName:(NSAttributedString *)attributedName itemSearchBlock:(UIAccessibilityCustomRotorSearch)itemSearchBlock
{
  NSAttributedString *v6;
  UIAccessibilityCustomRotorSearch v7;
  UIAccessibilityCustomRotor *v8;
  void *v9;
  UIAccessibilityCustomRotor *v10;
  objc_super v12;

  v6 = attributedName;
  v7 = itemSearchBlock;
  v12.receiver = self;
  v12.super_class = (Class)UIAccessibilityCustomRotor;
  v8 = -[UIAccessibilityCustomRotor init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityCustomRotor setUuid:](v8, "setUuid:", v9);

    -[UIAccessibilityCustomRotor setAttributedName:](v8, "setAttributedName:", v6);
    -[UIAccessibilityCustomRotor setItemSearchBlock:](v8, "setItemSearchBlock:", v7);
    v10 = v8;
  }

  return v8;
}

- (UIAccessibilityCustomRotor)initWithSystemType:(UIAccessibilityCustomSystemRotorType)type itemSearchBlock:(UIAccessibilityCustomRotorSearch)itemSearchBlock
{
  UIAccessibilityCustomRotorSearch v5;
  UIAccessibilityCustomRotor *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIAccessibilityCustomRotor;
  v5 = itemSearchBlock;
  v6 = -[UIAccessibilityCustomRotor init](&v9, sel_init);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityCustomRotor setUuid:](v6, "setUuid:", v7);

  -[UIAccessibilityCustomRotor setSystemRotorType:](v6, "setSystemRotorType:", type);
  -[UIAccessibilityCustomRotor setItemSearchBlock:](v6, "setItemSearchBlock:", v5);

  return v6;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[UIAccessibilityCustomRotor attributedName](self, "attributedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setName:(NSString *)name
{
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  v4 = name;
  if (!v4)
  {
    v5 = objc_opt_class();
    _UIAccessibilityReportNilNameErroneouslyProvided(v5);
    v4 = &stru_1E16EDF20;
  }
  v7 = (__CFString *)v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v4);
  -[UIAccessibilityCustomRotor setAttributedName:](self, "setAttributedName:", v6);

}

- (void)setAttributedName:(NSAttributedString *)attributedName
{
  NSAttributedString *v4;
  uint64_t v5;
  NSAttributedString *v6;
  NSAttributedString *v7;
  NSAttributedString *v8;

  v4 = attributedName;
  if (!v4)
  {
    v5 = objc_opt_class();
    _UIAccessibilityReportNilNameErroneouslyProvided(v5);
    v4 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
  }
  v8 = v4;
  v6 = (NSAttributedString *)-[NSAttributedString copy](v4, "copy");
  v7 = self->_attributedName;
  self->_attributedName = v6;

}

- (NSUUID)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->uuid, a3);
}

- (id)targetElement
{
  return objc_loadWeakRetained(&self->targetElement);
}

- (void)setTargetElement:(id)a3
{
  objc_storeWeak(&self->targetElement, a3);
}

- (UIAccessibilityCustomSystemRotorType)systemRotorType
{
  return self->systemRotorType;
}

- (void)setSystemRotorType:(int64_t)a3
{
  self->systemRotorType = a3;
}

- (NSAttributedString)attributedName
{
  return self->_attributedName;
}

- (UIAccessibilityCustomRotorSearch)itemSearchBlock
{
  return self->_itemSearchBlock;
}

- (void)setItemSearchBlock:(UIAccessibilityCustomRotorSearch)itemSearchBlock
{
  objc_setProperty_nonatomic_copy(self, a2, itemSearchBlock, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemSearchBlock, 0);
  objc_storeStrong((id *)&self->_attributedName, 0);
  objc_destroyWeak(&self->targetElement);
  objc_storeStrong((id *)&self->uuid, 0);
}

@end
