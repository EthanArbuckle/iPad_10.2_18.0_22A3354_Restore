@implementation PFAppleArchiveLogger

- (PFAppleArchiveLogger)initWithArchiveURL:(id)a3
{
  PFAppleArchiveLogger *v3;
  PFAppleArchiveLogger *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFAppleArchiveLogger;
  v3 = -[PFAppleArchiveStream initWithArchiveURL:](&v6, sel_initWithArchiveURL_, a3);
  v4 = v3;
  if (v3)
  {
    -[PFAppleArchiveStream setAppendToExistingArchive:](v3, "setAppendToExistingArchive:", 1);
    -[PFAppleArchiveStream setBlockSize:](v4, "setBlockSize:", 0x10000);
  }
  return v4;
}

- (BOOL)flush:(id *)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (self->super._compressionStream)
  {
    v4 = AAByteStreamFlush();
    if (a3 && v4)
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = v4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to flush compression stream"), *MEMORY[0x1E0CB2938]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), v6, v8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      return 0;
    }
    if (v4)
      return 0;
  }
  return 1;
}

- (BOOL)encodeBuffer:(const void *)a3 size:(unint64_t)a4 error:(id *)a5
{
  AAByteStream_impl *compressionStream;
  ssize_t v8;
  ssize_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    _PFAssertFailHandler();
    goto LABEL_10;
  }
  if (!a4)
  {
LABEL_10:
    _PFAssertFailHandler();
    goto LABEL_11;
  }
  if (!self->super._outputStream)
  {
LABEL_11:
    _PFAssertFailHandler();
LABEL_12:
    _PFAssertFailHandler();
  }
  compressionStream = self->super._compressionStream;
  if (!compressionStream)
    goto LABEL_12;
  v8 = AAByteStreamWrite(compressionStream, a3, a4);
  v9 = v8;
  if (a5 && v8 != a4)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to write to stream"), *MEMORY[0x1E0CB2938]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9 == a4;
}

+ (BOOL)encodeFile:(id)a3 destination:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  int v9;
  PFAppleArchiveLogger *v10;
  _QWORD *p_isa;
  AAByteStream_impl *v12;
  ssize_t v13;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _BYTE buf[4096];
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(a3, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = open((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 0, 0);

  if (v9 < 0)
  {
    if (!a5)
    {
      v24 = 0;
      goto LABEL_23;
    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("failed to open encode source"));
    p_isa = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v35[0] = p_isa;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v20);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = -[PFAppleArchiveLogger initWithArchiveURL:]([PFAppleArchiveLogger alloc], "initWithArchiveURL:", v7);
    if (v10)
    {
      p_isa = &v10->super.super.isa;
      -[PFAppleArchiveStream setAppendToExistingArchive:](v10, "setAppendToExistingArchive:", 0);
      if (objc_msgSend(p_isa, "openForWriting:", a5))
      {
        v12 = (AAByteStream_impl *)p_isa[3];
        while (1)
        {
          v13 = read(v9, buf, 0x1000uLL);
          if (v13 < 1)
            break;
          if (AAByteStreamWrite(v12, buf, v13) != v13)
          {
            if (!a5)
              goto LABEL_20;
            v14 = (void *)MEMORY[0x1E0CB35C8];
            v29 = *MEMORY[0x1E0CB2938];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to write to stream"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v15;
            v16 = (void *)MEMORY[0x1E0C99D80];
            v17 = &v30;
            v18 = &v29;
            goto LABEL_19;
          }
        }
        if ((v13 & 0x8000000000000000) == 0)
        {
          close(v9);
          v24 = objc_msgSend(p_isa, "close:", a5);
          goto LABEL_22;
        }
        if (a5)
        {
          v14 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to write to stream"), *MEMORY[0x1E0CB2938]);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v15;
          v16 = (void *)MEMORY[0x1E0C99D80];
          v17 = &v28;
          v18 = &v27;
LABEL_19:
          objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v25);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
LABEL_20:
        close(v9);
      }
    }
    else
    {
      if (a5)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v32 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("failed to make archive logger"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v23);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      p_isa = 0;
    }
  }
  v24 = 0;
LABEL_22:

LABEL_23:
  return v24;
}

@end
