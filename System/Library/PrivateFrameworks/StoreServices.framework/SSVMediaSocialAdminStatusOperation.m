@implementation SSVMediaSocialAdminStatusOperation

- (SSVMediaSocialAdminStatusOperation)init
{
  SSVMediaSocialAdminStatusOperation *v2;
  NSLock *v3;
  NSLock *lock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSVMediaSocialAdminStatusOperation;
  v2 = -[SSVOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v2->_lock;
    v2->_lock = v3;

    -[NSLock setName:](v2->_lock, "setName:", CFSTR("com.apple.MediaSocial.adminStatus"));
  }
  return v2;
}

- (id)outputBlock
{
  void *v3;
  void *v4;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)objc_msgSend(self->_outputBlock, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  v4 = (void *)MEMORY[0x1A8585DF0](v3);

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
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__71;
  v31 = __Block_byref_object_dispose__71;
  v32 = 0;
  -[SSVComplexOperation URLBagDictionary](self, "URLBagDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("musicConnect"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SSVComplexOperation URLBagDictionary](self, "URLBagDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("aucAdminStatus"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("adminStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB37A8]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithURL:", v8);

    SSVAddMediaSocialHeadersToURLRequest(v9);
    v10 = -[SSVComplexOperation newLoadURLOperationWithRequest:](self, "newLoadURLOperationWithRequest:", v9);
    +[SSVURLDataConsumer consumer](SSVURLProtocolConsumer, "consumer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDataConsumer:", v11);

    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__71;
    v25 = __Block_byref_object_dispose__71;
    v26 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __42__SSVMediaSocialAdminStatusOperation_main__block_invoke;
    v20[3] = &unk_1E47BE808;
    v20[4] = &v21;
    v20[5] = &v27;
    objc_msgSend(v10, "setOutputBlock:", v20);
    -[SSVOperation runChildOperation:](self, "runChildOperation:", v10);
    v12 = (void *)v22[5];
    if (v12)
    {
      objc_msgSend(v12, "objectForKey:", CFSTR("status"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("success"));
      else
        v14 = 0;
      objc_msgSend((id)v22[5], "objectForKey:", CFSTR("isAdmin"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = objc_msgSend(v17, "BOOLValue");
      else
        v16 = 0;

    }
    else
    {
      v16 = 0;
      v14 = 0;
    }
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 124, 0, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v14 = 0;
    v9 = (void *)v28[5];
    v28[5] = v15;
  }

  -[SSVMediaSocialAdminStatusOperation outputBlock](self, "outputBlock");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 16))(v18, v14, v16, v28[5]);

  _Block_object_dispose(&v27, 8);
}

void __42__SSVMediaSocialAdminStatusOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
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
      SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
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
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
