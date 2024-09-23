@implementation FMFDataManager

- (void)updateTapMessagesCache:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager cachedTapMessages](self, "cachedTapMessages"));
  v6 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addObjectsFromArray:", v4);
  if ((unint64_t)objc_msgSend(v6, "count") >= 6)
    objc_msgSend(v6, "removeObjectsInRange:", 0, (char *)objc_msgSend(v6, "count") - 5);
  -[FMFDataManager setCachedTapMessages:](self, "setCachedTapMessages:", v6);
  -[FMFDataManager storeTapMessagesToDefaults](self, "storeTapMessagesToDefaults");

}

- (id)maxLocationRefreshTimeout
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "commandServerContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("maxCallbackIntervalInMS")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ((int)objc_msgSend(v4, "intValue") / 1000)));

  return v5;
}

- (double)minCallbackInterval
{
  void *v2;
  void *v3;
  uint64_t v4;
  _UNKNOWN **v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "commandServerContext"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("minCallbackIntervalInMS")));

  if (v4)
    v5 = (_UNKNOWN **)v4;
  else
    v5 = &off_1000A12A8;
  v6 = (double)((int)objc_msgSend(v5, "intValue") / 1000);

  return v6;
}

- (void)clearTapMessagesCache
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cleaning up cached tap messages", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  -[FMFDataManager setCachedTapMessages:](self, "setCachedTapMessages:", v5);

  -[FMFDataManager storeTapMessagesToDefaults](self, "storeTapMessagesToDefaults");
}

- (double)heartbeatIntervalInSec
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "commandServerContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("heartbeatIntervalInSec")));
  v5 = (double)(unint64_t)objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (void)storeTapMessagesToDefaults
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "setObject:forKey:", self->_cachedTapMessages, CFSTR("kFMFTapMessages"));

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "synchronize");

}

- (void)setFollowingHandles:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  FMFDataManager *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v4 = a3;
  v19 = self;
  -[FMFDataManager set_followingHandlesInternal:](self, "set_followingHandlesInternal:", v4);
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        objc_msgSend(v5, "setObject:forKey:", v11, v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "serverId"));
        objc_msgSend(v6, "setObject:forKey:", v11, v13);

        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "aliasServerIds"));
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v16; j = (char *)j + 1)
            {
              if (*(_QWORD *)v22 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(v6, "setObject:forKey:", v11, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j));
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v16);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  -[FMFDataManager set_followingHandleMapWithIdentifier:](v19, "set_followingHandleMapWithIdentifier:", v5);
  -[FMFDataManager set_followingHandleMapWithServerId:](v19, "set_followingHandleMapWithServerId:", v6);

}

- (void)setFollowerHandles:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  FMFDataManager *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];

  v4 = a3;
  v21 = self;
  -[FMFDataManager set_followerHandlesInternal:](self, "set_followerHandlesInternal:", v4);
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        if (v13
          && (v14 = (void *)v13,
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serverId")),
              v15,
              v14,
              v15))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
          objc_msgSend(v5, "setObject:forKey:", v12, v16);

          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serverId"));
          objc_msgSend(v6, "setObject:forKey:", v12, v17);
        }
        else
        {
          v18 = sub_100011D0C();
          v17 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serverId"));
            *(_DWORD *)buf = 138412802;
            v27 = v19;
            v28 = 2112;
            v29 = v20;
            v30 = 2112;
            v31 = v12;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Invalid handle identifier(%@) or serverId(%@) for handle(%@)", buf, 0x20u);

          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v9);
  }

  -[FMFDataManager set_followerHandleMapWithIdentifier:](v21, "set_followerHandleMapWithIdentifier:", v5);
  -[FMFDataManager set_followerHandleMapWithServerId:](v21, "set_followerHandleMapWithServerId:", v6);

}

- (void)digestCommand:(id)a3
{
  id v4;
  NSObject *v5;
  FMFDataManager *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  NSObject *v68;
  NSObject *v69;
  unsigned int v70;
  id v71;
  NSObject *v72;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v74;
  id v75;
  uint64_t v76;
  void *i;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  NSObject *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  void *j;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  unsigned int v128;
  int v129;
  BOOL v130;
  int v131;
  void *v132;
  _BOOL4 v133;
  void *v134;
  unsigned int v135;
  id v136;
  NSObject *v137;
  void *v138;
  char *v139;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  uint64_t v145;
  void *k;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  unsigned int v152;
  uint64_t v153;
  void *v155;
  void *v156;
  id v157;
  NSObject *v158;
  void *v159;
  void *v160;
  void *v161;
  id v162;
  id v163;
  uint64_t v164;
  void *m;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  char *v170;
  void *v171;
  id v172;
  char *v173;
  void *v174;
  id v175;
  NSObject *v176;
  void *v177;
  id v178;
  void *v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  id v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  char *v190;
  _BOOL4 v191;
  id v192;
  NSObject *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  id v200;
  id v201;
  NSObject *v202;
  void *v203;
  void *v204;
  id v205;
  _BOOL4 v206;
  id v207;
  void *v208;
  id v209;
  void *v210;
  void *v211;
  id v212;
  uint64_t v213;
  void *v214;
  id v215;
  void *v216;
  id obj;
  id obja;
  id objb;
  FMFDataManager *val;
  _QWORD v221[4];
  id v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  uint8_t buf[4];
  char *v240;
  __int16 v241;
  id v242;
  __int16 v243;
  id v244;
  _BYTE v245[128];
  _BYTE v246[128];
  _BYTE v247[128];
  _BYTE v248[128];

  v205 = a3;
  v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v205, "jsonResponseDictionary"));
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v240 = (char *)v205;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Digest Command: %@", buf, 0xCu);
  }

  v6 = self;
  objc_sync_enter(v6);
  val = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[FMFDataManager setChangesToBeNotified:](v6, "setChangesToBeNotified:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("modelVersion")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v8 == v9)
  {

    v10 = 0;
  }
  else
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("modelVersion")));

    if (v10)
      -[FMFDataManager setModelVersion:](val, "setModelVersion:", v10);
  }
  v204 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[Unmarshaller sharedInstance](Unmarshaller, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "friendRequestsFromData:forType:", v211, 2));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _futureFollowerRequestsInternal](val, "_futureFollowerRequestsInternal"));
    -[FMFDataManager deltasFromExisting:usingLatest:forKey:](val, "deltasFromExisting:usingLatest:forKey:", v13, v12, CFSTR("futureFollower"));

    -[FMFDataManager setFutureFollowerRequests:](val, "setFutureFollowerRequests:", v12);
    v14 = sub_100011D0C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Future follower updates received.", buf, 2u);
    }

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[Unmarshaller sharedInstance](Unmarshaller, "sharedInstance"));
  v210 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "friendRequestsFromData:forType:", v211, 3));

  if (v210)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _futureFollowingRequestsInternal](val, "_futureFollowingRequestsInternal"));
    -[FMFDataManager deltasFromExisting:usingLatest:forKey:](val, "deltasFromExisting:usingLatest:forKey:", v17, v210, CFSTR("futureFollowing"));

    -[FMFDataManager set_futureFollowingRequestsInternal:](val, "set_futureFollowingRequestsInternal:", v210);
    v18 = sub_100011D0C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Future following updates received.", buf, 2u);
    }

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[Unmarshaller sharedInstance](Unmarshaller, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "followersUsingData:", v211));

  v206 = v21 != 0;
  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager followerHandles](val, "followerHandles"));
    -[FMFDataManager deltasFromExisting:usingLatest:forKey:](val, "deltasFromExisting:usingLatest:forKey:", v22, v21, CFSTR("followers"));

    -[FMFDataManager setFollowerHandles:](val, "setFollowerHandles:", v21);
    v23 = sub_100011D0C();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Followers updates received.", buf, 2u);
    }

    -[FMFDataManager setFollowersInfoReceived:](val, "setFollowersInfoReceived:", 1);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[Unmarshaller sharedInstance](Unmarshaller, "sharedInstance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "handlesFromData:forType:", v211, 1));

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager followingHandles](val, "followingHandles"));
    -[FMFDataManager deltasFromExisting:usingLatest:forKey:](val, "deltasFromExisting:usingLatest:forKey:", v27, v26, CFSTR("following"));

    -[FMFDataManager setFollowingHandles:](val, "setFollowingHandles:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager favoritesSequencer](val, "favoritesSequencer"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _followingHandleMapWithServerId](val, "_followingHandleMapWithServerId"));
    objc_msgSend(v28, "updateHandlesWithFavorites:", v29);

    v30 = sub_100011D0C();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Following updates received.", buf, 2u);
    }

    v206 = 1;
    -[FMFDataManager setFollowingInfoReceived:](val, "setFollowingInfoReceived:", 1);
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[Unmarshaller sharedInstance](Unmarshaller, "sharedInstance"));
  v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "handlesFromData:forType:", v211, 4));

  if (v208)
  {
    -[FMFDataManager setPendingOfferHandles:](val, "setPendingOfferHandles:", v208);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager changesToBeNotified](val, "changesToBeNotified"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager pendingOfferHandles](val, "pendingOfferHandles"));
    objc_msgSend(v33, "setObject:forKey:", v34, CFSTR("pendingOffers"));

    v35 = sub_100011D0C();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Pending offer updates received.", buf, 2u);
    }

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("config")));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v37 == v38)
  {

    v39 = 0;
  }
  else
  {
    v39 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("config")));

    if (v39)
    {
      -[FMFDataManager set_configFromServer:](val, "set_configFromServer:", v39);
      -[FMFDataManager lazyInitTimeoutInSec](val, "lazyInitTimeoutInSec");
    }
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("features")));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v40 == v41)
  {

    v42 = 0;
  }
  else
  {
    v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("features")));

    if (v42)
      -[FMFDataManager set_features:](val, "set_features:", v42);
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("prefs")));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v43 == v44)
  {
    v45 = 0;
    v64 = v43;
  }
  else
  {
    v45 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("prefs")));

    if (!v45)
      goto LABEL_47;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _preferences](val, "_preferences"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("hideLocation")));
    v48 = objc_msgSend(v47, "BOOLValue");
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("hideLocation")));
    v50 = objc_msgSend(v49, "BOOLValue");

    if (v48 != v50)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("hideLocation")));
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v51, "BOOLValue")));
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v52, CFSTR("updatedStatus")));

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager changesToBeNotified](val, "changesToBeNotified"));
      objc_msgSend(v54, "setObject:forKey:", v53, CFSTR("hideLocation"));

    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _preferences](val, "_preferences"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("allowFriendRequests")));
    v57 = objc_msgSend(v56, "BOOLValue");

    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("allowFriendRequests")));
    v59 = objc_msgSend(v58, "BOOLValue");

    if (v57 != (_DWORD)v59)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v59));
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v60, CFSTR("updatedStatus")));

      v62 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager changesToBeNotified](val, "changesToBeNotified"));
      objc_msgSend(v62, "setObject:forKey:", v61, CFSTR("allowFriendRequests"));

    }
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _preferences](val, "_preferences"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("primaryEmail")));

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("primaryEmail")));
    if ((objc_msgSend(v64, "isEqualToString:", v43) & 1) == 0)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v43, CFSTR("updatedStatus")));
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager changesToBeNotified](val, "changesToBeNotified"));
      objc_msgSend(v66, "setObject:forKey:", v65, CFSTR("primaryEmail"));

    }
    -[FMFDataManager set_preferences:](val, "set_preferences:", v45);
    v67 = sub_100011D0C();
    v42 = objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Prefs updates received.", buf, 2u);
    }
  }

