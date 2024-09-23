@implementation IMPlayerItem

- (NSUUID)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (void)setManifestIndex:(unint64_t)a3
{
  self->_manifestIndex = a3;
}

- (MPNowPlayingContentItem)contentItem
{
  MPNowPlayingContentItem *contentItem;

  contentItem = self->_contentItem;
  if (!contentItem)
  {
    -[IMPlayerItem recreateContentItem](self, "recreateContentItem");
    contentItem = self->_contentItem;
  }
  return contentItem;
}

- (NSString)podcastFeedUrl
{
  return self->_podcastFeedUrl;
}

- (NSString)episodeGuid
{
  return self->_episodeGuid;
}

- (int64_t)seasonNumber
{
  return self->_seasonNumber;
}

- (int64_t)episodeNumber
{
  return self->_episodeNumber;
}

- (NSString)episodeUuid
{
  return self->_episodeUuid;
}

- (BOOL)isLocal
{
  void *v2;
  char v3;
  void *v4;

  -[IMPlayerItem url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isFileURL") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v2, "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToString:", CFSTR("ipod-library"));

  }
  return v3;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (IMPlayerArtwork)showArtworkProperties
{
  return self->_showArtworkProperties;
}

- (IMPlayerArtwork)episodeArtworkProperties
{
  return self->_episodeArtworkProperties;
}

- (void)updateActivity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[IMPlayerItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v4);

  -[IMPlayerItem album](self, "album");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setSubtitle:", v5);

  -[IMPlayerItem title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItemTitle:", v6);

  -[IMPlayerItem album](self, "album");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContainerTitle:", v7);

  -[IMPlayerItem playhead](self, "playhead");
  objc_msgSend(v8, "setCurrentTime:");

}

- (NSString)album
{
  return self->_album;
}

- (NSString)title
{
  return self->_title;
}

- (double)playhead
{
  return self->_playhead;
}

- (BOOL)paidSubscriptionActive
{
  return self->_paidSubscriptionActive;
}

- (void)setTranscriptSource:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptSource, a3);
}

- (void)setTranscriptIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptIdentifier, a3);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setShowArtworkProperties:(id)a3
{
  objc_storeStrong((id *)&self->_showArtworkProperties, a3);
}

- (void)setSeasonNumber:(int64_t)a3
{
  self->_seasonNumber = a3;
}

- (void)setPubDate:(id)a3
{
  objc_storeStrong((id *)&self->_pubDate, a3);
}

- (void)setPriceType:(id)a3
{
  objc_storeStrong((id *)&self->_priceType, a3);
}

- (void)setPodcastUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setPodcastStoreId:(int64_t)a3
{
  self->_podcastStoreId = a3;
}

- (void)setPodcastShareUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setPodcastIsSerial:(BOOL)a3
{
  self->_podcastIsSerial = a3;
}

- (void)setPodcastFeedUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setPodcastDisplayType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setPlayCount:(int64_t)a3
{
  self->_playCount = a3;
}

- (void)setPaidSubscriptionActive:(BOOL)a3
{
  self->_paidSubscriptionActive = a3;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_video = a3;
}

- (void)setIsNotSubscribeable:(BOOL)a3
{
  self->_isNotSubscribeable = a3;
}

- (void)setIsExplicit:(BOOL)a3
{
  self->_isExplicit = a3;
}

- (void)setIsAppleNewsEpisode:(BOOL)a3
{
  self->_isAppleNewsEpisode = a3;
}

- (void)setIsAppleMusicEpisode:(BOOL)a3
{
  self->_isAppleMusicEpisode = a3;
}

- (void)setEpisodeUuid:(id)a3
{
  objc_storeStrong((id *)&self->_episodeUuid, a3);
}

- (void)setEpisodeType:(int64_t)a3
{
  self->_episodeType = a3;
}

- (void)setEpisodeStoreId:(int64_t)a3
{
  self->_episodeStoreId = a3;
}

- (void)setEpisodePID:(int64_t)a3
{
  self->_episodePID = a3;
}

- (void)setEpisodeObjectID:(id)a3
{
  NSManagedObjectID *v4;
  NSManagedObjectID *episodeObjectID;

  v4 = (NSManagedObjectID *)a3;
  os_unfair_lock_lock(&self->_objectIDLock);
  episodeObjectID = self->_episodeObjectID;
  self->_episodeObjectID = v4;

  os_unfair_lock_unlock(&self->_objectIDLock);
}

- (void)setEpisodeNumber:(int64_t)a3
{
  self->_episodeNumber = a3;
}

