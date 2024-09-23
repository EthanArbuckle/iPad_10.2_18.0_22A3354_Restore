@implementation _UIDragInteractionDefaultDriverProvider_iOS

- (id)createDefaultDriversForDragInteraction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _UIDragInteractionLongPressDriver *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "addObject:", v5);

  LODWORD(v5) = objc_msgSend(v3, "_allowsPointerDragBeforeLiftDelay");
  if ((_DWORD)v5)
    v6 = 1;
  else
    v6 = 2;
  v7 = -[_UIDragInteractionLongPressDriver initWithBehavior:]([_UIDragInteractionLongPressDriver alloc], "initWithBehavior:", v6);
  objc_msgSend(v4, "addObject:", v7);

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
}

@end
