@implementation SBSAContainerDynamicsPulseAnimationProvider

- (SBSAContainerDynamicsPulseAnimationProvider)initWithElementIdentity:(id)a3 pulseStyle:(int64_t)a4
{
  id v6;
  SBSAContainerDynamicsPulseAnimationProvider *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  SBSAElementIdentification *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  SAElementIdentifying *elementIdentity;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSAContainerDynamicsPulseAnimationProvider;
  v7 = -[SBSABasePreferencesProvider initWithParentProvider:](&v17, sel_initWithParentProvider_, 0);
  if (v7)
  {
    objc_msgSend(v6, "clientIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v6, "elementIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = [SBSAElementIdentification alloc];
        objc_msgSend(v6, "clientIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "elementIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[SBSAElementIdentification initWithClientIdentifier:elementIdentifier:](v11, "initWithClientIdentifier:elementIdentifier:", v12, v13);
        elementIdentity = v7->_elementIdentity;
        v7->_elementIdentity = (SAElementIdentifying *)v14;

      }
    }
    v7->_pulseStyle = a4;
  }

  return v7;
}

- (id)preferencesFromContext:(id)a3
{
  id v5;
  int64_t phase;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  Class v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v33;
  const __CFString *v34;
  unint64_t v35;
  const __CFString *v36;
  _QWORD v37[7];
  objc_super v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  const __CFString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  phase = self->_phase;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__29;
  v43 = __Block_byref_object_dispose__29;
  v44 = 0;
  v7 = v5;
  if (!v7)
    goto LABEL_9;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = NSClassFromString(CFSTR("SBSAContext"));
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAContainerDynamicsPulseAnimationProvider.m"), 73, CFSTR("Unexpected class – expected '%@', got '%@'"), v13, v15);

LABEL_9:
    v11 = 0;
  }

  v16 = (void *)v40[5];
  v40[5] = (uint64_t)v11;

  objc_msgSend((id)v40[5], "preferences");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_class();
  v19 = v17;
  if (v18)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
  }
  else
  {
    v20 = 0;
  }
  v21 = v20;

  v22 = v40[5];
  v38.receiver = self;
  v38.super_class = (Class)SBSAContainerDynamicsPulseAnimationProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v38, sel_preferencesFromContext_, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_class();
  v25 = v23;
  if (v24)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
  }
  else
  {
    v26 = 0;
  }
  v27 = v26;

  -[SBSAContainerDynamicsPulseAnimationProvider _checkContextForCompletedContractionAnimationMilestone:](self, "_checkContextForCompletedContractionAnimationMilestone:", v40[5]);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __70__SBSAContainerDynamicsPulseAnimationProvider_preferencesFromContext___block_invoke;
  v37[3] = &unk_1E8EA95B0;
  v37[4] = self;
  v37[5] = &v39;
  v37[6] = a2;
  v28 = (void *)objc_msgSend(v27, "copyWithBlock:", v37);

  if (phase != self->_phase)
  {
    SBLogSystemAperturePreferencesStackDynamicsAnimations();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v33 = objc_msgSend((id)v40[5], "queryIteration");
      if ((unint64_t)(phase - 1) > 3)
        v34 = CFSTR("Idle");
      else
        v34 = off_1E8EA9620[phase - 1];
      v35 = self->_phase - 1;
      if (v35 > 3)
        v36 = CFSTR("Idle");
      else
        v36 = off_1E8EA9620[v35];
      *(_DWORD *)buf = 134349570;
      v46 = v33;
      v47 = 2112;
      v48 = v34;
      v49 = 2112;
      v50 = v36;
      _os_log_debug_impl(&dword_1D0540000, v29, OS_LOG_TYPE_DEBUG, "[%{public}lu] Pulse phase changed from: %@ to: %@", buf, 0x20u);
    }

  }
  v30 = objc_msgSend((id)v40[5], "copyByUpdatingPreferences:", v28);
  v31 = (void *)v40[5];
  v40[5] = v30;

  if (self->_phase == 4)
    -[SBSABasePreferencesProvider removeFromParentProvider](self, "removeFromParentProvider");
  _Block_object_dispose(&v39, 8);

  return v28;
}

