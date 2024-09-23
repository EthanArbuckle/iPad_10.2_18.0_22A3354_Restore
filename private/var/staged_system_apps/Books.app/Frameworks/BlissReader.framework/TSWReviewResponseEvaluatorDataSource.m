@implementation TSWReviewResponseEvaluatorDataSource

- (TSWReviewResponseEvaluatorDataSource)initWithResponse:(id)a3
{
  TSWReviewResponseEvaluatorDataSource *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWReviewResponseEvaluatorDataSource;
  v4 = -[TSWReviewResponseEvaluatorDataSource init](&v6, "init");
  if (v4)
  {
    v4->_response = (TSWReviewResponse *)a3;
    v4->_fractions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWReviewResponseEvaluatorDataSource;
  -[TSWReviewResponseEvaluatorDataSource dealloc](&v3, "dealloc");
}

- (void)addFraction:(double)a3
{
  *(float *)&a3 = a3;
  -[NSMutableArray addObject:](self->_fractions, "addObject:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", a3));
}

- (unint64_t)choiceCount
{
  return (unint64_t)-[NSMutableArray count](self->_fractions, "count");
}

- (double)fractionForChoiceIndex:(unint64_t)a3
{
  id v5;
  double result;
  float v7;

  v5 = -[NSMutableArray count](self->_fractions, "count");
  result = 0.0;
  if ((unint64_t)v5 > a3)
  {
    objc_msgSend(-[NSMutableArray objectAtIndex:](self->_fractions, "objectAtIndex:", a3, 0.0), "floatValue");
    return v7;
  }
  return result;
}

- (TSWReviewResponse)response
{
  return self->_response;
}

- (NSMutableArray)fractions
{
  return self->_fractions;
}

@end
