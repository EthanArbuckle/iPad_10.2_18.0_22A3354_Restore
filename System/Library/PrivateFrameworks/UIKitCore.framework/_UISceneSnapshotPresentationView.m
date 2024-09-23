@implementation _UISceneSnapshotPresentationView

- (_UISceneSnapshotPresentationView)init
{
  void *v4;
  id v5;
  _UISceneSnapshotPresentationView *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneSnapshotPresentationView.m"), 27, CFSTR("-[_UISceneSnapshotPresentationView init] is unavailable. Please use -[initWithSnapshot:]."));

  v5 = objc_alloc_init(MEMORY[0x1E0D22970]);
  v6 = -[_UISceneSnapshotPresentationView initWithSnapshot:](self, "initWithSnapshot:", v5);

  return v6;
}

- (_UISceneSnapshotPresentationView)initWithCoder:(id)a3
{
  void *v5;
  id v6;
  _UISceneSnapshotPresentationView *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneSnapshotPresentationView.m"), 32, CFSTR("-[_UISceneSnapshotPresentationView initWithCoder:] is unavailable. Please use -[initWithSnapshot:]."));

  v6 = objc_alloc_init(MEMORY[0x1E0D22970]);
  v7 = -[_UISceneSnapshotPresentationView initWithSnapshot:](self, "initWithSnapshot:", v6);

  return v7;
}

- (_UISceneSnapshotPresentationView)initWithFrame:(CGRect)a3
{
  void *v5;
  id v6;
  _UISceneSnapshotPresentationView *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneSnapshotPresentationView.m"), 37, CFSTR("-[_UISceneSnapshotPresentationView initWithFrame:] is unavailable. Please use -[initWithSnapshot:]."));

  v6 = objc_alloc_init(MEMORY[0x1E0D22970]);
  v7 = -[_UISceneSnapshotPresentationView initWithSnapshot:](self, "initWithSnapshot:", v6);

  return v7;
}

- (_UISceneSnapshotPresentationView)initWithSnapshot:(id)a3
{
  id v5;
  _UISceneSnapshotPresentationView *v6;
  _UISceneSnapshotPresentationView *v7;
  id *p_snapshot;
  void *v9;
  void *v10;
  __int128 v11;
  void *v12;
  _OWORD v14[3];
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UISceneSnapshotPresentationView;
  v6 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    p_snapshot = (id *)&v6->_snapshot;
    objc_storeStrong((id *)&v6->_snapshot, a3);
    objc_msgSend(*p_snapshot, "IOSurface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(*p_snapshot, "CGImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UIView layer](v7, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContents:", v9);
    objc_msgSend(v10, "setAllowsDisplayCompositing:", 0);
    v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v14[0] = *MEMORY[0x1E0C9BAA8];
    v14[1] = v11;
    v14[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[UIView setTransform:](v7, "setTransform:", v14);
    objc_msgSend(v5, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    -[UIView setFrame:](v7, "setFrame:");

  }
  return v7;
}

- (FBSceneSnapshot)sceneSnapshot
{
  return self->_snapshot;
}

- (void)setSceneSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end
