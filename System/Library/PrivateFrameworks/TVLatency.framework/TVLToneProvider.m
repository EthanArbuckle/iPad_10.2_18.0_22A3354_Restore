@implementation TVLToneProvider

+ (id)provideToneWithIdentifier:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x24BDB1810];
  v6 = a3;
  v7 = [v5 alloc];
  +[TVLToneProvider urlForResource:](TVLToneProvider, "urlForResource:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initForReading:error:", v8, a4);
  return v9;
}

+ (id)urlForResource:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleWithIdentifier:", CFSTR("com.apple.tvlatency"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", CFSTR("Tones"), CFSTR("bundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForResource:withExtension:", v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
