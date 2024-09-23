@implementation PXStoryChapterSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryChapterSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXStoryChapterSettings setChapterCollectionProducerKind:](self, "setChapterCollectionProducerKind:", 1);
  -[PXStoryChapterSettings setDummyChaptersDayInterval:](self, "setDummyChaptersDayInterval:", 1);
  -[PXStoryChapterSettings setDummyChaptersCountInterval:](self, "setDummyChaptersCountInterval:", 4);
  -[PXStoryChapterSettings setDummyChaptersIncludeSubtitles:](self, "setDummyChaptersIncludeSubtitles:", 0);
}

- (void)setDummyChaptersIncludeSubtitles:(BOOL)a3
{
  self->_dummyChaptersIncludeSubtitles = a3;
}

- (void)setDummyChaptersDayInterval:(int64_t)a3
{
  self->_dummyChaptersDayInterval = a3;
}

- (void)setDummyChaptersCountInterval:(int64_t)a3
{
  self->_dummyChaptersCountInterval = a3;
}

- (void)setChapterCollectionProducerKind:(int64_t)a3
{
  self->_chapterCollectionProducerKind = a3;
}

- (id)parentSettings
{
  return +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
}

- (int64_t)chapterCollectionProducerKind
{
  return self->_chapterCollectionProducerKind;
}

- (int64_t)dummyChaptersDayInterval
{
  return self->_dummyChaptersDayInterval;
}

- (int64_t)dummyChaptersCountInterval
{
  return self->_dummyChaptersCountInterval;
}

- (BOOL)dummyChaptersIncludeSubtitles
{
  return self->_dummyChaptersIncludeSubtitles;
}

+ (PXStoryChapterSettings)sharedInstance
{
  if (sharedInstance_onceToken_53733 != -1)
    dispatch_once(&sharedInstance_onceToken_53733, &__block_literal_global_53734);
  return (PXStoryChapterSettings *)(id)sharedInstance_sharedInstance_53735;
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  _QWORD v39[4];

  v39[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83018];
  NSStringFromSelector(sel_chapterCollectionProducerKind);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Kind"), v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "possibleValues:titles:", &unk_1E53E8E68, &unk_1E53E8E80);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v35;
  v4 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_dummyChaptersDayInterval);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Day Interval"), v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "minValue:maxValue:", 1.0, 30.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "px_increment:", 1.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_chapterCollectionProducerKind);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %li"), v31, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "condition:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v28;
  v6 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_dummyChaptersCountInterval);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Count Interval"), v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "minValue:maxValue:", 1.0, 30.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "px_increment:", 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_chapterCollectionProducerKind);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("%K == %li"), v24, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "condition:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v21;
  v8 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_dummyChaptersIncludeSubtitles);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Subtitles"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3880];
  NSStringFromSelector(sel_chapterCollectionProducerKind);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("%K != %li"), v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "condition:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v15, CFSTR("Settings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v16;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleWithTitle:contents:", CFSTR("Chapters"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __40__PXStoryChapterSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chapterSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_53735;
  sharedInstance_sharedInstance_53735 = v0;

}

@end
