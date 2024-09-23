@implementation StatisticsParser

- (StatisticsParser)initWithUnixTimeBoundFrom:(int64_t)a3 to:(int64_t)a4
{
  StatisticsParser *v6;
  StatisticsParser *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *snapshotClients;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *topEmitters;
  NSMutableDictionary *v18;
  NSMutableDictionary *quarantinedClients;
  NSMutableArray *v20;
  NSMutableArray *totalBytes;
  StatisticsParser *v22;
  objc_super v24;
  _QWORD v25[5];

  v24.receiver = self;
  v24.super_class = (Class)StatisticsParser;
  v6 = -[StatisticsParser init](&v24, "init");
  v7 = v6;
  if (v6)
  {
    v6->_lowerBound = a3;
    v6->_upperBound = a4;
    v8 = objc_opt_new(NSMutableDictionary);
    snapshotClients = v7->_snapshotClients;
    v7->_snapshotClients = v8;

    v10 = objc_opt_new(NSMutableDictionary);
    v25[0] = v10;
    v11 = objc_opt_new(NSMutableDictionary);
    v25[1] = v11;
    v12 = objc_opt_new(NSMutableDictionary);
    v25[2] = v12;
    v13 = objc_opt_new(NSMutableDictionary);
    v25[3] = v13;
    v14 = objc_opt_new(NSMutableDictionary);
    v25[4] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 5));
    v16 = (NSMutableArray *)objc_msgSend(v15, "mutableCopy");
    topEmitters = v7->_topEmitters;
    v7->_topEmitters = v16;

    v18 = objc_opt_new(NSMutableDictionary);
    quarantinedClients = v7->_quarantinedClients;
    v7->_quarantinedClients = v18;

    v20 = (NSMutableArray *)objc_msgSend(&off_100008AD0, "mutableCopy");
    totalBytes = v7->_totalBytes;
    v7->_totalBytes = v20;

    v7->_validLineCount = 0;
    v7->_oldestEntryUnixTime = 0;
    v7->_newestEntryUnixTime = 0;
    v22 = v7;
  }

  return v7;
}

- (BOOL)feedJSONLine:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  signed int v12;
  int validLineCount;
  int64_t *p_newestEntryUnixTime;
  id v15;
  void *v16;
  void *v17;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, a4));
  v8 = v7;
  if (v7)
  {
    v9 = sub_1000036FC(v7, (uint64_t)CFSTR("unixTime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = v10;
    if (!v10
      || (v12 = objc_msgSend(v10, "intValue"), self->_lowerBound > v12)
      || self->_upperBound <= v12)
    {
LABEL_20:

      goto LABEL_21;
    }
    validLineCount = self->_validLineCount;
    if (validLineCount)
    {
      if (self->_oldestEntryUnixTime > v12)
        self->_oldestEntryUnixTime = v12;
      p_newestEntryUnixTime = &self->_newestEntryUnixTime;
      if (self->_newestEntryUnixTime >= v12)
        goto LABEL_12;
    }
    else
    {
      self->_newestEntryUnixTime = v12;
      p_newestEntryUnixTime = &self->_oldestEntryUnixTime;
    }
    *p_newestEntryUnixTime = v12;
LABEL_12:
    self->_validLineCount = validLineCount + 1;
    v15 = sub_100003690(v8, (uint64_t)CFSTR("record"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = v16;
    if (v16)
    {
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("logd snapshot")))
      {
        -[StatisticsParser _handleSnapshotRecord:](self, "_handleSnapshotRecord:", v8);
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("logd statistics")))
      {
        -[StatisticsParser _handleStatisticsRecord:](self, "_handleStatisticsRecord:", v8);
      }
      else if (objc_msgSend(v17, "isEqualToString:", CFSTR("logd quarantine")))
      {
        -[StatisticsParser _handleQuarantineRecord:](self, "_handleQuarantineRecord:", v8);
      }
    }

    goto LABEL_20;
  }
LABEL_21:

  return v8 != 0;
}

- (void)_handleSnapshotRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = sub_100003690(a3, (uint64_t)CFSTR("client"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v10 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_snapshotClients, "objectForKeyedSubscript:", v5));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_snapshotClients, "objectForKeyedSubscript:", v10));
      v8 = objc_msgSend(v7, "intValue") + 1;

    }
    else
    {
      v8 = 1;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_snapshotClients, "setObject:forKeyedSubscript:", v9, v10);

    v5 = v10;
  }

}

