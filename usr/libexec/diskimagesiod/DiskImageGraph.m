@implementation DiskImageGraph

+ (BOOL)loadPlistDictFromURL:(id)a3 dict:(id *)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingFromURL:error:](NSFileHandle, "fileHandleForReadingFromURL:error:", a3, 0));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "readDataUpToLength:error:", 0x100000, a5));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v9, 2, 0, a5));
      v12 = objc_opt_class(NSDictionary, v11);
      if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
      {
        *a4 = objc_retainAutorelease(v10);
        v13 = 1;
      }
      else
      {
        v13 = +[DiskImageGraph failWithNoPstackError:](DiskImageGraph, "failWithNoPstackError:", a5);
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = +[DiskImageGraph failWithNoPstackError:](DiskImageGraph, "failWithNoPstackError:", a5);
  }

  return v13;
}

+ (BOOL)failWithNoPstackError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Not a pstack."), CFSTR("DIErrorVerboseInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DiskImages2.ErrorDomain"), 167, v4));
  v6 = v5;
  if (a3)
    *a3 = objc_retainAutorelease(v5);

  return 0;
}

+ (id)createPstackDictWithNode:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "toDictionary"));
  v5 = objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v3, "setPstackDict:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pstackDict"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", CFSTR("1.0"), CFSTR("PstackVersion"), v7, CFSTR("ActiveNode"), v9, CFSTR("Images"), 0));

  return v10;
}

- (DiskImageGraph)initWithPluginName:(id)a3 pluginParams:(id)a4 newPstackURL:(id)a5 tag:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  DiskImageGraph *v15;
  DiskImageGraph *v16;
  uint64_t v17;
  void *v18;
  PluginDiskImageGraphNode *v19;
  DiskImageGraphNode *activeNode;
  PluginDiskImageGraphNode *v21;
  uint64_t v22;
  NSMutableDictionary *pstackDB;
  NSMutableDictionary *v24;
  NSMutableDictionary *nodes;
  void *v26;
  void *v27;
  void *v28;
  DiskImageGraph *v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  objc_super v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v41.receiver = self;
  v41.super_class = (Class)DiskImageGraph;
  v15 = -[DiskImageGraph init](&v41, "init");
  v16 = v15;
  if (!v15)
    goto LABEL_4;
  objc_storeStrong((id *)&v15->_pstackURL, a5);
  v17 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  if (v17)
  {
    v18 = (void *)v17;
    LOBYTE(v38) = 0;
    v19 = -[PluginDiskImageGraphNode initWithPluginName:pluginParams:tag:UUID:parentNode:metadata:isCache:]([PluginDiskImageGraphNode alloc], "initWithPluginName:pluginParams:tag:UUID:parentNode:metadata:isCache:", v11, v12, v14, v17, 0, 0, v38);
    activeNode = v16->_activeNode;
    v16->_activeNode = &v19->super;
    v21 = v19;

    v22 = objc_claimAutoreleasedReturnValue(+[DiskImageGraph createPstackDictWithNode:](DiskImageGraph, "createPstackDictWithNode:", v21));
    pstackDB = v16->_pstackDB;
    v16->_pstackDB = (NSMutableDictionary *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    nodes = v16->_nodes;
    v16->_nodes = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](v16, "nodes"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode UUID](v21, "UUID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUIDString"));
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v21, v28);

LABEL_4:
    v29 = v16;
    goto LABEL_15;
  }
  v30 = *__error();
  if (sub_1000BF0BC())
  {
    v40 = 0;
    v31 = sub_1000BF044();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      v33 = 3;
    else
      v33 = 2;
    *(_DWORD *)buf = 68157954;
    v43 = 73;
    v44 = 2080;
    v45 = "-[DiskImageGraph initWithPluginName:pluginParams:newPstackURL:tag:error:]";
    LODWORD(v39) = 18;
    v34 = (char *)_os_log_send_and_compose_impl(v33, &v40, 0, 0, &_mh_execute_header, v32, 16, "%.*s: Failed to get UUID info of provided image.", (int)buf, v39);

    if (v34)
    {
      fprintf(__stderrp, "%s\n", v34);
      free(v34);
    }
  }
  else
  {
    v35 = sub_1000BF044();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68157954;
      v43 = 73;
      v44 = 2080;
      v45 = "-[DiskImageGraph initWithPluginName:pluginParams:newPstackURL:tag:error:]";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%.*s: Failed to get UUID info of provided image.", buf, 0x12u);
    }

  }
  v29 = 0;
  *__error() = v30;
