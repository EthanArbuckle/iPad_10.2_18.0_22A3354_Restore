@implementation MTDateParser

- (id)dateFromRSSDateString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDateParser dateFormatters](MTDateParser, "dateFormatters", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v4);
      v8 = *(id *)(*((_QWORD *)&v11 + 1) + 8 * v7);
      objc_sync_enter(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateFromString:", v3));
      objc_sync_exit(v8);

      if (v9)
        break;
      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  return v9;
}

+ (id)dateFormatters
{
  if (qword_100567480 != -1)
    dispatch_once(&qword_100567480, &stru_1004AA068);
  return (id)qword_100567478;
}

@end
