@implementation _UIViewServiceUIBehaviorProxy

+ (id)proxyWrappingExportedObject:(id)a3 forCommunicationWithPID:(int)a4 exportedProtocol:(id)a5
{
  _UIViewServiceFencingControlProxy *v8;
  _UIViewServiceFencingControlProxy *v9;
  _UIViewServiceFencingControlProxy *v10;
  _QWORD *v11;
  objc_super v13;

  v8 = +[_UIViewServiceImplicitAnimationDecodingProxy proxyDecodingAnimationsForTarget:](_UIViewServiceImplicitAnimationDecodingProxy, "proxyDecodingAnimationsForTarget:", a3);
  if (a4)
    v9 = +[_UIViewServiceFencingControlProxy proxyWithTarget:exportedProtocol:fencingBatchController:](_UIViewServiceFencingControlProxy, "proxyWithTarget:exportedProtocol:fencingBatchController:", v8, a5, 0);
  else
    v9 = 0;
  if (v9)
    v10 = v9;
  else
    v10 = v8;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS____UIViewServiceUIBehaviorProxy;
  v11 = objc_msgSendSuper2(&v13, sel_proxyWithTarget_, v10);
  v11[3] = v9;
  *((_DWORD *)v11 + 4) = a4;
  return v11;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _class_setCustomDeallocInitiation();
}

- (void)_objc_initiateDealloc
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___UIViewServiceUIBehaviorProxy__objc_initiateDealloc__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0ls32l8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIViewServiceUIBehaviorProxy;
  -[_UIViewServiceUIBehaviorProxy dealloc](&v3, sel_dealloc);
}

@end
