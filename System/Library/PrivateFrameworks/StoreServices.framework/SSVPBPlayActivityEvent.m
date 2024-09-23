@implementation SSVPBPlayActivityEvent

- (int)eventType
{
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
    return self->_eventType;
  else
    return 1;
}

- (void)setEventType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasEventType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E47BF7C8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlayEnd")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PlayStart")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LyricDisplay")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int)reasonHintType
{
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
    return self->_reasonHintType;
  else
    return 0;
}

- (void)setReasonHintType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_reasonHintType = a3;
}

- (void)setHasReasonHintType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasReasonHintType
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (id)reasonHintTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Unknown");
  if (a3 == 1)
  {
    v3 = CFSTR("ContainerChanged");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsReasonHintType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ContainerChanged"));

  return v4;
}

- (void)setSubscriptionAdamID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_subscriptionAdamID = a3;
}

- (void)setHasSubscriptionAdamID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSubscriptionAdamID
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setPurchasedAdamID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_purchasedAdamID = a3;
}

- (void)setHasPurchasedAdamID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPurchasedAdamID
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRadioAdamID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_radioAdamID = a3;
}

- (void)setHasRadioAdamID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRadioAdamID
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setItemCloudID:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_itemCloudID = a3;
}

- (void)setHasItemCloudID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasItemCloudID
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasLyricsID
{
  return self->_lyricsID != 0;
}

- (void)setEquivalencySourceAdamID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_equivalencySourceAdamID = a3;
}

- (void)setHasEquivalencySourceAdamID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasEquivalencySourceAdamID
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setContainerAdamID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_containerAdamID = a3;
}

- (void)setHasContainerAdamID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasContainerAdamID
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasGlobalPlaylistID
{
  return self->_globalPlaylistID != 0;
}

- (BOOL)hasStationHash
{
  return self->_stationHash != 0;
}

- (BOOL)hasStationStringID
{
  return self->_stationStringID != 0;
}

- (void)setStationID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_stationID = a3;
}

- (void)setHasStationID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasStationID
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasCloudAlbumID
{
  return self->_cloudAlbumID != 0;
}

- (void)setCloudPlaylistID:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_cloudPlaylistID = a3;
}

- (void)setHasCloudPlaylistID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasCloudPlaylistID
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasPlaylistVersionHash
{
  return self->_playlistVersionHash != 0;
}

- (int)containerType
{
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    return self->_containerType;
  else
    return 0;
}

- (void)setContainerType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_containerType = a3;
}

- (void)setHasContainerType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasContainerType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)containerTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E47BF7E0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsContainerType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RadioStation")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Playlist")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Album")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Artist")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (int)endReasonType
{
  if ((*((_BYTE *)&self->_has + 2) & 0x10) != 0)
    return self->_endReasonType;
  else
    return 0;
}

- (void)setEndReasonType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_endReasonType = a3;
}

- (void)setHasEndReasonType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasEndReasonType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (id)endReasonTypeAsString:(int)a3
{
  if (a3 < 0xF)
    return off_1E47BF808[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEndReasonType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotApplicable")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Other")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SkipBackward")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SkipForward")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QueueChange")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ManualPause")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Interruption")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InactivityPause")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InactivitySessionEnd")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NaturalTransition")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Ban")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AssetLoadFailure")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ScrubBegin")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ScrubEnd")) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("QuickPlay")))
  {
    v4 = 14;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setEventDateTimestamp:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_eventDateTimestamp = a3;
}

- (void)setHasEventDateTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasEventDateTimestamp
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasFeatureName
{
  return self->_featureName != 0;
}

- (void)setItemDuration:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_itemDuration = a3;
}

- (void)setHasItemDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasItemDuration
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setItemEndTime:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_itemEndTime = a3;
}

- (void)setHasItemEndTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasItemEndTime
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setItemStartTime:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_itemStartTime = a3;
}

- (void)setHasItemStartTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasItemStartTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (int)itemType
{
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    return self->_itemType;
  else
    return 0;
}

- (void)setItemType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_itemType = a3;
}

- (void)setHasItemType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasItemType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (id)itemTypeAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E47BF880[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsItemType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iTunesStoreContent")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AudioClip")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Ad")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Stream")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TimedMetadataPing")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UploadedContent")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AggregateNonCatalogPlayTime")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Movie")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TVEpisode")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)mediaType
{
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
    return self->_mediaType;
  else
    return 0;
}

- (void)setMediaType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_mediaType = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasMediaType
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (id)mediaTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Audio");
  if (a3 == 1)
  {
    v3 = CFSTR("Video");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsMediaType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Audio")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Video"));

  return v4;
}

- (void)setOffline:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_offline = a3;
}

- (void)setHasOffline:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasOffline
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setPersistentID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_persistentID = a3;
}

- (void)setHasPersistentID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPersistentID
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSBEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_sBEnabled = a3;
}

- (void)setHasSBEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (BOOL)hasSBEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (int)sourceType
{
  if ((*((_BYTE *)&self->_has + 3) & 2) != 0)
    return self->_sourceType;
  else
    return 0;
}

- (void)setSourceType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_sourceType = a3;
}

- (void)setHasSourceType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasSourceType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (id)sourceTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E47BF8D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSourceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Device")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PairedWatch")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RemoteControl")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setStoreAccountID:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_storeAccountID = a3;
}

- (void)setHasStoreAccountID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasStoreAccountID
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasTimedMetadata
{
  return self->_timedMetadata != 0;
}

- (BOOL)hasTrackInfo
{
  return self->_trackInfo != 0;
}

- (BOOL)hasRecommendationData
{
  return self->_recommendationData != 0;
}

- (BOOL)hasStoreFrontID
{
  return self->_storeFrontID != 0;
}

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (BOOL)hasRequestingBundleIdentifier
{
  return self->_requestingBundleIdentifier != 0;
}

- (BOOL)hasRequestingBundleVersion
{
  return self->_requestingBundleVersion != 0;
}

- (BOOL)hasEnqueuerProperties
{
  return self->_enqueuerProperties != 0;
}

- (BOOL)hasHouseholdID
{
  return self->_householdID != 0;
}

- (void)setPrivateListeningEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_privateListeningEnabled = a3;
}

- (void)setHasPrivateListeningEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasPrivateListeningEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setSiriInitiated:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000000;
  self->_siriInitiated = a3;
}

- (void)setHasSiriInitiated:(BOOL)a3
{
  unsigned int v3;

  if (a3)
    v3 = 0x80000000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(v3 & 0x80000000 | *(_DWORD *)&self->_has & 0x7FFFFFFF);
}

- (BOOL)hasSiriInitiated
{
  return *(_DWORD *)&self->_has >> 31;
}

- (int)systemReleaseType
{
  if ((*((_BYTE *)&self->_has + 3) & 4) != 0)
    return self->_systemReleaseType;
  else
    return 0;
}

- (void)setSystemReleaseType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_systemReleaseType = a3;
}

- (void)setHasSystemReleaseType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasSystemReleaseType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (id)systemReleaseTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E47BF8E8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSystemReleaseType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUSTOMER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARRIER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVELOPER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("INTERNAL")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasEventTimeZoneName
{
  return self->_eventTimeZoneName != 0;
}

- (int)displayType
{
  if ((*((_BYTE *)&self->_has + 2) & 8) != 0)
    return self->_displayType;
  else
    return 0;
}

- (void)setDisplayType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_displayType = a3;
}

- (void)setHasDisplayType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasDisplayType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)displayTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E47BF910[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDisplayType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoDisplayType")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Static")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LineByLine")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WordByWord")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCharacterDisplayedCount:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_characterDisplayedCount = a3;
}

- (void)setHasCharacterDisplayedCount:(BOOL)a3
{
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCharacterDisplayedCount
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasLyricLanguage
{
  return self->_lyricLanguage != 0;
}

- (BOOL)hasContainerID
{
  return self->_containerID != 0;
}

- (BOOL)hasPersonalizedContainerID
{
  return self->_personalizedContainerID != 0;
}

- (BOOL)hasStoreID
{
  return self->_storeID != 0;
}

- (BOOL)hasExternalID
{
  return self->_externalID != 0;
}

- (void)setTvShowPurchasedAdamID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_tvShowPurchasedAdamID = a3;
}

- (void)setHasTvShowPurchasedAdamID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTvShowPurchasedAdamID
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setTvShowSubscriptionAdamID:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_tvShowSubscriptionAdamID = a3;
}

- (void)setHasTvShowSubscriptionAdamID:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTvShowSubscriptionAdamID
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setInternalBuild:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_internalBuild = a3;
}

- (void)setHasInternalBuild:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasInternalBuild
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setEventSecondsFromGMT:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_eventSecondsFromGMT = a3;
}

- (void)setHasEventSecondsFromGMT:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($DE3EE0432C8889EE6FF627BF579DAD3F)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasEventSecondsFromGMT
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SSVPBPlayActivityEvent;
  -[SSVPBPlayActivityEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPBPlayActivityEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $DE3EE0432C8889EE6FF627BF579DAD3F has;
  unsigned int v5;
  __CFString *v6;
  int reasonHintType;
  __CFString *v8;
  void *v9;
  NSString *lyricsID;
  $DE3EE0432C8889EE6FF627BF579DAD3F v11;
  void *v12;
  void *v13;
  NSString *globalPlaylistID;
  NSString *stationHash;
  NSString *stationStringID;
  void *v17;
  NSString *cloudAlbumID;
  void *v19;
  NSString *playlistVersionHash;
  uint64_t containerType;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *deviceName;
  $DE3EE0432C8889EE6FF627BF579DAD3F v27;
  uint64_t endReasonType;
  __CFString *v29;
  void *v30;
  NSString *featureName;
  $DE3EE0432C8889EE6FF627BF579DAD3F v32;
  void *v33;
  NSData *timedMetadata;
  NSData *trackInfo;
  NSData *recommendationData;
  NSString *storeFrontID;
  NSString *buildVersion;
  NSString *requestingBundleIdentifier;
  NSString *requestingBundleVersion;
  SSVPBPlayActivityEnqueuerProperties *enqueuerProperties;
  void *v42;
  NSString *householdID;
  $DE3EE0432C8889EE6FF627BF579DAD3F v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t itemType;
  __CFString *v49;
  void *v50;
  void *v51;
  uint64_t systemReleaseType;
  __CFString *v53;
  int mediaType;
  __CFString *v55;
  NSString *eventTimeZoneName;
  $DE3EE0432C8889EE6FF627BF579DAD3F v57;
  uint64_t displayType;
  __CFString *v59;
  void *v60;
  NSString *lyricLanguage;
  NSString *containerID;
  NSString *personalizedContainerID;
  NSString *storeID;
  NSString *externalID;
  $DE3EE0432C8889EE6FF627BF579DAD3F v66;
  void *v67;
  id v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t sourceType;
  __CFString *v77;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    v5 = self->_eventType - 1;
    if (v5 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E47BF7C8[v5];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("eventType"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    reasonHintType = self->_reasonHintType;
    if (reasonHintType)
    {
      if (reasonHintType == 1)
      {
        v8 = CFSTR("ContainerChanged");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_reasonHintType);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v8 = CFSTR("Unknown");
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("reasonHintType"));

    has = self->_has;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_subscriptionAdamID);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("subscriptionAdamID"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&has & 0x1000) == 0)
        goto LABEL_16;
      goto LABEL_43;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_purchasedAdamID);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("purchasedAdamID"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_radioAdamID);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("radioAdamID"));

  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_itemCloudID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("itemCloudID"));

  }
