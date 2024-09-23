@implementation WiFiStallDetect

+ (id)URLOfModelInThisBundle
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("WiFiStallDetect"), CFSTR("mlmodelc")));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load WiFiStallDetect.mlmodelc in the bundle resource", v7, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (WiFiStallDetect)initWithMLModel:(id)a3
{
  id v5;
  WiFiStallDetect *v6;
  WiFiStallDetect *v7;
  WiFiStallDetect *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)WiFiStallDetect;
    v6 = -[WiFiStallDetect init](&v10, "init");
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_model, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (WiFiStallDetect)init
{
  id v3;
  void *v4;
  WiFiStallDetect *v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[WiFiStallDetect initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v4, 0);

  return v5;
}

- (WiFiStallDetect)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  WiFiStallDetect *v9;

  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(self), "URLOfModelInThisBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[WiFiStallDetect initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v8, v6, a4);

  return v9;
}

- (WiFiStallDetect)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  WiFiStallDetect *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", a3, a4));
  if (v5)
  {
    self = -[WiFiStallDetect initWithMLModel:](self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (WiFiStallDetect)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  WiFiStallDetect *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:configuration:error:](MLModel, "modelWithContentsOfURL:configuration:error:", a3, a4, a5));
  if (v6)
  {
    self = -[WiFiStallDetect initWithMLModel:](self, "initWithMLModel:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "URLOfModelInThisBundle"));
  objc_msgSend(a1, "loadContentsOfURL:configuration:completionHandler:", v8, v7, v6);

}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v7;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000860E8;
  v8[3] = &unk_1000CDD98;
  v9 = a5;
  v7 = v9;
  +[MLModel loadContentsOfURL:configuration:completionHandler:](MLModel, "loadContentsOfURL:configuration:completionHandler:", a3, a4, v8);

}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init((Class)MLPredictionOptions);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiStallDetect predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v6, v7, a4));

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  WiFiStallDetectOutput *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  WiFiStallDetectOutput *v17;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiStallDetect model](self, "model"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v8, a5));

  if (v11)
  {
    v12 = [WiFiStallDetectOutput alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("stall")));
    v14 = objc_msgSend(v13, "int64Value");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("stallProbability")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dictionaryValue"));
    v17 = -[WiFiStallDetectOutput initWithStall:stallProbability:](v12, "initWithStall:stallProbability:", v14, v16);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiStallDetect model](self, "model"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100086380;
  v10[3] = &unk_1000CDDC0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "predictionFromFeatures:completionHandler:", v7, v10);

}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiStallDetect model](self, "model"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100086550;
  v13[3] = &unk_1000CDDC0;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "predictionFromFeatures:options:completionHandler:", v10, v9, v13);

}

