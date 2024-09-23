@implementation PXStoryAutoEditModule

- (PXStoryAutoEditModule)initWithModuleType:(int64_t)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  PXStoryAutoEditModule *result;
  objc_super v8;

  length = a4.length;
  location = a4.location;
  v8.receiver = self;
  v8.super_class = (Class)PXStoryAutoEditModule;
  result = -[PXStoryAutoEditModule init](&v8, sel_init);
  if (result)
  {
    result->_moduleType = a3;
    result->_range.location = location;
    result->_range.length = length;
  }
  return result;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  unint64_t moduleType;
  __CFString *v6;
  __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  moduleType = self->_moduleType;
  if (moduleType > 3)
    v6 = CFSTR("??");
  else
    v6 = off_1E511F160[moduleType];
  v7 = v6;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p type:%@ [%ld...%ld]>"), v4, self, v7, self->_range.location, self->_range.length + self->_range.location);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)moduleType
{
  return self->_moduleType;
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

@end
