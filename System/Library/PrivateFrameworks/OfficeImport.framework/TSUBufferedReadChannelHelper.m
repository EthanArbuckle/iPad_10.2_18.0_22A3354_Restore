@implementation TSUBufferedReadChannelHelper

- (TSUBufferedReadChannelHelper)initWithBufferedReadChannel:(id)a3
{
  id v4;
  TSUBufferedReadChannelHelper *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSUBufferedReadChannelHelper;
  v5 = -[TSUBufferedReadChannelHelper init](&v9, sel_init);
  if (v5)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannelHelper initWithBufferedReadChannel:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 347, 0, "invalid nil value for '%{public}s'", "bufferedReadChannel");

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    objc_storeWeak((id *)&v5->_bufferedReadChannel, v4);
  }

  return v5;
}

- (TSUBufferedReadChannelHelper)init
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUBufferedReadChannelHelper init]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 354, 0, "Do not call method");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[TSUBufferedReadChannelHelper init]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)readWithHandler:(id)a3
{
  TSUBufferedReadChannel **p_bufferedReadChannel;
  id v4;
  id WeakRetained;

  p_bufferedReadChannel = &self->_bufferedReadChannel;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_bufferedReadChannel);
  objc_msgSend(WeakRetained, "setStreamReadChannelSourceHandler:", v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bufferedReadChannel);
}

@end
