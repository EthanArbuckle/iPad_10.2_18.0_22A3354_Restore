@implementation PLTableThumbnailEncoderResult

- (PL_KTXHeader)_ktxHeader
{
  id v2;
  PL_KTXHeader *v3;

  -[PLTableThumbnailEncoderResult ktxData](self, "ktxData");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (PL_KTXHeader *)objc_msgSend(v2, "bytes");

  return v3;
}

- (PLTableThumbnailEncoderResult)initWithKtxData:(id)a3 uuid:(id)a4 format:(id)a5
{
  id v9;
  id v10;
  id v11;
  PLTableThumbnailEncoderResult *v12;
  PLTableThumbnailEncoderResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLTableThumbnailEncoderResult;
  v12 = -[PLTableThumbnailEncoderResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a4);
    objc_storeStrong((id *)&v13->_ktxData, a3);
    objc_storeStrong((id *)&v13->_imageFormat, a5);
  }

  return v13;
}

- (NSData)ktxHeaderData
{
  void *v2;
  void *v3;

  -[PLTableThumbnailEncoderResult ktxData](self, "ktxData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subdataWithRange:", 0, 64);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (unint64_t)imageDataLength
{
  PL_KTXHeader *v3;
  id v4;
  unint64_t v5;

  v3 = -[PLTableThumbnailEncoderResult _ktxHeader](self, "_ktxHeader");
  -[PLTableThumbnailEncoderResult ktxData](self, "ktxData");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = *(unsigned int *)(objc_msgSend(v4, "bytes") + v3->var13 + 64);

  return v5;
}

- (NSData)imageData
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = -[PLTableThumbnailEncoderResult imageDataLength](self, "imageDataLength");
  -[PLTableThumbnailEncoderResult ktxData](self, "ktxData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") - v3;

  -[PLTableThumbnailEncoderResult ktxData](self, "ktxData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subdataWithRange:", v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v7;
}

- (PLImageTableEntryFooter_s)tableFooter
{
  PL_KTXHeader *v5;
  void *v6;
  uint64_t v7;
  PLImageTableEntryFooter_s *result;
  uint64_t v9;

  v5 = -[PLTableThumbnailEncoderResult _ktxHeader](self, "_ktxHeader");
  *(_QWORD *)&retstr->var0.var8 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  *(_QWORD *)&retstr->var0.var0 = 0;
  retstr->var3 = 0;
  -[PLTableThumbnailEncoderResult uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&retstr->var0.var0 = PLUUIDBytesFromString();
  *(_QWORD *)&retstr->var0.var8 = v7;

  if (v5)
    v9 = *(_QWORD *)&v5->var7;
  else
    v9 = 0;
  *(_QWORD *)&retstr->var1 = v9;
  retstr->var3 = 0;
  return result;
}

- (id)entryDataForEntryLength:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PLTableThumbnailEncoderResult imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") + 28;

  if (v6 <= a3)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", a3);
    -[PLTableThumbnailEncoderResult imageData](self, "imageData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");
    -[PLTableThumbnailEncoderResult imageData](self, "imageData");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "replaceBytesInRange:withBytes:", 0, v11, objc_msgSend(v12, "bytes"));

    LODWORD(v15) = 0;
    -[PLTableThumbnailEncoderResult tableFooter](self, "tableFooter", 0, 0, 0, v15);
    objc_msgSend(v9, "replaceBytesInRange:withBytes:", objc_msgSend(v9, "length") - 28, 28, &v13);
    return v9;
  }
  else
  {
    PLThumbnailsGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 134217984;
      v14 = a3;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Cannot build entry data, entryLength: %ld too small", (uint8_t *)&v13, 0xCu);
    }

    return 0;
  }
}

- (NSData)ktxData
{
  return self->_ktxData;
}

- (PLImageFormat)imageFormat
{
  return self->_imageFormat;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_imageFormat, 0);
  objc_storeStrong((id *)&self->_ktxData, 0);
}

+ (unint64_t)_minKtxDataLengthFromImageSize:(CGSize)a3
{
  return (unint64_t)(a3.width * a3.height + 68.0);
}

@end
