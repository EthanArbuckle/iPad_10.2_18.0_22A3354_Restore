@implementation PGGraphMusicSessionNode

- (PGGraphMusicSessionNode)initWithLocalStartDate:(id)a3 localEndDate:(id)a4
{
  id v7;
  id v8;
  PGGraphMusicSessionNode *v9;
  PGGraphMusicSessionNode *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphMusicSessionNode;
  v9 = -[PGGraphNode init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localStartDate, a3);
    objc_storeStrong((id *)&v10->_localEndDate, a4);
  }

  return v10;
}

- (PGGraphMusicSessionNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  PGGraphMusicSessionNode *v15;

  v6 = a5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tzs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tze"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PGGraphMusicSessionNode initWithLocalStartDate:localEndDate:](self, "initWithLocalStartDate:localEndDate:", v10, v14);

  return v15;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tzs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      v9 = v8;
      -[NSDate timeIntervalSince1970](self->_localStartDate, "timeIntervalSince1970");
      if (v9 != v10)
        goto LABEL_7;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tze"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (!v11
      || (objc_msgSend(v11, "doubleValue"),
          v13 = v12,
          -[NSDate timeIntervalSince1970](self->_localEndDate, "timeIntervalSince1970"),
          v13 == v14))
    {
      v15 = 1;
    }
    else
    {
LABEL_7:
      v15 = 0;
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (id)propertyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("tzs");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSince1970](self->_localStartDate, "timeIntervalSince1970");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("tze");
  v10[0] = v4;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSince1970](self->_localEndDate, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGGraphMusicSessionNode;
  -[PGGraphOptimizedNode description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@, %@)"), v4, self->_localStartDate, self->_localEndDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("MusicSession");
  return CFSTR("MusicSession");
}

- (unsigned)domain
{
  return 1000;
}

- (id)momentNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__PGGraphMusicSessionNode_momentNodes__block_invoke;
  v6[3] = &unk_1E8436408;
  v4 = v3;
  v7 = v4;
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("MUSIC_SESSION"), 1000, v6);

  return v4;
}

- (NSSet)trackNodes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__PGGraphMusicSessionNode_trackNodes__block_invoke;
  v6[3] = &unk_1E842D240;
  v4 = v3;
  v7 = v4;
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("PLAYS_TRACK"), 1000, v6);

  return (NSSet *)v4;
}

- (void)enumerateMusicTrackNodesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PGGraphMusicSessionNode_enumerateMusicTrackNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E842D268;
  v7 = v4;
  v5 = v4;
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("PLAYS_TRACK"), 1000, v6);

}

- (NSDate)localStartDate
{
  return self->_localStartDate;
}

- (NSDate)localEndDate
{
  return self->_localEndDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
}

uint64_t __62__PGGraphMusicSessionNode_enumerateMusicTrackNodesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __37__PGGraphMusicSessionNode_trackNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __38__PGGraphMusicSessionNode_momentNodes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (NSArray)musicSessionDateSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localStartDate"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localEndDate"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (id)momentOfMusicSession
{
  void *v2;
  void *v3;

  +[PGGraphMusicEdge filter](PGGraphMusicEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
