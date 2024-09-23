@implementation NSURL(TRI)

+ (id)triParseURLFromString:()TRI isDirectory:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("file:///"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:isDirectory:relativeToURL:", v5, a4, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }

  return v6;
}

- (uint64_t)triIsContainerURL
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "scheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("container"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)triPathAsOwner:()TRI
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[2];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "relativePath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "triIsContainerURL") & 1) == 0)
    goto LABEL_11;
  objc_msgSend(a1, "host");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_11;
  v7 = (void *)v6;
  objc_msgSend(a1, "port");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_11;
  objc_msgSend(a1, "port");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (v10)
  {
    objc_msgSend(a1, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIAppContainer containerWithIdentifier:type:](TRIAppContainer, "containerWithIdentifier:type:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v5, "length") >= 2 && objc_msgSend(v5, "isAbsolutePath"))
    {
      objc_msgSend(v5, "substringFromIndex:", 1);
      v13 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v13;
    }
    if (v5)
    {
      if ((a3 & 1) != 0)
        objc_msgSend(v12, "containerURLAsOwner");
      else
        objc_msgSend(v12, "containerURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v16, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v19;
        v23[1] = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "pathWithComponents:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v21;
        v14 = v5;
      }
      else
      {
        TRILogCategory_ClientFramework();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = a1;
          _os_log_error_impl(&dword_19B89C000, v22, OS_LOG_TYPE_ERROR, "triPathAsOwner: unable to resolve containerDir for URL: %@", buf, 0xCu);
        }

        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
LABEL_11:
    v5 = v5;
    v14 = v5;
  }

  return v14;
}

+ (uint64_t)triParseURLFromString:()TRI
{
  return objc_msgSend(a1, "triParseURLFromString:isDirectory:", a3, 0);
}

- (__CFString)triSaveURLToString
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isFileURL"))
  {
    objc_msgSend(a1, "relativePath");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = &stru_1E3C00710;
    if (v4)
      v6 = (__CFString *)v4;
    v7 = v6;

    if ((-[__CFString isAbsolutePath](v7, "isAbsolutePath") & 1) == 0)
    {
      objc_msgSend(a1, "baseURL");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(a1, "baseURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isFileURL") & 1) != 0)
        {
          objc_msgSend(a1, "baseURL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "relativePath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("/"));

          if ((v13 & 1) != 0)
            goto LABEL_11;
        }
        else
        {

        }
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(a1, "baseURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "triSaveURLToString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v18;
        v22[1] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pathWithComponents:", v19);
        v20 = objc_claimAutoreleasedReturnValue();

        v7 = (__CFString *)v20;
      }
    }
  }
  else
  {
    objc_msgSend(a1, "absoluteString");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURL+TRI.m"), 43, CFSTR("Failed to compute absolute string for URL: %@"), a1);

      v7 = 0;
    }
  }
LABEL_11:
  if (-[__CFString hasPrefix:](v7, "hasPrefix:", CFSTR("./")))
  {
    -[__CFString substringFromIndex:](v7, "substringFromIndex:", 2);
    v14 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v14;
  }
  return v7;
}

- (uint64_t)triIsEqual:()TRI
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(a1, "isEqual:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(a1, "triSaveURLToString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "triSaveURLToString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

+ (id)triContainerURLWithPath:()TRI containerId:containerType:
{
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(v8, "isAbsolutePath");
  if (a5 && v7 && !v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@:%d/%@"), CFSTR("container"), v7, a5, v8);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)triURLByResolvingSymlinksInPathIncludingPrivate
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;
  uint64_t v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "URLByResolvingSymlinksInPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "pathComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("/")))
    {
      v9 = objc_msgSend(v7, "count");

      if (v9 >= 2)
      {
        objc_msgSend(v7, "subarrayWithRange:", 2, objc_msgSend(v7, "count") - 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v12;
        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fileURLWithPathComponents:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURL+TRI.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("level1Path"));

        }
        v23 = 0;
        objc_msgSend(v4, "destinationOfSymbolicLinkAtPath:error:", v16, &v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)objc_msgSend(&unk_1E3C194C0, "mutableCopy");
          objc_msgSend(v17, "pathComponents");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObjectsFromArray:", v19);

          objc_msgSend(v18, "addObjectsFromArray:", v10);
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", v18);
          v20 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v20 = v6;
        }

        goto LABEL_13;
      }
    }
    else
    {

    }
    v20 = v6;
LABEL_13:

    goto LABEL_14;
  }
  v20 = 0;
LABEL_14:

  return v20;
}

@end