LABEL_18:
  lyricsID = self->_lyricsID;
  if (lyricsID)
    objc_msgSend(v3, "setObject:forKey:", lyricsID, CFSTR("lyricsID"));
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_equivalencySourceAdamID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("equivalencySourceAdamID"));

    v11 = self->_has;
  }
  if ((*(_BYTE *)&v11 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_containerAdamID);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("containerAdamID"));

  }
  globalPlaylistID = self->_globalPlaylistID;
  if (globalPlaylistID)
    objc_msgSend(v3, "setObject:forKey:", globalPlaylistID, CFSTR("globalPlaylistID"));
  stationHash = self->_stationHash;
  if (stationHash)
    objc_msgSend(v3, "setObject:forKey:", stationHash, CFSTR("stationHash"));
  stationStringID = self->_stationStringID;
  if (stationStringID)
    objc_msgSend(v3, "setObject:forKey:", stationStringID, CFSTR("stationStringID"));
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_stationID);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("stationID"));

  }
  cloudAlbumID = self->_cloudAlbumID;
  if (cloudAlbumID)
    objc_msgSend(v3, "setObject:forKey:", cloudAlbumID, CFSTR("cloudAlbumID"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_cloudPlaylistID);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("cloudPlaylistID"));

  }
  playlistVersionHash = self->_playlistVersionHash;
  if (playlistVersionHash)
    objc_msgSend(v3, "setObject:forKey:", playlistVersionHash, CFSTR("playlistVersionHash"));
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    containerType = self->_containerType;
    if (containerType >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_containerType);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E47BF7E0[containerType];
    }
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("containerType"));

  }
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v3, "setObject:forKey:", deviceName, CFSTR("deviceName"));
  v27 = self->_has;
  if ((*(_DWORD *)&v27 & 0x100000) != 0)
  {
    endReasonType = self->_endReasonType;
    if (endReasonType >= 0xF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_endReasonType);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E47BF808[endReasonType];
    }
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("endReasonType"));

    v27 = self->_has;
  }
  if ((*(_BYTE *)&v27 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_eventDateTimestamp);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("eventDateTimestamp"));

  }
  featureName = self->_featureName;
  if (featureName)
    objc_msgSend(v3, "setObject:forKey:", featureName, CFSTR("featureName"));
  v32 = self->_has;
  if ((*(_BYTE *)&v32 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_itemDuration);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("itemDuration"));

    v32 = self->_has;
    if ((*(_WORD *)&v32 & 0x100) == 0)
    {
LABEL_60:
      if ((*(_WORD *)&v32 & 0x200) == 0)
        goto LABEL_61;
      goto LABEL_93;
    }
  }
  else if ((*(_WORD *)&v32 & 0x100) == 0)
  {
    goto LABEL_60;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_itemEndTime);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("itemEndTime"));

  v32 = self->_has;
  if ((*(_WORD *)&v32 & 0x200) == 0)
  {
LABEL_61:
    if ((*(_DWORD *)&v32 & 0x400000) == 0)
      goto LABEL_62;
    goto LABEL_94;
  }
LABEL_93:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_itemStartTime);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("itemStartTime"));

  v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x400000) == 0)
  {
LABEL_62:
    if ((*(_DWORD *)&v32 & 0x800000) == 0)
      goto LABEL_63;
    goto LABEL_102;
  }
LABEL_94:
  itemType = self->_itemType;
  if (itemType >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_itemType);
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v49 = off_1E47BF880[itemType];
  }
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("itemType"));

  v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x800000) == 0)
  {
LABEL_63:
    if ((*(_DWORD *)&v32 & 0x10000000) == 0)
      goto LABEL_64;
    goto LABEL_139;
  }
LABEL_102:
  mediaType = self->_mediaType;
  if (mediaType)
  {
    if (mediaType == 1)
    {
      v55 = CFSTR("Video");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mediaType);
      v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v55 = CFSTR("Audio");
  }
  objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("mediaType"));

  v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x10000000) == 0)
  {
LABEL_64:
    if ((*(_WORD *)&v32 & 0x400) == 0)
      goto LABEL_65;
    goto LABEL_140;
  }
LABEL_139:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_offline);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v73, CFSTR("offline"));

  v32 = self->_has;
  if ((*(_WORD *)&v32 & 0x400) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v32 & 0x40000000) == 0)
      goto LABEL_66;
    goto LABEL_141;
  }
LABEL_140:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_persistentID);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v74, CFSTR("persistentID"));

  v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x40000000) == 0)
  {
LABEL_66:
    if ((*(_DWORD *)&v32 & 0x2000000) == 0)
      goto LABEL_67;
    goto LABEL_142;
  }
LABEL_141:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_sBEnabled);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v75, CFSTR("SBEnabled"));

  v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x2000000) == 0)
  {
LABEL_67:
    if ((*(_WORD *)&v32 & 0x4000) == 0)
      goto LABEL_69;
    goto LABEL_68;
  }
LABEL_142:
  sourceType = self->_sourceType;
  if (sourceType >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sourceType);
    v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v77 = off_1E47BF8D0[sourceType];
  }
  objc_msgSend(v3, "setObject:forKey:", v77, CFSTR("sourceType"));

  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_68:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_storeAccountID);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("storeAccountID"));

  }
LABEL_69:
  timedMetadata = self->_timedMetadata;
  if (timedMetadata)
    objc_msgSend(v3, "setObject:forKey:", timedMetadata, CFSTR("timedMetadata"));
  trackInfo = self->_trackInfo;
  if (trackInfo)
    objc_msgSend(v3, "setObject:forKey:", trackInfo, CFSTR("trackInfo"));
  recommendationData = self->_recommendationData;
  if (recommendationData)
    objc_msgSend(v3, "setObject:forKey:", recommendationData, CFSTR("recommendationData"));
  storeFrontID = self->_storeFrontID;
  if (storeFrontID)
    objc_msgSend(v3, "setObject:forKey:", storeFrontID, CFSTR("storeFrontID"));
  buildVersion = self->_buildVersion;
  if (buildVersion)
    objc_msgSend(v3, "setObject:forKey:", buildVersion, CFSTR("buildVersion"));
  requestingBundleIdentifier = self->_requestingBundleIdentifier;
  if (requestingBundleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", requestingBundleIdentifier, CFSTR("requestingBundleIdentifier"));
  requestingBundleVersion = self->_requestingBundleVersion;
  if (requestingBundleVersion)
    objc_msgSend(v3, "setObject:forKey:", requestingBundleVersion, CFSTR("requestingBundleVersion"));
  enqueuerProperties = self->_enqueuerProperties;
  if (enqueuerProperties)
  {
    -[SSVPBPlayActivityEnqueuerProperties dictionaryRepresentation](enqueuerProperties, "dictionaryRepresentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v42, CFSTR("enqueuerProperties"));

  }
  householdID = self->_householdID;
  if (householdID)
    objc_msgSend(v3, "setObject:forKey:", householdID, CFSTR("householdID"));
  v44 = self->_has;
  if ((*(_DWORD *)&v44 & 0x20000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_privateListeningEnabled);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("privateListeningEnabled"));

    v44 = self->_has;
    if ((*(_DWORD *)&v44 & 0x80000000) == 0)
    {
LABEL_89:
      if ((*(_DWORD *)&v44 & 0x4000000) == 0)
        goto LABEL_107;
      goto LABEL_98;
    }
  }
  else if ((*(_DWORD *)&v44 & 0x80000000) == 0)
  {
    goto LABEL_89;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_siriInitiated);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("siriInitiated"));

  if ((*(_DWORD *)&self->_has & 0x4000000) == 0)
    goto LABEL_107;
LABEL_98:
  systemReleaseType = self->_systemReleaseType;
  if (systemReleaseType >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_systemReleaseType);
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v53 = off_1E47BF8E8[systemReleaseType];
  }
  objc_msgSend(v3, "setObject:forKey:", v53, CFSTR("systemReleaseType"));

LABEL_107:
  eventTimeZoneName = self->_eventTimeZoneName;
  if (eventTimeZoneName)
    objc_msgSend(v3, "setObject:forKey:", eventTimeZoneName, CFSTR("eventTimeZoneName"));
  v57 = self->_has;
  if ((*(_DWORD *)&v57 & 0x80000) != 0)
  {
    displayType = self->_displayType;
    if (displayType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_displayType);
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = off_1E47BF910[displayType];
    }
    objc_msgSend(v3, "setObject:forKey:", v59, CFSTR("displayType"));

    v57 = self->_has;
  }
  if ((*(_BYTE *)&v57 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_characterDisplayedCount);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("characterDisplayedCount"));

  }
  lyricLanguage = self->_lyricLanguage;
  if (lyricLanguage)
    objc_msgSend(v3, "setObject:forKey:", lyricLanguage, CFSTR("lyricLanguage"));
  containerID = self->_containerID;
  if (containerID)
    objc_msgSend(v3, "setObject:forKey:", containerID, CFSTR("containerID"));
  personalizedContainerID = self->_personalizedContainerID;
  if (personalizedContainerID)
    objc_msgSend(v3, "setObject:forKey:", personalizedContainerID, CFSTR("personalizedContainerID"));
  storeID = self->_storeID;
  if (storeID)
    objc_msgSend(v3, "setObject:forKey:", storeID, CFSTR("storeID"));
  externalID = self->_externalID;
  if (externalID)
    objc_msgSend(v3, "setObject:forKey:", externalID, CFSTR("externalID"));
  v66 = self->_has;
  if ((*(_DWORD *)&v66 & 0x10000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_tvShowPurchasedAdamID);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v70, CFSTR("tvShowPurchasedAdamID"));

    v66 = self->_has;
    if ((*(_DWORD *)&v66 & 0x20000) == 0)
    {
LABEL_128:
      if ((*(_DWORD *)&v66 & 0x8000000) == 0)
        goto LABEL_129;
LABEL_134:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_internalBuild);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("internalBuild"));

      if ((*(_DWORD *)&self->_has & 0x20) == 0)
        goto LABEL_131;
      goto LABEL_130;
    }
  }
  else if ((*(_DWORD *)&v66 & 0x20000) == 0)
  {
    goto LABEL_128;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_tvShowSubscriptionAdamID);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v71, CFSTR("tvShowSubscriptionAdamID"));

  v66 = self->_has;
  if ((*(_DWORD *)&v66 & 0x8000000) != 0)
    goto LABEL_134;
LABEL_129:
  if ((*(_BYTE *)&v66 & 0x20) != 0)
  {
LABEL_130:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_eventSecondsFromGMT);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v67, CFSTR("eventSecondsFromGMT"));

  }
LABEL_131:
  v68 = v3;

  return v68;
}

- (BOOL)readFrom:(id)a3
{
  return SSVPBPlayActivityEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $DE3EE0432C8889EE6FF627BF579DAD3F has;
  $DE3EE0432C8889EE6FF627BF579DAD3F v6;
  $DE3EE0432C8889EE6FF627BF579DAD3F v7;
  $DE3EE0432C8889EE6FF627BF579DAD3F v8;
  $DE3EE0432C8889EE6FF627BF579DAD3F v9;
  $DE3EE0432C8889EE6FF627BF579DAD3F v10;
  $DE3EE0432C8889EE6FF627BF579DAD3F v11;
  $DE3EE0432C8889EE6FF627BF579DAD3F v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (self->_containerID)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v13;
  }
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v13;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  v4 = v13;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    PBDataWriterWriteDoubleField();
    v4 = v13;
  }
LABEL_11:
  if (self->_externalID)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  if (self->_featureName)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v13;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x100) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v6 & 0x200) == 0)
        goto LABEL_18;
      goto LABEL_98;
    }
  }
  else if ((*(_WORD *)&v6 & 0x100) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteDoubleField();
  v4 = v13;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v6 & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteDoubleField();
  v4 = v13;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x800000) == 0)
      goto LABEL_20;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt32Field();
  v4 = v13;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0)
      goto LABEL_21;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  v4 = v13;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_101:
  PBDataWriterWriteBOOLField();
  v4 = v13;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_22:
    PBDataWriterWriteInt64Field();
    v4 = v13;
  }
