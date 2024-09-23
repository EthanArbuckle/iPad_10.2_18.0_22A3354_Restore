@implementation PKPassTileMetadataVerticalFlowGroup

- (BOOL)_setUpWithDictionary:(id)a3 privateDictionary:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  int64_t v9;
  NSObject *v10;
  int64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPassTileMetadataVerticalFlowGroup;
  if (-[PKPassTileMetadata _setUpWithDictionary:privateDictionary:](&v18, sel__setUpWithDictionary_privateDictionary_, v6, a4))
  {
    objc_msgSend(v6, "PKNumberForKey:", CFSTR("rows"));
    v7 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject pk_isPositiveNumber](v7, "pk_isPositiveNumber") & 1) == 0)
    {
      PKLogFacilityTypeGetObject(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[PKPassTileMetadata identifier](self, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v13;
        v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPassTileMetadataVerticalFlowGroup: \"%@\" invalid - invalid value for rows: %@.", buf, 0x16u);

      }
      v12 = 0;
      goto LABEL_17;
    }
    self->_rows = -[NSObject unsignedIntegerValue](v7, "unsignedIntegerValue");
    objc_msgSend(v6, "PKStringForKey:", CFSTR("widthClass"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = PKPassTileWidthClassVerticalFlowFromString(v8);
    self->_widthClass = v9;
    if (v9)
    {
      objc_msgSend(v6, "PKStringForKey:", CFSTR("heightClass"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = PKPassTileHeightClassFromString(v10);
      self->_heightClass = v11;
      if (v11)
      {
        v12 = 1;
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      PKLogFacilityTypeGetObject(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[PKPassTileMetadata identifier](self, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v16;
        v21 = 2112;
        v22 = v10;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "PKPassTileMetadataVerticalFlowGroup: \"%@\" invalid - unrecognized height class: %@.", buf, 0x16u);

      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[PKPassTileMetadata identifier](self, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v14;
        v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPassTileMetadataVerticalFlowGroup: \"%@\" invalid - unrecognized width class: %@.", buf, 0x16u);

      }
    }
    v12 = 0;
    goto LABEL_16;
  }
  v12 = 0;
LABEL_18:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileMetadataVerticalFlowGroup)initWithCoder:(id)a3
{
  id v4;
  PKPassTileMetadataVerticalFlowGroup *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassTileMetadataVerticalFlowGroup;
  v5 = -[PKPassTileMetadata initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rows"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_rows = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widthClass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_widthClass = PKPassTileWidthClassVerticalFlowFromString(v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("heightClass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_heightClass = PKPassTileHeightClassFromString(v8);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  int64_t widthClass;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPassTileMetadataVerticalFlowGroup;
  v4 = a3;
  -[PKPassTileMetadata encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_rows, v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("rows"));

  widthClass = self->_widthClass;
  v7 = CFSTR("default");
  if (widthClass != 1)
    v7 = 0;
  if (widthClass == 2)
    v8 = CFSTR("compact");
  else
    v8 = v7;
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("widthClass"));
  PKPassTileHeightClassToString(self->_heightClass);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("heightClass"));

}

- (unint64_t)rows
{
  return self->_rows;
}

- (void)setRows:(unint64_t)a3
{
  self->_rows = a3;
}

- (int64_t)widthClass
{
  return self->_widthClass;
}

- (void)setWidthClass:(int64_t)a3
{
  self->_widthClass = a3;
}

- (int64_t)heightClass
{
  return self->_heightClass;
}

- (void)setHeightClass:(int64_t)a3
{
  self->_heightClass = a3;
}

@end
