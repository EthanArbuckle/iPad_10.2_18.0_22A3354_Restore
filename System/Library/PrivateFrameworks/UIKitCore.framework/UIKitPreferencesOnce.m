@implementation UIKitPreferencesOnce

void ___UIKitPreferencesOnce_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  _UIKitUserDefaults();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD81E60;
  qword_1ECD81E60 = v0;

}

@end
