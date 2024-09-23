@implementation NSManagedObjectContext(IMPlayerItem)

- (id)episodeForPlayerItem:()IMPlayerItem
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "episodeObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (objc_msgSend(v4, "episodeObjectID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a1, "existingEpisodeWithID:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    objc_msgSend(v4, "episodeUuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "episodeUuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "episodeForUuid:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEpisodeObjectID:", v9);

    }
  }

  return v7;
}

@end
