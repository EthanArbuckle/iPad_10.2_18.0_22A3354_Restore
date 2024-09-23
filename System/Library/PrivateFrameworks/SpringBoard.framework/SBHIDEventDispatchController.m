@implementation SBHIDEventDispatchController

+ (id)symbolicDeferringTokenForKeyboardFocus
{
  if (symbolicDeferringTokenForKeyboardFocus_onceToken != -1)
    dispatch_once(&symbolicDeferringTokenForKeyboardFocus_onceToken, &__block_literal_global_274);
  return (id)symbolicDeferringTokenForKeyboardFocus_token;
}

void __70__SBHIDEventDispatchController_symbolicDeferringTokenForKeyboardFocus__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D00CB8], "tokenForString:", CFSTR("SBKeyboardFocus"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)symbolicDeferringTokenForKeyboardFocus_token;
  symbolicDeferringTokenForKeyboardFocus_token = v0;

}

+ (id)symbolicDeferringTokenForSystemGesturesInDisplayConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "isMainDisplay"))
  {
    v7 = (void *)MEMORY[0x1E0D00CB8];
    objc_msgSend(v5, "hardwareIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("SBExternalDisplaySystemGestures-"), "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tokenForString:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "symbolicDeferringTokenForSystemGesturesOnMainDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)symbolicDeferringTokenForSystemGesturesOnMainDisplay
{
  if (symbolicDeferringTokenForSystemGesturesOnMainDisplay_onceToken != -1)
    dispatch_once(&symbolicDeferringTokenForSystemGesturesOnMainDisplay_onceToken, &__block_literal_global_11_4);
  return (id)symbolicDeferringTokenForSystemGesturesOnMainDisplay_token;
}

void __84__SBHIDEventDispatchController_symbolicDeferringTokenForSystemGesturesOnMainDisplay__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D00CB8], "tokenForString:", CFSTR("SBMainSystemGestures"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)symbolicDeferringTokenForSystemGesturesOnMainDisplay_token;
  symbolicDeferringTokenForSystemGesturesOnMainDisplay_token = v0;

}

- (id)_keyCommandDispatchingRule
{
  void *v3;
  void *v4;
  void *v5;
  BKSHIDEventDispatchingTarget *keyboardFocusDispatchingTarget;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D00CF0];
  objc_msgSend(MEMORY[0x1E0DAAED8], "systemKeyCommandOverlayEnvironment", self->_mainSystemDispatchingTarget);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetForDeferringEnvironment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  keyboardFocusDispatchingTarget = self->_keyboardFocusDispatchingTarget;
  v11[1] = v5;
  v11[2] = keyboardFocusDispatchingTarget;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(MEMORY[0x1E0D00DA0], "new");
  objc_msgSend(v8, "setDisplays:", 0);
  objc_msgSend(MEMORY[0x1E0D00D10], "ruleForDispatchingKeyCommandsMatchingPredicate:toTargets:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_42 != -1)
    dispatch_once(&sharedInstance_onceToken_42, &__block_literal_global_19_2);
  return (id)sharedInstance_controller;
}

void __46__SBHIDEventDispatchController_sharedInstance__block_invoke()
{
  SBHIDEventDispatchController *v0;
  void *v1;

  v0 = objc_alloc_init(SBHIDEventDispatchController);
  v1 = (void *)sharedInstance_controller;
  sharedInstance_controller = (uint64_t)v0;

}

