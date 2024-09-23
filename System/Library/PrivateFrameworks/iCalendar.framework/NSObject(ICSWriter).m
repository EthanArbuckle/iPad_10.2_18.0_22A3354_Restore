@implementation NSObject(ICSWriter)

- (id)_ICSStringWithOptions:()ICSWriter
{
  ICSStringWriter *v5;
  void *v6;

  v5 = objc_alloc_init(ICSStringWriter);
  objc_msgSend(a1, "_ICSStringWithOptions:appendingToString:", a3, v5);
  -[ICSStringWriter result](v5, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_ICSStringWithOptions:()ICSWriter appendingToString:
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = objc_opt_class();
  objc_msgSend(a1, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("WARNING ICSStringWithOptions:appendingToString: was called on NSObject - %@ %@"), v6, v7);

  objc_msgSend(a1, "description");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v8);

}

@end
