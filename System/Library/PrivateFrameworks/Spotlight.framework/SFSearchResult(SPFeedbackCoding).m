@implementation SFSearchResult(SPFeedbackCoding)

- (id)replacementObjectForCoder:()SPFeedbackCoding
{
  id v1;

  if (runningInSpotlight)
  {
    objc_msgSend(a1, "objectForFeedback");
    v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = a1;
  }
  return v1;
}

@end
