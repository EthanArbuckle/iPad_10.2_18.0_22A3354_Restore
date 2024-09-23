@implementation FeedbackSubmissionManager

- (void)updateEventsForBackgroundURLSessionWithCompletionHandler:(id)a3
{
  -[BackgroundFeedbackUploader updateEventsForBackgroundURLSessionWithCompletionHandler:](self->_backgroundFeedbackUploader, "updateEventsForBackgroundURLSessionWithCompletionHandler:", a3);
}

- (FeedbackSubmissionManager)init
{
  FeedbackSubmissionManager *v2;
  InteractiveFeedbackUploader *v3;
  InteractiveFeedbackUploader *interactiveFeedbackUploader;
  BackgroundFeedbackUploader *v5;
  BackgroundFeedbackUploader *backgroundFeedbackUploader;
  FeedbackSubmissionPostActionManager *v7;
  FeedbackSubmissionPostActionManager *feedbackSubmissionPostActionManager;
  id v9;
  NSObject *v10;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FeedbackSubmissionManager;
  v2 = -[FeedbackSubmissionManager init](&v13, "init");
  if (v2)
  {
    v3 = -[InteractiveFeedbackUploader initWithUploadStepObserver:]([InteractiveFeedbackUploader alloc], "initWithUploadStepObserver:", v2);
    interactiveFeedbackUploader = v2->_interactiveFeedbackUploader;
    v2->_interactiveFeedbackUploader = v3;

    v5 = -[BackgroundFeedbackUploader initWithUploadStepObserver:]([BackgroundFeedbackUploader alloc], "initWithUploadStepObserver:", v2);
    backgroundFeedbackUploader = v2->_backgroundFeedbackUploader;
    v2->_backgroundFeedbackUploader = v5;

    v7 = objc_alloc_init(FeedbackSubmissionPostActionManager);
    feedbackSubmissionPostActionManager = v2->_feedbackSubmissionPostActionManager;
    v2->_feedbackSubmissionPostActionManager = v7;

    v9 = sub_100431FFC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Initializing FeedbackSubmissionManager...", v12, 2u);
    }

  }
  return v2;
}

- (void)submitOrEnqueueFeedback:(id)a3 attachedImages:(id)a4 userInfo:(id)a5 traits:(id)a6 uploadPolicy:(int64_t)a7 feedbackObjectToUpdate:(id)a8 completion:(id)a9
{
  -[FeedbackSubmissionManager submitOrEnqueueFeedback:attachedImages:userInfo:traits:debugSettings:uploadPolicy:feedbackObjectToUpdate:completion:](self, "submitOrEnqueueFeedback:attachedImages:userInfo:traits:debugSettings:uploadPolicy:feedbackObjectToUpdate:completion:", a3, a4, a5, a6, 0, a7, a8, a9);
}

- (void)submitOrEnqueueFeedback:(id)a3 attachedImages:(id)a4 userInfo:(id)a5 traits:(id)a6 debugSettings:(id)a7 uploadPolicy:(int64_t)a8 feedbackObjectToUpdate:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30[2];
  id location;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  if (objc_msgSend(v17, "count"))
  {
    objc_initWeak(&location, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100733AB4;
    v23[3] = &unk_1011C4F58;
    objc_copyWeak(v30, &location);
    v29 = v22;
    v24 = v16;
    v25 = v17;
    v26 = v19;
    v27 = v20;
    v30[1] = (id)a8;
    v28 = v21;
    -[FeedbackSubmissionManager _updateUserInfo:requestParameters:completion:](self, "_updateUserInfo:requestParameters:completion:", v18, v24, v23);

    objc_destroyWeak(v30);
    objc_destroyWeak(&location);
  }
  else
  {
    -[FeedbackSubmissionManager submitOrEnqueueFeedback:userInfo:traits:debugSettings:uploadPolicy:feedbackObjectToUpdate:completion:](self, "submitOrEnqueueFeedback:userInfo:traits:debugSettings:uploadPolicy:feedbackObjectToUpdate:completion:", v16, v18, v19, v20, a8, v21, v22);
  }

}

