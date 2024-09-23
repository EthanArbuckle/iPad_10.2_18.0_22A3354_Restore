@implementation VisionCoreE5RTProgramLibrary

- (id)_initWithURL:(id)a3 compilationOptions:(id)a4 ownedProgramLibraryHandle:(e5rt_program_library *)a5
{
  id v9;
  id v10;
  VisionCoreE5RTProgramLibrary *v11;
  VisionCoreE5RTProgramLibrary *v12;
  uint64_t v13;
  VisionCoreE5RTProgramLibraryCompilationOptions *compilationOptions;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VisionCoreE5RTProgramLibrary;
  v11 = -[VisionCoreE5RTProgramLibrary init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_modelURL, a3);
    v13 = objc_msgSend(v10, "copy");
    compilationOptions = v12->_compilationOptions;
    v12->_compilationOptions = (VisionCoreE5RTProgramLibraryCompilationOptions *)v13;

    v12->_programLibraryHandle = *a5;
    *a5 = 0;
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_programLibraryHandle)
    e5rt_program_library_release();
  v3.receiver = self;
  v3.super_class = (Class)VisionCoreE5RTProgramLibrary;
  -[VisionCoreE5RTProgramLibrary dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  NSString *lazyName;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  lazyName = self->_lazyName;
  if (!lazyName)
  {
    -[VisionCoreE5RTProgramLibrary URL](self, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "pathExtension");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      do
      {
        v8 = v5;
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("bundle")) & 1) == 0
          && (objc_msgSend(v7, "isEqualToString:", CFSTR("net")) & 1) == 0
          && !objc_msgSend(v7, "isEqualToString:", CFSTR("espresso")))
        {
          break;
        }
        objc_msgSend(v5, "stringByDeletingPathExtension");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "pathExtension");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      while (v7);

    }
    v9 = (NSString *)objc_msgSend(v5, "copy");
    v10 = self->_lazyName;
    self->_lazyName = v9;

    lazyName = self->_lazyName;
  }
  return lazyName;
}

- (NSDictionary)buildInfo
{
  e5rt_program_library_get_build_info();
  return (NSDictionary *)0;
}

- (NSDictionary)segmentationAnalytics
{
  e5rt_program_library_get_segmentation_analytics();
  return (NSDictionary *)0;
}

- (NSArray)functionNames
{
  NSArray *lazyFunctionNames;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  lazyFunctionNames = self->_lazyFunctionNames;
  if (!lazyFunctionNames)
  {
    +[VisionCoreE5RTUtils stringsForHandle:fromCountProc:stringsProc:error:](VisionCoreE5RTUtils, "stringsForHandle:fromCountProc:stringsProc:error:", self->_programLibraryHandle, MEMORY[0x24BE2F980], MEMORY[0x24BE2F978], 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    v6 = self->_lazyFunctionNames;
    self->_lazyFunctionNames = v5;

    lazyFunctionNames = self->_lazyFunctionNames;
  }
  return lazyFunctionNames;
}

- (id)metadataForFunctionNamed:(id)a3 error:(id *)a4
{
  uint64_t function_metadata;

  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  function_metadata = e5rt_program_library_get_function_metadata();
  if ((_DWORD)function_metadata && a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", function_metadata);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)functionNamed:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  VisionCoreE5RTFunction *v8;
  VisionCoreE5RTFunction *v9;
  VisionCoreE5RTFunction *v10;
  uint64_t v12;

  v12 = 0;
  v6 = objc_retainAutorelease(a3);
  objc_msgSend(v6, "UTF8String");
  v7 = e5rt_program_library_retain_program_function();
  if ((_DWORD)v7)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v7);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v9 = -[VisionCoreE5RTFunction initWithProgramLibrary:name:ownedFunctionHandle:]([VisionCoreE5RTFunction alloc], "initWithProgramLibrary:name:ownedFunctionHandle:", self, v6, &v12);
    v8 = v9;
    if (v9)
    {
      v10 = v9;
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:", CFSTR("could not create program function"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    if (v12)
      e5rt_program_function_release();
  }

  return v8;
}

- (e5rt_program_library)programLibraryHandle
{
  return self->_programLibraryHandle;
}

- (NSURL)URL
{
  return self->_modelURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyName, 0);
  objc_storeStrong((id *)&self->_lazyFunctionNames, 0);
  objc_storeStrong((id *)&self->_compilationOptions, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

+ (BOOL)isProgramLibraryAtURL:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = (void *)MEMORY[0x2207A6494]();
  if (objc_msgSend(v3, "VisionCoreE5RTPathAndReturnError:", 0) && !e5rt_program_library_create())
  {
    e5rt_program_library_release();
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  objc_autoreleasePoolPop(v4);

  return v5 == 0;
}

+ (id)programLibraryForURL:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;

  v6 = a3;
  if (!objc_msgSend(v6, "VisionCoreE5RTPathAndReturnError:", a4))
    goto LABEL_5;
  v12 = 0;
  v7 = e5rt_program_library_create();
  if ((_DWORD)v7)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v7);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_5:
    v8 = 0;
    goto LABEL_12;
  }
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithURL:compilationOptions:ownedProgramLibraryHandle:", v6, 0, &v12);
  v8 = v9;
  if (v9)
  {
    v10 = v9;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:", CFSTR("could not create program library"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v12)
    e5rt_program_library_release();
LABEL_12:

  return v8;
}

+ (id)compileFromURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  +[VisionCoreE5RTModelSource modelSourceFromURL:error:](VisionCoreE5RTModelSource, "modelSourceFromURL:error:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "compileModelSource:options:error:", v9, v8, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)compileModelSource:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v17;
  _QWORD v18[2];

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "E5ModelFileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "VisionCoreE5RTPathAndReturnError:", a5))
    goto LABEL_5;
  v18[1] = 0;
  v11 = e5rt_e5_compiler_create();
  if ((_DWORD)v11)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v11);
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
LABEL_5:
    v12 = 0;
    goto LABEL_20;
  }
  v18[0] = 0;
  if ((objc_msgSend(v9, "createE5RTCompilerOptions:error:", v18, a5) & 1) != 0)
  {
    v17 = 0;
    v13 = e5rt_e5_compiler_compile();
    if ((_DWORD)v13)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v13);
        v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithURL:compilationOptions:ownedProgramLibraryHandle:", v10, v9, &v17);
      v12 = v14;
      if (v14)
      {
        v15 = v14;
      }
      else if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:", CFSTR("could not create program library"));
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      if (v17)
        e5rt_program_library_release();
    }
    e5rt_e5_compiler_options_release();
  }
  else
  {
    v12 = 0;
  }
  e5rt_e5_compiler_release();
LABEL_20:

  return v12;
}

@end
