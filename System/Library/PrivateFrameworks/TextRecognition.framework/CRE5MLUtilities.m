@implementation CRE5MLUtilities

+ (id)E5RTProgramLibraryForModelURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0DC6C40], "isProgramLibraryAtURL:", v6))
  {
    objc_msgSend(MEMORY[0x1E0DC6C40], "programLibraryForURL:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(MEMORY[0x1E0DC6C38], "isModelSourceURL:", v6))
  {
    objc_msgSend(MEMORY[0x1E0DC6C38], "modelSourceFromURL:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(a1, "E5RTProgramLibraryCompilationOptionsForModelSource:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0DC6C40], "compileModelSource:options:error:", v8, v9, a4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (a4)
      {
        +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -8);
        v7 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)E5RTProgramLibraryCompilationOptionsForModelSource:(id)a3
{
  return objc_alloc_init(MEMORY[0x1E0DC6C48]);
}

+ (id)newImageInputsForFunctionDescriptor:(id)a3 croppedPixelBuffer:(__CVBuffer *)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0DC6C90]);
  if (!a4)
    goto LABEL_4;
  objc_msgSend(v7, "onlyInputImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (a5)
    {
      +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -8);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v10 = v9;
  objc_msgSend(v9, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "assignPixelBuffer:toName:error:", a4, v11, a5);

  if (!v12)
    goto LABEL_7;
LABEL_4:
  v13 = v8;
LABEL_8:

  return v13;
}

+ (id)newInputsForFunctionDescriptor:(id)a3 surface:(__IOSurface *)a4 isImage:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;

  v7 = a5;
  v9 = a3;
  v10 = objc_alloc_init(MEMORY[0x1E0DC6C90]);
  if (a4)
  {
    if (v7)
    {
      objc_msgSend(v9, "onlyInputImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_9;
    }
    else
    {
      objc_msgSend(v9, "allInputs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13 != 1
        || (objc_msgSend(v9, "allInputs"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v14, "firstObject"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v14,
            !v11))
      {
LABEL_9:
        if (a6)
        {
          +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -8);
          v17 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
LABEL_11:
        v17 = 0;
        goto LABEL_12;
      }
    }
    objc_msgSend(v11, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v10, "assignSurface:toName:error:", a4, v15, a6);

    if (!v16)
      goto LABEL_11;
  }
  v17 = v10;
LABEL_12:

  return v17;
}

+ (id)newE5RTExecutionOutputsForFunctionDescriptor:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0DC6C90]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v5, "allOutputs", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "E5RTExecutionContextAssignNewTensorInstanceToNamedObjects:error:", v6, a4))
        {

          v12 = 0;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }

  v12 = v6;
LABEL_11:

  return v12;
}

@end
