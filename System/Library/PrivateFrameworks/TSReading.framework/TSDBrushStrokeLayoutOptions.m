@implementation TSDBrushStrokeLayoutOptions

- (TSDBrushStrokeLayoutOptions)init
{
  TSDBrushStrokeLayoutOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDBrushStrokeLayoutOptions;
  result = -[TSDBrushStrokeLayoutOptions init](&v3, sel_init);
  if (result)
    result->_strokeEnd = 1.0;
  return result;
}

- (void)setStrokeEnd:(double)a3
{
  double v5;
  void *v6;
  void *v7;
  id v8;

  TSUClamp();
  self->_strokeEnd = v5;
  if (v5 != a3)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStrokeLayoutOptions setStrokeEnd:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 167, CFSTR("strokeEnd (%f) should be between 0 and 1 inclusive."), *(_QWORD *)&a3);

  }
}

- (NSArray)patternOffsetsBySubpath
{
  return self->_patternOffsetsBySubpath;
}

- (void)setPatternOffsetsBySubpath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)transparencyLayersBySubpath
{
  return self->_transparencyLayersBySubpath;
}

- (void)setTransparencyLayersBySubpath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)strokeEnd
{
  return self->_strokeEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyLayersBySubpath, 0);
  objc_storeStrong((id *)&self->_patternOffsetsBySubpath, 0);
}

@end
