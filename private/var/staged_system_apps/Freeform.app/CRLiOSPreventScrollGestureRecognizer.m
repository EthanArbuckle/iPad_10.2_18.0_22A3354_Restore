@implementation CRLiOSPreventScrollGestureRecognizer

- (CRLiOSPreventScrollGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLiOSPreventScrollGestureRecognizer *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSPreventScrollGestureRecognizer;
  v5 = -[CRLiOSPreventScrollGestureRecognizer initWithTarget:action:](&v12, "initWithTarget:action:", 0, 0);
  if (v5)
  {
    if (!v4)
    {
      v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124D698);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1A37C(v6, v7);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124D6B8);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPreventScrollGestureRecognizer initWithInteractiveCanvasController:]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSPreventScrollGestureRecognizer.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 29, 0, "invalid nil value for '%{public}s'", "icc");

    }
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
  }

  return v5;
}

- (void)reset
{
  UITouch *touch;
  UITouch *secondTouch;
  objc_super v5;

  touch = self->_touch;
  self->_touch = 0;

  secondTouch = self->_secondTouch;
  self->_secondTouch = 0;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSPreventScrollGestureRecognizer;
  -[CRLiOSPreventScrollGestureRecognizer reset](&v5, "reset");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  UITouch **p_touch;
  CRLiOSPreventScrollGestureRecognizer *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];

  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CRLiOSPreventScrollGestureRecognizer;
  -[CRLiOSPreventScrollGestureRecognizer touchesBegan:withEvent:](&v31, "touchesBegan:withEvent:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPreventScrollGestureRecognizer p_ICC](self, "p_ICC"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layerHost"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asUIKitHost"));

  if (-[CRLiOSPreventScrollGestureRecognizer state](self, "state")
    || !objc_msgSend(v7, "currentlyScrolling"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "enclosingScrollView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "panGestureRecognizer"));
    v13 = objc_msgSend(v12, "minimumNumberOfTouches");

    if ((unint64_t)v13 < 2)
    {
      v25 = v7;
      v26 = v6;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v14 = v6;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (!v15)
        goto LABEL_21;
      v16 = v15;
      v17 = *(_QWORD *)v28;
      while (1)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          if (!-[CRLiOSPreventScrollGestureRecognizer state](self, "state", v25, v26, (_QWORD)v27))
          {
            p_touch = &self->_touch;
            if (self->_touch)
            {
              objc_storeStrong((id *)&self->_secondTouch, v19);
              v21 = self;
              v22 = 1;
LABEL_18:
              -[CRLiOSPreventScrollGestureRecognizer setState:](v21, "setState:", v22);
              continue;
            }
            objc_storeStrong((id *)&self->_touch, v19);
            if ((id)-[UITouch tapCount](*p_touch, "tapCount") != (id)1)
            {
              v21 = self;
              v22 = 5;
              goto LABEL_18;
            }
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hitRepWithTouch:", *p_touch));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "repForDragging"));

            if (!v24)
              -[CRLiOSPreventScrollGestureRecognizer setState:](self, "setState:", 5);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (!v16)
        {
LABEL_21:

          v7 = v25;
          v6 = v26;
          goto LABEL_22;
        }
      }
    }
  }
  -[CRLiOSPreventScrollGestureRecognizer setState:](self, "setState:", 5);
LABEL_22:

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  UITouch *touch;
  UITouch *secondTouch;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSPreventScrollGestureRecognizer;
  -[CRLiOSPreventScrollGestureRecognizer touchesEnded:withEvent:](&v9, "touchesEnded:withEvent:", v6, a4);
  if (self->_touch && objc_msgSend(v6, "containsObject:"))
  {
    touch = self->_touch;
    self->_touch = 0;

  }
  if (self->_secondTouch && objc_msgSend(v6, "containsObject:"))
  {
    secondTouch = self->_secondTouch;
    self->_secondTouch = 0;

  }
  if (!self->_touch && !self->_secondTouch)
    -[CRLiOSPreventScrollGestureRecognizer setState:](self, "setState:", 3);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  UITouch *touch;
  UITouch *secondTouch;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSPreventScrollGestureRecognizer;
  -[CRLiOSPreventScrollGestureRecognizer touchesCancelled:withEvent:](&v9, "touchesCancelled:withEvent:", v6, a4);
  if (self->_touch && objc_msgSend(v6, "containsObject:"))
  {
    touch = self->_touch;
    self->_touch = 0;

  }
  if (self->_secondTouch && objc_msgSend(v6, "containsObject:"))
  {
    secondTouch = self->_secondTouch;
    self->_secondTouch = 0;

  }
  if (!self->_touch && !self->_secondTouch)
    -[CRLiOSPreventScrollGestureRecognizer setState:](self, "setState:", 3);

}

- (id)p_ICC
{
  return objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondTouch, 0);
  objc_storeStrong((id *)&self->_touch, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
