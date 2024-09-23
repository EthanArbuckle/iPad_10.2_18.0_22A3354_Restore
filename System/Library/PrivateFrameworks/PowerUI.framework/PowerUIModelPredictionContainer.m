@implementation PowerUIModelPredictionContainer

- (PowerUIModelPredictionContainer)initWithEngagementConfidence:(double)a3 withSmartChargeDuration:(double)a4 withModelVersion:(id)a5
{
  id v9;
  PowerUIModelPredictionContainer *v10;
  PowerUIModelPredictionContainer *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PowerUIModelPredictionContainer;
  v10 = -[PowerUIModelPredictionContainer init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_modelVersion, a5);
    v11->_engagementConfidence = a3;
    v11->_smartChargeDuration = a4;
    v11->_state = 0;
  }

  return v11;
}

- (id)initInvalidEntry:(unint64_t)a3 withEngagementConfidence:(double)a4 withSmartChargeDuration:(double)a5 withModelVersion:(id)a6
{
  id v11;
  PowerUIModelPredictionContainer *v12;
  PowerUIModelPredictionContainer *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PowerUIModelPredictionContainer;
  v12 = -[PowerUIModelPredictionContainer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_state = a3;
    v12->_engagementConfidence = a4;
    v12->_smartChargeDuration = a5;
    objc_storeStrong((id *)&v12->_modelVersion, a6);
  }

  return v13;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (unint64_t)state
{
  return self->_state;
}

- (double)engagementConfidence
{
  return self->_engagementConfidence;
}

- (double)smartChargeDuration
{
  return self->_smartChargeDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

@end
