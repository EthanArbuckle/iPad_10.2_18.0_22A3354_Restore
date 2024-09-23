@implementation _RELogFeatureTransformer

- (_RELogFeatureTransformer)initWithBase:(id)a3
{
  id v4;
  _RELogFeatureTransformer *v5;
  double v6;
  long double base;
  float v8;
  __CFString *v9;
  long double v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_RELogFeatureTransformer;
  v5 = -[REFeatureTransformer init](&v13, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "type") == 1)
      v6 = (double)(unint64_t)objc_msgSend(v4, "int64Value");
    else
      objc_msgSend(v4, "doubleValue");
    v5->_base = v6;
    v5->_type = 3;
    base = v5->_base;
    v8 = base;
    if (fabsf(v8 + -2.7183) >= 0.00000011921)
    {
      if (fabsf(v8 + -2.0) >= 0.00000011921)
      {
        if (fabsf(v8 + -10.0) >= 0.00000011921)
        {
          v10 = log(base);
          v5->_base = v10;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&v10);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v5->_type = 2;
          v9 = CFSTR("10");
        }
      }
      else
      {
        v5->_type = 1;
        v9 = CFSTR("2");
      }
    }
    else
    {
      v5->_type = 0;
      v9 = CFSTR("e");
    }
    objc_msgSend(CFSTR("Log"), "stringByAppendingString:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[REFeatureTransformer setName:](v5, "setName:", v11);

  }
  return v5;
}

- (int64_t)_bitCount
{
  return -1;
}

- (unint64_t)_featureCount
{
  return 1;
}

- (unint64_t)_outputType
{
  return 2;
}

- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4
{
  void *v5;
  const char *v6;
  double v7;

  v5 = (void *)*a3;
  if (REFeatureValueTypeForTaggedPointer(*a3) == 1)
    v7 = (double)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)v5);
  else
    v7 = REDoubleValueForTaggedPointer(v5, v6);
  switch(self->_type)
  {
    case 0uLL:
      goto LABEL_7;
    case 1uLL:
      log2(v7);
      break;
    case 2uLL:
      log10(v7);
      break;
    case 3uLL:
      if (fabs(self->_base) >= 0.0000001)
LABEL_7:
        log(v7);
      break;
    default:
      return RECreateDoubleFeatureValueTaggedPointer();
  }
  return RECreateDoubleFeatureValueTaggedPointer();
}

- (BOOL)_validateWithFeatures:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "featureType") == 2;

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  if (self->_type != 3)
    return self->_type;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_base);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _RELogFeatureTransformer *v4;
  unint64_t type;
  unint64_t v6;
  BOOL v8;
  float base;
  float v10;

  v4 = (_RELogFeatureTransformer *)a3;
  if (self == v4)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  type = self->_type;
  v6 = v4->_type;
  if (type == 3 && v6 == 3)
  {
    base = self->_base;
    v10 = v4->_base;
    v8 = vabds_f32(base, v10) < 0.00000011921;
    goto LABEL_11;
  }
  if (type == v6)
LABEL_8:
    v8 = 1;
  else
LABEL_9:
    v8 = 0;
LABEL_11:

  return v8;
}

@end
