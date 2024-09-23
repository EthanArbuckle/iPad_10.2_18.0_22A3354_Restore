@implementation TUConversationPresentationContext

- (TUConversationPresentationContext)init
{
  TUConversationPresentationContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUConversationPresentationContext;
  result = -[TUConversationPresentationContext init](&v3, sel_init);
  if (result)
    result->_mode = 0;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationPresentationContext)initWithCoder:(id)a3
{
  id v4;
  TUConversationPresentationContext *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUConversationPresentationContext;
  v5 = -[TUConversationPresentationContext init](&v8, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_mode);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mode = objc_msgSend(v4, "decodeIntegerForKey:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v5 = -[TUConversationPresentationContext mode](self, "mode");
  NSStringFromSelector(sel_mode);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setMode:", -[TUConversationPresentationContext mode](self, "mode"));
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" mode=%zu"), -[TUConversationPresentationContext mode](self, "mode"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  TUConversationPresentationContext *v4;
  BOOL v5;

  v4 = (TUConversationPresentationContext *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUConversationPresentationContext isEqualToPresentationContext:](self, "isEqualToPresentationContext:", v4);
  }

  return v5;
}

- (BOOL)isEqualToPresentationContext:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[TUConversationPresentationContext mode](self, "mode");
  v6 = objc_msgSend(v4, "mode");

  return v5 == v6;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

@end
