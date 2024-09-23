@implementation TSWReviewAnswerStateValueTransformer

+ (id)allowedTopLevelClasses
{
  uint64_t v3;

  v3 = objc_opt_class(TSWReviewAnswerState);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1);
}

@end
