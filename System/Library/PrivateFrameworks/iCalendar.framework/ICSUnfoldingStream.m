@implementation ICSUnfoldingStream

- (ICSUnfoldingStream)initWithInputStream:(id)a3
{
  id v5;
  ICSUnfoldingStream *v6;
  ICSUnfoldingStream *v7;
  ICSUnfoldingStream *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICSUnfoldingStream;
  v6 = -[ICSUnfoldingStream init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_underStream, a3);
    -[ICSUnfoldingStream _readTwo](v7, "_readTwo");
  }
  v8 = v7;
LABEL_6:

  return v8;
}

- (char)read
{
  int char1;
  int v4;
  int v5;
  int char2;

  while (1)
  {
    while (1)
    {
      char1 = self->_char1;
      if (char1 == 10)
        break;
      if (char1 != 13 || self->_char2 != 10)
        goto LABEL_16;
      v4 = -[ICSInputByteStream read](self->_underStream, "read");
      v5 = v4;
      if (v4 == 32 || v4 == 9)
      {
        -[ICSUnfoldingStream _readTwo](self, "_readTwo");
      }
      else
      {
        self->_char1 = 10;
        self->_char2 = v4;
      }
      if (v5 != 9 && v5 != 32)
        return char1;
    }
    char2 = self->_char2;
    if (char2 != 9 && char2 != 32)
      break;
    -[ICSUnfoldingStream _readTwo](self, "_readTwo");
  }
LABEL_16:
  -[ICSUnfoldingStream _shiftRead](self, "_shiftRead");
  return char1;
}

- (void)_readTwo
{
  self->_char1 = -[ICSInputByteStream read](self->_underStream, "read");
  self->_char2 = -[ICSInputByteStream read](self->_underStream, "read");
}

- (void)_shiftRead
{
  self->_char1 = self->_char2;
  self->_char2 = -[ICSInputByteStream read](self->_underStream, "read");
}

- (BOOL)eos
{
  if (self->_char1 || self->_char2)
    return 0;
  else
    return -[ICSInputByteStream eos](self->_underStream, "eos");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underStream, 0);
}

@end
