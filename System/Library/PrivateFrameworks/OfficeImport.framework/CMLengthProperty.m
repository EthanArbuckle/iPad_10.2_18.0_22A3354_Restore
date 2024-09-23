@implementation CMLengthProperty

+ (id)cssStringValue:(double)a3 unit:(int)a4
{
  id v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  switch(a4)
  {
    case 2:
      v5 = (int)(a3 / 20.0);
      goto LABEL_12;
    case 6:
      v5 = ((int)a3 / 2);
      goto LABEL_12;
    case 8:
    case 9:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(":%f;"), *(_QWORD *)&a3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      return v4;
    case 10:
      v5 = ((int)a3 / 8);
      goto LABEL_12;
    default:
      if (a3 > 1.0 || a3 <= 0.5)
        v5 = (int)a3;
      else
        v5 = 1;
LABEL_12:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[CMGlobalCache lengthPropertyCache](CMGlobalCache, "lengthPropertyCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v4 = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(":%dpx;"), v5);
        v4 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKey:", v4, v7);
      }

      return v4;
  }
}

- (CMLengthProperty)initWithNumber:(double)a3 unit:(int)a4
{
  CMLengthProperty *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMLengthProperty;
  result = -[CMLengthProperty init](&v7, sel_init);
  if (result)
  {
    result->value = a3;
    result->unitType = a4;
  }
  return result;
}

- (id)cssStringForName:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  double value;
  BOOL v9;
  void *v10;

  v4 = a3;
  switch(self->unitType)
  {
    case 2:
      v6 = (int)(self->value / 20.0);
      goto LABEL_12;
    case 3:
      v6 = (int)(self->value / 20.0);
      v7 = CFSTR("%@:%dpt;");
      goto LABEL_13;
    case 6:
      v6 = ((int)self->value / 2);
      goto LABEL_12;
    case 8:
    case 9:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%f;"), v4, *(_QWORD *)&self->value);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    default:
      value = self->value;
      v9 = value > 1.0 || value <= 0.5;
      LODWORD(v6) = (int)value;
      if (v9)
        v6 = v6;
      else
        v6 = 1;
LABEL_12:
      v7 = CFSTR("%@:%d;");
LABEL_13:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v7, v4, v6);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v10 = (void *)v5;

      return v10;
  }
}

- (double)value
{
  return self->value;
}

- (int)unitType
{
  return self->unitType;
}

- (CMLengthProperty)initWithNumber:(double)a3
{
  return -[CMLengthProperty initWithNumber:unit:](self, "initWithNumber:unit:", 1, a3);
}

- (id)cssString
{
  uint64_t v2;
  double value;
  BOOL v4;

  switch(self->unitType)
  {
    case 2:
      v2 = (int)(self->value / 20.0);
      goto LABEL_11;
    case 3:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%dpt;"), (int)(self->value / 20.0));
      return (id)objc_claimAutoreleasedReturnValue();
    case 6:
      v2 = ((int)self->value / 2);
      goto LABEL_11;
    case 8:
    case 9:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f;"), *(_QWORD *)&self->value);
      return (id)objc_claimAutoreleasedReturnValue();
    default:
      value = self->value;
      v4 = value > 1.0 || value <= 0.5;
      LODWORD(v2) = (int)value;
      if (v4)
        v2 = v2;
      else
        v2 = 1;
LABEL_11:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d;"), v2);
      return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (int)intValue
{
  return (int)self->value;
}

- (int)compareValue:(id)a3
{
  id v4;
  id v5;
  double value;
  double v7;
  int v8;
  int unitType;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    value = self->value;
    objc_msgSend(v5, "value");
    if (value == v7)
    {
      unitType = self->unitType;
      if (unitType == objc_msgSend(v5, "unitType"))
        v8 = 0;
      else
        v8 = -1;
    }
    else
    {
      v8 = -1;
    }

  }
  else
  {
    v8 = -1;
  }

  return v8;
}

+ (double)convertToPoints:(double)result unit:(int)a4
{
  if ((a4 - 2) < 2)
    return result / 20.0;
  if (a4 == 6)
    return result * 0.5;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CMLengthProperty cssString](self, "cssString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addNumber:(double)a3 unit:(int)a4
{
  uint64_t v6;
  double v7;
  double v8;
  double v9;

  if (self->unitType == a4)
  {
    self->value = self->value + a3;
  }
  else
  {
    v6 = *(_QWORD *)&a4;
    objc_msgSend((id)objc_opt_class(), "convertToPoints:unit:", self->unitType, self->value);
    v8 = v7;
    objc_msgSend((id)objc_opt_class(), "convertToPoints:unit:", v6, a3);
    self->value = v8 + v9;
    self->unitType = 1;
  }
}

@end
