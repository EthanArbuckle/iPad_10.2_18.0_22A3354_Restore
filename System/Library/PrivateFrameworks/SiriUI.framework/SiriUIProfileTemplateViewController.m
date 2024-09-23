@implementation SiriUIProfileTemplateViewController

- (Class)templateViewClass
{
  return (Class)objc_opt_class();
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUIProfileTemplateViewController;
  -[SiriUIBaseTemplateViewController loadView](&v4, sel_loadView);
  -[SiriUIProfileTemplateViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

}

@end
