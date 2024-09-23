@implementation VOSOutputEvent

- (id)_initOutputEventWithRawValue:(id)a3 supportsSoundEffect:(BOOL)a4 supportsHaptic:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v9;
  VOSOutputEvent *v10;
  VOSOutputEvent *v11;
  objc_super v13;

  v5 = a5;
  v6 = a4;
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VOSOutputEvent;
  v10 = -[VOSOutputEvent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_rawValue, a3);
    -[VOSOutputEvent setSupportsSoundEffect:](v11, "setSupportsSoundEffect:", v6);
    -[VOSOutputEvent setSupportsHaptic:](v11, "setSupportsHaptic:", v5);
  }

  return v11;
}

+ (VOSOutputEvent)DidActivateElement
{
  if (DidActivateElement_onceToken != -1)
    dispatch_once(&DidActivateElement_onceToken, &__block_literal_global_7);
  return (VOSOutputEvent *)(id)DidActivateElement__Event;
}

void __36__VOSOutputEvent_DidActivateElement__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidActivateElement"), 1, 1);
  v1 = (void *)DidActivateElement__Event;
  DidActivateElement__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)NoResultsFound
{
  if (NoResultsFound_onceToken != -1)
    dispatch_once(&NoResultsFound_onceToken, &__block_literal_global_178);
  return (VOSOutputEvent *)(id)NoResultsFound__Event;
}

void __32__VOSOutputEvent_NoResultsFound__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("NoResultsFound"), 1, 1);
  v1 = (void *)NoResultsFound__Event;
  NoResultsFound__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidFocusOnElement
{
  if (DidFocusOnElement_onceToken != -1)
    dispatch_once(&DidFocusOnElement_onceToken, &__block_literal_global_181_1);
  return (VOSOutputEvent *)(id)DidFocusOnElement__Event;
}

void __35__VOSOutputEvent_DidFocusOnElement__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidFocusOnElement"), 1, 1);
  v1 = (void *)DidFocusOnElement__Event;
  DidFocusOnElement__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidFocusOnScreenRecognitionElement
{
  if (DidFocusOnScreenRecognitionElement_onceToken != -1)
    dispatch_once(&DidFocusOnScreenRecognitionElement_onceToken, &__block_literal_global_184_1);
  return (VOSOutputEvent *)(id)DidFocusOnScreenRecognitionElement__Event;
}

void __52__VOSOutputEvent_DidFocusOnScreenRecognitionElement__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidFocusOnScreenRecognitionElement"), 1, 1);
  v1 = (void *)DidFocusOnScreenRecognitionElement__Event;
  DidFocusOnScreenRecognitionElement__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidScrollByPage
{
  if (DidScrollByPage_onceToken != -1)
    dispatch_once(&DidScrollByPage_onceToken, &__block_literal_global_187_1);
  return (VOSOutputEvent *)(id)DidScrollByPage__Event;
}

void __33__VOSOutputEvent_DidScrollByPage__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidScrollByPage"), 1, 1);
  v1 = (void *)DidScrollByPage__Event;
  DidScrollByPage__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)BoundaryEncountered
{
  if (BoundaryEncountered_onceToken != -1)
    dispatch_once(&BoundaryEncountered_onceToken, &__block_literal_global_190_1);
  return (VOSOutputEvent *)(id)BoundaryEncountered__Event;
}

void __37__VOSOutputEvent_BoundaryEncountered__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("BoundaryEncountered"), 1, 1);
  v1 = (void *)BoundaryEncountered__Event;
  BoundaryEncountered__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)NoItemExists
{
  if (NoItemExists_onceToken != -1)
    dispatch_once(&NoItemExists_onceToken, &__block_literal_global_193_0);
  return (VOSOutputEvent *)(id)NoItemExists__Event;
}

void __30__VOSOutputEvent_NoItemExists__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("NoItemExists"), 1, 1);
  v1 = (void *)NoItemExists__Event;
  NoItemExists__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)IsInteractable
{
  if (IsInteractable_onceToken != -1)
    dispatch_once(&IsInteractable_onceToken, &__block_literal_global_196_0);
  return (VOSOutputEvent *)(id)IsInteractable__Event;
}

void __32__VOSOutputEvent_IsInteractable__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("IsInteractable"), 1, 1);
  v1 = (void *)IsInteractable__Event;
  IsInteractable__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)InteractIn
{
  if (InteractIn_onceToken != -1)
    dispatch_once(&InteractIn_onceToken, &__block_literal_global_199_0);
  return (VOSOutputEvent *)(id)InteractIn__Event;
}

void __28__VOSOutputEvent_InteractIn__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("InteractIn"), 1, 0);
  v1 = (void *)InteractIn__Event;
  InteractIn__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)InteractOut
{
  if (InteractOut_onceToken != -1)
    dispatch_once(&InteractOut_onceToken, &__block_literal_global_202_0);
  return (VOSOutputEvent *)(id)InteractOut__Event;
}

void __29__VOSOutputEvent_InteractOut__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("InteractOut"), 1, 0);
  v1 = (void *)InteractOut__Event;
  InteractOut__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidSelectAutofill
{
  if (DidSelectAutofill_onceToken != -1)
    dispatch_once(&DidSelectAutofill_onceToken, &__block_literal_global_205_0);
  return (VOSOutputEvent *)(id)DidSelectAutofill__Event;
}

