@implementation WFPhotoItemCollectionParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFPhotoItemCollectionParameter)initWithDefinition:(id)a3
{
  id v4;
  WFPhotoItemCollectionParameter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *pickerMode;
  WFPhotoItemCollectionParameter *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFPhotoItemCollectionParameter;
  v5 = -[WFParameter initWithDefinition:](&v16, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("PhotoItemCollectionPickerSelectionLimit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_selectionLimit = objc_msgSend(v8, "integerValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("PhotoItemCollectionPickerMode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    WFEnforceClass(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    pickerMode = v5->_pickerMode;
    v5->_pickerMode = (NSString *)v12;

    v14 = v5;
  }

  return v5;
}

- (NSString)pickerMode
{
  return self->_pickerMode;
}

- (int64_t)selectionLimit
{
  return self->_selectionLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerMode, 0);
}

@end