LABEL_47:
  v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("myInfo")));
  v69 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v68 == v69)
  {

    v209 = 0;
LABEL_71:

    goto LABEL_73;
  }
  v209 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("myInfo")));

  if (v209)
  {
    v70 = -[FMFDataManager isActiveAutoMeDevice](val, "isActiveAutoMeDevice");
    -[FMFDataManager set_myInfo:](val, "set_myInfo:", v209);
    if (v70 != -[FMFDataManager isActiveAutoMeDevice](val, "isActiveAutoMeDevice"))
    {
      v71 = sub_100011D0C();
      v72 = objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "digestCommand: Posting Auto Me Device changed notification", buf, 2u);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, FMFHomeKitAutomationDeviceChangedNotification, 0, 0, 1u);
    }
    v237 = 0u;
    v238 = 0u;
    v235 = 0u;
    v236 = 0u;
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _devices](val, "_devices"));
    v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v235, v248, 16);
    if (v75)
    {
      v76 = *(_QWORD *)v236;
      obj = v74;
      do
      {
        for (i = 0; i != v75; i = (char *)i + 1)
        {
          if (*(_QWORD *)v236 != v76)
            objc_enumerationMutation(obj);
          v78 = *(void **)(*((_QWORD *)&v235 + 1) + 8 * (_QWORD)i);
          v79 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _myInfo](val, "_myInfo"));
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("meDeviceId")));
          v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          if (v80 == v81)
          {
            v83 = 0;
          }
          else
          {
            v82 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _myInfo](val, "_myInfo"));
            v83 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("meDeviceId")));

          }
          v84 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _myInfo](val, "_myInfo"));
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("deviceId")));
          v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          if (v85 == v86)
          {
            v88 = 0;
          }
          else
          {
            v87 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _myInfo](val, "_myInfo"));
            v88 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("deviceId")));

          }
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "deviceId"));
          v90 = objc_msgSend(v83, "isEqualToString:", v89);

          v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "deviceId"));
          v92 = objc_msgSend(v88, "isEqualToString:", v91);

          objc_msgSend(v78, "updateIsActive:isThisDevice:", v90, v92);
          -[FMFDataManager determineNewMeDevice](val, "determineNewMeDevice");

        }
        v74 = obj;
        v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v235, v248, 16);
      }
      while (v75);
    }

    v93 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _devices](val, "_devices"));
    if (v93)
    {
      v94 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager changesToBeNotified](val, "changesToBeNotified"));
      v95 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _devices](val, "_devices"));
      objc_msgSend(v94, "setObject:forKey:", v95, CFSTR("devices"));

    }
    v96 = sub_100011D0C();
    v68 = objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "MyInfo update received.", buf, 2u);
    }
    goto LABEL_71;
  }
  v209 = 0;
LABEL_73:
  v97 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("devices")));
  v98 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v97 == v98)
  {
    v207 = 0;
    v103 = v97;
  }
  else
  {
    v207 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("devices")));

    if (!v207)
    {
      v207 = 0;
      goto LABEL_87;
    }
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _myInfo](val, "_myInfo"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("meDeviceId")));
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v100 == v101)
    {
      v103 = 0;
    }
    else
    {
      v102 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _myInfo](val, "_myInfo"));
      v103 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("meDeviceId")));

    }
    v104 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _myInfo](val, "_myInfo"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("deviceId")));
    v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v105 == v106)
    {
      v97 = 0;
    }
    else
    {
      v107 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _myInfo](val, "_myInfo"));
      v97 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("deviceId")));

    }
    v108 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager companionDeviceId](val, "companionDeviceId"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(+[Unmarshaller sharedInstance](Unmarshaller, "sharedInstance"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "devicesFromData:meDeviceId:thisDeviceId:companionDeviceId:", v207, v103, v97, v108));
    -[FMFDataManager set_devices:](val, "set_devices:", v110);

    -[FMFDataManager determineNewMeDevice](val, "determineNewMeDevice");
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager changesToBeNotified](val, "changesToBeNotified"));
    v112 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _devices](val, "_devices"));
    objc_msgSend(v111, "setObject:forKey:", v112, CFSTR("devices"));

    v113 = sub_100011D0C();
    v114 = objc_claimAutoreleasedReturnValue(v113);
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "Devices update received.", buf, 2u);
    }

  }
