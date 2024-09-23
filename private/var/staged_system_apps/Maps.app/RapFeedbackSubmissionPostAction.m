@implementation RapFeedbackSubmissionPostAction

- (RapFeedbackSubmissionPostAction)initWithRapUserProfileRecord:(id)a3
{
  id v4;
  RapFeedbackSubmissionPostAction *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RapFeedbackSubmissionPostAction;
  v5 = -[RapFeedbackSubmissionPostAction init](&v8, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));
    -[FeedbackSubmissionPostAction setData:](v5, "setData:", v6);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)performActionWithFeedbackResponse:(id)a3 feedbackRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  RapUserProfileRecord *v10;
  void *v11;
  void *v12;
  RapUserProfileRecord *v13;
  void *v14;
  RapUserProfileRecord *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  RAPRecord *v39;
  uint64_t v40;
  void *v41;
  RAPRecord *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;

  v49 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "feedbackRequestParameters"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "submissionParameters"));
  v9 = objc_msgSend(v8, "type");

  if (v9 == 21)
  {
    v10 = (RapUserProfileRecord *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "feedbackRequestParameters"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RapUserProfileRecord submissionParameters](v10, "submissionParameters"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parentFeedbackId"));
    +[RAPRecordManager editStatusOfRAPRecordWithReportID:status:completion:](RAPRecordManager, "editStatusOfRAPRecordWithReportID:status:completion:", v12, 0, &stru_1011B4498);
  }
  else
  {
    v13 = [RapUserProfileRecord alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FeedbackSubmissionPostAction data](self, "data"));
    v15 = -[RapUserProfileRecord initWithData:](v13, "initWithData:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
    v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "countryCode"));

    v17 = objc_alloc_init((Class)GEORPFeedbackSubmissionParameters);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "feedbackResult"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "submissionResult"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "rapInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringValue"));
    v47 = v17;
    if (v22)
    {
      -[RapUserProfileRecord setTitle:](v15, "setTitle:", v22);
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "feedbackRequestParameters"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "submissionParameters"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringForFeedbackType:", objc_msgSend(v24, "type")));
      -[RapUserProfileRecord setTitle:](v15, "setTitle:", v25);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "feedbackResult"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "submissionResult"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "rapInfo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "summary"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringValue"));
    -[RapUserProfileRecord setSubtitle:](v15, "setSubtitle:", v30);

    v42 = [RAPRecord alloc];
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "feedbackResult"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "submissionResult"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "feedbackId"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "feedbackRequestParameters"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "submissionParameters"));
    v31 = objc_msgSend(v43, "type");
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RapUserProfileRecord subtitle](v15, "subtitle"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[RapUserProfileRecord title](v15, "title"));
    v10 = v15;
    v34 = v6;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "userInfo"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "tdmUserInfo"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "anonymousUserId"));
    LOWORD(v40) = 0;
    v11 = (void *)v48;
    v39 = -[RAPRecord initWithReportID:reportType:reportSummary:reportTitle:dateOfReportCreation:countryCodeUponCreation:reportStatus:contentData:communityIdentifier:rapResponse:](v42, "initWithReportID:reportType:reportSummary:reportTitle:dateOfReportCreation:countryCodeUponCreation:reportStatus:contentData:communityIdentifier:rapResponse:", v41, v31, v32, v33, v35, v48, v40, v10, v38, 0);

    v6 = v34;
    +[RAPRecordManager addRAPRecord:completion:](RAPRecordManager, "addRAPRecord:completion:", v39, &stru_1011B44B8);

    v12 = v47;
  }

}

@end
