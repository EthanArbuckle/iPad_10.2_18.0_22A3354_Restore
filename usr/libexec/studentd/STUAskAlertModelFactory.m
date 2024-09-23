@implementation STUAskAlertModelFactory

+ (id)sharedFactory
{
  if (qword_1000FC440 != -1)
    dispatch_once(&qword_1000FC440, &stru_1000CB008);
  return (id)qword_1000FC448;
}

- (STUAskAlertModelFactory)init
{
  STUAskAlertModelFactory *v2;
  STUAskAlertTextProvider_iOS *v3;
  STUAskAlertTextProvider *textProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUAskAlertModelFactory;
  v2 = -[STUAskAlertModelFactory init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(STUAskAlertTextProvider_iOS);
    textProvider = v2->_textProvider;
    v2->_textProvider = (STUAskAlertTextProvider *)v3;

  }
  return v2;
}

- (id)openAppTextWithInstructorName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  STUAskAlertModel *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUAskAlertModelFactory textProvider](self, "textProvider"));
  v7 = v6;
  if (v5)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "openAppTitleWithInstructorName:", v4));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "openAppTitle"));
  v9 = (void *)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUAskAlertModelFactory textProvider](self, "textProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "openAppMessage"));

  v12 = -[STUAskAlertModel initWithTitle:message:]([STUAskAlertModel alloc], "initWithTitle:message:", v9, v11);
  return v12;
}

- (id)openURLTextWithInstructorName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  STUAskAlertModel *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUAskAlertModelFactory textProvider](self, "textProvider"));
  v7 = v6;
  if (v5)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "openURLTitleWithInstructorName:", v4));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "openURLTitle"));
  v9 = (void *)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUAskAlertModelFactory textProvider](self, "textProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "openURLMessage"));

  v12 = -[STUAskAlertModel initWithTitle:message:]([STUAskAlertModel alloc], "initWithTitle:message:", v9, v11);
  return v12;
}

- (id)lockTextWithInstructorName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  STUAskAlertModel *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUAskAlertModelFactory textProvider](self, "textProvider"));
  v7 = v6;
  if (v5)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lockDeviceTitleWithInstructorName:", v4));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lockDeviceTitle"));
  v9 = (void *)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUAskAlertModelFactory textProvider](self, "textProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lockDeviceMessage"));

  v12 = -[STUAskAlertModel initWithTitle:message:]([STUAskAlertModel alloc], "initWithTitle:message:", v9, v11);
  return v12;
}

- (id)screenObserveTextWithInstructorName:(id)a3 isLocalNetworkConnection:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  STUAskAlertModel *v16;

  v6 = a3;
  v7 = objc_msgSend(v6, "length");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUAskAlertModelFactory textProvider](self, "textProvider"));
  v9 = v8;
  if (v7)
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "screenObserveTitleWithInstructorName:", v6));
  else
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "screenObserveTitle"));
  v11 = (void *)v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUAskAlertModelFactory textProvider](self, "textProvider"));
  v13 = v12;
  if (a4)
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "screenObserveMessageLocal"));
  else
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "screenObserveMessageRemote"));
  v15 = (void *)v14;

  v16 = -[STUAskAlertModel initWithTitle:message:]([STUAskAlertModel alloc], "initWithTitle:message:", v11, v15);
  return v16;
}

- (id)airPlayTextWithInstructorName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  STUAskAlertModel *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUAskAlertModelFactory textProvider](self, "textProvider"));
  v7 = v6;
  if (v5)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "airPlayTitleWithInstructorName:", v4));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "airPlayTitle"));
  v9 = (void *)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUAskAlertModelFactory textProvider](self, "textProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "airPlayMessage"));

  v12 = -[STUAskAlertModel initWithTitle:message:]([STUAskAlertModel alloc], "initWithTitle:message:", v9, v11);
  return v12;
}

- (STUAskAlertTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_textProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
}

@end
