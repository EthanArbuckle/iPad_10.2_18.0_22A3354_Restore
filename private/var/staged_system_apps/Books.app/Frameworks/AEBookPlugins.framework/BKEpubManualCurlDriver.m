@implementation BKEpubManualCurlDriver

- (BKEpubManualCurlDriver)initWithStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 time:(double)a5
{
  double y;
  double x;
  double v8;
  double v9;
  BKEpubManualCurlDriver *v10;
  uint64_t v11;
  CADisplayLink *displayLink;
  double v13;
  BKEpubManualCurlGestureImplementation *v14;
  BKEpubManualCurlGestureImplementation *gesture;
  objc_super v17;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  v17.receiver = self;
  v17.super_class = (Class)BKEpubManualCurlDriver;
  v10 = -[BKEpubManualCurlDriver init](&v17, "init");
  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:", v10, "_linkFired:"));
    displayLink = v10->_displayLink;
    v10->_displayLink = (CADisplayLink *)v11;

    -[CADisplayLink heartbeatRate](v10->_displayLink, "heartbeatRate");
    v10->_minimumGestureInterval = v13 * 0.5;
    v14 = -[BKEpubManualCurlGestureImplementation initWithStartPoint:endPoint:duration:]([BKEpubManualCurlGestureImplementation alloc], "initWithStartPoint:endPoint:duration:", v9, v8, x, y, a5);
    gesture = v10->_gesture;
    v10->_gesture = v14;

  }
  return v10;
}

- (void)run:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  -[BKEpubManualCurlDriver setManualCurlHandler:](self, "setManualCurlHandler:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubManualCurlDriver gesture](self, "gesture"));
  objc_msgSend(v4, "setState:", 1);

  v5 = CACurrentMediaTime();
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubManualCurlDriver gesture](self, "gesture"));
  objc_msgSend(v6, "setStartTime:", v5);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKEpubManualCurlDriver displayLink](self, "displayLink"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v8, "addToRunLoop:forMode:", v7, NSDefaultRunLoopMode);

}

- (void)_linkFired:(id)a3
{
  void *v4;
  char *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void (**v29)(_QWORD, _QWORD);
  void *v30;
  id v31;

  v31 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubManualCurlDriver gesture](self, "gesture"));
  v5 = (char *)objc_msgSend(v4, "state");

  objc_msgSend(v31, "targetTimestamp");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubManualCurlDriver gesture](self, "gesture"));
  v9 = v8;
  if (v5 == (_BYTE *)&dword_0 + 1)
  {
    objc_msgSend(v8, "setNextTime:", v7);

    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[BKEpubManualCurlDriver manualCurlHandler](self, "manualCurlHandler"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubManualCurlDriver gesture](self, "gesture"));
    ((void (**)(_QWORD, void *))v10)[2](v10, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubManualCurlDriver gesture](self, "gesture"));
    objc_msgSend(v12, "setState:", 2);

  }
  else
  {
    objc_msgSend(v8, "endTime");
    v14 = v13;

    if (v7 <= v14)
    {
      objc_msgSend(v31, "targetTimestamp");
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubManualCurlDriver gesture](self, "gesture"));
      objc_msgSend(v21, "nextTime");
      v23 = v20 - v22;
      -[BKEpubManualCurlDriver minimumGestureInterval](self, "minimumGestureInterval");
      v25 = v24;

      if (v23 >= v25)
      {
        objc_msgSend(v31, "targetTimestamp");
        v27 = v26;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubManualCurlDriver gesture](self, "gesture"));
        objc_msgSend(v28, "setNextTime:", v27);

        v29 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[BKEpubManualCurlDriver manualCurlHandler](self, "manualCurlHandler"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubManualCurlDriver gesture](self, "gesture"));
        ((void (**)(_QWORD, void *))v29)[2](v29, v30);

      }
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubManualCurlDriver gesture](self, "gesture"));
      objc_msgSend(v15, "setState:", 3);

      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[BKEpubManualCurlDriver manualCurlHandler](self, "manualCurlHandler"));
      ((void (**)(_QWORD, BKEpubManualCurlGestureImplementation *))v16)[2](v16, self->_gesture);

      -[BKEpubManualCurlDriver setManualCurlHandler:](self, "setManualCurlHandler:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubManualCurlDriver displayLink](self, "displayLink"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
      objc_msgSend(v17, "removeFromRunLoop:forMode:", v18, NSDefaultRunLoopMode);

      -[BKEpubManualCurlDriver setDisplayLink:](self, "setDisplayLink:", 0);
    }
  }

}

- (BKEpubManualCurlGestureImplementation)gesture
{
  return self->_gesture;
}

- (void)setGesture:(id)a3
{
  objc_storeStrong((id *)&self->_gesture, a3);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (id)manualCurlHandler
{
  return self->_manualCurlHandler;
}

- (void)setManualCurlHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)minimumGestureInterval
{
  return self->_minimumGestureInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_manualCurlHandler, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_gesture, 0);
}

@end
