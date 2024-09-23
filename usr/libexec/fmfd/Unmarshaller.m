@implementation Unmarshaller

- (id)followersUsingData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followers")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v5 == v6)
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("followers")));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pendingOffers")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v8 == v9)
    v10 = 0;
  else
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pendingOffers")));

  if (v7 | v10)
  {
    if (v7 && v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[Unmarshaller handlesFromData:forType:](self, "handlesFromData:forType:", v4, 0));
    }
    else
    {
      if (v7 && !v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[Unmarshaller handlesFromData:forType:](self, "handlesFromData:forType:", v4, 0));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pendingOfferHandles"));

        if (v11)
          goto LABEL_21;
        goto LABEL_23;
      }
      v12 = 0;
      if (v7 || !v10)
      {
        v11 = 0;
        v13 = 0;
        goto LABEL_28;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "followerHandles"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectsPassingTest:", &stru_100099D48));
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[Unmarshaller handlesFromData:forType:](self, "handlesFromData:forType:", v4, 4));
    if (v11)
    {
LABEL_21:
      if (v12)
      {
        v13 = (id)objc_claimAutoreleasedReturnValue(-[Unmarshaller updateFollowers:withCombinedGroupIdsFromPending:](self, "updateFollowers:withCombinedGroupIdsFromPending:", v11, v12));
        goto LABEL_28;
      }
    }
LABEL_23:
    if (v11)
    {
      v13 = v11;
      v11 = v13;
      goto LABEL_28;
    }
    if (v12)
    {
      v13 = v12;
      v12 = v13;
      v11 = 0;
      goto LABEL_28;
    }
    goto LABEL_12;
  }
  v10 = 0;
  v12 = 0;
LABEL_12:
  v11 = 0;
  v13 = 0;
LABEL_28:
  v17 = v13;

  return v17;
}

- (id)updateFollowers:(id)a3 withCombinedGroupIdsFromPending:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a3;
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "member:", v11));
        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "expiresByGroupId"));
          v14 = objc_msgSend(v13, "mutableCopy");

          if (!v14)
          {
            v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "expiresByGroupId"));

            if (v14)
              v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "expiresByGroupId"));
          objc_msgSend(v14, "addEntriesFromDictionary:", v15);

          objc_msgSend(v11, "setExpiresByGroupId:", v14);
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setByAddingObjectsFromSet:", v6));

  return v16;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022258;
  block[3] = &unk_100099320;
  block[4] = a1;
  if (qword_1000B3720 != -1)
    dispatch_once(&qword_1000B3720, block);
  return (id)qword_1000B3728;
}

- (id)friendRequestsFromData:(id)a3 forType:(int64_t)a4
{
  id v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v42;
  id obj;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  int v47;
  int v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];

  v5 = a3;
  v6 = v5;
  if (a4 == 2)
  {
    v48 = 0;
    v7 = CFSTR("futureFollowers");
    v47 = 1;
    v46 = 1;
    v8 = CFSTR("invitationFromEmail");
  }
  else
  {
    if (a4 != 3)
    {
LABEL_37:
      v12 = 0;
      goto LABEL_38;
    }
    v46 = 0;
    v47 = 0;
    v7 = CFSTR("futureFollowing");
    v48 = 1;
    v8 = CFSTR("invitationSentToEmail");
  }
  v45 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForKey:", v7));
  v10 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v9 == (void *)v10)
  {

    goto LABEL_37;
  }
  v11 = (void *)v10;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", v7));

  if (!v12)
  {
LABEL_38:
    v49 = 0;
    goto LABEL_39;
  }
  v42 = v6;
  v49 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v12 = v12;
  v50 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v50)
  {
    v44 = *(_QWORD *)v52;
    obj = v12;
    do
    {
      for (i = 0; i != v50; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v44)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v45));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        if (v15 == v16)
          v17 = 0;
        else
          v17 = v15;
        v18 = v17;

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("id")));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        if (v19 == v20)
          v21 = 0;
        else
          v21 = v19;
        v22 = v21;

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("groupId")));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        if (v23 == v24)
          v25 = 0;
        else
          v25 = v23;
        v26 = v25;

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("expires")));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        if (v27 == v28)
          v29 = 0;
        else
          v29 = v27;
        v30 = v29;

        objc_msgSend(v30, "doubleValue");
        if (v31 == 0.0)
        {
          v33 = 0;
        }
        else
        {
          objc_msgSend(v30, "doubleValue");
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v32 / 1000.0));
        }
        v34 = objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:serverId:](FMFHandle, "handleWithId:serverId:", v18, v22));
        v35 = (void *)v34;
        if (v47)
          v36 = (void *)v34;
        else
          v36 = 0;
        if (v48)
          v37 = (void *)v34;
        else
          v37 = 0;
        v38 = v37;
        v39 = v36;
        v40 = objc_msgSend(objc_alloc((Class)FMFFriendshipRequest), "initWithFromHandle:toHandle:ofType:groupId:endDate:requestId:", v39, v38, v46, v26, v33, v22);

        objc_msgSend(v49, "addObject:", v40);
      }
      v12 = obj;
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v50);
  }

  v6 = v42;
