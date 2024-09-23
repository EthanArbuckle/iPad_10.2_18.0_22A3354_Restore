@implementation NFHceTagReadCALogger

- (NFHceTagReadCALogger)init
{
  NFHceTagReadCALogger *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NFHceTagReadCALogger;
  result = -[NFHceTagReadCALogger init](&v3, "init");
  if (result)
  {
    result->_readStart = 0;
    result->_wasRead = 0;
    result->_rawBytesTx = 0;
    result->_rawBytesRx = 0;
    result->_rawCommandCount = 0;
    result->_resultCode = 0;
    result->_connectionCount = 0;
    *(_QWORD *)&result->_sessionDuration = 0;
    *(_QWORD *)&result->_sessionTotalRx = 0;
    result->_sessionStart = 0;
    *(_QWORD *)((char *)&result->_sessionTotalTx + 3) = 0;
  }
  return result;
}

@end
