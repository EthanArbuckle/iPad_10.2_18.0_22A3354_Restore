@implementation SCROBrailleDisplayCommandDispatcher

- (SCROBrailleDisplayCommandDispatcher)init
{
  SCROBrailleDisplayCommandDispatcher *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *commandDictionary;
  void *v14;
  void *v15;
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SCROBrailleDisplayCommandDispatcher;
  v2 = -[SCROBrailleDisplayCommandDispatcher init](&v17, sel_init);
  if (v2)
  {
    v16 = objc_allocWithZone(MEMORY[0x24BDBCE70]);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", sel__handlePanLeftEvent_);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", sel__handlePanRightEvent_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", sel__handleMoveLeftEvent_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", sel__handleMoveRightEvent_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", sel__handleRouterEvent_);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", sel__handleDeleteEvent_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", sel__handleEscapeEvent_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", sel__handleReturnEvent_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", sel__handleWordDescriptionEvent_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", sel__handleTranslateEvent_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v16, "initWithObjectsAndKeys:", v15, CFSTR("VOTEventCommandBraillePanLeft"), v14, CFSTR("VOTEventCommandBraillePanRight"), v3, CFSTR("VOTEventCommandLeftArrow"), v4, CFSTR("VOTEventCommandRightArrow"), v5, CFSTR("VOTEventCommandBrailleRouter"), v6, CFSTR("VOTEventCommandDelete"), v7, CFSTR("VOTEventCommandEscape"), v8, CFSTR("VOTEventCommandReturn"), v9,
            CFSTR("VOTEventCommandWordDescription"),
            v10,
            CFSTR("VOTEventCommandBrailleTranslate"),
            0);
    commandDictionary = v2->_commandDictionary;
    v2->_commandDictionary = (NSDictionary *)v11;

  }
  return v2;
}

- (void)_handlePanLeftEvent:(id)a3
{
  id v4;

  -[SCROBrailleDisplayCommandDispatcher delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleCommandPanLeftForDispatcher:", self);

}

- (void)_handlePanRightEvent:(id)a3
{
  id v4;

  -[SCROBrailleDisplayCommandDispatcher delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleCommandPanRightForDispatcher:", self);

}

- (void)_handleMoveLeftEvent:(id)a3
{
  id v4;

  -[SCROBrailleDisplayCommandDispatcher delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleCommandMoveLeftForDispatcher:", self);

}

- (void)_handleMoveRightEvent:(id)a3
{
  id v4;

  -[SCROBrailleDisplayCommandDispatcher delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleCommandMoveRightForDispatcher:", self);

}

- (void)_handleRouterEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleDisplayCommandDispatcher delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleCommandRouterKeyEvent:forDispatcher:", v4, self);

}

- (void)_handleDeleteEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleDisplayCommandDispatcher delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleCommandDeleteKeyEvent:forDispatcher:", v4, self);

}

- (void)_handleForwardDeleteEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleDisplayCommandDispatcher delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleCommandForwardDeleteKeyEvent:forDispatcher:", v4, self);

}

- (void)_handleEscapeEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleDisplayCommandDispatcher delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleCommandEscapeKeyEvent:forDispatcher:", v4, self);

}

- (void)_handleReturnEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleDisplayCommandDispatcher delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleCommandReturnBrailleEvent:forDispatcher:", v4, self);

}

- (void)_handleWordDescriptionEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleDisplayCommandDispatcher delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleCommandWordDescriptionEvent:forDispatcher:", v4, self);

}

- (void)_handleTranslateEvent:(id)a3
{
  id v4;

  -[SCROBrailleDisplayCommandDispatcher delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleCommandTranslateForDispatcher:", self);

}

- (void)_handleToggleContractedBrailleEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleDisplayCommandDispatcher delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleCommandToggleContractedBrailleEvent:forDispatcher:", v4, self);

}

- (void)_handleToggleEightDotBrailleEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleDisplayCommandDispatcher delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleCommandToggleEightDotBrailleEvent:forDispatcher:", v4, self);

}

- (void)_handleUnsupportedEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCROBrailleDisplayCommandDispatcher delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleUnsupportedKeyEvent:forDispatcher:", v4, self);

}

- (BOOL)handleBrailleKeyEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  -[SCROBrailleDisplayCommandDispatcher delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "brailleInputManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v6, "commandForBrailleKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_commandDictionary, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "pointerValue");

    if (v10)
    {
      -[SCROBrailleDisplayCommandDispatcher performSelector:withObject:](self, "performSelector:withObject:", v10, v4);
    }
    else
    {
      if (v8 || !objc_msgSend(v4, "getRouterIndex:token:location:appToken:", 0, 0, 0, 0))
      {
        -[SCROBrailleDisplayCommandDispatcher _handleUnsupportedEvent:](self, "_handleUnsupportedEvent:", v4);
        v7 = 0;
        goto LABEL_10;
      }
      -[SCROBrailleDisplayCommandDispatcher _handleRouterEvent:](self, "_handleRouterEvent:", v4);
    }
    v7 = 1;
LABEL_10:

    goto LABEL_11;
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (SCROBrailleDisplayCommandDispatcherDelegate)delegate
{
  return (SCROBrailleDisplayCommandDispatcherDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_commandDictionary, 0);
}

@end