LABEL_15:

  return v29;
}

- (NSMutableArray)imagesDictsArray
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackDB](self, "pstackDB"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Images")));

  return (NSMutableArray *)v3;
}

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a3));
  v8 = 0;
  if (objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("PstackVersion"), objc_opt_class(NSString, v6), 0, a4))
  {
    if (objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("ImportPstack"), objc_opt_class(NSArray, v7), 1, a4))
    {
      v8 = 0;
      if (objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("ActiveNode"), objc_opt_class(NSString, v9), 0, a4))
      {
        v8 = 0;
        if (objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("Images"), objc_opt_class(NSArray, v10), 0, a4))
        {
          if (objc_msgSend(v5, "count"))
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Validation failed, input contains unexpected data.")));
            v8 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v11, a4);

          }
          else
          {
            v8 = 1;
          }
        }
      }
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (DiskImageGraph)initWithData:(id)a3 pstackURL:(id)a4 imported:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  DiskImageGraph *v12;
  uint64_t v13;
  NSMutableDictionary *pstackDB;
  NSMutableDictionary *v15;
  NSMutableDictionary *nodes;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  DiskImageGraphNode *activeNode;
  DiskImageGraph *v23;
  DiskImageGraph *v24;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v26.receiver = self;
  v26.super_class = (Class)DiskImageGraph;
  v12 = -[DiskImageGraph init](&v26, "init");
  if (v12)
  {
    if (!+[DiskImageGraph validateWithDictionary:error:](DiskImageGraph, "validateWithDictionary:error:", v10, a6))goto LABEL_10;
    v12->_imported = a5;
    objc_storeStrong((id *)&v12->_pstackURL, a4);
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v10));
    pstackDB = v12->_pstackDB;
    v12->_pstackDB = (NSMutableDictionary *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    nodes = v12->_nodes;
    v12->_nodes = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12->_pstackDB, "objectForKeyedSubscript:", CFSTR("Images")));
    v18 = +[DiskImageGraph populateNodesDictsWithArray:pstackURL:nodesDict:isTopLevelPstack:error:](DiskImageGraph, "populateNodesDictsWithArray:pstackURL:nodesDict:isTopLevelPstack:error:", v17, v11, v12->_nodes, 1, a6);

    if (!v18 || !-[DiskImageGraph loadImportedNodesWithError:](v12, "loadImportedNodesWithError:", a6))
      goto LABEL_10;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](v12, "nodes"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12->_pstackDB, "objectForKeyedSubscript:", CFSTR("ActiveNode")));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", v20));
    activeNode = v12->_activeNode;
    v12->_activeNode = (DiskImageGraphNode *)v21;

    if (!v21)
    {
      v23 = (DiskImageGraph *)objc_claimAutoreleasedReturnValue(+[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", 22, CFSTR("Bad pstack format, node with active UUID not found."), a6));
      goto LABEL_9;
    }
    if (!+[DiskImageGraph createNodesConnectivityWithNodesDict:error:](DiskImageGraph, "createNodesConnectivityWithNodesDict:error:", v12->_nodes, a6)|| !-[DiskImageGraph checkStackValidityWithError:](v12, "checkStackValidityWithError:", a6))
    {
LABEL_10:
      v24 = 0;
      goto LABEL_11;
    }
  }
  v23 = v12;
LABEL_9:
  v24 = v23;
LABEL_11:

  return v24;
}

