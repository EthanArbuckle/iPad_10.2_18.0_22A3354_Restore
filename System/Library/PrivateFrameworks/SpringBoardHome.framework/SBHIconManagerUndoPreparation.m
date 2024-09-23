@implementation SBHIconManagerUndoPreparation

- (SBHIconManagerUndoPreparation)initWithIconManager:(id)a3
{
  id v4;
  SBHIconManagerUndoPreparation *v5;
  SBHIconManagerUndoPreparation *v6;
  void *v7;
  uint64_t v8;
  SBRootFolder *unmodifiedOriginalRootFolder;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHIconManagerUndoPreparation;
  v5 = -[SBHIconManagerUndoPreparation init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconManager, v4);
    objc_msgSend(v4, "rootFolder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_originalRootFolder, v7);
    v8 = objc_msgSend(v7, "copy");
    unmodifiedOriginalRootFolder = v6->_unmodifiedOriginalRootFolder;
    v6->_unmodifiedOriginalRootFolder = (SBRootFolder *)v8;

  }
  return v6;
}

- (void)registerWithUndoManager:(id)a3 actionName:(id)a4 observer:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBHIconManagerUndoPreparation iconManager](self, "iconManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "undoPreparation:registerWithUndoManager:actionName:observer:", self, v10, v9, v8);

}

- (SBHIconManager)iconManager
{
  return (SBHIconManager *)objc_loadWeakRetained((id *)&self->_iconManager);
}

- (SBRootFolder)originalRootFolder
{
  return (SBRootFolder *)objc_loadWeakRetained((id *)&self->_originalRootFolder);
}

- (SBRootFolder)unmodifiedOriginalRootFolder
{
  return self->_unmodifiedOriginalRootFolder;
}

- (SBHUndoObserving)observer
{
  return (SBHUndoObserving *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_unmodifiedOriginalRootFolder, 0);
  objc_destroyWeak((id *)&self->_originalRootFolder);
  objc_destroyWeak((id *)&self->_iconManager);
}

@end
