@implementation SiriUIBaseTemplateViewController

- (void)loadView
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if ((-[objc_class isSubclassOfClass:](-[SiriUIBaseTemplateViewController templateViewClass](self, "templateViewClass"), "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SiriUIBaseTemplateViewController.m"), 16, CFSTR("-templateViewClass must return a subclass of SiriUIBaseTemplateView!"));

  }
  v4 = objc_alloc(-[SiriUIBaseTemplateViewController templateViewClass](self, "templateViewClass"));
  -[SiriUITemplateViewController templateModel](self, "templateModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "initWithDataSource:", v5);

  -[SiriUIBaseTemplateViewController setView:](self, "setView:", v7);
}

- (Class)templateViewClass
{
  return (Class)objc_opt_class();
}

@end
