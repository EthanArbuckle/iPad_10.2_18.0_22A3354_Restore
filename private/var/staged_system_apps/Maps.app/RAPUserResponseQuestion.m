@implementation RAPUserResponseQuestion

- (RAPUserResponseQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 responseID:(id)a5 reportID:(id)a6 isAnonymous:(BOOL)a7
{
  id v13;
  id v14;
  RAPUserResponseQuestion *v15;
  RAPUserResponseQuestion *v16;
  objc_super v18;

  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)RAPUserResponseQuestion;
  v15 = -[RAPCommentQuestion initWithReport:parentQuestion:](&v18, "initWithReport:parentQuestion:", a3, a4);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_responseID, a5);
    objc_storeStrong((id *)&v16->_reportID, a6);
    v16->_isAnonymous = a7;
  }

  return v16;
}

- (BOOL)isAnonymous
{
  return self->_isAnonymous;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "setType:", 21);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));

  if (!v5)
  {
    v6 = objc_alloc_init((Class)GEORPFeedbackDetails);
    objc_msgSend(v4, "setDetails:", v6);

  }
  v7 = objc_alloc_init((Class)GEORPRapUserResponseFeedback);
  objc_msgSend(v7, "setResponseId:", self->_responseID);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  objc_msgSend(v8, "setRapUserResponseFeedback:", v7);

  objc_msgSend(v4, "setParentFeedbackId:", self->_reportID);
  v9.receiver = self;
  v9.super_class = (Class)RAPUserResponseQuestion;
  -[RAPCommentQuestion _fillSubmissionParameters:](&v9, "_fillSubmissionParameters:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportID, 0);
  objc_storeStrong((id *)&self->_responseID, 0);
}

@end
