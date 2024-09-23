@implementation FMDAccessoryStyleDescriptor

- (FMDAccessoryStyleDescriptor)initWithDictionary:(id)a3
{
  id v4;
  FMDAccessoryStyleDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMDAccessoryStyleDescriptor;
  v5 = -[FMDAccessoryStyleDescriptor init](&v12, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("colorCode")));
    -[FMDAccessoryStyleDescriptor setColorCode:](v5, "setColorCode:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("colorCodeLeft")));
    -[FMDAccessoryStyleDescriptor setColorCodeLeft:](v5, "setColorCodeLeft:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("colorCodeRight")));
    -[FMDAccessoryStyleDescriptor setColorCodeRight:](v5, "setColorCodeRight:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("colorCodeCase")));
    -[FMDAccessoryStyleDescriptor setColorCodeCase:](v5, "setColorCodeCase:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("headbandType")));
    -[FMDAccessoryStyleDescriptor setHeadbandType:](v5, "setHeadbandType:", v10);

  }
  return v5;
}

- (NSDictionary)dictionaryValue
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryStyleDescriptor colorCode](self, "colorCode"));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v4, CFSTR("colorCode"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryStyleDescriptor colorCodeLeft](self, "colorCodeLeft"));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v5, CFSTR("colorCodeLeft"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryStyleDescriptor colorCodeRight](self, "colorCodeRight"));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v6, CFSTR("colorCodeRight"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryStyleDescriptor colorCodeCase](self, "colorCodeCase"));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v7, CFSTR("colorCodeCase"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryStyleDescriptor headbandType](self, "headbandType"));
  -[NSMutableDictionary fm_safelySetObject:forKey:](v3, "fm_safelySetObject:forKey:", v8, CFSTR("headbandType"));

  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FMDAccessoryStyleDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDAccessoryStyleDescriptor *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FMDAccessoryStyleDescriptor;
  v6 = -[FMDAccessoryStyleDescriptor init](&v22, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("colorCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[FMDAccessoryStyleDescriptor setColorCode:](v6, "setColorCode:", v8);

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v9), CFSTR("colorCodeLeft"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[FMDAccessoryStyleDescriptor setColorCodeLeft:](v6, "setColorCodeLeft:", v11);

    v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v12), CFSTR("colorCodeRight"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[FMDAccessoryStyleDescriptor setColorCodeRight:](v6, "setColorCodeRight:", v14);

    v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v15), CFSTR("colorCodeCase"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[FMDAccessoryStyleDescriptor setColorCodeCase:](v6, "setColorCodeCase:", v17);

    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v18), CFSTR("headbandType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[FMDAccessoryStyleDescriptor setHeadbandType:](v6, "setHeadbandType:", v20);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryStyleDescriptor colorCode](self, "colorCode"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("colorCode"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryStyleDescriptor colorCodeLeft](self, "colorCodeLeft"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("colorCodeLeft"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryStyleDescriptor colorCodeRight](self, "colorCodeRight"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("colorCodeRight"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryStyleDescriptor colorCodeCase](self, "colorCodeCase"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("colorCodeCase"));

  v9 = (id)objc_claimAutoreleasedReturnValue(-[FMDAccessoryStyleDescriptor headbandType](self, "headbandType"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("headbandType"));

}

- (NSString)colorCode
{
  return self->_colorCode;
}

- (void)setColorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)colorCodeLeft
{
  return self->_colorCodeLeft;
}

- (void)setColorCodeLeft:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)colorCodeRight
{
  return self->_colorCodeRight;
}

- (void)setColorCodeRight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)colorCodeCase
{
  return self->_colorCodeCase;
}

- (void)setColorCodeCase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)headbandType
{
  return self->_headbandType;
}

- (void)setHeadbandType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headbandType, 0);
  objc_storeStrong((id *)&self->_colorCodeCase, 0);
  objc_storeStrong((id *)&self->_colorCodeRight, 0);
  objc_storeStrong((id *)&self->_colorCodeLeft, 0);
  objc_storeStrong((id *)&self->_colorCode, 0);
}

@end