LABEL_23:
  if (self->_personalizedContainerID)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v13;
    v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x2000000) == 0)
    {
LABEL_27:
      if ((*(_WORD *)&v7 & 0x4000) == 0)
        goto LABEL_29;
      goto LABEL_28;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteInt32Field();
  v4 = v13;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_28:
    PBDataWriterWriteUint64Field();
    v4 = v13;
  }
LABEL_29:
  if (self->_storeID)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  if (self->_timedMetadata)
  {
    PBDataWriterWriteDataField();
    v4 = v13;
  }
  if (self->_trackInfo)
  {
    PBDataWriterWriteDataField();
    v4 = v13;
  }
  if (self->_recommendationData)
  {
    PBDataWriterWriteDataField();
    v4 = v13;
  }
  if (self->_storeFrontID)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v13;
    v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x8000) == 0)
    {
LABEL_41:
      if ((*(_WORD *)&v8 & 0x800) == 0)
        goto LABEL_42;
      goto LABEL_108;
    }
  }
  else if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteInt64Field();
  v4 = v13;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v8 & 0x1000) == 0)
      goto LABEL_43;
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteInt64Field();
  v4 = v13;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_43:
    if ((*(_BYTE *)&v8 & 0x40) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_109:
  PBDataWriterWriteInt64Field();
  v4 = v13;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_44:
    PBDataWriterWriteUint64Field();
    v4 = v13;
  }
LABEL_45:
  if (self->_lyricsID)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v13;
  }
  if (self->_globalPlaylistID)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  if (self->_stationHash)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  if (self->_stationStringID)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v13;
  }
  if (self->_cloudAlbumID)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v13;
    v9 = self->_has;
  }
  if ((*(_DWORD *)&v9 & 0x1000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v13;
  }
  if (self->_buildVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  if (self->_playlistVersionHash)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  if (self->_requestingBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  if (self->_requestingBundleVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v13;
    v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x8000000) == 0)
    {
LABEL_73:
      if ((*(_DWORD *)&v10 & 0x10000) == 0)
        goto LABEL_74;
      goto LABEL_113;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x8000000) == 0)
  {
    goto LABEL_73;
  }
  PBDataWriterWriteBOOLField();
  v4 = v13;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x10000) == 0)
  {
LABEL_74:
    if ((*(_DWORD *)&v10 & 0x20000) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_113:
  PBDataWriterWriteInt64Field();
  v4 = v13;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_75:
    PBDataWriterWriteInt64Field();
    v4 = v13;
  }
LABEL_76:
  if (self->_enqueuerProperties)
  {
    PBDataWriterWriteSubmessage();
    v4 = v13;
  }
  if (self->_householdID)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v13;
    v11 = self->_has;
    if ((*(_DWORD *)&v11 & 0x80000000) == 0)
    {
LABEL_82:
      if ((*(_DWORD *)&v11 & 0x4000000) == 0)
        goto LABEL_84;
      goto LABEL_83;
    }
  }
  else if ((*(_DWORD *)&v11 & 0x80000000) == 0)
  {
    goto LABEL_82;
  }
  PBDataWriterWriteBOOLField();
  v4 = v13;
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
  {
LABEL_83:
    PBDataWriterWriteInt32Field();
    v4 = v13;
  }
LABEL_84:
  if (self->_eventTimeZoneName)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v13;
    v12 = self->_has;
  }
  if ((*(_BYTE *)&v12 & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v13;
  }
  if (self->_lyricLanguage)
  {
    PBDataWriterWriteStringField();
    v4 = v13;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  $DE3EE0432C8889EE6FF627BF579DAD3F has;
  $DE3EE0432C8889EE6FF627BF579DAD3F v6;
  $DE3EE0432C8889EE6FF627BF579DAD3F v7;
  $DE3EE0432C8889EE6FF627BF579DAD3F v8;
  $DE3EE0432C8889EE6FF627BF579DAD3F v9;
  $DE3EE0432C8889EE6FF627BF579DAD3F v10;
  $DE3EE0432C8889EE6FF627BF579DAD3F v11;
  $DE3EE0432C8889EE6FF627BF579DAD3F v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (self->_containerID)
  {
    objc_msgSend(v4, "setContainerID:");
    v4 = v13;
  }
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    *((_DWORD *)v4 + 44) = self->_containerType;
    *((_DWORD *)v4 + 102) |= 0x40000u;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v13, "setDeviceName:");
    v4 = v13;
  }
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    *((_DWORD *)v4 + 49) = self->_endReasonType;
    *((_DWORD *)v4 + 102) |= 0x100000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_eventDateTimestamp;
  *((_DWORD *)v4 + 102) |= 0x10u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_eventSecondsFromGMT;
    *((_DWORD *)v4 + 102) |= 0x20u;
  }
LABEL_11:
  if (self->_externalID)
  {
    objc_msgSend(v13, "setExternalID:");
    v4 = v13;
  }
  if (self->_featureName)
  {
    objc_msgSend(v13, "setFeatureName:");
    v4 = v13;
  }
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x80) != 0)
  {
    *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_itemDuration;
    *((_DWORD *)v4 + 102) |= 0x80u;
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x100) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v6 & 0x200) == 0)
        goto LABEL_18;
      goto LABEL_98;
    }
  }
  else if ((*(_WORD *)&v6 & 0x100) == 0)
  {
    goto LABEL_17;
  }
  *((_QWORD *)v4 + 9) = *(_QWORD *)&self->_itemEndTime;
  *((_DWORD *)v4 + 102) |= 0x100u;
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v6 & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_99;
  }
LABEL_98:
  *((_QWORD *)v4 + 10) = *(_QWORD *)&self->_itemStartTime;
  *((_DWORD *)v4 + 102) |= 0x200u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x800000) == 0)
      goto LABEL_20;
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)v4 + 64) = self->_itemType;
  *((_DWORD *)v4 + 102) |= 0x400000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0)
      goto LABEL_21;
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)v4 + 70) = self->_mediaType;
  *((_DWORD *)v4 + 102) |= 0x800000u;
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v6 & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_101:
  *((_BYTE *)v4 + 401) = self->_offline;
  *((_DWORD *)v4 + 102) |= 0x10000000u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_22:
    *((_QWORD *)v4 + 11) = self->_persistentID;
    *((_DWORD *)v4 + 102) |= 0x400u;
  }
LABEL_23:
  if (self->_personalizedContainerID)
  {
    objc_msgSend(v13, "setPersonalizedContainerID:");
    v4 = v13;
  }
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) != 0)
  {
    *((_BYTE *)v4 + 403) = self->_sBEnabled;
    *((_DWORD *)v4 + 102) |= 0x40000000u;
    v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x2000000) == 0)
    {
LABEL_27:
      if ((*(_WORD *)&v7 & 0x4000) == 0)
        goto LABEL_29;
      goto LABEL_28;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x2000000) == 0)
  {
    goto LABEL_27;
  }
  *((_DWORD *)v4 + 84) = self->_sourceType;
  *((_DWORD *)v4 + 102) |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_28:
    *((_QWORD *)v4 + 15) = self->_storeAccountID;
    *((_DWORD *)v4 + 102) |= 0x4000u;
  }
LABEL_29:
  if (self->_storeID)
  {
    objc_msgSend(v13, "setStoreID:");
    v4 = v13;
  }
  if (self->_timedMetadata)
  {
    objc_msgSend(v13, "setTimedMetadata:");
    v4 = v13;
  }
  if (self->_trackInfo)
  {
    objc_msgSend(v13, "setTrackInfo:");
    v4 = v13;
  }
  if (self->_recommendationData)
  {
    objc_msgSend(v13, "setRecommendationData:");
    v4 = v13;
  }
  if (self->_storeFrontID)
  {
    objc_msgSend(v13, "setStoreFrontID:");
    v4 = v13;
  }
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) != 0)
  {
    *((_DWORD *)v4 + 54) = self->_eventType;
    *((_DWORD *)v4 + 102) |= 0x200000u;
    v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x8000) == 0)
    {
LABEL_41:
      if ((*(_WORD *)&v8 & 0x800) == 0)
        goto LABEL_42;
      goto LABEL_108;
    }
  }
  else if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
    goto LABEL_41;
  }
  *((_QWORD *)v4 + 16) = self->_subscriptionAdamID;
  *((_DWORD *)v4 + 102) |= 0x8000u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v8 & 0x1000) == 0)
      goto LABEL_43;
    goto LABEL_109;
  }
LABEL_108:
  *((_QWORD *)v4 + 12) = self->_purchasedAdamID;
  *((_DWORD *)v4 + 102) |= 0x800u;
  v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_43:
    if ((*(_BYTE *)&v8 & 0x40) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_109:
  *((_QWORD *)v4 + 13) = self->_radioAdamID;
  *((_DWORD *)v4 + 102) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_44:
    *((_QWORD *)v4 + 7) = self->_itemCloudID;
    *((_DWORD *)v4 + 102) |= 0x40u;
  }
LABEL_45:
  if (self->_lyricsID)
  {
    objc_msgSend(v13, "setLyricsID:");
    v4 = v13;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_containerAdamID;
    *((_DWORD *)v4 + 102) |= 4u;
  }
  if (self->_globalPlaylistID)
  {
    objc_msgSend(v13, "setGlobalPlaylistID:");
    v4 = v13;
  }
  if (self->_stationHash)
  {
    objc_msgSend(v13, "setStationHash:");
    v4 = v13;
  }
  if (self->_stationStringID)
  {
    objc_msgSend(v13, "setStationStringID:");
    v4 = v13;
  }
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    *((_QWORD *)v4 + 14) = self->_stationID;
    *((_DWORD *)v4 + 102) |= 0x2000u;
  }
  if (self->_cloudAlbumID)
  {
    objc_msgSend(v13, "setCloudAlbumID:");
    v4 = v13;
  }
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_cloudPlaylistID;
    *((_DWORD *)v4 + 102) |= 2u;
    v9 = self->_has;
  }
  if ((*(_DWORD *)&v9 & 0x1000000) != 0)
  {
    *((_DWORD *)v4 + 76) = self->_reasonHintType;
    *((_DWORD *)v4 + 102) |= 0x1000000u;
  }
  if (self->_buildVersion)
  {
    objc_msgSend(v13, "setBuildVersion:");
    v4 = v13;
  }
  if (self->_playlistVersionHash)
  {
    objc_msgSend(v13, "setPlaylistVersionHash:");
    v4 = v13;
  }
  if (self->_requestingBundleIdentifier)
  {
    objc_msgSend(v13, "setRequestingBundleIdentifier:");
    v4 = v13;
  }
  if (self->_requestingBundleVersion)
  {
    objc_msgSend(v13, "setRequestingBundleVersion:");
    v4 = v13;
  }
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 8) != 0)
  {
    *((_QWORD *)v4 + 4) = self->_equivalencySourceAdamID;
    *((_DWORD *)v4 + 102) |= 8u;
    v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x8000000) == 0)
    {
LABEL_73:
      if ((*(_DWORD *)&v10 & 0x10000) == 0)
        goto LABEL_74;
      goto LABEL_113;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x8000000) == 0)
  {
    goto LABEL_73;
  }
  *((_BYTE *)v4 + 400) = self->_internalBuild;
  *((_DWORD *)v4 + 102) |= 0x8000000u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x10000) == 0)
  {
LABEL_74:
    if ((*(_DWORD *)&v10 & 0x20000) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_113:
  *((_QWORD *)v4 + 17) = self->_tvShowPurchasedAdamID;
  *((_DWORD *)v4 + 102) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_75:
    *((_QWORD *)v4 + 18) = self->_tvShowSubscriptionAdamID;
    *((_DWORD *)v4 + 102) |= 0x20000u;
  }
LABEL_76:
  if (self->_enqueuerProperties)
  {
    objc_msgSend(v13, "setEnqueuerProperties:");
    v4 = v13;
  }
  if (self->_householdID)
  {
    objc_msgSend(v13, "setHouseholdID:");
    v4 = v13;
  }
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x20000000) != 0)
  {
    *((_BYTE *)v4 + 402) = self->_privateListeningEnabled;
    *((_DWORD *)v4 + 102) |= 0x20000000u;
    v11 = self->_has;
    if ((*(_DWORD *)&v11 & 0x80000000) == 0)
    {
LABEL_82:
      if ((*(_DWORD *)&v11 & 0x4000000) == 0)
        goto LABEL_84;
      goto LABEL_83;
    }
  }
  else if ((*(_DWORD *)&v11 & 0x80000000) == 0)
  {
    goto LABEL_82;
  }
  *((_BYTE *)v4 + 404) = self->_siriInitiated;
  *((_DWORD *)v4 + 102) |= 0x80000000;
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
  {
LABEL_83:
    *((_DWORD *)v4 + 94) = self->_systemReleaseType;
    *((_DWORD *)v4 + 102) |= 0x4000000u;
  }
