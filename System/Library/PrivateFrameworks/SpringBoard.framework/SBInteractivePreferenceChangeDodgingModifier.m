@implementation SBInteractivePreferenceChangeDodgingModifier

- (SBInteractivePreferenceChangeDodgingModifier)initWithIdentifier:(id)a3
{
  id v5;
  SBInteractivePreferenceChangeDodgingModifier *v6;
  SBInteractivePreferenceChangeDodgingModifier *v7;
  SBPreferenceChangeDodgingModifier *v8;
  SBPreferenceChangeDodgingModifier *preferenceChangeModifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBInteractivePreferenceChangeDodgingModifier;
  v6 = -[SBChainableModifier init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = -[SBPreferenceChangeDodgingModifier initWithIdentifier:animated:]([SBPreferenceChangeDodgingModifier alloc], "initWithIdentifier:animated:", v7->_identifier, 0);
    preferenceChangeModifier = v7->_preferenceChangeModifier;
    v7->_preferenceChangeModifier = v8;

    -[SBPreferenceChangeDodgingModifier setResignLifecycleManagement:](v7->_preferenceChangeModifier, "setResignLifecycleManagement:", 1);
    -[SBPreferenceChangeDodgingModifier setBoostUpdatedIdentifier:](v7->_preferenceChangeModifier, "setBoostUpdatedIdentifier:", 1);
    -[SBChainableModifier addChildModifier:](v7, "addChildModifier:", v7->_preferenceChangeModifier);
  }

  return v7;
}

- (BOOL)completesWhenChildrenComplete
{
  return 1;
}

- (id)handlePreferenceChangeEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 awaitingFinalAnimation;
  unint64_t v8;
  SBPreferenceChangeDodgingModifier *v9;
  SBPreferenceChangeDodgingModifier *preferenceChangeModifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBInteractivePreferenceChangeDodgingModifier;
  -[SBDodgingModifier handlePreferenceChangeEvent:](&v12, sel_handlePreferenceChangeEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", self->_identifier))
  {
    awaitingFinalAnimation = self->_awaitingFinalAnimation;

    if (!awaitingFinalAnimation)
    {
      v8 = objc_msgSend(v4, "style");
      self->_style = v8;
      if (v8 != 1)
      {
        if (objc_msgSend(v4, "phase"))
        {
          if (self->_style != 1 && objc_msgSend(v4, "phase") == 1)
            self->_awaitingFinalAnimation = 1;
        }
        else
        {
          -[SBChainableModifier removeChildModifier:](self, "removeChildModifier:", self->_preferenceChangeModifier);
          v9 = -[SBPreferenceChangeDodgingModifier initWithIdentifier:animated:]([SBPreferenceChangeDodgingModifier alloc], "initWithIdentifier:animated:", self->_identifier, objc_msgSend(v4, "style") == 2);
          preferenceChangeModifier = self->_preferenceChangeModifier;
          self->_preferenceChangeModifier = v9;

          -[SBPreferenceChangeDodgingModifier setBoostUpdatedIdentifier:](self->_preferenceChangeModifier, "setBoostUpdatedIdentifier:", 1);
          -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_preferenceChangeModifier);
        }
      }
      objc_msgSend(v4, "handleWithReason:", CFSTR("Interactive preference change"));
    }
  }
  else
  {

  }
  return v5;
}

- (id)zOrderedIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBInteractivePreferenceChangeDodgingModifier;
  -[SBInteractivePreferenceChangeDodgingModifier zOrderedIdentifiers](&v8, sel_zOrderedIdentifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = objc_msgSend(v4, "indexOfObject:", self->_identifier);
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "moveObjectsAtIndexes:toIndex:", v6, 0);

  return v4;
}

- (id)framesForIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double x;
  double y;
  double *v16;
  double v17;
  double v18;
  _QWORD *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD v29[4];
  _OWORD v30[2];
  _QWORD v31[4];
  _QWORD v32[4];
  objc_super v33;
  NSString *identifier;
  _QWORD v35[2];
  CGRect v36;
  CGRect v37;

  v35[1] = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)SBInteractivePreferenceChangeDodgingModifier;
  -[SBInteractivePreferenceChangeDodgingModifier framesForIdentifiers](&v33, sel_framesForIdentifiers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_style == 1)
  {
    -[SBInteractivePreferenceChangeDodgingModifier preferenceForIdentifier:](self, "preferenceForIdentifier:", self->_identifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", self->_identifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "CGRectValue");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v4, "preferredSize");
    SBRectWithSize();
    objc_msgSend(v4, "preferredCenter");
    UIRectCenteredAboutPoint();
    x = v36.origin.x;
    y = v36.origin.y;
    v37.origin.x = v7;
    v37.origin.y = v9;
    v37.size.width = v11;
    v37.size.height = v13;
    if (!CGRectEqualToRect(v36, v37))
    {
      objc_msgSend(v4, "minimumSize");
      if (x <= v7)
      {
        memset(&v31[1], 0, 24);
        *(double *)v31 = v7;
        v16 = (double *)v31;
        v7 = 1.79769313e308;
      }
      else
      {
        v32[0] = 0xFFEFFFFFFFFFFFFFLL;
        memset(&v32[1], 0, 24);
        v16 = (double *)v32;
      }
      v16[2] = v7;
      *((_BYTE *)v16 + 8) = 1;
      *((_BYTE *)v16 + 24) = 1;
      BSUIConstrainValueToIntervalWithRubberBand();
      v18 = v17;
      if (y <= v9)
      {
        *(double *)v29 = v9;
        v29[1] = 0;
        v29[2] = 0x7FEFFFFFFFFFFFFFLL;
        v29[3] = 0;
        v19 = v29;
      }
      else
      {
        v30[0] = 0u;
        v30[1] = *(unint64_t *)&v9;
        v19 = v30;
      }
      *((_BYTE *)v19 + 8) = 1;
      *((_BYTE *)v19 + 24) = 1;
      BSUIConstrainValueToIntervalWithRubberBand();
      v21 = v20;
      BSUIConstrainValueToIntervalWithRubberBand();
      v23 = v22;
      BSUIConstrainValueToIntervalWithRubberBand();
      identifier = self->_identifier;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v18, v21, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &identifier, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bs_dictionaryByAddingEntriesFromDictionary:", v26);
      v27 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v27;
    }

  }
  return v3;
}

- (int64_t)animationBehaviorModeForIdentifier:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", self->_identifier) && self->_style == 1)
  {
    v5 = 5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBInteractivePreferenceChangeDodgingModifier;
    v6 = -[SBInteractivePreferenceChangeDodgingModifier animationBehaviorModeForIdentifier:](&v8, sel_animationBehaviorModeForIdentifier_, v4);
    if (v6 == (id)2)
      v5 = 3;
    else
      v5 = (int64_t)v6;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferenceChangeModifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
