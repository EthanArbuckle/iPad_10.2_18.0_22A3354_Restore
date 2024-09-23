@implementation GTFileWriterSessionCompressed

+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(objc_alloc((Class)a1), "initWithFileEntries:relativeToURL:options:error:", v12, v11, v10, a6);

  return v13;
}

- (GTFileWriterSessionCompressed)initWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  char *v13;
  unint64_t v14;
  compression_algorithm v15;
  id v16;
  uint64_t v17;
  void *v18;
  GTFileWriterSessionCompressed *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)GTFileWriterSessionCompressed;
  v13 = -[GTFileWriterSessionCompressed init](&v21, "init");
  if (!v13)
    goto LABEL_6;
  v14 = (unint64_t)objc_msgSend(v12, "compressionAlgorithm") - 1;
  v15 = v14 > 4 ? 0 : dword_100027A40[v14];
  compression_stream_init((compression_stream *)(v13 + 8), COMPRESSION_STREAM_DECODE, v15);
  *((_QWORD *)v13 + 6) = malloc_type_malloc((size_t)objc_msgSend(v12, "chunkSize"), 0x269CC8DEuLL);
  v16 = objc_msgSend(v12, "chunkSize");
  *((_QWORD *)v13 + 7) = v16;
  *((_QWORD *)v13 + 1) = *((_QWORD *)v13 + 6);
  *((_QWORD *)v13 + 2) = v16;
  v17 = objc_claimAutoreleasedReturnValue(+[GTFileWriterSessionUncompressed sessionWithFileEntries:relativeToURL:options:error:](GTFileWriterSessionUncompressed, "sessionWithFileEntries:relativeToURL:options:error:", v10, v11, v12, a6));
  v18 = (void *)*((_QWORD *)v13 + 8);
  *((_QWORD *)v13 + 8) = v17;

  if (!*((_QWORD *)v13 + 8))
  {
    compression_stream_destroy((compression_stream *)(v13 + 8));
    free(*((void **)v13 + 6));
    v19 = 0;
  }
  else
  {
LABEL_6:
    v19 = v13;
  }

  return v19;
}

- (void)writeFileData:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v6 = objc_retainAutorelease(a3);
  v7 = (void (**)(id, id))a4;
  v8 = v6;
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  v12 = 0;
  -[GTFileWriterSessionCompressed _writeCompressedFileData:length:error:](self, "_writeCompressedFileData:length:error:", v9, v10, &v12);
  v11 = v12;
  v7[2](v7, v11);

}

- (BOOL)_writeCompressedFileData:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  char *decompressorOutput;
  size_t decompressorOutputSize;
  _QWORD v10[5];

  decompressorOutput = self->_decompressorOutput;
  decompressorOutputSize = self->_decompressorOutputSize;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000A958;
  v10[3] = &unk_1000309F0;
  v10[4] = self;
  return sub_10000A7E4((compression_stream *)&self->_compressionStream, (const uint8_t *)a3, a4, (uint8_t *)decompressorOutput, decompressorOutputSize, (uint64_t)a5, v10);
}

- (BOOL)finish:(id *)a3
{
  _BOOL4 v5;
  GTFileWriterSessionUncompressed *uncompressedSession;
  unsigned __int8 v7;
  id v8;
  void *v9;
  id v11;

  v5 = -[GTFileWriterSessionCompressed _finalizeCompressedFileData:](self, "_finalizeCompressedFileData:");
  compression_stream_destroy((compression_stream *)&self->_compressionStream);
  free(self->_decompressorOutput);
  self->_decompressorOutput = 0;
  self->_decompressorOutputSize = 0;
  uncompressedSession = self->_uncompressedSession;
  v11 = 0;
  v7 = -[GTFileWriterSessionUncompressed finish:](uncompressedSession, "finish:", &v11);
  v8 = v11;
  v9 = v8;
  if (v5 && (v7 & 1) == 0)
  {
    LOBYTE(v5) = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }

  return v5;
}

- (BOOL)_finalizeCompressedFileData:(id *)a3
{
  char *decompressorOutput;
  size_t decompressorOutputSize;
  _QWORD v7[5];

  decompressorOutput = self->_decompressorOutput;
  decompressorOutputSize = self->_decompressorOutputSize;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000ABE4;
  v7[3] = &unk_1000309F0;
  v7[4] = self;
  return sub_10000AA68((compression_stream *)&self->_compressionStream, (uint8_t *)decompressorOutput, decompressorOutputSize, (uint64_t)a3, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncompressedSession, 0);
}

@end
