@implementation PGPotentialYearSummaryMemory

- (PGPotentialYearSummaryMemory)initWithMomentNodes:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PGPotentialYearSummaryMemory;
  return -[PGPotentialMemory initWithCategory:subcategory:momentNodes:sourceType:](&v4, sel_initWithCategory_subcategory_momentNodes_sourceType_, 201, 0, a3, 2);
}

- (unint64_t)memoryCategory
{
  return 8;
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  void *v3;
  void *v4;

  +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", self->_year, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureNodeCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)year
{
  return self->_year;
}

- (void)setYear:(int64_t)a3
{
  self->_year = a3;
}

@end
