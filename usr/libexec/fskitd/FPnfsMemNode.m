@implementation FPnfsMemNode

- (FPnfsMemNode)initWithFS:(id)a3 name:(id)a4 parent:(id)a5 locked:(BOOL)a6 mountID:(unsigned int)a7
{
  uint64_t v7;
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  FPnfsMemNode *v16;
  NSMutableArray *v17;
  NSMutableArray *entries;
  NSDate *v19;
  NSDate *atime;
  NSDate *v21;
  NSDate *v22;
  NSDate *mtime;
  id v24;
  NSString *v25;
  uint64_t v26;
  NSString *fh;
  FPnfsMemNode *v28;
  objc_super v30;

  v7 = *(_QWORD *)&a7;
  v8 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v30.receiver = self;
  v30.super_class = (Class)FPnfsMemNode;
  v16 = -[FPnfsMemNode init](&v30, "init");
  if (v16)
  {
    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    entries = v16->entries;
    v16->entries = v17;

    if (!v16->entries)
      goto LABEL_11;
    v19 = (NSDate *)objc_alloc_init((Class)NSDate);
    atime = v16->_atime;
    v16->_atime = v19;

    v21 = v16->_atime;
    if (!v21)
      goto LABEL_11;
    v22 = (NSDate *)-[NSDate copy](v21, "copy");
    mtime = v16->_mtime;
    v16->_mtime = v22;

    if (!v16->_mtime)
      goto LABEL_11;
    v24 = objc_msgSend(v13, "nextFileHandle");
    v16->_fileno = v24;
    v25 = (_DWORD)v7
        ? +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%8.8x"), v7)
        : +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%10.10u"), v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    fh = v16->_fh;
    v16->_fh = (NSString *)v26;

    if (!v16->_fh)
    {
LABEL_11:
      v28 = 0;
      goto LABEL_12;
    }
    objc_storeStrong((id *)&v16->_fs, a3);
    objc_storeWeak((id *)&v16->_parent, v15);
    objc_storeStrong((id *)&v16->_name, a4);
    v16->_verf = 1;
    *(_OWORD *)&v16->size = xmmword_100044810;
    objc_msgSend(v13, "addNode:withLock:", v16, v8);
  }
  v28 = v16;
LABEL_12:

  return v28;
}

- (FPnfsMemNode)initWithFS:(id)a3 name:(id)a4 parent:(id)a5
{
  return -[FPnfsMemNode initWithFS:name:parent:locked:mountID:](self, "initWithFS:name:parent:locked:mountID:", a3, a4, a5, 0, 0);
}

- (id)lookupNode:(id)a3
{
  id v4;
  FPnfsMemNode *v5;
  NSMutableArray *entries;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  entries = v5->entries;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100018500;
  v11[3] = &unk_1000554F0;
  v7 = v4;
  v12 = v7;
  v8 = -[NSMutableArray indexOfObjectPassingTest:](entries, "indexOfObjectPassingTest:", v11);
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v5->entries, "objectAtIndexedSubscript:", v8));

  objc_sync_exit(v5);
  return v9;
}

- (id)lookup:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemNode lookupNode:](self, "lookupNode:", a3));
  v4 = v3;
  if (v3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fh"));
  else
    v5 = 0;

  return v5;
}

- (int)mkDir:(id)a3 fhBuffer:(id *)a4 locked:(BOOL)a5
{
  id v7;
  FPnfsMemNode *v8;
  NSMutableArray *entries;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v7 = a3;
  v8 = self;
  objc_sync_enter(v8);
  entries = v8->entries;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100018708;
  v17[3] = &unk_1000554F0;
  v10 = v7;
  v18 = v10;
  v11 = -[NSMutableArray indexOfObjectPassingTest:](entries, "indexOfObjectPassingTest:", v17);
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = 0;
    v13 = 0;
    v14 = 1;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v8->entries, "objectAtIndexedSubscript:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fh"));
    if (objc_msgSend(v12, "nascent"))
    {
      objc_msgSend(v12, "setNascent:", 0);
      v14 = 0;
    }
    else
    {
      v14 = 17;
    }
  }

  objc_sync_exit(v8);
  v15 = objc_retainAutorelease(v13);
  *a4 = v15;

  return v14;
}

