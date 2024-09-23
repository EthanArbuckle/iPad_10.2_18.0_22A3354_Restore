@implementation CRLSwatchRenderingOperation

- (CRLSwatchRenderingOperation)initWithImageSize:(CGSize)a3 imageScale:(double)a4 swatchFrame:(CGRect)a5 editingCoordinator:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v12;
  CGFloat v13;
  id v15;
  CRLSwatchRenderingOperation *v16;
  CRLSwatchRenderingOperation *v17;
  objc_super v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3.height;
  v13 = a3.width;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CRLSwatchRenderingOperation;
  v16 = -[CRLSwatchRenderingOperation init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    v16->_imageSize.width = v13;
    v16->_imageSize.height = v12;
    v16->_imageScale = a4;
    v16->_swatchFrame.origin.x = x;
    v16->_swatchFrame.origin.y = y;
    v16->_swatchFrame.size.width = width;
    v16->_swatchFrame.size.height = height;
    objc_storeStrong((id *)&v16->_editingCoordinator, a6);
    v17->_deliversImageAutomatically = 1;
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_deliveredImage);
  v3.receiver = self;
  v3.super_class = (Class)CRLSwatchRenderingOperation;
  -[CRLSwatchRenderingOperation dealloc](&v3, "dealloc");
}

- (BOOL)isReadyToRender
{
  return 1;
}

- (void)p_showSwatchInViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CRLSwatchRenderingOperation *v9;

  if (self->_view)
  {
    v3 = a3;
    if ((-[CRLSwatchRenderingOperation isCancelled](self, "isCancelled") & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_view, "layer"));
      v6 = v5;
      if (v3)
      {
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", CFSTR("CRLSwatchRenderingOperationLayerKey")));
        if (!v7
          || (v8 = (void *)v7,
              v9 = (CRLSwatchRenderingOperation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("CRLSwatchRenderingOperationLayerKey"))), v9, v8, v9 == self))
        {
          objc_msgSend(v6, "crl_addSpringScaleInAnimationWithDelay:", 0.05);
          objc_msgSend(v6, "setValue:forKey:", 0, CFSTR("CRLSwatchRenderingOperationLayerKey"));
        }
      }

    }
    -[UIView setHidden:](self->_view, "setHidden:", 0);
  }
}

- (CGImage)p_newSwatchPressedStateBackgroundFromCGImage:(CGImage *)a3
{
  size_t Width;
  size_t Height;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGContext *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGImage *Image;
  CGRect v28;

  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  v7 = sub_10005FDDC();
  v11 = sub_100060FD8(v7, v8, v9, v10, self->_imageScale);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = sub_10040FA64(3, (double)Width, (double)Height);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithWhite:alpha:](CRLColor, "colorWithWhite:alpha:", 0.1, 0.3));
  CGContextSetFillColorWithColor(v18, (CGColorRef)objc_msgSend(v19, "CGColor"));

  -[CRLSwatchRenderingOperation swatchEdgeInsets](self, "swatchEdgeInsets");
  v21 = v13 + v20;
  v24 = v15 - (v22 + v23);
  v28.size.height = v17 - (v20 + v25);
  v28.origin.x = v11 + v22;
  v28.origin.y = v21;
  v28.size.width = v24;
  CGContextFillRect(v18, v28);
  Image = CGBitmapContextCreateImage(v18);
  CGContextRelease(v18);
  return Image;
}

- (void)p_deliverResultOnMainThread:(id)a3
{
  id v4;
  UIView *view;
  void *v6;
  id AssociatedObject;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  view = self->_view;
  if (view)
  {
    v18 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](view, "layer"));
    AssociatedObject = objc_getAssociatedObject(self->_view, "CRLSwatchRenderingOperationTargetIndexPathKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSwatchRenderingOperation targetIndexPath](self, "targetIndexPath"));
    v11 = v9;
    if (!v9 || objc_msgSend(v9, "isEqual:", v8))
    {
      v12 = objc_opt_class(UIButton, v10);
      v13 = sub_100221D0C(v12, self->_view);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", objc_msgSend(v18, "foreground"), 0, self->_imageScale));
        objc_msgSend(v14, "setImage:forState:", v15, 0);
        if (-[CRLSwatchRenderingOperation needsPressedStateBackground](self, "needsPressedStateBackground"))
        {
          if (objc_msgSend(v18, "background"))
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", objc_msgSend(v18, "background"), 0, self->_imageScale));
            objc_msgSend(v14, "setBackgroundImage:forState:", v16, 1);

          }
        }
        else
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "backgroundImageForState:", 1));

          if (v17)
            objc_msgSend(v14, "setBackgroundImage:forState:", 0, 1);
        }

      }
      else
      {
        objc_msgSend(v6, "setContentsScale:", self->_imageScale);
        objc_msgSend(v6, "setContents:", objc_msgSend(v18, "foreground"));
      }
      objc_msgSend(v6, "setShouldRasterize:", 1);
      objc_msgSend(v6, "setRasterizationScale:", self->_imageScale);
      -[CRLSwatchRenderingOperation p_showSwatchInViewAnimated:](self, "p_showSwatchInViewAnimated:", !self->_suppressesAnimation);

    }
    -[CRLSwatchRenderingOperation setTargetIndexPath:](self, "setTargetIndexPath:", 0);
    -[CRLSwatchRenderingOperation p_didFinishRendering](self, "p_didFinishRendering");

    v4 = v18;
  }

}

