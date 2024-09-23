@implementation InteractiveFeedbackUploader

- (InteractiveFeedbackUploader)initWithUploadStepObserver:(id)a3
{
  id v4;
  InteractiveFeedbackUploader *v5;
  InteractiveFeedbackUploader *v6;
  void *v7;
  uint64_t v8;
  NSURLSession *session;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)InteractiveFeedbackUploader;
  v5 = -[InteractiveFeedbackUploader init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_uploadStepObserver, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
    v8 = objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v7));
    session = v6->_session;
    v6->_session = (NSURLSession *)v8;

  }
  return v6;
}

- (void)submitCorrectionsRequest:(id)a3 traits:(id)a4 parentProgress:(id)a5 completion:(id)a6
{
  -[InteractiveFeedbackUploader _submitCorrectionsRequest:traits:parentProgress:completion:](self, "_submitCorrectionsRequest:traits:parentProgress:completion:", a3, a4, a5, a6);
}

- (void)submitPhotosWithMetadata:(id)a3 withImageUploadResult:(id)a4 withCorrectionsRequest:(id)a5 traits:(id)a6 parentProgress:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSObject *group;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  __int128 *v43;
  id v44;
  id location;
  _QWORD v46[4];
  NSObject *v47;
  InteractiveFeedbackUploader *v48;
  id v49;
  id v50;
  id v51;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v54;
  uint64_t v55;

  v34 = a3;
  v14 = a4;
  v15 = a5;
  v32 = a6;
  v16 = a7;
  v17 = a8;
  v18 = sub_100431FFC();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v34, "count");
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Beginning submission with %lu images", (uint8_t *)&buf, 0xCu);
  }

  v20 = objc_alloc_init((Class)NSMutableArray);
  v21 = objc_alloc_init((Class)NSMutableArray);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v54 = 0x2020000000;
  v55 = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100A244C8;
  v46[3] = &unk_1011DFDF0;
  group = dispatch_group_create();
  v47 = group;
  v48 = self;
  v22 = v20;
  v49 = v22;
  v23 = v21;
  v50 = v23;
  p_buf = &buf;
  v24 = v16;
  v51 = v24;
  objc_msgSend(v14, "enumerateAndMatchPhotosWithMetadata:withBlock:", v34, v46);
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A24B50;
  block[3] = &unk_1011DFE40;
  v42 = v17;
  v43 = &buf;
  v36 = v14;
  v37 = v22;
  v25 = v22;
  v26 = v17;
  v27 = v14;
  objc_copyWeak(&v44, &location);
  v38 = v23;
  v39 = v15;
  v40 = v32;
  v41 = v24;
  v28 = v24;
  v29 = v32;
  v30 = v15;
  v31 = v23;
  dispatch_group_notify(group, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
}

- (void)_submitCorrectionsRequest:(id)a3 traits:(id)a4 parentProgress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSPFeedbackSubmissionTicket ticketForFeedbackRequest:traits:](MSPFeedbackSubmissionTicket, "ticketForFeedbackRequest:traits:", v10, v11));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "feedbackRequestParameters"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "submissionParameters"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "clientSubmissionUuid"));

  v18 = sub_100431FFC();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Submitting corrections request with client submission identifier %@", buf, 0xCu);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fakeProgress"));
  objc_msgSend(v12, "addChild:withPendingUnitCount:", v20, 1);

  objc_initWeak((id *)buf, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100A24FB0;
  v24[3] = &unk_1011DFE68;
  objc_copyWeak(&v28, (id *)buf);
  v21 = v17;
  v25 = v21;
  v22 = v10;
  v26 = v22;
  v23 = v13;
  v27 = v23;
  objc_msgSend(v14, "submitWithHandler:networkActivity:", v24, 0);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

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
  objc_storeStrong((id *)&self->_correctionsTicket, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
