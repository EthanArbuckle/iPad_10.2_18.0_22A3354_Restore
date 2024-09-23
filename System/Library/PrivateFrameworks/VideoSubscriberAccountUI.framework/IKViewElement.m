@implementation IKViewElement

void __58__IKViewElement_VSAdditions__vs_selectedChildElementIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x24BDBCE88];
    v6 = *MEMORY[0x24BDBCAB8];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("Unexpectedly, obj was %@, instead of IKViewElement."), v8);

  }
  if (objc_msgSend(v9, "vs_BOOLAttributeValueForKey:", CFSTR("selected")))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;

}

@end
