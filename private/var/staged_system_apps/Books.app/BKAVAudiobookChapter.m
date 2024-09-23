@implementation BKAVAudiobookChapter

- (BKAudiobook)audiobook
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobookChapter track](self, "track"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "audiobook"));

  return (BKAudiobook *)v3;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobookChapter assetURL](self, "assetURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));

  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobookChapter track](self, "track"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "audiobook"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chapters"));
    v8 = objc_msgSend(v7, "indexOfObject:", self);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%ld"), v4, v8));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));

  }
  return (NSString *)v9;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_artwork);
  v3.receiver = self;
  v3.super_class = (Class)BKAVAudiobookChapter;
  -[BKAVAudiobookChapter dealloc](&v3, "dealloc");
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  Float64 Seconds;
  uint64_t v10;
  void *v11;
  CMTime v13;
  CMTime time;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobookChapter title](self, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobookChapter author](self, "author"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobookChapter customTitle](self, "customTitle"));
  -[BKAVAudiobookChapter timeRangeInAudiobook](self, "timeRangeInAudiobook");
  time = v13;
  Seconds = CMTimeGetSeconds(&time);
  -[BKAVAudiobookChapter duration](self, "duration");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p title=%@ author=%@ customTitle=%@ range=(%.1lf,%.1lf)>"), v5, self, v6, v7, v8, *(_QWORD *)&Seconds, v10));

  return (NSString *)v11;
}

- (CGImage)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(CGImage *)a3
{
  CGImageRetain(a3);
  CGImageRelease(self->_artwork);
  self->_artwork = a3;
}

- (unint64_t)albumTrackNumber
{
  return self->albumTrackNumber;
}

- (void)setAlbumTrackNumber:(unint64_t)a3
{
  self->albumTrackNumber = a3;
}

- (unint64_t)albumTrackCount
{
  return self->albumTrackCount;
}

- ($C9B3965AAA5284750DDDB08D9AABF973)timeRangeInTrack
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var0;
  return self;
}

- (void)setTimeRangeInTrack:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->timeRangeInTrack.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->timeRangeInTrack.duration.timescale = v4;
  *(_OWORD *)&self->timeRangeInTrack.start.value = v3;
}

- (NSURL)assetURL
{
  return self->assetURL;
}

- (NSString)author
{
  return self->author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)customTitle
{
  return self->customTitle;
}

- (void)setCustomTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)dateLastOpened
{
  return self->dateLastOpened;
}

- (void)setDateLastOpened:(id)a3
{
  objc_storeStrong((id *)&self->dateLastOpened, a3);
}

- (double)duration
{
  return self->duration;
}

- (void)setDuration:(double)a3
{
  self->duration = a3;
}

- ($C9B3965AAA5284750DDDB08D9AABF973)timeRangeInAudiobook
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[4].var0.var0;
  return self;
}

- (void)setTimeRangeInAudiobook:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->timeRangeInAudiobook.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->timeRangeInAudiobook.duration.timescale = v4;
  *(_OWORD *)&self->timeRangeInAudiobook.start.value = v3;
}

- (BKAudiobookTrack)track
{
  return (BKAudiobookTrack *)objc_loadWeakRetained((id *)&self->_track);
}

- (void)setTrack:(id)a3
{
  objc_storeWeak((id *)&self->_track, a3);
}

- (int64_t)metadataType
{
  return self->metadataType;
}

- (void)setMetadataType:(int64_t)a3
{
  self->metadataType = a3;
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)type
{
  return self->type;
}

- (void)setType:(int64_t)a3
{
  self->type = a3;
}

- (BOOL)hasAlternateArtwork
{
  return self->_hasAlternateArtwork;
}

- (void)setHasAlternateArtwork:(BOOL)a3
{
  self->_hasAlternateArtwork = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->title, 0);
  objc_destroyWeak((id *)&self->_track);
  objc_storeStrong((id *)&self->dateLastOpened, 0);
  objc_storeStrong((id *)&self->customTitle, 0);
  objc_storeStrong((id *)&self->author, 0);
  objc_storeStrong((id *)&self->assetURL, 0);
}

@end