void __35__VOSOutputEvent_DidSelectAutofill__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidSelectAutofill"), 1, 1);
  v1 = (void *)DidSelectAutofill__Event;
  DidSelectAutofill__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidBeginPassthrough
{
  if (DidBeginPassthrough_onceToken != -1)
    dispatch_once(&DidBeginPassthrough_onceToken, &__block_literal_global_208_0);
  return (VOSOutputEvent *)(id)DidBeginPassthrough__Event;
}

void __37__VOSOutputEvent_DidBeginPassthrough__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidBeginPassthrough"), 1, 1);
  v1 = (void *)DidBeginPassthrough__Event;
  DidBeginPassthrough__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidSelectPreviousRotor
{
  if (DidSelectPreviousRotor_onceToken != -1)
    dispatch_once(&DidSelectPreviousRotor_onceToken, &__block_literal_global_211_1);
  return (VOSOutputEvent *)(id)DidSelectPreviousRotor__Event;
}

void __40__VOSOutputEvent_DidSelectPreviousRotor__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidSelectPreviousRotor"), 1, 1);
  v1 = (void *)DidSelectPreviousRotor__Event;
  DidSelectPreviousRotor__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidSelectNextRotor
{
  if (DidSelectNextRotor_onceToken != -1)
    dispatch_once(&DidSelectNextRotor_onceToken, &__block_literal_global_214_0);
  return (VOSOutputEvent *)(id)DidSelectNextRotor__Event;
}

void __36__VOSOutputEvent_DidSelectNextRotor__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidSelectNextRotor"), 1, 1);
  v1 = (void *)DidSelectNextRotor__Event;
  DidSelectNextRotor__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)PreviousRotorProgress
{
  if (PreviousRotorProgress_onceToken != -1)
    dispatch_once(&PreviousRotorProgress_onceToken, &__block_literal_global_217_0);
  return (VOSOutputEvent *)(id)PreviousRotorProgress__Event;
}

void __39__VOSOutputEvent_PreviousRotorProgress__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("PreviousRotorProgress"), 0, 1);
  v1 = (void *)PreviousRotorProgress__Event;
  PreviousRotorProgress__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)NextRotorProgress
{
  if (NextRotorProgress_onceToken != -1)
    dispatch_once(&NextRotorProgress_onceToken, &__block_literal_global_220_0);
  return (VOSOutputEvent *)(id)NextRotorProgress__Event;
}

void __35__VOSOutputEvent_NextRotorProgress__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("NextRotorProgress"), 0, 1);
  v1 = (void *)NextRotorProgress__Event;
  NextRotorProgress__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidEnterSecureText
{
  if (DidEnterSecureText_onceToken != -1)
    dispatch_once(&DidEnterSecureText_onceToken, &__block_literal_global_223_0);
  return (VOSOutputEvent *)(id)DidEnterSecureText__Event;
}

void __36__VOSOutputEvent_DidEnterSecureText__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidEnterSecureText"), 1, 1);
  v1 = (void *)DidEnterSecureText__Event;
  DidEnterSecureText__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidChangeTextSelectionDirection
{
  if (DidChangeTextSelectionDirection_onceToken != -1)
    dispatch_once(&DidChangeTextSelectionDirection_onceToken, &__block_literal_global_226_0);
  return (VOSOutputEvent *)(id)DidChangeTextSelectionDirection__Event;
}

void __49__VOSOutputEvent_DidChangeTextSelectionDirection__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidChangeTextSelectionDirection"), 1, 1);
  v1 = (void *)DidChangeTextSelectionDirection__Event;
  DidChangeTextSelectionDirection__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)UnknownCommand
{
  if (UnknownCommand_onceToken != -1)
    dispatch_once(&UnknownCommand_onceToken, &__block_literal_global_229_0);
  return (VOSOutputEvent *)(id)UnknownCommand__Event;
}

void __32__VOSOutputEvent_UnknownCommand__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("UnknownCommand"), 1, 1);
  v1 = (void *)UnknownCommand__Event;
  UnknownCommand__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidRecognizeMLContent
{
  if (DidRecognizeMLContent_onceToken != -1)
    dispatch_once(&DidRecognizeMLContent_onceToken, &__block_literal_global_232_0);
  return (VOSOutputEvent *)(id)DidRecognizeMLContent__Event;
}

void __39__VOSOutputEvent_DidRecognizeMLContent__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidRecognizeMLContent"), 1, 0);
  v1 = (void *)DidRecognizeMLContent__Event;
  DidRecognizeMLContent__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidEnterTargetArea
{
  if (DidEnterTargetArea_onceToken != -1)
    dispatch_once(&DidEnterTargetArea_onceToken, &__block_literal_global_235_0);
  return (VOSOutputEvent *)(id)DidEnterTargetArea__Event;
}

void __36__VOSOutputEvent_DidEnterTargetArea__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidEnterTargetArea"), 1, 1);
  v1 = (void *)DidEnterTargetArea__Event;
  DidEnterTargetArea__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidLeaveTargetArea
{
  if (DidLeaveTargetArea_onceToken != -1)
    dispatch_once(&DidLeaveTargetArea_onceToken, &__block_literal_global_238_0);
  return (VOSOutputEvent *)(id)DidLeaveTargetArea__Event;
}

void __36__VOSOutputEvent_DidLeaveTargetArea__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidLeaveTargetArea"), 1, 1);
  v1 = (void *)DidLeaveTargetArea__Event;
  DidLeaveTargetArea__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidSyncWithSystemFocus
{
  if (DidSyncWithSystemFocus_onceToken != -1)
    dispatch_once(&DidSyncWithSystemFocus_onceToken, &__block_literal_global_241_0);
  return (VOSOutputEvent *)(id)DidSyncWithSystemFocus__Event;
}

