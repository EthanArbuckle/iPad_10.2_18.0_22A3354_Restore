@implementation CUIShapeEffectStack

+ (void)ic_initializeInBackground
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;

  global_queue = dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v3, &stru_100550F18);

}

@end
