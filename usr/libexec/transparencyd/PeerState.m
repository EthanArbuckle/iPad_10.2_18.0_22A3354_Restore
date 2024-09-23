@implementation PeerState

- (BOOL)setCompletedVerification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v4 = a3;
  if (objc_msgSend(v4, "verificationResult") == (id)1)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[PeerState mostRecentSuccess](self, "mostRecentSuccess"));
    if (!v5)
      goto LABEL_4;
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentSuccess](self, "mostRecentSuccess"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsResponseTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsResponseTime"));
    v10 = objc_msgSend(v8, "compare:", v9);

    if (v10 == (id)-1)
    {
LABEL_4:
      -[PeerState setMostRecentSuccess:](self, "setMostRecentSuccess:", v4);
LABEL_11:
      v11 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    if (objc_msgSend(v4, "verificationResult"))
    {
      v11 = 0;
      goto LABEL_15;
    }
    v12 = objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
    if (!v12)
      goto LABEL_10;
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "idsResponseTime"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsResponseTime"));
    v17 = objc_msgSend(v15, "compare:", v16);

    if (v17 == (id)-1)
    {
LABEL_10:
      -[PeerState setFailure:](self, "setFailure:", v4);
      -[PeerState setSeenDate:](self, "setSeenDate:", 0);
      goto LABEL_11;
    }
  }
  v11 = 0;
LABEL_12:
  v18 = objc_claimAutoreleasedReturnValue(-[PeerState mostRecentCompleted](self, "mostRecentCompleted"));
  if (!v18)
    goto LABEL_14;
  v19 = (void *)v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentCompleted](self, "mostRecentCompleted"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "idsResponseTime"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsResponseTime"));
  v23 = objc_msgSend(v21, "compare:", v22);

  if (v23 == (id)-1)
  {
LABEL_14:
    -[PeerState setMostRecentCompleted:](self, "setMostRecentCompleted:", v4);
    v11 = 1;
  }
LABEL_15:

  return v11;
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getAssociatedObject(self, CFSTR("dataStore"));
}

- (void)setDataStore:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("dataStore"), a3, (void *)1);
}

- (unint64_t)bestVerificationResultToUIStatusForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState verificationWithinTTLOfDate:](self, "verificationWithinTTLOfDate:", v4));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "getUnsigned:", "verificationResult");
    if (v7 == (id)3)
    {
      v8 = 8;
      goto LABEL_23;
    }
    if (v7 != (id)2)
    {
      if (v7)
      {
        v8 = 4;
      }
      else if (-[PeerState isFailureIgnoredForDate:](self, "isFailureIgnoredForDate:", v4))
      {
        v8 = 8;
      }
      else
      {
        v8 = 6;
      }
      goto LABEL_23;
    }
    if (qword_1002A4480 != -1)
      dispatch_once(&qword_1002A4480, &stru_10023AE98);
    v12 = (void *)qword_1002A4488;
    if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "verificationId"));
      v30 = 138412546;
      v31 = v14;
      v32 = 2114;
      v33 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PeerStateCalculator: %{mash.hash}@ most recent verification %{public}@ pending", (uint8_t *)&v30, 0x16u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "creationTime"));
    objc_msgSend(v16, "timeIntervalSinceDate:", v4);
    v18 = v17;
    +[TransparencySettings queryJustMadeTimeout](TransparencySettings, "queryJustMadeTimeout");
    v20 = -v19;

    if (v18 > v20)
    {
      +[TransparencySettings queryJustMadeTimeout](TransparencySettings, "queryJustMadeTimeout");
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "creationTime"));
      objc_msgSend(v23, "timeIntervalSinceDate:", v4);
      v25 = v22 + v24;

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState dataStore](self, "dataStore"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState application](self, "application"));
      objc_msgSend(v26, "recalculateVerifierResultForPeer:application:after:", v27, v28, v25);

      v8 = 3;
      goto LABEL_23;
    }
  }
  else
  {
    if (qword_1002A4480 != -1)
      dispatch_once(&qword_1002A4480, &stru_10023AE78);
    v9 = (void *)qword_1002A4488;
    if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
      v30 = 138412290;
      v31 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PeerStateCalculator: %{mash.hash}@ no verification within 7 days", (uint8_t *)&v30, 0xCu);

    }
  }
  if (-[PeerState isFailureIgnoredForDate:](self, "isFailureIgnoredForDate:", v4))
    v8 = 12;
  else
    v8 = 0;
