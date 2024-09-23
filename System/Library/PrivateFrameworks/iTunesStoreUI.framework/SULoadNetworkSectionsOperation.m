@implementation SULoadNetworkSectionsOperation

- (SULoadNetworkSectionsOperation)initWithURL:(id)a3 clientInterface:(id)a4
{
  SULoadNetworkSectionsOperation *v6;
  void *v7;
  ISStoreURLOperation *v8;

  v6 = -[SULoadNetworkSectionsOperation init](self, "init");
  if (v6)
  {
    v6->_clientInterface = (SUClientInterface *)a4;
    if (a3)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", a3);
      v8 = (ISStoreURLOperation *)objc_alloc_init(MEMORY[0x24BEC8C30]);
      v6->_baseOperation = v8;
      -[ISStoreURLOperation setTracksPerformanceMetrics:](v8, "setTracksPerformanceMetrics:", SSDebugShouldTrackPerformance());
      -[ISStoreURLOperation setRequestProperties:](v6->_baseOperation, "setRequestProperties:", v7);

    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SULoadNetworkSectionsOperation;
  -[SULoadNetworkSectionsOperation dealloc](&v3, sel_dealloc);
}

- (ISStoreURLOperation)baseOperation
{
  ISStoreURLOperation *v3;

  -[SULoadNetworkSectionsOperation lock](self, "lock");
  v3 = self->_baseOperation;
  -[SULoadNetworkSectionsOperation unlock](self, "unlock");
  return v3;
}

- (NSString)expectedVersionString
{
  NSString *v3;

  -[SULoadNetworkSectionsOperation lock](self, "lock");
  v3 = self->_expectedVersionString;
  -[SULoadNetworkSectionsOperation unlock](self, "unlock");
  return v3;
}

- (SUSectionsResponse)sectionsResponse
{
  SUSectionsResponse *v3;

  -[SULoadNetworkSectionsOperation lock](self, "lock");
  v3 = self->_sectionsResponse;
  -[SULoadNetworkSectionsOperation unlock](self, "unlock");
  return v3;
}

- (void)setBaseOperation:(id)a3
{
  ISStoreURLOperation *baseOperation;

  -[SULoadNetworkSectionsOperation lock](self, "lock");
  baseOperation = self->_baseOperation;
  if (baseOperation != a3)
  {

    self->_baseOperation = (ISStoreURLOperation *)a3;
  }
  -[SULoadNetworkSectionsOperation unlock](self, "unlock");
}

- (void)setExpectedVersionString:(id)a3
{
  NSString *expectedVersionString;

  -[SULoadNetworkSectionsOperation lock](self, "lock");
  expectedVersionString = self->_expectedVersionString;
  if (expectedVersionString != a3)
  {

    self->_expectedVersionString = (NSString *)a3;
  }
  -[SULoadNetworkSectionsOperation unlock](self, "unlock");
}

- (void)run
{
  ISStoreURLOperation *v3;
  id v4;
  void *v5;
  void *v6;
  SUSectionsResponse *v7;
  _BOOL8 v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = self->_baseOperation;
  v4 = objc_alloc_init(MEMORY[0x24BEC8C08]);
  -[ISStoreURLOperation setDataProvider:](v3, "setDataProvider:", v4);
  v5 = (void *)objc_msgSend((id)-[ISStoreURLOperation requestProperties](v3, "requestProperties"), "mutableCopy");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", -[SULoadNetworkSectionsOperation expectedVersionString](self, "expectedVersionString"), CFSTR("version"), 0);
  objc_msgSend(v5, "setCachePolicy:", 1);
  objc_msgSend(v5, "setRequestParameters:", v6);
  -[ISStoreURLOperation setRequestProperties:](v3, "setRequestProperties:", v5);

  v18 = 0;
  if ((-[SULoadNetworkSectionsOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v18) & 1) != 0)
  {
    v7 = -[SUSectionsResponse initWithClientInterface:sectionsDictionary:responseType:]([SUSectionsResponse alloc], "initWithClientInterface:sectionsDictionary:responseType:", self->_clientInterface, objc_msgSend(v4, "output"), 1);
    v8 = -[SULoadNetworkSectionsOperation _loadArtworkForResponse:](self, "_loadArtworkForResponse:", v7);
    if (v8)
    {
      -[SUSectionsResponse dropEmbeddedImages](v7, "dropEmbeddedImages");
    }
    else
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v10 = objc_msgSend(v9, "shouldLog");
      if (objc_msgSend(v9, "shouldLogToDisk"))
        v11 = v10 | 2;
      else
        v11 = v10;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v11 &= 2u;
      if (v11)
      {
        v12 = objc_opt_class();
        v19 = 138412290;
        v20 = v12;
        LODWORD(v17) = 12;
        v16 = &v19;
        v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v19, v17);
          free(v14);
          v16 = (int *)v15;
          SSFileLog();
        }
      }
    }
    -[SUSectionsResponse setCacheable:](v7, "setCacheable:", v8, v16);
    -[SUSectionsResponse setStoreFrontIdentifier:](v7, "setStoreFrontIdentifier:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice"), "storeFrontIdentifier"));
    -[SULoadNetworkSectionsOperation _setSectionsResponse:](self, "_setSectionsResponse:", v7);
    -[SULoadNetworkSectionsOperation setSuccess:](self, "setSuccess:", 1);

  }
  else
  {
    -[SULoadNetworkSectionsOperation setError:](self, "setError:", v18);
  }

}

