@implementation TSWReviewOrderedResponseEvaluator

- (id)evaluateBlockIfCorrect:(id)a3 blockIfIncorrect:(id)a4 blockIfMissing:(id)a5
{
  TSWReviewResponseEvaluatorDataSource *v8;
  TSWReviewResponse *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  NSDecimalNumber *v21;

  v8 = -[TSWReviewResponseEvaluator dataSource](self, "dataSource");
  v9 = -[TSWReviewResponseEvaluatorDataSource response](v8, "response");
  v10 = objc_opt_class(TSWReviewMatchingAnswerState);
  *(_QWORD *)&v11 = TSUDynamicCast(v10, -[TSWReviewResponse answerState](v9, "answerState")).n128_u64[0];
  v13 = v12;
  v14 = -[TSWReviewResponseEvaluatorDataSource choiceCount](v8, "choiceCount", v11);
  if (!v14)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
LABEL_21:
    v21 = +[NSDecimalNumber zero](NSDecimalNumber, "zero");
    return -[TSWReviewResponseEvaluationSummary initWithScore:correctCount:incorrectCount:missingCount:]([TSWReviewResponseEvaluationSummary alloc], "initWithScore:correctCount:incorrectCount:missingCount:", v21, v19, v18, v17);
  }
  v15 = v14;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  do
  {
    v20 = (char *)objc_msgSend(v13, "targetForPlacard:", v16);
    if (v20 == (char *)0x7FFFFFFFFFFFFFFFLL || v16 != v20)
    {
      if (v20 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        if (a5)
          (*((void (**)(id, uint64_t))a5 + 2))(a5, 0x7FFFFFFFFFFFFFFFLL);
        ++v17;
      }
      else
      {
        if (a4)
          (*((void (**)(id, char *))a4 + 2))(a4, v20);
        ++v18;
      }
    }
    else
    {
      if (a3)
        (*((void (**)(id, char *))a3 + 2))(a3, v16);
      ++v19;
    }
    ++v16;
  }
  while ((char *)v15 != v16);
  if (v19 < 1 || v18 || v17)
    goto LABEL_21;
  v21 = +[NSDecimalNumber one](NSDecimalNumber, "one");
  v18 = 0;
  return -[TSWReviewResponseEvaluationSummary initWithScore:correctCount:incorrectCount:missingCount:]([TSWReviewResponseEvaluationSummary alloc], "initWithScore:correctCount:incorrectCount:missingCount:", v21, v19, v18, v17);
}

@end
