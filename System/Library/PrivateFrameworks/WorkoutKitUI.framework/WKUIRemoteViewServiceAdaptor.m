@implementation WKUIRemoteViewServiceAdaptor

- (WKUIRemoteViewServiceAdaptor)init
{
  WKUIRemoteViewServiceAdaptor *v2;
  _TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor *v3;
  _TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor *viewServiceAdaptor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKUIRemoteViewServiceAdaptor;
  v2 = -[WKUIRemoteViewServiceAdaptor init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC12WorkoutKitUI31WorkoutRemoteViewServiceAdaptor);
    viewServiceAdaptor = v2->_viewServiceAdaptor;
    v2->_viewServiceAdaptor = v3;

  }
  return v2;
}

- (void)presentRemoteViewControllerOnHostController:(id)a3 workoutPlanData:(id)a4 dismissHandler:(id)a5 completionHandler:(id)a6
{
  -[WorkoutRemoteViewServiceAdaptor presentRemoteViewControllerOn:with:dismissCompletion:completion:](self->_viewServiceAdaptor, "presentRemoteViewControllerOn:with:dismissCompletion:completion:", a3, a4, a5, a6);
}

- (void)dismissRemoteViewControllerOnHostController:(id)a3
{
  -[WorkoutRemoteViewServiceAdaptor dismissRemoteViewControllerOn:](self->_viewServiceAdaptor, "dismissRemoteViewControllerOn:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewServiceAdaptor, 0);
}

@end
