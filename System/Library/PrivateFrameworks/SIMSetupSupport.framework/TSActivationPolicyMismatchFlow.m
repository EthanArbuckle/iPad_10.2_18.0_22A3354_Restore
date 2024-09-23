@implementation TSActivationPolicyMismatchFlow

- (TSActivationPolicyMismatchFlow)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSActivationPolicyMismatchFlow;
  return -[TSSIMSetupFlow init](&v3, sel_init);
}

- (TSActivationPolicyMismatchFlow)initWithPlanItemError:(id)a3
{
  id v5;
  TSActivationPolicyMismatchFlow *v6;
  TSActivationPolicyMismatchFlow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSActivationPolicyMismatchFlow;
  v6 = -[TSSIMSetupFlow init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_planItemError, a3);

  return v7;
}

- (id)firstViewController
{
  TSMidOperationFailureViewController *v3;

  v3 = -[TSMidOperationFailureViewController initWithPlanItemError:updatePlanItem:withBackButton:forCarrier:withCarrierErrorCode:]([TSMidOperationFailureViewController alloc], "initWithPlanItemError:updatePlanItem:withBackButton:forCarrier:withCarrierErrorCode:", self->_planItemError, 0, 0, 0, 0);
  -[TSMidOperationFailureViewController setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (void)firstViewController:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[TSActivationPolicyMismatchFlow firstViewController](self, "firstViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (id)nextViewControllerFrom:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planItemError, 0);
}

@end
