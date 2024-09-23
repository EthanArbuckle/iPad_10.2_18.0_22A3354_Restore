@implementation MailStatusUpdateView

- (MailStatusUpdateView)initWithFrame:(CGRect)a3
{
  MailStatusUpdateView *v3;
  EMStatusUpdateProvider *v4;
  EMStatusUpdateProvider *statusUpdateProvider;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MailStatusUpdateView;
  v3 = -[MailStatusLabelView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (EMStatusUpdateProvider *)objc_alloc_init((Class)EMStatusUpdateProvider);
    statusUpdateProvider = v3->_statusUpdateProvider;
    v3->_statusUpdateProvider = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, "_significantTimeChange:", UIApplicationSignificantTimeChangeNotification, 0);

  }
  return v3;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C510;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9E30 != -1)
    dispatch_once(&qword_1005A9E30, block);
  return (id)qword_1005A9E28;
}

- (void)_setUpdateTimerFireDate:(id)a3
{
  id v4;
  NSObject *v5;
  NSTimer *v6;
  NSTimer *updateTimer;
  int v8;
  MailStatusUpdateView *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[MailStatusUpdateView log](MailStatusUpdateView, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 134218242;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "<MailStatusUpdateView: %p> Kick off new update timer to fire at: %@", (uint8_t *)&v8, 0x16u);
  }

  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(-[MailStatusUpdateView _updateTimer:fireDate:quotaDate:](self, "_updateTimer:fireDate:quotaDate:", self->_updateTimer, v4, 0));
  updateTimer = self->_updateTimer;
  self->_updateTimer = v6;

}