void __40__VOSOutputEvent_DidSyncWithSystemFocus__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidSyncWithSystemFocus"), 1, 0);
  v1 = (void *)DidSyncWithSystemFocus__Event;
  DidSyncWithSystemFocus__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidEnterTouchContainer
{
  if (DidEnterTouchContainer_onceToken != -1)
    dispatch_once(&DidEnterTouchContainer_onceToken, &__block_literal_global_244_0);
  return (VOSOutputEvent *)(id)DidEnterTouchContainer__Event;
}

void __40__VOSOutputEvent_DidEnterTouchContainer__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidEnterTouchContainer"), 1, 0);
  v1 = (void *)DidEnterTouchContainer__Event;
  DidEnterTouchContainer__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidChangeVolume
{
  if (DidChangeVolume_onceToken != -1)
    dispatch_once(&DidChangeVolume_onceToken, &__block_literal_global_247_0);
  return (VOSOutputEvent *)(id)DidChangeVolume__Event;
}

void __33__VOSOutputEvent_DidChangeVolume__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidChangeVolume"), 1, 0);
  v1 = (void *)DidChangeVolume__Event;
  DidChangeVolume__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidReorderItem
{
  if (DidReorderItem_onceToken != -1)
    dispatch_once(&DidReorderItem_onceToken, &__block_literal_global_250_0);
  return (VOSOutputEvent *)(id)DidReorderItem__Event;
}

void __32__VOSOutputEvent_DidReorderItem__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidReorderItem"), 1, 0);
  v1 = (void *)DidReorderItem__Event;
  DidReorderItem__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidWrapBackwards
{
  if (DidWrapBackwards_onceToken != -1)
    dispatch_once(&DidWrapBackwards_onceToken, &__block_literal_global_253_0);
  return (VOSOutputEvent *)(id)DidWrapBackwards__Event;
}

void __34__VOSOutputEvent_DidWrapBackwards__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidWrapBackwards"), 1, 1);
  v1 = (void *)DidWrapBackwards__Event;
  DidWrapBackwards__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidWrapForwards
{
  if (DidWrapForwards_onceToken != -1)
    dispatch_once(&DidWrapForwards_onceToken, &__block_literal_global_256_0);
  return (VOSOutputEvent *)(id)DidWrapForwards__Event;
}

void __33__VOSOutputEvent_DidWrapForwards__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidWrapForwards"), 1, 1);
  v1 = (void *)DidWrapForwards__Event;
  DidWrapForwards__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidEnableQuickNav
{
  if (DidEnableQuickNav_onceToken != -1)
    dispatch_once(&DidEnableQuickNav_onceToken, &__block_literal_global_259_0);
  return (VOSOutputEvent *)(id)DidEnableQuickNav__Event;
}

void __35__VOSOutputEvent_DidEnableQuickNav__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidEnableQuickNav"), 1, 0);
  v1 = (void *)DidEnableQuickNav__Event;
  DidEnableQuickNav__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DidDisableQuickNav
{
  if (DidDisableQuickNav_onceToken != -1)
    dispatch_once(&DidDisableQuickNav_onceToken, &__block_literal_global_262_0);
  return (VOSOutputEvent *)(id)DidDisableQuickNav__Event;
}

void __36__VOSOutputEvent_DidDisableQuickNav__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DidDisableQuickNav"), 1, 0);
  v1 = (void *)DidDisableQuickNav__Event;
  DidDisableQuickNav__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)TVDidBeginInteractionWithRotor
{
  if (TVDidBeginInteractionWithRotor_onceToken != -1)
    dispatch_once(&TVDidBeginInteractionWithRotor_onceToken, &__block_literal_global_265_0);
  return (VOSOutputEvent *)(id)TVDidBeginInteractionWithRotor__Event;
}

void __48__VOSOutputEvent_TVDidBeginInteractionWithRotor__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("TVDidBeginInteractionWithRotor"), 1, 0);
  v1 = (void *)TVDidBeginInteractionWithRotor__Event;
  TVDidBeginInteractionWithRotor__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)TVDidEndInteractionWithRotor
{
  if (TVDidEndInteractionWithRotor_onceToken != -1)
    dispatch_once(&TVDidEndInteractionWithRotor_onceToken, &__block_literal_global_268_0);
  return (VOSOutputEvent *)(id)TVDidEndInteractionWithRotor__Event;
}

void __46__VOSOutputEvent_TVDidEndInteractionWithRotor__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("TVDidEndInteractionWithRotor"), 1, 0);
  v1 = (void *)TVDidEndInteractionWithRotor__Event;
  TVDidEndInteractionWithRotor__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)BSIDidEnableTyping
{
  if (BSIDidEnableTyping_onceToken != -1)
    dispatch_once(&BSIDidEnableTyping_onceToken, &__block_literal_global_271_0);
  return (VOSOutputEvent *)(id)BSIDidEnableTyping__Event;
}

void __36__VOSOutputEvent_BSIDidEnableTyping__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("BSIDidEnableTyping"), 1, 0);
  v1 = (void *)BSIDidEnableTyping__Event;
  BSIDidEnableTyping__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)BSIDidEnableCommand
{
  if (BSIDidEnableCommand_onceToken != -1)
    dispatch_once(&BSIDidEnableCommand_onceToken, &__block_literal_global_274_0);
  return (VOSOutputEvent *)(id)BSIDidEnableCommand__Event;
}