void __70__SBSAContainerDynamicsPulseAnimationProvider_preferencesFromContext___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  Class v11;
  objc_class *v12;
  void *v13;
  _QWORD *v14;
  id v15;

  v3 = a2;
  v15 = v3;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  v3 = v15;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a1[6];
    v10 = a1[4];
    v11 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAContainerDynamicsPulseAnimationProvider.m"), 78, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v15;
LABEL_9:
    v7 = 0;
  }

  v14 = (_QWORD *)a1[4];
  switch(v14[4])
  {
    case 0:
      v14[4] = 1;
      v14 = (_QWORD *)a1[4];
      goto LABEL_12;
    case 1:
LABEL_12:
      objc_msgSend(v14, "_pulseWaitingToExpandWithPreferencesMutator:context:", v7, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
      break;
    case 2:
      objc_msgSend(v14, "_pulseExpandWithPreferencesMutator:context:", v7, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
      break;
    case 3:
      objc_msgSend(v14, "_pulseContractWithPreferencesMutator:context:", v7, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
      break;
    default:
      break;
  }

}

- (void)didRequestAdditionalPulse:(id)a3
{
  int64_t phase;
  int *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SBSAElementIdentification *v12;
  void *v13;
  void *v14;
  SAElementIdentifying *v15;
  SAElementIdentifying *elementIdentity;
  id v17;

  v17 = a3;
  phase = self->_phase;
  if (phase == 1)
  {
    v5 = &OBJC_IVAR___SBSAContainerDynamicsPulseAnimationProvider__waitingToExpandTimerIdentifier;
    goto LABEL_5;
  }
  if (phase == 2)
  {
    v5 = &OBJC_IVAR___SBSAContainerDynamicsPulseAnimationProvider__expandingTimerIdentifier;
LABEL_5:
    v6 = *v5;
    v7 = *(Class *)((char *)&self->super.super.isa + v6);
    *(Class *)((char *)&self->super.super.isa + v6) = 0;

  }
  self->_phase = 0;
  objc_msgSend(v17, "participantIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9
    && (v10 = (void *)v9,
        objc_msgSend(v8, "elementIdentifier"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    v12 = [SBSAElementIdentification alloc];
    objc_msgSend(v8, "clientIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "elementIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SBSAElementIdentification initWithClientIdentifier:elementIdentifier:](v12, "initWithClientIdentifier:elementIdentifier:", v13, v14);
    elementIdentity = self->_elementIdentity;
    self->_elementIdentity = v15;

  }
  else
  {
    v13 = self->_elementIdentity;
    self->_elementIdentity = 0;
  }

  self->_pulseStyle = objc_msgSend(v17, "pulseStyle");
}

- (id)_pulseSettings
{
  void *v3;
  void *v4;
  int64_t pulseStyle;
  SBSAContainerDynamicsPulseAnimationProvider *v6;

  objc_msgSend((id)objc_opt_class(), "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  pulseStyle = self->_pulseStyle;
  if (!pulseStyle)
  {
    objc_msgSend(v3, "pulseNoActionSettings");
    v6 = (SBSAContainerDynamicsPulseAnimationProvider *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (pulseStyle == 1)
  {
    objc_msgSend(v3, "pulseIndicatorSettings");
    v6 = (SBSAContainerDynamicsPulseAnimationProvider *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    self = v6;
  }

  return self;
}

- (void)_pulseWaitingToExpandWithPreferencesMutator:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  NSUUID *v8;
  NSUUID *expandingTimerIdentifier;
  id v10;

  v10 = a3;
  v6 = a4;
  if (-[SBSAContainerDynamicsPulseAnimationProvider _isTimerExpiredWithIdentifier:context:](self, "_isTimerExpiredWithIdentifier:context:", self->_expandingTimerIdentifier, v6))
  {
    self->_phase = 2;
    -[SBSAContainerDynamicsPulseAnimationProvider _pulseExpandWithPreferencesMutator:context:](self, "_pulseExpandWithPreferencesMutator:context:", v10, v6);
  }
  else if (!self->_expandingTimerIdentifier)
  {
    -[SBSAContainerDynamicsPulseAnimationProvider _pulseSettings](self, "_pulseSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "expandDelay");
    -[SBSAContainerDynamicsPulseAnimationProvider _startTimerForDuration:preferencesMutator:](self, "_startTimerForDuration:preferencesMutator:", v10);
    v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    expandingTimerIdentifier = self->_expandingTimerIdentifier;
    self->_expandingTimerIdentifier = v8;

  }
}

- (void)_pulseExpandWithPreferencesMutator:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSUUID *v9;
  NSUUID *expandingTimerIdentifier;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  SAElementIdentifying *elementIdentity;
  _QWORD v22[5];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  SAElementIdentifying *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[SBSAContainerDynamicsPulseAnimationProvider _isTimerExpiredWithIdentifier:context:](self, "_isTimerExpiredWithIdentifier:context:", self->_expandingTimerIdentifier, v7))
  {
    self->_phase = 3;
    -[SBSAContainerDynamicsPulseAnimationProvider _pulseContractWithPreferencesMutator:context:](self, "_pulseContractWithPreferencesMutator:context:", v6, v7);
  }
  else
  {
    if (!self->_expandingTimerIdentifier)
    {
      -[SBSAContainerDynamicsPulseAnimationProvider _pulseSettings](self, "_pulseSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "expandDuration");
      -[SBSAContainerDynamicsPulseAnimationProvider _startTimerForDuration:preferencesMutator:](self, "_startTimerForDuration:preferencesMutator:", v6);
      v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      expandingTimerIdentifier = self->_expandingTimerIdentifier;
      self->_expandingTimerIdentifier = v9;

    }
    objc_msgSend(v6, "containerViewDescriptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __90__SBSAContainerDynamicsPulseAnimationProvider__pulseExpandWithPreferencesMutator_context___block_invoke;
    v22[3] = &unk_1E8EA6A60;
    v22[4] = self;
    objc_msgSend(v11, "bs_firstObjectPassingTest:", v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "interfaceElementIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[SBSAContainerDynamicsPulseAnimationProvider _pulseSettings](self, "_pulseSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "expandScale");
      v16 = v15;
      -[SBSAContainerDynamicsPulseAnimationProvider _pulseSettings](self, "_pulseSettings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "expandBehaviorSettings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSAContainerDynamicsPulseAnimationProvider _updatePreferencesContainerWithInterfaceElementIdentifier:toScale:settings:preferencesMutator:context:](self, "_updatePreferencesContainerWithInterfaceElementIdentifier:toScale:settings:preferencesMutator:context:", v13, v18, v6, v7, v16);

      objc_storeWeak((id *)&self->_expandedInterfaceElementIdentifier, v13);
    }
    else
    {
      self->_phase = 4;
      SBLogSystemAperturePreferencesStackDynamicsAnimations();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_msgSend(v7, "queryIteration");
        elementIdentity = self->_elementIdentity;
        *(_DWORD *)buf = 134349314;
        v24 = v20;
        v25 = 2112;
        v26 = elementIdentity;
        _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}lu] [Pulse] Element requested for pulse not found. Ignoring pulse request for: '%@'", buf, 0x16u);
      }

    }
  }

}

uint64_t __90__SBSAContainerDynamicsPulseAnimationProvider__pulseExpandWithPreferencesMutator_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "associatedSystemApertureElementIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

- (void)_pulseContractWithPreferencesMutator:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  SBSAInterfaceElementPropertyIdentity *v11;
  SBSAInterfaceElementPropertyIdentity *v12;
  NSObject *v13;
  SBSAInterfaceElementPropertyIdentity *contractionCompletionMilestonePropertyIdentity;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_expandedInterfaceElementIdentifier);
  if (!WeakRetained)
  {
    self->_phase = 4;
    contractionCompletionMilestonePropertyIdentity = self->_contractionCompletionMilestonePropertyIdentity;
    self->_contractionCompletionMilestonePropertyIdentity = 0;

    SBLogSystemAperturePreferencesStackDynamicsAnimations();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[SBSAContainerDynamicsPulseAnimationProvider _pulseContractWithPreferencesMutator:context:].cold.1(v7);
    goto LABEL_6;
  }
  -[SBSAContainerDynamicsPulseAnimationProvider _pulseSettings](self, "_pulseSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contractBehaviorSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSAContainerDynamicsPulseAnimationProvider _updatePreferencesContainerWithInterfaceElementIdentifier:toScale:settings:preferencesMutator:context:](self, "_updatePreferencesContainerWithInterfaceElementIdentifier:toScale:settings:preferencesMutator:context:", WeakRetained, v10, v6, v7, 1.0);

  if (!self->_contractionCompletionMilestonePropertyIdentity)
  {
    v11 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:]([SBSAInterfaceElementPropertyIdentity alloc], "initWithAssociatedInterfaceElementIdentifier:andProperty:", WeakRetained, CFSTR("bounds"));
    v12 = self->_contractionCompletionMilestonePropertyIdentity;
    self->_contractionCompletionMilestonePropertyIdentity = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", 0x1E91CF8F8, 0);
    objc_msgSend(v6, "addMilestones:forPropertyIdentity:", v13, self->_contractionCompletionMilestonePropertyIdentity);
LABEL_6:

  }
  objc_storeWeak((id *)&self->_expandedInterfaceElementIdentifier, 0);

}

- (void)_checkContextForCompletedContractionAnimationMilestone:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  SBSAInterfaceElementPropertyIdentity *contractionCompletionMilestonePropertyIdentity;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_phase == 3)
  {
    if (!self->_contractionCompletionMilestonePropertyIdentity)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAContainerDynamicsPulseAnimationProvider.m"), 205, CFSTR("If we are in the contract phase, we should be tracking the contraction milestone"));

    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = v5;
    objc_msgSend(v5, "animatedTransitionResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v11, "associatedInterfaceElementPropertyIdentity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = BSEqualObjects();

          if (v13 && objc_msgSend(v11, "isTransitionEndTargeted"))
          {
            self->_phase = 4;
            contractionCompletionMilestonePropertyIdentity = self->_contractionCompletionMilestonePropertyIdentity;
            self->_contractionCompletionMilestonePropertyIdentity = 0;

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    v5 = v16;
  }

}

- (BOOL)_isTimerExpiredWithIdentifier:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  NSUUID *expandingTimerIdentifier;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  objc_msgSend(a4, "elapsedTimerDescriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__SBSAContainerDynamicsPulseAnimationProvider__isTimerExpiredWithIdentifier_context___block_invoke;
    v12[3] = &unk_1E8EA95D8;
    v13 = v6;
    v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", v12);
    v9 = v8 != 0x7FFFFFFFFFFFFFFFLL;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      expandingTimerIdentifier = self->_expandingTimerIdentifier;
      self->_expandingTimerIdentifier = 0;

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __85__SBSAContainerDynamicsPulseAnimationProvider__isTimerExpiredWithIdentifier_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "timerDescriptionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BSEqualObjects();

  return v3;
}

- (id)_startTimerForDuration:(double)a3 preferencesMutator:(id)a4
{
  id v5;
  SBSATimerDescription *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = -[SBSATimerDescription initWithTimeInterval:]([SBSATimerDescription alloc], "initWithTimeInterval:", a3);
  -[SBSATimerDescription timerDescriptionIdentifier](v6, "timerDescriptionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timerDescriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v5, "timerDescriptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "mutableCopy");

  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }

  objc_msgSend(v10, "addObject:", v6);
  objc_msgSend(v5, "setTimerDescriptions:", v10);

  return v7;
}

- (void)_updatePreferencesContainerWithInterfaceElementIdentifier:(id)a3 toScale:(double)a4 settings:(id)a5 preferencesMutator:(id)a6 context:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  SBSAInterfaceElementPropertyIdentity *v25;
  void *v26;
  SBSAInterfaceElementPropertyIdentity *v27;
  SBSAInterfaceElementPropertyIdentity *v28;
  id v29;
  void *v30;
  SBSAInterfaceElementPropertyIdentity *v31;
  SBSAInterfaceElementPropertyIdentity *v32;
  void *v33;
  SBSAInterfaceElementPropertyIdentity *v34;
  SBSAInterfaceElementPropertyIdentity *v35;
  void *v36;
  SBSAInterfaceElementPropertyIdentity *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v42[5];
  id v43;
  id v44;
  SEL v45;
  double v46;
  _QWORD v47[4];
  id v48;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v15, "containerViewDescriptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  v19 = MEMORY[0x1E0C809B0];
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __149__SBSAContainerDynamicsPulseAnimationProvider__updatePreferencesContainerWithInterfaceElementIdentifier_toScale_settings_preferencesMutator_context___block_invoke;
  v47[3] = &unk_1E8EA6A60;
  v20 = v13;
  v48 = v20;
  objc_msgSend(v18, "bs_firstObjectPassingTest:", v47);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v42[0] = v19;
    v42[1] = 3221225472;
    v42[2] = __149__SBSAContainerDynamicsPulseAnimationProvider__updatePreferencesContainerWithInterfaceElementIdentifier_toScale_settings_preferencesMutator_context___block_invoke_2;
    v42[3] = &unk_1E8EA9600;
    v45 = a2;
    v42[4] = self;
    v23 = v21;
    v43 = v23;
    v46 = a4;
    v44 = v16;
    v39 = (void *)objc_msgSend(v23, "copyWithBlock:", v42);
    objc_msgSend(v18, "replaceObjectAtIndex:withObject:", 0, v39);
    objc_msgSend(v15, "setContainerViewDescriptions:", v18);
    v24 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v14);
    v41 = v14;
    v25 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(v23, "interfaceElementIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v25, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v26, CFSTR("bounds"));

    objc_msgSend(v15, "setAnimatedTransitionDescription:forProperty:withMilestones:", v24, v27, 0);
    v28 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(v23, "interfaceElementIdentifier");
    v40 = v20;
    v29 = v16;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v28, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v30, CFSTR("contentScale"));
    objc_msgSend(v15, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v27, v31, 0);

    v32 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(v23, "interfaceElementIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v32, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v33, CFSTR("contentBounds"));
    objc_msgSend(v15, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v27, v34, 0);

    v35 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(v23, "interfaceElementIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v35, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v36, CFSTR("contentCenter"));
    objc_msgSend(v15, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v27, v37, 0);

    v16 = v29;
    v20 = v40;

    v14 = v41;
  }
  else
  {
    self->_phase = 4;
    SBLogSystemAperturePreferencesStackDynamicsAnimations();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      -[SBSAContainerDynamicsPulseAnimationProvider _updatePreferencesContainerWithInterfaceElementIdentifier:toScale:settings:preferencesMutator:context:].cold.1(v16);

  }
}

