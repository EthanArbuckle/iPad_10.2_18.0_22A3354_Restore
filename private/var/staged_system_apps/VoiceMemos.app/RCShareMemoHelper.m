@implementation RCShareMemoHelper

+ (id)unsupportedActivityTypes
{
  if (qword_1001ED948 != -1)
    dispatch_once(&qword_1001ED948, &stru_1001AD0C8);
  return (id)qword_1001ED940;
}

+ (id)customActivitiesForShareableCompositions:(id)a3
{
  id v3;
  RCEditRecordingActivity *v4;
  RCDuplicateActivity *v5;
  RCFavoriteActionActivity *v6;
  RCMoveToFolderActivity *v7;
  void *v8;
  _QWORD v10[4];

  v3 = a3;
  v4 = -[RCUIActivity initWithShareableCompositions:]([RCEditRecordingActivity alloc], "initWithShareableCompositions:", v3);
  v5 = -[RCUIActivity initWithShareableCompositions:]([RCDuplicateActivity alloc], "initWithShareableCompositions:", v3);
  v6 = -[RCUIActivity initWithShareableCompositions:]([RCFavoriteActionActivity alloc], "initWithShareableCompositions:", v3);
  v7 = -[RCUIActivity initWithShareableCompositions:]([RCMoveToFolderActivity alloc], "initWithShareableCompositions:", v3);

  v10[0] = v4;
  v10[1] = v5;
  v10[2] = v6;
  v10[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 4));

  return v8;
}

+ (id)customActivityTypes
{
  _QWORD v3[4];

  v3[0] = CFSTR("RCActivityTypeEditRecording");
  v3[1] = CFSTR("RCActivityTypeDuplicate");
  v3[2] = CFSTR("RCActivityTypeFavorite");
  v3[3] = CFSTR("RCActivityTypeMoveToFolder");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 4));
}

+ (id)shareableCompositionsFromCompositions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  RCShareableComposition *v12;
  RCShareableComposition *v13;
  RCShareableComposition *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = objc_msgSend(v3, "count");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        v12 = [RCShareableComposition alloc];
        v13 = -[RCShareableComposition initWithComposition:](v12, "initWithComposition:", v11, (_QWORD)v16);
        v14 = v13;
        if ((unint64_t)v5 >= 2)
          -[RCShareableComposition setCustomSubject:](v13, "setCustomSubject:", &stru_1001B2BC0);
        objc_msgSend(v4, "addObject:", v14);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v4;
}

@end