- (BOOL)loadImportedNodesWithError:(id *)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackDB](self, "pstackDB"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ImportPstack")));

  if (!v6)
    goto LABEL_9;
  if (!-[DiskImageGraph imported](self, "imported"))
  {
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      v7 = CFSTR("Multiple imports are not allowed.");
      goto LABEL_6;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackURL](self, "pstackURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByDeletingLastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:relativeToURL:](NSURL, "fileURLWithPath:relativeToURL:", v8, v10));

    a3 = -[DiskImageGraph initWithPstackURL:imported:error:]([DiskImageGraph alloc], "initWithPstackURL:imported:error:", v11, 1, a3);
    if (!a3)
    {

      goto LABEL_10;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "nodes"));
    objc_msgSend(v12, "addEntriesFromDictionary:", v13);

LABEL_9:
    LOBYTE(a3) = 1;
    goto LABEL_10;
  }
  v7 = CFSTR("nested imports are not allowed.");
LABEL_6:
  LOBYTE(a3) = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, v7, a3);
LABEL_10:

  return (char)a3;
}

- (DiskImageGraph)initWithPstackURL:(id)a3 error:(id *)a4
{
  return -[DiskImageGraph initWithPstackURL:imported:error:](self, "initWithPstackURL:imported:error:", a3, 0, a4);
}

- (DiskImageGraph)initWithPstackURL:(id)a3 imported:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  unsigned int v9;
  id v10;
  DiskImageGraph *v11;
  id v13;

  v6 = a4;
  v8 = a3;
  v13 = 0;
  v9 = +[DiskImageGraph loadPlistDictFromURL:dict:error:](DiskImageGraph, "loadPlistDictFromURL:dict:error:", v8, &v13, a5);
  v10 = v13;
  if (v9)
  {
    self = -[DiskImageGraph initWithData:pstackURL:imported:error:](self, "initWithData:pstackURL:imported:error:", v10, v8, v6, a5);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)copyDictNodesToFolder:(id)a3 dict:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v7 = a3;
  v8 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_100112F38;
  v32 = sub_100112F48;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100112F38;
  v26 = sub_100112F48;
  v27 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100112F50;
  v17[3] = &unk_100190988;
  v20 = &v28;
  v10 = v7;
  v18 = v10;
  v11 = v9;
  v19 = v11;
  v21 = &v22;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v17);
  v12 = v29[5];
  if (v12)
  {
    v13 = (void *)v23[5];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001130B8;
    v15[3] = &unk_1001909B0;
    v16 = v11;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);
    if (a5)
      *a5 = objc_retainAutorelease((id)v29[5]);

  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12 == 0;
}

- (BOOL)cloneToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  BOOL v29;
  uint64_t v30;
  void *v32;
  void *v33;
  id *v34;
  void *v35;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackURL](self, "pstackURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackDB](self, "pstackDB"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackDB](self, "pstackDB"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Images")));

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v13, "count")));
  objc_msgSend(v11, "setObject:forKeyedSubscript:");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackDB](self, "pstackDB"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ImportPstack")));

  if (v15)
  {
    v16 = CFSTR("Cannot clone a pstack with an import.");
LABEL_16:
    v30 = 22;
LABEL_17:
    v29 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", v30, v16, a4);
    goto LABEL_18;
  }
  if ((objc_msgSend(v6, "isFileURL") & 1) == 0)
  {
    v16 = CFSTR("Destination folder URL must be of 'file' scheme.");
    goto LABEL_16;
  }
  if (!objc_msgSend(v6, "hasDirectoryPath")
    || (objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    v16 = CFSTR("Destination folder URL must represent an existing folder.");
    v30 = 20;
    goto LABEL_17;
  }
  v32 = v13;
  v33 = v11;
  v34 = a4;
  v35 = v9;
  v36 = v6;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v17 = v13;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v23 = objc_msgSend(v22, "mutableCopy");
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("FilePath")));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "componentsSeparatedByString:", CFSTR("/")));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "lastObject"));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("FilePath"));

        objc_msgSend(v37, "addObject:", v23);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v19);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
  v6 = v36;
  v28 = +[DiskImageGraph copyDictNodesToFolder:dict:error:](DiskImageGraph, "copyDictNodesToFolder:dict:error:", v36, v27, v34);

  if (v28)
  {
    v11 = v33;
    v9 = v35;
    v29 = +[DiskImageGraph saveToPlistWithDictionary:URL:error:](DiskImageGraph, "saveToPlistWithDictionary:URL:error:", v33, v35, v34);
  }
  else
  {
    v29 = 0;
    v9 = v35;
    v11 = v33;
  }
  v13 = v32;
