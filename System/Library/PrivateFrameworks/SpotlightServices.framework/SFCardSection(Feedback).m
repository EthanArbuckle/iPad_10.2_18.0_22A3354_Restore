@implementation SFCardSection(Feedback)

- (id)copyForFeedback
{
  void *v1;

  objc_msgSend(a1, "nextCard");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
    return (id)objc_msgSend(a1, "copy");
  else
    return a1;
}

@end