void __37__VOSOutputEvent_BSIDidEnableCommand__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("BSIDidEnableCommand"), 1, 0);
  v1 = (void *)BSIDidEnableCommand__Event;
  BSIDidEnableCommand__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)BSIDidDisable
{
  if (BSIDidDisable_onceToken != -1)
    dispatch_once(&BSIDidDisable_onceToken, &__block_literal_global_277_0);
  return (VOSOutputEvent *)(id)BSIDidDisable__Event;
}

void __31__VOSOutputEvent_BSIDidDisable__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("BSIDidDisable"), 1, 0);
  v1 = (void *)BSIDidDisable__Event;
  BSIDidDisable__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)BSIDidCalibrate
{
  if (BSIDidCalibrate_onceToken != -1)
    dispatch_once(&BSIDidCalibrate_onceToken, &__block_literal_global_280_0);
  return (VOSOutputEvent *)(id)BSIDidCalibrate__Event;
}

void __33__VOSOutputEvent_BSIDidCalibrate__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("BSIDidCalibrate"), 1, 0);
  v1 = (void *)BSIDidCalibrate__Event;
  BSIDidCalibrate__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)BSIDidCarriageReturn
{
  if (BSIDidCarriageReturn_onceToken != -1)
    dispatch_once(&BSIDidCarriageReturn_onceToken, &__block_literal_global_283_0);
  return (VOSOutputEvent *)(id)BSIDidCarriageReturn__Event;
}

void __38__VOSOutputEvent_BSIDidCarriageReturn__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("BSIDidCarriageReturn"), 1, 0);
  v1 = (void *)BSIDidCarriageReturn__Event;
  BSIDidCarriageReturn__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)BSIDidType
{
  if (BSIDidType_onceToken != -1)
    dispatch_once(&BSIDidType_onceToken, &__block_literal_global_286);
  return (VOSOutputEvent *)(id)BSIDidType__Event;
}

void __28__VOSOutputEvent_BSIDidType__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("BSIDidType"), 1, 0);
  v1 = (void *)BSIDidType__Event;
  BSIDidType__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)BSIDidDelete
{
  if (BSIDidDelete_onceToken != -1)
    dispatch_once(&BSIDidDelete_onceToken, &__block_literal_global_289);
  return (VOSOutputEvent *)(id)BSIDidDelete__Event;
}

void __30__VOSOutputEvent_BSIDidDelete__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("BSIDidDelete"), 1, 0);
  v1 = (void *)BSIDidDelete__Event;
  BSIDidDelete__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)BSIDidEnterSpace
{
  if (BSIDidEnterSpace_onceToken != -1)
    dispatch_once(&BSIDidEnterSpace_onceToken, &__block_literal_global_292);
  return (VOSOutputEvent *)(id)BSIDidEnterSpace__Event;
}

void __34__VOSOutputEvent_BSIDidEnterSpace__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("BSIDidEnterSpace"), 1, 0);
  v1 = (void *)BSIDidEnterSpace__Event;
  BSIDidEnterSpace__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)BSIDidEnterChord
{
  if (BSIDidEnterChord_onceToken != -1)
    dispatch_once(&BSIDidEnterChord_onceToken, &__block_literal_global_295);
  return (VOSOutputEvent *)(id)BSIDidEnterChord__Event;
}

void __34__VOSOutputEvent_BSIDidEnterChord__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("BSIDidEnterChord"), 0, 1);
  v1 = (void *)BSIDidEnterChord__Event;
  BSIDidEnterChord__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)BrailleDisplayReconnectionTriggered
{
  if (BrailleDisplayReconnectionTriggered_onceToken != -1)
    dispatch_once(&BrailleDisplayReconnectionTriggered_onceToken, &__block_literal_global_298);
  return (VOSOutputEvent *)(id)BrailleDisplayReconnectionTriggered__Event;
}

void __53__VOSOutputEvent_BrailleDisplayReconnectionTriggered__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("BrailleDisplayReconnectionTriggered"), 0, 1);
  v1 = (void *)BrailleDisplayReconnectionTriggered__Event;
  BrailleDisplayReconnectionTriggered__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)AlertDidAppear
{
  if (AlertDidAppear_onceToken != -1)
    dispatch_once(&AlertDidAppear_onceToken, &__block_literal_global_301);
  return (VOSOutputEvent *)(id)AlertDidAppear__Event;
}

void __32__VOSOutputEvent_AlertDidAppear__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("AlertDidAppear"), 1, 1);
  v1 = (void *)AlertDidAppear__Event;
  AlertDidAppear__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)NotificationDidAppear
{
  if (NotificationDidAppear_onceToken != -1)
    dispatch_once(&NotificationDidAppear_onceToken, &__block_literal_global_304);
  return (VOSOutputEvent *)(id)NotificationDidAppear__Event;
}

void __39__VOSOutputEvent_NotificationDidAppear__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("NotificationDidAppear"), 0, 1);
  v1 = (void *)NotificationDidAppear__Event;
  NotificationDidAppear__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)PopoverDidAppear
{
  if (PopoverDidAppear_onceToken != -1)
    dispatch_once(&PopoverDidAppear_onceToken, &__block_literal_global_307);
  return (VOSOutputEvent *)(id)PopoverDidAppear__Event;
}

void __34__VOSOutputEvent_PopoverDidAppear__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("PopoverDidAppear"), 1, 1);
  v1 = (void *)PopoverDidAppear__Event;
  PopoverDidAppear__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)AutofillDidAppear
{
  if (AutofillDidAppear_onceToken != -1)
    dispatch_once(&AutofillDidAppear_onceToken, &__block_literal_global_310);
  return (VOSOutputEvent *)(id)AutofillDidAppear__Event;
}

