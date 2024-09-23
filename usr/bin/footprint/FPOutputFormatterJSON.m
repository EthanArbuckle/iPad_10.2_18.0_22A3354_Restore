@implementation FPOutputFormatterJSON

- (void)dealloc
{
  _JSON *json;
  objc_super v4;

  json = self->_json;
  if (json)
  {
    fclose(json->var0);
    free(self->_json);
  }
  v4.receiver = self;
  v4.super_class = (Class)FPOutputFormatterJSON;
  -[FPOutputFormatterJSON dealloc](&v4, "dealloc");
}

- (void)configureForMultipleOutputs
{
  _JSON *json;
  _JSON *v4;

  self->_multipleOutputs = 1;
  json = self->_json;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }
    fwrite("\"samples\":", 0xAuLL, 1uLL, json->var0);
    v4 = self->_json;
    v4->var1 = 0;
    fputc(91, v4->var0);
    self->_json->var1 = 0;
  }
}

- (void)startAtTime:(id)a3
{
  id v4;
  _JSON *json;
  _JSON *v6;
  _JSON *v7;
  NSMutableArray *v8;
  NSMutableArray *shared;
  NSMutableSet *v10;
  NSMutableSet *addedProcessGroups;
  id v12;

  v4 = a3;
  v12 = v4;
  if (self->_multipleOutputs)
  {
    json = self->_json;
    if (json)
    {
      if (json->var1)
      {
        fputc(44, json->var0);
        json = self->_json;
      }
      fputc(123, json->var0);
      self->_json->var1 = 0;
      v4 = v12;
    }
  }
  sub_10001604C((uint64_t)self, v4, "start_time");
  v6 = self->_json;
  if (v6)
  {
    if (v6->var1)
    {
      fputc(44, v6->var0);
      v6 = self->_json;
    }
    fwrite("\"processes\":", 0xCuLL, 1uLL, v6->var0);
    v7 = self->_json;
    v7->var1 = 0;
    fputc(91, v7->var0);
    self->_json->var1 = 0;
  }
  v8 = objc_opt_new(NSMutableArray);
  shared = self->_shared;
  self->_shared = v8;

  v10 = objc_opt_new(NSMutableSet);
  addedProcessGroups = self->_addedProcessGroups;
  self->_addedProcessGroups = v10;

}

- (void)printVmmapLikeOutputForProcess:(id)a3 regions:(id)a4
{
  self->_verbose = 1;
}