- (void)setEpisodeGuid:(id)a3
{
  objc_storeStrong((id *)&self->_episodeGuid, a3);
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setChannelStoreId:(int64_t)a3
{
  self->_channelStoreId = a3;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setArtworkUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setAlbum:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (IMPlayerItem)initWithUrl:(id)a3
{
  id v5;
  IMPlayerItem *v6;
  IMPlayerItem *v7;

  v5 = a3;
  v6 = -[IMPlayerItem init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v7->_objectIDLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (BOOL)isVideo
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL video;

  if (!self->_asset)
    return self->_video;
  -[IMPlayerItem asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "statusOfValueForKey:error:", CFSTR("tracks"), 0);

  if (v4 != 2)
    return self->_video;
  -[IMPlayerItem asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tracksWithMediaCharacteristic:", *MEMORY[0x1E0C8A788]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
    video = self->_video;
  else
    video = 0;

  return video;
}

- (NSURL)episodeShareUrl
{
  return self->_episodeShareUrl;
}

- (int64_t)episodeStoreId
{
  return self->_episodeStoreId;
}

- (NSString)transcriptIdentifier
{
  return self->_transcriptIdentifier;
}

- (int64_t)playCount
{
  return self->_playCount;
}

- (void)updateContentItem
{
  -[IMPlayerItem populateContentItem:](self, "populateContentItem:", self->_contentItem);
}

- (void)recreateContentItem
{
  id v3;
  void *v4;
  MPNowPlayingContentItem *v5;
  MPNowPlayingContentItem *contentItem;

  v3 = objc_alloc(MEMORY[0x1E0CC24A0]);
  -[IMPlayerItem contentItemIdentifier](self, "contentItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (MPNowPlayingContentItem *)objc_msgSend(v3, "initWithIdentifier:", v4);
  contentItem = self->_contentItem;
  self->_contentItem = v5;

  -[IMPlayerItem updateContentItem](self, "updateContentItem");
}

- (IMPlayerArtwork)uberArtworkProperties
{
  return self->_uberArtworkProperties;
}

- (NSString)transcriptSource
{
  return self->_transcriptSource;
}

- (NSDate)pubDate
{
  return self->_pubDate;
}

- (int64_t)podcastStoreId
{
  return self->_podcastStoreId;
}

- (BOOL)podcastIsSerial
{
  return self->_podcastIsSerial;
}

- (BOOL)isNotSubscribeable
{
  return self->_isNotSubscribeable;
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (int64_t)episodeType
{
  return self->_episodeType;
}

- (int64_t)editingStyleFlags
{
  return self->_editingStyleFlags;
}

- (NSString)author
{
  return self->_author;
}

- (double)duration
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double Seconds;
  CMTime time;

  if (!self->_asset)
    return self->_duration;
  -[IMPlayerItem asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "statusOfValueForKey:error:", CFSTR("duration"), 0);

  if (v4 != 2)
    return self->_duration;
  -[IMPlayerItem asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "duration");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- (AVURLAsset)asset
{
  AVURLAsset *asset;
  void *v4;

  asset = self->_asset;
  if (!asset)
  {
    -[IMPlayerItem createAssetForUrl:](self, "createAssetForUrl:", self->_url);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPlayerItem setAsset:](self, "setAsset:", v4);

    asset = self->_asset;
  }
  return asset;
}

- (void)populateContentItem:(id)a3
{
  id v4;
  IMPlayerItem *v5;

  v4 = a3;
  v5 = self;
  IMPlayerItem.populateContentItem(_:)(v4);

}

- (NSURL)podcastShareUrl
{
  return self->_podcastShareUrl;
}

- (void)setAreChaptersLoaded:(BOOL)a3
{
  self->_areChaptersLoaded = a3;
}

- (void)setManifest:(id)a3
{
  objc_storeWeak((id *)&self->_manifest, a3);
}

- (id)chapterAtTime:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[IMPlayerItem metadataChapters](self, "metadataChapters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  -[IMPlayerItem metadataChapters](self, "metadataChapters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __30__IMPlayerItem_chapterAtTime___block_invoke;
  v11[3] = &__block_descriptor_40_e36_B32__0__IMPlayerChapterInfo_8Q16_B24l;
  *(double *)&v11[4] = a3;
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v11);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[IMPlayerItem metadataChapters](self, "metadataChapters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __28__IMPlayerItem_loadChapters__block_invoke_8(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("IMMediaItemDidLoadChaptersNotification"), *(_QWORD *)(a1 + 32));

}

- (NSArray)chapters
{
  if (!-[IMPlayerItem areChaptersLoaded](self, "areChaptersLoaded")
    && -[IMPlayerItem isAssetLoaded](self, "isAssetLoaded"))
  {
    -[IMPlayerItem loadChapters](self, "loadChapters");
  }
  return self->_chapters;
}

- (BOOL)areChaptersLoaded
{
  return self->_areChaptersLoaded;
}

BOOL __32__IMPlayerItem_metadataChapters__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 1;
}

BOOL __28__IMPlayerItem_timeChapters__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 0;
}

- (NSArray)metadataChapters
{
  void *v2;
  void *v3;
  void *v4;

  -[IMPlayerItem chapters](self, "chapters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_28_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)timeChapters
{
  void *v2;
  void *v3;
  void *v4;

  -[IMPlayerItem chapters](self, "chapters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (BOOL)isAssetLoaded
{
  return self->_asset != 0;
}

- (void)loadChapters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  IMPlayerItem *v10;

  if (!-[IMPlayerItem areChaptersLoaded](self, "areChaptersLoaded")
    && !-[IMPlayerItem areChaptersLoading](self, "areChaptersLoading"))
  {
    -[IMPlayerItem url](self, "url");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(&unk_1EA0F64C0, "containsObject:", v5))
    {
      -[IMPlayerItem setAreChaptersLoading:](self, "setAreChaptersLoading:", 1);
      -[IMPlayerItem asset](self, "asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __28__IMPlayerItem_loadChapters__block_invoke;
      v8[3] = &unk_1EA0C5098;
      v9 = v6;
      v10 = self;
      v7 = v6;
      objc_msgSend(v7, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1EA0F64D8, v8);

    }
  }
}

- (void)setAreChaptersLoading:(BOOL)a3
{
  self->_areChaptersLoading = a3;
}

- (BOOL)areChaptersLoading
{
  return self->_areChaptersLoading;
}

- (NSString)priceType
{
  return self->_priceType;
}

- (NSManagedObjectID)episodeObjectID
{
  os_unfair_lock_s *p_objectIDLock;
  NSManagedObjectID *v4;

  p_objectIDLock = &self->_objectIDLock;
  os_unfair_lock_lock(&self->_objectIDLock);
  v4 = self->_episodeObjectID;
  os_unfair_lock_unlock(p_objectIDLock);
  return v4;
}

- (void)setPlayhead:(double)a3
{
  void *v4;
  id v5;

  self->_playhead = a3;
  -[IMPlayerItem manifest](self, "manifest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPlayerItem updateActivity:](self, "updateActivity:", v4);

}

- (IMPlayerManifest)manifest
{
  return (IMPlayerManifest *)objc_loadWeakRetained((id *)&self->_manifest);
}

void __28__IMPlayerItem_loadChapters__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CMTimeRange *v18;
  void *v19;
  Float64 v20;
  void *v21;
  id obj;
  _QWORD block[5];
  CMTimeRange v24;
  CMTimeRange v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTime v29;
  CMTimeRange v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CMTime v34;
  CMTime v35;
  CMTimeRange v36;
  CMTimeRange v37;
  CMTime v38;
  CMTime start;
  CMTimeRange v40;
  CMTime time;
  CMTime v42;
  CMTime rhs;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  CMTime lhs;
  CMTimeRange v48;
  CMTimeRange v49;
  CMTime v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CMTime v54;
  __int128 v55;
  _QWORD v56[4];
  CMTime v57;
  CMTime duration;
  CMTimeRange v59;
  _OWORD v60[3];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("metadataType=%d"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_62);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = 0u;
  v72 = 0u;
  v71 = 0u;
  v70 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_24;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v71;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      v11 = v8;
      if (*(_QWORD *)v71 != v9)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
      v8 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
      objc_msgSend(v8, "setType:", 0);
      objc_msgSend(v12, "time");
      objc_msgSend(v8, "setTime:");
      objc_msgSend(v12, "duration");
      objc_msgSend(v8, "setDuration:");
      if (v12)
      {
        objc_msgSend(v12, "mediaTimeRange");
        v64 = v67;
        v65 = v68;
        v66 = v69;
        objc_msgSend(v8, "setMediaTimeRange:", &v64);
        objc_msgSend(v12, "assetTimeRange");
      }
      else
      {
        v69 = 0u;
        v68 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        objc_msgSend(v8, "setMediaTimeRange:", &v64);
        v63 = 0u;
        v62 = 0u;
        v61 = 0u;
      }
      v60[0] = v61;
      v60[1] = v62;
      v60[2] = v63;
      objc_msgSend(v8, "setAssetTimeRange:", v60);
      objc_msgSend(v12, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v13);

      if (v11)
      {
        memset(&v50, 0, sizeof(v50));
        if (v12)
        {
          objc_msgSend(v12, "mediaTimeRange");
        }
        else
        {
          v45 = 0u;
          v46 = 0u;
          v44 = 0u;
        }
        *(_OWORD *)&lhs.value = v44;
        lhs.epoch = v45;
        objc_msgSend(v11, "mediaTimeRange");
        rhs = v42;
        CMTimeSubtract(&v50, &lhs, &rhs);
        time = v50;
        objc_msgSend(v11, "setDuration:", CMTimeGetSeconds(&time));
        objc_msgSend(v11, "mediaTimeRange");
        start = v38;
        time = v50;
        CMTimeRangeMake(&v40, &start, &time);
        v37 = v40;
        objc_msgSend(v11, "setAssetTimeRange:", &v37);
        v36 = v40;
        v18 = &v36;
        v19 = v11;
      }
      else
      {
        objc_msgSend(v8, "time");
        if (v14 == 0.0)
          goto LABEL_20;
        objc_msgSend(v8, "time");
        v16 = v15;
        objc_msgSend(v8, "duration");
        objc_msgSend(v8, "setDuration:", v16 + v17);
        objc_msgSend(v8, "setTime:", 0.0);
        if (v8)
        {
          objc_msgSend(v8, "mediaTimeRange");
          v57 = *(CMTime *)&v56[1];
          objc_msgSend(v8, "mediaTimeRange");
        }
        else
        {
          memset(v56, 0, sizeof(v56));
          v55 = 0u;
          *(_OWORD *)&v57.value = *(_OWORD *)&v56[1];
          v57.epoch = 0;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
        }
        *(_OWORD *)&v54.value = v51;
        v54.epoch = v52;
        CMTimeAdd(&duration, &v57, &v54);
        v50 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        CMTimeRangeMake(&v59, &v50, &duration);
        v49 = v59;
        objc_msgSend(v8, "setAssetTimeRange:", &v49);
        v48 = v59;
        v18 = &v48;
        v19 = v8;
      }
      objc_msgSend(v19, "setMediaTimeRange:", v18);
LABEL_20:

    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  }
  while (v7);
LABEL_24:

  memset(&v50, 0, sizeof(v50));
  objc_msgSend(*(id *)(a1 + 40), "duration");
  CMTimeMakeWithSeconds(&v35, v20, 1);
  if (v8)
  {
    objc_msgSend(v8, "mediaTimeRange");
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
    v31 = 0u;
  }
  *(_OWORD *)&v34.value = v31;
  v34.epoch = v32;
  CMTimeSubtract(&v50, &v35, &v34);
  time = v50;
  objc_msgSend(v8, "setDuration:", CMTimeGetSeconds(&time));
  if (v8)
  {
    objc_msgSend(v8, "mediaTimeRange");
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
  }
  *(_OWORD *)&v29.value = v26;
  v29.epoch = v27;
  time = v50;
  CMTimeRangeMake(&v30, &v29, &time);
  v25 = v30;
  objc_msgSend(v8, "setAssetTimeRange:", &v25);
  v24 = v30;
  objc_msgSend(v8, "setMediaTimeRange:", &v24);
  objc_msgSend(*(id *)(a1 + 32), "sortedArrayUsingComparator:", &__block_literal_global_63);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setChapters:", v21);

  objc_msgSend(*(id *)(a1 + 40), "setAreChaptersLoading:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setAreChaptersLoaded:", 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__IMPlayerItem_loadChapters__block_invoke_8;
  block[3] = &unk_1EA0C4FB0;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __28__IMPlayerItem_loadChapters__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  CMTime v8;
  CMTime v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CMTime v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CMTime time2;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CMTime time1;

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    objc_msgSend(v4, "mediaTimeRange");
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
  }
  *(_OWORD *)&time1.value = v18;
  time1.epoch = v19;
  if (v5)
  {
    objc_msgSend(v5, "mediaTimeRange");
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
  }
  *(_OWORD *)&time2.value = v14;
  time2.epoch = v15;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    v6 = -1;
  }
  else
  {
    if (v4)
    {
      objc_msgSend(v4, "mediaTimeRange");
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
      v10 = 0u;
    }
    *(_OWORD *)&v13.value = v10;
    v13.epoch = v11;
    if (v5)
      objc_msgSend(v5, "mediaTimeRange");
    else
      memset(&v8, 0, sizeof(v8));
    v9 = v8;
    v6 = CMTimeCompare(&v13, &v9) > 0;
  }

  return v6;
}

uint64_t __28__IMPlayerItem_loadChapters__block_invoke_4(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  __int128 v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 40);
    v8 = *(_OWORD *)(a1 + 48);
    *(_QWORD *)&v9 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v3, "setTime:", CMTimeGetSeconds((CMTime *)&v8));
    v4 = *(void **)(a1 + 40);
    v5 = *(_OWORD *)(a1 + 88);
    v8 = *(_OWORD *)(a1 + 72);
    v9 = v5;
    v10 = *(_OWORD *)(a1 + 104);
    objc_msgSend(v4, "setMediaTimeRange:", &v8);
    v6 = *(void **)(a1 + 40);
    v7 = *(_OWORD *)(a1 + 88);
    v8 = *(_OWORD *)(a1 + 72);
    v9 = v7;
    v10 = *(_OWORD *)(a1 + 104);
    objc_msgSend(v6, "setAssetTimeRange:", &v8);
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __28__IMPlayerItem_loadChapters__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD block[4];
  id v26;
  id v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CMTime time;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  _OWORD v37[2];

  v2 = (void *)MEMORY[0x1DF09FCE8]();
  v3 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "commonKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8A8C0]);

  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "extraAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("HREF"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setType:", 1);
    if (v8)
    {
      objc_msgSend(v3, "setMetadataType:", 2);
      objc_msgSend(*(id *)(a1 + 32), "extraAttributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("HREF"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setExternalURL:", v11);

      objc_msgSend(*(id *)(a1 + 32), "stringValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        v15 = v14;
      else
        v15 = v10;
      objc_msgSend(v3, "setTitle:", v15);

    }
    else
    {
      objc_msgSend(v3, "setMetadataType:", 1);
      objc_msgSend(*(id *)(a1 + 32), "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTitle:", v19);

    }
  }
  else
  {
    objc_msgSend(v6, "commonKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C8A888]);

    if (!v17)
      goto LABEL_16;
    objc_msgSend(v3, "setType:", 1);
    objc_msgSend(v3, "setMetadataType:", 3);
    objc_msgSend(*(id *)(a1 + 32), "dataValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setArtworkData:", v10);
  }

  memset(v37, 0, sizeof(v37));
  v36 = 0u;
  v20 = *(void **)(a1 + 40);
  if (v20)
    objc_msgSend(v20, "timeRange");
  time = *(CMTime *)((char *)v37 + 8);
  v34 = v36;
  v35 = *(_QWORD *)&v37[0];
  objc_msgSend(v3, "setDuration:", CMTimeGetSeconds(&time));
  objc_msgSend(v3, "duration");
  if (v21 >= 0.05)
  {
    if (objc_msgSend(v3, "metadataType") != 1
      || (objc_msgSend(v3, "title"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "length"),
          v22,
          v23))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __28__IMPlayerItem_loadChapters__block_invoke_4;
      block[3] = &unk_1EA0C5498;
      v24 = *(NSObject **)(a1 + 48);
      v26 = *(id *)(a1 + 56);
      v27 = v3;
      v28 = v34;
      v29 = v35;
      v30 = v36;
      v31 = v37[0];
      v32 = v37[1];
      dispatch_sync(v24, block);

    }
  }
LABEL_16:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

  objc_autoreleasePoolPop(v2);
}

uint64_t __28__IMPlayerItem_loadChapters__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "time");
  v7 = v6;
  objc_msgSend(v5, "time");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "time");
    v11 = v10;
    objc_msgSend(v5, "time");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

