@implementation BRCChecksummingOutputStream

- (NSData)signature
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (self->_isOpen)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[BRCChecksummingOutputStream signature].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", self->_sig, 21);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (BRCChecksummingOutputStream)initWithTag:(unsigned __int8)a3
{
  BRCChecksummingOutputStream *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BRCChecksummingOutputStream;
  result = -[BRCChecksummingOutputStream init](&v5, sel_init);
  if (result)
    result->_sig[0] = a3;
  return result;
}

+ (id)checksummingOutputStreamWithTag:(unsigned __int8)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTag:", a3);
}

- (BOOL)hasSpaceAvailable
{
  return 1;
}

- (void)open
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (self->_isOpen)
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[BRCChecksummingOutputStream signature].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  self->_isOpen = 1;
  CC_SHA1_Init(&self->_ctx);
}

- (void)close
{
  if (self->_isOpen)
  {
    CC_SHA1_Final(&self->_sig[1], &self->_ctx);
    self->_isOpen = 0;
  }
}

- (unint64_t)streamStatus
{
  if (self->_isOpen)
    return 2;
  else
    return 6;
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  unint64_t v7;

  LODWORD(v7) = a4;
  if (HIDWORD(a4))
  {
    v7 = a4;
    do
    {
      CC_SHA1_Update(&self->_ctx, a3, 0xFFFFFFFF);
      v7 -= 0xFFFFFFFFLL;
    }
    while (HIDWORD(v7));
  }
  CC_SHA1_Update(&self->_ctx, a3, v7);
  return a4;
}

- (void)signature
{
  OUTLINED_FUNCTION_0_0(&dword_230455000, a2, a3, "[CRIT] Assertion failed: !_isOpen%@", a5, a6, a7, a8, 2u);
}

@end
