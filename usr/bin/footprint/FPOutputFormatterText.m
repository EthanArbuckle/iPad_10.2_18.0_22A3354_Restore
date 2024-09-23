@implementation FPOutputFormatterText

- (void)configureForMultipleOutputs
{
  self->_multipleOutputs = 1;
}

- (void)startAtTime:(id)a3
{
  NSISO8601DateFormatter *dateFormatter;
  double *v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  self->_processCount = 0;
  if (self->_multipleOutputs)
  {
    dateFormatter = self->_dateFormatter;
    v5 = sub_1000193B8((double *)a3);
    v12 = (id)objc_claimAutoreleasedReturnValue(v5);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v12)));
    v7 = objc_msgSend(v6, "UTF8String");
    sub_10001A5D8((uint64_t)self, 0, 0, "Time: %s\n", v8, v9, v10, v11, v7);

  }
}

- (void)printVmmapLikeOutputForProcess:(id)a3 regions:(id)a4
{
  FILE *output;
  id v7;
  id v8;
  id v9;
  int64_t options;
  const char *v11;
  const char *v12;
  int64_t v13;
  const char *v14;
  const char *v15;
  id v16;
  _QWORD v17[6];

  self->_verbose = 1;
  output = self->_output;
  v7 = a4;
  v8 = a3;
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayString")));
  fprintf(output, "%s\n\n", (const char *)objc_msgSend(v9, "UTF8String"));

  options = self->_options;
  v11 = "     SWP";
  if ((options & 2) == 0)
    v11 = "";
  v12 = "    WIRE";
  if ((self->_options & 1) == 0)
    v12 = "";
  fprintf(self->_output, "           start                end  [object-id]     VRT     DRT%*s     CLN     RCL%*s   tag (detail)\n", 4 * (options & 2), v11, 8 * (self->_options & 1), v12);
  v13 = self->_options;
  v14 = "   -----";
  if ((v13 & 2) != 0)
    v15 = "   -----";
  else
    v15 = "";
  if ((self->_options & 1) == 0)
    v14 = "";
  fprintf(self->_output, "      ----------         ---------- ------------   -----   -----%*s   -----   -----%*s   ------------\n", 4 * (v13 & 2), v15, 8 * (self->_options & 1), v14);
  v16 = objc_msgSend(v8, "pageSize");

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001A8A4;
  v17[3] = &unk_100029DF0;
  v17[4] = self;
  v17[5] = v16;
  objc_msgSend(v7, "fp_enumerateObjectsWithBatchSize:usingBlock:", 128, v17);

  fputc(10, self->_output);
}

- (void)printHeader
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (self)
  {
    if (!sub_100011E4C())
      sub_10001BEBC((uint64_t)self, "VM Object Dirty Analysis: Enabled\n", v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)printProcessHeader:(id)a3
{
  id v4;
  void *v5;
  int processCount;
  NSMutableArray *orderedProcesses;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *j;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];

  v4 = a3;
  v5 = v4;
  processCount = self->_processCount;
  if (processCount != 2)
    self->_processCount = processCount + 1;
  orderedProcesses = self->_orderedProcesses;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "pid")));
  -[NSMutableArray addObject:](orderedProcesses, "addObject:", v8);

  self->_pageSize = (unint64_t)objc_msgSend(v5, "pageSize");
  sub_10001A5D8((uint64_t)self, v5, 1, "%s%s%s%*s%s%s%*s%s%s\n", v9, v10, v11, v12, (char)"==========");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayString")));
  LOBYTE(v8) = objc_msgSend(v13, "UTF8String");
  objc_msgSend(v5, "is64bit");
  objc_msgSend(v5, "isTranslated");
  sub_10001A5D8((uint64_t)self, v5, 1, "%s: %s-bit%s", v14, v15, v16, v17, (char)v8);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "warnings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "errors"));
  if (objc_msgSend(v18, "count"))
  {
    sub_10001A5D8((uint64_t)self, v5, 1, "\nWarnings were encountered while examining the process.\n", v20, v21, v22, v23, v46);
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v24 = v18;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i)), "UTF8String");
          sub_10001A5D8((uint64_t)self, v5, 1, "%s%s\n", v29, v30, v31, v32, (char)"    ");
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v26);
    }

  }
  if (objc_msgSend(v19, "count"))
  {
    sub_10001A5D8((uint64_t)self, v5, 1, "\nErrors were encountered while examining the process. Results may be incomplete or incorrect.\n", v33, v34, v35, v36, v46);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v37 = v19;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v39; j = (char *)j + 1)
        {
          if (*(_QWORD *)v48 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j)), "UTF8String");
          sub_10001A5D8((uint64_t)self, v5, 1, "%s%s\n", v42, v43, v44, v45, (char)"    ");
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v39);
    }

  }
}

