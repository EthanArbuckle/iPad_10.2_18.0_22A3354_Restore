@implementation PKPassTileAccessoryButton

+ (id)createWithTitle:(id)a3 spinnerEnabled:(BOOL)a4
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = +[PKPassTileAccessory _createForType:resolved:](PKPassTileAccessory, "_createForType:resolved:", 0, 1);
  v7 = objc_msgSend(v5, "copy");

  v8 = (void *)v6[4];
  v6[4] = v7;

  *((_BYTE *)v6 + 24) = a4;
  return v6;
}

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassTileAccessoryButton;
  if (-[PKPassTileAccessory _setUpWithDictionary:](&v9, sel__setUpWithDictionary_, v4)
    && (objc_msgSend(v4, "PKStringForKey:", CFSTR("title")),
        v5 = (NSString *)objc_claimAutoreleasedReturnValue(),
        title = self->_title,
        self->_title = v5,
        title,
        self->_title))
  {
    self->_spinnerEnabled = objc_msgSend(v4, "PKBoolForKey:", CFSTR("spinnerEnabled"));
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)createResolvedAccessoryWithBundle:(id)a3 privateBundle:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPassTileAccessoryButton;
  v6 = a4;
  v7 = a3;
  v8 = -[PKPassTileAccessory createResolvedAccessoryWithBundle:privateBundle:](&v12, sel_createResolvedAccessoryWithBundle_privateBundle_, v7, v6);
  PKLocalizedPassStringForPassBundle(self->_title, v7, v6);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v8[4];
  v8[4] = v9;

  *((_BYTE *)v8 + 24) = self->_spinnerEnabled;
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileAccessoryButton)initWithCoder:(id)a3
{
  id v4;
  PKPassTileAccessoryButton *v5;
  uint64_t v6;
  NSString *title;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassTileAccessoryButton;
  v5 = -[PKPassTileAccessory initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_spinnerEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("spinnerEnabled"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassTileAccessoryButton;
  v4 = a3;
  -[PKPassTileAccessory encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("title"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_spinnerEnabled, CFSTR("spinnerEnabled"));

}

- (unint64_t)hash
{
  objc_super v4;
  id v5;
  NSUInteger v6;
  BOOL spinnerEnabled;

  v4.receiver = self;
  v4.super_class = (Class)PKPassTileAccessoryButton;
  v5 = -[PKPassTileAccessory hash](&v4, sel_hash);
  v6 = -[NSString hash](self->_title, "hash");
  spinnerEnabled = self->_spinnerEnabled;
  return SipHash();
}

- (BOOL)_isEqual:(id)a3
{
  id v4;
  id *v5;
  NSString *title;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  BOOL v10;
  BOOL v11;
  _BOOL4 v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassTileAccessoryButton;
  if (-[PKPassTileAccessory _isEqual:](&v14, sel__isEqual_, v4))
  {
    v5 = (id *)v4;
    title = self->_title;
    v7 = (NSString *)v5[4];
    v8 = title;
    if (v7 != v8)
    {
      v9 = v8;
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
      {

      }
      else
      {
        v12 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

        if (v12)
          goto LABEL_12;
      }
      v11 = 0;
      goto LABEL_14;
    }

LABEL_12:
    v11 = *((unsigned __int8 *)v5 + 24) == self->_spinnerEnabled;
LABEL_14:

    goto LABEL_15;
  }
  v11 = 0;
LABEL_15:

  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isSpinnerEnabled
{
  return self->_spinnerEnabled;
}

- (void)setSpinnerEnabled:(BOOL)a3
{
  self->_spinnerEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
