@implementation WLBookmarksMigrator

- (void)enable
{
  WLFeaturePayload **p_featurePayload;
  id WeakRetained;
  id v4;

  p_featurePayload = &self->_featurePayload;
  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setEnabled:", 1);

  v4 = objc_loadWeakRetained((id *)p_featurePayload);
  objc_msgSend(v4, "setState:", CFSTR("enabled"));

}

- (void)setState:(id)a3
{
  WLFeaturePayload **p_featurePayload;
  id v4;
  id WeakRetained;

  p_featurePayload = &self->_featurePayload;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_featurePayload);
  objc_msgSend(WeakRetained, "setState:", v4);

}

- (void)setEstimatedDataSize:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setSize:", a3);

}

- (void)addWorkingTime:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setElapsedTime:", objc_msgSend(WeakRetained, "elapsedTime") + a3);

}

+ (id)contentType
{
  return CFSTR("bookmarks");
}

- (id)contentType
{
  return +[WLBookmarksMigrator contentType](WLBookmarksMigrator, "contentType");
}

- (id)dataType
{
  return +[WLBookmarksMigrator contentType](WLBookmarksMigrator, "contentType");
}

- (BOOL)accountBased
{
  return 1;
}

- (BOOL)storeRecordDataInDatabase
{
  return 1;
}

- (BOOL)wantsSegmentedDownloads
{
  return 0;
}

- (void)estimateItemSizeForSummary:(id)a3 account:(id)a4
{
  id v4;

  v4 = a3;
  if (!objc_msgSend(v4, "itemSize"))
    objc_msgSend(v4, "setItemSize:", 3072);

}

- (id)importWillBegin
{
  id WeakRetained;
  WebBookmarkCollection *v4;
  WebBookmarkCollection *collection;
  WebBookmarkCollection *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString **v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  WLBookmarksMigrator *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setSize:", 0);

  _WLLog();
  if (objc_msgSend(MEMORY[0x24BEC2730], "lockSync", self))
  {
    objc_msgSend(MEMORY[0x24BEC2730], "safariBookmarkCollection");
    v4 = (WebBookmarkCollection *)objc_claimAutoreleasedReturnValue();
    collection = self->_collection;
    self->_collection = v4;

    if (self->_collection)
      return 0;
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BEC2878];
    v18 = *MEMORY[0x24BDD0FC8];
    v19 = CFSTR("Bookmarks migrator couldn't create collection.");
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = &v19;
    v12 = &v18;
  }
  else
  {
    v15 = self;
    _WLLog();
    v7 = self->_collection;
    self->_collection = 0;

    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BEC2878];
    v16 = *MEMORY[0x24BDD0FC8];
    v17 = CFSTR("Bookmarks migrator couldn't obtain lock.");
    v10 = (void *)MEMORY[0x24BDBCE70];
    v11 = &v17;
    v12 = &v16;
  }
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1, v15, v16, v17, v18, v19, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_createBookmarkFolderWithTitle:(id)a3 UUID:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = (objc_class *)MEMORY[0x24BDBCED8];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithCapacity:", 4);
  objc_msgSend(v8, "setObject:forKey:", CFSTR("WebBookmarkTypeList"), CFSTR("WebBookmarkType"));
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("WebBookmarkUUID"));

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("Children"));

  if (v5)
    objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("Title"));

  return v8;
}

+ (id)_createRootBookmarkFolder
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[WLBookmarksMigrator _createBookmarkFolderWithTitle:UUID:](WLBookmarksMigrator, "_createBookmarkFolderWithTitle:UUID:", 0, CFSTR("Root"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Children"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLBookmarksMigrator _createBookmarkFolderWithTitle:UUID:](WLBookmarksMigrator, "_createBookmarkFolderWithTitle:UUID:", CFSTR("BookmarksBar"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v6);
  return v2;
}

+ (id)_bookmarkFolderAtTitlePath:(id)a3 withinBookmarkFolder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v24 = a1;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v7;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Children"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Title"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v8, "isEqualToString:", v15);

        if ((v16 & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v18 = v14;

      v17 = v24;
      if (v18)
        goto LABEL_13;
    }
    else
    {
LABEL_10:

      v17 = v24;
    }
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_createBookmarkFolderWithTitle:UUID:", v8, v20);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v18);
LABEL_13:
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_bookmarkFolderAtTitlePath:withinBookmarkFolder:", v21, v18);
      v22 = objc_claimAutoreleasedReturnValue();

      v18 = (id)v22;
    }
    v7 = v25;

  }
  else
  {
    v18 = v7;
  }

  return v18;
}

+ (id)_bookmarkFolderAtTitlePath:(id)a3 withinRootFolder:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Children"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "pathComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_bookmarkFolderAtTitlePath:withinBookmarkFolder:", v9, v8);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }

  return v8;
}

