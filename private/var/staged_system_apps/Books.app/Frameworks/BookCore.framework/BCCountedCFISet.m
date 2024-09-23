@implementation BCCountedCFISet

+ (id)countedCFISet
{
  return objc_alloc_init((Class)a1);
}

- (void)setMaximumCFICount:(unint64_t)a3
{
  if (self->_maximumCFICount != a3)
  {
    self->_maximumCFICount = a3;
    -[BCCountedCFISet _optimize](self, "_optimize");
  }
}

- (BCCountedCFISet)init
{
  BCCountedCFISet *v2;
  uint64_t v3;
  NSMutableArray *entries;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BCCountedCFISet;
  v2 = -[BCCountedCFISet init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v3;

    v2->_maximumCFICount = -1;
    v2->_optimizationTargetProportion = 0.8;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BCCountedCFISet *v4;
  void *v5;
  id v6;

  v4 = objc_alloc_init(BCCountedCFISet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISet entries](self, "entries"));
  v6 = objc_msgSend(v5, "mutableCopy");
  -[BCCountedCFISet setEntries:](v4, "setEntries:", v6);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("{\n")));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISet entries](self, "entries"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "description"));
        objc_msgSend(v3, "appendFormat:", CFSTR("    %@;\n"), v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

- (int64_t)cfiCount
{
  return (int64_t)-[NSMutableArray count](self->_entries, "count");
}

- (void)addCFI:(id)a3 count:(double)a4
{
  -[BCCountedCFISet _updateCountForCFI:value:operation:](self, "_updateCountForCFI:value:operation:", a3, 0, a4);
}

- (BOOL)addCFIString:(id)a3 count:(double)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v8 = a3;
  v15 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v8, &v15));
  v10 = v15;
  if (v9)
  {
    -[BCCountedCFISet _updateCountForCFI:value:operation:](self, "_updateCountForCFI:value:operation:", v9, 0, a4);
    if (a5)
LABEL_3:
      *a5 = objc_retainAutorelease(v10);
  }
  else
  {
    v12 = BCReadingStatisticsLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *a5;
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Cannot initialize BCCFI with string %@.  addCFIString:count: will return nil. error=%@", buf, 0x16u);
    }

    if (a5)
      goto LABEL_3;
  }

  return v10 == 0;
}

- (void)subtractCFI:(id)a3 count:(double)a4
{
  -[BCCountedCFISet _updateCountForCFI:value:operation:](self, "_updateCountForCFI:value:operation:", a3, 0, -a4);
}

- (BOOL)subtractCFIString:(id)a3 count:(double)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v8 = a3;
  v15 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v8, &v15));
  v10 = v15;
  if (v9)
  {
    -[BCCountedCFISet _updateCountForCFI:value:operation:](self, "_updateCountForCFI:value:operation:", v9, 0, -a4);
    if (a5)
LABEL_3:
      *a5 = objc_retainAutorelease(v10);
  }
  else
  {
    v12 = BCReadingStatisticsLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *a5;
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Cannot initialize BCCFI with string %@.  subtractCFIString:count: will return nil. error=%@", buf, 0x16u);
    }

    if (a5)
      goto LABEL_3;
  }

  return v10 == 0;
}

- (void)updateWithCFI:(id)a3 minimumCount:(double)a4
{
  -[BCCountedCFISet _updateCountForCFI:value:operation:](self, "_updateCountForCFI:value:operation:", a3, 1, a4);
}

- (id)allCFICounts
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[BCCountedCFISet entries](self, "entries"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v7);
        v19[0] = CFSTR("cfi");
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cfi"));
        v19[1] = CFSTR("count");
        v20[0] = v9;
        objc_msgSend(v8, "count");
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v20[1] = v10;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
        objc_msgSend(v3, "addObject:", v11);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v5);
  }

  v12 = objc_msgSend(v3, "copy");
  return v12;
}

- (id)allCFIStringCounts
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[BCCountedCFISet entries](self, "entries"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v7);
        v19[0] = CFSTR("cfiString");
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cfi"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "string"));
        v19[1] = CFSTR("count");
        v20[0] = v10;
        objc_msgSend(v8, "count");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v20[1] = v11;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
        objc_msgSend(v3, "addObject:", v12);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)cfisWithMinimumCount:(double)a3
{
  BCMutableCFISet *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  double v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = objc_opt_new(BCMutableCFISet);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISet entries](self, "entries", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "count");
        if (v12 >= a3)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cfi"));
          -[BCMutableCFISet addCFI:](v5, "addCFI:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = -[BCMutableCFISet copy](v5, "copy");
  return v14;
}

