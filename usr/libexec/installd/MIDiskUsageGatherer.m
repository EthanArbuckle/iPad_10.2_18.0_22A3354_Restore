@implementation MIDiskUsageGatherer

- (MIDiskUsageGatherer)initWithIdentifiers:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  MIDiskUsageGatherer *v9;
  MIDiskUsageGatherer *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MIDiskUsageGatherer;
  v9 = -[MIDiskUsageGatherer init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifiers, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DynamicDiskUsage")));
    v10->_calcDynamic = sub_10001113C(v11, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SharedDiskUsage")));
    v10->_calcShared = sub_10001113C(v12, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("StaticDiskUsage")));
    v10->_calcStatic = sub_10001113C(v13, 0);

  }
  return v10;
}

- (id)_gatherForIdentifier:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *i;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];

  v26 = a3;
  sub_10004E778(v26);
  v4 = -[MIDiskUsageGatherer calcDynamic](self, "calcDynamic");
  v5 = -[MIDiskUsageGatherer calcShared](self, "calcShared");
  v6 = -[MIDiskUsageGatherer calcStatic](self, "calcStatic");
  v7 = 2;
  if (!v4)
    v7 = 0;
  if (v5)
    v7 |= 8uLL;
  v31 = 0;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[MIContainer allContainersForAllPersonasForIdentifier:options:error:](MIContainer, "allContainersForAllPersonasForIdentifier:options:error:", v26, v7 | v6, &v31));
  v25 = v31;
  if (v8)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    v24 = v8;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    if (v10)
    {
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          if (-[MIDiskUsageGatherer calcStatic](self, "calcStatic")
            && (objc_opt_class(MIBundleContainer), (objc_opt_isKindOfClass(v16) & 1) != 0))
          {
            v13 += (uint64_t)objc_msgSend(v16, "diskUsage");
          }
          else if (-[MIDiskUsageGatherer calcShared](self, "calcShared")
                 && (objc_opt_class(MIGroupContainer), (objc_opt_isKindOfClass(v16) & 1) != 0))
          {
            v11 += (uint64_t)objc_msgSend(v16, "diskUsage");
          }
          else if (-[MIDiskUsageGatherer calcDynamic](self, "calcDynamic"))
          {
            objc_opt_class(MIDataContainer);
            if ((objc_opt_isKindOfClass(v16) & 1) != 0)
              v12 += (uint64_t)objc_msgSend(v16, "diskUsage");
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v10);
    }

    v8 = v24;
    v17 = objc_opt_new(NSMutableDictionary);
    if (-[MIDiskUsageGatherer calcStatic](self, "calcStatic"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v13));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v18, CFSTR("StaticDiskUsage"));

    }
    if (-[MIDiskUsageGatherer calcDynamic](self, "calcDynamic"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v12));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v19, CFSTR("DynamicDiskUsage"));

    }
    if (-[MIDiskUsageGatherer calcShared](self, "calcShared"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v11));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v20, CFSTR("SharedDiskUsage"));

    }
    v21 = 0;
  }
  else
  {
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
    {
      v17 = 0;
    }
    else
    {
      v17 = 0;
      MOLogWrite(qword_10009E048, 3, "-[MIDiskUsageGatherer _gatherForIdentifier:]", CFSTR("Failed to get all containers for identifier %@ : %@"));
    }
    v21 = 8;
  }

  sub_10004E89C(v26);
  if ((v21 | 8) == 8)
  {
    v22 = v25;
    v8 = -[NSMutableDictionary copy](v17, "copy");
  }
  else
  {
    v22 = v25;
  }

  return v8;
}

- (id)gatherUsageInfoWithError:(id *)a3
{
  NSMutableDictionary *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = objc_opt_new(NSMutableDictionary);
  if (!-[MIDiskUsageGatherer calcDynamic](self, "calcDynamic")
    && !-[MIDiskUsageGatherer calcStatic](self, "calcStatic")
    && !-[MIDiskUsageGatherer calcShared](self, "calcShared"))
  {
    v17 = sub_100010E50((uint64_t)"-[MIDiskUsageGatherer gatherUsageInfoWithError:]", 138, MIInstallerErrorDomain, 25, 0, 0, CFSTR("No usage type to fetch specified."), v6, v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v14 = 0;
    if (!a3)
      goto LABEL_18;
    goto LABEL_16;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIDiskUsageGatherer identifiers](self, "identifiers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11);
        objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v12) & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIDiskUsageGatherer _gatherForIdentifier:](self, "_gatherForIdentifier:", v12));
          if (v13)
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v13, v12);

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v14 = v5;
  v15 = 0;
  if (a3)
  {
LABEL_16:
    if (!v14)
      *a3 = objc_retainAutorelease(v15);
  }
LABEL_18:

  return v14;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (BOOL)calcStatic
{
  return self->_calcStatic;
}

- (BOOL)calcDynamic
{
  return self->_calcDynamic;
}

- (BOOL)calcShared
{
  return self->_calcShared;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
