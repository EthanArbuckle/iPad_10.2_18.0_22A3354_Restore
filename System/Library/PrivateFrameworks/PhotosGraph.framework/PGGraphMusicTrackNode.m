@implementation PGGraphMusicTrackNode

- (PGGraphMusicTrackNode)initWithTitle:(id)a3 durationInSeconds:(double)a4
{
  id v7;
  PGGraphMusicTrackNode *v8;
  PGGraphMusicTrackNode *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphMusicTrackNode;
  v8 = -[PGGraphNode init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_title, a3);
    v9->_durationInSeconds = a4;
  }

  return v9;
}

- (PGGraphMusicTrackNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  PGGraphMusicTrackNode *v11;

  v6 = a5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("durt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v11 = -[PGGraphMusicTrackNode initWithTitle:durationInSeconds:](self, "initWithTitle:durationInSeconds:", v7, v10);
  return v11;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  BOOL v10;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v10 = 0;
    if (!v6 || objc_msgSend(v6, "isEqual:", self->_title))
    {

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("durt"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
      if (!v8 || (objc_msgSend(v8, "doubleValue"), v9 == self->_durationInSeconds))
        v10 = 1;
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)propertyDictionary
{
  NSString *title;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  title = self->_title;
  v6[0] = CFSTR("name");
  v6[1] = CFSTR("durt");
  v7[0] = title;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_durationInSeconds);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("MusicTrack");
  return CFSTR("MusicTrack");
}

- (unsigned)domain
{
  return 1000;
}

- (void)enumerateAlbumNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("HAS_TRACK"), 1000, a3);
}

- (void)enumerateGenreNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("GENRE"), 1001, a3);
}

- (void)enumerateArtistNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("PERFORMED_BY_ARTIST"), 1000, a3);
}

- (NSSet)albumNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__PGGraphMusicTrackNode_albumNodes__block_invoke;
  v6[3] = &unk_1E8427EA8;
  v4 = v3;
  v7 = v4;
  -[PGGraphMusicTrackNode enumerateAlbumNodesUsingBlock:](self, "enumerateAlbumNodesUsingBlock:", v6);

  return (NSSet *)v4;
}

- (NSSet)genreNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__PGGraphMusicTrackNode_genreNodes__block_invoke;
  v6[3] = &unk_1E8427ED0;
  v4 = v3;
  v7 = v4;
  -[PGGraphMusicTrackNode enumerateGenreNodesUsingBlock:](self, "enumerateGenreNodesUsingBlock:", v6);

  return (NSSet *)v4;
}

- (NSSet)artistNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PGGraphMusicTrackNode_artistNodes__block_invoke;
  v6[3] = &unk_1E842BCC0;
  v4 = v3;
  v7 = v4;
  -[PGGraphMusicTrackNode enumerateArtistNodesUsingBlock:](self, "enumerateArtistNodesUsingBlock:", v6);

  return (NSSet *)v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[PGGraphMusicTrackNode artistNodes](self, "artistNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphMusicTrackNode albumNodes](self, "albumNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphMusicTrackNode durationInSeconds](self, "durationInSeconds");
  v8 = v7;
  -[PGGraphMusicTrackNode genreNodes](self, "genreNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v16), "label");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  objc_msgSend(v11, "sortUsingSelector:", sel_caseInsensitiveCompare_);
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB3940];
  -[PGGraphMusicTrackNode title](self, "title");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ (%lf seconds) | %@ | %@ | %@"), v20, v8, v21, v22, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (NSString)title
{
  return self->_title;
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

uint64_t __36__PGGraphMusicTrackNode_artistNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __35__PGGraphMusicTrackNode_genreNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __35__PGGraphMusicTrackNode_albumNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (NSArray)musicTrackTitleSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("title"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("durationInSeconds"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

@end
