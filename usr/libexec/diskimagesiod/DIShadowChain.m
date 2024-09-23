@implementation DIShadowChain

- (DIShadowChain)init
{
  DIShadowChain *v2;
  uint64_t v3;
  NSMutableArray *nodes;
  uint64_t v5;
  NSArray *shadowStats;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DIShadowChain;
  v2 = -[DIShadowChain init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    nodes = v2->_nodes;
    v2->_nodes = (NSMutableArray *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    shadowStats = v2->_shadowStats;
    v2->_shadowStats = (NSArray *)v5;

    v2->_shouldValidate = 1;
  }
  return v2;
}

- (BOOL)addShadowURLs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  DIShadowNode *v13;
  DIShadowNode *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v11);
        v13 = [DIShadowNode alloc];
        v14 = -[DIShadowNode initWithURL:isCache:](v13, "initWithURL:isCache:", v12, 0, (_QWORD)v17);
        objc_msgSend(v7, "addObject:", v14);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15 = -[DIShadowChain addShadowNodes:error:](self, "addShadowNodes:error:", v7, a4);
  return v15;
}

- (BOOL)verifyNodes:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned int v14;
  BOOL v15;
  void *v16;
  unsigned __int8 v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v7)
  {
    v15 = 1;
    goto LABEL_15;
  }
  v8 = *(_QWORD *)v20;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
      v12 = objc_msgSend(v11, "isFileURL");

      if ((v12 & 1) == 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Shadow path %@ is not a valid file"), v10));
        v17 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v16, a4);
LABEL_14:
        v15 = v17;

        goto LABEL_15;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
      v14 = objc_msgSend(v13, "containsObject:", v10);

      if (v14)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Duplicate shadow values for: %@"), v10));
        v17 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v16, a4);
        goto LABEL_14;
      }
    }
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    v15 = 1;
    if (v7)
      continue;
    break;
  }
LABEL_15:

  return v15;
}

- (BOOL)addShadowNodes:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;

  v6 = a3;
  v7 = -[DIShadowChain verifyNodes:error:](self, "verifyNodes:error:", v6, a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
    objc_msgSend(v8, "addObjectsFromArray:", v6);

  }
  return v7;
}

- (void)openWritable:(BOOL)a3 createNonExisting:(BOOL)a4
{
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  BOOL v10;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B5EF0;
  v8[3] = &unk_100185278;
  v9 = a3;
  v10 = a4;
  v8[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

- (id)statWithError:(id *)a3
{
  NSArray *shadowStats;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  DIStatFS *v21;
  DIStatFS *v22;
  NSArray *v23;
  uint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  shadowStats = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v31;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fileBackend"));
      v11 = v10 == 0;

      if (v11)
        break;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fileBackend"));
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "backend");
      }
      else
      {
        v26 = 0;
        v27 = 0;
      }
      sub_10011E808((uint64_t)&v26, &v28);
      v14 = sub_100105254((uint64_t)&v28);
      v15 = v29;
      if (v29)
      {
        p_shared_owners = (unint64_t *)&v29->__shared_owners_;
        do
          v17 = __ldaxr(p_shared_owners);
        while (__stlxr(v17 - 1, p_shared_owners));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
      v18 = v27;
      if (v27)
      {
        v19 = (unint64_t *)&v27->__shared_owners_;
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }

      if ((v14 & 0x80000000) != 0)
      {
        +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 150, CFSTR("Unexpected backend type for shadow file"), a3);
        goto LABEL_28;
      }
      v21 = -[DIStatFS initWithFileDescriptor:error:]([DIStatFS alloc], "initWithFileDescriptor:error:", v14, a3);
      v22 = v21;
      if (!v21)
      {
        +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 150, CFSTR("Could not stat shadow file"), a3);
        goto LABEL_28;
      }
      -[DIStatFS logWithHeader:](v21, "logWithHeader:", CFSTR("Shadow underlying FS"));
      -[NSArray addObject:](shadowStats, "addObject:", v22);

      if ((id)++v8 == v6)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_24;
      }
    }
    +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 150, CFSTR("Bakcend not initialized for file"), a3);
