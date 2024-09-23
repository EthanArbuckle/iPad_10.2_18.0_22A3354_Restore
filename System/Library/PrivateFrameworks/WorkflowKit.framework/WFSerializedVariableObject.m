@implementation WFSerializedVariableObject

uint64_t __WFSerializedVariableObject_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isSubclassOfClass:");
}

@end