LABEL_39:

  return v49;
}

- (id)handlesFromData:(id)a3 forType:(int64_t)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v35;
  uint64_t v36;
  id v37;
  Unmarshaller *v38;
  int64_t v39;
  __CFString *v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  uint64_t v53;
  _BYTE v54[128];

  v6 = a3;
  v7 = v6;
  if ((unint64_t)a4 > 4)
  {
    v40 = 0;
    v8 = 0;
  }
  else
  {
    v40 = off_100099D68[a4];
    v8 = off_100099D90[a4];
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v8));
  v10 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v35 = v7;
  if (v9 == (void *)v10)
  {

    goto LABEL_33;
  }
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

  if (!v12)
  {
LABEL_33:
    v14 = 0;
    v13 = 0;
    goto LABEL_34;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v48;
    v38 = self;
    v39 = a4;
    v36 = *(_QWORD *)v48;
    v37 = v14;
    do
    {
      v18 = 0;
      v41 = v16;
      do
      {
        if (*(_QWORD *)v48 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v18);
        if (a4 == 4)
        {
          if (-[Unmarshaller isValidPendingOffer:](self, "isValidPendingOffer:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v18)))
          {
            v20 = objc_claimAutoreleasedReturnValue(-[Unmarshaller pendingHandleFromData:withEmailKey:](self, "pendingHandleFromData:withEmailKey:", v19, CFSTR("invitationFromHandle")));
            -[NSObject setPending:](v20, "setPending:", 1);
            objc_msgSend(v13, "addObject:", v20);
          }
          else
          {
            v33 = sub_100011D0C();
            v20 = objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v53 = v19;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Filtering out expired pending offer: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          v42 = v18;
          v20 = objc_claimAutoreleasedReturnValue(-[Unmarshaller handlesFromData:withHandlesKey:](self, "handlesFromData:withHandlesKey:", v19, v40));
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v44;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(_QWORD *)v44 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "member:", v25));
                v27 = v26;
                if (v26)
                {
                  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "aliasServerIds"));
                  if (v28)
                  {
                    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "aliasServerIds"));
                    v30 = objc_msgSend(v29, "mutableCopy");

                  }
                  else
                  {
                    v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                  }

                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "serverId"));
                  objc_msgSend(v30, "addObject:", v31);

                  objc_msgSend(v27, "setAliasServerIds:", v30);
                }

              }
              v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            }
            while (v22);
          }
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allObjects](v20, "allObjects"));
          objc_msgSend(v13, "addObjectsFromArray:", v32);

          self = v38;
          a4 = v39;
          v17 = v36;
          v14 = v37;
          v16 = v41;
          v18 = v42;
        }

        v18 = (char *)v18 + 1;
      }
      while (v18 != v16);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v16);
  }

LABEL_34:
  return v13;
}

- (id)handlesFromData:(id)a3 withHandlesKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v9 == v10)
    v11 = 0;
  else
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v7));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sortedArrayUsingSelector:", "localizedCaseInsensitiveCompare:"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[Unmarshaller _handleWithData:withHandlesKey:forIdentifier:](self, "_handleWithData:withHandlesKey:forIdentifier:", v6, v7, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v17), (_QWORD)v20));
        objc_msgSend(v8, "addObject:", v18);

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  return v8;
}

