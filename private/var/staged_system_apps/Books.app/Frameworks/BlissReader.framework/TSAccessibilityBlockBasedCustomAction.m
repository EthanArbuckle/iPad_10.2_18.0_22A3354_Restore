@implementation TSAccessibilityBlockBasedCustomAction

+ (void)addActionToArray:(id)a3 withName:(id)a4 actionBlock:(id)a5
{
  int ShouldPerformValidationChecks;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  TSAccessibilityBlockBasedCustomAction *v16;

  ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
  if (!a3)
  {
    if (ShouldPerformValidationChecks)
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Array cannot be nil!"), v10, v11, v12, v13, v14, v15))abort();
    }
  }
  v16 = -[TSAccessibilityBlockBasedCustomAction initWithName:actionBlock:]([TSAccessibilityBlockBasedCustomAction alloc], "initWithName:actionBlock:", a4, a5);
  objc_msgSend(a3, "addObject:", v16);

}

- (TSAccessibilityBlockBasedCustomAction)initWithName:(id)a3 actionBlock:(id)a4 identifier:(id)a5
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  TSAccessibilityBlockBasedCustomAction *v15;
  objc_super v17;

  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (!objc_msgSend(a5, "length"))
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("An identifier is required to prevent issues with UIAccessibility!"), v10, v11, v12, v13, v14, (uint64_t)v17.receiver))abort();
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)TSAccessibilityBlockBasedCustomAction;
  v15 = -[TSAccessibilityBlockBasedCustomAction initWithName:target:selector:](&v17, "initWithName:target:selector:", a3, self, "_performActionBlock");
  if (v15)
  {
    v15->_actionBlock = objc_msgSend(a4, "copy");
    v15->_identifier = (NSString *)objc_msgSend(a5, "copy");
  }
  return v15;
}

- (TSAccessibilityBlockBasedCustomAction)initWithName:(id)a3 actionBlock:(id)a4
{
  return -[TSAccessibilityBlockBasedCustomAction initWithName:actionBlock:identifier:](self, "initWithName:actionBlock:identifier:", a3, a4, a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSAccessibilityBlockBasedCustomAction;
  -[TSAccessibilityBlockBasedCustomAction dealloc](&v3, "dealloc");
}

- (id)_accessibilityCustomActionIdentifier
{
  return +[NSString stringWithString:](NSString, "stringWithString:", self->_identifier);
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p; identifier=%@>"),
           objc_opt_class(self),
           self,
           self->_identifier);
}

- (BOOL)_performActionBlock
{
  uint64_t (**actionBlock)(void);

  actionBlock = (uint64_t (**)(void))self->_actionBlock;
  if (actionBlock)
    LOBYTE(actionBlock) = actionBlock[2]();
  return (char)actionBlock;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
