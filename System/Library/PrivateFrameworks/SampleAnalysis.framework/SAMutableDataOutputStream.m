@implementation SAMutableDataOutputStream

- (int)appendData:(id)a3
{
  NSMutableData *outputData;
  id v4;

  outputData = self->_outputData;
  v4 = a3;
  -[NSMutableData appendData:](outputData, "appendData:", v4);
  LODWORD(outputData) = objc_msgSend(v4, "length");

  return (int)outputData;
}

- (id)initWithMutableData:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)SAMutableDataOutputStream;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 17, a2);
  }

  return a1;
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  -[NSMutableData appendBytes:length:](self->_outputData, "appendBytes:length:", a3);
  return a4;
}

- (BOOL)hasSpaceAvailable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputData, 0);
}

@end
