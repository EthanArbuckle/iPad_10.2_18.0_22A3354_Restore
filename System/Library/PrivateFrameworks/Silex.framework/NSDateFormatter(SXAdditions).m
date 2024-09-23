@implementation NSDateFormatter(SXAdditions)

+ (id)dateFormatterWithFormat:()SXAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("SilexDateFormatters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "threadDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("SilexDateFormatters"));

  }
  objc_msgSend(v6, "objectForKey:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v9, "setDateFormat:", v3);
    objc_msgSend(v6, "setObject:forKey:", v9, v3);
  }

  return v9;
}

@end
