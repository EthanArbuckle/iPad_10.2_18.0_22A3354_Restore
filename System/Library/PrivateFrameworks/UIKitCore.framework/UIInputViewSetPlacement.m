@implementation UIInputViewSetPlacement

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@>"), objc_opt_class());
}

- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  BOOL v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  CGRect result;

  v4 = a4;
  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "inputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intrinsicContentSize");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "_findAutolayoutHeightConstraint");
  if (v12 != -1.0)
    v11 = v12;
  if (v7 && v9 == 0.0)
  {
    NSLog(CFSTR("API error: %@ returned 0 width, assuming UIViewNoIntrinsicMetric"), v7);
LABEL_7:
    objc_msgSend(v7, "frame");
    v9 = v13;
    goto LABEL_8;
  }
  if (v9 == -1.0)
    goto LABEL_7;
LABEL_8:
  if (v11 == -1.0)
  {
    objc_msgSend(v7, "frame");
    v11 = v14;
    if (v14 == 0.0)
    {
      if (objc_msgSend(v6, "isCustomInputView"))
      {
        objc_msgSend(v7, "constraints");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v16)
        {
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          objc_msgSend(v7, "constraints");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
          if (!v18)
            goto LABEL_26;
          v19 = v18;
          v20 = *(_QWORD *)v49;
          while (1)
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v49 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v21);
              objc_msgSend(v22, "firstItem");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23 != v7)
                goto LABEL_20;
              objc_msgSend(v22, "secondItem");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
              {

                v23 = v7;
LABEL_20:

                goto LABEL_21;
              }
              v25 = objc_msgSend(v22, "firstAttribute");

              if (v25 == 8)
              {
                objc_msgSend(v22, "constant");
                v11 = v27;
                goto LABEL_26;
              }
LABEL_21:
              ++v21;
            }
            while (v19 != v21);
            v26 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
            v19 = v26;
            if (!v26)
            {
LABEL_26:

              break;
            }
          }
        }
      }
    }
  }
  objc_msgSend(v6, "keyboard");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "isMinimized"))
    {

LABEL_35:
      v11 = 0.0;
      goto LABEL_36;
    }
    if (!-[UIInputViewSetPlacement showsKeyboard](self, "showsKeyboard"))
    {
      v47 = -[UIInputViewSetPlacement isUndocked](self, "isUndocked");

      if (v47)
        goto LABEL_36;
      goto LABEL_35;
    }

  }
  else if (!-[UIInputViewSetPlacement showsKeyboard](self, "showsKeyboard")
         && !-[UIInputViewSetPlacement isUndocked](self, "isUndocked"))
  {
    goto LABEL_35;
  }
LABEL_36:
  objc_msgSend(v6, "inputAssistantView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31 || v11 == 0.0 && +[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
  {

  }
  else
  {
    v32 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");

    if (!v32)
    {
      objc_msgSend(v6, "inputAssistantView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "intrinsicContentSize");
      v35 = v34;

      if (v35 == -1.0)
      {
        v35 = 0.0;
        if (!+[UIKeyboardImpl shouldMergeAssistantBarWithKeyboardLayout](UIKeyboardImpl, "shouldMergeAssistantBarWithKeyboardLayout"))
        {
          if (-[UIInputViewSetPlacement showsInputViews](self, "showsInputViews"))
          {
            -[UIInputViewSetPlacement inputAssistantViewHeightForInputViewSet:](self, "inputAssistantViewHeightForInputViewSet:", v6);
            v35 = v36;
          }
        }
      }
      v11 = v11 + v35;
    }
  }
  if (v4)
  {
    objc_msgSend(v6, "inputAccessoryView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v6, "inputAccessoryView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "intrinsicContentSize");
      v40 = v39;

      if (v40 == -1.0)
      {
        objc_msgSend(v6, "inputAccessoryView");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "frame");
        v40 = v42;

      }
      v11 = v11 + v40;
    }
  }

  v43 = 0.0;
  v44 = 0.0;
  v45 = v9;
  v46 = v11;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (BOOL)isUndocked
{
  return 0;
}

- (BOOL)showsKeyboard
{
  return 0;
}