LABEL_87:
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[Unmarshaller sharedInstance](Unmarshaller, "sharedInstance"));
  v214 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "locationFromRefresh:", v211));

  v216 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  if (v214)
  {
    v233 = 0u;
    v234 = 0u;
    v231 = 0u;
    v232 = 0u;
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v214, "allKeys"));
    v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v231, v247, 16);
    if (v117)
    {
      obja = 0;
      v118 = 0;
      v213 = *(_QWORD *)v232;
      v212 = v116;
      do
      {
        v215 = v117;
        for (j = 0; j != v215; j = (char *)j + 1)
        {
          if (*(_QWORD *)v232 != v213)
            objc_enumerationMutation(v212);
          v120 = *(_QWORD *)(*((_QWORD *)&v231 + 1) + 8 * (_QWORD)j);
          v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v214, "objectForKey:", v120));

          v122 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _locationDictionary](val, "_locationDictionary"));
          v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "objectForKey:", v120));

          obja = v121;
          v118 = v123;
          if (v123)
          {
            v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "location"));
            v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "timestamp"));
            v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "location"));
            v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "timestamp"));
            v128 = objc_msgSend(v125, "isEqualToDate:", v127);

            v129 = v128 ^ 1;
          }
          else
          {
            v129 = 0;
          }
          if (v121)
            v130 = v123 == 0;
          else
            v130 = 0;
          v131 = v130;
          v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "location"));
          if (v132)
          {
            v133 = 1;
          }
          else
          {
            v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "location"));
            v133 = v134 != 0;

          }
          v135 = objc_msgSend(v121, "isMoreRecentThan:", v118);
          if (v133)
          {
            v136 = sub_100011D0C();
            v137 = objc_claimAutoreleasedReturnValue(v136);
            if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
            {
              v139 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "timestamp"));
              v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "timestamp"));
              *(_DWORD *)buf = 138412802;
              v240 = v139;
              v241 = 2112;
              v242 = v140;
              v243 = 1024;
              LODWORD(v244) = v135;
              _os_log_debug_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEBUG, "FMFDataManager: digestCommand: new location timestamp: %@, cached location timestamp: %@, new location is more recent?: %d", buf, 0x1Cu);

            }
            if (((v129 | v131) & v135) == 1)
              objc_msgSend(v216, "addObject:", obja);
          }
          if (v135)
          {
            v138 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _locationDictionary](val, "_locationDictionary"));
            objc_msgSend(v138, "setObject:forKey:", obja, v120);

          }
        }
        v116 = v212;
        v117 = objc_msgSend(v212, "countByEnumeratingWithState:objects:count:", &v231, v247, 16);
      }
      while (v117);
    }
    else
    {
      obja = 0;
      v118 = 0;
    }

    -[FMFDataManager sanitizeLocationsCache:](val, "sanitizeLocationsCache:", 0);
  }
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("locateInProgress")));
  v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v141 == v142)
  {
    v143 = 0;
  }
  else
  {
    v143 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("locateInProgress")));

  }
  v229 = 0u;
  v230 = 0u;
  v227 = 0u;
  v228 = 0u;
  objb = v143;
  v144 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v227, v246, 16);
  if (v144)
  {
    v145 = *(_QWORD *)v228;
    do
    {
      for (k = 0; k != v144; k = (char *)k + 1)
      {
        if (*(_QWORD *)v228 != v145)
          objc_enumerationMutation(objb);
        v147 = *(void **)(*((_QWORD *)&v227 + 1) + 8 * (_QWORD)k);
        v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKeyedSubscript:", CFSTR("id")));
        v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "objectForKeyedSubscript:", CFSTR("status")));
        v150 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _locationDictionary](val, "_locationDictionary"));
        v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "objectForKeyedSubscript:", v148));

        LODWORD(v150) = objc_msgSend(v149, "isEqualToString:", CFSTR("none"));
        v152 = objc_msgSend(v151, "isLocatingInProgress");
        v153 = v150 ^ 1;
        objc_msgSend(v151, "setLocatingInProgress:", v153);
        if (v152 != (_DWORD)v153 && v151 != 0)
        {
          objc_msgSend(v216, "addObject:", v151);
          v155 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _locationDictionary](val, "_locationDictionary"));
          objc_msgSend(v155, "setObject:forKey:", v151, v148);

        }
      }
      v144 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v227, v246, 16);
    }
    while (v144);
  }

  if (objc_msgSend(v216, "count"))
  {
    v156 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager changesToBeNotified](val, "changesToBeNotified"));
    objc_msgSend(v156, "setObject:forKey:", v216, CFSTR("changedLocations"));

    v157 = sub_100011D0C();
    v158 = objc_claimAutoreleasedReturnValue(v157);
    if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_DEFAULT, "Location updates received.", buf, 2u);
    }

  }
  v159 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager changesToBeNotified](val, "changesToBeNotified"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "objectForKeyedSubscript:", CFSTR("following")));
  v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "objectForKeyedSubscript:", CFSTR("removed")));

  v225 = 0u;
  v226 = 0u;
  v223 = 0u;
  v224 = 0u;
  v162 = v161;
  v163 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v223, v245, 16);
  if (v163)
  {
    v164 = *(_QWORD *)v224;
    do
    {
      for (m = 0; m != v163; m = (char *)m + 1)
      {
        if (*(_QWORD *)v224 != v164)
          objc_enumerationMutation(v162);
        v166 = *(void **)(*((_QWORD *)&v223 + 1) + 8 * (_QWORD)m);
        v167 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _locationDictionary](val, "_locationDictionary"));
        v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "serverId"));
        objc_msgSend(v167, "removeObjectForKey:", v168);

      }
      v163 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v223, v245, 16);
    }
    while (v163);
  }

  if (v206)
  {
    v169 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager followerHandles](val, "followerHandles"));
    v170 = (char *)objc_msgSend(v169, "count");
    v171 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager followingHandles](val, "followingHandles"));
    v172 = objc_msgSend(v171, "count");

    v173 = &v170[(_QWORD)v172];
    v174 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", &v170[(_QWORD)v172]));
    v175 = sub_100011D0C();
    v176 = objc_claimAutoreleasedReturnValue(v175);
    if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
    {
      v177 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager followerHandles](val, "followerHandles"));
      v178 = objc_msgSend(v177, "count");
      v179 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager followingHandles](val, "followingHandles"));
      v180 = objc_msgSend(v179, "count");
      *(_DWORD *)buf = 134218496;
      v240 = v173;
      v241 = 2048;
      v242 = v178;
      v243 = 2048;
      v244 = v180;
      _os_log_impl((void *)&_mh_execute_header, v176, OS_LOG_TYPE_DEFAULT, "Updating friends/followers count with total: %lu = followers: %lu + following: %lu", buf, 0x20u);

    }
    v181 = (void *)objc_claimAutoreleasedReturnValue(+[FMFLazyInitController sharedInstance](FMFLazyInitController, "sharedInstance"));
    objc_msgSend(v181, "updateFriendsFollowersCount:", v174);

  }
  v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("prefs")));
  v183 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v182 == v183)
  {
    v184 = 0;
    v185 = v209;
  }
  else
  {
    v184 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("prefs")));

    v185 = v184;
  }

  v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("favorites")));
  v187 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

  v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v186 == v188)
    v189 = 0;
  else
    v189 = v186;
  v190 = v189;

  if (v190)
    v191 = 1;
  else
    v191 = v186 == v187;
  if (v191)
  {
    v192 = sub_100011D0C();
    v193 = objc_claimAutoreleasedReturnValue(v192);
    if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v240 = v190;
      v241 = 1024;
      LODWORD(v242) = v186 == v187;
      _os_log_impl((void *)&_mh_execute_header, v193, OS_LOG_TYPE_DEFAULT, "Favorites received: %@. Should clear favorites: %d", buf, 0x12u);
    }

    v194 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager favoritesSequencer](val, "favoritesSequencer"));
    v195 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _followingHandleMapWithServerId](val, "_followingHandleMapWithServerId"));
    objc_msgSend(v194, "updateHandles:withFavoriteArray:", v195, v190);

    v196 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager changesToBeNotified](val, "changesToBeNotified"));
    objc_msgSend(v196, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("favorites"));

  }
  objc_initWeak((id *)buf, val);
  v197 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager fenceSequencer](val, "fenceSequencer"));
  v221[0] = _NSConcreteStackBlock;
  v221[1] = 3221225472;
  v221[2] = sub_100009FE0;
  v221[3] = &unk_10009A590;
  objc_copyWeak(&v222, (id *)buf);
  objc_msgSend(v197, "setFencesFromResponseDictionary:withCompletion:", v211, v221);

  v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("alert")));
  v199 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v198 == v199)
  {
    v200 = 0;
  }
  else
  {
    v200 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("alert")));

  }
  objc_destroyWeak(&v222);
  objc_destroyWeak((id *)buf);

  objc_sync_exit(val);
  if (v200)
  {
    v201 = sub_100011D0C();
    v202 = objc_claimAutoreleasedReturnValue(v201);
    if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v240 = (char *)v200;
      _os_log_impl((void *)&_mh_execute_header, v202, OS_LOG_TYPE_DEFAULT, "Posting Server Driven Alert Notification with Alert Info %@", buf, 0xCu);
    }

    v203 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v203, "postNotificationName:object:userInfo:", off_1000B2FD0, val, v200);

  }
}

- (NSMutableDictionary)_locationDictionary
{
  return self->__locationDictionary;
}

- (NSMutableDictionary)changesToBeNotified
{
  return self->_changesToBeNotified;
}

- (void)updateSessionCaches:(id)a3 forSessions:(id)a4 pushAllData:(BOOL)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  id v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  _BOOL4 v42;
  id v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSMutableDictionary *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  BOOL v64;
  id v65;
  id obj;
  void *v67;
  uint64_t v68;
  int v69;
  id v70;
  id v71;
  FMFDataManager *v72;
  _BOOL4 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t v78[128];
  uint8_t buf[4];
  _BYTE v80[14];

  v73 = a5;
  v71 = a3;
  v65 = a4;
  v7 = sub_100011D0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "allKeys"));
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v80 = v73;
    *(_WORD *)&v80[4] = 2112;
    *(_QWORD *)&v80[6] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating session caches allData?: %d updates: %@", buf, 0x12u);

  }
  v10 = objc_msgSend(v65, "copy");
  v69 = _os_feature_enabled_impl("FindMy", "Fences_Migration");
  v72 = self;
  objc_sync_enter(v72);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
  if (v11)
  {
    v68 = *(_QWORD *)v75;
    do
    {
      v70 = v11;
      for (i = 0; i != v70; i = (char *)i + 1)
      {
        if (*(_QWORD *)v75 != v68)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager followerHandles](v72, "followerHandles"));
        if (!v73)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("followers")));
          if (v15
            || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("pendingOffers")))) != 0)
          {

          }
          else
          {
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("futureFollower")));
            v64 = v63 == 0;

            if (v64)
              goto LABEL_15;
          }
        }
        v16 = sub_100011D0C();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v80 = v14;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Updating follower handles in session caches: %@", buf, 0xCu);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clientProxy"));
        objc_msgSend(v18, "didUpdateFollowers:", v14);

LABEL_15:
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager followingHandles](v72, "followingHandles"));
        if (!v73)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("following")));
          if (v20)
          {

          }
          else
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("favorites")));
            v22 = v21 == 0;

            if (v22)
              goto LABEL_22;
          }
        }
        v23 = sub_100011D0C();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v80 = v19;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Updating following handles in session caches: %@", buf, 0xCu);
        }

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clientProxy"));
        objc_msgSend(v25, "didUpdateFollowing:", v19);

LABEL_22:
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager fenceSequencer](v72, "fenceSequencer"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "fences"));

        if (v73)
        {
          v28 = 1;
        }
        else
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("updatedFences")));
          v28 = v29 != 0;

        }
        if (((!v28 | v69) & 1) == 0)
        {
          v30 = sub_100011D0C();
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v80 = v27;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Updating fences in session caches: %@", buf, 0xCu);
          }

          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clientProxy"));
          objc_msgSend(v32, "didUpdateFences:", v27);

        }
        if (!v73)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("changedLocations")));
          if (v33)
          {

          }
          else
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("following")));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("removed")));
            v36 = v35 == 0;

            if (v36)
              goto LABEL_42;
          }
        }
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager allLocations](v72, "allLocations"));
        v38 = objc_msgSend(v37, "copy");

        v39 = (unint64_t)objc_msgSend(v19, "count");
        v40 = (unint64_t)objc_msgSend(v38, "count");
        v41 = v40;
        if (v39 && v40 || (v42 = v39 != 0, !(v39 | v40)))
        {
          v44 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v38));
          v45 = sub_100011D0C();
          v46 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v80 = v44;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Updating locations in session caches: %@", buf, 0xCu);
          }

          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clientProxy"));
          objc_msgSend(v47, "didUpdateLocations:", v44);

        }
        else
        {
          v43 = sub_100011D0C();
          v44 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v80 = v42;
            *(_WORD *)&v80[4] = 1024;
            *(_DWORD *)&v80[6] = v41 != 0;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Skipping locations update in session caches. hasFollowingHandles %i, hasLocations %i", buf, 0xEu);
          }
        }

LABEL_42:
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("hideLocation")));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("allowFriendRequests")));
        v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("primaryEmail")));
        v51 = (void *)v50;
        if (v73 || v48 || v49 || v50)
        {
          v52 = objc_opt_new(NSMutableDictionary);
          if (v48)
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("updatedStatus")));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v52, "setObject:forKeyedSubscript:", v53, CFSTR("hideLocation"));

          }
          if (v49)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("updatedStatus")));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v52, "setObject:forKeyedSubscript:", v54, CFSTR("allowFriendRequests"));

          }
          if (v51)
          {
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("updatedStatus")));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v52, "setObject:forKeyedSubscript:", v55, CFSTR("primaryEmailUpdates"));

          }
          v56 = sub_100011D0C();
          v57 = objc_claimAutoreleasedReturnValue(v56);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v80 = v52;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Updating preferences in session caches: %@", buf, 0xCu);
          }

          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clientProxy"));
          objc_msgSend(v58, "didUpdatePreferences:", v52);

        }
        if (v73)
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clientProxy"));
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _meDevice](v72, "_meDevice"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          if (v60 == v61)
          {
            v62 = 0;
          }
          else
          {
            v67 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _meDevice](v72, "_meDevice"));
            v62 = v67;
          }
          objc_msgSend(v59, "didChangeActiveLocationSharingDevice:", v62);
          if (v60 != v61)

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
    }
    while (v11);
  }

  objc_sync_exit(v72);
}

