@implementation BackgroundFeedbackUploader

- (BackgroundFeedbackUploader)initWithUploadStepObserver:(id)a3
{
  id v4;
  BackgroundFeedbackUploader *v5;
  RAPCorrectionsStorage *v6;
  RAPCorrectionsStorage *correctionsStorage;
  RAPImageStorage *v8;
  RAPImageStorage *imageStorage;
  RAPImageResponseStorage *v10;
  RAPImageResponseStorage *imageResponseStorage;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *sessionQueue;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BackgroundFeedbackUploader;
  v5 = -[BackgroundFeedbackUploader init](&v17, "init");
  if (v5)
  {
    v6 = objc_alloc_init(RAPCorrectionsStorage);
    correctionsStorage = v5->_correctionsStorage;
    v5->_correctionsStorage = v6;

    v8 = -[RAPImageStorage initWithDelegate:]([RAPImageStorage alloc], "initWithDelegate:", v5);
    imageStorage = v5->_imageStorage;
    v5->_imageStorage = v8;

    v10 = objc_alloc_init(RAPImageResponseStorage);
    imageResponseStorage = v5->_imageResponseStorage;
    v5->_imageResponseStorage = v10;

    objc_storeWeak((id *)&v5->_uploadStepObserver, v4);
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("BackgroundFeedbackUploader.sessionQueue", v13);
    sessionQueue = v5->_sessionQueue;
    v5->_sessionQueue = (OS_dispatch_queue *)v14;

  }
  return v5;
}

- (void)submitCorrectionsRequest:(id)a3 traits:(id)a4 parentProgress:(id)a5 completion:(id)a6
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;

  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "feedbackRequestParameters"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "submissionParameters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientSubmissionUuid"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "feedbackRequestParameters"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "submissionParameters"));
  v15 = objc_msgSend(v14, "hasClientSubmissionUuid");

  if (v15 && v12)
  {
    if (-[BackgroundFeedbackUploader _saveCorrections:submissionIdentifier:addARPCHeaders:](self, "_saveCorrections:submissionIdentifier:addARPCHeaders:", v8, v12, 1))
    {
      -[BackgroundFeedbackUploader _dispatchCorrectionsUploadForSubmissionIdentifier:newRetryCount:isPOIEnrichment:](self, "_dispatchCorrectionsUploadForSubmissionIdentifier:newRetryCount:isPOIEnrichment:", v12, 0, objc_msgSend(v8, "isPOIEnrichment"));
      v16 = 0;
      if (!v9)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else
  {
    v17 = sub_100431FFC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "feedbackRequestParameters"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "submissionParameters"));
      v21 = 138412290;
      v22 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "submissionIdentifier is nil, please check submissionParameters: %@", (uint8_t *)&v21, 0xCu);

    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FeedbackSubmissionManager failedToEnqueueSubmissionError](FeedbackSubmissionManager, "failedToEnqueueSubmissionError"));
  if (v9)
LABEL_10:
    v9[2](v9, 0, v16);
LABEL_11:

}

- (void)submitPhotosWithMetadata:(id)a3 withImageUploadResult:(id)a4 withCorrectionsRequest:(id)a5 traits:(id)a6 parentProgress:(id)a7 completion:(id)a8
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned __int8 v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void (**v38)(id, _QWORD, void *);
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, _QWORD, void *))a8;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "feedbackRequestParameters"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "submissionParameters"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientSubmissionUuid"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "feedbackRequestParameters"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "submissionParameters"));
  v21 = objc_msgSend(v20, "hasClientSubmissionUuid");

  if (!v21 || !v18)
  {
    v34 = sub_100431FFC();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "feedbackRequestParameters"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "submissionParameters"));
      *(_DWORD *)buf = 138412290;
      v47 = v37;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "submissionIdentifier is nil, please check submissionParameters: %@", buf, 0xCu);

    }
LABEL_17:
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[FeedbackSubmissionManager failedToEnqueueSubmissionError](FeedbackSubmissionManager, "failedToEnqueueSubmissionError"));
    if (!v15)
      goto LABEL_19;
LABEL_18:
    v15[2](v15, 0, v33);
    goto LABEL_19;
  }
  v22 = -[BackgroundFeedbackUploader _saveAttachedImages:andUpdateCorrectionsRequest:withImageUploadInfoResult:submissionIdentifier:](self, "_saveAttachedImages:andUpdateCorrectionsRequest:withImageUploadInfoResult:submissionIdentifier:", v12, v14, v13, v18);
  v23 = -[BackgroundFeedbackUploader _saveCorrections:submissionIdentifier:addARPCHeaders:](self, "_saveCorrections:submissionIdentifier:addARPCHeaders:", v14, v18, 0);
  if (!v22 || (v23 & 1) == 0)
    goto LABEL_17;
  v38 = v15;
  v39 = v13;
  v40 = v12;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageUploadInfos"));
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "imageUploadUrl"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "clientImageUuid"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "imageUploadHttpMethod"));
        -[BackgroundFeedbackUploader _dispatchImageUploadForImageURL:submissionIdentifier:clientImageIdentifier:httpType:newRetryCount:](self, "_dispatchImageUploadForImageURL:submissionIdentifier:clientImageIdentifier:httpType:newRetryCount:", v30, v18, v31, v32, 0);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v26);
  }

  v33 = 0;
  v13 = v39;
  v12 = v40;
  v15 = v38;
  if (v38)
    goto LABEL_18;
