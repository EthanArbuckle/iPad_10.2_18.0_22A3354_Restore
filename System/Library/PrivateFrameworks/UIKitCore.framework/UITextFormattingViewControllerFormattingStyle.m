@implementation UITextFormattingViewControllerFormattingStyle

- (UITextFormattingViewControllerFormattingStyle)initWithStyleKey:(id)a3 title:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  UITextFormattingViewControllerFormattingStyle *v11;
  uint64_t v12;
  NSString *styleKey;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  NSDictionary *attributes;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UITextFormattingViewControllerFormattingStyle;
  v11 = -[UITextFormattingViewControllerFormattingStyle init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    styleKey = v11->_styleKey;
    v11->_styleKey = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    attributes = v11->_attributes;
    v11->_attributes = (NSDictionary *)v16;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UITextFormattingViewControllerFormattingStyle styleKey](self, "styleKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[1];
  v4[1] = v6;

  -[UITextFormattingViewControllerFormattingStyle title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  -[UITextFormattingViewControllerFormattingStyle attributes](self, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[3];
  v4[3] = v12;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  UITextFormattingViewControllerFormattingStyle *v4;
  UITextFormattingViewControllerFormattingStyle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (UITextFormattingViewControllerFormattingStyle *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UITextFormattingViewControllerFormattingStyle styleKey](self, "styleKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextFormattingViewControllerFormattingStyle styleKey](v5, "styleKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[UITextFormattingViewControllerFormattingStyle title](self, "title");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextFormattingViewControllerFormattingStyle title](v5, "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[UITextFormattingViewControllerFormattingStyle styleKey](self, "styleKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[UITextFormattingViewControllerFormattingStyle title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[UITextFormattingViewControllerFormattingStyle styleKey](self, "styleKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_StyleKey"));

  -[UITextFormattingViewControllerFormattingStyle title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("_Title"));

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[UITextFormattingViewControllerFormattingStyle attributes](self, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v8, CFSTR("_AttributesData"));

  objc_msgSend(v7, "finishEncoding");
  objc_msgSend(v7, "encodedData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    v9 = (void *)objc_opt_new();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("_AttributesData"));

}

- (UITextFormattingViewControllerFormattingStyle)initWithCoder:(id)a3
{
  id v4;
  UITextFormattingViewControllerFormattingStyle *v5;
  void *v6;
  uint64_t v7;
  NSString *styleKey;
  void *v9;
  uint64_t v10;
  NSString *title;
  NSDictionary *attributes;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UITextFormattingViewControllerFormattingStyle init](self, "init");
  if (v5)
  {
    _UITextFormattingViewControllerFormattingStyleClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_StyleKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    styleKey = v5->_styleKey;
    v5->_styleKey = (NSString *)v7;

    _UITextFormattingViewControllerFormattingStyleClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_Title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    attributes = v5->_attributes;
    v13 = (void *)MEMORY[0x1E0C9AA70];
    v5->_attributes = (NSDictionary *)MEMORY[0x1E0C9AA70];

    _UITextFormattingViewControllerFormattingStyleClasses();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_AttributesData"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v15, &v25);
    v17 = v25;
    v18 = v17;
    if (v16)
    {
      objc_msgSend(v16, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_AttributesData"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19)
        v21 = (void *)v19;
      else
        v21 = v13;
      objc_storeStrong((id *)&v5->_attributes, v21);
      if (!v18)
        goto LABEL_13;
    }
    else
    {
      v20 = 0;
      if (!v17)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    v22 = initWithCoder____s_category_0;
    if (!initWithCoder____s_category_0)
    {
      v22 = __UILogCategoryGetNode("TextFormattingUI", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v22, (unint64_t *)&initWithCoder____s_category_0);
    }
    v23 = *(NSObject **)(v22 + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v18;
      _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "Failed to create unarchiver for formatting style attributes: %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
LABEL_14:

  return v5;
}

- (NSString)styleKey
{
  return self->_styleKey;
}

- (NSString)title
{
  return self->_title;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_styleKey, 0);
}

@end
