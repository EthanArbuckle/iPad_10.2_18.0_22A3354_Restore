@implementation PGUpNextHighlightBasedMatchingInfo

- (PGUpNextHighlightBasedMatchingInfo)initWithHighlightNodeAsCollection:(id)a3
{
  id v5;
  void *v6;
  PGUpNextHighlightBasedMatchingInfo *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(v5, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PGUpNextHighlightBasedMatchingInfo;
  v7 = -[PGUpNextMomentCollectionBasedMatchingInfo initWithMomentNodes:](&v9, sel_initWithMomentNodes_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_highlightNodeAsCollection, a3);

  return v7;
}

- (PGUpNextHighlightBasedMatchingInfo)initWithHighlightNodeAsCollection:(id)a3 momentNodes:(id)a4
{
  id v7;
  PGUpNextHighlightBasedMatchingInfo *v8;
  PGUpNextHighlightBasedMatchingInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGUpNextHighlightBasedMatchingInfo;
  v8 = -[PGUpNextMomentCollectionBasedMatchingInfo initWithMomentNodes:](&v11, sel_initWithMomentNodes_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_highlightNodeAsCollection, a3);

  return v9;
}

- (unint64_t)nodeIdentifier
{
  void *v2;
  unint64_t v3;

  -[MAElementCollection elementIdentifiers](self->_highlightNodeAsCollection, "elementIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "firstElement");

  return v3;
}

- (NSString)debugInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PGGraphHighlightNodeCollection uuids](self->_highlightNodeAsCollection, "uuids");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Highlight uuid %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (PGGraphHighlightNodeCollection)highlightNodeAsCollection
{
  return self->_highlightNodeAsCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightNodeAsCollection, 0);
}

+ (id)matchingInfosWithHighlightNodes:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphHighlightNode momentInHighlight](PGGraphHighlightNode, "momentInHighlight");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjacencyWithSources:relation:targetsClass:", v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PGUpNextHighlightBasedMatchingInfo_matchingInfosWithHighlightNodes___block_invoke;
  v12[3] = &unk_1E84346E8;
  v10 = v5;
  v13 = v10;
  objc_msgSend(v9, "enumerateTargetsBySourceWithBlock:", v12);

  return v10;
}

void __70__PGUpNextHighlightBasedMatchingInfo_matchingInfosWithHighlightNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PGUpNextHighlightBasedMatchingInfo *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[PGUpNextHighlightBasedMatchingInfo initWithHighlightNodeAsCollection:momentNodes:]([PGUpNextHighlightBasedMatchingInfo alloc], "initWithHighlightNodeAsCollection:momentNodes:", v6, v5);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
}

@end
