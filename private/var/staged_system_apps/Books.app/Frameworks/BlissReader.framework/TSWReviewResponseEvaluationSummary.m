@implementation TSWReviewResponseEvaluationSummary

- (TSWReviewResponseEvaluationSummary)initWithScore:(id)a3 correctCount:(unint64_t)a4 incorrectCount:(unint64_t)a5 missingCount:(unint64_t)a6
{
  TSWReviewResponseEvaluationSummary *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSWReviewResponseEvaluationSummary;
  v10 = -[TSWReviewResponseEvaluationSummary init](&v12, "init");
  if (v10)
  {
    v10->_score = (NSDecimalNumber *)objc_msgSend(a3, "copy");
    v10->_correctCount = a4;
    v10->_incorrectCount = a5;
    v10->_missingCount = a6;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWReviewResponseEvaluationSummary;
  -[TSWReviewResponseEvaluationSummary dealloc](&v3, "dealloc");
}

- (unint64_t)questionCount
{
  return self->_incorrectCount + self->_correctCount + self->_missingCount;
}

- (NSDecimalNumber)score
{
  return self->_score;
}

- (unint64_t)correctCount
{
  return self->_correctCount;
}

- (unint64_t)incorrectCount
{
  return self->_incorrectCount;
}

- (unint64_t)missingCount
{
  return self->_missingCount;
}

@end
