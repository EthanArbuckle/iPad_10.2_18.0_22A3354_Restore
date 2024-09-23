@implementation SKUIReportAConcernReasonViewElement

- (SKUIReportAConcernReasonViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIReportAConcernReasonViewElement *v11;
  void *v12;
  uint64_t v13;
  NSNumber *reasonID;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *name;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReportAConcernReasonViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIReportAConcernReasonViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v20, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "integerValue"));
    v13 = objc_claimAutoreleasedReturnValue();
    reasonID = v11->_reasonID;
    v11->_reasonID = (NSNumber *)v13;

    objc_msgSend(v8, "getAttribute:", CFSTR("data-uppercase-name"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
      v16 = v15;
    else
      v16 = 0;
    objc_storeStrong((id *)&v11->_uppercaseName, v16);
    objc_msgSend(v8, "textContent");
    v17 = objc_claimAutoreleasedReturnValue();
    name = v11->_name;
    v11->_name = (NSString *)v17;

  }
  return v11;
}

- (NSNumber)reasonID
{
  return self->_reasonID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)uppercaseName
{
  return self->_uppercaseName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uppercaseName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_reasonID, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIReportAConcernReasonViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
