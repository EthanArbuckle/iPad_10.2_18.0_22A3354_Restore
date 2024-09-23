@implementation SKTaskLineParser

+ (NSData)lineData
{
  if (onceToken != -1)
    dispatch_once(&onceToken, &__block_literal_global);
  return (NSData *)(id)_lineData;
}

void __28__SKTaskLineParser_lineData__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_lineData;
  _lineData = v0;

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
  v5 = -[SKTaskLineParser init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTaskLineParser setBuffer:](v5, "setBuffer:", v6);

    -[SKTaskLineParser setCallback:](v5, "setCallback:", v4);
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  -[SKTaskLineParser buffer](self, "buffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendData:", v21);

  -[SKTaskLineParser buffer](self, "buffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    do
    {
      -[SKTaskLineParser buffer](self, "buffer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "lineData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKTaskLineParser buffer](self, "buffer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "rangeOfData:options:range:", v8, 0, 0, objc_msgSend(v9, "length"));

      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      -[SKTaskLineParser buffer](self, "buffer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "subdataWithRange:", 0, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[SKTaskLineParser buffer](self, "buffer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKTaskLineParser buffer](self, "buffer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKTaskLineParser buffer](self, "buffer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "subdataWithRange:", v10 + 1, objc_msgSend(v15, "length") + ~objc_msgSend(v12, "length"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setData:", v16);

      -[SKTaskLineParser callback](self, "callback");
      v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
      ((void (**)(_QWORD, void *))v17)[2](v17, v18);

      -[SKTaskLineParser buffer](self, "buffer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

    }
    while (v20);
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
