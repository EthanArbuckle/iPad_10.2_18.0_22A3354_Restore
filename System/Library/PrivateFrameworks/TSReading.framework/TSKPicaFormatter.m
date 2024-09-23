@implementation TSKPicaFormatter

- (TSKPicaFormatter)initWithPicaSeparator:(id)a3
{
  TSKPicaFormatter *v4;
  TSKPicaFormatter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSKPicaFormatter;
  v4 = -[TSKPicaFormatter init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[TSKPicaFormatter setPicaSeparator:](v4, "setPicaSeparator:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKPicaFormatter;
  -[TSKPicaFormatter dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPicaSeparator:", -[TSKPicaFormatter picaSeparator](self, "picaSeparator"));
  objc_msgSend(v4, "setMinimum:", -[TSKPicaFormatter minimum](self, "minimum"));
  objc_msgSend(v4, "setMaximum:", -[TSKPicaFormatter maximum](self, "maximum"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[NSString isEqualToString:](-[TSKPicaFormatter picaSeparator](self, "picaSeparator"), "isEqualToString:", objc_msgSend(a3, "picaSeparator"));
      if (v5)
      {
        v5 = -[NSNumber isEqualToNumber:](-[TSKPicaFormatter minimum](self, "minimum"), "isEqualToNumber:", objc_msgSend(a3, "minimum"));
        if (v5)
          LOBYTE(v5) = -[NSNumber isEqualToNumber:](-[TSKPicaFormatter maximum](self, "maximum"), "isEqualToNumber:", objc_msgSend(a3, "maximum"));
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)stringForObjectValue:(id)a3
{
  uint64_t v3;
  float v6;
  double v7;
  double v8;
  uint64_t v9;
  BOOL v10;
  const __CFString *v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_msgSend(a3, "floatValue");
  v7 = floor(v6);
  v8 = ceil(v6);
  if (v6 < 0.0)
    v7 = v8;
  v9 = (int)v7;
  LODWORD(v3) = llround(12.0 * vabdd_f64(v6, (double)(int)v9));
  if ((double)(int)v3 >= 12.0)
  {
    v3 = (int)((double)(int)v3 - 12.0);
    v9 = (((int)v9 >> 31) | 1) + v9;
  }
  if ((_DWORD)v9)
    v10 = 0;
  else
    v10 = v6 <= 0.0;
  if (v10)
    v11 = CFSTR("-%d%@%d");
  else
    v11 = CFSTR("%d%@%d");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v11, v9, -[TSKPicaFormatter picaSeparator](self, "picaSeparator"), v3);
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  void *v9;
  unsigned __int8 v10;
  int v11;
  int v12;
  NSNumber *v13;
  NSNumber *v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  if (a4 && objc_msgSend(a4, "length"))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", a4);
    v10 = objc_msgSend(v9, "scanString:intoString:", CFSTR("-"), 0);
    v20 = 0;
    if ((objc_msgSend(v9, "scanFloat:", (char *)&v20 + 4) & 1) == 0)
      HIDWORD(v20) = 0;
    objc_msgSend(v9, "scanString:intoString:", -[TSKPicaFormatter picaSeparator](self, "picaSeparator"), 0);
    if ((objc_msgSend(v9, "scanFloat:", &v20) & 1) == 0)
      LODWORD(v20) = 0;
    v11 = objc_msgSend(v9, "isAtEnd");
    v12 = v11;
    if (a5 && (v11 & 1) == 0)
      *a5 = (id)objc_msgSend((id)TSKBundle(), "localizedStringForKey:value:table:", CFSTR("Couldn\\U2019t convert to picas"), &stru_24D82FEB0, CFSTR("TSKit"));
    if (a3 && v12)
    {
      v13 = -[TSKPicaFormatter minimum](self, "minimum");
      v14 = -[TSKPicaFormatter maximum](self, "maximum");
      LODWORD(v20) = fabsf(*(float *)&v20);
      v15 = *(float *)&v20 / 12.0 + *((float *)&v20 + 1);
      if ((v10 & (v15 > 0.0)) != 0)
        v15 = -v15;
      *(float *)&v15 = v15;
      v16 = (void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
      *a3 = v16;
      if (v13)
      {
        v17 = objc_msgSend(v16, "compare:", v13);
        if (v17 == -1)
          v12 = 0;
        if (a5 && v17 == -1)
        {
          v12 = 0;
          *a5 = (id)objc_msgSend((id)TSKBundle(), "localizedStringForKey:value:table:", CFSTR("Fell short of minimum"), &stru_24D82FEB0, CFSTR("TSKit"));
        }
      }
      if (v14)
      {
        v18 = objc_msgSend(*a3, "compare:", v14);
        if (v18 == 1)
          v12 = 0;
        if (a5)
        {
          if (v18 == 1)
          {
            v12 = 0;
            *a5 = (id)objc_msgSend((id)TSKBundle(), "localizedStringForKey:value:table:", CFSTR("Maximum exceeded"), &stru_24D82FEB0, CFSTR("TSKit"));
          }
        }
      }
    }
    return v12 != 0;
  }
  else
  {
    if (a3)
      *a3 = 0;
    return 1;
  }
}

- (NSString)picaSeparator
{
  return self->mPicaSeparator;
}

- (void)setPicaSeparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)minimum
{
  return self->mMinimum;
}

- (void)setMinimum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)maximum
{
  return self->mMaximum;
}

- (void)setMaximum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
