@implementation _REChangeFeatureTransformer

+ (id)functionName
{
  return CFSTR("changed");
}

+ (BOOL)supportsInvalidation
{
  return 1;
}

- (_REChangeFeatureTransformer)init
{
  _REChangeFeatureTransformer *v2;
  _REChangeFeatureTransformer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_REChangeFeatureTransformer;
  v2 = -[REFeatureTransformer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_REChangeFeatureTransformer _updateConfigurationForInterval:](v2, "_updateConfigurationForInterval:", 10.0);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[_REChangeFeatureTransformer setValue:](self, "setValue:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_REChangeFeatureTransformer;
  -[_REChangeFeatureTransformer dealloc](&v3, sel_dealloc);
}

- (void)setValue:(unint64_t)a3
{
  RERetainFeatureValueTaggedPointer((CFTypeRef)a3);
  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_value);
  self->_value = a3;
}

- (void)_updateConfigurationForInterval:(double)a3
{
  id v4;

  self->_interval = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Changed%f"), *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[REFeatureTransformer setName:](self, "setName:", v4);

}

- (void)configureWithInvocation:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  if (objc_msgSend(v22, "numberOfArguments") == 1)
  {
    v10 = (void *)objc_msgSend(v22, "getArgumentAtIndex:", 0);
    if (REFeatureValueTypeForTaggedPointer((unint64_t)v10) == 1)
    {
      v11 = (double)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)v10);
    }
    else
    {
      if (REFeatureValueTypeForTaggedPointer((unint64_t)v10) != 2)
      {
        v13 = (void *)*MEMORY[0x24BDBCAB8];
        REDescriptionForTaggedPointer(v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        RERaiseInternalException(v13, CFSTR("Invalid interval %@"), v15, v16, v17, v18, v19, v20, (uint64_t)v14);

        goto LABEL_9;
      }
      v11 = REDoubleValueForTaggedPointer(v10, v12);
    }
    -[_REChangeFeatureTransformer _updateConfigurationForInterval:](self, "_updateConfigurationForInterval:", v11);
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Incorrect number of arguments. Expecting one or three arguments"), v4, v5, v6, v7, v8, v9, v21);
  }
LABEL_9:

}

- (int64_t)_bitCount
{
  return 1;
}

- (unint64_t)_featureCount
{
  return 1;
}

- (unint64_t)_outputType
{
  return 0;
}

- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4
{
  void *v5;
  void *lastChangeDate;
  void *value;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSDate *v16;

  v5 = (void *)*a3;
  if (self->_value)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    lastChangeDate = (void *)objc_claimAutoreleasedReturnValue();
    value = (void *)self->_value;
    if (v5 != value)
    {
      v8 = REFeatureValueTypeForTaggedPointer((unint64_t)v5);
      if (v8 != REFeatureValueTypeForTaggedPointer((unint64_t)value)
        || (REFeatureValueForTaggedPointer(v5),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            REFeatureValueForTaggedPointer(value),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v9, "isEqual:", v10),
            v10,
            v9,
            (v11 & 1) == 0))
      {
        -[_REChangeFeatureTransformer setValue:](self, "setValue:", v5);
        objc_storeStrong((id *)&self->_lastChangeDate, lastChangeDate);
        v12 = (void *)objc_opt_new();
        objc_msgSend(lastChangeDate, "dateByAddingTimeInterval:", self->_interval);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "invalidateAtDate:", v13);

        -[REFeatureTransformer invalidateWithContext:](self, "invalidateWithContext:", v12);
      }
    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", self->_lastChangeDate, self->_interval);
    v15 = objc_msgSend(v14, "containsDate:", lastChangeDate);

  }
  else
  {
    -[_REChangeFeatureTransformer setValue:](self, "setValue:", *a3, a4);
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    lastChangeDate = self->_lastChangeDate;
    self->_lastChangeDate = v16;
  }

  return RECreateBooleanFeatureValueTaggedPointer(v15);
}

- (BOOL)_validateWithFeatures:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_interval);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _REChangeFeatureTransformer *v4;
  BOOL v5;

  v4 = (_REChangeFeatureTransformer *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_interval == v4->_interval;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _REChangeFeatureTransformer *v4;

  v4 = objc_alloc_init(_REChangeFeatureTransformer);
  -[_REChangeFeatureTransformer _updateConfigurationForInterval:](v4, "_updateConfigurationForInterval:", self->_interval);
  return v4;
}

- (unint64_t)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChangeDate, 0);
}

@end