void __35__VOSOutputEvent_AutofillDidAppear__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("AutofillDidAppear"), 1, 1);
  v1 = (void *)AutofillDidAppear__Event;
  AutofillDidAppear__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)AutofillDidDismiss
{
  if (AutofillDidDismiss_onceToken != -1)
    dispatch_once(&AutofillDidDismiss_onceToken, &__block_literal_global_313);
  return (VOSOutputEvent *)(id)AutofillDidDismiss__Event;
}

void __36__VOSOutputEvent_AutofillDidDismiss__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("AutofillDidDismiss"), 1, 1);
  v1 = (void *)AutofillDidDismiss__Event;
  AutofillDidDismiss__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)ItemIsLoading
{
  if (ItemIsLoading_onceToken != -1)
    dispatch_once(&ItemIsLoading_onceToken, &__block_literal_global_316);
  return (VOSOutputEvent *)(id)ItemIsLoading__Event;
}

void __31__VOSOutputEvent_ItemIsLoading__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("ItemIsLoading"), 1, 1);
  v1 = (void *)ItemIsLoading__Event;
  ItemIsLoading__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)ItemDidLoad
{
  if (ItemDidLoad_onceToken != -1)
    dispatch_once(&ItemDidLoad_onceToken, &__block_literal_global_319);
  return (VOSOutputEvent *)(id)ItemDidLoad__Event;
}

void __29__VOSOutputEvent_ItemDidLoad__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("ItemDidLoad"), 1, 1);
  v1 = (void *)ItemDidLoad__Event;
  ItemDidLoad__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)ScreenDidTurnOff
{
  if (ScreenDidTurnOff_onceToken != -1)
    dispatch_once(&ScreenDidTurnOff_onceToken, &__block_literal_global_322);
  return (VOSOutputEvent *)(id)ScreenDidTurnOff__Event;
}

void __34__VOSOutputEvent_ScreenDidTurnOff__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("ScreenDidTurnOff"), 1, 1);
  v1 = (void *)ScreenDidTurnOff__Event;
  ScreenDidTurnOff__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)InsertionPointDidMove
{
  if (InsertionPointDidMove_onceToken != -1)
    dispatch_once(&InsertionPointDidMove_onceToken, &__block_literal_global_325);
  return (VOSOutputEvent *)(id)InsertionPointDidMove__Event;
}

void __39__VOSOutputEvent_InsertionPointDidMove__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("InsertionPointDidMove"), 1, 1);
  v1 = (void *)InsertionPointDidMove__Event;
  InsertionPointDidMove__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)KeyboardAppeared
{
  if (KeyboardAppeared_onceToken != -1)
    dispatch_once(&KeyboardAppeared_onceToken, &__block_literal_global_328);
  return (VOSOutputEvent *)(id)KeyboardAppeared__Event;
}

void __34__VOSOutputEvent_KeyboardAppeared__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("KeyboardAppeared"), 1, 1);
  v1 = (void *)KeyboardAppeared__Event;
  KeyboardAppeared__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)KeyboardDisappeared
{
  if (KeyboardDisappeared_onceToken != -1)
    dispatch_once(&KeyboardDisappeared_onceToken, &__block_literal_global_331);
  return (VOSOutputEvent *)(id)KeyboardDisappeared__Event;
}

void __37__VOSOutputEvent_KeyboardDisappeared__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("KeyboardDisappeared"), 1, 1);
  v1 = (void *)KeyboardDisappeared__Event;
  KeyboardDisappeared__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)ItemMemorizationSucceeded
{
  if (ItemMemorizationSucceeded_onceToken != -1)
    dispatch_once(&ItemMemorizationSucceeded_onceToken, &__block_literal_global_334);
  return (VOSOutputEvent *)(id)ItemMemorizationSucceeded__Event;
}

void __43__VOSOutputEvent_ItemMemorizationSucceeded__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("ItemMemorizationSucceeded"), 1, 1);
  v1 = (void *)ItemMemorizationSucceeded__Event;
  ItemMemorizationSucceeded__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)ScreenDidChange
{
  if (ScreenDidChange_onceToken != -1)
    dispatch_once(&ScreenDidChange_onceToken, &__block_literal_global_337);
  return (VOSOutputEvent *)(id)ScreenDidChange__Event;
}

void __33__VOSOutputEvent_ScreenDidChange__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("ScreenDidChange"), 1, 1);
  v1 = (void *)ScreenDidChange__Event;
  ScreenDidChange__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)CollaborationOccurred
{
  if (CollaborationOccurred_onceToken != -1)
    dispatch_once(&CollaborationOccurred_onceToken, &__block_literal_global_340);
  return (VOSOutputEvent *)(id)CollaborationOccurred__Event;
}

void __39__VOSOutputEvent_CollaborationOccurred__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("CollaborationOccurred"), 1, 0);
  v1 = (void *)CollaborationOccurred__Event;
  CollaborationOccurred__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)FolderWillOpen
{
  if (FolderWillOpen_onceToken != -1)
    dispatch_once(&FolderWillOpen_onceToken, &__block_literal_global_343);
  return (VOSOutputEvent *)(id)FolderWillOpen__Event;
}

void __32__VOSOutputEvent_FolderWillOpen__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("FolderWillOpen"), 1, 0);
  v1 = (void *)FolderWillOpen__Event;
  FolderWillOpen__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)FolderDidOpen
{
  if (FolderDidOpen_onceToken != -1)
    dispatch_once(&FolderDidOpen_onceToken, &__block_literal_global_346);
  return (VOSOutputEvent *)(id)FolderDidOpen__Event;
}

