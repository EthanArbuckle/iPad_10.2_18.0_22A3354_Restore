@implementation RCUIActivity

- (RCUIActivity)initWithShareableCompositions:(id)a3
{
  id v4;
  RCUIActivity *v5;
  RCUIActivity *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RCUIActivity;
  v5 = -[RCUIActivity init](&v8, "init");
  v6 = v5;
  if (v5)
    -[RCUIActivity setShareableCompositions:](v5, "setShareableCompositions:", v4);

  return v6;
}

- (void)prepareWithActivityItems:(id)a3
{
  -[RCUIActivity setActivityItems:](self, "setActivityItems:", a3);
}

- (NSArray)recordingUUIDs
{
  NSArray *recordingUUIDs;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  recordingUUIDs = self->_recordingUUIDs;
  if (!recordingUUIDs)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCUIActivity shareableCompositions](self, "shareableCompositions", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), "recordingUUID"));
          objc_msgSend(v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    v11 = (NSArray *)objc_msgSend(v4, "copy");
    v12 = self->_recordingUUIDs;
    self->_recordingUUIDs = v11;

    recordingUUIDs = self->_recordingUUIDs;
  }
  return recordingUUIDs;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (void)setActivityItems:(id)a3
{
  objc_storeStrong((id *)&self->_activityItems, a3);
}

- (NSArray)shareableCompositions
{
  return self->_shareableCompositions;
}

- (void)setShareableCompositions:(id)a3
{
  objc_storeStrong((id *)&self->_shareableCompositions, a3);
}

- (void)setRecordingUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordingUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingUUIDs, 0);
  objc_storeStrong((id *)&self->_shareableCompositions, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);
}

@end
