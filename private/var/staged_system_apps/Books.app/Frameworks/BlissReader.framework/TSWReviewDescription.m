@implementation TSWReviewDescription

- (NSMutableArray)questionDescriptions
{
  return self->mQuestionDescriptions;
}

- (void)setQuestionDescriptions:(id)a3
{
  id v5;

  -[TSWReviewDescription willModify](self, "willModify");
  v5 = a3;

  self->mQuestionDescriptions = (NSMutableArray *)a3;
}

- (TSWPStorage)reviewQuestionNumberStyle
{
  return self->mQuestionNumberStyle;
}

- (void)setReviewQuestionNumberStyle:(id)a3
{
  id v5;

  -[TSWReviewDescription willModify](self, "willModify");
  v5 = a3;

  self->mQuestionNumberStyle = (TSWPStorage *)a3;
}

- (TSWReviewDescription)initWithContext:(id)a3
{
  TSWReviewDescription *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWReviewDescription;
  v3 = -[TSWReviewDescription initWithContext:](&v5, "initWithContext:", a3);
  if (v3)
    -[TSWReviewDescription setQuestionDescriptions:](v3, "setQuestionDescriptions:", +[NSMutableArray array](NSMutableArray, "array"));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->mQuestionDescriptions = 0;
  self->mQuestionNumberStyle = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWReviewDescription;
  -[TSWReviewDescription dealloc](&v3, "dealloc");
}

- (void)addQuestion:(id)a3
{
  -[NSMutableArray addObject:](-[TSWReviewDescription questionDescriptions](self, "questionDescriptions"), "addObject:", a3);
}

- (id)questionAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](-[TSWReviewDescription questionDescriptions](self, "questionDescriptions"), "objectAtIndex:", a3);
}

- (unint64_t)indexOfQuestion:(id)a3
{
  return (unint64_t)-[NSMutableArray indexOfObjectIdenticalTo:](-[TSWReviewDescription questionDescriptions](self, "questionDescriptions"), "indexOfObjectIdenticalTo:", a3);
}

- (int64_t)numberOfQuestions
{
  return (int64_t)-[NSMutableArray count](-[TSWReviewDescription questionDescriptions](self, "questionDescriptions"), "count");
}

@end
