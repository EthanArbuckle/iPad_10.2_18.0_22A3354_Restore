@implementation MusicViewLayoutInsetsHandleSetupIfNeeded

void ___MusicViewLayoutInsetsHandleSetupIfNeeded_block_invoke(id a1)
{
  objc_class *v1;
  objc_method *InstanceMethod;
  objc_method *v3;
  objc_method *v4;
  objc_method *v5;

  v1 = (objc_class *)objc_opt_class(UIView);
  InstanceMethod = class_getInstanceMethod(v1, "didMoveToSuperview");
  v3 = class_getInstanceMethod(v1, "_music_layoutInsets_didMoveToSuperview");
  method_exchangeImplementations(InstanceMethod, v3);
  v4 = class_getInstanceMethod(v1, "_didMoveFromWindow:toWindow:");
  v5 = class_getInstanceMethod(v1, "_music_layoutInsets_didMoveFromWindow:toWindow:");
  method_exchangeImplementations(v4, v5);
}

@end
