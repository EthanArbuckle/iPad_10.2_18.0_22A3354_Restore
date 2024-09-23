@implementation RAPWebBundleTransitLineContext

- (NSDictionary)context
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleTransitLineContext name](self, "name"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleTransitLineContext name](self, "name"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("name"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleTransitLineContext identifier](self, "identifier"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleTransitLineContext identifier](self, "identifier"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("muid"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleTransitLineContext imageContext](self, "imageContext"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleTransitLineContext imageContext](self, "imageContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("artworkURL"));

  }
  v11 = objc_msgSend(v3, "copy");

  return (NSDictionary *)v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RAPWebBundleImageContext)imageContext
{
  return self->_imageContext;
}

- (void)setImageContext:(id)a3
{
  objc_storeStrong((id *)&self->_imageContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageContext, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
