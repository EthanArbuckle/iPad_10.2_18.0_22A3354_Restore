@implementation VIBoxScorer

- (VIBoxScorer)initWithGranularity:(int64_t)a3 xMean:(double)a4 yMean:(double)a5 std:(double)a6
{
  VIBoxScorer *v10;
  _TtC18VisualIntelligence19BoxScorerCompatible *v11;
  _TtC18VisualIntelligence19BoxScorerCompatible *boxScorer;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VIBoxScorer;
  v10 = -[VIBoxScorer init](&v14, sel_init);
  if (v10)
  {
    v11 = -[BoxScorerCompatible initWithGranularity:xMean:yMean:std:]([_TtC18VisualIntelligence19BoxScorerCompatible alloc], "initWithGranularity:xMean:yMean:std:", a3, a4, a5, a6);
    boxScorer = v10->_boxScorer;
    v10->_boxScorer = v11;

  }
  return v10;
}

- (double)scoreWithXTopLeft:(double)a3 yTopLeft:(double)a4 width:(double)a5 height:(double)a6
{
  double result;

  -[BoxScorerCompatible scoreWithXTopLeft:yTopLeft:width:height:](self->_boxScorer, "scoreWithXTopLeft:yTopLeft:width:height:", a3, a4, a5, a6);
  return result;
}

- (double)scoreWithBoundingBox:(CGRect)a3
{
  double result;

  -[BoxScorerCompatible scoreWithXTopLeft:yTopLeft:width:height:](self->_boxScorer, "scoreWithXTopLeft:yTopLeft:width:height:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boxScorer, 0);
}

@end
