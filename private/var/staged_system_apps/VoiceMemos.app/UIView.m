@implementation UIView

- (void)constrainSizeAndAlignCenterToCenterOfView:(id)a3 sizePaddingX:(double)a4 sizePaddingY:(double)a5 centerPaddingX:(double)a6 centerPaddingY:(double)a7
{
  id v12;

  v12 = a3;
  -[UIView constrainSizeWithView:paddingX:paddingY:](self, "constrainSizeWithView:paddingX:paddingY:", v12, a4, a5);
  -[UIView alignCenterToCenterOfView:paddingX:paddingY:](self, "alignCenterToCenterOfView:paddingX:paddingY:", v12, a6, a7);

}

- (void)constrainSizeWithView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addConstraintWithView:attribute:padding:](self, "addConstraintWithView:attribute:padding:", v8, 7, a4);
  -[UIView addConstraintWithView:attribute:padding:](self, "addConstraintWithView:attribute:padding:", v8, 8, a5);

}

- (void)alignCenterToCenterOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addCenterXConstraintWithView:padding:](self, "addCenterXConstraintWithView:padding:", v8, a4);
  -[UIView addCenterYConstraintWithView:padding:](self, "addCenterYConstraintWithView:padding:", v8, a5);

}

- (void)alignCenterToCenterOfView:(id)a3
{
  id v4;

  v4 = a3;
  -[UIView addCenterXConstraintWithView:](self, "addCenterXConstraintWithView:", v4);
  -[UIView addCenterYConstraintWithView:](self, "addCenterYConstraintWithView:", v4);

}

- (void)addConstraintWithView:(id)a3 attribute:(int64_t)a4 viewAttribute:(int64_t)a5 scale:(double)a6 padding:(double)a7
{
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView associatedConstraints](self, "associatedConstraints"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13));

  if (!v14)
    goto LABEL_8;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "secondItem"));
  if (v15 != v23 || objc_msgSend(v14, "secondAttribute") != (id)a5)
  {

    goto LABEL_7;
  }
  objc_msgSend(v14, "multiplier");
  v17 = v16;

  if (v17 != a6)
  {
LABEL_7:
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
    objc_msgSend(v19, "removeConstraint:", v14);

LABEL_8:
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, a4, 0, v23, a5, a6, a7));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
    objc_msgSend(v21, "addConstraint:", v20);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView associatedConstraints](self, "associatedConstraints"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, v22);

    v14 = (void *)v20;
    goto LABEL_9;
  }
  objc_msgSend(v14, "setConstant:", a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  objc_msgSend(v18, "addConstraint:", v14);
LABEL_9:

}

- (id)associatedConstraints
{
  id AssociatedObject;
  void *v4;

  AssociatedObject = objc_getAssociatedObject(self, "associatedConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
    -[UIView resetAssociatedConstraints](self, "resetAssociatedConstraints");
  return v4;
}

- (void)addConstraintWithView:(id)a3 attribute:(int64_t)a4 scale:(double)a5 padding:(double)a6
{
  -[UIView addConstraintWithView:attribute:viewAttribute:scale:padding:](self, "addConstraintWithView:attribute:viewAttribute:scale:padding:", a3, a4, a4, a5, a6);
}

- (void)addConstraintWithView:(id)a3 attribute:(int64_t)a4 padding:(double)a5
{
  -[UIView addConstraintWithView:attribute:scale:padding:](self, "addConstraintWithView:attribute:scale:padding:", a3, a4, 1.0, a5);
}

- (void)resetAssociatedConstraints
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[UIView setAssociatedConstraints:](self, "setAssociatedConstraints:", v3);

}

- (void)setAssociatedConstraints:(id)a3
{
  objc_setAssociatedObject(self, "associatedConstraints", a3, (void *)1);
}

- (void)constrainWidthWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:padding:](self, "addConstraintWithView:attribute:padding:", a3, 7, a4);
}

- (void)alignCenterTopToCenterTopOfView:(id)a3 padding:(double)a4
{
  id v6;

  v6 = a3;
  -[UIView addCenterXConstraintWithView:](self, "addCenterXConstraintWithView:", v6);
  -[UIView addTopToTopConstraintWithView:padding:](self, "addTopToTopConstraintWithView:padding:", v6, a4);

}

