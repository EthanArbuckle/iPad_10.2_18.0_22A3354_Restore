@implementation VLFScanningAnimationManager

- (VLFScanningAnimationManager)initWithLayer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  VLFScanningAnimationManager *v10;

  v4 = a3;
  LODWORD(v5) = 1051260355;
  LODWORD(v6) = 1059816735;
  LODWORD(v7) = 0;
  LODWORD(v8) = 1.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v5, v7, v6, v8));
  v10 = -[VLFScanningAnimationManager initWithLayer:animationDuration:timingFunction:](self, "initWithLayer:animationDuration:timingFunction:", v4, v9, 0.35);

  return v10;
}

- (VLFScanningAnimationManager)initWithLayer:(id)a3 animationDuration:(double)a4 timingFunction:(id)a5
{
  id v9;
  id v10;
  VLFScanningAnimationManager *v11;
  VLFScanningAnimationManager *v12;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v26 = "-[VLFScanningAnimationManager initWithLayer:animationDuration:timingFunction:]";
      v27 = 2080;
      v28 = "VLFScanningAnimationManager.m";
      v29 = 1024;
      v30 = 45;
      v31 = 2080;
      v32 = "layer != nil";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v10)
  {
    v19 = sub_1004318FC();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v26 = "-[VLFScanningAnimationManager initWithLayer:animationDuration:timingFunction:]";
      v27 = 2080;
      v28 = "VLFScanningAnimationManager.m";
      v29 = 1024;
      v30 = 46;
      v31 = 2080;
      v32 = "timingFunction != nil";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v26 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)VLFScanningAnimationManager;
  v11 = -[VLFScanningAnimationManager init](&v24, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_layer, a3);
    v12->_animationDuration = a4;
    objc_storeStrong((id *)&v12->_timingFunction, a5);
  }

  return v12;
}

- (void)fadeWithFadeOutCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  char *v25;
  id v26;
  int v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;

  v4 = a3;
  if (v4)
  {
    v5 = sub_100378054();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Begin a new fade", (uint8_t *)&v27, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationManager layer](self, "layer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "animationForKey:", CFSTR("fadeIn")));

    if (v8)
    {
      v9 = sub_100378054();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v27) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "There is an on-going fade in animation; removing it first",
          (uint8_t *)&v27,
          2u);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationManager layer](self, "layer"));
      objc_msgSend(v11, "removeAnimationForKey:", CFSTR("fadeIn"));

    }
    -[VLFScanningAnimationManager setFadeOutCompletion:](self, "setFadeOutCompletion:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationManager layer](self, "layer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "animationForKey:", CFSTR("fadeOut")));

    v14 = sub_100378054();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (v13)
    {
      if (v16)
      {
        LOWORD(v27) = 0;
        v17 = "There is an on-going fade out animation; letting it finish with the new completion block";
        v18 = v15;
        v19 = OS_LOG_TYPE_DEBUG;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v18, v19, v17, (uint8_t *)&v27, 2u);
      }
    }
    else
    {
      if (v16)
      {
        LOWORD(v27) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Starting a new fade out animation", (uint8_t *)&v27, 2u);
      }

      v15 = objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationManager layer](self, "layer"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationManager opacityAnimationWithToValue:](self, "opacityAnimationWithToValue:", 0.0));
      -[NSObject addAnimation:forKey:](v15, "addAnimation:forKey:", v20, CFSTR("fadeOut"));

    }
  }
  else
  {
    v21 = sub_1004318FC();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v27 = 136315906;
      v28 = "-[VLFScanningAnimationManager fadeWithFadeOutCompletion:]";
      v29 = 2080;
      v30 = "VLFScanningAnimationManager.m";
      v31 = 1024;
      v32 = 63;
      v33 = 2080;
      v34 = "completion != nil";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v27, 0x26u);
    }

    if (sub_100A70734())
    {
      v23 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v27 = 138412290;
        v28 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v27, 0xCu);

      }
    }
    v26 = sub_100378054();
    v15 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      v17 = "Completion block cannot be nil";
      v18 = v15;
      v19 = OS_LOG_TYPE_ERROR;
      goto LABEL_11;
    }
  }

}

- (void)replaceOnGoingFadeOutCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char *v14;
  id v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;

  v4 = (void (**)(_QWORD))a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationManager layer](self, "layer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "animationForKey:", CFSTR("fadeOut")));

    v7 = sub_100378054();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v9)
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Replacing existing fade out completion block", (uint8_t *)&v17, 2u);
      }

      -[VLFScanningAnimationManager setFadeOutCompletion:](self, "setFadeOutCompletion:", v4);
    }
    else
    {
      if (v9)
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "There is no on-going fade out animation; executing completion block immediately",
          (uint8_t *)&v17,
          2u);
      }

      v4[2](v4);
    }
  }
  else
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315906;
      v18 = "-[VLFScanningAnimationManager replaceOnGoingFadeOutCompletion:]";
      v19 = 2080;
      v20 = "VLFScanningAnimationManager.m";
      v21 = 1024;
      v22 = 88;
      v23 = 2080;
      v24 = "completion != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v17, 0x26u);
    }

    if (sub_100A70734())
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v17 = 138412290;
        v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

      }
    }
    v15 = sub_100378054();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Completion block cannot be nil", (uint8_t *)&v17, 2u);
    }

  }
}

