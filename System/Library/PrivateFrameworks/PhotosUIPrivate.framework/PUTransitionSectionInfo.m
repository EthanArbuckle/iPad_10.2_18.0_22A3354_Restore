@implementation PUTransitionSectionInfo

- (PUTransitionSectionInfo)init
{
  PUTransitionSectionInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUTransitionSectionInfo;
  result = -[PUTransitionSectionInfo init](&v3, sel_init);
  if (result)
    result->_anchorShiftOffset = (PUGridCoordinates)vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PUTransitionSectionInfo;
  -[PUTransitionSectionInfo description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ \n  transitionSection: %ld\n  visualSections: %@\n  contiguousRows: %ld\n  anchorRealPath: %@\n  anchorShiftOffset: %ld,%ld\n  rowStartMarkers: %@"), v4, self->_transitionSection, self->_visualSections, self->_contiguousRows, self->_anchorRealPath, self->_anchorShiftOffset.row, self->_anchorShiftOffset.column, self->_visualRowStartMarkers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)transitionSection
{
  return self->_transitionSection;
}

- (void)setTransitionSection:(int64_t)a3
{
  self->_transitionSection = a3;
}

- (NSIndexSet)visualSections
{
  return self->_visualSections;
}

- (void)setVisualSections:(id)a3
{
  objc_storeStrong((id *)&self->_visualSections, a3);
}

- (NSArray)visualRowStartMarkers
{
  return self->_visualRowStartMarkers;
}

- (void)setVisualRowStartMarkers:(id)a3
{
  objc_storeStrong((id *)&self->_visualRowStartMarkers, a3);
}

- (int64_t)contiguousRows
{
  return self->_contiguousRows;
}

- (void)setContiguousRows:(int64_t)a3
{
  self->_contiguousRows = a3;
}

- (NSIndexPath)anchorRealPath
{
  return self->_anchorRealPath;
}

- (void)setAnchorRealPath:(id)a3
{
  objc_storeStrong((id *)&self->_anchorRealPath, a3);
}

- (PUGridCoordinates)anchorShiftOffset
{
  int64_t column;
  int64_t row;
  PUGridCoordinates result;

  column = self->_anchorShiftOffset.column;
  row = self->_anchorShiftOffset.row;
  result.column = column;
  result.row = row;
  return result;
}

- (void)setAnchorShiftOffset:(PUGridCoordinates)a3
{
  self->_anchorShiftOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorRealPath, 0);
  objc_storeStrong((id *)&self->_visualRowStartMarkers, 0);
  objc_storeStrong((id *)&self->_visualSections, 0);
}

@end