- (id)predictionFromAC_problem_bitfield:(double)a3 TxBE_expiredCompletions:(double)a4 TxBE_failedCompletions:(double)a5 TxBE_noAckCompletions:(double)a6 TxBE_otherErrCompletions:(double)a7 TxBK_expiredCompletions:(double)a8 TxBK_failedCompletions:(double)a9 TxBK_noAckCompletions:(double)a10 TxBK_otherErrCompletions:(double)a11 TxVI_expiredCompletions:(double)a12 TxVI_failedCompletions:(double)a13 TxVI_noAckCompletions:(double)a14 TxVI_otherErrCompletions:(double)a15 TxVO_expiredCompletions:(double)a16 TxVO_failedCompletions:(double)a17 TxVO_noAckCompletions:(double)a18 TxVO_otherErrCompletions:(double)a19 bt_abort:(double)a20 bt_grant:(double)a21 bt_request:(double)a22 bt_uch_latency:(double)a23 cca_bin:(double)a24 completions_chipmodeerror:(double)a25 completions_expired:(double)a26 completions_internalerror:(double)a27 completions_ioerror:(double)a28 completions_noack:(double)a29 completions_nobuf:(double)a30 completions_noremotepeer:(double)a31 completions_noresources:(double)a32 completions_txfailure:(double)a33 roam_count:(double)a34 roam_duration:(double)a35 rssi_bin:(double)a36 snr_bin:(double)a37 error:(id *)a38
{
  WiFiStallDetectInput *v40;
  void *v41;

  v40 = -[WiFiStallDetectInput initWithAC_problem_bitfield:TxBE_expiredCompletions:TxBE_failedCompletions:TxBE_noAckCompletions:TxBE_otherErrCompletions:TxBK_expiredCompletions:TxBK_failedCompletions:TxBK_noAckCompletions:TxBK_otherErrCompletions:TxVI_expiredCompletions:TxVI_failedCompletions:TxVI_noAckCompletions:TxVI_otherErrCompletions:TxVO_expiredCompletions:TxVO_failedCompletions:TxVO_noAckCompletions:TxVO_otherErrCompletions:bt_abort:bt_grant:bt_request:bt_uch_latency:cca_bin:completions_chipmodeerror:completions_expired:completions_internalerror:completions_ioerror:completions_noack:completions_nobuf:completions_noremotepeer:completions_noresources:completions_txfailure:roam_count:roam_duration:rssi_bin:snr_bin:]([WiFiStallDetectInput alloc], "initWithAC_problem_bitfield:TxBE_expiredCompletions:TxBE_failedCompletions:TxBE_noAckCompletions:TxBE_otherErrCompletions:TxBK_expiredCompletions:TxBK_failedCompletions:TxBK_noAckCompletions:TxBK_otherErrCompletions:TxVI_expiredCompletions:TxVI_failedCompletions:TxVI_noAckCompletions:TxVI_otherErrCompletions:TxVO_expiredCompletions:TxVO_failedCompletions:TxVO_noAckCompletions:TxVO_otherErrCompletions:bt_abort:bt_grant:bt_request:bt_uch_latency:cca_bin:completions_chipmodeerror:completions_expired:completions_internalerror:completions_ioerror:completions_noack:completions_nobuf:completions_noremotepeer:completions_noresources:completions_txfailure:roam_count:roam_duration:rssi_bin:snr_bin:", a3, a4, a5, a6, a7, a8, a9, a10, *(_QWORD *)&a11, *(_QWORD *)&a12, *(_QWORD *)&a13,
          *(_QWORD *)&a14,
          *(_QWORD *)&a15,
          *(_QWORD *)&a16,
          *(_QWORD *)&a17,
          *(_QWORD *)&a18,
          *(_QWORD *)&a19,
          *(_QWORD *)&a20,
          *(_QWORD *)&a21,
          *(_QWORD *)&a22,
          *(_QWORD *)&a23,
          *(_QWORD *)&a24,
          *(_QWORD *)&a25,
          *(_QWORD *)&a26,
          *(_QWORD *)&a27,
          *(_QWORD *)&a28,
          *(_QWORD *)&a29,
          *(_QWORD *)&a30,
          *(_QWORD *)&a31,
          *(_QWORD *)&a32,
          *(_QWORD *)&a33,
          *(_QWORD *)&a34,
          *(_QWORD *)&a35,
          *(_QWORD *)&a36,
          *(_QWORD *)&a37);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiStallDetect predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v40, a38));

  return v41;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  WiFiStallDetectOutput *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  WiFiStallDetectOutput *v21;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)MLArrayBatchProvider), "initWithFeatureProviderArray:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiStallDetect model](self, "model"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "predictionsFromBatch:options:error:", v10, v9, a5));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v12, "count")));
    if ((uint64_t)objc_msgSend(v12, "count") >= 1)
    {
      v23 = v10;
      v24 = v9;
      v25 = v8;
      v14 = 0;
      do
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "featuresAtIndex:", v14));
        v16 = [WiFiStallDetectOutput alloc];
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "featureValueForName:", CFSTR("stall")));
        v18 = objc_msgSend(v17, "int64Value");
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "featureValueForName:", CFSTR("stallProbability")));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "dictionaryValue"));
        v21 = -[WiFiStallDetectOutput initWithStall:stallProbability:](v16, "initWithStall:stallProbability:", v18, v20);

        objc_msgSend(v13, "addObject:", v21);
        ++v14;
      }
      while (v14 < (uint64_t)objc_msgSend(v12, "count"));
      v9 = v24;
      v8 = v25;
      v10 = v23;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
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
