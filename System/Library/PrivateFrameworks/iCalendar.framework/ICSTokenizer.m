@implementation ICSTokenizer

- (ICSTokenizer)initWithData:(id)a3
{
  id v3;
  ICSTokenizer *v4;
  ICSPushbackStream *v5;
  ICSUnfoldingStream *v6;
  ICSInputData *v7;
  ICSInputData *v8;
  ICSUnfoldingStream *v9;
  uint64_t v10;
  ICSPushbackStream *data;
  uint64_t v12;
  NSMutableData *token;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ICSTokenizer;
  v3 = a3;
  v4 = -[ICSTokenizer init](&v15, sel_init);
  v5 = [ICSPushbackStream alloc];
  v6 = [ICSUnfoldingStream alloc];
  v7 = [ICSInputData alloc];
  v8 = -[ICSInputData initWithData:](v7, "initWithData:", v3, v15.receiver, v15.super_class);

  v9 = -[ICSUnfoldingStream initWithInputStream:](v6, "initWithInputStream:", v8);
  v10 = -[ICSPushbackStream initWithInputStream:](v5, "initWithInputStream:", v9);
  data = v4->_data;
  v4->_data = (ICSPushbackStream *)v10;

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 512);
  token = v4->_token;
  v4->_token = (NSMutableData *)v12;

  return v4;
}

- (ICSTokenizer)initWithCompressedData:(id)a3
{
  id v3;
  ICSTokenizer *v4;
  ICSPushbackStream *v5;
  ICSUnfoldingStream *v6;
  ICSCompressedInputStream *v7;
  ICSCompressedInputStream *v8;
  ICSUnfoldingStream *v9;
  uint64_t v10;
  ICSPushbackStream *data;
  uint64_t v12;
  NSMutableData *token;
  ICSTokenizer *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ICSTokenizer;
  v3 = a3;
  v4 = -[ICSTokenizer init](&v16, sel_init);
  v5 = [ICSPushbackStream alloc];
  v6 = [ICSUnfoldingStream alloc];
  v7 = [ICSCompressedInputStream alloc];
  v8 = -[ICSCompressedInputStream initWithData:](v7, "initWithData:", v3, v16.receiver, v16.super_class);

  v9 = -[ICSUnfoldingStream initWithInputStream:](v6, "initWithInputStream:", v8);
  v10 = -[ICSPushbackStream initWithInputStream:](v5, "initWithInputStream:", v9);
  data = v4->_data;
  v4->_data = (ICSPushbackStream *)v10;

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 512);
  token = v4->_token;
  v4->_token = (NSMutableData *)v12;

  if (v4->_data)
    v14 = v4;
  else
    v14 = 0;

  return v14;
}

- (BOOL)consumeChar:(char)a3
{
  int v3;
  uint64_t v5;

  v3 = a3;
  v5 = -[ICSPushbackStream read](self->_data, "read");
  if (!-[ICSPushbackStream eos](self->_data, "eos"))
  {
    if ((_DWORD)v5 == v3)
      return 1;
    -[ICSPushbackStream pushBack:](self->_data, "pushBack:", v5);
  }
  return 0;
}

- (BOOL)consumeEOL
{
  int v3;
  uint64_t v5;
  uint64_t v7;

  v3 = -[ICSPushbackStream peek](self->_data, "peek");
  if (v3 == 13 || v3 == 10)
  {
    -[ICSPushbackStream read](self->_data, "read");
    v5 = -[ICSPushbackStream read](self->_data, "read");
    if ((_DWORD)v5 != 10 && v5 != 13)
    {
      v7 = v5;
      if (!-[ICSPushbackStream eos](self->_data, "eos"))
        -[ICSPushbackStream pushBack:](self->_data, "pushBack:", v7);
    }
  }
  return v3 == 13 || v3 == 10;
}

- (void)consumeWhiteSpace
{
  while (-[ICSTokenizer consumeEOL](self, "consumeEOL"))
    ;
}

