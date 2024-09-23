@implementation CLHarvestScoredRequestArchive

- (CLHarvestScoredRequestArchive)initWithArchive:(id)a3 index:(unsigned int)a4
{
  CLHarvestScoredRequestArchive *v6;
  CLHarvestScoredRequestArchive *v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLHarvestScoredRequestArchive;
  v6 = -[CLHarvestScoredRequestArchive init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    -[CLHarvestScoredRequestArchive setArchive:](v6, "setArchive:", a3);
    LODWORD(v8) = 0;
    -[CLHarvestScoredRequestArchive setScore:](v7, "setScore:", v8);
    v7->_index = a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHarvestScoredRequestArchive;
  -[CLHarvestScoredRequestArchive dealloc](&v3, "dealloc");
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (CLHRequestArchive)archive
{
  return self->_archive;
}

- (void)setArchive:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unsigned)index
{
  return self->_index;
}

@end
