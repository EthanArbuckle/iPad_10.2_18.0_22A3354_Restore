@implementation PGCuratedLibraryFTEMetricEvent

- (PGCuratedLibraryFTEMetricEvent)initWithLibrarySizeRange:(int64_t)a3 migrationDate:(id)a4
{
  id v7;
  PGCuratedLibraryFTEMetricEvent *v8;
  PGCuratedLibraryFTEMetricEvent *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PGCuratedLibraryFTEMetricEvent;
  v8 = -[PGCuratedLibraryFTEMetricEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_librarySizeRange = a3;
    objc_storeStrong((id *)&v8->_migrationDate, a4);
  }

  return v9;
}

- (id)identifier
{
  return CFSTR("com.apple.Photos.Intelligence.CuratedLibrary.FTE");
}

- (BOOL)shouldReportMetrics
{
  return 1;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  +[PGCuratedLibraryIntelligenceMetricEvent librarySizeRangeDescriptionForLibrarySizeRange:](PGCuratedLibraryIntelligenceMetricEvent, "librarySizeRangeDescriptionForLibrarySizeRange:", self->_librarySizeRange);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", self->_migrationDate);
  v8[0] = CFSTR("librarySizeRange");
  v8[1] = CFSTR("firstTimeExperienceDuration");
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_migrationDate, 0);
}

@end
