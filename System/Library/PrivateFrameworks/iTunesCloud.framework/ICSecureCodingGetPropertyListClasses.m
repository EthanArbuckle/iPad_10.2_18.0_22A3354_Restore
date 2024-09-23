@implementation ICSecureCodingGetPropertyListClasses

void __ICSecureCodingGetPropertyListClasses_block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  v7 = (void *)ICSecureCodingGetPropertyListClasses_sPropertyListTypes;
  ICSecureCodingGetPropertyListClasses_sPropertyListTypes = v6;

}

@end
