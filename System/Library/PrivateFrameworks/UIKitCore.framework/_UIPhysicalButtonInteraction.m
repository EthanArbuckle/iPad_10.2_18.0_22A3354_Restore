@implementation _UIPhysicalButtonInteraction

- (void)willMoveToView:(id)a3
{
  -[_UIPhysicalButtonInteraction _uninstallViewComponentsAndUnregister]((uint64_t)self);
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  id v5;
  _BOOL4 enabled;

  v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    enabled = self->_enabled;

    if (enabled)
      -[_UIPhysicalButtonInteraction _installViewComponentsAndRegisterIfAble]((uint64_t)self);
  }
}

- (void)_unregisterFromArbiter
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = 0x1E1764CA0;
    v5[1] = 0x1E1764CC0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNotificationCenter _uiRemoveObserver:names:](v2, (void *)a1, v3);

    *(_BYTE *)(a1 + 32) &= 0xDDu;
    objc_msgSend(*(id *)(a1 + 80), "invalidate");
    v4 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

  }
}

- (void)_uninstallViewComponentsAndUnregister
{
  _QWORD *WeakRetained;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 32) & 0x10) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      -[UIView _removeGeometryChangeObserver:](WeakRetained, (void *)a1);

    }
    v3 = objc_loadWeakRetained((id *)(a1 + 40));

    if (v3)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v4 = *(id *)(a1 + 8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v12;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v12 != v7)
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
            v10 = objc_loadWeakRetained((id *)(a1 + 40));
            objc_msgSend(v9, "_uninstallFromViewIfNeeded:", v10, (_QWORD)v11);

            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v6);
      }

    }
    -[_UIPhysicalButtonInteraction _unregisterFromArbiter](a1);
  }
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  __CFString *v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  __CFString *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained((id *)&self->_view);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p>"), v7, v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("(nil)");
  }

  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("view"));
  v10 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v10);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = CFSTR("(nil)");
  }

  v15 = (id)objc_msgSend(v3, "appendObject:withName:", v14, CFSTR("delegate"));
  if (-[NSString length](self->_name, "length"))
    objc_msgSend(v3, "appendString:withName:", self->_name, CFSTR("name"));
  v16 = (id)objc_msgSend(v3, "appendBool:withName:", self->_enabled, CFSTR("enabled"));
  v17 = (id)objc_msgSend(v3, "appendBool:withName:", self->_arbiterRegistrationToken != 0, CFSTR("hasRegistered"));
  _UIPhysicalButtonSuccinctConfigurationsDescriptionForSet(&self->_configurationSet->super.isa);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v3, "appendObject:withName:", v18, CFSTR("configurations"));

  v20 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_orderedActionsForAllPhysicalButtons, "count"), CFSTR("activeActions"));
  return v3;
}

- (void)_enumerateConfigurationsSynchronizingPropertiesAndNotifyingArbiter:(uint64_t)a1
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    *(_BYTE *)(a1 + 32) &= ~0x10u;
    if (-[_UIPhysicalButtonInteraction _propagatePropertiesToConfigurationSetReturningIfHasExclusiveBehavior:](a1, *(void **)(a1 + 48)))*(_BYTE *)(a1 + 32) |= 0x10u;
    if (*(_QWORD *)(a1 + 80))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "_window");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "_windowHostingScene");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_physicalButtonInteractionArbiter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIPhysicalButtonInteractionArbiter _setNeedsResolutionOfPhysicalButtonConfigurationsInWindow:forReason:]((uint64_t)v4, v5, 3uLL);
    }
  }
}

- (BOOL)_wantsRelaxedVisibilityRequirement
{
  return (*(_BYTE *)&self->_interactionFlags >> 2) & 1;
}