- (void)printProcessHeader:(id)a3
{
  id v4;
  _JSON *json;
  _JSON *v6;
  _JSON *v7;
  FILE *var0;
  void *v9;
  id v10;
  _JSON *v11;
  _JSON *v12;
  _JSON *v13;
  _JSON *v14;
  FILE *v15;
  const char *v16;
  _JSON *v17;
  _JSON *v18;
  void *v19;
  id v20;
  _JSON *v21;
  _JSON *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  _JSON *v28;
  void *v29;
  _JSON *v30;
  void *v31;
  id v32;
  _JSON *v33;
  _JSON *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *j;
  _JSON *v40;
  void *v41;
  _JSON *v42;
  _JSON *v43;
  _JSON *v44;
  void *v45;
  _JSON *v46;
  _QWORD v47[5];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];

  v4 = a3;
  json = self->_json;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }
    fputc(123, json->var0);
    v6 = self->_json;
    v6->var1 = 0;
    fwrite("\"name\":", 7uLL, 1uLL, v6->var0);
    v7 = self->_json;
    v7->var1 = 0;
    var0 = v7->var0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("\\\"))));
    fprintf(var0, "\"%s\", (const char *)objc_msgSend(v10, "UTF8String"));

    v11 = self->_json;
    v11->var1 = 1;
    fputc(44, v11->var0);
    fwrite("\"pid\":", 6uLL, 1uLL, self->_json->var0);
    v12 = self->_json;
    v12->var1 = 0;
    fprintf(v12->var0, "%d", objc_msgSend(v4, "pid"));
    v13 = self->_json;
    v13->var1 = 1;
    fputc(44, v13->var0);
    fwrite("\"translated\":", 0xDuLL, 1uLL, self->_json->var0);
    v14 = self->_json;
    v14->var1 = 0;
    v15 = v14->var0;
    if (objc_msgSend(v4, "isTranslated"))
      v16 = "true";
    else
      v16 = "false";
    fputs(v16, v15);
    v17 = self->_json;
    v17->var1 = 1;
    fputc(44, v17->var0);
    fwrite("\"page size\":", 0xCuLL, 1uLL, self->_json->var0);
    v18 = self->_json;
    v18->var1 = 0;
    fprintf(v18->var0, "%lu", objc_msgSend(v4, "pageSize"));
    self->_json->var1 = 1;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "errors"));
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    v21 = self->_json;
    if (v21)
    {
      if (v21->var1)
      {
        fputc(44, v21->var0);
        v21 = self->_json;
      }
      fwrite("\"errors\":", 9uLL, 1uLL, v21->var0);
      v22 = self->_json;
      v22->var1 = 0;
      fputc(91, v22->var0);
      self->_json->var1 = 0;
    }
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "errors"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v53 != v26)
            objc_enumerationMutation(v23);
          v28 = self->_json;
          if (v28)
          {
            v29 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
            if (!v28->var1 || (fputc(44, v28->var0), (v28 = self->_json) != 0))
            {
              fprintf(v28->var0, "\"%s\", (const char *)objc_msgSend(objc_retainAutorelease(v29), "UTF8String"));
              self->_json->var1 = 1;
            }
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v25);
    }

    v30 = self->_json;
    if (v30)
    {
      fputc(93, v30->var0);
      self->_json->var1 = 1;
    }
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "warnings"));
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    v33 = self->_json;
    if (v33)
    {
      if (v33->var1)
      {
        fputc(44, v33->var0);
        v33 = self->_json;
      }
      fwrite("\"warnings\":", 0xBuLL, 1uLL, v33->var0);
      v34 = self->_json;
      v34->var1 = 0;
      fputc(91, v34->var0);
      self->_json->var1 = 0;
    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "warnings"));
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(_QWORD *)v49 != v38)
            objc_enumerationMutation(v35);
          v40 = self->_json;
          if (v40)
          {
            v41 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j);
            if (!v40->var1 || (fputc(44, v40->var0), (v40 = self->_json) != 0))
            {
              fprintf(v40->var0, "\"%s\", (const char *)objc_msgSend(objc_retainAutorelease(v41), "UTF8String"));
              self->_json->var1 = 1;
            }
          }
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v37);
    }

    v42 = self->_json;
    if (v42)
    {
      fputc(93, v42->var0);
      self->_json->var1 = 1;
    }
  }
  if (self->_verbose)
  {
    v43 = self->_json;
    if (v43)
    {
      if (v43->var1)
      {
        fputc(44, v43->var0);
        v43 = self->_json;
      }
      fwrite("\"regions\":", 0xAuLL, 1uLL, v43->var0);
      v44 = self->_json;
      v44->var1 = 0;
      fputc(91, v44->var0);
      self->_json->var1 = 0;
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "memoryRegions"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000168A8;
    v47[3] = &unk_100029DA0;
    v47[4] = self;
    objc_msgSend(v45, "fp_enumerateObjectsWithBatchSize:usingBlock:", 128, v47);

    v46 = self->_json;
    if (v46)
    {
      fputc(93, v46->var0);
      self->_json->var1 = 1;
    }
  }
  if (!self->_pageSize)
    self->_pageSize = (unint64_t)objc_msgSend(v4, "pageSize");

}

- (void)printProcessTotal:(id)a3 forProcess:(id)a4
{
  id v6;
  _JSON *json;
  _JSON *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  json = self->_json;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }
    fwrite("\"footprint\":", 0xCuLL, 1uLL, json->var0);
    v8 = self->_json;
    v8->var1 = 0;
    fprintf(v8->var0, "%llu", objc_msgSend(v9, "unsignedLongLongValue"));
    self->_json->var1 = 1;
  }

}

