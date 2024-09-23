@implementation SBCustomPlaceholderIcon

- (SBCustomPlaceholderIcon)initWithReason:(id)a3
{
  id v4;
  void *v5;
  SBCustomPlaceholderIcon *v6;
  uint64_t v7;
  NSString *reason;
  objc_super v10;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Placeholder: %@"), v4);
  v10.receiver = self;
  v10.super_class = (Class)SBCustomPlaceholderIcon;
  v6 = -[SBPlaceholderIcon _initWithNodeIdentifier:icon:](&v10, sel__initWithNodeIdentifier_icon_, v5, 0);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    reason = v6->_reason;
    v6->_reason = (NSString *)v7;

  }
  return v6;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