LABEL_23:

  return v8;
}

- (unint64_t)getUIStatusForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t String;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;

  v4 = a3;
  if ((-[PeerState everCompletedVerification](self, "everCompletedVerification") & 1) != 0)
  {
    if ((-[PeerState optedIn](self, "optedIn") & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));

      if (!v5)
      {
LABEL_14:
        v16 = -[PeerState bestVerificationResultToUIStatusForDate:](self, "bestVerificationResultToUIStatusForDate:", v4);
        goto LABEL_36;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
      v7 = objc_msgSend(v6, "verificationResult");

      if (v7)
      {
        if (qword_1002A4480 != -1)
          dispatch_once(&qword_1002A4480, &stru_10023AED8);
        v8 = (void *)qword_1002A4488;
        if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_ERROR))
        {
          v9 = v8;
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState application](self, "application"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
          v29 = 138413058;
          v30 = v10;
          v31 = 2112;
          v32 = v11;
          v33 = 2048;
          v34 = objc_msgSend(v12, "verificationResult");
          v35 = 2048;
          v36 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "There is a failed verification saved for peer (%@, %@) with verification result %lld. We only expect this value to be %lu. This may lead to issues later.", (uint8_t *)&v29, 0x2Au);

        }
      }
      if (-[PeerState isFailureResolvedAndSeenByDate:](self, "isFailureResolvedAndSeenByDate:", v4))
      {
        if (qword_1002A4480 != -1)
          dispatch_once(&qword_1002A4480, &stru_10023AEF8);
        v13 = (void *)qword_1002A4488;
        if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_INFO))
        {
          v14 = v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
          v29 = 138412290;
          v30 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "getUIStatusForDate failure is resolved and seen (%@)", (uint8_t *)&v29, 0xCu);

        }
        goto LABEL_14;
      }
      if (-[PeerState isFailureIgnoredForDate:](self, "isFailureIgnoredForDate:", v4))
      {
        if (qword_1002A4480 != -1)
          dispatch_once(&qword_1002A4480, &stru_10023AF18);
        v22 = (void *)qword_1002A4488;
        if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_INFO))
        {
          v23 = v22;
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
          v29 = 138412290;
          v30 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "getUIStatusForDate failure is ignored (%@)", (uint8_t *)&v29, 0xCu);

        }
        v16 = 8;
      }
      else
      {
        if (qword_1002A4480 != -1)
          dispatch_once(&qword_1002A4480, &stru_10023AF38);
        v25 = (void *)qword_1002A4488;
        if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_INFO))
        {
          v26 = v25;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
          v29 = 138412290;
          v30 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "getUIStatusForDate PeerState failure (%@)", (uint8_t *)&v29, 0xCu);

        }
        v16 = 6;
      }
    }
    else if (-[PeerState everOptedIn](self, "everOptedIn"))
    {
      if (-[PeerState turnedOffIgnored](self, "turnedOffIgnored"))
        v16 = 11;
      else
        v16 = 10;
    }
    else
    {
      v16 = 2;
    }
  }
  else
  {
    if (qword_1002A4480 != -1)
      dispatch_once(&qword_1002A4480, &stru_10023AEB8);
    v17 = (void *)qword_1002A4488;
    if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
      v16 = 3;
      String = KTUIStatusGetString(3);
      v21 = (void *)objc_claimAutoreleasedReturnValue(String);
      v29 = 138412546;
      v30 = v19;
      v31 = 2114;
      v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PeerStateCalculator: %{mash.hash}@ -> %{public}@ never completed verification", (uint8_t *)&v29, 0x16u);

    }
    else
    {
      v16 = 3;
    }
  }
LABEL_36:

  return v16;
}