- (void)printProcessCategories:(id)a3 total:(id *)a4 forProcess:(id)a5
{
  id v7;
  _JSON *json;
  _JSON *v9;
  _JSON *v10;
  id v11;

  v11 = a3;
  v7 = a5;
  json = self->_json;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }
    fwrite("\"categories\":", 0xDuLL, 1uLL, json->var0);
    v9 = self->_json;
    v9->var1 = 0;
    fputc(123, v9->var0);
    self->_json->var1 = 0;
  }
  sub_1000170A4((uint64_t)self, v11);
  v10 = self->_json;
  if (v10)
  {
    fputc(125, v10->var0);
    self->_json->var1 = 1;
  }

}

- (void)printSharedCategories:(id)a3 sharedWith:(id)a4 forProcess:(id)a5 hasProcessView:(BOOL)a6 total:(id *)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _BYTE v33[128];

  v7 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v7)
  {
    if ((-[NSMutableSet containsObject:](self->_addedProcessGroups, "containsObject:", v12) & 1) != 0)
      goto LABEL_14;
    -[NSMutableSet addObject:](self->_addedProcessGroups, "addObject:", v12);
  }
  v26 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "processes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v14, "count")));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "processes"));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v20), "asNumber"));
        objc_msgSend(v15, "addObject:", v21);

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v18);
  }

  v22 = objc_alloc((Class)NSMutableDictionary);
  v31[0] = CFSTR("pids");
  v31[1] = CFSTR("categories");
  v32[0] = v15;
  v32[1] = v11;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));
  v24 = objc_msgSend(v22, "initWithDictionary:", v23);

  v13 = v26;
  if (v7)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "asNumber"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("specific_to_pid"));

  }
  -[NSMutableArray addObject:](self->_shared, "addObject:", v24);

LABEL_14:
}

- (void)printSharedCache:(id)a3 categories:(id)a4 sharedWith:(id)a5 total:(id *)a6
{
  _QWORD *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[3];
  _QWORD v28[3];
  _BYTE v29[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "processes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v12, "count")));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "processes", 0));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v18), "asNumber"));
        objc_msgSend(v13, "addObject:", v19);

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v16);
  }

  v27[0] = CFSTR("pids");
  v27[1] = CFSTR("categories");
  v28[0] = v13;
  v28[1] = v10;
  v27[2] = CFSTR("shared-cache");
  if (v9)
    v20 = (void *)v9[2];
  else
    v20 = 0;
  v21 = v20;
  v28[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 3));

  -[NSMutableArray addObject:](self->_shared, "addObject:", v22);
}

- (void)printProcessAuxData:(id)a3 forProcess:(id)a4
{
  id v6;
  _JSON *json;
  _JSON *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  json = self->_json;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }
    fwrite("\"auxiliary\":", 0xCuLL, 1uLL, json->var0);
    self->_json->var1 = 0;
  }
  sub_1000175F4((uint64_t)self, v9);
  v8 = self->_json;
  if (v8)
  {
    fputc(125, v8->var0);
    self->_json->var1 = 1;
  }

}

