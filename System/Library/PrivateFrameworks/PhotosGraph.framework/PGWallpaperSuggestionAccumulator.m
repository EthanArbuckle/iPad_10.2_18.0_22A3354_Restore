@implementation PGWallpaperSuggestionAccumulator

- (PGWallpaperSuggestionAccumulator)initWithTargetNumberOfSuggestions:(unint64_t)a3 targetMinimumNumberOfGatedSuggestions:(unint64_t)a4 maximumNumberOfSuggestionsToTryForGating:(unint64_t)a5 loggingConnection:(id)a6
{
  id v11;
  PGWallpaperSuggestionAccumulator *v12;
  PGWallpaperSuggestionAccumulator *v13;
  NSMutableArray *v14;
  NSMutableArray *suggestions;
  NSMutableArray *v16;
  NSMutableArray *gatingOverflow;
  objc_super v19;

  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PGWallpaperSuggestionAccumulator;
  v12 = -[PGWallpaperSuggestionAccumulator init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_targetNumberOfSuggestions = a3;
    v12->_targetMinimumNumberOfGatedSuggestions = a4;
    v12->_maximumNumberOfSuggestionsToTryForGating = a5;
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    suggestions = v13->_suggestions;
    v13->_suggestions = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    gatingOverflow = v13->_gatingOverflow;
    v13->_gatingOverflow = v16;

    objc_storeStrong((id *)&v13->_loggingConnection, a6);
  }

  return v13;
}

- (void)addSuggestion:(id)a3 passingGating:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableArray *suggestions;
  unint64_t v8;
  NSMutableArray *v9;
  unint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  const __CFString *v13;
  NSMutableArray *v14;
  NSObject *v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  NSMutableArray *v24;
  NSObject *v25;
  int v26;
  unint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSMutableArray *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  NSObject *loggingConnection;
  NSMutableArray *v36;
  unint64_t numberOfGatedSuggestions;
  unint64_t targetNumberOfSuggestions;
  unint64_t targetMinimumNumberOfGatedSuggestions;
  int v40;
  int v41;
  _BYTE v42[10];
  _BYTE v43[6];
  _BYTE v44[6];
  _BYTE v45[6];
  int v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v4 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  suggestions = self->_suggestions;
  if (v4)
  {
    -[NSMutableArray addObject:](suggestions, "addObject:", v6);
    ++self->_numberOfGatedSuggestions;
  }
  else
  {
    v8 = -[NSMutableArray count](suggestions, "count");
    v9 = self->_suggestions;
    if (v8 >= self->_targetNumberOfSuggestions
             - self->_targetMinimumNumberOfGatedSuggestions
             + self->_numberOfGatedSuggestions)
    {
      v28 = -[NSMutableArray count](v9, "count");
      if (-[NSMutableArray count](self->_gatingOverflow, "count") + v28 >= self->_targetNumberOfSuggestions)
      {
        loggingConnection = self->_loggingConnection;
        if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
          goto LABEL_20;
        v36 = self->_suggestions;
        v15 = loggingConnection;
        LODWORD(v36) = -[NSMutableArray count](v36, "count");
        numberOfGatedSuggestions = self->_numberOfGatedSuggestions;
        targetNumberOfSuggestions = self->_targetNumberOfSuggestions;
        targetMinimumNumberOfGatedSuggestions = self->_targetMinimumNumberOfGatedSuggestions;
        v40 = -[NSMutableArray count](self->_gatingOverflow, "count");
        v41 = 67110144;
        *(_DWORD *)v42 = (_DWORD)v36;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = targetNumberOfSuggestions;
        *(_WORD *)v43 = 1024;
        *(_DWORD *)&v43[2] = numberOfGatedSuggestions;
        *(_WORD *)v44 = 1024;
        *(_DWORD *)&v44[2] = targetMinimumNumberOfGatedSuggestions;
        *(_WORD *)v45 = 1024;
        *(_DWORD *)&v45[2] = v40;
        v21 = "[PGWallpaperSuggestionAccumulator] Dropping non-gated suggestion, %d / %d, gated %d / %d, overflow %d";
      }
      else
      {
        -[NSMutableArray addObject:](self->_gatingOverflow, "addObject:", v6);
        v29 = self->_loggingConnection;
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          goto LABEL_20;
        v30 = self->_suggestions;
        v15 = v29;
        LODWORD(v30) = -[NSMutableArray count](v30, "count");
        v31 = self->_numberOfGatedSuggestions;
        v32 = self->_targetNumberOfSuggestions;
        v33 = self->_targetMinimumNumberOfGatedSuggestions;
        v34 = -[NSMutableArray count](self->_gatingOverflow, "count");
        v41 = 67110144;
        *(_DWORD *)v42 = (_DWORD)v30;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = v32;
        *(_WORD *)v43 = 1024;
        *(_DWORD *)&v43[2] = v31;
        *(_WORD *)v44 = 1024;
        *(_DWORD *)&v44[2] = v33;
        *(_WORD *)v45 = 1024;
        *(_DWORD *)&v45[2] = v34;
        v21 = "[PGWallpaperSuggestionAccumulator] Sparing non-gated suggestion, %d / %d, gated %d / %d, overflow %d";
      }
      v22 = v15;
      v23 = 32;
LABEL_19:
      _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v41, v23);

      goto LABEL_20;
    }
    -[NSMutableArray addObject:](v9, "addObject:", v6);
  }
  v10 = self->_targetMinimumNumberOfGatedSuggestions;
  v11 = self->_loggingConnection;
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      if (v4)
        v13 = CFSTR("gated");
      else
        v13 = CFSTR("non-gated");
      v14 = self->_suggestions;
      v15 = v11;
      v16 = -[NSMutableArray count](v14, "count");
      v17 = self->_numberOfGatedSuggestions;
      v18 = self->_targetNumberOfSuggestions;
      v19 = self->_targetMinimumNumberOfGatedSuggestions;
      v20 = -[NSMutableArray count](self->_gatingOverflow, "count");
      v41 = 138413570;
      *(_QWORD *)v42 = v13;
      *(_WORD *)&v42[8] = 1024;
      *(_DWORD *)v43 = v16;
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)v44 = v18;
      *(_WORD *)&v44[4] = 1024;
      *(_DWORD *)v45 = v17;
      *(_WORD *)&v45[4] = 1024;
      v46 = v19;
      v47 = 1024;
      v48 = v20;
      v21 = "[PGWallpaperSuggestionAccumulator] Adding %@ suggestion, %d / %d, gated %d / %d, overflow %d";
      v22 = v15;
      v23 = 42;
      goto LABEL_19;
    }
  }
  else if (v12)
  {
    v24 = self->_suggestions;
    v25 = v11;
    v26 = -[NSMutableArray count](v24, "count");
    v27 = self->_targetNumberOfSuggestions;
    v41 = 67109376;
    *(_DWORD *)v42 = v26;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v27;
    _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, "[PGWallpaperSuggestionAccumulator] Adding suggestion, %d / %d", (uint8_t *)&v41, 0xEu);

  }