- (void)printProcessTotal:(id)a3 forProcess:(id)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v6 = a4;
  v7 = sub_10001B0B8(self, (uint64_t)objc_msgSend(a3, "longLongValue"));
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v7));
  objc_msgSend(v12, "UTF8String");
  objc_msgSend(v6, "pageSize");
  sub_10001A5D8((uint64_t)self, v6, 1, "%sFootprint: %s (%lu bytes per page)\n", v8, v9, v10, v11, (char)"    ");

}

- (void)endProcessHeader:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10001A5D8((uint64_t)self, a3, 1, "%s%s%s%*s%s%s%*s%s%s\n\n", v3, v4, v5, v6, (char)"==========");
}

- (void)printProcessCategories:(id)a3 total:(id *)a4 forProcess:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  id v22;
  int64_t summaryFormat;
  id v25;

  summaryFormat = self->_summaryFormat;
  v25 = a5;
  v22 = a3;
  objc_msgSend(CFSTR("Dirty"), "UTF8String");
  if ((self->_options & 2) != 0)
    -[NSString UTF8String](self->_swappedColumnName, "UTF8String");
  objc_msgSend(CFSTR("Clean"), "UTF8String");
  objc_msgSend(CFSTR("Reclaimable"), "UTF8String");
  if ((self->_options & 1) != 0)
    -[NSString UTF8String](self->_wiredColumnName, "UTF8String");
  objc_msgSend(CFSTR("Regions"), "UTF8String");
  objc_msgSend(CFSTR("Category"), "UTF8String");
  if (summaryFormat == 1)
    v11 = 7;
  else
    v11 = 11;
  sub_10001A5D8((uint64_t)self, v25, 1, "%*s%*s%*s%*s%*s %10s    %s\n", v7, v8, v9, v10, v11);
  if (self->_summaryFormat == 1)
    v16 = 7;
  else
    v16 = 11;
  sub_10001A5D8((uint64_t)self, v25, 1, "%*s%*s%*s%*s%*s %10s    %s\n", v12, v13, v14, v15, v16);
  sub_10001B45C((uint64_t)self, v22, v25);

  sub_10001B668(self, a4, v25);
  sub_10001A5D8((uint64_t)self, v25, 1, "\n", v17, v18, v19, v20, v21);

}

- (void)printSharedCategories:(id)a3 sharedWith:(id)a4 forProcess:(id)a5 hasProcessView:(BOOL)a6 total:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  char *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  id v25;
  id v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  char v56;
  int64_t summaryFormat;
  void *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];

  v60 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "processes"));
  v13 = (char *)objc_msgSend(v12, "count") - (v11 != 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "processes"));
  v15 = objc_msgSend(v14, "count");

  v59 = v10;
  if ((unint64_t)v15 < 0x15)
  {
    sub_10001A5D8((uint64_t)self, v11, 1, "Shared with", v16, v17, v18, v19, v54);
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "processes"));
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v62 != v23)
            objc_enumerationMutation(v20);
          v25 = *(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
          if (v25 != v11)
          {
            v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "displayString")));
            v27 = objc_msgSend(v26, "UTF8String");
            sub_10001A5D8((uint64_t)self, v11, 1, " %s", v28, v29, v30, v31, v27);

            if (--v13)
              sub_10001A5D8((uint64_t)self, v11, 1, ",", v32, v33, v34, v35, v55);
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      }
      while (v22);
    }

    sub_10001A5D8((uint64_t)self, v11, 1, ":\n", v36, v37, v38, v39, v55);
  }
  else
  {
    sub_10001A5D8((uint64_t)self, v11, 1, "Shared with %lu processes:\n", v16, v17, v18, v19, (char)v13);
  }
  summaryFormat = self->_summaryFormat;
  objc_msgSend(CFSTR("Dirty"), "UTF8String");
  if ((self->_options & 2) != 0)
    -[NSString UTF8String](self->_swappedColumnName, "UTF8String");
  objc_msgSend(CFSTR("Clean"), "UTF8String");
  objc_msgSend(CFSTR("Reclaimable"), "UTF8String");
  if ((self->_options & 1) != 0)
    -[NSString UTF8String](self->_wiredColumnName, "UTF8String");
  objc_msgSend(CFSTR("Regions"), "UTF8String");
  objc_msgSend(CFSTR("Category"), "UTF8String");
  if (summaryFormat == 1)
    v44 = 7;
  else
    v44 = 11;
  sub_10001A5D8((uint64_t)self, v11, 1, "%*s%*s%*s%*s%*s %10s    %s\n", v40, v41, v42, v43, v44);
  if (self->_summaryFormat == 1)
    v49 = 7;
  else
    v49 = 11;
  sub_10001A5D8((uint64_t)self, v11, 1, "%*s%*s%*s%*s%*s %10s    %s\n", v45, v46, v47, v48, v49);
  sub_10001B45C((uint64_t)self, v60, v11);
  sub_10001B668(self, a7, v11);
  sub_10001A5D8((uint64_t)self, v11, 1, "\n", v50, v51, v52, v53, v56);

}

