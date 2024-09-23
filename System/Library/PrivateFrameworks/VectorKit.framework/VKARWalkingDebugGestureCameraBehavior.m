@implementation VKARWalkingDebugGestureCameraBehavior

- (VKARWalkingDebugGestureCameraBehavior)initWithCameraController:(id)a3
{
  id v4;
  VKARWalkingDebugGestureCameraBehavior *v5;
  VKARWalkingDebugGestureCameraBehavior *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VKARWalkingDebugGestureCameraBehavior;
  v5 = -[VKGestureCameraBehavior initWithCameraController:](&v8, sel_initWithCameraController_, v4);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_controller, v4);
    v6->super._notifyCameraStateChanges = 1;
  }

  return v6;
}

- (void)updatePan:(CGPoint)a3 lastScreenPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  VKARWalkingCameraController **p_controller;
  id WeakRetained;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v21;
  float v22;
  float v23;
  float v24;
  float v25;
  _DWORD v26[6];

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  p_controller = &self->_controller;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "canvas");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = v11;
  v14 = v13;

  v15 = v12 * v7;
  v16 = v14 - v6 * v14;
  v17 = v12 * x;
  v18 = v14 - y * v14;
  v19 = vabdd_f64(v16, v18);
  if (vabdd_f64(v15, v17) >= 1.0 || v19 >= 1.0)
  {
    v21 = objc_loadWeakRetained((id *)p_controller);
    v22 = v17;
    v23 = v18;
    v24 = v15;
    *(float *)v26 = v22;
    *(float *)&v26[1] = v23;
    v25 = v16;
    *(float *)&v26[2] = v24;
    *(float *)&v26[3] = v25;
    v26[4] = 0;
    objc_msgSend(v21, "pushGesture:", v26);

  }
}

- (void)updateRotate:(double)a3 atScreenPoint:(CGPoint)a4
{
  double y;
  double x;
  VKARWalkingCameraController **p_controller;
  id WeakRetained;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  float v15;
  float v16;
  double v17;
  float v18;
  float v19;
  int v20;

  y = a4.y;
  x = a4.x;
  p_controller = &self->_controller;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "canvas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;
  v13 = v12;

  v14 = objc_loadWeakRetained((id *)p_controller);
  v15 = v11 * x;
  v16 = v13 - y * v13;
  v17 = a3;
  v18 = v15;
  v19 = v16;
  v20 = 1;
  objc_msgSend(v14, "pushGesture:", &v17);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
}

@end
