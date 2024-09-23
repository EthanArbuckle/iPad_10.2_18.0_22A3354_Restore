@implementation SKTaskLineParser

+ (NSData)lineData
{
  if (qword_100051A80 != -1)
    dispatch_once(&qword_100051A80, &stru_100044CC8);
  return (NSData *)(id)qword_100051A78;
}

- (SKTaskLineParser)initWithCallback:(id)a3
{
  id v4;
  SKTaskLineParser *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKTaskLineParser;
  v5 = -[SKTaskLineParser init](&v8, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    -[SKTaskLineParser setBuffer:](v5, "setBuffer:", v6);

    -[SKTaskLineParser setCallback:](v5, "setCallback:", v4);
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
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  id v19;
  void *v20;
  id v21;
  id v22;

  v22 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
  objc_msgSend(v4, "appendData:", v22);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
      v8 = objc_msgSend((id)objc_opt_class(self), "lineData");
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
      v11 = (char *)objc_msgSend(v7, "rangeOfData:options:range:", v9, 0, 0, objc_msgSend(v10, "length"));

      if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL)
        break;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subdataWithRange:", 0, v11));

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subdataWithRange:", v11 + 1, (char *)objc_msgSend(v16, "length") + ~(unint64_t)objc_msgSend(v13, "length")));
      objc_msgSend(v14, "setData:", v17);

      v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SKTaskLineParser callback](self, "callback"));
      v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v13, 4);
      ((void (**)(_QWORD, id))v18)[2](v18, v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKTaskLineParser buffer](self, "buffer"));
      v21 = objc_msgSend(v20, "length");

    }
    while (v21);
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
