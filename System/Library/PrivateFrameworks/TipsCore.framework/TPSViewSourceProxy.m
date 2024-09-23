@implementation TPSViewSourceProxy

+ (id)proxyWithViewMethod:(id)a3
{
  id v3;
  TPSViewSourceProxy *v4;

  v3 = a3;
  v4 = objc_alloc_init(TPSViewSourceProxy);
  -[TPSViewSourceProxy setViewMethod:](v4, "setViewMethod:", v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSString)viewMethod
{
  return self->_viewMethod;
}

- (void)setViewMethod:(id)a3
{
  objc_storeStrong((id *)&self->_viewMethod, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewMethod, 0);
}

@end