- (void)_submitOrEnqueueFeedback:(id)a3 attachedImages:(id)a4 resolvedUserInfo:(id)a5 traits:(id)a6 debugSettings:(id)a7 uploadPolicy:(int64_t)a8 feedbackObjectToUpdate:(id)a9 completion:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  unsigned int v40;
  id v41;
  NSObject *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v59;
  void *v60;
  void *v61;
  id v62;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71[2];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];

  v14 = a3;
  v15 = a4;
  v64 = a5;
  v16 = a6;
  v17 = a7;
  v62 = a9;
  v57 = a10;
  sub_100753EE8();
  v18 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  v19 = objc_alloc_init((Class)GEORPFeedbackImageUploadParameters);
  objc_msgSend(v18, "setImageUploadParameters:", v19);

  v61 = v14;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "submissionParameters"));
  v21 = objc_msgSend(v20, "isPOIEnrichment");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageUploadParameters"));
  objc_msgSend(v22, "setIsEnrichment:", v21);

  v75 = 0u;
  v73 = 0u;
  v74 = 0u;
  v72 = 0u;
  v23 = v15;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v73;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v73 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageUploadParameters"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "photoMetadata"));
        objc_msgSend(v28, "addImage:", v29);

        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
    }
    while (v24);
  }

  if ((sub_1003DFD08() & 1) == 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "defaultTraitsWithTraits:", v16));

    v16 = (id)v31;
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[GEORPFeedbackRequest defaultDebugSettingsMergedWithSettings:](GEORPFeedbackRequest, "defaultDebugSettingsMergedWithSettings:", v17));

  v59 = objc_msgSend(objc_alloc((Class)GEORPFeedbackRequest), "initWithFeedbackRequestParameters:userInfo:traits:debugSettings:", v18, v64, v16, v60);
  v32 = objc_msgSend(objc_alloc((Class)GEORPFeedbackRequest), "initWithFeedbackRequestParameters:userInfo:traits:debugSettings:", v61, v64, v16, v60);
  v33 = v32;
  if (v62)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "feedbackRequestParameters"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "submissionParameters"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "clientSubmissionUuid"));

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "feedbackRequestParameters"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "submissionParameters"));
    v39 = objc_msgSend(v38, "hasClientSubmissionUuid");
    if (v36)
      v40 = v39;
    else
      v40 = 0;

    if (v40)
    {
      -[FeedbackSubmissionPostActionManager saveFeedbackObject:forSubmissionIdentifier:](self->_feedbackSubmissionPostActionManager, "saveFeedbackObject:forSubmissionIdentifier:", v62, v36);
    }
    else
    {
      v41 = sub_100431FFC();
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "submissionIdentifier is nil", buf, 2u);
      }

    }
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", (int)(objc_msgSend(v23, "count") + 2)));
  objc_storeStrong((id *)&self->_currentProgress, v43);
  v44 = sub_100431FFC();
  v45 = objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "userCredentials"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "icloudUserPersonId"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "userCredentials"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "icloudUserMapsAuthToken"));
    *(_DWORD *)buf = 138412546;
    v77 = v47;
    v78 = 2112;
    v79 = v49;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Submitting with icloud person id %@ and auth token %@", buf, 0x16u);

  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[MSPFeedbackSubmissionTicket ticketForFeedbackRequest:traits:](MSPFeedbackSubmissionTicket, "ticketForFeedbackRequest:traits:", v59, v16));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "fakeProgress"));
  objc_msgSend(v43, "addChild:withPendingUnitCount:", v51, 1);

  -[FeedbackSubmissionManager _logDiscardIfNeededForFeedback:userInfo:feedbackObjectToUpdate:](self, "_logDiscardIfNeededForFeedback:userInfo:feedbackObjectToUpdate:", v61, v64, v62);
  objc_initWeak((id *)buf, self);
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_100734104;
  v65[3] = &unk_1011C4FD0;
  objc_copyWeak(v71, (id *)buf);
  v52 = v57;
  v70 = v52;
  v53 = v23;
  v66 = v53;
  v54 = v33;
  v67 = v54;
  v71[1] = (id)a8;
  v55 = v16;
  v68 = v55;
  v56 = v43;
  v69 = v56;
  objc_msgSend(v50, "submitWithHandler:networkActivity:", v65, 0);

  objc_destroyWeak(v71);
  objc_destroyWeak((id *)buf);

}

