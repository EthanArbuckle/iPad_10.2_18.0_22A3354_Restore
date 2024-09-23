@implementation _UICollectionLayoutSolutionState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxillaryRangeIndexerKindDict, 0);
  objc_storeStrong((id *)&self->_preferredSizeGroupingIndexer, 0);
  objc_storeStrong((id *)&self->_itemRangeIndexer, 0);
  objc_storeStrong((id *)&self->_geometricIndexer, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
  objc_storeStrong((id *)&self->_sectionGeometryTranslator, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _UICollectionLayoutSectionGeometryTranslator *sectionGeometryTranslator;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sectionGeometryTranslator = self->_sectionGeometryTranslator;
  if (sectionGeometryTranslator)
  {
    x = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.origin.x;
    y = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.origin.y;
    width = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.size.width;
    height = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.size.height;
  }
  else
  {
    y = 0.0;
    width = 0.0;
    height = 0.0;
    x = 0.0;
  }
  NSStringFromCGRect(*(CGRect *)&x);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: contentFrameIncludingAuxiliaries=%@; bookmarks=%@>"),
    v5,
    self,
    v11,
    self->_bookmarks);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
