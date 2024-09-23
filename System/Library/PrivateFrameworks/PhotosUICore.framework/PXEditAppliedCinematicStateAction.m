@implementation PXEditAppliedCinematicStateAction

- (PXEditAppliedCinematicStateAction)initWithCinematicController:(id)a3 changeBlock:(id)a4
{
  id v7;
  id v8;
  PXEditAppliedCinematicStateAction *v9;
  PXEditAppliedCinematicStateAction *v10;
  uint64_t v11;
  NSDictionary *sourceCinematographyState;
  void *v13;
  id changeBlock;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXEditAppliedCinematicStateAction;
  v9 = -[PXEditAppliedCinematicStateAction init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cinematicController, a3);
    objc_msgSend(v7, "cinematographyState");
    v11 = objc_claimAutoreleasedReturnValue();
    sourceCinematographyState = v10->_sourceCinematographyState;
    v10->_sourceCinematographyState = (NSDictionary *)v11;

    v13 = _Block_copy(v8);
    changeBlock = v10->_changeBlock;
    v10->_changeBlock = v13;

  }
  return v10;
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXCinematicEditAction");
}

- (void)performAction:(id)a3
{
  _QWORD *changeBlock;
  PXCinematicEditController *cinematicController;
  void (*v6)(_QWORD *, PXCinematicEditController *);
  NSDictionary *v7;
  NSDictionary *targetCinematographyState;
  void (**v9)(id, uint64_t, _QWORD);

  changeBlock = self->_changeBlock;
  cinematicController = self->_cinematicController;
  v6 = (void (*)(_QWORD *, PXCinematicEditController *))changeBlock[2];
  v9 = (void (**)(id, uint64_t, _QWORD))a3;
  v6(changeBlock, cinematicController);
  -[PXCinematicEditController cinematographyState](self->_cinematicController, "cinematographyState");
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  targetCinematographyState = self->_targetCinematographyState;
  self->_targetCinematographyState = v7;

  v9[2](v9, 1, 0);
}

- (void)performUndo:(id)a3
{
  PXCinematicEditController *cinematicController;
  NSDictionary *sourceCinematographyState;
  void (**v5)(id, uint64_t, _QWORD);

  cinematicController = self->_cinematicController;
  sourceCinematographyState = self->_sourceCinematographyState;
  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  -[PXCinematicEditController resetToCinematographyState:](cinematicController, "resetToCinematographyState:", sourceCinematographyState);
  v5[2](v5, 1, 0);

}

- (void)performRedo:(id)a3
{
  PXCinematicEditController *cinematicController;
  NSDictionary *targetCinematographyState;
  void (**v5)(id, uint64_t, _QWORD);

  cinematicController = self->_cinematicController;
  targetCinematographyState = self->_targetCinematographyState;
  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  -[PXCinematicEditController resetToCinematographyState:](cinematicController, "resetToCinematographyState:", targetCinematographyState);
  v5[2](v5, 1, 0);

}

- (void)executeWithUndoManager:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXEditAppliedCinematicStateAction;
  -[PXAction executeWithUndoManager:completionHandler:](&v3, sel_executeWithUndoManager_completionHandler_, a3, &__block_literal_global_216092);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeBlock, 0);
  objc_storeStrong((id *)&self->_targetCinematographyState, 0);
  objc_storeStrong((id *)&self->_sourceCinematographyState, 0);
  objc_storeStrong((id *)&self->_cinematicController, 0);
}

@end
