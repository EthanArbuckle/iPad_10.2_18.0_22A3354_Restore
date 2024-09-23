@implementation MBFileHandleProxy

- (MBFileHandleProxy)initWithFileHandle:(id)a3
{
  MBFileHandleProxy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBFileHandleProxy;
  v4 = -[MBFileHandleProxy init](&v6, "init");
  if (v4)
    v4->_fileHandle = (MBFileHandle *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBFileHandleProxy;
  -[MBFileHandleProxy dealloc](&v3, "dealloc");
}

- (id)path
{
  return -[MBFileHandle path](self->_fileHandle, "path");
}

- (int)fd
{
  return -[MBFileHandle fd](self->_fileHandle, "fd");
}

- (id)encryptionKeyWithError:(id *)a3
{
  return -[MBFileHandle encryptionKeyWithError:](self->_fileHandle, "encryptionKeyWithError:", a3);
}

- (BOOL)statWithBuffer:(stat *)a3 error:(id *)a4
{
  return -[MBFileHandle statWithBuffer:error:](self->_fileHandle, "statWithBuffer:error:", a3, a4);
}

- (int64_t)readWithBytes:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  return -[MBFileHandle readWithBytes:length:error:](self->_fileHandle, "readWithBytes:length:error:", a3, a4, a5);
}

- (int64_t)writeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  return -[MBFileHandle writeWithBytes:length:error:](self->_fileHandle, "writeWithBytes:length:error:", a3, a4, a5);
}

- (BOOL)closeWithError:(id *)a3
{
  return -[MBFileHandle closeWithError:](self->_fileHandle, "closeWithError:", a3);
}

- (MBFileHandle)fileHandle
{
  return self->_fileHandle;
}

@end
