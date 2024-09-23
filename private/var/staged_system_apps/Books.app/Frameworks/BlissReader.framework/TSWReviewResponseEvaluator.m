@implementation TSWReviewResponseEvaluator

+ (id)evaluate:(id)a3 blockIfCorrect:(id)a4 blockIfIncorrect:(id)a5 blockIfMissing:(id)a6
{
  id v10;
  id v11;

  v10 = objc_alloc_init((Class)objc_opt_class(a1));
  objc_msgSend(v10, "setDataSource:", a3);
  v11 = objc_msgSend(v10, "evaluateBlockIfCorrect:blockIfIncorrect:blockIfMissing:", a4, a5, a6);

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWReviewResponseEvaluator;
  -[TSWReviewResponseEvaluator dealloc](&v3, "dealloc");
}

- (id)evaluateBlockIfCorrect:(id)a3 blockIfIncorrect:(id)a4 blockIfMissing:(id)a5
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, a5), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWReviewResponseEvaluator evaluateBlockIfCorrect:blockIfIncorrect:blockIfMissing:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewResponseEvaluator.m"), 127, CFSTR("Please return an evaluator class from -evaluatorClass"));
  return 0;
}

- (TSWReviewResponseEvaluatorDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
