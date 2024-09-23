@implementation WLFilesMigrator

- (WLFilesMigrator)init
{
  WLFilesMigrator *v2;
  WLFileProvider *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WLFilesMigrator;
  v2 = -[WLFilesMigrator init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(WLFileProvider);
    -[WLFileProvider fetchRootPath](v3, "fetchRootPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[WLFilesMigrator setRootPath:](v2, "setRootPath:", v4);
    else
      _WLLog();

  }
  return v2;
}

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

- (BOOL)accountBased
{
  return 0;
}

+ (id)contentType
{
  return CFSTR("files/binary");
}

- (id)contentType
{
  return +[WLFilesMigrator contentType](WLFilesMigrator, "contentType");
}

- (id)dataType
{
  return CFSTR("files");
}

- (BOOL)storeRecordDataInDatabase
{
  return 0;
}

- (BOOL)wantsSegmentedDownloads
{
  return 1;
}

- (id)importWillBegin
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setSize:", 0);

  return 0;
}

- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6
{
  uint64_t v6;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id WeakRetained;
  id v29;
  NSString *rootPath;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  const __CFString *v60;
  uint64_t v61;
  const __CFString *v62;
  uint64_t v63;
  const __CFString *v64;
  _BYTE v65[128];
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a6;
  if (objc_msgSend(v9, "itemSize") && self->_rootPath)
  {
    objc_msgSend(v9, "bucket");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v9, "bucket");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pathComponents");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v13, "count") <= 1)
      {
        _WLLog();
        if (!v10)
        {
LABEL_37:

          goto LABEL_38;
        }
        v14 = (void *)MEMORY[0x24BDD1540];
        v15 = *MEMORY[0x24BEC2880];
        v66 = *MEMORY[0x24BDD0FC8];
        v67 = CFSTR("WLFilesMigrator cannot move a file to a restricted path.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 6, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_26;
      }
      v51 = v6;
      v52 = v13;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v22 = v13;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v56;
LABEL_13:
        v26 = 0;
        while (1)
        {
          if (*(_QWORD *)v56 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v26);
          if ((objc_msgSend(v27, "isEqualToString:", CFSTR(".."), v51) & 1) != 0
            || (objc_msgSend(v27, "isEqualToString:", CFSTR("~")) & 1) != 0)
          {
            break;
          }
          if (v24 == ++v26)
          {
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
            if (v24)
              goto LABEL_13;
            goto LABEL_20;
          }
        }

        _WLLog();
        v13 = v52;
        if (!v10)
          goto LABEL_37;
        v42 = (void *)MEMORY[0x24BDD1540];
        v43 = *MEMORY[0x24BEC2880];
        v63 = *MEMORY[0x24BDD0FC8];
        v64 = CFSTR("WLFilesMigrator cannot move a file to a restricted path.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "errorWithDomain:code:userInfo:", v43, 6, v44);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
        v10[2](v10, 0, v17);
LABEL_36:

        goto LABEL_37;
      }
LABEL_20:

      WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
      objc_msgSend(WeakRetained, "setCount:", objc_msgSend(WeakRetained, "count") + 1);

      v29 = objc_loadWeakRetained((id *)&self->_featurePayload);
      objc_msgSend(v29, "setSize:", objc_msgSend(v29, "size") + objc_msgSend(v9, "itemSize"));

      objc_msgSend(v9, "dataFilePath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      rootPath = self->_rootPath;
      objc_msgSend(v9, "bucket");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByAppendingPathComponent:](rootPath, "stringByAppendingPathComponent:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "stringByDeletingLastPathComponent");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "fileExistsAtPath:", v33);

      if ((v35 & 1) != 0
        || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
            v36 = (void *)objc_claimAutoreleasedReturnValue(),
            v54 = 0,
            objc_msgSend(v36, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v33, 1, 0, &v54), v37 = v54, v36, !v37))
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v51);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "fileExistsAtPath:", v32);

        if ((v46 & 1) != 0
          || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
              v47 = (void *)objc_claimAutoreleasedReturnValue(),
              v53 = 0,
              objc_msgSend(v47, "moveItemAtPath:toPath:error:", v17, v32, &v53),
              v37 = v53,
              v47,
              !v37))
        {
          if (v10)
            v10[2](v10, 1, 0);
          v37 = 0;
          goto LABEL_35;
        }
        _WLLog();
        if (v10)
        {
          v48 = (void *)MEMORY[0x24BDD1540];
          v49 = *MEMORY[0x24BEC2878];
          v59 = *MEMORY[0x24BDD0FC8];
          v60 = CFSTR("NSFileManager could not move a file.");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "errorWithDomain:code:userInfo:", v49, 1, v50);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v10[2](v10, 1, v41);
          goto LABEL_31;
        }
      }
      else
      {
        _WLLog();
        if (v10)
        {
          v38 = (void *)MEMORY[0x24BDD1540];
          v39 = *MEMORY[0x24BEC2878];
          v61 = *MEMORY[0x24BDD0FC8];
          v62 = CFSTR("NSFileManager could not create a directory with intermediate directories.");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "errorWithDomain:code:userInfo:", v39, 1, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          v10[2](v10, 0, v41);
LABEL_31:

        }
      }
LABEL_35:
      v13 = v52;

      goto LABEL_36;
    }
    _WLLog();
    if (v10)
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BEC2878];
      v68 = *MEMORY[0x24BDD0FC8];
      v69[0] = CFSTR("Bucket is not specified and it can not import the file.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 1, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v10[2](v10, 0, v21);
    }
  }
  else
  {
    _WLLog();
    if (v10)
      v10[2](v10, 1, 0);
  }
LABEL_38:

}

- (WLFeaturePayload)featurePayload
{
  return (WLFeaturePayload *)objc_loadWeakRetained((id *)&self->_featurePayload);
}

- (void)setFeaturePayload:(id)a3
{
  objc_storeWeak((id *)&self->_featurePayload, a3);
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void)setRootPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_destroyWeak((id *)&self->_featurePayload);
}

@end
