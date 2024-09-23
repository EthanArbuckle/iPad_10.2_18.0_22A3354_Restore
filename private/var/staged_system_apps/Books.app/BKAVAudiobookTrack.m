@implementation BKAVAudiobookTrack

- (BKAVAudiobookTrack)initWithAssetURL:(id)a3
{
  id v5;
  BKAVAudiobookTrack *v6;
  BKAVAudiobookTrack *v7;
  NSMutableArray *v8;
  NSMutableArray *avChapters;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKAVAudiobookTrack;
  v6 = -[BKAVAudiobookTrack init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetURL, a3);
    v8 = objc_opt_new(NSMutableArray);
    avChapters = v7->_avChapters;
    v7->_avChapters = v8;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_artwork);
  v3.receiver = self;
  v3.super_class = (Class)BKAVAudiobookTrack;
  -[BKAVAudiobookTrack dealloc](&v3, "dealloc");
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

- (BOOL)hasAlternateArtwork
{
  return 0;
}

- (id)alternateArtworkTimes
{
  return &__NSArray0__struct;
}

- (void)addChapter:(id)a3
{
  -[NSMutableArray addObject:](self->_avChapters, "addObject:", a3);
}

- (NSArray)chapters
{
  return (NSArray *)self->_avChapters;
}

- (BOOL)incrementPlayCountForStopTime:(double)a3
{
  return 0;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGImage *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobookTrack assetURL](self, "assetURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobookTrack title](self, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAVAudiobookTrack author](self, "author"));
  v9 = -[BKAVAudiobookTrack artwork](self, "artwork");
  v10 = -[BKAVAudiobookTrack hasAlternateArtwork](self, "hasAlternateArtwork");
  -[BKAVAudiobookTrack duration](self, "duration");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@:%p url=%@ title=%@ author=%@ artwork=%p hasAlternateArtwork=%d duration=%lf chapters=\n"), v5, self, v6, v7, v8, v9, v10, v11));

  v13 = (char *)-[NSMutableArray count](self->_avChapters, "count");
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = v13 - 1;
    do
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_avChapters, "objectAtIndexedSubscript:", v15));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description"));
      v19 = (void *)v18;
      if (v16 == v15)
        v20 = &stru_10091C438;
      else
        v20 = CFSTR(",");
      objc_msgSend(v12, "appendFormat:", CFSTR("  %@%@\n"), v18, v20);

      ++v15;
    }
    while (v14 != v15);
  }
  objc_msgSend(v12, "appendFormat:", CFSTR(">"));
  return (NSString *)v12;
}

- (BKAudiobook)audiobook
{
  return (BKAudiobook *)objc_loadWeakRetained((id *)&self->audiobook);
}

- (void)setAudiobook:(id)a3
{
  objc_storeWeak((id *)&self->audiobook, a3);
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->_assetURL, a3);
}

- (double)bookmarkTime
{
  return self->bookmarkTime;
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)author
{
  return self->author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)dateLastOpened
{
  return self->dateLastOpened;
}

- (double)duration
{
  return self->duration;
}

- (void)setDuration:(double)a3
{
  self->duration = a3;
}

- (NSMutableArray)avChapters
{
  return self->_avChapters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avChapters, 0);
  objc_storeStrong((id *)&self->dateLastOpened, 0);
  objc_storeStrong((id *)&self->author, 0);
  objc_storeStrong((id *)&self->title, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_destroyWeak((id *)&self->audiobook);
}

@end
