@implementation SKUIMediaSocialAdminPermissionsOperation

- (SKUIMediaSocialAdminPermissionsOperation)initWithClientContext:(id)a3
{
  id v5;
  SKUIMediaSocialAdminPermissionsOperation *v6;
  SKUIMediaSocialAdminPermissionsOperation *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaSocialAdminPermissionsOperation initWithClientContext:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIMediaSocialAdminPermissionsOperation;
  v6 = -[SSVOperation init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    -[SKUIClientContext URLBag](v7->_clientContext, "URLBag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVComplexOperation configureWithURLBag:](v7, "configureWithURLBag:", v8);

  }
  return v7;
}

- (id)outputBlock
{
  void *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *(*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__24;
  v9 = __Block_byref_object_dispose__24;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SKUIMediaSocialAdminPermissionsOperation_outputBlock__block_invoke;
  v4[3] = &unk_1E73A0270;
  v4[4] = self;
  v4[5] = &v5;
  -[SSVOperation dispatchSync:](self, "dispatchSync:", v4);
  v2 = _Block_copy((const void *)v6[5]);
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __55__SKUIMediaSocialAdminPermissionsOperation_outputBlock__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setOutputBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SKUIMediaSocialAdminPermissionsOperation_setOutputBlock___block_invoke;
  v6[3] = &unk_1E73A1578;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SSVOperation dispatchAsync:](self, "dispatchAsync:", v6);

}

void __59__SKUIMediaSocialAdminPermissionsOperation_setOutputBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 320) != v2)
  {
    v4 = objc_msgSend(v2, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 320);
    *(_QWORD *)(v5 + 320) = v4;

  }
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__5;
  v29 = 0;
  -[SSVComplexOperation URLBagDictionary](self, "URLBagDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DAFDA8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("profilePermissions"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", v6);
    SSVAddMediaSocialHeadersToURLRequest();
    v8 = -[SSVComplexOperation newLoadURLOperationWithRequest:](self, "newLoadURLOperationWithRequest:", v7);
    objc_msgSend(MEMORY[0x1E0DAF6E8], "consumer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDataConsumer:", v9);

    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__4;
    v22 = __Block_byref_object_dispose__5;
    v23 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __48__SKUIMediaSocialAdminPermissionsOperation_main__block_invoke;
    v17[3] = &unk_1E73A38F8;
    v17[4] = &v18;
    v17[5] = &v24;
    objc_msgSend(v8, "setOutputBlock:", v17);
    -[SSVOperation runChildOperation:](self, "runChildOperation:", v8);
    if (v19[5])
    {
      -[SKUIMediaSocialAdminPermissionsOperation _authorsWithResponseDictionary:](self, "_authorsWithResponseDictionary:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    if (!v25[5] && !objc_msgSend(v10, "count"))
    {
      objc_msgSend(v8, "URLResponse");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "statusCode") == 403)
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKUIErrorDomain"), 3, 0);
      else
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKUIErrorDomain"), 2, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v25[5];
      v25[5] = v13;

    }
    _Block_object_dispose(&v18, 8);

  }
  else
  {
    SSError();
    v11 = objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v6 = (void *)v25[5];
    v25[5] = v11;
  }

  -[SKUIMediaSocialAdminPermissionsOperation outputBlock](self, "outputBlock");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    (*(void (**)(uint64_t, void *, uint64_t))(v15 + 16))(v15, v10, v25[5]);

  _Block_object_dispose(&v24, 8);
}

void __48__SKUIMediaSocialAdminPermissionsOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_authorsWithResponseDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  SKUIMediaSocialAuthor *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  uint64_t v49;
  SKUIMediaSocialAdminPermissionsOperation *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id obj;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("permissions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("persmissions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = v4;
    objc_msgSend(v4, "objectForKey:", CFSTR("storePlatformData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0x1E0C99000uLL;
    objc_opt_class();
    v55 = v5;
    v51 = self;
    v52 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("artist"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("results"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
    v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v53 = v6;
    obj = v6;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
    v57 = v11;
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v69 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = -[SKUIMediaSocialAuthor initWithAuthorDictionary:]([SKUIMediaSocialAuthor alloc], "initWithAuthorDictionary:", v16);
            -[SKUIMediaSocialAuthor identifier](v17, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v11, "objectForKey:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = v8;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF540]), "initWithLookupDictionary:", v19);
                objc_msgSend(v21, "artwork");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "lastObject");
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v21, "displayName");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[SKUIMediaSocialAuthor setName:](v17, "setName:", v24);

                objc_msgSend(v23, "URLWithHeight:width:", 125, 125);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[SKUIMediaSocialAuthor setThumbnailImageURL:](v17, "setThumbnailImageURL:", v25);

                v11 = v57;
                -[SKUIMediaSocialAuthor setStorePlatformData:](v17, "setStorePlatformData:", v19);

              }
              -[SKUIMediaSocialAuthor name](v17, "name");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "length");

              if (!v27)
                objc_msgSend(v56, "addObject:", v17);
              objc_msgSend(v58, "addObject:", v17);

              v8 = v20;
            }

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
      }
      while (v13);
    }

    if (objc_msgSend(v56, "count"))
    {
      -[SKUIMediaSocialAdminPermissionsOperation _lookupResponseForMissingAuthors:error:](v51, "_lookupResponseForMissingAuthors:error:", v56, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v29 = v56;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v65;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v65 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
            objc_msgSend(v34, "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "itemForKey:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v36, "artwork");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "lastObject");
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v36, "displayName");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setName:", v39);

            objc_msgSend(v38, "URL");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setThumbnailImageURL:", v40);

            objc_msgSend(v36, "lookupDictionary");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setStorePlatformData:", v41);

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
        }
        while (v31);
      }

    }
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v42 = v58;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    v5 = v55;
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v61;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v61 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * k);
          objc_msgSend(v47, "name");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "length");

          if (v49)
            objc_msgSend(v55, "addObject:", v47);
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
      }
      while (v44);
    }

    v6 = v53;
    v4 = v54;
  }

  return v5;
}

- (id)_lookupResponseForMissingAuthors:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__4;
  v37 = __Block_byref_object_dispose__5;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__4;
  v31 = __Block_byref_object_dispose__5;
  v32 = 0;
  v7 = objc_alloc(MEMORY[0x1E0DAF6A8]);
  -[SKUIClientContext URLBag](self->_clientContext, "URLBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "existingBagDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithBagDictionary:", v9);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF6B0]), "initWithPlatformContext:", v10);
  objc_msgSend(v11, "setKeyProfile:", *MEMORY[0x1E0DAFA90]);
  objc_msgSend(v11, "setPersonalizationStyle:", 2);
  -[SKUIClientContext valueForConfigurationKey:](self->_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStoreFrontSuffix:", v12);

  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17), "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
    }
    while (v15);
  }

  objc_msgSend(v11, "setItemIdentifiers:", v13);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __83__SKUIMediaSocialAdminPermissionsOperation__lookupResponseForMissingAuthors_error___block_invoke;
  v22[3] = &unk_1E73A3920;
  v22[4] = &v33;
  v22[5] = &v27;
  objc_msgSend(v11, "setResponseBlock:", v22);
  -[SSVOperation runChildOperation:](self, "runChildOperation:", v11);
  v19 = (void *)v28[5];
  if (a4 && !v19)
  {
    *a4 = objc_retainAutorelease((id)v34[5]);
    v19 = (void *)v28[5];
  }
  v20 = v19;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

void __83__SKUIMediaSocialAdminPermissionsOperation__lookupResponseForMissingAuthors_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMediaSocialAdminPermissionsOperation initWithClientContext:]";
}

@end