LABEL_19:

}

- (BOOL)_saveCorrections:(id)a3 submissionIdentifier:(id)a4 addARPCHeaders:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  id v25;
  uint8_t buf[4];
  id v27;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));
  v11 = v10;
  if (!v5)
  {
    v13 = v10;
    goto LABEL_7;
  }
  v25 = v10;
  v12 = GEOCreateBodyDataForProtocolBufferRequest(v8, 2853, 0, &v25);
  v13 = v25;

  v14 = sub_100431FFC();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Successfully created data for protobuf %@", buf, 0xCu);
    }

LABEL_7:
    v17 = -[RAPCorrectionsStorage saveCorrections:forSubmissionIdentifier:](self->_correctionsStorage, "saveCorrections:forSubmissionIdentifier:", v13, v9);
    v18 = sub_100431FFC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        v21 = "Successfully saved protobuf to disk %@";
        v22 = v20;
        v23 = OS_LOG_TYPE_INFO;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v22, v23, v21, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v9;
      v21 = "Failed to save protobuf to disk %@";
      v22 = v20;
      v23 = OS_LOG_TYPE_ERROR;
      goto LABEL_12;
    }

    +[UGCSubmissionStorage setMUIDAndSubmissionIdentifierWithCorrectionsRequest:](UGCSubmissionStorage, "setMUIDAndSubmissionIdentifierWithCorrectionsRequest:", v8);
    goto LABEL_17;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to add ARPC headers for protobuf %@", buf, 0xCu);
  }

  LOBYTE(v17) = 0;
LABEL_17:

  return v17;
}

- (BOOL)_saveAttachedImages:(id)a3 andUpdateCorrectionsRequest:(id)a4 withImageUploadInfoResult:(id)a5 submissionIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1006396B8;
  v15[3] = &unk_1011BEBA0;
  v15[4] = self;
  v13 = a6;
  v16 = v13;
  v17 = &v18;
  objc_msgSend(v12, "enumerateAndMatchPhotosWithMetadata:withBlock:", v10, v15);
  LOBYTE(self) = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return (char)self;
}

+ (id)resubmissionDateWithRetryCount:(int64_t)a3
{
  long double Double;
  double v5;
  void *v6;
  void *v7;

  Double = GEOConfigGetDouble(MapsConfig_RAPSubmitterBackoffFactor, off_1014B41A8);
  v5 = pow(Double, (double)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", v5));

  return v7;
}

- (void)updateEventsForBackgroundURLSessionWithCompletionHandler:(id)a3
{
  id v3;
  _QWORD v4[4];
  BackgroundFeedbackUploader *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10063991C;
  v4[3] = &unk_1011BEBF0;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[BackgroundFeedbackUploader getSessionWithCompletionHandler:](v5, "getSessionWithCompletionHandler:", v4);

}

- (void)getSessionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *sessionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100639C74;
  v7[3] = &unk_1011AE240;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sessionQueue, v7);

}

- (void)imageStorage:(id)a3 didFinishRemovingAllImagesForClientSubmissionIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  id WeakRetained;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = sub_100431FFC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Removed all image storage for %@", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCorrectionsStorage correctionsDataForSubmissionIdentifier:](self->_correctionsStorage, "correctionsDataForSubmissionIdentifier:", v7));
  v11 = objc_msgSend(objc_alloc((Class)GEORPFeedbackRequest), "initWithData:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPImageResponseStorage fetchImageUploadObjectsForSubmissionIdentifier:](self->_imageResponseStorage, "fetchImageUploadObjectsForSubmissionIdentifier:", v7));
  v13 = sub_100431FFC();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 134217984;
    v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Received %lu number of image upload data", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_uploadStepObserver);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100639F54;
  v18[3] = &unk_1011BEC18;
  objc_copyWeak(&v20, (id *)buf);
  v17 = v7;
  v19 = v17;
  objc_msgSend(WeakRetained, "finishedUploadingImagesWithImageUpdate:correctionsRequest:completion:", v12, v11, v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "taskDescription"));
  v10 = sub_100788894(v9);

  if (v10 == 2)
  {
    -[BackgroundFeedbackUploader _handleCorrectionsUploadTask:withSessionError:](self, "_handleCorrectionsUploadTask:withSessionError:", v7, v8);
  }
  else if (v10 == 1)
  {
    -[BackgroundFeedbackUploader _handleImageUploadTask:withSessionError:](self, "_handleImageUploadTask:withSessionError:", v7, v8);
  }
  else
  {
    v11 = sub_100431FFC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "taskDescription"));
      v14 = 138412290;
      v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to submit task with description %@", (uint8_t *)&v14, 0xCu);

    }
  }

}

