@implementation CRLiOSConcreteScribbleCapableElement

- (CRLiOSConcreteScribbleCapableElement)initWithEditingFrame:(CGRect)a3 identifier:(id)a4 scribbleEditingBlock:(id)a5 scribbleElementIsFocusedBlock:(id)a6 shouldDelayFocus:(BOOL)a7 hitToleranceInsetsWithDefaultInsetsBlock:(id)a8
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  id v19;
  id v20;
  CRLiOSConcreteScribbleCapableElement *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id scribbleEditingBlock;
  NSUUID *v28;
  NSUUID *scribbleIdentifier;
  id v30;
  id scribbleElementIsFocusedBlock;
  id v32;
  id hitToleranceInsetsWithDefaultInsetsBlock;
  int v35;
  objc_super v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v36.receiver = self;
  v36.super_class = (Class)CRLiOSConcreteScribbleCapableElement;
  v21 = -[CRLiOSConcreteScribbleCapableElement init](&v36, "init");
  if (v21)
  {
    if (sub_100060BF8(width, height))
    {
      v35 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101237750);
      v22 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DFA060(v35, v22);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101237770);
      v23 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v23, v35);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSConcreteScribbleCapableElement initWithEditingFrame:identifier:scribbleEditingBlock:scribbleElementIsFocusedBlock:shouldDelayFocus:hitToleranceInsetsWithDefaultInsetsBlock:]"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSConcreteScribbleCapableElement.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 37, 0, "Got empty editing frame");

    }
    v26 = objc_retainBlock(v18);
    scribbleEditingBlock = v21->_scribbleEditingBlock;
    v21->_scribbleEditingBlock = v26;

    v21->_scaledScribbleEditingFrame.origin.x = x;
    v21->_scaledScribbleEditingFrame.origin.y = y;
    v21->_scaledScribbleEditingFrame.size.width = width;
    v21->_scaledScribbleEditingFrame.size.height = height;
    if (v17)
      v28 = (NSUUID *)v17;
    else
      v28 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    scribbleIdentifier = v21->_scribbleIdentifier;
    v21->_scribbleIdentifier = v28;

    v21->_shouldDelayScribbleFocus = a7;
    v30 = objc_retainBlock(v19);
    scribbleElementIsFocusedBlock = v21->_scribbleElementIsFocusedBlock;
    v21->_scribbleElementIsFocusedBlock = v30;

    v32 = objc_retainBlock(v20);
    hitToleranceInsetsWithDefaultInsetsBlock = v21->_hitToleranceInsetsWithDefaultInsetsBlock;
    v21->_hitToleranceInsetsWithDefaultInsetsBlock = v32;

  }
  return v21;
}

- (BOOL)scribbleElementIsFocused
{
  void *v3;
  uint64_t (**v4)(void);
  char v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSConcreteScribbleCapableElement scribbleElementIsFocusedBlock](self, "scribbleElementIsFocusedBlock"));

  if (!v3)
    return 0;
  v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[CRLiOSConcreteScribbleCapableElement scribbleElementIsFocusedBlock](self, "scribbleElementIsFocusedBlock"));
  v5 = v4[2]();

  return v5;
}

- (UIEdgeInsets)hitToleranceInsetsWithDefaultInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  double (**v9)(double, double, double, double);
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSConcreteScribbleCapableElement hitToleranceInsetsWithDefaultInsetsBlock](self, "hitToleranceInsetsWithDefaultInsetsBlock"));

  if (v8)
  {
    v9 = (double (**)(double, double, double, double))objc_claimAutoreleasedReturnValue(-[CRLiOSConcreteScribbleCapableElement hitToleranceInsetsWithDefaultInsetsBlock](self, "hitToleranceInsetsWithDefaultInsetsBlock"));
    top = v9[2](top, left, bottom, right);
    left = v10;
    bottom = v11;
    right = v12;

  }
  v13 = top;
  v14 = left;
  v15 = bottom;
  v16 = right;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (NSUUID)scribbleIdentifier
{
  return self->_scribbleIdentifier;
}

- (void)setScribbleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_scribbleIdentifier, a3);
}

- (BOOL)shouldDelayScribbleFocus
{
  return self->_shouldDelayScribbleFocus;
}

- (id)willBeginWritingBlock
{
  return self->_willBeginWritingBlock;
}

- (id)prepareForScribbleBlock
{
  return self->_prepareForScribbleBlock;
}

- (id)scribbleEditingBlock
{
  return self->_scribbleEditingBlock;
}

- (CGRect)scaledScribbleEditingFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_scaledScribbleEditingFrame.origin.x;
  y = self->_scaledScribbleEditingFrame.origin.y;
  width = self->_scaledScribbleEditingFrame.size.width;
  height = self->_scaledScribbleEditingFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)scribbleElementIsFocusedBlock
{
  return self->_scribbleElementIsFocusedBlock;
}

- (void)setScribbleElementIsFocusedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)hitToleranceInsetsWithDefaultInsetsBlock
{
  return self->_hitToleranceInsetsWithDefaultInsetsBlock;
}

- (void)setHitToleranceInsetsWithDefaultInsetsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hitToleranceInsetsWithDefaultInsetsBlock, 0);
  objc_storeStrong(&self->_scribbleElementIsFocusedBlock, 0);
  objc_storeStrong(&self->_scribbleEditingBlock, 0);
  objc_storeStrong(&self->_prepareForScribbleBlock, 0);
  objc_storeStrong(&self->_willBeginWritingBlock, 0);
  objc_storeStrong((id *)&self->_scribbleIdentifier, 0);
}

@end
