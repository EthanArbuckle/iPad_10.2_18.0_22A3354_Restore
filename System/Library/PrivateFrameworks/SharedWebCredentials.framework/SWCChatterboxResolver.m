@implementation SWCChatterboxResolver

void __41___SWCChatterboxResolver_Private___queue__block_invoke()
{
  id v0;
  void *v1;
  NSObject *v2;
  id v3;
  dispatch_queue_t v4;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_1, "setMaxConcurrentOperationCount:", 1);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SWC Chatterbox resolution queue"));
  objc_msgSend((id)_MergedGlobals_1, "setName:");

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("SWC Chatterbox resolution queue (U)", v2);

  if (v4)
    objc_msgSend((id)_MergedGlobals_1, "setUnderlyingQueue:", v4);

}

@end