- (void)_handleImageUploadTask:(id)a3 withSessionError:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  __CFString *v22;
  unsigned int v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  __CFString *v34;
  uint64_t v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  uint64_t v39;
  uint8_t buf[4];
  __CFString *v41;
  __int16 v42;
  NSObject *v43;
  __int16 v44;
  uint64_t v45;

  v6 = a3;
  v7 = a4;
  v39 = -1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskDescription"));
  v37 = &stru_1011EB268;
  v38 = &stru_1011EB268;
  v36 = CFSTR("PUT");
  v9 = sub_100788A44(v8, &v38, &v37, &v36, &v39);
  v10 = v38;
  v11 = v37;
  v12 = v36;

  if ((v9 & 1) != 0)
  {
    v13 = v39 + 1;
    v14 = sub_100431FFC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v41 = v10;
      v42 = 2112;
      v43 = v11;
      v44 = 2048;
      v45 = v39;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "An image upload task with client uuid %@ and image uuid %@ completed and number of retries %ld", buf, 0x20u);
    }

    if (v7)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originalRequest"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URL"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "absoluteString"));

      v19 = sub_100431FFC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v41 = (__CFString *)v18;
        v42 = 2112;
        v43 = v7;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Image upload task failed to submit to url %@ with error %@", buf, 0x16u);
      }

      -[BackgroundFeedbackUploader _handleImageResubmissionWithUploadURL:submissionIdentifier:imageIdentifier:httpType:newRetryCount:](self, "_handleImageResubmissionWithUploadURL:submissionIdentifier:imageIdentifier:httpType:newRetryCount:", v18, v10, v11, v12, v13);
      goto LABEL_21;
    }
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "response"));
    if (!+[FeedbackSubmissionManager isStatusCodeSuccess:](FeedbackSubmissionManager, "isStatusCodeSuccess:", -[NSObject statusCode](v18, "statusCode")))
    {
      v35 = v13;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originalRequest"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "URL"));
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "absoluteString"));

      v32 = sub_100431FFC();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = (__CFString *)-[NSObject statusCode](v18, "statusCode");
        *(_DWORD *)buf = 134218242;
        v41 = v34;
        v42 = 2112;
        v43 = v26;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Status code error for %lu for image url %@, so dispatching again", buf, 0x16u);
      }

      -[BackgroundFeedbackUploader _handleImageResubmissionWithUploadURL:submissionIdentifier:imageIdentifier:httpType:newRetryCount:](self, "_handleImageResubmissionWithUploadURL:submissionIdentifier:imageIdentifier:httpType:newRetryCount:", v26, v10, v11, v12, v35);
      goto LABEL_20;
    }
    -[BackgroundFeedbackUploader _logResponse:](self, "_logResponse:", v18);
    v23 = -[RAPImageStorage removeImageForSubmissionIdentifier:imageIdentifier:](self->_imageStorage, "removeImageForSubmissionIdentifier:imageIdentifier:", v10, v11);
    v24 = sub_100431FFC();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = v25;
    if (v23)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v11;
        v27 = "Successfully deleted image %@";
        v28 = v26;
        v29 = OS_LOG_TYPE_INFO;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v28, v29, v27, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v11;
      v27 = "Failed to delete image %@";
      v28 = v26;
      v29 = OS_LOG_TYPE_ERROR;
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_21;
  }
  v21 = sub_100431FFC();
  v18 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskDescription"));
    *(_DWORD *)buf = 138412290;
    v41 = v22;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to parse task description %@", buf, 0xCu);

  }
LABEL_21:

}

- (void)_handleImageResubmissionWithUploadURL:(id)a3 submissionIdentifier:(id)a4 imageIdentifier:(id)a5 httpType:(id)a6 newRetryCount:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[RAPImageStorage filePathForSubmissionIdentifier:imageIdentifier:](RAPImageStorage, "filePathForSubmissionIdentifier:imageIdentifier:", v14, v13));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BackgroundFeedbackUploader resubmissionDateWithRetryCount:](BackgroundFeedbackUploader, "resubmissionDateWithRetryCount:", a7));
  if (+[RAPFileManager haveContentsOfFilePathExpired:withSuggestedRetryDate:](RAPFileManager, "haveContentsOfFilePathExpired:withSuggestedRetryDate:", v15, v16))
  {
    -[RAPImageStorage removeImageForSubmissionIdentifier:imageIdentifier:](self->_imageStorage, "removeImageForSubmissionIdentifier:imageIdentifier:", v14, v13);
  }
  else
  {
    -[BackgroundFeedbackUploader _dispatchImageUploadForImageURL:submissionIdentifier:clientImageIdentifier:httpType:newRetryCount:](self, "_dispatchImageUploadForImageURL:submissionIdentifier:clientImageIdentifier:httpType:newRetryCount:", v17, v14, v13, v12, a7);
  }

}

