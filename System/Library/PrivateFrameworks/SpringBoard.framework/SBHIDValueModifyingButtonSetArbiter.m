@implementation SBHIDValueModifyingButtonSetArbiter

- (SBHIDValueModifyingButtonSetArbiter)initWithHIDKeyPressEventUsages:(id)a3 initialRepeatDelay:(double)a4 subsequentRepeatDelay:(double)a5
{
  id v8;
  SBHIDValueModifyingButtonSetArbiter *v9;
  SBHIDValueModifyingButtonSetArbiter *v10;
  NSDictionary *v12;
  NSDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  SBHIDButtonStateArbiter *v19;
  void *v20;
  void *v21;
  void *v22;
  NSDictionary *usageToButtonDictionary;
  NSDictionary *v24;
  NSDictionary *buttonToUsageDictionary;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SBHIDValueModifyingButtonSetArbiter;
  v9 = -[SBHIDValueModifyingButtonSetArbiter init](&v32, sel_init);
  v10 = v9;
  if (v9)
  {
    if (a5 > 0.0 && a4 == 0.0)
      a4 = a5;
    v9->_initialRepeatDelay = a4;
    v9->_subsequentRepeatDelay = a5;
    v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v8;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v19 = objc_alloc_init(SBHIDButtonStateArbiter);
          -[SBHIDButtonStateArbiter setLongPressTimeout:](v19, "setLongPressTimeout:", a4);
          -[SBHIDButtonStateArbiter setDelegate:](v19, "setDelegate:", v10);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v18, "unsignedIntValue"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v19, v20);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v18, "unsignedIntValue"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v21, v22);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v15);
    }

    usageToButtonDictionary = v10->_usageToButtonDictionary;
    v10->_usageToButtonDictionary = v12;
    v24 = v12;

    buttonToUsageDictionary = v10->_buttonToUsageDictionary;
    v10->_buttonToUsageDictionary = v13;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[BSAbsoluteMachTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBHIDValueModifyingButtonSetArbiter;
  -[SBHIDValueModifyingButtonSetArbiter dealloc](&v3, sel_dealloc);
}

- (BOOL)processKeyboardEvent:(__IOHIDEvent *)a3
{
  int IntegerValue;
  int v6;
  NSDictionary *usageToButtonDictionary;
  void *v8;
  void *v9;

  IntegerValue = IOHIDEventGetIntegerValue();
  v6 = IOHIDEventGetIntegerValue();
  usageToButtonDictionary = self->_usageToButtonDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6 | (IntegerValue << 16));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](usageToButtonDictionary, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v9, "processEvent:", a3);

  return v9 != 0;
}

- (void)reset
{
  SBHIDButtonStateArbiter *currentDownButton;
  id WeakRetained;

  -[SBHIDValueModifyingButtonSetArbiter _invalidateRepeatingActionTimer](self, "_invalidateRepeatingActionTimer");
  -[SBHIDButtonStateArbiter reset](self->_currentDownButton, "reset");
  currentDownButton = self->_currentDownButton;
  self->_currentDownButton = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "buttonSetArbiterDidReset:", self);

}

- (void)performActionsForButtonUp:(id)a3
{
  SBHIDButtonStateArbiter *currentDownButton;

  if (self->_currentDownButton == a3)
  {
    -[SBHIDValueModifyingButtonSetArbiter reset](self, "reset");
    currentDownButton = self->_currentDownButton;
    self->_currentDownButton = 0;

  }
}

- (void)performActionsForButtonDown:(id)a3
{
  SBHIDButtonStateArbiter *v4;
  SBHIDButtonStateArbiter *currentDownButton;
  BOOL v6;
  SBHIDButtonStateArbiter *v7;
  SBHIDButtonStateArbiter *v8;

  v4 = (SBHIDButtonStateArbiter *)a3;
  -[SBHIDValueModifyingButtonSetArbiter _invalidateRepeatingActionTimer](self, "_invalidateRepeatingActionTimer");
  currentDownButton = self->_currentDownButton;
  if (currentDownButton)
    v6 = currentDownButton == v4;
  else
    v6 = 1;
  if (!v6)
    -[SBHIDButtonStateArbiter reset](currentDownButton, "reset");
  v7 = self->_currentDownButton;
  self->_currentDownButton = v4;
  v8 = v4;

  -[SBHIDValueModifyingButtonSetArbiter _performActionForButton:](self, "_performActionForButton:", v8);
}

