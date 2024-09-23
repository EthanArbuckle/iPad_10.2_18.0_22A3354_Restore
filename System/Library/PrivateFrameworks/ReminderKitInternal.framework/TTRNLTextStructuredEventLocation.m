@implementation TTRNLTextStructuredEventLocation

- (TTRNLTextStructuredEventLocation)initWithRange:(_NSRange)a3 locationType:(int64_t)a4 proximity:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  TTRNLTextStructuredEventLocation *result;
  objc_super v10;

  length = a3.length;
  location = a3.location;
  v10.receiver = self;
  v10.super_class = (Class)TTRNLTextStructuredEventLocation;
  result = -[TTRNLTextStructuredEventLocation init](&v10, sel_init);
  if (result)
  {
    result->_range.location = location;
    result->_range.length = length;
    result->_locationType = a4;
    result->_proximity = a5;
  }
  return result;
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  int64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  NSRange v14;

  v3 = -[TTRNLTextStructuredEventLocation locationType](self, "locationType");
  v4 = CFSTR("unknown");
  if (v3 <= 2)
    v4 = off_1E4C0DC98[v3];
  v5 = -[TTRNLTextStructuredEventLocation proximity](self, "proximity");
  v6 = CFSTR("leave");
  if (v5 != 1)
    v6 = CFSTR("unknown");
  if (v5)
    v7 = v6;
  else
    v7 = CFSTR("enter");
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14.location = -[TTRNLTextStructuredEventLocation range](self, "range");
  NSStringFromRange(v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@ range=%@, locationType=%@, proximity=%@>"), v10, v11, v4, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int64_t)a3
{
  self->_locationType = a3;
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (void)setProximity:(int64_t)a3
{
  self->_proximity = a3;
}

@end
