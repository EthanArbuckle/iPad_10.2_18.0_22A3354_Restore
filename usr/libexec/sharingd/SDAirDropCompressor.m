@implementation SDAirDropCompressor

- (SDAirDropCompressor)initWithReadStream:(__CFReadStream *)a3 writeStream:(__CFWriteStream *)a4
{
  SDAirDropCompressor *v6;
  SDAirDropCompressor *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *adjustmentQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SDAirDropCompressor;
  v6 = -[SDAirDropCompressor init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    v6->_compressible = 1;
    v6->_totalBytesSent = 0;
    v6->_totalNetworkDelay = 0.0;
    v6->_numBlocksProcessed = 0;
    v6->_totalBytesProcessed = 0;
    v6->_lastCompressionRatio = 0.0;
    v6->_totalCompressionTime = 0.0;
    v6->_numBlocksCompressed = 0;
    v6->_totalCompressedOutput = 0;
    v6->_keepingUpWithNetwork = 1;
    v6->_readStream = (__CFReadStream *)CFRetain(a3);
    v7->_writeStream = (__CFWriteStream *)CFRetain(a4);
    v8 = dispatch_queue_create("com.apple.sharingd.adjustment-queue", 0);
    adjustmentQueue = v7->_adjustmentQueue;
    v7->_adjustmentQueue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (void)dealloc
{
  __CFReadStream *readStream;
  __CFWriteStream *writeStream;
  objc_super v5;

  readStream = self->_readStream;
  if (readStream)
    CFRelease(readStream);
  writeStream = self->_writeStream;
  if (writeStream)
    CFRelease(writeStream);
  v5.receiver = self;
  v5.super_class = (Class)SDAirDropCompressor;
  -[SDAirDropCompressor dealloc](&v5, "dealloc");
}

- (__CFReadStream)copyReadStream
{
  __CFReadStream *result;

  result = self->_readStream;
  if (result)
    return (__CFReadStream *)CFRetain(result);
  return result;
}

- (BOOL)writeData:(char *)a3 length:(int64_t)a4 toStream:(__CFWriteStream *)a5
{
  int64_t v9;
  CFIndex v10;
  uint64_t v12;
  NSObject *v13;

  if (a4 < 1)
    return 1;
  v9 = 0;
  while (1)
  {
    v10 = CFWriteStreamWrite(a5, (const UInt8 *)&a3[v9], a4 - v9);
    if (v10 < 0)
      break;
    v9 += v10;
    if (v9 >= a4)
      return 1;
  }
  v12 = airdrop_log(v10);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_100102234();

  CFReadStreamClose(self->_readStream);
  return 0;
}

- (BOOL)readData:(char *)a3 length:(int64_t)a4 fromStream:(__CFReadStream *)a5
{
  int64_t v9;
  CFIndex v10;
  uint64_t v12;
  NSObject *v13;

  if (a4 < 1)
    return 1;
  v9 = 0;
  while (1)
  {
    if (CFReadStreamGetStatus(a5) > kCFStreamStatusWriting)
      return 1;
    v10 = CFReadStreamRead(a5, (UInt8 *)&a3[v9], a4 - v9);
    if (v10 < 0)
      break;
    v9 += v10;
    if (v9 >= a4)
      return 1;
  }
  v12 = airdrop_log(v10);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_100102294();

  CFWriteStreamClose(self->_writeStream);
  return 0;
}

- (BOOL)readIncomingChunk
{
  size_t v3;
  Bytef *v5;
  Bytef *v6;
  uLongf v8;
  unsigned int v9;

  v9 = 0;
  LODWORD(v3) = -[SDAirDropCompressor readData:length:fromStream:](self, "readData:length:fromStream:", &v9, 4, self->_readStream);
  if (CFReadStreamGetStatus(self->_readStream) <= kCFStreamStatusWriting && (_DWORD)v3 != 0)
  {
    v9 = bswap32(v9);
    v3 = v9 & 0x7FFFFFFF;
    v5 = (Bytef *)malloc_type_malloc(v3, 0x9B146ABEuLL);
    if (-[SDAirDropCompressor readData:length:fromStream:](self, "readData:length:fromStream:", v5, v3, self->_readStream))
    {
      if ((v9 & 0x80000000) != 0)
      {
        LOBYTE(v3) = -[SDAirDropCompressor writeData:length:toStream:](self, "writeData:length:toStream:", v5, v3, self->_writeStream);
      }
      else
      {
        v8 = 0x20000;
        v6 = (Bytef *)malloc_type_malloc(0x20000uLL, 0xEDEC9D1CuLL);
        uncompress(v6, &v8, v5, v3);
        LOBYTE(v3) = -[SDAirDropCompressor writeData:length:toStream:](self, "writeData:length:toStream:", v6, v8, self->_writeStream);
        if (v6 != v5)
        {
          free(v5);
          v5 = v6;
        }
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
    free(v5);
  }
  return v3;
}

- (void)sendOutgoingChunk:(char *)a3 length:(int64_t)a4 compressed:(BOOL)a5
{
  unsigned int v8;
  unsigned int v9;

  v8 = a4 | 0x80000000;
  if (a5)
    v8 = a4;
  v9 = bswap32(v8);
  -[SDAirDropCompressor writeData:length:toStream:](self, "writeData:length:toStream:", &v9, 4, self->_writeStream);
  -[SDAirDropCompressor writeData:length:toStream:](self, "writeData:length:toStream:", a3, a4, self->_writeStream);
}

- (void)openStreams
{
  CFErrorRef v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;

  if (CFReadStreamOpen(self->_readStream))
  {
    if (CFWriteStreamOpen(self->_writeStream))
      return;
    v3 = CFWriteStreamCopyError(self->_writeStream);
    v4 = airdrop_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100102354();

    CFReadStreamClose(self->_readStream);
  }
  else
  {
    v3 = CFReadStreamCopyError(self->_readStream);
    v6 = airdrop_log(v3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1001022F4();

  }
}

- (void)processNetworkStatistics:(double)a3
{
  unint64_t v3;
  int64_t numBlocksProcessed;
  unsigned int totalBytesProcessed;
  double v8;
  double lastCompressionRatio;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  NSObject *v24;
  BOOL v25;
  uint64_t v26;

  if (a3 > 1.0 && !self->_keepingUpWithNetwork)
  {
    v10 = airdrop_log(self);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1001023B4(v11, v12, v13, v14, v15, v16, v17, v18);

    self->_keepingUpWithNetwork = 1;
    self->_numBlocksProcessed = 0;
    self->_totalBytesSent = 0;
    lastCompressionRatio = 0.0;
    v19 = 16;
    goto LABEL_24;
  }
  numBlocksProcessed = self->_numBlocksProcessed;
  if (numBlocksProcessed < 21)
    return;
  totalBytesProcessed = self->_totalBytesProcessed;
  v8 = (double)totalBytesProcessed;
  if (totalBytesProcessed)
  {
    LODWORD(v3) = self->_totalCompressedOutput;
    lastCompressionRatio = (double)v3 / v8;
  }
  else
  {
    lastCompressionRatio = self->_lastCompressionRatio;
  }
  LODWORD(v8) = self->_totalBytesSent;
  v20 = (double)*(unint64_t *)&v8 / self->_totalNetworkDelay;
  v21 = self->_totalCompressionTime * 128.0 * 1024.0 / (double)totalBytesProcessed
      + lastCompressionRatio * 131072.0 / v20;
  v22 = 131072.0 / v20;
  if (self->_keepingUpWithNetwork && v21 > v22 + v22)
  {
    v23 = airdrop_log(self);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      sub_10010241C();
    v25 = 0;
LABEL_22:

    self->_keepingUpWithNetwork = v25;
    goto LABEL_23;
  }
  if (!self->_keepingUpWithNetwork && v22 > v21)
  {
    v26 = airdrop_log(self);
    v24 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      sub_100102480();
    v25 = 1;
    goto LABEL_22;
  }
  if ((unint64_t)numBlocksProcessed <= 0x1F4)
  {
    v19 = 56;
    goto LABEL_24;
  }
LABEL_23:
  self->_numBlocksProcessed = 0;
  self->_totalBytesSent = 0;
  v19 = 56;
  self->_totalNetworkDelay = 0.0;
LABEL_24:
  *(double *)((char *)&self->super.isa + v19) = lastCompressionRatio;
}

- (void)processCompressibilityStatistics
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (self->_compressible && self->_numBlocksCompressed >= 11)
  {
    LODWORD(v2) = self->_totalCompressedOutput;
    LODWORD(v3) = self->_totalBytesProcessed;
    if ((double)v2 / (double)v3 > 0.8)
    {
      self->_compressible = 0;
      v4 = airdrop_log(self);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        sub_1001024E4(v5, v6, v7, v8, v9, v10, v11, v12);

    }
  }
}

- (void)fileComplete
{
  NSObject *adjustmentQueue;
  _QWORD block[5];

  adjustmentQueue = self->_adjustmentQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100101C9C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_sync(adjustmentQueue, block);
}

- (void)executeReadWithAdaptiveCompression
{
  CFStreamStatus Status;
  unsigned __int8 v4;
  CFErrorRef v5;
  uint64_t v6;
  NSObject *v7;

  -[SDAirDropCompressor openStreams](self, "openStreams");
  Status = CFReadStreamGetStatus(self->_readStream);
  if (Status < kCFStreamStatusAtEnd)
  {
    do
    {
      v4 = -[SDAirDropCompressor readIncomingChunk](self, "readIncomingChunk");
      Status = CFReadStreamGetStatus(self->_readStream);
    }
    while (Status < kCFStreamStatusAtEnd && (v4 & 1) != 0);
  }
  if (Status <= kCFStreamStatusAtEnd)
  {
    CFReadStreamClose(self->_readStream);
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  if (Status != kCFStreamStatusError)
    goto LABEL_10;
  v5 = CFReadStreamCopyError(self->_readStream);
  v6 = airdrop_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_10010254C();

LABEL_11:
  CFWriteStreamClose(self->_writeStream);

}

- (void)executeWriteWithAdaptiveCompression
{
  NSObject *v3;
  NSObject *v4;
  CFStreamStatus Status;
  dispatch_semaphore_t v6;
  NSObject *v7;
  dispatch_semaphore_t v8;
  UInt8 *v9;
  CFIndex v10;
  CFIndex v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  CFErrorRef v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[5];
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  CFIndex v23;
  UInt8 *v24;

  -[SDAirDropCompressor openStreams](self, "openStreams");
  v3 = dispatch_semaphore_create(2);
  v4 = dispatch_queue_create("com.apple.sharingd.compression-queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  Status = CFReadStreamGetStatus(self->_readStream);
  if (Status >= kCFStreamStatusAtEnd)
  {
    v6 = 0;
    v7 = 0;
    goto LABEL_15;
  }
  v6 = 0;
  v7 = 0;
  while (1)
  {
    v8 = v6;
    v6 = dispatch_semaphore_create(0);

    v9 = (UInt8 *)malloc_type_malloc(0x20000uLL, 0xF11B11ECuLL);
    v10 = CFReadStreamRead(self->_readStream, v9, 0x20000);
    if (!v10)
    {
      free(v9);
      goto LABEL_7;
    }
    v11 = v10;
    if (v10 < 0)
      break;
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100101FE8;
    v19[3] = &unk_100717B00;
    v23 = v11;
    v24 = v9;
    v19[4] = self;
    v20 = v7;
    v12 = v6;
    v21 = v12;
    v22 = v3;
    v13 = v7;
    dispatch_async(v4, v19);
    v7 = v12;

LABEL_7:
    Status = CFReadStreamGetStatus(self->_readStream);
    if (Status >= kCFStreamStatusAtEnd)
    {
      if (!v7)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  v14 = airdrop_log(v10);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_100102294();

  free(v9);
  if (v7)
LABEL_14:
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
LABEL_15:
  if (Status <= kCFStreamStatusAtEnd)
  {
    CFReadStreamClose(self->_readStream);
    goto LABEL_21;
  }
  if (Status == kCFStreamStatusError)
  {
    v16 = CFReadStreamCopyError(self->_readStream);
    v17 = airdrop_log(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1001025AC();

  }
  else
  {
LABEL_21:
    v16 = 0;
  }
  CFWriteStreamClose(self->_writeStream);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentQueue, 0);
}

@end
