@implementation TSDSetCGContextInfoWithTileOffset

uint64_t __TSDSetCGContextInfoWithTileOffset_block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)TSUDynamicCast();
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "addEntriesFromDictionary:", v5);
    v5 = v6;
  }
  return objc_msgSend(a2, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));
}

@end
