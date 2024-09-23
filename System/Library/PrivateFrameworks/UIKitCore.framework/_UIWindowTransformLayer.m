@implementation _UIWindowTransformLayer

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  UIWindow *window;
  int64_t previousSceneOrientationForCounterRotation;
  uint64_t v11;
  uint64_t v12;
  UIWindow *v13;
  int64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "isEqualToString:", CFSTR("transform")))
  {
    v8 = v6;
    window = self->super._window;
    previousSceneOrientationForCounterRotation = window->_previousSceneOrientationForCounterRotation;
    v11 = -[UIWindow _toWindowOrientation](window, "_toWindowOrientation");
    v12 = -[UIWindow _fromWindowOrientation](self->super._window, "_fromWindowOrientation");
    if (previousSceneOrientationForCounterRotation)
    {
      v13 = self->super._window;
      v14 = v13->_previousSceneOrientationForCounterRotation;
      v15 = -[UIWindow _orientationForRootTransform](v13, "_orientationForRootTransform");
      v16 = 0.0;
      v17 = 0.0;
      if (v12 != 1)
      {
        if (v12 == 3)
        {
          v17 = 1.57079633;
        }
        else if (v12 == 4)
        {
          v17 = -1.57079633;
        }
        else
        {
          v17 = 3.14159265;
          if (v12 != 2)
            v17 = 0.0;
        }
      }
      if (v14 != 1)
      {
        if (v14 == 3)
        {
          v16 = 1.57079633;
        }
        else if (v14 == 4)
        {
          v16 = -1.57079633;
        }
        else
        {
          v16 = 3.14159265;
          if (v14 != 2)
            v16 = 0.0;
        }
      }
      v18 = 0.0;
      v19 = 0.0;
      if (v11 != 1)
      {
        if (v11 == 3)
        {
          v19 = 1.57079633;
        }
        else if (v11 == 4)
        {
          v19 = -1.57079633;
        }
        else
        {
          v19 = 3.14159265;
          if (v11 != 2)
            v19 = 0.0;
        }
      }
      v20 = v17 - v16;
      if (v15 != 1)
      {
        switch(v15)
        {
          case 3:
            v18 = 1.57079633;
            break;
          case 4:
            v18 = -1.57079633;
            break;
          case 2:
            v18 = 3.14159265;
            break;
        }
      }
      _UIMakeBasicTransformAnimationUnambiguousWithAngles(v8, 1, 0, v20, v19 - v18);
    }
    else
    {
      _UIMakeBasicTransformAnimationUnambiguousWithOrientations(v8, v12, v11, 0, 0);
    }

  }
  v21.receiver = self;
  v21.super_class = (Class)_UIWindowTransformLayer;
  -[_UIWindowTransformLayer addAnimation:forKey:](&v21, sel_addAnimation_forKey_, v6, v7);

}

@end
