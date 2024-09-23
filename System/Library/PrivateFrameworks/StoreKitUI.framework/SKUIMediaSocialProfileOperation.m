@implementation SKUIMediaSocialProfileOperation

- (SKUIMediaSocialProfileOperation)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUIMediaSocialProfileOperation *v11;
  NSLock *v12;
  NSLock *lock;
  objc_super v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIMediaSocialProfileOperation init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIMediaSocialProfileOperation;
  v11 = -[SSVOperation init](&v15, sel_init);
  if (v11)
  {
    v12 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v11->_lock;
    v11->_lock = v12;

    -[NSLock setName:](v11->_lock, "setName:", CFSTR("com.apple.MediaSocial.profile"));
  }
  return v11;
}

- (SKUIMediaSocialProfileOperation)initWithClientContext:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIMediaSocialProfileOperation *v13;
  void *v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIMediaSocialProfileOperation initWithClientContext:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = -[SKUIMediaSocialProfileOperation init](self, "init");
  if (v13)
  {
    objc_msgSend(v4, "URLBag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVComplexOperation configureWithURLBag:](v13, "configureWithURLBag:", v14);

  }
  return v13;
}

- (id)outputBlock
{
  void *v3;
  void *v4;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)objc_msgSend(self->_outputBlock, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  v4 = _Block_copy(v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  void *v4;
  id outputBlock;
  id v6;

  v6 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_outputBlock != v6)
  {
    v4 = (void *)objc_msgSend(v6, "copy");
    outputBlock = self->_outputBlock;
    self->_outputBlock = v4;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__100;
  v40 = __Block_byref_object_dispose__100;
  v41 = 0;
  -[SSVComplexOperation URLBagDictionary](self, "URLBagDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DAFDA8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("userProfile"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3998]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithURL:resolvingAgainstBaseURL:", v7, 0);

    objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x1E0CB39D8]);
    objc_msgSend(v10, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("user"), v13);
    v28 = v10;

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v14, 0);
    objc_msgSend(v8, "setQueryItems:", v15);
    v16 = objc_alloc(MEMORY[0x1E0C92C28]);
    objc_msgSend(v8, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithURL:", v17);

    SSVAddMediaSocialHeadersToURLRequest();
    v19 = -[SSVComplexOperation newLoadURLOperationWithRequest:](self, "newLoadURLOperationWithRequest:", v18);
    objc_msgSend(MEMORY[0x1E0DAF6E8], "consumer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDataConsumer:", v20);

    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__100;
    v34 = __Block_byref_object_dispose__100;
    v35 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __39__SKUIMediaSocialProfileOperation_main__block_invoke;
    v29[3] = &unk_1E73A38F8;
    v29[4] = &v30;
    v29[5] = &v36;
    objc_msgSend(v19, "setOutputBlock:", v29);
    -[SSVOperation runChildOperation:](self, "runChildOperation:", v19);
    if (v31[5])
    {
      -[SKUIMediaSocialProfileOperation _profileWithResponseDictionary:](self, "_profileWithResponseDictionary:");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    if (!(v37[5] | v21))
    {
      objc_msgSend(v19, "URLResponse");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "statusCode") == 403)
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKUIErrorDomain"), 3, 0);
      else
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKUIErrorDomain"), 2, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v37[5];
      v37[5] = v24;

    }
    _Block_object_dispose(&v30, 8);

  }
  else
  {
    SSError();
    v22 = objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v8 = (void *)v37[5];
    v37[5] = v22;
  }

  -[SKUIMediaSocialProfileOperation outputBlock](self, "outputBlock");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v26, v21, v37[5]);

  _Block_object_dispose(&v36, 8);
}

void __39__SKUIMediaSocialProfileOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = v11;
  }
  else
  {
    if (!v5)
    {
      SSError();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;
      goto LABEL_7;
    }
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = v5;
  }
  v8 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v7;
LABEL_7:

}

- (id)_profileWithResponseDictionary:(id)a3
{
  void *v3;
  SKUIMediaSocialProfile *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "objectForKey:", CFSTR("profile"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[SKUIMediaSocialProfile initWithProfileDictionary:]([SKUIMediaSocialProfile alloc], "initWithProfileDictionary:", v3);
    objc_msgSend(v3, "objectForKey:", CFSTR("backgroundImage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF548]), "initWithLookupDictionary:", v5);
      objc_msgSend(v6, "URLWithHeight:width:", objc_msgSend(v6, "height"), objc_msgSend(v6, "width"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIMediaSocialProfile setBackgroundImageURL:](v4, "setBackgroundImageURL:", v7);

    }
    objc_msgSend(v3, "objectForKey:", CFSTR("profileImage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF548]), "initWithLookupDictionary:", v8);
      objc_msgSend(v9, "URLWithHeight:width:", objc_msgSend(v9, "height"), objc_msgSend(v9, "width"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIMediaSocialProfile setProfileImageURL:](v4, "setProfileImageURL:", v10);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)init
{
}

- (void)initWithClientContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
