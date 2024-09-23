@implementation _UIInterfaceActionSystemRepresentationView

- (_UIInterfaceActionSystemRepresentationView)initWithAction:(id)a3
{
  _UIInterfaceActionSystemRepresentationView *v3;
  uint64_t v4;
  NSSet *viewsToDisplayWhenContentsVisible;
  uint64_t v6;
  NSSet *displayedViews;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIInterfaceActionSystemRepresentationView;
  v3 = -[UIInterfaceActionRepresentationView initWithAction:](&v9, sel_initWithAction_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    viewsToDisplayWhenContentsVisible = v3->_viewsToDisplayWhenContentsVisible;
    v3->_viewsToDisplayWhenContentsVisible = (NSSet *)v4;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    displayedViews = v3->_displayedViews;
    v3->_displayedViews = (NSSet *)v6;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[_UIInterfaceActionSystemRepresentationView _invalidateDisplayedViewsConstraints](v3, "_invalidateDisplayedViewsConstraints");
    -[_UIInterfaceActionSystemRepresentationView _reloadViewsToDisplayWhenContentsVisible](v3, "_reloadViewsToDisplayWhenContentsVisible");
  }
  return v3;
}

- (void)setViewsToDisplayWhenContentsVisible:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NSSet isEqual:](self->_viewsToDisplayWhenContentsVisible, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewsToDisplayWhenContentsVisible, a3);
    -[_UIInterfaceActionSystemRepresentationView _arrangeDisplayedViews](self, "_arrangeDisplayedViews");
  }

}

- (void)updateConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionSystemRepresentationView;
  -[UIInterfaceActionRepresentationView updateConstraints](&v3, sel_updateConstraints);
  -[_UIInterfaceActionSystemRepresentationView _loadConstraintsForDisplayedViews](self, "_loadConstraintsForDisplayedViews");
}

- (void)loadContents
{
  _UIInterfaceActionImagePropertyView *v3;
  void *v4;
  _UIInterfaceActionImagePropertyView *v5;
  _UIInterfaceActionImagePropertyView *leadingImageView;
  _UIInterfaceActionImagePropertyView *v7;
  void *v8;
  _UIInterfaceActionImagePropertyView *v9;
  _UIInterfaceActionImagePropertyView *trailingImageView;
  _UIInterfaceActionLabelsPropertyView *v11;
  void *v12;
  _UIInterfaceActionLabelsPropertyView *v13;
  _UIInterfaceActionLabelsPropertyView *labelsView;

  v3 = [_UIInterfaceActionImagePropertyView alloc];
  -[UIInterfaceActionRepresentationView action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIInterfaceActionImagePropertyView initWithAction:imageProperty:](v3, "initWithAction:imageProperty:", v4, 0x1E16EFC40);
  leadingImageView = self->_leadingImageView;
  self->_leadingImageView = v5;

  -[UIView _setLayoutDebuggingIdentifier:](self->_leadingImageView, "_setLayoutDebuggingIdentifier:", CFSTR("actionRep.leadingImageView"));
  v7 = [_UIInterfaceActionImagePropertyView alloc];
  -[UIInterfaceActionRepresentationView action](self, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_UIInterfaceActionImagePropertyView initWithAction:imageProperty:](v7, "initWithAction:imageProperty:", v8, 0x1E16EFC80);
  trailingImageView = self->_trailingImageView;
  self->_trailingImageView = v9;

  -[UIView _setLayoutDebuggingIdentifier:](self->_trailingImageView, "_setLayoutDebuggingIdentifier:", CFSTR("actionRep.trailingImageView"));
  v11 = [_UIInterfaceActionLabelsPropertyView alloc];
  -[UIInterfaceActionRepresentationView action](self, "action");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[_UIInterfaceActionLabelsPropertyView initWithAction:](v11, "initWithAction:", v12);
  labelsView = self->_labelsView;
  self->_labelsView = v13;

  -[UIView _setLayoutDebuggingIdentifier:](self->_labelsView, "_setLayoutDebuggingIdentifier:", CFSTR("actionRep.labelsView"));
  -[_UIInterfaceActionSystemRepresentationView _reloadViewsToDisplayWhenContentsVisible](self, "_reloadViewsToDisplayWhenContentsVisible");
  -[_UIInterfaceActionSystemRepresentationView _applyVisualStyleToDisplayedViews](self, "_applyVisualStyleToDisplayedViews");
  -[_UIInterfaceActionSystemRepresentationView _arrangeDisplayedViews](self, "_arrangeDisplayedViews");
}

