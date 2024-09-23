@implementation REJSONExportedValueEncoder

+ (id)_dateFormatter
{
  if (_dateFormatter_onceToken != -1)
    dispatch_once(&_dateFormatter_onceToken, &__block_literal_global_4);
  return (id)_dateFormatter_DateFormatter;
}

uint64_t __44__REJSONExportedValueEncoder__dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  v1 = (void *)_dateFormatter_DateFormatter;
  _dateFormatter_DateFormatter = (uint64_t)v0;

  return objc_msgSend((id)_dateFormatter_DateFormatter, "setFormatOptions:", 1907);
}

- (void)writeDate:(id)a3 toStream:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_dateFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "re_writeString:", v8);
}

- (void)_writeValueAsJSON:(id)a3 toStream:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD1608];
  v15 = a3;
  v7 = (void *)MEMORY[0x24BDBCE30];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataWithJSONObject:options:error:", v9, 0, 0, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x24BDD17C8]);
  v12 = (void *)objc_msgSend(v11, "initWithData:encoding:", v10, 4);
  v13 = objc_msgSend(v12, "length");
  if (v13 >= 3)
  {
    objc_msgSend(v12, "substringWithRange:", 1, v13 - 2);
    v14 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "re_writeString:", v14);
    v12 = (void *)v14;
  }

}

- (void)writeNullToStream:(id)a3
{
  objc_msgSend(a3, "re_writeString:", CFSTR("null"));
}

- (void)writeObjectStart:(id)a3 toStream:(id)a4
{
  -[REJSONExportedValueEncoder writeDictionaryStartToStream:](self, "writeDictionaryStartToStream:", a4);
}

- (void)writeObjectEnd:(id)a3 toStream:(id)a4
{
  -[REJSONExportedValueEncoder writeDictionaryEndToStream:](self, "writeDictionaryEndToStream:", a4);
}

- (BOOL)writesDictionaryHeader
{
  return 1;
}

- (void)writeDictionaryStartToStream:(id)a3
{
  objc_msgSend(a3, "re_writeString:", CFSTR("{"));
}

- (void)writeDictionaryEndToStream:(id)a3
{
  objc_msgSend(a3, "re_writeString:", CFSTR("}"));
}

- (void)writeDictionaryValuePairToStream:(id)a3 keyWriter:(id)a4 valueWriter:(id)a5 isLast:(BOOL)a6
{
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  id v11;

  v11 = a3;
  v9 = (void (**)(_QWORD))a5;
  v10 = (void (**)(_QWORD))a4;
  objc_msgSend(v11, "re_writeString:", CFSTR("\"));
  v10[2](v10);

  objc_msgSend(v11, "re_writeString:", CFSTR("\"));
  objc_msgSend(v11, "re_writeString:", CFSTR(":"));
  v9[2](v9);

  if (!a6)
    objc_msgSend(v11, "re_writeString:", CFSTR(","));

}

- (BOOL)writesArrayHeader
{
  return 1;
}

- (void)writeArrayStartToStream:(id)a3
{
  objc_msgSend(a3, "re_writeString:", CFSTR("["));
}

- (void)writeArrayEndToStream:(id)a3
{
  objc_msgSend(a3, "re_writeString:", CFSTR("]"));
}

- (void)writeArrayValuePairToStream:(id)a3 valueWriter:(id)a4 isLast:(BOOL)a5
{
  id v7;

  v7 = a3;
  (*((void (**)(id))a4 + 2))(a4);
  if (!a5)
    objc_msgSend(v7, "re_writeString:", CFSTR(","));

}

@end
