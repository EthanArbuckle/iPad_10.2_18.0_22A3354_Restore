@implementation ICSPushbackStream

- (ICSPushbackStream)initWithInputStream:(id)a3
{
  id v5;
  ICSPushbackStream *v6;
  ICSPushbackStream *v7;
  ICSPushbackStream *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICSPushbackStream;
  v6 = -[ICSPushbackStream init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_underStream, a3);
    v7->_pbData = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x2EA13019uLL);
    v7->_pbCursor = -1;
    v7->_readPastEOS = 0;
  }
  v8 = v7;
LABEL_6:

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_pbData);
  v3.receiver = self;
  v3.super_class = (Class)ICSPushbackStream;
  -[ICSPushbackStream dealloc](&v3, sel_dealloc);
}

- (char)peek
{
  uint64_t pbCursor;
  char v4;
  int v6;
  int v7;
  int v8;
  void *v10;

  pbCursor = self->_pbCursor;
  if ((pbCursor & 0x80000000) == 0)
    return self->_pbData[pbCursor];
  v6 = -[ICSInputByteStream read](self->_underStream, "read");
  v4 = v6;
  if (v6 || !-[ICSInputByteStream eos](self->_underStream, "eos"))
  {
    v7 = self->_pbCursor;
    v8 = v7 + 1;
    self->_pbCursor = v7 + 1;
    if (v7 >= 15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICSPushbackStream.m"), 56, CFSTR("Cannot push back that much data."));

      v8 = self->_pbCursor;
    }
    self->_pbData[v8] = v4;
  }
  else
  {
    v4 = 0;
    self->_readPastEOS = 1;
  }
  return v4;
}

- (BOOL)pushBack:(char)a3
{
  int pbCursor;
  int v7;
  void *v9;
  void *v10;

  if (self->_readPastEOS)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICSPushbackStream.m"), 64, CFSTR("Cannot push back after reading past EOS"));

  }
  pbCursor = self->_pbCursor;
  v7 = pbCursor + 1;
  self->_pbCursor = pbCursor + 1;
  if (pbCursor >= 15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICSPushbackStream.m"), 66, CFSTR("Cannot push back that much data."));

    v7 = self->_pbCursor;
  }
  self->_pbData[v7] = a3;
  return 1;
}

- (char)read
{
  uint64_t pbCursor;
  char result;

  pbCursor = self->_pbCursor;
  if ((pbCursor & 0x80000000) != 0)
  {
    if (-[ICSInputByteStream eos](self->_underStream, "eos"))
      self->_readPastEOS = 1;
    return -[ICSInputByteStream read](self->_underStream, "read");
  }
  else
  {
    result = self->_pbData[pbCursor];
    self->_pbCursor = pbCursor - 1;
  }
  return result;
}

- (BOOL)eos
{
  if (self->_pbCursor == -1)
    return -[ICSInputByteStream eos](self->_underStream, "eos");
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underStream, 0);
}

@end