- (void)consumePropName
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v9;
  char v10;

  -[ICSTokenizer consumeWhiteSpace](self, "consumeWhiteSpace");
  -[NSMutableData setLength:](self->_token, "setLength:", 0);
  if (-[ICSPushbackStream eos](self->_data, "eos"))
  {
    self->_tokenType = 5;
  }
  else if (-[ICSPushbackStream eos](self->_data, "eos"))
  {
LABEL_20:
    *(_QWORD *)&self->_tokenType = 0x500000004;
    -[NSMutableData setLength:](self->_token, "setLength:", 0);
  }
  else
  {
    v3 = MEMORY[0x1E0C80978];
    while (1)
    {
      v10 = 0;
      v4 = -[ICSPushbackStream read](self->_data, "read");
      v5 = v4;
      v10 = v4;
      if ((_DWORD)v4 == 58)
      {
        v9 = 1;
        goto LABEL_23;
      }
      if (v4 == 59)
        break;
      if ((v4 & 0x80000000) != 0)
        v6 = __maskrune(v4, 0x100uLL);
      else
        v6 = *(_DWORD *)(v3 + 4 * v4 + 60) & 0x100;
      if (v5 != 45 && v6 == 0 && (v5 - 48) >= 0xA)
        +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, self, CFSTR("Invalid char \"%c\" for PropertyName. Parsed token:(%@)"), v10, self->_token);
      else
        -[NSMutableData appendBytes:length:](self->_token, "appendBytes:length:", &v10, 1);
      if (-[ICSPushbackStream eos](self->_data, "eos"))
        goto LABEL_20;
    }
    v9 = 2;
LABEL_23:
    self->_tokenType = 0;
    self->_expectedNextTokenType = v9;
    -[ICSPushbackStream pushBack:](self->_data, "pushBack:", v4);
  }
}

- (void)consumeParamName
{
  int v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  char v10;

  -[NSMutableData setLength:](self->_token, "setLength:", 0);
  v3 = -[ICSPushbackStream read](self->_data, "read");
  if (-[ICSPushbackStream eos](self->_data, "eos") || v3 != 59)
  {
    self->_tokenType = 5;
  }
  else if (-[ICSPushbackStream eos](self->_data, "eos"))
  {
LABEL_19:
    +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 4, self, CFSTR("Parameter name expected, but found EOF (%@)"), self->_token);
    *(_QWORD *)&self->_tokenType = 0x500000005;
    -[NSMutableData setLength:](self->_token, "setLength:", 0);
  }
  else
  {
    v4 = MEMORY[0x1E0C80978];
    while (1)
    {
      v10 = 0;
      v5 = -[ICSPushbackStream read](self->_data, "read");
      v10 = v5;
      if (v5 == 61)
        break;
      v6 = v5;
      if ((v5 & 0x80000000) != 0)
        v7 = __maskrune(v5, 0x100uLL);
      else
        v7 = *(_DWORD *)(v4 + 4 * v5 + 60) & 0x100;
      if (v6 != 45 && v7 == 0 && v6 - 48 >= 0xA)
        +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, self, CFSTR("Invalid char \"%c\" for ParamName. Parsed token:(%@)"), v10, self->_token);
      else
        -[NSMutableData appendBytes:length:](self->_token, "appendBytes:length:", &v10, 1);
      if (-[ICSPushbackStream eos](self->_data, "eos"))
        goto LABEL_19;
    }
    *(_QWORD *)&self->_tokenType = 0x300000002;
    -[ICSPushbackStream pushBack:](self->_data, "pushBack:", 61);
  }
}

- (BOOL)consumeEscaped:(const char *)a3
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  ICSPushbackStream *data;
  uint64_t v9;

  v5 = -[ICSPushbackStream peek](self->_data, "peek");
  if (*(unsigned __int8 *)a3 == v5)
  {
    v6 = v5;
    -[ICSPushbackStream read](self->_data, "read");
    v7 = -[ICSPushbackStream eos](self->_data, "eos");
    data = self->_data;
    if (!v7)
    {
      v9 = -[ICSPushbackStream read](data, "read");
      if (*((unsigned __int8 *)a3 + 1) == v9)
        return 1;
      -[ICSPushbackStream pushBack:](self->_data, "pushBack:", v9);
      data = self->_data;
    }
    -[ICSPushbackStream pushBack:](data, "pushBack:", v6);
  }
  return 0;
}

