@implementation TUIFocusContainerView

+ (id)renderModelWithSubviewsModel:(id)a3 identifier:(id)a4 focusStyle:(id)a5 actionHandler:(id)a6 linkEntities:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _TUIFocusContainerRenderModel *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[_TUIFocusContainerRenderModel initWithIdentifier:submodel:focusStyle:actionHandler:linkEntities:]([_TUIFocusContainerRenderModel alloc], "initWithIdentifier:submodel:focusStyle:actionHandler:linkEntities:", v14, v15, v13, v12, v11);

  return v16;
}

- (TUIFocusContainerView)initWithFrame:(CGRect)a3
{
  TUIFocusContainerView *v3;
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *tapGesture;
  _TUISecondaryTapGestureRecognizer *v6;
  UIGestureRecognizer *secondaryTapGesture;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TUIFocusContainerView;
  v3 = -[TUIContainerView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v3, "_handleTapGesture:");
    tapGesture = v3->_tapGesture;
    v3->_tapGesture = v4;

    -[UITapGestureRecognizer setAllowedTouchTypes:](v3->_tapGesture, "setAllowedTouchTypes:", &__NSArray0__struct);
    -[UITapGestureRecognizer setAllowedPressTypes:](v3->_tapGesture, "setAllowedPressTypes:", &off_252350);
    -[TUIFocusContainerView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_tapGesture);
    v6 = -[_TUISecondaryTapGestureRecognizer initWithTarget:action:]([_TUISecondaryTapGestureRecognizer alloc], "initWithTarget:action:", v3, "_handleSecondaryTapGesture:");
    secondaryTapGesture = v3->_secondaryTapGesture;
    v3->_secondaryTapGesture = &v6->super;

    -[TUIFocusContainerView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_secondaryTapGesture);
  }
  return v3;
}

- (void)prepareForReuse
{
  TUIFocusStylingHelper *styler;
  TUIInteractionsHelper *interactionHelper;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIFocusContainerView;
  -[TUIContainerView prepareForReuse](&v5, "prepareForReuse");
  -[TUIFocusStylingHelper reset](self->_styler, "reset");
  styler = self->_styler;
  self->_styler = 0;

  -[TUIInteractionsHelper detachInteractions](self->_interactionHelper, "detachInteractions");
  interactionHelper = self->_interactionHelper;
  self->_interactionHelper = 0;

}

- (void)applyLayoutAttributes:(id)a3
{
  TUIFocusStylingHelper *styler;
  id v5;
  void *v6;
  void *v7;
  TUIFocusStylingHelper *v8;
  id v9;
  void *v10;
  TUIFocusStylingHelper *v11;
  TUIFocusStylingHelper *v12;
  TUIInteractionsHelper *interactionHelper;
  TUIInteractionsHelper *v14;
  TUIInteractionsHelper *v15;
  id v16;
  void *v17;
  void *v18;
  TUIInteractionsHelper *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)TUIFocusContainerView;
  -[TUIContainerView applyLayoutAttributes:](&v22, "applyLayoutAttributes:", a3);
  styler = self->_styler;
  if (styler)
  {
    v5 = sub_12EC44(self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "focusStyle"));
    -[TUIFocusStylingHelper updateStyle:](styler, "updateStyle:", v7);
  }
  else
  {
    v8 = [TUIFocusStylingHelper alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIContainerView contentView](self, "contentView"));
    v9 = sub_12EC44(self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "focusStyle"));
    v11 = -[TUIFocusStylingHelper initWithContainer:reference:style:](v8, "initWithContainer:reference:style:", self, v6, v10);
    v12 = self->_styler;
    self->_styler = v11;

  }
  interactionHelper = self->_interactionHelper;
  if (!interactionHelper)
  {
    v14 = -[TUIInteractionsHelper initWithView:]([TUIInteractionsHelper alloc], "initWithView:", self);
    v15 = self->_interactionHelper;
    self->_interactionHelper = v14;

    interactionHelper = self->_interactionHelper;
  }
  v16 = sub_12EC44(self);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "linkEntities"));
  -[TUIInteractionsHelper updateWithLinkEntities:](interactionHelper, "updateWithLinkEntities:", v18);

  v19 = self->_interactionHelper;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIReusableBaseView feedControllerHost](self, "feedControllerHost"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "interactionBuilder"));
  -[TUIInteractionsHelper updateInteractionsWithBuilder:](v19, "updateInteractionsWithBuilder:", v21);

}

- (void)viewDidEndDisplay
{
  TUIInteractionsHelper *interactionHelper;

  -[TUIInteractionsHelper detachInteractions](self->_interactionHelper, "detachInteractions");
  interactionHelper = self->_interactionHelper;
  self->_interactionHelper = 0;

}

- (BOOL)canBecomeFocused
{
  return -[TUIFocusStylingHelper canBecomeFocused](self->_styler, "canBecomeFocused");
}

- (id)focusGroupIdentifier
{
  return -[TUIFocusStylingHelper focusGroupIdentifier](self->_styler, "focusGroupIdentifier");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  TUIFocusContainerView *v7;
  TUIFocusContainerView *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (TUIFocusContainerView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextFocusedItem"));

  if (v7 == self)
  {
    -[TUIFocusStylingHelper activateEffectWithAnimationCoordinator:](self->_styler, "activateEffectWithAnimationCoordinator:", v6);
  }
  else
  {
    v8 = (TUIFocusContainerView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "previouslyFocusedItem"));

    if (v8 == self)
      -[TUIFocusStylingHelper deactivateEffectWithAnimationCoordinator:](self->_styler, "deactivateEffectWithAnimationCoordinator:", v6);
  }

}

- (id)focusEffect
{
  return -[TUIFocusStylingHelper focusEffect](self->_styler, "focusEffect");
}

- (id)keyCommands
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = sub_12EC44(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionHandler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyCommands"));

  return v5;
}

- (void)_handleTapGesture:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = sub_12EC44(self);
  v6 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionHandler"));
  objc_msgSend(v5, "invoke:view:allowRefId:", CFSTR("press"), self, 1);

}

- (void)_handleSecondaryTapGesture:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a3;
  v5 = sub_12EC44(self);
  v11 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionHandler"));
  objc_msgSend(v4, "locationInView:", self);
  v8 = v7;
  v10 = v9;

  objc_msgSend(v6, "invoke:view:point:allowRefId:", CFSTR("context-menu"), self, 1, v8, v10);
}

- (void)tui_handleSelectKey:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = sub_12EC44(self);
  v6 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionHandler"));
  objc_msgSend(v5, "invoke:view:allowRefId:", CFSTR("press"), self, 1);

}

- (void)tui_handleContextMenuKey:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = sub_12EC44(self);
  v6 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionHandler"));
  objc_msgSend(v5, "invoke:view:allowRefId:", CFSTR("context-menu"), self, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionHelper, 0);
  objc_storeStrong((id *)&self->_secondaryTapGesture, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_styler, 0);
}

@end
