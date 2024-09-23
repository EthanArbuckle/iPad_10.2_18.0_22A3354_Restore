@implementation _UILayerHostView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UILayerHostView)initWithFrame:(CGRect)a3
{
  return -[_UILayerHostView initWithFrame:pid:contextID:](self, "initWithFrame:pid:contextID:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UILayerHostView)initWithFrame:(CGRect)a3 pid:(int)a4 contextID:(unsigned int)a5
{
  _UILayerHostView *v7;
  _UILayerHostView *v8;
  void *v9;
  uint64_t pid;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UILayerHostView;
  v7 = -[_UIVisibilityPropagationView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_pid = a4;
    v7->_contextID = a5;
    if (a5)
    {
      -[_UILayerHostView layerHost](v7, "layerHost");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setContextId:", v8->_contextID);

    }
    pid = v8->_pid;
    if ((int)pid >= 1 && v8->_contextID)
    {
      v11 = (void *)MEMORY[0x1E0D87DF8];
      _UISVisibilityEnvironmentForUIHostedWindowContextID();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "targetWithPid:environmentIdentifier:", pid, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)v8->super._interaction, v13);

    }
    -[_UIVisibilityPropagationInteraction _setVisibilityPropagationEnabled:]((uint64_t)v8->super._interaction, 1);
  }
  return v8;
}

- (_UILayerHostView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UILayerHostView;
  return -[_UIVisibilityPropagationView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  -[_UILayerHostView setPid:contextID:](self, "setPid:contextID:", self->_pid, *(_QWORD *)&a3);
}

- (void)setPid:(int)a3 contextID:(unsigned int)a4
{
  void *v5;
  uint64_t pid;
  void *v7;
  void *v8;
  id v9;

  self->_pid = a3;
  self->_contextID = a4;
  -[_UILayerHostView layerHost](self, "layerHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContextId:", self->_contextID);

  pid = self->_pid;
  if ((int)pid >= 1 && self->_contextID)
  {
    v7 = (void *)MEMORY[0x1E0D87DF8];
    _UISVisibilityEnvironmentForUIHostedWindowContextID();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "targetWithPid:environmentIdentifier:", pid, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)self->super._interaction, v8);

  }
  else
  {
    -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)self->super._interaction, 0);
  }
}

- (void)setInheritsSecurity:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UILayerHostView layerHost](self, "layerHost");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInheritsSecurity:", v3);

}

- (BOOL)inheritsSecurity
{
  void *v2;
  char v3;

  -[_UILayerHostView layerHost](self, "layerHost");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inheritsSecurity");

  return v3;
}

@end
