@implementation CRLProgressUserInfoObject

- (CRLProgress)progress
{
  return (CRLProgress *)objc_loadWeakRetained((id *)&self->_progress);
}

- (void)setProgress:(id)a3
{
  objc_storeWeak((id *)&self->_progress, a3);
}

- (id)progressObserver
{
  return self->_progressObserver;
}

- (void)setProgressObserver:(id)a3
{
  objc_storeStrong(&self->_progressObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressObserver, 0);
  objc_destroyWeak((id *)&self->_progress);
}

@end
