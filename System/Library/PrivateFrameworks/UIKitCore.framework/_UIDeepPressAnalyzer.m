@implementation _UIDeepPressAnalyzer

- (_UIDeepPressAnalyzer)init
{
  _UIDeepPressAnalyzer *v2;
  _UIVelocityIntegrator *v3;
  _UIVelocityIntegrator *v4;
  _UIDeepPressAnalyzer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIDeepPressAnalyzer;
  v2 = -[_UIDeepPressAnalyzer init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_UIVelocityIntegrator);
    -[_UIDeepPressAnalyzer setTouchForceIntegrator:](v2, "setTouchForceIntegrator:", v3);

    v4 = objc_alloc_init(_UIVelocityIntegrator);
    -[_UIDeepPressAnalyzer setLocationIntegrator:](v2, "setLocationIntegrator:", v4);

    v5 = v2;
  }

  return v2;
}

- (void)analyzeTouches:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  -[_UIDeepPressAnalyzer _touchForceFromTouches:](self, "_touchForceFromTouches:", v4);
  v6 = v5;
  v7 = _CentroidOfTouches(v4, 0);
  v9 = v8;

  -[_UIDeepPressAnalyzer analyzeTouchForce:centroidAtLocation:](self, "analyzeTouchForce:centroidAtLocation:", v6, v7, v9);
}

- (void)analyzeTouchForce:(double)a3 centroidAtLocation:(CGPoint)a4
{
  double y;
  double x;
  double v7;
  void *v8;
  id v9;

  y = a4.y;
  x = a4.x;
  v7 = a3 * 10.0;
  -[_UIDeepPressAnalyzer touchForceIntegrator](self, "touchForceIntegrator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSample:", v7, v7);

  -[_UIDeepPressAnalyzer locationIntegrator](self, "locationIntegrator");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSample:", x, y);

}

- (BOOL)isDeepPressLikely
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  -[_UIDeepPressAnalyzer locationIntegrator](self, "locationIntegrator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "velocity");
  v5 = v4;
  v7 = v6;

  v8 = fabs(v7);
  v9 = fabs(v5);
  if (v8 >= v9)
    v10 = v8;
  else
    v10 = v9;
  -[_UIDeepPressAnalyzer touchForceIntegrator](self, "touchForceIntegrator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "velocity");
  v13 = v12;

  return v13 > 0.0 && v10 < 10.0;
}

- (double)_touchForceFromTouches:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v8 = v8 + -[UITouch _unclampedForce](*(_QWORD **)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    v10 = v8 / (double)(unint64_t)objc_msgSend(v4, "count", (_QWORD)v12);
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (_UIVelocityIntegrator)touchForceIntegrator
{
  return self->_touchForceIntegrator;
}

- (void)setTouchForceIntegrator:(id)a3
{
  objc_storeStrong((id *)&self->_touchForceIntegrator, a3);
}

- (_UIVelocityIntegrator)locationIntegrator
{
  return self->_locationIntegrator;
}

- (void)setLocationIntegrator:(id)a3
{
  objc_storeStrong((id *)&self->_locationIntegrator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationIntegrator, 0);
  objc_storeStrong((id *)&self->_touchForceIntegrator, 0);
}

@end
