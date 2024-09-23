@implementation CRLCanvasLayoutChangeObserver

- (CRLCanvasLayoutChangeObserver)initWithChangeNotifier:(id)a3 layoutController:(id)a4
{
  id v6;
  id v7;
  CRLCanvasLayoutChangeObserver *v8;
  CRLCanvasLayoutChangeObserver *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLCanvasLayoutChangeObserver;
  v8 = -[CRLCanvasLayoutChangeObserver init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_changeNotifier, v6);
    objc_storeWeak((id *)&v9->_layoutController, v7);
  }

  return v9;
}

- (void)i_layoutRegistered:(id)a3
{
  CRLChangeNotifier **p_changeNotifier;
  id v5;
  void *v6;
  id WeakRetained;

  p_changeNotifier = &self->_changeNotifier;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_changeNotifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));

  objc_msgSend(WeakRetained, "addObserver:forChangeSource:", self, v6);
}

- (void)i_layoutUnregistered:(id)a3
{
  CRLChangeNotifier **p_changeNotifier;
  id v5;
  void *v6;
  id WeakRetained;

  p_changeNotifier = &self->_changeNotifier;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_changeNotifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));

  objc_msgSend(WeakRetained, "removeObserver:forChangeSource:", self, v6);
}

- (void)preprocessChanges:(id)a3 forChangeSource:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id WeakRetained;
  void *v16;
  id v17;
  id v18;

  v18 = a3;
  v6 = a4;
  v13 = sub_100221DDC(v6, 1, v7, v8, v9, v10, v11, v12, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v14)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutController);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layoutsForInfo:", v14));
    objc_msgSend(v16, "makeObjectsPerformSelector:withObject:", "processChanges:", v18);

  }
  v17 = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(v17, "preprocessChanges:forChangeSource:", v18, v6);

}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  CRLInteractiveCanvasController **p_icc;
  id v6;
  id v7;
  id WeakRetained;

  p_icc = &self->_icc;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_icc);
  objc_msgSend(WeakRetained, "processChanges:forChangeSource:", v7, v6);

}

- (void)didProcessAllChanges
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(WeakRetained, "didProcessAllChanges");

}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_icc);
}

- (void)setInteractiveCanvasController:(id)a3
{
  objc_storeWeak((id *)&self->_icc, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icc);
  objc_destroyWeak((id *)&self->_layoutController);
  objc_destroyWeak((id *)&self->_changeNotifier);
}

@end
