@implementation AEMarginNote

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSide:", -[AEMarginNote side](self, "side"));
  -[AEMarginNote yStart](self, "yStart");
  objc_msgSend(v4, "setYStart:");
  -[AEMarginNote xOffset](self, "xOffset");
  objc_msgSend(v4, "setXOffset:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNote annotation](self, "annotation"));
  objc_msgSend(v4, "setAnnotation:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEMarginNote theme](self, "theme"));
  objc_msgSend(v4, "setTheme:", v6);

  return v4;
}

- (int)side
{
  return self->mSide;
}

- (void)setSide:(int)a3
{
  self->mSide = a3;
}

- (double)yStart
{
  return self->mYStart;
}

- (void)setYStart:(double)a3
{
  self->mYStart = a3;
}

- (double)xOffset
{
  return self->mXOffset;
}

- (void)setXOffset:(double)a3
{
  self->mXOffset = a3;
}

- (AEAnnotation)annotation
{
  return self->mAnnotation;
}

- (void)setAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->mAnnotation, a3);
}

- (AEAnnotationTheme)theme
{
  return self->mTheme;
}

- (void)setTheme:(id)a3
{
  objc_storeStrong((id *)&self->mTheme, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTheme, 0);
  objc_storeStrong((id *)&self->mAnnotation, 0);
}

@end
