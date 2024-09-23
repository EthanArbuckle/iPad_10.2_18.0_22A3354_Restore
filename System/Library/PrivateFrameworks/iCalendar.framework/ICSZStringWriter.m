@implementation ICSZStringWriter

- (ICSZStringWriter)init
{
  ICSZStringWriter *v2;
  ICSZStringWriter *v3;
  ICSZStringWriter *v4;
  NSMutableData *v5;
  NSMutableData *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICSZStringWriter;
  v2 = -[ICSZStringWriter init](&v8, sel_init);
  v3 = v2;
  if (!v2)
    goto LABEL_4;
  v2->_strm.zalloc = 0;
  v2->_strm.zfree = 0;
  v2->_strm.opaque = 0;
  v4 = 0;
  if (!deflateInit_(&v2->_strm, -1, "1.2.12", 112))
  {
    v5 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v6 = v3->_result;
    v3->_result = v5;

LABEL_4:
    v4 = v3;
  }

  return v4;
}

- (void)appendString:(id)a3
{
  const char *v4;

  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "cStringUsingEncoding:", 4);
  if (v4)
  {
    if (*v4)
      -[ICSZStringWriter _appendBytes:length:andFlush:](self, "_appendBytes:length:andFlush:", v4, strlen(v4), 0);
  }
}

- (void)appendFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:locale:arguments:", v5, 0, &v7);

  -[ICSZStringWriter appendString:](self, "appendString:", v6);
}

- (id)zResult
{
  char v4;

  v4 = 0;
  -[ICSZStringWriter _appendBytes:length:andFlush:](self, "_appendBytes:length:andFlush:", &v4, 1, 1);
  return self->_result;
}

- (void)_appendBytes:(const void *)a3 length:(unint64_t)a4 andFlush:(BOOL)a5
{
  z_stream *p_strm;
  int v8;
  void *v9;
  _QWORD v10[2050];

  v10[2048] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    self->_strm.next_in = (Bytef *)a3;
    p_strm = &self->_strm;
    self->_strm.avail_in = a4;
    if (a5)
      v8 = 4;
    else
      v8 = 0;
    do
    {
      self->_strm.avail_out = 0x4000;
      self->_strm.next_out = (Bytef *)v10;
      if (deflate(p_strm, v8) == -2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICSStringWriter.m"), 120, CFSTR("Error in string compression"));

      }
      -[NSMutableData appendBytes:length:](self->_result, "appendBytes:length:", v10, 0x4000 - self->_strm.avail_out);
    }
    while (!self->_strm.avail_out);
  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %d bytes>"), v5, self, -[NSMutableData length](self->_result, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
}

@end
