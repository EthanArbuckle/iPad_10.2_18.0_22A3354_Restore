@implementation MIIPAPatcherFileManager

+ (id)defaultManager
{
  if (qword_10009DEF8 != -1)
    dispatch_once(&qword_10009DEF8, &stru_100084DE0);
  return (id)qword_10009DEF0;
}

- (id)dataFromFileURL:(id)a3 withError:(id *)a4
{
  return +[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", a3, 1, a4);
}

- (id)plistRepresentationFromFileURL:(id)a3 withError:(id *)a4
{
  return +[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", a3, a4);
}

- (BOOL)writeData:(id)a3 toFileURL:(id)a4 mode:(unsigned __int16)a5 withError:(id *)a6
{
  return objc_msgSend(a3, "writeToURL:options:error:", a4, 0, a6);
}

- (BOOL)writePlistRepresentation:(id)a3 toFileURL:(id)a4 mode:(unsigned __int16)a5 withError:(id *)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  id v15;
  id v17;
  id v18;

  v7 = a5;
  v10 = a4;
  v18 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherFileManager dataFromPlistRepresentation:withError:](self, "dataFromPlistRepresentation:withError:", a3, &v18));
  v12 = v18;
  v13 = v12;
  if (v11)
  {
    v17 = v12;
    v14 = -[MIIPAPatcherFileManager writeData:toFileURL:mode:withError:](self, "writeData:toFileURL:mode:withError:", v11, v10, v7, &v17);
    v15 = v17;

    v13 = v15;
    if (!a6)
      goto LABEL_7;
  }
  else
  {
    v14 = 0;
    if (!a6)
      goto LABEL_7;
  }
  if (!v14)
    *a6 = objc_retainAutorelease(v13);
LABEL_7:

  return v14;
}

- (BOOL)enumerateDirectoryAtURL:(id)a3 includeTypes:(unint64_t)a4 withError:(id *)a5 enumerator:(id)a6
{
  id v8;
  uint64_t (**v9)(id, void *, id *);
  id v10;
  DIR *v11;
  void *v12;
  dirent *v13;
  int d_type;
  void *v15;
  void *v16;
  int v17;
  id v18;
  int v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v27;
  stat v28;
  _QWORD v29[3];
  _QWORD v30[3];

  v8 = a3;
  v9 = (uint64_t (**)(id, void *, id *))a6;
  v10 = objc_retainAutorelease(v8);
  v11 = opendir((const char *)objc_msgSend(v10, "fileSystemRepresentation"));
  if (!v11)
  {
    v20 = *__error();
    v29[0] = NSLocalizedDescriptionKey;
    v21 = objc_alloc((Class)NSString);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    v23 = objc_msgSend(v21, "initWithFormat:", CFSTR("Failed to open [%@] for enumeration"), v22);
    v30[0] = v23;
    v30[1] = &off_10008ECE8;
    v29[1] = CFSTR("line");
    v29[2] = CFSTR("function");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MIIPAPatcherFileManager enumerateDirectoryAtURL:includeTypes:withError:enumerator:]"));
    v30[2] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 3));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v20, v25));

    goto LABEL_30;
  }
  v12 = 0;
  while (1)
  {
    v13 = readdir(v11);
    if (!v13)
      break;
    if (v13->d_name[0] != 46)
    {
      d_type = v13->d_type;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13->d_name));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v15, 0));

      if (d_type)
        goto LABEL_8;
      memset(&v28, 0, sizeof(v28));
      if (stat((const char *)objc_msgSend(objc_retainAutorelease(v16), "fileSystemRepresentation"), &v28))
      {
LABEL_7:
        d_type = 0;
        goto LABEL_8;
      }
      v19 = v28.st_mode & 0xF000;
      switch(v19)
      {
        case 16384:
          d_type = 4;
          break;
        case 32768:
          d_type = 8;
          break;
        case 40960:
          d_type = 10;
          break;
        default:
          goto LABEL_7;
      }
LABEL_8:
      if (!a4)
        goto LABEL_15;
      switch(d_type)
      {
        case 4:
          if ((a4 & 2) != 0)
            goto LABEL_15;
          break;
        case 10:
          if ((a4 & 4) != 0)
            goto LABEL_15;
          break;
        case 8:
          if ((a4 & 1) != 0)
            goto LABEL_15;
          break;
        default:
          if ((a4 & 8) != 0)
          {
LABEL_15:
            v27 = v12;
            v17 = v9[2](v9, v16, &v27);
            v18 = v27;

            v12 = v18;
            goto LABEL_16;
          }
          break;
      }
      v17 = 1;
LABEL_16:

      if (!v17)
        break;
    }
  }
  closedir(v11);
LABEL_30:

  return v11 != 0;
}