LABEL_84:
  if (self->_eventTimeZoneName)
  {
    objc_msgSend(v13, "setEventTimeZoneName:");
    v4 = v13;
  }
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000) != 0)
  {
    *((_DWORD *)v4 + 48) = self->_displayType;
    *((_DWORD *)v4 + 102) |= 0x80000u;
    v12 = self->_has;
  }
  if ((*(_BYTE *)&v12 & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_characterDisplayedCount;
    *((_DWORD *)v4 + 102) |= 1u;
  }
  if (self->_lyricLanguage)
  {
    objc_msgSend(v13, "setLyricLanguage:");
    v4 = v13;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  $DE3EE0432C8889EE6FF627BF579DAD3F has;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  $DE3EE0432C8889EE6FF627BF579DAD3F v15;
  uint64_t v16;
  void *v17;
  $DE3EE0432C8889EE6FF627BF579DAD3F v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  $DE3EE0432C8889EE6FF627BF579DAD3F v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  $DE3EE0432C8889EE6FF627BF579DAD3F v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  $DE3EE0432C8889EE6FF627BF579DAD3F v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  $DE3EE0432C8889EE6FF627BF579DAD3F v54;
  uint64_t v55;
  void *v56;
  $DE3EE0432C8889EE6FF627BF579DAD3F v57;
  uint64_t v58;
  void *v59;
  id v60;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_containerID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v6;

  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    *(_DWORD *)(v5 + 176) = self->_containerType;
    *(_DWORD *)(v5 + 408) |= 0x40000u;
  }
  v8 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v8;

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    *(_DWORD *)(v5 + 196) = self->_endReasonType;
    *(_DWORD *)(v5 + 408) |= 0x100000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x10) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&has & 0x20) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 40) = self->_eventDateTimestamp;
  *(_DWORD *)(v5 + 408) |= 0x10u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    *(double *)(v5 + 48) = self->_eventSecondsFromGMT;
    *(_DWORD *)(v5 + 408) |= 0x20u;
  }
LABEL_7:
  v11 = -[NSString copyWithZone:](self->_externalID, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v11;

  v13 = -[NSString copyWithZone:](self->_featureName, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v13;

  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 0x80) != 0)
  {
    *(double *)(v5 + 64) = self->_itemDuration;
    *(_DWORD *)(v5 + 408) |= 0x80u;
    v15 = self->_has;
    if ((*(_WORD *)&v15 & 0x100) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&v15 & 0x200) == 0)
        goto LABEL_10;
      goto LABEL_52;
    }
  }
  else if ((*(_WORD *)&v15 & 0x100) == 0)
  {
    goto LABEL_9;
  }
  *(double *)(v5 + 72) = self->_itemEndTime;
  *(_DWORD *)(v5 + 408) |= 0x100u;
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x200) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&v15 & 0x400000) == 0)
      goto LABEL_11;
    goto LABEL_53;
  }
LABEL_52:
  *(double *)(v5 + 80) = self->_itemStartTime;
  *(_DWORD *)(v5 + 408) |= 0x200u;
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x400000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&v15 & 0x800000) == 0)
      goto LABEL_12;
    goto LABEL_54;
  }
LABEL_53:
  *(_DWORD *)(v5 + 256) = self->_itemType;
  *(_DWORD *)(v5 + 408) |= 0x400000u;
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x800000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&v15 & 0x10000000) == 0)
      goto LABEL_13;
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v5 + 280) = self->_mediaType;
  *(_DWORD *)(v5 + 408) |= 0x800000u;
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v15 & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_55:
  *(_BYTE *)(v5 + 401) = self->_offline;
  *(_DWORD *)(v5 + 408) |= 0x10000000u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_14:
    *(_QWORD *)(v5 + 88) = self->_persistentID;
    *(_DWORD *)(v5 + 408) |= 0x400u;
  }
LABEL_15:
  v16 = -[NSString copyWithZone:](self->_personalizedContainerID, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v16;

  v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x40000000) != 0)
  {
    *(_BYTE *)(v5 + 403) = self->_sBEnabled;
    *(_DWORD *)(v5 + 408) |= 0x40000000u;
    v18 = self->_has;
    if ((*(_DWORD *)&v18 & 0x2000000) == 0)
    {
LABEL_17:
      if ((*(_WORD *)&v18 & 0x4000) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*(_DWORD *)&v18 & 0x2000000) == 0)
  {
    goto LABEL_17;
  }
  *(_DWORD *)(v5 + 336) = self->_sourceType;
  *(_DWORD *)(v5 + 408) |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_18:
    *(_QWORD *)(v5 + 120) = self->_storeAccountID;
    *(_DWORD *)(v5 + 408) |= 0x4000u;
  }
LABEL_19:
  v19 = -[NSString copyWithZone:](self->_storeID, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 368);
  *(_QWORD *)(v5 + 368) = v19;

  v21 = -[NSData copyWithZone:](self->_timedMetadata, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 384);
  *(_QWORD *)(v5 + 384) = v21;

  v23 = -[NSData copyWithZone:](self->_trackInfo, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 392);
  *(_QWORD *)(v5 + 392) = v23;

  v25 = -[NSData copyWithZone:](self->_recommendationData, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v25;

  v27 = -[NSString copyWithZone:](self->_storeFrontID, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 360);
  *(_QWORD *)(v5 + 360) = v27;

  v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x200000) != 0)
  {
    *(_DWORD *)(v5 + 216) = self->_eventType;
    *(_DWORD *)(v5 + 408) |= 0x200000u;
    v29 = self->_has;
    if ((*(_WORD *)&v29 & 0x8000) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v29 & 0x800) == 0)
        goto LABEL_22;
      goto LABEL_62;
    }
  }
  else if ((*(_WORD *)&v29 & 0x8000) == 0)
  {
    goto LABEL_21;
  }
  *(_QWORD *)(v5 + 128) = self->_subscriptionAdamID;
  *(_DWORD *)(v5 + 408) |= 0x8000u;
  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x800) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v29 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_63;
  }
LABEL_62:
  *(_QWORD *)(v5 + 96) = self->_purchasedAdamID;
  *(_DWORD *)(v5 + 408) |= 0x800u;
  v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v29 & 0x40) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_63:
  *(_QWORD *)(v5 + 104) = self->_radioAdamID;
  *(_DWORD *)(v5 + 408) |= 0x1000u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_24:
    *(_QWORD *)(v5 + 56) = self->_itemCloudID;
    *(_DWORD *)(v5 + 408) |= 0x40u;
  }
