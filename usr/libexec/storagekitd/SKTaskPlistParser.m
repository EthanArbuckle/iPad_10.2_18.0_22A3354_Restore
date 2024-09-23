@implementation SKTaskPlistParser

+ (NSData)plistStartTag
{
  if (qword_100051A90 != -1)
    dispatch_once(&qword_100051A90, &stru_100044CE8);
  return (NSData *)(id)qword_100051A88;
}

+ (NSData)plistEndTag
{
  if (qword_100051AA0 != -1)
    dispatch_once(&qword_100051AA0, &stru_100044D08);
  return (NSData *)(id)qword_100051A98;
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
  v5 = -[SKTaskPlistParser init](&v8, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
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
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD);
  void *v29;
  id v30;
  id v31;

  v31 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
  objc_msgSend(v4, "appendData:", v31);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    do
    {
      if (-[SKTaskPlistParser startRange](self, "startRange") == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
        v8 = objc_msgSend((id)objc_opt_class(self), "plistStartTag");
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
        v11 = objc_msgSend(v7, "rangeOfData:options:range:", v9, 0, 0, objc_msgSend(v10, "length"));
        -[SKTaskPlistParser setStartRange:](self, "setStartRange:", v11, v12);

        if (-[SKTaskPlistParser startRange](self, "startRange") == (id)0x7FFFFFFFFFFFFFFFLL)
          break;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
      v14 = objc_msgSend((id)objc_opt_class(self), "plistEndTag");
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
      v17 = objc_msgSend(v13, "rangeOfData:options:range:", v15, 0, 0, objc_msgSend(v16, "length"));
      v19 = v18;

      if (v17 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
        break;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
      v21 = (unint64_t)&v17[v19];
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subdataWithRange:", -[SKTaskPlistParser startRange](self, "startRange"), &v17[v19] - (_BYTE *)-[SKTaskPlistParser startRange](self, "startRange")));

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v22, 0, 0, 0));
      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "subdataWithRange:", v21 + 1, (char *)objc_msgSend(v26, "length") + ~v21));
        objc_msgSend(v24, "setData:", v27);

        -[SKTaskPlistParser setStartRange:](self, "setStartRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
        v28 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser callback](self, "callback"));
        ((void (**)(_QWORD, void *))v28)[2](v28, v23);

      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskPlistParser buffer](self, "buffer"));
      v30 = objc_msgSend(v29, "length");

    }
    while (v30);
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
