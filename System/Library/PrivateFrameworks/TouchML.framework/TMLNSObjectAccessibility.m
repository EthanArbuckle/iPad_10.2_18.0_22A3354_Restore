@implementation TMLNSObjectAccessibility

+ (void)makeAccessible:(id)a3 signalName:(id)a4
{
  id v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v10 = a3;
  v5 = a4;
  if ((objc_msgSend_isEqualToString_(v5, v6, v7, CFSTR("accessibilityElementDidBecomeFocused")) & 1) != 0
    || objc_msgSend_isEqualToString_(v5, v8, v9, CFSTR("accessibilityElementDidLoseFocus")))
  {
    objc_msgSend_subclassInstance_(TMLNSObjectAccessibility, v8, v9, v10);
  }

}

- (void)accessibilityElementDidBecomeFocused
{
  double v2;
  objc_class *Superclass;
  objc_class *Class;
  const char *v7;
  double v8;
  objc_super v9;

  Superclass = (objc_class *)objc_msgSend_tmlSuperClass(self, a2, v2);
  v9.receiver = self;
  if (!Superclass)
  {
    Class = object_getClass(self);
    Superclass = class_getSuperclass(Class);
  }
  v9.super_class = Superclass;
  objc_msgSendSuper(&v9, a2);
  objc_msgSend_emitTMLSignal_withArguments_(self, v7, v8, CFSTR("accessibilityElementDidBecomeFocused"), 0, v9.receiver);
}

- (void)accessibilityElementDidLoseFocus
{
  double v2;
  objc_class *Superclass;
  objc_class *Class;
  const char *v7;
  double v8;
  objc_super v9;

  Superclass = (objc_class *)objc_msgSend_tmlSuperClass(self, a2, v2);
  v9.receiver = self;
  if (!Superclass)
  {
    Class = object_getClass(self);
    Superclass = class_getSuperclass(Class);
  }
  v9.super_class = Superclass;
  objc_msgSendSuper(&v9, a2);
  objc_msgSend_emitTMLSignal_withArguments_(self, v7, v8, CFSTR("accessibilityElementDidLoseFocus"), 0, v9.receiver);
}

@end