void __28__IMPlayerItem_loadChapters__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  dispatch_queue_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD block[4];
  id v40;
  uint64_t v41;
  _QWORD v42[6];
  NSObject *v43;
  id v44;
  NSObject *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  id v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v63 = 0;
  v2 = objc_msgSend(v1, "statusOfValueForKey:error:", CFSTR("availableChapterLocales"), &v63);
  v34 = v63;
  if (v2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "availableChapterLocales");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "count"))
    {
      v57 = 0;
      v58 = &v57;
      v59 = 0x3032000000;
      v60 = __Block_byref_object_copy__1;
      v61 = __Block_byref_object_dispose__1;
      v62 = 0;
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __28__IMPlayerItem_loadChapters__block_invoke_2;
      v54[3] = &unk_1EA0C5470;
      v4 = v32;
      v55 = v4;
      v56 = &v57;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v54);

      if (!v58[5])
      {
        if (objc_msgSend(v4, "count"))
          objc_msgSend(v4, "firstObject");
        else
          objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v5 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v58[5];
        v58[5] = v5;

      }
      v13 = objc_alloc(MEMORY[0x1E0C99D20]);
      v14 = (void *)objc_msgSend(v13, "initWithObjects:", *MEMORY[0x1E0C8A8C0], *MEMORY[0x1E0C8A888], 0);
      objc_msgSend(*(id *)(a1 + 40), "asset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "chapterMetadataGroupsWithTitleLocale:containingItemsWithCommonKeys:", v58[5], v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v18 = dispatch_group_create();
      v19 = dispatch_queue_create("com.apple.podcasts.playeritemchapters", 0);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("commonKey"), CFSTR("extraAttributes"), CFSTR("value"), CFSTR("time"), CFSTR("duration"), 0);

      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      obj = v16;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
      if (v21)
      {
        v36 = *(_QWORD *)v51;
        do
        {
          v22 = 0;
          v37 = v21;
          do
          {
            if (*(_QWORD *)v51 != v36)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v22);
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            objc_msgSend(v23, "items");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
            v38 = v22;
            if (v25)
            {
              v26 = *(_QWORD *)v47;
              do
              {
                v27 = 0;
                do
                {
                  if (*(_QWORD *)v47 != v26)
                    objc_enumerationMutation(v24);
                  v28 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v27);
                  dispatch_group_enter(v18);
                  v42[0] = MEMORY[0x1E0C809B0];
                  v42[1] = 3221225472;
                  v42[2] = __28__IMPlayerItem_loadChapters__block_invoke_3;
                  v42[3] = &unk_1EA0C54C0;
                  v42[4] = v28;
                  v42[5] = v23;
                  v43 = v19;
                  v44 = v17;
                  v45 = v18;
                  objc_msgSend(v28, "loadValuesAsynchronouslyForKeys:completionHandler:", v20, v42);

                  ++v27;
                }
                while (v25 != v27);
                v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
              }
              while (v25);
            }

            v22 = v38 + 1;
          }
          while (v38 + 1 != v37);
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
        }
        while (v21);
      }

      objc_msgSend(*(id *)(a1 + 40), "chapterLoadingQueue");
      v29 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __28__IMPlayerItem_loadChapters__block_invoke_5;
      block[3] = &unk_1EA0C5098;
      v30 = *(_QWORD *)(a1 + 40);
      v40 = v17;
      v41 = v30;
      v31 = v17;
      dispatch_group_notify(v18, v29, block);

      _Block_object_dispose(&v57, 8);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7F1C8], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/AV/NowPlaying/Models/IMPlayerItem.m", 530, CFSTR("Unable to load availableChapterLocales with status: %ld"), v2);

    if (v34)
    {
      objc_msgSend(MEMORY[0x1E0D7F1C8], "sharedLogger");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v34, "code");
      objc_msgSend(v34, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/AV/NowPlaying/Models/IMPlayerItem.m", 532, CFSTR("Error: [%ld %@] %@"), v8, v9, v11);

    }
    objc_msgSend(*(id *)(a1 + 40), "setAreChaptersLoading:", 0);
  }

}

