@implementation UIInputViewSetPlacement_FloatingAssistantApplicatorForNonKeyboard

- (id)initForOwner:(id)a3 withPlacement:(id)a4
{
  id v6;
  void *v7;
  id v8;
  objc_super v10;

  v6 = a3;
  +[UIInputViewSetPlacementWrapper placementWithPlacement:](UIInputViewSetPlacementAssistantOnScreenForNonKeyboard, "placementWithPlacement:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)UIInputViewSetPlacement_FloatingAssistantApplicatorForNonKeyboard;
  v8 = -[UIInputViewSetPlacement_GenericApplicator initForOwner:withPlacement:](&v10, sel_initForOwner_withPlacement_, v6, v7);

  return v8;
}

- (void)invalidate
{
  void *v3;
  objc_super v4;

  -[UIInputViewSetPlacement_FloatingAssistantApplicator hostView](self, "hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompact:", 0);

  v4.receiver = self;
  v4.super_class = (Class)UIInputViewSetPlacement_FloatingAssistantApplicatorForNonKeyboard;
  -[UIInputViewSetPlacement_FloatingAssistantApplicator invalidate](&v4, sel_invalidate);
}

- (UIEdgeInsets)inputAssistantPadding
{
  UIInputViewSetPlacementOwner **p_owner;
  id WeakRetained;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  UIEdgeInsets result;

  p_owner = &self->super.super.super._owner;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super._owner);
  objc_msgSend(WeakRetained, "placement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCompactAssistantView");

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)p_owner);
    objc_msgSend(v7, "containerView");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "frame");
    v10 = v9;

    v11 = objc_loadWeakRetained((id *)p_owner);
    objc_msgSend(v11, "placement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v8) = objc_opt_isKindOfClass();

    if ((v8 & 1) != 0)
    {
      v13 = -16.0;
      v14 = v10 + -75.0 + -16.0;
    }
    else
    {
      v13 = 91.0 - v10;
      v14 = 16.0;
    }
    v16 = 0.0;
    v15 = 0.0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIInputViewSetPlacement_FloatingAssistantApplicatorForNonKeyboard;
    -[UIInputViewSetPlacement_GenericApplicator inputAssistantPadding](&v17, sel_inputAssistantPadding);
  }
  result.right = v13;
  result.bottom = v16;
  result.left = v14;
  result.top = v15;
  return result;
}

- (BOOL)shouldApplyOriginChange
{
  return 0;
}

@end
