@implementation WBSCyclerItemLeafRepresentation

- (id)copyWithZone:(_NSZone *)a3
{
  WBSCyclerItemLeafRepresentation *v4;
  void *v5;
  void *v6;
  WBSCyclerItemLeafRepresentation *v7;
  void *v8;

  v4 = [WBSCyclerItemLeafRepresentation alloc];
  -[WBSCyclerItemRepresentation title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCyclerItemRepresentation uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBSCyclerItemRepresentation initWithTitle:uniqueIdentifier:](v4, "initWithTitle:uniqueIdentifier:", v5, v6);

  -[WBSCyclerItemRepresentation extraAttributes](self, "extraAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCyclerItemRepresentation setExtraAttributes:](v7, "setExtraAttributes:", v8);

  return v7;
}

@end
