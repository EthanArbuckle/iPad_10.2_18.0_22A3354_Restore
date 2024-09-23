@implementation PXStoryColorGradingConfiguration

- (PXStoryColorGradingConfiguration)init
{
  return -[PXStoryColorGradingConfiguration initWithCubeInfos:](self, "initWithCubeInfos:", &unk_1E53EA428);
}

- (PXStoryColorGradingConfiguration)initWithCubeInfos:(id)a3
{
  id v5;
  PXStoryColorGradingConfiguration *v6;
  PXStoryColorGradingConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryColorGradingConfiguration;
  v6 = -[PXStoryColorGradingConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cubeInfos, a3);

  return v7;
}

- (unint64_t)count
{
  return -[NSArray count](self->_cubeInfos, "count");
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  void *v3;
  PXStoryColorGradingCubeInfo *v4;

  -[NSArray objectAtIndexedSubscript:](self->_cubeInfos, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXStoryColorGradingCubeInfo initWithDictionary:]([PXStoryColorGradingCubeInfo alloc], "initWithDictionary:", v3);

  return v4;
}

- (NSArray)cubeInfos
{
  return self->_cubeInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cubeInfos, 0);
}

@end
