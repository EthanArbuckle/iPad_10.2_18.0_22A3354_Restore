@implementation TSUZipFileDescriptorWrapper

- (TSUZipFileDescriptorWrapper)init
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipFileDescriptorWrapper init]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileArchive.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 443, 0, "Do not call method");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[TSUZipFileDescriptorWrapper init]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (TSUZipFileDescriptorWrapper)initWithFileDescriptor:(int)a3 queue:(id)a4
{
  uint64_t v4;
  id v6;
  TSUZipFileDescriptorWrapper *v7;
  TSUFileIOChannel *v8;
  TSUReadChannel *v9;
  TSUReadChannel *readChannel;
  OS_dispatch_group *v11;
  OS_dispatch_group *accessGroup;
  TSUZipFileDescriptorWrapper *v13;
  _QWORD v15[4];
  int v16;
  objc_super v17;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if ((v4 & 0x80000000) == 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)TSUZipFileDescriptorWrapper;
    v7 = -[TSUZipFileDescriptorWrapper init](&v17, sel_init);
    self = v7;
    if (!v7)
    {
      close(v4);
      goto LABEL_7;
    }
    v7->_fileDescriptor = v4;
    v8 = [TSUFileIOChannel alloc];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __60__TSUZipFileDescriptorWrapper_initWithFileDescriptor_queue___block_invoke;
    v15[3] = &__block_descriptor_36_e8_v12__0i8l;
    v16 = v4;
    v9 = -[TSUFileIOChannel initForReadingDescriptor:queue:cleanupHandler:](v8, "initForReadingDescriptor:queue:cleanupHandler:", v4, v6, v15);
    readChannel = self->_readChannel;
    self->_readChannel = v9;

    if (self->_readChannel)
    {
      v11 = (OS_dispatch_group *)dispatch_group_create();
      accessGroup = self->_accessGroup;
      self->_accessGroup = v11;

LABEL_7:
      self = self;
      v13 = self;
      goto LABEL_8;
    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

uint64_t __60__TSUZipFileDescriptorWrapper_initWithFileDescriptor_queue___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)dealloc
{
  objc_super v3;

  -[TSUReadChannel close](self->_readChannel, "close");
  v3.receiver = self;
  v3.super_class = (Class)TSUZipFileDescriptorWrapper;
  -[TSUZipFileDescriptorWrapper dealloc](&v3, sel_dealloc);
}

- (void)beginAccess
{
  dispatch_group_enter((dispatch_group_t)self->_accessGroup);
}

- (void)endAccess
{
  dispatch_group_leave((dispatch_group_t)self->_accessGroup);
}

- (void)waitForAccessToEnd
{
  dispatch_group_wait((dispatch_group_t)self->_accessGroup, 0xFFFFFFFFFFFFFFFFLL);
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (TSUReadChannel)readChannel
{
  return self->_readChannel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readChannel, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
}

@end
