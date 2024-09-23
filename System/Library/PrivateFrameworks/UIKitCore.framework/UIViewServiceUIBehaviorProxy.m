@implementation UIViewServiceUIBehaviorProxy

void __54___UIViewServiceUIBehaviorProxy__objc_initiateDealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllEnqueuedInvocations");
  _UIDeallocOnMainThread(*(void **)(a1 + 32));
}

@end
