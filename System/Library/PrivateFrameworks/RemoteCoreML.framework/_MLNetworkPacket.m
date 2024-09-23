@implementation _MLNetworkPacket

- (_MLNetworkPacket)init
{
  _MLNetworkPacket *v2;
  uint64_t v3;
  NSMutableData *buffer;
  uint64_t v5;
  NSMutableData *doubleBuffer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MLNetworkPacket;
  v2 = -[_MLNetworkPacket init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    buffer = v2->_buffer;
    v2->_buffer = (NSMutableData *)v3;

    v5 = objc_opt_new();
    doubleBuffer = v2->_doubleBuffer;
    v2->_doubleBuffer = (NSMutableData *)v5;

    v2->_sizeOfPacket = 0;
    v2->_command = 0;
  }
  return v2;
}

- (void)reset
{
  -[_MLNetworkPacket setBuffer:](self, "setBuffer:", 0);
  -[_MLNetworkPacket setDoubleBuffer:](self, "setDoubleBuffer:", 0);
  -[_MLNetworkPacket resetMetadata](self, "resetMetadata");
}

- (void)resetMetadata
{
  -[_MLNetworkPacket setCommand:](self, "setCommand:", 0);
  -[_MLNetworkPacket setSizeOfPacket:](self, "setSizeOfPacket:", 0);
}

- (void)cleanupDoubleBuffer
{
  -[_MLNetworkPacket resetMetadata](self, "resetMetadata");
  -[_MLNetworkPacket setDoubleBuffer:](self, "setDoubleBuffer:", 0);
}

- (void)resetDoubleBuffer
{
  void *v3;
  void *v4;

  -[_MLNetworkPacket doubleBuffer](self, "doubleBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MLNetworkPacket setBuffer:](self, "setBuffer:", v3);

  v4 = (void *)objc_opt_new();
  -[_MLNetworkPacket setDoubleBuffer:](self, "setDoubleBuffer:", v4);

  -[_MLNetworkPacket resetMetadata](self, "resetMetadata");
}

- (NSMutableData)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_buffer, a3);
}

- (NSMutableData)doubleBuffer
{
  return self->_doubleBuffer;
}

- (void)setDoubleBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_doubleBuffer, a3);
}

- (unint64_t)sizeOfPacket
{
  return self->_sizeOfPacket;
}

- (void)setSizeOfPacket:(unint64_t)a3
{
  self->_sizeOfPacket = a3;
}

- (unint64_t)command
{
  return self->_command;
}

- (void)setCommand:(unint64_t)a3
{
  self->_command = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleBuffer, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
