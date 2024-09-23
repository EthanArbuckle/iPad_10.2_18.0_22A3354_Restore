@implementation SendMailIntentHandler

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000055E0;
  block[3] = &unk_10000C3A0;
  block[4] = a1;
  if (qword_100012368 != -1)
    dispatch_once(&qword_100012368, block);
  return (OS_os_log *)(id)qword_100012360;
}

- (SendMailIntentHandler)init
{
  SendMailIntentHandler *v2;
  MFMailAccountProxyGenerator *v3;
  MFMailAccountProxyGenerator *accountProxyGenerator;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SendMailIntentHandler;
  v2 = -[SendMailIntentHandler init](&v6, "init");
  if (v2)
  {
    v3 = (MFMailAccountProxyGenerator *)objc_msgSend(objc_alloc((Class)MFMailAccountProxyGenerator), "initWithAllowsRestrictedAccounts:", 0);
    accountProxyGenerator = v2->_accountProxyGenerator;
    v2->_accountProxyGenerator = v3;

  }
  return v2;
}

- (void)resolveSenderForSendMail:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sender"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SendMailIntentHandler accountProxyGenerator](self, "accountProxyGenerator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sender"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountProxyContainingEmailAddress:includingInactive:", v9, 0));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sender"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[INStringResolutionResult successWithResolvedString:](INStringResolutionResult, "successWithResolvedString:", v11));
      v6[2](v6, v12);

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[INStringResolutionResult unsupported](INStringResolutionResult, "unsupported"));
      v6[2](v6, v11);
    }

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[INStringResolutionResult notRequired](INStringResolutionResult, "notRequired"));
    v6[2](v6, v10);
  }

}

- (void)provideSenderOptionsForSendMail:(id)a3 withCompletion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *, _QWORD);

  v8 = (void (**)(id, void *, _QWORD))a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SendMailIntentHandler accountProxyGenerator](self, "accountProxyGenerator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeAccountProxiesOriginatingBundleID:sourceAccountManagement:", 0, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_flatMap:", &stru_10000C6F8));
  v8[2](v8, v7, 0);

}

- (id)defaultSenderForSendMail:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SendMailIntentHandler accountProxyGenerator](self, "accountProxyGenerator", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultMailAccountProxyForDeliveryOriginatingBundleID:sourceAccountManagement:", 0, 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstEmailAddress"));
  return v5;
}

- (void)resolveToForSendMail:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  void *v15;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "to"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "to"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005B84;
    v14[3] = &unk_10000C720;
    v14[4] = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ef_map:", v14));

    v7[2](v7, v11);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[INPersonResolutionResult needsValue](INPersonResolutionResult, "needsValue"));
    v15 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    v7[2](v7, v13);

  }
}

- (void)resolveCcForSendMail:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  void *v14;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cc"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cc"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100005D40;
    v13[3] = &unk_10000C720;
    v13[4] = self;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_map:", v13));

    v7[2](v7, v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[INPersonResolutionResult notRequired](INPersonResolutionResult, "notRequired"));
    v14 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    v7[2](v7, v12);

  }
}

- (void)resolveBccForSendMail:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  void *v14;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bcc"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bcc"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100005EFC;
    v13[3] = &unk_10000C720;
    v13[4] = self;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_map:", v13));

    v7[2](v7, v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[INPersonResolutionResult notRequired](INPersonResolutionResult, "notRequired"));
    v14 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    v7[2](v7, v12);

  }
}

- (void)resolveSubjectForSendMail:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void (**)(id, void *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subject"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[INStringResolutionResult successWithResolvedString:](INStringResolutionResult, "successWithResolvedString:", v7));
    v5[2](v5, v8);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[INStringResolutionResult needsValue](INStringResolutionResult, "needsValue"));
    v5[2](v5, v7);
  }

}

- (void)resolveBodyForSendMail:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void (**)(id, void *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "body"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "body"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[INStringResolutionResult successWithResolvedString:](INStringResolutionResult, "successWithResolvedString:", v7));
    v5[2](v5, v8);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[INStringResolutionResult notRequired](INStringResolutionResult, "notRequired"));
    v5[2](v5, v7);
  }

}

- (void)confirmSendMail:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, id))a4;
  v7 = objc_msgSend(objc_alloc((Class)MSSendMailIntentResponse), "initWithCode:userActivity:", -[SendMailIntentHandler _validateIntent:](self, "_validateIntent:", v8), 0);
  v6[2](v6, v7);

}

- (void)handleSendMail:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SendMailIntentHandler _messageFromSendMailIntent:](self, "_messageFromSendMailIntent:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "isDraft"));
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SendMailIntentHandler accountProxyGenerator](self, "accountProxyGenerator"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sender"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountProxyContainingEmailAddress:includingInactive:", v13, 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueID"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000063FC;
    v19[3] = &unk_10000C748;
    v20 = v7;
    +[MSSaveEmail saveMessageData:forAccountWithID:autosaveIdentifier:completionBlock:](MSSaveEmail, "saveMessageData:forAccountWithID:autosaveIdentifier:completionBlock:", v9, v15, 0, v19);

  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000064B4;
    v17[3] = &unk_10000C770;
    v18 = v7;
    v16 = +[MSSendEmail sendMessageData:autosaveIdentifier:isHMEMessage:sendLaterDate:completionBlock:](MSSendEmail, "sendMessageData:autosaveIdentifier:isHMEMessage:sendLaterDate:completionBlock:", v9, 0, 0, 0, v17);
    v14 = v18;
  }

}

