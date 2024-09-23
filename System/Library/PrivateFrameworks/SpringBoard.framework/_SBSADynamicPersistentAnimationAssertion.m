@implementation _SBSADynamicPersistentAnimationAssertion

- (_SBSADynamicPersistentAnimationAssertion)initWithElementIdentity:(id)a3 animation:(int64_t)a4
{
  id v7;
  _SBSADynamicPersistentAnimationAssertion *v8;
  uint64_t v9;
  SAElementIdentifying *elementIdentity;
  void *v12;
  objc_super v13;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureViewController.m"), 4282, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elementIdentity"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_SBSADynamicPersistentAnimationAssertion;
  v8 = -[SAAssertion init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copyWithZone:", 0);
    elementIdentity = v8->_elementIdentity;
    v8->_elementIdentity = (SAElementIdentifying *)v9;

    v8->_animationType = a4;
  }

  return v8;
}

- (id)_descriptionConstituents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)_SBSADynamicPersistentAnimationAssertion;
  -[SAAssertion _descriptionConstituents](&v11, sel__descriptionConstituents);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("elementIdentity");
  -[SAElementIdentifying description](self->_elementIdentity, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = CFSTR("animationType");
  SBStringFromSBSADynamicPersistentAnimation(self->_animationType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (SAElementIdentifying)elementIdentity
{
  return self->_elementIdentity;
}

- (void)setElementIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)animationType
{
  return self->_animationType;
}

- (void)setAnimationType:(int64_t)a3
{
  self->_animationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentity, 0);
}

@end
