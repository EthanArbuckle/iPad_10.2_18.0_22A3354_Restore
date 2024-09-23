@implementation SBContinuityDisplaySystemGestureManager

- (SBContinuityDisplaySystemGestureManager)initWithDisplayIdentity:(id)a3
{
  id v5;
  SBContinuityDisplaySystemGestureManager *v6;
  SBFailingSystemGestureRecognizer *v7;
  UIGestureRecognizer *minimumViableGestureRecognizer;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplaySystemGestureManager.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayIdentity"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBContinuityDisplaySystemGestureManager;
  v6 = -[SBSystemGestureManager _initWithDisplayIdentity:](&v11, sel__initWithDisplayIdentity_, v5);
  if (v6)
  {
    v7 = objc_alloc_init(SBFailingSystemGestureRecognizer);
    minimumViableGestureRecognizer = v6->_minimumViableGestureRecognizer;
    v6->_minimumViableGestureRecognizer = &v7->super;

    -[UIGestureRecognizer setName:](v6->_minimumViableGestureRecognizer, "setName:", CFSTR("continuity.minimum-viable"));
    -[SBSystemGestureManager addGestureRecognizer:withType:](v6, "addGestureRecognizer:withType:", v6->_minimumViableGestureRecognizer, 138);
  }

  return v6;
}

- (BOOL)_shouldEnableSystemGestureWithType:(unint64_t)a3
{
  char v3;

  v3 = a3 - 96;
  if (a3 - 96 > 0x2A)
    return 0;
  if (((1 << v3) & 0x40000000039) != 0)
    return 1;
  if (((1 << v3) & 0x3000000000) != 0)
    return SBUIIsSystemApertureEnabled();
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumViableGestureRecognizer, 0);
}

@end
