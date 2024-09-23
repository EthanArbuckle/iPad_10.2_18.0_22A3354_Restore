@implementation PKPassTileMetadataHorizontalFlowGroup

+ (id)_createDefaultDashboardGroupMetadata
{
  id v2;
  void *v3;

  v2 = +[PKPassTileMetadata _createMetadataForType:identifier:context:](PKPassTileMetadata, "_createMetadataForType:identifier:context:", 2, CFSTR("__defaultGroupIdentifier__"), 1);
  objc_msgSend(v2, "metadataTypeHorizontalFlowGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setColumns:", 2);
  objc_msgSend(v3, "setMaximumRows:", 2);
  objc_msgSend(v3, "setWidthClass:", 2);
  objc_msgSend(v3, "setHeightClass:", 1);
  return v3;
}

- (BOOL)_setUpWithDictionary:(id)a3 privateDictionary:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int64_t v11;
  NSObject *v12;
  int64_t v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPassTileMetadataHorizontalFlowGroup;
  if (-[PKPassTileMetadata _setUpWithDictionary:privateDictionary:](&v21, sel__setUpWithDictionary_privateDictionary_, v6, a4))
  {
    objc_msgSend(v6, "PKNumberForKey:", CFSTR("columns"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject pk_isPositiveNumber](v7, "pk_isPositiveNumber")
      && (-[NSObject pk_isIntegralNumber](v7, "pk_isIntegralNumber") & 1) != 0)
    {
      self->_columns = -[NSObject unsignedIntegerValue](v7, "unsignedIntegerValue");
      objc_msgSend(v6, "PKNumberForKey:", CFSTR("maximumRows"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (!v8
        || -[NSObject pk_isPositiveNumber](v8, "pk_isPositiveNumber")
        && (-[NSObject pk_isIntegralNumber](v9, "pk_isIntegralNumber") & 1) != 0)
      {
        self->_maximumRows = -[NSObject unsignedIntegerValue](v9, "unsignedIntegerValue");
        objc_msgSend(v6, "PKStringForKey:", CFSTR("widthClass"));
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = PKPassTileWidthClassHorizontalFlowFromString(v10);
        self->_widthClass = v11;
        if (v11)
        {
          objc_msgSend(v6, "PKStringForKey:", CFSTR("heightClass"));
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = PKPassTileHeightClassFromString(v12);
          self->_heightClass = v13;
          v14 = v13 != 0;
          if (v13)
          {
            objc_msgSend(v6, "PKStringForKey:", CFSTR("groupStyle"));
            v15 = objc_claimAutoreleasedReturnValue();
            self->_groupStyle = PKPassTileGroupStyleFromString(v15);
          }
          else
          {
            PKLogFacilityTypeGetObject(0);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              -[PKPassTileMetadata identifier](self, "identifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v23 = v19;
              v24 = 2112;
              v25 = v12;
              _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "PKPassTileMetadataHorizontalFlowGroup: \"%@\" invalid - unrecognized height class: %@.", buf, 0x16u);

            }
          }

        }
        else
        {
          PKLogFacilityTypeGetObject(0);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            -[PKPassTileMetadata identifier](self, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v23 = v18;
            v24 = 2112;
            v25 = v10;
            _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "PKPassTileMetadataHorizontalFlowGroup: \"%@\" invalid - unrecognized width class: %@.", buf, 0x16u);

          }
          v14 = 0;
        }

      }
      else
      {
        PKLogFacilityTypeGetObject(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          -[PKPassTileMetadata identifier](self, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v23 = v17;
          v24 = 2112;
          v25 = v9;
          _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPassTileMetadataHorizontalFlowGroup: \"%@\" invalid - invalid value for maximumRows: %@.", buf, 0x16u);

        }
        v14 = 0;
      }

    }
    else
    {
      PKLogFacilityTypeGetObject(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[PKPassTileMetadata identifier](self, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v16;
        v24 = 2112;
        v25 = v7;
        _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKPassTileMetadataHorizontalFlowGroup: \"%@\" invalid - invalid value for columns: %@.", buf, 0x16u);

      }
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileMetadataHorizontalFlowGroup)initWithCoder:(id)a3
{
  id v4;
  PKPassTileMetadataHorizontalFlowGroup *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPassTileMetadataHorizontalFlowGroup;
  v5 = -[PKPassTileMetadata initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("columns"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_columns = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumRows"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maximumRows = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widthClass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_widthClass = PKPassTileWidthClassHorizontalFlowFromString(v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("heightClass"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_heightClass = PKPassTileHeightClassFromString(v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupStyle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_groupStyle = PKPassTileGroupStyleFromString(v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t widthClass;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPassTileMetadataHorizontalFlowGroup;
  v4 = a3;
  -[PKPassTileMetadata encodeWithCoder:](&v12, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_columns, v12.receiver, v12.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("columns"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maximumRows);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("maximumRows"));

  widthClass = self->_widthClass;
  v8 = CFSTR("default");
  if (widthClass != 1)
    v8 = 0;
  if (widthClass == 2)
    v9 = CFSTR("compact");
  else
    v9 = v8;
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("widthClass"));
  PKPassTileHeightClassToString(self->_heightClass);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("heightClass"));

  PKPassTileGroupStyleToString(self->_groupStyle);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("groupStyle"));

}

- (unint64_t)columns
{
  return self->_columns;
}

- (void)setColumns:(unint64_t)a3
{
  self->_columns = a3;
}

- (unint64_t)maximumRows
{
  return self->_maximumRows;
}

- (void)setMaximumRows:(unint64_t)a3
{
  self->_maximumRows = a3;
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

- (unint64_t)groupStyle
{
  return self->_groupStyle;
}

- (void)setGroupStyle:(unint64_t)a3
{
  self->_groupStyle = a3;
}

@end
