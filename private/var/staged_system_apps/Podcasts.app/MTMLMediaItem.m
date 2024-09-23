@implementation MTMLMediaItem

+ (id)itemWithMPMediaItem:(id)a3
{
  return objc_msgSend(a1, "itemWithMPMediaItem:isRestoreDownloadCandidate:", a3, 0);
}

+ (id)itemWithMPMediaItem:(id)a3 isRestoreDownloadCandidate:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _BOOL8 v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_opt_new(a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "propertiesForMediaItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000BBF5C;
    v16[3] = &unk_1004A8030;
    v10 = v7;
    v17 = v10;
    objc_msgSend(v6, "enumerateValuesForProperties:usingBlock:", v9, v16);

    objc_msgSend(v10, "setIsFromITunesSync:", objc_msgSend(a1, "isMediaItemSyncedFromiTunes:", v6));
    v11 = +[MTMLMediaItem isMissingFilePathForItem:](MTMLMediaItem, "isMissingFilePathForItem:", v6)
       || +[MTMLMediaItem isMissingAssetForItem:](MTMLMediaItem, "isMissingAssetForItem:", v6);
    objc_msgSend(v10, "setIsMissingAsset:", v11);
    if (objc_msgSend(v10, "isMissingAsset") && !a4)
    {
      objc_msgSend(v10, "setAssetUrl:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTMediaLibraryTransactionManager sharedInstance](MTMediaLibraryTransactionManager, "sharedInstance"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000BC32C;
      v14[3] = &unk_1004A95A8;
      v15 = v6;
      objc_msgSend(v12, "requestMediaLibraryWriteTransaction:", v14);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)isMissingFilePathForItem:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForProperty:", MPMediaItemPropertyFilePath));
  v4 = objc_msgSend(v3, "length") == 0;

  return v4;
}

+ (BOOL)isMissingAssetForItem:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  char v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForProperty:", MPMediaItemPropertyFilePath));
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

    v6 = v5 ^ 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTMLMediaItem persistentId](self, "persistentId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTMLMediaItem title](self, "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTMLMediaItem guid](self, "guid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@] %@ %@"), v3, v4, v5));

  return v6;
}

+ (id)propertiesForMediaItem
{
  _QWORD v3[23];

  v3[0] = MPMediaItemPropertyPodcastURL;
  v3[1] = MPMediaItemPropertyPodcastTitle;
  v3[2] = MPMediaItemPropertyIsITunesU;
  v3[3] = MPMediaItemPropertyArtist;
  v3[4] = MPMediaItemPropertyPersistentID;
  v3[5] = MPMediaItemPropertyPodcastPersistentID;
  v3[6] = MPMediaItemPropertyFileSize;
  v3[7] = MPMediaItemPropertyGenre;
  v3[8] = MPMediaItemPropertyPlaybackDuration;
  v3[9] = MPMediaItemPropertyTitle;
  v3[10] = MPMediaItemPropertyMediaType;
  v3[11] = MPMediaItemPropertyReleaseDate;
  v3[12] = MPMediaItemPropertyBookmarkTime;
  v3[13] = MPMediaItemPropertyHasBeenPlayed;
  v3[14] = MPMediaItemPropertyPlayCount;
  v3[15] = MPMediaItemPropertyDownloadIdentifier;
  v3[16] = MPMediaItemPropertyRestricted;
  v3[17] = MPMediaItemPropertyStoreID;
  v3[18] = MPMediaItemPropertyStorePlaylistID;
  v3[19] = MPMediaItemPropertyLastPlayedDate;
  v3[20] = MPMediaItemPropertyPodcastGUID;
  v3[21] = MPMediaItemPropertyFilePath;
  v3[22] = MPMediaItemPropertyAssetURL;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 23));
}

+ (BOOL)isMediaItemSyncedFromiTunes:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForProperty:", MPMediaItemPropertyFilePath));
  v4 = objc_msgSend(v3, "containsStringInsensitive:", CFSTR("/var/mobile/Media/iTunes_Control/"));

  return v4;
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_storeStrong((id *)&self->_artist, a3);
}

