@implementation StreamContext

- (StreamContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)StreamContext;
  return -[StreamContext init](&v3, "init");
}

- (OS_dispatch_source)readSource
{
  return self->_readSource;
}

- (void)setReadSource:(id)a3
{
  objc_storeStrong((id *)&self->_readSource, a3);
}

- (unsigned)streamFlags
{
  return self->_streamFlags;
}

- (void)setStreamFlags:(unsigned int)a3
{
  self->_streamFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readSource, 0);
}

@end