- (BOOL)_hasLoadedContents
{
  return self->_labelsView != 0;
}

- (void)interfaceAction:(id)a3 reloadDisplayedContentActionProperties:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_UIInterfaceActionSystemRepresentationView;
  v6 = a4;
  -[UIInterfaceActionRepresentationView interfaceAction:reloadDisplayedContentActionProperties:](&v8, sel_interfaceAction_reloadDisplayedContentActionProperties_, a3, v6);
  v9[0] = 0x1E16EFC40;
  v9[1] = 0x1E16EFC60;
  v9[2] = 0x1E16EFC80;
  v9[3] = 0x1E16EFCA0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = +[UIInterfaceAction changedProperties:containsAny:](UIInterfaceAction, "changedProperties:containsAny:", v6, v7);

  if ((_DWORD)a3)
    -[_UIInterfaceActionSystemRepresentationView _reloadViewsToDisplayWhenContentsVisible](self, "_reloadViewsToDisplayWhenContentsVisible");
}

- (void)interfaceAction:(id)a3 reloadDisplayedContentVisualStyle:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIInterfaceActionSystemRepresentationView;
  -[UIInterfaceActionRepresentationView interfaceAction:reloadDisplayedContentVisualStyle:](&v4, sel_interfaceAction_reloadDisplayedContentVisualStyle_, a3, a4);
}

- (void)_applyVisualStyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionSystemRepresentationView;
  -[UIInterfaceActionRepresentationView _applyVisualStyle](&v3, sel__applyVisualStyle);
  -[_UIInterfaceActionSystemRepresentationView _applyVisualStyleToDisplayedViews](self, "_applyVisualStyleToDisplayedViews");
}

- (void)_reloadViewsToDisplayWhenContentsVisible
{
  id v3;

  if (-[_UIInterfaceActionSystemRepresentationView _hasLoadedContents](self, "_hasLoadedContents"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (-[_UIInterfaceActionImagePropertyView isUsedToOccupySpaceIfNoImage](self->_leadingImageView, "isUsedToOccupySpaceIfNoImage"))
    {
      objc_msgSend(v3, "addObject:", self->_leadingImageView);
    }
    objc_msgSend(v3, "addObject:", self->_labelsView);
    if (-[_UIInterfaceActionImagePropertyView isUsedToOccupySpaceIfNoImage](self->_trailingImageView, "isUsedToOccupySpaceIfNoImage"))
    {
      objc_msgSend(v3, "addObject:", self->_trailingImageView);
    }
    -[_UIInterfaceActionSystemRepresentationView setViewsToDisplayWhenContentsVisible:](self, "setViewsToDisplayWhenContentsVisible:", v3);

  }
}

- (void)_arrangeDisplayedViews
{
  -[_UIInterfaceActionSystemRepresentationView _invalidateDisplayedViewsConstraints](self, "_invalidateDisplayedViewsConstraints");
  if (-[UIInterfaceActionRepresentationView _contentsInsertedIntoViewHierarchy](self, "_contentsInsertedIntoViewHierarchy"))
  {
    -[_UIInterfaceActionSystemRepresentationView _reloadHierarchyWithViewsToDisplayWhenContentsVisible](self, "_reloadHierarchyWithViewsToDisplayWhenContentsVisible");
  }
  else
  {
    -[_UIInterfaceActionSystemRepresentationView _removeAllDisplayedViews](self, "_removeAllDisplayedViews");
  }
}

- (void)_removeAllDisplayedViews
{
  NSSet *v3;
  NSSet *displayedViews;

  -[NSSet enumerateObjectsUsingBlock:](self->_displayedViews, "enumerateObjectsUsingBlock:", &__block_literal_global_11);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  displayedViews = self->_displayedViews;
  self->_displayedViews = v3;

}

- (void)_reloadHierarchyWithViewsToDisplayWhenContentsVisible
{
  NSSet *v3;
  NSSet *displayedViews;
  NSSet *v5;
  id v6;
  _QWORD v7[5];

  v3 = (NSSet *)-[NSSet copy](self->_viewsToDisplayWhenContentsVisible, "copy");
  v6 = (id)-[NSSet mutableCopy](self->_displayedViews, "mutableCopy");
  objc_msgSend(v6, "minusSet:", v3);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_19);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99___UIInterfaceActionSystemRepresentationView__reloadHierarchyWithViewsToDisplayWhenContentsVisible__block_invoke_2;
  v7[3] = &unk_1E16B23E0;
  v7[4] = self;
  -[NSSet enumerateObjectsWithOptions:usingBlock:](v3, "enumerateObjectsWithOptions:usingBlock:", 2, v7);
  displayedViews = self->_displayedViews;
  self->_displayedViews = v3;
  v5 = v3;

}

