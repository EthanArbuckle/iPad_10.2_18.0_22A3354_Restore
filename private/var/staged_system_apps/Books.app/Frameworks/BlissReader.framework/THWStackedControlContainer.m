@implementation THWStackedControlContainer

- (THWStackedControlContainer)initWithDelegate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWStackedControlContainer;
  return -[THWControlContainer initWithDelegate:](&v4, "initWithDelegate:", a3);
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THWStackedControlContainerLayout, a2);
}

@end