LABEL_25:
  v30 = -[NSString copyWithZone:](self->_lyricsID, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v30;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_containerAdamID;
    *(_DWORD *)(v5 + 408) |= 4u;
  }
  v32 = -[NSString copyWithZone:](self->_globalPlaylistID, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v32;

  v34 = -[NSString copyWithZone:](self->_stationHash, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 344);
  *(_QWORD *)(v5 + 344) = v34;

  v36 = -[NSString copyWithZone:](self->_stationStringID, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 352);
  *(_QWORD *)(v5 + 352) = v36;

  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    *(_QWORD *)(v5 + 112) = self->_stationID;
    *(_DWORD *)(v5 + 408) |= 0x2000u;
  }
  v38 = -[NSString copyWithZone:](self->_cloudAlbumID, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v38;

  v40 = self->_has;
  if ((*(_BYTE *)&v40 & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_cloudPlaylistID;
    *(_DWORD *)(v5 + 408) |= 2u;
    v40 = self->_has;
  }
  if ((*(_DWORD *)&v40 & 0x1000000) != 0)
  {
    *(_DWORD *)(v5 + 304) = self->_reasonHintType;
    *(_DWORD *)(v5 + 408) |= 0x1000000u;
  }
  v41 = -[NSString copyWithZone:](self->_buildVersion, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v41;

  v43 = -[NSString copyWithZone:](self->_playlistVersionHash, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v43;

  v45 = -[NSString copyWithZone:](self->_requestingBundleIdentifier, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v45;

  v47 = -[NSString copyWithZone:](self->_requestingBundleVersion, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 328);
  *(_QWORD *)(v5 + 328) = v47;

  v49 = self->_has;
  if ((*(_BYTE *)&v49 & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_equivalencySourceAdamID;
    *(_DWORD *)(v5 + 408) |= 8u;
    v49 = self->_has;
    if ((*(_DWORD *)&v49 & 0x8000000) == 0)
    {
LABEL_35:
      if ((*(_DWORD *)&v49 & 0x10000) == 0)
        goto LABEL_36;
      goto LABEL_67;
    }
  }
  else if ((*(_DWORD *)&v49 & 0x8000000) == 0)
  {
    goto LABEL_35;
  }
  *(_BYTE *)(v5 + 400) = self->_internalBuild;
  *(_DWORD *)(v5 + 408) |= 0x8000000u;
  v49 = self->_has;
  if ((*(_DWORD *)&v49 & 0x10000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v49 & 0x20000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_67:
  *(_QWORD *)(v5 + 136) = self->_tvShowPurchasedAdamID;
  *(_DWORD *)(v5 + 408) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_37:
    *(_QWORD *)(v5 + 144) = self->_tvShowSubscriptionAdamID;
    *(_DWORD *)(v5 + 408) |= 0x20000u;
  }
LABEL_38:
  v50 = -[SSVPBPlayActivityEnqueuerProperties copyWithZone:](self->_enqueuerProperties, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v50;

  v52 = -[NSString copyWithZone:](self->_householdID, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v52;

  v54 = self->_has;
  if ((*(_DWORD *)&v54 & 0x20000000) != 0)
  {
    *(_BYTE *)(v5 + 402) = self->_privateListeningEnabled;
    *(_DWORD *)(v5 + 408) |= 0x20000000u;
    v54 = self->_has;
    if ((*(_DWORD *)&v54 & 0x80000000) == 0)
    {
LABEL_40:
      if ((*(_DWORD *)&v54 & 0x4000000) == 0)
        goto LABEL_42;
      goto LABEL_41;
    }
  }
  else if ((*(_DWORD *)&v54 & 0x80000000) == 0)
  {
    goto LABEL_40;
  }
  *(_BYTE *)(v5 + 404) = self->_siriInitiated;
  *(_DWORD *)(v5 + 408) |= 0x80000000;
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
  {
LABEL_41:
    *(_DWORD *)(v5 + 376) = self->_systemReleaseType;
    *(_DWORD *)(v5 + 408) |= 0x4000000u;
  }
LABEL_42:
  v55 = -[NSString copyWithZone:](self->_eventTimeZoneName, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v55;

  v57 = self->_has;
  if ((*(_DWORD *)&v57 & 0x80000) != 0)
  {
    *(_DWORD *)(v5 + 192) = self->_displayType;
    *(_DWORD *)(v5 + 408) |= 0x80000u;
    v57 = self->_has;
  }
  if ((*(_BYTE *)&v57 & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_characterDisplayedCount;
    *(_DWORD *)(v5 + 408) |= 1u;
  }
  v58 = -[NSString copyWithZone:](self->_lyricLanguage, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v58;

  v60 = (id)v5;
  return v60;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *containerID;
  $DE3EE0432C8889EE6FF627BF579DAD3F has;
  int v7;
  NSString *deviceName;
  int v9;
  NSString *externalID;
  NSString *featureName;
  $DE3EE0432C8889EE6FF627BF579DAD3F v12;
  int v13;
  NSString *personalizedContainerID;
  int v15;
  NSString *storeID;
  NSData *timedMetadata;
  NSData *trackInfo;
  NSData *recommendationData;
  NSString *storeFrontID;
  $DE3EE0432C8889EE6FF627BF579DAD3F v21;
  int v22;
  NSString *lyricsID;
  int v24;
  NSString *globalPlaylistID;
  NSString *stationHash;
  NSString *stationStringID;
  $DE3EE0432C8889EE6FF627BF579DAD3F v28;
  int v29;
  NSString *cloudAlbumID;
  int v31;
  NSString *buildVersion;
  NSString *playlistVersionHash;
  NSString *requestingBundleIdentifier;
  NSString *requestingBundleVersion;
  $DE3EE0432C8889EE6FF627BF579DAD3F v36;
  int v37;
  SSVPBPlayActivityEnqueuerProperties *enqueuerProperties;
  NSString *householdID;
  $DE3EE0432C8889EE6FF627BF579DAD3F v40;
  int v41;
  NSString *eventTimeZoneName;
  int v43;
  NSString *lyricLanguage;
  char v45;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_228;
  containerID = self->_containerID;
  if ((unint64_t)containerID | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](containerID, "isEqual:"))
      goto LABEL_228;
  }
  has = self->_has;
  v7 = *((_DWORD *)v4 + 102);
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_containerType != *((_DWORD *)v4 + 44))
      goto LABEL_228;
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_228;
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:"))
      goto LABEL_228;
    has = self->_has;
  }
  v9 = *((_DWORD *)v4 + 102);
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v9 & 0x100000) == 0 || self->_endReasonType != *((_DWORD *)v4 + 49))
      goto LABEL_228;
  }
  else if ((v9 & 0x100000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_eventDateTimestamp != *((double *)v4 + 5))
      goto LABEL_228;
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_eventSecondsFromGMT != *((double *)v4 + 6))
      goto LABEL_228;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_228;
  }
  externalID = self->_externalID;
  if ((unint64_t)externalID | *((_QWORD *)v4 + 28)
    && !-[NSString isEqual:](externalID, "isEqual:"))
  {
    goto LABEL_228;
  }
  featureName = self->_featureName;
  if ((unint64_t)featureName | *((_QWORD *)v4 + 29))
  {
    if (!-[NSString isEqual:](featureName, "isEqual:"))
      goto LABEL_228;
  }
  v12 = self->_has;
  v13 = *((_DWORD *)v4 + 102);
  if ((*(_BYTE *)&v12 & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_itemDuration != *((double *)v4 + 8))
      goto LABEL_228;
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_WORD *)&v12 & 0x100) != 0)
  {
    if ((v13 & 0x100) == 0 || self->_itemEndTime != *((double *)v4 + 9))
      goto LABEL_228;
  }
  else if ((v13 & 0x100) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
    if ((v13 & 0x200) == 0 || self->_itemStartTime != *((double *)v4 + 10))
      goto LABEL_228;
  }
  else if ((v13 & 0x200) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v12 & 0x400000) != 0)
  {
    if ((v13 & 0x400000) == 0 || self->_itemType != *((_DWORD *)v4 + 64))
      goto LABEL_228;
  }
  else if ((v13 & 0x400000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v12 & 0x800000) != 0)
  {
    if ((v13 & 0x800000) == 0 || self->_mediaType != *((_DWORD *)v4 + 70))
      goto LABEL_228;
  }
  else if ((v13 & 0x800000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v12 & 0x10000000) != 0)
  {
    if ((v13 & 0x10000000) == 0)
      goto LABEL_228;
    if (self->_offline)
    {
      if (!*((_BYTE *)v4 + 401))
        goto LABEL_228;
    }
    else if (*((_BYTE *)v4 + 401))
    {
      goto LABEL_228;
    }
  }
  else if ((v13 & 0x10000000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0 || self->_persistentID != *((_QWORD *)v4 + 11))
      goto LABEL_228;
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_228;
  }
  personalizedContainerID = self->_personalizedContainerID;
  if ((unint64_t)personalizedContainerID | *((_QWORD *)v4 + 36))
  {
    if (!-[NSString isEqual:](personalizedContainerID, "isEqual:"))
      goto LABEL_228;
    v12 = self->_has;
  }
  v15 = *((_DWORD *)v4 + 102);
  if ((*(_DWORD *)&v12 & 0x40000000) != 0)
  {
    if ((v15 & 0x40000000) == 0)
      goto LABEL_228;
    if (self->_sBEnabled)
    {
      if (!*((_BYTE *)v4 + 403))
        goto LABEL_228;
    }
    else if (*((_BYTE *)v4 + 403))
    {
      goto LABEL_228;
    }
  }
  else if ((v15 & 0x40000000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v12 & 0x2000000) != 0)
  {
    if ((v15 & 0x2000000) == 0 || self->_sourceType != *((_DWORD *)v4 + 84))
      goto LABEL_228;
  }
  else if ((v15 & 0x2000000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
    if ((v15 & 0x4000) == 0 || self->_storeAccountID != *((_QWORD *)v4 + 15))
      goto LABEL_228;
  }
  else if ((v15 & 0x4000) != 0)
  {
    goto LABEL_228;
  }
  storeID = self->_storeID;
  if ((unint64_t)storeID | *((_QWORD *)v4 + 46) && !-[NSString isEqual:](storeID, "isEqual:"))
    goto LABEL_228;
  timedMetadata = self->_timedMetadata;
  if ((unint64_t)timedMetadata | *((_QWORD *)v4 + 48))
  {
    if (!-[NSData isEqual:](timedMetadata, "isEqual:"))
      goto LABEL_228;
  }
  trackInfo = self->_trackInfo;
  if ((unint64_t)trackInfo | *((_QWORD *)v4 + 49))
  {
    if (!-[NSData isEqual:](trackInfo, "isEqual:"))
      goto LABEL_228;
  }
  recommendationData = self->_recommendationData;
  if ((unint64_t)recommendationData | *((_QWORD *)v4 + 39))
  {
    if (!-[NSData isEqual:](recommendationData, "isEqual:"))
      goto LABEL_228;
  }
  storeFrontID = self->_storeFrontID;
  if ((unint64_t)storeFrontID | *((_QWORD *)v4 + 45))
  {
    if (!-[NSString isEqual:](storeFrontID, "isEqual:"))
      goto LABEL_228;
  }
  v21 = self->_has;
  v22 = *((_DWORD *)v4 + 102);
  if ((*(_DWORD *)&v21 & 0x200000) != 0)
  {
    if ((v22 & 0x200000) == 0 || self->_eventType != *((_DWORD *)v4 + 54))
      goto LABEL_228;
  }
  else if ((v22 & 0x200000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_WORD *)&v21 & 0x8000) != 0)
  {
    if ((v22 & 0x8000) == 0 || self->_subscriptionAdamID != *((_QWORD *)v4 + 16))
      goto LABEL_228;
  }
  else if ((v22 & 0x8000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_WORD *)&v21 & 0x800) != 0)
  {
    if ((v22 & 0x800) == 0 || self->_purchasedAdamID != *((_QWORD *)v4 + 12))
      goto LABEL_228;
  }
  else if ((v22 & 0x800) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_WORD *)&v21 & 0x1000) != 0)
  {
    if ((v22 & 0x1000) == 0 || self->_radioAdamID != *((_QWORD *)v4 + 13))
      goto LABEL_228;
  }
  else if ((v22 & 0x1000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_BYTE *)&v21 & 0x40) != 0)
  {
    if ((v22 & 0x40) == 0 || self->_itemCloudID != *((_QWORD *)v4 + 7))
      goto LABEL_228;
  }
  else if ((v22 & 0x40) != 0)
  {
    goto LABEL_228;
  }
  lyricsID = self->_lyricsID;
  if ((unint64_t)lyricsID | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](lyricsID, "isEqual:"))
      goto LABEL_228;
    v21 = self->_has;
  }
  v24 = *((_DWORD *)v4 + 102);
  if ((*(_BYTE *)&v21 & 4) != 0)
  {
    if ((v24 & 4) == 0 || self->_containerAdamID != *((_QWORD *)v4 + 3))
      goto LABEL_228;
  }
  else if ((v24 & 4) != 0)
  {
    goto LABEL_228;
  }
  globalPlaylistID = self->_globalPlaylistID;
  if ((unint64_t)globalPlaylistID | *((_QWORD *)v4 + 30)
    && !-[NSString isEqual:](globalPlaylistID, "isEqual:"))
  {
    goto LABEL_228;
  }
  stationHash = self->_stationHash;
  if ((unint64_t)stationHash | *((_QWORD *)v4 + 43))
  {
    if (!-[NSString isEqual:](stationHash, "isEqual:"))
      goto LABEL_228;
  }
  stationStringID = self->_stationStringID;
  if ((unint64_t)stationStringID | *((_QWORD *)v4 + 44))
  {
    if (!-[NSString isEqual:](stationStringID, "isEqual:"))
      goto LABEL_228;
  }
  v28 = self->_has;
  v29 = *((_DWORD *)v4 + 102);
  if ((*(_WORD *)&v28 & 0x2000) != 0)
  {
    if ((v29 & 0x2000) == 0 || self->_stationID != *((_QWORD *)v4 + 14))
      goto LABEL_228;
  }
  else if ((v29 & 0x2000) != 0)
  {
    goto LABEL_228;
  }
  cloudAlbumID = self->_cloudAlbumID;
  if ((unint64_t)cloudAlbumID | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](cloudAlbumID, "isEqual:"))
      goto LABEL_228;
    v28 = self->_has;
  }
  v31 = *((_DWORD *)v4 + 102);
  if ((*(_BYTE *)&v28 & 2) != 0)
  {
    if ((v31 & 2) == 0 || self->_cloudPlaylistID != *((_QWORD *)v4 + 2))
      goto LABEL_228;
  }
  else if ((v31 & 2) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v28 & 0x1000000) != 0)
  {
    if ((v31 & 0x1000000) == 0 || self->_reasonHintType != *((_DWORD *)v4 + 76))
      goto LABEL_228;
  }
  else if ((v31 & 0x1000000) != 0)
  {
    goto LABEL_228;
  }
  buildVersion = self->_buildVersion;
  if ((unint64_t)buildVersion | *((_QWORD *)v4 + 19)
    && !-[NSString isEqual:](buildVersion, "isEqual:"))
  {
    goto LABEL_228;
  }
  playlistVersionHash = self->_playlistVersionHash;
  if ((unint64_t)playlistVersionHash | *((_QWORD *)v4 + 37))
  {
    if (!-[NSString isEqual:](playlistVersionHash, "isEqual:"))
      goto LABEL_228;
  }
  requestingBundleIdentifier = self->_requestingBundleIdentifier;
  if ((unint64_t)requestingBundleIdentifier | *((_QWORD *)v4 + 40))
  {
    if (!-[NSString isEqual:](requestingBundleIdentifier, "isEqual:"))
      goto LABEL_228;
  }
  requestingBundleVersion = self->_requestingBundleVersion;
  if ((unint64_t)requestingBundleVersion | *((_QWORD *)v4 + 41))
  {
    if (!-[NSString isEqual:](requestingBundleVersion, "isEqual:"))
      goto LABEL_228;
  }
  v36 = self->_has;
  v37 = *((_DWORD *)v4 + 102);
  if ((*(_BYTE *)&v36 & 8) != 0)
  {
    if ((v37 & 8) == 0 || self->_equivalencySourceAdamID != *((_QWORD *)v4 + 4))
      goto LABEL_228;
  }
  else if ((v37 & 8) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v36 & 0x8000000) != 0)
  {
    if ((v37 & 0x8000000) == 0)
      goto LABEL_228;
    if (self->_internalBuild)
    {
      if (!*((_BYTE *)v4 + 400))
        goto LABEL_228;
    }
    else if (*((_BYTE *)v4 + 400))
    {
      goto LABEL_228;
    }
  }
  else if ((v37 & 0x8000000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v36 & 0x10000) != 0)
  {
    if ((v37 & 0x10000) == 0 || self->_tvShowPurchasedAdamID != *((_QWORD *)v4 + 17))
      goto LABEL_228;
  }
  else if ((v37 & 0x10000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v36 & 0x20000) != 0)
  {
    if ((v37 & 0x20000) == 0 || self->_tvShowSubscriptionAdamID != *((_QWORD *)v4 + 18))
      goto LABEL_228;
  }
  else if ((v37 & 0x20000) != 0)
  {
    goto LABEL_228;
  }
  enqueuerProperties = self->_enqueuerProperties;
  if ((unint64_t)enqueuerProperties | *((_QWORD *)v4 + 25)
    && !-[SSVPBPlayActivityEnqueuerProperties isEqual:](enqueuerProperties, "isEqual:"))
  {
    goto LABEL_228;
  }
  householdID = self->_householdID;
  if ((unint64_t)householdID | *((_QWORD *)v4 + 31))
  {
    if (!-[NSString isEqual:](householdID, "isEqual:"))
      goto LABEL_228;
  }
  v40 = self->_has;
  v41 = *((_DWORD *)v4 + 102);
  if ((*(_DWORD *)&v40 & 0x20000000) != 0)
  {
    if ((v41 & 0x20000000) == 0)
      goto LABEL_228;
    if (self->_privateListeningEnabled)
    {
      if (!*((_BYTE *)v4 + 402))
        goto LABEL_228;
    }
    else if (*((_BYTE *)v4 + 402))
    {
      goto LABEL_228;
    }
  }
  else if ((v41 & 0x20000000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v40 & 0x80000000) != 0)
  {
    if ((v41 & 0x80000000) == 0)
      goto LABEL_228;
    if (self->_siriInitiated)
    {
      if (!*((_BYTE *)v4 + 404))
        goto LABEL_228;
    }
    else if (*((_BYTE *)v4 + 404))
    {
      goto LABEL_228;
    }
  }
  else if (v41 < 0)
  {
    goto LABEL_228;
  }
  if ((*(_DWORD *)&v40 & 0x4000000) != 0)
  {
    if ((v41 & 0x4000000) == 0 || self->_systemReleaseType != *((_DWORD *)v4 + 94))
      goto LABEL_228;
  }
  else if ((v41 & 0x4000000) != 0)
  {
    goto LABEL_228;
  }
  eventTimeZoneName = self->_eventTimeZoneName;
  if ((unint64_t)eventTimeZoneName | *((_QWORD *)v4 + 26))
  {
    if (-[NSString isEqual:](eventTimeZoneName, "isEqual:"))
    {
      v40 = self->_has;
      goto LABEL_214;
    }
LABEL_228:
    v45 = 0;
    goto LABEL_229;
  }
