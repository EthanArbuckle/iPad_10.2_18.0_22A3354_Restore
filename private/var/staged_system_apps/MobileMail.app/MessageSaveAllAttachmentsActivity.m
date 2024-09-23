@implementation MessageSaveAllAttachmentsActivity

- (id)activityType
{
  return MFActivityTypeSaveAllAttachments;
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MessageSaveToCameraRollActivity delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedTitleForSaveAllAttachmentsAction"));

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphSaveAll);
}

- (id)_beforeActivity
{
  return MFActivityTypeSaveToCameraRoll;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  MessageSaveAllAttachmentsActivity *v3;
  void *v4;

  v3 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageSaveToCameraRollActivity delegate](self, "delegate", a3));
  LOBYTE(v3) = objc_msgSend(v4, "canSaveAllAttachmentsInContext:", -[MessageSaveToCameraRollActivity context](v3, "context"));

  return (char)v3;
}

- (void)prepareWithActivityItems:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageSaveToCameraRollActivity delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allMediaAttachmentFutures"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10013F524;
        v12[3] = &unk_1005203E0;
        v12[4] = self;
        objc_msgSend(v9, "onScheduler:addSuccessBlock:", v10, v12);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)performActivity
{
  -[MessageSaveAllAttachmentsActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

@end
