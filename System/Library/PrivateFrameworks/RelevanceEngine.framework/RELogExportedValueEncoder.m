@implementation RELogExportedValueEncoder

+ (id)_dateFormatter
{
  if (_dateFormatter_onceToken_68 != -1)
    dispatch_once(&_dateFormatter_onceToken_68, &__block_literal_global_69);
  return (id)_dateFormatter_DateFormatter_67;
}

uint64_t __43__RELogExportedValueEncoder__dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  v1 = (void *)_dateFormatter_DateFormatter_67;
  _dateFormatter_DateFormatter_67 = (uint64_t)v0;

  return objc_msgSend((id)_dateFormatter_DateFormatter_67, "setFormatOptions:", 2035);
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

- (void)writeString:(id)a3 toStream:(id)a4
{
  objc_msgSend(a4, "re_writeString:", a3);
}

- (void)writeNumber:(id)a3 toStream:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a3, "stringValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "re_writeString:", v6);

}

- (void)writeNullToStream:(id)a3
{
  objc_msgSend(a3, "re_writeString:", CFSTR("(null)"));
}

- (void)writeObjectStart:(id)a3 toStream:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  +[RESingleton sharedInstance](REInterfaceCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "exportedInterfaceClass:", objc_opt_class());

  if (v7)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), v9);
  else
    objc_msgSend(v9, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "re_writeString:", v8);

}

- (void)writeDictionaryValuePairToStream:(id)a3 keyWriter:(id)a4 valueWriter:(id)a5 isLast:(BOOL)a6
{
  void (*v8)(id);
  void (**v9)(_QWORD);
  id v10;

  v8 = (void (*)(id))*((_QWORD *)a4 + 2);
  v9 = (void (**)(_QWORD))a5;
  v10 = a3;
  v8(a4);
  objc_msgSend(v10, "re_writeString:", CFSTR("="));
  v9[2](v9);

  objc_msgSend(v10, "re_writeString:", CFSTR(" "));
}

- (void)writeArrayValuePairToStream:(id)a3 valueWriter:(id)a4 isLast:(BOOL)a5
{
  void (*v6)(id);
  id v7;

  v6 = (void (*)(id))*((_QWORD *)a4 + 2);
  v7 = a3;
  v6(a4);
  objc_msgSend(v7, "re_writeString:", CFSTR(" "));

}

@end
