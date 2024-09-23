@implementation SKUIRedeemOperation

- (SKUIRedeemOperation)initWithCode:(id)a3
{
  id v5;
  SKUIRedeemOperation *v6;
  SKUIRedeemOperation *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemOperation initWithCode:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIRedeemOperation;
  v6 = -[SKUIRedeemOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_code, a3);

  return v7;
}

- (void)main
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSString *code;
  id v10;
  void *v11;
  dispatch_semaphore_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  SKUIClientContext *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSString *v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  id v42;
  void *v43;
  int v44;
  int v45;
  NSObject *v46;
  void *v47;
  NSString *v48;
  id v49;
  id v50;
  _BYTE *v51;
  uint64_t v52;
  _QWORD block[4];
  id v54;
  SKUIRedeemOperation *v55;
  uint64_t *v56;
  _QWORD v57[4];
  NSObject *v58;
  _BYTE *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  void *v68;
  NSString *v69;
  _BYTE v70[24];
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__99;
  v65 = __Block_byref_object_dispose__99;
  v66 = 0;
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldLog");
  v5 = objc_msgSend(v3, "shouldLogToDisk");
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v4 |= 2u;
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (!v4)
    goto LABEL_8;
  v8 = (void *)objc_opt_class();
  code = self->_code;
  *(_DWORD *)v70 = 138543618;
  *(_QWORD *)&v70[4] = v8;
  *(_WORD *)&v70[12] = 2114;
  *(_QWORD *)&v70[14] = code;
  v10 = v8;
  LODWORD(v52) = 22;
  v51 = v70;
  v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, v70, v52);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    free(v11);
    v51 = v7;
    SSFileLog();
LABEL_8:

  }
  if (!self->_code)
    goto LABEL_46;
  *(_QWORD *)v70 = 0;
  *(_QWORD *)&v70[8] = v70;
  *(_QWORD *)&v70[16] = 0x3032000000;
  v71 = __Block_byref_object_copy__99;
  v72 = __Block_byref_object_dispose__99;
  v73 = 0;
  v12 = dispatch_semaphore_create(0);
  v13 = objc_alloc(MEMORY[0x1E0DAF5E8]);
  v69 = self->_code;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithRedeemCodes:", v14);

  -[SKUIRedeemOperation _authenticationContext](self, "_authenticationContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAuthenticationContext:", v16);

  objc_msgSend(v15, "setCameraRecognized:", self->_cameraRecognized);
  objc_msgSend(v15, "setHeadless:", 0);
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __27__SKUIRedeemOperation_main__block_invoke;
  v57[3] = &unk_1E73A9678;
  v59 = v70;
  v60 = &v61;
  v17 = v12;
  v58 = v17;
  objc_msgSend(v15, "startWithRedeemResponseBlock:", v57);
  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  v18 = *(void **)(*(_QWORD *)&v70[8] + 40);
  if (v18)
  {
    objc_msgSend(v18, "dictionaryForCode:", self->_code);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[SKUIRedeemOperation _redeemForSuccessDictionary:](self, "_redeemForSuccessDictionary:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)&v70[8] + 40), "errorForCode:", self->_code);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v62[5];
      v62[5] = v21;

      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v20, "redirectURL", v51);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v20, "redirectURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemOperation _requestPropertiesForThankYouWithURL:](self, "_requestPropertiesForThankYouWithURL:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[SKUIRedeemOperation _performRequestWithProperties:error:](self, "_performRequestWithProperties:error:", v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setThankYouDictionary:", v26);
    if (v26)
      -[SKUIRedeemOperation _applyThankYouDictionary:toRedeem:](self, "_applyThankYouDictionary:toRedeem:", v26, v20);

  }
  _Block_object_dispose(v70, 8);

  if (!v20)
  {
LABEL_46:
    if (!v62[5])
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v67 = *MEMORY[0x1E0CB2D50];
      v28 = self->_clientContext;
      v29 = CFSTR("Redeem");
      if (v28)
        -[SKUIClientContext localizedStringForKey:inTable:](v28, "localizedStringForKey:inTable:", CFSTR("REDEEM_UNAVAILABLE"), v29);
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_UNAVAILABLE"), 0, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CD80A8], 0, v31);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)v62[5];
      v62[5] = v32;

    }
    v20 = 0;
  }
  if (v62[5])
  {
    objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "shouldLog");
    v36 = objc_msgSend(v34, "shouldLogToDisk");
    objc_msgSend(v34, "OSLogObject");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v36)
      v35 |= 2u;
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      v35 &= 2u;
    if (!v35)
      goto LABEL_42;
    v39 = (void *)objc_opt_class();
    v40 = self->_code;
    v41 = (uint64_t (*)(uint64_t, uint64_t))v62[5];
    *(_DWORD *)v70 = 138543874;
    *(_QWORD *)&v70[4] = v39;
    *(_WORD *)&v70[12] = 2114;
    *(_QWORD *)&v70[14] = v40;
    *(_WORD *)&v70[22] = 2114;
    v71 = v41;
    v42 = v39;
    LODWORD(v52) = 32;
    v43 = (void *)_os_log_send_and_compose_impl();

    if (v43)
    {
LABEL_41:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v43, 4, v70, v52);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      free(v43);
      SSFileLog();