- (void)_handleCorrectionsUploadTask:(id)a3 withSessionError:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  char v9;
  __CFString *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  unsigned int v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  __CFString *v27;
  uint64_t v28;
  uint8_t buf[4];
  __CFString *v30;

  v6 = a3;
  v7 = (__CFString *)a4;
  v28 = -1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskDescription"));
  v27 = &stru_1011EB268;
  v9 = sub_100788BD0(v8, &v27, &v28);
  v10 = v27;

  v11 = sub_100431FFC();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Submission Finished... Received a corrections upload task %@", buf, 0xCu);
  }

  if ((v9 & 1) != 0)
  {
    v13 = v28 + 1;
    if (v7)
    {
      v14 = sub_100431FFC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Corrections upload task failed with error %@", buf, 0xCu);
      }

      -[BackgroundFeedbackUploader _handleCorrectionsResubmissionWithSubmissionIdentifier:newRetryCount:](self, "_handleCorrectionsResubmissionWithSubmissionIdentifier:newRetryCount:", v10, v13);
      goto LABEL_21;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "response"));
    -[BackgroundFeedbackUploader _logResponse:](self, "_logResponse:", v19);
    if (!+[FeedbackSubmissionManager isStatusCodeSuccess:](FeedbackSubmissionManager, "isStatusCodeSuccess:", objc_msgSend(v19, "statusCode")))
    {
      -[BackgroundFeedbackUploader _handleCorrectionsResubmissionWithSubmissionIdentifier:newRetryCount:](self, "_handleCorrectionsResubmissionWithSubmissionIdentifier:newRetryCount:", v10, v13);
LABEL_20:

      goto LABEL_21;
    }
    v20 = -[RAPCorrectionsStorage removeCorrectionDataForSubmissionIdentifier:](self->_correctionsStorage, "removeCorrectionDataForSubmissionIdentifier:", v10);
    v21 = sub_100431FFC();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = v22;
    if (v20)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v10;
        v24 = "Successfully deleted corrections object %@";
        v25 = v23;
        v26 = OS_LOG_TYPE_INFO;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v25, v26, v24, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v10;
      v24 = "Failed to delete corrections object %@";
      v25 = v23;
      v26 = OS_LOG_TYPE_ERROR;
      goto LABEL_18;
    }

    goto LABEL_20;
  }
  v16 = sub_100431FFC();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskDescription"));
    *(_DWORD *)buf = 138412290;
    v30 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to parse task description %@", buf, 0xCu);

  }
LABEL_21:

}

- (void)_handleCorrectionsResubmissionWithSubmissionIdentifier:(id)a3 newRetryCount:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  RAPCorrectionsStorage *correctionsStorage;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  const char *v25;
  uint8_t *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  objc_class *v47;
  id v48;
  uint8_t buf[16];
  uint8_t v50[16];
  uint8_t v51[2];
  __int16 v52;
  uint8_t v53[16];
  uint8_t v54[16];
  uint8_t v55[16];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCorrectionsStorage pathForFeedbackRequestForSubmissionIdentifier:](RAPCorrectionsStorage, "pathForFeedbackRequestForSubmissionIdentifier:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BackgroundFeedbackUploader resubmissionDateWithRetryCount:](BackgroundFeedbackUploader, "resubmissionDateWithRetryCount:", a4));
  v9 = +[RAPFileManager haveContentsOfFilePathExpired:withSuggestedRetryDate:](RAPFileManager, "haveContentsOfFilePathExpired:withSuggestedRetryDate:", v7, v8);
  correctionsStorage = self->_correctionsStorage;
  if (!v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCorrectionsStorage correctionsDataForSubmissionIdentifier:](correctionsStorage, "correctionsDataForSubmissionIdentifier:", v6));
    v47 = (objc_class *)objc_opt_class(GEORPFeedbackRequest);
    v12 = v11;
    v13 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v12);
    if (objc_msgSend(v13, "readBigEndianFixed16")
      && objc_msgSend(v13, "readBigEndianFixed32"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "readProtoBuffer"));
      v15 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v14);
      if ((-[objc_class isValid:](v47, "isValid:", v13) & 1) != 0)
      {
        v16 = objc_alloc_init(v47);
        objc_msgSend(v16, "readFrom:", v15);
LABEL_40:

        -[BackgroundFeedbackUploader _dispatchCorrectionsUploadForSubmissionIdentifier:newRetryCount:isPOIEnrichment:](self, "_dispatchCorrectionsUploadForSubmissionIdentifier:newRetryCount:isPOIEnrichment:", v6, a4, objc_msgSend(v16, "isPOIEnrichment"));
        goto LABEL_41;
      }
      v48 = v14;
      v45 = v12;
      v28 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v45);
      v29 = GEOAlwaysUseV2PreambleForRequestKind(2853);
      v30 = GEOProtocolBufferRequestPreamble(0, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v32 = objc_msgSend(v28, "readBytes:", objc_msgSend(v31, "length"));

      v44 = v28;
      if (objc_msgSend(v28, "hasError"))
      {
        v33 = sub_100431FFC();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v55 = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to parse the preamble (ARP)", v55, 2u);
        }
        v16 = 0;
      }
      else
      {
        objc_msgSend(v28, "readBigEndianFixed32");
        if (objc_msgSend(v28, "hasError"))
        {
          v36 = sub_100431FFC();
          v34 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v54 = 0;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to parse request type (ARP)", v54, 2u);
          }
          v16 = 0;
        }
        else
        {
          v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "readProtoBuffer"));
          v42 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v43);
          if ((-[objc_class isValid:](v47, "isValid:", v28) & 1) != 0)
          {
            v16 = objc_alloc_init(v47);
            objc_msgSend(v16, "readFrom:", v42);
            v39 = v42;
            v34 = v43;
          }
          else
          {
            v40 = sub_100431FFC();
            v41 = objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v53 = 0;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failed to parse the data (ARP)", v53, 2u);
            }

            v16 = 0;
            v39 = v42;
            v34 = v43;
          }

        }
      }