- (void)_loadConstraintsForDisplayedViews
{
  if (-[NSSet count](self->_displayedViews, "count") == 1)
  {
    -[_UIInterfaceActionSystemRepresentationView _loadConstraintsForLabelsOnlyDisplay](self, "_loadConstraintsForLabelsOnlyDisplay");
  }
  else if (-[NSSet count](self->_displayedViews, "count") >= 2)
  {
    -[_UIInterfaceActionSystemRepresentationView _loadConstraintsForLabelsAndImagesDisplay](self, "_loadConstraintsForLabelsAndImagesDisplay");
  }
  -[_UIInterfaceActionSystemRepresentationView _updateDisplayedViewsConstraintsVisualStyleConstants](self, "_updateDisplayedViewsConstraintsVisualStyleConstants");
  -[_UIInterfaceActionSystemRepresentationView _activateDisplayedViewsConstraints](self, "_activateDisplayedViewsConstraints");
}

- (void)_loadConstraintsForLabelsOnlyDisplay
{
  void *v3;
  NSArray *v4;
  NSArray *displayedViewsPositioningConstraints;
  NSArray *displayedViewsSpacingConstraints;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsOnlyDisplay__block_invoke;
  v7[3] = &unk_1E16B2408;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __82___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsOnlyDisplay__block_invoke((uint64_t)v7, v3);
  objc_msgSend(v3, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();

  displayedViewsPositioningConstraints = self->_displayedViewsPositioningConstraints;
  self->_displayedViewsPositioningConstraints = v4;

  displayedViewsSpacingConstraints = self->_displayedViewsSpacingConstraints;
  self->_displayedViewsSpacingConstraints = (NSArray *)MEMORY[0x1E0C9AA60];

}

- (void)_loadConstraintsForLabelsAndImagesDisplay
{
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  NSArray *v7;
  NSArray *displayedViewsPositioningConstraints;
  void *v9;
  NSArray *v10;
  NSArray *displayedViewsSpacingConstraints;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  BOOL v15;

  -[UIInterfaceActionRepresentationView action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "titleAlignment") == 1;

  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsAndImagesDisplay__block_invoke;
  v14[3] = &unk_1E16B2430;
  v14[4] = self;
  v15 = v4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __87___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsAndImagesDisplay__block_invoke((uint64_t)v14, v6);
  objc_msgSend(v6, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  displayedViewsPositioningConstraints = self->_displayedViewsPositioningConstraints;
  self->_displayedViewsPositioningConstraints = v7;

  LOBYTE(v13) = v4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v5, 3221225472, __87___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsAndImagesDisplay__block_invoke_2, &unk_1E16B2430, self, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __87___UIInterfaceActionSystemRepresentationView__loadConstraintsForLabelsAndImagesDisplay__block_invoke_2((uint64_t)&v12, v9);
  objc_msgSend(v9, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();

  displayedViewsSpacingConstraints = self->_displayedViewsSpacingConstraints;
  self->_displayedViewsSpacingConstraints = v10;

}

- (id)_constraintForVerticallyCenteringLabelsView
{
  void *v3;
  void *v4;
  void *v5;

  -[UIView centerYAnchor](self->_labelsView, "centerYAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self, "centerYAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_constraintForBaselineAligningOrVerticallyCenteringImageViewToLabelsView:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasBaseline");

  if (v6)
  {
    objc_msgSend(v4, "lastBaselineAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView lastBaselineAnchor](self->_labelsView, "lastBaselineAnchor");
  }
  else
  {
    objc_msgSend(v4, "centerYAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView centerYAnchor](self->_labelsView, "centerYAnchor");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_constraintsToEnsureContainerHeightTallEnoughForViews:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  id v11;
  _UIInterfaceActionSystemRepresentationView *v12;

  v4 = a3;
  v10 = MEMORY[0x1E0C809B0];
  v11 = v4;
  v12 = self;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = v4;
  objc_msgSend(v5, "array", v10, 3221225472, __100___UIInterfaceActionSystemRepresentationView__constraintsToEnsureContainerHeightTallEnoughForViews___block_invoke, &unk_1E16B2458, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __100___UIInterfaceActionSystemRepresentationView__constraintsToEnsureContainerHeightTallEnoughForViews___block_invoke((uint64_t)&v10, v7);
  objc_msgSend(v7, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_constraintsForInsettingLabelsViewLeadingAndTrailing
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __98___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailing__block_invoke;
  v5[3] = &unk_1E16B2408;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __98___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailing__block_invoke((uint64_t)v5, v2);
  objc_msgSend(v2, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_constraintsForInsettingLabelsViewLeadingAndTrailingToImageViewsExact:(BOOL)a3
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;

  LOBYTE(v7) = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", MEMORY[0x1E0C809B0], 3221225472, __116___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailingToImageViewsExact___block_invoke, &unk_1E16B2430, self, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __116___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailingToImageViewsExact___block_invoke((uint64_t)&v6, v3);
  objc_msgSend(v3, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_constraintsForInsettingLabelsViewLeadingAndTrailingHorizontalEdgeReferenceExact:(BOOL)a3
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;

  LOBYTE(v7) = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", MEMORY[0x1E0C809B0], 3221225472, __127___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailingHorizontalEdgeReferenceExact___block_invoke, &unk_1E16B2430, self, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __127___UIInterfaceActionSystemRepresentationView__constraintsForInsettingLabelsViewLeadingAndTrailingHorizontalEdgeReferenceExact___block_invoke((uint64_t)&v6, v3);
  objc_msgSend(v3, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_constraintsForInsettingImageViewsLeadingAndTrailingEdge
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __102___UIInterfaceActionSystemRepresentationView__constraintsForInsettingImageViewsLeadingAndTrailingEdge__block_invoke;
  v5[3] = &unk_1E16B2408;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __102___UIInterfaceActionSystemRepresentationView__constraintsForInsettingImageViewsLeadingAndTrailingEdge__block_invoke((uint64_t)v5, v2);
  objc_msgSend(v2, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_constraintsForHorizontallyCenteringLabelsView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[UIView centerXAnchor](self->_labelsView, "centerXAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIInterfaceActionSystemRepresentationView _horizontalEdgeReference](self, "_horizontalEdgeReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateDisplayedViewsConstraintsVisualStyleConstants
{
  NSArray *displayedViewsSpacingConstraints;
  uint64_t v4;
  id v5;
  _QWORD v6[5];

  -[UIInterfaceActionRepresentationView visualStyle](self, "visualStyle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "horizontalImageContentSpacing");
  displayedViewsSpacingConstraints = self->_displayedViewsSpacingConstraints;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __98___UIInterfaceActionSystemRepresentationView__updateDisplayedViewsConstraintsVisualStyleConstants__block_invoke;
  v6[3] = &__block_descriptor_40_e35_v32__0__NSLayoutConstraint_8Q16_B24l;
  v6[4] = v4;
  -[NSArray enumerateObjectsUsingBlock:](displayedViewsSpacingConstraints, "enumerateObjectsUsingBlock:", v6);

}

- (void)_invalidateDisplayedViewsConstraints
{
  NSArray *displayedViewsSpacingConstraints;
  NSArray *displayedViewsPositioningConstraints;

  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_displayedViewsSpacingConstraints);
  displayedViewsSpacingConstraints = self->_displayedViewsSpacingConstraints;
  self->_displayedViewsSpacingConstraints = 0;

  objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", self->_displayedViewsPositioningConstraints);
  displayedViewsPositioningConstraints = self->_displayedViewsPositioningConstraints;
  self->_displayedViewsPositioningConstraints = 0;

  -[UIView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_activateDisplayedViewsConstraints
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];

  v2 = (void *)MEMORY[0x1E0D156E0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80___UIInterfaceActionSystemRepresentationView__activateDisplayedViewsConstraints__block_invoke;
  v5[3] = &unk_1E16B2408;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __80___UIInterfaceActionSystemRepresentationView__activateDisplayedViewsConstraints__block_invoke((uint64_t)v5, v3);
  objc_msgSend(v3, "sortedArrayUsingFunction:context:", compareConstraintsForInsertionPerformance, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "activateConstraints:", v4);
}

- (BOOL)_displayedViewsConstraintsNeedsLoading
{
  return -[NSArray count](self->_displayedViewsPositioningConstraints, "count") == 0;
}

- (BOOL)_isDisplayingLeadingImageView
{
  return -[NSSet containsObject:](self->_displayedViews, "containsObject:", self->_leadingImageView);
}

- (BOOL)_isDisplayingTrailingImageView
{
  return -[NSSet containsObject:](self->_displayedViews, "containsObject:", self->_trailingImageView);
}

- (_UIInterfaceActionImagePropertyView)leadingImageView
{
  return self->_leadingImageView;
}

- (_UIInterfaceActionImagePropertyView)trailingImageView
{
  return self->_trailingImageView;
}

- (_UIInterfaceActionLabelsPropertyView)labelsView
{
  return self->_labelsView;
}

- (NSSet)viewsToDisplayWhenContentsVisible
{
  return self->_viewsToDisplayWhenContentsVisible;
}

- (NSSet)displayedViews
{
  return self->_displayedViews;
}

- (void)setDisplayedViews:(id)a3
{
  objc_storeStrong((id *)&self->_displayedViews, a3);
}

- (NSArray)displayedViewsSpacingConstraints
{
  return self->_displayedViewsSpacingConstraints;
}

- (NSArray)displayedViewsPositioningConstraints
{
  return self->_displayedViewsPositioningConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedViewsPositioningConstraints, 0);
  objc_storeStrong((id *)&self->_displayedViewsSpacingConstraints, 0);
  objc_storeStrong((id *)&self->_displayedViews, 0);
  objc_storeStrong((id *)&self->_viewsToDisplayWhenContentsVisible, 0);
  objc_storeStrong((id *)&self->_labelsView, 0);
  objc_storeStrong((id *)&self->_trailingImageView, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);
}

@end
