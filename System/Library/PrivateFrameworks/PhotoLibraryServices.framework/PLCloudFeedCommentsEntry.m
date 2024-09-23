@implementation PLCloudFeedCommentsEntry

- (NSMutableOrderedSet)mutableEntryLikeComments
{
  return (NSMutableOrderedSet *)-[PLCloudFeedCommentsEntry mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", CFSTR("entryLikeComments"));
}

- (NSMutableOrderedSet)mutableEntryComments
{
  return (NSMutableOrderedSet *)-[PLCloudFeedCommentsEntry mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", CFSTR("entryComments"));
}

- (BOOL)shouldBeRemovedFromPhotoLibrary:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLCloudFeedCommentsEntry;
  if (-[PLCloudFeedEntry shouldBeRemovedFromPhotoLibrary:](&v8, sel_shouldBeRemovedFromPhotoLibrary_, a3))
    return 1;
  -[PLCloudFeedCommentsEntry entryComments](self, "entryComments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[PLCloudFeedCommentsEntry entryLikeComments](self, "entryLikeComments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "count") == 0;

  }
  return v4;
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLCloudFeedCommentsEntry;
  -[PLCloudFeedEntry willSave](&v8, sel_willSave);
  -[PLCloudFeedCommentsEntry managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PLCloudFeedCommentsEntry changedValues](self, "changedValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entryComments"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entryLikeComments"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
LABEL_6:

        goto LABEL_7;
      }
    }
    objc_msgSend(v3, "delayedSaveActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordCloudFeedCommentsEntryForCommentUpdate:", self);

    goto LABEL_6;
  }
LABEL_7:

}

+ (id)entityName
{
  return CFSTR("CloudFeedCommentsEntry");
}

@end