LABEL_39:
      v14 = v48;
      goto LABEL_40;
    }
    v17 = sub_100431FFC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to parse the preamble", buf, 2u);
    }

    v48 = v12;
    v15 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v48);
    v19 = GEOAlwaysUseV2PreambleForRequestKind(2853);
    v20 = GEOProtocolBufferRequestPreamble(0, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = objc_msgSend(v15, "readBytes:", objc_msgSend(v21, "length"));

    if (objc_msgSend(v15, "hasError"))
    {
      v23 = sub_100431FFC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v52 = 0;
        v25 = "Failed to parse the preamble (ARP)";
        v26 = (uint8_t *)&v52;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v25, v26, 2u);
      }
    }
    else
    {
      objc_msgSend(v15, "readBigEndianFixed32");
      if (!objc_msgSend(v15, "hasError"))
      {
        v46 = v13;
        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "readProtoBuffer"));
        v35 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v24);
        if ((-[objc_class isValid:](v47, "isValid:", v15) & 1) != 0)
        {
          v16 = objc_alloc_init(v47);
          objc_msgSend(v16, "readFrom:", v35);
        }
        else
        {
          v37 = sub_100431FFC();
          v38 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v50 = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to parse the data (ARP)", v50, 2u);
          }

          v16 = 0;
        }

        v13 = v46;
        goto LABEL_31;
      }
      v27 = sub_100431FFC();
      v24 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v51 = 0;
        v25 = "Failed to parse request type (ARP)";
        v26 = v51;
        goto LABEL_15;
      }
    }
    v16 = 0;
LABEL_31:

    goto LABEL_39;
  }
  -[RAPCorrectionsStorage removeCorrectionDataForSubmissionIdentifier:](correctionsStorage, "removeCorrectionDataForSubmissionIdentifier:", v6);
LABEL_41:

}

- (void)_logResponse:(id)a3
{
  id v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  id v12;

  v3 = a3;
  v4 = +[FeedbackSubmissionManager isStatusCodeSuccess:](FeedbackSubmissionManager, "isStatusCodeSuccess:", objc_msgSend(v3, "statusCode"));
  v5 = sub_100431FFC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 134217984;
      v12 = objc_msgSend(v3, "statusCode");
      v8 = "The status code is good %lu";
      v9 = v7;
      v10 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v11 = 134217984;
    v12 = objc_msgSend(v3, "statusCode");
    v8 = "The status code is bad and we cannot recover %lu";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

}

- (void)_dispatchImageUploadForImageURL:(id)a3 submissionIdentifier:(id)a4 clientImageIdentifier:(id)a5 httpType:(id)a6 newRetryCount:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[RAPImageStorage filePathForSubmissionIdentifier:imageIdentifier:](RAPImageStorage, "filePathForSubmissionIdentifier:imageIdentifier:", v13, v14));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v17));

  objc_msgSend(v18, "setHTTPMethod:", v15);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10063B13C;
  v25[3] = &unk_1011BEC40;
  v26 = v18;
  v27 = v16;
  v28 = v13;
  v29 = v14;
  v31 = v12;
  v32 = a7;
  v30 = v15;
  v19 = v12;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  v23 = v16;
  v24 = v18;
  -[BackgroundFeedbackUploader getSessionWithCompletionHandler:](self, "getSessionWithCompletionHandler:", v25);

}

