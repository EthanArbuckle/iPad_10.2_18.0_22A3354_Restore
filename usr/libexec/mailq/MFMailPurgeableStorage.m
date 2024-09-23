@implementation MFMailPurgeableStorage

- (MFMailPurgeableStorage)initWithAccountsProvider:(id)a3
{
  id v5;
  MFMailPurgeableStorage *v6;
  MFMailPurgeableStorage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailPurgeableStorage;
  v6 = -[MFMailPurgeableStorage init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountsProvider, a3);
    v7->_previousUrgency = -1;
  }

  return v7;
}

- (id)library
{
  return +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
}

- (int64_t)nonPurgeableSpace
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  int64_t v28;
  void *v30;
  _QWORD *v31;
  id v32;
  id obj;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10000C078;
  v44[3] = &unk_100018B38;
  v44[4] = &v45;
  v31 = objc_retainBlock(v44);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailPurgeableStorage library](self, "library"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "messageBasePathForAccount:", 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EDMessageDataLayoutManager rootMessageDataDirectoryForBasePath:purgeable:](EDMessageDataLayoutManager, "rootMessageDataDirectoryForBasePath:purgeable:", v4, 0));
  ((void (*)(_QWORD *, void *))v31[2])(v31, v5);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[MailAccount mailAccounts](MailAccount, "mailAccounts"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "personaIdentifier"));
        if (v10)
        {
          v11 = objc_msgSend(v9, "supportsPurge");

          if ((v11 & 1) == 0)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailPurgeableStorage library](self, "library"));
            v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "messageBasePathForAccount:", v9));

            v14 = (void *)objc_claimAutoreleasedReturnValue(+[EDMessageDataLayoutManager rootMessageDataDirectoryForBasePath:purgeable:](EDMessageDataLayoutManager, "rootMessageDataDirectoryForBasePath:purgeable:", v13, 0));
            ((void (*)(_QWORD *, void *))v31[2])(v31, v14);

            v4 = (void *)v13;
          }
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v6);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[EMPersistenceLayoutManager baseMailDirectory](EMPersistenceLayoutManager, "baseMailDirectory"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v39 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v30, 0, 0, &v39));
  v17 = v39;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v32 = v16;
  v18 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v36;
    do
    {
      v20 = 0;
      v21 = v17;
      do
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v32);
        v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v20);
        v23 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "path"));
        v34 = v21;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v23, "attributesOfItemAtPath:error:", v24, &v34));
        v17 = v34;

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", NSFileTypeDirectory));
        LOBYTE(v23) = objc_msgSend(v26, "BOOLValue");

        if ((v23 & 1) == 0)
        {
          v27 = (unint64_t)objc_msgSend(v25, "fileSize");
          if ((v27 & 0x8000000000000000) == 0)
            v46[3] += v27;
        }

        v20 = (char *)v20 + 1;
        v21 = v17;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    }
    while (v18);
  }

  v28 = v46[3];
  _Block_object_dispose(&v45, 8);
  return v28;
}

- (MFAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountsProvider, a3);
}

- (double)previousPurgeTime
{
  return self->_previousPurgeTime;
}

- (void)setPreviousPurgeTime:(double)a3
{
  self->_previousPurgeTime = a3;
}

- (int)previousUrgency
{
  return self->_previousUrgency;
}

- (void)setPreviousUrgency:(int)a3
{
  self->_previousUrgency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountsProvider, 0);
}

@end