LABEL_214:
  v43 = *((_DWORD *)v4 + 102);
  if ((*(_DWORD *)&v40 & 0x80000) != 0)
  {
    if ((v43 & 0x80000) == 0 || self->_displayType != *((_DWORD *)v4 + 48))
      goto LABEL_228;
  }
  else if ((v43 & 0x80000) != 0)
  {
    goto LABEL_228;
  }
  if ((*(_BYTE *)&v40 & 1) != 0)
  {
    if ((v43 & 1) == 0 || self->_characterDisplayedCount != *((_QWORD *)v4 + 1))
      goto LABEL_228;
  }
  else if ((v43 & 1) != 0)
  {
    goto LABEL_228;
  }
  lyricLanguage = self->_lyricLanguage;
  if ((unint64_t)lyricLanguage | *((_QWORD *)v4 + 33))
    v45 = -[NSString isEqual:](lyricLanguage, "isEqual:");
  else
    v45 = 1;
LABEL_229:

  return v45;
}

- (unint64_t)hash
{
  $DE3EE0432C8889EE6FF627BF579DAD3F has;
  double eventDateTimestamp;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double eventSecondsFromGMT;
  double v11;
  long double v12;
  double v13;
  $DE3EE0432C8889EE6FF627BF579DAD3F v14;
  unint64_t v15;
  double itemDuration;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  double itemEndTime;
  double v22;
  long double v23;
  double v24;
  double itemStartTime;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  $DE3EE0432C8889EE6FF627BF579DAD3F v30;
  $DE3EE0432C8889EE6FF627BF579DAD3F v31;
  $DE3EE0432C8889EE6FF627BF579DAD3F v32;
  $DE3EE0432C8889EE6FF627BF579DAD3F v33;
  unint64_t v34;
  NSUInteger v35;
  $DE3EE0432C8889EE6FF627BF579DAD3F v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSUInteger v40;
  $DE3EE0432C8889EE6FF627BF579DAD3F v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSUInteger v49;
  NSUInteger v50;
  NSUInteger v51;
  NSUInteger v52;
  uint64_t v53;
  unint64_t v54;
  NSUInteger v55;
  uint64_t v56;
  NSUInteger v57;
  NSUInteger v58;
  NSUInteger v59;
  uint64_t v60;
  NSUInteger v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSUInteger v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSUInteger v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSUInteger v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  NSUInteger v81;
  NSUInteger v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  NSUInteger v86;
  uint64_t v87;
  NSUInteger v88;

  v88 = -[NSString hash](self->_containerID, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    v87 = 2654435761 * self->_containerType;
  else
    v87 = 0;
  v86 = -[NSString hash](self->_deviceName, "hash");
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    v85 = 2654435761 * self->_endReasonType;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v8 = 0;
    goto LABEL_14;
  }
  v85 = 0;
  if ((*(_BYTE *)&has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  eventDateTimestamp = self->_eventDateTimestamp;
  v5 = -eventDateTimestamp;
  if (eventDateTimestamp >= 0.0)
    v5 = self->_eventDateTimestamp;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_14:
  v84 = v8;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    eventSecondsFromGMT = self->_eventSecondsFromGMT;
    v11 = -eventSecondsFromGMT;
    if (eventSecondsFromGMT >= 0.0)
      v11 = self->_eventSecondsFromGMT;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v83 = v9;
  v82 = -[NSString hash](self->_externalID, "hash");
  v81 = -[NSString hash](self->_featureName, "hash");
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x80) != 0)
  {
    itemDuration = self->_itemDuration;
    v17 = -itemDuration;
    if (itemDuration >= 0.0)
      v17 = self->_itemDuration;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    itemEndTime = self->_itemEndTime;
    v22 = -itemEndTime;
    if (itemEndTime >= 0.0)
      v22 = self->_itemEndTime;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    itemStartTime = self->_itemStartTime;
    v26 = -itemStartTime;
    if (itemStartTime >= 0.0)
      v26 = self->_itemStartTime;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v29 += (unint64_t)v28;
    }
    else
    {
      v29 -= (unint64_t)fabs(v28);
    }
    v80 = v29;
    if ((*(_DWORD *)&v14 & 0x400000) != 0)
    {
LABEL_40:
      v79 = 2654435761 * self->_itemType;
      if ((*(_DWORD *)&v14 & 0x800000) != 0)
        goto LABEL_41;
      goto LABEL_52;
    }
  }
  else
  {
    v80 = 0;
    if ((*(_DWORD *)&v14 & 0x400000) != 0)
      goto LABEL_40;
  }
  v79 = 0;
  if ((*(_DWORD *)&v14 & 0x800000) != 0)
  {
LABEL_41:
    v78 = 2654435761 * self->_mediaType;
    if ((*(_DWORD *)&v14 & 0x10000000) != 0)
      goto LABEL_42;
LABEL_53:
    v77 = 0;
    if ((*(_WORD *)&v14 & 0x400) != 0)
      goto LABEL_43;
    goto LABEL_54;
  }
LABEL_52:
  v78 = 0;
  if ((*(_DWORD *)&v14 & 0x10000000) == 0)
    goto LABEL_53;
LABEL_42:
  v77 = 2654435761 * self->_offline;
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
LABEL_43:
    v76 = 2654435761 * self->_persistentID;
    goto LABEL_55;
  }
LABEL_54:
  v76 = 0;
LABEL_55:
  v75 = -[NSString hash](self->_personalizedContainerID, "hash");
  v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x40000000) == 0)
  {
    v74 = 0;
    if ((*(_DWORD *)&v30 & 0x2000000) != 0)
      goto LABEL_57;
LABEL_60:
    v73 = 0;
    if ((*(_WORD *)&v30 & 0x4000) != 0)
      goto LABEL_58;
    goto LABEL_61;
  }
  v74 = 2654435761 * self->_sBEnabled;
  if ((*(_DWORD *)&v30 & 0x2000000) == 0)
    goto LABEL_60;
LABEL_57:
  v73 = 2654435761 * self->_sourceType;
  if ((*(_WORD *)&v30 & 0x4000) != 0)
  {
LABEL_58:
    v72 = 2654435761u * self->_storeAccountID;
    goto LABEL_62;
  }
LABEL_61:
  v72 = 0;
LABEL_62:
  v71 = -[NSString hash](self->_storeID, "hash");
  v70 = -[NSData hash](self->_timedMetadata, "hash");
  v69 = -[NSData hash](self->_trackInfo, "hash");
  v68 = -[NSData hash](self->_recommendationData, "hash");
  v67 = -[NSString hash](self->_storeFrontID, "hash");
  v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x200000) != 0)
  {
    v66 = 2654435761 * self->_eventType;
    if ((*(_WORD *)&v31 & 0x8000) != 0)
    {
LABEL_64:
      v65 = 2654435761 * self->_subscriptionAdamID;
      if ((*(_WORD *)&v31 & 0x800) != 0)
        goto LABEL_65;
      goto LABEL_70;
    }
  }
  else
  {
    v66 = 0;
    if ((*(_WORD *)&v31 & 0x8000) != 0)
      goto LABEL_64;
  }
  v65 = 0;
  if ((*(_WORD *)&v31 & 0x800) != 0)
  {
LABEL_65:
    v64 = 2654435761 * self->_purchasedAdamID;
    if ((*(_WORD *)&v31 & 0x1000) != 0)
      goto LABEL_66;
LABEL_71:
    v63 = 0;
    if ((*(_BYTE *)&v31 & 0x40) != 0)
      goto LABEL_67;
    goto LABEL_72;
  }
LABEL_70:
  v64 = 0;
  if ((*(_WORD *)&v31 & 0x1000) == 0)
    goto LABEL_71;
LABEL_66:
  v63 = 2654435761 * self->_radioAdamID;
  if ((*(_BYTE *)&v31 & 0x40) != 0)
  {
LABEL_67:
    v62 = 2654435761u * self->_itemCloudID;
    goto LABEL_73;
  }
LABEL_72:
  v62 = 0;
