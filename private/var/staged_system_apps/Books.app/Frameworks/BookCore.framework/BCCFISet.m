@implementation BCCFISet

- (id)cfis
{
  return self->_cfis;
}

- (void)setCFIs:(id)a3
{
  objc_storeStrong((id *)&self->_cfis, a3);
}

+ (id)cfiSet
{
  return objc_alloc_init((Class)a1);
}

+ (id)cfiSetWithCFIString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithCFIString:", v4);

  return v5;
}

+ (id)cfiSetWithCFIStrings:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithCFIStrings:", v4);

  return v5;
}

- (BCCFISet)initWithCFIArray:(id)a3
{
  id v4;
  BCCFISet *v5;
  BCCFISet *v6;
  uint64_t v7;
  NSArray *cfis;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCCFISet;
  v5 = -[BCCFISet init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[BCCFISet _arrayCopyWithOnlyRangeCFIsFromCFIs:](v5, "_arrayCopyWithOnlyRangeCFIsFromCFIs:", v4));
    cfis = v6->_cfis;
    v6->_cfis = (NSArray *)v7;

  }
  return v6;
}

- (BCCFISet)init
{
  void *v3;
  BCCFISet *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v4 = -[BCCFISet initWithCFIArray:](self, "initWithCFIArray:", v3);

  return v4;
}

- (BCCFISet)initWithCFI:(id)a3
{
  void *v4;
  BCCFISet *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3));
  v5 = -[BCCFISet initWithCFIArray:](self, "initWithCFIArray:", v4);

  return v5;
}

- (BCCFISet)initWithCFIString:(id)a3
{
  id v5;
  void *v6;
  id v7;
  BOOL v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  void *v13;
  BCCFISet *v14;
  BCCFISet *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;

  v5 = a3;
  v17 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v5, &v17));
  v7 = v17;
  if (v7)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class(BCCFI);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138412802;
      v19 = v11;
      v20 = 2112;
      v21 = v5;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cannot initialize %@ with string %@.  %@ will return nil", buf, 0x20u);

    }
    v15 = 0;
  }
  else
  {
    v14 = (BCCFISet *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v6));
    v15 = -[BCCFISet initWithCFIArray:](self, "initWithCFIArray:", v14);
    self = v14;
  }

  return v15;
}

- (BCCFISet)initWithCFIStrings:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  BCCFISet *v14;
  void *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  NSString *v19;
  void *v20;
  const char *aSelector;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];

  aSelector = a2;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v10);
        v23 = 0;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v11, &v23, aSelector));
        v13 = v23;
        if (v13)
        {
          v15 = v13;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v16 = (objc_class *)objc_opt_class(BCCFI);
            v17 = NSStringFromClass(v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
            v19 = NSStringFromSelector(aSelector);
            v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
            *(_DWORD *)buf = 138412802;
            v29 = v18;
            v30 = 2112;
            v31 = v11;
            v32 = 2112;
            v33 = v20;
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cannot initialize %@ with string %@.  %@ will return nil", buf, 0x20u);

          }
          goto LABEL_16;
        }
        if (v12)
          objc_msgSend(v5, "addObject:", v12);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      if (v8)
        continue;
      break;
    }
  }

  if (objc_msgSend(v5, "count"))
  {
    v14 = -[BCCFISet initWithCFIArray:](self, "initWithCFIArray:", v5);
  }
  else
  {
LABEL_16:

    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BCCFISet *v4;
  id v5;
  BCCFISet *v6;

  v4 = [BCCFISet alloc];
  v5 = -[NSArray copy](self->_cfis, "copy");
  v6 = -[BCCFISet initWithCFIArray:](v4, "initWithCFIArray:", v5);

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  BCMutableCFISet *v4;
  id v5;
  BCMutableCFISet *v6;

  v4 = [BCMutableCFISet alloc];
  v5 = -[NSArray copy](self->_cfis, "copy");
  v6 = -[BCCFISet initWithCFIArray:](v4, "initWithCFIArray:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_opt_class(v4);
  if (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class(BCCFISet)))
    v6 = -[NSArray isEqual:](self->_cfis, "isEqual:", v4[1]);
  else
    v6 = 0;

  return v6;
}

- (id)allCFIs
{
  return -[NSArray copy](self->_cfis, "copy");
}

- (id)description
{
  void *v3;
  void *v4;
  char *v5;
  char *v6;
  char *i;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("{\n")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFISet allCFIs](self, "allCFIs"));
  v5 = (char *)objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      if (i)
        v8 = CFSTR(", ");
      else
        v8 = &stru_296430;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", i));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "string"));
      objc_msgSend(v3, "appendFormat:", CFSTR("  %@%@\n"), v8, v10);

    }
  }
  objc_msgSend(v3, "appendString:", CFSTR("}"));

  return v3;
}

- (id)allCFIStrings
{
  void *v3;
  NSArray *v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_cfis;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    *(_QWORD *)&v6 = 134218242;
    v17 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "string", v17, (_QWORD)v18));
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(v3, "addObject:", v11);
        }
        else
        {
          v12 = BCReadingStatisticsLog();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
            *(_DWORD *)buf = v17;
            v23 = v10;
            v24 = 2112;
            v25 = v14;
            _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Can't generate a string for CFI %p=%@", buf, 0x16u);

          }
        }

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v7);
  }

  v15 = objc_msgSend(v3, "copy");
  return v15;
}