- (_UIPhysicalButtonConfigurationSet)_configurationSet
{
  return self->_configurationSet;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (BOOL)_isEnabled
{
  return self->_enabled;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIPhysicalButtonInteraction succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_UIPhysicalButtonInteraction)initWithConfigurations:(id)a3 delegate:(id)a4
{
  char IsMostlyValid;
  id v9;
  _UIPhysicalButtonInteraction *v10;
  uint64_t v11;
  _UIPhysicalButtonConfigurationSet *configurationSet;
  uint64_t v13;
  NSMutableArray *drivers;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteraction.m"), 412, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configurations"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteraction.m"), 413, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

LABEL_3:
  v28 = 0;
  IsMostlyValid = _UIPhysicalButtonConfigurationNSSetIsMostlyValid(a3, &v28);
  v9 = v28;
  if ((IsMostlyValid & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteraction.m"), 418, CFSTR("%s: Invalid configurations for reason: %@; configurations: %@"),
      "-[_UIPhysicalButtonInteraction initWithConfigurations:delegate:]",
      v9,
      a3);

  }
  v27.receiver = self;
  v27.super_class = (Class)_UIPhysicalButtonInteraction;
  v10 = -[_UIPhysicalButtonInteraction init](&v27, sel_init);
  if (v10)
  {
    +[_UIPhysicalButtonConfigurationSet _configurationSetFromNSSet:]((uint64_t)_UIPhysicalButtonConfigurationSet, a3);
    v11 = objc_claimAutoreleasedReturnValue();
    configurationSet = v10->_configurationSet;
    v10->_configurationSet = (_UIPhysicalButtonConfigurationSet *)v11;

    *(_BYTE *)&v10->_interactionFlags &= ~0x10u;
    if (-[_UIPhysicalButtonInteraction _propagatePropertiesToConfigurationSetReturningIfHasExclusiveBehavior:]((uint64_t)v10, v10->_configurationSet))*(_BYTE *)&v10->_interactionFlags |= 0x10u;
    objc_storeWeak((id *)&v10->_delegate, a4);
    v10->_enabled = 1;
    if (!v10->_drivers)
    {
      v13 = objc_opt_new();
      drivers = v10->_drivers;
      v10->_drivers = (NSMutableArray *)v13;

      -[_UIPhysicalButtonInteraction _driverClasses](v10, "_driverClasses");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__createDriversIfNeeded, v10, CFSTR("_UIPhysicalButtonInteraction.m"), 604, CFSTR("%s: Invalid driver classes returned by subclass: %@"), "-[_UIPhysicalButtonInteraction _createDriversIfNeeded]", v10);

      }
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v30 != v19)
              objc_enumerationMutation(v16);
            v21 = (void *)objc_msgSend(objc_alloc(*(Class *)(*((_QWORD *)&v29 + 1) + 8 * i)), "initWithReceiver:", v10);
            -[NSMutableArray addObject:](v10->_drivers, "addObject:", v21);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v18);
      }

    }
  }

  return v10;
}

- (NSArray)_driverClasses
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_installViewComponentsAndRegisterIfAble
{
  _QWORD *WeakRetained;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 32) & 0x10) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      -[UIView _addGeometryChangeObserver:](WeakRetained, (void *)a1);

    }
    v3 = objc_loadWeakRetained((id *)(a1 + 40));

    if (v3)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v4 = *(id *)(a1 + 8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v12;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v12 != v7)
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
            v10 = objc_loadWeakRetained((id *)(a1 + 40));
            objc_msgSend(v9, "_installToViewIfNeeded:", v10, (_QWORD)v11);

            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v6);
      }

    }
    -[_UIPhysicalButtonInteraction _registerWithArbiterIfAble](a1);
  }
}

- (void)_registerWithArbiterIfAble
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_window");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_windowHostingScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[_UIPhysicalButtonInteraction _registerWithArbiterSkippingEvaluationAndObservation](a1);
      if (!v5)
        goto LABEL_8;
    }
    else
    {
      if (!v5)
      {
LABEL_8:

        return;
      }
      *(_BYTE *)(a1 + 32) |= 2u;
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", a1, sel__windowWillMoveToScene_, 0x1E1764CA0, v5);
    objc_msgSend(v4, "addObserver:selector:name:object:", a1, sel__windowDidMoveToScene_, 0x1E1764CC0, v5);

    goto LABEL_8;
  }
}

