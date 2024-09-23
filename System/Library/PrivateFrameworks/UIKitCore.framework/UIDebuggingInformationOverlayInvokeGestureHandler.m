@implementation UIDebuggingInformationOverlayInvokeGestureHandler

+ (id)mainHandler
{
  if (qword_1ECD7B008 != -1)
    dispatch_once(&qword_1ECD7B008, &__block_literal_global_584);
  return (id)qword_1ECD7B000;
}

void __64__UIDebuggingInformationOverlayInvokeGestureHandler_mainHandler__block_invoke()
{
  UIDebuggingInformationOverlayInvokeGestureHandler *v0;
  void *v1;

  v0 = objc_alloc_init(UIDebuggingInformationOverlayInvokeGestureHandler);
  v1 = (void *)qword_1ECD7B000;
  qword_1ECD7B000 = (uint64_t)v0;

}

- (void)_handleActivationGesture:(id)a3
{
  objc_class *v4;
  id v5;
  objc_class *v6;
  id v7;
  objc_class *v8;
  id v9;
  objc_class *v10;
  id v11;
  objc_class *v12;
  id v13;
  objc_class *v14;
  id v15;
  id v16;

  if (objc_msgSend(a3, "state") == 3)
  {
    if (!self->_didCreateTools)
    {
      v4 = (objc_class *)objc_opt_class();
      v5 = UIDebuggingViewControllerAtTopLevel(CFSTR("Prototyping"), v4);
      v6 = (objc_class *)objc_opt_class();
      v7 = UIDebuggingViewControllerAtTopLevel(CFSTR("View Hierarchy"), v6);
      v8 = (objc_class *)objc_opt_class();
      v9 = UIDebuggingViewControllerAtTopLevel(CFSTR("VC Hierarchy"), v8);
      v10 = (objc_class *)objc_opt_class();
      v11 = UIDebuggingViewControllerAtTopLevel(CFSTR("Ivar Explorer"), v10);
      v12 = (objc_class *)objc_opt_class();
      v13 = UIDebuggingViewControllerAtTopLevel(CFSTR("Measure"), v12);
      v14 = (objc_class *)objc_opt_class();
      v15 = UIDebuggingViewControllerAtTopLevel(CFSTR("Spec Compare"), v14);
      self->_didCreateTools = 1;
    }
    +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "toggleVisibility");

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

@end
