@implementation FPAuxData

- (FPAuxData)initWithValue:(int64_t)a3 shouldAggregate:(BOOL)a4
{
  FPAuxData *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FPAuxData;
  result = -[FPAuxData init](&v7, sel_init);
  if (result)
  {
    result->_aggregate = a4;
    result->_value = a3;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;

  if (-[FPAuxData supportsFormattedValue](self, "supportsFormattedValue"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), -[FPAuxData formattedValue](self, "formattedValue"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[FPAuxData value](self, "value"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)fp_isContainer
{
  return 0;
}

- (id)fp_jsonRepresentation
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_value);
}

- (BOOL)supportsFormattedValue
{
  void *v2;
  BOOL v3;

  -[FPAuxData formatter](self, "formatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (char)formattedValue
{
  uint64_t (**v3)(_QWORD, _QWORD);
  char *v4;

  -[FPAuxData formatter](self, "formatter");
  v3 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4 = (char *)v3[2](v3, -[FPAuxData value](self, "value"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_value == v4[2];

  return v5;
}

- (int64_t)value
{
  return self->_value;
}

- (BOOL)shouldAggregate
{
  return self->_aggregate;
}

- (id)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_formatter, 0);
}

@end
