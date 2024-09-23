@implementation _UINonHostingVisibilityPropagationView

- (_UINonHostingVisibilityPropagationView)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINonHostingVisibilityPropagationView.m"), 21, CFSTR("%s is not allowed on %@"), "-[_UINonHostingVisibilityPropagationView init]", objc_opt_class());

  return 0;
}

- (_UINonHostingVisibilityPropagationView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINonHostingVisibilityPropagationView.m"), 26, CFSTR("%s is not allowed on %@"), "-[_UINonHostingVisibilityPropagationView initWithFrame:]", objc_opt_class());

  return 0;
}

- (_UINonHostingVisibilityPropagationView)initWithCoder:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UINonHostingVisibilityPropagationView.m"), 31, CFSTR("%s is not allowed on %@"), "-[_UINonHostingVisibilityPropagationView initWithCoder:]", objc_opt_class());

  return 0;
}

- (_UINonHostingVisibilityPropagationView)initWithFrame:(CGRect)a3 pid:(int)a4 environmentIdentifier:(id)a5
{
  _UINonHostingVisibilityPropagationView *v7;
  _UINonHostingVisibilityPropagationView *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_UINonHostingVisibilityPropagationView;
  v7 = -[_UIVisibilityPropagationView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_pid = a4;
    objc_storeStrong((id *)&v7->_environmentIdentifier, a5);
    if (v8->_pid >= 1 && -[NSString length](v8->_environmentIdentifier, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:environmentIdentifier:", v8->_pid, v8->_environmentIdentifier);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)v8->super._interaction, v9);

    }
    -[_UIVisibilityPropagationInteraction _setVisibilityPropagationEnabled:]((uint64_t)v8->super._interaction, 1);
  }
  return v8;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)environmentIdentifier
{
  return self->_environmentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentIdentifier, 0);
}

@end
