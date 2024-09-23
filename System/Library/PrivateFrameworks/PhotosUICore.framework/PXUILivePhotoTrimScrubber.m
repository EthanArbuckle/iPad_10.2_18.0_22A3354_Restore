@implementation PXUILivePhotoTrimScrubber

- (PXUILivePhotoTrimScrubber)initWithFilmStripViewClass:(Class)a3 spec:(id)a4 traitCollection:(id)a5
{
  PXUILivePhotoTrimScrubber *v5;
  PXUILivePhotoTrimScrubber *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXUILivePhotoTrimScrubber;
  v5 = -[PXLivePhotoTrimScrubber initWithFilmStripViewClass:spec:traitCollection:](&v8, sel_initWithFilmStripViewClass_spec_traitCollection_, a3, a4, a5);
  v6 = v5;
  if (v5)
    -[PXUILivePhotoTrimScrubber _PXUILivePhotoTrimScrubber_commonInit](v5, "_PXUILivePhotoTrimScrubber_commonInit");
  return v6;
}

- (void)_PXUILivePhotoTrimScrubber_commonInit
{
  UIPanGestureRecognizer *v3;
  UIPanGestureRecognizer *panGesture;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *tapGesture;
  UITapGestureRecognizer *v7;
  UILongPressGestureRecognizer *v8;
  UILongPressGestureRecognizer *longPressGesture;
  UILongPressGestureRecognizer *v10;
  UIImpactFeedbackGenerator *v11;
  UIImpactFeedbackGenerator *impactGenerator;
  UIPanGestureRecognizer *v13;

  v3 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__handlePan_);
  -[UIPanGestureRecognizer setDelegate:](v3, "setDelegate:", self);
  -[PXUILivePhotoTrimScrubber addGestureRecognizer:](self, "addGestureRecognizer:", v3);
  panGesture = self->_panGesture;
  self->_panGesture = v3;
  v13 = v3;

  v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
  -[UITapGestureRecognizer setDelegate:](v5, "setDelegate:", self);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](v5, "requireGestureRecognizerToFail:", self->_panGesture);
  -[PXUILivePhotoTrimScrubber addGestureRecognizer:](self, "addGestureRecognizer:", v5);
  tapGesture = self->_tapGesture;
  self->_tapGesture = v5;
  v7 = v5;

  v8 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleLongPress_);
  -[UILongPressGestureRecognizer setDelegate:](v8, "setDelegate:", self);
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v8, "setMinimumPressDuration:", 0.5);
  -[PXUILivePhotoTrimScrubber addGestureRecognizer:](self, "addGestureRecognizer:", v8);
  longPressGesture = self->_longPressGesture;
  self->_longPressGesture = v8;
  v10 = v8;

  v11 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3898]), "initWithStyle:", 0);
  impactGenerator = self->_impactGenerator;
  self->_impactGenerator = v11;

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  char v4;

  -[PXLivePhotoTrimScrubber untrimmedDuration](self, "untrimmedDuration", a3);
  return (v4 & 0x1D) == 1;
}

- (void)_handleTap:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  CGPoint v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    if (-[PXLivePhotoTrimScrubber playheadStyle](self, "playheadStyle") == 1)
    {
      objc_msgSend(v4, "locationInView:", self);
      v20 = 0uLL;
      v21 = 0;
      -[PXLivePhotoTrimScrubber timeAtPoint:](self, "timeAtPoint:");
      -[PXLivePhotoTrimScrubber delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        -[PXLivePhotoTrimScrubber delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v20;
        v19 = v21;
        objc_msgSend(v7, "trimScrubber:didTapTimelineAtTime:", self, &v18);

      }
    }
    else if (-[PXLivePhotoTrimScrubber playheadStyle](self, "playheadStyle") == 2)
    {
      -[PXLivePhotoTrimScrubber photoLoupe](self, "photoLoupe");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationInView:", v8);
      v10 = v9;
      v12 = v11;

      -[PXLivePhotoTrimScrubber photoLoupe](self, "photoLoupe");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v24 = CGRectInset(v23, -10.0, -10.0);
      x = v24.origin.x;
      y = v24.origin.y;
      width = v24.size.width;
      height = v24.size.height;

      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      v22.x = v10;
      v22.y = v12;
      if (CGRectContainsPoint(v25, v22))
      {
        -[PXLivePhotoTrimScrubber handleTapWithElement:](self, "handleTapWithElement:", 3);
      }
      else
      {
        objc_msgSend(v4, "locationInView:", self);
        v20 = 0uLL;
        v21 = 0;
        -[PXLivePhotoTrimScrubber timeAtPoint:](self, "timeAtPoint:");
        v18 = v20;
        v19 = v21;
        -[PXLivePhotoTrimScrubber handleSetKeyTime:](self, "handleSetKeyTime:", &v18);
      }
    }
  }

}

- (void)_handlePan:(id)a3
{
  PXUILivePhotoTrimScrubber *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  switch(objc_msgSend(v6, "state"))
  {
    case 1:
      -[PXUILivePhotoTrimScrubber _handleBeginPanGesture:](self, "_handleBeginPanGesture:", v6);
      break;
    case 2:
      -[PXUILivePhotoTrimScrubber _handleChangePanGesture:](self, "_handleChangePanGesture:", v6);
      break;
    case 3:
      v4 = self;
      v5 = 1;
      goto LABEL_6;
    case 4:
    case 5:
      v4 = self;
      v5 = 0;
LABEL_6:
      -[PXLivePhotoTrimScrubber handleEndTracking:](v4, "handleEndTracking:", v5);
      break;
    default:
      break;
  }

}