uint64_t __149__SBSAContainerDynamicsPulseAnimationProvider__updatePreferencesContainerWithInterfaceElementIdentifier_toScale_settings_preferencesMutator_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "interfaceElementIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BSEqualObjects();

  return v3;
}

void __149__SBSAContainerDynamicsPulseAnimationProvider__updatePreferencesContainerWithInterfaceElementIdentifier_toScale_settings_preferencesMutator_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  Class v11;
  objc_class *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v3 = a2;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAContainerDynamicsPulseAnimationProvider.m"), 253, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }

  v24 = 0.0;
  v25 = 0.0;
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(*(id *)(a1 + 40), "center");
  SBSAScaledAndClippedFrameByScalingDimensions(&v24, *(void **)(a1 + 48), v15, v17, v19, v21, v22, v23, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 64));
  BSRectWithSize();
  objc_msgSend(v7, "setBounds:");
  objc_msgSend(v7, "setContentScale:", v24, v25);
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v7, "setContentBounds:");
  UIRectGetCenter();
  objc_msgSend(v7, "setContentCenter:");

}

- (SAElementIdentifying)elementIdentity
{
  return self->_elementIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentity, 0);
  objc_destroyWeak((id *)&self->_expandedInterfaceElementIdentifier);
  objc_storeStrong((id *)&self->_contractionCompletionMilestonePropertyIdentity, 0);
  objc_storeStrong((id *)&self->_expandingTimerIdentifier, 0);
  objc_storeStrong((id *)&self->_waitingToExpandTimerIdentifier, 0);
}

- (void)_pulseContractWithPreferencesMutator:(void *)a1 context:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "queryIteration");
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v1, v2, "[%{public}lu] [Pulse] Expanded interface element not found, skipping pulse contract animation for: '%@'", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2_2();
}

- (void)_updatePreferencesContainerWithInterfaceElementIdentifier:(void *)a1 toScale:settings:preferencesMutator:context:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "queryIteration");
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v1, v2, "[%{public}lu] [Pulse] Container requested for pulse scaling not found. Ignoring scaling for: '%@'", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2_2();
}

@end
