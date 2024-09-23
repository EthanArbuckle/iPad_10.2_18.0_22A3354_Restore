@implementation ASReleasableBuffer

- (ASReleasableBuffer)initWithData:(id)a3
{
  id v4;
  ASReleasableBuffer *v5;
  id v6;
  ASReleasableBuffer *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASReleasableBuffer;
  v5 = -[ASReleasableBuffer init](&v9, "init");
  if (!v5)
    goto LABEL_6;
  byte_1005185C0 = 1;
  v6 = objc_msgSend(v4, "length");
  v5->_originalDataLength = (unint64_t)v6;
  if (!v6)
  {
    v5->_data = 0;
    goto LABEL_6;
  }
  v7 = (ASReleasableBuffer *)malloc_type_malloc((size_t)v6, 0x42C8BFC6uLL);
  v5->_data = (char *)v7;
  if (v7)
  {
    memcpy(v7, objc_msgSend(objc_retainAutorelease(v4), "bytes"), v5->_originalDataLength);
LABEL_6:
    v7 = v5;
  }

  return v7;
}

- (void)releaseData
{
  char *data;
  BOOL v4;

  data = self->_data;
  if (data)
    v4 = byte_1005185C0 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    free(data);
    self->_data = 0;
  }
}

- (void)makeUnreleaseable
{
  byte_1005185C0 = 0;
}

- (void)dealloc
{
  objc_super v3;

  byte_1005185C0 = 1;
  -[ASReleasableBuffer releaseData](self, "releaseData");
  v3.receiver = self;
  v3.super_class = (Class)ASReleasableBuffer;
  -[ASReleasableBuffer dealloc](&v3, "dealloc");
}

- (char)takeDataAndOwnership
{
  char *data;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  data = self->_data;
  if (!data)
  {
    v4 = qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_FAULT))
      sub_1003D6E94(v4, v5, v6, v7, v8, v9, v10, v11);
    return 0;
  }
  if (!byte_1005185C0)
  {
    v12 = (char *)malloc_type_malloc(self->_originalDataLength, 0xC9D5DE5BuLL);
    if (v12)
    {
      data = v12;
      memcpy(v12, self->_data, self->_originalDataLength);
      return data;
    }
    v14 = qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_FAULT))
      sub_1003D6EC8(v14, v15, v16, v17, v18, v19, v20, v21);
    return 0;
  }
  self->_data = 0;
  return data;
}

- (unint64_t)originalDataLength
{
  return self->_originalDataLength;
}

- (char)data
{
  return self->_data;
}

@end
