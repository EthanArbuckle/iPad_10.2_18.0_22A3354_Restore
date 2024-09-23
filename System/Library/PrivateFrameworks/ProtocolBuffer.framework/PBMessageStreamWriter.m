@implementation PBMessageStreamWriter

- (PBMessageStreamWriter)initWithOutputStream:(id)a3
{
  id v5;
  PBMessageStreamWriter *v6;
  PBMessageStreamWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBMessageStreamWriter;
  v6 = -[PBMessageStreamWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_stream, a3);

  return v7;
}

- (BOOL)writeMessage:(id)a3
{
  void *v4;
  unint64_t v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  NSOutputStream *stream;
  id v10;
  uint64_t v11;
  BOOL v12;
  _BYTE v14[10];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v6 = v14;
  if (v5 < 0x80)
  {
    LOBYTE(v7) = v5;
  }
  else
  {
    do
    {
      *v6++ = v5 | 0x80;
      v7 = v5 >> 7;
      v8 = v5 >> 14;
      v5 >>= 7;
    }
    while (v8);
  }
  *v6 = v7;
  if (-[NSOutputStream write:maxLength:](self->_stream, "write:maxLength:", v14, v6 - v14 + 1) == v6 - v14 + 1)
  {
    if (objc_msgSend(v4, "length"))
    {
      stream = self->_stream;
      v10 = objc_retainAutorelease(v4);
      v11 = -[NSOutputStream write:maxLength:](stream, "write:maxLength:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
      v12 = v11 == objc_msgSend(v10, "length");
    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