- (void)_dispatchCorrectionsUploadForSubmissionIdentifier:(id)a3 newRetryCount:(int64_t)a4 isPOIEnrichment:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  int64_t v29;
  uint8_t buf[4];
  void *v31;

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCorrectionsStorage pathForFeedbackRequestForSubmissionIdentifier:](RAPCorrectionsStorage, "pathForFeedbackRequestForSubmissionIdentifier:", v8));
  if (v5)
    v10 = 53;
  else
    v10 = 42;
  v11 = sub_100431FFC();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v14 = GEOURLString(v10, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138412290;
    v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Choosing url %@", buf, 0xCu);

  }
  v17 = GEOGetURL(v10, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v18));
  objc_msgSend(v19, "setHTTPMethod:", CFSTR("POST"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10063B450;
  v24[3] = &unk_1011BEC68;
  v25 = v19;
  v26 = v9;
  v28 = v18;
  v29 = a4;
  v27 = v8;
  v20 = v18;
  v21 = v8;
  v22 = v9;
  v23 = v19;
  -[BackgroundFeedbackUploader getSessionWithCompletionHandler:](self, "getSessionWithCompletionHandler:", v24);

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "taskDescription"));
  v10 = sub_100431FFC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14 = 134218242;
    v15 = objc_msgSend(v7, "length");
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Did receive data of length %lu from task with description identifier %@", (uint8_t *)&v14, 0x16u);
  }

  v12 = sub_100788894(v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "response"));

  if (v12 == 2)
  {
    -[BackgroundFeedbackUploader _handleCorrectionsResponse:withData:withTaskDescription:](self, "_handleCorrectionsResponse:withData:withTaskDescription:", v13, v7, v9);
  }
  else if (v12 == 1)
  {
    -[BackgroundFeedbackUploader _handleImageUploadResponse:withData:withTaskDescription:](self, "_handleImageUploadResponse:withData:withTaskDescription:", v13, v7, v9);
  }

}

- (void)_handleImageUploadResponse:(id)a3 withData:(id)a4 withTaskDescription:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  unsigned int v23;
  id v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint32_t v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  NSObject *v36;
  __int16 v37;
  id v38;

  v8 = a4;
  v9 = a5;
  if (+[FeedbackSubmissionManager isStatusCodeSuccess:](FeedbackSubmissionManager, "isStatusCodeSuccess:", objc_msgSend(a3, "statusCode")))
  {
    v34 = 0;
    v10 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v8, 0, &v34));
    v11 = v34;
    v12 = sub_100431FFC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Did receive json object", buf, 2u);
    }

    v14 = sub_100431FFC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    if (v11)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v11;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to parse json object with error %@.  Probably means that we shouldn't include this in the final submission.  Bailing...", buf, 0xCu);
      }
      goto LABEL_22;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Did receive json object %@", buf, 0xCu);
    }

    v32 = 0;
    v33 = -1;
    v30 = 0;
    v31 = 0;
    v17 = sub_100788A44(v9, &v32, &v31, &v30, &v33);
    v16 = v32;
    v18 = v31;
    v19 = v30;
    v20 = sub_100431FFC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = v21;
    if (v17)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Successfully parsed image upload task description for CloudKit receipt response", buf, 2u);
      }

      v23 = -[RAPImageResponseStorage saveResponseData:forSubmissionIdentifier:imageIdentifier:](self->_imageResponseStorage, "saveResponseData:forSubmissionIdentifier:imageIdentifier:", v8, v16, v18);
      v24 = sub_100431FFC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      v22 = v25;
      if (v23)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v36 = v16;
          v37 = 2112;
          v38 = v18;
          v26 = "Successfully saved CloudKit receipt for submission identifier %@ and image identifier %@";
          v27 = v22;
          v28 = OS_LOG_TYPE_INFO;
LABEL_19:
          v29 = 22;
          goto LABEL_20;
        }
      }
      else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v16;
        v37 = 2112;
        v38 = v18;
        v26 = "Failed to save CloudKit receipt for submission identifier %@ and image identifier %@";
        v27 = v22;
        v28 = OS_LOG_TYPE_ERROR;
        goto LABEL_19;
      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Failed to parse image upload task description for CloudKit receipt response";
      v27 = v22;
      v28 = OS_LOG_TYPE_ERROR;
      v29 = 2;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v27, v28, v26, buf, v29);
    }

LABEL_22:
  }

}

