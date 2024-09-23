@implementation SBFloatingDockBehaviorAssertion

- (SBFloatingDockBehaviorAssertion)initWithFloatingDockController:(id)a3 visibleProgress:(double)a4 animated:(BOOL)a5 gesturePossible:(BOOL)a6 atLevel:(unint64_t)a7 reason:(id)a8 withCompletion:(id)a9
{
  id v17;
  id v18;
  id v19;
  SBFloatingDockBehaviorAssertion *v20;
  uint64_t v21;
  NSString *reason;
  uint64_t v23;
  NSDate *timestamp;
  void *v26;
  void *v27;
  objc_super v28;

  v17 = a3;
  v18 = a8;
  v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)SBFloatingDockBehaviorAssertion;
  v20 = -[SBFloatingDockBehaviorAssertion init](&v28, sel_init);
  if (v20)
  {
    if (a7 >= 0xD)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("SBFloatingDockBehaviorAssertion.m"), 26, CFSTR("invalid floating dock pinned level"));

      if (v18)
        goto LABEL_4;
    }
    else if (v18)
    {
LABEL_4:
      v20->_progress = a4;
      v20->_level = a7;
      v21 = objc_msgSend(v18, "copy");
      reason = v20->_reason;
      v20->_reason = (NSString *)v21;

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v23 = objc_claimAutoreleasedReturnValue();
      timestamp = v20->_timestamp;
      v20->_timestamp = (NSDate *)v23;

      v20->_gesturePossible = a6;
      objc_storeWeak((id *)&v20->_floatingDockController, v17);
      v20->_animated = a5;
      objc_msgSend(v17, "_addFloatingDockBehaviorAssertion:withCompletion:", v20, v19);
      goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("SBFloatingDockBehaviorAssertion.m"), 27, CFSTR("invalid reason"));

    goto LABEL_4;
  }
LABEL_5:

  return v20;
}

- (void)dealloc
{
  objc_super v3;

  -[SBFloatingDockBehaviorAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBFloatingDockBehaviorAssertion;
  -[SBFloatingDockBehaviorAssertion dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[SBFloatingDockBehaviorAssertion invalidateWithCompletion:](self, "invalidateWithCompletion:", 0);
}

- (void)invalidateWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBFloatingDockBehaviorAssertion floatingDockController](self, "floatingDockController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_removeFloatingDockBehaviorAssertion:withCompletion:", self, v4);

}

- (void)modifyProgress:(double)a3 interactive:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;

  v5 = a4;
  v9 = a5;
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_progress = a3;
    -[SBFloatingDockBehaviorAssertion floatingDockController](self, "floatingDockController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_updateFloatingDockBehaviorAssertionsInteractive:completion:", v5, v9);

  }
}

- (BOOL)isPinned
{
  return BSFloatIsOne();
}

- (NSString)description
{
  return (NSString *)-[SBFloatingDockBehaviorAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFloatingDockBehaviorAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFloatingDockBehaviorAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBFloatingDockBehaviorAssertion *v11;

  v4 = a3;
  -[SBFloatingDockBehaviorAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__SBFloatingDockBehaviorAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __73__SBFloatingDockBehaviorAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", BSFloatIsOne(), CFSTR("pinned"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", BSFloatIsOne(), CFSTR("animated"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 9), CFSTR("gesture possible"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("visible progress"), *(double *)(*(_QWORD *)(a1 + 40) + 24));
  v6 = *(void **)(a1 + 32);
  SBFloatingDockBehaviorLevelDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "appendObject:withName:", v7, CFSTR("level"));

  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("reason"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("timestamp"));
}

- (unint64_t)level
{
  return self->_level;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (BOOL)gesturePossible
{
  return self->_gesturePossible;
}

- (double)progress
{
  return self->_progress;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (SBFloatingDockController)floatingDockController
{
  return (SBFloatingDockController *)objc_loadWeakRetained((id *)&self->_floatingDockController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_floatingDockController);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
