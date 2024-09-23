@implementation _PXStoryObservation

- (_PXStoryObservation)initWithObservable:(id)a3 changeHandler:(id)a4
{
  id v6;
  id v7;
  _PXStoryObservation *v8;
  _PXStoryObservation *v9;
  uint64_t v10;
  id changeHandler;
  id WeakRetained;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXStoryObservation;
  v8 = -[_PXStoryObservation init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observable, v6);
    v10 = objc_msgSend(v7, "copy");
    changeHandler = v9->_changeHandler;
    v9->_changeHandler = (id)v10;

    WeakRetained = objc_loadWeakRetained((id *)&v9->_observable);
    objc_msgSend(WeakRetained, "registerChangeObserver:context:", v9, 0);

  }
  return v9;
}

- (void)cancel
{
  void *v3;

  -[_PXStoryObservation observable](self, "observable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterChangeObserver:context:", self, 0);

  -[_PXStoryObservation setChangeHandler:](self, "setChangeHandler:", 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  -[_PXStoryObservation changeHandler](self, "changeHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_PXStoryObservation changeHandler](self, "changeHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, unint64_t))v8)[2](v8, v9, a4);

  }
}

- (PXObservable)observable
{
  return (PXObservable *)objc_loadWeakRetained((id *)&self->_observable);
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_destroyWeak((id *)&self->_observable);
}

@end