LABEL_42:

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v34, "shouldLog");
    v45 = objc_msgSend(v34, "shouldLogToDisk");
    objc_msgSend(v34, "OSLogObject");
    v46 = objc_claimAutoreleasedReturnValue();
    v38 = v46;
    if (v45)
      v44 |= 2u;
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      v44 &= 2u;
    if (!v44)
      goto LABEL_42;
    v47 = (void *)objc_opt_class();
    v48 = self->_code;
    *(_DWORD *)v70 = 138543618;
    *(_QWORD *)&v70[4] = v47;
    *(_WORD *)&v70[12] = 2114;
    *(_QWORD *)&v70[14] = v48;
    v49 = v47;
    LODWORD(v52) = 22;
    v43 = (void *)_os_log_send_and_compose_impl();

    if (v43)
      goto LABEL_41;
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SKUIRedeemOperation_main__block_invoke_12;
  block[3] = &unk_1E73A5CF0;
  v54 = v20;
  v55 = self;
  v56 = &v61;
  v50 = v20;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(&v61, 8);
}

void __27__SKUIRedeemOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __27__SKUIRedeemOperation_main__block_invoke_12(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (*(_QWORD *)(a1 + 32))
  {
    +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadFromServer");

    objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "creditDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCreditsString:", v6);

    objc_msgSend(v3, "saveAccount:verifyCredentials:completion:", v4, 0, 0);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 272) + 16))();
}