- (void)_handleCorrectionsResponse:(id)a3 withData:(id)a4 withTaskDescription:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  const char *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  const char *v34;
  id v35;
  id v36;
  id v37;
  NSObject *v38;
  id v39;
  id v40;
  NSObject *v41;
  __CFString *v42;
  void *v43;
  objc_class *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  NSObject *v57;
  const char *v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  NSObject *v66;
  const char *v67;
  id v68;
  id v69;
  id v70;
  NSObject *v71;
  id v72;
  NSObject *v73;
  id v74;
  NSObject *v75;
  BackgroundFeedbackUploader *v76;
  unsigned int v77;
  void *v78;
  id WeakRetained;
  id v80;
  id v81;
  id v82;
  BackgroundFeedbackUploader *v83;
  __CFString *v84;
  uint8_t buf[16];
  uint8_t v86[4];
  unsigned int v87;

  v8 = a4;
  v9 = a5;
  if (!+[FeedbackSubmissionManager isStatusCodeSuccess:](FeedbackSubmissionManager, "isStatusCodeSuccess:", objc_msgSend(a3, "statusCode")))goto LABEL_80;
  v10 = (objc_class *)objc_opt_class(GEORPFeedbackResponse);
  v82 = v8;
  v11 = v8;
  v12 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v11);
  v83 = self;
  if (!objc_msgSend(v12, "readBigEndianFixed16")
    || !objc_msgSend(v12, "readBigEndianFixed32"))
  {
    v16 = sub_100431FFC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to parse the preamble", buf, 2u);
    }

    v13 = v11;
    v14 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v13);
    v18 = GEOAlwaysUseV2PreambleForRequestKind(2853);
    v19 = GEOProtocolBufferRequestPreamble(0, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = objc_msgSend(v14, "readBytes:", objc_msgSend(v20, "length"));

    if (objc_msgSend(v14, "hasError"))
    {
      v22 = sub_100431FFC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v24 = "Failed to parse the preamble (ARP)";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v14, "readBigEndianFixed32");
      if (!objc_msgSend(v14, "hasError"))
      {
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "readProtoBuffer"));
        v35 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v23);
        if ((-[objc_class isValid:](v10, "isValid:", v14) & 1) != 0)
        {
          v15 = objc_alloc_init(v10);
          objc_msgSend(v15, "readFrom:", v35);
        }
        else
        {
          v37 = sub_100431FFC();
          v38 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to parse the data (ARP)", buf, 2u);
          }

          v15 = 0;
        }

        goto LABEL_30;
      }
      v25 = sub_100431FFC();
      v23 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v24 = "Failed to parse request type (ARP)";
        goto LABEL_14;
      }
    }
    v15 = 0;
LABEL_30:

    goto LABEL_38;
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "readProtoBuffer"));
  v14 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v13);
  if ((-[objc_class isValid:](v10, "isValid:", v12) & 1) == 0)
  {
    v26 = v11;
    v27 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v26);
    v28 = GEOAlwaysUseV2PreambleForRequestKind(2853);
    v29 = GEOProtocolBufferRequestPreamble(0, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = objc_msgSend(v27, "readBytes:", objc_msgSend(v30, "length"));

    if (objc_msgSend(v27, "hasError"))
    {
      v32 = sub_100431FFC();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v34 = "Failed to parse the preamble (ARP)";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v34, buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v27, "readBigEndianFixed32");
      if (!objc_msgSend(v27, "hasError"))
      {
        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "readProtoBuffer"));
        v39 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v33);
        if ((-[objc_class isValid:](v10, "isValid:", v27) & 1) != 0)
        {
          v15 = objc_alloc_init(v10);
          objc_msgSend(v15, "readFrom:", v39);
        }
        else
        {
          v40 = sub_100431FFC();
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failed to parse the data (ARP)", buf, 2u);
          }

          v15 = 0;
        }

        goto LABEL_37;
      }
      v36 = sub_100431FFC();
      v33 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v34 = "Failed to parse request type (ARP)";
        goto LABEL_24;
      }
    }
    v15 = 0;
LABEL_37:

    self = v83;
    goto LABEL_38;
  }
  v15 = objc_alloc_init(v10);
  objc_msgSend(v15, "readFrom:", v14);