- (id)verificationWithinTTLOfDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentSuccess](self, "mostRecentSuccess"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentSuccess](self, "mostRecentSuccess"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "creationTime"));
    objc_msgSend(v4, "timeIntervalSinceDate:", v7);
    v9 = v8;

    +[TransparencySettings queryCacheHardTimeout](TransparencySettings, "queryCacheHardTimeout");
    if (v9 < v10)
    {
      v18 = objc_claimAutoreleasedReturnValue(-[PeerState mostRecentSuccess](self, "mostRecentSuccess"));
LABEL_8:
      v17 = (void *)v18;
      goto LABEL_9;
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentVerification](self, "mostRecentVerification"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentVerification](self, "mostRecentVerification"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "creationTime"));
    objc_msgSend(v4, "timeIntervalSinceDate:", v13);
    v15 = v14;

    +[TransparencySettings queryCacheHardTimeout](TransparencySettings, "queryCacheHardTimeout");
    if (v15 < v16)
    {
      v18 = objc_claimAutoreleasedReturnValue(-[PeerState mostRecentVerification](self, "mostRecentVerification"));
      goto LABEL_8;
    }
  }
  v17 = 0;
LABEL_9:

  return v17;
}

- (BOOL)isFailureResolvedAndSeenByDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));

  if (!v5)
  {
    v12 = 1;
    goto LABEL_30;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentVerification](self, "mostRecentVerification"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "creationTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentVerification](self, "mostRecentVerification"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "creationTime"));
    v11 = objc_msgSend(v8, "compare:", v10);

    if (v11 == (id)-1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "creationTime"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kt_toISO_8601_UTCString"));

      if ((+[TransparencyAnalytics hasInternalDiagnostics](TransparencyAnalytics, "hasInternalDiagnostics") & 1) == 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "creationTime"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "kt_fuzzyDate"));
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "kt_toISO_8601_UTCString"));

        v15 = (void *)v19;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState ignoredFailureExpiry](self, "ignoredFailureExpiry"));

      if (v20)
      {
        if (qword_1002A4480 != -1)
          dispatch_once(&qword_1002A4480, &stru_10023AF58);
        v21 = (void *)qword_1002A4488;
        if (!os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_DEFAULT))
          goto LABEL_28;
        v22 = v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "verificationId"));
        v48 = 138412802;
        v49 = v23;
        v50 = 2114;
        v51 = v25;
        v52 = 2114;
        v53 = v15;
        v26 = "PeerStateCalculator: %{mash.hash}@ resolved failure %{public}@ (%{public}@) ignored";
        goto LABEL_13;
      }
      if (-[PeerState optedIn](self, "optedIn"))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
        if (objc_msgSend(v27, "optedIn"))
        {

        }
        else
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentVerification](self, "mostRecentVerification"));
          v29 = objc_msgSend(v28, "verificationResult");

          if (v29 == (id)1)
          {
            if (qword_1002A4480 != -1)
              dispatch_once(&qword_1002A4480, &stru_10023AF78);
            v30 = (void *)qword_1002A4488;
            if (!os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_DEFAULT))
              goto LABEL_28;
            v22 = v30;
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "verificationId"));
            v48 = 138412802;
            v49 = v23;
            v50 = 2114;
            v51 = v25;
            v52 = 2114;
            v53 = v15;
            v26 = "PeerStateCaculated: %{mash.hash}@ resolved failure %{public}@ from before opt-in (%{public}@)";
LABEL_13:
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v48, 0x20u);

LABEL_28:
            v12 = 1;
