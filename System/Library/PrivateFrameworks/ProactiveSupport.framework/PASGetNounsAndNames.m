@implementation PASGetNounsAndNames

void ___PASGetNounsAndNames_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    v7 = (void *)MEMORY[0x1A1AFDC98]();
    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    objc_autoreleasePoolPop(v7);
  }

}

void ___PASGetNounsAndNames_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1A1AFDC98]();
  v1 = (void *)MEMORY[0x1A1AFDC98]();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("Noun"), CFSTR("Number"), CFSTR("PlaceName"), CFSTR("PersonalName"), CFSTR("OrganizationalName"), 0);
  objc_autoreleasePoolPop(v1);
  v3 = (void *)_PASGetNounsAndNames__pasExprOnceResult;
  _PASGetNounsAndNames__pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

@end