- (int)mkDirPlaceholder:(id)a3 fhBuffer:(id *)a4 wellKnownMount:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  FPnfsMemNode *v9;
  NSMutableArray *entries;
  id v11;
  id v12;
  FPnfsMemNode *v13;
  void *v14;
  FPnfsMemNode *v15;
  NSDate *v16;
  NSDate *mtime;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  _QWORD v24[4];
  id v25;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = self;
  objc_sync_enter(v9);
  entries = v9->entries;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100018978;
  v24[3] = &unk_1000554F0;
  v11 = v8;
  v25 = v11;
  v12 = -[NSMutableArray indexOfObjectPassingTest:](entries, "indexOfObjectPassingTest:", v24);
  if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = [FPnfsMemNode alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemNode fs](v9, "fs"));
    v15 = -[FPnfsMemNode initWithFS:name:parent:locked:mountID:](v13, "initWithFS:name:parent:locked:mountID:", v14, v11, v9, 0, v5);

    if (v15)
    {
      -[NSMutableArray addObject:](v9->entries, "addObject:", v15);
      v16 = (NSDate *)objc_alloc_init((Class)NSDate);
      mtime = v9->_mtime;
      v9->_mtime = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemNode name](v15, "name"));
      v9->size += ((unint64_t)objc_msgSend(v18, "length") + 29) & 0xFFFFFFFFFFFFFFF8;

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemNode name](v15, "name"));
      v9->dirattrSize += (objc_msgSend(v19, "length") + 208) & 0xFFFFFFF8;

      ++v9->_verf;
      -[FPnfsMemNode setNascent:](v15, "setNascent:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemNode fh](v15, "fh"));
      v21 = 0;
    }
    else
    {
      v20 = 0;
      v21 = 28;
    }
  }
  else
  {
    v15 = (FPnfsMemNode *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v9->entries, "objectAtIndexedSubscript:", v12));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemNode fh](v15, "fh"));
    v21 = 17;
  }

  objc_sync_exit(v9);
  v22 = objc_retainAutorelease(v20);
  *a4 = v22;

  return v21;
}

- (int)mkDir:(id)a3 fhBuffer:(id *)a4
{
  return -[FPnfsMemNode mkDir:fhBuffer:locked:](self, "mkDir:fhBuffer:locked:", a3, a4, 0);
}

- (int)renameFrom:(id)a3 toName:(id)a4
{
  id v6;
  id v7;
  FPnfsMemNode *v8;
  int v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (-[NSString isEqualToString:](v8->_name, "isEqualToString:", v6))
  {
    objc_storeStrong((id *)&v8->_name, a4);
    v9 = 0;
  }
  else
  {
    v9 = 2;
  }
  objc_sync_exit(v8);

  return v9;
}

- (int)rmDir:(id)a3
{
  id v4;
  FPnfsMemNode *v5;
  NSMutableArray *entries;
  id v7;
  id v8;
  int v9;
  id *v10;
  void *v11;
  NSDate *v12;
  NSDate *mtime;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;
  void *v19;
  FPnfsMemNode *v20;
  dispatch_queue_global_t global_queue;
  NSObject *v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  entries = v5->entries;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100018CCC;
  v24[3] = &unk_1000554F0;
  v7 = v4;
  v25 = v7;
  v8 = -[NSMutableArray indexOfObjectPassingTest:](entries, "indexOfObjectPassingTest:", v24);
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 2;
  }
  else
  {
    v10 = (id *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v5->entries, "objectAtIndexedSubscript:", v8));
    if (objc_msgSend(v10[1], "count"))
    {
      v9 = 66;
    }
    else
    {
      -[NSMutableArray removeObjectAtIndex:](v5->entries, "removeObjectAtIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemNode fs](v5, "fs"));
      objc_msgSend(v11, "rmNode:", v10);

      v12 = (NSDate *)objc_alloc_init((Class)NSDate);
      mtime = v5->_mtime;
      v5->_mtime = v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
      v5->size -= ((unint64_t)objc_msgSend(v14, "length") + 29) & 0xFFFFFFFFFFFFFFF8;

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
      v5->dirattrSize -= (objc_msgSend(v15, "length") + 208) & 0xFFFFFFF8;

      v9 = 0;
      ++v5->_verf;
    }

  }
  v16 = -[NSMutableArray count](v5->entries, "count");
  objc_sync_exit(v5);

  if (!v16)
  {
    v18 = objc_claimAutoreleasedReturnValue(-[FPnfsMemNode parent](v5, "parent"));
    if (v18)
    {
      v19 = (void *)v18;
      v20 = (FPnfsMemNode *)objc_claimAutoreleasedReturnValue(-[FPnfsMemNode parent](v5, "parent"));

      if (v20 != v5)
      {
        global_queue = dispatch_get_global_queue(2, 0);
        v22 = objc_claimAutoreleasedReturnValue(global_queue);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100018D30;
        v23[3] = &unk_100054D88;
        v23[4] = v5;
        dispatch_async(v22, v23);

      }
    }
  }

  return v9;
}