- (void)_updateUserInfo:(id)a3 requestParameters:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  const char *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  uint32_t v22;
  void *v23;
  uint64_t BOOL;
  double Double;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((GEOConfigGetBOOL(MapsConfig_UGCShouldSendBAACertificatesForCommunityIDWriteRequests, off_1014B4EC8) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tdmUserInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "anonymousUserId"));

    if (objc_msgSend(v11, "length"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tdmUserInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "baaCertificates"));
      v14 = objc_msgSend(v13, "count");

      if (v14)
      {
        v15 = sub_100431FFC();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v17 = "Already fetched BAA certificates so early exit.";
LABEL_11:
          v21 = v16;
          v22 = 2;
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v17, buf, v22);
        }
      }
      else
      {
        if ((objc_msgSend(v8, "hasSubmissionParameters") & 1) != 0
          || (objc_msgSend(v8, "hasImageUploadParameters") & 1) != 0
          || (objc_msgSend(v8, "hasLogEventParameters") & 1) != 0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataUsingEncoding:", 4));
          BOOL = GEOConfigGetBOOL(MapsConfig_UGCShouldCacheBAACertificatesForCommunityIDWriteRequests, off_1014B4ED8);
          Double = GEOConfigGetDouble(MapsConfig_UGCTimeIntervalToCacheBAACertificatesForCommunityIDWriteRequests, off_1014B4EE8);
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10073471C;
          v27[3] = &unk_1011C5020;
          v28 = v7;
          v29 = v9;
          MSPUGCFetchClientCertificate(CFSTR("com.apple.Maps.CommunityID"), v23, v23, BOOL, v27, Double);

          goto LABEL_18;
        }
        v26 = sub_100431FFC();
        v16 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v8;
          v17 = "Request parameters are not not writable so early exit.\n %@";
          v21 = v16;
          v22 = 12;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v20 = sub_100431FFC();
      v16 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v17 = "No anonymous id so not fetching BAA certificates.";
        goto LABEL_11;
      }
    }

    (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v7, 0);
LABEL_18:

    goto LABEL_19;
  }
  v18 = sub_100431FFC();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "GeoConfig is disabled so not fetching BAA certificates.", buf, 2u);
  }

  (*((void (**)(id, id, _QWORD))v9 + 2))(v9, v7, 0);
LABEL_19:

}

- (void)submitOrEnqueueFeedback:(id)a3 userInfo:(id)a4 traits:(id)a5 debugSettings:(id)a6 uploadPolicy:(int64_t)a7 feedbackObjectToUpdate:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32[2];
  id location;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  objc_initWeak(&location, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100734AB8;
  v26[3] = &unk_1011C5048;
  objc_copyWeak(v32, &location);
  v21 = v20;
  v31 = v21;
  v22 = v15;
  v27 = v22;
  v23 = v17;
  v28 = v23;
  v24 = v18;
  v29 = v24;
  v32[1] = (id)a7;
  v25 = v19;
  v30 = v25;
  -[FeedbackSubmissionManager _updateUserInfo:requestParameters:completion:](self, "_updateUserInfo:requestParameters:completion:", v16, v22, v26);

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);

}

