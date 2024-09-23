@implementation TXRDefaultBufferMap

- (id)initForBuffer:(id)a3 withBytes:(void *)a4
{
  id v7;
  TXRDefaultBufferMap *v8;
  TXRDefaultBufferMap *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TXRDefaultBufferMap;
  v8 = -[TXRDefaultBufferMap init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_buffer, a3);
    v9->_bytes = a4;
  }

  return v9;
}

- (void)bytes
{
  return self->_bytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
