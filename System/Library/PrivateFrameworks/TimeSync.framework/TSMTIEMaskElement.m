@implementation TSMTIEMaskElement

- (TSMTIEMaskElement)initWithCoefficient:(double)a3 offset:(double)a4 lowerLimit:(double)a5 upperLimit:(double)a6
{
  TSMTIEMaskElement *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSMTIEMaskElement;
  result = -[TSMTIEMaskElement init](&v11, sel_init);
  if (result)
  {
    result->_a = a3;
    result->_b = a4;
    result->_lowerLimit = a5;
    result->_upperLimit = a6;
  }
  return result;
}

- (TSMTIEMaskElement)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  TSMTIEMaskElement *v16;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coefficient"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lowerLimit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("upperLimit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
LABEL_3:
      if (!v5)
        goto LABEL_11;
      goto LABEL_7;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", INFINITY);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_11:

    v16 = 0;
    goto LABEL_12;
  }
LABEL_7:
  if (!v6 || !v7 || !v8)
    goto LABEL_11;
  objc_msgSend(v5, "doubleValue");
  v10 = v9;
  objc_msgSend(v6, "doubleValue");
  v12 = v11;
  objc_msgSend(v7, "doubleValue");
  v14 = v13;
  objc_msgSend(v8, "doubleValue");
  v16 = -[TSMTIEMaskElement initWithCoefficient:offset:lowerLimit:upperLimit:](self, "initWithCoefficient:offset:lowerLimit:upperLimit:", v10, v12, v14, v15);
LABEL_12:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = objc_alloc((Class)objc_opt_class());
  -[TSMTIEMaskElement a](self, "a");
  v6 = v5;
  -[TSMTIEMaskElement b](self, "b");
  v8 = v7;
  -[TSMTIEMaskElement lowerLimit](self, "lowerLimit");
  v10 = v9;
  -[TSMTIEMaskElement upperLimit](self, "upperLimit");
  return (id)objc_msgSend(v4, "initWithCoefficient:offset:lowerLimit:upperLimit:", v6, v8, v10, v11);
}

- (double)a
{
  return self->_a;
}

- (double)b
{
  return self->_b;
}

- (double)lowerLimit
{
  return self->_lowerLimit;
}

- (double)upperLimit
{
  return self->_upperLimit;
}

@end
