@implementation PXSearchToken

- (PXSearchToken)initWithText:(id)a3 image:(id)a4 representedObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXSearchToken *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXSearchToken;
  v11 = -[PXSearchToken init](&v15, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3C50], "tokenWithIcon:text:", v9, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchToken setSearchObject:](v11, "setSearchObject:", v12);

    -[PXSearchToken searchObject](v11, "searchObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRepresentedObject:", v10);

    -[PXSearchToken setRepresentedObject:](v11, "setRepresentedObject:", v10);
    -[PXSearchToken setText:](v11, "setText:", v8);
    -[PXSearchToken setImage:](v11, "setImage:", v9);
  }

  return v11;
}

- (PXSearchToken)initWithAttributedText:(id)a3 searchObject:(id)a4 representedObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXSearchToken *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXSearchToken;
  v11 = -[PXSearchToken init](&v17, sel_init);
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0DC3C50];
    objc_msgSend(v8, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tokenWithIcon:text:", 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchToken setSearchObject:](v11, "setSearchObject:", v14);

    -[PXSearchToken searchObject](v11, "searchObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRepresentedObject:", v10);

    -[PXSearchToken setAttributedText:](v11, "setAttributedText:", v8);
    -[PXSearchToken setSearchObject:](v11, "setSearchObject:", v9);
    -[PXSearchToken setRepresentedObject:](v11, "setRepresentedObject:", v10);
  }

  return v11;
}

- (PXSearchToken)initWithText:(id)a3 searchObject:(id)a4 representedObject:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXSearchToken *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXSearchToken;
  v11 = -[PXSearchToken init](&v15, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3C50], "tokenWithIcon:text:", 0, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSearchToken setSearchObject:](v11, "setSearchObject:", v12);

    -[PXSearchToken searchObject](v11, "searchObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRepresentedObject:", v10);

    -[PXSearchToken setText:](v11, "setText:", v8);
    -[PXSearchToken setSearchObject:](v11, "setSearchObject:", v9);
    -[PXSearchToken setRepresentedObject:](v11, "setRepresentedObject:", v10);
  }

  return v11;
}

- (id)textValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  -[PXSearchToken attributedText](self, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[PXSearchToken attributedText](self, "attributedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PXSearchToken text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!objc_msgSend(v6, "length"))
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "PXSearchToken is invalid - no text value has been set for this token", v9, 2u);
    }

  }
  return v6;
}

- (UISearchToken)searchObject
{
  return self->_searchObject;
}

- (void)setSearchObject:(id)a3
{
  objc_storeStrong((id *)&self->_searchObject, a3);
}

- (PXSearchTokenRepresentedObject)representedObject
{
  return self->_representedObject;
}

- (void)setRepresentedObject:(id)a3
{
  objc_storeStrong((id *)&self->_representedObject, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_representedObject, 0);
  objc_storeStrong((id *)&self->_searchObject, 0);
}

@end
