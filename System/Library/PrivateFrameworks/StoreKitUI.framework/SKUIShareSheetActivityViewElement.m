@implementation SKUIShareSheetActivityViewElement

- (SKUIShareSheetActivityViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIShareSheetActivityViewElement *v11;
  uint64_t v12;
  NSString *activityType;
  void *v14;
  uint64_t v15;
  NSURL *contentSourceURL;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIShareSheetActivityViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIShareSheetActivityViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v18, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v12 = objc_claimAutoreleasedReturnValue();
    activityType = v11->_activityType;
    v11->_activityType = (NSString *)v12;

    objc_msgSend(v8, "getAttribute:", CFSTR("src"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v14);
      contentSourceURL = v11->_contentSourceURL;
      v11->_contentSourceURL = (NSURL *)v15;

    }
  }

  return v11;
}

- (SKUIImageViewElement)image
{
  return (SKUIImageViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 49);
}

- (SKUILabelViewElement)message
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__61;
  v9 = __Block_byref_object_dispose__61;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__SKUIShareSheetActivityViewElement_message__block_invoke;
  v4[3] = &unk_1E73A01D0;
  v4[4] = &v5;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUILabelViewElement *)v2;
}

void __44__SKUIShareSheetActivityViewElement_message__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138 && objc_msgSend(v6, "labelViewStyle") != 5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (SKUILabelViewElement)title
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__61;
  v9 = __Block_byref_object_dispose__61;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SKUIShareSheetActivityViewElement_title__block_invoke;
  v4[3] = &unk_1E73A01D0;
  v4[4] = &v5;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUILabelViewElement *)v2;
}

void __42__SKUIShareSheetActivityViewElement_title__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138 && objc_msgSend(v6, "labelViewStyle") == 5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (SKUIURLViewElement)URL
{
  return (SKUIURLViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 151);
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIShareSheetActivityViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *activityType;
  NSURL *v9;
  NSURL *contentSourceURL;
  objc_super v12;

  v4 = (SKUIShareSheetActivityViewElement *)a3;
  v12.receiver = self;
  v12.super_class = (Class)SKUIShareSheetActivityViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v12, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SKUIShareSheetActivityViewElement activityType](v4, "activityType");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    activityType = self->_activityType;
    self->_activityType = v7;

    -[SKUIShareSheetActivityViewElement contentSourceURL](v4, "contentSourceURL");
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    contentSourceURL = self->_contentSourceURL;
    self->_contentSourceURL = v9;

  }
  return v6;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSURL)contentSourceURL
{
  return self->_contentSourceURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentSourceURL, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIShareSheetActivityViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