- (id)opacityAnimationWithToValue:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  double v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;
  NSObject *v22;
  double v23;
  const char *v24;
  double v25;
  id v26;
  double v27;
  void *v28;
  _BYTE v30[22];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  objc_msgSend(v5, "setDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationManager layer](self, "layer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentationLayer"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationManager layer](self, "layer"));
  v9 = v8;
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentationLayer"));
    objc_msgSend(v10, "opacity");
    v12 = v11;

  }
  else
  {
    objc_msgSend(v8, "opacity");
    v12 = v13;
  }

  v14 = v12;
  v15 = sub_100378054();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v30 = 134218240;
    *(double *)&v30[4] = v14;
    *(_WORD *)&v30[12] = 2048;
    *(double *)&v30[14] = a3;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Creating new opacity animation from: %f, to: %f", v30, 0x16u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
  objc_msgSend(v5, "setFromValue:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  objc_msgSend(v5, "setToValue:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v20 = objc_msgSend(v19, "BOOLForKey:", CFSTR("VLFSessionScanningAnimationSlowDownKey"));

  if (v20)
  {
    v21 = sub_100378054();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = 5.0;
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      goto LABEL_12;
    *(_DWORD *)v30 = 134217984;
    *(_QWORD *)&v30[4] = 0x4014000000000000;
    v24 = "Using slow animation duration: %f";
  }
  else
  {
    -[VLFScanningAnimationManager animationDuration](self, "animationDuration");
    v23 = v25;
    v26 = sub_100378054();
    v22 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      goto LABEL_12;
    *(_DWORD *)v30 = 134217984;
    *(double *)&v30[4] = v23;
    v24 = "Using normal animation duration: %f";
  }
  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, v24, v30, 0xCu);
LABEL_12:

  v27 = v14 - a3;
  if (v14 - a3 < 0.0)
    v27 = -(v14 - a3);
  objc_msgSend(v5, "setDuration:", v27 * v23, *(_OWORD *)v30);
  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  objc_msgSend(v5, "setFillMode:", kCAFillModeForwards);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationManager timingFunction](self, "timingFunction"));
  objc_msgSend(v5, "setTimingFunction:", v28);

  return v5;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  __CFString *v12;
  __CFString *v13;
  void (**v14)(_QWORD);
  __CFString *v15;
  __CFString *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  __CFString *v23;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationManager layer](self, "layer"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "animationForKey:", CFSTR("fadeOut")));

  v9 = sub_100378054();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v8 == v6)
  {
    if (v11)
    {
      v15 = CFSTR("NO");
      if (v4)
        v15 = CFSTR("YES");
      v16 = v15;
      v22 = 138412290;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Fade out animation finished: %@", (uint8_t *)&v22, 0xCu);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationManager layer](self, "layer"));
    objc_msgSend(v17, "removeAnimationForKey:", CFSTR("fadeOut"));

    v14 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationManager fadeOutCompletion](self, "fadeOutCompletion"));
    -[VLFScanningAnimationManager setFadeOutCompletion:](self, "setFadeOutCompletion:", 0);
    v14[2](v14);
    if (v4)
    {
      v18 = sub_100378054();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Starting a new fade in animation", (uint8_t *)&v22, 2u);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationManager layer](self, "layer"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationManager opacityAnimationWithToValue:](self, "opacityAnimationWithToValue:", 1.0));
      objc_msgSend(v20, "addAnimation:forKey:", v21, CFSTR("fadeIn"));

    }
  }
  else
  {
    if (v11)
    {
      v12 = CFSTR("NO");
      if (v4)
        v12 = CFSTR("YES");
      v13 = v12;
      v22 = 138412290;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Fade in animation finished: %@", (uint8_t *)&v22, 0xCu);

    }
    v14 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(-[VLFScanningAnimationManager layer](self, "layer"));
    objc_msgSend(v14, "removeAnimationForKey:", CFSTR("fadeIn"));
  }

}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
  objc_storeStrong((id *)&self->_layer, a3);
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_timingFunction, a3);
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (id)fadeOutCompletion
{
  return self->_fadeOutCompletion;
}

- (void)setFadeOutCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fadeOutCompletion, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
