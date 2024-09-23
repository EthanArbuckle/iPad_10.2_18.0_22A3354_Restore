@implementation SUCanvasMaskProvider

- (SUCanvasMaskProvider)initWithFunction:(id)a3
{
  SUCanvasMaskProvider *v4;

  v4 = -[SUCanvasMaskProvider init](self, "init");
  if (v4)
    v4->_function = (SUScriptCanvasFunction *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_function = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUCanvasMaskProvider;
  -[SUCanvasMaskProvider dealloc](&v3, sel_dealloc);
}

- (id)copyMaskImageWithSize:(CGSize)a3
{
  id v3;
  id v4;

  v3 = -[SUScriptCanvasFunction copyResultForSize:](self->_function, "copyResultForSize:", a3.width, a3.height);
  v4 = (id)objc_msgSend(v3, "canvasImage");

  return v4;
}

- (CGPath)copyPathForMaskWithSize:(CGSize)a3
{
  id v3;
  const CGPath *v4;
  CGPath *v5;

  v3 = -[SUScriptCanvasFunction copyResultForSize:](self->_function, "copyResultForSize:", a3.width, a3.height);
  v4 = (const CGPath *)objc_msgSend(v3, "canvasPath");
  v5 = v4;
  if (v4)
    CGPathRetain(v4);

  return v5;
}

@end