- (id)_updateTimer:(id)a3 fireDate:(id)a4 quotaDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "invalidate");

  if (v9)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v11 = objc_alloc((Class)NSTimer);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000FB9CC;
    v15[3] = &unk_10051EC28;
    objc_copyWeak(&v17, &location);
    v16 = v10;
    v12 = objc_msgSend(v11, "initWithFireDate:interval:repeats:block:", v9, 0, v15, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v13, "addTimer:forMode:", v12, NSDefaultRunLoopMode);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)updateWithStatusInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  unsigned int v21;
  EMStatusUpdateProvider *statusUpdateProvider;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  unsigned int v37;
  void *v38;
  id v39;
  char v40;
  id v41;
  BOOL v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  _QWORD v60[7];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  NSAttributedStringKey v71;
  void *v72;
  NSAttributedStringKey v73;
  void *v74;
  uint8_t v75[4];
  MailStatusUpdateView *v76;
  __int16 v77;
  void *v78;
  _BYTE buf[24];
  __int128 v80;
  id v81;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[MailStatusUpdateView log](MailStatusUpdateView, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusLabelView delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusLabelView delegate](self, "delegate"));
    v8 = objc_msgSend(v7, "shouldShowSubtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v80) = v8;
    WORD2(v80) = 2112;
    *(_QWORD *)((char *)&v80 + 6) = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%p updateWithStatusInfo: delegate:%@ shouldShowSubtitle:%i statusInfo:%@", buf, 0x26u);

  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastUpdateTime"));
  v10 = (uint64_t)objc_msgSend(v4, "unsentCount");
  v53 = objc_msgSend(v4, "badgeCount");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v80 = sub_1000FBDD8;
  *((_QWORD *)&v80 + 1) = sub_1000FBDE8;
  v81 = (id)0xAAAAAAAAAAAAAAAALL;
  v81 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iCloudQuotaOfferText"));
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = sub_1000FBDD8;
  v69 = sub_1000FBDE8;
  v70 = (id)0xAAAAAAAAAAAAAAAALL;
  v70 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iCloudQuotaOfferLink"));
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v64 = 0;
    goto LABEL_18;
  }
  v11 = v66[5];
  v64 = v11 != 0;
  if (!v11)
    goto LABEL_18;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_1000FBDF0;
  v60[3] = &unk_10051EC50;
  v60[4] = buf;
  v60[5] = &v65;
  v60[6] = &v61;
  v12 = objc_retainBlock(v60);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "showQuotaOfferInformationTimestamp"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v15 = objc_msgSend(v14, "ef_isEarlierThanDate:", v13);

    if (v15)
    {
      v16 = objc_claimAutoreleasedReturnValue(+[MailStatusUpdateView log](MailStatusUpdateView, "log"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v75 = 134218242;
        v76 = self;
        v77 = 2112;
        v78 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<MailStatusUpdateView: %p> Invalidating quota information - quota date not reached: %@", v75, 0x16u);
      }

      ((void (*)(_QWORD *))v12[2])(v12);
      goto LABEL_17;
    }
    v20 = objc_claimAutoreleasedReturnValue(+[MailStatusUpdateView log](MailStatusUpdateView, "log"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v75 = 134217984;
      v76 = self;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<MailStatusUpdateView: %p> Display quota information", v75, 0xCu);
    }
  }
  else
  {
    v17 = objc_claimAutoreleasedReturnValue(+[MailStatusUpdateView log](MailStatusUpdateView, "log"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v75 = 134217984;
      v76 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<MailStatusUpdateView: %p> Invalidating quota information - quota date is nil", v75, 0xCu);
    }

    ((void (*)(_QWORD *))v12[2])(v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dateByAddingUnit:value:toDate:options:", 128, 3, v19, 0));

    -[MailStatusUpdateView _setQuotaTimerFireDate:](self, "_setQuotaTimerFireDate:", v20);
  }

LABEL_17:
LABEL_18:
  v21 = objc_msgSend(v4, "shouldShowSubtitle");
  if (v58)
  {
    statusUpdateProvider = self->_statusUpdateProvider;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v59 = 0;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[EMStatusUpdateProvider statusUpdateStringWithDate:now:nextTransition:](statusUpdateProvider, "statusUpdateStringWithDate:now:nextTransition:", v58, v23, &v59));
    v24 = v59;

    -[MailStatusUpdateView _setUpdateTimerFireDate:](self, "_setUpdateTimerFireDate:", v24);
  }
  else
  {
    v56 = 0;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusLabelView delegate](self, "delegate"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mailboxQualifier"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "networkingAccountErrorString"));
  if (v26)
  {
    v57 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "networkingAccountErrorString"));
  }
  else if (!objc_msgSend(v4, "hasAccountError")
         || (v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountErrorString")),
             v28 = v27 == 0,
             v27,
             v28))
  {
    if (*((_BYTE *)v62 + 24))
      v57 = (id)v66[5];
    else
      v57 = 0;
  }
  else
  {
    v57 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountErrorString"));
  }
  v73 = NSForegroundColorAttributeName;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v74 = v29;
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));

  if (v10)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v31 = v30;
    if (v10 <= 1)
      v32 = CFSTR("UNSENT_MESSAGE_FORMAT");
    else
      v32 = CFSTR("UNSENT_MESSAGES_FORMAT");
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", v32, &stru_100531B00, CFSTR("Main")));

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter ef_formatUnsignedInteger:withGrouping:](NSNumberFormatter, "ef_formatUnsignedInteger:withGrouping:", v10, 1));
    v35 = objc_alloc((Class)NSAttributedString);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v33, v34));
    v10 = (uint64_t)objc_msgSend(v35, "initWithString:", v36);

    goto LABEL_40;
  }
  if ((uint64_t)v53 > 0)
    v37 = v21;
  else
    v37 = 0;
  if (v37 == 1 && v55)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v55, v53));
    v10 = (uint64_t)objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v33, v54);