- (NSSet)followingHandles
{
  return -[FMFDataManager _followingHandlesInternal](self, "_followingHandlesInternal");
}

- (NSSet)followerHandles
{
  return -[FMFDataManager _followerHandlesInternal](self, "_followerHandlesInternal");
}

- (NSSet)_followingHandlesInternal
{
  return self->__followingHandlesInternal;
}

- (NSSet)_followerHandlesInternal
{
  return self->__followerHandlesInternal;
}

- (FMFFenceSequencer)fenceSequencer
{
  return self->_fenceSequencer;
}

- (id)allLocations
{
  void *v3;
  void *v4;

  -[FMFDataManager sanitizeLocationsCache:](self, "sanitizeLocationsCache:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _locationDictionary](self, "_locationDictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  return v4;
}

- (void)sanitizeLocationsCache:(id)a3
{
  FMFDataManager *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _locationDictionary](v4, "_locationDictionary"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _locationDictionary](v4, "_locationDictionary"));
    v8 = objc_msgSend(v7, "copy");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keysOfEntriesPassingTest:", &stru_10009A5D0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _locationDictionary](v4, "_locationDictionary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
    objc_msgSend(v10, "removeObjectsForKeys:", v11);

  }
  objc_sync_exit(v4);

}

- (void)deltasFromExisting:(id)a3 usingLatest:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  const __CFString *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v18, "count") && objc_msgSend(v8, "count"))
  {
    v10 = objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v10, "minusSet:", v18);
    if (objc_msgSend(v10, "count"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v10, CFSTR("added")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager changesToBeNotified](self, "changesToBeNotified"));
      objc_msgSend(v12, "setObject:forKey:", v11, v9);

    }
    v13 = objc_msgSend(v18, "mutableCopy");
    objc_msgSend(v13, "minusSet:", v8);
    if (objc_msgSend(v13, "count"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v13, CFSTR("removed")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager changesToBeNotified](self, "changesToBeNotified"));
      objc_msgSend(v15, "setObject:forKey:", v14, v9);

    }
    goto LABEL_14;
  }
  if (objc_msgSend(v18, "count") && !objc_msgSend(v8, "count"))
  {
    v16 = objc_msgSend(v18, "copy");
    v17 = CFSTR("removed");
    goto LABEL_13;
  }
  if (!objc_msgSend(v18, "count") && objc_msgSend(v8, "count"))
  {
    v16 = objc_msgSend(v8, "copy");
    v17 = CFSTR("added");
LABEL_13:
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v16, v17));

    v13 = (id)objc_claimAutoreleasedReturnValue(-[FMFDataManager changesToBeNotified](self, "changesToBeNotified"));
    objc_msgSend(v13, "setObject:forKey:", v10, v9);
LABEL_14:

  }
}

- (FMFDevice)_meDevice
{
  return self->__meDevice;
}

- (void)notifyClientOfUpdates:(id)a3
{
  FMFDataManager *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned int v22;
  unsigned int v23;
  NSObject *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  uint64_t v37;
  void *v38;
  unsigned int v39;
  unsigned int v40;
  NSObject *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *k;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  void *m;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  void *n;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  uint64_t v82;
  void *ii;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  unsigned int v89;
  void *v90;
  id v91;
  id v92;
  uint64_t v93;
  void *jj;
  uint64_t v95;
  id v96;
  NSObject *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  __CFNotificationCenter *v106;
  __CFNotificationCenter *v107;
  id v108;
  NSObject *v109;
  __CFNotificationCenter *v110;
  id v111;
  NSObject *v112;
  void *v113;
  id v114;
  NSObject *v115;
  __CFNotificationCenter *v116;
  void *v117;
  id v118;
  NSObject *v119;
  __CFNotificationCenter *v120;
  __CFNotificationCenter *v121;
  id v122;
  NSObject *v123;
  void *v124;
  id v125;
  NSObject *v126;
  __CFNotificationCenter *v127;
  void *v128;
  void *v129;
  id obj;
  const __CFString *name;
  uint64_t v132;
  FMFDataManager *v133;
  FMFDataManager *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  uint64_t v140;
  id v141;
  uint64_t v142;
  id v143;
  uint64_t v144;
  void *v145;
  id v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  uint8_t buf[4];
  FMFDataManager *v184;
  __int16 v185;
  uint64_t v186;
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];

  v4 = (FMFDataManager *)a3;
  -[FMFDataManager updateInited](self, "updateInited");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v6 = objc_msgSend(v5, "hasModelInitialized");

  v7 = sub_100011D0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v184 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "\n    ************************************************************************\n              Updates received %@\n    ************************************************************************", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "clientSessions"));
    v12 = objc_msgSend(v11, "copy");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("followers")));
    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("added")));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("followers")));
    v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("removed")));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("following")));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("added")));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("following")));
    v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("removed")));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("futureFollower")));
    v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("added")));

    v181 = 0u;
    v182 = 0u;
    v179 = 0u;
    v180 = 0u;
    obj = v12;
    v138 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v179, v195, 16);
    if (v138)
    {
      v18 = 0;
      name = (const __CFString *)FMFLocationSharingStatusChanged;
      v132 = *(_QWORD *)v180;
      v133 = self;
      v134 = v4;
      while (1)
      {
        v19 = 0;
        v20 = v18;
        do
        {
          if (*(_QWORD *)v180 != v132)
            objc_enumerationMutation(obj);
          v140 = v19;
          v21 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * v19);
          v22 = -[FMFDataManager transcriptDelegateStartEnabled](self, "transcriptDelegateStartEnabled");
          v23 = -[FMFDataManager followersFullyInited](self, "followersFullyInited");
          v145 = v21;
          if (v22)
          {
            if (v23)
            {
              v177 = 0u;
              v178 = 0u;
              v175 = 0u;
              v176 = 0u;
              v24 = v128;
              v25 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v175, v194, 16);
              if (v25)
              {
                v26 = v25;
                v27 = *(_QWORD *)v176;
                do
                {
                  for (i = 0; i != v26; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v176 != v27)
                      objc_enumerationMutation(v24);
                    v29 = *(_QWORD *)(*((_QWORD *)&v175 + 1) + 8 * (_QWORD)i);
                    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientProxy"));
                    objc_msgSend(v30, "didAddFollowerHandle:", v29);

                    v21 = v145;
                  }
                  v26 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v175, v194, 16);
                }
                while (v26);
              }
            }
            else
            {
              v31 = sub_100011D0C();
              v24 = objc_claimAutoreleasedReturnValue(v31);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Skipping sending followers, not fully inited", buf, 2u);
              }
            }
            goto LABEL_24;
          }
          if (v23 && objc_msgSend(v128, "count"))
          {
            v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientProxy"));
            -[NSObject didAddFollowerHandle:](v24, "didAddFollowerHandle:", 0);
LABEL_24:

          }
          if (-[FMFDataManager transcriptDelegateStopEnabled](self, "transcriptDelegateStopEnabled"))
          {
            v173 = 0u;
            v174 = 0u;
            v171 = 0u;
            v172 = 0u;
            v32 = v136;
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v171, v193, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v172;
              do
              {
                for (j = 0; j != v34; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v172 != v35)
                    objc_enumerationMutation(v32);
                  v37 = *(_QWORD *)(*((_QWORD *)&v171 + 1) + 8 * (_QWORD)j);
                  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientProxy"));
                  objc_msgSend(v38, "didRemoveFollowerHandle:", v37);

                  v21 = v145;
                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v171, v193, 16);
              }
              while (v34);
            }
          }
          else
          {
            if (!objc_msgSend(v136, "count"))
              goto LABEL_37;
            v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientProxy"));
            objc_msgSend(v32, "didRemoveFollowerHandle:", 0);
          }

LABEL_37:
          v39 = -[FMFDataManager transcriptDelegateStartEnabled](self, "transcriptDelegateStartEnabled");
          v40 = -[FMFDataManager followingFullyInited](self, "followingFullyInited");
          if (v39)
          {
            if (v40)
            {
              v169 = 0u;
              v170 = 0u;
              v167 = 0u;
              v168 = 0u;
              v41 = v129;
              v42 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v167, v192, 16);
              if (v42)
              {
                v43 = v42;
                v44 = *(_QWORD *)v168;
                do
                {
                  for (k = 0; k != v43; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v168 != v44)
                      objc_enumerationMutation(v41);
                    v46 = *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * (_QWORD)k);
                    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientProxy"));
                    objc_msgSend(v47, "didStartFollowingHandle:", v46);

                    v21 = v145;
                  }
                  v43 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v167, v192, 16);
                }
                while (v43);
              }
            }
            else
            {
              v48 = sub_100011D0C();
              v41 = objc_claimAutoreleasedReturnValue(v48);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Skipping sending following, not fully inited", buf, 2u);
              }
            }
            goto LABEL_52;
          }
          if (v40 && objc_msgSend(v129, "count"))
          {
            v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientProxy"));
            -[NSObject didStartFollowingHandle:](v41, "didStartFollowingHandle:", 0);
LABEL_52:

          }
          if (-[FMFDataManager transcriptDelegateStopEnabled](self, "transcriptDelegateStopEnabled"))
          {
            v165 = 0u;
            v166 = 0u;
            v163 = 0u;
            v164 = 0u;
            v49 = v137;
            v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v163, v191, 16);
            if (v50)
            {
              v51 = v50;
              v52 = *(_QWORD *)v164;
              do
              {
                for (m = 0; m != v51; m = (char *)m + 1)
                {
                  if (*(_QWORD *)v164 != v52)
                    objc_enumerationMutation(v49);
                  v54 = *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * (_QWORD)m);
                  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientProxy"));
                  objc_msgSend(v55, "didStopFollowingHandle:", v54);

                  v21 = v145;
                }
                v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v163, v191, 16);
              }
              while (v51);
            }
          }
          else
          {
            if (!objc_msgSend(v137, "count"))
              goto LABEL_65;
            v49 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientProxy"));
            objc_msgSend(v49, "didStopFollowingHandle:", 0);
          }

