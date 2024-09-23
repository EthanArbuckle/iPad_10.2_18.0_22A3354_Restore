@implementation GKAchievementThatAFriendHasListCacheObject

+ (id)entityName
{
  return CFSTR("AchievementThatAFriendHasList");
}

+ (id)friendsForAchievement:(id)a3 plist:(id)a4 profileProvider:(id)a5
{
  id v7;
  id v8;
  uint64_t (**v9)(id, void *);
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v32;
  id v33;
  id v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _BYTE v44[128];

  v7 = a3;
  v8 = a4;
  v9 = (uint64_t (**)(id, void *))a5;
  v10 = objc_alloc_init((Class)NSMutableArray);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("results")));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000E4968;
  v40[3] = &unk_1002C2600;
  v12 = v7;
  v41 = v12;
  v13 = objc_msgSend(v11, "indexOfObjectPassingTest:", v40);

  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = objc_msgSend(v10, "copy");
  }
  else
  {
    v33 = v12;
    v34 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("results")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v13));

    v32 = v16;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("friends-with-achievement")));
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("friend-player-id")));
          v23 = v9[2](v9, v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("timestamp")));
          objc_msgSend(v25, "doubleValue");
          v27 = v26;

          v28 = objc_claimAutoreleasedReturnValue(+[GKAchievementThatAFriendHasListCacheObject dateFromMillisecondsSinceEpoch:](GKAchievementThatAFriendHasListCacheObject, "dateFromMillisecondsSinceEpoch:", v27));
          v29 = (void *)v28;
          if (v24)
          {
            v42[0] = CFSTR("friend");
            v42[1] = CFSTR("timestamp");
            v43[0] = v24;
            v43[1] = v28;
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2));
            objc_msgSend(v10, "addObject:", v30);

          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v18);
    }
    v14 = objc_msgSend(v10, "copy");

    v12 = v33;
    v8 = v34;
  }

  return v14;
}

+ (id)dateFromMillisecondsSinceEpoch:(double)a3
{
  double v4;
  id v5;
  double v6;

  v4 = fabs(a3);
  v5 = objc_alloc((Class)NSDate);
  v6 = a3 / 1000.0;
  if (v4 == INFINITY)
    v6 = 0.0;
  return objc_msgSend(v5, "initWithTimeIntervalSince1970:", v6);
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4 playerId:(id)a5 achievementId:(id)a6
{
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  _QWORD v13[5];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)GKAchievementThatAFriendHasListCacheObject;
  v9 = a6;
  v10 = a3;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v14, "updateWithServerRepresentation:expirationDate:", v10, a4);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000E4B10;
  v13[3] = &unk_1002C2628;
  v13[4] = self;
  v11 = objc_retainBlock(v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKAchievementThatAFriendHasListCacheObject friendsForAchievement:plist:profileProvider:](GKAchievementThatAFriendHasListCacheObject, "friendsForAchievement:plist:profileProvider:", v9, v10, v11));

  -[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:](self, "updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:", v12, &stru_1002C2668, 1);
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKAchievementThatAFriendHasListCacheObject;
  if (!-[GKExpiringCacheObject isValid](&v7, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKAchievementThatAFriendHasListCacheObject game](self, "game"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = v4 != 0;

  return v5;
}

@end
