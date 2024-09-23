@implementation PKDeviceSupportedFeatureIdentifiers

void __PKDeviceSupportedFeatureIdentifiers_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  PKFeatureIdentifierToString(2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
    objc_msgSend(v4, "addObject:", v0);
  PKFeatureIdentifierToString(4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pk_safelyAddObject:", v1);
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)qword_1ECF21D40;
  qword_1ECF21D40 = v2;

}

@end
