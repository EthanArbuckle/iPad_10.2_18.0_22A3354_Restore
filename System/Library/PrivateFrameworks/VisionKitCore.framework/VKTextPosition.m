@implementation VKTextPosition

- (VKTextPosition)initWithOffset:(int64_t)a3
{
  VKTextPosition *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKTextPosition;
  result = -[VKTextPosition init](&v5, sel_init);
  if (result)
    result->_offset = a3;
  return result;
}

+ (VKTextPosition)positionWithOffset:(int64_t)a3
{
  return -[VKTextPosition initWithOffset:]([VKTextPosition alloc], "initWithOffset:", a3);
}

- (id)positionByAddingOffset:(int64_t)a3
{
  int64_t v4;

  v4 = -[VKTextPosition offset](self, "offset");
  return -[VKTextPosition initWithOffset:]([VKTextPosition alloc], "initWithOffset:", (v4 + a3) & ~((v4 + a3) >> 63));
}

+ (VKTextPosition)zeroPosition
{
  return (VKTextPosition *)objc_msgSend(a1, "positionWithOffset:", 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  v5 = objc_opt_class();
  VKDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "offset");
    v8 = v7 == -[VKTextPosition offset](self, "offset");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)summaryDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Position: %ld"), -[VKTextPosition offset](self, "offset"));
}

- (int64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(int64_t)a3
{
  self->_offset = a3;
}

@end
