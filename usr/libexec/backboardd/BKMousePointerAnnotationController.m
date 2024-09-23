@implementation BKMousePointerAnnotationController

- (void)dealloc
{
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKMousePointerAnnotationController *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  if (self->_currentAnnotationController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("must invalidate BKMousePointerAnnotationController before dealloc")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v8 = (objc_class *)objc_opt_class(self, v7);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138544642;
      v13 = v6;
      v14 = 2114;
      v15 = v10;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BKMousePointerAnnotationController.m");
      v20 = 1024;
      v21 = 40;
      v22 = 2114;
      v23 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    __break(0);
    JUMPOUT(0x10005A2E4);
  }
  v11.receiver = self;
  v11.super_class = (Class)BKMousePointerAnnotationController;
  -[BKMousePointerAnnotationController dealloc](&v11, "dealloc");
}

- (void)invalidate
{
  BKDisplayAnnotationController *currentAnnotationController;
  CADisplay *currentDisplay;

  -[BKDisplayAnnotationController removeAnnotationsForKeyPath:](self->_currentAnnotationController, "removeAnnotationsForKeyPath:", CFSTR("mouse"));
  currentAnnotationController = self->_currentAnnotationController;
  self->_currentAnnotationController = 0;

  currentDisplay = self->_currentDisplay;
  self->_currentDisplay = 0;

}

- (void)_updateEventsPerSecond
{
  double v3;
  double v4;
  BKDisplayAnnotationController *currentAnnotationController;
  int64_t inputEventsPerSecond;
  int64_t outputEventsPerSecond;
  BKDisplayAnnotationController *v8;
  void *v9;
  void *v10;

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v4 = v3;
  if (v3 - self->_startTime > 1.0)
  {
    currentAnnotationController = self->_currentAnnotationController;
    if (currentAnnotationController)
    {
      inputEventsPerSecond = self->_inputEventsPerSecond;
      outputEventsPerSecond = self->_outputEventsPerSecond;
      v8 = currentAnnotationController;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Hz in:%d / out:%d"), inputEventsPerSecond, outputEventsPerSecond));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotation subannotationWithString:](BKDisplayAnnotation, "subannotationWithString:", v9));
      -[BKDisplayAnnotationController setAnnotation:forKeyPath:](v8, "setAnnotation:forKeyPath:", v10, CFSTR("mouse.Hz"));

    }
    self->_startTime = v4;
    self->_inputEventsPerSecond = 0;
    self->_outputEventsPerSecond = 0;
  }
}

- (void)didReceiveEventFromDevice
{
  ++self->_inputEventsPerSecond;
  -[BKMousePointerAnnotationController _updateEventsPerSecond](self, "_updateEventsPerSecond");
}

- (void)didPostEvent
{
  ++self->_outputEventsPerSecond;
  -[BKMousePointerAnnotationController _updateEventsPerSecond](self, "_updateEventsPerSecond");
}

- (void)observeMouseRelativePointDidChange:(CGPoint)a3
{
  BKDisplayAnnotationController *currentAnnotationController;
  CGFloat y;
  CGFloat x;
  BKDisplayAnnotationController *v6;
  void *v7;
  id v8;

  currentAnnotationController = self->_currentAnnotationController;
  if (currentAnnotationController)
  {
    y = a3.y;
    x = a3.x;
    v6 = currentAnnotationController;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("rel: %.4g,%.4g"), *(_QWORD *)&x, *(_QWORD *)&y));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotation subannotationWithString:](BKDisplayAnnotation, "subannotationWithString:", v8));
    -[BKDisplayAnnotationController setAnnotation:forKeyPath:](v6, "setAnnotation:forKeyPath:", v7, CFSTR("mouse.relpoint"));

  }
}

- (void)observeMouseAbsolutePointDidChange:(CGPoint)a3
{
  BKDisplayAnnotationController *currentAnnotationController;
  CGFloat y;
  CGFloat x;
  BKDisplayAnnotationController *v6;
  void *v7;
  id v8;

  currentAnnotationController = self->_currentAnnotationController;
  if (currentAnnotationController)
  {
    y = a3.y;
    x = a3.x;
    v6 = currentAnnotationController;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("abs: %.4g,%.4g"), *(_QWORD *)&x, *(_QWORD *)&y));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotation subannotationWithString:](BKDisplayAnnotation, "subannotationWithString:", v8));
    -[BKDisplayAnnotationController setAnnotation:forKeyPath:](v6, "setAnnotation:forKeyPath:", v7, CFSTR("mouse.relpoint"));

  }
}