- (void)_submitOrEnqueueFeedback:(id)a3 resolvedUserInfo:(id)a4 traits:(id)a5 debugSettings:(id)a6 uploadPolicy:(int64_t)a7 feedbackObjectToUpdate:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  id v31;
  NSObject *v32;
  NSProgress *v33;
  NSProgress *currentProgress;
  NSProgress *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  v20 = a6;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FeedbackSubmissionManager _feedbackUploaderForUploadPolicy:](self, "_feedbackUploaderForUploadPolicy:", a7));
  v22 = objc_claimAutoreleasedReturnValue(+[GEORPFeedbackRequest defaultDebugSettingsMergedWithSettings:](GEORPFeedbackRequest, "defaultDebugSettingsMergedWithSettings:", v20));

  v39 = (void *)v22;
  v23 = objc_msgSend(objc_alloc((Class)GEORPFeedbackRequest), "initWithFeedbackRequestParameters:userInfo:traits:debugSettings:", v15, v16, v17, v22);
  v24 = v23;
  if (v18)
  {
    v37 = v21;
    v38 = v15;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "feedbackRequestParameters"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "submissionParameters"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "clientSubmissionUuid"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "feedbackRequestParameters"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "submissionParameters"));
    v30 = objc_msgSend(v29, "hasClientSubmissionUuid");

    if (v30 && v27)
    {
      -[FeedbackSubmissionPostActionManager saveFeedbackObject:forSubmissionIdentifier:](self->_feedbackSubmissionPostActionManager, "saveFeedbackObject:forSubmissionIdentifier:", v18, v27);
    }
    else
    {
      v31 = sub_100431FFC();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "submissionIdentifier is nil", buf, 2u);
      }

    }
    v21 = v37;

    v15 = v38;
  }
  v33 = (NSProgress *)objc_claimAutoreleasedReturnValue(+[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", 1));
  currentProgress = self->_currentProgress;
  self->_currentProgress = v33;
  v35 = v33;

  -[FeedbackSubmissionManager _logDiscardIfNeededForFeedback:userInfo:feedbackObjectToUpdate:](self, "_logDiscardIfNeededForFeedback:userInfo:feedbackObjectToUpdate:", v15, v16, v18);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100734DC0;
  v40[3] = &unk_1011C4FA8;
  v41 = v19;
  v36 = v19;
  objc_msgSend(v21, "submitCorrectionsRequest:traits:parentProgress:completion:", v24, v17, v35, v40);

}

- (void)_logDiscardIfNeededForFeedback:(id)a3 userInfo:(id)a4 feedbackObjectToUpdate:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v25 = a3;
  v7 = a5;
  if (objc_msgSend(a4, "hasUserCredentials")
    && objc_msgSend(v25, "hasSubmissionParameters"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "submissionParameters"));
    v9 = objc_msgSend(v8, "logDiscardTriggerType");

    v10 = sub_100431FFC();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "submissionParameters"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientSubmissionUuid"));
    if (objc_msgSend(v13, "length"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "submissionParameters"));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "clientSubmissionUuid"));
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
    }
    v16 = (void *)v15;

    MSPUGCPerformLogDiscardForCurrentSessionWithCompletion(&_dispatch_main_q, v9, v11, v16, 0);
    v17 = objc_opt_class(RapUserProfileRecord);
    if ((objc_opt_isKindOfClass(v7, v17) & 1) != 0)
    {
      v18 = v7;
      if (objc_msgSend(v18, "hasDirections"))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "directions"));
        v20 = objc_msgSend(v19, "hasNavigationSessionID");

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "directions"));
          v22 = objc_msgSend(v21, "navigationSessionID");
          v24 = v23;

          MSPUGCPerformLogDiscardForSessionWithCompletion(&_dispatch_main_q, v22, v24, v9, v11, v16, 0);
        }
      }

    }
  }

}

- (id)_feedbackUploaderForUploadPolicy:(int64_t)a3
{
  uint64_t v3;

  if (!a3)
  {
    v3 = 16;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = 24;
LABEL_5:
    a2 = (SEL)*(id *)((char *)&self->super.isa + v3);
  }
  return (id)(id)a2;
}

+ (id)failedToEnqueueSubmissionError
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FeedbackSubmissionManager"), -2, 0);
}

+ (id)badFeedbackResponseErrorWithCode:(int64_t)a3
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FeedbackSubmissionManager"), a3, 0);
}

+ (BOOL)isStatusCodeSuccess:(int64_t)a3
{
  return (unint64_t)(a3 - 200) < 0x64;
}

+ (BOOL)canHandleSessionIdentifier:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.Maps.rap.submission"));
}