- (void)_registerWithArbiterSkippingEvaluationAndObservation
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_windowHostingScene");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "_physicalButtonInteractionArbiter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_msgSend(v8, "_hasInvalidated") & 1) == 0)
    {
      if (!v4 || *(_QWORD *)(a1 + 80))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__registerWithArbiterSkippingEvaluationAndObservation, a1, CFSTR("_UIPhysicalButtonInteraction.m"), 664, CFSTR("%s: Invalid attempt to register with arbiter: %@; interaction: %@"),
          "-[_UIPhysicalButtonInteraction _registerWithArbiterSkippingEvaluationAndObservation]",
          v4,
          a1);

      }
      else
      {
        -[_UIPhysicalButtonInteractionArbiter _registerPhysicalButtonInteraction:]((uint64_t)v4, (void *)a1);
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = *(void **)(a1 + 80);
        *(_QWORD *)(a1 + 80) = v5;

        -[_UIPhysicalButtonInteraction _evaluateWithinSceneBoundsIfNeededWithChangeHandler:](a1, 0);
      }
    }

  }
}

- (void)_evaluateWithinSceneBoundsIfNeededWithChangeHandler:(uint64_t)a1
{
  void *v4;
  void *v5;
  unsigned int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  unsigned int v18;
  void *v19;
  id WeakRetained;
  CGPoint v21;
  CGRect v22;

  if (a1 && *(_QWORD *)(a1 + 80) && (*(_BYTE *)(a1 + 32) & 0x10) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_windowHostingScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned __int8 *)(a1 + 32);
    objc_msgSend(WeakRetained, "frame");
    v9 = v8 + v7 * 0.5;
    v12 = v11 + v10 * 0.5;
    objc_msgSend(v5, "_coordinateSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "convertPoint:toCoordinateSpace:", v13, v9, v12);
    v15 = v14;
    v17 = v16;
    objc_msgSend(v13, "bounds");
    v21.x = v15;
    v21.y = v17;
    if (CGRectContainsPoint(v22, v21))
      v18 = 32;
    else
      v18 = 0;
    *(_BYTE *)(a1 + 32) = *(_BYTE *)(a1 + 32) & 0xDF | v18;
    if (a2)
    {
      if (((v6 >> 5) & 1) != v18 >> 5)
      {
        objc_msgSend(v5, "_physicalButtonInteractionArbiter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *))(a2 + 16))(a2, v19, v4);

      }
    }

  }
}

- (_UIPhysicalButtonInteraction)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteraction.m"), 405, CFSTR("%s: init is not allowed on %@"), "-[_UIPhysicalButtonInteraction init]", objc_opt_class());

  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  BSInvalidatable *arbiterRegistrationToken;
  objc_super v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 0x1E1764CA0;
  v7[1] = 0x1E1764CC0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  -[BSInvalidatable invalidate](self->_arbiterRegistrationToken, "invalidate");
  arbiterRegistrationToken = self->_arbiterRegistrationToken;
  self->_arbiterRegistrationToken = 0;

  v6.receiver = self;
  v6.super_class = (Class)_UIPhysicalButtonInteraction;
  -[_UIPhysicalButtonInteraction dealloc](&v6, sel_dealloc);
}

- (BOOL)_isProxyInteraction
{
  return 0;
}

- (void)_setIdentifier:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_identifier = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPhysicalButtonInteraction _setName:](self, "_setName:", v4);

}

- (void)_setName:(id)a3
{
  NSString *v5;
  NSString *v6;
  char v7;
  NSString *v8;
  NSString *name;
  NSString *v10;

  v5 = self->_name;
  v6 = (NSString *)a3;
  v10 = v6;
  if (v5 == v6)
  {

    return;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  v7 = -[NSString isEqual:](v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
LABEL_8:
    v8 = (NSString *)-[NSString copy](v10, "copy");
    name = self->_name;
    self->_name = v8;

    -[_UIPhysicalButtonInteraction _enumerateConfigurationsSynchronizingPropertiesAndNotifyingArbiter:]((uint64_t)self);
  }
}

- (uint64_t)_propagatePropertiesToConfigurationSetReturningIfHasExclusiveBehavior:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = a2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v9, "_setWantsSystemShellExclusivePriority:", (*(unsigned __int8 *)(a1 + 32) >> 3) & 1, (_QWORD)v11);
          if (*(_QWORD *)(a1 + 72))
            objc_msgSend(v9, "_setName:");
          v6 |= objc_msgSend(v9, "_behavior") != 2;
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

- (NSSet)_configurations
{
  return (NSSet *)-[_UIPhysicalButtonConfigurationSet _nsSetRepresentation](&self->_configurationSet->super.isa);
}