- (void)printSharedCache:(id)a3 categories:(id)a4 sharedWith:(id)a5 total:(id *)a6
{
  id v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v34;

  v9 = a5;
  v34 = a4;
  v10 = a3;
  sub_10001BEBC((uint64_t)self, "%s%s%s%*s%s%s%*s%s%s\n", v11, v12, v13, v14, v15, v16, (uint64_t)"==========");
  if (v10)
    v17 = (void *)v10[2];
  else
    v17 = 0;
  v18 = v17;

  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString")));
  v20 = objc_msgSend(v19, "UTF8String");
  sub_10001BEBC((uint64_t)self, "Shared Cache %s\n", v21, v22, v23, v24, v25, v26, (uint64_t)v20);

  sub_10001BEBC((uint64_t)self, "%s%s%s%*s%s%s%*s%s%s\n\n", v27, v28, v29, v30, v31, v32, (uint64_t)"==========");
  -[FPOutputFormatterText printSharedCategories:sharedWith:forProcess:hasProcessView:total:](self, "printSharedCategories:sharedWith:forProcess:hasProcessView:total:", v34, v9, 0, 0, a6);

}

- (void)printProcessAuxData:(id)a3 forProcess:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;

  if (a3)
  {
    v11 = a4;
    sub_10001C060(self, a3, v11);
    sub_10001A5D8((uint64_t)self, v11, 1, "\n", v6, v7, v8, v9, v10);

  }
}

- (void)printProcessesWithWarnings:(id)a3 processesWithErrors:(id)a4 globalErrors:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *j;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void *k;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v69 = v10;
  v70 = v8;
  if (objc_msgSend(v8, "count"))
  {
    sub_10001BEBC((uint64_t)self, "\nWarnings were encountered while examining the following processes:\n", v11, v12, v13, v14, v15, v16, v68);
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v17 = v8;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v80 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i);
          v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "name")));
          objc_msgSend(v23, "UTF8String");
          sub_10001A5D8((uint64_t)self, v22, 1, "%s%s\n", v24, v25, v26, v27, (char)"    ");

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
      }
      while (v19);
    }

    v10 = v69;
    v8 = v70;
  }
  if (objc_msgSend(v9, "count"))
  {
    sub_10001BEBC((uint64_t)self, "\nErrors were encountered while examining the following processes:\n", v28, v29, v30, v31, v32, v33, v68);
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v34 = v9;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v76;
      do
      {
        for (j = 0; j != v36; j = (char *)j + 1)
        {
          if (*(_QWORD *)v76 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)j);
          v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "name")));
          objc_msgSend(v40, "UTF8String");
          sub_10001A5D8((uint64_t)self, v39, 1, "%s%s\n", v41, v42, v43, v44, (char)"    ");

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      }
      while (v36);
    }

    v10 = v69;
    v8 = v70;
  }
  if (objc_msgSend(v10, "count"))
  {
    sub_10001BEBC((uint64_t)self, "\nErrors were encountered:\n", v45, v46, v47, v48, v49, v50, v68);
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v51 = v10;
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v72;
      do
      {
        for (k = 0; k != v53; k = (char *)k + 1)
        {
          if (*(_QWORD *)v72 != v54)
            objc_enumerationMutation(v51);
          objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)k)), "UTF8String");
          sub_10001BEBC((uint64_t)self, "%s%s\n", v56, v57, v58, v59, v60, v61, (uint64_t)"    ");
        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
      }
      while (v53);
    }

  }
  if (objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
    sub_10001BEBC((uint64_t)self, "\nDue to errors, summary results may be incomplete or incorrect\n", v62, v63, v64, v65, v66, v67, v68);

}