LABEL_65:
          v161 = 0u;
          v162 = 0u;
          v159 = 0u;
          v160 = 0u;
          v56 = v135;
          v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v159, v190, 16);
          if (v57)
          {
            v58 = v57;
            v59 = *(_QWORD *)v160;
            do
            {
              for (n = 0; n != v58; n = (char *)n + 1)
              {
                if (*(_QWORD *)v160 != v59)
                  objc_enumerationMutation(v56);
                v61 = *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * (_QWORD)n);
                v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientProxy"));
                objc_msgSend(v62, "didReceiveFriendshipRequest:", v61);

                v21 = v145;
              }
              v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v159, v190, 16);
            }
            while (v58);
          }

          v63 = objc_claimAutoreleasedReturnValue(-[FMFDataManager objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("pendingOffers")));
          if (v63)
          {
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientProxy"));
            objc_msgSend(v64, "didUpdatePendingOffersForHandles:", v63);

          }
          v139 = (void *)v63;
          v65 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("hideLocation")));

          if (v65)
          {
            v66 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("hideLocation")));
            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("updatedStatus")));
            v68 = objc_msgSend(v67, "BOOLValue");

            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientProxy"));
            objc_msgSend(v69, "didUpdateHideFromFollowersStatus:", v68);

            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
          }
          v71 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("favorites")));

          if (v71)
          {
            v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "clientProxy"));
            v73 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager favoritesSequencer](self, "favoritesSequencer"));
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "favorites"));
            objc_msgSend(v72, "didUpdateFavorites:", v74);

          }
          v146 = objc_alloc_init((Class)NSMutableSet);
          v155 = 0u;
          v156 = 0u;
          v157 = 0u;
          v158 = 0u;
          v141 = (id)objc_claimAutoreleasedReturnValue(-[FMFDataManager objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("changedLocations")));
          v143 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v155, v189, 16);
          if (v143)
          {
            v142 = *(_QWORD *)v156;
            do
            {
              v75 = 0;
              do
              {
                if (*(_QWORD *)v156 != v142)
                  objc_enumerationMutation(v141);
                v144 = v75;
                v76 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * v75);
                v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "handles"));
                v78 = objc_msgSend(v77, "copy");

                v153 = 0u;
                v154 = 0u;
                v151 = 0u;
                v152 = 0u;
                v79 = v78;
                v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v151, v188, 16);
                if (v80)
                {
                  v81 = v80;
                  v82 = *(_QWORD *)v152;
                  do
                  {
                    for (ii = 0; ii != v81; ii = (char *)ii + 1)
                    {
                      if (*(_QWORD *)v152 != v82)
                        objc_enumerationMutation(v79);
                      v84 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * (_QWORD)ii);
                      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "handle"));
                      if (objc_msgSend(v85, "isEqual:", v84))
                      {

                      }
                      else
                      {
                        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "serverId"));
                        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "handle"));
                        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "serverId"));
                        v89 = objc_msgSend(v86, "isEqualToString:", v88);

                        if (!v89)
                          continue;
                      }
                      objc_msgSend(v146, "addObject:", v76);
                    }
                    v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v151, v188, 16);
                  }
                  while (v81);
                }

                v75 = v144 + 1;
                v21 = v145;
              }
              while ((id)(v144 + 1) != v143);
              v143 = objc_msgSend(v141, "countByEnumeratingWithState:objects:count:", &v155, v189, 16);
            }
            while (v143);
          }

          v149 = 0u;
          v150 = 0u;
          v147 = 0u;
          v148 = 0u;
          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "allObjects"));
          v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v147, v187, 16);
          self = v133;
          v4 = v134;
          if (v91)
          {
            v92 = v91;
            v93 = *(_QWORD *)v148;
            do
            {
              for (jj = 0; jj != v92; jj = (char *)jj + 1)
              {
                if (*(_QWORD *)v148 != v93)
                  objc_enumerationMutation(v90);
                v95 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * (_QWORD)jj);
                v96 = sub_100011D0C();
                v97 = objc_claimAutoreleasedReturnValue(v96);
                if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v184 = v133;
                  v185 = 2112;
                  v186 = v95;
                  _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "%@: ingesting (notify): %@", buf, 0x16u);
                }

              }
              v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v147, v187, 16);
            }
            while (v92);
          }

          v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "clientProxy"));
          v99 = objc_msgSend(v146, "copy");
          objc_msgSend(v98, "setLocations:", v99);

          v100 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager objectForKeyedSubscript:](v134, "objectForKeyedSubscript:", CFSTR("meDevice")));
          if (v100)
          {
            v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "clientProxy"));
            v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            if (v100 == v102)
              v103 = 0;
            else
              v103 = v100;
            objc_msgSend(v101, "didChangeActiveLocationSharingDevice:", v103);

          }
          v104 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager objectForKeyedSubscript:](v134, "objectForKeyedSubscript:", CFSTR("devices")));
          if (v104)
          {
            v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "clientProxy"));
            objc_msgSend(v105, "didUpdateActiveDeviceList:", v104);

          }
          v18 = v139;
          v19 = v140 + 1;
          v20 = v139;
        }
        while ((id)(v140 + 1) != v138);
        v138 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v179, v195, 16);
        if (!v138)
        {

          break;
        }
      }
    }

    if (objc_msgSend(v128, "count") || objc_msgSend(v136, "count"))
    {
      v106 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v106, FMFFollowersChangedNotification, 0, 0, 0);
    }
    if (objc_msgSend(v136, "count"))
    {
      v107 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v107, FMFFollowersRemovedNotification, 0, 0, 1u);
      v108 = sub_100011D0C();
      v109 = objc_claimAutoreleasedReturnValue(v108);
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "notifyClientOfUpdates: secureLocations - posted removedFollowers notification", buf, 2u);
      }

    }
    if (objc_msgSend(v137, "count"))
    {
      v110 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v110, FMFFollowingRemovedNotification, 0, 0, 1u);
      v111 = sub_100011D0C();
      v112 = objc_claimAutoreleasedReturnValue(v111);
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "notifyClientOfUpdates: secureLocations - posted removedFollowings notification", buf, 2u);
      }

    }
    if (objc_msgSend(v129, "count") || objc_msgSend(v137, "count"))
      -[FMFDataManager donateFollowingsChangeEventsForAddedFollowings:removedFollowings:](self, "donateFollowingsChangeEventsForAddedFollowings:removedFollowings:", v129, v137);
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("meDevice")));
    if (v113)
    {
      v114 = sub_100011D0C();
      v115 = objc_claimAutoreleasedReturnValue(v114);
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "notifyClientOfUpdates: Posting Me Device changed notification", buf, 2u);
      }

      v116 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v116, FMFMeDeviceChangedNotification, 0, 0, 1u);
    }
    v117 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("devices")));
    if (v117)
    {
      v118 = sub_100011D0C();
      v119 = objc_claimAutoreleasedReturnValue(v118);
      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "notifyClientOfUpdates: Posting Devices changed notification", buf, 2u);
      }

      v120 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v120, FMFDevicesChangedNotification, 0, 0, 1u);
    }
    v121 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v121, FMFDataUpdateCompleteNotification, 0, 0, 1u);
    v122 = sub_100011D0C();
    v123 = objc_claimAutoreleasedReturnValue(v122);
    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "notifyClientOfUpdates: Posted notification of dataUpdate complete", buf, 2u);
    }

  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v184 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "notifyClientOfUpdates: Skipping notifying delegates as model is not fully initialized for updatas: %@", buf, 0xCu);
    }

    v124 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("devices")));
    if (v124)
    {
      v125 = sub_100011D0C();
      v126 = objc_claimAutoreleasedReturnValue(v125);
      if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "notifyClientOfUpdates: Posting Devices changed notification", buf, 2u);
      }

      v127 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v127, FMFDevicesChangedNotification, 0, 0, 1u);
    }
  }

}

- (BOOL)transcriptDelegateStopEnabled
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("transcriptDelegateStopEnabled")));

  v4 = objc_msgSend(v3, "BOOLValue");
  if (v3)
    v5 = v4;
  else
    v5 = 1;

  return v5;
}

- (BOOL)transcriptDelegateStartEnabled
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("transcriptDelegateStartEnabled")));

  v4 = objc_msgSend(v3, "BOOLValue");
  if (v3)
    v5 = v4;
  else
    v5 = 1;

  return v5;
}

- (BOOL)followingFullyInited
{
  return self->_followingFullyInited;
}

- (BOOL)followersFullyInited
{
  return self->_followersFullyInited;
}

+ (id)sharedInstance
{
  if (qword_1000B37E8 != -1)
    dispatch_once(&qword_1000B37E8, &stru_10009A568);
  return (id)qword_1000B37E0;
}

- (double)maxLocatingInterval
{
  void *v2;
  void *v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("maxLocatingIntervalInMS")));
  v4 = (double)((unint64_t)objc_msgSend(v3, "unsignedIntegerValue") / 0x3E8);

  return v4;
}

- (double)locationTTL
{
  void *v2;
  void *v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("locationTTL")));
  v4 = (double)((unint64_t)objc_msgSend(v3, "unsignedIntegerValue") / 0x3E8);

  return v4;
}

- (NSDictionary)_configFromServer
{
  void *v3;
  void *v4;

  if (!-[FMFDataManager storedConfigLoaded](self, "storedConfigLoaded"))
  {
    -[FMFDataManager setStoredConfigLoaded:](self, "setStoredConfigLoaded:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("storedConfigKey")));
    -[FMFDataManager set_configFromServer:](self, "set_configFromServer:", v4);

  }
  return self->__configFromServer;
}

- (BOOL)storedConfigLoaded
{
  return self->_storedConfigLoaded;
}

- (id)followingHandleForServerId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _followingHandleMapWithServerId](self, "_followingHandleMapWithServerId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (NSDictionary)_followingHandleMapWithServerId
{
  return self->__followingHandleMapWithServerId;
}

- (void)updateInited
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (-[FMFDataManager followersInfoReceived](self, "followersInfoReceived")
    && !-[FMFDataManager followersFullyInited](self, "followersFullyInited"))
  {
    v3 = sub_100011D0C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fully initing followers", buf, 2u);
    }

    -[FMFDataManager setFollowersFullyInited:](self, "setFollowersFullyInited:", 1);
  }
  if (-[FMFDataManager followingInfoReceived](self, "followingInfoReceived")
    && !-[FMFDataManager followingFullyInited](self, "followingFullyInited"))
  {
    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fully initing following", v7, 2u);
    }

    -[FMFDataManager setFollowingFullyInited:](self, "setFollowingFullyInited:", 1);
  }
}

