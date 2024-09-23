@implementation ISJSONDataProvider

- (ISJSONDataProvider)init
{
  objc_super v4;

  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISJSONDataProvider;
  return -[ISDataProvider init](&v4, sel_init);
}

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  uint64_t v6;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v6 = objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, -[ISJSONDataProvider parserOptions](self, "parserOptions"), &v15);
  if (v6)
  {
    -[ISDataProvider setOutput:](self, "setOutput:", v6);
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    if (!v8)
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_ERROR))
      v10 &= 2u;
    if (v10)
    {
      v11 = objc_opt_class();
      v16 = 138412546;
      v17 = v11;
      v18 = 2112;
      v19 = v15;
      LODWORD(v14) = 22;
      v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        v13 = (void *)v12;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v16, v14);
        free(v13);
        SSFileLog();
      }
    }
  }
  if (a4)
    *a4 = v15;
  return v6 != 0;
}

- (unint64_t)parserOptions
{
  return self->_options;
}

- (void)setParserOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end