LABEL_40:

  }
  if (*((_BYTE *)v62 + 24))
  {
    v38 = *(void **)(*(_QWORD *)&buf[8] + 40);
LABEL_43:
    v39 = v38;
    v40 = 1;
    goto LABEL_46;
  }
  if (!v56)
  {
    v38 = (void *)v10;
    if (!v10)
    {
      v39 = 0;
      v52 = 0;
      if (!v57)
        goto LABEL_60;
      goto LABEL_55;
    }
    goto LABEL_43;
  }
  v41 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v56);
  v40 = 0;
  v39 = v41;
LABEL_46:
  if (v57)
  {
    if (v39)
      v42 = v10 == 0;
    else
      v42 = 1;
    if (v42)
      v40 = 1;
    if ((v40 & 1) == 0)
    {
      v43 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", v39);
      v71 = NSForegroundColorAttributeName;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
      v72 = v44;
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1));

      v46 = objc_alloc((Class)NSAttributedString);
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("STATUS_TEXT_SEPARATOR"), &stru_100531B00, CFSTR("Main")));
      v49 = objc_msgSend(v46, "initWithString:attributes:", v48, v45);

      objc_msgSend(v43, "appendAttributedString:", v49);
      objc_msgSend(v43, "appendAttributedString:", v10);
      v50 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithAttributedString:", v43);

      v39 = v50;
    }
LABEL_55:
    v51 = v57;
    goto LABEL_57;
  }
  v51 = (id)v10;
  if (!v10)
  {
LABEL_59:
    v52 = 0;
    goto LABEL_60;
  }
LABEL_57:
  v52 = v51;
  if (objc_msgSend(v51, "isEqualToAttributedString:", v39))
  {

    goto LABEL_59;
  }
LABEL_60:
  -[MailStatusLabelView setPrimaryLabelText:](self, "setPrimaryLabelText:", v39);
  -[MailStatusLabelView setSecondaryLabelText:](self, "setSecondaryLabelText:", v52);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(buf, 8);
}

- (void)tintColorDidChange
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MailStatusLabelView delegate](self, "delegate"));
  objc_msgSend(v2, "tintColorDidChange");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  -[MailStatusUpdateView _setUpdateTimerFireDate:](self, "_setUpdateTimerFireDate:", 0);
  -[MailStatusUpdateView _setQuotaTimerFireDate:](self, "_setQuotaTimerFireDate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)MailStatusUpdateView;
  -[MailStatusUpdateView dealloc](&v4, "dealloc");
}

- (void)_significantTimeChange:(id)a3
{
  EMStatusUpdateProvider *v4;
  EMStatusUpdateProvider *statusUpdateProvider;

  v4 = (EMStatusUpdateProvider *)objc_alloc_init((Class)EMStatusUpdateProvider);
  statusUpdateProvider = self->_statusUpdateProvider;
  self->_statusUpdateProvider = v4;

}

- (void)_setQuotaTimerFireDate:(id)a3
{
  id v4;
  NSObject *v5;
  NSTimer *v6;
  NSTimer *quotaTimer;
  int v8;
  MailStatusUpdateView *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[MailStatusUpdateView log](MailStatusUpdateView, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 134218242;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "<MailStatusUpdateView: %p> Kick off new quota timer to fire at: %@", (uint8_t *)&v8, 0x16u);
  }

  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(-[MailStatusUpdateView _updateTimer:fireDate:quotaDate:](self, "_updateTimer:fireDate:quotaDate:", self->_quotaTimer, v4, v4));
  quotaTimer = self->_quotaTimer;
  self->_quotaTimer = v6;

}

- (id)_statusUpdateFormatUpdatedMinutesAgoWithCalendar:(id)a3 date:(id)a4 now:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "components:fromDate:toDate:options:", 64, a4, a5, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("UPDATED_N_MINUTES_AGO_FORMAT%1$ld"), &stru_100531B00, CFSTR("Main")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, objc_msgSend(v5, "minute")));

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusUpdateProvider, 0);
  objc_storeStrong((id *)&self->_quotaTimer, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
}

@end
