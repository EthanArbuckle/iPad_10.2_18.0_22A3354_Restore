@implementation TUNeighborhoodHandoffContext

- (TUNeighborhoodHandoffContext)initWithHandoffType:(int64_t)a3
{
  TUNeighborhoodHandoffContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUNeighborhoodHandoffContext;
  result = -[TUNeighborhoodHandoffContext init](&v5, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_pullContext = 0;
  }
  return result;
}

- (TUNeighborhoodHandoffContext)initWithPullContext:(int64_t)a3
{
  TUNeighborhoodHandoffContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUNeighborhoodHandoffContext;
  result = -[TUNeighborhoodHandoffContext init](&v5, sel_init);
  if (result)
  {
    result->_type = 1;
    result->_pullContext = a3;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_type - 1;
  if (v7 > 3)
    v8 = CFSTR("Unknown");
  else
    v8 = off_1E38A1AE8[v7];
  objc_msgSend(v6, "appendFormat:", CFSTR(" type=%@"), v8);
  v9 = self->_pullContext - 1;
  if (v9 > 4)
    v10 = CFSTR("Unknown");
  else
    v10 = off_1E38A1B08[v9];
  objc_msgSend(v6, "appendFormat:", CFSTR(" pullContext=%@"), v10);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v11 = (void *)objc_msgSend(v6, "copy");

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUNeighborhoodHandoffContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  NSStringFromSelector(sel_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", v5);

  NSStringFromSelector(sel_pullContext);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", v7);

  if (v6 == 1)
    return -[TUNeighborhoodHandoffContext initWithPullContext:](self, "initWithPullContext:", v8);
  else
    return -[TUNeighborhoodHandoffContext initWithHandoffType:](self, "initWithHandoffType:", v6);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;
  void *v6;
  int64_t pullContext;
  id v8;

  type = self->_type;
  v5 = a3;
  NSStringFromSelector(sel_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", type, v6);

  pullContext = self->_pullContext;
  NSStringFromSelector(sel_pullContext);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", pullContext, v8);

}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)pullContext
{
  return self->_pullContext;
}

@end
