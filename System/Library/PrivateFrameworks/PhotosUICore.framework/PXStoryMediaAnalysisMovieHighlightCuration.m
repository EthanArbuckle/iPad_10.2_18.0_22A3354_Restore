@implementation PXStoryMediaAnalysisMovieHighlightCuration

- (PXStoryMediaAnalysisMovieHighlightCuration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMovieHighlight.m"), 944, CFSTR("%s is not available as initializer"), "-[PXStoryMediaAnalysisMovieHighlightCuration init]");

  abort();
}

- (PXStoryMediaAnalysisMovieHighlightCuration)initWithMediaAnalysis:(id)a3
{
  id v4;
  PXStoryMediaAnalysisMovieHighlightCuration *v5;
  uint64_t v6;
  NSDictionary *analysis;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryMediaAnalysisMovieHighlightCuration;
  v5 = -[PXStoryMediaAnalysisMovieHighlightCuration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    analysis = v5->_analysis;
    v5->_analysis = (NSDictionary *)v6;

  }
  return v5;
}

- (NSArray)highlights
{
  return (NSArray *)+[PXStoryMediaAnalysisMovieHighlight movieHighlightsFromMediaAnalysis:](PXStoryMediaAnalysisMovieHighlight, "movieHighlightsFromMediaAnalysis:", self->_analysis);
}

- (PXStoryMovieHighlight)bestHighlight
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  float v9;
  float v10;
  float v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXStoryMediaAnalysisMovieHighlightCuration highlights](self, "highlights", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "qualityScore");
        v10 = v9;
        objc_msgSend(v5, "qualityScore");
        if (v10 > v11)
        {
          v12 = v8;

          v5 = v12;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (PXStoryMovieHighlight *)v5;
}

- (PXStoryMovieHighlight)movieSummary
{
  return (PXStoryMovieHighlight *)+[PXStoryMediaAnalysisMovieHighlight movieSummaryFromMediaAnalysis:](PXStoryMediaAnalysisMovieHighlight, "movieSummaryFromMediaAnalysis:", self->_analysis);
}

- (PXStoryMovieHighlight)livePhoto
{
  return (PXStoryMovieHighlight *)+[PXStoryMediaAnalysisMovieHighlight livePhotoFromMediaAnalysis:](PXStoryMediaAnalysisMovieHighlight, "livePhotoFromMediaAnalysis:", self->_analysis);
}

- (PXStoryMovieHighlight)fullMovie
{
  return (PXStoryMovieHighlight *)+[PXStoryMediaAnalysisMovieHighlight fullMovieFromMediaAnalysis:](PXStoryMediaAnalysisMovieHighlight, "fullMovieFromMediaAnalysis:", self->_analysis);
}

- (PXStoryMovieHighlight)defaultHighlight
{
  return (PXStoryMovieHighlight *)+[PXStoryMediaAnalysisMovieHighlight defaultHighlightFromMediaAnalysis:](PXStoryMediaAnalysisMovieHighlight, "defaultHighlightFromMediaAnalysis:", self->_analysis);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
}

+ (id)movieHighlightCurationsFromMediaAnalysisResults:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PXStoryMediaAnalysisMovieHighlightCuration *v11;
  PXStoryMediaAnalysisMovieHighlightCuration *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [PXStoryMediaAnalysisMovieHighlightCuration alloc];
        v12 = -[PXStoryMediaAnalysisMovieHighlightCuration initWithMediaAnalysis:](v11, "initWithMediaAnalysis:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

@end
