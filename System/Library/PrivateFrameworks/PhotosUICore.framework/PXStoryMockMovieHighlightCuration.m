@implementation PXStoryMockMovieHighlightCuration

- (PXStoryMockMovieHighlightCuration)init
{
  return -[PXStoryMockMovieHighlightCuration initWithHighlights:fallback:summary:live:full:](self, "initWithHighlights:fallback:summary:live:full:", MEMORY[0x1E0C9AA60], 0, 0, 0, 0);
}

- (PXStoryMockMovieHighlightCuration)initWithMovieHighlights:(id)a3
{
  return -[PXStoryMockMovieHighlightCuration initWithHighlights:fallback:summary:live:full:](self, "initWithHighlights:fallback:summary:live:full:", a3, 0, 0, 0, 0);
}

- (PXStoryMockMovieHighlightCuration)initWithMovieSummary:(id)a3
{
  return -[PXStoryMockMovieHighlightCuration initWithHighlights:fallback:summary:live:full:](self, "initWithHighlights:fallback:summary:live:full:", MEMORY[0x1E0C9AA60], 0, a3, 0, 0);
}

- (PXStoryMockMovieHighlightCuration)initWithLivePhoto:(id)a3
{
  return -[PXStoryMockMovieHighlightCuration initWithHighlights:fallback:summary:live:full:](self, "initWithHighlights:fallback:summary:live:full:", MEMORY[0x1E0C9AA60], 0, 0, a3, 0);
}

- (PXStoryMockMovieHighlightCuration)initWithFullMovie:(id)a3
{
  return -[PXStoryMockMovieHighlightCuration initWithHighlights:fallback:summary:live:full:](self, "initWithHighlights:fallback:summary:live:full:", MEMORY[0x1E0C9AA60], 0, 0, 0, a3);
}

- (PXStoryMockMovieHighlightCuration)initWithHighlights:(id)a3 fallback:(id)a4 summary:(id)a5 live:(id)a6 full:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PXStoryMockMovieHighlightCuration *v17;
  uint64_t v18;
  NSArray *highlights;
  void *v21;
  id v22;
  objc_super v23;

  v13 = a3;
  v22 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMovieHighlight.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("highlights != nil"));

  }
  v23.receiver = self;
  v23.super_class = (Class)PXStoryMockMovieHighlightCuration;
  v17 = -[PXStoryMockMovieHighlightCuration init](&v23, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v13, "copy");
    highlights = v17->_highlights;
    v17->_highlights = (NSArray *)v18;

    objc_storeStrong((id *)&v17->_fallback, a4);
    objc_storeStrong((id *)&v17->_summary, a5);
    objc_storeStrong((id *)&v17->_live, a6);
    objc_storeStrong((id *)&v17->_movie, a7);
  }

  return v17;
}

- (NSArray)highlights
{
  return self->_highlights;
}

- (PXStoryMovieHighlight)bestHighlight
{
  NSArray *v2;
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
  v2 = self->_highlights;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        if (v5)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "qualityScore", (_QWORD)v14);
          v10 = v9;
          objc_msgSend(v5, "qualityScore");
          if (v10 <= v11)
            continue;
        }
        v12 = v8;

        v5 = v12;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
  return self->_summary;
}

- (PXStoryMovieHighlight)livePhoto
{
  return self->_live;
}

- (PXStoryMovieHighlight)fullMovie
{
  return self->_movie;
}

- (PXStoryMovieHighlight)defaultHighlight
{
  return self->_fallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallback, 0);
  objc_storeStrong((id *)&self->_movie, 0);
  objc_storeStrong((id *)&self->_live, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
}

@end
