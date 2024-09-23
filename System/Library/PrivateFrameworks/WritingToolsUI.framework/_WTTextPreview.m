@implementation _WTTextPreview

- (_WTTextPreview)initWithSnapshotImage:(CGImage *)a3 presentationFrame:(CGRect)a4
{
  return -[_WTTextPreview initWithSnapshotImage:presentationFrame:backgroundColor:clippingPath:scale:candidateRects:](self, "initWithSnapshotImage:presentationFrame:backgroundColor:clippingPath:scale:candidateRects:", a3, 0, 0, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 1.0);
}

- (_WTTextPreview)initWithSnapshotImage:(CGImage *)a3 presentationFrame:(CGRect)a4 backgroundColor:(CGColor *)a5 clippingPath:(CGPath *)a6 scale:(double)a7
{
  return -[_WTTextPreview initWithSnapshotImage:presentationFrame:backgroundColor:clippingPath:scale:candidateRects:](self, "initWithSnapshotImage:presentationFrame:backgroundColor:clippingPath:scale:candidateRects:", a3, a5, a6, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a7);
}

- (_WTTextPreview)initWithSnapshotImage:(CGImage *)a3 presentationFrame:(CGRect)a4 backgroundColor:(CGColor *)a5 clippingPath:(CGPath *)a6 scale:(double)a7 candidateRects:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  _WTTextPreview *v18;
  _WTTextPreview *v19;
  _WTTextPreview *v20;
  objc_super v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)_WTTextPreview;
  v18 = -[_WTTextPreview init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    -[_WTTextPreview setPreviewImage:](v18, "setPreviewImage:", a3);
    -[_WTTextPreview setPresentationFrame:](v19, "setPresentationFrame:", x, y, width, height);
    -[_WTTextPreview setBackgroundColor:](v19, "setBackgroundColor:", a5);
    -[_WTTextPreview setClippingPath:](v19, "setClippingPath:", a6);
    -[_WTTextPreview setScale:](v19, "setScale:", a7);
    -[_WTTextPreview setCandidateRects:](v19, "setCandidateRects:", v17);
    v20 = v19;
  }

  return v19;
}

- (_WTTextPreview)initWithContentPath:(CGPath *)a3
{
  _WTTextPreview *v4;
  _WTTextPreview *v5;
  _WTTextPreview *v6;
  objc_super v8;
  CGRect PathBoundingBox;

  v8.receiver = self;
  v8.super_class = (Class)_WTTextPreview;
  v4 = -[_WTTextPreview init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[_WTTextPreview setContentPath:](v4, "setContentPath:", a3);
    PathBoundingBox = CGPathGetPathBoundingBox(a3);
    -[_WTTextPreview setPresentationFrame:](v5, "setPresentationFrame:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), PathBoundingBox.size.width, PathBoundingBox.size.height);
    -[_WTTextPreview setBackgroundColor:](v5, "setBackgroundColor:", 0);
    -[_WTTextPreview setClippingPath:](v5, "setClippingPath:", a3);
    -[_WTTextPreview setScale:](v5, "setScale:", 1.0);
    v6 = v5;
  }

  return v5;
}

- (id)layerWithContents
{
  void *v3;

  if (-[_WTTextPreview contentPath](self, "contentPath"))
  {
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPath:", -[_WTTextPreview contentPath](self, "contentPath"));
    objc_msgSend(v3, "setFillColor:", CGColorGetConstantColor((CFStringRef)*MEMORY[0x24BDBF200]));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setContents:", -[_WTTextPreview previewImage](self, "previewImage"));
  }
  -[_WTTextPreview presentationFrame](self, "presentationFrame");
  objc_msgSend(v3, "setFrame:");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if (-[_WTTextPreview previewImage](self, "previewImage"))
    CFRelease(-[_WTTextPreview previewImage](self, "previewImage"));
  if (-[_WTTextPreview contentPath](self, "contentPath"))
    CFRelease(-[_WTTextPreview contentPath](self, "contentPath"));
  if (-[_WTTextPreview backgroundColor](self, "backgroundColor"))
    CFRelease(-[_WTTextPreview backgroundColor](self, "backgroundColor"));
  if (-[_WTTextPreview clippingPath](self, "clippingPath"))
    CFRelease(-[_WTTextPreview clippingPath](self, "clippingPath"));
  v3.receiver = self;
  v3.super_class = (Class)_WTTextPreview;
  -[_WTTextPreview dealloc](&v3, sel_dealloc);
}

- (CGImage)previewImage
{
  return (CGImage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPreviewImage:(CGImage *)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CGPath)contentPath
{
  return (CGPath *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContentPath:(CGPath *)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CGRect)presentationFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_presentationFrame, 32, 1, 0);
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

- (void)setPresentationFrame:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_presentationFrame, &v3, 32, 1, 0);
}

- (CGColor)backgroundColor
{
  return (CGColor *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBackgroundColor:(CGColor *)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CGPath)clippingPath
{
  return (CGPath *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClippingPath:(CGPath *)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (NSArray)candidateRects
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCandidateRects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateRects, 0);
}

@end
