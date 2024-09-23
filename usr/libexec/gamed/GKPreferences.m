@implementation GKPreferences

- (int64_t)arcadeSubscriptionState
{
  return (int64_t)-[GKPreferences integerValueForKey:defaultValue:](self, "integerValueForKey:defaultValue:", CFSTR("GKArcadeSubscriptionState"), 0);
}

- (void)setArcadeSubscriptionState:(int64_t)a3
{
  -[GKPreferences setIntegerValue:forKey:](self, "setIntegerValue:forKey:", a3, CFSTR("GKArcadeSubscriptionState"));
}

- (BOOL)hasConsumedArcadeSubscription:(id)a3 arcadeFamilyId:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "stringValue", (_QWORD)v14));
        v12 = objc_msgSend(v11, "isEqualToString:", v6);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v8;
}

- (void)updateArcadeSubscriptionState:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  void (**v14)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "offerID"));
  if ((objc_msgSend(v8, "isNotEqualToString:", GKAppStoreArcadeOfferIdentifier) & 1) == 0)
  {

    goto LABEL_5;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "offerID"));
  v10 = objc_msgSend(v9, "isNotEqualToString:", GKAppStoreArcadeAnnualOfferIdentifier);

  if (!v10)
  {
LABEL_5:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ASDSubscriptionEntitlements sharedInstance](ASDSubscriptionEntitlements, "sharedInstance"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000D9AFC;
    v12[3] = &unk_1002C2250;
    v14 = v7;
    v12[4] = self;
    v13 = v6;
    objc_msgSend(v11, "getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler:", v12);

    goto LABEL_6;
  }
  v7[2](v7);
LABEL_6:

}

@end
