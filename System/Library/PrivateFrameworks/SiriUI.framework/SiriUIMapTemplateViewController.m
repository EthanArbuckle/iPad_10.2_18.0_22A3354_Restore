@implementation SiriUIMapTemplateViewController

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUIMapTemplateViewController;
  -[SiriUIBaseTemplateViewController loadView](&v4, sel_loadView);
  -[SiriUIMapTemplateViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

}

- (Class)templateViewClass
{
  return (Class)objc_opt_class();
}

- (void)prepareForDismissal
{
  id v2;

  -[SiriUIMapTemplateViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareForDismissal");

}

- (void)mapTemplateView:(id)a3 didModifyPlacemark:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SiriUITemplateViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapTemplateViewController:didModifyPlacemark:", self, v5);

}

- (void)mapTemplateViewDidSelectMap:(id)a3
{
  id v4;

  -[SiriUITemplateViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentDetailsForTemplateViewController:", self);

}

@end
