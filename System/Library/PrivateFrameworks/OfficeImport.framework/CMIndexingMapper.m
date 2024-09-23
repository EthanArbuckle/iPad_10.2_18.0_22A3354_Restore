@implementation CMIndexingMapper

- (void)mapSummaryWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CMMapper document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    objc_msgSend(v4, "searchableAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v10);

  }
  objc_msgSend(v6, "author");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    objc_msgSend(v4, "searchableAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "author");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAuthorNames:", v15);

  }
  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v6, "keywords");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length") == 0;

  if (!v18)
  {
    objc_msgSend(v6, "keywords");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v19);

  }
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(v4, "searchableAttributes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setKeywords:", v16);

  }
  objc_msgSend(v6, "subject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length") == 0;

  if (!v22)
  {
    objc_msgSend(v4, "searchableAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSubject:", v24);

  }
  objc_msgSend(v6, "company");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "length") == 0;

  if (!v26)
  {
    objc_msgSend(v4, "searchableAttributes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "company");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setOrganizations:", v29);

  }
  objc_msgSend(v6, "comments");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "length") == 0;

  if (!v31)
  {
    objc_msgSend(v4, "searchableAttributes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "comments");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setComment:", v33);

  }
}

@end