- (id)_bestItemImageForImages:(id)a3 withImageKind:(id)a4
{
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  int v17;
  double v18;
  double v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
  v7 = v6;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v23;
  v12 = 1.79769313e308;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v23 != v11)
        objc_enumerationMutation(a3);
      v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_msgSend(v14, "imageScale");
      v16 = v15;
      v17 = objc_msgSend((id)objc_msgSend(v14, "imageKind"), "isEqualToString:", a4);
      v18 = vabdd_f64(v16, v7);
      v19 = vabdd_f64(v12, v7);
      if (v17)
        v20 = v18 < v19;
      else
        v20 = 0;
      if (v20)
      {
        v10 = v14;
        v12 = v16;
      }
    }
    v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, v18);
  }
  while (v9);
  return v10;
}

- (id)_copyImageWithURL:(id)a3 scale:(float)a4 error:(id *)a5
{
  uint64_t v9;
  id v10;
  id v11;
  SUImageDataProvider *v12;
  void *v13;
  void *v15;

  v15 = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", CFSTR("data")))
  {
    v9 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", a3, 0, &v15);
    if (v9)
    {
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:scale:", v9, a4);
      if (!a5)
        return v10;
    }
    else
    {
      v10 = 0;
      if (!a5)
        return v10;
    }
    goto LABEL_9;
  }
  v11 = objc_alloc_init(MEMORY[0x24BEC8C30]);
  v12 = objc_alloc_init(SUImageDataProvider);
  -[SUImageDataProvider setInputImageScale:](v12, "setInputImageScale:", a4);
  objc_msgSend(v11, "setDataProvider:", v12);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", a3);
  objc_msgSend(v13, "setCachePolicy:", 1);
  objc_msgSend(v11, "setRequestProperties:", v13);

  if ((-[SULoadNetworkSectionsOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v11, &v15) & 1) != 0)
  {
    v10 = -[ISDataProvider output](v12, "output");
  }
  else
  {
    -[SULoadNetworkSectionsOperation setError:](self, "setError:", v15);
    v10 = 0;
  }

  if (a5)
LABEL_9:
    *a5 = v15;
  return v10;
}

- (id)_copyLoadedItemImage:(id)a3 error:(id *)a4
{
  uint64_t v7;
  double v8;

  v7 = objc_msgSend(a3, "URL");
  objc_msgSend(a3, "imageScale");
  *(float *)&v8 = v8;
  return -[SULoadNetworkSectionsOperation _copyImageWithURL:scale:error:](self, "_copyImageWithURL:scale:error:", v7, a4, v8);
}