void __31__VOSOutputEvent_FolderDidOpen__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("FolderDidOpen"), 1, 0);
  v1 = (void *)FolderDidOpen__Event;
  FolderDidOpen__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)FolderDidClose
{
  if (FolderDidClose_onceToken != -1)
    dispatch_once(&FolderDidClose_onceToken, &__block_literal_global_349);
  return (VOSOutputEvent *)(id)FolderDidClose__Event;
}

void __32__VOSOutputEvent_FolderDidClose__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("FolderDidClose"), 1, 0);
  v1 = (void *)FolderDidClose__Event;
  FolderDidClose__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)BrailleDisplayConnected
{
  if (BrailleDisplayConnected_onceToken != -1)
    dispatch_once(&BrailleDisplayConnected_onceToken, &__block_literal_global_352);
  return (VOSOutputEvent *)(id)BrailleDisplayConnected__Event;
}

void __41__VOSOutputEvent_BrailleDisplayConnected__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("BrailleDisplayConnected"), 1, 1);
  v1 = (void *)BrailleDisplayConnected__Event;
  BrailleDisplayConnected__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)BrailleDisplayDisconnected
{
  if (BrailleDisplayDisconnected_onceToken != -1)
    dispatch_once(&BrailleDisplayDisconnected_onceToken, &__block_literal_global_355);
  return (VOSOutputEvent *)(id)BrailleDisplayDisconnected__Event;
}

void __44__VOSOutputEvent_BrailleDisplayDisconnected__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("BrailleDisplayDisconnected"), 1, 1);
  v1 = (void *)BrailleDisplayDisconnected__Event;
  BrailleDisplayDisconnected__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)ItemMemorizationFailed
{
  if (ItemMemorizationFailed_onceToken != -1)
    dispatch_once(&ItemMemorizationFailed_onceToken, &__block_literal_global_358);
  return (VOSOutputEvent *)(id)ItemMemorizationFailed__Event;
}

void __40__VOSOutputEvent_ItemMemorizationFailed__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("ItemMemorizationFailed"), 1, 0);
  v1 = (void *)ItemMemorizationFailed__Event;
  ItemMemorizationFailed__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)ItemMemorizationInProgress
{
  if (ItemMemorizationInProgress_onceToken != -1)
    dispatch_once(&ItemMemorizationInProgress_onceToken, &__block_literal_global_361);
  return (VOSOutputEvent *)(id)ItemMemorizationInProgress__Event;
}

void __44__VOSOutputEvent_ItemMemorizationInProgress__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("ItemMemorizationInProgress"), 1, 0);
  v1 = (void *)ItemMemorizationInProgress__Event;
  ItemMemorizationInProgress__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DockDidAppear
{
  if (DockDidAppear_onceToken != -1)
    dispatch_once(&DockDidAppear_onceToken, &__block_literal_global_364);
  return (VOSOutputEvent *)(id)DockDidAppear__Event;
}

void __31__VOSOutputEvent_DockDidAppear__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DockDidAppear"), 1, 0);
  v1 = (void *)DockDidAppear__Event;
  DockDidAppear__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)DockDidDisappear
{
  if (DockDidDisappear_onceToken != -1)
    dispatch_once(&DockDidDisappear_onceToken, &__block_literal_global_367);
  return (VOSOutputEvent *)(id)DockDidDisappear__Event;
}

void __34__VOSOutputEvent_DockDidDisappear__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("DockDidDisappear"), 1, 0);
  v1 = (void *)DockDidDisappear__Event;
  DockDidDisappear__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)ReachabilityDidBegin
{
  if (ReachabilityDidBegin_onceToken != -1)
    dispatch_once(&ReachabilityDidBegin_onceToken, &__block_literal_global_370);
  return (VOSOutputEvent *)(id)ReachabilityDidBegin__Event;
}

void __38__VOSOutputEvent_ReachabilityDidBegin__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("ReachabilityDidBegin"), 1, 0);
  v1 = (void *)ReachabilityDidBegin__Event;
  ReachabilityDidBegin__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)ReachabilityDidEnd
{
  if (ReachabilityDidEnd_onceToken != -1)
    dispatch_once(&ReachabilityDidEnd_onceToken, &__block_literal_global_373_0);
  return (VOSOutputEvent *)(id)ReachabilityDidEnd__Event;
}

void __36__VOSOutputEvent_ReachabilityDidEnd__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("ReachabilityDidEnd"), 1, 0);
  v1 = (void *)ReachabilityDidEnd__Event;
  ReachabilityDidEnd__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)TouchIDAuthenticated
{
  if (TouchIDAuthenticated_onceToken != -1)
    dispatch_once(&TouchIDAuthenticated_onceToken, &__block_literal_global_376_0);
  return (VOSOutputEvent *)(id)TouchIDAuthenticated__Event;
}

void __38__VOSOutputEvent_TouchIDAuthenticated__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("TouchIDAuthenticated"), 1, 1);
  v1 = (void *)TouchIDAuthenticated__Event;
  TouchIDAuthenticated__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)TouchIDFailed
{
  if (TouchIDFailed_onceToken != -1)
    dispatch_once(&TouchIDFailed_onceToken, &__block_literal_global_379);
  return (VOSOutputEvent *)(id)TouchIDFailed__Event;
}

