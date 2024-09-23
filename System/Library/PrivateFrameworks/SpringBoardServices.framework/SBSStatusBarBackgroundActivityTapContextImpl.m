@implementation SBSStatusBarBackgroundActivityTapContextImpl

- (SBSStatusBarBackgroundActivityTapContextImpl)initWithBackgroundActivityIdentifier:(id)a3
{
  id v5;
  SBSStatusBarBackgroundActivityTapContextImpl *v6;
  SBSStatusBarBackgroundActivityTapContextImpl *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSStatusBarBackgroundActivityTapContextImpl;
  v6 = -[SBSStatusBarBackgroundActivityTapContextImpl init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backgroundActivityIdentifier, a3);

  return v7;
}

- (SBSStatusBarBackgroundActivityTapContextImpl)initWithCoder:(id)a3
{
  id v4;
  SBSStatusBarBackgroundActivityTapContextImpl *v5;
  uint64_t v6;
  NSString *backgroundActivityIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSStatusBarBackgroundActivityTapContextImpl;
  v5 = -[SBSStatusBarBackgroundActivityTapContextImpl init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSBSStatusBarTapContextBackgroundActivityIdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    backgroundActivityIdentifier = v5->_backgroundActivityIdentifier;
    v5->_backgroundActivityIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_backgroundActivityIdentifier, CFSTR("kSBSStatusBarTapContextBackgroundActivityIdentifierKey"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)backgroundActivityIdentifier
{
  return self->_backgroundActivityIdentifier;
}

- (void)setBackgroundActivityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)styleOverride
{
  return self->_styleOverride;
}

- (void)setStyleOverride:(unint64_t)a3
{
  self->_styleOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundActivityIdentifier, 0);
}

@end
