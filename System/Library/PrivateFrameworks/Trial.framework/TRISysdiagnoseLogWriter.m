@implementation TRISysdiagnoseLogWriter

- (TRISysdiagnoseLogWriter)initWithDirectory:(id)a3
{
  id v5;
  TRISysdiagnoseLogWriter *v6;
  TRISysdiagnoseLogWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRISysdiagnoseLogWriter;
  v6 = -[TRISysdiagnoseLogWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_outputDirectory, a3);

  return v7;
}

- (BOOL)writeSysdiagnoseInfoForProvider:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  _BYTE v37[128];
  uint64_t v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "sysdiagnoseLinesWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v36 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRISysdiagnoseLogWriter outputDirectory](self, "outputDirectory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v9, &v36);

    if (v10)
      v11 = v36 == 0;
    else
      v11 = 1;
    if (!v11)
    {
      -[TRISysdiagnoseLogWriter outputDirectory](self, "outputDirectory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "filename");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathComponent:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "createFileAtPath:contents:attributes:", v16, 0, 0);

      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v20 = v7;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v21)
        {
          v22 = v21;
          v29 = v16;
          v30 = v7;
          v31 = v6;
          v23 = *(_QWORD *)v33;
          while (2)
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v33 != v23)
                objc_enumerationMutation(v20);
              objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "stringByAppendingString:", CFSTR("\n"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = (void *)MEMORY[0x1A1AC6B8C]();
              objc_msgSend(v25, "dataUsingEncoding:", 4);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_autoreleasePoolPop(v26);
              LODWORD(v26) = objc_msgSend(v19, "writeData:error:", v27, a4);

              if (!(_DWORD)v26)
              {
                v13 = 0;
                goto LABEL_22;
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
            if (v22)
              continue;
            break;
          }
          v13 = 1;
LABEL_22:
          v7 = v30;
          v6 = v31;
          v16 = v29;
        }
        else
        {
          v13 = 1;
        }

      }
      else
      {
        v13 = 0;
      }
      goto LABEL_25;
    }
    if (a4)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *MEMORY[0x1E0CB2D50];
      v39[0] = CFSTR("Provided directory doesn't exist");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 12, v16);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

      goto LABEL_26;
    }
  }
  v13 = 0;
LABEL_26:

  return v13;
}

- (NSString)outputDirectory
{
  return self->_outputDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDirectory, 0);
}

@end
