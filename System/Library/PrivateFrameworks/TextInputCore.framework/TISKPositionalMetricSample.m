@implementation TISKPositionalMetricSample

- (TISKPositionalMetricSample)initWithCapacity:(unint64_t)a3
{
  TISKPositionalMetricSample *v4;
  uint64_t v5;
  NSMutableArray *positionalMetricSample;
  uint64_t v7;
  TISKSingleMetricSample *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TISKPositionalMetricSample;
  v4 = -[TISKPositionalMetricSample init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    positionalMetricSample = v4->_positionalMetricSample;
    v4->_positionalMetricSample = (NSMutableArray *)v5;

    if (a3)
    {
      v7 = 0;
      do
      {
        v8 = objc_alloc_init(TISKSingleMetricSample);
        -[NSMutableArray setObject:atIndexedSubscript:](v4->_positionalMetricSample, "setObject:atIndexedSubscript:", v8, v7);

        ++v7;
      }
      while (a3 != v7);
    }
  }
  return v4;
}

- (void)addSample:(id)a3 withPosition:(unint64_t)a4
{
  NSMutableArray *positionalMetricSample;
  id v6;
  id v7;

  positionalMetricSample = self->_positionalMetricSample;
  v6 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](positionalMetricSample, "objectAtIndexedSubscript:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSample:", v6);

}

- (id)singleMetricSample:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_positionalMetricSample, "objectAtIndexedSubscript:", a3);
}

- (unint64_t)size
{
  return -[NSMutableArray count](self->_positionalMetricSample, "count");
}

- (BOOL)isEmpty
{
  unint64_t v3;
  void *v4;
  char v5;

  if (!-[TISKPositionalMetricSample size](self, "size"))
    return 1;
  v3 = 0;
  do
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_positionalMetricSample, "objectAtIndexedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEmpty");

    if ((v5 & 1) == 0)
      break;
    ++v3;
  }
  while (-[TISKPositionalMetricSample size](self, "size") > v3);
  return v5;
}

- (void)merge:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *positionalMetricSample;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    IXADefaultLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      positionalMetricSample = self->_positionalMetricSample;
      objc_msgSend(v4, "positionalMetricSample");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%s [SensorKit] positional metric merge: other doesn't respond to positionalMetricSample selector %@ : %@"), "-[TISKPositionalMetricSample merge:]", positionalMetricSample, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v13;
      _os_log_error_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
  if (-[TISKPositionalMetricSample size](self, "size"))
  {
    v6 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_positionalMetricSample, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "positionalMetricSample");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "merge:", v9);

      ++v6;
    }
    while (-[TISKPositionalMetricSample size](self, "size") > v6);
  }

}

- (id)description:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TISKPositionalMetricSample size](self, "size"))
  {
    v6 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_positionalMetricSample, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("%lu:%lu "), v6, objc_msgSend(v7, "size"));
      if (v3)
      {
        objc_msgSend(v5, "appendString:", CFSTR("<"));
        objc_msgSend(v7, "description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v8);

        objc_msgSend(v5, "appendString:", CFSTR(">"));
      }
      objc_msgSend(v5, "appendString:", CFSTR(", "));

      ++v6;
    }
    while (v6 < -[TISKPositionalMetricSample size](self, "size"));
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  NSMutableArray *positionalMetricSample;
  void *v4;

  if (self == a3)
    return 1;
  positionalMetricSample = self->_positionalMetricSample;
  objc_msgSend(a3, "positionalMetricSample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(positionalMetricSample) = -[NSMutableArray isEqual:](positionalMetricSample, "isEqual:", v4);

  return (char)positionalMetricSample;
}

- (id)generateDataForSR:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSMutableArray count](self->_positionalMetricSample, "count"))
    goto LABEL_8;
  v6 = 0;
  v7 = 0;
  do
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_positionalMetricSample, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "generateDataForSR:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
      v9 = objc_alloc_init((Class)getSRKeyboardProbabilityMetricClass());
    objc_msgSend(v5, "addObject:", v9);
    v7 += objc_msgSend(v9, "totalDataSamples");

    ++v6;
  }
  while (v6 < -[NSMutableArray count](self->_positionalMetricSample, "count"));
  if (v7)
    v10 = v5;
  else
LABEL_8:
    v10 = 0;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_positionalMetricSample, CFSTR("PositionalMetricSample"));
}

- (TISKPositionalMetricSample)initWithCoder:(id)a3
{
  id v4;
  TISKPositionalMetricSample *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *positionalMetricSample;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TISKPositionalMetricSample;
  v5 = -[TISKPositionalMetricSample init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("PositionalMetricSample"));
    v9 = objc_claimAutoreleasedReturnValue();
    positionalMetricSample = v5->_positionalMetricSample;
    v5->_positionalMetricSample = (NSMutableArray *)v9;

  }
  return v5;
}

- (NSMutableArray)positionalMetricSample
{
  return self->_positionalMetricSample;
}

- (void)setPositionalMetricSample:(id)a3
{
  objc_storeStrong((id *)&self->_positionalMetricSample, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positionalMetricSample, 0);
}

+ (id)makeMetric:(unint64_t)a3
{
  return -[TISKPositionalMetricSample initWithCapacity:]([TISKPositionalMetricSample alloc], "initWithCapacity:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