- (void)printSummaryCategories:(id)a3 total:(id *)a4 hadErrors:(BOOL)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;

  v7 = a3;
  if (self->_processCount != 1)
  {
    v44 = v7;
    sub_10001BEBC((uint64_t)self, "%s%s%s%*s%s%s%*s%s%s\n", v8, v9, v10, v11, v12, v13, (uint64_t)"==========");
    v14 = sub_10001B0B8(self, a4->var1 + a4->var0);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v14));
    v16 = objc_msgSend(v15, "UTF8String");
    sub_10001BEBC((uint64_t)self, "Summary Footprint: %s%s\n", v17, v18, v19, v20, v21, v22, (uint64_t)v16);

    sub_10001BEBC((uint64_t)self, "%s%s%s%*s%s%s%*s%s%s\n\n", v23, v24, v25, v26, v27, v28, (uint64_t)"==========");
    v7 = v44;
    if (v44)
    {
      if (self->_summaryFormat == 1)
        v29 = 7;
      else
        v29 = 11;
      v43 = v29;
      objc_msgSend(CFSTR("Dirty"), "UTF8String");
      if ((self->_options & 2) != 0)
        -[NSString UTF8String](self->_swappedColumnName, "UTF8String");
      objc_msgSend(CFSTR("Clean"), "UTF8String");
      objc_msgSend(CFSTR("Reclaimable"), "UTF8String");
      if ((self->_options & 1) != 0)
        -[NSString UTF8String](self->_wiredColumnName, "UTF8String");
      objc_msgSend(CFSTR("Regions"), "UTF8String");
      objc_msgSend(CFSTR("Category"), "UTF8String");
      sub_10001BEBC((uint64_t)self, "%*s%*s%*s%*s%*s %10s    %s\n", v30, v31, v32, v33, v34, v35, v43);
      v42 = 7;
      if (self->_summaryFormat != 1)
        v42 = 11;
      sub_10001BEBC((uint64_t)self, "%*s%*s%*s%*s%*s %10s    %s\n", v36, v37, v38, v39, v40, v41, v42);
      sub_10001B45C((uint64_t)self, v44, 0);
      sub_10001B668(self, a4, 0);
      v7 = v44;
    }
  }

}

- (void)printGlobalAuxData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v4 = a3;
  if (self->_processCount != 1)
  {
    v19 = v4;
    sub_10001BEBC((uint64_t)self, "\n", v5, v6, v7, v8, v9, v10, v17);
    v4 = v19;
    if (v19)
    {
      sub_10001C060(self, v19, 0);
      sub_10001BEBC((uint64_t)self, "\n", v11, v12, v13, v14, v15, v16, v18);
      v4 = v19;
    }
  }

}

