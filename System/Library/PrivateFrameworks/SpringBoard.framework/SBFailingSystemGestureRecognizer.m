@implementation SBFailingSystemGestureRecognizer

- (SBFailingSystemGestureRecognizer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFailingSystemGestureRecognizer;
  return -[SBFailingSystemGestureRecognizer initWithTarget:action:](&v3, sel_initWithTarget_action_, 0, 0);
}

- (SBFailingSystemGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99750];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("%s is not a valid initializer. You must call -[%@ init]."), "-[SBFailingSystemGestureRecognizer initWithTarget:action:]", v8);

  return -[SBFailingSystemGestureRecognizer init](self, "init");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[SBFailingSystemGestureRecognizer setState:](self, "setState:", 5, a4);
}

@end
