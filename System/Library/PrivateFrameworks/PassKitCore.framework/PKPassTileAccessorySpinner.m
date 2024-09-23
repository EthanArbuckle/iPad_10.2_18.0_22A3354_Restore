@implementation PKPassTileAccessorySpinner

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4;
  _BOOL4 v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassTileAccessorySpinner;
  v5 = -[PKPassTileAccessory _setUpWithDictionary:](&v7, sel__setUpWithDictionary_, v4);
  if (v5)
    self->_spinnerEnabled = objc_msgSend(v4, "PKBoolForKey:", CFSTR("spinnerEnabled"));

  return v5;
}

- (id)createResolvedAccessoryWithBundle:(id)a3 privateBundle:(id)a4
{
  id result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassTileAccessorySpinner;
  result = -[PKPassTileAccessory createResolvedAccessoryWithBundle:privateBundle:](&v6, sel_createResolvedAccessoryWithBundle_privateBundle_, a3, a4);
  *((_BYTE *)result + 24) = self->_spinnerEnabled;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileAccessorySpinner)initWithCoder:(id)a3
{
  id v4;
  PKPassTileAccessorySpinner *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassTileAccessorySpinner;
  v5 = -[PKPassTileAccessory initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_spinnerEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("spinnerEnabled"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassTileAccessorySpinner;
  v4 = a3;
  -[PKPassTileAccessory encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_spinnerEnabled, CFSTR("spinnerEnabled"), v5.receiver, v5.super_class);

}

- (unint64_t)hash
{
  id v3;
  BOOL spinnerEnabled;
  objc_super v6;
  id v7;
  BOOL v8;

  v6.receiver = self;
  v6.super_class = (Class)PKPassTileAccessorySpinner;
  v3 = -[PKPassTileAccessory hash](&v6, sel_hash);
  spinnerEnabled = self->_spinnerEnabled;
  v7 = v3;
  v8 = spinnerEnabled;
  return SipHash();
}

- (BOOL)_isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;
  objc_super v7;

  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassTileAccessorySpinner;
  if (-[PKPassTileAccessory _isEqual:](&v7, sel__isEqual_, v4))
    v5 = v4[24] == self->_spinnerEnabled;
  else
    v5 = 0;

  return v5;
}

- (BOOL)isSpinnerEnabled
{
  return self->_spinnerEnabled;
}

- (void)setSpinnerEnabled:(BOOL)a3
{
  self->_spinnerEnabled = a3;
}

@end
