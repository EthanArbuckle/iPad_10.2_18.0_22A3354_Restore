@implementation SUXMLHTTPRequestOperation

- (SUXMLHTTPRequestOperation)initWithRequestProperties:(id)a3
{
  id v4;
  SUXMLHTTPRequestOperation *v5;
  uint64_t v6;
  SSURLRequestProperties *requestProperties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUXMLHTTPRequestOperation;
  v5 = -[SUXMLHTTPRequestOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestProperties = v5->_requestProperties;
    v5->_requestProperties = (SSURLRequestProperties *)v6;

  }
  return v5;
}

- (id)outputBlock
{
  void *v3;
  void *v4;

  -[SUXMLHTTPRequestOperation lock](self, "lock");
  v3 = (void *)objc_msgSend(self->_outputBlock, "copy");
  -[SUXMLHTTPRequestOperation unlock](self, "unlock");
  v4 = (void *)MEMORY[0x220763634](v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  void *v4;
  id outputBlock;
  id v6;

  v6 = a3;
  -[SUXMLHTTPRequestOperation lock](self, "lock");
  if (self->_outputBlock != v6)
  {
    v4 = (void *)objc_msgSend(v6, "copy");
    outputBlock = self->_outputBlock;
    self->_outputBlock = v4;

  }
  -[SUXMLHTTPRequestOperation unlock](self, "unlock");

}

- (void)run
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  SSURLRequestProperties *requestProperties;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int *v26;
  uint64_t v27;
  id v28;
  id v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  -[SUXMLHTTPRequestOperation loadedURLBagWithContext:returningError:](self, "loadedURLBagWithContext:returningError:", v3, &v29);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v29;
  if (!v4)
  {
    v10 = 0;
    v14 = 0;
    v13 = 0;
    goto LABEL_16;
  }
  -[SSURLRequestProperties URL](self->_requestProperties, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUXMLHTTPRequestOperation _isAllowedURL:withURLBag:](self, "_isAllowedURL:withURLBag:", v6, v4);

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "shouldLog");
    if (objc_msgSend(v15, "shouldLogToDisk"))
      v17 = v16 | 2;
    else
      v17 = v16;
    objc_msgSend(v15, "OSLogObject");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      v17 &= 2u;
    if (v17)
    {
      v19 = (void *)objc_opt_class();
      requestProperties = self->_requestProperties;
      v21 = v19;
      -[SSURLRequestProperties URL](requestProperties, "URL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412546;
      v31 = v19;
      v32 = 2112;
      v33 = v22;
      LODWORD(v27) = 22;
      v26 = &v30;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (!v23)
      {
LABEL_14:

        SSError();
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v10 = 0;
        v14 = 0;
        v13 = 0;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v23, 4, &v30, v27);
      v18 = objc_claimAutoreleasedReturnValue();
      free(v23);
      v26 = (int *)v18;
      SSFileLog();
    }

    goto LABEL_14;
  }
  v8 = objc_alloc_init(MEMORY[0x24BEC8C58]);
  objc_msgSend(MEMORY[0x24BEC8B78], "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDataProvider:", v9);

  objc_msgSend(v8, "setRequestProperties:", self->_requestProperties);
  v28 = v5;
  v10 = -[SUXMLHTTPRequestOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v8, &v28);
  v11 = v28;

  objc_msgSend(v8, "dataProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "output");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "response");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
LABEL_15:

  v5 = v11;
LABEL_16:
  -[SUXMLHTTPRequestOperation outputBlock](self, "outputBlock", v26);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
  {
    (*(void (**)(uint64_t, uint64_t, id, void *, void *))(v24 + 16))(v24, v10, v5, v14, v13);
    -[SUXMLHTTPRequestOperation setOutputBlock:](self, "setOutputBlock:", 0);
  }

}

- (BOOL)_isAllowedURL:(id)a3 withURLBag:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if ((objc_msgSend(v5, "isFileURL") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "valueForKey:", CFSTR("p2-client-options"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("origin-access-whitelist"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "host");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __54__SUXMLHTTPRequestOperation__isAllowedURL_withURLBag___block_invoke;
        v13[3] = &unk_24DE7BCE0;
        v11 = v10;
        v14 = v11;
        v15 = &v16;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);

      }
    }
    v7 = *((_BYTE *)v17 + 24) != 0;

  }
  _Block_object_dispose(&v16, 8);

  return v7;
}

void __54__SUXMLHTTPRequestOperation__isAllowedURL_withURLBag___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v6, 0);
    else
      v7 = 0;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "isEqualToString:", *(_QWORD *)(a1 + 32)))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          *a4 = 1;
          goto LABEL_16;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_16:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong(&self->_outputBlock, 0);
}

@end
