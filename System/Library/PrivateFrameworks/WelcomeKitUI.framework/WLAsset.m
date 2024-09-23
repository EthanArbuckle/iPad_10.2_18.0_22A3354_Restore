@implementation WLAsset

- (WLAsset)initWithName:(id)a3 remoteURL:(id)a4
{
  id v6;
  id v7;
  WLAsset *v8;
  WLAsset *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WLAsset;
  v8 = -[WLAsset init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    -[WLAsset setName:](v8, "setName:", v6);
    -[WLAsset setRemoteURL:](v9, "setRemoteURL:", v7);
    objc_msgSend(CFSTR("/Library/WelcomeKit/Downloads/"), "stringByAppendingPathComponent:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSHomeDirectory();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLAsset setLocalFile:](v9, "setLocalFile:", v12);

  }
  return v9;
}

- (BOOL)download
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  id v54[2];

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByDeletingLastPathComponent](self->_localFile, "stringByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "fileExistsAtPath:", v4) & 1) != 0
    || (v54[0] = 0,
        objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, v54),
        (v5 = v54[0]) == 0))
  {
    if (objc_msgSend(v3, "fileExistsAtPath:", self->_localFile))
    {
      v7 = 1;
      _WLLog();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", self->_remoteURL);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1840], "requestWithURL:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = dispatch_semaphore_create(0);
      v50 = 0;
      v51 = &v50;
      v52 = 0x2020000000;
      v53 = 0;
      v44 = 0;
      v45 = &v44;
      v46 = 0x3032000000;
      v47 = __Block_byref_object_copy_;
      v48 = __Block_byref_object_dispose_;
      v49 = 0;
      v40 = 0;
      v41 = &v40;
      v42 = 0x2020000000;
      v43 = 0;
      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy_;
      v38 = __Block_byref_object_dispose_;
      v39 = 0;
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __19__WLAsset_download__block_invoke;
      v28[3] = &unk_24E1491E8;
      v30 = &v44;
      v31 = &v40;
      v32 = &v34;
      v33 = &v50;
      v13 = v12;
      v29 = v13;
      v26 = v11;
      objc_msgSend(v11, "downloadTaskWithRequest:completionHandler:", v9, v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "resume");
      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
      v23 = v45[5];
      v24 = v35[5];
      v21 = *((unsigned __int8 *)v51 + 24);
      v22 = v41[3];
      _WLLog();
      if (*((_BYTE *)v51 + 24))
      {
        v25 = v10;
        v15 = v9;
        v16 = v8;
        v17 = v35[5];
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", self->_localFile, v21, v22, v23, v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        LOBYTE(v17) = objc_msgSend(v3, "moveItemAtURL:toURL:error:", v17, v18, &v27);
        v19 = v27;
        *((_BYTE *)v51 + 24) = v17;

        if (!*((_BYTE *)v51 + 24) || v19)
          _WLLog();

        v7 = *((_BYTE *)v51 + 24) != 0;
        v8 = v16;
        v9 = v15;
        v10 = v25;
      }
      else
      {
        v7 = 0;
      }

      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(&v40, 8);
      _Block_object_dispose(&v44, 8);

      _Block_object_dispose(&v50, 8);
    }
    v6 = 0;
  }
  else
  {
    v6 = v5;
    _WLLog();
    v7 = 0;
  }

  return v7;
}

void __19__WLAsset_download__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  BOOL v10;
  id v11;

  v11 = a2;
  v8 = a3;
  v9 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v8, "statusCode");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  if (v9)
    v10 = 0;
  else
    v10 = (unint64_t)(objc_msgSend(v8, "statusCode") - 200) < 0x64;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v10;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)localFile
{
  return self->_localFile;
}

- (void)setLocalFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)remoteURL
{
  return self->_remoteURL;
}

- (void)setRemoteURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_localFile, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