- (SBHIDEventDispatchController)init
{
  SBHIDEventDispatchController *v2;
  uint64_t v3;
  BKSHIDEventDeliveryManager *deliveryManager;
  void *v5;
  void *v6;
  uint64_t v7;
  BKSHIDEventDispatchingTarget *mainSystemDispatchingTarget;
  void *v9;
  void *v10;
  uint64_t v11;
  BKSHIDEventDispatchingTarget *keyboardFocusDispatchingTarget;
  BKSHIDEventDispatchingTarget *v13;
  void *v14;
  void *v15;
  BKSHIDEventDispatchingTarget *v16;
  void *v17;
  id v18;
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
  BKSHIDEventDispatchingTarget *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSArray *dispatchingRulesForMainRoot;
  BKSHIDEventDeliveryManager *v60;
  void *v61;
  uint64_t v62;
  BSInvalidatable *dispatchingAssertionForCaptureButton;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  BKSHIDEventDeliveryManager *v69;
  void *v70;
  uint64_t v71;
  BSInvalidatable *dispatchingAssertionForVoiceCommand;
  void *v73;
  uint64_t v74;
  BSInvalidatable *keyCommandDispatchingAssertion;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  BKSHIDEventDispatchingTarget *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  objc_super v100;
  void *v101;
  void *v102;
  _QWORD v103[12];

  v103[10] = *MEMORY[0x1E0C80C00];
  v100.receiver = self;
  v100.super_class = (Class)SBHIDEventDispatchController;
  v2 = -[SBHIDEventDispatchController init](&v100, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    deliveryManager = v2->_deliveryManager;
    v2->_deliveryManager = (BKSHIDEventDeliveryManager *)v3;

    v5 = (void *)MEMORY[0x1E0D00CF0];
    +[SBHIDEventDispatchController symbolicDeferringTokenForSystemGesturesOnMainDisplay](SBHIDEventDispatchController, "symbolicDeferringTokenForSystemGesturesOnMainDisplay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemTargetWithDeferringToken:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    mainSystemDispatchingTarget = v2->_mainSystemDispatchingTarget;
    v2->_mainSystemDispatchingTarget = (BKSHIDEventDispatchingTarget *)v7;

    v9 = (void *)MEMORY[0x1E0D00CF0];
    +[SBHIDEventDispatchController symbolicDeferringTokenForKeyboardFocus](SBHIDEventDispatchController, "symbolicDeferringTokenForKeyboardFocus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keyboardFocusTargetWithDeferringToken:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    keyboardFocusDispatchingTarget = v2->_keyboardFocusDispatchingTarget;
    v2->_keyboardFocusDispatchingTarget = (BKSHIDEventDispatchingTarget *)v11;

    v13 = v2->_mainSystemDispatchingTarget;
    v14 = (void *)MEMORY[0x1E0D00CF0];
    v15 = (void *)MEMORY[0x1E0D00CA8];
    v94 = v2->_keyboardFocusDispatchingTarget;
    v16 = v13;
    objc_msgSend(v15, "ui_cameraCaptureButtonEnvironment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "targetForDeferringEnvironment:", v17);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 179);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);

    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 226);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v20);

    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 177);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v21);

    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 176);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v22);

    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 205);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v23);

    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 185);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v24);

    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 188);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v25);

    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 180);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v26);

    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 181);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v27);

    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 182);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v28);

    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 183);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v29);

    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 203);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v30);

    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 202);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v31);

    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 190);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v32);

    _SBHIDDispatchPredicateFromAnyService(v18);
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v92, v16);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 547);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setWithObject:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    _SBHIDDispatchPredicateFromHardwareType(v35, 4);
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v91, v94);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0D00CD8], "descriptorWithEventType:", 42);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setWithObject:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    _SBHIDDispatchPredicateFromAnyService(v38);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v89, v16);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v89, v90);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0D00D00], "descriptorWithGenericGestureType:", 5);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setWithObject:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    _SBHIDDispatchPredicateFromAnyService(v41);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v88, v16);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 11, 47);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setWithObject:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    _SBHIDDispatchPredicateFromAnyService(v44);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v87, v16);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    _SBHIDTrackpadPredicate();
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v16;
    objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v86, v16);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0D00CF8], "builtinDisplay");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D00CF8], "nullDisplay");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setWithObjects:", v47, v48, 0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    _SBHIDSendersForDisplays(v85);
    v49 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D00D98], "defaultSystemPredicate");
    v83 = (void *)v49;
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setSenderDescriptors:", v49);
    objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v84, v45);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D00D98], "defaultFocusPredicate");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setSenderDescriptors:", v49);
    objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v81, v94);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0D00CD8], "descriptorWithEventType:", 16);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setWithObject:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    _SBHIDDispatchPredicateFromHardwareType(v52, 1);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v80, v45);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0D00D38], "descriptorWithPage:usage:", 65280, 89);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setWithObject:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    _SBHIDDispatchPredicateFromHardwareType(v55, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v56, v45);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v95;
    v103[1] = v93;
    v103[2] = v99;
    v103[3] = v98;
    v103[4] = v96;
    v103[5] = v97;
    v103[6] = v79;
    v103[7] = v78;
    v103[8] = v77;
    v103[9] = v57;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 10);
    v58 = objc_claimAutoreleasedReturnValue();
    dispatchingRulesForMainRoot = v2->_dispatchingRulesForMainRoot;
    v2->_dispatchingRulesForMainRoot = (NSArray *)v58;

    -[SBHIDEventDispatchController _resetMainDeliveryRoot](v2, "_resetMainDeliveryRoot");
    v60 = v2->_deliveryManager;
    v102 = v82;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSHIDEventDeliveryManager dispatchDiscreteEventsForReason:withRules:](v60, "dispatchDiscreteEventsForReason:withRules:", CFSTR("SB-CaptureButton"), v61);
    v62 = objc_claimAutoreleasedReturnValue();
    dispatchingAssertionForCaptureButton = v2->_dispatchingAssertionForCaptureButton;
    v2->_dispatchingAssertionForCaptureButton = (BSInvalidatable *)v62;

    v64 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 12, 207);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setWithObject:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    _SBHIDDispatchPredicateFromHardwareType(v66, 3);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v67, v94);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v2->_deliveryManager;
    v101 = v68;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSHIDEventDeliveryManager dispatchDiscreteEventsForReason:withRules:](v69, "dispatchDiscreteEventsForReason:withRules:", CFSTR("SB-VoiceCommand"), v70);
    v71 = objc_claimAutoreleasedReturnValue();
    dispatchingAssertionForVoiceCommand = v2->_dispatchingAssertionForVoiceCommand;
    v2->_dispatchingAssertionForVoiceCommand = (BSInvalidatable *)v71;

    -[SBHIDEventDispatchController _keyCommandDispatchingRule](v2, "_keyCommandDispatchingRule");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSHIDEventDeliveryManager dispatchKeyCommandsForReason:withRule:](v2->_deliveryManager, "dispatchKeyCommandsForReason:withRule:", CFSTR("SB-KeyCommands"), v73);
    v74 = objc_claimAutoreleasedReturnValue();
    keyCommandDispatchingAssertion = v2->_keyCommandDispatchingAssertion;
    v2->_keyCommandDispatchingAssertion = (BSInvalidatable *)v74;

  }
  return v2;
}

