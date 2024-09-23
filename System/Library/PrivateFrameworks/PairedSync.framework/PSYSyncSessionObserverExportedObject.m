@implementation PSYSyncSessionObserverExportedObject

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)syncSessionWillStart:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSYSyncSessionObserverExportedObject delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncSessionWillStart:", v4);

}

- (void)updateSyncSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSYSyncSessionObserverExportedObject delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSyncSession:", v4);

}

- (void)invalidateSyncSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSYSyncSessionObserverExportedObject delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateSyncSession:", v4);

}

- (PSYSyncSessionObserverInterface)delegate
{
  return (PSYSyncSessionObserverInterface *)objc_loadWeakRetained((id *)&self->_delegate);
}

@end
