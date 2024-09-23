@implementation NSDictionary(VK)

- (id)vk_dictionaryByAddingEntriesFromNonNilDictionary:()VK
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = a1;
  if (a3)
  {
    v5 = a3;
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "addEntriesFromDictionary:", v5);
    v7 = objc_msgSend(v5, "copy");

    v4 = (id)v7;
  }
  return v4;
}

- (id)vk_prettyDescriptionWithTabLevel:()VK
{
  id v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *, void *, void *);
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;

  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v5, "appendString:", CFSTR("{\n"));
  if (a3)
  {
    v6 = &stru_1E94661A8;
    v7 = a3;
    do
    {
      -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR("\t"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v6 = v8;
      --v7;
    }
    while (v7);
  }
  else
  {
    v8 = &stru_1E94661A8;
  }
  -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR("\t"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __53__NSDictionary_VK__vk_prettyDescriptionWithTabLevel___block_invoke;
  v18 = &unk_1E9465A30;
  v10 = v5;
  v19 = v10;
  v20 = v9;
  v21 = a3;
  v11 = v9;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v15);
  objc_msgSend(v10, "appendFormat:", CFSTR("%@}"), v8, v15, v16, v17, v18);
  v12 = v20;
  v13 = v10;

  return v13;
}

- (id)vk_objectForNonNilKey:()VK
{
  if (!a3)
    return 0;
  objc_msgSend(a1, "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)vk_md5
{
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "vk_md5");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