- (void)consumeParamValue
{
  char v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  char v9;
  NSMutableData *token;
  char *v11;
  NSMutableData *v12;
  char *v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  unsigned __int8 v20;

  -[NSMutableData setLength:](self->_token, "setLength:", 0);
  if (!-[ICSTokenizer consumeChar:](self, "consumeChar:", 61))
  {
    self->_tokenType = 5;
    return;
  }
  v20 = 0;
  v3 = 0;
  if (!-[ICSPushbackStream eos](self->_data, "eos"))
  {
    v4 = -[ICSPushbackStream read](self->_data, "read");
    v20 = v4;
    if ((_DWORD)v4 == 34)
    {
      v3 = 1;
    }
    else
    {
      -[ICSPushbackStream pushBack:](self->_data, "pushBack:", v4);
      v3 = 0;
    }
  }
  if (-[ICSPushbackStream eos](self->_data, "eos"))
  {
LABEL_8:
    +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 4, self, CFSTR("Parameter value expected, but found EOF (%@)"), self->_token);
    v5 = 5;
    v6 = 28;
    v7 = 24;
    v8 = 5;
    goto LABEL_9;
  }
  v9 = 0;
  while (1)
  {
    v20 = -[ICSPushbackStream peek](self->_data, "peek");
    if (!-[ICSTokenizer consumeEscaped:](self, "consumeEscaped:", "\\\"))
      break;
    if ((v9 & 1) != 0)
      goto LABEL_32;
    v19 = 34;
    token = self->_token;
    v11 = &v19;
LABEL_18:
    -[NSMutableData appendBytes:length:](token, "appendBytes:length:", v11, 1);
LABEL_19:
    v9 = 0;
LABEL_33:
    if (-[ICSPushbackStream eos](self->_data, "eos"))
      goto LABEL_8;
  }
  if (-[ICSTokenizer consumeEscaped:](self, "consumeEscaped:", "\\\\"))
  {
    if ((v9 & 1) != 0)
      goto LABEL_32;
    v18 = 92;
    token = self->_token;
    v11 = &v18;
    goto LABEL_18;
  }
  if ((v3 & 1) != 0)
    goto LABEL_21;
  if (-[ICSTokenizer consumeEscaped:](self, "consumeEscaped:", "\\n")
    || -[ICSTokenizer consumeEscaped:](self, "consumeEscaped:", "\\N"))
  {
    if ((v9 & 1) != 0)
      goto LABEL_31;
    v17 = 10;
    v12 = self->_token;
    v13 = &v17;
LABEL_28:
    -[NSMutableData appendBytes:length:](v12, "appendBytes:length:", v13, 1);
    v3 = 0;
    goto LABEL_19;
  }
  if (-[ICSTokenizer consumeEscaped:](self, "consumeEscaped:", "\\;"))
  {
    if ((v9 & 1) != 0)
      goto LABEL_31;
    v16 = 59;
    v12 = self->_token;
    v13 = &v16;
    goto LABEL_28;
  }
  if (-[ICSTokenizer consumeEscaped:](self, "consumeEscaped:", "\\:"))
  {
    if ((v9 & 1) != 0)
      goto LABEL_31;
    v15 = 59;
    v12 = self->_token;
    v13 = &v15;
    goto LABEL_28;
  }
  if (-[ICSTokenizer consumeEscaped:](self, "consumeEscaped:", "\\,"))
  {
    if ((v9 & 1) != 0)
      goto LABEL_31;
    v14 = 44;
    v12 = self->_token;
    v13 = &v14;
    goto LABEL_28;
  }
  if ((v20 & 0xFE) != 0x3A)
  {
LABEL_21:
    if ((v9 & 1) != 0)
    {
      -[ICSPushbackStream read](self->_data, "read");
      if (-[ICSTokenizer consumeEOL](self, "consumeEOL"))
        goto LABEL_65;
      goto LABEL_32;
    }
    if ((v3 & (v20 == 34)) == 1)
    {
      -[ICSPushbackStream read](self->_data, "read");
LABEL_31:
      v3 = 0;
LABEL_32:
      v9 = 1;
      goto LABEL_33;
    }
    if ((v3 & 1) != 0)
    {
      if (v20 <= 0x21u && ((1 << v20) & 0x300000200) != 0 || (char)v20 < -7 || v20 - 35 < 0x5C)
      {
LABEL_46:
        -[NSMutableData appendBytes:length:](self->_token, "appendBytes:length:", &v20, 1);
        v9 = 0;
LABEL_47:
        -[ICSPushbackStream read](self->_data, "read");
        goto LABEL_33;
      }
    }
    else if (v20 <= 0x21u && ((1 << v20) & 0x300000200) != 0
           || (char)v20 < -7
           || v20 - 60 < 0x43
           || v20 - 35 < 9
           || v20 - 45 < 0xD)
    {
      goto LABEL_46;
    }
    if (-[ICSTokenizer consumeEOL](self, "consumeEOL"))
    {
LABEL_65:
      -[NSMutableData setLength:](self->_token, "setLength:", 0);
      -[NSMutableData appendBytes:length:](self->_token, "appendBytes:length:", "ERROR", 5);
      v8 = 6;
      v5 = 3;
      v6 = 28;
      v7 = 24;
      goto LABEL_9;
    }
    v9 = 1;
    goto LABEL_47;
  }
  if (v20 == 58)
    v5 = 1;
  else
    v5 = 2;
  v8 = 3;
  v6 = 24;
  v7 = 28;
LABEL_9:
  *(_DWORD *)((char *)&self->super.isa + v7) = v5;
  *(_DWORD *)((char *)&self->super.isa + v6) = v8;
}

- (void)consumePropValue
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  -[ICSTokenizer consumeChar:](self, "consumeChar:", 58);
  -[NSMutableData setLength:](self->_token, "setLength:", 0);
  if (-[ICSPushbackStream eos](self->_data, "eos"))
  {
LABEL_2:
    +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 4, self, CFSTR("Unexpected EOF, returning last token as fallback"));
    v3 = 0x500000001;
  }
  else
  {
    while (1)
    {
      v5 = 0;
      v5 = -[ICSPushbackStream peek](self->_data, "peek");
      if (-[ICSTokenizer consumeEOL](self, "consumeEOL"))
        break;
      if (v5 == 9 || v5 == 32 || (v4 = v5, (int)v4 < -7) || (v5 - 33) < 0x5Eu)
        -[NSMutableData appendBytes:length:](self->_token, "appendBytes:length:", &v5, 1);
      else
        +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, self, CFSTR("Invalid char \"%c\" for PropertyValue. Parsed token:(%@)"), v4, self->_token);
      -[ICSPushbackStream read](self->_data, "read");
      if (-[ICSPushbackStream eos](self->_data, "eos"))
        goto LABEL_2;
    }
    v3 = 1;
  }
  *(_QWORD *)&self->_tokenType = v3;
}

