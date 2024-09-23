@implementation PGGraphMomentsInsertion

- (PGGraphMomentsInsertion)initWithMomentUUIDs:(id)a3
{
  id v5;
  PGGraphMomentsInsertion *v6;
  PGGraphMomentsInsertion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphMomentsInsertion;
  v6 = -[PGGraphMomentsInsertion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_momentUUIDs, a3);

  return v7;
}

- (PGGraphMomentsInsertion)initWithMoments:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PGGraphMomentsInsertion *v13;
  PGGraphMomentsInsertion *v14;
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
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v13 = -[PGGraphMomentsInsertion initWithMomentUUIDs:](self, "initWithMomentUUIDs:", v6);
  v14 = v13;
  if (v13)
    objc_storeStrong((id *)&v13->_moments, a3);

  return v14;
}

- (unint64_t)type
{
  return 1;
}

- (unint64_t)changeCount
{
  return -[NSSet count](self->_momentUUIDs, "count");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGGraphMomentsInsertion;
  -[PGGraphChange description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, momentUUIDs (%lu): %@"), v4, -[NSSet count](self->_momentUUIDs, "count"), self->_momentUUIDs);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSSet)momentUUIDs
{
  return self->_momentUUIDs;
}

- (NSSet)moments
{
  return self->_moments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moments, 0);
  objc_storeStrong((id *)&self->_momentUUIDs, 0);
}

@end
