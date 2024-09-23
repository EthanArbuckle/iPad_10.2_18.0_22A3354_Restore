@implementation TSWReviewChoiceDescription

- (NSString)choiceAlternateText
{
  return self->mAlternateText;
}

- (void)setChoiceAlternateText:(id)a3
{
  id v5;

  -[TSWReviewChoiceDescription willModify](self, "willModify");
  v5 = a3;

  self->mAlternateText = (NSString *)a3;
}

- (NSString)choiceTargetAlternateText
{
  return self->mTargetAlternateText;
}

- (void)setChoiceTargetAlternateText:(id)a3
{
  id v5;

  -[TSWReviewChoiceDescription willModify](self, "willModify");
  v5 = a3;

  self->mTargetAlternateText = (NSString *)a3;
}

- (NSString)choiceFeedback
{
  return self->mFeedback;
}

- (void)setChoiceFeedback:(id)a3
{
  id v5;

  -[TSWReviewChoiceDescription willModify](self, "willModify");
  v5 = a3;

  self->mFeedback = (NSString *)a3;
}

- (BOOL)choiceFixed
{
  return self->mFixed;
}

- (void)setChoiceFixed:(BOOL)a3
{
  -[TSWReviewChoiceDescription willModify](self, "willModify");
  self->mFixed = a3;
}

- (float)choiceFraction
{
  return self->mFraction;
}

- (void)setChoiceFraction:(float)a3
{
  -[TSWReviewChoiceDescription willModify](self, "willModify");
  self->mFraction = a3;
}

- (TSPObject)choiceContent
{
  return self->mContent;
}

- (void)setChoiceContent:(id)a3
{
  id v5;

  -[TSWReviewChoiceDescription willModify](self, "willModify");
  v5 = a3;

  self->mContent = (TSPObject *)a3;
}

- (NSString)choiceContentType
{
  return self->mContentType;
}

- (void)setChoiceContentType:(id)a3
{
  id v5;

  -[TSWReviewChoiceDescription willModify](self, "willModify");
  v5 = a3;

  self->mContentType = (NSString *)a3;
}

- (int)choicePlacardPlacementHint
{
  return self->mPlacardPlacementHint;
}

- (void)setChoicePlacardPlacementHint:(int)a3
{
  -[TSWReviewChoiceDescription willModify](self, "willModify");
  self->mPlacardPlacementHint = a3;
}

- (TSDBezierPath)choiceTargetRegion
{
  return self->mTargetRegion;
}

- (void)setChoiceTargetRegion:(id)a3
{
  id v5;

  -[TSWReviewChoiceDescription willModify](self, "willModify");
  v5 = a3;

  self->mTargetRegion = (TSDBezierPath *)a3;
}

- (TSWReviewChoiceDescription)initWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWReviewChoiceDescription;
  return -[TSWReviewChoiceDescription initWithContext:](&v4, "initWithContext:", a3);
}

+ (id)createChoiceDescriptionForQuestionType:(id)a3 withContext:(id)a4
{
  id result;

  if ((objc_msgSend(a3, "isEqualToString:", TSWReviewQuestionDescriptionTypeMultiChoiceValue) & 1) == 0
    && (objc_msgSend(a3, "isEqualToString:", TSWReviewQuestionDescriptionTypeMultiChoiceImageValue) & 1) == 0
    && (objc_msgSend(a3, "isEqualToString:", TSWReviewQuestionDescriptionTypeAssociativeTokenValue) & 1) == 0
    && !objc_msgSend(a3, "isEqualToString:", TSWReviewQuestionDescriptionTypeAssociativeImageValue)
    || (result = -[TSWReviewChoiceDescription initWithContext:]([TSWReviewChoiceDescription alloc], "initWithContext:", a4)) == 0)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSWReviewChoiceDescription createChoiceDescriptionForQuestionType:withContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewChoiceDescription.m"), 84, CFSTR("Unknown question type: %@"), a3);
    return 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->mAlternateText = 0;
  self->mTargetAlternateText = 0;

  self->mFeedback = 0;
  self->mContent = 0;

  self->mContentType = 0;
  self->mTargetRegion = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWReviewChoiceDescription;
  -[TSWReviewChoiceDescription dealloc](&v3, "dealloc");
}

@end
