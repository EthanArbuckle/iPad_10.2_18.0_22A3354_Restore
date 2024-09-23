@implementation TXRDefaultBuffer

- (TXRDefaultBuffer)initWithData:(id)a3 zone:(_NSZone *)a4
{
  id v6;
  TXRDefaultBuffer *v7;
  uint64_t v8;
  NSMutableData *data;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TXRDefaultBuffer;
  v7 = -[TXRDefaultBuffer init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copyWithZone:", a4);
    data = v7->_data;
    v7->_data = (NSMutableData *)v8;

  }
  return v7;
}

- (TXRDefaultBuffer)initWithBytes:(void *)a3 length:(unint64_t)a4
{
  TXRDefaultBuffer *v6;
  uint64_t v7;
  NSMutableData *data;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TXRDefaultBuffer;
  v6 = -[TXRDefaultBuffer init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", a3, a4);
    data = v6->_data;
    v6->_data = (NSMutableData *)v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TXRDefaultBuffer;
  -[TXRDefaultBuffer dealloc](&v2, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TXRDefaultBuffer initWithData:zone:]([TXRDefaultBuffer alloc], "initWithData:zone:", self->_data, a3);
}

- (TXRDefaultBuffer)initWithLength:(unint64_t)a3
{
  TXRDefaultBuffer *v4;
  uint64_t v5;
  NSMutableData *data;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TXRDefaultBuffer;
  v4 = -[TXRDefaultBuffer init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", a3);
    data = v4->_data;
    v4->_data = (NSMutableData *)v5;

  }
  return v4;
}

- (id)map
{
  return -[TXRDefaultBufferMap initForBuffer:withBytes:]([TXRDefaultBufferMap alloc], "initForBuffer:withBytes:", self, -[NSMutableData mutableBytes](self->_data, "mutableBytes"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
