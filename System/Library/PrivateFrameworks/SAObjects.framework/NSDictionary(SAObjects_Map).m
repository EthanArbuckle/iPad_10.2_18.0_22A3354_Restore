@implementation NSDictionary(SAObjects_Map)

- (id)_sa_mappedDictionaryWithBlock:()SAObjects_Map
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __61__NSDictionary_SAObjects_Map___sa_mappedDictionaryWithBlock___block_invoke;
  v13 = &unk_1E4C84EA8;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

@end
