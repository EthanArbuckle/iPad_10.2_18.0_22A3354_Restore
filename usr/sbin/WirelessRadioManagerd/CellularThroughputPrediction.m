@implementation CellularThroughputPrediction

+ (id)URLOfModelInThisBundle
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("CellularThroughputPrediction"), CFSTR("mlmodelc")));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10012EAB0();
    v5 = 0;
  }

  return v5;
}

- (CellularThroughputPrediction)initWithMLModel:(id)a3
{
  id v5;
  CellularThroughputPrediction *v6;
  CellularThroughputPrediction *v7;
  CellularThroughputPrediction *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CellularThroughputPrediction;
  v6 = -[CellularThroughputPrediction init](&v10, "init");
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_model, a3), v7->_model))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (CellularThroughputPrediction)init
{
  id v3;
  void *v4;
  CellularThroughputPrediction *v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[CellularThroughputPrediction initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v4, 0);

  return v5;
}

- (CellularThroughputPrediction)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  CellularThroughputPrediction *v9;

  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[CellularThroughputPrediction initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v8, v6, a4);

  return v9;
}

- (CellularThroughputPrediction)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  CellularThroughputPrediction *v9;

  v6 = a3;
  v7 = objc_msgSend(sub_1000976C8(), "modelWithContentsOfURL:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    self = -[CellularThroughputPrediction initWithMLModel:](self, "initWithMLModel:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CellularThroughputPrediction)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CellularThroughputPrediction *v12;

  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(sub_1000976C8(), "modelWithContentsOfURL:configuration:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    self = -[CellularThroughputPrediction initWithMLModel:](self, "initWithMLModel:", v11);
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v7 = (void *)qword_100271218;
  v16 = qword_100271218;
  if (!qword_100271218)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100097DE8;
    v12[3] = &unk_100201B40;
    v12[4] = &v13;
    sub_100097DE8((uint64_t)v12);
    v7 = (void *)v14[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v13, 8);
  v9 = objc_alloc_init(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CellularThroughputPrediction predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v6, v9, a4));

  return v10;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v5;
  CellularThroughputPredictionOutput *v6;
  void *v7;
  CellularThroughputPredictionOutput *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MLModel predictionFromFeatures:options:error:](self->_model, "predictionFromFeatures:options:error:", a3, a4, a5));
  if (v5)
  {
    v6 = [CellularThroughputPredictionOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "featureValueForName:", CFSTR("actualLowBandwidth_d")));
    objc_msgSend(v7, "doubleValue");
    v8 = -[CellularThroughputPredictionOutput initWithActualLowBandwidth_d:](v6, "initWithActualLowBandwidth_d:");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)predictionFromMaxOfActualLowBandwidth_d:(double)a3 cellSinr:(double)a4 cellNrRSRQ:(double)a5 cellLteRSRQ:(double)a6 cellNrRSRP:(double)a7 lqmScorecellular:(double)a8 cellChannelBW:(double)a9 cellNrSNR:(double)a10 cellRsrp:(double)a11 ratType:(double)a12 cellEstimatedBW:(double)a13 cellNsaEnabled:(double)a14 cellBandInfo:(double)a15 pActualLowBandwidth:(double)a16 NRType:(double)a17 error:(id *)a18
{
  CellularThroughputPredictionInput *v20;
  void *v21;

  v20 = -[CellularThroughputPredictionInput initWithMaxOfActualLowBandwidth_d:cellSinr:cellNrRSRQ:cellLteRSRQ:cellNrRSRP:lqmScorecellular:cellChannelBW:cellNrSNR:cellRsrp:ratType:cellEstimatedBW:cellNsaEnabled:cellBandInfo:pActualLowBandwidth:NRType:]([CellularThroughputPredictionInput alloc], "initWithMaxOfActualLowBandwidth_d:cellSinr:cellNrRSRQ:cellLteRSRQ:cellNrRSRP:lqmScorecellular:cellChannelBW:cellNrSNR:cellRsrp:ratType:cellEstimatedBW:cellNsaEnabled:cellBandInfo:pActualLowBandwidth:NRType:", a3, a4, a5, a6, a7, a8, a9, a10, *(_QWORD *)&a11, *(_QWORD *)&a12, *(_QWORD *)&a13, *(_QWORD *)&a14, *(_QWORD *)&a15, *(_QWORD *)&a16, *(_QWORD *)&a17);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CellularThroughputPrediction predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v20, a18));

  return v21;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  CellularThroughputPredictionOutput *v18;
  void *v19;
  CellularThroughputPredictionOutput *v20;
  id v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v8 = a3;
  v9 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v10 = (void *)qword_100271220;
  v27 = qword_100271220;
  if (!qword_100271220)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100097E3C;
    v23[3] = &unk_100201B40;
    v23[4] = &v24;
    sub_100097E3C((uint64_t)v23);
    v10 = (void *)v25[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v24, 8);
  v12 = objc_msgSend([v11 alloc], "initWithFeatureProviderArray:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MLModel predictionsFromBatch:options:error:](self->_model, "predictionsFromBatch:options:error:", v12, v9, a5));
  v14 = v13;
  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v13, "count")));
    if ((uint64_t)objc_msgSend(v14, "count") >= 1)
    {
      v22 = v8;
      v16 = 0;
      do
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featuresAtIndex:", v16, v22));
        v18 = [CellularThroughputPredictionOutput alloc];
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "featureValueForName:", CFSTR("actualLowBandwidth_d")));
        objc_msgSend(v19, "doubleValue");
        v20 = -[CellularThroughputPredictionOutput initWithActualLowBandwidth_d:](v18, "initWithActualLowBandwidth_d:");

        objc_msgSend(v15, "addObject:", v20);
        ++v16;
      }
      while (v16 < (uint64_t)objc_msgSend(v14, "count"));
      v8 = v22;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
