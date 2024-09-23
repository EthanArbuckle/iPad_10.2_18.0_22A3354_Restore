@implementation TILanguageLikelihoodModel

uint64_t __58___TILanguageLikelihoodModel_rankedLanguagesForRecipient___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "floatValue");
  v12 = v11;

  if (v9 > v12)
    return -1;
  else
    return v9 < v12;
}

void __47___TILanguageLikelihoodModel_singletonInstance__block_invoke()
{
  _TILanguageLikelihoodModel *v0;
  void *v1;

  v0 = objc_alloc_init(_TILanguageLikelihoodModel);
  v1 = (void *)+[_TILanguageLikelihoodModel singletonInstance]::singletonInstance;
  +[_TILanguageLikelihoodModel singletonInstance]::singletonInstance = (uint64_t)v0;

}

@end