- (void)addTopToTopConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:padding:](self, "addConstraintWithView:attribute:padding:", a3, 3, a4);
}

- (void)addLeadingToLeadingConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:padding:](self, "addConstraintWithView:attribute:padding:", a3, 5, a4);
}

- (void)addCenterXConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:padding:](self, "addConstraintWithView:attribute:padding:", a3, 9, a4);
}

- (void)addCenterXConstraintWithView:(id)a3
{
  -[UIView addCenterXConstraintWithView:padding:](self, "addCenterXConstraintWithView:padding:", a3, 0.0);
}

- (void)alignCenterTrailingToCenterTrailingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addCenterYConstraintWithView:padding:](self, "addCenterYConstraintWithView:padding:", v8, a5);
  -[UIView addTrailingToTrailingConstraintWithView:padding:](self, "addTrailingToTrailingConstraintWithView:padding:", v8, a4);

}

- (void)addTrailingToTrailingConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:padding:](self, "addConstraintWithView:attribute:padding:", a3, 6, a4);
}

- (void)addCenterYConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:padding:](self, "addConstraintWithView:attribute:padding:", a3, 10, a4);
}

- (void)setDoneButtonEnabledState:(int64_t)a3
{
  UIView *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  if (a3 == 2)
  {
    -[UIView setHidden:](self, "setHidden:", 1);
    -[UIView setEnabled:](self, "setEnabled:", 0);
    v4 = self;
    v5 = 0;
LABEL_6:
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", v5);
    return;
  }
  if (a3 != 1)
  {
    if (a3)
      return;
    -[UIView setHidden:](self, "setHidden:");
    -[UIView setAlpha:](self, "setAlpha:", 1.0);
    -[UIView setEnabled:](self, "setEnabled:", 1);
    -[UIView setAccessibilityTraits:](self, "setAccessibilityTraits:", UIAccessibilityTraitButton);
    v4 = self;
    v5 = 1;
    goto LABEL_6;
  }
  -[UIView setHidden:](self, "setHidden:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v6, "recordingSectionDoneButtonDisabledOpacity");
  -[UIView setAlpha:](self, "setAlpha:");

  -[UIView setEnabled:](self, "setEnabled:", 0);
  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  v7 = (unint64_t)-[UIView accessibilityTraits](self, "accessibilityTraits");
  -[UIView setAccessibilityTraits:](self, "setAccessibilityTraits:", UIAccessibilityTraitNotEnabled | v7);
}

- (void)constrainSizeAndAlignCenterToCenterOfView:(id)a3
{
  -[UIView constrainSizeAndAlignCenterToCenterOfView:sizePaddingX:sizePaddingY:centerPaddingX:centerPaddingY:](self, "constrainSizeAndAlignCenterToCenterOfView:sizePaddingX:sizePaddingY:centerPaddingX:centerPaddingY:", a3, 0.0, 0.0, 0.0, 0.0);
}

- (void)alignCenterTrailingToCenterTrailingOfView:(id)a3 padding:(double)a4
{
  -[UIView alignCenterTrailingToCenterTrailingOfView:paddingX:paddingY:](self, "alignCenterTrailingToCenterTrailingOfView:paddingX:paddingY:", a3, a4, 0.0);
}

- (void)addCenterYConstraintWithView:(id)a3
{
  -[UIView addCenterYConstraintWithView:padding:](self, "addCenterYConstraintWithView:padding:", a3, 0.0);
}

- (void)addBottomToBottomConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:padding:](self, "addConstraintWithView:attribute:padding:", a3, 4, a4);
}

- (void)rc_showAllViewBoundsRecursively:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  UIColor *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v5 = (double)arc4random_uniform(0xFFu) / 255.0;
  v6 = (double)arc4random_uniform(0xFFu) / 255.0;
  v7 = +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v5, v6, (double)arc4random_uniform(0xFFu) / 255.0, 0.400000006);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[UIView setBackgroundColor:](self, "setBackgroundColor:", v8);

  if (v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "rc_showAllViewBoundsRecursively:", 1);
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (BOOL)rc_canAnimate
{
  void *v3;
  BOOL v4;

  if (!+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  v4 = v3 != 0;

  return v4;
}

+ (void)rc_beginDisablingAnimations
{
  if (!qword_1001ED810++)
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
}

+ (void)rc_endDisablingAnimations
{
  if (!--qword_1001ED810)
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 1);
}

