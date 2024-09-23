@implementation MessageSaveToCameraRollActivity

- (MessageSaveToCameraRollActivity)init
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageSaveToCameraRollActivity.m"), 25, CFSTR("Invalid initializer. Use the designated one instead."));

  return 0;
}

- (MessageSaveToCameraRollActivity)initWithAttachmentHandlingDelegate:(id)a3 context:(int64_t)a4
{
  id v6;
  MessageSaveToCameraRollActivity *v7;
  MessageSaveToCameraRollActivity *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MessageSaveToCameraRollActivity;
  v7 = -[MessageSaveToCameraRollActivity init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[MessageSaveToCameraRollActivity setDelegate:](v7, "setDelegate:", v6);
    -[MessageSaveToCameraRollActivity setContext:](v8, "setContext:", a4);
  }

  return v8;
}

- (id)activityType
{
  return MFActivityTypeSaveToCameraRoll;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphSave);
}

- (id)_beforeActivity
{
  return UIActivityTypeAssignToContact;
}

- (void)_prepareWithActivityItems:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  objc_super v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v14 = a3;
  v3 = objc_msgSend(v14, "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v14;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v7);
        v9 = objc_opt_class(NSURL);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          v10 = v8;
          v17 = 0;
          v11 = MFCameraRollSaveAssetWithURL();
          v12 = 0;
          if (v11)
          {
            objc_msgSend(v3, "removeObject:", v10);
          }
          else
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
            NSLog(CFSTR("failed to ingest %@ (%@)"), v13, v12);

          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  v16.receiver = self;
  v16.super_class = (Class)MessageSaveToCameraRollActivity;
  -[MessageSaveToCameraRollActivity prepareWithActivityItems:](&v16, "prepareWithActivityItems:", v3);

}

- (ContentRepresentationHandlingDelegate)delegate
{
  return (ContentRepresentationHandlingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