- (void)set_followingHandlesInternal:(id)a3
{
  objc_storeStrong((id *)&self->__followingHandlesInternal, a3);
}

- (void)set_followingHandleMapWithServerId:(id)a3
{
  objc_storeStrong((id *)&self->__followingHandleMapWithServerId, a3);
}

- (void)set_followingHandleMapWithIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->__followingHandleMapWithIdentifier, a3);
}

- (void)set_followerHandlesInternal:(id)a3
{
  objc_storeStrong((id *)&self->__followerHandlesInternal, a3);
}

- (void)set_followerHandleMapWithServerId:(id)a3
{
  objc_storeStrong((id *)&self->__followerHandleMapWithServerId, a3);
}

- (void)set_followerHandleMapWithIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->__followerHandleMapWithIdentifier, a3);
}

- (void)setModelVersion:(id)a3
{
  objc_storeStrong((id *)&self->_modelVersion, a3);
}

- (void)setFollowingInfoReceived:(BOOL)a3
{
  self->_followingInfoReceived = a3;
}

- (void)setFollowersInfoReceived:(BOOL)a3
{
  self->_followersInfoReceived = a3;
}

- (void)setChangesToBeNotified:(id)a3
{
  objc_storeStrong((id *)&self->_changesToBeNotified, a3);
}

- (void)setCachedTapMessages:(id)a3
{
  objc_storeStrong((id *)&self->_cachedTapMessages, a3);
}

- (NSSet)pendingOfferHandles
{
  return self->_pendingOfferHandles;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (BOOL)followingInfoReceived
{
  return self->_followingInfoReceived;
}

- (BOOL)followersInfoReceived
{
  return self->_followersInfoReceived;
}

- (FMFFavoritesSequencer)favoritesSequencer
{
  return self->_favoritesSequencer;
}

- (NSArray)cachedTapMessages
{
  NSArray *cachedTapMessages;
  void *v4;

  cachedTapMessages = self->_cachedTapMessages;
  if (!cachedTapMessages)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager tapMessagesFromDefaults](self, "tapMessagesFromDefaults"));
    -[FMFDataManager setCachedTapMessages:](self, "setCachedTapMessages:", v4);

    cachedTapMessages = self->_cachedTapMessages;
  }
  return cachedTapMessages;
}

- (id)followerHandleForFence:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "followerIds"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_claimAutoreleasedReturnValue(-[FMFDataManager followingHandleForServerId:](self, "followingHandleForServerId:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v9)));
        if (v10)
        {
          v16 = (void *)v10;
          goto LABEL_19;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v7)
        continue;
      break;
    }
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recipients", 0));
  v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
LABEL_11:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v13)
        objc_enumerationMutation(v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "identifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager followingHandleForServerId:](self, "followingHandleForServerId:", v15));

      if (v16)
        break;
      if (v12 == (id)++v14)
      {
        v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    v16 = 0;
  }
LABEL_19:

  return v16;
}

- (id)followedHandleForFence:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "friendIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager followingHandleForServerId:](self, "followingHandleForServerId:", v4));

  return v5;
}

- (void)cleanupCaches
{
  FMFDataManager *v2;
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v2 = self;
  objc_sync_enter(v2);
  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cleaning up caches", buf, 2u);
  }

  -[FMFDataManager setModelVersion:](v2, "setModelVersion:", 0);
  -[FMFDataManager setFollowingHandles:](v2, "setFollowingHandles:", 0);
  -[FMFDataManager setFollowerHandles:](v2, "setFollowerHandles:", 0);
  -[FMFDataManager set_configFromServer:](v2, "set_configFromServer:", 0);
  -[FMFDataManager set_devices:](v2, "set_devices:", 0);
  -[FMFDataManager set_meDevice:](v2, "set_meDevice:", 0);
  -[FMFDataManager set_features:](v2, "set_features:", 0);
  -[FMFDataManager set_preferences:](v2, "set_preferences:", 0);
  -[FMFDataManager set_myInfo:](v2, "set_myInfo:", 0);
  -[FMFDataManager set_followingHandleMapWithIdentifier:](v2, "set_followingHandleMapWithIdentifier:", 0);
  -[FMFDataManager set_followingHandleMapWithServerId:](v2, "set_followingHandleMapWithServerId:", 0);
  -[FMFDataManager set_followerHandleMapWithIdentifier:](v2, "set_followerHandleMapWithIdentifier:", 0);
  -[FMFDataManager set_followerHandleMapWithServerId:](v2, "set_followerHandleMapWithServerId:", 0);
  -[FMFDataManager set_followingHandlesInternal:](v2, "set_followingHandlesInternal:", 0);
  -[FMFDataManager set_followerHandlesInternal:](v2, "set_followerHandlesInternal:", 0);
  -[FMFDataManager set_futureFollowingRequestsInternal:](v2, "set_futureFollowingRequestsInternal:", 0);
  -[FMFDataManager set_futureFollowerRequestsInternal:](v2, "set_futureFollowerRequestsInternal:", 0);
  -[FMFDataManager set_futureFollowerRequestMapWithIdentifier:](v2, "set_futureFollowerRequestMapWithIdentifier:", 0);
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  -[FMFDataManager set_locationDictionary:](v2, "set_locationDictionary:", v5);

  -[FMFDataManager setPendingOfferHandles:](v2, "setPendingOfferHandles:", 0);
  -[FMFDataManager setFollowersInfoReceived:](v2, "setFollowersInfoReceived:", 0);
  -[FMFDataManager setFollowingInfoReceived:](v2, "setFollowingInfoReceived:", 0);
  -[FMFDataManager setFollowersFullyInited:](v2, "setFollowersFullyInited:", 0);
  -[FMFDataManager setFollowingFullyInited:](v2, "setFollowingFullyInited:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager storeController](v2, "storeController"));
  objc_msgSend(v6, "cleanupOldModel");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager fenceSequencer](v2, "fenceSequencer"));
  objc_msgSend(v7, "reset");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager favoritesSequencer](v2, "favoritesSequencer"));
  objc_msgSend(v8, "reset");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("storedConfigKey"));

  v10 = sub_100011D0C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cleaning up session caches", v15, 2u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientSessions"));
  -[FMFDataManager updateSessionCaches:forSessions:pushAllData:](v2, "updateSessionCaches:forSessions:pushAllData:", 0, v13, 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  objc_msgSend(v14, "resetModelToUninitialized");

  objc_sync_exit(v2);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager sanitizeLocationsCacheTimer](self, "sanitizeLocationsCacheTimer"));
  objc_msgSend(v4, "invalidate");

  -[FMFDataManager setSanitizeLocationsCacheTimer:](self, "setSanitizeLocationsCacheTimer:", 0);
  v5.receiver = self;
  v5.super_class = (Class)FMFDataManager;
  -[FMFDataManager dealloc](&v5, "dealloc");
}

- (void)cleanupOldModel
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "cleaning up old model due to ModelIsOldNotification", v5, 2u);
  }

  -[FMFDataManager cleanupCaches](self, "cleanupCaches");
}

- (void)accountWasRemoved
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "accountWasRemoved due to FMFAccountWasRemovedNotification", v5, 2u);
  }

  -[FMFDataManager cleanupCaches](self, "cleanupCaches");
}

- (void)determineNewMeDevice
{
  FMFDataManager *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = self;
  objc_sync_enter(v2);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _devices](v2, "_devices", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isActiveDevice"))
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _meDevice](v2, "_meDevice"));
  v9 = objc_msgSend(v8, "isEqual:", v4);

  if ((v9 & 1) == 0)
  {
    -[FMFDataManager set_meDevice:](v2, "set_meDevice:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager changesToBeNotified](v2, "changesToBeNotified"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _meDevice](v2, "_meDevice"));
    v12 = v11;
    if (!v11)
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("meDevice"));
    if (!v11)

  }
  objc_sync_exit(v2);

}

- (void)set_configFromServer:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->__configFromServer, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "setObject:forKey:", self->__configFromServer, CFSTR("storedConfigKey"));

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v7, "synchronize");

}

- (id)lastLoggedInPrsId
{
  NSString *lastLoggedInPrsIdInternal;
  void *v4;
  NSString *v5;
  NSString *v6;

  lastLoggedInPrsIdInternal = self->_lastLoggedInPrsIdInternal;
  if (!lastLoggedInPrsIdInternal)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("kFMFDlastLoggedInPrsId")));
    v6 = self->_lastLoggedInPrsIdInternal;
    self->_lastLoggedInPrsIdInternal = v5;

    lastLoggedInPrsIdInternal = self->_lastLoggedInPrsIdInternal;
  }
  return lastLoggedInPrsIdInternal;
}

- (void)updateLastLoggedInPrsId:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSString *lastLoggedInPrsIdInternal;
  void *v8;
  void *v9;
  NSString *v10;
  int v11;
  id v12;
  __int16 v13;
  NSString *v14;

  v4 = a3;
  if (v4)
  {
    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      lastLoggedInPrsIdInternal = self->_lastLoggedInPrsIdInternal;
      v11 = 138412546;
      v12 = v4;
      v13 = 2112;
      v14 = lastLoggedInPrsIdInternal;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating last logged in prs id to: %@, current value: %@", (uint8_t *)&v11, 0x16u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v8, "setObject:forKey:", v4, CFSTR("kFMFDlastLoggedInPrsId"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v9, "synchronize");

    v10 = self->_lastLoggedInPrsIdInternal;
    self->_lastLoggedInPrsIdInternal = 0;

  }
}