- (void)observeMouseModelPointDidChange:(CGPoint)a3 display:(id)a4 reason:(id)a5
{
  double y;
  double x;
  id v10;
  BKDisplayAnnotationController *v11;
  BKDisplayAnnotationController *v12;
  BKDisplayAnnotationController *currentAnnotationController;
  BKDisplayAnnotationLocation *v14;
  void *v15;
  void *v16;
  void *v17;
  BKDisplayAnnotationContainedSubnodeRenderer *v18;
  void *v19;
  void *v20;
  void *v21;
  CADisplay *v22;

  y = a3.y;
  x = a3.x;
  v22 = (CADisplay *)a4;
  v10 = a5;
  v11 = self->_currentAnnotationController;
  if (self->_currentDisplay != v22)
  {
    objc_storeStrong((id *)&self->_currentDisplay, a4);
    -[BKDisplayAnnotationController removeAnnotationsForKeyPath:](self->_currentAnnotationController, "removeAnnotationsForKeyPath:", CFSTR("mouse"));
    v12 = (BKDisplayAnnotationController *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationController annotationControllerForDisplay:](BKDisplayAnnotationController, "annotationControllerForDisplay:", v22));
    currentAnnotationController = self->_currentAnnotationController;
    self->_currentAnnotationController = v12;

  }
  v14 = objc_alloc_init(BKDisplayAnnotationLocation);
  -[BKDisplayAnnotationLocation setSuperBias:](v14, "setSuperBias:", 0.0, 0.0);
  -[BKDisplayAnnotationLocation setPoint:](v14, "setPoint:", x, y);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKDisplayAnnotationController annotationForKeyPath:](v11, "annotationForKeyPath:", CFSTR("mouse")));
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "setLocation:", v14);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotation annotationWithRectangleSize:](BKDisplayAnnotation, "annotationWithRectangleSize:", 48.0, 48.0));
    v18 = objc_alloc_init(BKDisplayAnnotationContainedSubnodeRenderer);
    objc_msgSend(v17, "setLocation:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotationStyle pointerStyle](BKDisplayAnnotationStyle, "pointerStyle"));
    objc_msgSend(v17, "setStyleModifier:", v19);

    objc_msgSend(v17, "setRenderer:", v18);
    objc_msgSend(v17, "setSubnodeScreenEdgeTreatment:", 2);
    -[BKDisplayAnnotationController setAnnotation:forKeyPath:](v11, "setAnnotation:forKeyPath:", v17, CFSTR("mouse"));

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%g,%g -- %@"), *(_QWORD *)&x, *(_QWORD *)&y, v10));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotation subannotationWithString:](BKDisplayAnnotation, "subannotationWithString:", v20));
  -[BKDisplayAnnotationController setAnnotation:forKeyPath:](v11, "setAnnotation:forKeyPath:", v21, CFSTR("mouse.location"));

}

- (void)observeMouseScrollPhaseDidChange:(unsigned __int16)a3
{
  uint64_t v3;
  BKDisplayAnnotationController *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  BKDisplayAnnotationController *v9;

  v3 = a3;
  v4 = self->_currentAnnotationController;
  if (v4)
  {
    v9 = v4;
    if ((_DWORD)v3)
    {
      v5 = BKNSStringFromIOHIDEventPhase(v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("phased scroll (%@)"), v6));

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotation subannotationWithString:](BKDisplayAnnotation, "subannotationWithString:", v7));
      -[BKDisplayAnnotationController setAnnotation:forKeyPath:](v9, "setAnnotation:forKeyPath:", v8, CFSTR("mouse.scrollstatus"));

    }
    else
    {
      -[BKDisplayAnnotationController removeAnnotationsForKeyPath:](v4, "removeAnnotationsForKeyPath:", CFSTR("mouse.scrollstatus"));
    }
    v4 = v9;
  }

}

- (void)observeMouseDidEnterContextID:(unsigned int)a3 pid:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  BKDisplayAnnotationController *v7;
  void *v8;
  void *v9;
  void *v10;
  BKDisplayAnnotationController *v11;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v7 = self->_currentAnnotationController;
  if (v7)
  {
    v11 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("mouse.ctx.%X"), v5));
    if ((_DWORD)v5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerAnnotationController _stringDescribingContextID:pid:](self, "_stringDescribingContextID:pid:", v5, v4));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotation subannotationWithString:](BKDisplayAnnotation, "subannotationWithString:", v9));
      -[BKDisplayAnnotationController setAnnotation:forKeyPath:](v11, "setAnnotation:forKeyPath:", v10, v8);

    }
    else
    {
      -[BKDisplayAnnotationController removeAnnotationsForKeyPath:](v11, "removeAnnotationsForKeyPath:", v8);
    }

    v7 = v11;
  }

}

- (void)observeMouseDidExitContextID:(unsigned int)a3 pid:(int)a4
{
  BKDisplayAnnotationController *currentAnnotationController;
  id v5;

  currentAnnotationController = self->_currentAnnotationController;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("mouse.ctx.%X"), *(_QWORD *)&a4, *(_QWORD *)&a3));
  -[BKDisplayAnnotationController removeAnnotationsForKeyPath:](currentAnnotationController, "removeAnnotationsForKeyPath:", v5);

}