- (void)_handleStatisticsRecord:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  id v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;

  v4 = a3;
  v5 = sub_100003690(v4, (uint64_t)CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6 && objc_msgSend(v6, "isEqualToString:", CFSTR("File Rotate")))
  {
    v8 = sub_100003690(v4, (uint64_t)CFSTR("file"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (!v9)
    {
LABEL_29:

      goto LABEL_30;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pathComponents"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));

    v13 = objc_retainAutorelease(v12);
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    if (!strcmp(v14, "Persist"))
    {
      v15 = 0;
    }
    else if (!strcmp(v14, "Special"))
    {
      v15 = 1;
    }
    else if (!strcmp(v14, "Signpost"))
    {
      v15 = 2;
    }
    else
    {
      if (strcmp(v14, "HighVolume"))
      {
LABEL_28:

        goto LABEL_29;
      }
      v15 = 3;
    }
    v16 = sub_1000036FC(v4, (uint64_t)CFSTR("totalBytes"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (v17)
    {
      v35 = v17;
      v36 = v13;
      v18 = (char *)objc_msgSend(v17, "unsignedLongLongValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_totalBytes, "objectAtIndexedSubscript:", v15));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", &v18[(_QWORD)objc_msgSend(v19, "unsignedLongLongValue")]));
      -[NSMutableArray setObject:atIndexedSubscript:](self->_totalBytes, "setObject:atIndexedSubscript:", v20, v15);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_totalBytes, "objectAtIndexedSubscript:", 4));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", &v18[(_QWORD)objc_msgSend(v21, "unsignedLongLongValue")]));
      -[NSMutableArray setObject:atIndexedSubscript:](self->_totalBytes, "setObject:atIndexedSubscript:", v22, 4);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processList")));
      if (v23
        && (objc_opt_class(NSArray),
            v24 = sub_100003768(v23),
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24),
            v25,
            v25))
      {
        v34 = v10;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v26 = v23;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v28; i = (char *)i + 1)
            {
              if (*(_QWORD *)v39 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
              objc_opt_class(NSDictionary);
              v32 = sub_100003768(v31);
              v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

              if (v33)
                -[StatisticsParser _handleEmitter:inBook:](self, "_handleEmitter:inBook:", v31, v15);
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
          }
          while (v28);
        }

        v10 = v34;
      }
      else
      {

      }
      v17 = v35;
      v13 = v36;
    }

    goto LABEL_28;
  }
LABEL_30:

}

- (void)_handleEmitter:(id)a3 inBook:(unsigned __int8)a4
{
  unsigned int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v4 = a4;
  v27 = a3;
  v6 = sub_100003690(v27, (uint64_t)CFSTR("process"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v10 = sub_1000036FC(v27, (uint64_t)CFSTR("sizeBytes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v11)
    {
      v13 = (char *)objc_msgSend(v11, "unsignedLongValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_topEmitters, "objectAtIndexedSubscript:", v4));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v9));

      v16 = v13;
      if (v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_topEmitters, "objectAtIndexedSubscript:", v4));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v9));
        v16 = &v13[(_QWORD)objc_msgSend(v18, "unsignedLongLongValue")];

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_topEmitters, "objectAtIndexedSubscript:", 4));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v9));

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_topEmitters, "objectAtIndexedSubscript:", 4));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v9));
        v13 = &v13[(_QWORD)objc_msgSend(v22, "unsignedLongLongValue")];

      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v16));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_topEmitters, "objectAtIndexedSubscript:", v4));
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v9);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v13));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_topEmitters, "objectAtIndexedSubscript:", 4));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v9);

    }
  }

}

- (void)_handleQuarantineRecord:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];

  v4 = a3;
  v5 = sub_100003690(v4, (uint64_t)CFSTR("client"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    v9 = sub_100003690(v4, (uint64_t)CFSTR("file"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (v10)
    {
      v11 = sub_1000036FC(v4, (uint64_t)CFSTR("timeCovered"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (v12)
      {
        v13 = sub_1000036FC(v4, (uint64_t)CFSTR("sizeBytes"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (v14)
        {
          v15 = sub_1000036FC(v4, (uint64_t)CFSTR("totalBytes"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_quarantinedClients, "objectForKeyedSubscript:", v8));

            if (v17)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_quarantinedClients, "objectForKeyedSubscript:", v8));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("quarantineCount")));
              v19 = objc_msgSend(v18, "intValue") + 1;

            }
            else
            {
              v19 = 1;
            }
            v23[0] = CFSTR("quarantineCount");
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v19));
            v24[0] = v20;
            v24[1] = v10;
            v23[1] = CFSTR("fileName");
            v23[2] = CFSTR("bytes");
            v24[2] = v14;
            v24[3] = v16;
            v23[3] = CFSTR("totalBytes");
            v23[4] = CFSTR("timeCovered");
            v24[4] = v12;
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 5));
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_quarantinedClients, "setObject:forKeyedSubscript:", v21, v8);

          }
        }

      }
    }

  }
}

- (int)validLineCount
{
  return self->_validLineCount;
}

- (int64_t)oldestEntryUnixTime
{
  return self->_oldestEntryUnixTime;
}

- (int64_t)newestEntryUnixTime
{
  return self->_newestEntryUnixTime;
}

- (NSArray)totalBytes
{
  return &self->_totalBytes->super;
}

- (NSDictionary)snapshotClients
{
  return &self->_snapshotClients->super;
}

- (NSArray)topEmitters
{
  return &self->_topEmitters->super;
}

- (NSDictionary)quarantinedClients
{
  return &self->_quarantinedClients->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quarantinedClients, 0);
  objc_storeStrong((id *)&self->_totalBytes, 0);
  objc_storeStrong((id *)&self->_topEmitters, 0);
  objc_storeStrong((id *)&self->_snapshotClients, 0);
}

@end
