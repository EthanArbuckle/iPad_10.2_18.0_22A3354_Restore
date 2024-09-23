@implementation REStandardizedTokenBuffer

- (REStandardizedTokenBuffer)initWithTokenBuffer:(id)a3
{
  id v5;
  REStandardizedTokenBuffer *v6;
  REStandardizedTokenBuffer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REStandardizedTokenBuffer;
  v6 = -[REStandardizedTokenBuffer init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_buffer, a3);
    -[REStandardizedTokenBuffer _cleanTokens](v7, "_cleanTokens");
  }

  return v7;
}

- (void)_cleanTokens
{
  unint64_t v3;
  id v5;

  if ((-[RETokenBuffer isEmpty](self->_buffer, "isEmpty") & 1) == 0)
  {
    while (1)
    {
      -[RETokenBuffer currentToken](self->_buffer, "currentToken");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v5, "type");
      if (v3 > 8 || ((1 << v3) & 0x182) == 0)
        break;
      -[RETokenBuffer next](self->_buffer, "next");

      if ((-[RETokenBuffer isEmpty](self->_buffer, "isEmpty") & 1) != 0)
        return;
    }

  }
}

- (BOOL)isEmpty
{
  return -[RETokenBuffer isEmpty](self->_buffer, "isEmpty");
}

- (REScriptToken)currentToken
{
  return (REScriptToken *)-[RETokenBuffer currentToken](self->_buffer, "currentToken");
}

- (void)next
{
  -[RETokenBuffer next](self->_buffer, "next");
  -[REStandardizedTokenBuffer _cleanTokens](self, "_cleanTokens");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
