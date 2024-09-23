@implementation IPAPendingAutoSettings

- (BOOL)_applyArchiveDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pending"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v4 == 1 && v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pending"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "BOOLValue");

  }
  return v6;
}

- (BOOL)pending
{
  return 1;
}

@end
