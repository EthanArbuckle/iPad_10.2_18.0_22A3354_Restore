@implementation ConversationCellViewModel

- (ConversationCellViewModel)initWithBuilder:(id)a3
{
  void (**v5)(id, ConversationCellViewModel *);
  ConversationCellViewModel *v6;
  void *v8;
  objc_super v9;

  v5 = (void (**)(id, ConversationCellViewModel *))a3;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ConversationCellViewModel.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

  }
  v9.receiver = self;
  v9.super_class = (Class)ConversationCellViewModel;
  v6 = -[ConversationCellViewModel init](&v9, "init");
  if (v6)
    v5[2](v5, v6);

  return v6;
}

- (ConversationCellViewModel)initWithItemBuilder:(id)a3
{
  id v5;

  v5 = a3;
  -[ConversationCellViewModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ConversationCellViewModel initWithItemBuilder:]", "ConversationCellViewModel.m", 43, "0");
}

- (id)copyWithFlagsModelBuilder:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v10;
  _QWORD v11[5];
  id v12;

  v5 = a3;
  if (!v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ConversationCellViewModel.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("flagsBuilderBlock"));

  }
  v6 = objc_alloc((Class)objc_opt_class(self));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005123C;
  v11[3] = &unk_10051AA08;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  v8 = objc_msgSend(v6, "initWithBuilder:", v11);

  return v8;
}

- (id)copyWithBuilder:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v10;
  _QWORD v11[5];
  id v12;

  v5 = a3;
  if (!v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ConversationCellViewModel.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

  }
  v6 = objc_alloc((Class)objc_opt_class(self));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100051524;
  v11[3] = &unk_10051AA08;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  v8 = objc_msgSend(v6, "initWithBuilder:", v11);

  return v8;
}

- (MessageContentRepresentationRequest)messageContentRequest
{
  return self->_messageContentRequest;
}

- (void)setMessageContentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_messageContentRequest, a3);
}

- (MFMessageLoadingContext)messageLoadingContext
{
  return self->_messageLoadingContext;
}

- (void)setMessageLoadingContext:(id)a3
{
  objc_storeStrong((id *)&self->_messageLoadingContext, a3);
}

- (NSArray)senderList
{
  return self->_senderList;
}

- (void)setSenderList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ECSubject)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (EMGeneratedSummary)generatedSummary
{
  return self->_generatedSummary;
}

- (void)setGeneratedSummary:(id)a3
{
  objc_storeStrong((id *)&self->_generatedSummary, a3);
}

- (MUIManualSummaryContext)manualSummaryContext
{
  return self->_manualSummaryContext;
}

- (void)setManualSummaryContext:(id)a3
{
  objc_storeStrong((id *)&self->_manualSummaryContext, a3);
}

- (EFFuture)brandIndicatorFuture
{
  return self->_brandIndicatorFuture;
}

- (void)setBrandIndicatorFuture:(id)a3
{
  objc_storeStrong((id *)&self->_brandIndicatorFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandIndicatorFuture, 0);
  objc_storeStrong((id *)&self->_manualSummaryContext, 0);
  objc_storeStrong((id *)&self->_generatedSummary, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_senderList, 0);
  objc_storeStrong((id *)&self->_messageLoadingContext, 0);
  objc_storeStrong((id *)&self->_messageContentRequest, 0);
}

@end
