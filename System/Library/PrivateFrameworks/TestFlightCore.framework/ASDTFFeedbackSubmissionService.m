@implementation ASDTFFeedbackSubmissionService

- (unint64_t)maxNumberOfScreenshotsAllowed
{
  return 10;
}

- (unint64_t)maxNumberOfCommentSymbolsAllowed
{
  return 4000;
}

- (void)submitFeedbackForBundleId:(id)a3 withContentsOfDataSource:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)objc_msgSend(a4, "copy");
  AMSGenerateLogCorrelationKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "generatedLogger");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_opt_class();
    v15 = v14;
    objc_msgSend(v10, "debugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v49 = v14;
    v50 = 2112;
    v51 = v11;
    v52 = 2112;
    v53 = (uint64_t)v8;
    v54 = 2112;
    v55 = v16;
    _os_log_impl(&dword_2174E1000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%@] submitFeedbackForBundleId bundleId=%@ dataSource=%@", buf, 0x2Au);

  }
  v43 = 0;
  v17 = -[ASDTFFeedbackSubmissionService _verifyDataSourceIsReadyForSubmission:error:](self, "_verifyDataSourceIsReadyForSubmission:error:", v10, &v43);
  v18 = v43;
  v19 = v18;
  if (v17)
  {
    v42 = 0;
    -[ASDTFFeedbackSubmissionService _serializeFeedbackForBundleId:withContentsOfDataSource:error:](self, "_serializeFeedbackForBundleId:withContentsOfDataSource:error:", v8, v10, &v42);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v42;
    v22 = v21;
    if (v20)
    {
      objc_msgSend(MEMORY[0x24BE04600], "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "submitFeedback:withCompletionHandler:", v20, v9);

    }
    else
    {
      if (!v21)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: Data serialization failed without generating error."), objc_opt_class());
        v32 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)MEMORY[0x24BDD1540];
        v40 = (void *)v32;
        v44 = *MEMORY[0x24BDD0BA0];
        v45 = v32;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("TFErrorDomain"), 201, v33);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "generatedLogger");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = (void *)objc_opt_class();
        v41 = v36;
        objc_msgSend(v22, "localizedDescription");
        v37 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v49 = v36;
        v50 = 2112;
        v51 = v11;
        v52 = 2112;
        v53 = v37;
        v38 = (void *)v37;
        _os_log_impl(&dword_2174E1000, v35, OS_LOG_TYPE_ERROR, "%{public}@: [%@] _serializeDataSource failed error=%@", buf, 0x20u);

      }
      v9[2](v9, v22);
    }

  }
  else
  {
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: Data verification failed without generating error."), objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x24BDD1540];
      v46 = *MEMORY[0x24BDD0BA0];
      v47 = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("TFErrorDomain"), 201, v26);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "generatedLogger");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)objc_opt_class();
      v30 = v29;
      objc_msgSend(v19, "localizedDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v49 = v29;
      v50 = 2112;
      v51 = v11;
      v52 = 2112;
      v53 = (uint64_t)v31;
      _os_log_impl(&dword_2174E1000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%@] _verifyDataSourceIsReadyForSubmission failed error=%@", buf, 0x20u);

    }
    v9[2](v9, v19);
  }

}

