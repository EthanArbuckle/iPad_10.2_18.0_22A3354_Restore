@implementation AppleTypeCRetimerFifoQueue

- (unint64_t)length
{
  return -[NSData length](self->_buffer, "length");
}

- (void)enqueueData:(id)a3
{
  void *v4;
  void *v5;
  NSData *v6;
  NSData *buffer;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_buffer)
    objc_msgSend(v4, "appendData:");
  objc_msgSend(v5, "appendData:", v8);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v5);
  v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  buffer = self->_buffer;
  self->_buffer = v6;

}

- (id)dequeueDataOfLength:(unint64_t)a3
{
  void *v5;
  NSData *v6;
  unint64_t v7;
  NSData *buffer;

  if (-[AppleTypeCRetimerFifoQueue length](self, "length") >= a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", -[NSData bytes](self->_buffer, "bytes"), a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AppleTypeCRetimerFifoQueue length](self, "length") == a3)
    {
      v6 = 0;
    }
    else
    {
      v7 = -[AppleTypeCRetimerFifoQueue length](self, "length") - a3;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", -[NSData bytes](self->_buffer, "bytes") + a3, v7);
      v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    buffer = self->_buffer;
    self->_buffer = v6;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ len=%lu>"), v5, -[AppleTypeCRetimerFifoQueue length](self, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