- (void)updateWithCFISet:(id)a3 minimumCount:(double)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allCFIs", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[BCCountedCFISet updateWithCFI:minimumCount:](self, "updateWithCFI:minimumCount:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), a4);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (int64_t)_updateCountForEntry:(id)a3 index:(unint64_t)a4 value:(double)a5 operation:(int)a6 allowMergeForward:(BOOL)a7 allowMergeBack:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  int64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;

  v8 = a8;
  v9 = a7;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISet entries](self, "entries"));
  v16 = v14;
  v17 = v16;
  if (a6 == 1)
  {
    objc_msgSend(v16, "count");
    if (v19 < a5)
      v19 = a5;
  }
  else
  {
    if (a6)
      goto LABEL_7;
    objc_msgSend(v16, "count");
    v19 = v18 + a5;
  }
  objc_msgSend(v17, "setCount:", v19);
LABEL_7:
  objc_msgSend(v17, "count");
  if (v20 > 0.0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cfi"));
    v22 = 0;
    if (a4 && v8)
    {
      v23 = a4 - 1;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", a4 - 1));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "cfi"));
      objc_msgSend(v17, "count");
      v27 = v26;
      objc_msgSend(v24, "count");
      if (v27 == v28 && !objc_msgSend(v25, "compareTailToHead:", v21))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "unionWithCFI:", v21));
        objc_msgSend(v24, "setCfi:", v30);

        objc_msgSend(v15, "removeObjectAtIndex:", a4);
        v29 = v24;

        v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "cfi"));
        v22 = -1;
        v21 = (void *)v31;
        a4 = v23;
      }
      else
      {
        v22 = 0;
        v29 = v17;
      }

      if (v9)
      {
LABEL_18:
        if ((char *)a4 < (char *)objc_msgSend(v15, "count") - 1)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", a4 + 1));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "cfi"));
          objc_msgSend(v29, "count");
          v35 = v34;
          objc_msgSend(v32, "count");
          if (v35 == v36 && !objc_msgSend(v21, "compareTailToHead:", v33))
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "unionWithCFI:", v21));
            objc_msgSend(v32, "setCfi:", v37);

            objc_msgSend(v15, "removeObjectAtIndex:", a4);
            --v22;
          }

        }
      }
    }
    else
    {
      v29 = v17;
      if (v9)
        goto LABEL_18;
    }

    goto LABEL_24;
  }
  objc_msgSend(v15, "removeObjectAtIndex:", a4);
  v22 = -1;
  v29 = v17;
LABEL_24:

  return v22;
}

