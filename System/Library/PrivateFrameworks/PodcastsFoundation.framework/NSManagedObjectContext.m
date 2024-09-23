@implementation NSManagedObjectContext

void __55__NSManagedObjectContext_MTPodcast__podcastForFeedUrl___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)a1[4];
  +[MTPodcast predicateForPodcastWithFeedUrl:](MTPodcast, "predicateForPodcastWithFeedUrl:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsInEntity:predicate:sortDescriptors:", CFSTR("MTPodcast"), v3, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __55__NSManagedObjectContext_MTPodcast__podcastForStoreId___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)a1[4];
  +[MTPodcast predicateForPodcastStoreId:](MTPodcast, "predicateForPodcastStoreId:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTPodcast"), v3, 0, 0, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __67__NSManagedObjectContext_MTAdditions__performBlockAndWaitWithSave___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1AF4138F4]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "saveInCurrentBlock");
}

uint64_t __53__NSManagedObjectContext_MTPlaylist__deletePlaylist___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
}

void __73__NSManagedObjectContext_MTAdditions__titlesOfObjectsInEntity_predicate___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v9 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  objc_msgSend(v4, "valueForKey:", CFSTR("title"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (v5)
    objc_msgSend(v5, "logAndThrow:", 1);

}

void __55__NSManagedObjectContext_MTChannel__channelForStoreId___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)a1[4];
  +[MTChannel predicateForChannelWithStoreId:](MTChannel, "predicateForChannelWithStoreId:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTChannel"), v3, 0, 1, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __58__NSManagedObjectContext_MTPodcast__podcastForPodcastPID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)a1[4];
  +[MTPodcast predicateForPodcastWithPodcastPID:](MTPodcast, "predicateForPodcastWithPodcastPID:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsInEntity:predicate:sortDescriptors:", CFSTR("MTPodcast"), v3, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

@end