LABEL_18:

  return v29;
}

- (void)setActiveNode:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_activeNode, a3);
  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pstackDB, "setObject:forKeyedSubscript:", v6, CFSTR("ActiveNode"));

}

+ (BOOL)populateNodesDictsWithArray:(id)a3 pstackURL:(id)a4 nodesDict:(id)a5 isTopLevelPstack:(BOOL)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_100112F38;
  v27 = sub_100112F48;
  v28 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100113614;
  v18[3] = &unk_1001909D8;
  v22 = a6;
  v14 = v12;
  v19 = v14;
  v21 = &v23;
  v15 = v13;
  v20 = v15;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v18);
  v16 = (void *)v24[5];
  if (a7 && v16)
    *a7 = objc_retainAutorelease(v16);

  _Block_object_dispose(&v23, 8);
  return v16 == 0;
}

+ (BOOL)createNodesConnectivityWithNodesDict:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_100112F38;
  v15 = sub_100112F48;
  v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100113808;
  v8[3] = &unk_100190A00;
  v5 = a3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)v12[5];
  if (a4 && v6)
    *a4 = objc_retainAutorelease(v6);

  _Block_object_dispose(&v11, 8);
  return v6 == 0;
}

- (BOOL)checkStackValidityWithError:(id *)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph activeNode](self, "activeNode"));
  v6 = -1;
  while (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parent"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
    v9 = objc_msgSend(v8, "count");

    ++v6;
    v5 = v7;
    if ((unint64_t)v9 <= v6)
    {
      v10 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Invalid pstack, Active stack contains a loop."), a3);

      return v10;
    }
  }
  return 1;
}

- (BOOL)savePstackWithError:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackDB](self, "pstackDB"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph pstackURL](self, "pstackURL"));
  LOBYTE(a3) = +[DiskImageGraph saveToPlistWithDictionary:URL:error:](DiskImageGraph, "saveToPlistWithDictionary:URL:error:", v5, v6, a3);

  return (char)a3;
}

+ (BOOL)saveToPlistWithDictionary:(id)a3 URL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a3, 100, 0, a5));
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "writeToURL:options:error:", v7, 1, a5);
  else
    v10 = 0;

  return v10;
}

- (BOOL)setActiveNodeWithUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));
  if (v9)
  {
    -[DiskImageGraph setActiveNode:](self, "setActiveNode:", v9);
    v10 = 1;
  }
  else
  {
    v10 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Cannot find image with provided UUID."), a4);
  }

  return v10;
}

- (id)getImageWithTag:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100112F38;
  v16[4] = sub_100112F48;
  v6 = a3;
  v17 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100113D00;
  v15[3] = &unk_100190A28;
  v15[4] = v16;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keysOfEntriesPassingTest:", v15));

  if (!objc_msgSend(v8, "count"))
  {
    v12 = CFSTR("Cannot find image with provided tag.");
    v13 = 2;
LABEL_6:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", v13, v12, a4));
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "count") != (id)1)
  {
    v12 = CFSTR("More than one image in the stack has the provided tag, please specify UUID instead.");
    v13 = 22;
    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anyObject"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));

LABEL_7:
  _Block_object_dispose(v16, 8);

  return v11;
}

- (id)getImageWithUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));
  if (v9)
    v10 = v9;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(+[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 2, CFSTR("Cannot find image with provided uuid."), a4));
  v11 = v10;

  return v11;
}

- (BOOL)setActiveNodeWithTag:(id)a3 error:(id *)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph getImageWithTag:error:](self, "getImageWithTag:error:", a3, a4));
  if (v5)
    -[DiskImageGraph setActiveNode:](self, "setActiveNode:", v5);

  return v5 != 0;
}

