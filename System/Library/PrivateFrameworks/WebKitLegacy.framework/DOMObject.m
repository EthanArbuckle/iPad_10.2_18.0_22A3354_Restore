@implementation DOMObject

- (DOMObject)init
{
  void *v2;
  uint64_t v3;
  objc_class *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99750];
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("+[%@ init]: should never be used"), NSStringFromClass(v4));
  return 0;
}

- (void)dealloc
{
  DOMObjectInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
    removeDOMWrapper(internal);
  v4.receiver = self;
  v4.super_class = (Class)DOMObject;
  -[DOMObject dealloc](&v4, sel_dealloc);
}

- (DOMStyleSheet)sheet
{
  DOMObjectInternal *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self)
      v3 = (DOMObjectInternal *)*((_QWORD *)self->_internal + 25);
    else
      v3 = (DOMObjectInternal *)MEMORY[0xC8];
    return (DOMStyleSheet *)kit(v3);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (self)
  {
LABEL_2:
    v3 = (DOMObjectInternal *)*((_QWORD *)self->_internal + 18);
    return (DOMStyleSheet *)kit(v3);
  }
  return (DOMStyleSheet *)kit(MEMORY[0x90]);
}

@end
