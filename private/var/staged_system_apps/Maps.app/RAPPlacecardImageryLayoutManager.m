@implementation RAPPlacecardImageryLayoutManager

- (RAPPlacecardImageryLayoutManager)initWithDefaultItems:(id)a3
{
  id v4;
  RAPPlacecardImageryLayoutManager *v5;
  RAPPlacecardImageryLayoutManager *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  RAPLayoutItem *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *layoutItems;
  RAPPlacecardImageryLayoutManager *v22;
  id v23;
  id obj;
  objc_super v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RAPPlacecardImageryLayoutManager;
  v5 = -[RAPPlacecardImageryLayoutManager init](&v25, "init");
  v6 = v5;
  if (v5)
  {
    v22 = v5;
    v23 = v4;
    v7 = v4;
    v8 = objc_alloc_init((Class)NSMutableArray);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v27;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v13);
          v15 = objc_alloc_init(RAPLayoutItem);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedTitle"));
          -[RAPLayoutItem setDisplayText:](v15, "setDisplayText:", v16);

          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)v13 + v11));
          -[RAPLayoutItem setOrdinal:](v15, "setOrdinal:", v17);

          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "type")));
          -[RAPLayoutItem setFieldType:](v15, "setFieldType:", v18);

          objc_msgSend(v8, "addObject:", v15);
          v13 = (char *)v13 + 1;
        }
        while (v10 != v13);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        v11 += (uint64_t)v13;
      }
      while (v10);
    }

    v19 = (NSArray *)objc_msgSend(v8, "copy");
    v6 = v22;
    layoutItems = v22->_layoutItems;
    v22->_layoutItems = v19;

    v4 = v23;
  }

  return v6;
}

- (void)mergeWithServerConfig:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  RAPLayoutItem *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *k;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *m;
  void *v46;
  NSArray *v47;
  NSArray *layoutItems;
  void *v49;
  void *v50;
  NSMutableArray *obj;
  NSMutableArray *obja;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];

  v3 = a3;
  obj = objc_opt_new(NSMutableArray);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v50 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutFields"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v67 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "type") == 7 && objc_msgSend(v9, "enabled"))
        {
          v10 = v9;
          v11 = objc_alloc_init(RAPLayoutItem);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
          v13 = objc_msgSend(v12, "poiImageCorrectionType") - 1;
          if (v13 < 8)
            v14 = v13 + 1;
          else
            v14 = 0;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v14));
          -[RAPLayoutItem setFieldType:](v11, "setFieldType:", v15);

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayText"));
          -[RAPLayoutItem setDisplayText:](v11, "setDisplayText:", v16);

          -[NSMutableArray addObject:](obj, "addObject:", v11);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v6);
  }

  v17 = -[NSArray copy](self->_layoutItems, "copy");
  v18 = objc_alloc_init((Class)NSMutableDictionary);
  v19 = objc_alloc_init((Class)NSMutableSet);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v20 = v17;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v63 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)j);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fieldType"));
        objc_msgSend(v18, "setObject:forKey:", v25, v26);

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fieldType"));
        objc_msgSend(v19, "addObject:", v27);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v22);
  }
  v49 = v20;

  v28 = objc_alloc_init((Class)NSMutableSet);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obja = obj;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v30; k = (char *)k + 1)
      {
        if (*(_QWORD *)v59 != v31)
          objc_enumerationMutation(obja);
        v33 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)k);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "fieldType"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v34));

        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "displayText"));
        v37 = objc_msgSend(v36, "length");

        if (v37)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "displayText"));
          objc_msgSend(v35, "setDisplayText:", v38);

        }
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "fieldType"));
        objc_msgSend(v28, "addObject:", v39);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    }
    while (v30);
  }

  objc_msgSend(v28, "minusSet:", v19);
  v40 = objc_alloc_init((Class)NSMutableArray);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v41 = v28;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v55;
    do
    {
      for (m = 0; m != v43; m = (char *)m + 1)
      {
        if (*(_QWORD *)v55 != v44)
          objc_enumerationMutation(v41);
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)m)));
        objc_msgSend(v40, "addObject:", v46);

      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
    }
    while (v43);
  }

  v47 = (NSArray *)objc_msgSend(v40, "copy");
  layoutItems = self->_layoutItems;
  self->_layoutItems = v47;

}

- (void)downloadAndResolveLayoutWithMapItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  RAPLayoutOptions *v8;
  RAPLayoutDownloader *v9;
  RAPLayoutDownloader *downloader;
  RAPLayoutDownloader *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(RAPLayoutOptions);
  -[RAPLayoutOptions setLayoutType:](v8, "setLayoutType:", 5);
  -[RAPLayoutOptions setReportedMapItem:](v8, "setReportedMapItem:", v6);
  v9 = -[RAPLayoutDownloader initWithLayoutOptions:]([RAPLayoutDownloader alloc], "initWithLayoutOptions:", v8);
  downloader = self->_downloader;
  self->_downloader = v9;

  objc_initWeak(&location, self);
  v11 = self->_downloader;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1004038EC;
  v13[3] = &unk_1011B5360;
  objc_copyWeak(&v15, &location);
  v12 = v7;
  v14 = v12;
  -[RAPLayoutDownloader fetchLayoutConfig:](v11, "fetchLayoutConfig:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (unint64_t)numberOfIssueItems
{
  return -[NSArray count](self->_layoutItems, "count");
}

- (id)issueItemForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  RAPPlacecardImageryIssueItem *v9;
  uint8_t v11[16];

  if (-[RAPPlacecardImageryLayoutManager numberOfIssueItems](self, "numberOfIssueItems") <= a3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: index < self.numberOfIssueItems", v11, 2u);
    }
    return 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_layoutItems, "objectAtIndex:", a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fieldType"));
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayText"));
    v9 = -[RAPPlacecardImageryIssueItem initWithType:overridenText:]([RAPPlacecardImageryIssueItem alloc], "initWithType:overridenText:", v7, v8);

    return v9;
  }
}

- (id)issueItems
{
  id v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  RAPPlacecardImageryIssueItem *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_layoutItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fieldType", (_QWORD)v16));
        v11 = objc_msgSend(v10, "unsignedIntegerValue");

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayText"));
        v13 = -[RAPPlacecardImageryIssueItem initWithType:overridenText:]([RAPPlacecardImageryIssueItem alloc], "initWithType:overridenText:", v11, v12);

        objc_msgSend(v3, "addObject:", v13);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v14 = objc_msgSend(v3, "copy");
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_layoutItems, 0);
}

@end