- (id)_authenticationContext
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x1E0DDC140]);
  if (v3
    && (objc_msgSend(v3, "uniqueIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "canPerformExtendedBiometricActionsForAccountIdentifier:", v5),
        v5,
        v6))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF5C0]), "initWithAccount:", v3);
    objc_msgSend(v7, "setShouldCreateNewSession:", 1);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_redeemForSuccessDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  SKUIRedeemItem *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  SKUIArtwork *v34;
  SKUIArtworkList *v35;
  void *v36;
  void *v37;
  void *v38;
  SKUIRedeem *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id obj;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  void *v107;
  _BYTE v108[128];
  SKUIArtwork *v109;
  void *v110;
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v86 = a3;
  objc_msgSend(v86, "objectForKey:", CFSTR("status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v3, "integerValue") < 0)
  {
    v39 = 0;
    goto LABEL_122;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "objectForKey:", CFSTR("salables"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v90 = v4;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v40 = 0;
    goto LABEL_52;
  }
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v85 = v5;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
  if (!v6)
  {
    v88 = 0;
    goto LABEL_51;
  }
  v7 = v6;
  v88 = 0;
  v8 = *(_QWORD *)v103;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v103 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "objectForKey:", CFSTR("parentSalableAdamId"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = v11;
        }
        else
        {
          objc_msgSend(v10, "objectForKey:", CFSTR("salableAdamId"));
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v14 = v13;

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "longLongValue"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIRedeemOperation _itemsForItemIdentifiers:](self, "_itemsForItemIdentifiers:", v16);
          v17 = (SKUIRedeemItem *)objc_claimAutoreleasedReturnValue();

          if (-[SKUIRedeemItem count](v17, "count"))
          {
            objc_msgSend(v4, "addObjectsFromArray:", v17);
LABEL_39:

            objc_msgSend(v10, "objectForKey:", CFSTR("parentSalableName"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              objc_msgSend(v10, "objectForKey:", CFSTR("salableName"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = v38;

                v88 = v14;
              }
              else
              {
                v14 = v38;
              }
            }

            continue;
          }

        }
        v17 = objc_alloc_init(SKUIRedeemItem);
        objc_msgSend(v10, "objectForKey:", CFSTR("productType"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(&unk_1E749BC18, "objectForKey:", CFSTR("productType"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!v19)
            v19 = &unk_1E749B840;
          v21 = objc_msgSend(v19, "integerValue", v85);

          -[SKUIItem setItemKind:](v17, "setItemKind:", v21);
        }
        objc_msgSend(v10, "objectForKey:", CFSTR("parentSalableName"), v85);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          v24 = v22;
        }
        else
        {
          objc_msgSend(v10, "objectForKey:", CFSTR("salableName"));
          v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        v25 = v24;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SKUIItem setTitle:](v17, "setTitle:", v25);
        objc_msgSend(v10, "objectForKey:", CFSTR("parentSalableAdamId"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26;
        if (v26)
        {
          v28 = v26;
        }
        else
        {
          objc_msgSend(v10, "objectForKey:", CFSTR("salableAdamId"));
          v28 = (id)objc_claimAutoreleasedReturnValue();
        }
        v29 = v28;

        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[SKUIItem setItemIdentifier:](v17, "setItemIdentifier:", objc_msgSend(v29, "longLongValue"));
        objc_msgSend(v10, "objectForKey:", CFSTR("hiResCoverArtUrl"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          v32 = v30;
        }
        else
        {
          objc_msgSend(v10, "objectForKey:", CFSTR("lowResCoverArtUrl"));
          v32 = (id)objc_claimAutoreleasedReturnValue();
        }
        v14 = v32;

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (v33)
          {
            v34 = -[SKUIArtwork initWithURL:size:]([SKUIArtwork alloc], "initWithURL:size:", v33, 10.0, 10.0);
            v35 = objc_alloc_init(SKUIArtworkList);
            v109 = v34;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKUIArtworkList setArtworks:](v35, "setArtworks:", v36);

            -[SKUIRedeemItem setArtworks:](v17, "setArtworks:", v35);
            v4 = v90;

          }
        }
        objc_msgSend(v4, "addObject:", v17);
        goto LABEL_39;
      }
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
  }
  while (v7);
LABEL_51:

  v40 = v88;
  v5 = v85;
LABEL_52:
  v89 = v40;
  objc_msgSend(v86, "objectForKey:", CFSTR("downloads"), v85);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v93 = v41;
    v42 = v41;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v99;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v99 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v47, "objectForKey:", CFSTR("songId"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v48, "longLongValue"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v107 = v49;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              -[SKUIRedeemOperation _itemsForItemIdentifiers:](self, "_itemsForItemIdentifiers:", v50);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v87, "addObjectsFromArray:", v51);
              v4 = v90;
            }

          }
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
      }
      while (v44);
    }

    v41 = v93;
  }
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "valueForKeyPath:", CFSTR("itemIdentifier"));
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)v52;
      v54 = (void *)MEMORY[0x1E0C9AA60];
      if (v52)
        v54 = (void *)v52;
      v55 = v54;

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "valueForKeyPath:", CFSTR("songId"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = 0u;
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v59 = v57;
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
      if (v60)
      {
        v61 = v60;
        v62 = *(_QWORD *)v95;
        do
        {
          for (k = 0; k != v61; ++k)
          {
            if (*(_QWORD *)v95 != v62)
              objc_enumerationMutation(v59);
            v64 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * k);
            if ((objc_msgSend(v56, "containsObject:", v64) & 1) == 0)
              objc_msgSend(v58, "addObject:", v64);
          }
          v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
        }
        while (v61);
      }

    }
    else
    {
      v58 = 0;
      v55 = v87;
    }
  }
  else
  {
    v58 = 0;
    v55 = v4;
    v4 = v87;
  }

  objc_msgSend(v86, "objectForKey:", CFSTR("redeemedCredit"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v65, "objectForKey:", CFSTR("totalCredit"));
    v66 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v67 = v66;
    else
      v67 = 0;
    if (!objc_msgSend(v67, "length"))
    {
      objc_msgSend(v65, "objectForKey:", CFSTR("money"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v66 = v68;

        v67 = v66;
      }
      else
      {
        v66 = v68;
      }
    }

  }
  else
  {
    v67 = 0;
  }
  objc_msgSend(v86, "objectForKey:", CFSTR("totalCredit"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v69, "objectForKey:", CFSTR("totalCredit"));
    v70 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v71 = v70;
    else
      v71 = 0;
    if (!objc_msgSend(v71, "length"))
    {
      objc_msgSend(v69, "objectForKey:", CFSTR("money"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v70 = v72;

        v71 = v70;
      }
      else
      {
        v70 = v72;
      }
    }

  }
  else
  {
    v71 = 0;
  }
  objc_msgSend(v86, "objectForKey:", CFSTR("creditDisplay"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v73, "stringValue");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v74 = 0;
  }
  objc_msgSend(v86, "objectForKey:", CFSTR("postRedemptionRedirectURL"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v75);
  else
    v76 = 0;
  objc_msgSend(v86, "objectForKey:", CFSTR("customizedThankYouPageURL"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v77);
  else
    v78 = 0;
  objc_msgSend(v86, "objectForKey:", CFSTR("iTunesPassAlertInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = -1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "doubleValue");
    v79 = v80;
  }
  if (objc_msgSend(v67, "length") || objc_msgSend(v4, "count"))
  {
    v39 = objc_alloc_init(SKUIRedeem);
    -[SKUIRedeem setBalance:](v39, "setBalance:", v71);
    -[SKUIRedeem setCredit:](v39, "setCredit:", v67);
    -[SKUIRedeem setCreditDisplay:](v39, "setCreditDisplay:", v74);
    v81 = v89;
    -[SKUIRedeem setInAppPurchase:](v39, "setInAppPurchase:", v89);
    if (objc_msgSend(v4, "count"))
      v82 = v4;
    else
      v82 = 0;
    -[SKUIRedeem setItems:](v39, "setItems:", v82);
    if (objc_msgSend(v58, "count"))
      v83 = v58;
    else
      v83 = 0;
    -[SKUIRedeem setDownloads:](v39, "setDownloads:", v83);
    -[SKUIRedeem setITunesPassLearnMoreAlertInterval:](v39, "setITunesPassLearnMoreAlertInterval:", v79);
    -[SKUIRedeem setRedirectURL:](v39, "setRedirectURL:", v76);
    -[SKUIRedeem setCustomizedThankyouURL:](v39, "setCustomizedThankyouURL:", v78);
  }
  else
  {
    v39 = 0;
    v81 = v89;
  }

LABEL_122:
  return v39;
}

- (id)_itemsForItemIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  SKUIItem *v19;
  void *v20;
  SKUIItem *v21;
  void *v22;
  id v23;
  NSObject *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v41;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v41 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v8), "stringValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v6);
  }

  v26 = objc_alloc_init(MEMORY[0x1E0DAF550]);
  objc_msgSend(v26, "setKeyProfile:", *MEMORY[0x1E0DAFA90]);
  objc_msgSend(v26, "setValue:forRequestParameter:", v4, *MEMORY[0x1E0DAFAB0]);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__99;
  v38 = __Block_byref_object_dispose__99;
  v39 = 0;
  v10 = dispatch_semaphore_create(0);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __48__SKUIRedeemOperation__itemsForItemIdentifiers___block_invoke;
  v31[3] = &unk_1E73A96A0;
  v33 = &v34;
  v11 = v10;
  v32 = v11;
  objc_msgSend(v26, "startWithLookupBlock:", v31);
  v25 = v11;
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)v35[5], "allItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v44, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v17);
        v19 = [SKUIItem alloc];
        objc_msgSend(v18, "lookupDictionary", v25);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[SKUIItem initWithLookupDictionary:](v19, "initWithLookupDictionary:", v20);
        objc_msgSend(v13, "addObject:", v21);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v44, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v13, "count"))
    v22 = v13;
  else
    v22 = 0;
  v23 = v22;

  _Block_object_dispose(&v34, 8);
  return v23;
}

