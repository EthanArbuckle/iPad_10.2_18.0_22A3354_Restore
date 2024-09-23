@implementation PKTimeProfileBegin

void __PKTimeProfileBegin_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = mach_absolute_time();
  if (qword_1ECF21FE8 != -1)
    dispatch_once(&qword_1ECF21FE8, &__block_literal_global_800);
  v3 = (void *)qword_1ECF21CA0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, *(_QWORD *)(a1 + 32));

}

void __PKTimeProfileBegin_block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1ECF21CA0;
  qword_1ECF21CA0 = (uint64_t)v0;

}

@end
