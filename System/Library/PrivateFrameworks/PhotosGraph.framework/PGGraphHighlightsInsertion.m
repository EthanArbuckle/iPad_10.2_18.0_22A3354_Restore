@implementation PGGraphHighlightsInsertion

- (PGGraphHighlightsInsertion)initWithHighlightUUIDs:(id)a3
{
  id v5;
  PGGraphHighlightsInsertion *v6;
  PGGraphHighlightsInsertion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphHighlightsInsertion;
  v6 = -[PGGraphHighlightsInsertion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_highlightUUIDs, a3);

  return v7;
}

- (PGGraphHighlightsInsertion)initWithHighlights:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PGGraphHighlightsInsertion *v13;
  PGGraphHighlightsInsertion *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "uuid", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v13 = -[PGGraphHighlightsInsertion initWithHighlightUUIDs:](self, "initWithHighlightUUIDs:", v6);
  v14 = v13;
  if (v13)
    objc_storeStrong((id *)&v13->_highlights, a3);

  return v14;
}

- (unint64_t)type
{
  return 7;
}

- (unint64_t)changeCount
{
  return -[NSSet count](self->_highlightUUIDs, "count");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGGraphHighlightsInsertion;
  -[PGGraphChange description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [highlightUUIDs (%ld): %@"), v4, -[NSSet count](self->_highlightUUIDs, "count"), self->_highlightUUIDs);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSSet)highlightUUIDs
{
  return self->_highlightUUIDs;
}

- (NSSet)highlights
{
  return self->_highlights;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_storeStrong((id *)&self->_highlightUUIDs, 0);
}

@end
