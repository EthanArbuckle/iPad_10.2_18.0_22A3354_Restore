@implementation PGKeyCuratorSubcluster

- (PGKeyCuratorSubcluster)initWithItems:(id)a3 keyItem:(id)a4 score:(double)a5 iconicScoreBucket:(unint64_t)a6
{
  id v10;
  PGKeyCuratorSubcluster *v11;
  PGKeyCuratorSubcluster *v12;
  objc_super v14;

  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGKeyCuratorSubcluster;
  v11 = -[PGKeyCuratorSubcluster init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_keyItem, a4);
    v12->_score = a5;
    v12->_iconicScoreBucket = a6;
  }

  return v12;
}

- (CLSInvestigationItem)keyItem
{
  return (CLSInvestigationItem *)objc_getProperty(self, a2, 8, 1);
}

- (double)score
{
  return self->_score;
}

- (unint64_t)iconicScoreBucket
{
  return self->_iconicScoreBucket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyItem, 0);
}

@end
