@implementation WCRURLList

- (WCRURLList)init
{
  WCRURLList *v2;
  NSMutableArray *v3;
  NSMutableArray *urlStringList;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WCRURLList;
  v2 = -[WCRURLList init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    urlStringList = v2->_urlStringList;
    v2->_urlStringList = v3;

  }
  return v2;
}

+ (id)_formattedStringFromURLString:(id)a3 fromBrowser:(BOOL)a4 removePort:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "stringByRemovingPercentEncoding");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = v7;
  objc_msgSend(v8, "stringByAddingPercentEscapesUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "port");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "pathComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  v15 = v10;
  v16 = v15;
  v17 = v15;
  if (v5)
  {
    v17 = v15;
    if (v12)
    {
      v18 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v11, "port");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR(":%@"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", v20, &stru_251BCC5E8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v11, "scheme");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "scheme");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@://"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", v24, &stru_251BCC5E8);
    v25 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v25;
  }
  if (objc_msgSend(v17, "hasPrefix:", CFSTR("www.")))
  {
    objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("www."), &stru_251BCC5E8);
    v26 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v26;
  }
  if (v17 && (objc_msgSend(v17, "hasPrefix:", CFSTR(".")) & 1) == 0)
  {
    objc_msgSend(CFSTR("."), "stringByAppendingString:", v17);
    v27 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v27;
  }
  if ((v14 < 2 || v6) && (objc_msgSend(v17, "hasSuffix:", CFSTR("/")) & 1) == 0)
  {
    objc_msgSend(v17, "stringByAppendingString:", CFSTR("/"));
    v28 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v28;
  }

  return v17;
}

- (void)addURLString:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10 = v4;
    v6 = objc_msgSend(v4, "isEqualToString:", &stru_251BCC5E8);
    v5 = v10;
    if ((v6 & 1) == 0)
    {
      objc_msgSend((id)objc_opt_class(), "_formattedStringFromURLString:fromBrowser:removePort:", v10, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[WCRURLList urlStringList](self, "urlStringList");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(v8, "addObject:", v9);

      }
      v5 = v10;
    }
  }

}

- (BOOL)containsURLString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t j;
  WCRURLList *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WCRURLList urlStringList](self, "urlStringList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "_formattedStringFromURLString:fromBrowser:removePort:", v4, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v25 = self;
    -[WCRURLList urlStringList](self, "urlStringList");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v7, "containsString:", v12))
          {
            if (objc_msgSend(v12, "hasPrefix:", CFSTR("http")))
            {
              v13 = v12;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("http://%@"), v12);
              v13 = (id)objc_claimAutoreleasedReturnValue();
            }
            v14 = v13;
            if (objc_msgSend(v7, "hasPrefix:", CFSTR("http")))
            {
              v15 = v7;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("http://%@"), v7);
              v15 = (id)objc_claimAutoreleasedReturnValue();
            }
            v16 = v15;
            objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "host");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "host");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18 && (objc_msgSend(v20, "hasSuffix:", v18) & 1) != 0)
            {

              LOBYTE(v21) = 1;
              goto LABEL_23;
            }

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v9)
          continue;
        break;
      }
    }

    objc_msgSend((id)objc_opt_class(), "_formattedStringFromURLString:fromBrowser:removePort:", v4, 1, 1);
    obj = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(obj, "isEqualToString:", v7) & 1) != 0)
    {
      LOBYTE(v21) = 0;
    }
    else
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      -[WCRURLList urlStringList](v25, "urlStringList");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v21)
      {
        v23 = *(_QWORD *)v28;
        while (2)
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v28 != v23)
              objc_enumerationMutation(v14);
            if ((objc_msgSend(obj, "containsString:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j)) & 1) != 0)
            {
              LOBYTE(v21) = 1;
              goto LABEL_23;
            }
          }
          v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v21)
            continue;
          break;
        }
      }
LABEL_23:

    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (NSMutableArray)urlStringList
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUrlStringList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlStringList, 0);
}

@end
