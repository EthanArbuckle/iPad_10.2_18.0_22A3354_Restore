@implementation WFItemProviderEntityRequestMetadata

- (WFItemProviderEntityRequestMetadata)initWithEntity:(id)a3 metadata:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFItemProviderEntityRequestMetadata *v11;
  WFItemProviderEntityRequestMetadata *v12;
  WFItemProviderEntityRequestMetadata *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFItemProviderRequestMetadata.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entity"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFItemProviderRequestMetadata.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadata"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFItemProviderEntityRequestMetadata;
  v11 = -[WFItemProviderEntityRequestMetadata init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entity, a3);
    objc_storeStrong((id *)&v12->_metadata, a4);
    v13 = v12;
  }

  return v12;
}

- (void)fetchLinkMetadataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D44180];
  -[WFItemProviderEntityRequestMetadata metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "policyWithEntityMetadata:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  objc_msgSend(v7, "connectionWithError:", &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;
  if (v8)
  {
    v10 = objc_alloc(MEMORY[0x1E0D441C0]);
    -[WFItemProviderEntityRequestMetadata entity](self, "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithEntityIdentifiers:", v13);

    v15 = objc_alloc(MEMORY[0x1E0D44220]);
    -[WFItemProviderEntityRequestMetadata metadata](self, "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithEntityMetadata:", v16);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44150]), "initWithQueryType:target:options:", v14, v17, 0);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __71__WFItemProviderEntityRequestMetadata_fetchLinkMetadataWithCompletion___block_invoke;
    v19[3] = &unk_1E5FC61D8;
    v20 = v4;
    objc_msgSend(v8, "performConfigurableQuery:completionHandler:", v18, v19);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v9);
  }

}

- (id)registeredTypeIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[WFItemProviderEntityRequestMetadata metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transferableContentTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exportableTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_map:", &__block_literal_global_5544);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFItemProviderEntityRequestMetadata entity](self, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("entity"));

  -[WFItemProviderEntityRequestMetadata metadata](self, "metadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("metadata"));

}

- (WFItemProviderEntityRequestMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  WFItemProviderEntityRequestMetadata *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[WFItemProviderEntityRequestMetadata initWithEntity:metadata:](self, "initWithEntity:metadata:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (LNEntity)entity
{
  return self->_entity;
}

- (LNEntityMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

uint64_t __64__WFItemProviderEntityRequestMetadata_registeredTypeIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentType");
}

void __71__WFItemProviderEntityRequestMetadata_fetchLinkMetadataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  if (a2)
  {
    objc_msgSend(a2, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init((Class)getLPLinkMetadataClass());
    objc_msgSend(v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForLocaleIdentifier:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v9);

    objc_msgSend(v6, "subtitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForLocaleIdentifier:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "setSummary:", v11);
    }
    else
    {
      objc_msgSend(v6, "descriptionText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForLocaleIdentifier:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSummary:", v13);

    }
    objc_msgSend(v6, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __71__WFItemProviderEntityRequestMetadata_fetchLinkMetadataWithCompletion___block_invoke_2;
      v16[3] = &unk_1E5FC61B0;
      v17 = v7;
      v18 = *(id *)(a1 + 32);
      objc_msgSend(v15, "_retrieveImageDataWithReply:", v16);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __71__WFItemProviderEntityRequestMetadata_fetchLinkMetadataWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "_isSystem");
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v8 = (void *)getUIImageClass_softClass;
  v24 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __getUIImageClass_block_invoke;
    v19 = &unk_1E5FC8858;
    v20 = &v21;
    __getUIImageClass_block_invoke((uint64_t)&v16);
    v8 = (void *)v22[3];
  }
  v9 = v8;
  _Block_object_dispose(&v21, 8);
  v10 = v9;
  if (v7)
  {
    objc_msgSend(v5, "_name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "systemImageNamed:", v11);
  }
  else
  {
    objc_msgSend(v5, "_imageData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithData:", v11);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2050000000;
    v13 = (void *)getLPImageClass_softClass;
    v24 = getLPImageClass_softClass;
    if (!getLPImageClass_softClass)
    {
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __getLPImageClass_block_invoke;
      v19 = &unk_1E5FC8858;
      v20 = &v21;
      __getLPImageClass_block_invoke((uint64_t)&v16);
      v13 = (void *)v22[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v21, 8);
    v15 = (void *)objc_msgSend([v14 alloc], "initWithPlatformImage:", v12);
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v15);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