- (void)setChapters:(id)a3
{
  objc_storeStrong((id *)&self->_chapters, a3);
}

- (OS_dispatch_queue)chapterLoadingQueue
{
  return self->_chapterLoadingQueue;
}

- (IMPlayerItem)init
{
  IMPlayerItem *v2;
  IMPlayerItem *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *chapterLoadingQueue;
  uint64_t v6;
  NSUUID *instanceIdentifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMPlayerItem;
  v2 = -[IMPlayerItem init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_duration = 0.0;
    v2->_playhead = 0.0;
    v4 = dispatch_queue_create("com.apple.podcasts.playerItem.chapterLoadingQueue", 0);
    chapterLoadingQueue = v3->_chapterLoadingQueue;
    v3->_chapterLoadingQueue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    instanceIdentifier = v3->_instanceIdentifier;
    v3->_instanceIdentifier = (NSUUID *)v6;

    -[IMPlayerItem setAreChaptersLoaded:](v3, "setAreChaptersLoaded:", 0);
  }
  return v3;
}

- (BOOL)enqueuedByAnotherUser
{
  return self->_enqueuedByAnotherUser;
}

- (int64_t)channelStoreId
{
  return self->_channelStoreId;
}

- (IMPlayerItem)initWithEpisode:(id)a3
{
  return (IMPlayerItem *)IMPlayerItem.init(episode:)(a3);
}

