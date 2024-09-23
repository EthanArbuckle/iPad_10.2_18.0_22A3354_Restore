@implementation SiriUISelectionTemplateViewController

- (Class)templateViewClass
{
  return (Class)objc_opt_class();
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUISelectionTemplateViewController;
  -[SiriUIBaseTemplateViewController loadView](&v4, sel_loadView);
  -[SiriUISelectionTemplateViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTargetForSelectionEvent:action:", self, sel__didSelectChoiceFromSender_);

}

- (void)_didSelectChoiceFromSender:(id)a3
{
  id v4;

  -[SiriUITemplateViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionTemplateViewControllerWasSelected:", self);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SiriUITemplateViewController templateModel](self, "templateModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", v3);

  -[SiriUISelectionTemplateViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (BOOL)selected
{
  void *v2;
  char v3;

  -[SiriUITemplateViewController templateModel](self, "templateModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selected");

  return v3;
}

@end
