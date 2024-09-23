@implementation PFAppleArchiveStream

- (PFAppleArchiveStream)init
{
  PFAppleArchiveStream *v2;
  SEL v3;
  id v4;

  v2 = (PFAppleArchiveStream *)_PFAssertFailHandler();
  return -[PFAppleArchiveStream initWithArchiveURL:](v2, v3, v4);
}

- (PFAppleArchiveStream)initWithArchiveURL:(id)a3
{
  id v5;
  void *v6;
  PFAppleArchiveStream *v7;
  PFAppleArchiveStream *v8;
  PFAppleArchiveStream *v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)PFAppleArchiveStream;
    v7 = -[PFAppleArchiveStream init](&v12, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_archiveURL, a3);
      v8->_blockSize = 0x100000;
    }

    return v8;
  }
  else
  {
    v10 = (PFAppleArchiveStream *)_PFAssertFailHandler();
    return (PFAppleArchiveStream *)-[PFAppleArchiveStream description](v10, v11);
  }
}

- (id)description
{
  int64_t v3;
  const __CFString *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = -[PFAppleArchiveStream compression](self, "compression");
  if ((unint64_t)(v3 + 1) > 3)
    v4 = CFSTR("???");
  else
    v4 = off_1E45A3470[v3 + 1];
  if (self->_inputStream)
  {
    v5 = CFSTR("R");
  }
  else if (self->_outputStream)
  {
    v5 = CFSTR("W");
  }
  else
  {
    v5 = CFSTR("-");
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = v5;
  v8 = objc_opt_class();
  -[PFAppleArchiveStream archiveURL](self, "archiveURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@:%p %@ append=%d block_size=%ld compression=%@ open:%@>"), v8, self, v9, -[PFAppleArchiveStream appendToExistingArchive](self, "appendToExistingArchive"), -[PFAppleArchiveStream blockSize](self, "blockSize"), v4, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)openForWriting:(id *)a3
{
  _BOOL4 v5;
  int v6;
  id v7;
  unsigned int v8;
  int v9;
  AAByteStream_impl *v10;
  void *v11;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (self->_inputStream || self->_outputStream)
    _PFAssertFailHandler();
  v5 = -[PFAppleArchiveStream appendToExistingArchive](self, "appendToExistingArchive");
  if (v5)
    v6 = 2561;
  else
    v6 = 1537;
  -[PFAppleArchiveStream archiveURL](self, "archiveURL");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = open((const char *)objc_msgSend(v7, "fileSystemRepresentation"), v6, 420);

  v9 = v8;
  if ((v8 & 0x80000000) != 0)
  {
    if (!v5
      || *__error() != 17
      || (-[PFAppleArchiveStream archiveURL](self, "archiveURL"),
          v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
          v9 = open((const char *)objc_msgSend(v13, "fileSystemRepresentation"), 2, 420),
          v13,
          v9 < 0))
    {
      if (a3)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to open output file stream"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v15;
        v16 = (void *)MEMORY[0x1E0C99D80];
        v17 = (void **)v23;
        v18 = &v22;
LABEL_17:
        objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v19);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        return 0;
      }
      return 0;
    }
  }
  v10 = AAFileStreamOpenWithFD(v9, 1);
  self->_outputStream = v10;
  if (!v10)
  {
    if (a3)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to open output file stream"), *MEMORY[0x1E0CB2938]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v15;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = &v21;
      v18 = &v20;
      goto LABEL_17;
    }
    return 0;
  }
  -[PFAppleArchiveStream encryptionKey](self, "encryptionKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    return -[PFAppleArchiveStream _openForWritingEncryptionStreamWithError:](self, "_openForWritingEncryptionStreamWithError:", a3);
  else
    return -[PFAppleArchiveStream _openForWritingCompressionStreamShouldAppend:error:](self, "_openForWritingCompressionStreamShouldAppend:error:", v8 >> 31, a3);
}

