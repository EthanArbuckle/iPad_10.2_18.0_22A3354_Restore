@implementation CRLAccessibilityBlockBasedCustomAction

+ (void)addActionToArray:(id)a3 withName:(id)a4 actionBlock:(id)a5
{
  objc_msgSend(a1, "addActionToArray:withName:categoryName:actionBlock:", a3, a4, 0, a5);
}

+ (void)addActionToArray:(id)a3 withName:(id)a4 categoryName:(id)a5 actionBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  int ShouldPerformValidationChecks;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CRLAccessibilityBlockBasedCustomAction *v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  ShouldPerformValidationChecks = CRLAccessibilityShouldPerformValidationChecks();
  if (!v21)
  {
    if (ShouldPerformValidationChecks)
    {
      ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Array cannot be nil!"), v14, v15, v16, v17, v18, v20))abort();
    }
  }
  v19 = -[CRLAccessibilityBlockBasedCustomAction initWithName:categoryName:actionBlock:]([CRLAccessibilityBlockBasedCustomAction alloc], "initWithName:categoryName:actionBlock:", v9, v10, v11);
  objc_msgSend(v21, "addObject:", v19);

}

- (CRLAccessibilityBlockBasedCustomAction)initWithName:(id)a3 actionBlock:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CRLAccessibilityBlockBasedCustomAction *v17;
  id v18;
  id actionBlock;
  NSString *v20;
  NSString *identifier;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    if (!objc_msgSend(v10, "length"))
    {
      ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("An identifier is required to prevent issues with UIAccessibility!"), v12, v13, v14, v15, v16, (uint64_t)v23.receiver))abort();
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)CRLAccessibilityBlockBasedCustomAction;
  v17 = -[CRLAccessibilityBlockBasedCustomAction initWithName:target:selector:](&v23, "initWithName:target:selector:", v8, self, "_performActionBlock");
  if (v17)
  {
    v18 = objc_msgSend(v9, "copy");
    actionBlock = v17->_actionBlock;
    v17->_actionBlock = v18;

    v20 = (NSString *)objc_msgSend(v10, "copy");
    identifier = v17->_identifier;
    v17->_identifier = v20;

  }
  return v17;
}

- (CRLAccessibilityBlockBasedCustomAction)initWithName:(id)a3 categoryName:(id)a4 actionBlock:(id)a5
{
  id v8;
  CRLAccessibilityBlockBasedCustomAction *v9;
  CRLAccessibilityBlockBasedCustomAction *v10;

  v8 = a4;
  v9 = -[CRLAccessibilityBlockBasedCustomAction initWithName:actionBlock:](self, "initWithName:actionBlock:", a3, a5);
  v10 = v9;
  if (v9 && (objc_opt_respondsToSelector(v9, "setLocalizedActionRotorCategory:") & 1) != 0)
    -[CRLAccessibilityBlockBasedCustomAction setLocalizedActionRotorCategory:](v10, "setLocalizedActionRotorCategory:", v8);

  return v10;
}

- (CRLAccessibilityBlockBasedCustomAction)initWithName:(id)a3 actionBlock:(id)a4
{
  return -[CRLAccessibilityBlockBasedCustomAction initWithName:actionBlock:identifier:](self, "initWithName:actionBlock:identifier:", a3, a4, a3);
}

- (id)_accessibilityCustomActionIdentifier
{
  return +[NSString stringWithString:](NSString, "stringWithString:", self->_identifier);
}

- (id)description
{
  double v3;
  uint64_t v4;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p; identifier=%@>"),
           v3,
           v4,
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_actionBlock, 0);
}

@end
