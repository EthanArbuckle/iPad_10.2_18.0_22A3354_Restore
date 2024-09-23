@implementation UIInputViewSetPlacement_UndockedApplicator

- (void)applyChanges:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSLayoutConstraint *verticalConstraint;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIInputViewSetPlacement_UndockedApplicator;
  -[UIInputViewSetPlacement_GenericApplicator applyChanges:](&v11, sel_applyChanges_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->super._owner);
  objc_msgSend(WeakRetained, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "slideOverWindowVerticalOffset");
  v8 = v7;
  verticalConstraint = self->super._verticalConstraint;
  -[NSLayoutConstraint constant](verticalConstraint, "constant");
  -[NSLayoutConstraint setConstant:](verticalConstraint, "setConstant:", v8 + v10);

}

@end
