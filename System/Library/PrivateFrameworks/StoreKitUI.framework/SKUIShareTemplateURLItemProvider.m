@implementation SKUIShareTemplateURLItemProvider

- (SKUIShareTemplateURLItemProvider)initWithTemplateElement:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  SKUIShareTemplateURLItemProvider *v8;
  SKUIShareTemplateURLItemProvider *v9;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIShareTemplateURLItemProvider initWithTemplateElement:].cold.1();
  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__85;
  v17 = __Block_byref_object_dispose__85;
  v18 = 0;
  objc_msgSend(v5, "activities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__SKUIShareTemplateURLItemProvider_initWithTemplateElement___block_invoke;
  v12[3] = &unk_1E73A80A0;
  v12[4] = &v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);

  v7 = v14[5];
  v11.receiver = self;
  v11.super_class = (Class)SKUIShareTemplateURLItemProvider;
  v8 = -[UIActivityItemProvider initWithPlaceholderItem:](&v11, sel_initWithPlaceholderItem_, v7);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_templateElement, a3);
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __60__SKUIShareTemplateURLItemProvider_initWithTemplateElement___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(a2, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = v6;
    objc_msgSend(v6, "URL");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = v10;
    *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
  }

}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  SKUIShareTemplateViewElement *templateElement;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  templateElement = self->_templateElement;
  -[UIActivityItemProvider activityType](self, "activityType", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShareTemplateViewElement activityForUIActivityType:](templateElement, "activityForUIActivityType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  SKUIShareTemplateViewElement *templateElement;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SKUIStyledImageDataConsumer *v17;
  id v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  v10 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__85;
  v25 = __Block_byref_object_dispose__85;
  v26 = 0;
  templateElement = self->_templateElement;
  -[UIActivityItemProvider activityType](self, "activityType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShareTemplateViewElement activityForUIActivityType:](templateElement, "activityForUIActivityType:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "image");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURL:", v15);
    objc_msgSend(v16, "setITunesStoreRequest:", 0);
    v17 = -[SKUIStyledImageDataConsumer initWithViewElement:]([SKUIStyledImageDataConsumer alloc], "initWithViewElement:", v14);
    -[SKUIStyledImageDataConsumer setImageSize:](v17, "setImageSize:", width, height);
    objc_msgSend(v16, "setDataConsumer:", v17);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __103__SKUIShareTemplateURLItemProvider_activityViewController_thumbnailImageForActivityType_suggestedSize___block_invoke;
    v20[3] = &unk_1E73A27E8;
    v20[4] = &v21;
    objc_msgSend(v16, "setOutputBlock:", v20);
    objc_msgSend(v16, "main");

  }
  v18 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v18;
}

void __103__SKUIShareTemplateURLItemProvider_activityViewController_thumbnailImageForActivityType_suggestedSize___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)item
{
  SKUIShareTemplateViewElement *templateElement;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  templateElement = self->_templateElement;
  -[UIActivityItemProvider activityType](self, "activityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShareTemplateViewElement activityForUIActivityType:](templateElement, "activityForUIActivityType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
}

- (void)initWithTemplateElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIShareTemplateURLItemProvider initWithTemplateElement:]";
}

@end