- (void)finishedUploadingImagesWithImageUpdate:(id)a3 correctionsRequest:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, id);
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = (void (**)(id, id))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feedbackRequestParameters"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "submissionParameters"));
  v11 = objc_msgSend(v10, "isPOIEnrichment");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feedbackRequestParameters"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "submissionParameters"));
    objc_msgSend(v13, "updatePOIEnrichmentWithCloudKitReceipts:", v14);

  }
  v8[2](v8, v7);

}

- (void)finishedCorrectionsUploadWithResponse:(id)a3 request:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  int v29;
  void *v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "feedbackResult"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "submissionResult"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "feedbackId"));

    v14 = sub_100431FFC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v29 = 138412290;
      v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Received a GEORPFeedbackResponse object feedback id %@", (uint8_t *)&v29, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "feedbackResult"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "submissionResult"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "feedbackId"));
    -[FeedbackSubmissionManager _recordRAPSubmissionID:](self, "_recordRAPSubmissionID:", v18);

    -[FeedbackSubmissionPostActionManager performActionWithFeedbackResponse:feedbackRequest:](self->_feedbackSubmissionPostActionManager, "performActionWithFeedbackResponse:feedbackRequest:", v8, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "feedbackRequestParameters"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "submissionParameters"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "details"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "poiEnrichmentUpdate"));

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "placeContext"));
    if (v23)
    {
      v24 = (void *)v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "placeContext"));
      v26 = objc_msgSend(v25, "muid");

      if (v26)
        -[GEOObserverHashTable feedbackSubmissionManagerCompletedSubmissionWithMUID:withError:](self->_observers, "feedbackSubmissionManagerCompletedSubmissionWithMUID:withError:", v26, 0);
    }
    -[FeedbackSubmissionManager _startFraudScoreExchangeIfNeededWithResponse:request:](self, "_startFraudScoreExchangeIfNeededWithResponse:request:", v8, v9);

  }
  if (objc_msgSend(v8, "attestationNotFound"))
  {
    v27 = sub_1004327DC();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Received a GEORPFeedbackResponse with attestationNotFound", (uint8_t *)&v29, 2u);
    }

    -[GEOObserverHashTable submissionDidFailAttestation](self->_observers, "submissionDidFailAttestation");
  }

}

- (void)_startFraudScoreExchangeIfNeededWithResponse:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t IsEnabled_RAPCommunityID;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;

  v6 = a3;
  v7 = a4;
  IsEnabled_RAPCommunityID = MapsFeature_IsEnabled_RAPCommunityID(v7, v8);
  if ((IsEnabled_RAPCommunityID & 1) != 0
    || MapsFeature_IsEnabled_ARPCommunityID(IsEnabled_RAPCommunityID))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "feedbackResult"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "submissionResult"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tdmFraudRequestInfo"));

    v13 = sub_100431FFC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "tdmFraudRequestInfo in FeedbackResponse: %@", buf, 0xCu);
    }

    if (v12)
    {
      v15 = sub_100431FFC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Start Fraud Score Exchange Flow...", buf, 2u);
      }

      -[FeedbackSubmissionManager _updateSpamStatusWithResponse:request:](self, "_updateSpamStatusWithResponse:request:", v6, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEOUserAccountInfo primaryICloudAccount](GEOUserAccountInfo, "primaryICloudAccount"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transactionId"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tdmNamespace"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fsrData"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "keyId"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[AMSFraudReportTask performFraudReportRefreshWithAccount:transactionID:nameSpace:fsrData:keyID:](AMSFraudReportTask, "performFraudReportRefreshWithAccount:transactionID:nameSpace:fsrData:keyID:", v17, v18, v19, v20, v21));

      v23 = sub_100431FFC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Send a request to get Fraud Report...", buf, 2u);
      }

      objc_initWeak((id *)buf, self);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100735648;
      v25[3] = &unk_1011C5070;
      objc_copyWeak(&v27, (id *)buf);
      v26 = v12;
      objc_msgSend(v22, "resultWithCompletion:", v25);

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);

    }
  }

}