- (void)observeMouseButtonMaskDidChange:(unsigned int)a3
{
  BKDisplayAnnotationController *v4;
  int8x8_t v5;
  BKDisplayAnnotationController *v6;
  __CFString *v7;
  uint8x8_t v8;
  int v9;
  const __CFString *v10;
  _QWORD *v11;
  unint64_t v12;
  void *v13;
  _QWORD v14[2];
  void (*v15)(_QWORD *);
  void *v16;
  __CFString *v17;
  _QWORD *v18;
  _QWORD v19[3];
  char v20;
  char v21;

  v4 = self->_currentAnnotationController;
  v6 = v4;
  if (v4)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        v7 = CFSTR("primary button down");
      }
      else if (a3 == 2)
      {
        v7 = CFSTR("secondary button down");
      }
      else
      {
        v5.i32[0] = a3;
        v8 = (uint8x8_t)vcnt_s8(v5);
        v8.i16[0] = vaddlv_u8(v8);
        v9 = v8.i32[0];
        if (v8.u32[0] == 1)
          v10 = CFSTR("button {");
        else
          v10 = CFSTR("buttons {");
        v19[0] = 0;
        v19[1] = v19;
        v19[2] = 0x2020000000;
        v20 = 0;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v15 = (void (*)(_QWORD *))sub_10005AE14;
        v16 = &unk_1000EB520;
        v18 = v19;
        v7 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v10));
        v17 = v7;
        v11 = v14;
        v21 = 0;
        if (v9)
        {
          v12 = 0;
          do
          {
            if (((1 << v12) & a3) != 0)
            {
              v15(v11);
              if (v21)
                break;
              --v9;
            }
            if (v12 > 0x3E)
              break;
            ++v12;
          }
          while (v9 > 0);
        }

        -[__CFString appendString:](v7, "appendString:", CFSTR("} down"));
        _Block_object_dispose(v19, 8);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotation subannotationWithString:](BKDisplayAnnotation, "subannotationWithString:", v7));
      -[BKDisplayAnnotationController setAnnotation:forKeyPath:](v6, "setAnnotation:forKeyPath:", v13, CFSTR("mouse.buttons"));

    }
    else
    {
      -[BKDisplayAnnotationController removeAnnotationsForKeyPath:](v4, "removeAnnotationsForKeyPath:", CFSTR("mouse.buttons"));
    }
  }

}

- (void)observeMouseForceDidChange:(double)a3 stage:(unsigned int)a4
{
  BKDisplayAnnotationController *currentAnnotationController;
  uint64_t v5;
  BKDisplayAnnotationController *v7;
  void *v8;
  id v9;

  currentAnnotationController = self->_currentAnnotationController;
  if (currentAnnotationController)
  {
    v5 = *(_QWORD *)&a4;
    v7 = currentAnnotationController;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("force: %.4g stage %u"), *(_QWORD *)&a3, v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotation subannotationWithString:](BKDisplayAnnotation, "subannotationWithString:", v9));
    -[BKDisplayAnnotationController setAnnotation:forKeyPath:](v7, "setAnnotation:forKeyPath:", v8, CFSTR("mouse.force"));

  }
}

- (void)observeMouseTouchCountDidChange:(int64_t)a3
{
  BKDisplayAnnotationController *v4;
  void *v5;
  void *v6;
  BKDisplayAnnotationController *v7;

  v4 = self->_currentAnnotationController;
  if (v4)
  {
    v7 = v4;
    if (a3 < 1)
    {
      -[BKDisplayAnnotationController removeAnnotationsForKeyPath:](v4, "removeAnnotationsForKeyPath:", CFSTR("mouse.touchState"));
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("touches:%d"), a3));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKDisplayAnnotation subannotationWithString:](BKDisplayAnnotation, "subannotationWithString:", v5));
      -[BKDisplayAnnotationController setAnnotation:forKeyPath:](v7, "setAnnotation:forKeyPath:", v6, CFSTR("mouse.touchState"));

    }
    v4 = v7;
  }

}

- (void)observeMouseAvailabilityDidChange:(BOOL)a3
{
  if (!a3)
    -[BKDisplayAnnotationController removeAnnotationsForKeyPath:](self->_currentAnnotationController, "removeAnnotationsForKeyPath:", CFSTR("mouse"));
}

- (id)_stringDescribingContextID:(unsigned int)a3 pid:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = *(_QWORD *)&a3;
  if (a4 < 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ctx:%X"), *(_QWORD *)&a3));
  }
  else
  {
    v5 = *(_QWORD *)&a4;
    v6 = BSBundleIDForPID(*(_QWORD *)&a4, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("com.apple."), &stru_1000F0F50, 0, 0, 10));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" (%d)"), v5));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ctx:%X -- %@"), v4, v9));
  }
  return v10;
}

- (CADisplay)currentDisplay
{
  return self->_currentDisplay;
}

- (void)setCurrentDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_currentDisplay, a3);
}

- (BKDisplayAnnotationController)currentAnnotationController
{
  return self->_currentAnnotationController;
}

- (void)setCurrentAnnotationController:(id)a3
{
  objc_storeStrong((id *)&self->_currentAnnotationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAnnotationController, 0);
  objc_storeStrong((id *)&self->_currentDisplay, 0);
}

@end
