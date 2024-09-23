@implementation NeuralNetworkModelWithDataTransformer

- (NeuralNetworkModelWithDataTransformer)initWithNeuralNetworkModel:(NeuralNetworkModel *)a3 andDataTransformer:(id)a4
{
  id v7;
  NeuralNetworkModelWithDataTransformer *v8;
  NeuralNetworkModelWithDataTransformer *v9;
  __int128 v10;
  NSObject *v11;
  uint8_t v13[16];
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NeuralNetworkModelWithDataTransformer;
  v8 = -[NeuralNetworkModelWithDataTransformer init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    v10 = *(_OWORD *)&a3->plan;
    v8->_neuralNetworkModel.modelNet = a3->modelNet;
    *(_OWORD *)&v8->_neuralNetworkModel.plan = v10;
    objc_storeStrong((id *)&v8->_rangeBiasEstimatorModelDataTransformer, a4);
  }
  v11 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#bias-est, Neural network espresso model initialized with data transformer.", v13, 2u);
  }

  return v9;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#bias-est, Destroying espresso plan and context for Bias estimator.", buf, 2u);
  }
  espresso_plan_destroy(self->_neuralNetworkModel.plan);
  espresso_context_destroy(self->_neuralNetworkModel.ctx);
  v4.receiver = self;
  v4.super_class = (Class)NeuralNetworkModelWithDataTransformer;
  -[NeuralNetworkModelWithDataTransformer dealloc](&v4, "dealloc");
}

- (NeuralNetworkModel)neuralNetworkModel
{
  NeuralNetworkModel *result;

  objc_copyStruct(retstr, &self->_neuralNetworkModel, 32, 1, 0);
  return result;
}

- (void)setNeuralNetworkModel:(NeuralNetworkModel *)a3
{
  objc_copyStruct(&self->_neuralNetworkModel, a3, 32, 1, 0);
}

- (RangeBiasEstimatorModelDataTransformer)rangeBiasEstimatorModelDataTransformer
{
  return (RangeBiasEstimatorModelDataTransformer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRangeBiasEstimatorModelDataTransformer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeBiasEstimatorModelDataTransformer, 0);
}

@end