+ (void)rc_performAnimateableChangesWithAnimationDuration:(double)a3 setupBlock:(id)a4 animatablesBlock:(id)a5 completion:(id)a6
{
  void (**v9)(_QWORD);
  void (**v10)(id, uint64_t);
  id v11;

  v11 = a4;
  v9 = (void (**)(_QWORD))a5;
  v10 = (void (**)(id, uint64_t))a6;
  if (v11)
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
  if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v9, v10, a3);
  }
  else
  {
    if (v9)
      v9[2](v9);
    if (v10)
      v10[2](v10, 1);
  }

}

- (id)rc_autolayoutView
{
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return self;
}

- (void)rc_updateConstraintsAndLayoutSubtree
{
  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
}

- (void)rc_layoutBelowIfNeeded
{
  -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
}

- (BOOL)rc_isProperDescendantOfView:(id)a3
{
  if (a3 == self)
    return 0;
  else
    return -[UIView isDescendantOfView:](self, "isDescendantOfView:");
}

- (void)rc_removeConstraint:(id)a3
{
  if (a3)
    -[UIView removeConstraint:](self, "removeConstraint:");
}

- (void)rc_removeConstraints:(id)a3
{
  if (a3)
    -[UIView removeConstraints:](self, "removeConstraints:");
}

- (void)rc_addConstraint:(id)a3
{
  if (a3)
    -[UIView addConstraint:](self, "addConstraint:");
}

- (void)rc_addConstraints:(id)a3
{
  if (a3)
    -[UIView addConstraints:](self, "addConstraints:");
}

- (id)_rc_constraintsByNameDictionary:(BOOL)a3
{
  _BOOL4 v3;
  id AssociatedObject;
  void *v6;
  BOOL v7;

  v3 = a3;
  AssociatedObject = objc_getAssociatedObject(self, "_rc_constraintsByNameStorageKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (v6)
    v7 = 1;
  else
    v7 = !v3;
  if (!v7)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_setAssociatedObject(self, "_rc_constraintsByNameStorageKey", v6, (void *)0x301);
  }
  return v6;
}

- (id)_rc_constraintsNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _rc_constraintsByNameDictionary:](self, "_rc_constraintsByNameDictionary:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (void)rc_setNamedConstraints:(id)a3 forName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _rc_constraintsNamed:](self, "_rc_constraintsNamed:", v6));

    if (v7)
      -[UIView rc_removeConstraintsNamed:](self, "rc_removeConstraintsNamed:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _rc_constraintsByNameDictionary:](self, "_rc_constraintsByNameDictionary:", 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraints"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraints"));
      -[UIView addConstraints:](self, "addConstraints:", v10);

    }
    objc_msgSend(v8, "setObject:forKey:", v11, v6);

  }
  else
  {
    -[UIView rc_removeConstraintsNamed:](self, "rc_removeConstraintsNamed:", v6);
  }

}

- (void)rc_removeConstraintsNamed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _rc_constraintsNamed:](self, "_rc_constraintsNamed:"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraints"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraints"));
      -[UIView removeConstraints:](self, "removeConstraints:", v7);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _rc_constraintsByNameDictionary:](self, "_rc_constraintsByNameDictionary:", 0));
    objc_msgSend(v8, "removeObjectForKey:", v9);

  }
}

- (void)rc_removeNamedConstraints
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _rc_constraintsByNameDictionary:](self, "_rc_constraintsByNameDictionary:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[UIView rc_removeConstraintsNamed:](self, "rc_removeConstraintsNamed:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (CGSize)size
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UIView frame](self, "frame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (double)height
{
  double v2;

  -[UIView frame](self, "frame");
  return v2;
}

- (double)width
{
  double v2;

  -[UIView frame](self, "frame");
  return v2;
}

- (void)removeAllConstraints
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView associatedConstraints](self, "associatedConstraints"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  objc_msgSend(v4, "removeConstraints:", v5);

  -[UIView resetAssociatedConstraints](self, "resetAssociatedConstraints");
}

- (void)alignTopLeftToTopLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToTopConstraintWithView:padding:](self, "addTopToTopConstraintWithView:padding:", v8, a5);
  -[UIView addLeftToLeftConstraintWithView:padding:](self, "addLeftToLeftConstraintWithView:padding:", v8, a4);

}

