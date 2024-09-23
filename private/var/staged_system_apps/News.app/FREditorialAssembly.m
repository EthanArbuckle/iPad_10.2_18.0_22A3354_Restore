@implementation FREditorialAssembly

- (FREditorialAssembly)initWithFeldsparContext:(id)a3 dataProviderFactory:(id)a4
{
  id v7;
  id v8;
  FREditorialAssembly *v9;
  FREditorialAssembly *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FREditorialAssembly;
  v9 = -[FREditorialAssembly init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feldsparContext, a3);
    objc_storeStrong((id *)&v10->_dataProviderFactory, a4);
  }

  return v10;
}

- (void)loadInRegistry:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v6 = objc_msgSend(v5, "registerProtocol:factory:", &OBJC_PROTOCOL___FRToCEditorialManager, &stru_1000DEA38);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v8 = objc_msgSend(v7, "registerProtocol:factory:", &OBJC_PROTOCOL___TSEditorialItemProvider, &stru_1000DEA78);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "registerProtocol:factory:", &OBJC_PROTOCOL___NUFontRegistration, &stru_1000DEAB8));
  v11 = objc_msgSend(v10, "inScope:", 2);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContainer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "registerProtocol:name:factory:", &OBJC_PROTOCOL___FREditorialItemDownloader, CFSTR("editorialTagDownloader"), &stru_1000DEAF8));
  v14 = objc_msgSend(v13, "inScope:", 2);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContainer"));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10000CED0;
  v46[3] = &unk_1000DEB20;
  v46[4] = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "registerProtocol:name:factory:", &OBJC_PROTOCOL___FREditorialItemDownloader, CFSTR("editorialArticleDownloader"), v46));
  v17 = objc_msgSend(v16, "inScope:", 2);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContainer"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "registerProtocol:factory:", &OBJC_PROTOCOL___FRArticleEditorialItemProvider, &stru_1000DEB60));
  v20 = objc_msgSend(v19, "inScope:", 2);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContainer"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "registerProtocol:factory:", &OBJC_PROTOCOL___FREditorialItemEntryManager, &stru_1000DEBA0));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "withConfiguration:", &stru_1000DEBE0));
  v24 = objc_msgSend(v23, "inScope:", 2);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContainer"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "registerProtocol:factory:", &OBJC_PROTOCOL___FREditorialItemCreator, &stru_1000DEC20));
  v27 = objc_msgSend(v26, "inScope:", 2);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContainer"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "registerProtocol:factory:", &OBJC_PROTOCOL___FREditorialItemThumbnailCreator, &stru_1000DEC60));
  v30 = objc_msgSend(v29, "inScope:", 2);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContainer"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "registerProtocol:factory:", &OBJC_PROTOCOL___FREditorialConfigurationProvider, &stru_1000DECA0));
  v33 = objc_msgSend(v32, "inScope:", 2);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContainer"));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100007498;
  v45[3] = &unk_1000DECC8;
  v45[4] = self;
  v36 = objc_msgSend(v34, "registerClass:name:factory:", objc_opt_class(FCKeyValueStore, v35), CFSTR("editorialLocalStore"), v45);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = objc_msgSend(v37, "inScope:", 2);

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContainer"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10000E14C;
  v44[3] = &unk_1000DECF0;
  v44[4] = self;
  v41 = objc_msgSend(v39, "registerClass:factory:", objc_opt_class(FRToCEditorialManager, v40), v44);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  v43 = objc_msgSend(v42, "inScope:", 2);

}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (FRFlintDataProviderFactory)dataProviderFactory
{
  return self->_dataProviderFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProviderFactory, 0);
  objc_storeStrong((id *)&self->_feldsparContext, 0);
}

@end
