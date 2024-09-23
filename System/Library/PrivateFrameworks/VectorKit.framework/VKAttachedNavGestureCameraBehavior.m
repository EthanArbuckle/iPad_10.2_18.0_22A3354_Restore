@implementation VKAttachedNavGestureCameraBehavior

- (VKAttachedNavGestureCameraBehavior)initWithNavCameraController:(id)a3
{
  id v4;
  VKAttachedNavGestureCameraBehavior *v5;
  VKAttachedNavGestureCameraBehavior *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VKAttachedNavGestureCameraBehavior;
  v5 = -[VKGestureCameraBehavior initWithCameraController:](&v8, sel_initWithCameraController_, v4);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_navCameraController, v4);
    v6->super._notifyCameraStateChanges = 1;
    v6->_startZoomScale = 1.0;
  }

  return v6;
}

- (void)dealloc
{
  VKTimedAnimation *tapZoomAnimation;
  objc_super v4;

  -[VKAnimation stop](self->_tapZoomAnimation, "stop");
  tapZoomAnimation = self->_tapZoomAnimation;
  self->_tapZoomAnimation = 0;

  v4.receiver = self;
  v4.super_class = (Class)VKAttachedNavGestureCameraBehavior;
  -[VKAttachedNavGestureCameraBehavior dealloc](&v4, sel_dealloc);
}

- (void)_startZoomAnimationFrom:(double)a3 to:(double)a4 completionHandler:(id)a5
{
  id v8;
  VKTimedAnimation *v9;
  VKTimedAnimation *tapZoomAnimation;
  uint64_t v11;
  id v12;
  id WeakRetained;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17[3];
  id location;

  v8 = a5;
  -[VKAnimation stop](self->_tapZoomAnimation, "stop");
  v9 = -[VKTimedAnimation initWithDuration:]([VKTimedAnimation alloc], "initWithDuration:", 0.25);
  tapZoomAnimation = self->_tapZoomAnimation;
  self->_tapZoomAnimation = v9;

  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__VKAttachedNavGestureCameraBehavior__startZoomAnimationFrom_to_completionHandler___block_invoke;
  v16[3] = &unk_1E42F9418;
  objc_copyWeak(v17, &location);
  v17[1] = *(id *)&a3;
  v17[2] = *(id *)&a4;
  -[VKTimedAnimation setStepHandler:](self->_tapZoomAnimation, "setStepHandler:", v16);
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __83__VKAttachedNavGestureCameraBehavior__startZoomAnimationFrom_to_completionHandler___block_invoke_2;
  v14[3] = &unk_1E42F9440;
  v12 = v8;
  v15 = v12;
  -[VKAnimation setCompletionHandler:](self->_tapZoomAnimation, "setCompletionHandler:", v14);
  WeakRetained = objc_loadWeakRetained((id *)&self->_navCameraController);
  md::AnimationRunner::runAnimation((md::MapEngine **)objc_msgSend(WeakRetained, "animationRunner"), &self->_tapZoomAnimation->super);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

}

- (void)tapZoom:(CGPoint)a3 levels:(double)a4 completionHandler:(id)a5
{
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navCameraController);
  objc_msgSend(WeakRetained, "zoomScale");
  exp2(-a4);

  v8 = objc_loadWeakRetained((id *)&self->_navCameraController);
  objc_msgSend(v8, "minZoomScale");
  v9 = objc_loadWeakRetained((id *)&self->_navCameraController);
  objc_msgSend(v9, "maxZoomScale");

  v10 = objc_loadWeakRetained((id *)&self->_navCameraController);
  objc_msgSend(v10, "zoomScale");
  -[VKAttachedNavGestureCameraBehavior _startZoomAnimationFrom:to:completionHandler:](self, "_startZoomAnimationFrom:to:completionHandler:", v12);

  v11 = objc_loadWeakRetained((id *)&self->_navCameraController);
  objc_msgSend(v11, "startIgnoreStyleChangeTimer");

}

- (void)beginZoom:(CGPoint)a3
{
  double v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_navCameraController);
  objc_msgSend(WeakRetained, "zoomScale");
  self->_startZoomScale = v4;

}

- (void)updateZoom:(CGPoint)a3 oldFactor:(double)a4 newFactor:(double)a5
{
  double startZoomScale;
  VKNavCameraController **p_navCameraController;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  id WeakRetained;
  id v14;

  startZoomScale = self->_startZoomScale;
  p_navCameraController = &self->_navCameraController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navCameraController);
  objc_msgSend(WeakRetained, "minZoomScale");
  v9 = v8;
  v10 = objc_loadWeakRetained((id *)p_navCameraController);
  objc_msgSend(v10, "maxZoomScale");
  v12 = fmin(fmax(startZoomScale / a5, v9), v11);

  v14 = objc_loadWeakRetained((id *)p_navCameraController);
  objc_msgSend(v14, "setZoomScale:", v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapZoomAnimation, 0);
  objc_destroyWeak((id *)&self->_navCameraController);
}

void __83__VKAttachedNavGestureCameraBehavior__startZoomAnimationFrom_to_completionHandler___block_invoke(uint64_t a1, float a2)
{
  id *WeakRetained;
  double v5;
  id v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = *(double *)(a1 + 40) + (*(double *)(a1 + 48) - *(double *)(a1 + 40)) * a2;
    v7 = WeakRetained;
    v6 = objc_loadWeakRetained(WeakRetained + 23);
    objc_msgSend(v6, "setZoomScale:", v5);

    WeakRetained = v7;
  }

}

uint64_t __83__VKAttachedNavGestureCameraBehavior__startZoomAnimationFrom_to_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