- (BOOL)_loadArtworkForResponse:(id)a3
{
  uint64_t i;
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  _BOOL4 v42;
  id v43;
  id v44;
  id v45;
  id v46;
  BOOL v47;
  BOOL v48;
  void *v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  int *v56;
  uint64_t v57;
  BOOL v59;
  id obj;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  int v79;
  uint64_t v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = (id)objc_msgSend(a3, "allSections");
  v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
  if (v66)
  {
    v64 = *MEMORY[0x24BEB2618];
    v65 = *(_QWORD *)v76;
    v62 = *MEMORY[0x24BEB2620];
    v63 = *MEMORY[0x24BEB2630];
    v61 = *MEMORY[0x24BEB2628];
    v59 = 1;
    do
    {
      for (i = 0; i != v66; ++i)
      {
        if (*(_QWORD *)v76 != v65)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        v6 = -[SULoadNetworkSectionsOperation _bestItemImageForImages:withImageKind:](self, "_bestItemImageForImages:withImageKind:", objc_msgSend(v5, "itemImages", v56, v57), v64);
        if (v6)
        {
          v7 = -[SULoadNetworkSectionsOperation _copyLoadedItemImage:error:](self, "_copyLoadedItemImage:error:", v6, 0);
          v8 = v7 != 0;
          objc_msgSend(v5, "setImage:", v7);

        }
        else
        {
          v8 = 1;
        }
        v9 = -[SULoadNetworkSectionsOperation _bestItemImageForImages:withImageKind:](self, "_bestItemImageForImages:withImageKind:", objc_msgSend(v5, "itemImages"), v63);
        if (v9)
        {
          v10 = -[SULoadNetworkSectionsOperation _copyLoadedItemImage:error:](self, "_copyLoadedItemImage:error:", v9, 0);
          if (!v10)
            v8 = 0;
          objc_msgSend(v5, "setSelectedImage:", v10);

        }
        v11 = -[SULoadNetworkSectionsOperation _bestItemImageForImages:withImageKind:](self, "_bestItemImageForImages:withImageKind:", objc_msgSend(v5, "itemImages"), v62);
        if (v11)
        {
          v12 = -[SULoadNetworkSectionsOperation _copyLoadedItemImage:error:](self, "_copyLoadedItemImage:error:", v11, 0);
          if (!v12)
            v8 = 0;
          objc_msgSend(v5, "setMoreListImage:", v12);

        }
        v13 = -[SULoadNetworkSectionsOperation _bestItemImageForImages:withImageKind:](self, "_bestItemImageForImages:withImageKind:", objc_msgSend(v5, "itemImages"), v61);
        if (v13)
        {
          v14 = -[SULoadNetworkSectionsOperation _copyLoadedItemImage:error:](self, "_copyLoadedItemImage:error:", v13, 0);
          if (!v14)
            v8 = 0;
          objc_msgSend(v5, "setSelectedMoreListImage:", v14);

        }
        v15 = (void *)objc_msgSend(v5, "leftSectionButtons");
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v72;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v72 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
              v21 = objc_msgSend(v20, "imageURL");
              if (v21)
              {
                v22 = v21;
                objc_msgSend(v20, "imageURLScale");
                v23 = -[SULoadNetworkSectionsOperation _copyImageWithURL:scale:error:](self, "_copyImageWithURL:scale:error:", v22, 0);
                v8 &= v23 != 0;
                objc_msgSend(v5, "setSectionButtonImage:forTag:", v23, objc_msgSend(v20, "tag"));

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
          }
          while (v17);
        }
        v24 = (void *)objc_msgSend(v5, "rightSectionButtons");
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v68;
          do
          {
            for (k = 0; k != v26; ++k)
            {
              if (*(_QWORD *)v68 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * k);
              v30 = objc_msgSend(v29, "imageURL");
              if (v30)
              {
                v31 = v30;
                objc_msgSend(v29, "imageURLScale");
                v32 = -[SULoadNetworkSectionsOperation _copyImageWithURL:scale:error:](self, "_copyImageWithURL:scale:error:", v31, 0);
                v8 &= v32 != 0;
                objc_msgSend(v5, "setSectionButtonImage:forTag:", v32, objc_msgSend(v29, "tag"));

              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v83, 16);
          }
          while (v26);
        }
        if ((v8 & 1) == 0)
        {
          v33 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v34 = objc_msgSend(v33, "shouldLog");
          if (objc_msgSend(v33, "shouldLogToDisk"))
            v34 |= 2u;
          if (!os_log_type_enabled((os_log_t)objc_msgSend(v33, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
            v34 &= 2u;
          if (v34)
          {
            v35 = objc_opt_class();
            v79 = 138412546;
            v80 = v35;
            v81 = 2112;
            v82 = v5;
            LODWORD(v57) = 22;
            v56 = &v79;
            v36 = _os_log_send_and_compose_impl();
            if (v36)
            {
              v37 = (void *)v36;
              v38 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v36, 4, &v79, v57);
              free(v37);
              v56 = (int *)v38;
              SSFileLog();
            }
          }
          v59 = 0;
        }
      }
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
    }
    while (v66);
  }
  else
  {
    v59 = 1;
  }
  v39 = (void *)objc_msgSend((id)objc_msgSend(a3, "moreListImageCollection", v56), "itemImages");
  if (!objc_msgSend(v39, "count"))
    return v59;
  v40 = -[SULoadNetworkSectionsOperation _bestItemImageForImages:withImageKind:](self, "_bestItemImageForImages:withImageKind:", v39, *MEMORY[0x24BEB2618]);
  if (!v40)
  {
    v45 = -[SULoadNetworkSectionsOperation _bestItemImageForImages:withImageKind:](self, "_bestItemImageForImages:withImageKind:", v39, *MEMORY[0x24BEB2630]);
    if (v45)
    {
      v44 = v45;
      v42 = 1;
LABEL_58:
      v46 = -[SULoadNetworkSectionsOperation _copyLoadedItemImage:error:](self, "_copyLoadedItemImage:error:", v44, 0);
      objc_msgSend(a3, "setMoreListSelectedImage:", v46);

      v47 = !v42 || v46 == 0;
      v48 = v59;
      if (!v47)
        return v48;
      goto LABEL_65;
    }
    return v59;
  }
  v41 = -[SULoadNetworkSectionsOperation _copyLoadedItemImage:error:](self, "_copyLoadedItemImage:error:", v40, 0);
  v42 = v41 != 0;
  objc_msgSend(a3, "setMoreListImage:", v41);

  v43 = -[SULoadNetworkSectionsOperation _bestItemImageForImages:withImageKind:](self, "_bestItemImageForImages:withImageKind:", v39, *MEMORY[0x24BEB2630]);
  if (v43)
  {
    v44 = v43;
    goto LABEL_58;
  }
  v48 = v59;
  if (v41)
    return v48;
LABEL_65:
  v49 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v50 = objc_msgSend(v49, "shouldLog");
  if (objc_msgSend(v49, "shouldLogToDisk"))
    v51 = v50 | 2;
  else
    v51 = v50;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v49, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v51 &= 2u;
  if (v51)
  {
    v52 = objc_opt_class();
    v79 = 138412290;
    v80 = v52;
    LODWORD(v57) = 12;
    v53 = _os_log_send_and_compose_impl();
    if (v53)
    {
      v54 = (void *)v53;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v53, 4, &v79, v57);
      free(v54);
      SSFileLog();
    }
  }
  return 0;
}

- (void)_setSectionsResponse:(id)a3
{
  SUSectionsResponse *sectionsResponse;

  -[SULoadNetworkSectionsOperation lock](self, "lock");
  sectionsResponse = self->_sectionsResponse;
  if (sectionsResponse != a3)
  {

    self->_sectionsResponse = (SUSectionsResponse *)a3;
  }
  -[SULoadNetworkSectionsOperation unlock](self, "unlock");
}

@end
