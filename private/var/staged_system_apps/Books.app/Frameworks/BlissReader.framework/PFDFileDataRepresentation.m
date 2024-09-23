@implementation PFDFileDataRepresentation

- (PFDFileDataRepresentation)initWithPath:(id)a3 J00oNrNGGvbpr5VY2bUB:(id)a4
{
  PFDFileDataRepresentation *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PFDFileDataRepresentation;
  v6 = -[PFDFileDataRepresentation init](&v8, "init");
  if (v6)
  {
    v6->mPath = (NSString *)a3;
    v6->mDecryptionSession = (BuLr3rwnVU31zt9OioJ56 *)a4;
    v6->mDataLength = 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFDFileDataRepresentation;
  -[PFDFileDataRepresentation dealloc](&v3, "dealloc");
}

- (int64_t)dataLength
{
  int64_t result;

  result = self->mDataLength;
  if (!result)
  {
    result = (int64_t)-[NSFileManager pathUsage:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "pathUsage:", self->mPath);
    self->mDataLength = result;
  }
  return result;
}

- (id)inputStream
{
  return -[PFDFileDataRepresentation bufferedInputStream](self, "bufferedInputStream");
}

- (id)bufferedInputStream
{
  return -[PFDInputStream initWithInputStream:J00oNrNGGvbpr5VY2bUB:]([PFDInputStream alloc], "initWithInputStream:J00oNrNGGvbpr5VY2bUB:", objc_msgSend(objc_alloc((Class)SFUFileInputStream), "initWithPath:offset:", self->mPath, 0), self->mDecryptionSession);
}

- (id)bufferedInputStreamWithBufferSize:(unint64_t)a3
{
  return -[PFDFileDataRepresentation bufferedInputStream](self, "bufferedInputStream", a3);
}

- (unint64_t)hash
{
  return -[NSString hash](self->mPath, "hash");
}

@end
