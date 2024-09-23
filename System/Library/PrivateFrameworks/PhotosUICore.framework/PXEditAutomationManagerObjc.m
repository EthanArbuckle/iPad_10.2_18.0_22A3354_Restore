@implementation PXEditAutomationManagerObjc

- (PXEditAutomationManagerObjc)initWithDelegate:(id)a3
{
  PXEditAutomationManagerObjc *v3;
  PXEditAutomationManagerObjc *v4;
  PXEditAutomationManagerObjc *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXEditAutomationManagerObjc;
  v3 = -[PXEditAutomationManagerObjc init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automationManager, 0);
}

@end
