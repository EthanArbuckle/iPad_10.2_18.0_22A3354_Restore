@implementation SFFeedbackListenerRegister

void __SFFeedbackListenerRegister_block_invoke(uint64_t a1)
{
  WeakListener *v2;
  id v3;

  getWeakListeners();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[WeakListener initWithListener:]([WeakListener alloc], "initWithListener:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "addObject:", v2);

}

@end
