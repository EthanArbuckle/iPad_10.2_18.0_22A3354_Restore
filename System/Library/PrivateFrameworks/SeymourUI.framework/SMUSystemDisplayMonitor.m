@implementation SMUSystemDisplayMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong(&self->onDisplayDisconnected, 0);
  objc_storeStrong(&self->onDisplayConnected, 0);
}

- (SMUSystemDisplayMonitor)init
{
  SMUSystemDisplayMonitor *v2;
  FBSDisplayMonitor *v3;
  FBSDisplayMonitor *displayMonitor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SMUSystemDisplayMonitor;
  v2 = -[SMUSystemDisplayMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = (FBSDisplayMonitor *)objc_alloc_init(MEMORY[0x24BE38450]);
    displayMonitor = v2->_displayMonitor;
    v2->_displayMonitor = v3;

    -[FBSDisplayMonitor addObserver:](v2->_displayMonitor, "addObserver:", v2);
  }
  return v2;
}

- (NSSet)connectedIdentities
{
  void *v2;
  void *v3;

  -[SMUSystemDisplayMonitor displayMonitor](self, "displayMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedIdentities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (FBSDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setOnDisplayDisconnected:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setOnDisplayConnected:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)dealloc
{
  objc_super v3;

  -[FBSDisplayMonitor removeObserver:](self->_displayMonitor, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SMUSystemDisplayMonitor;
  -[SMUSystemDisplayMonitor dealloc](&v3, sel_dealloc);
}

- (SMUSystemDisplayIdentity)mainIdentity
{
  void *v2;
  void *v3;

  -[SMUSystemDisplayMonitor displayMonitor](self, "displayMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SMUSystemDisplayIdentity *)v3;
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v6;
  void (**v7)(id, id);

  v6 = a4;
  -[SMUSystemDisplayMonitor onDisplayConnected](self, "onDisplayConnected");
  v7 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v7[2](v7, v6);

}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  id v5;
  void (**v6)(id, id);

  v5 = a4;
  -[SMUSystemDisplayMonitor onDisplayDisconnected](self, "onDisplayDisconnected");
  v6 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5);

}

- (id)onDisplayConnected
{
  return self->onDisplayConnected;
}

- (id)onDisplayDisconnected
{
  return self->onDisplayDisconnected;
}

@end
