@implementation DataStreamHAPPendingWrite

- (DataStreamHAPPendingWrite)initWithData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  DataStreamHAPPendingWrite *v8;
  NSData *v9;
  NSData *data;
  id v11;
  id completion;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DataStreamHAPPendingWrite;
  v8 = -[DataStreamHAPPendingWrite init](&v14, "init");
  if (v8)
  {
    v9 = (NSData *)objc_msgSend(v6, "copy");
    data = v8->_data;
    v8->_data = v9;

    v11 = objc_retainBlock(v7);
    completion = v8->_completion;
    v8->_completion = v11;

  }
  return v8;
}

- (BOOL)isComplete
{
  DataStreamHAPPendingWrite *v2;
  void *v3;
  id v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPPendingWrite data](self, "data"));
  v4 = objc_msgSend(v3, "length");
  LOBYTE(v2) = v4 <= (id)-[DataStreamHAPPendingWrite bytesWritten](v2, "bytesWritten");

  return (char)v2;
}

- (id)popNextFrameUpToMaxLength:(unint64_t)a3
{
  void *v5;
  _BYTE *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPPendingWrite data](self, "data"));
  v6 = objc_msgSend(v5, "length");
  v7 = v6 - (_BYTE *)-[DataStreamHAPPendingWrite bytesWritten](self, "bytesWritten");

  if (v7 < a3)
    a3 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPPendingWrite data](self, "data"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdataWithRange:", -[DataStreamHAPPendingWrite bytesWritten](self, "bytesWritten"), a3));

  -[DataStreamHAPPendingWrite setBytesWritten:](self, "setBytesWritten:", (char *)-[DataStreamHAPPendingWrite bytesWritten](self, "bytesWritten") + a3);
  return v9;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (id)completion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setBytesWritten:(unint64_t)a3
{
  self->_bytesWritten = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