- (void)alignTopLeftToTopRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToTopConstraintWithView:padding:](self, "addTopToTopConstraintWithView:padding:", v8, a5);
  -[UIView addLeftToRightConstraintWithView:padding:](self, "addLeftToRightConstraintWithView:padding:", v8, a4);

}

- (void)alignTopLeftToBottomLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToBottomConstraintWithView:padding:](self, "addTopToBottomConstraintWithView:padding:", v8, a5);
  -[UIView addLeftToLeftConstraintWithView:padding:](self, "addLeftToLeftConstraintWithView:padding:", v8, a4);

}

- (void)alignTopLeftToBottomRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToBottomConstraintWithView:padding:](self, "addTopToBottomConstraintWithView:padding:", v8, a5);
  -[UIView addLeftToRightConstraintWithView:padding:](self, "addLeftToRightConstraintWithView:padding:", v8, a4);

}

- (void)alignTopLeftToBottomCenterOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToBottomConstraintWithView:padding:](self, "addTopToBottomConstraintWithView:padding:", v8, a5);
  -[UIView addLeftToCenterConstraintWithView:padding:](self, "addLeftToCenterConstraintWithView:padding:", v8, a4);

}

- (void)alignTopLeadingToTopLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToTopConstraintWithView:padding:](self, "addTopToTopConstraintWithView:padding:", v8, a5);
  -[UIView addLeadingToLeadingConstraintWithView:padding:](self, "addLeadingToLeadingConstraintWithView:padding:", v8, a4);

}

- (void)alignTopLeadingToTopMarginLeadingMarginOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToTopMarginConstraintWithView:padding:](self, "addTopToTopMarginConstraintWithView:padding:", v8, a5);
  -[UIView addLeadingToLeadingMarginConstraintWithView:padding:](self, "addLeadingToLeadingMarginConstraintWithView:padding:", v8, a4);

}

- (void)alignTopLeadingToTopMarginLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToTopMarginConstraintWithView:padding:](self, "addTopToTopMarginConstraintWithView:padding:", v8, a5);
  -[UIView addLeadingToLeadingConstraintWithView:padding:](self, "addLeadingToLeadingConstraintWithView:padding:", v8, a4);

}

- (void)alignTopRightToTopRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToTopConstraintWithView:padding:](self, "addTopToTopConstraintWithView:padding:", v8, a5);
  -[UIView addRightToRightConstraintWithView:padding:](self, "addRightToRightConstraintWithView:padding:", v8, a4);

}

- (void)alignTopRightToTopLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToTopConstraintWithView:padding:](self, "addTopToTopConstraintWithView:padding:", v8, a5);
  -[UIView addRightToLeftConstraintWithView:padding:](self, "addRightToLeftConstraintWithView:padding:", v8, a4);

}

- (void)alignTopRightToBottomRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToBottomConstraintWithView:padding:](self, "addTopToBottomConstraintWithView:padding:", v8, a5);
  -[UIView addRightToRightConstraintWithView:padding:](self, "addRightToRightConstraintWithView:padding:", v8, a4);

}

- (void)alignTopRightToBottomLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToBottomConstraintWithView:padding:](self, "addTopToBottomConstraintWithView:padding:", v8, a5);
  -[UIView addRightToLeftConstraintWithView:padding:](self, "addRightToLeftConstraintWithView:padding:", v8, a4);

}

- (void)alignTopRightToBottomCenterOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToBottomConstraintWithView:padding:](self, "addTopToBottomConstraintWithView:padding:", v8, a5);
  -[UIView addRightToCenterConstraintWithView:padding:](self, "addRightToCenterConstraintWithView:padding:", v8, a4);

}

- (void)alignTopTrailingToTopTrailingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToTopConstraintWithView:padding:](self, "addTopToTopConstraintWithView:padding:", v8, a5);
  -[UIView addTrailingToTrailingConstraintWithView:padding:](self, "addTrailingToTrailingConstraintWithView:padding:", v8, a4);

}

- (void)alignTopTrailingToTopMarginTrailingMarginOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToTopMarginConstraintWithView:padding:](self, "addTopToTopMarginConstraintWithView:padding:", v8, a5);
  -[UIView addTrailingToTrailingMarginConstraintWithView:padding:](self, "addTrailingToTrailingMarginConstraintWithView:padding:", v8, a4);

}

- (void)alignBottomLeftToBottomLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addBottomToBottomConstraintWithView:padding:](self, "addBottomToBottomConstraintWithView:padding:", v8, a5);
  -[UIView addLeftToLeftConstraintWithView:padding:](self, "addLeftToLeftConstraintWithView:padding:", v8, a4);

}

- (void)alignBottomLeftToBottomRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addBottomToBottomConstraintWithView:padding:](self, "addBottomToBottomConstraintWithView:padding:", v8, a5);
  -[UIView addLeftToRightConstraintWithView:padding:](self, "addLeftToRightConstraintWithView:padding:", v8, a4);

}

- (void)alignBottomLeftToTopLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addBottomToTopConstraintWithView:padding:](self, "addBottomToTopConstraintWithView:padding:", v8, a5);
  -[UIView addLeftToLeftConstraintWithView:padding:](self, "addLeftToLeftConstraintWithView:padding:", v8, a4);

}

- (void)alignBottomLeftToTopRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addTopToBottomConstraintWithView:padding:](self, "addTopToBottomConstraintWithView:padding:", v8, a5);
  -[UIView addLeftToRightConstraintWithView:padding:](self, "addLeftToRightConstraintWithView:padding:", v8, a4);

}

- (void)alignBottomLeadingToBottomLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addBottomToBottomConstraintWithView:padding:](self, "addBottomToBottomConstraintWithView:padding:", v8, a5);
  -[UIView addLeadingToLeadingConstraintWithView:padding:](self, "addLeadingToLeadingConstraintWithView:padding:", v8, a4);

}

- (void)alignBottomLeadingToBottomMarginLeadingMarginOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addBottomToBottomMarginConstraintWithView:padding:](self, "addBottomToBottomMarginConstraintWithView:padding:", v8, a5);
  -[UIView addLeadingToLeadingMarginConstraintWithView:padding:](self, "addLeadingToLeadingMarginConstraintWithView:padding:", v8, a4);

}

- (void)alignBottomLeadingToBottomMarginLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addBottomToBottomMarginConstraintWithView:padding:](self, "addBottomToBottomMarginConstraintWithView:padding:", v8, a5);
  -[UIView addLeadingToLeadingConstraintWithView:padding:](self, "addLeadingToLeadingConstraintWithView:padding:", v8, a4);

}

- (void)alignBottomRightToBottomRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addBottomToBottomConstraintWithView:padding:](self, "addBottomToBottomConstraintWithView:padding:", v8, a5);
  -[UIView addRightToRightConstraintWithView:padding:](self, "addRightToRightConstraintWithView:padding:", v8, a4);

}

- (void)alignBottomRightToBottomLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addBottomToBottomConstraintWithView:padding:](self, "addBottomToBottomConstraintWithView:padding:", v8, a5);
  -[UIView addRightToLeftConstraintWithView:padding:](self, "addRightToLeftConstraintWithView:padding:", v8, a4);

}

- (void)alignBottomRightToTopRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addBottomToTopConstraintWithView:padding:](self, "addBottomToTopConstraintWithView:padding:", v8, a5);
  -[UIView addRightToRightConstraintWithView:padding:](self, "addRightToRightConstraintWithView:padding:", v8, a4);

}

- (void)alignBottomRightToTopLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addBottomToTopConstraintWithView:padding:](self, "addBottomToTopConstraintWithView:padding:", v8, a5);
  -[UIView addRightToLeftConstraintWithView:padding:](self, "addRightToLeftConstraintWithView:padding:", v8, a4);

}

- (void)alignBottomTrailingToBottomTrailingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addBottomToBottomConstraintWithView:padding:](self, "addBottomToBottomConstraintWithView:padding:", v8, a5);
  -[UIView addTrailingToTrailingConstraintWithView:padding:](self, "addTrailingToTrailingConstraintWithView:padding:", v8, a4);

}

- (void)alignCenterTopToCenterBottomOfView:(id)a3 padding:(double)a4
{
  id v6;

  v6 = a3;
  -[UIView addCenterXConstraintWithView:](self, "addCenterXConstraintWithView:", v6);
  -[UIView addTopToBottomConstraintWithView:padding:](self, "addTopToBottomConstraintWithView:padding:", v6, a4);

}

