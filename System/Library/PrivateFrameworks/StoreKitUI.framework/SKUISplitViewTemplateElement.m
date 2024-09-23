@implementation SKUISplitViewTemplateElement

- (SKUISplitViewTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUISplitViewTemplateElement *v11;
  SKUISplitViewTemplateElement *v12;
  uint64_t v13;
  SKUIJSDOMFeatureNavigationDocument *leftNavigationDocument;
  uint64_t v15;
  SKUIJSDOMFeatureNavigationDocument *rightNavigationDocument;
  void *v17;
  uint64_t v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISplitViewTemplateElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUISplitViewTemplateElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v20, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    -[SKUIViewElement featureWithName:](v11, "featureWithName:", 0x1E73BBD90);
    v13 = objc_claimAutoreleasedReturnValue();
    leftNavigationDocument = v12->_leftNavigationDocument;
    v12->_leftNavigationDocument = (SKUIJSDOMFeatureNavigationDocument *)v13;

    -[SKUIViewElement featureWithName:](v12, "featureWithName:", 0x1E73BBDB0);
    v15 = objc_claimAutoreleasedReturnValue();
    rightNavigationDocument = v12->_rightNavigationDocument;
    v12->_rightNavigationDocument = (SKUIJSDOMFeatureNavigationDocument *)v15;

    objc_msgSend(v8, "getAttribute:", CFSTR("displayMode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("all")))
    {
      v18 = 2;
    }
    else if (objc_msgSend(v17, "isEqualToString:", CFSTR("hidden")))
    {
      v18 = 1;
    }
    else
    {
      if (!objc_msgSend(v17, "isEqualToString:", CFSTR("overlay")))
      {
        v12->_preferredDisplayMode = 0;
        goto LABEL_13;
      }
      v18 = 3;
    }
    v12->_preferredDisplayMode = v18;
LABEL_13:

  }
  return v12;
}

- (SKUIJSDOMFeatureNavigationDocument)leftNavigationDocument
{
  return self->_leftNavigationDocument;
}

- (SKUIViewElement)leftSplitElement
{
  return (SKUIViewElement *)-[SKUISplitViewTemplateElement _splitElementForIndex:](self, "_splitElementForIndex:", 0);
}

- (SKUIJSDOMFeatureNavigationDocument)rightNavigationDocument
{
  return self->_rightNavigationDocument;
}

- (SKUIViewElement)rightSplitElement
{
  return (SKUIViewElement *)-[SKUISplitViewTemplateElement _splitElementForIndex:](self, "_splitElementForIndex:", 1);
}

- (BOOL)usesInlineSplitContent
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[SKUISplitViewTemplateElement leftSplitElement](self, "leftSplitElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    -[SKUISplitViewTemplateElement rightSplitElement](self, "rightSplitElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "count") != 0;

  }
  return v5;
}

+ (id)supportedFeatures
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E73BBD90;
  v3[1] = 0x1E73BBDB0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUISplitViewTemplateElement *v4;
  SKUISplitViewTemplateElement *v5;
  SKUISplitViewTemplateElement *v6;
  objc_super v8;

  v4 = (SKUISplitViewTemplateElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUISplitViewTemplateElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUISplitViewTemplateElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
    self->_preferredDisplayMode = -[SKUISplitViewTemplateElement preferredDisplayMode](v4, "preferredDisplayMode");

  return v6;
}

- (id)_splitElementForIndex:(int64_t)a3
{
  void *v4;
  id v5;
  _QWORD v7[7];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__29;
  v13 = __Block_byref_object_dispose__29;
  v14 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  -[SKUISplitViewTemplateElement children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SKUISplitViewTemplateElement__splitElementForIndex___block_invoke;
  v7[3] = &unk_1E73A3F78;
  v7[5] = &v9;
  v7[6] = a3;
  v7[4] = v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = (id)v10[5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __54__SKUISplitViewTemplateElement__splitElementForIndex___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "elementType") == 128)
  {
    v7 = *(_QWORD *)(a1[4] + 8);
    v8 = *(_QWORD *)(v7 + 24);
    if (v8 == a1[6])
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
      *a4 = 1;
      v7 = *(_QWORD *)(a1[4] + 8);
      v8 = *(_QWORD *)(v7 + 24);
    }
    *(_QWORD *)(v7 + 24) = v8 + 1;
  }

}

- (int64_t)preferredDisplayMode
{
  return self->_preferredDisplayMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightNavigationDocument, 0);
  objc_storeStrong((id *)&self->_leftNavigationDocument, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISplitViewTemplateElement initWithDOMElement:parent:elementFactory:]";
}

@end
