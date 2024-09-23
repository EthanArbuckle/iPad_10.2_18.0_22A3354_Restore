@implementation MFAvatarView

- (id)displayPersonForEmailAddress:(id)a3 brandIndicatorFuture:(id)a4 usingContactStore:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  _QWORD v31[4];
  id v32;
  void *v33;
  _QWORD v34[2];

  v8 = a3;
  v9 = a4;
  v25 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView displayedContact](self, "displayedContact"));
  objc_msgSend(v10, "cancel");

  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncSchedulerWithQualityOfService:](EFScheduler, "globalAsyncSchedulerWithQualityOfService:", 25));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView descriptorForRequiredKeys](self, "descriptorForRequiredKeys"));
    if (v9)
    {
      v34[0] = v12;
      v34[1] = CNContactImageDataKey;
      v13 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));
    }
    else
    {
      v33 = v12;
      v13 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
    }
    v16 = (void *)v13;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "em_onScheduler:contactFutureForEmailAddress:keysToFetch:", v11, v8, v16));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100148EBC;
    v31[3] = &unk_1005206E8;
    v32 = v9;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "then:", v31));
    -[MFAvatarView setDisplayedContact:](self, "setDisplayedContact:", v18);

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ef_cancelledError](NSError, "ef_cancelledError"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v14));
    -[MFAvatarView setDisplayedContact:](self, "setDisplayedContact:", v15);

  }
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView displayedContact](self, "displayedContact"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100149104;
  v28[3] = &unk_100520710;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v19, "onScheduler:addSuccessBlock:", v20, v28);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView displayedContact](self, "displayedContact"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001491E0;
  v26[3] = &unk_10051BD98;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v21, "onScheduler:addFailureBlock:", v22, v26);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView displayedContact](self, "displayedContact"));
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  return v23;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFAvatarView displayedContact](self, "displayedContact"));
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)MFAvatarView;
  -[MFAvatarView dealloc](&v4, "dealloc");
}

- (EFFuture)displayedContact
{
  return self->_displayedContact;
}

- (void)setDisplayedContact:(id)a3
{
  objc_storeStrong((id *)&self->_displayedContact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedContact, 0);
}

@end