LABEL_20:
  ++self->_numberOfSuggestionsReceived;

}

- (BOOL)accumulationIsComplete
{
  uint64_t v4;

  if (-[NSMutableArray count](self->_suggestions, "count") >= self->_targetNumberOfSuggestions)
    return 1;
  if (self->_numberOfSuggestionsReceived < self->_maximumNumberOfSuggestionsToTryForGating)
    return 0;
  v4 = -[NSMutableArray count](self->_suggestions, "count");
  return -[NSMutableArray count](self->_gatingOverflow, "count") + v4 >= self->_targetNumberOfSuggestions;
}

- (NSArray)suggestions
{
  unint64_t targetNumberOfSuggestions;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSMutableArray *v8;
  void *v9;
  uint64_t v10;

  targetNumberOfSuggestions = self->_targetNumberOfSuggestions;
  v4 = -[NSMutableArray count](self->_suggestions, "count");
  v5 = targetNumberOfSuggestions - v4;
  if (targetNumberOfSuggestions != v4)
  {
    v6 = -[NSMutableArray count](self->_gatingOverflow, "count");
    if (v6)
    {
      v7 = v6;
      v8 = self->_gatingOverflow;
      v9 = v8;
      if (v7 > v5)
      {
        -[NSMutableArray subarrayWithRange:](v8, "subarrayWithRange:", 0, v5);
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v10;
      }
      -[NSMutableArray addObjectsFromArray:](self->_suggestions, "addObjectsFromArray:", v9);

    }
  }
  return (NSArray *)self->_suggestions;
}

- (unint64_t)numberOfGatedSuggestions
{
  return self->_numberOfGatedSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_gatingOverflow, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
