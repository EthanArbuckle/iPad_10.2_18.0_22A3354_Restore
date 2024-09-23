@implementation SKUIMediaSocialSuggestedHandlesOperation

- (SKUIMediaSocialSuggestedHandlesOperation)initWithClientContext:(id)a3
{
  id v5;
  SKUIMediaSocialSuggestedHandlesOperation *v6;
  SKUIMediaSocialSuggestedHandlesOperation *v7;
  NSLock *v8;
  NSLock *lock;
  objc_super v11;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaSocialSuggestedHandlesOperation initWithClientContext:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIMediaSocialSuggestedHandlesOperation;
  v6 = -[SSVOperation init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v7->_lock;
    v7->_lock = v8;

    -[NSLock setName:](v7->_lock, "setName:", CFSTR("com.apple.MediaSocial.suggestedHandles"));
  }

  return v7;
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

- (NSArray)words
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)-[NSArray copy](self->_words, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return (NSArray *)v3;
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

- (void)setWords:(id)a3
{
  NSArray *v4;
  NSArray *words;
  NSArray *v6;

  v6 = (NSArray *)a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_words != v6)
  {
    v4 = (NSArray *)-[NSArray copy](v6, "copy");
    words = self->_words;
    self->_words = v4;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)main
{
  void *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  id obj;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__92;
  v43 = __Block_byref_object_dispose__92;
  v44 = 0;
  -[SKUIClientContext URLBag](self->_clientContext, "URLBag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DAFDA8];
  v5 = (id *)(v40 + 5);
  obj = (id)v40[5];
  objc_msgSend(v3, "valueForKey:error:", v4, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("suggestedHandles"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3998]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithURL:resolvingAgainstBaseURL:", v9, 0);

    -[SKUIMediaSocialSuggestedHandlesOperation words](self, "words");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("words"), v12);
    v30 = (void *)v12;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v13, 0);
    objc_msgSend(v10, "setQueryItems:", v14);
    v15 = objc_alloc(MEMORY[0x1E0C92C28]);
    objc_msgSend(v10, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithURL:", v16);

    SSVAddMediaSocialHeadersToURLRequest();
    v18 = -[SSVComplexOperation newLoadURLOperationWithRequest:](self, "newLoadURLOperationWithRequest:", v17);
    objc_msgSend(MEMORY[0x1E0DAF6E8], "consumer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDataConsumer:", v19);

    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__92;
    v36 = __Block_byref_object_dispose__92;
    v37 = 0;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __48__SKUIMediaSocialSuggestedHandlesOperation_main__block_invoke;
    v31[3] = &unk_1E73A38F8;
    v31[4] = &v32;
    v31[5] = &v39;
    objc_msgSend(v18, "setOutputBlock:", v31);
    -[SSVOperation runChildOperation:](self, "runChildOperation:", v18);
    v20 = (void *)v33[5];
    if (v20)
    {
      objc_msgSend(v20, "objectForKey:", CFSTR("status"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21 && objc_msgSend(v21, "isEqualToString:", CFSTR("success")))
      {
        objc_msgSend((id)v33[5], "objectForKey:", CFSTR("suggestions"));
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }
    if (!(v40[5] | v23))
    {
      objc_msgSend(v18, "URLResponse");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "statusCode") == 403)
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKUIErrorDomain"), 3, 0);
      else
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKUIErrorDomain"), 2, 0);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v40[5];
      v40[5] = v26;

    }
    _Block_object_dispose(&v32, 8);

  }
  else
  {
    SSError();
    v24 = objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v10 = (void *)v40[5];
    v40[5] = v24;
  }

  -[SKUIMediaSocialSuggestedHandlesOperation outputBlock](self, "outputBlock");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v28, v23, v40[5]);

  _Block_object_dispose(&v39, 8);
}

void __48__SKUIMediaSocialSuggestedHandlesOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_words, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMediaSocialSuggestedHandlesOperation initWithClientContext:]";
}

@end
