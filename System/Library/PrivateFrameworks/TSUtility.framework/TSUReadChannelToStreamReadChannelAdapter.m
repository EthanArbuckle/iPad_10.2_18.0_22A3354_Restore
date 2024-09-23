@implementation TSUReadChannelToStreamReadChannelAdapter

- (TSUReadChannelToStreamReadChannelAdapter)initWithReadChannel:(id)a3
{
  id v5;
  TSUReadChannelToStreamReadChannelAdapter *v6;
  TSUReadChannelToStreamReadChannelAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSUReadChannelToStreamReadChannelAdapter;
  v6 = -[TSUReadChannelToStreamReadChannelAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_readChannel, a3);

  return v7;
}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
  -[TSUReadChannel readFromOffset:length:queue:handler:](self->_readChannel, "readFromOffset:length:queue:handler:", 0, -1, a3, a4);
}

- (void)close
{
  -[TSUReadChannel close](self->_readChannel, "close");
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 queue:(id)a5 handler:(id)a6
{
  -[TSUReadChannel readFromOffset:length:queue:handler:](self->_readChannel, "readFromOffset:length:queue:handler:", a3, a4, a5, a6);
}

- (void)setLowWater:(unint64_t)a3
{
  -[TSUReadChannel setLowWater:](self->_readChannel, "setLowWater:", a3);
}

- (void)addBarrier:(id)a3
{
  -[TSUReadChannel addBarrier:](self->_readChannel, "addBarrier:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end
