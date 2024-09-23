@implementation PhotosControlCommand

- (PhotosControlCommand)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("use designated initializer initWithArgc:argv: when creating %@"), objc_opt_class());

  return 0;
}

- (PhotosControlCommand)initWithArgc:(int)a3 argv:(char *)a4
{
  PhotosControlCommand *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *invokedName;
  const option *v10;
  uint64_t v11;
  const char *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  FILE *v23;
  objc_class *v24;
  id v25;
  uint64_t v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PhotosControlCommand;
  v6 = -[PhotosControlCommand init](&v28, sel_init);
  if (!v6)
    return v6;
  v7 = (a3 - 1);
  if (a3 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *a4);
    v8 = objc_claimAutoreleasedReturnValue();
    invokedName = v6->_invokedName;
    v6->_invokedName = (NSString *)v8;

  }
  -[PhotosControlCommand willProcessOptions](v6, "willProcessOptions");
  v10 = (const option *)objc_msgSend((id)objc_opt_class(), "longopts");
  v11 = objc_msgSend((id)objc_opt_class(), "optstring");
  v12 = (const char *)v11;
  if (v10)
  {
    if (!v11)
    {
      v23 = (FILE *)*MEMORY[0x1E0C80C10];
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v23, "command '%s' supplied longopts but not optstring\n", (const char *)objc_msgSend(v25, "UTF8String"));

LABEL_28:
      return 0;
    }
    v13 = (_QWORD *)MEMORY[0x1E0C844D0];
    while (1)
    {
      v14 = getopt_long(a3, a4, v12, v10, 0);
      if ((_DWORD)v14 == -1)
        goto LABEL_25;
      v15 = v14;
      if ((_DWORD)v14 == 63)
        goto LABEL_28;
      if (*v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[PhotosControlCommand processOption:arg:](v6, "processOption:arg:", v15, v16);

        if (!v17)
          goto LABEL_13;
      }
      else if (!-[PhotosControlCommand processOption:arg:](v6, "processOption:arg:", v14, 0))
      {
LABEL_13:
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "unsupported option: %c\n", v15);
        goto LABEL_28;
      }
    }
  }
  if (v11)
  {
    v18 = (_QWORD *)MEMORY[0x1E0C844D0];
    while (1)
    {
      v19 = getopt(a3, a4, v12);
      if ((_DWORD)v19 == -1)
        break;
      v20 = v19;
      if ((_DWORD)v19 == 63)
        goto LABEL_22;
      if (*v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[PhotosControlCommand processOption:arg:](v6, "processOption:arg:", v20, v21);

        if (!v22)
          goto LABEL_22;
      }
      else if (!-[PhotosControlCommand processOption:arg:](v6, "processOption:arg:", v19, 0))
      {
LABEL_22:
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "unsupported option: %c\n", v20);
        goto LABEL_28;
      }
    }
LABEL_25:
    v26 = (int)*MEMORY[0x1E0C844E0];
    v7 = (a3 - v26);
    goto LABEL_27;
  }
  v26 = 1;
LABEL_27:
  if (!-[PhotosControlCommand processArgc:argv:](v6, "processArgc:argv:", v7, &a4[v26]))
    goto LABEL_28;
  return v6;
}

- (id)description
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "usage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%@ %@"), v3, v4);

  return v5;
}

- (BOOL)processArgc:(int)a3 argv:(char *)a4
{
  uint64_t v7;
  uint64_t v8;
  void *args;
  uint64_t v10;
  BOOL v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v7 = objc_msgSend((id)objc_opt_class(), "minimumArgs");
  v8 = objc_msgSend((id)objc_opt_class(), "maximumArgs");
  if (v7 > a3)
  {
    objc_msgSend((id)objc_opt_class(), "name");
    args = (void *)objc_claimAutoreleasedReturnValue();
    -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("command '%@' expects at least %ld non-option arguments\n"), args, v7);
LABEL_5:
    v11 = 0;
    goto LABEL_10;
  }
  v10 = v8;
  if (v8 < a3)
  {
    objc_msgSend((id)objc_opt_class(), "name");
    args = (void *)objc_claimAutoreleasedReturnValue();
    -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("command '%@' expects at most %ld non-option arguments\n"), args, v10);
    goto LABEL_5;
  }
  v12 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
  if (a3 >= 1)
  {
    v13 = a3;
    do
    {
      v14 = (uint64_t)*a4++;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v12, "addObject:", v15);

      --v13;
    }
    while (v13);
  }
  args = self->_args;
  self->_args = v12;
  v11 = 1;