LABEL_38:

  v84 = &stru_1011EB268;
  *(_QWORD *)buf = -1;
  sub_100788BD0(v9, &v84, buf);
  v42 = v84;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCorrectionsStorage correctionsDataForSubmissionIdentifier:](self->_correctionsStorage, "correctionsDataForSubmissionIdentifier:", v42));
  v44 = (objc_class *)objc_opt_class(GEORPFeedbackRequest);
  v45 = v43;
  v46 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v45);
  if (!objc_msgSend(v46, "readBigEndianFixed16")
    || !objc_msgSend(v46, "readBigEndianFixed32"))
  {
    v50 = sub_100431FFC();
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v86 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Failed to parse the preamble", v86, 2u);
    }

    v47 = v45;
    v48 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v47);
    v52 = GEOAlwaysUseV2PreambleForRequestKind(2853);
    v53 = GEOProtocolBufferRequestPreamble(0, v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v55 = objc_msgSend(v48, "readBytes:", objc_msgSend(v54, "length"));

    if (objc_msgSend(v48, "hasError"))
    {
      v56 = sub_100431FFC();
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v86 = 0;
        v58 = "Failed to parse the preamble (ARP)";
LABEL_50:
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, v58, v86, 2u);
      }
    }
    else
    {
      objc_msgSend(v48, "readBigEndianFixed32");
      if (!objc_msgSend(v48, "hasError"))
      {
        v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "readProtoBuffer"));
        v68 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v57);
        if ((-[objc_class isValid:](v44, "isValid:", v48) & 1) != 0)
        {
          v49 = objc_alloc_init(v44);
          objc_msgSend(v49, "readFrom:", v68);
        }
        else
        {
          v70 = sub_100431FFC();
          v71 = objc_claimAutoreleasedReturnValue(v70);
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v86 = 0;
            _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "Failed to parse the data (ARP)", v86, 2u);
          }

          v49 = 0;
        }

        goto LABEL_66;
      }
      v59 = sub_100431FFC();
      v57 = objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v86 = 0;
        v58 = "Failed to parse request type (ARP)";
        goto LABEL_50;
      }
    }
    v49 = 0;
LABEL_66:

    goto LABEL_74;
  }
  v47 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "readProtoBuffer"));
  v48 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v47);
  if ((-[objc_class isValid:](v44, "isValid:", v46) & 1) == 0)
  {
    v81 = v45;
    v60 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v81);
    v61 = GEOAlwaysUseV2PreambleForRequestKind(2853);
    v62 = GEOProtocolBufferRequestPreamble(0, v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    v64 = objc_msgSend(v60, "readBytes:", objc_msgSend(v63, "length"));

    if (objc_msgSend(v60, "hasError"))
    {
      v65 = sub_100431FFC();
      v66 = objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v86 = 0;
        v67 = "Failed to parse the preamble (ARP)";
LABEL_60:
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, v67, v86, 2u);
      }
    }
    else
    {
      objc_msgSend(v60, "readBigEndianFixed32");
      if (!objc_msgSend(v60, "hasError"))
      {
        v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "readProtoBuffer"));
        v80 = objc_msgSend(objc_alloc((Class)PBDataReader), "initWithData:", v66);
        if ((-[objc_class isValid:](v44, "isValid:", v60) & 1) != 0)
        {
          v49 = objc_alloc_init(v44);
          objc_msgSend(v49, "readFrom:", v80);
        }
        else
        {
          v72 = sub_100431FFC();
          v73 = objc_claimAutoreleasedReturnValue(v72);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v86 = 0;
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "Failed to parse the data (ARP)", v86, 2u);
          }

          v49 = 0;
        }

        goto LABEL_73;
      }
      v69 = sub_100431FFC();
      v66 = objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v86 = 0;
        v67 = "Failed to parse request type (ARP)";
        goto LABEL_60;
      }
    }
    v49 = 0;
LABEL_73:

    goto LABEL_74;
  }
  v49 = objc_alloc_init(v44);
  objc_msgSend(v49, "readFrom:", v48);
LABEL_74:

  if (objc_msgSend(v15, "status"))
  {
    v74 = sub_100431FFC();
    v75 = objc_claimAutoreleasedReturnValue(v74);
    v76 = v83;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      v77 = objc_msgSend(v15, "status");
      *(_DWORD *)v86 = 67109120;
      v87 = v77;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "Received a GEORPFeedbackResponse object with a bad status code %d", v86, 8u);
    }

    v78 = (void *)objc_claimAutoreleasedReturnValue(+[FeedbackSubmissionManager badFeedbackResponseErrorWithCode:](FeedbackSubmissionManager, "badFeedbackResponseErrorWithCode:", (int)objc_msgSend(v15, "status")));
  }
  else
  {
    +[UGCSubmissionStorage removeClientSubmissionIdentifier:](UGCSubmissionStorage, "removeClientSubmissionIdentifier:", v42);
    v78 = 0;
    v76 = v83;
  }
  WeakRetained = objc_loadWeakRetained((id *)&v76->_uploadStepObserver);
  objc_msgSend(WeakRetained, "finishedCorrectionsUploadWithResponse:request:error:", v15, v49, v78);

  v8 = v82;
LABEL_80:

}

- (FeedbackUploaderStepObserver)uploadStepObserver
{
  return (FeedbackUploaderStepObserver *)objc_loadWeakRetained((id *)&self->_uploadStepObserver);
}

- (void)setUploadStepObserver:(id)a3
{
  objc_storeWeak((id *)&self->_uploadStepObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_uploadStepObserver);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_imageResponseStorage, 0);
  objc_storeStrong((id *)&self->_imageStorage, 0);
  objc_storeStrong((id *)&self->_correctionsStorage, 0);
}

@end
