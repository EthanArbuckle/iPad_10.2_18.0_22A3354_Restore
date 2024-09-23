@implementation PKPassWeatherSymbol

- (PKPassWeatherSymbol)initWithSymbolName:(id)a3 colorPalette:(id)a4
{
  id v7;
  id v8;
  PKPassWeatherSymbol *v9;
  PKPassWeatherSymbol *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPassWeatherSymbol;
  v9 = -[PKPassWeatherSymbol init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_symbolName, a3);
    objc_storeStrong((id *)&v10->_colorPalette, a4);
  }

  return v10;
}

- (PKPassWeatherSymbol)initWithCoder:(id)a3
{
  id v4;
  PKPassWeatherSymbol *v5;
  uint64_t v6;
  NSString *symbolName;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *colorPalette;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassWeatherSymbol;
  v5 = -[PKPassWeatherSymbol init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
    v6 = objc_claimAutoreleasedReturnValue();
    symbolName = v5->_symbolName;
    v5->_symbolName = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("colorPalette"));
    v11 = objc_claimAutoreleasedReturnValue();
    colorPalette = v5->_colorPalette;
    v5->_colorPalette = (NSArray *)v11;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassWeatherSymbol *v5;
  uint64_t v6;
  NSString *symbolName;
  uint64_t v8;
  NSArray *colorPalette;

  v5 = objc_alloc_init(PKPassWeatherSymbol);
  v6 = -[NSString copyWithZone:](self->_symbolName, "copyWithZone:", a3);
  symbolName = v5->_symbolName;
  v5->_symbolName = (NSString *)v6;

  v8 = -[NSArray copyWithZone:](self->_colorPalette, "copyWithZone:", a3);
  colorPalette = v5->_colorPalette;
  v5->_colorPalette = (NSArray *)v8;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *symbolName;
  id v5;

  symbolName = self->_symbolName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", symbolName, CFSTR("symbolName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_colorPalette, CFSTR("colorPalette"));

}

- (BOOL)isEqual:(id)a3
{
  PKPassWeatherSymbol *v4;
  PKPassWeatherSymbol *v5;
  BOOL v6;

  v4 = (PKPassWeatherSymbol *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPassWeatherSymbol isEqualToSymbol:](self, "isEqualToSymbol:", v5);

  return v6;
}

- (BOOL)isEqualToSymbol:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  _BOOL4 v10;
  char v11;

  v4 = a3;
  v5 = (void *)v4[1];
  v6 = self->_symbolName;
  v7 = v5;
  if (v6 != v7)
  {
    v8 = v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {

    }
    else
    {
      v10 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

      if (v10)
        goto LABEL_10;
    }
    v11 = 0;
    goto LABEL_12;
  }

LABEL_10:
  v11 = PKEqualObjects();
LABEL_12:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_symbolName);
  objc_msgSend(v3, "safelyAddObject:", self->_colorPalette);
  v4 = PKCombinedHash();

  return v4;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSArray)colorPalette
{
  return self->_colorPalette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