BOOL __30__IMPlayerItem_chapterAtTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL8 v10;

  v3 = a2;
  v4 = *(double *)(a1 + 32);
  objc_msgSend(v3, "time");
  v10 = 0;
  if (v4 >= v5)
  {
    v6 = *(double *)(a1 + 32);
    objc_msgSend(v3, "time");
    v8 = v7;
    objc_msgSend(v3, "duration");
    if (v6 < v8 + v9 && objc_msgSend(v3, "metadataType") == 3)
      v10 = 1;
  }

  return v10;
}

void __28__IMPlayerItem_loadChapters__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_class *v6;
  id v7;
  id obj;

  v6 = (objc_class *)MEMORY[0x1E0C99DC8];
  v7 = a2;
  obj = (id)objc_msgSend([v6 alloc], "initWithLocaleIdentifier:", v7);

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", obj))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
    *a4 = 1;
  }

}

- (void)setAsset:(id)a3
{
  id v5;
  AVURLAsset **p_asset;
  AVURLAsset *asset;
  id v8;

  v5 = a3;
  asset = self->_asset;
  p_asset = &self->_asset;
  v8 = v5;
  if ((objc_msgSend(v5, "isEqual:", asset) & 1) == 0)
    objc_storeStrong((id *)p_asset, a3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_storeStrong((id *)&self->_chapterLoadingQueue, 0);
  objc_storeStrong((id *)&self->_transcriptIdentifier, 0);
  objc_storeStrong((id *)&self->_transcriptSource, 0);
  objc_storeStrong((id *)&self->_episodeArtworkProperties, 0);
  objc_storeStrong((id *)&self->_showArtworkProperties, 0);
  objc_storeStrong((id *)&self->_uberArtworkProperties, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
  objc_destroyWeak((id *)&self->_manifest);
  objc_storeStrong((id *)&self->_chapters, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_secureKeyLoader, 0);
  objc_storeStrong((id *)&self->_podcastDisplayType, 0);
  objc_storeStrong((id *)&self->_alternatePaidURL, 0);
  objc_storeStrong((id *)&self->_priceType, 0);
  objc_storeStrong((id *)&self->_episode, 0);
  objc_storeStrong((id *)&self->_episodeShareUrl, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_pubDate, 0);
  objc_storeStrong((id *)&self->_episodeGuid, 0);
  objc_storeStrong((id *)&self->_episodeUuid, 0);
  objc_storeStrong((id *)&self->_artworkUrl, 0);
  objc_storeStrong((id *)&self->_podcastShareUrl, 0);
  objc_storeStrong((id *)&self->_podcastFeedUrl, 0);
  objc_storeStrong((id *)&self->_podcastUuid, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_episodeObjectID, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (id)retrieveChapterArtworkAtTime:(double)a3
{
  void *v3;
  void *v4;

  -[IMPlayerItem chapterAtTime:](self, "chapterAtTime:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)cleanupAfterError
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[IMPlayerItem isAssetLoaded](self, "isAssetLoaded"))
  {
    -[IMPlayerItem asset](self, "asset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cacheKey");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[IMPlayerItem asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      NSClassFromString(CFSTR("AVManagedAssetCache"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v5, "removeEntryForKey:", v6);
    }
    -[IMPlayerItem invalidateAsset](self, "invalidateAsset");

  }
}

- (void)reset
{
  void *v3;
  id v4;

  -[AVURLAsset URL](self->_asset, "URL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IMPlayerItem createAssetForUrl:](self, "createAssetForUrl:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPlayerItem setAsset:](self, "setAsset:", v3);

}

- (void)setInstanceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_instanceIdentifier, a3);
  -[IMPlayerItem setContentItem:](self, "setContentItem:", 0);
}

- (id)createAssetForUrl:(id)a3
{
  return 0;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[IMPlayerItem instanceIdentifier](self, "instanceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "instanceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMPlayerItem instanceIdentifier](self, "instanceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)invalidateAsset
{
  AVURLAsset *asset;

  -[AVURLAsset cancelLoading](self->_asset, "cancelLoading");
  asset = self->_asset;
  self->_asset = 0;

}

- (BOOL)supportsArtworkUrl
{
  return 1;
}

- (BOOL)isPlayable
{
  return 1;
}

- (BOOL)notifyUserIsNotPlayable
{
  return 0;
}

- (BOOL)isShareable
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[IMPlayerItem episode](self, "episode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isShareable") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[IMPlayerItem episodeShareUrl](self, "episodeShareUrl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[IMPlayerItem podcastFeedUrl](self, "podcastFeedUrl");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  return v4;
}

- (BOOL)isStreamable
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D7F260], "validatedIdNumberFromStoreId:", -[IMPlayerItem episodeStoreId](self, "episodeStoreId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)streamUrl
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (-[IMPlayerItem isLocal](self, "isLocal"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__1;
    v18 = __Block_byref_object_dispose__1;
    -[IMPlayerItem episode](self, "episode");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)v15[5];
    if (v3)
    {
      v8 = 0;
      v9 = &v8;
      v10 = 0x3032000000;
      v11 = __Block_byref_object_copy__1;
      v12 = __Block_byref_object_dispose__1;
      v13 = 0;
      objc_msgSend(v3, "managedObjectContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __25__IMPlayerItem_streamUrl__block_invoke;
      v7[3] = &unk_1EA0C53C8;
      v7[4] = &v14;
      v7[5] = &v8;
      objc_msgSend(v4, "performBlockAndWait:", v7);
      v5 = (id)v9[5];

      _Block_object_dispose(&v8, 8);
    }
    else
    {
      v5 = 0;
    }
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    -[IMPlayerItem url](self, "url");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

void __25__IMPlayerItem_streamUrl__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "feedDeleted") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "enclosureURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v4 = *(void **)(v3 + 40);
      *(_QWORD *)(v3 + 40) = v2;

    }
  }
}

- (id)externalMetadata
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMPlayerItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C8B278]);
    objc_msgSend(v5, "setIdentifier:", *MEMORY[0x1E0C8A870]);
    objc_msgSend(v5, "setExtendedLanguageTag:", CFSTR("und"));
    objc_msgSend(v5, "setValue:", v4);
    objc_msgSend(v3, "addObject:", v5);

  }
  -[IMPlayerItem author](self, "author");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C8B278]);
    objc_msgSend(v7, "setIdentifier:", *MEMORY[0x1E0C8A9A0]);
    objc_msgSend(v7, "setExtendedLanguageTag:", CFSTR("und"));
    objc_msgSend(v7, "setValue:", v6);
    objc_msgSend(v3, "addObject:", v7);

  }
  return v3;
}