- (id)nextToken
{
  void *v3;

  switch(self->_expectedNextTokenType)
  {
    case 0:
      -[ICSTokenizer consumePropName](self, "consumePropName");
      break;
    case 1:
      -[ICSTokenizer consumePropValue](self, "consumePropValue");
      break;
    case 2:
      -[ICSTokenizer consumeParamName](self, "consumeParamName");
      break;
    case 3:
      -[ICSTokenizer consumeParamValue](self, "consumeParamValue");
      break;
    case 4:
    case 5:
      -[NSMutableData setLength:](self->_token, "setLength:", 0);
      self->_tokenType = 5;
      break;
    case 6:
      -[NSMutableData setLength:](self->_token, "setLength:", 0);
      -[NSMutableData appendBytes:length:](self->_token, "appendBytes:length:", "ERROR", 5);
      *(_QWORD *)&self->_tokenType = 1;
      break;
    default:
      break;
  }
  if (self->_tokenType == 5)
    v3 = 0;
  else
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_token, 4);
  return v3;
}

- (id)currentToken
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_token, 4);
}

- (int)tokenType
{
  return self->_tokenType;
}

- (BOOL)printedICS
{
  return self->_printedICS;
}

- (void)setPrintedICS:(BOOL)a3
{
  self->_printedICS = a3;
}

- (int)logCount
{
  return self->_logCount;
}

- (void)setLogCount:(int)a3
{
  self->_logCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
