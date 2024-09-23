@implementation TSTimeErrorValue

- (TSTimeErrorValue)initWithTimestamp:(unint64_t)a3 andError:(int64_t)a4
{
  TSTimeErrorValue *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSTimeErrorValue;
  result = -[TSTimeErrorValue init](&v7, sel_init);
  if (result)
  {
    result->_timestamp = a3;
    result->_error = a4;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: {%llu,%lld}>"), v5, self, -[TSTimeErrorValue timestamp](self, "timestamp"), -[TSTimeErrorValue error](self, "error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)timeErrorSequenceWithTimestamps:(unint64_t *)a3 timeError:(int64_t *)a4 count:(int64_t)a5
{
  void *v8;
  TSTimeErrorValue *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  TSTimeErrorValue *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 && a4 && a5 >= 1)
  {
    do
    {
      v9 = [TSTimeErrorValue alloc];
      v11 = *a3++;
      v10 = v11;
      v12 = *a4++;
      v13 = -[TSTimeErrorValue initWithTimestamp:andError:](v9, "initWithTimestamp:andError:", v10, v12);
      objc_msgSend(v8, "addObject:", v13);

      --a5;
    }
    while (a5);
  }
  return v8;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)error
{
  return self->_error;
}

@end
