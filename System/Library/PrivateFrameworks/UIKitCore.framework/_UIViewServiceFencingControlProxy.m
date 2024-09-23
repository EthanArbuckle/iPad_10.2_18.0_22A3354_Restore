@implementation _UIViewServiceFencingControlProxy

+ (id)proxyWithTarget:(id)a3 exportedProtocol:(id)a4 fencingBatchController:(id)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __93___UIViewServiceFencingControlProxy_proxyWithTarget_exportedProtocol_fencingBatchController___block_invoke;
  v6[3] = &unk_1E16E9560;
  v6[4] = a4;
  return (id)objc_msgSend(a1, "proxyWithTarget:shouldSuspendInvocationBlock:", a3, v6, a5);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  objc_class *v6;
  objc_method *InstanceMethod;
  objc_super v9;

  if ((unint64_t)protocol_getMethodDescription((Protocol *)&unk_1EE054210, a3, 1, 1).name)
  {
    v5 = (void *)MEMORY[0x1E0C99DD8];
    v6 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v6, a3);
    return (id)objc_msgSend(v5, "signatureWithObjCTypes:", method_getTypeEncoding(InstanceMethod));
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIViewServiceFencingControlProxy;
    return -[_UITargetedProxy methodSignatureForSelector:](&v9, sel_methodSignatureForSelector_, a3);
  }
}

- (void)__participateInSystemAnimationFence:(id)a3 timing:(_UIUpdateTiming *)a4
{
  double v6;
  __n128 v7;

  if (_UIUpdateCycleEnabled())
  {
    ++*((_DWORD *)off_1ECD75C00 + 191);
    *(_QWORD *)&v6 = _UIUpdateSchedulerRequestUpdate((uint64_t)&_UIUpdateCycleMainScheduler, (uint64_t)a4, &v7).n128_u64[0];
  }
  +[UIScene _synchronizeDrawingWithFence:](UIScene, "_synchronizeDrawingWithFence:", a3, v6);
  objc_msgSend(a3, "invalidate");
}

- (void)__finishParticipatingInSystemAnimationFence:(id)a3
{
  int v4;

  +[UIScene _synchronizeDrawingWithFence:](UIScene, "_synchronizeDrawingWithFence:");
  objc_msgSend(a3, "invalidate");
  if (_UIUpdateCycleEnabled())
  {
    v4 = *((_DWORD *)off_1ECD75C00 + 191) - 1;
    *((_DWORD *)off_1ECD75C00 + 191) = v4;
    if (!v4)
      signalChanges((uint64_t)&_UIUpdateCycleMainScheduler, 1);
  }
}

@end