- (void)_updateCountForCFI:(id)a3 value:(double)a4 operation:(int)a5
{
  id v7;
  unsigned int v8;
  BCCountedCFISetEntry *v10;
  void *v11;
  char *v12;
  unint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  BCCountedCFISetEntry *v22;
  BCCountedCFISetEntry *v23;
  void *v24;
  void *v25;
  BCCountedCFISetEntry *v26;
  void *v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  int64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  BCCountedCFISetEntry *v35;
  BCCountedCFISetEntry *v36;
  void *v37;
  void *v38;
  BCCountedCFISetEntry *v39;
  BCCountedCFISetEntry *v40;
  void *v41;
  BCCountedCFISetEntry *v42;
  void *v43;
  BCCountedCFISetEntry *v44;
  uint64_t v45;
  void *v46;
  BCCountedCFISetEntry *v47;
  BCCountedCFISetEntry *v48;
  void *v49;
  BCCountedCFISetEntry *v50;
  void *v51;
  void *v52;
  BCCountedCFISetEntry *v53;
  id v54;
  void *v55;
  void *v56;
  BCCountedCFISet *v57;
  _QWORD v59[2];

  v7 = a3;
  v8 = objc_msgSend(v7, "isRange");
  if (a4 != 0.0 && v8 != 0)
  {
    v54 = v7;
    v10 = (BCCountedCFISetEntry *)v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISet entries](self, "entries"));
    v53 = -[BCCountedCFISetEntry initWithCFI:]([BCCountedCFISetEntry alloc], "initWithCFI:", v10);
    v12 = (char *)objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", v53, 0, objc_msgSend(v11, "count"), 1024, &stru_28CF38);
    v13 = (unint64_t)v12;
    v55 = v11;
    if (v12)
    {
      v14 = v12 - 1;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v12 - 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cfi"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISetEntry intersectWithCFI:](v10, "intersectWithCFI:", v16));
      if (objc_msgSend(v17, "isRange"))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "headCFI"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "rangeToCFI:", v17));

        v21 = v13 - 1;
        if (objc_msgSend(v20, "isRange"))
        {
          v22 = -[BCCountedCFISetEntry initWithCFI:]([BCCountedCFISetEntry alloc], "initWithCFI:", v20);
          objc_msgSend(v15, "count");
          -[BCCountedCFISetEntry setCount:](v22, "setCount:");
          objc_msgSend(v18, "addObject:", v22);

          v21 = v13;
        }
        v51 = v20;
        v23 = -[BCCountedCFISetEntry initWithCFI:]([BCCountedCFISetEntry alloc], "initWithCFI:", v17);
        v56 = v15;
        objc_msgSend(v15, "count");
        -[BCCountedCFISetEntry setCount:](v23, "setCount:");
        objc_msgSend(v18, "addObject:", v23);
        v52 = v16;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tailCFI"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "rangeToCFI:", v24));

        if (objc_msgSend(v25, "isRange"))
        {
          v26 = -[BCCountedCFISetEntry initWithCFI:]([BCCountedCFISetEntry alloc], "initWithCFI:", v25);
          objc_msgSend(v56, "count");
          -[BCCountedCFISetEntry setCount:](v26, "setCount:");
          objc_msgSend(v18, "addObject:", v26);

        }
        v27 = v18;
        v11 = v55;
        objc_msgSend(v55, "replaceObjectsInRange:withObjectsFromArray:", v14, 1, v27);
        v28 = objc_msgSend(v27, "count");
        v29 = v21;
        v30 = a5;
        v31 = -[BCCountedCFISet _updateCountForEntry:index:value:operation:allowMergeForward:allowMergeBack:](self, "_updateCountForEntry:index:value:operation:allowMergeForward:allowMergeBack:", v23, v29, a5, 1, 1, a4);
        v50 = v23;
        v32 = v25;
        v13 = (unint64_t)v28 + (_QWORD)v14 + v31;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISetEntry tailCFI](v10, "tailCFI"));
        v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "rangeToCFI:", v33));

        v10 = (BCCountedCFISetEntry *)v34;
        v15 = v56;
        v16 = v52;
      }
      else
      {
        v30 = a5;
      }

    }
    else
    {
      v30 = a5;
    }
    if (-[BCCountedCFISetEntry isRange](v10, "isRange"))
    {
      v57 = self;
      do
      {
        if (v13 >= (unint64_t)objc_msgSend(v11, "count"))
        {
          v35 = -[BCCountedCFISetEntry initWithCFI:]([BCCountedCFISetEntry alloc], "initWithCFI:", v10);
          objc_msgSend(v11, "insertObject:atIndex:", v35, v13);
          v13 += -[BCCountedCFISet _updateCountForEntry:index:value:operation:allowMergeForward:allowMergeBack:](self, "_updateCountForEntry:index:value:operation:allowMergeForward:allowMergeBack:", v35, v13, v30, 1, 1, a4);
          v36 = v10;
          v10 = 0;
        }
        else
        {
          v35 = (BCCountedCFISetEntry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v13));
          v36 = (BCCountedCFISetEntry *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISetEntry cfi](v35, "cfi"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISetEntry intersectWithCFI:](v10, "intersectWithCFI:", v36));
          if (objc_msgSend(v37, "isRange"))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISetEntry headCFI](v10, "headCFI"));
            v39 = (BCCountedCFISetEntry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "rangeToCFI:", v37));

            if (-[BCCountedCFISetEntry isRange](v39, "isRange"))
            {
              v40 = -[BCCountedCFISetEntry initWithCFI:]([BCCountedCFISetEntry alloc], "initWithCFI:", v39);
              v41 = v11;
              v42 = v40;
              objc_msgSend(v41, "insertObject:atIndex:", v40, v13);
              v30 = a5;
              v13 += (unint64_t)-[BCCountedCFISet _updateCountForEntry:index:value:operation:allowMergeForward:allowMergeBack:](self, "_updateCountForEntry:index:value:operation:allowMergeForward:allowMergeBack:", v42, v13, a5, 0, 1, a4)+ 1;
              v43 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISetEntry tailCFI](v10, "tailCFI"));
              v44 = (BCCountedCFISetEntry *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISetEntry rangeToCFI:](v39, "rangeToCFI:", v43));

            }
            else
            {
              v44 = v10;
              v30 = a5;
            }
            v46 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISetEntry tailCFI](v36, "tailCFI"));
            v10 = (BCCountedCFISetEntry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "rangeToCFI:", v46));

            if (-[BCCountedCFISetEntry isRange](v10, "isRange"))
            {
              v47 = -[BCCountedCFISetEntry initWithCFI:]([BCCountedCFISetEntry alloc], "initWithCFI:", v37);
              -[BCCountedCFISetEntry count](v35, "count");
              -[BCCountedCFISetEntry setCount:](v47, "setCount:");
              v48 = -[BCCountedCFISetEntry initWithCFI:]([BCCountedCFISetEntry alloc], "initWithCFI:", v10);
              -[BCCountedCFISetEntry count](v35, "count");
              -[BCCountedCFISetEntry setCount:](v48, "setCount:");
              v59[0] = v47;
              v59[1] = v48;
              v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 2));
              objc_msgSend(v55, "replaceObjectsInRange:withObjectsFromArray:", v13, 1, v49);

              v13 += -[BCCountedCFISet _updateCountForEntry:index:value:operation:allowMergeForward:allowMergeBack:](v57, "_updateCountForEntry:index:value:operation:allowMergeForward:allowMergeBack:", v47, v13, a5, 1, 1, a4);
              v45 = 0;
              v44 = v48;
              v30 = a5;
            }
            else
            {
              v13 += (unint64_t)-[BCCountedCFISet _updateCountForEntry:index:value:operation:allowMergeForward:allowMergeBack:](v57, "_updateCountForEntry:index:value:operation:allowMergeForward:allowMergeBack:", v35, v13, v30, 1, 1, a4)+ 1;
              v47 = (BCCountedCFISetEntry *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISetEntry tailCFI](v44, "tailCFI"));
              v45 = objc_claimAutoreleasedReturnValue(-[BCCountedCFISetEntry rangeToCFI:](v36, "rangeToCFI:", v47));
            }

            v11 = v55;
            self = v57;
          }
          else
          {
            v39 = -[BCCountedCFISetEntry initWithCFI:]([BCCountedCFISetEntry alloc], "initWithCFI:", v10);
            objc_msgSend(v11, "insertObject:atIndex:", v39, v13);
            v45 = 0;
            v13 += -[BCCountedCFISet _updateCountForEntry:index:value:operation:allowMergeForward:allowMergeBack:](self, "_updateCountForEntry:index:value:operation:allowMergeForward:allowMergeBack:", v39, v13, v30, 1, 1, a4);
          }

          v10 = (BCCountedCFISetEntry *)v45;
        }

      }
      while ((-[BCCountedCFISetEntry isRange](v10, "isRange") & 1) != 0);
    }
    -[BCCountedCFISet _optimize](self, "_optimize");

    v7 = v54;
  }

}