+ (id)placement
{
  void *v3;
  uint64_t v4;
  void *v5;

  if ((id)objc_opt_class() == a1)
  {
    v3 = (void *)MEMORY[0x1E0C99DA0];
    v4 = *MEMORY[0x1E0C99778];
    NSStringFromClass((Class)a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ is not meant to be instantiated directly"), v5);

  }
  return objc_alloc_init((Class)a1);
}

+ (id)deactivatedKeyboardPlacementWithCurrentPlacement:(id)a3
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void (**)(_QWORD))a3;
  +[UIInputViewSetPlacement placement](UIInputViewSetPlacementOffScreenDown, "placement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_AXSReduceMotionReduceSlideTransitionsEnabled())
  {
    v3[2](v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIInputViewSetPlacementInvisible placementWithPlacement:](UIInputViewSetPlacementInvisible, "placementWithPlacement:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }

  return v4;
}

- (double)inputAssistantViewHeightForInputViewSet:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;

  v3 = a3;
  objc_msgSend(v3, "inputAssistantView");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  if (v4)
  {
    v6 = (void *)v4;
    objc_msgSend(v3, "inputAssistantView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isHidden");

    if ((v8 & 1) == 0)
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "systemInputAssistantViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "inputAssistantView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferredHeightForTraitCollection:", v12);
      v5 = v13;

    }
  }

  return v5;
}

- (id)applicatorInfoForOwner:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE v10[48];
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("Alpha");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[UIInputViewSetPlacement alpha](self, "alpha", a3);
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("Transform");
  v6 = (void *)MEMORY[0x1E0CB3B18];
  -[UIInputViewSetPlacement transform](self, "transform");
  objc_msgSend(v6, "valueWithCGAffineTransform:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGAffineTransform)transform
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (double)alpha
{
  return 1.0;
}

- (Class)applicatorClassForKeyboard:(BOOL)a3
{
  return (Class)objc_opt_class();
}

- (unint64_t)computeComparisonMask
{
  void *v3;
  unint64_t v4;
  uint64_t i;

  -[UIInputViewSetPlacement subPlacements](self, "subPlacements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") + 1;

  for (i = 0; i != 7; ++i)
    v4 |= 1 << i << (7
                   * -[UIInputViewSetPlacement indexForPurpose:](self, "indexForPurpose:", computeComparisonMask_allPurposes[i])+ 4);
  return v4;
}

- (unint64_t)indexForPurpose:(unint64_t)a3
{
  return 0;
}

- (BOOL)isFloatingAssistantView
{
  return 0;
}

- (BOOL)isVisible
{
  return 1;
}

- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  if (!a4)
    return 0;
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, 1, 0, a5, 1, 1.0, 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)widthConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  if (!a4)
    return 0;
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, 7, 0, a5, 7, 1.0, 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)subPlacements
{
  return 0;
}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  if (!a4)
    return 0;
  objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, 4, 0, a5, 4, 1.0, 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subPlacements, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (BOOL)isEqual:(id)a3
{
  UIInputViewSetPlacement *v4;
  UIInputViewSetPlacement *v5;
  BOOL v6;

  v4 = (UIInputViewSetPlacement *)a3;
  v5 = v4;
  if (self->_dirty)
    goto LABEL_2;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_3;
  }
  if (!-[UIInputViewSetPlacement isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
LABEL_2:
    v6 = 0;
  else
    v6 = !v5->_dirty;
LABEL_3:

  return v6;
}

- (BOOL)isInteractive
{
  return 0;
}

- (UIInputViewSetPlacement)assistantView
{
  return 0;
}

- (BOOL)accessoryViewWillAppear
{
  return 0;
}

- (BOOL)requiresWindowBasedSafeAreaInsets
{
  _BOOL4 v3;

  v3 = -[UIInputViewSetPlacement showsInputViews](self, "showsInputViews");
  if (v3)
    LOBYTE(v3) = !-[UIInputViewSetPlacement isUndocked](self, "isUndocked");
  return v3;
}

- (unint64_t)notificationsForTransitionToPlacement:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  int v7;
  int v8;
  _BOOL4 v9;
  int v10;
  int v11;
  unint64_t v12;

  v4 = a3;
  v5 = -[UIInputViewSetPlacement showsInputViews](self, "showsInputViews");
  v6 = objc_msgSend(v4, "showsInputViews");
  v7 = v6;
  v8 = 1;
  if (!v5 && (v6 & 1) == 0)
  {
    v9 = -[UIInputViewSetPlacement inputViewWillAppear](self, "inputViewWillAppear");
    v8 = v9 ^ objc_msgSend(v4, "inputViewWillAppear");
  }
  if (-[UIInputViewSetPlacement isFloatingAssistantView](self, "isFloatingAssistantView"))
    v10 = objc_msgSend(v4, "isFloatingAssistantView") ^ 1;
  else
    v10 = 0;
  if (-[UIInputViewSetPlacement isFloating](self, "isFloating"))
    v11 = 1;
  else
    v11 = objc_msgSend(v4, "isFloating") ^ 1;
  v12 = 0;
  if (!-[UIInputViewSetPlacement isEqual:](self, "isEqual:", v4) && (v11 & ~(v8 | v10) & 1) == 0)
  {
    if ((v5 | v7 ^ 1) == 1)
    {
      if ((!v5 | v7) != 1)
        goto LABEL_21;
      if (((!v5 | v7 ^ 1) & 1) != 0)
      {
        if (v10)
          v12 = 3;
        else
          v12 = 1;
        goto LABEL_23;
      }
      if (-[UIInputViewSetPlacement showsKeyboard](self, "showsKeyboard")
        && (objc_msgSend(v4, "showsKeyboard") & 1) == 0
        && (objc_msgSend(v4, "accessoryViewWillAppear") & 1) != 0)
      {
LABEL_21:
        v12 = 3;
        goto LABEL_23;
      }
    }
    v12 = 2;
  }
LABEL_23:

  return v12;
}

