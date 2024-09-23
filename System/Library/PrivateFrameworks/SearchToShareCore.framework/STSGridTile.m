@implementation STSGridTile

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)STSGridTile;
  -[STSGridTile description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSGridTile smallIndexes](self, "smallIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSGridTile largeIndex](self, "largeIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, smallIndexes: %@, largeIndex: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)smallIndexes
{
  return self->_smallIndexes;
}

- (void)setSmallIndexes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)largeIndex
{
  return self->_largeIndex;
}

- (void)setLargeIndex:(id)a3
{
  objc_storeStrong((id *)&self->_largeIndex, a3);
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeIndex, 0);
  objc_storeStrong((id *)&self->_smallIndexes, 0);
}

@end
