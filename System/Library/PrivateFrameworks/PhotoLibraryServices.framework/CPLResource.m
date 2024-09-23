@implementation CPLResource

void __39__CPLResource_PL__imageDerivativeTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E375FB58, &unk_1E375FB70, &unk_1E375FB88, &unk_1E375FBA0, 0);
  v1 = (void *)imageDerivativeTypes_s_types;
  imageDerivativeTypes_s_types = v0;

}

void __39__CPLResource_PL__videoDerivativeTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E375FAF8, &unk_1E375FB10, &unk_1E375FB28, &unk_1E375FB40, 0);
  v1 = (void *)videoDerivativeTypes_s_types;
  videoDerivativeTypes_s_types = v0;

}

@end
