@implementation PGMusicCurationSpecificationOptions

- (PGMusicCurationSpecificationOptions)init
{
  id v3;
  PGMusicCurationSpecificationOptions *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  v4 = -[PGMusicCurationSpecificationOptions initWithOptionsDictionary:](self, "initWithOptionsDictionary:", v3);

  return v4;
}

- (PGMusicCurationSpecificationOptions)initWithOptionsDictionary:(id)a3
{
  id v4;
  PGMusicCurationSpecificationOptions *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *artist;
  uint64_t v10;
  NSString *genre;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSNumber *length;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  PGMusicCurationSpecificationOptions *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PGMusicCurationSpecificationOptions;
  v5 = -[PGMusicCurationSpecificationOptions init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72130]);
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D720F8]);
    v8 = objc_claimAutoreleasedReturnValue();
    artist = v5->_artist;
    v5->_artist = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72100]);
    v10 = objc_claimAutoreleasedReturnValue();
    genre = v5->_genre;
    v5->_genre = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72118]);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v5->_moods, v14);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72110]);
    v15 = objc_claimAutoreleasedReturnValue();
    length = v5->_length;
    v5->_length = (NSNumber *)v15;

    v17 = *MEMORY[0x1E0D72108];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72108]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_isTrip = objc_msgSend(v19, "BOOLValue");

    }
    else
    {
      v5->_isTrip = 0;
    }

    v20 = *MEMORY[0x1E0D72128];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72128]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_shouldDownloadKeyFlexSong = objc_msgSend(v22, "BOOLValue");

    }
    else
    {
      v5->_shouldDownloadKeyFlexSong = 0;
    }

    v23 = v5;
  }

  return v5;
}

- (BOOL)isQUEmpty
{
  NSString *title;
  _BOOL4 v4;
  NSString *artist;
  _BOOL4 v6;
  NSString *genre;
  BOOL v8;
  NSUInteger v9;
  BOOL v10;

  title = self->_title;
  if (title)
    v4 = -[NSString length](title, "length") != 0;
  else
    v4 = 0;
  artist = self->_artist;
  if (artist)
    v6 = -[NSString length](artist, "length") != 0;
  else
    v6 = 0;
  genre = self->_genre;
  if (genre)
    v8 = -[NSString length](genre, "length") == 0;
  else
    v8 = 1;
  v9 = -[NSArray count](self->_moods, "count");
  v10 = !v4 && !v6 && v8;
  return !v9 && v10;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSNumber)length
{
  return self->_length;
}

- (NSArray)moods
{
  return self->_moods;
}

- (BOOL)isTrip
{
  return self->_isTrip;
}

- (BOOL)shouldDownloadKeyFlexSong
{
  return self->_shouldDownloadKeyFlexSong;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moods, 0);
  objc_storeStrong((id *)&self->_length, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (unint64_t)PHMemoryMoodFromNumber:(id)a3
{
  return _moodFromMoodAsNumber(a3);
}

@end
