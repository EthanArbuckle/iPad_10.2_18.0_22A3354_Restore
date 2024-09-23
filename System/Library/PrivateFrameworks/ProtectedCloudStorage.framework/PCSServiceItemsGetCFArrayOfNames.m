@implementation PCSServiceItemsGetCFArrayOfNames

void __PCSServiceItemsGetCFArrayOfNames_block_invoke()
{
  PCSServiceItemsGetCFArrayOfNames_array = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  PCSServiceItemsIterate(&__block_literal_global_40);
}

void __PCSServiceItemsGetCFArrayOfNames_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!CFEqual(kPCSServiceRaw, *(CFTypeRef *)(a3 + 16)))
    CFArrayAppendValue((CFMutableArrayRef)PCSServiceItemsGetCFArrayOfNames_array, *(const void **)(a3 + 16));
}

@end