- (BOOL)showsInputViews
{
  return 0;
}

- (BOOL)inputViewWillAppear
{
  return 0;
}

+ (id)encodablePlacementsForXPC
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[25];

  v6[24] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  v6[4] = objc_opt_class();
  v6[5] = objc_opt_class();
  v6[6] = objc_opt_class();
  v6[7] = objc_opt_class();
  v6[8] = objc_opt_class();
  v6[9] = objc_opt_class();
  v6[10] = objc_opt_class();
  v6[11] = objc_opt_class();
  v6[12] = objc_opt_class();
  v6[13] = objc_opt_class();
  v6[14] = objc_opt_class();
  v6[15] = objc_opt_class();
  v6[16] = objc_opt_class();
  v6[17] = objc_opt_class();
  v6[18] = objc_opt_class();
  v6[19] = objc_opt_class();
  v6[20] = objc_opt_class();
  v6[21] = objc_opt_class();
  v6[22] = objc_opt_class();
  v6[23] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (UIInputViewSetPlacementDelegate)delegate
{
  return (UIInputViewSetPlacementDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (BOOL)isFloating
{
  return 0;
}

- (BOOL)isCompactAssistantView
{
  return 0;
}

- (BOOL)isHiddenForFloatingTransition
{
  return 0;
}

- (BOOL)showsInputOrAssistantViews
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIInputViewSetPlacement)initWithCoder:(id)a3
{
  id v4;
  UIInputViewSetPlacement *v5;
  float v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIInputViewSetPlacement;
  v5 = -[UIInputViewSetPlacement init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("ExtendedHeight"));
    v5->_extendedHeight = v6;
    v5->_dirty = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Dirty"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  float extendedHeight;
  double v5;
  id v6;

  extendedHeight = self->_extendedHeight;
  v6 = a3;
  *(float *)&v5 = extendedHeight;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("ExtendedHeight"), v5);
  objc_msgSend(v6, "encodeBool:forKey:", self->_dirty, CFSTR("Dirty"));

}

- (void)setDirty
{
  self->_dirty = 1;
}

- (id)expiringPlacement
{
  return +[UIInputViewSetPlacement placement](UIInputViewSetPlacementOffScreenDown, "placement");
}

- (CGRect)adjustBoundsForNotificationsWithOwner:(id)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  objc_msgSend(a3, "hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UIEdgeInsets)inputAccessoryViewPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)extendedHeight
{
  return self->_extendedHeight;
}

- (void)setExtendedHeight:(double)a3
{
  self->_extendedHeight = a3;
}

- (void)setSubPlacements:(id)a3
{
  objc_storeStrong((id *)&self->_subPlacements, a3);
}

uint64_t __68__UIInputViewSetPlacement_FloatingAssistantApplicator_applyChanges___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHideInputAssistantBackdrop:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setHideInputViewBackdrops:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setHideInputView:", 1);
}

uint64_t __59__UIInputViewSetPlacement_FloatingApplicator_applyChanges___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHideInputViewBackdrops:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "updateCombinedBackdropView");
}

uint64_t __53__UIInputViewSetPlacement_FloatingApplicator_prepare__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyChanges:", *(_QWORD *)(a1 + 40));
}

@end
