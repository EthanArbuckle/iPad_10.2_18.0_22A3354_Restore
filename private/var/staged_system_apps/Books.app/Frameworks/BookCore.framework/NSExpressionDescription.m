@implementation NSExpressionDescription

+ (id)IMCoreDataObjectIDExpression
{
  NSExpressionDescription *v2;
  void *v3;

  v2 = objc_opt_new(NSExpressionDescription);
  -[NSExpressionDescription setName:](v2, "setName:", CFSTR("objectID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSExpression expressionForEvaluatedObject](NSExpression, "expressionForEvaluatedObject"));
  -[NSExpressionDescription setExpression:](v2, "setExpression:", v3);

  -[NSExpressionDescription setExpressionResultType:](v2, "setExpressionResultType:", 2000);
  return v2;
}

@end
