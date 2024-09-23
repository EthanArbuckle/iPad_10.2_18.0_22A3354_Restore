@implementation WFDialogListItem

- (WFDialogListItem)initWithTitle:(id)a3 subtitle:(id)a4 identifier:(id)a5 image:(id)a6 selected:(BOOL)a7 hideSubtitle:(BOOL)a8 encodedTypedValue:(id)a9 serializedPossibleState:(id)a10
{
  id v15;
  id v16;
  id v17;
  WFDialogListItem *v18;
  NSString *v19;
  void *identifier;
  uint64_t v21;
  NSString *v22;
  WFDialogListItem *v23;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v15 = a5;
  v27 = a6;
  v16 = a9;
  v17 = a10;
  v30.receiver = self;
  v30.super_class = (Class)WFDialogListItem;
  v18 = -[WFDialogListItem init](&v30, sel_init);
  if (v18)
  {
    if (v15)
    {
      v19 = (NSString *)v15;
      identifier = v18->_identifier;
      v18->_identifier = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      identifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(identifier, "UUIDString");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v18->_identifier;
      v18->_identifier = (NSString *)v21;

    }
    objc_storeStrong((id *)&v18->_title, a3);
    objc_storeStrong((id *)&v18->_subtitle, a4);
    objc_storeStrong((id *)&v18->_image, a6);
    v18->_selected = a7;
    v18->_hideSubtitle = a8;
    objc_storeStrong((id *)&v18->_encodedTypedValue, a9);
    objc_storeStrong((id *)&v18->_serializedPossibleState, a10);
    v23 = v18;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFDialogListItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFDialogListItem identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v7 && v8)
        v10 = objc_msgSend(v7, "isEqualToString:", v8);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[WFDialogListItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[WFDialogListItem title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("title"));

  -[WFDialogListItem subtitle](self, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("subtitle"));

  -[WFDialogListItem image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("image"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogListItem selected](self, "selected"), CFSTR("selected"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogListItem hideSubtitle](self, "hideSubtitle"), CFSTR("hideSubtitle"));
  -[WFDialogListItem encodedTypedValue](self, "encodedTypedValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("encodedTypedValue"));

  -[WFDialogListItem serializedPossibleState](self, "serializedPossibleState");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("serializedPossibleState"));

}

- (WFDialogListItem)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  WFDialogListItem *v15;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  void *v20;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("selected"));
  v17 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("hideSubtitle"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encodedTypedValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v13, CFSTR("serializedPossibleState"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[WFDialogListItem initWithTitle:subtitle:identifier:image:selected:hideSubtitle:encodedTypedValue:serializedPossibleState:](self, "initWithTitle:subtitle:identifier:image:selected:hideSubtitle:encodedTypedValue:serializedPossibleState:", v19, v4, v20, v5, v18, v17, v6, v14);
  return v15;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)selected
{
  return self->_selected;
}

- (WFPropertyListObject)serializedPossibleState
{
  return self->_serializedPossibleState;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)showingStaticContent
{
  return self->_showingStaticContent;
}

- (BOOL)hasImage
{
  return self->_hasImage;
}

- (BOOL)hasSubtitle
{
  return self->_hasSubtitle;
}

- (BOOL)hasAltText
{
  return self->_hasAltText;
}

- (WFEncodedTypedValue)encodedTypedValue
{
  return self->_encodedTypedValue;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (WFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)hideSubtitle
{
  return self->_hideSubtitle;
}

- (void)setHideSubtitle:(BOOL)a3
{
  self->_hideSubtitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_encodedTypedValue, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_serializedPossibleState, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
