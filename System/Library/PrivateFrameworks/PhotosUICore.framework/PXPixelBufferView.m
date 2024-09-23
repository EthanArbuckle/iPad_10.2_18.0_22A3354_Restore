@implementation PXPixelBufferView

- (void)didMoveToWindow
{
  void *v2;
  void *v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXPixelBufferView;
  -[PXPixelBufferView didMoveToWindow](&v9, sel_didMoveToWindow);
  -[PXPixelBufferView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXPixelBufferView window](self, "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "screen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v7 = v6;
  }
  else
  {
    v7 = 1.0;
  }
  -[PXPixelBufferView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentsScale:", v7);

  if (v5)
  {

  }
}

- (void)enqueuePixelBuffer:(__CVBuffer *)a3
{
  id v4;

  -[PXPixelBufferView imageQueueLayer](self, "imageQueueLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPixelBuffer:", a3);

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