void __31__VOSOutputEvent_TouchIDFailed__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("TouchIDFailed"), 1, 1);
  v1 = (void *)TouchIDFailed__Event;
  TouchIDFailed__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)SensitiveContent
{
  if (SensitiveContent_onceToken != -1)
    dispatch_once(&SensitiveContent_onceToken, &__block_literal_global_382);
  return (VOSOutputEvent *)(id)SensitiveContent__Event;
}

void __34__VOSOutputEvent_SensitiveContent__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("SensitiveContent"), 1, 0);
  v1 = (void *)SensitiveContent__Event;
  SensitiveContent__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)Startup
{
  if (Startup_onceToken != -1)
    dispatch_once(&Startup_onceToken, &__block_literal_global_385);
  return (VOSOutputEvent *)(id)Startup__Event;
}

void __25__VOSOutputEvent_Startup__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("Startup"), 0, 1);
  v1 = (void *)Startup__Event;
  Startup__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)TutorialSuccess
{
  if (TutorialSuccess_onceToken != -1)
    dispatch_once(&TutorialSuccess_onceToken, &__block_literal_global_388);
  return (VOSOutputEvent *)(id)TutorialSuccess__Event;
}

void __33__VOSOutputEvent_TutorialSuccess__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("TutorialSuccess"), 1, 0);
  v1 = (void *)TutorialSuccess__Event;
  TutorialSuccess__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)TutorialMagicTapStart
{
  if (TutorialMagicTapStart_onceToken != -1)
    dispatch_once(&TutorialMagicTapStart_onceToken, &__block_literal_global_391);
  return (VOSOutputEvent *)(id)TutorialMagicTapStart__Event;
}

void __39__VOSOutputEvent_TutorialMagicTapStart__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("TutorialMagicTapStart"), 1, 0);
  v1 = (void *)TutorialMagicTapStart__Event;
  TutorialMagicTapStart__Event = (uint64_t)v0;

}

+ (VOSOutputEvent)TutorialMagicTapStop
{
  if (TutorialMagicTapStop_onceToken != -1)
    dispatch_once(&TutorialMagicTapStop_onceToken, &__block_literal_global_394);
  return (VOSOutputEvent *)(id)TutorialMagicTapStop__Event;
}

void __38__VOSOutputEvent_TutorialMagicTapStop__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSOutputEvent _initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:]([VOSOutputEvent alloc], "_initOutputEventWithRawValue:supportsSoundEffect:supportsHaptic:", CFSTR("TutorialMagicTapStop"), 1, 0);
  v1 = (void *)TutorialMagicTapStop__Event;
  TutorialMagicTapStop__Event = (uint64_t)v0;

}

+ (NSSet)allOutputEvents
{
  if (allOutputEvents_onceToken != -1)
    dispatch_once(&allOutputEvents_onceToken, &__block_literal_global_397);
  return (NSSet *)(id)allOutputEvents__AllOutputEvents;
}

