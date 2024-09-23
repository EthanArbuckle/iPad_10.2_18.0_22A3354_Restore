@implementation BSUIAudiobookControlView

+ (id)renderModelWithIdentifier:(id)a3 dynamicProgress:(id)a4 dynamicState:(id)a5
{
  id v7;
  id v8;
  id v9;
  _BSUIAudiobookControlRenderModel *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(_BSUIAudiobookControlRenderModel);
  -[_BSUIAudiobookControlRenderModel setDynamicAudiobookProgress:](v10, "setDynamicAudiobookProgress:", v8);

  -[_BSUIAudiobookControlRenderModel setDynamicState:](v10, "setDynamicState:", v7);
  v11 = objc_msgSend(objc_alloc((Class)TUIRenderModelView), "initWithReuseIdentifier:identifier:submodel:", CFSTR("BSUIReuseIdentifierAudiobookControlView"), v9, v10);

  return v11;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  _BSUIAudiobookControlRenderModel *v6;
  _BSUIAudiobookControlRenderModel *renderModel;
  BSUIDynamicAudiobookProgress *v8;
  BSUIDynamicAudiobookProgress *dynamicAudiobookProgress;
  TUIDynamicProviding *v10;
  TUIDynamicProviding *dynamicState;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  TUIDynamicValue *v17;
  TUIDynamicValue *dynamicValue;
  TUIDynamicValueInstance *v19;
  TUIDynamicValueInstance *instance;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BSUIAudiobookControlView;
  -[BSUIAudiobookControlView applyLayoutAttributes:](&v21, "applyLayoutAttributes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderModel"));
  v6 = (_BSUIAudiobookControlRenderModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submodel"));
  renderModel = self->_renderModel;
  self->_renderModel = v6;

  v8 = (BSUIDynamicAudiobookProgress *)objc_claimAutoreleasedReturnValue(-[_BSUIAudiobookControlRenderModel dynamicAudiobookProgress](self->_renderModel, "dynamicAudiobookProgress"));
  dynamicAudiobookProgress = self->_dynamicAudiobookProgress;
  self->_dynamicAudiobookProgress = v8;

  v10 = (TUIDynamicProviding *)objc_claimAutoreleasedReturnValue(-[_BSUIAudiobookControlRenderModel dynamicState](self->_renderModel, "dynamicState"));
  dynamicState = self->_dynamicState;
  self->_dynamicState = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAudiobookControlView dynamicAudiobookProgress](self, "dynamicAudiobookProgress"));
  objc_msgSend(v12, "registerProgressObserver:", self);

  v14 = objc_opt_class(TUIDynamicValue, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAudiobookControlView dynamicState](self, "dynamicState"));
  v16 = TUIDynamicCast(v14, v15);
  v17 = (TUIDynamicValue *)objc_claimAutoreleasedReturnValue(v16);
  dynamicValue = self->_dynamicValue;
  self->_dynamicValue = v17;

  v19 = (TUIDynamicValueInstance *)objc_claimAutoreleasedReturnValue(-[TUIDynamicValue instanceForObserver:](self->_dynamicValue, "instanceForObserver:", self));
  instance = self->_instance;
  self->_instance = v19;

  -[BSUIAudiobookControlView _updatePlayState](self, "_updatePlayState");
}

- (BSUIAudiobookControlView)initWithFrame:(CGRect)a3
{
  BSUIAudiobookControlView *v3;
  BSUIAudiobookControl *v4;
  BSUIAudiobookControl *v5;
  BSUIAudiobookControl *audiobookControl;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BSUIAudiobookControlView;
  v3 = -[BSUIAudiobookControlView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [BSUIAudiobookControl alloc];
    -[BSUIAudiobookControlView bounds](v3, "bounds");
    v5 = -[BSUIAudiobookControl initWithFrame:](v4, "initWithFrame:");
    audiobookControl = v3->_audiobookControl;
    v3->_audiobookControl = v5;

    -[BSUIAudiobookControl setDelegate:](v3->_audiobookControl, "setDelegate:", v3);
    -[BSUIAudiobookControl setAutoresizingMask:](v3->_audiobookControl, "setAutoresizingMask:", 18);
    -[BSUIAudiobookControlView addSubview:](v3, "addSubview:", v3->_audiobookControl);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAudiobookControlView dynamicAudiobookProgress](self, "dynamicAudiobookProgress"));
  objc_msgSend(v3, "unregisterProgressObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BSUIAudiobookControlView;
  -[BSUIAudiobookControlView dealloc](&v4, "dealloc");
}

- (void)togglePlayPause:(id)a3
{
  if ((objc_opt_respondsToSelector(self->_dynamicAudiobookProgress, "togglePlayPause", a3) & 1) != 0)
    -[BSUIDynamicAudiobookProgress togglePlayPause](self->_dynamicAudiobookProgress, "togglePlayPause");
}

- (void)_updatePlayState
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1206C;
  block[3] = &unk_2E4608;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dynamicProgressChanged:(id)a3
{
  float v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "progress"));
  objc_msgSend(v5, "floatValue");
  -[BSUIAudiobookControl setProgress:](self->_audiobookControl, "setProgress:", v4);

}

- (_BSUIAudiobookControlRenderModel)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_renderModel, a3);
}

- (BSUIDynamicAudiobookProgress)dynamicAudiobookProgress
{
  return self->_dynamicAudiobookProgress;
}

- (void)setDynamicAudiobookProgress:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicAudiobookProgress, a3);
}

- (TUIDynamicProviding)dynamicState
{
  return self->_dynamicState;
}

- (void)setDynamicState:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicState, 0);
  objc_storeStrong((id *)&self->_dynamicAudiobookProgress, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_audiobookControl, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_dynamicValue, 0);
}

@end
