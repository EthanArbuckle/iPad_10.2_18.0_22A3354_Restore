@implementation NSManagedObjectContext(MTPodcast)

- (uint64_t)podcastForUuid:()MTPodcast
{
  return objc_msgSend(a1, "objectForUuid:entityName:", a3, CFSTR("MTPodcast"));
}

- (id)podcastForStoreId:()MTPodcast
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__NSManagedObjectContext_MTPodcast__podcastForStoreId___block_invoke;
  v5[3] = &unk_1E54D13F8;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = a1;
  objc_msgSend(a1, "performBlockAndWait:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)podcastForFeedUrl:()MTPodcast
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__9;
  v15 = __Block_byref_object_dispose__9;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__NSManagedObjectContext_MTPodcast__podcastForFeedUrl___block_invoke;
  v8[3] = &unk_1E54D13D0;
  v8[4] = a1;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "performBlockAndWait:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)podcastForPodcastPID:()MTPodcast
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__NSManagedObjectContext_MTPodcast__podcastForPodcastPID___block_invoke;
  v5[3] = &unk_1E54D13F8;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = a1;
  objc_msgSend(a1, "performBlockAndWait:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (uint64_t)dictionaryForPodcastUuid:()MTPodcast
{
  return objc_msgSend(a1, "objectDictionaryForUuid:entityName:", a3, CFSTR("MTPodcast"));
}

- (uint64_t)dictionaryWithProperties:()MTPodcast podcastUuid:
{
  return objc_msgSend(a1, "objectDictionaryForUuid:propertiesToFetch:entityName:", a4, a3, CFSTR("MTPodcast"));
}

- (uint64_t)valueForProperty:()MTPodcast podcastUuid:
{
  return objc_msgSend(a1, "valueForProperty:objectUuid:entityName:", a3, a4, CFSTR("MTPodcast"));
}

- (uint64_t)countOfPodcasts
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("MTPodcast"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts](MTPodcast, "predicateForNotHiddenNotImplicitlyFollowedPodcasts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  v4 = objc_msgSend(a1, "countForFetchRequest:error:", v2, 0);
  return v4;
}

- (uint64_t)countOfSubscribedAndNotHiddenPodcasts
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("MTPodcast"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPodcast predicateForSubscribedAndNotHidden](MTPodcast, "predicateForSubscribedAndNotHidden");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  v4 = objc_msgSend(a1, "countForFetchRequest:error:", v2, 0);
  return v4;
}

- (uint64_t)nextSortOrderForPodcasts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("MTPodcast"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts](MTPodcast, "predicateForNotHiddenNotImplicitlyFollowedPodcasts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sortOrder"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v5);

  objc_msgSend(v2, "setFetchLimit:", 1);
  v6 = objc_msgSend(a1, "_nextSortOrderWithRequest:", v2);

  return v6;
}

- (uint64_t)_nextSortOrderWithRequest:()MTPodcast
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;

  v9 = 0;
  objc_msgSend(a1, "executeFetchRequest:error:", a3, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("sortOrder"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue") + 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
