@implementation SUScriptCanvasResult

- (id)_initWithCanvas:(id)a3
{
  SUScriptCanvasResult *v4;

  v4 = -[SUScriptCanvasResult init](self, "init");
  if (v4)
  {
    v4->_image = (UIImage *)objc_msgSend(a3, "copyCanvasImage");
    v4->_path = (CGPath *)objc_msgSend(a3, "copyCanvasPath");
  }
  return v4;
}

- (void)dealloc
{
  CGPath *path;
  objc_super v4;

  path = self->_path;
  if (path)
  {
    CGPathRelease(path);
    self->_path = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)SUScriptCanvasResult;
  -[SUScriptCanvasResult dealloc](&v4, sel_dealloc);
}

- (UIImage)canvasImage
{
  return self->_image;
}

- (CGPath)canvasPath
{
  return self->_path;
}

@end
