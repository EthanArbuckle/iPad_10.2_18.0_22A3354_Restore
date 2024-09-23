@implementation _UIColorAttributeTraitStorage

- (_UIColorAttributeTraitStorage)initWithObject:(id)a3 keyPath:(id)a4 color:(id)a5
{
  id v9;
  _UIColorAttributeTraitStorage *v10;
  _UIColorAttributeTraitStorage *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_UIColorAttributeTraitStorage;
  v10 = -[_UITraitStorage initWithObject:keyPath:](&v13, sel_initWithObject_keyPath_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_namedColor, a5);

  return v11;
}

- (void)applyRecordsMatchingTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_UITraitStorage object](self, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UICoreUICatalogColorWrapper _uikit_valueForTraitCollection:](self->_namedColor, "_uikit_valueForTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UITraitStorage keyPath](self, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_uikit_applyValueFromTraitStorage:forKeyPath:", v5, v6);

}

- (_UIColorAttributeTraitStorage)initWithCoder:(id)a3
{
  id v4;
  _UIColorAttributeTraitStorage *v5;
  uint64_t v6;
  _UICoreUICatalogColorWrapper *namedColor;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIColorAttributeTraitStorage;
  v5 = -[_UITraitStorage initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UINamedColor"));
    v6 = objc_claimAutoreleasedReturnValue();
    namedColor = v5->_namedColor;
    v5->_namedColor = (_UICoreUICatalogColorWrapper *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIColorAttributeTraitStorage;
  v4 = a3;
  -[_UITraitStorage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_namedColor, CFSTR("UINamedColor"), v5.receiver, v5.super_class);

}

- (id)_propertyDescriptionString
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_UIColorAttributeTraitStorage;
  -[_UITraitStorage _propertyDescriptionString](&v7, sel__propertyDescriptionString);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, namedColor=%@"), v4, self->_namedColor);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedColor, 0);
}

@end
