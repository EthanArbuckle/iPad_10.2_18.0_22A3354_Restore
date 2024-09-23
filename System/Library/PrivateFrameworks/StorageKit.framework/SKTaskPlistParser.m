@implementation SKTaskPlistParser

+ (NSData)plistStartTag
{
  if (plistStartTag_onceTokenStart != -1)
    dispatch_once(&plistStartTag_onceTokenStart, &__block_literal_global_71);
  return (NSData *)(id)plistStartTag__plistStartTag;
}

void __34__SKTaskPlistParser_plistStartTag__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(CFSTR("<plist"), "dataUsingEncoding:", 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)plistStartTag__plistStartTag;
  plistStartTag__plistStartTag = v0;

}

+ (NSData)plistEndTag
{
  if (plistEndTag_onceTokenEnd != -1)
    dispatch_once(&plistEndTag_onceTokenEnd, &__block_literal_global_74);
  return (NSData *)(id)plistEndTag__plistEndTag;
}

void __32__SKTaskPlistParser_plistEndTag__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(CFSTR("</plist>"), "dataUsingEncoding:", 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)plistEndTag__plistEndTag;
  plistEndTag__plistEndTag = v0;

}

- (SKTaskPlistParser)initWithCallback:(id)a3
{
  id v4;
  SKTaskPlistParser *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKTaskPlistParser;
  v5 = -[SKTaskPlistParser init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTaskPlistParser setBuffer:](v5, "setBuffer:", v6);

    -[SKTaskPlistParser setCallback:](v5, "setCallback:", v4);
    -[SKTaskPlistParser setStartRange:](v5, "setStartRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  }

  return v5;
}

- (void)parseData:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD);
  void *v27;
  uint64_t v28;
  id v29;

  v29 = a3;
  -[SKTaskPlistParser buffer](self, "buffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendData:", v29);

  -[SKTaskPlistParser buffer](self, "buffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    do
    {
      if (-[SKTaskPlistParser startRange](self, "startRange") == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[SKTaskPlistParser buffer](self, "buffer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "plistStartTag");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKTaskPlistParser buffer](self, "buffer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "rangeOfData:options:range:", v8, 0, 0, objc_msgSend(v9, "length"));
        -[SKTaskPlistParser setStartRange:](self, "setStartRange:", v10, v11);

        if (-[SKTaskPlistParser startRange](self, "startRange") == 0x7FFFFFFFFFFFFFFFLL)
          break;
      }
      -[SKTaskPlistParser buffer](self, "buffer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "plistEndTag");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKTaskPlistParser buffer](self, "buffer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v12, "rangeOfData:options:range:", v13, 0, 0, objc_msgSend(v14, "length"));
      v17 = v16;

      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      -[SKTaskPlistParser buffer](self, "buffer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v15 + v17;
      objc_msgSend(v18, "subdataWithRange:", -[SKTaskPlistParser startRange](self, "startRange"), v15 + v17 - -[SKTaskPlistParser startRange](self, "startRange"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v20, 0, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        -[SKTaskPlistParser buffer](self, "buffer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKTaskPlistParser buffer](self, "buffer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKTaskPlistParser buffer](self, "buffer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "subdataWithRange:", v19 + 1, objc_msgSend(v24, "length") + ~v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setData:", v25);

        -[SKTaskPlistParser setStartRange:](self, "setStartRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
        -[SKTaskPlistParser callback](self, "callback");
        v26 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v26)[2](v26, v21);

      }
      -[SKTaskPlistParser buffer](self, "buffer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "length");

    }
    while (v28);
  }

}

- (NSMutableData)buffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (_NSRange)startRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_startRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setStartRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_startRange, &v3, 16, 1, 0);
}

- (id)callback
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
