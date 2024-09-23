@implementation _UIHyperGesture

- (_UIHyperGesture)init
{
  _UIHyperInteractor *v3;
  _UIHyperGesture *v4;

  v3 = -[_UIHyperInteractor initWithDimensions:]([_UIHyperInteractor alloc], "initWithDimensions:", 1);
  v4 = -[_UIHyperGesture initWithInteractor:](self, "initWithInteractor:", v3);

  return v4;
}

- (_UIHyperGesture)initWithInteractor:(id)a3
{
  id v5;
  _UIHyperGesture *v6;
  _UIHyperGesture *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIHyperGesture;
  v6 = -[_UIHyperGesture init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->__interactor, a3);

  return v7;
}

- (void)_handleGesture:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _UIHyperGesture *v15;
  _QWORD v16[4];
  id v17;
  _UIHyperGesture *v18;
  _QWORD v19[5];
  _QWORD v20[5];

  v4 = a3;
  -[_UIHyperGesture _delegate](self, "_delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if ((unint64_t)(v5 - 3) < 2)
  {
    -[_UIHyperGesture _interactor](self, "_interactor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __34___UIHyperGesture__handleGesture___block_invoke_4;
    v13[3] = &unk_1E16B1B50;
    v11 = v12;
    v14 = v11;
    v15 = self;
    objc_msgSend(v10, "_interactionEndedMutatingState:", v13);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "_hyperGestureInteractionDidEnd:", self);
    v9 = v14;
    goto LABEL_10;
  }
  if (v5 == 2)
  {
LABEL_6:
    -[_UIHyperGesture _interactor](self, "_interactor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __34___UIHyperGesture__handleGesture___block_invoke;
    v20[3] = &unk_1E16B2FB8;
    v20[4] = self;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __34___UIHyperGesture__handleGesture___block_invoke_2;
    v19[3] = &unk_1E16B2FB8;
    v19[4] = self;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __34___UIHyperGesture__handleGesture___block_invoke_3;
    v16[3] = &unk_1E16B1B50;
    v17 = v12;
    v18 = self;
    objc_msgSend(v8, "_interactionChangedMutatingTranslation:velocity:mutatingState:", v20, v19, v16);

    v9 = v17;
LABEL_10:

    v6 = v12;
    goto LABEL_11;
  }
  v6 = v12;
  if (v5 == 1)
  {
    -[_UIHyperGesture _interactor](self, "_interactor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_interactionBegan");

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "_hyperGestureInteractionDidBegin:", self);
    goto LABEL_6;
  }
LABEL_11:

}

- (_UIHyperInteractor)_interactor
{
  return self->__interactor;
}

- (void)_setInteractor:(id)a3
{
  objc_storeStrong((id *)&self->__interactor, a3);
}

- (_UIHyperGestureDelegate)_delegate
{
  return (_UIHyperGestureDelegate *)objc_loadWeakRetained((id *)&self->__delegate);
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->__delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->__interactor, 0);
}

@end
