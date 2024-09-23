@implementation PGGraphCelebratingEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

- (PGGraphHolidayNodeCollection)holidayNodes
{
  return (PGGraphHolidayNodeCollection *)+[MANodeCollection targetNodesOfEdges:](PGGraphHolidayNodeCollection, "targetNodesOfEdges:", self);
}

@end
