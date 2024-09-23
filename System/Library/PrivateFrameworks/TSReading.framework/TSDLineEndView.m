@implementation TSDLineEndView

+ (id)viewWithLineEnd:(id)a3 onRight:(BOOL)a4
{
  _BOOL8 v4;
  TSDLineEndView *v6;

  v4 = a4;
  v6 = objc_alloc_init(TSDLineEndView);
  -[TSDLineEndView setOpaque:](v6, "setOpaque:", 0);
  -[TSDLineEndView setAlpha:](v6, "setAlpha:", 0.699999988);
  -[TSDLineEndView setLineEnd:](v6, "setLineEnd:", a3);
  -[TSDLineEndView setBounds:](v6, "setBounds:", 0.0, 0.0, 27.0, 11.0);
  -[TSDLineEndView setOnRight:](v6, "setOnRight:", v4);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDLineEndView;
  -[TSDLineEndView dealloc](&v3, sel_dealloc);
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  TSDLineEnd *mLineEnd;
  _BOOL8 mOnRight;
  double v7;
  double v8;
  double v9;
  double v10;
  CGImage *v11;
  CGRect v12;

  CurrentContext = UIGraphicsGetCurrentContext();
  mLineEnd = self->mLineEnd;
  mOnRight = self->mOnRight;
  -[TSDLineEndView contentScaleFactor](self, "contentScaleFactor");
  v8 = v7;
  -[TSDLineEndView bounds](self, "bounds");
  v11 = -[TSDLineEnd newLineEndImageOnRight:forContentsScale:withSize:](mLineEnd, "newLineEndImageOnRight:forContentsScale:withSize:", mOnRight, v8, v9, v10);
  -[TSDLineEndView bounds](self, "bounds");
  v12.origin.x = TSDRectWithSize();
  CGContextDrawImage(CurrentContext, v12, v11);
  CGImageRelease(v11);
}

- (TSDLineEnd)lineEnd
{
  return self->mLineEnd;
}

- (void)setLineEnd:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

- (BOOL)onRight
{
  return self->mOnRight;
}

- (void)setOnRight:(BOOL)a3
{
  self->mOnRight = a3;
}

@end
