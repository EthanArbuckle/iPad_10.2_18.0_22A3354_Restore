@implementation NearFieldSessionShim

- (void)dealloc
{
  NearFieldManager *v3;
  char invalidated;
  objc_super v5;

  if (self)
  {
    v3 = self->_manager;
    invalidated = self->_invalidated;
  }
  else
  {
    v3 = 0;
    invalidated = 0;
  }
  sub_100053280((uint64_t)v3, invalidated);

  v5.receiver = self;
  v5.super_class = (Class)NearFieldSessionShim;
  -[NearFieldSessionShim dealloc](&v5, "dealloc");
}

- (id)transceive:(id)a3 outError:(id *)a4
{
  id v6;
  NearFieldManager *v7;
  NearFieldManager *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NearFieldManager *v13;
  NFSecureElementManagerSession *SEMSession;
  NearFieldManager *v15;
  NSString *seid;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NearFieldManager *manager;
  id v24;
  NSObject *v25;
  NearFieldManager *v26;
  NearFieldManager *v27;
  NSString *v28;
  NearFieldManager *v29;
  NSString *v30;
  NearFieldManager *v31;
  NearFieldManager *v32;
  NFSecureElementManagerSession *v33;
  NFSecureElementManagerSession *v34;
  NearFieldManager *v35;
  NearFieldManager *v36;
  NSString *v37;
  NSString *v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  uint8_t buf[4];
  _BOOL4 v50;
  __int16 v51;
  id v52;

  v6 = a3;
  if (self)
  {
    v7 = self->_manager;
    v8 = v7;
    if (v7)
      v7 = (NearFieldManager *)v7->_queue;
    dispatch_assert_queue_V2(&v7->super);

    if (self->_invalidated)
      goto LABEL_6;
    v13 = self->_manager;
    if (v13)
    {
      SEMSession = v13->_SEMSession;
      goto LABEL_11;
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
    v13 = 0;
  }
  SEMSession = 0;
LABEL_11:

  if (!SEMSession)
  {
LABEL_6:
    if (a4)
    {
      v9 = sub_100051908();
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = SESCreateAndLogError(0, v10, SESErrorDomain, 0, CFSTR("session became invalid"));
      *a4 = (id)objc_claimAutoreleasedReturnValue(v11);

    }
LABEL_8:
    v12 = 0;
    goto LABEL_42;
  }
  if (self)
  {
    v15 = self->_manager;
    if (v15)
    {
      seid = v15->_seid;
      goto LABEL_15;
    }
  }
  else
  {
    v15 = 0;
  }
  seid = 0;
LABEL_15:

  if (seid)
    goto LABEL_30;
  v17 = sub_100051908();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Missing SEID -> retrying", buf, 2u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
  v48 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "secureElementWithIdentifier:error:", CFSTR("embedded"), &v48));
  v21 = v48;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "serialNumber"));
  if (self)
    manager = self->_manager;
  else
    manager = 0;
  sub_1000536E4((uint64_t)manager, v22);

  v24 = sub_100051908();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    if (self)
    {
      v26 = self->_manager;
      v27 = v26;
      if (v26)
      {
        v28 = v26->_seid;
LABEL_24:
        *(_DWORD *)buf = 67240450;
        v50 = v28 != 0;
        v51 = 2114;
        v52 = v21;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Got SEID %{public}d error %{public}@", buf, 0x12u);

        goto LABEL_25;
      }
    }
    else
    {
      v27 = 0;
    }
    v28 = 0;
    goto LABEL_24;
  }
LABEL_25:

  if (!self)
  {
    v29 = 0;
    goto LABEL_55;
  }
  v29 = self->_manager;
  if (!v29)
  {
LABEL_55:
    v30 = 0;
    goto LABEL_28;
  }
  v30 = v29->_seid;
LABEL_28:

  if (!v30)
  {
    if (a4)
    {
      v44 = sub_100051908();
      v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      v46 = SESCreateAndLogError(0, v45, SESErrorDomain, 0, CFSTR("Missing SEID"));
      *a4 = (id)objc_claimAutoreleasedReturnValue(v46);

    }
    goto LABEL_8;
  }

LABEL_30:
  if (self)
  {
    v31 = self->_manager;
    v32 = v31;
    if (v31)
      v33 = v31->_SEMSession;
    else
      v33 = 0;
    v34 = v33;
    v35 = self->_manager;
    v36 = v35;
    if (v35)
    {
      v37 = v35->_seid;
      goto LABEL_35;
    }
  }
  else
  {
    v36 = 0;
    v32 = 0;
    v34 = 0;
  }
  v37 = 0;
LABEL_35:
  v47 = 0;
  v38 = v37;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureElementManagerSession transceive:forSEID:error:](v34, "transceive:forSEID:error:", v6, v38, &v47));
  v39 = v47;

  if (!v12 || v39)
  {
    if (a4)
    {
      v40 = sub_100051908();
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v42 = SESCreateAndLogError(v39, v41, SESErrorDomain, 0, CFSTR("Error during transceive"));
      *a4 = (id)objc_claimAutoreleasedReturnValue(v42);

    }
    if (self)
      self->_invalidated = 1;
  }

