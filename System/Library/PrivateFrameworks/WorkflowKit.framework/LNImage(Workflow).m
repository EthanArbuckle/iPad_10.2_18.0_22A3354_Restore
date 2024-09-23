@implementation LNImage(Workflow)

- (id)wf_image
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__12178;
  v23 = __Block_byref_object_dispose__12179;
  v24 = 0;
  v2 = dispatch_semaphore_create(0);
  objc_msgSend(a1, "inImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __29__LNImage_Workflow__wf_image__block_invoke;
  v16 = &unk_1E7AED6F0;
  v18 = &v19;
  v4 = v2;
  v17 = v4;
  objc_msgSend(v3, "wf_transformUsingCodableAttribute:completionHandler:", 0, &v13);

  v5 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v4, v5);
  objc_msgSend((id)v20[5], "wf_image", v13, v14, v15, v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "inImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_renderingMode");

  if (v8)
  {
    if (v8 == 2)
      v9 = 2;
    else
      v9 = v8 == 1;
    objc_msgSend(v6, "imageWithRenderingMode:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  objc_msgSend(v6, "imageWithDisplayStyle:", objc_msgSend(a1, "wfImageDisplayStyleFromLNImageDisplayStyle:", objc_msgSend(a1, "displayStyle")));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v19, 8);
  return v11;
}

- (BOOL)wfImageDisplayStyleFromLNImageDisplayStyle:()Workflow
{
  return a3 == 1;
}

- (id)contextualActionIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  dispatch_semaphore_t v15;
  NSObject *v16;
  dispatch_time_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  intptr_t (*v21)(uint64_t, void *);
  void *v22;
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  objc_msgSend(a1, "inImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_isSystem"))
  {
    objc_msgSend(v2, "_name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0DC7A68];
      objc_msgSend(v2, "_name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "iconWithSystemName:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
  }
  objc_msgSend(a1, "displayStyle");
  v7 = WFContextualActionIconDisplayStyleForLNImageDisplayStyle();
  objc_msgSend(v2, "_imageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0DC7A68];
    objc_msgSend(v2, "_imageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconWithImageData:scale:displayStyle:", v10, v7, 0.0);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v6 = (void *)v11;

    goto LABEL_9;
  }
  objc_msgSend(v2, "_uri");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0DC7A68];
    objc_msgSend(v2, "_uri");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "iconWithImageURL:displayStyle:", v10, v7);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__12178;
  v29 = __Block_byref_object_dispose__12179;
  v30 = 0;
  v15 = dispatch_semaphore_create(0);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __41__LNImage_Workflow__contextualActionIcon__block_invoke;
  v22 = &unk_1E7AED6F0;
  v24 = &v25;
  v16 = v15;
  v23 = v16;
  objc_msgSend(v2, "wf_transformUsingCodableAttribute:completionHandler:", 0, &v19);
  v17 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v16, v17);
  v18 = v26[5];
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0DC7A68], "iconWithImageData:scale:displayStyle:", v18, v7, 0.0, v19, v20, v21, v22);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  _Block_object_dispose(&v25, 8);
LABEL_9:

  return v6;
}

- (id)spotlightIconWithParameterIdentifier:()Workflow
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  objc_msgSend(a1, "inImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayStyle");
  v6 = (void *)WFContextualActionIconDisplayStyleForLNImageDisplayStyle();
  if (objc_msgSend(v5, "_isSystem")
    && (objc_msgSend(v5, "_name"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v5, "_imageData"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_5;
  }
  objc_msgSend(v5, "_uri");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_5;
  if (v4)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC7A68]), "initWithLNPropertyIdentifier:displayStyle:", v4, v6);
    goto LABEL_6;
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12178;
  v25 = __Block_byref_object_dispose__12179;
  v26 = 0;
  v11 = dispatch_semaphore_create(0);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __58__LNImage_Workflow__spotlightIconWithParameterIdentifier___block_invoke;
  v18 = &unk_1E7AED718;
  v20 = &v21;
  v12 = v11;
  v19 = v12;
  objc_msgSend(v5, "_retrieveImageFilePathWithReply:", &v15);
  v13 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v12, v13);
  v14 = v22[5];
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0DC7A68], "iconWithImageURL:displayStyle:", v22[5], v6, v15, v16, v17, v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v21, 8);
  if (!v14)
  {
LABEL_5:
    objc_msgSend(a1, "contextualActionIcon", v15, v16, v17, v18);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v6 = (void *)v8;
  }

  return v6;
}

- (id)initWithSerializedRepresentation:()Workflow variableProvider:parameter:
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CBD9B8]);
    -[NSObject decodeObjectOfClass:from:](v7, "decodeObjectOfClass:from:", objc_opt_class(), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      a1 = (id)objc_msgSend(a1, "initWithINImage:", v8);
      v9 = a1;
    }
    else
    {
      getWFAppIntentsLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315138;
        v13 = "-[LNImage(Workflow) initWithSerializedRepresentation:variableProvider:parameter:]";
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to decode INImage from serialized representation.", (uint8_t *)&v12, 0xCu);
      }

      v9 = 0;
    }

  }
  else
  {
    getWFAppIntentsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[LNImage(Workflow) initWithSerializedRepresentation:variableProvider:parameter:]";
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Failed to decode INImage: no dictionaryRepresentation was provided.", (uint8_t *)&v12, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (id)serializedRepresentation
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "inImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CBD9C0]);
    objc_msgSend(v2, "encodeObject:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      getWFAppIntentsLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v8 = 136315138;
        v9 = "-[LNImage(Workflow) serializedRepresentation]";
        _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_ERROR, "%s Failed to encode INImage into serialized representation.", (uint8_t *)&v8, 0xCu);
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