LABEL_73:
  v61 = -[NSString hash](self->_lyricsID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v60 = 2654435761 * self->_containerAdamID;
  else
    v60 = 0;
  v59 = -[NSString hash](self->_globalPlaylistID, "hash");
  v58 = -[NSString hash](self->_stationHash, "hash");
  v57 = -[NSString hash](self->_stationStringID, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    v56 = 2654435761 * self->_stationID;
  else
    v56 = 0;
  v55 = -[NSString hash](self->_cloudAlbumID, "hash");
  v32 = self->_has;
  if ((*(_BYTE *)&v32 & 2) != 0)
  {
    v54 = 2654435761u * self->_cloudPlaylistID;
    if ((*(_DWORD *)&v32 & 0x1000000) != 0)
      goto LABEL_81;
  }
  else
  {
    v54 = 0;
    if ((*(_DWORD *)&v32 & 0x1000000) != 0)
    {
LABEL_81:
      v53 = 2654435761 * self->_reasonHintType;
      goto LABEL_84;
    }
  }
  v53 = 0;
LABEL_84:
  v52 = -[NSString hash](self->_buildVersion, "hash");
  v51 = -[NSString hash](self->_playlistVersionHash, "hash");
  v50 = -[NSString hash](self->_requestingBundleIdentifier, "hash");
  v49 = -[NSString hash](self->_requestingBundleVersion, "hash");
  v33 = self->_has;
  if ((*(_BYTE *)&v33 & 8) != 0)
  {
    v48 = 2654435761 * self->_equivalencySourceAdamID;
    if ((*(_DWORD *)&v33 & 0x8000000) != 0)
    {
LABEL_86:
      v47 = 2654435761 * self->_internalBuild;
      if ((*(_DWORD *)&v33 & 0x10000) != 0)
        goto LABEL_87;
LABEL_91:
      v46 = 0;
      if ((*(_DWORD *)&v33 & 0x20000) != 0)
        goto LABEL_88;
      goto LABEL_92;
    }
  }
  else
  {
    v48 = 0;
    if ((*(_DWORD *)&v33 & 0x8000000) != 0)
      goto LABEL_86;
  }
  v47 = 0;
  if ((*(_DWORD *)&v33 & 0x10000) == 0)
    goto LABEL_91;
LABEL_87:
  v46 = 2654435761 * self->_tvShowPurchasedAdamID;
  if ((*(_DWORD *)&v33 & 0x20000) != 0)
  {
LABEL_88:
    v45 = 2654435761 * self->_tvShowSubscriptionAdamID;
    goto LABEL_93;
  }
LABEL_92:
  v45 = 0;
LABEL_93:
  v34 = -[SSVPBPlayActivityEnqueuerProperties hash](self->_enqueuerProperties, "hash");
  v35 = -[NSString hash](self->_householdID, "hash");
  v36 = self->_has;
  if ((*(_DWORD *)&v36 & 0x20000000) == 0)
  {
    v37 = 0;
    if ((*(_DWORD *)&v36 & 0x80000000) != 0)
      goto LABEL_95;
LABEL_98:
    v38 = 0;
    if ((*(_DWORD *)&v36 & 0x4000000) != 0)
      goto LABEL_96;
    goto LABEL_99;
  }
  v37 = 2654435761 * self->_privateListeningEnabled;
  if ((*(_DWORD *)&v36 & 0x80000000) == 0)
    goto LABEL_98;
LABEL_95:
  v38 = 2654435761 * self->_siriInitiated;
  if ((*(_DWORD *)&v36 & 0x4000000) != 0)
  {
LABEL_96:
    v39 = 2654435761 * self->_systemReleaseType;
    goto LABEL_100;
  }
LABEL_99:
  v39 = 0;
LABEL_100:
  v40 = -[NSString hash](self->_eventTimeZoneName, "hash");
  v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x80000) != 0)
  {
    v42 = 2654435761 * self->_displayType;
    if ((*(_BYTE *)&v41 & 1) != 0)
      goto LABEL_102;
LABEL_104:
    v43 = 0;
    return v87 ^ v88 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v15 ^ v20 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v34 ^ v35 ^ v37 ^ v38 ^ v39 ^ v40 ^ v42 ^ v43 ^ -[NSString hash](self->_lyricLanguage, "hash");
  }
  v42 = 0;
  if ((*(_BYTE *)&v41 & 1) == 0)
    goto LABEL_104;