LABEL_42:
  return v12;
}

- (unint64_t)validatePairing:(id *)a3
{
  NearFieldSessionShim *v4;
  NearFieldManager *v5;
  NearFieldManager *v6;
  unint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  NearFieldManager *v12;
  NFSecureElementManagerSession *SEMSession;
  NearFieldManager *v14;
  unsigned int v15;
  id v16;
  void *v17;
  uint64_t v18;

  v4 = self;
  if (!self)
  {
    dispatch_assert_queue_V2(0);
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  v5 = self->_manager;
  v6 = v5;
  if (v5)
    v5 = (NearFieldManager *)v5->_queue;
  dispatch_assert_queue_V2(&v5->super);

  if (!v4)
    goto LABEL_22;
  if (v4->_invalidated)
    goto LABEL_6;
  v12 = v4->_manager;
  if (v12)
  {
    SEMSession = v12->_SEMSession;
    goto LABEL_11;
  }
LABEL_23:
  SEMSession = 0;
LABEL_11:

  if (!SEMSession)
  {
LABEL_6:
    v7 = 4279897;
    if (a3)
    {
      v8 = sub_100051908();
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = SESCreateAndLogError(0, v9, SESErrorDomain, 0, CFSTR("session became invalid"));
      *a3 = (id)objc_claimAutoreleasedReturnValue(v10);

    }
    return v7;
  }
  if (v4)
  {
    v14 = v4->_manager;
    v4 = (NearFieldSessionShim *)v14;
    if (v14)
      v14 = (NearFieldManager *)v14->_SEMSession;
  }
  else
  {
    v14 = 0;
  }
  v15 = -[NearFieldManager validateSEPairings:](v14, "validateSEPairings:", 0);

  if (!v15)
    return 1;
  if (v15 == 27)
    return 0;
  v7 = 4279897;
  if (a3)
  {
    v16 = sub_100051908();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = SESCreateAndLogError(0, v17, SESErrorDomain, 0, CFSTR("Got ambiguous pairing result %d"));
    *a3 = (id)objc_claimAutoreleasedReturnValue(v18);

  }
  return v7;
}

- (id)getExpressConfiguration:(id *)a3
{
  NearFieldManager *manager;
  NSObject *queue;
  id v7;
  void *v8;
  uint64_t v9;
  NearFieldManager *v11;
  NearFieldManager *v12;
  NearFieldManager *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NearFieldManager *v20;
  NearFieldManager *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;

  manager = self->_manager;
  if (manager)
    queue = manager->_queue;
  else
    queue = 0;
  dispatch_assert_queue_V2(queue);
  if (!self->_invalidated)
  {
    v11 = self->_manager;
    if (v11)
      v11 = (NearFieldManager *)v11->_SEMSession;
    if (v11)
    {
      v12 = self->_manager;
      if (v12)
        v12 = (NearFieldManager *)v12->_SEMSession;
      v28 = 0;
      v13 = v12;
      v14 = -[NearFieldManager expressModeControlState:](v13, "expressModeControlState:", &v28);
      v15 = v28;

      if (v15)
      {
        if (!a3)
        {
          v19 = 0;
LABEL_29:

          return v19;
        }
        v16 = sub_100051908();
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = SESCreateAndLogError(v15, v17, SESErrorDomain, 0, CFSTR("Failed to get express control state"));
        v19 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue(v18);
      }
      else
      {
        v20 = self->_manager;
        if (v20)
          v20 = (NearFieldManager *)v20->_SEMSession;
        v27 = 0;
        v21 = v20;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NearFieldManager getExpressPassConfigWithError:](v21, "getExpressPassConfigWithError:", &v27));
        v15 = v27;

        if (v15)
        {
          if (a3)
          {
            v22 = sub_100051908();
            v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            v24 = SESCreateAndLogError(v15, v23, SESErrorDomain, 0, CFSTR("Failed to get express pass config"));
            *a3 = (id)objc_claimAutoreleasedReturnValue(v24);

          }
          v19 = 0;
        }
        else
        {
          v25 = 1;
          if (v14 != (id)1)
            v25 = 2;
          if (v14 == (id)-1)
            v26 = 3;
          else
            v26 = v25;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[SESExpressConfiguration withState:passConfigs:](SESExpressConfiguration, "withState:passConfigs:", v26, v17, v27));
        }
      }

      goto LABEL_29;
    }
  }
  if (a3)
  {
    v7 = sub_100051908();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = SESCreateAndLogError(0, v8, SESErrorDomain, 0, CFSTR("Session became invalid"));
    *a3 = (id)objc_claimAutoreleasedReturnValue(v9);

  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
