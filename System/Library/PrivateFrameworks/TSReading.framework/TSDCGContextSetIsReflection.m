@implementation TSDCGContextSetIsReflection

uint64_t __TSDCGContextSetIsReflection_block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_opt_class();
  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)TSUDynamicCast();
  if (!v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void TSDCGContextSetIsReflection(CGContextRef, BOOL)_block_invoke");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDUtility.m"), 644, CFSTR("invalid nil value for '%s'"), "dict");
  }
  return objc_msgSend(v4, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40)), CFSTR("TSDCGContextInfoDictionaryKeyIsReflection"));
}

@end