- (void)_optimize
{
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  BCCountedCFISetEntryMetadata *v19;
  void *v20;
  void *v21;
  id v22;
  BOOL v23;
  void *v24;
  id v25;
  char *v26;
  char *v27;
  void *v28;
  char *v29;
  void *v30;
  unsigned int v31;
  char *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  char *v51;
  char *v52;
  void *v53;
  id v54;
  _QWORD v55[4];
  id v56;

  v3 = -[BCCountedCFISet maximumCFICount](self, "maximumCFICount");
  v54 = (id)objc_claimAutoreleasedReturnValue(-[BCCountedCFISet entries](self, "entries"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISet entries](self, "entries"));
  v5 = objc_msgSend(v4, "count");

  v6 = objc_autoreleasePoolPush();
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[BCCountedCFISet lengthProvider](self, "lengthProvider"));
  if (!v50 || !v3 || v3 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t)v5 <= v3)
    goto LABEL_36;
  v47 = v6;
  -[BCCountedCFISet optimizationTargetProportion](self, "optimizationTargetProportion");
  v49 = (unint64_t)v5 - llround(v7 * (double)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v51 = 0;
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = 0;
  v48 = v8;
  do
  {
    do
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectAtIndexedSubscript:", v9));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cfi"));
      if (objc_msgSend(v12, "spineIndex") != v51)
      {

        break;
      }
      v13 = objc_msgSend(v50, "characterCountForCFI:", v12);
      if (v9)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9 - 1));
        v15 = objc_msgSend(v14, "touchesNext");

      }
      else
      {
        v15 = 0;
      }
      ++v9;
      if (v10 + 1 >= (unint64_t)v5)
      {
        v18 = 0;
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectAtIndexedSubscript:", v10 + 1));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cfi"));
        v18 = objc_msgSend(v12, "compareTailToHead:", v17) != (id)-1;

        v8 = v48;
      }
      v19 = objc_opt_new(BCCountedCFISetEntryMetadata);
      -[BCCountedCFISetEntryMetadata setCharacterCount:](v19, "setCharacterCount:", v13);
      -[BCCountedCFISetEntryMetadata setTouchesPrev:](v19, "setTouchesPrev:", v15);
      -[BCCountedCFISetEntryMetadata setTouchesNext:](v19, "setTouchesNext:", v18);
      objc_msgSend(v8, "addObject:", v19);
      if (v15 | v18)
      {
        if ((unint64_t)objc_msgSend(v53, "count") < v49
          || (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "lastObject")),
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v20, "unsignedIntegerValue"))),
              v22 = objc_msgSend(v21, "characterCount"),
              v21,
              v20,
              v23 = (uint64_t)v13 < (uint64_t)v22,
              v8 = v48,
              v23))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
          v25 = objc_msgSend(v53, "count");
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_36A84;
          v55[3] = &unk_28CF60;
          v56 = v8;
          objc_msgSend(v53, "insertObject:atIndex:", v24, objc_msgSend(v53, "indexOfObject:inSortedRange:options:usingComparator:", v24, 0, v25, 1024, v55));
          if ((unint64_t)objc_msgSend(v53, "count") > v49)
            objc_msgSend(v53, "removeLastObject");

        }
      }

    }
    while (v9 < (unint64_t)v5);
    ++v51;
  }
  while (v9 < (unint64_t)v5);
  objc_msgSend(v53, "sortUsingComparator:", &stru_28CFA0);
  v26 = (char *)objc_msgSend(v53, "count");
  if ((uint64_t)v26 >= 1)
  {
    v27 = v26 + 1;
    while (1)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectAtIndexedSubscript:", v27 - 2));
      v29 = (char *)objc_msgSend(v28, "unsignedIntegerValue");

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectAtIndexedSubscript:", v29));
      v31 = objc_msgSend(v30, "touchesNext");
      if (v31)
        break;
      if (objc_msgSend(v30, "touchesPrev"))
      {
        v52 = v27 - 2;
        v32 = v29 - 1;
        goto LABEL_30;
      }
LABEL_34:

      if ((unint64_t)--v27 <= 1)
        goto LABEL_35;
    }
    v52 = v27 - 2;
    v32 = v29 + 1;