LABEL_10:

  return v11;
}

- (BOOL)processOption:(int)a3 arg:(id)a4
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ must implement %@ to support option processing"), v8, v9);

  return 0;
}

- (int)run
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("%@ must implement '- (int)run'\n"), v4);

  return 70;
}

- (id)args
{
  return self->_args;
}

- (id)invokedName
{
  return self->_invokedName;
}

- (void)outputJsonObject:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 1, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
    -[PhotosControlCommand output:](self, "output:", CFSTR("%@\n"), v5);

  }
}

- (void)outputCompactJsonObject:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 0, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
    -[PhotosControlCommand output:](self, "output:", CFSTR("%@\n"), v5);

  }
}

- (void)output:(id)a3
{
  uint64_t v3;

  -[PhotosControlCommand _output:arguments:file:]((uint64_t)self, a3, (uint64_t)&v3, (FILE *)*MEMORY[0x1E0C80C20]);
}

- (void)outputError:(id)a3
{
  uint64_t v3;

  -[PhotosControlCommand _output:arguments:file:]((uint64_t)self, a3, (uint64_t)&v3, (FILE *)*MEMORY[0x1E0C80C10]);
}

- (void)outputErrorWithJsonOutput:(BOOL)a3 format:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  FILE *v9;
  const __CFString *v10;
  _QWORD v11[2];
  uint64_t v12;

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v10 = CFSTR("error");
    v5 = (objc_class *)MEMORY[0x1E0CB3940];
    v6 = a4;
    v7 = (id)objc_msgSend([v5 alloc], "initWithFormat:arguments:", v6, &v12);

    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PhotosControlCommand outputJsonObject:](self, "outputJsonObject:", v8);

  }
  else
  {
    v9 = (FILE *)*MEMORY[0x1E0C80C10];
    v7 = a4;
    -[PhotosControlCommand _output:arguments:file:]((uint64_t)self, v7, (uint64_t)&v12, v9);
  }

}

- (void)output:(id)a3 arguments:(char *)a4
{
  -[PhotosControlCommand _output:arguments:file:]((uint64_t)self, a3, (uint64_t)a4, (FILE *)*MEMORY[0x1E0C80C20]);
}

- (void)outputError:(id)a3 arguments:(char *)a4
{
  -[PhotosControlCommand _output:arguments:file:]((uint64_t)self, a3, (uint64_t)a4, (FILE *)*MEMORY[0x1E0C80C10]);
}

- (id)dataForPathOrStdin:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  id v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosControlCommand.m"), 269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("-")))
  {
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleWithStandardInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "readDataToEndOfFile");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!v7 || !objc_msgSend(v7, "length"))
    {
      -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("Unable to read data from standard input\n"));
LABEL_12:
      v10 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v8, 0, &v13);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    if (!v7 || !objc_msgSend(v7, "length"))
    {
      -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("Unable to read data of file at path %@: %@\n"), v5, v9);

      goto LABEL_12;
    }

  }
  v7 = v7;
  v10 = v7;
LABEL_13:

  return v10;
}

- (BOOL)writeData:(id)a3 toPathOrStdout:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosControlCommand.m"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PhotosControlCommand.m"), 292, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

LABEL_3:
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("-")))
  {
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleWithStandardOutput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v11 = objc_msgSend(v10, "writeData:error:", v7, &v21);
    v12 = v21;

    if ((v11 & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("Unable to write data to standard output: %@\n"), v12);
      v13 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v13 = objc_msgSend(v7, "writeToURL:options:error:", v14, 0, &v20);
    v15 = v20;
    v16 = v15;
    if ((v13 & 1) == 0)
      -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("Unable to write data to %@: %@\n"), v9, v15);

    v12 = 0;
  }

  return v13;
}

