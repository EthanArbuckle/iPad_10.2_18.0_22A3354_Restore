@implementation SDArchiveFile

- (SDArchiveFile)initWithPath:(id)a3 target:(id)a4 ofType:(id)a5
{
  id v9;
  id v10;
  id v11;
  SDArchiveFile *v12;
  SDArchiveFile *v13;
  NSArray *offsets;
  NSArray *sizes;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SDArchiveFile;
  v12 = -[SDArchiveFile init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourcePath, a3);
    objc_storeStrong((id *)&v13->_targetPath, a4);
    objc_storeStrong((id *)&v13->_fileType, a5);
    offsets = v13->_offsets;
    v13->_offsets = 0;

    sizes = v13->_sizes;
    v13->_sizes = 0;

    v13->_fd = -1;
  }

  return v13;
}

- (NSString)sourcePath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSourcePath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)targetPath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTargetPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)fileType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFileType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSArray)offsets
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOffsets:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSArray)sizes
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSizes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizes, 0);
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_targetPath, 0);
  objc_storeStrong((id *)&self->_sourcePath, 0);
}

@end
