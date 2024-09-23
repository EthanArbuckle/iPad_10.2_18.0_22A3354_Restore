@implementation TYCharacterCluster

- (TYCharacterCluster)initWithCharacters:(id)a3 isCursive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  TYCharacterCluster *v7;
  TYCharacterCluster *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TYCharacterCluster;
  v7 = -[TYCharacterCluster init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[TYCharacterCluster setCharacterCluster:](v7, "setCharacterCluster:", v6);
    -[TYCharacterCluster setIsCursive:](v8, "setIsCursive:", v4);
  }

  return v8;
}

- (NSString)characterCluster
{
  return self->_characterCluster;
}

- (void)setCharacterCluster:(id)a3
{
  objc_storeStrong((id *)&self->_characterCluster, a3);
}

- (BOOL)isCursive
{
  return self->_isCursive;
}

- (void)setIsCursive:(BOOL)a3
{
  self->_isCursive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterCluster, 0);
}

@end