void __48__SKUIRedeemOperation__itemsForItemIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_applyThankYouDictionary:(id)a3 toRedeem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  SKUILink *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SKUIArtworkList *v32;
  void *v33;
  SKUIArtworkList *v34;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "objectForKey:", CFSTR("typ"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_42;
  objc_msgSend(v6, "objectForKey:", CFSTR("explanation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0x1E0C99000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (v10)
    {
      v11 = v10;
      v35 = v5;
      v12 = *(_QWORD *)v42;
      v13 = 1;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v42 != v12)
            objc_enumerationMutation(v9);
          objc_opt_class();
          v13 &= objc_opt_isKindOfClass();
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      }
      while (v11);

      v5 = v35;
      v8 = 0x1E0C99000;
      if ((v13 & 1) == 0)
        goto LABEL_14;
    }
    else
    {

    }
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMessage:", v15);

  }
LABEL_14:
  objc_msgSend(v6, "objectForKey:", CFSTR("title"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setTitle:", v16);
  objc_msgSend(v6, "objectForKey:", CFSTR("finalPageUrl"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRedirectURL:", v18);

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("links"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v21 = v19;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = -[SKUILink initWithLinkDictionary:]([SKUILink alloc], "initWithLinkDictionary:", v26);
            if (v27)
              objc_msgSend(v20, "addObject:", v27);

          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v23);
    }

    v5 = v36;
    objc_msgSend(v36, "setLinks:", v20);

    v8 = 0x1E0C99000uLL;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("artwork"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "objectForKey:", CFSTR("imgSrc"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      objc_msgSend(v29, "setObject:forKey:", v30, CFSTR("url"));
      objc_msgSend(v29, "objectForKey:", CFSTR("isLogo"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v31, "BOOLValue"))
      {
        v32 = [SKUIArtworkList alloc];
        v45 = v29;
        objc_msgSend(*(id *)(v8 + 3360), "arrayWithObjects:count:", &v45, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[SKUIArtworkList initWithArtworkListArray:](v32, "initWithArtworkListArray:", v33);

        if (v34)
          objc_msgSend(v5, "setHeaderArtworkProvider:", v34);

      }
    }

  }
  else
  {
    v29 = v28;
  }

LABEL_42:
}

- (id)_requestPropertiesForThankYouWithURL:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0DAF5C8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithURL:", v4);

  objc_msgSend(v5, "setITunesStoreRequest:", 1);
  SSVDefaultUserAgent();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v6, CFSTR("User-Agent"));

  objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  return v5;
}

- (id)_performRequestWithProperties:(id)a3 error:(id *)a4
{
  id v4;
  dispatch_semaphore_t v5;
  SKUIURLConnectionRequest *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__99;
  v23 = __Block_byref_object_dispose__99;
  v24 = 0;
  v6 = -[SSURLConnectionRequest initWithRequestProperties:]([SKUIURLConnectionRequest alloc], "initWithRequestProperties:", v4);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __59__SKUIRedeemOperation__performRequestWithProperties_error___block_invoke;
  v16 = &unk_1E73A8D30;
  v18 = &v19;
  v7 = v5;
  v17 = v7;
  -[SKUIURLConnectionRequest startWithConnectionResponseBlock:](v6, "startWithConnectionResponseBlock:", &v13);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend((id)v20[5], "bodyData", v13, v14, v15, v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[SSVURLDataConsumer consumer](SKUIJSONDataConsumer, "consumer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForData:response:error:", v8, 0, 0);
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

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __59__SKUIRedeemOperation__performRequestWithProperties_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)cameraRecognized
{
  return self->_cameraRecognized;
}

- (void)setCameraRecognized:(BOOL)a3
{
  self->_cameraRecognized = a3;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (id)resultBlock
{
  return objc_getProperty(self, a2, 272, 1);
}

- (void)setResultBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultBlock, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

- (void)initWithCode:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRedeemOperation initWithCode:]";
}

@end
