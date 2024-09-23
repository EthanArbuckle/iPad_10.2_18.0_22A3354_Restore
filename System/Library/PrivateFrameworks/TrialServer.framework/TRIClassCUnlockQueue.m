@implementation TRIClassCUnlockQueue

uint64_t __TRIClassCUnlockQueue_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_initially_inactive(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("TRIClassCUnlockQueue", v1);
  v3 = (void *)qword_1EFC74470;
  qword_1EFC74470 = (uint64_t)v2;

  return objc_msgSend(MEMORY[0x1E0D81590], "runBlockWhenDeviceIsClassCUnlocked:", &__block_literal_global_352);
}

void __TRIClassCUnlockQueue_block_invoke_2()
{
  dispatch_activate((dispatch_object_t)qword_1EFC74470);
}

@end