- (id)formatDuration:(double)a3
{
  __CFString *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 == 0.0)
  {
    v3 = CFSTR("0.0 s");
  }
  else
  {
    v4 = a3;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = objc_msgSend(&unk_1E3763D88, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(&unk_1E3763D88);
          if (fabs(v4) >= 1.0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%3.2f %@"), *(_QWORD *)&v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
            goto LABEL_13;
          }
          v4 = v4 * 1000.0;
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(&unk_1E3763D88, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%3.2f ns"), *(_QWORD *)&v4, v10);
LABEL_13:
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)libraryURLFromArgument:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int valid;
  int v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  PLPhotoLibrarySearchCriteria *v20;
  PLPhotoLibrarySearchCriteria *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v28;
  PhotosControlCommand *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;

  v4 = a3;
  v5 = objc_msgSend(v4, "integerValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v4);

  if (v8)
  {
    if ((unint64_t)(v5 - 1) >= 3)
    {
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        PLStringFromWellKnownPhotoLibraryIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PhotosControlCommand outputError:](self, "outputError:", CFSTR("Library identifier %@ (%@) is not valid in this context\n"), v11, v12);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D73280], "wellKnownPhotoLibraryURLForIdentifier:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PLStringFromWellKnownPhotoLibraryIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PhotosControlCommand output:](self, "output:", CFSTR("Selected %@ at %@\n"), v10, v9);

      if (v9)
        goto LABEL_20;
    }
  }
  v33 = 0;
  valid = PLIsValidUUIDString();
  v31 = 0;
  v32 = 0;
  v14 = PLPhotoLibraryIdentifierDecodeIdentifierPropertiesFromArchivalStringRepresentation(v4, &v32, &v31, &v33);
  v15 = v32;
  v16 = v31;
  if ((valid & 1) != 0 || v14)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0D73268]);
    objc_msgSend(v18, "libraryManagementClient");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(PLPhotoLibrarySearchCriteria);
    v21 = v20;
    v29 = self;
    if (valid)
    {
      -[PLPhotoLibrarySearchCriteria setUuid:](v20, "setUuid:", v4);
    }
    else
    {
      -[PLPhotoLibrarySearchCriteria setUuid:](v20, "setUuid:", v15);
      -[PLPhotoLibrarySearchCriteria setContainerIdentifier:](v21, "setContainerIdentifier:", v16);
      -[PLPhotoLibrarySearchCriteria setDomain:](v21, "setDomain:", v33);
    }
    v30 = 0;
    v28 = v19;
    objc_msgSend(v19, "findPhotoLibraryIdentifiersMatchingSearchCriteria:error:", v21, &v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (__CFString *)v30;
    objc_msgSend(v22, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "libraryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PhotosControlCommand output:](v29, "output:", CFSTR("Found library with identifier %@ at %@\n"), v4, v25);

    }
    else
    {
      v26 = CFSTR("No match");
      if (!v22)
        v26 = v23;
      -[PhotosControlCommand outputError:](v29, "outputError:", CFSTR("Failed to find library with identifier %@: %@\n"), v4, v26);
    }

  }
  else
  {
    v17 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(v4, "stringByStandardizingPath");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v17, "initFileURLWithPath:isDirectory:", v18, 1);
  }

LABEL_20:
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_args, 0);
  objc_storeStrong((id *)&self->_invokedName, 0);
}

- (void)_output:(uint64_t)a3 arguments:(FILE *)a4 file:
{
  objc_class *v6;
  id v7;
  void *v8;
  id v9;

  if (a1)
  {
    v6 = (objc_class *)MEMORY[0x1E0CB3940];
    v7 = a2;
    v8 = (void *)objc_msgSend([v6 alloc], "initWithFormat:arguments:", v7, a3);

    v9 = objc_retainAutorelease(v8);
    fputs((const char *)objc_msgSend(v9, "UTF8String"), a4);

  }
}

+ (id)name
{
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("PhotosCtl")))
  {
    v4 = objc_msgSend(CFSTR("PhotosCtl"), "length");
    v5 = objc_msgSend(v3, "length");
    v6 = v5 - objc_msgSend(CFSTR("PhotosCtl"), "length");
    if (objc_msgSend(v3, "hasSuffix:", CFSTR("Command")))
      v7 = v6 - 7;
    else
      v7 = v6;
    objc_msgSend(v3, "substringWithRange:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseString");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("class %@ must be named with prefix %@"), v3, CFSTR("PhotosCtl"));
    v9 = v3;
  }

  return v9;
}

+ (id)abbreviations
{
  return 0;
}

+ (const)optstring
{
  return 0;
}

+ (option)longopts
{
  return 0;
}

+ (int64_t)minimumArgs
{
  return 0;
}

@end
