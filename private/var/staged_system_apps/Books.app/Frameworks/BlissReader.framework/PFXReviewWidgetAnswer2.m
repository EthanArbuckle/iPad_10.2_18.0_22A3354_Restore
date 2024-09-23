@implementation PFXReviewWidgetAnswer2

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFXReviewWidgetAnswer2;
  -[PFXReviewWidgetAnswer2 dealloc](&v3, "dealloc");
}

- (int)placementHint
{
  TSDBezierPath *targetRegion;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  targetRegion = self->_targetRegion;
  if (targetRegion)
  {
    if (self->_answerGeometry)
    {
      -[TSDBezierPath bounds](targetRegion, "bounds");
      v8 = TSDCenterOfRect(v4, v5, v6, v7);
      v10 = v9;
      -[TSDInfoGeometry center](self->_answerGeometry, "center");
      v13 = v12 - v8;
      v14 = vabdd_f64(v11, v10);
      if (v14 >= -v13)
      {
        if (v14 >= v13)
        {
          if (v11 - v10 <= fabs(v13))
            LODWORD(targetRegion) = 1;
          else
            LODWORD(targetRegion) = 3;
        }
        else
        {
          LODWORD(targetRegion) = 2;
        }
      }
      else
      {
        LODWORD(targetRegion) = 4;
      }
    }
    else
    {
      LODWORD(targetRegion) = 0;
    }
  }
  return (int)targetRegion;
}

- (double)answerWeight
{
  return self->_answerWeight;
}

- (void)setAnswerWeight:(double)a3
{
  self->_answerWeight = a3;
}

- (TSDBezierPath)targetRegion
{
  return self->_targetRegion;
}

- (void)setTargetRegion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (TSDInfoGeometry)answerGeometry
{
  return self->_answerGeometry;
}

- (void)setAnswerGeometry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)targetAccessibilityDescription
{
  return self->_targetAccessibilityDescription;
}

- (void)setTargetAccessibilityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