- (id)readDirAtCookie:(unint64_t)a3 withVerifier:(unint64_t)a4 forBytes:(unint64_t)a5 andError:(int *)a6
{
  FPnfsMemNode *v10;
  unint64_t size;
  id v12;
  id v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  int v17;
  FPnfsMemNode *v18;
  void *v19;
  FPnfsMemNode *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  FPnfsMemNode *v24;
  void *v25;
  unint64_t v26;
  id v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  NSDate *v31;
  NSDate *atime;
  id v34;
  int *v35;

  v10 = self;
  objc_sync_enter(v10);
  if (a4 && v10->_verf != a4)
  {
    v12 = 0;
    v17 = -1000;
    goto LABEL_38;
  }
  if (v10->size >= a5)
    size = a5;
  else
    size = v10->size;
  v12 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", size));
  v13 = objc_msgSend(v12, "mutableBytes");
  if (!v13)
  {
    v17 = 28;
    goto LABEL_38;
  }
  v35 = a6;
  v14 = (char *)-[NSMutableArray count](v10->entries, "count");
  v15 = a3 + 1;
  v34 = v12;
  if (!a3 && size >= 0x18)
  {
    v13 = (id)sub_1000190A8(-[FPnfsMemNode fileno](v10, "fileno"), ".", 1, (uint64_t)v13);
    v16 = 24;
    goto LABEL_13;
  }
  v16 = 0;
  if (a3 <= 1)
  {
LABEL_13:
    if (size >= v16 + 24)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemNode parent](v10, "parent"));
      if (v19)
        v20 = (FPnfsMemNode *)objc_claimAutoreleasedReturnValue(-[FPnfsMemNode parent](v10, "parent"));
      else
        v20 = v10;
      v18 = v20;

      v21 = -[FPnfsMemNode fileno](v18, "fileno");
      if (v14)
        v22 = 2;
      else
        v22 = -1;
      v13 = (id)sub_1000190A8(v21, "..", v22, (uint64_t)v13);
      v15 = a3 + 2;
      v16 += 24;
    }
    else
    {
      v18 = 0;
    }
    goto LABEL_23;
  }
  v18 = 0;
LABEL_23:
  if (a3 >= 2)
    v23 = a3 - 2;
  else
    v23 = 0;
  if (v16 >= size || v23 >= (unint64_t)v14)
  {
    v24 = v18;
  }
  else
  {
    do
    {
      v24 = (FPnfsMemNode *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v10->entries, "objectAtIndexedSubscript:", v23));

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemNode name](v24, "name"));
      v26 = ((unint64_t)objc_msgSend(v25, "length") + 29) & 0xFFFFFFFFFFFFFFF8;

      if (v26 + v16 > size)
        break;
      if (!v24->_nascent)
      {
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[FPnfsMemNode name](v24, "name")));
        v28 = (char *)objc_msgSend(v27, "UTF8String");

        v29 = -[FPnfsMemNode fileno](v24, "fileno");
        if (v14 - 1 == (char *)v23)
          v30 = -1;
        else
          v30 = v15;
        v13 = (id)sub_1000190A8(v29, v28, v30, (uint64_t)v13);
      }
      ++v15;
      ++v23;
      v18 = v24;
    }
    while (v23 < (unint64_t)v14);
  }
  v31 = (NSDate *)objc_alloc_init((Class)NSDate);
  atime = v10->_atime;
  v10->_atime = v31;

  v17 = 0;
  v12 = v34;
  a6 = v35;
LABEL_38:
  objc_sync_exit(v10);

  *a6 = v17;
  return v12;
}

