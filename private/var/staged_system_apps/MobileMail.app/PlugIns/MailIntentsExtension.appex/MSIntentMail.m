@implementation MSIntentMail

- (MSIntentMail)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  MSIntentMail *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  objc_super v30;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MSResultsKeyMessageReference));
  v6 = MSResultsKeySubject;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MSResultsKeySubject));
  v30.receiver = self;
  v30.super_class = (Class)MSIntentMail;
  v8 = -[MSIntentMail initWithIdentifier:displayString:](&v30, "initWithIdentifier:displayString:", v5, v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v6));
    -[MSIntentMail setSubject:](v8, "setSubject:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MSResultsKeyBodySummary));
    -[MSIntentMail setBody:](v8, "setBody:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MSResultsKeyDateSent));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "components:fromDate:", -1, v12));
    -[MSIntentMail setDateSent:](v8, "setDateSent:", v13);

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000047EC;
    v28[3] = &unk_10000C638;
    v14 = objc_alloc_init((Class)MFPersonTransformer);
    v29 = v14;
    v15 = objc_retainBlock(v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MSResultsKeyRecipientTo));
    v17 = ((uint64_t (*)(_QWORD *, void *))v15[2])(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[MSIntentMail setTo:](v8, "setTo:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MSResultsKeyRecipientCc));
    v20 = ((uint64_t (*)(_QWORD *, void *))v15[2])(v15, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[MSIntentMail setCc:](v8, "setCc:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MSResultsKeyRecipientBcc));
    v23 = ((uint64_t (*)(_QWORD *, void *))v15[2])(v15, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[MSIntentMail setBcc:](v8, "setBcc:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MSResultsKeySender));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "transformedValue:", v25));
    -[MSIntentMail setSender:](v8, "setSender:", v26);

  }
  return v8;
}

@end
