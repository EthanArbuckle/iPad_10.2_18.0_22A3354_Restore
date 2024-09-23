@implementation NFFuryCALogger

- (NFFuryCALogger)init
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_attr_t v21;
  NSObject *v22;
  dispatch_queue_t v23;
  void *v24;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v26.receiver = self;
  v26.super_class = (Class)NFFuryCALogger;
  v2 = -[NFFuryCALogger init](&v26, "init");
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.stockholm.analytics"));
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.stockholm.awd"));
    v6 = v5;
    if (*((_QWORD *)v2 + 1))
      v7 = v5 == 0;
    else
      v7 = 1;
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryRepresentation"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v2 + 1), "objectForKey:", v14));
            if (v15)
            {

            }
            else
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v14));

              if (v16)
              {
                v17 = (void *)*((_QWORD *)v2 + 1);
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v14));
                objc_msgSend(v17, "setObject:forKey:", v18, v14);

                objc_msgSend(v6, "removeObjectForKey:", v14);
              }
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v11);
      }

    }
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_BACKGROUND, 0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = dispatch_queue_create("com.apple.nfcacd.caLogger", v22);
    v24 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v23;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 2), kNFLOG_DISPATCH_SPECIFIC_KEY, (void *)3, 0);
  }
  return (NFFuryCALogger *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userDefault, 0);
}

@end