- (id)directoriesOrderedByDepthFromFilePaths:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  void *v20;
  void *v21;
  unsigned int v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v28;
  void *context;
  id v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v3 = a3;
  v32 = objc_alloc_init((Class)NSMutableArray);
  context = objc_autoreleasePoolPush();
  v4 = objc_alloc_init((Class)NSMutableSet);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "hasSuffix:", CFSTR("/")))
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByStandardizingPath"));
        else
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByDeletingLastPathComponent"));
        v12 = v11;
        if (objc_msgSend(v11, "length"))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pathComponents"));
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v7);
  }
  v28 = v5;

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v4, "count")));
  if (objc_msgSend(v4, "count"))
  {
    v14 = 0;
    v30 = v4;
    do
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v15 = v4;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v34;
        ++v14;
        do
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(_QWORD *)v34 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", 0));
            v22 = objc_msgSend(v21, "isEqual:", CFSTR("/"));

            v23 = v14 + v22;
            if ((unint64_t)objc_msgSend(v20, "count") >= v23)
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subarrayWithRange:", 0, v14 + v22));
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v24));
              if ((objc_msgSend(v32, "containsObject:", v25) & 1) == 0)
                objc_msgSend(v32, "addObject:", v25);

            }
            if ((unint64_t)objc_msgSend(v20, "count") <= v23)
              objc_msgSend(v31, "addObject:", v20);
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v17);
        v4 = v30;
      }
      else
      {
        ++v14;
      }

      objc_msgSend(v15, "minusSet:", v31);
      objc_msgSend(v31, "removeAllObjects");
    }
    while (objc_msgSend(v15, "count"));
  }

  objc_autoreleasePoolPop(context);
  v26 = objc_msgSend(v32, "copy");

  return v26;
}

- (BOOL)createDirectoryAtURL:(id)a3 mode:(unsigned __int16)a4 withError:(id *)a5
{
  id v7;
  uint64_t v8;
  id v9;
  BOOL v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[3];

  v7 = objc_retainAutorelease(a3);
  if (mkdir((const char *)objc_msgSend(v7, "fileSystemRepresentation"), a4) && (v8 = *__error(), (_DWORD)v8 != 17))
  {
    v11 = objc_alloc((Class)NSString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v13 = objc_msgSend(v11, "initWithFormat:", CFSTR("Could not create directory at [%@]"), v12, NSLocalizedDescriptionKey);
    v18[0] = v13;
    v18[1] = &off_10008ED00;
    v17[1] = CFSTR("line");
    v17[2] = CFSTR("function");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MIIPAPatcherFileManager createDirectoryAtURL:mode:withError:]"));
    v18[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v8, v15));

    if (a5)
    {
      v9 = objc_retainAutorelease(v9);
      v10 = 0;
      *a5 = v9;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v9 = 0;
    v10 = 1;
  }

  return v10;
}

- (BOOL)createDirectoryAtPath:(id)a3 relativeToURL:(id)a4 mode:(unsigned __int16)a5 withError:(id *)a6
{
  uint64_t v7;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  id v14;

  v7 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "URLByAppendingPathComponent:isDirectory:", a3, 1));
  v14 = 0;
  v10 = -[MIIPAPatcherFileManager createDirectoryAtURL:mode:withError:](self, "createDirectoryAtURL:mode:withError:", v9, v7, &v14);
  v11 = v14;
  v12 = v11;
  if (a6 && !v10)
    *a6 = objc_retainAutorelease(v11);

  return v10;
}

- (id)plistRepresentationFromData:(id)a3 withError:(id *)a4
{
  void *v5;
  id v6;
  id v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v16;
  _QWORD v17[3];
  _QWORD v18[3];

  v16 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", a3, 0, 0, &v16));
  v6 = v16;
  if (v5)
  {
    objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v5) & 1) != 0)
      goto LABEL_7;
    v17[0] = NSLocalizedDescriptionKey;
    v7 = objc_alloc((Class)NSString);
    v8 = (objc_class *)objc_opt_class(v5);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_msgSend(v7, "initWithFormat:", CFSTR("Plist data is not a dictionary, got [%@]"), v10);
    v18[0] = v11;
    v18[1] = &off_10008ED18;
    v17[1] = CFSTR("line");
    v17[2] = CFSTR("function");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MIIPAPatcherFileManager plistRepresentationFromData:withError:]"));
    v18[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
    v14 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, v13));

    v6 = (id)v14;
  }
  if (a4)
  {
    v6 = objc_retainAutorelease(v6);
    v5 = 0;
    *a4 = v6;
  }
  else
  {
    v5 = 0;
  }
LABEL_7:

  return v5;
}

- (id)dataFromPlistRepresentation:(id)a3 withError:(id *)a4
{
  return +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a3, 200, 0, a4);
}

- (BOOL)copyFromURL:(id)a3 toURL:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  id v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  id *v22;
  _QWORD v23[3];
  _QWORD v24[3];

  v7 = a3;
  v8 = a4;
  v9 = objc_retainAutorelease(v7);
  v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");
  v11 = objc_retainAutorelease(v8);
  v12 = copyfile(v10, (const char *)objc_msgSend(v11, "fileSystemRepresentation"), 0, 0xC000Fu);
  if (v12)
  {
    v21 = *__error();
    v22 = a5;
    v23[0] = NSLocalizedDescriptionKey;
    v13 = objc_alloc((Class)NSString);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
    v16 = objc_msgSend(v13, "initWithFormat:", CFSTR("Could not copy file from [%@] to [%@]"), v14, v15);
    v24[0] = v16;
    v24[1] = &off_10008ED30;
    v23[1] = CFSTR("line");
    v23[2] = CFSTR("function");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MIIPAPatcherFileManager copyFromURL:toURL:withError:]"));
    v24[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 3));
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v21, v18));

    if (v22)
    {
      v19 = objc_retainAutorelease(v19);
      *v22 = v19;
    }
  }
  else
  {
    v19 = 0;
  }

  return v12 == 0;
}

@end