- (void)setDelegate:(id)a3
{
  id v4;

  v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  self->_renderForWideGamut = 1;
  if ((objc_opt_respondsToSelector(v4, "shouldRenderUsingWideGamutForSwatchRenderingOperation:") & 1) != 0)
    self->_renderForWideGamut = objc_msgSend(v4, "shouldRenderUsingWideGamutForSwatchRenderingOperation:", self);

}

- (void)p_didFinishRendering
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSwatchRenderingOperation delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "swatchRenderingOperation:didFinishRenderingForView:");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLSwatchRenderingOperation delegate](self, "delegate"));
    objc_msgSend(v5, "swatchRenderingOperation:didFinishRenderingForView:", self, self->_view);

  }
}

- (void)deliverCGImage:(CGImage *)a3
{
  CGImage *v5;
  id v6;

  if (-[CRLSwatchRenderingOperation needsPressedStateBackground](self, "needsPressedStateBackground"))
    v5 = -[CRLSwatchRenderingOperation p_newSwatchPressedStateBackgroundFromCGImage:](self, "p_newSwatchPressedStateBackgroundFromCGImage:", a3);
  else
    v5 = 0;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[CRLSwatchRenderingResult renderingResultWithForeground:background:](CRLSwatchRenderingResult, "renderingResultWithForeground:background:", a3, v5));
  if (v5)
    CGImageRelease(v5);
  self->_deliveredImage = CGImageRetain(a3);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    -[CRLSwatchRenderingOperation p_deliverResultOnMainThread:](self, "p_deliverResultOnMainThread:", v6);
  else
    -[CRLSwatchRenderingOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "p_deliverResultOnMainThread:", v6, 0);

}

- (void)deliverSwatch
{
  CRLImage *swatch;
  CRLImage *v4;

  swatch = self->_swatch;
  if (swatch)
  {
    -[CRLSwatchRenderingOperation deliverCGImage:](self, "deliverCGImage:", -[CRLImage CGImage](swatch, "CGImage"));
    v4 = self->_swatch;
    self->_swatch = 0;

  }
}

- (void)provideSwatchForLaterDelivery:(id)a3
{
  CRLImage *v4;
  void *v5;
  void *v6;
  void *v7;
  CRLImage *swatch;

  v4 = (CRLImage *)a3;
  if (self->_swatch)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F8E0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEC950();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F900);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSwatchRenderingOperation provideSwatchForLaterDelivery:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSwatchRenderingOperation.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 286, 0, "Should not have two swatches!");

  }
  swatch = self->_swatch;
  self->_swatch = v4;

}

- (CGImage)deliveredImage
{
  return self->_deliveredImage;
}

- (BOOL)needsPressedStateBackground
{
  return 0;
}

- (UIEdgeInsets)swatchEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)doWorkWithReadLock
{
  void *v2;
  void *v3;
  void *v4;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122F920);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DEC9D4();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122F940);
  v2 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE87A4(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSwatchRenderingOperation doWorkWithReadLock]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSwatchRenderingOperation.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 303, 0, "Subclasses must override");

}

- (void)main
{
  uint64_t v3;
  CRLImage *swatch;

  if (-[CRLSwatchRenderingOperation isReadyToRender](self, "isReadyToRender"))
  {
    -[CRLSwatchRenderingOperation doWorkWithReadLock](self, "doWorkWithReadLock", v3);
  }
  else
  {
    swatch = self->_swatch;
    self->_swatch = 0;

    -[UIView crl_setPresetRenderingInvalid:](self->_view, "crl_setPresetRenderingInvalid:", 1);
  }
}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CRLSwatchRenderingOperation;
  -[CRLSwatchRenderingOperation cancel](&v2, "cancel");
}

- (NSIndexPath)targetIndexPath
{
  return self->_targetIndexPath;
}

- (void)setTargetIndexPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (UIView)view
{
  return (UIView *)objc_getProperty(self, a2, 8, 1);
}

- (void)setView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)imageScale
{
  return self->_imageScale;
}

- (CGRect)swatchFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_swatchFrame, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CRLSwatchRenderingOperationDelegate)delegate
{
  return (CRLSwatchRenderingOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  return (_TtC8Freeform21CRLEditingCoordinator *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)renderForWideGamut
{
  return self->_renderForWideGamut;
}

- (BOOL)deliversImageAutomatically
{
  return self->_deliversImageAutomatically;
}

- (void)setDeliversImageAutomatically:(BOOL)a3
{
  self->_deliversImageAutomatically = a3;
}

- (BOOL)suppressesAnimation
{
  return self->_suppressesAnimation;
}

- (void)setSuppressesAnimation:(BOOL)a3
{
  self->_suppressesAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIndexPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_swatch, 0);
  objc_storeStrong((id *)&self->_editingCoordinator, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
