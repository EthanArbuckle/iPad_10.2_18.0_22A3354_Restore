@implementation TSWReviewMultiChoiceAnswerState

- (void)dealloc
{
  objc_super v3;

  self->mSelectedChoices = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWReviewMultiChoiceAnswerState;
  -[TSWReviewMultiChoiceAnswerState dealloc](&v3, "dealloc");
}

- (TSWReviewMultiChoiceAnswerState)initWithCoder:(id)a3
{
  TSWReviewMultiChoiceAnswerState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWReviewMultiChoiceAnswerState;
  v4 = -[TSWReviewAnswerState initWithCoder:](&v6, "initWithCoder:");
  if (v4)
    v4->mSelectedChoices = (NSIndexSet *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSIndexSet), CFSTR("TSWReviewAnswerStateSelectedChoices"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWReviewMultiChoiceAnswerState;
  -[TSWReviewAnswerState encodeWithCoder:](&v5, "encodeWithCoder:");
  objc_msgSend(a3, "encodeObject:forKey:", self->mSelectedChoices, CFSTR("TSWReviewAnswerStateSelectedChoices"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSIndexSet)selectedChoices
{
  NSIndexSet *result;

  result = self->mSelectedChoices;
  if (!result)
  {
    result = (NSIndexSet *)objc_alloc_init((Class)NSIndexSet);
    self->mSelectedChoices = result;
  }
  return result;
}

- (BOOL)hasUserSelected
{
  return -[NSIndexSet count](self->mSelectedChoices, "count") != 0;
}

- (void)setSelectedChoices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
