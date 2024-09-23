@implementation PSYSyncStateObserverExportedObject

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)didUpdateSyncForPairingID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PSYSyncStateObserverExportedObject delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdateSyncForPairingID:", v4);

}

- (PSYSyncStateObserverInterface)delegate
{
  return (PSYSyncStateObserverInterface *)objc_loadWeakRetained((id *)&self->_delegate);
}

@end
