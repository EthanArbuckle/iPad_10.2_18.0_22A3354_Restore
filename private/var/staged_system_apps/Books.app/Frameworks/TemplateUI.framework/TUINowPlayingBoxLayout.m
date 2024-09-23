@implementation TUINowPlayingBoxLayout

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  -[TUILayout renderModelSizeWithContext:](self, "renderModelSizeWithContext:", a4);
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v12 = objc_msgSend(v11, "playing");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "color"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUINowPlayingView renderModelWithIdentifier:playing:color:](TUINowPlayingView, "renderModelWithIdentifier:playing:color:", v10, v12, v14));

  objc_msgSend(v15, "setSize:", v6, v8);
  return v15;
}

@end
