@implementation MBFileHandle

- (NSString)path
{
  -[MBFileHandle doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (int)fd
{
  -[MBFileHandle doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return -1;
}

- (BOOL)isSQLiteFile
{
  return 0;
}

- (id)encryptionKeyWithError:(id *)a3
{
  return 0;
}

- (BOOL)validateEncryptionKey:(id)a3 error:(id *)a4
{
  -[MBFileHandle doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)statWithBuffer:(stat *)a3 error:(id *)a4
{
  -[MBFileHandle doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (int64_t)readWithBytes:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  -[MBFileHandle doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return -1;
}

- (int64_t)writeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  -[MBFileHandle doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return -1;
}

- (BOOL)closeWithError:(id *)a3
{
  -[MBFileHandle doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)readFromPath:(id)a3 error:(id *)a4
{
  int v7;
  int v8;
  ssize_t v9;
  BOOL v10;
  id v11;
  id v12;
  _BYTE v14[4096];

  v7 = open((const char *)objc_msgSend(a3, "fileSystemRepresentation"), 256);
  if (v7 < 0)
  {
    if (a4)
    {
      v11 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", a3, CFSTR("open error"));
      v10 = 0;
      *a4 = v11;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v8 = v7;
    while (1)
    {
      v9 = read(v8, v14, 0x1000uLL);
      if (v9 < 1)
        break;
      if (-[MBFileHandle writeWithBytes:length:error:](self, "writeWithBytes:length:error:", v14, v9, a4) < 0)
        goto LABEL_5;
    }
    if (v9)
    {
      if (!a4)
      {
LABEL_5:
        v10 = 0;
        goto LABEL_13;
      }
      v12 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", a3, CFSTR("read error"));
      v10 = 0;
      *a4 = v12;
    }
    else
    {
      v10 = 1;
    }
LABEL_13:
    close(v8);
  }
  return v10;
}

- (BOOL)recordMetadataWithSHA256Data:(id)a3 error:(id *)a4
{
  __assert_rtn("-[MBFileHandle recordMetadataWithSHA256Data:error:]", "MBFileHandle.m", 110, "0 && \"Unexpected call\");
}

@end
