@implementation NSDictionary

void __61__NSDictionary_SAObjects_Map___sa_mappedDictionaryWithBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, v4);

}

@end
