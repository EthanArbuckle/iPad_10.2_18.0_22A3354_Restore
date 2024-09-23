@implementation MTBaseCollectionViewFlowLayout

- (void)setNumberOfColumns:(unint64_t)a3
{
  if (self->_numberOfColumns != a3)
    self->_numberOfColumns = a3;
}

- (void)setExpandedIndexPath:(id)a3
{
  NSIndexPath **p_expandedIndexPath;
  id v5;

  p_expandedIndexPath = &self->_expandedIndexPath;
  v5 = a3;
  if ((-[NSIndexPath isEqual:](*p_expandedIndexPath, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_expandedIndexPath, a3);

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (NSIndexPath)expandedIndexPath
{
  return self->_expandedIndexPath;
}

- (double)appliedYOffset
{
  return self->_appliedYOffset;
}

- (void)setAppliedYOffset:(double)a3
{
  self->_appliedYOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedIndexPath, 0);
}

@end