- (BOOL)_verifyDataSourceIsReadyForSubmission:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "stringForIdentifier:", CFSTR("a"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASDTFFeedbackSubmissionService _verifyEmailIsValid:](self, "_verifyEmailIsValid:", v7);
  if (v7 && !v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: Data validation failed - Provided email is malformed."), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD0BA0];
    v29[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = 302;
LABEL_6:
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("TFErrorDomain"), v13, v11);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v6, "isLoading"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: Data validation failed - Submitting data source that is still loading."), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0BA0];
    v27 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    v13 = 301;
    goto LABEL_6;
  }
  objc_msgSend(v6, "imageCollectionForIdentifer:", CFSTR("c"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForIdentifier:", CFSTR("b"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForIdentifier:", CFSTR("d"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v17 = objc_msgSend(v9, "count") != 0;
    if (v11)
      goto LABEL_9;
LABEL_12:
    v18 = 0;
    if (v16)
      goto LABEL_10;
LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
  v17 = 0;
  if (!v11)
    goto LABEL_12;
LABEL_9:
  v18 = objc_msgSend(v11, "length") != 0;
  if (!v16)
    goto LABEL_13;
LABEL_10:
  v19 = objc_msgSend(v16, "length") != 0;
LABEL_14:
  v15 = v17 || v18 || v19;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: Data validation failed - Submitting data source without comments or screenshots."), objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD0BA0];
    v25 = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("TFErrorDomain"), 303, v21);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_17:

  return v15;
}

- (BOOL)_verifyEmailIsValid:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  if (!a3)
    return 1;
  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF MATCHES %@"), CFSTR(".+@.+"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "evaluateWithObject:", v6);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)_serializeFeedbackForBundleId:(id)a3 withContentsOfDataSource:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BE04500]);
  v41 = v8;
  objc_msgSend(v10, "setBundleID:", v8);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimestamp:", objc_msgSend(v45, "tf_posixTimestampInMilliseconds"));
  objc_msgSend(v9, "stringForIdentifier:", CFSTR("a"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "stringByTrimmingCharactersInSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEmail:", v12);

  objc_msgSend(v9, "imageCollectionForIdentifer:", CFSTR("c"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    goto LABEL_9;
  v15 = objc_msgSend(v13, "count");
  if (v15 > -[ASDTFFeedbackSubmissionService maxNumberOfScreenshotsAllowed](self, "maxNumberOfScreenshotsAllowed"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: Data serialization failed for too many screenshot images."), objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDD1540];
    v57 = *MEMORY[0x24BDD0BA0];
    v58[0] = v43;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("TFErrorDomain"), 401, v42);
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

    goto LABEL_18;
  }
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__0;
  v53 = __Block_byref_object_dispose__0;
  v54 = 0;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v14, "count"));
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __95__ASDTFFeedbackSubmissionService__serializeFeedbackForBundleId_withContentsOfDataSource_error___block_invoke;
  v46[3] = &unk_24D7948C0;
  v46[4] = self;
  v48 = &v49;
  v19 = v18;
  v47 = v19;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v46);
  v20 = (void *)v50[5];
  if (v20)
    *a5 = objc_retainAutorelease(v20);
  else
    objc_msgSend(v10, "setImagesData:", v19);

  _Block_object_dispose(&v49, 8);
  if (!v20)
  {
LABEL_9:
    objc_msgSend(v9, "stringForIdentifier:", CFSTR("b"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      v21 = objc_msgSend(v43, "length");
      if (v21 > -[ASDTFFeedbackSubmissionService maxNumberOfCommentSymbolsAllowed](self, "maxNumberOfCommentSymbolsAllowed"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: Data serialization failed for too many comment symbols."), objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x24BDD1540];
        v55 = *MEMORY[0x24BDD0BA0];
        v56 = v42;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("TFErrorDomain"), 402, v39);
        v17 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
      objc_msgSend(v10, "setComments:", v43);
    }
    objc_msgSend(v9, "stringForIdentifier:", CFSTR("d"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIncidentID:", v23);

    objc_msgSend(v9, "numberForIdentifier:", CFSTR("i"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
      objc_msgSend(v10, "setAppUptime:", 1000 * objc_msgSend(v42, "unsignedLongLongValue"));
    objc_msgSend(v9, "stringForIdentifier:", CFSTR("m"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringForIdentifier:", CFSTR("n"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringForIdentifier:", CFSTR("l"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeviceType:", v40);
    objc_msgSend(v10, "setOsVersion:", v38);
    objc_msgSend(v10, "setArchitecture:", v37);
    objc_msgSend(v9, "numberForIdentifier:", CFSTR("o"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberForIdentifier:", CFSTR("p"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setScreenWidth:", objc_msgSend(v36, "unsignedIntValue"));
    objc_msgSend(v10, "setScreenHeight:", objc_msgSend(v35, "unsignedIntValue"));
    objc_msgSend(v9, "stringForIdentifier:", CFSTR("w"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringForIdentifier:", CFSTR("x"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocale:", v34);
    objc_msgSend(v10, "setTimeZone:", v33);
    objc_msgSend(v9, "stringForIdentifier:", CFSTR("t"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringForIdentifier:", CFSTR("u"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringForIdentifier:", CFSTR("v"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCarrier:", v32);
    objc_msgSend(v10, "setCellularNetworkType:", v31);
    objc_msgSend(v10, "setNetworkConnectionType:", v24);
    objc_msgSend(v9, "numberForIdentifier:", CFSTR("r"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberForIdentifier:", CFSTR("s"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDiskTotal:", objc_msgSend(v25, "unsignedLongLongValue"));
    objc_msgSend(v10, "setDiskAvailable:", objc_msgSend(v26, "unsignedLongLongValue"));
    objc_msgSend(v9, "numberForIdentifier:", CFSTR("q"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBatteryPercentage:", objc_msgSend(v27, "unsignedIntValue"));
    objc_msgSend(v9, "stringForIdentifier:", CFSTR("j"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringForIdentifier:", CFSTR("k"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPairedWatchModel:", v28);
    objc_msgSend(v10, "setPairedWatchOSVersion:", v29);
    v17 = v10;

    goto LABEL_17;
  }
  v17 = 0;
LABEL_18:

  return v17;
}

void __95__ASDTFFeedbackSubmissionService__serializeFeedbackForBundleId_withContentsOfDataSource_error___block_invoke(uint64_t a1, UIImage *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  TFImageJPEGRepresentation(a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "length") <= 0xA00000)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: Image %@ too large"), objc_opt_class(), CFSTR("(no name provided)"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD0BA0]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TFErrorDomain"), 404, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

@end