- (void)printProcessesWithWarnings:(id)a3 processesWithErrors:(id)a4 globalErrors:(id)a5
{
  id v8;
  id v9;
  id v10;
  _JSON *json;
  void *v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  _JSON *v26;
  _JSON *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *k;
  _JSON *v33;
  void *v34;
  _JSON *v35;
  _JSON *v36;
  _JSON *v37;
  NSMutableArray *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *m;
  _JSON *v43;
  void *v44;
  _JSON *v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
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
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  json = self->_json;
  if (json)
  {
    fputc(93, json->var0);
    self->_json->var1 = 1;
  }
  v48 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v10));
  v13 = objc_opt_new(NSMutableArray);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v62 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i), "warnings"));
        -[NSMutableArray addObjectsFromArray:](v13, "addObjectsFromArray:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    }
    while (v16);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v20 = v9;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v58 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j), "errors"));
        objc_msgSend(v12, "addObjectsFromArray:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    }
    while (v22);
  }

  v26 = self->_json;
  if (v26)
  {
    if (v26->var1)
    {
      fputc(44, v26->var0);
      v26 = self->_json;
    }
    fwrite("\"errors\":", 9uLL, 1uLL, v26->var0);
    v27 = self->_json;
    v27->var1 = 0;
    fputc(91, v27->var0);
    self->_json->var1 = 0;
  }
  v46 = v20;
  v47 = v14;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v28 = v12;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v30; k = (char *)k + 1)
      {
        if (*(_QWORD *)v54 != v31)
          objc_enumerationMutation(v28);
        v33 = self->_json;
        if (v33)
        {
          v34 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)k);
          if (!v33->var1 || (fputc(44, v33->var0), (v33 = self->_json) != 0))
          {
            fprintf(v33->var0, "\"%s\", (const char *)objc_msgSend(objc_retainAutorelease(v34), "UTF8String"));
            self->_json->var1 = 1;
          }
        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    }
    while (v30);
  }

  v35 = self->_json;
  if (v35)
  {
    fputc(93, v35->var0);
    v36 = self->_json;
    v36->var1 = 1;
    fputc(44, v36->var0);
    fwrite("\"warnings\":", 0xBuLL, 1uLL, self->_json->var0);
    v37 = self->_json;
    v37->var1 = 0;
    fputc(91, v37->var0);
    self->_json->var1 = 0;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v38 = v13;
  v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v50;
    do
    {
      for (m = 0; m != v40; m = (char *)m + 1)
      {
        if (*(_QWORD *)v50 != v41)
          objc_enumerationMutation(v38);
        v43 = self->_json;
        if (v43)
        {
          v44 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)m);
          if (!v43->var1 || (fputc(44, v43->var0), (v43 = self->_json) != 0))
          {
            fprintf(v43->var0, "\"%s\", (const char *)objc_msgSend(objc_retainAutorelease(v44), "UTF8String"));
            self->_json->var1 = 1;
          }
        }
      }
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
    }
    while (v40);
  }

  v45 = self->_json;
  if (v45)
  {
    fputc(93, v45->var0);
    self->_json->var1 = 1;
  }

}

