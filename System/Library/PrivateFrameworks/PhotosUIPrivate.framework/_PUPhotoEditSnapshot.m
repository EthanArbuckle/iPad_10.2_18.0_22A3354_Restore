@implementation _PUPhotoEditSnapshot

- (void)setImageData:(id)a3
{
  NSData *v4;
  NSData *imageData;

  v4 = -[_PUPhotoEditSnapshot _copyData:](self, "_copyData:", a3);
  imageData = self->_imageData;
  self->_imageData = v4;

}

- (void)setBaseImageData:(id)a3
{
  NSData *v4;
  NSData *baseImageData;

  v4 = -[_PUPhotoEditSnapshot _copyData:](self, "_copyData:", a3);
  baseImageData = self->_baseImageData;
  self->_baseImageData = v4;

}

- (id)_copyData:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;

  if (!a3)
    return 0;
  v5 = a3;
  NSTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "writeToFile:options:error:", v9, 1073741825, 0);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v9, 8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v9);
  unlink((const char *)objc_msgSend(v11, "fileSystemRepresentation"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditViewController.m"), 10660, CFSTR("couldn't copy snapshot data"));

  }
  return v10;
}

- (int64_t)workImageVersion
{
  return self->_workImageVersion;
}

- (void)setWorkImageVersion:(int64_t)a3
{
  self->_workImageVersion = a3;
}

- (PHAdjustmentData)adjustmentData
{
  return self->_adjustmentData;
}

- (void)setAdjustmentData:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentData, a3);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSData)baseImageData
{
  return self->_baseImageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseImageData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
}

@end
