@implementation SUMaskedView

- (void)dealloc
{
  objc_super v3;

  self->_maskProvider = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUMaskedView;
  -[SUMaskedView dealloc](&v3, sel_dealloc);
}

- (CGPath)copyMaskPath
{
  double v3;
  double v4;
  CGPath *result;
  CGPath *Mutable;
  CGPath *v8;
  CGRect v9;

  -[SUMaskedView frame](self, "frame");
  if (v4 <= 0.00000011920929 || v3 <= 0.00000011920929)
    return 0;
  result = -[SUMaskProvider copyPathForMaskWithSize:](self->_maskProvider, "copyPathForMaskWithSize:", v3, v4);
  if (!result)
  {
    Mutable = CGPathCreateMutable();
    -[SUMaskedView bounds](self, "bounds");
    CGPathAddRect(Mutable, 0, v9);
    v8 = (CGPath *)MEMORY[0x220762BCC](Mutable);
    CGPathRelease(Mutable);
    return v8;
  }
  return result;
}

- (void)setMaskProvider:(id)a3
{
  SUMaskProvider *maskProvider;

  maskProvider = self->_maskProvider;
  if (maskProvider != a3)
  {

    self->_maskProvider = (SUMaskProvider *)a3;
    -[SUMaskedView _reloadMask](self, "_reloadMask");
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SUMaskedView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)SUMaskedView;
  -[SUMaskedView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
    -[SUMaskedView _reloadMask](self, "_reloadMask");
}

- (void)_reloadMask
{
  double v3;
  double v4;
  SUMaskProvider *maskProvider;
  BOOL v6;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  -[SUMaskedView frame](self, "frame");
  maskProvider = self->_maskProvider;
  if (maskProvider)
    v6 = v4 <= 0.00000011920929;
  else
    v6 = 1;
  if (!v6 && v3 > 0.00000011920929)
  {
    v12 = -[SUMaskProvider copyMaskImageWithSize:](maskProvider, "copyMaskImageWithSize:", v3, v4);
    v8 = (void *)-[SUMaskedView layer](self, "layer");
    v9 = objc_msgSend(v8, "mask");
    v10 = (id)v9;
    if (!v9 && v12)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDE56D0]);
      objc_msgSend(v8, "setMask:", v10);

    }
    objc_msgSend(v10, "setContents:", objc_msgSend(v12, "CGImage"));
    v11 = v12;
    if (!v12)
      v11 = (void *)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    objc_msgSend(v11, "scale");
    objc_msgSend(v10, "setContentsScale:");
    objc_msgSend(v8, "bounds");
    objc_msgSend(v10, "setFrame:");

  }
}

- (SUMaskProvider)maskProvider
{
  return self->_maskProvider;
}

@end