- (id)contentItemIdentifier
{
  return &stru_1EA0D7620;
}

- (BOOL)_isContentItemLoaded
{
  return self->_contentItem != 0;
}

- (id)fetchArtworkItemProviderForSize:(CGSize)a3
{
  return 0;
}

- (void)retrieveArtwork:(id)a3 withSize:(CGSize)a4
{
  (*((void (**)(id, _QWORD, CGSize, __n128))a3 + 2))(a3, 0, a4, *(__n128 *)&a4.height);
}

- (BOOL)hasChapterArtworkAtTime:(double)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[IMPlayerItem chapterAtTime:](self, "chapterAtTime:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artworkData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)retrieveArtwork:(id)a3 withSize:(CGSize)a4 atTime:(double)a5
{
  double height;
  double width;
  void (**v9)(id, uint64_t);
  uint64_t v10;
  id v11;

  height = a4.height;
  width = a4.width;
  v9 = (void (**)(id, uint64_t))a3;
  -[IMPlayerItem retrieveChapterArtworkAtTime:](self, "retrieveChapterArtworkAtTime:", a5);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (id)v10;
  if (v10)
    v9[2](v9, v10);
  else
    -[IMPlayerItem retrieveArtwork:withSize:](self, "retrieveArtwork:withSize:", v9, width, height);

}

- (BOOL)upgradeToAlternatePaidVersionIfNeeded
{
  return 0;
}

- (void)updateTranscriptInformation:(id)a3 transcriptSource:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)&self->_transcriptIdentifier, a3);
  v7 = a3;
  v8 = a4;
  -[MPNowPlayingContentItem userInfo](self->_contentItem, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_transcriptIdentifier, *MEMORY[0x1E0CC2210]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CC2218]);

  -[MPNowPlayingContentItem setUserInfo:](self->_contentItem, "setUserInfo:", v10);
}

