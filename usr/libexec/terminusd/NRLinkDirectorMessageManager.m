@implementation NRLinkDirectorMessageManager

- (id)description
{
  id v3;
  NSMutableDictionary *latestMessageDictionary;
  uint64_t v5;
  NSMutableDictionary *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v20;
  id obj;
  uint64_t v22;
  NRLinkDirectorMessageManager *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v3 = objc_alloc_init((Class)NSMutableString);
  v24 = objc_alloc_init((Class)NSMutableDictionary);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = v3;
  if (self)
    latestMessageDictionary = self->_latestMessageDictionary;
  else
    latestMessageDictionary = 0;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](latestMessageDictionary, "allKeys"));
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v25)
  {
    v22 = *(_QWORD *)v33;
    v23 = self;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(obj);
        v27 = v5;
        if (self)
          v6 = self->_latestMessageDictionary;
        else
          v6 = 0;
        v26 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:"));
        v8 = objc_alloc_init((Class)NSMutableDictionary);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v29 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
              v15 = objc_opt_class(NSNumber);
              if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v14));
                v17 = objc_opt_class(NRLinkDirectorMessageState);
                if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
                {
                  v18 = sub_100021848(objc_msgSend(v14, "unsignedCharValue"));
                  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v18);

                }
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v11);
        }

        objc_msgSend(v24, "setObject:forKeyedSubscript:", v8, v26);
        v5 = v27 + 1;
        self = v23;
      }
      while ((id)(v27 + 1) != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v25);
  }

  objc_msgSend(v20, "appendFormat:", CFSTR("%@"), v24);
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestMessageDictionary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
