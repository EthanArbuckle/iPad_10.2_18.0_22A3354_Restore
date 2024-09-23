@implementation iRATBW

+ (id)URLOfModelInThisBundle
{
  NSString *v2;

  v2 = -[NSBundle pathForResource:ofType:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1)), "pathForResource:ofType:", CFSTR("iRATBW"), CFSTR("mlmodelc"));
  if (v2)
    return +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v2);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10012EDB8();
  return 0;
}

- (iRATBW)initWithMLModel:(id)a3
{
  iRATBW *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)iRATBW;
  result = -[iRATBW init](&v5, "init");
  if (result)
  {
    result->_model = (MLModel *)a3;
    if (!a3)
      return 0;
  }
  return result;
}

- (iRATBW)init
{
  return -[iRATBW initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle"), 0);
}

- (iRATBW)initWithConfiguration:(id)a3 error:(id *)a4
{
  return -[iRATBW initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle"), a3, a4);
}

- (iRATBW)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  iRATBW *result;

  result = (iRATBW *)objc_msgSend((id)sub_1000BCA10(), "modelWithContentsOfURL:error:", a3, a4);
  if (result)
    return -[iRATBW initWithMLModel:](self, "initWithMLModel:", result);
  return result;
}

- (iRATBW)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  iRATBW *result;

  result = (iRATBW *)objc_msgSend((id)sub_1000BCA10(), "modelWithContentsOfURL:configuration:error:", a3, a4, a5);
  if (result)
    return -[iRATBW initWithMLModel:](self, "initWithMLModel:", result);
  return result;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  objc_class *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_1000BCEC0;
  v14 = sub_1000BCED0;
  v7 = (objc_class *)qword_100271358;
  v15 = qword_100271358;
  if (!qword_100271358)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000BD028;
    v9[3] = &unk_100201B40;
    v9[4] = &v10;
    sub_1000BD028((uint64_t)v9);
    v7 = (objc_class *)v11[5];
  }
  _Block_object_dispose(&v10, 8);
  return -[iRATBW predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", a3, objc_alloc_init(v7), a4);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v5;
  iRATBWOutput *v6;

  v5 = -[MLModel predictionFromFeatures:options:error:](self->_model, "predictionFromFeatures:options:error:", a3, a4, a5);
  v6 = [iRATBWOutput alloc];
  objc_msgSend(objc_msgSend(v5, "featureValueForName:", CFSTR("actualLowBandwidth_d")), "doubleValue");
  return -[iRATBWOutput initWithActualLowBandwidth_d:](v6, "initWithActualLowBandwidth_d:");
}

- (id)predictionFromCca:(double)a3 weighted_average_phyrate_rx:(double)a4 weighted_average_rssi:(double)a5 weighted_average_snr:(double)a6 maxOfActualLowBandwidth_d:(double)a7 tcpRTTAvg:(double)a8 wifChannelType:(double)a9 wifiguardinterval:(double)a10 isWfiCaptive:(double)a11 wifinumberOfSpatialStreams:(double)a12 error:(id *)a13
{
  return -[iRATBW predictionFromFeatures:error:](self, "predictionFromFeatures:error:", -[iRATBWInput initWithCca:weighted_average_phyrate_rx:weighted_average_rssi:weighted_average_snr:maxOfActualLowBandwidth_d:tcpRTTAvg:wifChannelType:wifiguardinterval:isWfiCaptive:wifinumberOfSpatialStreams:]([iRATBWInput alloc], "initWithCca:weighted_average_phyrate_rx:weighted_average_rssi:weighted_average_snr:maxOfActualLowBandwidth_d:tcpRTTAvg:wifChannelType:wifiguardinterval:isWfiCaptive:wifinumberOfSpatialStreams:", a3, a4, a5, a6, a7, a8, a9, a10, *(_QWORD *)&a11, *(_QWORD *)&a12), a13);
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  objc_class *v9;
  id v10;
  NSMutableArray *v11;
  uint64_t v12;
  id v13;
  iRATBWOutput *v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = sub_1000BCEC0;
  v21 = sub_1000BCED0;
  v9 = (objc_class *)qword_100271360;
  v22 = qword_100271360;
  if (!qword_100271360)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000BD07C;
    v16[3] = &unk_100201B40;
    v16[4] = &v17;
    sub_1000BD07C((uint64_t)v16);
    v9 = (objc_class *)v18[5];
  }
  _Block_object_dispose(&v17, 8);
  v10 = -[MLModel predictionsFromBatch:options:error:](self->_model, "predictionsFromBatch:options:error:", objc_msgSend([v9 alloc], "initWithFeatureProviderArray:", a3), a4, a5);
  v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count"));
  if ((uint64_t)objc_msgSend(v10, "count") >= 1)
  {
    v12 = 0;
    do
    {
      v13 = objc_msgSend(v10, "featuresAtIndex:", v12);
      v14 = [iRATBWOutput alloc];
      objc_msgSend(objc_msgSend(v13, "featureValueForName:", CFSTR("actualLowBandwidth_d")), "doubleValue");
      -[NSMutableArray addObject:](v11, "addObject:", -[iRATBWOutput initWithActualLowBandwidth_d:](v14, "initWithActualLowBandwidth_d:"));
      ++v12;
    }
    while (v12 < (uint64_t)objc_msgSend(v10, "count"));
  }
  return v11;
}

- (MLModel)model
{
  return self->_model;
}

@end