- (void)_setConfigurations:(id)a3
{
  char IsMostlyValid;
  id v7;
  _UIPhysicalButtonConfigurationSet *v8;
  char interactionFlags;
  void *v10;
  int v11;
  BSInvalidatable *arbiterRegistrationToken;
  char v13;
  id WeakRetained;
  char v15;
  _QWORD *v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteraction.m"), 508, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configurations"));

  }
  v28 = 0;
  IsMostlyValid = _UIPhysicalButtonConfigurationNSSetIsMostlyValid(a3, &v28);
  v7 = v28;
  if ((IsMostlyValid & 1) != 0)
  {
    v8 = self->_configurationSet;
    interactionFlags = (char)self->_interactionFlags;
    +[_UIPhysicalButtonConfigurationSet _configurationSetFromNSSet:]((uint64_t)_UIPhysicalButtonConfigurationSet, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_UIPhysicalButtonInteraction _propagatePropertiesToConfigurationSetReturningIfHasExclusiveBehavior:]((uint64_t)self, v10);
    if (!-[_UIPhysicalButtonConfigurationSet isEqual:](v8, "isEqual:", v10))
    {
      arbiterRegistrationToken = self->_arbiterRegistrationToken;
      if (arbiterRegistrationToken)
        -[_UIPhysicalButtonInteraction _unregisterFromArbiter]((uint64_t)self);
      objc_storeStrong((id *)&self->_configurationSet, v10);
      if (((((interactionFlags & 0x10) == 0) ^ v11) & 1) == 0)
      {
        v13 = v11 ? 16 : 0;
        *(_BYTE *)&self->_interactionFlags = *(_BYTE *)&self->_interactionFlags & 0xEF | v13;
        WeakRetained = objc_loadWeakRetained((id *)&self->_view);

        if (WeakRetained)
        {
          v15 = (char)self->_interactionFlags;
          v16 = objc_loadWeakRetained((id *)&self->_view);
          v17 = v16;
          if ((v15 & 0x10) != 0)
            -[UIView _addGeometryChangeObserver:](v16, self);
          else
            -[UIView _removeGeometryChangeObserver:](v16, self);

        }
      }
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v18 = self->_drivers;
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v25 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "_physicalButtonConfigurationsDidChange");
          }
          v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v20);
      }

      if (arbiterRegistrationToken)
        -[_UIPhysicalButtonInteraction _registerWithArbiterIfAble]((uint64_t)self);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (_UIPhysicalButtonConfigurationSet *)objc_claimAutoreleasedReturnValue();
    -[_UIPhysicalButtonConfigurationSet handleFailureInMethod:object:file:lineNumber:description:](v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteraction.m"), 513, CFSTR("%s: Invalid configurations for reason: %@; configurations: %@"),
      "-[_UIPhysicalButtonInteraction _setConfigurations:]",
      v7,
      a3);
  }

}

- (id)_configurationForButton:(unint64_t)a3
{
  return -[_UIPhysicalButtonConfigurationSet _configurationForButton:](self->_configurationSet, "_configurationForButton:", a3);
}

- (BOOL)_wantsSystemShellExclusivePriority
{
  return (*(_BYTE *)&self->_interactionFlags >> 3) & 1;
}

