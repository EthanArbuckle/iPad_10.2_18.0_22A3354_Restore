@implementation MediaLibraryItem

- (MediaLibraryItem)initWithDateAccessed:(id)a3 album:(id)a4 title:(id)a5 fileSize:(id)a6 externalGuid:(id)a7 bookmarkTimeMillis:(id)a8 seriesName:(id)a9 itemDescription:(id)a10 hasVideo:(id)a11 feedUrl:(id)a12 playlistId:(id)a13 dateReleased:(id)a14 artist:(id)a15 totalTimeMillis:(id)a16 playCount:(id)a17 hasBeenPlayed:(id)a18 serpentId:(id)a19 activeDsid:(id)a20 statsDownloadIdentifier:(id)a21 itemFilePath:(id)a22 artworkUrl:(id)a23 artworkTokenId:(id)a24
{
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  MediaLibraryItem *v38;
  MediaLibraryItem *v39;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  objc_super v55;

  v54 = a3;
  v53 = a4;
  v52 = a5;
  v51 = a6;
  v50 = a7;
  v49 = a8;
  v48 = a9;
  v47 = a10;
  v46 = a11;
  v45 = a12;
  v44 = a13;
  v43 = a14;
  v42 = a15;
  v29 = a16;
  v30 = a17;
  v31 = a18;
  v32 = a19;
  v33 = a20;
  v34 = a21;
  v35 = a22;
  v36 = a23;
  v37 = a24;
  v55.receiver = self;
  v55.super_class = (Class)MediaLibraryItem;
  v38 = -[MediaLibraryItem init](&v55, sel_init);
  v39 = v38;
  if (v38)
  {
    -[MediaLibraryItem setDateAccessed:](v38, "setDateAccessed:", v54);
    -[MediaLibraryItem setAlbum:](v39, "setAlbum:", v53);
    -[MediaLibraryItem setTitle:](v39, "setTitle:", v52);
    -[MediaLibraryItem setFileSize:](v39, "setFileSize:", v51);
    -[MediaLibraryItem setExternalGuid:](v39, "setExternalGuid:", v50);
    -[MediaLibraryItem setBookmarkTimeMillis:](v39, "setBookmarkTimeMillis:", v49);
    -[MediaLibraryItem setSeriesName:](v39, "setSeriesName:", v48);
    -[MediaLibraryItem setItemDescription:](v39, "setItemDescription:", v47);
    -[MediaLibraryItem setHasVideo:](v39, "setHasVideo:", v46);
    -[MediaLibraryItem setFeedUrl:](v39, "setFeedUrl:", v45);
    -[MediaLibraryItem setPlaylistId:](v39, "setPlaylistId:", v44);
    -[MediaLibraryItem setDateReleased:](v39, "setDateReleased:", v43);
    -[MediaLibraryItem setArtist:](v39, "setArtist:", v42);
    -[MediaLibraryItem setTotalTimeMillis:](v39, "setTotalTimeMillis:", v29);
    -[MediaLibraryItem setPlayCount:](v39, "setPlayCount:", v30);
    -[MediaLibraryItem setHasBeenPlayed:](v39, "setHasBeenPlayed:", v31);
    -[MediaLibraryItem setSerpentId:](v39, "setSerpentId:", v32);
    -[MediaLibraryItem setActiveDsid:](v39, "setActiveDsid:", v33);
    -[MediaLibraryItem setStatsDownloadIdentifier:](v39, "setStatsDownloadIdentifier:", v34);
    -[MediaLibraryItem setItemFilePath:](v39, "setItemFilePath:", v35);
    -[MediaLibraryItem setArtworkUrl:](v39, "setArtworkUrl:", v36);
    -[MediaLibraryItem setArtworkTokenId:](v39, "setArtworkTokenId:", v37);
  }

  return v39;
}

+ (NSNumber)remeberBookmark
{
  return (NSNumber *)MEMORY[0x1E0C9AAB0];
}

+ (NSNumber)playbackStart
{
  return (NSNumber *)&unk_1E55394E8;
}

+ (NSNumber)playbackRelativeVolume
{
  return (NSNumber *)&unk_1E5539500;
}

+ (NSNumber)isOTAPurchased
{
  return (NSNumber *)MEMORY[0x1E0C9AAB0];
}

+ (NSNumber)needsRestore
{
  return (NSNumber *)MEMORY[0x1E0C9AAA0];
}

+ (NSNumber)chosenByAutofill
{
  return (NSNumber *)MEMORY[0x1E0C9AAA0];
}

