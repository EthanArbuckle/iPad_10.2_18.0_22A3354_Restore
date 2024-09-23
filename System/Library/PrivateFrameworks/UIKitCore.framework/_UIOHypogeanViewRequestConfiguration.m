@implementation _UIOHypogeanViewRequestConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIOHypogeanViewRequestConfiguration)initWithCoder:(id)a3
{
  id v4;
  _UIOHypogeanViewRequestConfiguration *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIOHypogeanViewRequestConfiguration;
  v5 = -[_UIOHypogeanViewRequestConfiguration init](&v8, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_type);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v4;
  id v5;

  type = self->_type;
  v4 = a3;
  NSStringFromSelector(sel_type);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", type, v5);

}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end
