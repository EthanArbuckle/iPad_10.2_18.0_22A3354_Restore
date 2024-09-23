@implementation BKDisplayAnnotationDisplayController

- (BKDisplayAnnotationDisplayController)init
{
  BKDisplayAnnotationDisplayController *v2;
  BKDisplayAnnotationDisplayController *v3;
  BKCADisplayMonitor *v4;
  id v5;
  void *v6;
  BKCADisplayMonitor *v7;
  BKCADisplayMonitor *displayMonitor;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKDisplayAnnotationDisplayController;
  v2 = -[BKDisplayAnnotationDisplayController init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = [BKCADisplayMonitor alloc];
    v5 = sub_1000598B8();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = -[BKCADisplayMonitor initWithLog:](v4, "initWithLog:", v6);
    displayMonitor = v3->_displayMonitor;
    v3->_displayMonitor = v7;

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_lock_displayToAnnotationContext, 0);
}

@end
