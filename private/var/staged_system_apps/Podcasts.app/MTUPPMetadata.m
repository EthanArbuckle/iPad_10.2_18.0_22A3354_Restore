@implementation MTUPPMetadata

+ (id)createOrUpdateUPPMetadataFromUPPMediaItem:(id)a3 inCtx:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MZUniversalPlaybackPositionMetadata metadataWithValuesFromDataSourceItem:](MZUniversalPlaybackPositionMetadata, "metadataWithValuesFromDataSourceItem:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "createOrUpdateUPPMetadataFromUPPRecord:inCtx:", v7, v6));

  return v8;
}

+ (id)createOrUpdateUPPMetadataFromUPPRecord:(id)a3 inCtx:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uppMetadataForMetadataIdentifier:", v8));

  if (!v9)
  {
    v12 = _MTLogCategoryUPPSync(v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Creating UPP Metadata Record for: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("MTUPPMetadata"), v7));
  }
  objc_msgSend((id)objc_opt_class(a1), "updateUPPMetadata:fromUPPRecord:", v9, v6);

  return v9;
}

+ (void)updateUPPMetadata:(id)a3 fromUPPRecord:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v8 = _MTLogCategoryUPPSync(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating UPP Metadata Record\n from: %{public}@\n to: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifier"));
  objc_msgSend(v5, "setMetadataIdentifier:", v10);

  objc_msgSend(v6, "timestamp");
  objc_msgSend(v5, "setTimestamp:");
  objc_msgSend(v6, "bookmarkTime");
  objc_msgSend(v5, "setBookmarkTime:");
  objc_msgSend(v5, "setPlayCount:", objc_msgSend(v6, "playCount"));
  objc_msgSend(v5, "setHasBeenPlayed:", objc_msgSend(v6, "hasBeenPlayed"));

}

+ (id)deleteAllContentInCtx:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MTUPPMetadata")));
  v7 = objc_msgSend(objc_alloc((Class)NSBatchDeleteRequest), "initWithFetchRequest:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeRequest:error:", v7, a4));
  objc_msgSend(v5, "saveInCurrentBlock");

  return v8;
}

@end
