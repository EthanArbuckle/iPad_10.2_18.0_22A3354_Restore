@implementation TSWReviewAssociativeAnswerState

- (void)dealloc
{
  objc_super v3;

  self->mChoicesForTarget = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWReviewAssociativeAnswerState;
  -[TSWReviewAssociativeAnswerState dealloc](&v3, "dealloc");
}

- (TSWReviewAssociativeAnswerState)initWithCoder:(id)a3
{
  TSWReviewAssociativeAnswerState *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSWReviewAssociativeAnswerState;
  v4 = -[TSWReviewAnswerState initWithCoder:](&v8, "initWithCoder:");
  if (v4)
  {
    v5 = objc_opt_class(NSDictionary);
    v6 = objc_opt_class(NSIndexSet);
    v4->mChoicesForTarget = (NSMutableDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, objc_opt_class(NSNumber), 0), CFSTR("TSWReviewAnswerStateChoicesForTarget"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWReviewAssociativeAnswerState;
  -[TSWReviewAnswerState encodeWithCoder:](&v5, "encodeWithCoder:");
  objc_msgSend(a3, "encodeObject:forKey:", self->mChoicesForTarget, CFSTR("TSWReviewAnswerStateChoicesForTarget"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)choicesForTargetIndex:(unint64_t)a3
{
  NSMutableDictionary *mChoicesForTarget;

  mChoicesForTarget = self->mChoicesForTarget;
  if (!mChoicesForTarget)
  {
    mChoicesForTarget = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->mChoicesForTarget = mChoicesForTarget;
  }
  return -[NSMutableDictionary objectForKey:](mChoicesForTarget, "objectForKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
}

- (void)setChoices:(id)a3 forTargetIndex:(unint64_t)a4
{
  -[NSMutableDictionary setObject:forKey:](self->mChoicesForTarget, "setObject:forKey:", a3, +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
}

@end