- (void)_setWantsSystemShellExclusivePriority:(BOOL)a3
{
  char interactionFlags;
  char v4;

  interactionFlags = (char)self->_interactionFlags;
  if (((((interactionFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 8;
    else
      v4 = 0;
    *(_BYTE *)&self->_interactionFlags = interactionFlags & 0xF7 | v4;
    -[_UIPhysicalButtonInteraction _enumerateConfigurationsSynchronizingPropertiesAndNotifyingArbiter:]((uint64_t)self);
  }
}

- (id)_driverForType:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1 + 8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "_driverType", (_QWORD)v11) == a2)
        {
          v9 = v8;
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (id)_bsActionDriver
{
  if (a1)
  {
    -[_UIPhysicalButtonInteraction _driverForType:]((uint64_t)a1, 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (a3)
      -[_UIPhysicalButtonInteraction _installViewComponentsAndRegisterIfAble]((uint64_t)self);
    else
      -[_UIPhysicalButtonInteraction _uninstallViewComponentsAndUnregister]((uint64_t)self);
  }
}

- (void)_willMoveFromWindow:(id)a3 toWindow:(id)a4
{
  void *v7;
  void *v8;

  if (self->_enabled)
  {
    objc_msgSend(a4, "_windowHostingScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_arbiterRegistrationToken)
    {
      if (a3 && a4 && v7)
      {
        *(_BYTE *)&self->_interactionFlags |= 1u;
      }
      else if (a4 && v7)
      {
        goto LABEL_11;
      }
      v8 = v7;
      -[_UIPhysicalButtonInteraction _unregisterFromArbiter]((uint64_t)self);
      v7 = v8;
    }
LABEL_11:

  }
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v7;
  BSInvalidatable *arbiterRegistrationToken;
  unsigned __int8 interactionFlags;
  int v10;
  BOOL v11;
  int v14;
  id v16;

  if (self->_enabled)
  {
    objc_msgSend(a3, "_windowHostingScene");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a4, "_windowHostingScene");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    arbiterRegistrationToken = self->_arbiterRegistrationToken;
    interactionFlags = self->_interactionFlags;
    v10 = (a3 != 0) & interactionFlags;
    if (!a4)
      v10 = 0;
    if (!((unint64_t)a3 | (unint64_t)arbiterRegistrationToken))
      v10 = 1;
    if (arbiterRegistrationToken)
      v11 = v16 == 0;
    else
      v11 = 1;
    v14 = !v11 && v7 != 0 && v16 != v7;
    if (v10 != 1 || v7 == 0)
    {
      if (a3 || !a4 || arbiterRegistrationToken || v7)
      {
        if (!v14)
        {
LABEL_31:

          return;
        }
        -[_UIPhysicalButtonInteraction _unregisterFromArbiter]((uint64_t)self);
      }
    }
    else
    {
      *(_BYTE *)&self->_interactionFlags = interactionFlags & 0xFE;
    }
    -[_UIPhysicalButtonInteraction _registerWithArbiterIfAble]((uint64_t)self);
    goto LABEL_31;
  }
}

- (void)_windowWillMoveToScene:(id)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  BSInvalidatable *arbiterRegistrationToken;
  BSInvalidatable *v10;
  uint64_t v11;

  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(a3, "object");
  v11 = objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "_window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)v11;
  if (v7 == (void *)v11)
  {
    arbiterRegistrationToken = self->_arbiterRegistrationToken;
    if (arbiterRegistrationToken)
    {
      -[BSInvalidatable invalidate](arbiterRegistrationToken, "invalidate");
      v10 = self->_arbiterRegistrationToken;
      self->_arbiterRegistrationToken = 0;

      v8 = (void *)v11;
      *(_BYTE *)&self->_interactionFlags |= 2u;
    }
  }
LABEL_8:

}

- (void)_windowDidMoveToScene:(id)a3
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;

  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "object");
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
    if (v9)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(WeakRetained, "_window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
      if (v8 == (void *)v9 && !self->_arbiterRegistrationToken && (*(_BYTE *)&self->_interactionFlags & 2) != 0)
      {
        *(_BYTE *)&self->_interactionFlags &= ~2u;
        -[_UIPhysicalButtonInteraction _registerWithArbiterSkippingEvaluationAndObservation]((uint64_t)self);
        v6 = (void *)v9;
      }
    }
  }
  else
  {

    v6 = 0;
  }

}

- (void)_setWantsRelaxedVisibilityRequirement:(BOOL)a3
{
  _BOOL4 v3;
  int IsSpringBoard;
  char interactionFlags;
  char v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  IsSpringBoard = _UIApplicationProcessIsSpringBoard();
  if (!IsSpringBoard && v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteraction.m"), 894, CFSTR("%s: Invalid request to relax visibility requirement for interaction: %@"), "-[_UIPhysicalButtonInteraction _setWantsRelaxedVisibilityRequirement:]", self);

  }
  else if (IsSpringBoard)
  {
    interactionFlags = (char)self->_interactionFlags;
    if (((((interactionFlags & 4) == 0) ^ v3) & 1) == 0)
    {
      if (v3)
        v8 = 4;
      else
        v8 = 0;
      *(_BYTE *)&self->_interactionFlags = interactionFlags & 0xFB | v8;
      if (self->_arbiterRegistrationToken)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_view);
        objc_msgSend(WeakRetained, "_window");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "_windowHostingScene");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_physicalButtonInteractionArbiter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UIPhysicalButtonInteractionArbiter _setNeedsResolutionOfPhysicalButtonConfigurationsInWindow:forReason:]((uint64_t)v11, v13, 4uLL);
      }
    }
  }
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  if ((a3->var0 & 6) != 0 && (*(_BYTE *)&self->_interactionFlags & 0x10) != 0)
    -[_UIPhysicalButtonInteraction _evaluateWithinSceneBoundsIfNeededWithChangeHandler:]((uint64_t)self, (uint64_t)&__block_literal_global_520);
}