- (id)readDirAttrAtCookie:(unint64_t)a3 withVerifier:(unint64_t)a4 forBytes:(unint64_t)a5 andError:(int *)a6
{
  FPnfsMemNode *v10;
  unint64_t dirattrSize;
  id v12;
  unsigned __int16 *v13;
  id v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  unint64_t v28;
  size_t v29;
  uint64_t v30;
  NSDate *v31;
  NSDate *atime;
  int v33;
  id v35;
  int *v36;
  uint64_t v37;
  FPnfsMemNode *v38;

  v10 = self;
  objc_sync_enter(v10);
  if (a4 && v10->_verf != a4)
  {
    v12 = 0;
    v33 = -1000;
  }
  else
  {
    if (v10->dirattrSize >= a5)
      dirattrSize = a5;
    else
      dirattrSize = v10->dirattrSize;
    v12 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", dirattrSize));
    v13 = (unsigned __int16 *)objc_msgSend(v12, "mutableBytes");
    if (v13)
    {
      v38 = v10;
      v14 = -[NSMutableArray count](v10->entries, "count");
      v35 = v12;
      v36 = a6;
      v15 = 0;
      v16 = a3 - 2;
      if (a3 < 2)
        v16 = 0;
      if (v16 < (unint64_t)v14 && dirattrSize)
      {
        v17 = (unint64_t)v14;
        v18 = 0;
        v19 = 0;
        v20 = 2;
        if (a3 < 2)
          v20 = a3;
        v37 = (uint64_t)v14 + v20 - 1;
        v21 = -(uint64_t)v20;
        do
        {
          v15 = (_BYTE *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v38->entries, "objectAtIndexedSubscript:", v21 + a3, v35, v36));

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
          v23 = (objc_msgSend(v22, "length") + 208) & 0xFFFFFFF8;

          v24 = v23 + v18;
          if (v24 > dirattrSize)
            break;
          if (!v15[32])
          {
            v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name")));
            v26 = (const char *)objc_msgSend(v25, "UTF8String");

            v27 = objc_msgSend(v15, "fileno");
            if (v37 == a3)
              v28 = -1;
            else
              v28 = a3 + 2;
            v29 = strlen(v26);
            *((_QWORD *)v13 + 10) = v27;
            *((_QWORD *)v13 + 5) = 0x1C000000002;
            *((_QWORD *)v13 + 8) = 0;
            *((_QWORD *)v13 + 3) = 323;
            v13[6] = v29;
            v13[5] = 200;
            *(_QWORD *)v13 = v28;
            v13[4] = (v29 & 0xFFF8) + 208;
            strlcpy((char *)v13 + 200, v26, v29 + 1);
            if (v28 == -1)
            {
              v30 = 0;
              v13[4] = 0;
            }
            else
            {
              v30 = v13[4];
            }
            v13 = (unsigned __int16 *)((char *)v13 + v30);
            v18 = v24;
          }
          if (++a3 + v21 >= v17)
            break;
          v19 = v15;
        }
        while (v18 < dirattrSize);
      }
      v31 = (NSDate *)objc_alloc_init((Class)NSDate);
      v10 = v38;
      atime = v38->_atime;
      v38->_atime = v31;

      v33 = 0;
      v12 = v35;
      a6 = v36;
    }
    else
    {
      v33 = 28;
    }
  }
  objc_sync_exit(v10);

  *a6 = v33;
  return v12;
}

- (id)getattr
{
  FPnfsMemNode *v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  __int128 v11;
  unsigned int v12;
  uid_t v13;
  gid_t v14;
  unint64_t size;
  uint64_t v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v2 = self;
  objc_sync_enter(v2);
  v12 = -[NSMutableArray count](v2->entries, "count", 0, 7647, 0, 0x1FF00000002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0)
      + 2;
  v13 = getuid();
  v14 = getgid();
  size = v2->size;
  v16 = 1;
  *(_QWORD *)&v17 = -[FPnfsMemNode fileno](v2, "fileno");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemNode atime](v2, "atime"));
  objc_msgSend(v3, "timeIntervalSince1970");
  v18 = vcvtmd_s64_f64(v4);
  v19 = llround((v4 - floor(v4)) * 1000000000.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemNode mtime](v2, "mtime"));
  objc_msgSend(v5, "timeIntervalSince1970");
  v20 = vcvtmd_s64_f64(v6);
  v21 = llround((v6 - floor(v6)) * 1000000000.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FPnfsMemNode mtime](v2, "mtime"));
  objc_msgSend(v7, "timeIntervalSince1970");
  v22 = vcvtmd_s64_f64(v8);
  v23 = llround((v8 - floor(v8)) * 1000000000.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v11, 184));
  objc_sync_exit(v2);

  return v9;
}

- (FPnfsMemFS)fs
{
  return (FPnfsMemFS *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)fh
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)verf
{
  return self->_verf;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (FPnfsMemNode)parent
{
  return (FPnfsMemNode *)objc_loadWeakRetained((id *)&self->_parent);
}

- (NSDate)atime
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (NSDate)mtime
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)nascent
{
  return self->_nascent;
}

- (void)setNascent:(BOOL)a3
{
  self->_nascent = a3;
}

- (unsigned)fileno
{
  return self->_fileno;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtime, 0);
  objc_storeStrong((id *)&self->_atime, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fh, 0);
  objc_storeStrong((id *)&self->_fs, 0);
  objc_storeStrong((id *)&self->entries, 0);
}

@end