- (void)importDataFromProvider:(id)a3 forSummaries:(id)a4 summaryStart:(id)a5 summaryCompletion:(id)a6
{
  id v9;
  void (**v10)(id, _QWORD);
  WLFeaturePayload **p_featurePayload;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  WebBookmarkCollection *collection;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void (**v51)(id, _QWORD);
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id obj;
  void *v57;
  uint64_t v59;
  void (**v60)(id, _QWORD);
  uint64_t v61;
  void (**v62)(id, uint64_t, _QWORD);
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;
  const __CFString *v75;
  const __CFString *v76;
  void *v77;
  _QWORD v78[4];
  _QWORD v79[4];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v60 = (void (**)(id, _QWORD))a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v62 = (void (**)(id, uint64_t, _QWORD))a6;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  +[WLBookmarksMigrator _createRootBookmarkFolder](WLBookmarksMigrator, "_createRootBookmarkFolder");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v9;
  v51 = v10;
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
  if (v61)
  {
    p_featurePayload = &self->_featurePayload;
    v59 = *(_QWORD *)v70;
    v47 = *MEMORY[0x24BDD0FC8];
    v48 = *MEMORY[0x24BEC2878];
    do
    {
      for (i = 0; i != v61; ++i)
      {
        if (*(_QWORD *)v70 != v59)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
        if (v10)
          v10[2](v10, *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i));
        v60[2](v60, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)p_featurePayload);
        objc_msgSend(WeakRetained, "setCount:", objc_msgSend(WeakRetained, "count") + 1);

        v16 = objc_loadWeakRetained((id *)p_featurePayload);
        objc_msgSend(v16, "setSize:", objc_msgSend(v16, "size") + objc_msgSend(v14, "length"));

        if (v14)
        {
          v68 = 0;
          objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v14, 0, &v68);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v68;
          if (!v18)
          {
            if (v17)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v19 = v17;
                objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("itemID"));
                v20 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("itemTitle"));
                v21 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("itemFolder"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = v19;
                objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("itemUrl"));
                v46 = objc_claimAutoreleasedReturnValue();
                v57 = (void *)v21;
                v43 = v20;
                v45 = v21;
                v23 = (void *)v20;
                _WLLog();
                v55 = (void *)v46;
                if (v46 && v57 && v22)
                {
                  v79[0] = CFSTR("WebBookmarkTypeLeaf");
                  v78[0] = CFSTR("WebBookmarkType");
                  v78[1] = CFSTR("WebBookmarkUUID");
                  objc_msgSend(MEMORY[0x24BDD1880], "UUID", self, v20, v45, v22, v46);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "UUIDString");
                  v25 = v22;
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v79[1] = v26;
                  v78[2] = CFSTR("URIDictionary");
                  v76 = CFSTR("title");
                  v77 = v57;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
                  v52 = v23;
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v78[3] = CFSTR("URLString");
                  v79[2] = v27;
                  v79[3] = v55;
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v79, v78, 4);
                  v28 = objc_claimAutoreleasedReturnValue();

                  v22 = v25;
                  +[WLBookmarksMigrator _bookmarkFolderAtTitlePath:withinRootFolder:](WLBookmarksMigrator, "_bookmarkFolderAtTitlePath:withinRootFolder:", v25, v49);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Children"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = (void *)v28;
                  objc_msgSend(v30, "addObject:", v28);
                  objc_msgSend(v50, "addObject:", v13);

                  v23 = v52;
                  v10 = v51;

                  v19 = v54;
                  p_featurePayload = &self->_featurePayload;
                }
                else if (!v46 && v57 && v22)
                {
                  _WLLog();
                  p_featurePayload = &self->_featurePayload;
                  if (v62)
                    v62[2](v62, v13, 0);
                }
                else
                {
                  _WLLog();
                  p_featurePayload = &self->_featurePayload;
                  if (v62)
                  {
                    v32 = (void *)MEMORY[0x24BDD1540];
                    v74 = v47;
                    v75 = CFSTR("Bookmark had missing property");
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1, self, v43, v45, v22, v46);
                    v53 = v23;
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v48, 1, v33);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    ((void (**)(id, uint64_t, void *))v62)[2](v62, v13, v34);

                    v10 = v51;
                    v23 = v53;
                  }
                }

              }
            }
          }

        }
        else
        {
          _WLLog();
          if (v62)
            v62[2](v62, v13, 0);
        }

      }
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
    }
    while (v61);
  }

  if (objc_msgSend(v50, "count"))
  {
    _WLLog();
    collection = self->_collection;
    v67 = 0;
    v36 = -[WebBookmarkCollection mergeWithBookmarksDictionary:clearHidden:error:](collection, "mergeWithBookmarksDictionary:clearHidden:error:", v49, 0, &v67, self, v49);
    v37 = v67;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v36);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    if (v62)
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      v38 = v50;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v63, v73, 16, self, v44, v37);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v64;
        do
        {
          for (j = 0; j != v40; ++j)
          {
            if (*(_QWORD *)v64 != v41)
              objc_enumerationMutation(v38);
            ((void (**)(id, uint64_t, id))v62)[2](v62, *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j), v37);
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
        }
        while (v40);
      }

    }
    v10 = v51;
  }

}

- (id)importDidEnd
{
  WebBookmarkCollection *collection;

  _WLLog();
  collection = self->_collection;
  if (collection)
  {
    self->_collection = 0;

    objc_msgSend(MEMORY[0x24BEC2730], "unlockSync", self);
  }
  return 0;
}

- (WLFeaturePayload)featurePayload
{
  return (WLFeaturePayload *)objc_loadWeakRetained((id *)&self->_featurePayload);
}

- (void)setFeaturePayload:(id)a3
{
  objc_storeWeak((id *)&self->_featurePayload, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_featurePayload);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
