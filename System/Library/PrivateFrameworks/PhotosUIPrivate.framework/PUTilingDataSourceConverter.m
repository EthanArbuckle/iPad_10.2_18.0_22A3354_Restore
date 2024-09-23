@implementation PUTilingDataSourceConverter

- (BOOL)convertIndexPath:(id *)a3 tileKind:(id *)a4 fromDataSource:(id)a5 toDataSource:(id)a6
{
  id v6;
  void *v7;

  v6 = *a3;
  objc_msgSend(MEMORY[0x1E0CB36B0], "pu_rootIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v6, "isEqual:", v7);

  return (char)v6;
}

@end