- (void)printSummaryCategories:(id)a3 total:(id *)a4 hadErrors:(BOOL)a5
{
  id v7;
  _JSON *json;
  _JSON *v9;
  _JSON *v10;
  _JSON *v11;
  _JSON *v12;
  _JSON *v13;
  _JSON *v14;
  _JSON *v15;
  _JSON *v16;
  _JSON *v17;
  _JSON *v18;
  _JSON *v19;
  _JSON *v20;
  _JSON *v21;
  _JSON *v22;
  _JSON *v23;
  _JSON *v24;
  _JSON *v25;
  _JSON *v26;
  id v27;

  v7 = a3;
  json = self->_json;
  v27 = v7;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }
    fwrite("\"summary\":", 0xAuLL, 1uLL, json->var0);
    v9 = self->_json;
    v9->var1 = 0;
    fputc(123, v9->var0);
    json = self->_json;
    json->var1 = 0;
    v7 = v27;
  }
  if (v7)
  {
    sub_1000170A4((uint64_t)self, v27);
    v7 = v27;
    json = self->_json;
  }
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }
    fwrite("\"total\":", 8uLL, 1uLL, json->var0);
    v10 = self->_json;
    v10->var1 = 0;
    fputc(123, v10->var0);
    v11 = self->_json;
    v11->var1 = 0;
    fwrite("\"dirty\":", 8uLL, 1uLL, v11->var0);
    v12 = self->_json;
    v12->var1 = 0;
    fprintf(v12->var0, "%llu", a4->var1 + a4->var0);
    v13 = self->_json;
    v13->var1 = 1;
    fputc(44, v13->var0);
    fwrite("\"swapped\":", 0xAuLL, 1uLL, self->_json->var0);
    v14 = self->_json;
    v14->var1 = 0;
    fprintf(v14->var0, "%llu", a4->var1);
    v15 = self->_json;
    v15->var1 = 1;
    fputc(44, v15->var0);
    fwrite("\"clean\":", 8uLL, 1uLL, self->_json->var0);
    v16 = self->_json;
    v16->var1 = 0;
    fprintf(v16->var0, "%llu", a4->var2);
    v17 = self->_json;
    v17->var1 = 1;
    fputc(44, v17->var0);
    fwrite("\"reclaimable\":", 0xEuLL, 1uLL, self->_json->var0);
    v18 = self->_json;
    v18->var1 = 0;
    fprintf(v18->var0, "%llu", a4->var3);
    v19 = self->_json;
    v19->var1 = 1;
    fputc(44, v19->var0);
    fwrite("\"wired\":", 8uLL, 1uLL, self->_json->var0);
    v20 = self->_json;
    v20->var1 = 0;
    fprintf(v20->var0, "%llu", a4->var4);
    v21 = self->_json;
    v21->var1 = 1;
    fputc(44, v21->var0);
    fwrite("\"regions\":", 0xAuLL, 1uLL, self->_json->var0);
    v22 = self->_json;
    v22->var1 = 0;
    fprintf(v22->var0, "%u", a4->var5);
    v23 = self->_json;
    v23->var1 = 1;
    fputc(125, v23->var0);
    v24 = self->_json;
    v24->var1 = 1;
    fputc(125, v24->var0);
    v25 = self->_json;
    v25->var1 = 1;
    fputc(44, v25->var0);
    fwrite("\"total footprint\":", 0x12uLL, 1uLL, self->_json->var0);
    v26 = self->_json;
    v26->var1 = 0;
    fprintf(v26->var0, "%llu", a4->var1 + a4->var0);
    self->_json->var1 = 1;
    v7 = v27;
  }

}

- (void)printGlobalAuxData:(id)a3
{
  _JSON *json;
  id v5;

  v5 = a3;
  json = self->_json;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }
    fwrite("\"auxiliary\":", 0xCuLL, 1uLL, json->var0);
    self->_json->var1 = 0;
  }
  sub_1000175F4((uint64_t)self, v5);

}