- (NSNumber)persistentId
{
  return self->_persistentId;
}

- (void)setPersistentId:(id)a3
{
  objc_storeStrong((id *)&self->_persistentId, a3);
}

- (NSNumber)storeTrackId
{
  return self->_storeTrackId;
}

- (void)setStoreTrackId:(id)a3
{
  objc_storeStrong((id *)&self->_storeTrackId, a3);
}

- (NSNumber)podcastPersistentId
{
  return self->_podcastPersistentId;
}

- (void)setPodcastPersistentId:(id)a3
{
  objc_storeStrong((id *)&self->_podcastPersistentId, a3);
}

- (NSNumber)storeCollectionId
{
  return self->_storeCollectionId;
}

- (void)setStoreCollectionId:(id)a3
{
  objc_storeStrong((id *)&self->_storeCollectionId, a3);
}

- (NSNumber)byteSize
{
  return self->_byteSize;
}

- (void)setByteSize:(id)a3
{
  objc_storeStrong((id *)&self->_byteSize, a3);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_storeStrong((id *)&self->_duration, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)assetUrl
{
  return self->_assetUrl;
}

- (void)setAssetUrl:(id)a3
{
  objc_storeStrong((id *)&self->_assetUrl, a3);
}

- (BOOL)isItunesU
{
  return self->_isItunesU;
}

- (void)setIsItunesU:(BOOL)a3
{
  self->_isItunesU = a3;
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
  objc_storeStrong((id *)&self->_uti, a3);
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
  objc_storeStrong((id *)&self->_guid, a3);
}

- (NSDate)pubDate
{
  return self->_pubDate;
}

- (void)setPubDate:(id)a3
{
  objc_storeStrong((id *)&self->_pubDate, a3);
}

- (BOOL)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (void)setHasBeenPlayed:(BOOL)a3
{
  self->_hasBeenPlayed = a3;
}

- (NSNumber)playhead
{
  return self->_playhead;
}

- (void)setPlayhead:(id)a3
{
  objc_storeStrong((id *)&self->_playhead, a3);
}

- (NSNumber)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(id)a3
{
  objc_storeStrong((id *)&self->_playCount, a3);
}

- (NSString)feedUrl
{
  return self->_feedUrl;
}

- (void)setFeedUrl:(id)a3
{
  objc_storeStrong((id *)&self->_feedUrl, a3);
}

- (NSString)podcastTitle
{
  return self->_podcastTitle;
}

- (void)setPodcastTitle:(id)a3
{
  objc_storeStrong((id *)&self->_podcastTitle, a3);
}

- (NSNumber)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (void)setDownloadIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_downloadIdentifier, a3);
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(BOOL)a3
{
  self->_isExplicit = a3;
}

- (BOOL)isFromITunesSync
{
  return self->_isFromITunesSync;
}

- (void)setIsFromITunesSync:(BOOL)a3
{
  self->_isFromITunesSync = a3;
}

- (BOOL)isMissingAsset
{
  return self->_isMissingAsset;
}

- (void)setIsMissingAsset:(BOOL)a3
{
  self->_isMissingAsset = a3;
}

- (NSDate)lastPlayedDate
{
  return self->_lastPlayedDate;
}

- (void)setLastPlayedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPlayedDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPlayedDate, 0);
  objc_storeStrong((id *)&self->_downloadIdentifier, 0);
  objc_storeStrong((id *)&self->_podcastTitle, 0);
  objc_storeStrong((id *)&self->_feedUrl, 0);
  objc_storeStrong((id *)&self->_playCount, 0);
  objc_storeStrong((id *)&self->_playhead, 0);
  objc_storeStrong((id *)&self->_pubDate, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_assetUrl, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_byteSize, 0);
  objc_storeStrong((id *)&self->_storeCollectionId, 0);
  objc_storeStrong((id *)&self->_podcastPersistentId, 0);
  objc_storeStrong((id *)&self->_storeTrackId, 0);
  objc_storeStrong((id *)&self->_persistentId, 0);
  objc_storeStrong((id *)&self->_artist, 0);
}

@end
