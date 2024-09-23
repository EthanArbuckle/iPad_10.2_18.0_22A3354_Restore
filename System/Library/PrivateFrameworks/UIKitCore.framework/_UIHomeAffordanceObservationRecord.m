@implementation _UIHomeAffordanceObservationRecord

- (id)observer
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 2);
  return WeakRetained;
}

- (_UIHomeAffordanceObservationRecord)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHomeAffordanceSceneNotifier.m"), 370, CFSTR("%s: init is not allowed on %@"), "-[_UIHomeAffordanceObservationRecord init]", objc_opt_class());

  return 0;
}

- (id)initWithObserver:(int)a3 forLegacyViewService:(void *)a4 scopedWindow:
{
  id *v7;
  void *v9;
  void *v10;
  objc_super v11;

  if (!a1)
    return 0;
  v11.receiver = a1;
  v11.super_class = (Class)_UIHomeAffordanceObservationRecord;
  v7 = (id *)objc_msgSendSuper2(&v11, sel_init);
  if (v7)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithObserver_forLegacyViewService_scopedWindow_, v7, CFSTR("_UIHomeAffordanceSceneNotifier.m"), 379, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    }
    objc_storeWeak(v7 + 2, a2);
    *((_BYTE *)v7 + 8) = a3;
    if (a3)
    {
      if (!a4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithObserver_forLegacyViewService_scopedWindow_, v7, CFSTR("_UIHomeAffordanceSceneNotifier.m"), 386, CFSTR("Invalid legacy view service observer has a nil window: %@"), 0);

      }
      objc_storeWeak(v7 + 3, a4);
    }
  }
  return v7;
}

- (void)appendDescriptionToStream:(id)a3
{
  uint64_t v5;
  _QWORD v6[6];
  _QWORD v7[6];

  v5 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64___UIHomeAffordanceObservationRecord_appendDescriptionToStream___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = a3;
  v7[5] = self;
  objc_msgSend(a3, "appendProem:block:", self, v7);
  if (objc_msgSend(a3, "hasDebugStyle"))
  {
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __64___UIHomeAffordanceObservationRecord_appendDescriptionToStream___block_invoke_2;
    v6[3] = &unk_1E16B1B50;
    v6[4] = a3;
    v6[5] = self;
    objc_msgSend(a3, "appendBodySectionWithName:block:", 0, v6);
  }
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "debugStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scopedWindow);
  objc_destroyWeak((id *)&self->_observer);
}

@end
