@implementation TSWReviewAnswerState

- (TSWReviewAnswerState)init
{
  TSWReviewAnswerState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWReviewAnswerState;
  result = -[TSWReviewAnswerState init](&v3, "init");
  if (result)
    result->mVersion = 0;
  return result;
}

- (TSWReviewAnswerState)initWithCoder:(id)a3
{
  TSWReviewAnswerState *v4;

  v4 = -[TSWReviewAnswerState init](self, "init");
  if (v4 && objc_msgSend(a3, "containsValueForKey:", CFSTR("TSWReviewAnswerStateVersion")))
    v4->mVersion = (unint64_t)objc_msgSend(objc_msgSend(a3, "valueForKey:", CFSTR("TSWReviewAnswerStateVersion")), "unsignedIntegerValue");
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hasUserSelected
{
  return 0;
}

@end
