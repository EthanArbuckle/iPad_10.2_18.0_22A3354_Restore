@implementation NSStringFromPUIStyleType

void __NSStringFromPUIStyleType_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE0BE30]), "initWithCapacity:", 5);
  objc_msgSend(v2, "setObject:forKey:", CFSTR("OpaqueDiscreteColors"), 0);
  objc_msgSend(v2, "setObject:forKey:", CFSTR("Gradient"), 1);
  objc_msgSend(v2, "setObject:forKey:", CFSTR("VibrantMaterial"), 2);
  objc_msgSend(v2, "setObject:forKey:", CFSTR("VibrantMonochrome"), 3);
  objc_msgSend(v2, "setObject:forKey:", CFSTR("LUT"), 4);
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)NSStringFromPUIStyleType_typeToStringMap;
  NSStringFromPUIStyleType_typeToStringMap = v0;

}

@end
