@implementation _UISceneMaskingClientComponent

- (id)performIntentTransition:(id)a3
{
  return -[_UISceneMaskingClientComponent performWhileMasked:reason:](self, "performWhileMasked:reason:", a3, 1);
}

- (id)performWhileMasked:(id)a3 reason:(int64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _UISceneMaskingClientComponent *v13;
  objc_class *v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60___UISceneMaskingClientComponent_performWhileMasked_reason___block_invoke;
  v19[3] = &unk_1E16CCBA0;
  v20 = v6;
  v8 = v6;
  +[_UISceneMaskingAction actionForBeginMaskingWithReason:continuation:](_UISceneMaskingAction, "actionForBeginMaskingWithReason:continuation:", a4, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneComponent scene](self, "scene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendPrivateActions:", v11);

  ++_UISceneMaskingNewInvalidatableIdentifier_invalidationTokenIndex;
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = self;
  v14 = (objc_class *)objc_opt_class();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%s-%p-%lu"), class_getName(v14), v13, _UISceneMaskingNewInvalidatableIdentifier_invalidationTokenIndex);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __60___UISceneMaskingClientComponent_performWhileMasked_reason___block_invoke_3;
  v18[3] = &unk_1E16CCBC8;
  v18[4] = v13;
  v16 = -[_UIDeallocInvalidatable initWithIdentifier:faultForDeallocInvalidation:invalidationBlock:]([_UIDeallocInvalidatable alloc], v15, 1, v18);

  return v16;
}

@end
