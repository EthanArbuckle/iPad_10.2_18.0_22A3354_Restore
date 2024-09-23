@implementation FeedbackSubmissionPostActionManager

- (FeedbackSubmissionPostActionManager)init
{
  FeedbackSubmissionPostActionManager *v2;
  FeedbackSubmissionPostActionStorage *v3;
  FeedbackSubmissionPostActionStorage *submissionStorage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FeedbackSubmissionPostActionManager;
  v2 = -[FeedbackSubmissionPostActionManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(FeedbackSubmissionPostActionStorage);
    submissionStorage = v2->_submissionStorage;
    v2->_submissionStorage = v3;

  }
  return v2;
}

- (BOOL)saveFeedbackObject:(id)a3 forSubmissionIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  RapFeedbackSubmissionPostAction *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  int v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(RapUserProfileRecord);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = v6;
    v10 = -[RapFeedbackSubmissionPostAction initWithRapUserProfileRecord:]([RapFeedbackSubmissionPostAction alloc], "initWithRapUserProfileRecord:", v9);
    v11 = -[FeedbackSubmissionPostActionStorage saveFeedbackAction:forSubmissionIdentifier:](self->_submissionStorage, "saveFeedbackAction:forSubmissionIdentifier:", v10, v7);
    v12 = sub_100431FFC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v19 = 138412290;
        v20 = v7;
        v15 = "Successfully saved feedback action to disk %@";
        v16 = v14;
        v17 = OS_LOG_TYPE_INFO;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, (uint8_t *)&v19, 0xCu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19 = 138412290;
      v20 = v7;
      v15 = "Failed to save feedback action to disk %@";
      v16 = v14;
      v17 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  LOBYTE(v11) = 0;
LABEL_10:

  return v11;
}

- (void)performActionWithFeedbackResponse:(id)a3 feedbackRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  NSObject *v16;
  int v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feedbackRequestParameters"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "submissionParameters"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientSubmissionUuid"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feedbackRequestParameters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "submissionParameters"));
  v13 = objc_msgSend(v12, "hasClientSubmissionUuid");

  if (v13 && v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FeedbackSubmissionPostActionStorage feedbackActionForSubmissionIdentifier:](self->_submissionStorage, "feedbackActionForSubmissionIdentifier:", v10));
    objc_msgSend(v14, "performActionWithFeedbackResponse:feedbackRequest:", v6, v7);
    -[FeedbackSubmissionPostActionStorage removefeedbackActionForSubmissionIdentifier:](self->_submissionStorage, "removefeedbackActionForSubmissionIdentifier:", v10);

  }
  else
  {
    v15 = sub_100431FFC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "SubmissionIdentifier is nil. Check feedbackRequest %@", (uint8_t *)&v17, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionStorage, 0);
}

@end