- (BOOL)removeNodeWithUUID:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;

  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));
  if (v11)
    v12 = -[DiskImageGraph removeWithNode:recursive:error:](self, "removeWithNode:recursive:error:", v11, v6, a5);
  else
    v12 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Cannot find image with provided UUID."), a5);
  v13 = v12;

  return v13;
}

- (BOOL)removeNodeWithTag:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  void *v8;
  BOOL v9;

  v6 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph getImageWithTag:error:](self, "getImageWithTag:error:", a3, a5));
  if (v8)
    v9 = -[DiskImageGraph removeWithNode:recursive:error:](self, "removeWithNode:recursive:error:", v8, v6, a5);
  else
    v9 = 0;

  return v9;
}

- (BOOL)removeWithNode:(id)a3 recursive:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parent"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getDescendants"));
    if (!objc_msgSend(v10, "count") || v6)
    {
      v14 = objc_claimAutoreleasedReturnValue(-[DiskImageGraph activeNode](self, "activeNode"));
      if ((id)v14 == v8)
      {

      }
      else
      {
        v15 = (void *)v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph activeNode](self, "activeNode"));
        v17 = objc_msgSend(v10, "containsObject:", v16);

        if (!v17)
        {
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "children", 0));
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v30;
            do
            {
              for (i = 0; i != v20; i = (char *)i + 1)
              {
                if (*(_QWORD *)v30 != v21)
                  objc_enumerationMutation(v18);
                -[DiskImageGraph removeWithNode:recursive:error:](self, "removeWithNode:recursive:error:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), v6, 0);
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            }
            while (v20);
          }

          objc_msgSend(v8, "deleteImage");
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph imagesDictsArray](self, "imagesDictsArray"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pstackDict"));
          objc_msgSend(v23, "removeObject:", v24);

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph nodes](self, "nodes"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "UUIDString"));
          objc_msgSend(v25, "removeObjectForKey:", v27);

          v13 = 1;
          goto LABEL_19;
        }
      }
      v11 = CFSTR("The requested operation will delete the active node, please set another one first.");
      v12 = 22;
    }
    else
    {
      v11 = CFSTR("The requested operation will delete all children of the provided node. use recursive removal to surpress this error.");
      v12 = 1;
    }
    v13 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", v12, v11, a5);
LABEL_19:

    goto LABEL_20;
  }
  v13 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Cannot delete base image node."), a5);
LABEL_20:

  return v13;
}

+ (id)getRelativeIfContainedWithChildURL:(id)a3 parentURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isFileURL") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByStandardizingPath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByStandardizingPath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));

    if (objc_msgSend(v8, "hasPrefix:", v10))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringFromIndex:", (char *)objc_msgSend(v10, "length") + 1));
      v12 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:relativeToURL:](NSURL, "fileURLWithPath:relativeToURL:", v11, v6));

    }
    else
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteURL"));
    }

  }
  else
  {
    v12 = v5;
  }

  return v12;
}

- (id)baseNode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph activeNode](self, "activeNode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "parent"));

  if (v3)
  {
    do
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "parent"));

      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent"));
      v2 = v4;
    }
    while (v5);
  }
  else
  {
    v4 = v2;
  }
  return v4;
}

- (NSURL)pstackURL
{
  return self->_pstackURL;
}

- (void)setPstackURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)pstackDB
{
  return self->_pstackDB;
}

- (void)setPstackDB:(id)a3
{
  objc_storeStrong((id *)&self->_pstackDB, a3);
}

- (void)setImagesDictsArray:(id)a3
{
  objc_storeStrong((id *)&self->_imagesDictsArray, a3);
}

- (NSMutableDictionary)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
  objc_storeStrong((id *)&self->_nodes, a3);
}

- (DiskImageGraphNode)activeNode
{
  return self->_activeNode;
}

- (BOOL)imported
{
  return self->_imported;
}

- (void)setImported:(BOOL)a3
{
  self->_imported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeNode, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_imagesDictsArray, 0);
  objc_storeStrong((id *)&self->_pstackDB, 0);
  objc_storeStrong((id *)&self->_pstackURL, 0);
}

@end
