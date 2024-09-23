@implementation _UIDocumentPickerAuxiliaryOption

- (_UIDocumentPickerAuxiliaryOption)init
{
  _UIDocumentPickerAuxiliaryOption *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDocumentPickerAuxiliaryOption;
  v2 = -[_UIDocumentPickerAuxiliaryOption init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerAuxiliaryOption setIdentifier:](v2, "setIdentifier:", v4);

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIDocumentPickerAuxiliaryOption)initWithCoder:(id)a3
{
  id v4;
  _UIDocumentPickerAuxiliaryOption *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIDocumentPickerAuxiliaryOption;
  v5 = -[_UIDocumentPickerAuxiliaryOption init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIImageKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerAuxiliaryOption setImage:](v5, "setImage:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UITitleKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerAuxiliaryOption setTitle:](v5, "setTitle:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIIdentifierKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerAuxiliaryOption setIdentifier:](v5, "setIdentifier:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIOrderKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerAuxiliaryOption setOrder:](v5, "setOrder:", objc_msgSend(v9, "integerValue"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  UIImage *image;
  id v5;
  id v6;

  image = self->_image;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", image, CFSTR("UIImageKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("UITitleKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("UIIdentifierKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_order);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("UIOrderKey"));

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

- (BOOL)isNewlyAdded
{
  return self->_newlyAdded;
}

- (void)setNewlyAdded:(BOOL)a3
{
  self->_newlyAdded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