- (id)_handleWithData:(id)a3 withHandlesKey:(id)a4 forIdentifier:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("id")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v8 == v9)
    v10 = 0;
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("id")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:serverId:](FMFHandle, "handleWithId:serverId:", v7, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("invitationSentToHandles")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v12 == v13)
  {
    objc_msgSend(v11, "setInvitationSentToIds:", 0);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("invitationSentToHandles")));
    objc_msgSend(v11, "setInvitationSentToIds:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("expiresByGroupId")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v15 == v16)
  {
    objc_msgSend(v11, "setExpiresByGroupId:", 0);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("expiresByGroupId")));
    objc_msgSend(v11, "setExpiresByGroupId:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("personIdHash")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v18 == v19)
  {
    objc_msgSend(v11, "setHashedDSID:", 0);
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("personIdHash")));
    objc_msgSend(v11, "setHashedDSID:", v20);

  }
  return v11;
}

- (id)locationFromRefresh:(id)a3
{
  id v3;
  void *v4;
  _UNKNOWN **v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _UNKNOWN **v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  id v33;
  id v34;
  id v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("locations")));
  v5 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  v6 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v4 == (void *)v6)
  {

    v8 = 0;
    goto LABEL_26;
  }
  v7 = (void *)v6;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("locations")));

  if (!v8)
  {
LABEL_26:
    v9 = 0;
    goto LABEL_27;
  }
  v36 = v3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v10 = objc_autoreleasePoolPush();
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFUtils shiftLocations:](FMFUtils, "shiftLocations:", v8));

  objc_autoreleasePoolPop(v10);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = v11;
  v38 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v38)
    goto LABEL_24;
  v12 = *(_QWORD *)v40;
  v37 = *(_QWORD *)v40;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v40 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("id")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[369], "null"));
      if (v15 == v16)
        v17 = 0;
      else
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("id")));

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "followingHandleForServerId:", v17));

      if (!v19 || !v17)
        goto LABEL_17;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "serverId"));
      if ((objc_msgSend(v20, "isEqualToString:", v17) & 1) != 0)
        goto LABEL_16;
      v21 = v8;
      v22 = v9;
      v23 = v5;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "aliasServerIds"));
      v25 = objc_msgSend(v24, "containsObject:", v17);

      if (v25)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
        v26 = objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:serverId:](FMFHandle, "handleWithId:serverId:", v20, v17));

        v19 = (void *)v26;
        v5 = v23;
        v9 = v22;
        v8 = v21;
        v12 = v37;
LABEL_16:

LABEL_17:
        if (!v19)
          goto LABEL_20;
        goto LABEL_18;
      }
      v5 = v23;
      v9 = v22;
      v8 = v21;
      v12 = v37;
LABEL_18:
      if (v17)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
        objc_msgSend(v27, "maxLocatingInterval");
        v29 = v28;

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
        objc_msgSend(v30, "locationTTL");
        v32 = v31;

        v33 = objc_msgSend(objc_alloc((Class)FMFLocation), "initWithDictionary:forHandle:maxLocatingInterval:TTL:", v14, v19, v29, v32);
        objc_msgSend(v9, "setObject:forKey:", v33, v17);

      }
LABEL_20:

      v13 = (char *)v13 + 1;
    }
    while (v38 != v13);
    v34 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    v38 = v34;
  }
  while (v34);
LABEL_24:

  v3 = v36;
LABEL_27:

  return v9;
}

- (BOOL)isValidPendingOffer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  double v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("expires")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v4 == v5)
    v6 = 0;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("expires")));

  if ((objc_msgSend(v6, "isEqualToNumber:", &off_1000A0F30) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v8, "timeIntervalSince1970");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9 * 1000.0));

    v7 = objc_msgSend(v6, "compare:", v10) == (id)1;
  }

  return v7;
}