- (void)endAtTime:(id)a3
{
  id v4;
  _JSON *json;
  _JSON *v6;
  void *i;
  void *v8;
  _JSON *v9;
  _JSON *v10;
  _JSON *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  _JSON *v17;
  void *v18;
  _JSON *v19;
  void *v20;
  _JSON *v21;
  _JSON *v22;
  void *v23;
  _JSON *v24;
  _JSON *v25;
  FILE *var0;
  id v27;
  _JSON *v28;
  void *v29;
  _JSON *v30;
  _JSON *v31;
  _JSON *v32;
  _JSON *v33;
  NSMutableArray *obj;
  uint64_t v35;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];

  v4 = a3;
  json = self->_json;
  if (json)
  {
    if (json->var1)
    {
      fputc(44, json->var0);
      json = self->_json;
    }
    fwrite("\"shared\":", 9uLL, 1uLL, json->var0);
    v6 = self->_json;
    v6->var1 = 0;
    fputc(91, v6->var0);
    self->_json->var1 = 0;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = self->_shared;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v36)
  {
    v35 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v35)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v9 = self->_json;
        if (v9)
        {
          if (v9->var1)
          {
            fputc(44, v9->var0);
            v9 = self->_json;
          }
          fputc(123, v9->var0);
          v10 = self->_json;
          v10->var1 = 0;
          fwrite("\"pids\":", 7uLL, 1uLL, v10->var0);
          v11 = self->_json;
          v11->var1 = 0;
          fputc(91, v11->var0);
          self->_json->var1 = 0;
        }
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v37 = v8;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pids")));
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v39 != v15)
                objc_enumerationMutation(v12);
              v17 = self->_json;
              if (v17)
              {
                v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)j);
                if (!v17->var1 || (fputc(44, v17->var0), (v17 = self->_json) != 0))
                {
                  fprintf(v17->var0, "%d", objc_msgSend(v18, "intValue"));
                  self->_json->var1 = 1;
                }
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          }
          while (v14);
        }

        v19 = self->_json;
        if (v19)
        {
          fputc(93, v19->var0);
          self->_json->var1 = 1;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("specific_to_pid")));
        if (v20)
        {
          v21 = self->_json;
          if (v21)
          {
            if (v21->var1)
            {
              fputc(44, v21->var0);
              v21 = self->_json;
            }
            fwrite("\"specific_to_pid\":", 0x12uLL, 1uLL, v21->var0);
            v22 = self->_json;
            v22->var1 = 0;
            fprintf(v22->var0, "%d", objc_msgSend(v20, "intValue"));
            self->_json->var1 = 1;
          }
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("shared-cache")));
        v24 = self->_json;
        if (v23)
        {
          if (!v24)
            goto LABEL_41;
          if (v24->var1)
          {
            fputc(44, v24->var0);
            v24 = self->_json;
          }
          fwrite("\"shared-cache\":", 0xFuLL, 1uLL, v24->var0);
          v25 = self->_json;
          v25->var1 = 0;
          var0 = v25->var0;
          v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUIDString")));
          fprintf(var0, "\"%s\", (const char *)objc_msgSend(v27, "UTF8String"));

          v24 = self->_json;
          v24->var1 = 1;
LABEL_39:
          fputc(44, v24->var0);
          v24 = self->_json;
          goto LABEL_40;
        }
        if (!v24)
          goto LABEL_41;
        if (v24->var1)
          goto LABEL_39;
LABEL_40:
        fwrite("\"categories\":", 0xDuLL, 1uLL, v24->var0);
        v28 = self->_json;
        v28->var1 = 0;
        fputc(123, v28->var0);
        self->_json->var1 = 0;
LABEL_41:
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("categories")));
        sub_1000170A4((uint64_t)self, v29);

        v30 = self->_json;
        if (v30)
        {
          fputc(125, v30->var0);
          v31 = self->_json;
          v31->var1 = 1;
          fputc(125, v31->var0);
          self->_json->var1 = 1;
        }

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v36);
  }

  v32 = self->_json;
  if (v32)
  {
    fputc(93, v32->var0);
    self->_json->var1 = 1;
  }
  sub_10001604C((uint64_t)self, v4, "end_time");
  if (self->_multipleOutputs)
  {
    v33 = self->_json;
    if (v33)
    {
      fputc(125, v33->var0);
      self->_json->var1 = 1;
    }
  }

}

- (void)close
{
  _JSON *json;
  _JSON *v4;
  _JSON *v5;
  unint64_t pageSize;
  _JSON *v7;
  _JSON *v8;

  if (self->_multipleOutputs)
  {
    json = self->_json;
    if (json)
    {
      fputc(93, json->var0);
      self->_json->var1 = 1;
    }
  }
  if (!self->_pageSize)
    self->_pageSize = vm_kernel_page_size;
  v4 = self->_json;
  if (v4)
  {
    if (v4->var1)
    {
      fputc(44, v4->var0);
      v4 = self->_json;
    }
    fwrite("\"page size\":", 0xCuLL, 1uLL, v4->var0);
    pageSize = self->_pageSize;
    v5 = self->_json;
    v5->var1 = 0;
    fprintf(v5->var0, "%lu", pageSize);
    v7 = self->_json;
    v7->var1 = 1;
    fputc(125, v7->var0);
    v8 = self->_json;
    v8->var1 = 1;
    fclose(v8->var0);
    free(self->_json);
  }
  self->_json = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_addedProcessGroups, 0);
  objc_storeStrong((id *)&self->_shared, 0);
}

@end
