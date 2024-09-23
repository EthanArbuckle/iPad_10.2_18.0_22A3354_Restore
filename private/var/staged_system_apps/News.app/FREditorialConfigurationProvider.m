@implementation FREditorialConfigurationProvider

- (FREditorialConfigurationProvider)initWithAppConfigurationManager:(id)a3
{
  id v5;
  FREditorialConfigurationProvider *v6;
  FREditorialConfigurationProvider *v7;
  objc_super v9;

  v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000846F8();
  v9.receiver = self;
  v9.super_class = (Class)FREditorialConfigurationProvider;
  v6 = -[FREditorialConfigurationProvider init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appConfigurationManager, a3);

  return v7;
}

- (FREditorialConfigurationProvider)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FREditorialConfigurationProvider init]";
    v7 = 2080;
    v8 = "FREditorialConfigurationProvider.m";
    v9 = 1024;
    v10 = 21;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FREditorialConfigurationProvider init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (void)fetchEditorialConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialConfigurationProvider appConfigurationManager](self, "appConfigurationManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100072BD8;
  v7[3] = &unk_1000DAFA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchAppConfigurationIfNeededWithCompletion:", v7);

}

- (void)processConfigurationWithJSON:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  FREditorialOverrideItem *v24;
  void *v25;
  void *v26;
  id v27;
  FREditorialOverrideItem *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[6];
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  FREditorialOverrideItem *v44;
  _BYTE v45[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v36 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, &v36));
  v8 = v36;
  v9 = v8;
  if (v8)
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100073160;
    v35[3] = &unk_1000D9AA8;
    v35[4] = v8;
    v35[5] = v5;
    v10 = v8;
    sub_100073160((uint64_t)v35);
    goto LABEL_23;
  }
  v25 = v7;
  v26 = v6;
  v27 = v5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("items")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
  v30 = v13;
  if (!v14)
    goto LABEL_20;
  v15 = v14;
  v16 = *(_QWORD *)v32;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(_QWORD *)v32 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKey:", CFSTR("id")));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKey:", CFSTR("title")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKey:", CFSTR("subtitle")));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKey:", CFSTR("subtitleColor")));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKey:", CFSTR("actionUrl")));
      if (!v19 || (objc_msgSend(v12, "containsObject:", v19) & 1) != 0)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          goto LABEL_18;
        v24 = (FREditorialOverrideItem *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("id value cannot be nil in feed navigation configuration json."));
        *(_DWORD *)buf = 136315906;
        v38 = "-[FREditorialConfigurationProvider processConfigurationWithJSON:completion:]";
        v39 = 2080;
        v40 = "FREditorialConfigurationProvider.m";
        v41 = 1024;
        v42 = 105;
        v43 = 2114;
        v44 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        goto LABEL_15;
      }
      if ((objc_msgSend(v19, "fc_isValidTagID") & 1) != 0
        || (objc_msgSend(v19, "fc_isValidArticleID") & 1) != 0)
      {
        v24 = -[FREditorialOverrideItem initWithIdentifier:title:subtitle:subtitleColorString:actionUrlString:]([FREditorialOverrideItem alloc], "initWithIdentifier:title:subtitle:subtitleColorString:actionUrlString:", v19, v20, v21, v22, v23);
        objc_msgSend(v29, "addObject:", v24);
        objc_msgSend(v12, "addObject:", v19);
LABEL_15:

        v13 = v30;
        goto LABEL_18;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v28 = (FREditorialOverrideItem *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("id value must represent either an article or a tag."));
        *(_DWORD *)buf = 136315906;
        v38 = "-[FREditorialConfigurationProvider processConfigurationWithJSON:completion:]";
        v39 = 2080;
        v40 = "FREditorialConfigurationProvider.m";
        v41 = 1024;
        v42 = 88;
        v43 = 2114;
        v44 = v28;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
LABEL_18:

    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
  }
  while (v15);
LABEL_20:

  v5 = v27;
  if (v27)
    (*((void (**)(id, void *, _QWORD))v27 + 2))(v27, v29, 0);

  v7 = v25;
  v6 = v26;
  v9 = 0;
  v10 = v30;
LABEL_23:

}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
}

@end
