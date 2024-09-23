@implementation ProcExitHUDLine

- (ProcExitHUDLine)initWithProcExitRecord:(id)a3 theme:(id)a4 lineDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  ProcExitHUDLine *v11;
  id v12;
  uint64_t v13;
  CATextLayer *exitedProcNameLayer;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  ExitReasonLayer *v26;
  ExitReasonLayer *exitReasonLayer;
  void *context;
  id v30;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)ProcExitHUDLine;
  v11 = -[HUDLine init](&v31, "init");
  if (v11)
  {
    -[HUDLine setSpacing:](v11, "setSpacing:", sub_100027D34());
    v12 = objc_msgSend(v9, "currentProcessExitTextColor");
    v13 = objc_claimAutoreleasedReturnValue(+[CATextLayer layer](CATextLayer, "layer"));
    exitedProcNameLayer = v11->_exitedProcNameLayer;
    v11->_exitedProcNameLayer = (CATextLayer *)v13;

    -[CATextLayer setTruncationMode:](v11->_exitedProcNameLayer, "setTruncationMode:", kCATruncationEnd);
    if (qword_10005FC88 != -1)
      dispatch_once(&qword_10005FC88, &stru_10004D4D8);
    -[CATextLayer setFont:](v11->_exitedProcNameLayer, "setFont:", qword_10005FC90);
    sub_100027880();
    -[CATextLayer setFontSize:](v11->_exitedProcNameLayer, "setFontSize:");
    -[HUDLine contentScaleForTexts](v11, "contentScaleForTexts");
    -[CATextLayer setContentsScale:](v11->_exitedProcNameLayer, "setContentsScale:");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "processName"));
    -[CATextLayer setString:](v11->_exitedProcNameLayer, "setString:", v15);

    -[CATextLayer setForegroundColor:](v11->_exitedProcNameLayer, "setForegroundColor:", v12);
    -[HUDLine setVibrancyFilter:](v11, "setVibrancyFilter:", v11->_exitedProcNameLayer);
    context = objc_autoreleasePoolPush();
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CATextLayer layer](CATextLayer, "layer"));
    v30 = v12;
    if (qword_10005FCA8 != -1)
      dispatch_once(&qword_10005FCA8, &stru_10004D518);
    objc_msgSend(v16, "setFont:", qword_10005FCB0);
    sub_100027880();
    objc_msgSend(v16, "setFontSize:");
    -[HUDLine contentScaleForTexts](v11, "contentScaleForTexts");
    objc_msgSend(v16, "setContentsScale:");
    objc_msgSend(v16, "setAlignmentMode:", kCAAlignmentRight);
    v17 = objc_alloc_init((Class)NSString);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &off_100055520));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v8, "exitReasonNamespace")));
    v20 = objc_msgSend(v18, "containsObject:", v19);

    if ((v20 & 1) == 0)
    {
      v21 = sub_1000262D4(objc_msgSend(v8, "exitReasonNamespace"));
      v22 = objc_claimAutoreleasedReturnValue(v21);

      v17 = (id)v22;
    }
    objc_msgSend(v16, "setString:", v17);
    objc_msgSend(v16, "setForegroundColor:", objc_msgSend(v9, "processExitReasonNamespaceTextColor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CATextLayer layer](CATextLayer, "layer"));
    if (qword_10005FC98 != -1)
      dispatch_once(&qword_10005FC98, &stru_10004D4F8);
    objc_msgSend(v23, "setFont:", qword_10005FCA0);
    sub_100027880();
    objc_msgSend(v23, "setFontSize:");
    -[HUDLine contentScaleForTexts](v11, "contentScaleForTexts");
    objc_msgSend(v23, "setContentsScale:");
    objc_msgSend(v23, "setAlignmentMode:", kCAAlignmentRight);
    v24 = sub_100027228((int)objc_msgSend(v8, "exitReasonNamespace"), (uint64_t)objc_msgSend(v8, "exitReasonCode"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v23, "setString:", v25);

    objc_msgSend(v23, "setForegroundColor:", v30);
    v26 = -[ExitReasonLayer initWithNamespaceLayer:codeLayer:]([ExitReasonLayer alloc], "initWithNamespaceLayer:codeLayer:", v16, v23);
    exitReasonLayer = v11->_exitReasonLayer;
    v11->_exitReasonLayer = v26;

    -[HUDLine setVibrancyFilter:](v11, "setVibrancyFilter:", v11->_exitReasonLayer);
    objc_autoreleasePoolPop(context);
    -[ProcExitHUDLine addSublayer:](v11, "addSublayer:", v11->_exitReasonLayer);
    -[ProcExitHUDLine addSublayer:](v11, "addSublayer:", v11->_exitedProcNameLayer);
    -[HUDLine setKeyLayer:](v11, "setKeyLayer:", v11->_exitedProcNameLayer);
    -[HUDLine setValueLayer:](v11, "setValueLayer:", v11->_exitReasonLayer);
    -[HUDLine setLineDelegate:](v11, "setLineDelegate:", v10);
  }

  return v11;
}

- (void)nilifyCALayers
{
  CATextLayer *exitedProcNameLayer;
  ExitReasonLayer *exitReasonLayer;
  ExitReasonLayer *v5;

  exitedProcNameLayer = self->_exitedProcNameLayer;
  if (exitedProcNameLayer)
  {
    self->_exitedProcNameLayer = 0;

  }
  exitReasonLayer = self->_exitReasonLayer;
  if (exitReasonLayer)
  {
    -[ExitReasonLayer nilifyCALayers](exitReasonLayer, "nilifyCALayers");
    v5 = self->_exitReasonLayer;
    self->_exitReasonLayer = 0;

  }
}

- (void)setFontSize:(double)a3
{
  void *v5;
  id v6;

  -[CATextLayer setFontSize:](self->_exitedProcNameLayer, "setFontSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExitReasonLayer exitReasonNamespaceTextLayer](self->_exitReasonLayer, "exitReasonNamespaceTextLayer"));
  objc_msgSend(v5, "setFontSize:", a3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ExitReasonLayer exitReasonCodeTextLayer](self->_exitReasonLayer, "exitReasonCodeTextLayer"));
  objc_msgSend(v6, "setFontSize:", a3);

}

- (void)update:(id)a3 options:(unint64_t)a4
{
  char v4;
  id v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;

  v4 = a4;
  v6 = a3;
  v7 = -[HUDLine updatesComplete](self, "updatesComplete");
  if ((v4 & 1) == 0 && (v7 & 1) == 0)
  {
    v8 = sub_100024FF4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_10002E4EC(v6);

    -[HUDLine setUpdatesComplete:](self, "setUpdatesComplete:", 1);
  }

}

- (CATextLayer)exitedProcNameLayer
{
  return self->_exitedProcNameLayer;
}

- (ExitReasonLayer)exitReasonLayer
{
  return self->_exitReasonLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitReasonLayer, 0);
  objc_storeStrong((id *)&self->_exitedProcNameLayer, 0);
}

@end