LABEL_28:

    v23 = 0;
    goto LABEL_29;
  }
LABEL_24:

  v23 = shadowStats;
  shadowStats = self->_shadowStats;
  self->_shadowStats = v23;
LABEL_29:

  return v23;
}

- (NSArray)mountPoints
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain shadowStats](self, "shadowStats", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), "mountedOnURL"));
        objc_msgSend(v3, "addObject:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (NSURL)activeShadowURL
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[DIShadowChain isEmpty](self, "isEmpty")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject")),
        v5 = objc_msgSend(v4, "isCache"),
        v4,
        v3,
        (v5 & 1) != 0))
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));

  }
  return (NSURL *)v6;
}

- (BOOL)hasBaseImageCache
{
  unsigned __int8 v3;
  void *v4;
  void *v5;

  if (-[DIShadowChain isEmpty](self, "isEmpty"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v3 = objc_msgSend(v5, "isCache");

  return v3;
}

- (NSArray)nonCacheNodes
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1001852B8));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", v3));

  return (NSArray *)v5;
}

- (int64_t)topDiskImageNumBlocks
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  const char *v17;
  uint8_t v18[8];
  uint8_t buf[8];
  _BYTE v20[10];

  if (!-[DIShadowChain isEmpty](self, "isEmpty"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fileBackend"));
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "backend");
      v12 = *(_QWORD *)buf;
    }
    else
    {
      v12 = 0;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)v20 = 0;

    v15 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 176))(v12);
    dup(v15);
    diskimage_uio::diskimage_open_params::create();
  }
  v3 = *__error();
  if (sub_1000BF0BC())
  {
    *(_QWORD *)v18 = 0;
    v4 = sub_1000BF044();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      v6 = 3;
    else
      v6 = 2;
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)&buf[4] = 38;
    *(_WORD *)v20 = 2080;
    *(_QWORD *)&v20[2] = "-[DIShadowChain topDiskImageNumBlocks]";
    LODWORD(v17) = 18;
    v7 = (char *)_os_log_send_and_compose_impl(v6, v18, 0, 0, &_mh_execute_header, v5, 16, "%.*s: numBlocks queried for an empty shadowChain.", (int)buf, v17);

    if (v7)
    {
      fprintf(__stderrp, "%s\n", v7);
      free(v7);
    }
  }
  else
  {
    v13 = sub_1000BF044();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&buf[4] = 38;
      *(_WORD *)v20 = 2080;
      *(_QWORD *)&v20[2] = "-[DIShadowChain topDiskImageNumBlocks]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%.*s: numBlocks queried for an empty shadowChain.", buf, 0x12u);
    }

  }
  *__error() = v3;
  return -22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIShadowChain)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  DIShadowChain *v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *nodes;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  uint64_t v18;
  NSArray *shadowStats;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)DIShadowChain;
  v6 = -[DIShadowChain init](&v21, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSMutableArray, v5);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(DIShadowNode, v8), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("nodes")));
    nodes = v6->_nodes;
    v6->_nodes = (NSMutableArray *)v11;

    v14 = objc_opt_class(NSArray, v13);
    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, objc_opt_class(DIStatFS, v15), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("shadowStats")));
    shadowStats = v6->_shadowStats;
    v6->_shadowStats = (NSArray *)v18;

    v6->_shouldValidate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldValidate"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("nodes"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain shadowStats](self, "shadowStats"));
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("shadowStats"));

  objc_msgSend(v6, "encodeBool:forKey:", -[DIShadowChain shouldValidate](self, "shouldValidate"), CFSTR("shouldValidate"));
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowChain nodes](self, "nodes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ShadowChain: %@"), v2));

  return v3;
}

- (NSMutableArray)nodes
{
  return self->_nodes;
}

- (NSArray)shadowStats
{
  return self->_shadowStats;
}

- (BOOL)shouldValidate
{
  return self->_shouldValidate;
}

- (void)setShouldValidate:(BOOL)a3
{
  self->_shouldValidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowStats, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end