- (BOOL)_openForWritingEncryptionStreamWithError:(id *)a3
{
  _BOOL4 v5;
  AAByteStream_impl *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = -[PFAppleArchiveStream _setupEncryptionContextForWritingWithError:](self, "_setupEncryptionContextForWritingWithError:");
  if (v5)
  {
    v6 = AEAEncryptionOutputStreamOpen(self->_outputStream, self->_encryptionContext, 0, 0);
    self->_encryptionStream = v6;
    if (v6)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      if (a3)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v11 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open encryption output stream"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 500001, v9);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)_setupEncryptionContextForWritingWithError:(id *)a3
{
  AEAContext_impl *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  AEAContext_impl *encryptionContext;
  id v14;
  const uint8_t *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  AEAAuthData v23;
  AEAAuthData_impl *v24;
  void *v25;
  AEAContext_impl *v26;
  const uint8_t *EncodedData;
  size_t EncodedSize;
  uint64_t v29;
  _QWORD v30[5];
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  if (self->_encryptionContext)
    _PFAssertFailHandler();
  v5 = AEAContextCreateWithProfile(1u);
  self->_encryptionContext = v5;
  if (v5)
  {
    v6 = -[PFAppleArchiveStream aaCompressionAlgorithm](self, "aaCompressionAlgorithm");
    if ((_DWORD)v6
      && (v7 = v6, v8 = AEAContextSetFieldUInt(self->_encryptionContext, 3u, v6), (_DWORD)v8))
    {
      if (a3)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v37 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to set compression algorithm %u: %d"), v7, v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 500004;
LABEL_10:
        v18 = v9;
LABEL_13:
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), v12, v11);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      encryptionContext = self->_encryptionContext;
      -[PFAppleArchiveStream encryptionKey](self, "encryptionKey");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = (const uint8_t *)objc_msgSend(v14, "bytes");
      -[PFAppleArchiveStream encryptionKey](self, "encryptionKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = AEAContextSetFieldBlob(encryptionContext, 9u, 0, v15, objc_msgSend(v16, "length"));

      if (!(_DWORD)v17)
      {
        -[PFAppleArchiveStream encryptedArchiveMetadata](self, "encryptedArchiveMetadata");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (v22)
        {
          v23 = AEAAuthDataCreate();
          if (!v23)
          {
            if (!a3)
              return 0;
            v9 = (void *)MEMORY[0x1E0CB35C8];
            v33 = *MEMORY[0x1E0CB2938];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create auth data blob"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v10;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = 500007;
            goto LABEL_10;
          }
          v24 = v23;
          -[PFAppleArchiveStream encryptedArchiveMetadata](self, "encryptedArchiveMetadata");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __67__PFAppleArchiveStream__setupEncryptionContextForWritingWithError___block_invoke;
          v30[3] = &__block_descriptor_40_e35_v32__0__NSString_8__NSString_16_B24l;
          v30[4] = v24;
          objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v30);

          v26 = self->_encryptionContext;
          EncodedData = AEAAuthDataGetEncodedData(v24);
          EncodedSize = AEAAuthDataGetEncodedSize(v24);
          v29 = AEAContextSetFieldBlob(v26, 5u, 0, EncodedData, EncodedSize);
          AEAAuthDataDestroy(v24);
          if ((_DWORD)v29)
          {
            if (!a3)
              return 0;
            v9 = (void *)MEMORY[0x1E0CB35C8];
            v31 = *MEMORY[0x1E0CB2938];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to set auth data on encrypted archive context: %d"), v29);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v10;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = 500006;
            goto LABEL_10;
          }
        }
        return 1;
      }
      if (a3)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v35 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to set symmetric key for encryption: %d"), v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 500005;
        goto LABEL_10;
      }
    }
  }
  else if (a3)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Unable to create encryption context"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;
    v12 = 500003;
    goto LABEL_13;
  }
  return 0;
}

- (BOOL)_openForWritingCompressionStreamShouldAppend:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  AACompressionAlgorithm v7;
  AAByteStream_impl *v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v5 = a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = -[PFAppleArchiveStream aaCompressionAlgorithm](self, "aaCompressionAlgorithm");
  if (!v7)
    return 1;
  v8 = v5
     ? AACompressionOutputStreamOpenExisting(self->_outputStream, 0, 0)
     : AACompressionOutputStreamOpen(self->_outputStream, v7, -[PFAppleArchiveStream blockSize](self, "blockSize"), 0, 0);
  self->_compressionStream = v8;
  if (v8)
    return 1;
  if (a4)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to open compression stream"), *MEMORY[0x1E0CB2938]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (AAByteStream_impl)_byteStreamToBeTargetedByArchiveEncodingStream
{
  AAByteStream_impl *result;

  result = self->_encryptionStream;
  if (!result)
  {
    result = self->_compressionStream;
    if (!result)
      return self->_outputStream;
  }
  return result;
}

- (AAByteStream_impl)_byteStreamToBeReadByArchiveDecodingStream
{
  AAByteStream_impl *result;

  result = self->_encryptionStream;
  if (!result)
  {
    result = self->_compressionStream;
    if (!result)
      return self->_inputStream;
  }
  return result;
}