- (NSURL)artworkUrl
{
  return self->_artworkUrl;
}

- (void)setEnqueuedByAnotherUser:(BOOL)a3
{
  self->_enqueuedByAnotherUser = a3;
}

- (int64_t)episodePID
{
  return self->_episodePID;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
  objc_storeStrong((id *)&self->_itemDescription, a3);
}

- (void)setEpisodeShareUrl:(id)a3
{
  objc_storeStrong((id *)&self->_episodeShareUrl, a3);
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (MTEpisode)episode
{
  return self->_episode;
}

- (NSURL)alternatePaidURL
{
  return self->_alternatePaidURL;
}

- (void)setAlternatePaidURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)podcastDisplayType
{
  return self->_podcastDisplayType;
}

- (BOOL)isEntitled
{
  return self->_entitled;
}

- (IMAVSecureKeyLoader)secureKeyLoader
{
  return self->_secureKeyLoader;
}

- (void)setSecureKeyLoader:(id)a3
{
  objc_storeStrong((id *)&self->_secureKeyLoader, a3);
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (unint64_t)manifestIndex
{
  return self->_manifestIndex;
}

- (void)setEditingStyleFlags:(int64_t)a3
{
  self->_editingStyleFlags = a3;
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (void)setArtworkCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_artworkCatalog, a3);
}

- (void)setUberArtworkProperties:(id)a3
{
  objc_storeStrong((id *)&self->_uberArtworkProperties, a3);
}

- (void)setEpisodeArtworkProperties:(id)a3
{
  objc_storeStrong((id *)&self->_episodeArtworkProperties, a3);
}

- (BOOL)isAppleMusicEpisode
{
  return self->_isAppleMusicEpisode;
}

- (BOOL)isAppleNewsEpisode
{
  return self->_isAppleNewsEpisode;
}

- (void)setChapterLoadingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_chapterLoadingQueue, a3);
}

- (void)setContentItem:(id)a3
{
  objc_storeStrong((id *)&self->_contentItem, a3);
}

@end
