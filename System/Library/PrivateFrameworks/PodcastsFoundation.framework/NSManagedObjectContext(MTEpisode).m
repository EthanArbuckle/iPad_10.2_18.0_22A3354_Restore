@implementation NSManagedObjectContext(MTEpisode)

- (uint64_t)episodeForUuid:()MTEpisode
{
  return objc_msgSend(a1, "objectForUuid:entityName:", a3, CFSTR("MTEpisode"));
}

- (id)existingEpisodeWithID:()MTEpisode
{
  void *v3;
  id v4;
  void *v5;
  id v7;

  if (a3)
  {
    v7 = 0;
    objc_msgSend(a1, "existingObjectWithID:error:", a3, &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    v5 = v4;
    if (!v3 && v4)
      objc_msgSend(v4, "logAndThrow:", 0);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (uint64_t)episodeForUuid:()MTEpisode returnsObjectAsFault:
{
  return objc_msgSend(a1, "objectForUuid:entityName:returnsObjectAsFault:", a3, CFSTR("MTEpisode"), a4);
}

- (id)episodesForUuids:()MTEpisode
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForEpisodeUuids:](MTEpisode, "predicateForEpisodeUuids:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:", CFSTR("MTEpisode"), v3, MEMORY[0x1E0C9AA60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)episodesForManagedObjectIDs:()MTEpisode
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C97B80], "predicateForObjectsWithManagedObjectIDs:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:", CFSTR("MTEpisode"), v2, MEMORY[0x1E0C9AA60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)episodeForStoreTrackID:()MTEpisode
{
  void *v2;
  void *v3;

  +[MTEpisode predicateForEpisodeStoreTrackId:](MTEpisode, "predicateForEpisodeStoreTrackId:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectInEntity:predicate:", CFSTR("MTEpisode"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)episodesForStoreTrackIDs:()MTEpisode
{
  void *v2;
  void *v3;

  +[MTEpisode predicateForEpisodeStoreTrackIds:](MTEpisode, "predicateForEpisodeStoreTrackIds:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:", CFSTR("MTEpisode"), v2, MEMORY[0x1E0C9AA60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)dictionaryForEpisodeUuid:()MTEpisode
{
  return objc_msgSend(a1, "objectDictionaryForUuid:entityName:", a3, CFSTR("MTEpisode"));
}

- (uint64_t)dictionaryWithProperties:()MTEpisode episodeUuid:
{
  return objc_msgSend(a1, "objectDictionaryForUuid:propertiesToFetch:entityName:", a4, a3, CFSTR("MTEpisode"));
}

- (uint64_t)valueForProperty:()MTEpisode episodeUuid:
{
  return objc_msgSend(a1, "valueForProperty:objectUuid:entityName:", a3, a4, CFSTR("MTEpisode"));
}

@end