- (void)donateFollowingsChangeEventsForAddedFollowings:(id)a3 removedFollowings:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BMStreams findMyLocationChangeStream](BMStreams, "findMyLocationChangeStream"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v12);
        v14 = objc_alloc((Class)BMFindMyLocationChangeEvent);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
        v16 = objc_msgSend(v14, "initWithIDSHandle:locationChangeType:", v15, 1);

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "source"));
        objc_msgSend(v17, "sendEvent:", v16);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v10);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v18 = v6;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v31;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v22);
        v24 = objc_alloc((Class)BMFindMyLocationChangeEvent);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier", (_QWORD)v30));
        v26 = objc_msgSend(v24, "initWithIDSHandle:locationChangeType:", v25, 2);

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "source"));
        objc_msgSend(v27, "sendEvent:", v26);

        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v20);
  }

  v28 = objc_msgSend(objc_alloc((Class)CHSTimelineController), "initForAvocadoIdentifier:inBundleIdentifier:", CFSTR("com.apple.findmy.FindMyWidgetPeople"), CFSTR("com.apple.findmy.FindMyWidgetPeople"));
  v29 = objc_msgSend(v28, "reloadTimeline");

}

- (id)deviceSharingLocation
{
  FMFDataManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _meDevice](v2, "_meDevice"));
  objc_sync_exit(v2);

  return v3;
}

- (id)allDevices
{
  FMFDataManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _devices](v2, "_devices"));
  objc_sync_exit(v2);

  return v3;
}

- (id)thisDeviceId
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _myInfo](self, "_myInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("deviceId")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v4 == v5)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _myInfo](self, "_myInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceId")));

  }
  return v7;
}

- (id)companionDeviceId
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _myInfo](self, "_myInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("companionDeviceId")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v4 == v5)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _myInfo](self, "_myInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("companionDeviceId")));

  }
  if (v7 && objc_msgSend(v7, "length"))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setFutureFollowerRequests:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  -[FMFDataManager set_futureFollowerRequestsInternal:](self, "set_futureFollowerRequestsInternal:", v4);
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fromHandle", (_QWORD)v15));

        if (v9)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
          objc_msgSend(v5, "setObject:forKey:", v13, v14);

        }
        v11 = (char *)v11 + 1;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);

  }
  -[FMFDataManager set_futureFollowerRequestMapWithIdentifier:](self, "set_futureFollowerRequestMapWithIdentifier:", v5);

}

- (void)setLocationsFromData:(id)a3
{
  id v4;
  FMFDataManager *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  unsigned int v43;
  _BYTE v44[128];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[Unmarshaller sharedInstance](Unmarshaller, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locationFromRefresh:", v4));

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v30 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  obj = v8;
  if (v9)
  {
    v10 = 0;
    v32 = *(_QWORD *)v35;
    do
    {
      v33 = v9;
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _followerHandleMapWithIdentifier](v5, "_followerHandleMapWithIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "handle"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v15));

        v10 = (void *)v16;
        if (!v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _followingHandleMapWithServerId](v5, "_followingHandleMapWithServerId"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "handle"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "serverId"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v19));

          if (!v10)
            continue;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _locationDictionary](v5, "_locationDictionary"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serverId"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", v21));

        v23 = objc_msgSend(v12, "isMoreRecentThan:", v22);
        v24 = sub_100011D0C();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "timestamp"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "timestamp"));
          *(_DWORD *)buf = 138412802;
          v39 = v28;
          v40 = 2112;
          v41 = v29;
          v42 = 1024;
          v43 = v23;
          _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "FMFDataManager: setLocationsFromData: new location timestamp: %@, cached location timestamp: %@, new location is more recent?: %d", buf, 0x1Cu);

        }
        if (v23)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _locationDictionary](v5, "_locationDictionary"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serverId"));
          objc_msgSend(v26, "setObject:forKey:", v12, v27);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v9);

  }
  objc_sync_exit(v5);

}

- (id)futureFollowingRequests
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _futureFollowingRequestsInternal](self, "_futureFollowingRequestsInternal"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (id)futureFollowerRequests
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _futureFollowerRequestsInternal](self, "_futureFollowerRequestsInternal"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (id)followingHandleForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _followingHandleMapWithIdentifier](self, "_followingHandleMapWithIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (id)followerHandleForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _followerHandleMapWithIdentifier](self, "_followerHandleMapWithIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (id)locationForHandle:(id)a3
{
  id v4;
  FMFDataManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager followingHandleForIdentifier:](v5, "followingHandleForIdentifier:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _locationDictionary](v5, "_locationDictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serverId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));

  -[FMFDataManager locationTTL](v5, "locationTTL");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timestamp"));
  objc_msgSend(v13, "timeIntervalSinceDate:", v14);
  v16 = v15;

  if (!v10)
  {
LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend(v10, "isValid") & 1) == 0)
  {
    v20 = sub_100011D0C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 138412802;
      v30 = v10;
      v31 = 2048;
      v32 = v16;
      v33 = 2048;
      v34 = (uint64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Cleaning up old location, location %@, locationAge: %f, locationTTL: %ld", (uint8_t *)&v29, 0x20u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serverId"));
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _locationDictionary](v5, "_locationDictionary"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serverId"));
      objc_msgSend(v23, "removeObjectForKey:", v24);

    }
    goto LABEL_9;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "handle"));
  v18 = objc_msgSend(v17, "isEqual:", v4);

  if ((v18 & 1) != 0)
  {
    v19 = v10;
  }
  else
  {
    v19 = objc_msgSend(v10, "copy");

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serverId"));
    if (!v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "handle"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "serverId"));
      objc_msgSend(v4, "setServerId:", v28);

    }
    objc_msgSend(v19, "updateHandle:", v4);
  }
LABEL_10:

  objc_sync_exit(v5);
  return v19;
}

- (BOOL)locationHidden
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _preferences](self, "_preferences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hideLocation")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v4 == v5)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _preferences](self, "_preferences"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hideLocation")));

  }
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Yes"));

  return v8;
}

- (BOOL)isAllowFriendRequestsEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _preferences](self, "_preferences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("allowFriendRequests")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v4 == v5)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _preferences](self, "_preferences"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allowFriendRequests")));

  }
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Yes"));

  return v8;
}

- (id)getAccountEmailAddress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _preferences](self, "_preferences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("primaryEmail")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v4 == v5)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _preferences](self, "_preferences"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("primaryEmail")));

  }
  return v7;
}

- (id)locationsForHandles:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableSet);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager locationForHandle:](self, "locationForHandle:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), (_QWORD)v14));

        if (v9)
          objc_msgSend(v5, "addObject:", v9);
        v11 = (char *)v11 + 1;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);

  }
  return v5;
}

- (id)friendshipRequestForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _futureFollowerRequestMapWithIdentifier](self, "_futureFollowerRequestMapWithIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (id)followerHandleForServerId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _followerHandleMapWithServerId](self, "_followerHandleMapWithServerId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

- (void)getHandlesSharingLocationsWithMe:(id)a3
{
  void (**v4)(id, id, _QWORD);
  id v5;

  v4 = (void (**)(id, id, _QWORD))a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMFDataManager followingHandles](self, "followingHandles"));
  v4[2](v4, v5, 0);

}

- (void)getHandlesSharingLocationsWithMeWithGroupId:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager followingHandles](self, "followingHandles"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100036AF8;
  v12[3] = &unk_10009A5F8;
  v13 = v6;
  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v12));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredSetUsingPredicate:", v10));

  v7[2](v7, v11, 0);
}

- (void)getHandlesSharingMyLocation:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FMFDataManager followerHandles](self, "followerHandles"));
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

}

- (void)getHandlesSharingMyLocationWithGroupId:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager followerHandles](self, "followerHandles"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100036C58;
  v12[3] = &unk_10009A5F8;
  v13 = v6;
  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v12));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredSetUsingPredicate:", v10));

  v7[2](v7, v11, 0);
}

- (void)getPendingFriendshipRequestsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100036D08;
  v7[3] = &unk_100099948;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "refreshForSession:withReason:withCompletion:", 0, 3, v7);

}

- (void)getHandlesWithPendingOffers:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FMFDataManager getHandlesWithPendingOffersSync](self, "getHandlesWithPendingOffersSync"));
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

}

- (void)removeFutureFollowerRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _futureFollowerRequestMapWithIdentifier](self, "_futureFollowerRequestMapWithIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fromHandle"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v7));

  v8 = objc_alloc((Class)NSMutableSet);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _futureFollowerRequestsInternal](self, "_futureFollowerRequestsInternal"));
  v10 = objc_msgSend(v8, "initWithSet:", v9);

  if (v11)
    objc_msgSend(v10, "removeObject:", v11);
  -[FMFDataManager setFutureFollowerRequests:](self, "setFutureFollowerRequests:", v10);

}

- (id)offerExpireDateForHandle:(id)a3 withGroupId:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;

  v5 = a4;
  v6 = v5;
  if (!v5)
    v6 = FMFGroupIdOneToOne;
  v7 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "expiresByGroupId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));

  objc_msgSend(v9, "doubleValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v10 / 1000.0));

  return v11;
}

- (BOOL)sendOnlyFMFChannel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sendOnlyFMFChannel")));

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (BOOL)blockFMFChannel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("blockFMFChannel")));

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (BOOL)showAirDropImportAlert
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("showAirDropImportAlert")));

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)showAirDropImportUseFMFAppAlert
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("showAirDropImportUseFMFAppAlert")));

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)showAirDropImportViewOniCloudAlert
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("showAirDropImportViewOniCloudAlert")));

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)canAddFollower
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxFollowers")));
  v5 = objc_msgSend(v4, "unsignedIntegerValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager followerHandles](self, "followerHandles"));
  LOBYTE(v5) = v5 > objc_msgSend(v6, "count");

  return (char)v5;
}

- (BOOL)canAddFriend
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxFriends")));
  v5 = objc_msgSend(v4, "unsignedIntegerValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager followingHandles](self, "followingHandles"));
  LOBYTE(v5) = v5 > objc_msgSend(v6, "count");

  return (char)v5;
}

- (double)userLocateWaitIntervalInMS
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "commandServerContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("userLocateWaitIntervalInMS")));
  v5 = (double)(int)objc_msgSend(v4, "intValue");

  return v5;
}