- (void)alignCenterBottomToCenterBottomOfView:(id)a3 padding:(double)a4
{
  id v6;

  v6 = a3;
  -[UIView addCenterXConstraintWithView:](self, "addCenterXConstraintWithView:", v6);
  -[UIView addBottomToBottomConstraintWithView:padding:](self, "addBottomToBottomConstraintWithView:padding:", v6, a4);

}

- (void)alignCenterBottomToCenterTopOfView:(id)a3 padding:(double)a4
{
  id v6;

  v6 = a3;
  -[UIView addCenterXConstraintWithView:](self, "addCenterXConstraintWithView:", v6);
  -[UIView addBottomToTopConstraintWithView:padding:](self, "addBottomToTopConstraintWithView:padding:", v6, a4);

}

- (void)alignCenterLeftToCenterLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addCenterYConstraintWithView:padding:](self, "addCenterYConstraintWithView:padding:", v8, a5);
  -[UIView addLeftToLeftConstraintWithView:padding:](self, "addLeftToLeftConstraintWithView:padding:", v8, a4);

}

- (void)alignCenterLeftToCenterLeftOfView:(id)a3 padding:(double)a4
{
  -[UIView alignCenterLeftToCenterLeftOfView:paddingX:paddingY:](self, "alignCenterLeftToCenterLeftOfView:paddingX:paddingY:", a3, a4, 0.0);
}

- (void)alignCenterLeftToCenterRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addCenterYConstraintWithView:padding:](self, "addCenterYConstraintWithView:padding:", v8, a5);
  -[UIView addLeftToRightConstraintWithView:padding:](self, "addLeftToRightConstraintWithView:padding:", v8, a4);

}

- (void)alignCenterLeftToCenterRightOfView:(id)a3 padding:(double)a4
{
  -[UIView alignCenterLeftToCenterRightOfView:paddingX:paddingY:](self, "alignCenterLeftToCenterRightOfView:paddingX:paddingY:", a3, a4, 0.0);
}

- (void)alignCenterRightToCenterRightOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addCenterYConstraintWithView:padding:](self, "addCenterYConstraintWithView:padding:", v8, a5);
  -[UIView addRightToRightConstraintWithView:padding:](self, "addRightToRightConstraintWithView:padding:", v8, a4);

}

- (void)alignCenterRightToCenterRightOfView:(id)a3 padding:(double)a4
{
  -[UIView alignCenterRightToCenterRightOfView:paddingX:paddingY:](self, "alignCenterRightToCenterRightOfView:paddingX:paddingY:", a3, a4, 0.0);
}

- (void)alignCenterRightToCenterLeftOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addCenterYConstraintWithView:padding:](self, "addCenterYConstraintWithView:padding:", v8, a5);
  -[UIView addRightToLeftConstraintWithView:padding:](self, "addRightToLeftConstraintWithView:padding:", v8, a4);

}

- (void)alignCenterRightToCenterLeftOfView:(id)a3 padding:(double)a4
{
  -[UIView alignCenterRightToCenterLeftOfView:paddingX:paddingY:](self, "alignCenterRightToCenterLeftOfView:paddingX:paddingY:", a3, a4, 0.0);
}

- (void)alignCenterLeadingToCenterLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addCenterYConstraintWithView:padding:](self, "addCenterYConstraintWithView:padding:", v8, a5);
  -[UIView addLeadingToLeadingConstraintWithView:padding:](self, "addLeadingToLeadingConstraintWithView:padding:", v8, a4);

}

- (void)alignCenterLeadingToCenterLeadingMarginOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addCenterYConstraintWithView:padding:](self, "addCenterYConstraintWithView:padding:", v8, a5);
  -[UIView addLeadingToLeadingMarginConstraintWithView:padding:](self, "addLeadingToLeadingMarginConstraintWithView:padding:", v8, a4);

}

- (void)alignCenterLeadingToCenterLeadingOfView:(id)a3 padding:(double)a4
{
  -[UIView alignCenterLeadingToCenterLeadingOfView:paddingX:paddingY:](self, "alignCenterLeadingToCenterLeadingOfView:paddingX:paddingY:", a3, a4, 0.0);
}

