@implementation SKUISearchBarViewElement

- (SKUISearchBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUISearchBarViewElement *v11;
  uint64_t v12;
  NSString *accessoryText;
  uint64_t v14;
  SKUIViewElementText *defaultText;
  uint64_t v16;
  NSString *placeholderString;
  uint64_t v18;
  NSString *searchHintsURLString;
  uint64_t v20;
  NSString *trendingSearchURLString;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISearchBarViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUISearchBarViewElement;
  v11 = -[SKUIInputViewElement initWithDOMElement:parent:elementFactory:](&v23, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("accessoryText"));
    v12 = objc_claimAutoreleasedReturnValue();
    accessoryText = v11->_accessoryText;
    v11->_accessoryText = (NSString *)v12;

    +[IKTextParser textWithDOMElement:usingParseBlock:](SKUIViewElementText, "textWithDOMElement:usingParseBlock:", v8, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    defaultText = v11->_defaultText;
    v11->_defaultText = (SKUIViewElementText *)v14;

    objc_msgSend(v8, "getAttribute:", CFSTR("placeholder"));
    v16 = objc_claimAutoreleasedReturnValue();
    placeholderString = v11->_placeholderString;
    v11->_placeholderString = (NSString *)v16;

    objc_msgSend(v8, "getAttribute:", CFSTR("searchHints"));
    v18 = objc_claimAutoreleasedReturnValue();
    searchHintsURLString = v11->_searchHintsURLString;
    v11->_searchHintsURLString = (NSString *)v18;

    objc_msgSend(v8, "getAttribute:", CFSTR("trendingSearch"));
    v20 = objc_claimAutoreleasedReturnValue();
    trendingSearchURLString = v11->_trendingSearchURLString;
    v11->_trendingSearchURLString = (NSString *)v20;

  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUISearchBarViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *accessoryText;
  SKUIViewElementText *v9;
  SKUIViewElementText *defaultText;
  NSString *v11;
  NSString *placeholderString;
  NSString *v13;
  NSString *searchHintsURLString;
  NSString *v15;
  NSString *trendingSearchURLString;
  objc_super v18;

  v4 = (SKUISearchBarViewElement *)a3;
  v18.receiver = self;
  v18.super_class = (Class)SKUISearchBarViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v18, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SKUISearchBarViewElement accessoryText](v4, "accessoryText");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    accessoryText = self->_accessoryText;
    self->_accessoryText = v7;

    -[SKUISearchBarViewElement defaultText](v4, "defaultText");
    v9 = (SKUIViewElementText *)objc_claimAutoreleasedReturnValue();
    defaultText = self->_defaultText;
    self->_defaultText = v9;

    -[SKUISearchBarViewElement placeholderString](v4, "placeholderString");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    placeholderString = self->_placeholderString;
    self->_placeholderString = v11;

    -[SKUISearchBarViewElement searchHintsURLString](v4, "searchHintsURLString");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    searchHintsURLString = self->_searchHintsURLString;
    self->_searchHintsURLString = v13;

    -[SKUISearchBarViewElement trendingSearchURLString](v4, "trendingSearchURLString");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    trendingSearchURLString = self->_trendingSearchURLString;
    self->_trendingSearchURLString = v15;

  }
  return v6;
}

- (unint64_t)elementType
{
  return 106;
}

- (int64_t)pageComponentType
{
  return 25;
}

- (NSString)accessoryText
{
  return self->_accessoryText;
}

- (SKUIViewElementText)defaultText
{
  return self->_defaultText;
}

- (NSString)placeholderString
{
  return self->_placeholderString;
}

- (NSString)searchHintsURLString
{
  return self->_searchHintsURLString;
}

- (NSString)trendingSearchURLString
{
  return self->_trendingSearchURLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendingSearchURLString, 0);
  objc_storeStrong((id *)&self->_searchHintsURLString, 0);
  objc_storeStrong((id *)&self->_placeholderString, 0);
  objc_storeStrong((id *)&self->_defaultText, 0);
  objc_storeStrong((id *)&self->_accessoryText, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISearchBarViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
