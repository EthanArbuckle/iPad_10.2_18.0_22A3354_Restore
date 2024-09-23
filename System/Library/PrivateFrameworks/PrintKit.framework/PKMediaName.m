@implementation PKMediaName

+ (id)pkMediaNameWithString:(id)a3
{
  id v3;
  PKMediaName *v4;

  v3 = a3;
  v4 = -[PKMediaName initWithString:]([PKMediaName alloc], "initWithString:", v3);

  return v4;
}

- (PKMediaName)initWithString:(id)a3
{
  id v4;
  PKMediaName *v5;
  PKMediaName *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKMediaName;
  v5 = -[PKMediaName init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKMediaName setMediaName:](v5, "setMediaName:", v4);
    -[PKMediaName parseMediaName:](v6, "parseMediaName:", v4);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[PKMediaName setMediaName:](self, "setMediaName:", 0);
  -[PKMediaName setMediaClass:](self, "setMediaClass:", 0);
  -[PKMediaName setBaseName:](self, "setBaseName:", 0);
  -[PKMediaName setWidthStr:](self, "setWidthStr:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKMediaName;
  -[PKMediaName dealloc](&v3, sel_dealloc);
}

- (void)parseMediaName:(id)a3
{
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  const char *v8;
  char *v9;
  const char *v10;
  _BYTE *i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = objc_retainAutorelease(a3);
  v4 = strdup((const char *)objc_msgSend(v17, "UTF8String"));
  v5 = strchr(v4, 95);
  if (!v5)
    goto LABEL_23;
  *v5 = 0;
  v6 = v5 + 1;
  v7 = strchr(v5 + 1, 95);
  if (!v7)
    goto LABEL_23;
  *v7 = 0;
  v8 = v7 + 1;
  v9 = strchr(v7 + 1, 120);
  if (!v9)
    goto LABEL_23;
  v10 = v9 + 1;
  *v9 = 0;
  for (i = v9 + 2; ; ++i)
  {
    v12 = *(i - 1);
    if (((char)*(i - 1) < 0 || (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v12 + 60) & 0x400) == 0) && (_DWORD)v12 != 46)
      break;
  }
  if ((_DWORD)v12 == 105)
  {
    if (*i == 110)
    {
      -[PKMediaName setConversionFactor:](self, "setConversionFactor:", 2540.0);
      v13 = 1;
      goto LABEL_17;
    }
LABEL_16:
    v13 = 0;
    goto LABEL_17;
  }
  if ((_DWORD)v12 != 109 || *i != 109)
    goto LABEL_16;
  -[PKMediaName setConversionFactor:](self, "setConversionFactor:", 100.0);
  v13 = 2;
LABEL_17:
  *(i - 1) = 0;
  if (!v13 || !v8 || !v4 || !v6 || !v10)
  {
LABEL_23:
    NSLog(CFSTR("%s failed on %@"), "-[PKMediaName parseMediaName:]", v17);
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMediaName setMediaClass:](self, "setMediaClass:", v14);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMediaName setBaseName:](self, "setBaseName:", v15);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMediaName setWidthStr:](self, "setWidthStr:", v16);

  -[PKMediaName setWidthInUnits:](self, "setWidthInUnits:", atof(v8));
  -[PKMediaName setHeightInUnits:](self, "setHeightInUnits:", atof(v10));
  -[PKMediaName setUnits:](self, "setUnits:", v13);
LABEL_24:
  free(v4);

}

- (NSString)unitStr
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[PKMediaName units](self, "units");
  v3 = &stru_24E6CFEB0;
  if (v2 == 2)
    v3 = CFSTR("mm");
  if (v2 == 1)
    return (NSString *)CFSTR("in");
  else
    return &v3->isa;
}

- (BOOL)isRoll
{
  void *v2;
  char v3;

  -[PKMediaName mediaClass](self, "mediaClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("roll"));

  return v3;
}

- (double)width
{
  double v3;
  double v4;
  double v5;

  -[PKMediaName widthInUnits](self, "widthInUnits");
  v4 = v3;
  -[PKMediaName conversionFactor](self, "conversionFactor");
  return v4 * v5;
}

- (double)height
{
  double v3;
  double v4;
  double v5;

  -[PKMediaName heightInUnits](self, "heightInUnits");
  v4 = v3;
  -[PKMediaName conversionFactor](self, "conversionFactor");
  return v4 * v5;
}

- (NSString)mediaName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMediaName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)mediaClass
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMediaClass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)baseName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBaseName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)widthInUnits
{
  return self->_widthInUnits;
}

- (void)setWidthInUnits:(double)a3
{
  self->_widthInUnits = a3;
}

- (double)heightInUnits
{
  return self->_heightInUnits;
}

- (void)setHeightInUnits:(double)a3
{
  self->_heightInUnits = a3;
}

- (NSString)widthStr
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWidthStr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int64_t)units
{
  return self->_units;
}

- (void)setUnits:(int64_t)a3
{
  self->_units = a3;
}

- (double)conversionFactor
{
  return self->_conversionFactor;
}

- (void)setConversionFactor:(double)a3
{
  self->_conversionFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthStr, 0);
  objc_storeStrong((id *)&self->_baseName, 0);
  objc_storeStrong((id *)&self->_mediaClass, 0);
  objc_storeStrong((id *)&self->_mediaName, 0);
}

@end
