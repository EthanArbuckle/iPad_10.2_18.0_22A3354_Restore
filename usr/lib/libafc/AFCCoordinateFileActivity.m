@implementation AFCCoordinateFileActivity

void ____AFCCoordinateFileActivity_block_invoke(uint64_t a1, int a2, const void *a3, void *aBlock)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = _Block_copy(aBlock);
  if (a3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFRetain(a3);
  if (!dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48)))
  {
    _Block_release(*(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = 0;
    (*((void (**)(void *))aBlock + 2))(aBlock);
    if (a3)
      CFRelease(a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

@end