+ (NSNumber)isCompilation
{
  return (NSNumber *)MEMORY[0x1E0C9AAA0];
}

- (NSNumber)dateAccessed
{
  return self->_dateAccessed;
}

- (void)setDateAccessed:(id)a3
{
  objc_storeStrong((id *)&self->_dateAccessed, a3);
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(id)a3
{
  objc_storeStrong((id *)&self->_fileSize, a3);
}

- (NSString)externalGuid
{
  return self->_externalGuid;
}

- (void)setExternalGuid:(id)a3
{
  objc_storeStrong((id *)&self->_externalGuid, a3);
}

- (NSNumber)bookmarkTimeMillis
{
  return self->_bookmarkTimeMillis;
}

- (void)setBookmarkTimeMillis:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkTimeMillis, a3);
}

- (NSString)seriesName
{
  return self->_seriesName;
}

- (void)setSeriesName:(id)a3
{
  objc_storeStrong((id *)&self->_seriesName, a3);
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
  objc_storeStrong((id *)&self->_itemDescription, a3);
}

- (NSNumber)hasVideo
{
  return self->_hasVideo;
}

- (void)setHasVideo:(id)a3
{
  objc_storeStrong((id *)&self->_hasVideo, a3);
}

- (NSString)feedUrl
{
  return self->_feedUrl;
}

- (void)setFeedUrl:(id)a3
{
  objc_storeStrong((id *)&self->_feedUrl, a3);
}

- (NSNumber)playlistId
{
  return self->_playlistId;
}

- (void)setPlaylistId:(id)a3
{
  objc_storeStrong((id *)&self->_playlistId, a3);
}

- (NSNumber)dateReleased
{
  return self->_dateReleased;
}

- (void)setDateReleased:(id)a3
{
  objc_storeStrong((id *)&self->_dateReleased, a3);
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_storeStrong((id *)&self->_artist, a3);
}

- (NSNumber)totalTimeMillis
{
  return self->_totalTimeMillis;
}

- (void)setTotalTimeMillis:(id)a3
{
  objc_storeStrong((id *)&self->_totalTimeMillis, a3);
}

- (NSNumber)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(id)a3
{
  objc_storeStrong((id *)&self->_playCount, a3);
}

- (NSNumber)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (void)setHasBeenPlayed:(id)a3
{
  objc_storeStrong((id *)&self->_hasBeenPlayed, a3);
}

- (NSNumber)serpentId
{
  return self->_serpentId;
}

- (void)setSerpentId:(id)a3
{
  objc_storeStrong((id *)&self->_serpentId, a3);
}

- (NSNumber)activeDsid
{
  return self->_activeDsid;
}

- (void)setActiveDsid:(id)a3
{
  objc_storeStrong((id *)&self->_activeDsid, a3);
}

- (NSString)statsDownloadIdentifier
{
  return self->_statsDownloadIdentifier;
}

- (void)setStatsDownloadIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_statsDownloadIdentifier, a3);
}

- (NSURL)itemFilePath
{
  return self->_itemFilePath;
}

- (void)setItemFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_itemFilePath, a3);
}

- (NSURL)artworkUrl
{
  return self->_artworkUrl;
}

- (void)setArtworkUrl:(id)a3
{
  objc_storeStrong((id *)&self->_artworkUrl, a3);
}

- (NSNumber)artworkTokenId
{
  return self->_artworkTokenId;
}

- (void)setArtworkTokenId:(id)a3
{
  objc_storeStrong((id *)&self->_artworkTokenId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkTokenId, 0);
  objc_storeStrong((id *)&self->_artworkUrl, 0);
  objc_storeStrong((id *)&self->_itemFilePath, 0);
  objc_storeStrong((id *)&self->_statsDownloadIdentifier, 0);
  objc_storeStrong((id *)&self->_activeDsid, 0);
  objc_storeStrong((id *)&self->_serpentId, 0);
  objc_storeStrong((id *)&self->_hasBeenPlayed, 0);
  objc_storeStrong((id *)&self->_playCount, 0);
  objc_storeStrong((id *)&self->_totalTimeMillis, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_dateReleased, 0);
  objc_storeStrong((id *)&self->_playlistId, 0);
  objc_storeStrong((id *)&self->_feedUrl, 0);
  objc_storeStrong((id *)&self->_hasVideo, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_seriesName, 0);
  objc_storeStrong((id *)&self->_bookmarkTimeMillis, 0);
  objc_storeStrong((id *)&self->_externalGuid, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_dateAccessed, 0);
}

@end