LABEL_102:
  v43 = 2654435761 * self->_characterDisplayedCount;
  return v87 ^ v88 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v15 ^ v20 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v34 ^ v35 ^ v37 ^ v38 ^ v39 ^ v40 ^ v42 ^ v43 ^ -[NSString hash](self->_lyricLanguage, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  SSVPBPlayActivityEnqueuerProperties *enqueuerProperties;
  uint64_t v12;
  int v13;
  int v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (*((_QWORD *)v4 + 21))
  {
    -[SSVPBPlayActivityEvent setContainerID:](self, "setContainerID:");
    v4 = v15;
  }
  if ((*((_BYTE *)v4 + 410) & 4) != 0)
  {
    self->_containerType = *((_DWORD *)v4 + 44);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
  if (*((_QWORD *)v4 + 23))
  {
    -[SSVPBPlayActivityEvent setDeviceName:](self, "setDeviceName:");
    v4 = v15;
  }
  v5 = *((_DWORD *)v4 + 102);
  if ((v5 & 0x100000) != 0)
  {
    self->_endReasonType = *((_DWORD *)v4 + 49);
    *(_DWORD *)&self->_has |= 0x100000u;
    v5 = *((_DWORD *)v4 + 102);
    if ((v5 & 0x10) == 0)
    {
LABEL_9:
      if ((v5 & 0x20) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_9;
  }
  self->_eventDateTimestamp = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  if ((*((_DWORD *)v4 + 102) & 0x20) != 0)
  {
LABEL_10:
    self->_eventSecondsFromGMT = *((double *)v4 + 6);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_11:
  if (*((_QWORD *)v4 + 28))
  {
    -[SSVPBPlayActivityEvent setExternalID:](self, "setExternalID:");
    v4 = v15;
  }
  if (*((_QWORD *)v4 + 29))
  {
    -[SSVPBPlayActivityEvent setFeatureName:](self, "setFeatureName:");
    v4 = v15;
  }
  v6 = *((_DWORD *)v4 + 102);
  if ((v6 & 0x80) != 0)
  {
    self->_itemDuration = *((double *)v4 + 8);
    *(_DWORD *)&self->_has |= 0x80u;
    v6 = *((_DWORD *)v4 + 102);
    if ((v6 & 0x100) == 0)
    {
LABEL_17:
      if ((v6 & 0x200) == 0)
        goto LABEL_18;
      goto LABEL_84;
    }
  }
  else if ((v6 & 0x100) == 0)
  {
    goto LABEL_17;
  }
  self->_itemEndTime = *((double *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v6 = *((_DWORD *)v4 + 102);
  if ((v6 & 0x200) == 0)
  {
LABEL_18:
    if ((v6 & 0x400000) == 0)
      goto LABEL_19;
    goto LABEL_85;
  }
LABEL_84:
  self->_itemStartTime = *((double *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v6 = *((_DWORD *)v4 + 102);
  if ((v6 & 0x400000) == 0)
  {
LABEL_19:
    if ((v6 & 0x800000) == 0)
      goto LABEL_20;
    goto LABEL_86;
  }
LABEL_85:
  self->_itemType = *((_DWORD *)v4 + 64);
  *(_DWORD *)&self->_has |= 0x400000u;
  v6 = *((_DWORD *)v4 + 102);
  if ((v6 & 0x800000) == 0)
  {
LABEL_20:
    if ((v6 & 0x10000000) == 0)
      goto LABEL_21;
    goto LABEL_87;
  }
LABEL_86:
  self->_mediaType = *((_DWORD *)v4 + 70);
  *(_DWORD *)&self->_has |= 0x800000u;
  v6 = *((_DWORD *)v4 + 102);
  if ((v6 & 0x10000000) == 0)
  {
LABEL_21:
    if ((v6 & 0x400) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_87:
  self->_offline = *((_BYTE *)v4 + 401);
  *(_DWORD *)&self->_has |= 0x10000000u;
  if ((*((_DWORD *)v4 + 102) & 0x400) != 0)
  {
LABEL_22:
    self->_persistentID = *((_QWORD *)v4 + 11);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_23:
  if (*((_QWORD *)v4 + 36))
  {
    -[SSVPBPlayActivityEvent setPersonalizedContainerID:](self, "setPersonalizedContainerID:");
    v4 = v15;
  }
  v7 = *((_DWORD *)v4 + 102);
  if ((v7 & 0x40000000) != 0)
  {
    self->_sBEnabled = *((_BYTE *)v4 + 403);
    *(_DWORD *)&self->_has |= 0x40000000u;
    v7 = *((_DWORD *)v4 + 102);
    if ((v7 & 0x2000000) == 0)
    {
LABEL_27:
      if ((v7 & 0x4000) == 0)
        goto LABEL_29;
      goto LABEL_28;
    }
  }
  else if ((v7 & 0x2000000) == 0)
  {
    goto LABEL_27;
  }
  self->_sourceType = *((_DWORD *)v4 + 84);
  *(_DWORD *)&self->_has |= 0x2000000u;
  if ((*((_DWORD *)v4 + 102) & 0x4000) != 0)
  {
LABEL_28:
    self->_storeAccountID = *((_QWORD *)v4 + 15);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_29:
  if (*((_QWORD *)v4 + 46))
  {
    -[SSVPBPlayActivityEvent setStoreID:](self, "setStoreID:");
    v4 = v15;
  }
  if (*((_QWORD *)v4 + 48))
  {
    -[SSVPBPlayActivityEvent setTimedMetadata:](self, "setTimedMetadata:");
    v4 = v15;
  }
  if (*((_QWORD *)v4 + 49))
  {
    -[SSVPBPlayActivityEvent setTrackInfo:](self, "setTrackInfo:");
    v4 = v15;
  }
  if (*((_QWORD *)v4 + 39))
  {
    -[SSVPBPlayActivityEvent setRecommendationData:](self, "setRecommendationData:");
    v4 = v15;
  }
  if (*((_QWORD *)v4 + 45))
  {
    -[SSVPBPlayActivityEvent setStoreFrontID:](self, "setStoreFrontID:");
    v4 = v15;
  }
  v8 = *((_DWORD *)v4 + 102);
  if ((v8 & 0x200000) != 0)
  {
    self->_eventType = *((_DWORD *)v4 + 54);
    *(_DWORD *)&self->_has |= 0x200000u;
    v8 = *((_DWORD *)v4 + 102);
    if ((v8 & 0x8000) == 0)
    {
LABEL_41:
      if ((v8 & 0x800) == 0)
        goto LABEL_42;
      goto LABEL_94;
    }
  }
  else if ((v8 & 0x8000) == 0)
  {
    goto LABEL_41;
  }
  self->_subscriptionAdamID = *((_QWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  v8 = *((_DWORD *)v4 + 102);
  if ((v8 & 0x800) == 0)
  {
LABEL_42:
    if ((v8 & 0x1000) == 0)
      goto LABEL_43;
    goto LABEL_95;
  }
LABEL_94:
  self->_purchasedAdamID = *((_QWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  v8 = *((_DWORD *)v4 + 102);
  if ((v8 & 0x1000) == 0)
  {
LABEL_43:
    if ((v8 & 0x40) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_95:
  self->_radioAdamID = *((_QWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  if ((*((_DWORD *)v4 + 102) & 0x40) != 0)
  {
LABEL_44:
    self->_itemCloudID = *((_QWORD *)v4 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_45:
  if (*((_QWORD *)v4 + 34))
  {
    -[SSVPBPlayActivityEvent setLyricsID:](self, "setLyricsID:");
    v4 = v15;
  }
  if ((*((_BYTE *)v4 + 408) & 4) != 0)
  {
    self->_containerAdamID = *((_QWORD *)v4 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 30))
  {
    -[SSVPBPlayActivityEvent setGlobalPlaylistID:](self, "setGlobalPlaylistID:");
    v4 = v15;
  }
  if (*((_QWORD *)v4 + 43))
  {
    -[SSVPBPlayActivityEvent setStationHash:](self, "setStationHash:");
    v4 = v15;
  }
  if (*((_QWORD *)v4 + 44))
  {
    -[SSVPBPlayActivityEvent setStationStringID:](self, "setStationStringID:");
    v4 = v15;
  }
  if ((*((_BYTE *)v4 + 409) & 0x20) != 0)
  {
    self->_stationID = *((_QWORD *)v4 + 14);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
  if (*((_QWORD *)v4 + 20))
  {
    -[SSVPBPlayActivityEvent setCloudAlbumID:](self, "setCloudAlbumID:");
    v4 = v15;
  }
  v9 = *((_DWORD *)v4 + 102);
  if ((v9 & 2) != 0)
  {
    self->_cloudPlaylistID = *((_QWORD *)v4 + 2);
    *(_DWORD *)&self->_has |= 2u;
    v9 = *((_DWORD *)v4 + 102);
  }
  if ((v9 & 0x1000000) != 0)
  {
    self->_reasonHintType = *((_DWORD *)v4 + 76);
    *(_DWORD *)&self->_has |= 0x1000000u;
  }
  if (*((_QWORD *)v4 + 19))
  {
    -[SSVPBPlayActivityEvent setBuildVersion:](self, "setBuildVersion:");
    v4 = v15;
  }
  if (*((_QWORD *)v4 + 37))
  {
    -[SSVPBPlayActivityEvent setPlaylistVersionHash:](self, "setPlaylistVersionHash:");
    v4 = v15;
  }
  if (*((_QWORD *)v4 + 40))
  {
    -[SSVPBPlayActivityEvent setRequestingBundleIdentifier:](self, "setRequestingBundleIdentifier:");
    v4 = v15;
  }
  if (*((_QWORD *)v4 + 41))
  {
    -[SSVPBPlayActivityEvent setRequestingBundleVersion:](self, "setRequestingBundleVersion:");
    v4 = v15;
  }
  v10 = *((_DWORD *)v4 + 102);
  if ((v10 & 8) != 0)
  {
    self->_equivalencySourceAdamID = *((_QWORD *)v4 + 4);
    *(_DWORD *)&self->_has |= 8u;
    v10 = *((_DWORD *)v4 + 102);
    if ((v10 & 0x8000000) == 0)
    {
LABEL_73:
      if ((v10 & 0x10000) == 0)
        goto LABEL_74;
      goto LABEL_99;
    }
  }
  else if ((v10 & 0x8000000) == 0)
  {
    goto LABEL_73;
  }
  self->_internalBuild = *((_BYTE *)v4 + 400);
  *(_DWORD *)&self->_has |= 0x8000000u;
  v10 = *((_DWORD *)v4 + 102);
  if ((v10 & 0x10000) == 0)
  {
LABEL_74:
    if ((v10 & 0x20000) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_99:
  self->_tvShowPurchasedAdamID = *((_QWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  if ((*((_DWORD *)v4 + 102) & 0x20000) != 0)
  {
LABEL_75:
    self->_tvShowSubscriptionAdamID = *((_QWORD *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
LABEL_76:
  enqueuerProperties = self->_enqueuerProperties;
  v12 = *((_QWORD *)v4 + 25);
  if (enqueuerProperties)
  {
    if (!v12)
      goto LABEL_104;
    -[SSVPBPlayActivityEnqueuerProperties mergeFrom:](enqueuerProperties, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_104;
    -[SSVPBPlayActivityEvent setEnqueuerProperties:](self, "setEnqueuerProperties:");
  }
  v4 = v15;
LABEL_104:
  if (*((_QWORD *)v4 + 31))
  {
    -[SSVPBPlayActivityEvent setHouseholdID:](self, "setHouseholdID:");
    v4 = v15;
  }
  v13 = *((_DWORD *)v4 + 102);
  if ((v13 & 0x20000000) != 0)
  {
    self->_privateListeningEnabled = *((_BYTE *)v4 + 402);
    *(_DWORD *)&self->_has |= 0x20000000u;
    v13 = *((_DWORD *)v4 + 102);
    if ((v13 & 0x80000000) == 0)
    {
LABEL_108:
      if ((v13 & 0x4000000) == 0)
        goto LABEL_110;
      goto LABEL_109;
    }
  }
  else if ((v13 & 0x80000000) == 0)
  {
    goto LABEL_108;
  }
  self->_siriInitiated = *((_BYTE *)v4 + 404);
  *(_DWORD *)&self->_has |= 0x80000000;
  if ((*((_DWORD *)v4 + 102) & 0x4000000) != 0)
  {
LABEL_109:
    self->_systemReleaseType = *((_DWORD *)v4 + 94);
    *(_DWORD *)&self->_has |= 0x4000000u;
  }
LABEL_110:
  if (*((_QWORD *)v4 + 26))
  {
    -[SSVPBPlayActivityEvent setEventTimeZoneName:](self, "setEventTimeZoneName:");
    v4 = v15;
  }
  v14 = *((_DWORD *)v4 + 102);
  if ((v14 & 0x80000) != 0)
  {
    self->_displayType = *((_DWORD *)v4 + 48);
    *(_DWORD *)&self->_has |= 0x80000u;
    v14 = *((_DWORD *)v4 + 102);
  }
  if ((v14 & 1) != 0)
  {
    self->_characterDisplayedCount = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 33))
  {
    -[SSVPBPlayActivityEvent setLyricLanguage:](self, "setLyricLanguage:");
    v4 = v15;
  }

}

- (int64_t)subscriptionAdamID
{
  return self->_subscriptionAdamID;
}

- (int64_t)purchasedAdamID
{
  return self->_purchasedAdamID;
}

- (int64_t)radioAdamID
{
  return self->_radioAdamID;
}

- (unint64_t)itemCloudID
{
  return self->_itemCloudID;
}

- (NSString)lyricsID
{
  return self->_lyricsID;
}

- (void)setLyricsID:(id)a3
{
  objc_storeStrong((id *)&self->_lyricsID, a3);
}

- (int64_t)equivalencySourceAdamID
{
  return self->_equivalencySourceAdamID;
}

- (int64_t)containerAdamID
{
  return self->_containerAdamID;
}

- (NSString)globalPlaylistID
{
  return self->_globalPlaylistID;
}

- (void)setGlobalPlaylistID:(id)a3
{
  objc_storeStrong((id *)&self->_globalPlaylistID, a3);
}

- (NSString)stationHash
{
  return self->_stationHash;
}

- (void)setStationHash:(id)a3
{
  objc_storeStrong((id *)&self->_stationHash, a3);
}

- (NSString)stationStringID
{
  return self->_stationStringID;
}

- (void)setStationStringID:(id)a3
{
  objc_storeStrong((id *)&self->_stationStringID, a3);
}

- (int64_t)stationID
{
  return self->_stationID;
}

- (NSString)cloudAlbumID
{
  return self->_cloudAlbumID;
}

- (void)setCloudAlbumID:(id)a3
{
  objc_storeStrong((id *)&self->_cloudAlbumID, a3);
}

- (unint64_t)cloudPlaylistID
{
  return self->_cloudPlaylistID;
}

- (NSString)playlistVersionHash
{
  return self->_playlistVersionHash;
}

- (void)setPlaylistVersionHash:(id)a3
{
  objc_storeStrong((id *)&self->_playlistVersionHash, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (double)eventDateTimestamp
{
  return self->_eventDateTimestamp;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
  objc_storeStrong((id *)&self->_featureName, a3);
}

- (double)itemDuration
{
  return self->_itemDuration;
}

- (double)itemEndTime
{
  return self->_itemEndTime;
}

- (double)itemStartTime
{
  return self->_itemStartTime;
}

- (BOOL)offline
{
  return self->_offline;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (BOOL)sBEnabled
{
  return self->_sBEnabled;
}

- (unint64_t)storeAccountID
{
  return self->_storeAccountID;
}

- (NSData)timedMetadata
{
  return self->_timedMetadata;
}

- (void)setTimedMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_timedMetadata, a3);
}

- (NSData)trackInfo
{
  return self->_trackInfo;
}

- (void)setTrackInfo:(id)a3
{
  objc_storeStrong((id *)&self->_trackInfo, a3);
}

- (NSData)recommendationData
{
  return self->_recommendationData;
}

- (void)setRecommendationData:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationData, a3);
}

- (NSString)storeFrontID
{
  return self->_storeFrontID;
}

- (void)setStoreFrontID:(id)a3
{
  objc_storeStrong((id *)&self->_storeFrontID, a3);
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (NSString)requestingBundleIdentifier
{
  return self->_requestingBundleIdentifier;
}

- (void)setRequestingBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, a3);
}

- (NSString)requestingBundleVersion
{
  return self->_requestingBundleVersion;
}

- (void)setRequestingBundleVersion:(id)a3
{
  objc_storeStrong((id *)&self->_requestingBundleVersion, a3);
}

- (SSVPBPlayActivityEnqueuerProperties)enqueuerProperties
{
  return self->_enqueuerProperties;
}

- (void)setEnqueuerProperties:(id)a3
{
  objc_storeStrong((id *)&self->_enqueuerProperties, a3);
}

- (NSString)householdID
{
  return self->_householdID;
}

- (void)setHouseholdID:(id)a3
{
  objc_storeStrong((id *)&self->_householdID, a3);
}

- (BOOL)privateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (BOOL)siriInitiated
{
  return self->_siriInitiated;
}

- (NSString)eventTimeZoneName
{
  return self->_eventTimeZoneName;
}

- (void)setEventTimeZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_eventTimeZoneName, a3);
}

- (int64_t)characterDisplayedCount
{
  return self->_characterDisplayedCount;
}

- (NSString)lyricLanguage
{
  return self->_lyricLanguage;
}

- (void)setLyricLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_lyricLanguage, a3);
}

- (NSString)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
  objc_storeStrong((id *)&self->_containerID, a3);
}

- (NSString)personalizedContainerID
{
  return self->_personalizedContainerID;
}

- (void)setPersonalizedContainerID:(id)a3
{
  objc_storeStrong((id *)&self->_personalizedContainerID, a3);
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
  objc_storeStrong((id *)&self->_storeID, a3);
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
  objc_storeStrong((id *)&self->_externalID, a3);
}

- (int64_t)tvShowPurchasedAdamID
{
  return self->_tvShowPurchasedAdamID;
}

- (int64_t)tvShowSubscriptionAdamID
{
  return self->_tvShowSubscriptionAdamID;
}

- (BOOL)internalBuild
{
  return self->_internalBuild;
}

- (double)eventSecondsFromGMT
{
  return self->_eventSecondsFromGMT;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackInfo, 0);
  objc_storeStrong((id *)&self->_timedMetadata, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_stationStringID, 0);
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recommendationData, 0);
  objc_storeStrong((id *)&self->_playlistVersionHash, 0);
  objc_storeStrong((id *)&self->_personalizedContainerID, 0);
  objc_storeStrong((id *)&self->_lyricsID, 0);
  objc_storeStrong((id *)&self->_lyricLanguage, 0);
  objc_storeStrong((id *)&self->_householdID, 0);
  objc_storeStrong((id *)&self->_globalPlaylistID, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_eventTimeZoneName, 0);
  objc_storeStrong((id *)&self->_enqueuerProperties, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_cloudAlbumID, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
