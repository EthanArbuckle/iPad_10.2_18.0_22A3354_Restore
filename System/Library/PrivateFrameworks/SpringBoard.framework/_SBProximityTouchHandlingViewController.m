@implementation _SBProximityTouchHandlingViewController

- (id)delegate
{
  id *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "_view");
    v1 = (id *)objc_claimAutoreleasedReturnValue();
    -[_SBProximityTouchHandlingView delegate](v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)setDelegate:(void *)a1
{
  uint64_t v3;
  void *v4;
  id obj;

  obj = a2;
  if (a1)
  {
    objc_msgSend(a1, "_view");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      objc_storeWeak((id *)(v3 + 416), obj);

  }
}

- (void)setStatusBarHeight:(double *)a1
{
  double *v3;

  if (a1 && a1[121] != a2)
  {
    a1[121] = a2;
    objc_msgSend(a1, "_view");
    v3 = (double *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v3[53] = a2;

  }
}

- (void)loadView
{
  _SBProximityTouchHandlingView *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double *v8;

  v3 = [_SBProximityTouchHandlingView alloc];
  v8 = -[_SBProximityTouchHandlingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v8, "setOpaque:", 0);
  objc_msgSend(v8, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHitTestsAsOpaque:", 1);

  if (-[SBProximitySettings colorScreenEdgeWhenObjectInProximity](self->_proximitySettings, "colorScreenEdgeWhenObjectInProximity"))
  {
    objc_msgSend(v8, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemMintColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

    objc_msgSend(v8, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderWidth:", 3.0);

  }
  if (v8)
    v8[53] = self->_statusBarHeight;
  -[_SBProximityTouchHandlingViewController setView:](self, "setView:", v8);

}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (double)statusBarHeight
{
  if (a1)
    return *(double *)(a1 + 968);
  else
    return 0.0;
}

- (uint64_t)proximitySettings
{
  if (result)
    return *(_QWORD *)(result + 976);
  return result;
}

- (void)setProximitySettings:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 976), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximitySettings, 0);
}

@end
