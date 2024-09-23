@implementation BKAudiobookBufferInfo

+ (id)infoWithAudiobookPositions:(id)a3 audiobookDurations:(id)a4 chapterPositions:(id)a5 chapterDurations:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  BKAudiobookBufferInfo *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_opt_new(BKAudiobookBufferInfo);
  -[BKAudiobookBufferInfo setAudiobookPositions:](v13, "setAudiobookPositions:", v12);

  -[BKAudiobookBufferInfo setAudiobookDurations:](v13, "setAudiobookDurations:", v11);
  -[BKAudiobookBufferInfo setChapterPositions:](v13, "setChapterPositions:", v10);

  -[BKAudiobookBufferInfo setChapterDurations:](v13, "setChapterDurations:", v9);
  return v13;
}

- (NSArray)audiobookPositions
{
  return self->_audiobookPositions;
}

- (void)setAudiobookPositions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)audiobookDurations
{
  return self->_audiobookDurations;
}

- (void)setAudiobookDurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)chapterPositions
{
  return self->_chapterPositions;
}

- (void)setChapterPositions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)chapterDurations
{
  return self->_chapterDurations;
}

- (void)setChapterDurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapterDurations, 0);
  objc_storeStrong((id *)&self->_chapterPositions, 0);
  objc_storeStrong((id *)&self->_audiobookDurations, 0);
  objc_storeStrong((id *)&self->_audiobookPositions, 0);
}

@end