- (void)alignCenterLeadingToCenterLeadingMarginOfView:(id)a3 padding:(double)a4
{
  -[UIView alignCenterLeadingToCenterLeadingMarginOfView:paddingX:paddingY:](self, "alignCenterLeadingToCenterLeadingMarginOfView:paddingX:paddingY:", a3, a4, 0.0);
}

- (void)alignCenterLeadingToCenterTrailingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addCenterYConstraintWithView:padding:](self, "addCenterYConstraintWithView:padding:", v8, a5);
  -[UIView addLeadingToTrailingConstraintWithView:padding:](self, "addLeadingToTrailingConstraintWithView:padding:", v8, a4);

}

- (void)alignCenterLeadingToCenterTrailingOfView:(id)a3 padding:(double)a4
{
  -[UIView alignCenterLeadingToCenterTrailingOfView:paddingX:paddingY:](self, "alignCenterLeadingToCenterTrailingOfView:paddingX:paddingY:", a3, a4, 0.0);
}

- (void)alignCenterTrailingToCenterLeadingOfView:(id)a3 paddingX:(double)a4 paddingY:(double)a5
{
  id v8;

  v8 = a3;
  -[UIView addCenterYConstraintWithView:padding:](self, "addCenterYConstraintWithView:padding:", v8, a5);
  -[UIView addTrailingToLeadingConstraintWithView:padding:](self, "addTrailingToLeadingConstraintWithView:padding:", v8, a4);

}

- (void)alignCenterTrailingToCenterLeadingOfView:(id)a3 padding:(double)a4
{
  -[UIView alignCenterTrailingToCenterLeadingOfView:paddingX:paddingY:](self, "alignCenterTrailingToCenterLeadingOfView:paddingX:paddingY:", a3, a4, 0.0);
}

- (void)alignCenterTrailingToCenterTrailingMarginOfView:(id)a3 padding:(double)a4
{
  id v6;

  v6 = a3;
  -[UIView addConstraintWithView:attribute:viewAttribute:padding:](self, "addConstraintWithView:attribute:viewAttribute:padding:", v6, 6, 18, a4);
  -[UIView addCenterYConstraintWithView:](self, "addCenterYConstraintWithView:", v6);

}

- (void)constrainWidth:(double)a3
{
  -[UIView addConstraintWithAttribute:constant:](self, "addConstraintWithAttribute:constant:", 7, a3);
}

- (void)constrainWidthWithView:(id)a3 scale:(double)a4 padding:(double)a5
{
  -[UIView addConstraintWithView:attribute:scale:padding:](self, "addConstraintWithView:attribute:scale:padding:", a3, 7, a4, a5);
}

- (void)constrainHeight:(double)a3
{
  -[UIView addConstraintWithAttribute:constant:](self, "addConstraintWithAttribute:constant:", 8, a3);
}

- (void)constrainHeightWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:padding:](self, "addConstraintWithView:attribute:padding:", a3, 8, a4);
}

- (void)constrainHeightWithView:(id)a3 scale:(double)a4 padding:(double)a5
{
  -[UIView addConstraintWithView:attribute:scale:padding:](self, "addConstraintWithView:attribute:scale:padding:", a3, 8, a4, a5);
}

- (void)constrainHeightBetweenTopView:(id)a3 bottomView:(id)a4 topPadding:(double)a5 bottomPadding:(double)a6
{
  id v10;

  v10 = a4;
  -[UIView alignCenterTopToCenterBottomOfView:padding:](self, "alignCenterTopToCenterBottomOfView:padding:", a3, a5);
  -[UIView alignCenterBottomToCenterTopOfView:padding:](self, "alignCenterBottomToCenterTopOfView:padding:", v10, a6);

}

- (void)constrainSize:(CGSize)a3
{
  double height;

  height = a3.height;
  -[UIView addConstraintWithAttribute:constant:](self, "addConstraintWithAttribute:constant:", 7, a3.width);
  -[UIView addConstraintWithAttribute:constant:](self, "addConstraintWithAttribute:constant:", 8, height);
}

- (void)addTopToTopMarginConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:viewAttribute:padding:](self, "addConstraintWithView:attribute:viewAttribute:padding:", a3, 3, 15, a4);
}

- (void)addTopToBottomConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:viewAttribute:padding:](self, "addConstraintWithView:attribute:viewAttribute:padding:", a3, 3, 4, a4);
}

