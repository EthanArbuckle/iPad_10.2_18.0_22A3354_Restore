@implementation RAPWebBundlePlaceSummaryContext

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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePlaceSummaryContext identifier](self, "identifier"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePlaceSummaryContext identifier](self, "identifier"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("id"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePlaceSummaryContext title](self, "title"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePlaceSummaryContext title](self, "title"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("title"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePlaceSummaryContext subtitle](self, "subtitle"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePlaceSummaryContext subtitle](self, "subtitle"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("subtitle"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePlaceSummaryContext address](self, "address"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePlaceSummaryContext address](self, "address"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("formattedAddress"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePlaceSummaryContext imageContext](self, "imageContext"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundlePlaceSummaryContext imageContext](self, "imageContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "context"));
    objc_msgSend(v3, "addEntriesFromDictionary:", v14);

  }
  v15 = objc_msgSend(v3, "copy");

  return (NSDictionary *)v15;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (RAPWebBundleImageContext)imageContext
{
  return self->_imageContext;
}

- (void)setImageContext:(id)a3
{
  objc_storeStrong((id *)&self->_imageContext, a3);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_imageContext, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
