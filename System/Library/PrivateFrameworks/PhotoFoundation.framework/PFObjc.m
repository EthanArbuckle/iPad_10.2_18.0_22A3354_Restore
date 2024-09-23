@implementation PFObjc

objc_class *__PFObjc_enumerateSubclassesForHeader_block_invoke(uint64_t a1, char *name)
{
  const char *v4;
  size_t v5;
  objc_class *result;
  objc_class *v7;

  v4 = *(const char **)(a1 + 40);
  if (!v4 || (v5 = strlen(*(const char **)(a1 + 40)), result = (objc_class *)strncmp(name, v4, v5), !(_DWORD)result))
  {
    result = objc_lookUpClass(name);
    if (result)
    {
      v7 = *(objc_class **)(a1 + 48);
      do
        result = class_getSuperclass(result);
      while (result && result != v7);
      if (result == v7)
        return (objc_class *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }
  return result;
}

@end
