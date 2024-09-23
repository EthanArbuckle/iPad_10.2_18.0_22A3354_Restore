@implementation PNPSyntheticWaitEvent

- (PNPSyntheticWaitEvent)initWithDelay:(double)a3
{
  PNPSyntheticWaitEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PNPSyntheticWaitEvent;
  result = -[PNPSyntheticWaitEvent init](&v5, sel_init);
  result->_delay = a3;
  return result;
}

- (void)serviceDestination:(id)a3 fromSource:(id)a4 withCompletionBlock:(id)a5
{
  id v6;
  dispatch_time_t v7;
  id v8;
  _QWORD block[4];
  id v10;

  v6 = a5;
  v7 = dispatch_time(0, (uint64_t)(self->_delay * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__PNPSyntheticWaitEvent_serviceDestination_fromSource_withCompletionBlock___block_invoke;
  block[3] = &unk_24F4E5188;
  v10 = v6;
  v8 = v6;
  dispatch_after(v7, MEMORY[0x24BDAC9B8], block);

}

uint64_t __75__PNPSyntheticWaitEvent_serviceDestination_fromSource_withCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