- (id)configureDispatchRootsForChamoisDisplay:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BKSHIDEventDiscreteDispatchingRule *v16;
  BKSHIDEventDiscreteDispatchingRule *chamoisTrackpadRule;
  void *v18;
  NSArray *v19;
  NSArray *dispatchingRulesForMainRoot;
  id v21;
  void *v22;
  id result;
  void *v24;
  _QWORD v25[5];

  v5 = a3;
  objc_msgSend(v5, "hardwareIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)MEMORY[0x1E0D00CF0];
    +[SBHIDEventDispatchController symbolicDeferringTokenForSystemGesturesInDisplayConfiguration:](SBHIDEventDispatchController, "symbolicDeferringTokenForSystemGesturesInDisplayConfiguration:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemTargetWithDeferringToken:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0D00CF8], "displayWithHardwareIdentifier:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    _SBHIDSendersForDisplays(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _SBHIDTrackpadPredicate();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSenderDescriptors:", v14);
    objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v15, v10);
    v16 = (BKSHIDEventDiscreteDispatchingRule *)objc_claimAutoreleasedReturnValue();
    chamoisTrackpadRule = self->_chamoisTrackpadRule;
    self->_chamoisTrackpadRule = v16;

    v18 = (void *)-[NSArray mutableCopy](self->_dispatchingRulesForMainRoot, "mutableCopy");
    objc_msgSend(v18, "insertObject:atIndex:", self->_chamoisTrackpadRule, 0);
    v19 = (NSArray *)objc_msgSend(v18, "copy");
    dispatchingRulesForMainRoot = self->_dispatchingRulesForMainRoot;
    self->_dispatchingRulesForMainRoot = v19;

    -[SBHIDEventDispatchController _resetMainDeliveryRoot](self, "_resetMainDeliveryRoot");
    v21 = objc_alloc(MEMORY[0x1E0D01868]);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __72__SBHIDEventDispatchController_configureDispatchRootsForChamoisDisplay___block_invoke;
    v25[3] = &unk_1E8E9DCD8;
    v25[4] = self;
    v22 = (void *)objc_msgSend(v21, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SBChamoisTrackpadRule"), CFSTR("trackpad rule for chamois"), v25);

    return v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("hardwareIdentifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBHIDEventDispatchController configureDispatchRootsForChamoisDisplay:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

void __72__SBHIDEventDispatchController_configureDispatchRootsForChamoisDisplay___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "mutableCopy");
  objc_msgSend(v7, "removeObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;

  v4 = objc_msgSend(v7, "copy");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v4;

  objc_msgSend(*(id *)(a1 + 32), "_resetMainDeliveryRoot");
}

- (id)configureDispatchRootsForContinuityDisplay:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BKSHIDEventDispatchingTarget *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BKSHIDEventDeliveryManager *deliveryManager;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "hardwareIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("hardwareIdentifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBHIDEventDispatchController configureDispatchRootsForContinuityDisplay:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0B49E78);
  }
  v7 = (void *)v6;
  v8 = (void *)MEMORY[0x1E0D00CF0];
  +[SBHIDEventDispatchController symbolicDeferringTokenForSystemGesturesInDisplayConfiguration:](SBHIDEventDispatchController, "symbolicDeferringTokenForSystemGesturesInDisplayConfiguration:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemTargetWithDeferringToken:", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = (void *)MEMORY[0x1E0D00CF8];
  v12 = self->_keyboardFocusDispatchingTarget;
  objc_msgSend(v11, "displayWithHardwareIdentifier:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _SBHIDSendersForDisplays(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v5;
  objc_msgSend(MEMORY[0x1E0D00D98], "defaultSystemPredicate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSenderDescriptors:", v15);
  objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v16, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D00D98], "defaultFocusPredicate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSenderDescriptors:", v15);
  objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v18, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  deliveryManager = self->_deliveryManager;
  v27[0] = v17;
  v27[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKSHIDEventDeliveryManager dispatchDiscreteEventsForReason:withRules:](deliveryManager, "dispatchDiscreteEventsForReason:withRules:", CFSTR("SB-Continuity"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)dispatchKeyboardUsagesToSystemEnvironment:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  BSCompoundAssertion *overrideKeyboardUsagesForSystemEnvironment;
  BSCompoundAssertion *v9;
  BSCompoundAssertion *v10;
  void *v11;
  _QWORD v13[5];

  v6 = a3;
  v7 = a4;
  overrideKeyboardUsagesForSystemEnvironment = self->_overrideKeyboardUsagesForSystemEnvironment;
  if (!overrideKeyboardUsagesForSystemEnvironment)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__SBHIDEventDispatchController_dispatchKeyboardUsagesToSystemEnvironment_reason___block_invoke;
    v13[3] = &unk_1E8EB3470;
    v13[4] = self;
    objc_msgSend(MEMORY[0x1E0D01718], "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("overrideKeyboardUsagesForSystemEnvironment"), v13);
    v9 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v10 = self->_overrideKeyboardUsagesForSystemEnvironment;
    self->_overrideKeyboardUsagesForSystemEnvironment = v9;

    overrideKeyboardUsagesForSystemEnvironment = self->_overrideKeyboardUsagesForSystemEnvironment;
  }
  -[BSCompoundAssertion acquireForReason:withContext:](overrideKeyboardUsagesForSystemEnvironment, "acquireForReason:withContext:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __81__SBHIDEventDispatchController_dispatchKeyboardUsagesToSystemEnvironment_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetMainDeliveryRoot");
}

- (void)_resetMainDeliveryRoot
{
  SBHIDEventDispatchController *v2;
  void *v3;
  BSInvalidatable *dispatchingAssertion;
  void *v5;
  uint64_t v6;
  NSArray *dispatchingRulesForMainRoot;
  BKSHIDEventDiscreteDispatchingRule *overrideKeyboardUsagesRule;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  uint64_t v21;
  BKSHIDEventDiscreteDispatchingRule *v22;
  void *v23;
  uint64_t v24;
  NSArray *v25;
  uint64_t v26;
  BSInvalidatable *v27;
  id v28;
  SBHIDEventDispatchController *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v2 = self;
  v41 = *MEMORY[0x1E0C80C00];
  -[BKSHIDEventDeliveryManager transactionAssertionWithReason:](self->_deliveryManager, "transactionAssertionWithReason:", CFSTR("_resetMainDeliveryRoot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSInvalidatable invalidate](v2->_dispatchingAssertion, "invalidate");
  dispatchingAssertion = v2->_dispatchingAssertion;
  v2->_dispatchingAssertion = 0;

  if (v2->_overrideKeyboardUsagesRule)
  {
    v5 = (void *)-[NSArray mutableCopy](v2->_dispatchingRulesForMainRoot, "mutableCopy");
    objc_msgSend(v5, "removeObject:", v2->_overrideKeyboardUsagesRule);
    v6 = objc_msgSend(v5, "copy");
    dispatchingRulesForMainRoot = v2->_dispatchingRulesForMainRoot;
    v2->_dispatchingRulesForMainRoot = (NSArray *)v6;

    overrideKeyboardUsagesRule = v2->_overrideKeyboardUsagesRule;
    v2->_overrideKeyboardUsagesRule = 0;

  }
  if (-[BSCompoundAssertion isActive](v2->_overrideKeyboardUsagesForSystemEnvironment, "isActive"))
  {
    v28 = objc_alloc_init(MEMORY[0x1E0D00D98]);
    objc_msgSend(v28, "setSenderDescriptors:", 0);
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v29 = v2;
    -[BSCompoundAssertion orderedContext](v2->_overrideKeyboardUsagesForSystemEnvironment, "orderedContext");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v32;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v32 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 7, objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "unsignedIntValue"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "addObject:", v20);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            }
            while (v17);
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v11);
    }

    objc_msgSend(v28, "setDescriptors:", v9);
    v2 = v29;
    objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v28, v29->_mainSystemDispatchingTarget);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v29->_overrideKeyboardUsagesRule;
    v29->_overrideKeyboardUsagesRule = (BKSHIDEventDiscreteDispatchingRule *)v21;

    v23 = (void *)-[NSArray mutableCopy](v29->_dispatchingRulesForMainRoot, "mutableCopy");
    objc_msgSend(v23, "insertObject:atIndex:", v29->_overrideKeyboardUsagesRule, 0);
    v24 = objc_msgSend(v23, "copy");
    v25 = v29->_dispatchingRulesForMainRoot;
    v29->_dispatchingRulesForMainRoot = (NSArray *)v24;

  }
  -[BKSHIDEventDeliveryManager dispatchDiscreteEventsForReason:withRules:](v2->_deliveryManager, "dispatchDiscreteEventsForReason:withRules:", CFSTR("SB-Default"), v2->_dispatchingRulesForMainRoot);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v2->_dispatchingAssertion;
  v2->_dispatchingAssertion = (BSInvalidatable *)v26;

  objc_msgSend(v3, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardFocusDispatchingTarget, 0);
  objc_storeStrong((id *)&self->_mainSystemDispatchingTarget, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
  objc_storeStrong((id *)&self->_dispatchingRulesForMainRoot, 0);
  objc_storeStrong((id *)&self->_chamoisTrackpadRule, 0);
  objc_storeStrong((id *)&self->_overrideKeyboardUsagesRule, 0);
  objc_storeStrong((id *)&self->_overrideKeyboardUsagesForSystemEnvironment, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertionForCaptureButton, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertionForPrototypingCaptureButton, 0);
  objc_storeStrong((id *)&self->_keyCommandDispatchingAssertion, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertionForVoiceCommand, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertion, 0);
}

- (void)configureDispatchRootsForChamoisDisplay:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)configureDispatchRootsForContinuityDisplay:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