- (int64_t)cfiCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFISet cfis](self, "cfis"));
  v3 = objc_msgSend(v2, "count");

  return (int64_t)v3;
}

- (BCCFI)firstCFI
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFISet cfis](self, "cfis"));
  if (objc_msgSend(v2, "count"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndex:", 0));
  else
    v3 = 0;

  return (BCCFI *)v3;
}

- (BCCFI)lastCFI
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFISet cfis](self, "cfis"));
  if (objc_msgSend(v2, "count"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndex:", (char *)objc_msgSend(v2, "count") - 1));
  else
    v3 = 0;

  return (BCCFI *)v3;
}

- (NSString)firstCFIString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFISet firstCFI](self, "firstCFI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "string"));

  return (NSString *)v3;
}

- (NSString)lastCFIString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFISet lastCFI](self, "lastCFI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "string"));

  return (NSString *)v3;
}

- (id)unionWithCFISet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BCCFISet *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFISet cfis](self, "cfis"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cfis"));

  v7 = objc_msgSend((id)objc_opt_class(self), "_unionArray:withArray:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[BCCFISet initWithCFIArray:]([BCCFISet alloc], "initWithCFIArray:", v8);

  return v9;
}

- (id)intersectionWithCFISet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BCCFISet *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFISet cfis](self, "cfis"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cfis"));

  v7 = objc_msgSend((id)objc_opt_class(self), "_intersectArray:withArray:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[BCCFISet initWithCFIArray:]([BCCFISet alloc], "initWithCFIArray:", v8);

  return v9;
}

+ (id)_intersectArray:(id)a3 withArray:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  char *v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = objc_msgSend(v5, "count");
  v9 = objc_msgSend(v6, "count");
  if (v8 && v9)
  {
    v10 = 0;
    v11 = 0;
    do
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v10));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v11));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "intersectWithCFI:", v13));
      if (objc_msgSend(v14, "isRange"))
        objc_msgSend(v7, "addObject:", v14);
      if (objc_msgSend(v12, "compareCFITail:", v13) == (id)-1)
        ++v10;
      else
        ++v11;

      v15 = (char *)objc_msgSend(v5, "count");
      v16 = (char *)objc_msgSend(v6, "count");
    }
    while (v10 != v15 && v11 != v16);
  }

  return v7;
}

+ (id)_unionArray:(id)a3 withArray:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  char *v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char *v21;
  char *v22;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (unint64_t)objc_msgSend(v5, "count");
  v9 = (unint64_t)objc_msgSend(v6, "count");
  v10 = v8 != 0;
  v11 = v9 != 0;
  if (v8 | v9)
  {
    v12 = 0;
    v13 = 0;
    do
    {
      if (v10
        && (!v11
         || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v12)),
             v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v13)),
             v16 = objc_msgSend(v14, "compare:", v15),
             v15,
             v14,
             v16 == (id)-1)))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v12++));
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v13++));
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "intersectWithCFI:", v17));
      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "unionWithCFI:", v17));
        objc_msgSend(v7, "replaceObjectAtIndex:withObject:", (char *)objc_msgSend(v7, "count") - 1, v20);

      }
      else
      {
        objc_msgSend(v7, "addObject:", v17);
      }

      v21 = (char *)objc_msgSend(v5, "count");
      v22 = (char *)objc_msgSend(v6, "count");
      v11 = v13 != v22;
      v10 = v12 != v21;
    }
    while (v12 != v21 || v13 != v22);
  }

  return v7;
}

+ (id)_negateArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = objc_msgSend(v3, "count");
  if (v5)
  {
    v6 = (unint64_t)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI minimumCFI](BCCFI, "minimumCFI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rangeToCFI:", v7));

    if (objc_msgSend(v9, "isRange"))
      objc_msgSend(v4, "addObject:", v9);
    if (v6 < 2)
    {
      v13 = 0;
    }
    else
    {
      v10 = 0;
      for (i = 1; i != v6; ++i)
      {
        v12 = v9;
        v13 = v7;

        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", i));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rangeToCFI:", v7));

        if (objc_msgSend(v9, "isRange"))
          objc_msgSend(v4, "addObject:", v9);
        v10 = v13;
      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI maximumCFI](BCCFI, "maximumCFI"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rangeToCFI:", v16));

    if ((objc_msgSend(v14, "isRange") & 1) != 0)
      objc_msgSend(v4, "addObject:", v14);
  }
  else
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(+[BCCFI minimumCFI](BCCFI, "minimumCFI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCCFI maximumCFI](BCCFI, "maximumCFI"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rangeToCFI:", v7));
    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v14));

    v4 = (void *)v15;
  }

  return v4;
}

- (id)_mutableArrayCopyWithOnlyRangeCFIsFromCFIs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "isRange", (_QWORD)v12))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_arrayCopyWithOnlyRangeCFIsFromCFIs:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFISet _mutableArrayCopyWithOnlyRangeCFIsFromCFIs:](self, "_mutableArrayCopyWithOnlyRangeCFIsFromCFIs:", v4));
    v6 = objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cfis, 0);
}

@end
