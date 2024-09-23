@implementation PDChartBuild

- (PDChartBuild)initWithBuildType:(int)a3
{
  PDChartBuild *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PDChartBuild;
  result = -[PDBuild init](&v5, sel_init);
  if (result)
    result->mChartBuildType = a3;
  return result;
}

- (int)type
{
  return self->mChartBuildType;
}

- (void)setType:(int)a3
{
  self->mChartBuildType = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int mChartBuildType;
  int v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  v5 = objc_opt_class();
  TSUDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6
    && (mChartBuildType = self->mChartBuildType, v9 = objc_msgSend(v6, "type"), v7, mChartBuildType == v9))
  {
    v12.receiver = self;
    v12.super_class = (Class)PDChartBuild;
    v10 = -[PDBuild isEqual:](&v12, sel_isEqual_, v4);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t mChartBuildType;
  objc_super v4;

  mChartBuildType = self->mChartBuildType;
  v4.receiver = self;
  v4.super_class = (Class)PDChartBuild;
  return -[PDBuild hash](&v4, sel_hash) ^ mChartBuildType;
}

@end
