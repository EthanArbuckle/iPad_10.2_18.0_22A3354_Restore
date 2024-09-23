@implementation PCSServiceItemsGetCFArraySortedByIndex

void __PCSServiceItemsGetCFArraySortedByIndex_block_invoke()
{
  __CFArray *v0;
  CFRange v1;

  PCSServiceItemsGetCFArraySortedByIndex_array = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  PCSServiceItemsIterate(&__block_literal_global_42);
  v0 = (__CFArray *)PCSServiceItemsGetCFArraySortedByIndex_array;
  v1.length = CFArrayGetCount((CFArrayRef)PCSServiceItemsGetCFArraySortedByIndex_array);
  v1.location = 0;
  CFArraySortValues(v0, v1, (CFComparatorFunction)compareServiceItemIndex, 0);
}

void __PCSServiceItemsGetCFArraySortedByIndex_block_invoke_2(int a1, int a2, void *value)
{
  CFArrayAppendValue((CFMutableArrayRef)PCSServiceItemsGetCFArraySortedByIndex_array, value);
}

@end
