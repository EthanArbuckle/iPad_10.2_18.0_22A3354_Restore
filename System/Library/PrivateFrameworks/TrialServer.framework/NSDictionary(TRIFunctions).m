@implementation NSDictionary(TRIFunctions)

- (id)tri_contextValueWithName:()TRIFunctions
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The expression context doesn't contain the key %@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exceptionWithName:reason:userInfo:", CFSTR("KeyNotFoundException"), v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v10);
  }
  v6 = (void *)v5;

  return v6;
}

@end
