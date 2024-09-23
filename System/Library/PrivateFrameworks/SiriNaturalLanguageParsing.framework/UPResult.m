@implementation UPResult

- (id)candidateAtRank:(int64_t)a3
{
  void *v5;

  if (-[NSArray count](self->__candidates, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->__candidates, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int64_t)candidateCount
{
  return -[NSArray count](self->__candidates, "count");
}

- (UPResultRootNode)rootNode
{
  void *v2;
  void *v3;
  void *v4;

  -[UPResult candidateAtRank:](self, "candidateAtRank:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "rootNodeRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (UPResultRootNode *)v4;
}

- (UPResult)initWithCandidates:(id)a3 queryUUID:(id)a4
{
  id v7;
  id v8;
  UPResult *v9;
  UPResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UPResult;
  v9 = -[UPResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->__candidates, a3);
    objc_storeStrong((id *)&v10->_queryUUID, a4);
  }

  return v10;
}

- (SIRINLUINTERNALUAAP_PARSERUaaPParserResponse)protobufRepresentation
{
  id v3;
  int64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0D9FAA8]);
  if (-[UPResult candidateCount](self, "candidateCount") >= 1)
  {
    v4 = 0;
    do
    {
      -[UPResult candidateAtRank:](self, "candidateAtRank:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "protobufRepresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "addHypotheses:", v6);
      ++v4;
    }
    while (-[UPResult candidateCount](self, "candidateCount") > v4);
  }
  return (SIRINLUINTERNALUAAP_PARSERUaaPParserResponse *)v3;
}

- (NSUUID)queryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)_candidates
{
  return self->__candidates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__candidates, 0);
  objc_storeStrong((id *)&self->_queryUUID, 0);
}

+ (id)createResultFromExistingResult:(id)a3 truncatedTo:(unint64_t)a4
{
  unint64_t v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  UPResult *v9;
  void *v10;
  UPResult *v11;
  id v12;
  UPResult *v13;

  if (a4)
  {
    v4 = a4;
    v5 = a3;
    v6 = objc_msgSend(v5, "candidateCount");
    if (v6 < v4)
      v4 = v6;
    objc_msgSend(v5, "_candidates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subarrayWithRange:", 0, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [UPResult alloc];
    objc_msgSend(v5, "queryUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[UPResult initWithCandidates:queryUUID:](v9, "initWithCandidates:queryUUID:", v8, v10);
  }
  else
  {
    v12 = a3;
    v13 = [UPResult alloc];
    objc_msgSend(v12, "queryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[UPResult initWithCandidates:queryUUID:](v13, "initWithCandidates:queryUUID:", MEMORY[0x1E0C9AA60], v8);
  }

  return v11;
}

@end
