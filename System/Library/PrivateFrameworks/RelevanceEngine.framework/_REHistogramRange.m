@implementation _REHistogramRange

- (_REHistogramRange)initWithValue:(unint64_t)a3 binningSize:(unint64_t)a4
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const void *v25;
  const void *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  _REHistogramRange *v31;
  uint64_t v33;
  void *v34;

  v7 = REFeatureValueTypeForTaggedPointer(a3);
  if (v7 == REFeatureValueTypeForTaggedPointer(a4))
  {
    switch(REFeatureValueTypeForTaggedPointer(a3))
    {
      case 0:
        v15 = (void *)*MEMORY[0x24BDBCAB8];
        v16 = CFSTR("Bool values aren't supported");
        goto LABEL_12;
      case 1:
        v27 = REIntegerValueForTaggedPointer(a4);
        v28 = REIntegerValueForTaggedPointer(a3) / v27 * v27;
        v26 = (const void *)RECreateIntegerFeatureValueTaggedPointer(v28);
        v29 = RECreateIntegerFeatureValueTaggedPointer(v28 + v27);
        goto LABEL_8;
      case 2:
        REDoubleValueForTaggedPointer((void *)a4, v8);
        REDoubleValueForTaggedPointer((void *)a3, v30);
        v26 = (const void *)RECreateDoubleFeatureValueTaggedPointer();
        v29 = RECreateDoubleFeatureValueTaggedPointer();
LABEL_8:
        v25 = (const void *)v29;
        goto LABEL_9;
      case 3:
        v15 = (void *)*MEMORY[0x24BDBCAB8];
        v16 = CFSTR("String values aren't supported");
        goto LABEL_12;
      case 4:
        v15 = (void *)*MEMORY[0x24BDBCAB8];
        v16 = CFSTR("Set values aren't supported");
LABEL_12:
        RERaiseInternalException(v15, v16, v9, v10, v11, v12, v13, v14, v33);
        goto LABEL_13;
      default:
        v25 = 0;
        v26 = 0;
LABEL_9:
        self = -[_REHistogramRange initWithMin:max:](self, "initWithMin:max:", v26, v25);
        REReleaseFeatureValueTaggedPointer(v26);
        REReleaseFeatureValueTaggedPointer(v25);
        v31 = self;
        goto LABEL_14;
    }
  }
  v17 = (void *)*MEMORY[0x24BDBCAB8];
  REDescriptionForTaggedPointer((void *)a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  REDescriptionForTaggedPointer((void *)a4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  RERaiseInternalException(v17, CFSTR("value %@ and binning value %@ must have matching types"), v19, v20, v21, v22, v23, v24, (uint64_t)v18);

LABEL_13:
  v31 = 0;
LABEL_14:

  return v31;
}

- (_REHistogramRange)initWithMin:(unint64_t)a3 max:(unint64_t)a4
{
  _REHistogramRange *v6;
  _REHistogramRange *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_REHistogramRange;
  v6 = -[_REHistogramRange init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_min = a3;
    v6->_max = a4;
    RERetainFeatureValueTaggedPointer((CFTypeRef)a3);
    RERetainFeatureValueTaggedPointer((CFTypeRef)v7->_max);
    if (REFeatureValueTypeForTaggedPointer(v7->_min) == 2)
    {
      REDoubleValueForTaggedPointer((void *)a3, v8);
      REDoubleValueForTaggedPointer((void *)a4, v9);
      v10 = RECreateDoubleFeatureValueTaggedPointer();
    }
    else
    {
      v11 = REIntegerValueForTaggedPointer(a3);
      v12 = REIntegerValueForTaggedPointer(a4);
      v10 = RECreateIntegerFeatureValueTaggedPointer((unint64_t)(v12 + v11) >> 1);
    }
    v7->_mid = v10;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_min);
  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_max);
  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_mid);
  v3.receiver = self;
  v3.super_class = (Class)_REHistogramRange;
  -[_REHistogramRange dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = REFeatureValueHashForTaggedPointer((void *)self->_min);
  return REFeatureValueHashForTaggedPointer((void *)self->_max) ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _REHistogramRange *v4;
  _REHistogramRange *v5;
  void *min;
  void *v7;
  void *max;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v4 = (_REHistogramRange *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      min = (void *)self->_min;
      v7 = (void *)v5->_min;
      if (min != v7)
      {
        v11 = REFeatureValueTypeForTaggedPointer(self->_min);
        if (v11 != REFeatureValueTypeForTaggedPointer((unint64_t)v7))
          goto LABEL_13;
        REFeatureValueForTaggedPointer(min);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        REFeatureValueForTaggedPointer(v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if (!v14)
          goto LABEL_13;
      }
      max = (void *)self->_max;
      v9 = (void *)v5->_max;
      if (max == v9)
      {
        v10 = 1;
      }
      else
      {
        v15 = REFeatureValueTypeForTaggedPointer((unint64_t)max);
        if (v15 != REFeatureValueTypeForTaggedPointer((unint64_t)v9))
        {
LABEL_13:
          v10 = 0;
          goto LABEL_14;
        }
        REFeatureValueForTaggedPointer(max);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        REFeatureValueForTaggedPointer(v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v16, "isEqual:", v17);

      }
LABEL_14:

      goto LABEL_15;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  REDescriptionForTaggedPointer((void *)self->_min);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  REDescriptionForTaggedPointer((void *)self->_max);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p: %@> min=%@, max=%@"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMin:max:", self->_min, self->_max);
}

- (int64_t)compare:(id)a3
{
  id v4;
  void **v5;
  int64_t v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void **)v4;
    v6 = RECompareFeatureValues(self->_min, v5[1]);
    if (!v6)
      v6 = RECompareFeatureValues(self->_max, v5[2]);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (unint64_t)min
{
  return self->_min;
}

- (unint64_t)max
{
  return self->_max;
}

- (unint64_t)mid
{
  return self->_mid;
}

@end
