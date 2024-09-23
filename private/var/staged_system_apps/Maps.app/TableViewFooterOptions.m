@implementation TableViewFooterOptions

+ (id)defaultRAPUserContentOptions
{
  return objc_alloc_init(TableViewFooterOptions);
}

- (TableViewFooterOptions)init
{
  TableViewFooterOptions *v2;
  TableViewFooterOptions *v3;
  uint64_t v4;
  NSString *labelText;
  uint64_t v6;
  NSString *linkText;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TableViewFooterOptions;
  v2 = -[TableViewFooterOptions init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[TableViewFooterOptions _defaultRAPUserContentLabelText](v2, "_defaultRAPUserContentLabelText"));
    labelText = v3->_labelText;
    v3->_labelText = (NSString *)v4;

    v6 = objc_claimAutoreleasedReturnValue(-[TableViewFooterOptions _defaultRAPUserContentLinkText](v3, "_defaultRAPUserContentLinkText"));
    linkText = v3->_linkText;
    v3->_linkText = (NSString *)v6;

  }
  return v3;
}

- (id)_defaultRAPUserContentLabelText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Legal RAP String"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)_defaultRAPUserContentLinkText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[RAP] See how your data is managed…"), CFSTR("localized string not found"), 0));

  return v3;
}

- (NSString)labelText
{
  return self->_labelText;
}

- (void)setLabelText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)linkText
{
  return self->_linkText;
}

- (void)setLinkText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkText, 0);
  objc_storeStrong((id *)&self->_labelText, 0);
}

@end
