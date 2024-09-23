@implementation _UIFeedbackStateChangeConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[_UIFeedbackDiscretePlayable copy](self->_thresholdFeedback, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[_UIFeedbackContinuousPlayable copy](self->_approachFeedback, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v4[3] = *(_QWORD *)&self->_approachStart;
  v4[4] = *(_QWORD *)&self->_approachEnd;
  v4[5] = *(_QWORD *)&self->_approachCurvature;
  v4[6] = *(_QWORD *)&self->_approachVolumeMax;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  void *v6;
  _UIFeedbackDiscretePlayable *v7;
  _UIFeedbackDiscretePlayable *v8;
  _UIFeedbackDiscretePlayable *v9;
  int v10;
  BOOL v11;
  void *v12;
  _UIFeedbackDiscretePlayable *v13;
  int v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UIFeedbackStateChangeConfiguration;
  if (-[_UIFeedbackStateChangeConfiguration isEqual:](&v16, sel_isEqual_, v4))
  {
    v5 = (double *)v4;
    v6 = (void *)*((_QWORD *)v5 + 1);
    v7 = self->_thresholdFeedback;
    v8 = v6;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      if (!v7 || !v8)
        goto LABEL_14;
      v10 = -[_UIFeedbackDiscretePlayable isEqual:](v7, "isEqual:", v8);

      if (!v10)
        goto LABEL_15;
    }
    v12 = (void *)*((_QWORD *)v5 + 2);
    v7 = self->_approachFeedback;
    v13 = v12;
    if (v7 == v13)
    {

LABEL_19:
      if (self->_approachStart == v5[3] && self->_approachEnd == v5[4] && self->_approachCurvature == v5[5])
      {
        v11 = self->_approachVolumeMax == v5[6];
        goto LABEL_16;
      }
LABEL_15:
      v11 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v9 = v13;
    if (v7 && v13)
    {
      v14 = -[_UIFeedbackDiscretePlayable isEqual:](v7, "isEqual:", v13);

      if (!v14)
        goto LABEL_15;
      goto LABEL_19;
    }
LABEL_14:

    goto LABEL_15;
  }
  v11 = 0;
LABEL_17:

  return v11;
}

- (_UIFeedbackDiscretePlayable)thresholdFeedback
{
  return self->_thresholdFeedback;
}

- (void)setThresholdFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_thresholdFeedback, a3);
}

- (_UIFeedbackContinuousPlayable)approachFeedback
{
  return self->_approachFeedback;
}

- (void)setApproachFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_approachFeedback, a3);
}

- (double)approachStart
{
  return self->_approachStart;
}

- (void)setApproachStart:(double)a3
{
  self->_approachStart = a3;
}

- (double)approachEnd
{
  return self->_approachEnd;
}

- (void)setApproachEnd:(double)a3
{
  self->_approachEnd = a3;
}

- (double)approachCurvature
{
  return self->_approachCurvature;
}

- (void)setApproachCurvature:(double)a3
{
  self->_approachCurvature = a3;
}

- (double)approachVolumeMax
{
  return self->_approachVolumeMax;
}

- (void)setApproachVolumeMax:(double)a3
{
  self->_approachVolumeMax = a3;
}

- (NSString)hidThresholdFeedbackPatternName
{
  return self->_hidThresholdFeedbackPatternName;
}

- (void)setHidThresholdFeedbackPatternName:(id)a3
{
  objc_storeStrong((id *)&self->_hidThresholdFeedbackPatternName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidThresholdFeedbackPatternName, 0);
  objc_storeStrong((id *)&self->_approachFeedback, 0);
  objc_storeStrong((id *)&self->_thresholdFeedback, 0);
}

@end