- (void)_driver:(id)a3 didCreateProposedAction:(id)a4
{
  uint64_t v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *actionsByPhysicalButton;
  NSMutableArray *v9;
  NSMutableArray *orderedActionsForAllPhysicalButtons;
  uint64_t v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  id v23;

  v6 = objc_msgSend(a4, "_state", a3);
  if (!self->_actionsByPhysicalButton)
  {
    v7 = (NSMutableDictionary *)objc_opt_new();
    actionsByPhysicalButton = self->_actionsByPhysicalButton;
    self->_actionsByPhysicalButton = v7;

  }
  if (!self->_orderedActionsForAllPhysicalButtons)
  {
    v9 = (NSMutableArray *)objc_opt_new();
    orderedActionsForAllPhysicalButtons = self->_orderedActionsForAllPhysicalButtons;
    self->_orderedActionsForAllPhysicalButtons = v9;

  }
  v23 = a4;
  v11 = objc_msgSend(v23, "_button");
  v12 = self->_actionsByPhysicalButton;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = self->_actionsByPhysicalButton;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", v16);

    -[NSMutableArray removeObjectIdenticalTo:](self->_orderedActionsForAllPhysicalButtons, "removeObjectIdenticalTo:", v14);
  }
  v17 = self->_actionsByPhysicalButton;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v23, v18);

  -[NSMutableArray addObject:](self->_orderedActionsForAllPhysicalButtons, "addObject:", v23);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v20 = (void *)-[NSMutableArray copy](self->_orderedActionsForAllPhysicalButtons, "copy");
  objc_msgSend(WeakRetained, "_physicalButtonInteraction:handleAction:withActiveActions:", self, v23, v20);

  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v21 = self->_actionsByPhysicalButton;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v21, "removeObjectForKey:", v22);

    -[NSMutableArray removeObjectIdenticalTo:](self->_orderedActionsForAllPhysicalButtons, "removeObjectIdenticalTo:", v23);
  }

}

- (NSString)debugDescription
{
  return (NSString *)-[_UIPhysicalButtonInteraction debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonInteraction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonInteraction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  char has_internal_diagnostics;
  void *v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  __CFString *v11;
  id v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  __CFString *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _UIPhysicalButtonInteraction *v25;
  char v26;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveMultilinePrefix:", a3);
  v7 = objc_loadWeakRetained((id *)&self->_view);
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v10, v7);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = CFSTR("(nil)");
  }

  v12 = (id)objc_msgSend(v6, "appendObject:withName:", v11, CFSTR("view"));
  v13 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p>"), v16, v13);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = CFSTR("(nil)");
  }

  v18 = (id)objc_msgSend(v6, "appendObject:withName:", v17, CFSTR("delegate"));
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __70___UIPhysicalButtonInteraction_descriptionBuilderWithMultilinePrefix___block_invoke;
  v23[3] = &unk_1E16B4008;
  v19 = v6;
  v24 = v19;
  v25 = self;
  v26 = has_internal_diagnostics;
  v20 = (id)objc_msgSend(v19, "modifyBody:", v23);
  v21 = v19;

  return v21;
}

- (_UIPhysicalButtonInteractionDelegate)_delegate
{
  return (_UIPhysicalButtonInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)_identifier
{
  return self->_identifier;
}

- (NSString)_name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arbiterRegistrationToken, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configurationSet, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_orderedActionsForAllPhysicalButtons, 0);
  objc_storeStrong((id *)&self->_actionsByPhysicalButton, 0);
  objc_storeStrong((id *)&self->_drivers, 0);
}

@end
