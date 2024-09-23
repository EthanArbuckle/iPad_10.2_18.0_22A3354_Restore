@implementation PXDataSectionEnablementForwarder

- (PXDataSectionEnablementForwarder)initWithSourceDataSectionManager:(id)a3
{
  id v5;
  PXDataSectionEnablementForwarder *v6;
  PXDataSectionEnablementForwarder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDataSectionEnablementForwarder;
  v6 = -[PXDataSectionEnablementForwarder init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceDataSectionManager, a3);
    objc_msgSend(v5, "registerChangeObserver:context:", v7, PXDataSectionEnablementForwarderContext);
  }

  return v7;
}

- (void)setEnablementTarget:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_enablementTarget);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_enablementTarget, obj);
    -[PXDataSectionEnablementForwarder _updateEnablement](self, "_updateEnablement");
    v5 = obj;
  }

}

- (void)_updateEnablement
{
  uint64_t v3;
  void *v4;
  id v5;

  -[PXDataSectionEnablementForwarder sourceDataSectionManager](self, "sourceDataSectionManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "isDataSectionEmpty") ^ 1;
  -[PXDataSectionEnablementForwarder enablementTarget](self, "enablementTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PXDataSectionEnablementForwarderContext == a5)
    -[PXDataSectionEnablementForwarder _updateEnablement](self, "_updateEnablement", a3, a4);
}

- (PXDataSectionManager)sourceDataSectionManager
{
  return self->_sourceDataSectionManager;
}

- (PXDataSectionManagerEnabling)enablementTarget
{
  return (PXDataSectionManagerEnabling *)objc_loadWeakRetained((id *)&self->_enablementTarget);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_enablementTarget);
  objc_storeStrong((id *)&self->_sourceDataSectionManager, 0);
}

@end
