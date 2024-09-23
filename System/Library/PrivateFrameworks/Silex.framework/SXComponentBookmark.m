@implementation SXComponentBookmark

- (SXComponentBookmark)initWithComponentIdentifier:(id)a3
{
  id v4;
  SXComponentBookmark *v5;
  uint64_t v6;
  NSString *componentIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXComponentBookmark;
  v5 = -[SXComponentBookmark init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    componentIdentifier = v5->_componentIdentifier;
    v5->_componentIdentifier = (NSString *)v6;

  }
  return v5;
}

- (NSString)componentIdentifier
{
  return self->_componentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
}

@end