- (id)devicesFromData:(id)a3 meDeviceId:(id)a4 thisDeviceId:(id)a5 companionDeviceId:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  unsigned int v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  NSObject *v43;
  uint64_t v45;
  id v46;
  id obj;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  id v72;
  __int16 v73;
  unsigned int v74;
  __int16 v75;
  unsigned int v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  id v80;
  _BYTE v81[128];

  v9 = a3;
  v10 = a4;
  v55 = a5;
  v11 = a6;
  v56 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v9;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
  if (v57)
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v53 = *(_QWORD *)v62;
    v54 = v11;
    v46 = v10;
    do
    {
      v15 = 0;
      v16 = v12;
      v17 = v13;
      v18 = v14;
      do
      {
        if (*(_QWORD *)v62 != v53)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("id")));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        if (v20 == v21)
          v60 = 0;
        else
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("id")));

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("name")));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        if (v22 == v23)
          v59 = 0;
        else
          v59 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("name")));

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("idsDeviceId")));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        if (v24 == v25)
          v58 = 0;
        else
          v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("idsDeviceId")));
        v13 = (void *)v59;

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("autoMeCapable")));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        if (v26 == v27)
          v28 = 0;
        else
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", CFSTR("autoMeCapable")));
        v14 = v60;
        v12 = (void *)v58;

        v29 = objc_msgSend(v60, "isEqualToString:", v10);
        v30 = objc_msgSend(v60, "isEqualToString:", v55);
        if (v11)
          v11 = objc_msgSend(v60, "isEqualToString:", v11);
        LOBYTE(v45) = objc_msgSend(v28, "BOOLValue");
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDevice deviceWithId:name:idsDeviceId:isActive:isThisDevice:isCompanionDevice:isAutoMeCapable:](FMFDevice, "deviceWithId:name:idsDeviceId:isActive:isThisDevice:isCompanionDevice:isAutoMeCapable:", v60, v59, v58, v29, v30, v11, v45));
        objc_msgSend(v56, "addObject:", v31);
        v32 = sub_100011D0C();
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "deviceName"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "deviceName"));
          v49 = objc_msgSend(v52, "length");
          v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "deviceId"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "deviceId"));
          v48 = objc_msgSend(v51, "length");
          v35 = objc_msgSend(v31, "isActiveDevice");
          v36 = v28;
          v37 = objc_msgSend(v31, "isThisDevice");
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "idsDeviceId"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "idsDeviceId"));
          v40 = objc_msgSend(v39, "length");
          *(_DWORD *)buf = 138414082;
          v66 = v50;
          v67 = 2048;
          v68 = v49;
          v69 = 2112;
          v70 = v34;
          v41 = (void *)v34;
          v71 = 2048;
          v72 = v48;
          v73 = 1024;
          v74 = v35;
          v13 = (void *)v59;
          v14 = v60;
          v75 = 1024;
          v76 = v37;
          v28 = v36;
          v77 = 2112;
          v78 = v38;
          v79 = 2048;
          v80 = v40;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "devicesFromData %@(%lu) [%@(%lu)] {meDevice=%i} {thisDevice=%i} {idsDeviceId=%@(%lu)}", buf, 0x4Au);

          v12 = (void *)v58;
          v10 = v46;

        }
        v15 = (char *)v15 + 1;
        v16 = v12;
        v17 = v13;
        v18 = v14;
        v11 = v54;
      }
      while (v57 != v15);
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
    }
    while (v57);

  }
  v42 = sub_100011D0C();
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v66 = v56;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Unmarshalling finished for devices %@", buf, 0xCu);
  }

  return v56;
}

- (id)pendingHandleFromData:(id)a3 withEmailKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;
  void *v25;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v7 == v8)
    v9 = 0;
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("id")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v10 == v11)
    v12 = 0;
  else
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("id")));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHandle handleWithId:serverId:](FMFHandle, "handleWithId:serverId:", v9, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("personIdHash")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v14 == v15)
  {
    objc_msgSend(v13, "setHashedDSID:", 0);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("personIdHash")));
    objc_msgSend(v13, "setHashedDSID:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("invitationSentToHandle")));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v17));
    objc_msgSend(v13, "setInvitationSentToIds:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("groupId")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v19 == v20)
    v21 = 0;
  else
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("groupId")));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("expires")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v22 == v23)
    v24 = 0;
  else
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("expires")));

  if (v21 && v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v24, v21));
    objc_msgSend(v13, "setExpiresByGroupId:", v25);

  }
  return v13;
}

@end