- (BOOL)openForReading:(id *)a3
{
  id v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t *v12;
  void *v13;
  AAByteStream_impl *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (self->_inputStream || self->_outputStream)
    _PFAssertFailHandler();
  -[PFAppleArchiveStream archiveURL](self, "archiveURL");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  self->_inputStream = AAFileStreamOpenWithPath((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 0, 0x1A4u);

  if (!self->_inputStream)
  {
    if (!a3)
      return 0;
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to open input file stream"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = (void **)v18;
    v12 = &v17;
LABEL_8:
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  -[PFAppleArchiveStream encryptionKey](self, "encryptionKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return -[PFAppleArchiveStream _openForReadingEncryptionStreamWithError:](self, "_openForReadingEncryptionStreamWithError:", a3);
  if (-[PFAppleArchiveStream compression](self, "compression") != -1)
  {
    v14 = AADecompressionInputStreamOpen(self->_inputStream, 0, 0);
    self->_compressionStream = v14;
    if (!v14)
    {
      if (!a3)
        return 0;
      v8 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to open decompression stream"), *MEMORY[0x1E0CB2938]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v9;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = &v16;
      v12 = &v15;
      goto LABEL_8;
    }
  }
  return 1;
}

- (BOOL)_openForReadingEncryptionStreamWithError:(id *)a3
{
  AEAContext_impl *v5;
  AEAContext_impl *v6;
  id v7;
  const uint8_t *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  AEAAuthData_impl *v18;
  AEAAuthData_impl *v19;
  uint64_t EntryCount;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  uint64_t v26;
  uint64_t Entry;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  AAByteStream_impl *v35;
  void *v36;
  void *v37;
  void *v38;
  size_t data_size;
  uint64_t v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint8_t data[100];
  char key[100];
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v5 = AEAContextCreateWithEncryptedStream(self->_inputStream);
  self->_encryptionContext = v5;
  if (!v5)
  {
    if (!a3)
      return (char)a3;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v58 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to get encryption context from input stream"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 500003;
    goto LABEL_7;
  }
  v6 = v5;
  -[PFAppleArchiveStream encryptionKey](self, "encryptionKey");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const uint8_t *)objc_msgSend(v7, "bytes");
  -[PFAppleArchiveStream encryptionKey](self, "encryptionKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = AEAContextSetFieldBlob(v6, 9u, 0, v8, objc_msgSend(v9, "length"));

  if (!(_DWORD)v10)
  {
    v18 = AEAAuthDataCreateWithContext(self->_encryptionContext);
    if (v18)
    {
      v19 = v18;
      EntryCount = AEAAuthDataGetEntryCount(v18);
      if (EntryCount <= 1)
      {
        if (a3)
        {
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v52 = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected entry count %u, expected at least %u"), EntryCount, 2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 500008, v23);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        AEAAuthDataDestroy(v19);
        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", EntryCount);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      do
      {
        data_size = 0;
        Entry = AEAAuthDataGetEntry(v19, v26, 0x64uLL, key, 0, 0x64uLL, data, &data_size);
        if ((_DWORD)Entry)
        {
          if (a3)
          {
            v32 = (void *)MEMORY[0x1E0CB35C8];
            v48 = *MEMORY[0x1E0CB2938];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to get auth data entry %d: %d"), v26, Entry);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v33;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 500009, v34);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          AEAAuthDataDestroy(v19);
          goto LABEL_27;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", key);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_alloc(MEMORY[0x1E0CB3940]);
        v30 = (void *)objc_msgSend(v29, "initWithBytes:length:encoding:", data, data_size, 4);
        objc_msgSend(v25, "objectForKeyedSubscript:", v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v43 = v28;
          v44 = 2112;
          v45 = v31;
          v46 = 2112;
          v47 = v30;
          _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Overwriting existing auth data value for key %@: %@/%@", buf, 0x20u);
        }
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v30, v28);

        v26 = (v26 + 1);
      }
      while ((_DWORD)EntryCount != (_DWORD)v26);
      AEAAuthDataDestroy(v19);
      objc_storeStrong((id *)&self->_encryptedArchiveMetadata, v25);
      v35 = AEADecryptionInputStreamOpen(self->_inputStream, self->_encryptionContext, 0, 0);
      self->_encryptionStream = v35;
      if (v35)
      {
        LOBYTE(a3) = 1;
        goto LABEL_30;
      }
      if (a3)
      {
        v36 = (void *)MEMORY[0x1E0CB35C8];
        v40 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to open encryption output stream"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 500002, v38);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_27:
        LOBYTE(a3) = 0;
      }
LABEL_30:

      return (char)a3;
    }
    if (!a3)
      return (char)a3;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v54 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to query auth data from encrypted archive context"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 500007;
LABEL_7:
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), v17, v16);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  if (a3)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v56 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to set symmetric key for decryption: %d"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 500005, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
    LOBYTE(a3) = 0;
  }
  return (char)a3;
}

- (BOOL)close:(id *)a3
{
  AAByteStream_impl *encryptionStream;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t *v12;
  AAByteStream_impl *compressionStream;
  int v14;
  AAByteStream_impl *inputStream;
  int v16;
  AAByteStream_impl *outputStream;
  int v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  encryptionStream = self->_encryptionStream;
  if (!encryptionStream)
    goto LABEL_6;
  v6 = AAByteStreamClose(encryptionStream);
  self->_encryptionStream = 0;
  if (a3 && v6)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = v6;
    v27 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to close encryption stream"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = (void **)v28;
    v12 = &v27;
LABEL_20:
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), v8, v19);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  if (!v6)
  {
LABEL_6:
    compressionStream = self->_compressionStream;
    if (!compressionStream)
      goto LABEL_11;
    v14 = AAByteStreamClose(compressionStream);
    self->_compressionStream = 0;
    if (a3 && v14)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = v14;
      v25 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to close compression stream"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v9;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = &v26;
      v12 = &v25;
      goto LABEL_20;
    }
    if (!v14)
    {
LABEL_11:
      inputStream = self->_inputStream;
      if (!inputStream)
        goto LABEL_16;
      v16 = AAByteStreamClose(inputStream);
      self->_inputStream = 0;
      if (a3 && v16)
      {
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = v16;
        v23 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to close input stream"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v9;
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = &v24;
        v12 = &v23;
        goto LABEL_20;
      }
      if (!v16)
      {
LABEL_16:
        outputStream = self->_outputStream;
        if (outputStream)
        {
          v18 = AAByteStreamClose(outputStream);
          self->_outputStream = 0;
          if (a3 && v18)
          {
            v7 = (void *)MEMORY[0x1E0CB35C8];
            v8 = v18;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("Failed to close output stream"), *MEMORY[0x1E0CB2938]);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v9;
            v10 = (void *)MEMORY[0x1E0C99D80];
            v11 = &v22;
            v12 = &v21;
            goto LABEL_20;
          }
          if (v18)
            return 0;
        }
        return 1;
      }
    }
  }
  return 0;
}

