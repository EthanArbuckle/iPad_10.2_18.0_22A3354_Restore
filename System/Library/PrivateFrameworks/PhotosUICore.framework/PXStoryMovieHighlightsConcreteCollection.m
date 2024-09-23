@implementation PXStoryMovieHighlightsConcreteCollection

- (PXStoryMovieHighlightsConcreteCollection)init
{
  PXStoryMovieHighlightsConcreteCollection *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *highlightsByAssetId;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryMovieHighlightsConcreteCollection;
  v2 = -[PXStoryMovieHighlightsConcreteCollection init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    highlightsByAssetId = v2->_highlightsByAssetId;
    v2->_highlightsByAssetId = v3;

  }
  return v2;
}

- (int64_t)count
{
  return -[NSMutableDictionary count](self->_highlightsByAssetId, "count");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p count:%lu>"), objc_opt_class(), self, -[PXStoryMovieHighlightsConcreteCollection count](self, "count"));
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p count:%lu highlights: %@>"), objc_opt_class(), self, -[PXStoryMovieHighlightsConcreteCollection count](self, "count"), self->_highlightsByAssetId);
}

- (NSString)diagnosticDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-- %lu Movie Highlights --\n\n%@\n"), -[PXStoryMovieHighlightsConcreteCollection count](self, "count"), self->_highlightsByAssetId);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXStoryMovieHighlightsConcreteCollection *v5;
  uint64_t v6;
  NSMutableDictionary *highlightsByAssetId;

  v5 = +[PXStoryMovieHighlightsConcreteCollection allocWithZone:](PXStoryMovieHighlightsConcreteCollection, "allocWithZone:");
  v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_highlightsByAssetId, "mutableCopyWithZone:", a3);
  highlightsByAssetId = v5->_highlightsByAssetId;
  v5->_highlightsByAssetId = (NSMutableDictionary *)v6;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PXStoryMovieHighlightsConcreteMutableCollection *v5;
  uint64_t v6;
  NSMutableDictionary *highlightsByAssetId;

  v5 = +[PXStoryMovieHighlightsConcreteMutableCollection allocWithZone:](PXStoryMovieHighlightsConcreteMutableCollection, "allocWithZone:");
  v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_highlightsByAssetId, "mutableCopyWithZone:", a3);
  highlightsByAssetId = v5->super._highlightsByAssetId;
  v5->super._highlightsByAssetId = (NSMutableDictionary *)v6;

  return v5;
}

- (id)movieHighlightsForDisplayAsset:(id)a3
{
  NSMutableDictionary *highlightsByAssetId;
  void *v4;
  void *v5;

  highlightsByAssetId = self->_highlightsByAssetId;
  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](highlightsByAssetId, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightsByAssetId, 0);
}

@end
