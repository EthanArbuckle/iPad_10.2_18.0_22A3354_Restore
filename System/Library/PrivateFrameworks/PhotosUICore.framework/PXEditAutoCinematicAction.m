@implementation PXEditAutoCinematicAction

- (PXEditAutoCinematicAction)initWithCinematicController:(id)a3
{
  id v5;
  PXEditAutoCinematicAction *v6;
  PXEditAutoCinematicAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXEditAutoCinematicAction;
  v6 = -[PXEditAutoCinematicAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cinematicController, a3);
    v7->_isInAutoFocusState = objc_msgSend(v5, "isInAutoFocusState");
  }

  return v7;
}

- (void)performAction:(id)a3
{
  PXCinematicEditController *cinematicController;
  void (**v4)(id, uint64_t, _QWORD);

  cinematicController = self->_cinematicController;
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[PXCinematicEditController toggleAutoFocusState](cinematicController, "toggleAutoFocusState");
  v4[2](v4, 1, 0);

}

- (void)performUndo:(id)a3
{
  int isInAutoFocusState;
  int v5;
  void (**v6)(id, BOOL, _QWORD);

  v6 = (void (**)(id, BOOL, _QWORD))a3;
  isInAutoFocusState = self->_isInAutoFocusState;
  v5 = -[PXCinematicEditController isInAutoFocusState](self->_cinematicController, "isInAutoFocusState");
  if (isInAutoFocusState != v5)
    -[PXCinematicEditController toggleAutoFocusState](self->_cinematicController, "toggleAutoFocusState");
  v6[2](v6, isInAutoFocusState != v5, 0);

}

- (void)performRedo:(id)a3
{
  int isInAutoFocusState;
  int v5;
  void (**v6)(id, BOOL, _QWORD);

  v6 = (void (**)(id, BOOL, _QWORD))a3;
  isInAutoFocusState = self->_isInAutoFocusState;
  v5 = -[PXCinematicEditController isInAutoFocusState](self->_cinematicController, "isInAutoFocusState");
  if (isInAutoFocusState == v5)
    -[PXCinematicEditController toggleAutoFocusState](self->_cinematicController, "toggleAutoFocusState");
  v6[2](v6, isInAutoFocusState == v5, 0);

}

- (NSString)localizedActionName
{
  return self->_localizedActionName;
}

- (void)setLocalizedActionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedActionName, 0);
  objc_storeStrong((id *)&self->_cinematicController, 0);
}

@end
