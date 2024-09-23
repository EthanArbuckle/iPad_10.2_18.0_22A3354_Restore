@implementation AnalyticsCSVWriter

- (AnalyticsCSVWriter)initWithOutputStream:(id)a3
{
  id v5;
  AnalyticsCSVWriter *v6;
  AnalyticsCSVWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AnalyticsCSVWriter;
  v6 = -[AnalyticsCSVWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputStream, a3);
    -[NSOutputStream open](v7->_outputStream, "open");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOutputStream close](self->_outputStream, "close");
  v3.receiver = self;
  v3.super_class = (Class)AnalyticsCSVWriter;
  -[AnalyticsCSVWriter dealloc](&v3, sel_dealloc);
}

- (void)writeField:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSOutputStream *outputStream;
  id v9;
  id v10;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), CFSTR("\",\"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("\"\"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\"%@\"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  outputStream = self->_outputStream;
  v9 = objc_retainAutorelease(v7);
  -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));

}

- (void)writeFields:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[AnalyticsCSVWriter writeField:](self, "writeField:", v9);
        objc_msgSend(v4, "lastObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v9) = objc_msgSend(v10, "isEqual:", v9);

        if ((v9 & 1) == 0)
          -[AnalyticsCSVWriter writeComma](self, "writeComma");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)finishLine
{
  void *v3;
  NSOutputStream *outputStream;
  id v5;

  objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  outputStream = self->_outputStream;
  v5 = objc_retainAutorelease(v3);
  -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));

}

- (void)writeComma
{
  void *v3;
  NSOutputStream *outputStream;
  id v5;

  objc_msgSend(CFSTR(","), "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  outputStream = self->_outputStream;
  v5 = objc_retainAutorelease(v3);
  -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStream, 0);
}

@end
