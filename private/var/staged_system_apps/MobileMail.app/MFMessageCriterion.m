@implementation MFMessageCriterion

- (id)myEmailAddressesCriterionWithType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCriterion userProfileProvider](self, "userProfileProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accountsEmailAddresses"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100179354;
  v10[3] = &unk_100521900;
  v10[4] = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_map:", v10));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MFMessageCriterion orCompoundCriterionWithCriteria:](MFMessageCriterion, "orCompoundCriterionWithCriteria:", v7));
  return v8;
}

- (id)userProfileProvider
{
  return +[MFUserProfileProvider_iOS defaultProvider](MFUserProfileProvider_iOS, "defaultProvider");
}

- (id)mailServerSideCriterion
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (qword_1005AA208 != -1)
    dispatch_once(&qword_1005AA208, &stru_100521920);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100179558;
  v7[3] = &unk_100521948;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = &v12;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCriterion criterionByApplyingTransform:](self, "criterionByApplyingTransform:", v7));
  v4 = v3;
  if (*((_BYTE *)v13 + 24) && !*((_BYTE *)v9 + 24))
    v5 = v3;
  else
    v5 = 0;

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (id)referencedMailboxes
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100179ADC;
  v7[3] = &unk_100521970;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = v3;
  v4 = -[MFMessageCriterion criterionByApplyingTransform:](self, "criterionByApplyingTransform:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ef_compactMap:", &stru_100521990));

  return v5;
}

- (id)referencedConversations
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100179C24;
  v6[3] = &unk_100521970;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[EFMutableInt64Set indexSet](EFMutableInt64Set, "indexSet"));
  v7 = v3;
  v4 = -[MFMessageCriterion criterionByApplyingTransform:](self, "criterionByApplyingTransform:", v6);

  return v3;
}

@end