LABEL_30:
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectAtIndexedSubscript:", v32));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectAtIndexedSubscript:", v29));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectAtIndexedSubscript:", v32));
    v36 = (double)(uint64_t)objc_msgSend(v30, "characterCount");
    objc_msgSend(v34, "count");
    v38 = v37;
    v39 = (double)(uint64_t)objc_msgSend(v33, "characterCount");
    objc_msgSend(v35, "count");
    v41 = v40 * v39 + v36 * v38;
    v42 = objc_msgSend(v30, "characterCount");
    v43 = v41 / (double)((uint64_t)v42 + (uint64_t)objc_msgSend(v33, "characterCount"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "cfi"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "cfi"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "unionWithCFI:", v45));

    objc_msgSend(v35, "setCfi:", v46);
    objc_msgSend(v35, "setCount:", v43);
    objc_msgSend(v33, "setCharacterCount:", (char *)objc_msgSend(v30, "characterCount") + (_QWORD)objc_msgSend(v33, "characterCount"));
    if (v31)
      objc_msgSend(v33, "setTouchesPrev:", objc_msgSend(v30, "touchesPrev"));
    else
      objc_msgSend(v33, "setTouchesNext:", objc_msgSend(v30, "touchesNext"));
    objc_msgSend(v54, "removeObjectAtIndex:", v29);
    objc_msgSend(v48, "removeObjectAtIndex:", v29);
    objc_msgSend(v53, "removeObjectAtIndex:", v52);

    goto LABEL_34;
  }
LABEL_35:

  v6 = v47;
LABEL_36:

  objc_autoreleasePoolPop(v6);
}

- (BCCFILengthProviding)lengthProvider
{
  return (BCCFILengthProviding *)objc_loadWeakRetained((id *)&self->_lengthProvider);
}

- (void)setLengthProvider:(id)a3
{
  objc_storeWeak((id *)&self->_lengthProvider, a3);
}

- (unint64_t)maximumCFICount
{
  return self->_maximumCFICount;
}

- (double)optimizationTargetProportion
{
  return self->_optimizationTargetProportion;
}

- (void)setOptimizationTargetProportion:(double)a3
{
  self->_optimizationTargetProportion = a3;
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  objc_storeStrong((id *)&self->_entries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_destroyWeak((id *)&self->_lengthProvider);
}

@end
