@implementation SCRCPhotoEvaluatorResults

- (SCRCPhotoEvaluatorResults)initWithBlurResult:(id)a3 colorResult:(id)a4 luminanceResult:(id)a5
{
  id v9;
  id v10;
  id v11;
  SCRCPhotoEvaluatorResults *v12;
  SCRCPhotoEvaluatorResults *v13;
  SCRCPhotoEvaluatorResults *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SCRCPhotoEvaluatorResults;
  v12 = -[SCRCPhotoEvaluatorResults init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_blurResult, a3);
    objc_storeStrong((id *)&v13->_colorResult, a4);
    objc_storeStrong((id *)&v13->_luminanceResult, a5);
    v14 = v13;
  }

  return v13;
}

- (SCRCPhotoEvaluatorResult)blurResult
{
  return self->_blurResult;
}

- (SCRCPhotoEvaluatorResult)colorResult
{
  return self->_colorResult;
}

- (SCRCPhotoEvaluatorResult)luminanceResult
{
  return self->_luminanceResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_luminanceResult, 0);
  objc_storeStrong((id *)&self->_colorResult, 0);
  objc_storeStrong((id *)&self->_blurResult, 0);
}

@end
