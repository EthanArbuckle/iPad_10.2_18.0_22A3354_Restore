@implementation UIInputViewSetPlacement_ScreenDownApplicator

- (UIEdgeInsets)inputAccessoryPadding
{
  id WeakRetained;
  void *v3;
  void *v4;
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
  double v16;
  UIEdgeInsets result;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._owner);
  objc_msgSend(WeakRetained, "hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIInputViewSetPlacement_FloatingAssistantApplicator inputAccessoryPaddingForTraitCollection:](UIInputViewSetPlacement_FloatingAssistantApplicator, "inputAccessoryPaddingForTraitCollection:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

@end
