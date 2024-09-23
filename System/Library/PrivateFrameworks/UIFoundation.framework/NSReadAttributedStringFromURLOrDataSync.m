@implementation NSReadAttributedStringFromURLOrDataSync

void ___NSReadAttributedStringFromURLOrDataSync_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  NSObject *Weak;
  NSObject *v8;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend(a2, "mutableCopy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a3, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(a4, "copy");
  Weak = objc_loadWeak((id *)(a1 + 56));
  dispatch_semaphore_signal(Weak);
  v8 = objc_loadWeak((id *)(a1 + 56));
  dispatch_release(v8);
}

@end