LABEL_29:

            goto LABEL_30;
          }
        }
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState seenDate](self, "seenDate"));

      if (v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState seenDate](self, "seenDate"));
        objc_msgSend(v4, "timeIntervalSinceDate:", v32);
        v34 = v33;

        +[TransparencySettings dismissFailureAfterSeenPeriod](TransparencySettings, "dismissFailureAfterSeenPeriod");
        if (v34 >= v35)
          goto LABEL_28;
        if (qword_1002A4480 != -1)
          dispatch_once(&qword_1002A4480, &stru_10023AFB8);
        v36 = (void *)qword_1002A4488;
        v12 = 0;
        if (!os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_DEFAULT))
          goto LABEL_29;
        v37 = v36;
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "verificationId"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState seenDate](self, "seenDate"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "kt_toISO_8601_UTCString"));
        v48 = 138413058;
        v49 = v38;
        v50 = 2114;
        v51 = v40;
        v52 = 2114;
        v53 = v15;
        v54 = 2112;
        v55 = v42;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "PeerStateCalculator: %{mash.hash}@ resolved failure %{public}@ (%{public}@) not seen for 1h (%@)", (uint8_t *)&v48, 0x2Au);

      }
      else
      {
        if (qword_1002A4480 != -1)
          dispatch_once(&qword_1002A4480, &stru_10023AF98);
        v44 = (void *)qword_1002A4488;
        v12 = 0;
        if (!os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_DEFAULT))
          goto LABEL_29;
        v37 = v44;
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "verificationId"));
        v48 = 138412802;
        v49 = v45;
        v50 = 2114;
        v51 = v47;
        v52 = 2114;
        v53 = v15;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "PeerStateCalculator: %{mash.hash}@ resolved failure %{public}@ (%{public}@) never seen", (uint8_t *)&v48, 0x20u);

      }
      v12 = 0;
      goto LABEL_29;
    }
  }
  v12 = 0;
LABEL_30:

  return v12;
}

- (BOOL)isFailureIgnoredForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  int v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState ignoredFailureExpiry](self, "ignoredFailureExpiry"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState ignoredFailureExpiry](self, "ignoredFailureExpiry"));
    objc_msgSend(v6, "timeIntervalSinceDate:", v4);
    v8 = v7;

    if (v8 <= 0.0)
    {
      if (qword_1002A4480 != -1)
        dispatch_once(&qword_1002A4480, &stru_10023AFD8);
      v9 = (void *)qword_1002A4488;
      if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
        v14 = 138412290;
        v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PeerStateCalculator: %{mash.hash}@ failure ignore expired", (uint8_t *)&v14, 0xCu);

      }
    }
    v12 = v8 > 0.0;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)updateResultWithStaticKey:(id)a3 staticKeyStore:(id)a4 forDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  BOOL v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publicID"));

  if (!v11)
  {
    if (qword_1002A4480 != -1)
      dispatch_once(&qword_1002A4480, &stru_10023AFF8);
    v21 = (void *)qword_1002A4488;
    if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uri"));
      *(_DWORD *)buf = 141558274;
      v35 = 1752392040;
      v36 = 2112;
      v37 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "veriferResultForPeer static key: no public id for %{mask.hash}@", buf, 0x16u);

    }
    goto LABEL_26;
  }
  if (!v9)
  {
    if (qword_1002A4480 != -1)
      dispatch_once(&qword_1002A4480, &stru_10023B018);
    v24 = qword_1002A4488;
    if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "veriferResultForPeer static key: no static key store", buf, 2u);
    }
