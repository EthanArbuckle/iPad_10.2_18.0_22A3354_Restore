@implementation SUInstallationConstraintMonitorBase

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  return -[SUInstallationConstraintMonitorBase initOnQueue:withDownload:andInstallOptions:](self, "initOnQueue:withDownload:andInstallOptions:", a3, a4, 0);
}

- (id)initOnQueue:(id)a3 withDownload:(id)a4 andInstallOptions:(id)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUInstallationConstraintMonitorBase.m"), 31, CFSTR("Please use the subclass version: -initOnQueue:withRepresentedInstallationConstraints:andDownload:andInstallOptions"));

  return 0;
}

- (id)initOnQueue:(id)a3 withRepresentedInstallationConstraints:(unint64_t)a4 andDownload:(id)a5
{
  return -[SUInstallationConstraintMonitorBase initOnQueue:withRepresentedInstallationConstraints:andDownload:andInstallOptions:](self, "initOnQueue:withRepresentedInstallationConstraints:andDownload:andInstallOptions:", a3, a4, a5, 0);
}

- (id)initOnQueue:(id)a3 withRepresentedInstallationConstraints:(unint64_t)a4 andDownload:(id)a5 andInstallOptions:(id)a6
{
  id v11;
  id v12;
  id v13;
  SUInstallationConstraintMonitorBase *v14;
  SUInstallationConstraintMonitorBase *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  BSDispatchQueueAssert();
  v17.receiver = self;
  v17.super_class = (Class)SUInstallationConstraintMonitorBase;
  v14 = -[SUInstallationConstraintMonitorBase init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_download, a5);
    v15->_representedConstraints = a4;
    objc_storeStrong((id *)&v15->_installOptions, a6);
    objc_storeStrong((id *)&v15->_queue, a3);
  }

  return v15;
}

- (SUDownload)download
{
  BSDispatchQueueAssert();
  return self->_download;
}

- (SUInstallOptions)installOptions
{
  BSDispatchQueueAssert();
  return self->_installOptions;
}

- (unint64_t)representedConstraints
{
  BSDispatchQueueAssert();
  return self->_representedConstraints;
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  return -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints");
}

- (SUInstallationConstraintMonitorDelegate)delegate
{
  BSDispatchQueueAssert();
  return (SUInstallationConstraintMonitorDelegate *)objc_loadWeakRetained((id *)&self->_queue_delegate);
}

- (void)setDelegate:(id)a3
{
  SUInstallationConstraintMonitorDelegate **p_queue_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  BSDispatchQueueAssert();
  p_queue_delegate = &self->_queue_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_queue_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_queue_delegate, obj);
    v6 = obj;
  }

}

- (BOOL)isSatisfied
{
  BSDispatchQueueAssert();
  return -[SUInstallationConstraintMonitorBase unsatisfiedConstraints](self, "unsatisfiedConstraints") == 0;
}

- (unint64_t)unsatisfiedConstraintsWithIgnorableConstraints:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUInstallationConstraintMonitorBase.m"), 100, CFSTR("Not Implemented"));

  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_queue_delegate);
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_download, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