- (double)upsellTimeoutInSeconds
{
  void *v2;
  void *v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("upsellTimeoutInSec")));
  v4 = (double)(unint64_t)objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (double)systemInactivityTimeoutInSec
{
  void *v2;
  void *v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("systemInactivityTimeoutInSec")));
  v4 = (double)(unint64_t)objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (double)maxWaitTimeForRegisterMS
{
  void *v2;
  void *v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("maxWaitTimeForRegisterMS")));
  v4 = (double)(unint64_t)objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)maxTriesToRegisterDevice
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("maxTriesToRegisterDevice")));

  return v3;
}

- (double)graceInterval401InSec
{
  void *v2;
  void *v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("graceInterval401InSec")));
  v4 = (double)(unint64_t)objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (double)graceInterval5XXInSec
{
  void *v2;
  void *v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("graceInterval5XXInSec")));
  v4 = (double)(unint64_t)objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (double)lazyInitTimeoutInSec
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _configFromServer](self, "_configFromServer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("lazyInitTimeoutInSec")));

  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 86400));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFLazyInitController sharedInstance](FMFLazyInitController, "sharedInstance"));
  objc_msgSend(v3, "doubleValue");
  objc_msgSend(v4, "updateLazyInitTimeoutInSecStoredValue:");

  objc_msgSend(v3, "doubleValue");
  v6 = v5;

  return v6;
}

- (BOOL)hasPendingOfferToHandle:(id)a3 withGroupId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  if (!v7)
    v7 = FMFGroupIdOneToOne;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager pendingOfferHandles](self, "pendingOfferHandles"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100037648;
  v12[3] = &unk_10009A620;
  v9 = v6;
  v13 = v9;
  v10 = v7;
  v14 = v10;
  v15 = &v16;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

  LOBYTE(v8) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v8;
}

- (void)cleanupCachedPendingOfferHandles
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up kFMFCachedOffers", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("kFMFCachedOffers"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "synchronize");

}

- (BOOL)isThisDeviceRegistered
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[16];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Checking if this device is registered", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _myInfo](self, "_myInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceId")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v6 == v7)
  {
    v9 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _myInfo](self, "_myInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("deviceId")));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _devices](self, "_devices"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("deviceId == %@"), v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredSetUsingPredicate:", v11));

  LOBYTE(v10) = objc_msgSend(v12, "count") != 0;
  return (char)v10;
}

- (BOOL)isActiveAutoMeDevice
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager _myInfo](self, "_myInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("eligibleAutoMe")));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)tapMessagesFromDefaults
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("kFMFTapMessages")));

  if (objc_msgSend(v3, "count"))
    v4 = v3;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v5 = v4;

  return v5;
}

- (void)updateClientsWithLocallyStoredModelCache
{
  FMFDataManager *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
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
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[8];
  _QWORD v35[2];
  _QWORD v36[2];

  v2 = self;
  objc_sync_enter(v2);
  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Querying for any locally stored model cache", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDStoreController sharedInstance](FMFDStoreController, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelCache"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_1000B2C68[0]));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v7 == v8)
      v33 = 0;
    else
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_1000B2C68[0]));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_1000B2C70[0]));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v9 == v10)
      v11 = 0;
    else
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_1000B2C70[0]));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_1000B2C78[0]));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v12 == v13)
      v14 = 0;
    else
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_1000B2C78[0]));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_1000B2C80[0]));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v15 == v16)
      v17 = 0;
    else
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_1000B2C80[0]));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_1000B2C88[0]));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v18 == v19)
      v20 = 0;
    else
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_1000B2C88[0]));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_1000B2C90[0]));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v21 == v22)
      v23 = 0;
    else
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", off_1000B2C90[0]));

    -[FMFDataManager setFollowerHandles:](v2, "setFollowerHandles:", v33);
    -[FMFDataManager setFollowingHandles:](v2, "setFollowingHandles:", v11);
    -[FMFDataManager set_meDevice:](v2, "set_meDevice:", v14);
    -[FMFDataManager set_devices:](v2, "set_devices:", v17);
    -[FMFDataManager setModelVersion:](v2, "setModelVersion:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager favoritesSequencer](v2, "favoritesSequencer"));
    objc_msgSend(v24, "updateWithCachedHandles:", v11);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMFDataManager fenceSequencer](v2, "fenceSequencer"));
    objc_msgSend(v25, "setFences:", v20);

    v35[0] = CFSTR("followers");
    v26 = v33;
    if (!v33)
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v35[1] = CFSTR("following");
    v36[0] = v26;
    v27 = v11;
    if (!v11)
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v36[1] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
    if (!v11)

    if (!v33)
    v29 = sub_100011D0C();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Updating clients with locally stored model cache", buf, 2u);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "clientSessions"));
    -[FMFDataManager updateSessionCaches:forSessions:pushAllData:](v2, "updateSessionCaches:forSessions:pushAllData:", v28, v32, 1);

  }
  objc_sync_exit(v2);

}

- (void)setFenceSequencer:(id)a3
{
  objc_storeStrong((id *)&self->_fenceSequencer, a3);
}

- (FMFFenceManager)fenceManager
{
  return self->_fenceManager;
}

- (void)setFenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_fenceManager, a3);
}

- (void)setFavoritesSequencer:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesSequencer, a3);
}

- (void)setPendingOfferHandles:(id)a3
{
  objc_storeStrong((id *)&self->_pendingOfferHandles, a3);
}

- (NSSet)_devices
{
  return self->__devices;
}

- (void)set_devices:(id)a3
{
  objc_storeStrong((id *)&self->__devices, a3);
}

- (void)set_meDevice:(id)a3
{
  objc_storeStrong((id *)&self->__meDevice, a3);
}

- (NSDictionary)_features
{
  return self->__features;
}

- (void)set_features:(id)a3
{
  objc_storeStrong((id *)&self->__features, a3);
}

- (NSDictionary)_preferences
{
  return self->__preferences;
}

- (void)set_preferences:(id)a3
{
  objc_storeStrong((id *)&self->__preferences, a3);
}

- (NSDictionary)_myInfo
{
  return self->__myInfo;
}

- (void)set_myInfo:(id)a3
{
  objc_storeStrong((id *)&self->__myInfo, a3);
}

- (NSDictionary)_followingHandleMapWithIdentifier
{
  return self->__followingHandleMapWithIdentifier;
}

- (NSDictionary)_followerHandleMapWithIdentifier
{
  return self->__followerHandleMapWithIdentifier;
}

- (NSDictionary)_followerHandleMapWithServerId
{
  return self->__followerHandleMapWithServerId;
}

- (NSSet)_futureFollowingRequestsInternal
{
  return self->__futureFollowingRequestsInternal;
}

- (void)set_futureFollowingRequestsInternal:(id)a3
{
  objc_storeStrong((id *)&self->__futureFollowingRequestsInternal, a3);
}

- (NSSet)_futureFollowerRequestsInternal
{
  return self->__futureFollowerRequestsInternal;
}

- (void)set_futureFollowerRequestsInternal:(id)a3
{
  objc_storeStrong((id *)&self->__futureFollowerRequestsInternal, a3);
}

- (NSDictionary)_futureFollowerRequestMapWithIdentifier
{
  return self->__futureFollowerRequestMapWithIdentifier;
}

- (void)set_futureFollowerRequestMapWithIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->__futureFollowerRequestMapWithIdentifier, a3);
}

- (void)set_locationDictionary:(id)a3
{
  objc_storeStrong((id *)&self->__locationDictionary, a3);
}

- (NSTimer)sanitizeLocationsCacheTimer
{
  return self->_sanitizeLocationsCacheTimer;
}

- (void)setSanitizeLocationsCacheTimer:(id)a3
{
  objc_storeStrong((id *)&self->_sanitizeLocationsCacheTimer, a3);
}

- (void)setFollowersFullyInited:(BOOL)a3
{
  self->_followersFullyInited = a3;
}

- (void)setFollowingFullyInited:(BOOL)a3
{
  self->_followingFullyInited = a3;
}

- (void)setStoredConfigLoaded:(BOOL)a3
{
  self->_storedConfigLoaded = a3;
}

- (FMFDStoreController)storeController
{
  return self->_storeController;
}

- (void)setStoreController:(id)a3
{
  objc_storeStrong((id *)&self->_storeController, a3);
}

- (NSString)lastLoggedInPrsIdInternal
{
  return self->_lastLoggedInPrsIdInternal;
}

- (void)setLastLoggedInPrsIdInternal:(id)a3
{
  objc_storeStrong((id *)&self->_lastLoggedInPrsIdInternal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLoggedInPrsIdInternal, 0);
  objc_storeStrong((id *)&self->_storeController, 0);
  objc_storeStrong((id *)&self->_sanitizeLocationsCacheTimer, 0);
  objc_storeStrong((id *)&self->_changesToBeNotified, 0);
  objc_storeStrong((id *)&self->__locationDictionary, 0);
  objc_storeStrong((id *)&self->__futureFollowerRequestMapWithIdentifier, 0);
  objc_storeStrong((id *)&self->__futureFollowerRequestsInternal, 0);
  objc_storeStrong((id *)&self->__futureFollowingRequestsInternal, 0);
  objc_storeStrong((id *)&self->__followerHandlesInternal, 0);
  objc_storeStrong((id *)&self->__followingHandlesInternal, 0);
  objc_storeStrong((id *)&self->__followerHandleMapWithServerId, 0);
  objc_storeStrong((id *)&self->__followerHandleMapWithIdentifier, 0);
  objc_storeStrong((id *)&self->__followingHandleMapWithServerId, 0);
  objc_storeStrong((id *)&self->__followingHandleMapWithIdentifier, 0);
  objc_storeStrong((id *)&self->__myInfo, 0);
  objc_storeStrong((id *)&self->__preferences, 0);
  objc_storeStrong((id *)&self->__features, 0);
  objc_storeStrong((id *)&self->__meDevice, 0);
  objc_storeStrong((id *)&self->__devices, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_pendingOfferHandles, 0);
  objc_storeStrong((id *)&self->_favoritesSequencer, 0);
  objc_storeStrong((id *)&self->_fenceManager, 0);
  objc_storeStrong((id *)&self->_fenceSequencer, 0);
  objc_storeStrong((id *)&self->__configFromServer, 0);
  objc_storeStrong((id *)&self->_cachedTapMessages, 0);
}

@end
