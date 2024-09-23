@implementation VKAVCapturePreviewView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)previewLayer
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    v2 = objc_opt_class();
    objc_msgSend(v1, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    VKDynamicCast(v2, (uint64_t)v3);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VKAVCapturePreviewView;
  -[VKAVCapturePreviewView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[VKAVCapturePreviewView delegate]((id *)&self->super.super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAVCapturePreviewView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewView:didMoveToWindow:", self, v4);

}

- (id)delegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 56);
  return WeakRetained;
}

- (void)layoutSubviews
{
  CGRect *p_bounds;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  objc_super v13;

  p_bounds = &self->_bounds;
  -[VKAVCapturePreviewView bounds](self, "bounds");
  if (!VKMNearlyEqualRects(p_bounds->origin.x, p_bounds->origin.y, p_bounds->size.width, p_bounds->size.height, v4, v5, v6, v7))
  {
    -[VKAVCapturePreviewView bounds](self, "bounds");
    p_bounds->origin.x = v8;
    p_bounds->origin.y = v9;
    p_bounds->size.width = v10;
    p_bounds->size.height = v11;
    -[VKAVCapturePreviewView delegate]((id *)&self->super.super.super.isa);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "didChangeBoundsForPreviewView:", self);

  }
  v13.receiver = self;
  v13.super_class = (Class)VKAVCapturePreviewView;
  -[VKAVCapturePreviewView layoutSubviews](&v13, sel_layoutSubviews);
}

- (double)videoRotationAngle
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  if (!a1)
    return 0.0;
  -[VKAVCapturePreviewView previewLayer](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoRotationAngle");
  v4 = v3;

  return v4;
}

- (void)setVideoRotationAngle:(void *)a1
{
  void *v3;
  id v4;

  if (a1)
  {
    -[VKAVCapturePreviewView previewLayer](a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "connection");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setVideoRotationAngle:", a2);
  }
}

- (id)setDelegate:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 56, a2);
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
