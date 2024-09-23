@implementation TUDispatchMainIfNecessaryAndWait

void __TUDispatchMainIfNecessaryAndWait_block_invoke()
{
  dispatch_queue_set_specific(MEMORY[0x1E0C80D38], (const void *)TUDispatchMainIfNecessaryAndWait_sMainQueueMarker, (void *)TUDispatchMainIfNecessaryAndWait_sMainQueueMarker, 0);
}

@end