- (void)addBottomToBottomMarginConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:viewAttribute:padding:](self, "addConstraintWithView:attribute:viewAttribute:padding:", a3, 4, 16, a4);
}

- (void)addBottomToTopConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:viewAttribute:padding:](self, "addConstraintWithView:attribute:viewAttribute:padding:", a3, 4, 3, a4);
}

- (void)addLeftToLeftConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:padding:](self, "addConstraintWithView:attribute:padding:", a3, 1, a4);
}

- (void)addLeftToRightConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:viewAttribute:padding:](self, "addConstraintWithView:attribute:viewAttribute:padding:", a3, 1, 2, a4);
}

- (void)addLeftToCenterConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:viewAttribute:padding:](self, "addConstraintWithView:attribute:viewAttribute:padding:", a3, 1, 9, a4);
}

- (void)addRightToRightConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:padding:](self, "addConstraintWithView:attribute:padding:", a3, 2, a4);
}

- (void)addRightToLeftConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:viewAttribute:padding:](self, "addConstraintWithView:attribute:viewAttribute:padding:", a3, 2, 1, a4);
}

- (void)addRightToCenterConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:viewAttribute:padding:](self, "addConstraintWithView:attribute:viewAttribute:padding:", a3, 2, 9, a4);
}

- (void)addTrailingToLeadingConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:viewAttribute:padding:](self, "addConstraintWithView:attribute:viewAttribute:padding:", a3, 6, 5, a4);
}

- (void)addLeadingToTrailingConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:viewAttribute:padding:](self, "addConstraintWithView:attribute:viewAttribute:padding:", a3, 5, 6, a4);
}

- (void)addLeadingToLeadingMarginConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:viewAttribute:padding:](self, "addConstraintWithView:attribute:viewAttribute:padding:", a3, 5, 17, a4);
}

- (void)addTrailingToTrailingMarginConstraintWithView:(id)a3 padding:(double)a4
{
  -[UIView addConstraintWithView:attribute:viewAttribute:padding:](self, "addConstraintWithView:attribute:viewAttribute:padding:", a3, 6, 18, a4);
}

- (void)addConstraintWithAttribute:(int64_t)a3 constant:(double)a4
{
  -[UIView addConstraintWithView:attribute:viewAttribute:padding:](self, "addConstraintWithView:attribute:viewAttribute:padding:", 0, a3, 0, a4);
}

- (void)addConstraintWithView:(id)a3 attribute:(int64_t)a4 viewAttribute:(int64_t)a5 padding:(double)a6
{
  -[UIView addConstraintWithView:attribute:viewAttribute:scale:padding:](self, "addConstraintWithView:attribute:viewAttribute:scale:padding:", a3, a4, a5, 1.0, a6);
}

- (void)addSubviewAndPinToEdges:(id)a3
{
  id v4;
  NSDictionary *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[UIView addSubview:](self, "addSubview:", v4);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = _NSDictionaryOfVariableBindings(CFSTR("subviewToAddAndPin"), v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[subviewToAddAndPin]-0-|"), 0, 0, v6));
  -[UIView addConstraints:](self, "addConstraints:", v7);

  v8 = _NSDictionaryOfVariableBindings(CFSTR("subviewToAddAndPin"), v4, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[subviewToAddAndPin]-0-|"), 0, 0, v10));
  -[UIView addConstraints:](self, "addConstraints:", v9);

}

- (void)addSubviewAndCenter:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UIView addSubview:](self, "addSubview:", v4);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 9, 0, self, 9, 1.0, 0.0));
  -[UIView addConstraint:](self, "addConstraint:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 10, 0, self, 10, 1.0, 0.0));
  -[UIView addConstraint:](self, "addConstraint:", v6);

}

+ (void)doSpringAnimations:(id)a3 withDuration:(double)a4 completion:(id)a5
{
  +[UIView doSpringAnimations:withDuration:damping:completion:](UIView, "doSpringAnimations:withDuration:damping:completion:", a3, a5, a4, 1.0);
}

+ (void)doSpringAnimations:(id)a3 withDuration:(double)a4 damping:(double)a5 completion:(id)a6
{
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, a3, a6, a4, 0.0, a5, 0.0);
}

@end
