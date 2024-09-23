@implementation LNISIconImage(Workflow)

- (void)wf_image
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v2 = objc_msgSend(a1, "iconType");
  if (v2 == 1)
  {
    v6 = objc_alloc((Class)getISIconClass());
    objc_msgSend(a1, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "initWithType:", v4);
    goto LABEL_5;
  }
  if (!v2)
  {
    v3 = objc_alloc((Class)getISIconClass());
    objc_msgSend(a1, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithBundleIdentifier:", v4);
LABEL_5:
    v7 = (void *)v5;

    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:
  v25 = 0;
  v26 = &v25;
  v27 = 0x2050000000;
  v8 = (void *)getISImageDescriptorClass_softClass;
  v28 = getISImageDescriptorClass_softClass;
  if (!getISImageDescriptorClass_softClass)
  {
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = (uint64_t)__getISImageDescriptorClass_block_invoke;
    v23 = &unk_1E7AF9520;
    v24 = &v25;
    __getISImageDescriptorClass_block_invoke((uint64_t)&v20);
    v8 = (void *)v26[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v25, 8);
  v20 = 0;
  v21 = (uint64_t)&v20;
  v22 = 0x2020000000;
  v10 = (_QWORD *)getkISImageDescriptorTableUINameSymbolLoc_ptr;
  v23 = (void *)getkISImageDescriptorTableUINameSymbolLoc_ptr;
  if (!getkISImageDescriptorTableUINameSymbolLoc_ptr)
  {
    v11 = IconServicesLibrary();
    v10 = dlsym(v11, "kISImageDescriptorTableUIName");
    *(_QWORD *)(v21 + 24) = v10;
    getkISImageDescriptorTableUINameSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v20, 8);
  if (v10)
  {
    objc_msgSend(v9, "imageDescriptorNamed:", *v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "prepareImageForDescriptor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "CGImage");
    v15 = objc_alloc(MEMORY[0x1E0DC7B70]);
    objc_msgSend(v12, "scale");
    v16 = (void *)objc_msgSend(v15, "initWithCGImage:scale:orientation:", v14, 1);

    v17 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ISImageDescriptorName getkISImageDescriptorTableUIName(void)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("LNImage+Workflow.m"), 25, CFSTR("%s"), dlerror(), v20);

    __break(1u);
  }
}

- (id)initWithSerializedRepresentation:()Workflow variableProvider:parameter:
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;

  v4 = a3;
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v10 = v8;

    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("iconType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v13 = v12;

      v14 = objc_msgSend(v13, "integerValue");
      a1 = (id)objc_msgSend(a1, "initWithIconType:identifier:", v14, v10);
      v9 = a1;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)serializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "iconType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_setObjectIfNonNil:forKey:", v3, CFSTR("iconType"));

  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_setObjectIfNonNil:forKey:", v4, CFSTR("identifier"));

  return v2;
}

@end
