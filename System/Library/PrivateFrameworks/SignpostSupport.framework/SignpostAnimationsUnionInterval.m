@implementation SignpostAnimationsUnionInterval

- (SignpostAnimationsUnionInterval)initWithAnimation:(id)a3
{
  id v4;
  SignpostAnimationsUnionInterval *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *animationIntervals;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SignpostAnimationsUnionInterval;
  v5 = -[SignpostAnimationsUnionInterval init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "startMachContinuousTime");
    v7 = objc_msgSend(v4, "durationMachContinuousTime");
    v5->_animationTimeRange.location = v6;
    v5->_animationTimeRange.length = v7;
    v8 = objc_opt_new();
    animationIntervals = v5->_animationIntervals;
    v5->_animationIntervals = (NSMutableArray *)v8;

    -[NSMutableArray addObject:](v5->_animationIntervals, "addObject:", v4);
  }

  return v5;
}

- (_NSRange)animationTimeRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_animationTimeRange.length;
  location = self->_animationTimeRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setAnimationTimeRange:(_NSRange)a3
{
  self->_animationTimeRange = a3;
}

- (NSMutableArray)animationIntervals
{
  return self->_animationIntervals;
}

- (void)setAnimationIntervals:(id)a3
{
  objc_storeStrong((id *)&self->_animationIntervals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationIntervals, 0);
}

@end
