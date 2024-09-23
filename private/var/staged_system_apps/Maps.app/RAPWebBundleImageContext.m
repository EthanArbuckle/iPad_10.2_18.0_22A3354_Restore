@implementation RAPWebBundleImageContext

- (NSDictionary)context
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleImageContext identifier](self, "identifier"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleImageContext identifier](self, "identifier"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("icon"));

  }
  v6 = objc_msgSend(v3, "copy");

  return (NSDictionary *)v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
