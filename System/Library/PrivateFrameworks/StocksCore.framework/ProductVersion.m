@implementation ProductVersion

void __ProductVersion_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
  objc_msgSend(v3, "objectForKey:", CFSTR("ProductVersion"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)ProductVersion_ProductVersion;
  ProductVersion_ProductVersion = v1;

}

@end
