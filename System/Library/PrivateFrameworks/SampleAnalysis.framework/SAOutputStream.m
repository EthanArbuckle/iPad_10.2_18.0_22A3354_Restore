@implementation SAOutputStream

- (int)printWithFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v8);

  LODWORD(self) = -[SAOutputStream appendString:](self, "appendString:", v6);
  return (int)self;
}

- (int)appendString:(id)a3
{
  id v4;
  size_t v5;
  size_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 4);
  if (v5)
  {
    v6 = v5;
    v7 = malloc_type_malloc(v5, 0xA9CE6BE9uLL);
    if (objc_msgSend(v4, "getCString:maxLength:encoding:", v7, v6, 4))
    {
      v8 = -[SAOutputStream write:maxLength:](self, "write:maxLength:", v7, v6);
    }
    else
    {
      v9 = (void *)MEMORY[0x1BCCCC288]();
      objc_msgSend(v4, "dataUsingEncoding:allowLossyConversion:", 4, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v8 = -[SAOutputStream appendData:](self, "appendData:", v10);
      else
        v8 = 0;

      objc_autoreleasePoolPop(v9);
    }
    free(v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int)appendData:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  id v6;
  uint8_t v7[16];

  v3 = a3;
  v4 = *__error();
  _sa_logt();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "Called appendData: on the superclass. Subclasses implement this.", v7, 2u);
  }

  *__error() = v4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("SAOutputStream implementation error"), CFSTR("subclass must implement appendData"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

@end
