@implementation TMLParserToken

- (TMLParserToken)initWithToken:(unint64_t)a3 text:(id)a4
{
  id v6;
  TMLParserToken *v7;
  const char *v8;
  double v9;
  TMLParserToken *v10;
  uint64_t v11;
  NSString *text;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TMLParserToken;
  v7 = -[TMLParserToken init](&v14, sel_init);
  v10 = v7;
  if (v7)
  {
    v7->_token = a3;
    if (v6)
    {
      v11 = objc_msgSend_copy(v6, v8, v9);
      text = v10->_text;
      v10->_text = (NSString *)v11;
    }
    else
    {
      text = v7->_text;
      v7->_text = (NSString *)&stru_24F505EA8;
    }

  }
  return v10;
}

- (id)description
{
  double v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, v2, CFSTR("<%u: %@>"), self->_token, self->_text);
}

- (unint64_t)token
{
  return self->_token;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
