@implementation PULibraryTabInfo

- (int)contentMode
{
  return self->_contentMode;
}

- (NSString)labelKey
{
  return self->_labelKey;
}

- (NSString)iconName
{
  return self->_iconName;
}

+ (id)tabInfoWithLabelKey:(id)a3 iconName:(id)a4 contentMode:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabelKey:iconName:contentMode:", v9, v8, v5);

  return v10;
}

- (PULibraryTabInfo)initWithLabelKey:(id)a3 iconName:(id)a4 contentMode:(int)a5
{
  id v8;
  id v9;
  PULibraryTabInfo *v10;
  uint64_t v11;
  NSString *labelKey;
  uint64_t v13;
  NSString *iconName;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PULibraryTabInfo;
  v10 = -[PULibraryTabInfo init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    labelKey = v10->_labelKey;
    v10->_labelKey = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    iconName = v10->_iconName;
    v10->_iconName = (NSString *)v13;

    v10->_contentMode = a5;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_labelKey, 0);
}

@end