- (void)performActionsForButtonLongPress:(id)a3
{
  SBHIDButtonStateArbiter *v5;
  void *v6;
  SBHIDButtonStateArbiter *v7;

  v5 = (SBHIDButtonStateArbiter *)a3;
  v7 = v5;
  if (self->_currentDownButton != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHIDValueModifyingButtonSetArbiter.m"), 115, CFSTR("bug somewhere in this class"));

    v5 = v7;
  }
  -[SBHIDValueModifyingButtonSetArbiter _performActionForButton:](self, "_performActionForButton:", v5);
  -[SBHIDValueModifyingButtonSetArbiter _startRepeatingActionTimer](self, "_startRepeatingActionTimer");

}

- (void)_performActionForButton:(id)a3
{
  NSDictionary *buttonToUsageDictionary;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  id WeakRetained;
  id v9;

  buttonToUsageDictionary = self->_buttonToUsageDictionary;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](buttonToUsageDictionary, "objectForKeyedSubscript:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v9, "unsignedIntValue");
  LOWORD(buttonToUsageDictionary) = v6;
  v7 = HIWORD(v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "buttonSetArbiter:performActionForButtonPage:usage:", self, v7, (unsigned __int16)buttonToUsageDictionary);

}

- (void)_fireRepeatingActionTimer
{
  -[SBHIDValueModifyingButtonSetArbiter _performActionForButton:](self, "_performActionForButton:", self->_currentDownButton);
}

- (void)_startRepeatingActionTimer
{
  BSAbsoluteMachTimer *v3;
  BSAbsoluteMachTimer *timer;
  BSAbsoluteMachTimer *v5;
  double subsequentRepeatDelay;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (self->_subsequentRepeatDelay > 0.0)
  {
    objc_initWeak(&location, self);
    v3 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBHIDValueModifyingButtonSetArbiter.timer"));
    timer = self->_timer;
    self->_timer = v3;

    v5 = self->_timer;
    subsequentRepeatDelay = self->_subsequentRepeatDelay;
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__SBHIDValueModifyingButtonSetArbiter__startRepeatingActionTimer__block_invoke;
    v9[3] = &unk_1E8E9EEC8;
    objc_copyWeak(&v10, &location);
    -[BSAbsoluteMachTimer scheduleRepeatingWithFireInterval:repeatInterval:leewayInterval:queue:handler:](v5, "scheduleRepeatingWithFireInterval:repeatInterval:leewayInterval:queue:handler:", v7, v9, subsequentRepeatDelay, subsequentRepeatDelay, 0.01);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __65__SBHIDValueModifyingButtonSetArbiter__startRepeatingActionTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fireRepeatingActionTimer");

}

- (void)_invalidateRepeatingActionTimer
{
  BSAbsoluteMachTimer *timer;

  -[BSAbsoluteMachTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (SBHIDValueModifyingButtonSetArbiterDelegate)delegate
{
  return (SBHIDValueModifyingButtonSetArbiterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)initialRepeatDelay
{
  return self->_initialRepeatDelay;
}

- (void)setInitialRepeatDelay:(double)a3
{
  self->_initialRepeatDelay = a3;
}

- (double)subsequentRepeatDelay
{
  return self->_subsequentRepeatDelay;
}

- (void)setSubsequentRepeatDelay:(double)a3
{
  self->_subsequentRepeatDelay = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentDownButton, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_buttonToUsageDictionary, 0);
  objc_storeStrong((id *)&self->_usageToButtonDictionary, 0);
}

@end