- (void)dealloc
{
  AAByteStream_impl *encryptionStream;
  AAByteStream_impl *compressionStream;
  AAByteStream_impl *outputStream;
  AAByteStream_impl *inputStream;
  AEAContext_impl *encryptionContext;
  objc_super v8;

  encryptionStream = self->_encryptionStream;
  if (encryptionStream)
  {
    AAByteStreamCancel(encryptionStream);
    AAByteStreamClose(self->_encryptionStream);
  }
  compressionStream = self->_compressionStream;
  if (compressionStream)
  {
    AAByteStreamCancel(compressionStream);
    AAByteStreamClose(self->_compressionStream);
  }
  outputStream = self->_outputStream;
  if (outputStream)
  {
    AAByteStreamCancel(outputStream);
    AAByteStreamClose(self->_outputStream);
  }
  inputStream = self->_inputStream;
  if (inputStream)
  {
    AAByteStreamCancel(inputStream);
    AAByteStreamClose(self->_inputStream);
  }
  encryptionContext = self->_encryptionContext;
  if (encryptionContext)
    AEAContextDestroy(encryptionContext);
  v8.receiver = self;
  v8.super_class = (Class)PFAppleArchiveStream;
  -[PFAppleArchiveStream dealloc](&v8, sel_dealloc);
}

- (unsigned)aaCompressionAlgorithm
{
  unint64_t v2;

  v2 = -[PFAppleArchiveStream compression](self, "compression");
  if (v2 > 2)
    return 0;
  else
    return dword_1A17B71D0[v2];
}

- (NSURL)archiveURL
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)compression
{
  return self->_compression;
}

- (void)setCompression:(int64_t)a3
{
  self->_compression = a3;
}

- (NSData)encryptionKey
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEncryptionKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDictionary)encryptedArchiveMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEncryptedArchiveMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)appendToExistingArchive
{
  return self->_appendToExistingArchive;
}

- (void)setAppendToExistingArchive:(BOOL)a3
{
  self->_appendToExistingArchive = a3;
}

- (unint64_t)blockSize
{
  return self->_blockSize;
}

- (void)setBlockSize:(unint64_t)a3
{
  self->_blockSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedArchiveMetadata, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
}

uint64_t __67__PFAppleArchiveStream__setupEncryptionContextForWritingWithError___block_invoke(uint64_t a1, id a2, void *a3)
{
  AEAAuthData_impl *v4;
  id v5;
  id v6;
  const char *v7;
  id v8;
  const uint8_t *v9;
  size_t v10;

  v4 = *(AEAAuthData_impl **)(a1 + 32);
  v5 = objc_retainAutorelease(a2);
  v6 = a3;
  v7 = (const char *)objc_msgSend(v5, "UTF8String");
  v8 = objc_retainAutorelease(v6);
  v9 = (const uint8_t *)objc_msgSend(v8, "UTF8String");
  v10 = objc_msgSend(v8, "lengthOfBytesUsingEncoding:", 4);

  return AEAAuthDataAppendEntry(v4, v7, v9, v10);
}

@end
