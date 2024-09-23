@implementation PGOngoingTripMemoryGenerator

+ (unint64_t)memoryCategory
{
  return 31;
}

+ (unint64_t)memoryCategorySubcategory
{
  return 12003;
}

+ (id)tripTypeNodesInGraph:(id)a3
{
  return +[PGGraphHighlightTypeNodeCollection onGoingTripTypeNodesInGraph:](PGGraphHighlightTypeNodeCollection, "onGoingTripTypeNodesInGraph:", a3);
}

@end