- (void)_handleLongPress:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  PXUILivePhotoTrimScrubber *v15;
  uint64_t v16;
  id v17;
  CGPoint v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v17 = a3;
  v4 = objc_msgSend(v17, "state");
  if ((unint64_t)(v4 - 4) < 2)
  {
    v15 = self;
    v16 = 0;
LABEL_8:
    -[PXLivePhotoTrimScrubber handleEndTracking:](v15, "handleEndTracking:", v16);
    goto LABEL_9;
  }
  if (v4 == 3)
  {
    v15 = self;
    v16 = 1;
    goto LABEL_8;
  }
  if (v4 == 1)
  {
    -[PXLivePhotoTrimScrubber photoLoupe](self, "photoLoupe");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    -[PXLivePhotoTrimScrubber photoLoupe](self, "photoLoupe");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v20 = CGRectInset(v19, -10.0, -10.0);
    x = v20.origin.x;
    y = v20.origin.y;
    width = v20.size.width;
    height = v20.size.height;

    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v18.x = v7;
    v18.y = v9;
    if (CGRectContainsPoint(v21, v18))
    {
      -[PXUILivePhotoTrimScrubber prepareForImpact](self, "prepareForImpact");
      -[PXLivePhotoTrimScrubber handleLongPressWithElement:](self, "handleLongPressWithElement:", 4);
    }
  }
LABEL_9:

}

- (void)_handleBeginPanGesture:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "state") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUILivePhotoTrimScrubber.m"), 153, CFSTR("_handleBeginPanGesture: called with a recognizer whose state is not .Began"));

  }
  if (-[PXLivePhotoTrimScrubber currentlyInteractingElement](self, "currentlyInteractingElement"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUILivePhotoTrimScrubber.m"), 154, CFSTR("A new tracking gesture began, but we are already tracking one."));

  }
  objc_msgSend(v7, "locationInView:", self);
  -[PXLivePhotoTrimScrubber handleBeginTrackingAtLocation:](self, "handleBeginTrackingAtLocation:");

}

- (void)_handleChangePanGesture:(id)a3
{
  int64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "state") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUILivePhotoTrimScrubber.m"), 162, CFSTR("_handleChangePanGesture: called with a recognizer whose state is not .Changed"));

  }
  v5 = -[PXLivePhotoTrimScrubber currentlyInteractingElement](self, "currentlyInteractingElement");
  v6 = v14;
  if (v5)
  {
    objc_msgSend(v14, "locationInView:", self);
    v8 = v7;
    v10 = v9;
    objc_msgSend(v14, "velocityInView:", self);
    -[PXLivePhotoTrimScrubber handleChangeTrackingAtLocation:withVelocity:](self, "handleChangeTrackingAtLocation:withVelocity:", v8, v10, v11, v12);
    v6 = v14;
  }

}

- (void)setDisabled:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXUILivePhotoTrimScrubber;
  -[PXLivePhotoTrimScrubber setDisabled:](&v8, sel_setDisabled_);
  v5 = !v3;
  -[PXUILivePhotoTrimScrubber panGesture](self, "panGesture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

  -[PXUILivePhotoTrimScrubber tapGesture](self, "tapGesture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v5);

}

- (void)prepareForImpact
{
  id v2;

  -[PXUILivePhotoTrimScrubber impactGenerator](self, "impactGenerator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepare");

}

- (void)impactOccured
{
  id v2;

  -[PXUILivePhotoTrimScrubber impactGenerator](self, "impactGenerator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "impactOccurred");

}

- (CGSize)intrinsicContentSize
{
  double v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  -[PXLivePhotoTrimScrubber spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleHeight");
  v5 = v4;

  v6 = v2;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
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

- (UILongPressGestureRecognizer)longPressGesture
{
  return self->_longPressGesture;
}

- (void)setLongPressGesture:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGesture, a3);
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
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_panGesture, 0);
}

+ (id)createSnappingControllerWithSnappingTarget:(double)a3
{
  return -[PXUISnappingController initWithSnappingTarget:]([PXUISnappingController alloc], "initWithSnappingTarget:", a3);
}

+ (id)_stretchableImageNamed:(id)a3 withCapInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  void *v9;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resizableImageWithCapInsets:", top, left, bottom, right);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)trimStartImage
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", CFSTR("PXMovieScrubberEditingGlassLeft"), 0.0, 24.0, 0.0, 0.0);
}

+ (id)trimStartHighlightedImage
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", CFSTR("PXMovieScrubberEditingLeft"), 0.0, 24.0, 0.0, 0.0);
}

+ (id)trimEndImage
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", CFSTR("PXMovieScrubberEditingGlassRight"), 0.0, 0.0, 0.0, 24.0);
}

+ (id)trimEndHighlightedImage
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", CFSTR("PXMovieScrubberEditingRight"), 0.0, 0.0, 0.0, 24.0);
}

+ (id)trimStartImageMini
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", CFSTR("PXMovieScrubberEditingGlassLeft_Mini"), 0.0, 24.0, 0.0, 0.0);
}

+ (id)trimStartHighlightedImageMini
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", CFSTR("PXMovieScrubberEditingLeft_Mini"), 0.0, 24.0, 0.0, 0.0);
}

+ (id)trimEndImageMini
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", CFSTR("PXMovieScrubberEditingGlassRight_Mini"), 0.0, 0.0, 0.0, 24.0);
}

+ (id)trimEndHighlightedImageMini
{
  return (id)objc_msgSend(a1, "_stretchableImageNamed:withCapInsets:", CFSTR("PXMovieScrubberEditingRight_Mini"), 0.0, 0.0, 0.0, 24.0);
}

@end