LABEL_26:
    v25 = 0;
    goto LABEL_34;
  }
  v12 = objc_msgSend(v8, "succeed");
  v31 = objc_msgSend(v8, "staticAccountKeyStatus");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publicID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "publicKeyInfo"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uri"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "application"));
  v33 = 0;
  v17 = +[KTContext validateStaticKeyForPeer:accountKey:application:staticKeyStore:error:](KTContext, "validateStaticKeyForPeer:accountKey:application:staticKeyStore:error:", v15, v14, v16, v9, &v33);
  v18 = v33;
  objc_msgSend(v8, "setStaticAccountKeyStatus:", v17);

  if (v18)
  {
    if (qword_1002A4480 != -1)
      dispatch_once(&qword_1002A4480, &stru_10023B038);
    v19 = qword_1002A4488;
    if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = (uint64_t)v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "veriferResultForPeer static key failed: %@", buf, 0xCu);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "failure"));

    if (!v20)
      objc_msgSend(v8, "setFailure:", v18);
  }
  if ((-[PeerState everOptedIn](self, "everOptedIn") & 1) != 0
    || objc_msgSend(v8, "staticAccountKeyStatus") != (id)2 && objc_msgSend(v8, "staticAccountKeyStatus"))
  {
    if (v12 == (id)2 && !objc_msgSend(v8, "staticAccountKeyStatus"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loggableDatas"));
      v32 = 0;
      v27 = +[KTContextVerifier verifyLoggableDataSignatures:accountKey:error:](KTContextVerifier, "verifyLoggableDataSignatures:accountKey:error:", v26, v14, &v32);
      v28 = v32;

      if ((v27 & 1) == 0)
      {
        objc_msgSend(v8, "setStaticAccountKeyStatus:", 4);
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "failure"));

        if (!v29)
          objc_msgSend(v8, "setFailure:", v28);
      }

    }
    else if (!objc_msgSend(v8, "staticAccountKeyStatus") && v31 == (id)4)
    {
      objc_msgSend(v8, "setStaticAccountKeyStatus:", 4);
    }
    objc_msgSend(v8, "updateWithStaticKeyEnforced:isFailureIgnoredForDate:", objc_msgSend(v8, "staticAccountKeyStatus"), -[PeerState isFailureIgnoredForDate:](self, "isFailureIgnoredForDate:", v10));
    v25 = 0;
  }
  else
  {
    v25 = 1;
    -[PeerState setEverOptedIn:](self, "setEverOptedIn:", 1);
    objc_msgSend(v8, "setEverOptedIn:", 1);
  }

LABEL_34:
  return v25;
}

- (id)verifierResultWithStaticKeyStore:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t String;
  void *v20;
  uint64_t v21;
  int v23;
  void *v24;

  v4 = a3;
  v5 = objc_alloc((Class)KTVerifierResult);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState application](self, "application"));
  v8 = objc_msgSend(v5, "initWithUri:application:", v6, v7);

  objc_msgSend(v8, "setOptedIn:", -[PeerState optedIn](self, "optedIn"));
  objc_msgSend(v8, "setEverOptedIn:", -[PeerState everOptedIn](self, "everOptedIn"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentVerification](self, "mostRecentVerification"));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v8, "setSucceed:", objc_msgSend(v9, "getUnsigned:", "verificationResult"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:error:](KTAccountPublicID, "ktAccountPublicIDWithPublicKeyInfo:error:", v11, 0));
    objc_msgSend(v8, "setPublicID:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serverLoggableDatas"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "loggableDatas"));
    objc_msgSend(v8, "setLoggableDatas:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "failure"));
    objc_msgSend(v8, "setFailure:", v15);

    objc_msgSend(v8, "setStaticAccountKeyStatus:", objc_msgSend(v10, "getUnsigned:", "staticKeyStatus"));
  }
  else
  {
    objc_msgSend(v8, "setSucceed:", 2);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v8, "setUiStatus:", -[PeerState getUIStatusForDate:](self, "getUIStatusForDate:", v16));
  if (qword_1002A4480 != -1)
    dispatch_once(&qword_1002A4480, &stru_10023B058);
  v17 = (void *)qword_1002A4488;
  if (os_log_type_enabled((os_log_t)qword_1002A4488, OS_LOG_TYPE_INFO))
  {
    v18 = v17;
    String = KTUIStatusGetString(objc_msgSend(v8, "uiStatus"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(String);
    v23 = 138412290;
    v24 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "verifierResultWithStaticKeyStore setting UI status to %@", (uint8_t *)&v23, 0xCu);

  }
  if (-[PeerState updateResultWithStaticKey:staticKeyStore:forDate:](self, "updateResultWithStaticKey:staticKeyStore:forDate:", v8, v4, v16))
  {
    v21 = objc_claimAutoreleasedReturnValue(-[PeerState verifierResultWithStaticKeyStore:](self, "verifierResultWithStaticKeyStore:", v4));

    v8 = (id)v21;
  }

  return v8;
}

- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4
{
  sub_1001A7B0C(self, a3, a4);
  return 1;
}

- (unint64_t)getUnsigned:(SEL)a3
{
  return sub_1001A7A14(self, a3);
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("PeerState"));
}

@end
