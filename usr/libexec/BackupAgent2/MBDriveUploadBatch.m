@implementation MBDriveUploadBatch

- (MBDriveUploadBatch)initWithPaths:(id)a3 size:(unint64_t)a4 last:(BOOL)a5
{
  _BOOL8 v5;
  MBDriveUploadBatch *v8;
  MBDriveUploadBatch *v9;
  unsigned int v10;
  objc_super v12;

  v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)MBDriveUploadBatch;
  v8 = -[MBDriveUploadBatch init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    do
      v10 = __ldxr(&dword_1000F9DF0);
    while (__stxr(v10 + 1, &dword_1000F9DF0));
    -[MBDriveUploadBatch setIndex:](v8, "setIndex:");
    -[MBDriveUploadBatch setPaths:](v9, "setPaths:", a3);
    -[MBDriveUploadBatch setSize:](v9, "setSize:", a4);
    -[MBDriveUploadBatch setLast:](v9, "setLast:", v5);
    -[MBDriveUploadBatch setMinUploadedFileSize:](v9, "setMinUploadedFileSize:", -1);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBDriveUploadBatch;
  -[MBDriveUploadBatch dealloc](&v3, "dealloc");
}

- (NSDictionary)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (BOOL)last
{
  return self->_last;
}

- (void)setLast:(BOOL)a3
{
  self->_last = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unint64_t)uploadStartTime
{
  return self->_uploadStartTime;
}

- (void)setUploadStartTime:(unint64_t)a3
{
  self->_uploadStartTime = a3;
}

- (unint64_t)uploadedFileCount
{
  return self->_uploadedFileCount;
}

- (void)setUploadedFileCount:(unint64_t)a3
{
  self->_uploadedFileCount = a3;
}

- (unint64_t)uploadedByteCount
{
  return self->_uploadedByteCount;
}

- (void)setUploadedByteCount:(unint64_t)a3
{
  self->_uploadedByteCount = a3;
}

- (unint64_t)minUploadedFileSize
{
  return self->_minUploadedFileSize;
}

- (void)setMinUploadedFileSize:(unint64_t)a3
{
  self->_minUploadedFileSize = a3;
}

- (unint64_t)maxUploadedFileSize
{
  return self->_maxUploadedFileSize;
}

- (void)setMaxUploadedFileSize:(unint64_t)a3
{
  self->_maxUploadedFileSize = a3;
}

- (unint64_t)preUploadDuration
{
  return self->_preUploadDuration;
}

- (void)setPreUploadDuration:(unint64_t)a3
{
  self->_preUploadDuration = a3;
}

- (unint64_t)postUploadDuration
{
  return self->_postUploadDuration;
}

- (void)setPostUploadDuration:(unint64_t)a3
{
  self->_postUploadDuration = a3;
}

@end