- (id)_resolutionResultForPerson:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personHandle"));
  v6 = objc_msgSend(v5, "type");

  if (v6 == (id)1)
  {
    v14 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SendMailIntentHandler _emailAddressesFromPersons:](self, "_emailAddressesFromPersons:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

    v10 = objc_msgSend(objc_alloc((Class)ECEmailAddress), "initWithString:", v9);
    if (v10)
      v11 = objc_claimAutoreleasedReturnValue(+[INPersonResolutionResult successWithResolvedPerson:](INPersonResolutionResult, "successWithResolvedPerson:", v4));
    else
      v11 = objc_claimAutoreleasedReturnValue(+[INPersonResolutionResult unsupported](INPersonResolutionResult, "unsupported"));
    v12 = (void *)v11;

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[INPersonResolutionResult unsupported](INPersonResolutionResult, "unsupported"));
  }

  return v12;
}

- (id)_emailAddressesFromPersons:(id)a3
{
  id v3;
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000682C;
  v9[3] = &unk_10000C798;
  v4 = objc_alloc_init((Class)MFPersonTransformer);
  v10 = v4;
  v5 = objc_retainBlock(v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ef_map:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_filter:", EFIsNotNull));

  return v7;
}

- (int64_t)_validateIntent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v8;
  id v9;

  v3 = a3;
  if (!v3 || (MSCanSendMailWithOptions(0) & 1) == 0)
  {
    v6 = 6;
    goto LABEL_8;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "to"));
  if (objc_msgSend(v4, "count"))
    goto LABEL_6;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cc"));
  if (objc_msgSend(v5, "count"))
  {

LABEL_6:
    v6 = 1;
    goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bcc"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
    v6 = 1;
  else
    v6 = 6;
LABEL_8:

  return v6;
}

- (id)_messageFromSendMailIntent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v34;
  void *v35;

  v4 = a3;
  v5 = objc_alloc_init((Class)MFMutableMessageHeaders);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "to"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SendMailIntentHandler _emailAddressesFromPersons:](self, "_emailAddressesFromPersons:", v6));
  objc_msgSend(v5, "setAddressListForTo:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SendMailIntentHandler _emailAddressesFromPersons:](self, "_emailAddressesFromPersons:", v8));
  objc_msgSend(v5, "setAddressListForCc:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bcc"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SendMailIntentHandler _emailAddressesFromPersons:](self, "_emailAddressesFromPersons:", v10));
  objc_msgSend(v5, "setAddressListForBcc:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sender"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SendMailIntentHandler accountProxyGenerator](self, "accountProxyGenerator"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountProxyContainingEmailAddress:includingInactive:", v12, 0));

  if (v14)
  {
    v15 = objc_msgSend(objc_alloc((Class)ECEmailAddressComponents), "initWithString:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fullUserName"));
    objc_msgSend(v15, "setDisplayName:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "emailAddressValue"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringValue"));

    v19 = (void *)v18;
  }
  else
  {
    v20 = objc_claimAutoreleasedReturnValue(-[SendMailIntentHandler defaultSenderForSendMail:](self, "defaultSenderForSendMail:", v4));
    v15 = v12;
    v19 = (void *)v20;
  }

  v35 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
  objc_msgSend(v5, "setAddressListForSender:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "ec_descriptionForMimeHeaders"));

  objc_msgSend(v5, "setHeader:forKey:", v23, ECMessageHeaderKeyDate);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subject"));
  objc_msgSend(v5, "setHeader:forKey:", v24, ECMessageHeaderKeySubject);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attachments"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "ef_map:", &stru_10000C7D8));

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "body"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[ECHTMLStringAndMIMECharset mf_utf8HTMLStringWithString:](ECHTMLStringAndMIMECharset, "mf_utf8HTMLStringWithString:", v27));

  v34 = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
  if (objc_msgSend(v26, "count"))
  {
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "arrayByAddingObjectsFromArray:", v26));

    v29 = (void *)v30;
  }
  v31 = objc_alloc_init((Class)MFMessageWriter);
  v32 = objc_msgSend(v31, "createMessageWithHTMLStringAndMIMECharset:plainTextAlternative:otherHtmlStringsAndAttachments:headers:", 0, 0, v29, v5);

  return v32;
}

- (MFMailAccountProxyGenerator)accountProxyGenerator
{
  return self->_accountProxyGenerator;
}

- (void)setAccountProxyGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_accountProxyGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountProxyGenerator, 0);
}

@end
