@implementation SLProgressiveCheckerResult

- (SLProgressiveCheckerResult)initWithScore:(float)a3 ofType:(unint64_t)a4 analyzedSamples:(unint64_t)a5 detailedResults:(id)a6
{
  id v11;
  SLProgressiveCheckerResult *v12;
  SLProgressiveCheckerResult *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)SLProgressiveCheckerResult;
  v12 = -[SLProgressiveCheckerResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_score = a3;
    v12->_analyzedSamples = a5;
    objc_storeStrong((id *)&v12->_detailedResult, a6);
    v13->_resultType = a4;
  }

  return v13;
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (unint64_t)analyzedSamples
{
  return self->_analyzedSamples;
}

- (float)score
{
  return self->_score;
}

- (NSArray)detailedResult
{
  return self->_detailedResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailedResult, 0);
}

@end
