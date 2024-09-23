@implementation PXUISlowMotionEditor

- (PXUISlowMotionEditor)init
{
  PXUISlowMotionEditor *v2;
  PXUISlowMotionEditor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXUISlowMotionEditor;
  v2 = -[PXUISlowMotionEditor init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PXUISlowMotionEditor _PXUISlowMotionEditor_commonInit](v2, "_PXUISlowMotionEditor_commonInit");
  return v3;
}

- (void)_PXUISlowMotionEditor_commonInit
{
  UIPanGestureRecognizer *v3;
  UIPanGestureRecognizer *panGesture;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *tapGesture;
  UITapGestureRecognizer *v7;
  UIImpactFeedbackGenerator *v8;
  UIImpactFeedbackGenerator *impactGenerator;
  UIPanGestureRecognizer *v10;

  v3 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__handlePan_);
  -[UIPanGestureRecognizer setDelegate:](v3, "setDelegate:", self);
  -[PXUISlowMotionEditor addGestureRecognizer:](self, "addGestureRecognizer:", v3);
  panGesture = self->_panGesture;
  self->_panGesture = v3;
  v10 = v3;

  v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
  -[UITapGestureRecognizer setDelegate:](v5, "setDelegate:", self);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](v5, "requireGestureRecognizerToFail:", self->_panGesture);
  -[PXUISlowMotionEditor addGestureRecognizer:](self, "addGestureRecognizer:", v5);
  tapGesture = self->_tapGesture;
  self->_tapGesture = v5;
  v7 = v5;

  v8 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:", 0);
  impactGenerator = self->_impactGenerator;
  self->_impactGenerator = v8;

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)_handlePan:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "state");
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == 2)
    {
      -[PXUISlowMotionEditor _handleChangePanGesture:](self, "_handleChangePanGesture:", v7);
    }
    else
    {
      v5 = v4 == 1;
      v6 = v7;
      if (!v5)
        goto LABEL_9;
      -[PXUISlowMotionEditor _handleBeginPanGesture:](self, "_handleBeginPanGesture:", v7);
    }
  }
  else
  {
    -[PXUISlowMotionEditor _handleEndPanGesture:](self, "_handleEndPanGesture:", v7);
  }
  v6 = v7;
LABEL_9:

}

- (void)_handleBeginPanGesture:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "state") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISlowMotionEditor.m"), 85, CFSTR("_handleBeginPanGesture: called with a recognizer whose state is not .Began"));

  }
  objc_msgSend(v6, "locationInView:", self);
  -[PXSlowMotionEditor handleBeginTrackingAtLocation:](self, "handleBeginTrackingAtLocation:");

}

- (void)_handleChangePanGesture:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "state") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUISlowMotionEditor.m"), 94, CFSTR("_handleChangePanGesture: called with a recognizer whose state is not .Changed"));

  }
  objc_msgSend(v6, "locationInView:", self);
  -[PXSlowMotionEditor handleChangeTrackingAtLocation:](self, "handleChangeTrackingAtLocation:");

}

- (void)_handleEndPanGesture:(id)a3
{
  objc_msgSend(a3, "locationInView:", self);
  -[PXSlowMotionEditor handleEndTrackingAtLocation:](self, "handleEndTrackingAtLocation:");
}

- (void)prepareForImpact
{
  id v2;

  -[PXUISlowMotionEditor impactGenerator](self, "impactGenerator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepare");

}

- (void)impactOccured
{
  id v2;

  -[PXUISlowMotionEditor impactGenerator](self, "impactGenerator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "impactOccurred");

}

- (UIPanGestureRecognizer)panGesture
{
  return self->_panGesture;
}

- (void)setPanGesture:(id)a3
{
  objc_storeStrong((id *)&self->_panGesture, a3);
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
  objc_storeStrong((id *)&self->_tapGesture, a3);
}

- (UIImpactFeedbackGenerator)impactGenerator
{
  return self->_impactGenerator;
}

- (void)setImpactGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_impactGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactGenerator, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
}

+ (id)handleImage
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", CFSTR("UISlowMotionGrabberHandle.png"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)createSnappingControllerWithSnappingTarget:(double)a3
{
  return -[PXUISnappingController initWithSnappingTarget:]([PXUISnappingController alloc], "initWithSnappingTarget:", a3);
}

@end
