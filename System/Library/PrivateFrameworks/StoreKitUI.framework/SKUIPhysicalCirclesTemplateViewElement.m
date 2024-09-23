@implementation SKUIPhysicalCirclesTemplateViewElement

- (SKUIPhysicalCirclesTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIPhysicalCirclesTemplateViewElement *v11;
  SKUIPhysicalCirclesTemplateViewElement *v12;
  uint64_t v13;
  SKUIPhysicalCirclesTemplateDOMFeature *scriptInterface;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPhysicalCirclesTemplateViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIPhysicalCirclesTemplateViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    -[SKUIViewElement featureWithName:](v11, "featureWithName:", 0x1E73B3A10);
    v13 = objc_claimAutoreleasedReturnValue();
    scriptInterface = v12->_scriptInterface;
    v12->_scriptInterface = (SKUIPhysicalCirclesTemplateDOMFeature *)v13;

  }
  return v12;
}

- (NSArray)circleItemElements
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__SKUIPhysicalCirclesTemplateViewElement_circleItemElements__block_invoke;
  v6[3] = &unk_1E73A12A8;
  v4 = v3;
  v7 = v4;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

  return (NSArray *)v4;
}

void __60__SKUIPhysicalCirclesTemplateViewElement_circleItemElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 59)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void)dispatchRemovedEventWithChildViewElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  -[SKUIPhysicalCirclesTemplateDOMFeature appContext](self->_scriptInterface, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIPhysicalCirclesTemplateViewElement appDocument](self, "appDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__SKUIPhysicalCirclesTemplateViewElement_dispatchRemovedEventWithChildViewElement___block_invoke;
  v10[3] = &unk_1E73A49D8;
  v7 = v6;
  v11 = v7;
  v8 = v4;
  v12 = v8;
  v9 = v5;
  v13 = v9;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v9, "evaluate:completionBlock:", v10, 0);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __83__SKUIPhysicalCirclesTemplateViewElement_dispatchRemovedEventWithChildViewElement___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "retrieveJSElementForViewElement:jsContext:", *(_QWORD *)(a1 + 40), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __83__SKUIPhysicalCirclesTemplateViewElement_dispatchRemovedEventWithChildViewElement___block_invoke_2;
    v6[3] = &unk_1E73A49B0;
    objc_copyWeak(&v8, (id *)(a1 + 56));
    v7 = v4;
    objc_msgSend(v5, "evaluateDelegateBlockSync:", v6);

    objc_destroyWeak(&v8);
  }

}

void __83__SKUIPhysicalCirclesTemplateViewElement_dispatchRemovedEventWithChildViewElement___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v5 = CFSTR("removed");
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 15, 1, 1, v4, 0);

}

- (SKUIPaletteViewElement)footerPaletteElement
{
  return (SKUIPaletteViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 75);
}

- (SKUILabelViewElement)subtitleElement
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
  v8 = __Block_byref_object_copy__36;
  v9 = __Block_byref_object_dispose__36;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__SKUIPhysicalCirclesTemplateViewElement_subtitleElement__block_invoke;
  v4[3] = &unk_1E73A01D0;
  v4[4] = &v5;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUILabelViewElement *)v2;
}

void __57__SKUIPhysicalCirclesTemplateViewElement_subtitleElement__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138 && objc_msgSend(v6, "labelViewStyle") == 4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (SKUILabelViewElement)titleElement
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
  v8 = __Block_byref_object_copy__36;
  v9 = __Block_byref_object_dispose__36;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__SKUIPhysicalCirclesTemplateViewElement_titleElement__block_invoke;
  v4[3] = &unk_1E73A01D0;
  v4[4] = &v5;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUILabelViewElement *)v2;
}

void __54__SKUIPhysicalCirclesTemplateViewElement_titleElement__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138 && objc_msgSend(v6, "labelViewStyle") == 5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

+ (id)supportedFeatures
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E73B3A10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SKUIPhysicalCirclesTemplateDOMFeature)scriptInterface
{
  return self->_scriptInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptInterface, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPhysicalCirclesTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
