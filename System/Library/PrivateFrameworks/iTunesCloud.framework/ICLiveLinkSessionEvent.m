@implementation ICLiveLinkSessionEvent

- (ICLiveLinkSessionEvent)initWithKind:(int64_t)a3
{
  ICLiveLinkSessionEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICLiveLinkSessionEvent;
  result = -[ICLiveLinkSessionEvent init](&v5, sel_init);
  if (result)
    result->_kind = a3;
  return result;
}

- (id)description
{
  void *v3;
  unint64_t kind;
  __CFString *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  kind = self->_kind;
  if (kind >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown/kind=%ld"), self->_kind);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E438F568[kind];
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<ICLiveLinkSessionEvent: %p kind=%@>"), self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)kind
{
  return self->_kind;
}

@end
