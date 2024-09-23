@implementation TSUBufferedReadChannelHelper

- (TSUBufferedReadChannelHelper)initWithBufferedReadChannel:(id)a3
{
  id v4;
  TSUBufferedReadChannelHelper *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSUBufferedReadChannelHelper;
  v5 = -[TSUBufferedReadChannelHelper init](&v10, sel_init);
  if (v5)
  {
    if (!v4)
    {
      +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannelHelper initWithBufferedReadChannel:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 296, CFSTR("invalid nil value for '%s'"), "bufferedReadChannel");

    }
    objc_storeWeak((id *)&v5->_bufferedReadChannel, v4);
  }

  return v5;
}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
  TSUBufferedReadChannel **p_bufferedReadChannel;
  id v6;
  id v7;
  id WeakRetained;

  p_bufferedReadChannel = &self->_bufferedReadChannel;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_bufferedReadChannel);
  objc_msgSend(WeakRetained, "setStreamReadChannelSourceQueue:handler:", v7, v6);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bufferedReadChannel);
}

@end
