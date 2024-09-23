@implementation _CFXProgressDebugger

+ (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  objc_super v15;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_fractionCompleted(a4, v11, v12, v13);
    if (v14 > 1.0)
      NSLog(CFSTR("VFX: CFXProgressDebugger fractionCompleted > 1.0"));
  }
  else
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS____CFXProgressDebugger;
    objc_msgSendSuper2(&v15, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5, a6);
  }
}

@end
