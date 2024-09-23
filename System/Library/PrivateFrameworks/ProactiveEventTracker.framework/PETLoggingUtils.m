@implementation PETLoggingUtils

+ (id)keyStringForEvent:(id)a3 featureId:(id)a4 stringifiedProperties:(id)a5 metaData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(CFSTR("com.apple.proactive."), "mutableCopy");
  objc_msgSend(v14, "appendString:", v12);

  objc_msgSend(v14, "appendString:", CFSTR("."));
  objc_msgSend(v14, "appendString:", v13);

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v14, "appendString:", CFSTR("."));
    objc_msgSend(a1, "_pushToBuffer:keyStringForStringifiedPairs:", v14, v10);
  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v14, "appendString:", CFSTR("."));
    objc_msgSend(a1, "_pushToBuffer:keyStringForStringifiedPairs:", v14, v11);
  }
  v15 = (void *)objc_msgSend(v14, "copy");

  return v15;
}

+ (void)_pushToBuffer:(id)a3 keyStringForStringifiedPairs:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = v6 - 1;
    do
    {
      objc_msgSend(v5, "keyAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendString:", v10);

      objc_msgSend(v12, "appendString:", CFSTR(":"));
      objc_msgSend(v5, "valueAtIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendString:", v11);

      if (v8 < v9)
        objc_msgSend(v12, "appendString:", CFSTR(":"));
      ++v8;
    }
    while (v7 != v8);
  }

}

+ (id)keyStringForStringifiedPairs:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "_pushToBuffer:keyStringForStringifiedPairs:", v5, v4);

  return v5;
}

+ (id)domainStringForEvent:(id)a3 featureId:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("com.apple.proactive"), a4, a3);
}

+ (id)messageKeyStringForKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.message"), a3);
}

@end
