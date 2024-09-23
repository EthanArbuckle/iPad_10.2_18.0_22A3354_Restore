@implementation PNTextEmbeddingService

- (PNTextEmbeddingService)init
{
  PNTextEmbeddingService *v2;
  PNTextEmbeddingService *v3;
  MADService *madService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PNTextEmbeddingService;
  v2 = -[PNTextEmbeddingService init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    madService = v2->_madService;
    v2->_madService = 0;

  }
  return v3;
}

- (void)prewarmWithCompletionHandler:(id)a3
{
  id v4;
  MADService *v5;
  MADService *madService;
  id v7;
  void *v8;
  MADService *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_madService)
  {
    objc_msgSend(getMADServiceClass(), "service");
    v5 = (MADService *)objc_claimAutoreleasedReturnValue();
    madService = self->_madService;
    self->_madService = v5;

  }
  v7 = objc_alloc_init((Class)getMADTextEmbeddingRequestClass());
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setComputeThreshold:", 1);
    v9 = self->_madService;
    v16[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __55__PNTextEmbeddingService_prewarmWithCompletionHandler___block_invoke;
    v14[3] = &unk_2514805B0;
    v11 = v4;
    v15 = v11;
    LODWORD(v9) = -[MADService prewarmTextRequests:completionHandler:](v9, "prewarmTextRequests:completionHandler:", v10, v14);

    if ((_DWORD)v9 == -1)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "pn_genericErrorWithLocalizedDescription:", CFSTR("[PNTextEmbeddingService] Failed to prewarm embedding model."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v11 + 2))(v11, v12);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "pn_genericErrorWithLocalizedDescription:", CFSTR("[PNTextEmbeddingService] Failed to create MADTextEmbeddingRequest for prewarming."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v13);

  }
}

- (void)requestTextEmbeddings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  MADService *v9;
  MADService *madService;
  MADService *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = objc_alloc_init((Class)getMADTextEmbeddingRequestClass());
    if (v8)
    {
      if (!self->_madService)
      {
        objc_msgSend(getMADServiceClass(), "service");
        v9 = (MADService *)objc_claimAutoreleasedReturnValue();
        madService = self->_madService;
        self->_madService = v9;

      }
      objc_msgSend(v8, "setComputeThreshold:", 1);
      v11 = self->_madService;
      v20[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __66__PNTextEmbeddingService_requestTextEmbeddings_completionHandler___block_invoke;
      v16[3] = &unk_25147FD38;
      v17 = v8;
      v18 = v6;
      v13 = v7;
      v19 = v13;
      LODWORD(v11) = -[MADService performRequests:text:identifier:completionHandler:](v11, "performRequests:text:identifier:completionHandler:", v12, v18, 0, v16);

      if ((_DWORD)v11 == -1)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "pn_genericErrorWithLocalizedDescription:", CFSTR("[PNTextEmbeddingService] Text embedding generation service request failed."));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v14);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "pn_genericErrorWithLocalizedDescription:", CFSTR("[PNTextEmbeddingService] Failed to create MADTextEmbeddingRequest."));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v15);

    }
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v8, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_madService, 0);
}

void __66__PNTextEmbeddingService_requestTextEmbeddings_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  id v38;
  double v39;
  void *v40;
  PNTextEmbeddingResultWithBiasScale *v41;
  void *v42;
  void *v43;
  PNTextEmbeddingResultWithBiasScale *v44;
  void *v45;
  id obj;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (a2 != -1)
  {
    if (v5)
      goto LABEL_3;
    objc_msgSend(*(id *)(a1 + 32), "embeddingResults");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_3;
    v11 = (void *)v10;
    objc_msgSend(*(id *)(a1 + 32), "embeddingResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    v14 = objc_msgSend(*(id *)(a1 + 40), "count");

    if (v13 == v14)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "embeddingResults");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      if (v49)
      {
        v47 = v15;
        v48 = *(_QWORD *)v51;
LABEL_9:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v51 != v48)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v16);
          objc_msgSend(v17, "embedding");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
            break;
          v19 = v18;
          objc_msgSend(v18, "data");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "count");
          v22 = objc_msgSend(v19, "type");
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v21);
          if (v22 == 2)
          {
            v35 = objc_msgSend(objc_retainAutorelease(v20), "bytes");
            if (v21)
            {
              v36 = v35;
              for (i = 0; i != v21; ++i)
              {
                v38 = objc_alloc(MEMORY[0x24BDD16E0]);
                LODWORD(v39) = *(_DWORD *)(v36 + 4 * i);
                v40 = (void *)objc_msgSend(v38, "initWithFloat:", v39);
                objc_msgSend(v23, "insertObject:atIndex:", v40, i);

              }
            }
          }
          else
          {
            if (v22 != 1)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "pn_genericErrorWithLocalizedDescription:", CFSTR("[PNTextEmbeddingService] Found unknown element type in generation result: (%lu)."), 0);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

              goto LABEL_27;
            }
            v24 = objc_msgSend(objc_retainAutorelease(v20), "bytes");
            if (v21)
            {
              v25 = v24;
              for (j = 0; j != v21; ++j)
              {
                v27 = objc_alloc(MEMORY[0x24BDD16E0]);
                _H0 = *(_WORD *)(v25 + 2 * j);
                __asm { FCVT            S0, H0 }
                v34 = (void *)objc_msgSend(v27, "initWithFloat:", _D0);
                objc_msgSend(v23, "insertObject:atIndex:", v34, j);

              }
            }
          }
          v41 = [PNTextEmbeddingResultWithBiasScale alloc];
          objc_msgSend(v17, "bias");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "scale");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = -[PNTextEmbeddingResultWithBiasScale initWithEmbedding:bias:scale:](v41, "initWithEmbedding:bias:scale:", v23, v42, v43);

          v15 = v47;
          objc_msgSend(v47, "addObject:", v44);

          if (++v16 == v49)
          {
            v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
            if (v49)
              goto LABEL_9;
            goto LABEL_24;
          }
        }
        objc_msgSend(MEMORY[0x24BDD1540], "pn_genericErrorWithLocalizedDescription:", CFSTR("[PNTextEmbeddingService] Found empty text embedding generation result."));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_27:

        goto LABEL_28;
      }
LABEL_24:

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_28:
      v6 = 0;

    }
    else
    {
LABEL_3:
      v7 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v6, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pn_genericErrorWithUnderlyingError:localizedDescription:", v6, CFSTR("[PNTextEmbeddingService] Text embedding generation failed: %@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

uint64_t __55__PNTextEmbeddingService_prewarmWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)modelVersion
{
  return (id)objc_msgSend(MEMORY[0x24BE71FF8], "currentUnifiedEmbeddingVersion");
}

+ (id)textEmbeddingSPIVersion
{
  return &unk_25149A2E8;
}

@end