- (void)endAtTime:(id)a3
{
  void *v4;
  unint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BYTE *v12;
  _BYTE *v13;
  _BYTE *v14;
  void *v15;
  void *v16;
  void *v17;
  _BYTE *v18;
  int64_t v19;
  id v20;
  _BYTE *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  FILE *output;
  id v28;
  NSMutableArray *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  id v35;
  uint64_t v36;
  NSMutableString *v37;
  NSMutableString *prefix;
  NSMutableString *v39;
  NSMutableString *suffix;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  NSMutableArray *obj;
  id v46;
  void *context;
  _BYTE *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];

  if (self->_layoutStyle == 1)
  {
    v4 = objc_autoreleasePoolPush();
    if (-[NSMutableString length](self->_prefix, "length"))
      fprintf(self->_output, "%s\n", (const char *)-[NSMutableString UTF8String](self->_prefix, "UTF8String"));
    v48 = -[NSMutableArray count](self->_orderedProcesses, "count");
    if (-[NSMutableArray count](self->_orderedProcesses, "count"))
    {
      v41 = v4;
      v5 = 0;
LABEL_6:
      v42 = objc_autoreleasePoolPush();
      v46 = objc_alloc_init((Class)NSMutableString);
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      obj = self->_orderedProcesses;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v54;
        v43 = *(_QWORD *)v54;
        do
        {
          v9 = 0;
          v44 = v7;
          do
          {
            if (*(_QWORD *)v54 != v8)
              objc_enumerationMutation(obj);
            v10 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v9);
            context = objc_autoreleasePoolPush();
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_outputLinesByPID, "objectForKeyedSubscript:", v10));
            if (v5 < (unint64_t)objc_msgSend(v11, "count"))
            {
              v12 = -[NSMutableArray indexOfObject:](self->_orderedProcesses, "indexOfObject:", v10);
              v13 = 0;
              v14 = v12 - 1;
              if ((uint64_t)(v12 - 1) >= 0)
              {
                do
                {
                  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_orderedProcesses, "objectAtIndexedSubscript:", v14));
                  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_maxTextLengthByPID, "objectForKeyedSubscript:", v15));
                  v13 = &v13[(_QWORD)objc_msgSend(v16, "integerValue")];

                  --v14;
                }
                while (v14 != (_BYTE *)-1);
              }
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v5));
              v18 = objc_msgSend(v46, "length");
              v19 = v13 - v18;
              if (v13 == v18)
              {
                v20 = v17;
              }
              else
              {
                v20 = objc_alloc_init((Class)NSMutableString);
                do
                {
                  objc_msgSend(v20, "appendString:", CFSTR(" "));
                  --v19;
                }
                while (v19);
                objc_msgSend(v20, "appendString:", v17);

              }
              if (v12 != (char *)-[NSMutableArray count](self->_orderedProcesses, "count") - 1)
              {
                v21 = v12 + 1;
                while (v21 < v48)
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_orderedProcesses, "objectAtIndexedSubscript:", v21));
                  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_outputLinesByPID, "objectForKeyedSubscript:", v22));
                  v24 = objc_msgSend(v23, "count");

                  ++v21;
                  if ((unint64_t)v24 > v5)
                  {
                    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v25));

                    objc_msgSend(v46, "appendString:", v26);
                    goto LABEL_25;
                  }
                }
              }
              objc_msgSend(v46, "appendString:", v20);
LABEL_25:

              v8 = v43;
              v7 = v44;
            }

            objc_autoreleasePoolPop(context);
            v9 = (char *)v9 + 1;
          }
          while (v9 != v7);
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        }
        while (v7);
      }

      output = self->_output;
      v28 = objc_retainAutorelease(v46);
      fputs((const char *)objc_msgSend(v28, "UTF8String"), output);
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v29 = self->_orderedProcesses;
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v50;
        while (2)
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(_QWORD *)v50 != v32)
              objc_enumerationMutation(v29);
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_outputLinesByPID, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i)));
            v35 = objc_msgSend(v34, "count");

            if ((unint64_t)v35 > v5)
            {

              objc_autoreleasePoolPop(v42);
              ++v5;
              goto LABEL_6;
            }
          }
          v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          if (v31)
            continue;
          break;
        }
      }

      objc_autoreleasePoolPop(v42);
      v4 = v41;
      v36 = v5 + 1;
    }
    else
    {
      v36 = -1;
    }
    if (-[NSMutableString length](self->_suffix, "length"))
    {
      if ((v36 & 0x8000000000000000) == 0)
        fputc(10, self->_output);
      fputs((const char *)-[NSMutableString UTF8String](self->_suffix, "UTF8String"), self->_output);
    }
    -[NSMutableDictionary removeAllObjects](self->_maxTextLengthByPID, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_orderedProcesses, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_outputLinesByPID, "removeAllObjects");
    v37 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    prefix = self->_prefix;
    self->_prefix = v37;

    v39 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    suffix = self->_suffix;
    self->_suffix = v39;

    objc_autoreleasePoolPop(v4);
  }
  fflush(self->_output);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sort, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_outputLinesByPID, 0);
  objc_storeStrong((id *)&self->_orderedProcesses, 0);
  objc_storeStrong((id *)&self->_maxTextLengthByPID, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_wiredColumnName, 0);
  objc_storeStrong((id *)&self->_swappedColumnName, 0);
}

@end
