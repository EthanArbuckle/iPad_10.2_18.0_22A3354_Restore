@implementation WFFontDescriptor

- (WFFontDescriptor)initWithFontAttributes:(id)a3
{
  void (__cdecl *v4)();
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  WFFontDescriptor *v17;

  v4 = (void (__cdecl *)())getUIFontDescriptorFamilyAttribute;
  v5 = a3;
  v4();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  getUIFontDescriptorNameAttribute();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  getUIFontDescriptorFaceAttribute();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  getUIFontDescriptorVisibleNameAttribute();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = v14;
  if (v7)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, CFSTR("WFFontDescriptorFamily"));
  if (v9)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("WFFontDescriptorName"));
  if (v11)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("WFFontDescriptorFace"));
  if (v13)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, CFSTR("WFFontDescriptorVisibleName"));
  v16 = (void *)objc_msgSend(v15, "copy");
  v17 = -[WFFontDescriptor initWithPrivateRepresentation:](self, "initWithPrivateRepresentation:", v16);

  return v17;
}

- (WFFontDescriptor)initWithPrivateRepresentation:(id)a3
{
  id v4;
  WFFontDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSDictionary *attributes;
  WFFontDescriptor *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFFontDescriptor;
  v5 = -[WFFontDescriptor init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("WFFontDescriptorFamily"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("WFFontDescriptorName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("WFFontDescriptorFace"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("WFFontDescriptorVisibleName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = v10;
    if (v6)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, CFSTR("WFFontDescriptorFamily"));
    if (v7)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, CFSTR("WFFontDescriptorName"));
    if (v8)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("WFFontDescriptorFace"));
    if (v9)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("WFFontDescriptorVisibleName"));
    v12 = objc_msgSend(v11, "copy");
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v12;

    v14 = v5;
  }

  return v5;
}

- (id)serializedRepresentation
{
  return (id)-[NSDictionary copy](self->_attributes, "copy");
}

- (id)displayName
{
  const __CTFont *v2;
  const __CFString *v3;

  -[WFFontDescriptor fontWithSize:](self, "fontWithSize:", 0.0);
  v2 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  v3 = (id)CTFontCopyDisplayName(v2);

  return (id)v3;
}

- (id)family
{
  void *v2;
  void *v3;

  -[WFFontDescriptor attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("WFFontDescriptorFamily"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)name
{
  void *v2;
  void *v3;

  -[WFFontDescriptor attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("WFFontDescriptorName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)face
{
  void *v2;
  void *v3;

  -[WFFontDescriptor attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("WFFontDescriptorFace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)visibleName
{
  void *v2;
  void *v3;

  -[WFFontDescriptor attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("WFFontDescriptorVisibleName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (WFFontDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WFFontDescriptor *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[WFFontDescriptor initWithPrivateRepresentation:](self, "initWithPrivateRepresentation:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFFontDescriptor attributes](self, "attributes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("attributes"));

}

- (id)fontWithSize:(double)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[WFFontDescriptor family](self, "family");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFFontDescriptor family](self, "family");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    getUIFontDescriptorFamilyAttribute();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v8);

  }
  -[WFFontDescriptor name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WFFontDescriptor name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    getUIFontDescriptorNameAttribute();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v11);

  }
  -[WFFontDescriptor face](self, "face");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[WFFontDescriptor face](self, "face");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    getUIFontDescriptorFaceAttribute();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v14);

  }
  -[WFFontDescriptor visibleName](self, "visibleName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[WFFontDescriptor visibleName](self, "visibleName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    getUIFontDescriptorVisibleNameAttribute();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v17);

  }
  v18 = (void *)objc_msgSend(objc_alloc(getUIFontDescriptorClass()), "initWithFontAttributes:", v5);
  -[objc_class fontWithDescriptor:size:](getUIFontClass(), "fontWithDescriptor:size:", v18, a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

+ (id)descriptorWithSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPrivateRepresentation:", v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