- (void)_sendTdmFraudNotificationWithFraudReportResponse:(id)a3 tdmRequestInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  id v23;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultTraits"));

  v9 = objc_alloc_init((Class)GEORPTdmFraudNotificationParameters);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anonymousId"));
  objc_msgSend(v9, "setAnonymousId:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nameSpace"));
  objc_msgSend(v9, "setTdmNamespace:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "finalizedElement"));
  objc_msgSend(v9, "setToken:", v12);

  v13 = objc_msgSend(v6, "reportedScore");
  v14 = objc_msgSend(v6, "newScore");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("rs=%ld;ns=%ld"),
                    v13,
                    v14));
  objc_msgSend(v9, "setFsrData:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transactionId"));
  objc_msgSend(v9, "setTransactionId:", v16);

  v17 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  objc_msgSend(v17, "setTdmFraudNotificationParameters:", v9);
  v18 = objc_msgSend(objc_alloc((Class)GEORPFeedbackRequest), "initWithFeedbackRequestParameters:userInfo:traits:debugSettings:", v17, 0, v8, 0);
  v19 = sub_100431FFC();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Send TDM Fraud Notification... requestParams: %@", buf, 0xCu);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MSPFeedbackSubmissionTicket ticketForFeedbackRequest:traits:](MSPFeedbackSubmissionTicket, "ticketForFeedbackRequest:traits:", v18, v8));
  objc_msgSend(v21, "submitWithHandler:networkActivity:", &stru_1011C50B0, 0);

}

- (void)_updateSpamStatusWithResponse:(id)a3 request:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v14 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "feedbackResult"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "submissionResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tdmFraudRequestInfo"));

  if (objc_msgSend(v7, "hasTdmUserMapsStatus")
    && objc_msgSend(v14, "feedbackRequestType") == 1)
  {
    v8 = objc_msgSend(v14, "isPOIEnrichment");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ServerEvaluationStatusMapsSync shared](_TtC4Maps30ServerEvaluationStatusMapsSync, "shared"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tdmUserMapsStatus"));
    v11 = objc_msgSend(v10, "isBlocked");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tdmUserMapsStatus"));
    v13 = objc_msgSend(v12, "isTrusted");
    if (v8)
      objc_msgSend(v9, "setARPStatusWithIsBlocked:isTrusted:completion:", v11, v13, 0);
    else
      objc_msgSend(v9, "setRAPStatusWithIsBlocked:isTrusted:completion:", v11, v13, 0);

  }
}

- (void)_recordRAPSubmissionID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (a3)
  {
    v3 = a3;
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mutableArrayValueForKey:", CFSTR("RAPPreviouslySubmittedProblemIDs")));
    objc_msgSend(v4, "insertObject:atIndex:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mutableArrayValueForKey:", CFSTR("RAPPreviouslySubmittedProblemURLs")));
    v7 = GEOURLString(42, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "host"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("sundew"), CFSTR("bluegrass")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ls"), CFSTR("geo")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://%@/raps/%@"), v12, v3));
    objc_msgSend(v5, "insertObject:atIndex:", v13, 0);
    objc_msgSend(v4, "trimToLength:", 5);
    objc_msgSend(v5, "trimToLength:", 5);
    objc_msgSend(v16, "setObject:forKey:", v3, CFSTR("RAPLastSubmittedProblemID"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));
    objc_msgSend(v16, "setObject:forKey:", v14, CFSTR("RAPPreviouslySubmittedProblemURLs"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4));
    objc_msgSend(v16, "setObject:forKey:", v15, CFSTR("RAPPreviouslySubmittedProblemIDs"));

    objc_msgSend(v16, "synchronize");
  }
}

- (id)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___FeedbackSubmissionManagerObserver, &_dispatch_main_q);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FeedbackSubmissionManager observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FeedbackSubmissionManager observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (NSProgress)currentProgress
{
  return self->_currentProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentProgress, 0);
  objc_storeStrong((id *)&self->_feedbackSubmissionPostActionManager, 0);
  objc_storeStrong((id *)&self->_backgroundFeedbackUploader, 0);
  objc_storeStrong((id *)&self->_interactiveFeedbackUploader, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
