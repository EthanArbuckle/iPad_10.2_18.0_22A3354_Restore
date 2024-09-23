@implementation PLProcessCPUWrapper

+ (id)start
{
  if (_MergedGlobals_79 != -1)
    dispatch_once(&_MergedGlobals_79, &__block_literal_global_5);
  return (id)qword_1ED886400;
}

void __28__PLProcessCPUWrapper_start__block_invoke()
{
  PLProcessCPUWrapper *v0;
  void *v1;

  v0 = objc_alloc_init(PLProcessCPUWrapper);
  v1 = (void *)qword_1ED886400;
  qword_1ED886400 = (uint64_t)v0;

}

- (PLProcessCPUWrapper)init
{
  PLProcessCPU *v3;
  dispatch_queue_t v4;
  void *v5;
  dispatch_source_t v6;
  void *v7;
  dispatch_block_t v8;
  void *v9;

  v3 = (PLProcessCPU *)operator new();
  PLProcessCPU::PLProcessCPU(v3);
  processCPU = (uint64_t)v3;
  v4 = dispatch_queue_create("com.apple.PerfPowerServicesExtended.PLProcessCPU", 0);
  v5 = (void *)serialQueue;
  serialQueue = (uint64_t)v4;

  v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 1uLL, (dispatch_queue_t)serialQueue);
  v7 = (void *)cpuTimer;
  cpuTimer = (uint64_t)v6;

  dispatch_source_set_timer((dispatch_source_t)cpuTimer, 0, 0x4A817C800uLL, 0x2FAF080uLL);
  v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &__block_literal_global_2);
  v9 = (void *)block;
  block = (uint64_t)v8;

  dispatch_source_set_event_handler((dispatch_source_t)cpuTimer, (dispatch_block_t)block);
  dispatch_activate((dispatch_object_t)cpuTimer);
  return self;
}

uint64_t __27__PLProcessCPUWrapper_init__block_invoke()
{
  return PLProcessCPU::processPids((PLProcessCPU *)processCPU);
}

@end
