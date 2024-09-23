@implementation PFZlibDataCompression

+ (id)compressData:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  unsigned int v12;
  void *v13;
  uLong total_out;
  id v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  id v19;
  unsigned int v20;
  z_stream v22;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    +[PFZlibDataCompressionOptions defaultOptions](PFZlibDataCompressionOptions, "defaultOptions");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;
  v10 = v9;
  if (objc_msgSend(v9, "length"))
  {
    memset(&v22.total_out, 0, 72);
    v11 = objc_retainAutorelease(v9);
    v22.avail_in = objc_msgSend(v11, "length", objc_msgSend(v11, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
    v12 = deflateInit2_(&v22, objc_msgSend(v8, "compressionLevel"), 8, objc_msgSend(v8, "windowBits"), objc_msgSend(v8, "memoryLevel"), objc_msgSend(v8, "strategy"), "1.2.12", 112);
    if (v12)
    {
      if (a5)
      {
        ErrorForCode((uint64_t)&v22, v12, 0);
        v10 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      v19 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", (int)objc_msgSend(v8, "chunkSize"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      while (1)
      {
        total_out = v22.total_out;
        if (total_out >= objc_msgSend(v13, "length"))
          objc_msgSend(v13, "increaseLengthBy:", (int)objc_msgSend(v8, "chunkSize"));
        v15 = objc_retainAutorelease(v13);
        v16 = objc_msgSend(v15, "mutableBytes");
        v22.next_out = (Bytef *)(v16 + v22.total_out);
        v17 = objc_msgSend(v15, "length");
        v22.avail_out = v17 - LODWORD(v22.total_out);
        v18 = deflate(&v22, 4);
        if (v18 >= 2)
          break;
        if (v22.avail_out)
          goto LABEL_17;
      }
      if (a5)
      {
        ErrorForCode((uint64_t)&v22, v18, 0);
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a5 = v19;
        goto LABEL_18;
      }
LABEL_17:
      v19 = 0;
LABEL_18:
      v20 = deflateEnd(&v22);
      if (a5 && v20)
      {
        ErrorForCode((uint64_t)&v22, v20, v19);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v15, "setLength:", v22.total_out);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

+ (id)decompressData:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  unsigned int v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  uLong total_out;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  id v23;
  int v24;
  z_stream v26;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    +[PFZlibDataDecompressionOptions defaultOptions](PFZlibDataDecompressionOptions, "defaultOptions");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v7, "length"))
    goto LABEL_7;
  memset(&v26.total_out, 0, 72);
  v9 = objc_retainAutorelease(v7);
  v26.avail_in = objc_msgSend(v9, "length", objc_msgSend(v9, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
  v10 = inflateInit2_(&v26, objc_msgSend(v8, "windowBits"), "1.2.12", 112);
  if (!v10)
  {
    objc_msgSend(v8, "createBuffer");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v12)[2](v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    do
    {
      total_out = v26.total_out;
      if (total_out >= objc_msgSend(v13, "length"))
      {
        objc_msgSend(v8, "growData");
        v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id, void *))v15)[2](v15, v9, v13);

      }
      v16 = objc_retainAutorelease(v13);
      v17 = objc_msgSend(v16, "mutableBytes");
      v26.next_out = (Bytef *)(v17 + v26.total_out);
      v18 = objc_msgSend(v16, "length");
      v26.avail_out = v18 - LODWORD(v26.total_out);
      if (objc_msgSend(v8, "decompressAllAtOnce"))
        v19 = 4;
      else
        v19 = 2;
      v20 = inflate(&v26, v19);
    }
    while (!v20);
    if (v20 == 1)
    {
      v21 = inflateEnd(&v26);
      if (!v21)
      {
        objc_msgSend(v16, "setLength:", v26.total_out);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        goto LABEL_26;
      }
      v22 = v21;
      v23 = 0;
      v11 = 0;
      if (!a5)
        goto LABEL_26;
LABEL_22:
      ErrorForCode((uint64_t)&v26, v22, v23);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

      goto LABEL_27;
    }
    if (a5)
    {
      ErrorForCode((uint64_t)&v26, v20, 0);
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v23;
      v24 = inflateEnd(&v26);
      if (v24)
      {
        v22 = v24;
        goto LABEL_22;
      }
    }
    else
    {
      inflateEnd(&v26);
      v23 = 0;
    }
    v11 = 0;
    goto LABEL_26;
  }
  if (!a5)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_27;
  }
  ErrorForCode((uint64_t)&v26, v10, 0);
  v11 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v11;
}

- (PFZlibDataCompression)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("non-instantiable class, use the class methods!"));

  return 0;
}

@end
