@implementation SXDataTableBorder

+ (id)jsonPropertyNameForObjCPropertyName:(id)a3
{
  id v4;
  __CFString *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("actualWidth")) & 1) != 0)
  {
    v5 = CFSTR("width");
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXDataTableBorder;
    objc_msgSendSuper2(&v7, sel_jsonPropertyNameForObjCPropertyName_, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (double)width
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;

  -[SXDataTableBorder unitConverter](self, "unitConverter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SXDataTableBorder unitConverter](self, "unitConverter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SXDataTableBorder actualWidth](self, "actualWidth");
    objc_msgSend(v4, "convertValueToPoints:", v5, v6);
    self->_width = v7;

  }
  return self->_width;
}

- (SXUnitConverter)unitConverter
{
  return self->unitConverter;
}

- (void)setUnitConverter:(id)a3
{
  objc_storeStrong((id *)&self->unitConverter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->unitConverter, 0);
}

@end
