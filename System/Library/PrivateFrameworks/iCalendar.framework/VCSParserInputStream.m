@implementation VCSParserInputStream

- (VCSParserInputStream)initWithData:(id)a3
{
  id v5;
  VCSParserInputStream *v6;
  VCSParserInputStream *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VCSParserInputStream;
  v6 = -[VCSParserInputStream init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataStream, a3);

  return v7;
}

- (unint64_t)getLine:(char *)a3 withSize:(unint64_t *)a4
{
  unint64_t v7;
  NSUInteger length;

  if (!self->_dataStream)
    return 1;
  if (!a3)
    return 2;
  if (self->_discardBuffer)
  {
    v7 = -[VCSParserInputStream loadLineBuffer](self, "loadLineBuffer");
    if (v7 == 4)
      return v7;
  }
  else
  {
    v7 = 0;
  }
  length = self->_buffer.length;
  if (*a4 <= length)
  {
    *a4 = length + 1;
    return 3;
  }
  else
  {
    -[NSData getBytes:range:](self->_dataStream, "getBytes:range:", a3, self->_buffer.location);
    a3[self->_buffer.length] = 0;
    self->_discardBuffer = 1;
    if (!v7)
      ++self->_currentLineNum;
  }
  return v7;
}

- (unint64_t)loadLineBuffer
{
  _BYTE *v3;
  unint64_t v4;
  NSUInteger seek;
  NSUInteger v6;
  uint64_t v7;
  int v8;
  NSUInteger v9;
  NSUInteger v11;
  unint64_t result;
  unsigned int v13;

  v3 = -[NSData bytes](self->_dataStream, "bytes");
  v4 = -[NSData length](self->_dataStream, "length");
  seek = self->_seek;
  if (v4 <= seek)
  {
    result = 4;
    v11 = self->_seek;
  }
  else
  {
    v6 = seek + 1;
    v7 = self->_seek;
    while (1)
    {
      v8 = v3[v7];
      self->_seek = v6;
      if (v8 == 10)
      {
        result = 0;
        goto LABEL_13;
      }
      if (v8 == 13)
        break;
      v7 = v6;
      v9 = v6 + 1;
      if (v4 <= v6++)
      {
        v11 = v9 - 1;
        result = 4;
        goto LABEL_14;
      }
    }
    result = 0;
    if (v3[v6] == 10)
      v13 = v6 + 1;
    else
      v13 = v6;
    self->_seek = v13;
LABEL_13:
    v11 = v6 - 1;
  }
LABEL_14:
  self->_buffer.location = seek;
  self->_buffer.length = v11 - seek;
  return result;
}

- (BOOL)isContinued
{
  BOOL result;
  NSUInteger location;
  BOOL v5;
  __int16 v7;
  char v8;
  char v9;

  if (-[VCSParserInputStream loadLineBuffer](self, "loadLineBuffer") == 4)
  {
    result = 0;
    self->_discardBuffer = 1;
    return result;
  }
  self->_discardBuffer = 0;
  if (!self->_buffer.length)
    return 0;
  v9 = 0;
  location = self->_buffer.location;
  if (location >= 6)
  {
    v8 = 0;
    v7 = 0;
    -[NSData getBytes:range:](self->_dataStream, "getBytes:range:", &v8, location - 3, 1);
    -[NSData getBytes:range:](self->_dataStream, "getBytes:range:", (char *)&v7 + 1, self->_buffer.location - 2, 1);
    -[NSData getBytes:range:](self->_dataStream, "getBytes:range:", &v7, self->_buffer.location - 1, 1);
    v5 = v7 == 13 || v7 == 10;
    if (v5 && HIBYTE(v7) == 61 || v7 == 10 && HIBYTE(v7) == 13 && v8 == 61)
      return 1;
    location = self->_buffer.location;
  }
  -[NSData getBytes:range:](self->_dataStream, "getBytes:range:", &v9, location, 1);
  return v9 == 32 || v9 == 9;
}

- (int)lineNum
{
  return self->_currentLineNum;
}

- (id)errorStr:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Unknown error.");
  else
    return off_1E953B2F0[a3 - 1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStream, 0);
}

@end
