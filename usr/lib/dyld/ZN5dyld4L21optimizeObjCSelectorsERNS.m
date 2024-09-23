@implementation ZN5dyld4L21optimizeObjCSelectorsERNS

_QWORD *___ZN5dyld4L21optimizeObjCSelectorsERNS_12RuntimeStateEPKN4objc17SelectorHashTableERN5dyld33MapIN13prebuilt_objc13ObjCStringKeyENS8_20ObjCSelectorLocationENS8_17HashObjCStringKeyENS8_18EqualObjCStringKeyEEERNS_12PrebuiltObjC18ObjCOptimizerImageE_block_invoke_7(uint64_t a1, int a2, unint64_t a3, char *__s, int a5)
{
  return dyld4::PrebuiltObjC::ObjCOptimizerImage::visitReferenceToObjCSelector(*(_QWORD *)(a1 + 32), *(objc::StringHashTable **)(a1 + 40), *(uint64_t **)(a1 + 48), (int)__s, a5, a3, 1, __s);
}

@end
