@implementation _PASSqliteCollectionsConstraintPlanInfo

- (_PASSqliteCollectionsConstraintPlanInfo)initWithEstimatedRows:(double)a3 estimatedCost:(double)a4 unique:(BOOL)a5 omit:(BOOL)a6
{
  _PASSqliteCollectionsConstraintPlanInfo *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_PASSqliteCollectionsConstraintPlanInfo;
  result = -[_PASSqliteCollectionsConstraintPlanInfo init](&v11, sel_init);
  if (result)
  {
    result->_estimatedRows = a3;
    result->_estimatedCost = a4;
    result->_unique = a5;
    result->_omit = a6;
  }
  return result;
}

@end
