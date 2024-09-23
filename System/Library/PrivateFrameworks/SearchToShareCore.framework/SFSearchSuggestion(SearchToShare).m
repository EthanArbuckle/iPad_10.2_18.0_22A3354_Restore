@implementation SFSearchSuggestion(SearchToShare)

- (void)setPrediction:()SearchToShare
{
  objc_setAssociatedObject(a1, sel_prediction, a3, (void *)1);
}

- (id)prediction
{
  return objc_getAssociatedObject(a1, sel_prediction);
}

@end
