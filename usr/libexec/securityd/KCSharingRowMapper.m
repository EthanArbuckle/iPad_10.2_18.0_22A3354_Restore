@implementation KCSharingRowMapper

- (KCSharingRowMapper)initWithModel:(Class)a3
{
  KCSharingRowMapper *v4;
  KCSharingRowMapper *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *v16;
  NSArray *boxedAttrs;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)KCSharingRowMapper;
  v4 = -[KCSharingRowMapper init](&v19, "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_model, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class requiredAttributeKeys](v5->_model, "requiredAttributeKeys"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v8 = -[objc_class databaseItemClass](a3, "databaseItemClass");
    v9 = v8[2];
    if (v9)
    {
      v10 = v8 + 3;
      do
      {
        v11 = *(_DWORD *)(v9 + 8);
        v12 = (v11 - 6) < 4 || v11 == 16;
        if (v12
          || (v15 = *(_QWORD *)(v9 + 16), (v15 & 2) != 0)
          && ((v15 & 0x101) != 0 || objc_msgSend(v6, "containsObject:", *(_QWORD *)v9)))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", v9));
          objc_msgSend(v7, "addObject:", v13);

        }
        v14 = *v10++;
        v9 = v14;
      }
      while (v14);
    }
    v16 = (NSArray *)objc_msgSend(v7, "copy");
    boxedAttrs = v5->_boxedAttrs;
    v5->_boxedAttrs = v16;

  }
  return v5;
}

- (unint64_t)columnCount
{
  return -[NSArray count](self->_boxedAttrs, "count");
}

- (id)columnNamesWithTableName:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  id v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = self->_boxedAttrs;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10);
        if (v4)
        {
          v12 = objc_msgSend(v11, "pointerValue");
          v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v4, *v12, (_QWORD)v17));
        }
        else
        {
          v13 = *(id *)objc_msgSend(v11, "pointerValue");
        }
        v14 = v13;
        objc_msgSend(v5, "addObject:", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = objc_msgSend(v5, "copy");
  return v15;
}

- (id)mapResultRow:(sqlite3_stmt *)a3 startingAt:(unint64_t)a4 error:(id *)a5
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  void *v14;
  const void *v15;
  __CFDictionary *v16;
  const void *v17;
  const void **v18;
  id v19;
  id v21;
  _QWORD v22[2];
  id (*v23)(uint64_t, int, char *);
  void *v24;
  KCSharingRowMapper *v25;
  unint64_t v26;
  char v27;

  v9 = -[objc_class databaseItemClass](self->_model, "databaseItemClass");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v23 = sub_1000F8CA4;
  v24 = &unk_1002DDD40;
  v25 = self;
  v26 = a4;
  v10 = sub_10001E8EC(0, (uint64_t)v9, dword_1003414E0, 0);
  v11 = 0;
  v27 = 0;
  do
  {
    v12 = (uint64_t)v23((uint64_t)v22, v11, &v27);
    if (v12)
    {
      v13 = (_BYTE *)v12;
      v14 = sub_10001E710(0, a3, v12, v11);
      if (!v14)
      {
        if (v10)
          CFRelease((CFTypeRef)v10);
        goto LABEL_14;
      }
      v15 = v14;
      v16 = *(__CFDictionary **)(v10 + 48);
      v17 = (const void *)sub_1000107E4(v13);
      CFDictionarySetValue(v16, v17, v15);
      CFRelease(v15);
    }
    v11 = (v11 + 1);
  }
  while (!v27);
  v18 = (const void **)sub_10001E6A8(v9, 9, 0);
  if (v18)
  {
    if (CFDictionaryGetValue(*(CFDictionaryRef *)(v10 + 48), *v18))
      *(_DWORD *)(v10 + 40) = 1;
    goto LABEL_10;
  }
  if (v10)
  {
LABEL_10:
    v19 = (id)v10;
    goto LABEL_11;
  }
LABEL_14:
  if (a5)
  {
    v21 = 0;
    v19 = 0;
    *a5 = 0;
  }
  else
  {
    v19 = 0;
  }
LABEL_11:

  return v19;
}

- (Class)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_boxedAttrs, 0);
}

@end