void __33__VOSOutputEvent_allOutputEvents__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;

  v14 = (void *)MEMORY[0x24BDBCF20];
  +[VOSOutputEvent DidActivateElement](VOSOutputEvent, "DidActivateElement");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent NoResultsFound](VOSOutputEvent, "NoResultsFound");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidFocusOnElement](VOSOutputEvent, "DidFocusOnElement");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidFocusOnScreenRecognitionElement](VOSOutputEvent, "DidFocusOnScreenRecognitionElement");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidScrollByPage](VOSOutputEvent, "DidScrollByPage");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent BoundaryEncountered](VOSOutputEvent, "BoundaryEncountered");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent NoItemExists](VOSOutputEvent, "NoItemExists");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent IsInteractable](VOSOutputEvent, "IsInteractable");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent InteractIn](VOSOutputEvent, "InteractIn");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent InteractOut](VOSOutputEvent, "InteractOut");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidSelectAutofill](VOSOutputEvent, "DidSelectAutofill");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidBeginPassthrough](VOSOutputEvent, "DidBeginPassthrough");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidSelectPreviousRotor](VOSOutputEvent, "DidSelectPreviousRotor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidSelectNextRotor](VOSOutputEvent, "DidSelectNextRotor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent PreviousRotorProgress](VOSOutputEvent, "PreviousRotorProgress");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent NextRotorProgress](VOSOutputEvent, "NextRotorProgress");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidEnterSecureText](VOSOutputEvent, "DidEnterSecureText");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidChangeTextSelectionDirection](VOSOutputEvent, "DidChangeTextSelectionDirection");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent UnknownCommand](VOSOutputEvent, "UnknownCommand");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidRecognizeMLContent](VOSOutputEvent, "DidRecognizeMLContent");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidEnterTargetArea](VOSOutputEvent, "DidEnterTargetArea");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidLeaveTargetArea](VOSOutputEvent, "DidLeaveTargetArea");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidSyncWithSystemFocus](VOSOutputEvent, "DidSyncWithSystemFocus");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidEnterTouchContainer](VOSOutputEvent, "DidEnterTouchContainer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidChangeVolume](VOSOutputEvent, "DidChangeVolume");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidReorderItem](VOSOutputEvent, "DidReorderItem");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidWrapBackwards](VOSOutputEvent, "DidWrapBackwards");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidWrapForwards](VOSOutputEvent, "DidWrapForwards");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidEnableQuickNav](VOSOutputEvent, "DidEnableQuickNav");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DidDisableQuickNav](VOSOutputEvent, "DidDisableQuickNav");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent TVDidBeginInteractionWithRotor](VOSOutputEvent, "TVDidBeginInteractionWithRotor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent TVDidEndInteractionWithRotor](VOSOutputEvent, "TVDidEndInteractionWithRotor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent BSIDidEnableTyping](VOSOutputEvent, "BSIDidEnableTyping");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent BSIDidEnableCommand](VOSOutputEvent, "BSIDidEnableCommand");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent BSIDidDisable](VOSOutputEvent, "BSIDidDisable");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent BSIDidCalibrate](VOSOutputEvent, "BSIDidCalibrate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent BSIDidCarriageReturn](VOSOutputEvent, "BSIDidCarriageReturn");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent BSIDidType](VOSOutputEvent, "BSIDidType");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent BSIDidDelete](VOSOutputEvent, "BSIDidDelete");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent BSIDidEnterSpace](VOSOutputEvent, "BSIDidEnterSpace");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent BSIDidEnterChord](VOSOutputEvent, "BSIDidEnterChord");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent BrailleDisplayReconnectionTriggered](VOSOutputEvent, "BrailleDisplayReconnectionTriggered");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent AlertDidAppear](VOSOutputEvent, "AlertDidAppear");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent NotificationDidAppear](VOSOutputEvent, "NotificationDidAppear");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent PopoverDidAppear](VOSOutputEvent, "PopoverDidAppear");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent AutofillDidAppear](VOSOutputEvent, "AutofillDidAppear");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent AutofillDidDismiss](VOSOutputEvent, "AutofillDidDismiss");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent ItemIsLoading](VOSOutputEvent, "ItemIsLoading");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent ItemDidLoad](VOSOutputEvent, "ItemDidLoad");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent ScreenDidTurnOff](VOSOutputEvent, "ScreenDidTurnOff");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent InsertionPointDidMove](VOSOutputEvent, "InsertionPointDidMove");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent KeyboardAppeared](VOSOutputEvent, "KeyboardAppeared");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent KeyboardDisappeared](VOSOutputEvent, "KeyboardDisappeared");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent ItemMemorizationSucceeded](VOSOutputEvent, "ItemMemorizationSucceeded");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent ScreenDidChange](VOSOutputEvent, "ScreenDidChange");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent CollaborationOccurred](VOSOutputEvent, "CollaborationOccurred");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent FolderWillOpen](VOSOutputEvent, "FolderWillOpen");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent FolderDidOpen](VOSOutputEvent, "FolderDidOpen");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent FolderDidClose](VOSOutputEvent, "FolderDidClose");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent BrailleDisplayConnected](VOSOutputEvent, "BrailleDisplayConnected");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent BrailleDisplayDisconnected](VOSOutputEvent, "BrailleDisplayDisconnected");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent ItemMemorizationFailed](VOSOutputEvent, "ItemMemorizationFailed");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent ItemMemorizationInProgress](VOSOutputEvent, "ItemMemorizationInProgress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DockDidAppear](VOSOutputEvent, "DockDidAppear");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent DockDidDisappear](VOSOutputEvent, "DockDidDisappear");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent ReachabilityDidBegin](VOSOutputEvent, "ReachabilityDidBegin");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent ReachabilityDidEnd](VOSOutputEvent, "ReachabilityDidEnd");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent TouchIDAuthenticated](VOSOutputEvent, "TouchIDAuthenticated");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent TouchIDFailed](VOSOutputEvent, "TouchIDFailed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent SensitiveContent](VOSOutputEvent, "SensitiveContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent Startup](VOSOutputEvent, "Startup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent TutorialSuccess](VOSOutputEvent, "TutorialSuccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent TutorialMagicTapStart](VOSOutputEvent, "TutorialMagicTapStart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSOutputEvent TutorialMagicTapStop](VOSOutputEvent, "TutorialMagicTapStop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithObjects:", v76, v75, v74, v73, v72, v71, v70, v69, v68, v67, v66, v65, v64, v63, v62, v61, v60,
    v59,
    v58,
    v57,
    v56,
    v55,
    v54,
    v53,
    v52,
    v51,
    v50,
    v49,
    v48,
    v47,
    v46,
    v45,
    v44,
    v43,
    v42,
    v41,
    v40,
    v39,
    v38,
    v37,
    v36,
    v35,
    v34,
    v33,
    v29,
    v31,
    v32,
    v30,
    v13,
    v28,
    v12,
    v27,
    v26,
    v25,
    v24,
    v23,
    v22,
    v21,
    v20,
    v19,
    v18);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)allOutputEvents__AllOutputEvents;
  allOutputEvents__AllOutputEvents = v7;

}

+ (VOSOutputEvent)eventWithStringValue:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  uint64_t v7;
  id *i;
  id *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "allOutputEvents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (id *)((char *)i + 1))
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9[1], "isEqualToString:", v4) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (VOSOutputEvent *)v6;
}

- (NSString)rawValue
{
  return self->_rawValue;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VOSOutputEvent.%@"), self->_rawValue);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VOSLocString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[VOSOutputEvent rawValue](self, "rawValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VOSOutputEvent localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("VOSOutputEvent<%p> %@ (%@)"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)supportsSoundEffect
{
  return self->_supportsSoundEffect;
}

- (void)setSupportsSoundEffect:(BOOL)a3
{
  self->_supportsSoundEffect = a3;
}

- (BOOL)supportsHaptic
{
  return self->_supportsHaptic;
}

- (void)setSupportsHaptic:(BOOL)a3
{
  self->_supportsHaptic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawValue, 0);
}

@end
