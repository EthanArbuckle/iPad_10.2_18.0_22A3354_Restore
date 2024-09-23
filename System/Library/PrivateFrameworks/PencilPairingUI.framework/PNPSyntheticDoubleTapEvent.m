@implementation PNPSyntheticDoubleTapEvent

- (void)serviceDestination:(id)a3 fromSource:(id)a4 withCompletionBlock:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__PNPSyntheticDoubleTapEvent_serviceDestination_fromSource_withCompletionBlock___block_invoke;
  v9[3] = &unk_24F4E5188;
  v10 = v7;
  v8 = v7;
  objc_msgSend(a3, "eventSource:hadPencilDoubleTapped:", a4, v9);

}

uint64_t __80__PNPSyntheticDoubleTapEvent_serviceDestination_fromSource_withCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
