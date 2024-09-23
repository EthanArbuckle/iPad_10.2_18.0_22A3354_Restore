@implementation SKUIReportAConcernTemplateViewElement

- (SKUIReportAConcernTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIReportAConcernTemplateViewElement *v11;
  void *v12;
  uint64_t v13;
  NSURL *reportConcernURL;
  void *v15;
  uint64_t v16;
  NSString *reportConcernExplanation;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReportAConcernTemplateViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIReportAConcernTemplateViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v19, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("src"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    reportConcernURL = v11->_reportConcernURL;
    v11->_reportConcernURL = (NSURL *)v13;

    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_itemIdentifier = objc_msgSend(v15, "longLongValue");

    objc_msgSend(v8, "getAttribute:", CFSTR("data-explanation"));
    v16 = objc_claimAutoreleasedReturnValue();
    reportConcernExplanation = v11->_reportConcernExplanation;
    v11->_reportConcernExplanation = (NSString *)v16;

  }
  return v11;
}

- (NSArray)reasonElements
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SKUIReportAConcernTemplateViewElement_reasonElements__block_invoke;
  v7[3] = &unk_1E73A12A8;
  v8 = v3;
  v4 = v3;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

void __55__SKUIReportAConcernTemplateViewElement_reasonElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (NSURL)reportConcernURL
{
  return self->_reportConcernURL;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)reportConcernExplanation
{
  return self->_reportConcernExplanation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportConcernExplanation, 0);
  objc_storeStrong((id *)&self->_reportConcernURL, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIReportAConcernTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
