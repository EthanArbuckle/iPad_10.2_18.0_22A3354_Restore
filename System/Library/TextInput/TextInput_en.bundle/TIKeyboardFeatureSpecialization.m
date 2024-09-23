@implementation TIKeyboardFeatureSpecialization

void __66__TIKeyboardFeatureSpecialization_en_terminatorsDeletingAutospace__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)TIKeyboardFeatureSpecialization_en;
  objc_msgSendSuper2(&v4, sel_terminatorsDeletingAutospace);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "addCharactersInString:", CFSTR("'’"));
  v3 = (void *)terminatorsDeletingAutospace_result;
  terminatorsDeletingAutospace_result = (uint64_t)v2;

}

@end
