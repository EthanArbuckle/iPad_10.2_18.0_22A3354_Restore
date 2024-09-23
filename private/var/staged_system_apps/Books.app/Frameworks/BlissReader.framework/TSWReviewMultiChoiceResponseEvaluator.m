@implementation TSWReviewMultiChoiceResponseEvaluator

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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  double v21;
  NSDecimalNumber *v22;
  void (**v24)(void);

  v8 = -[TSWReviewResponseEvaluator dataSource](self, "dataSource");
  v9 = -[TSWReviewResponseEvaluatorDataSource response](v8, "response");
  v10 = objc_opt_class(TSWReviewMultiChoiceAnswerState);
  *(_QWORD *)&v11 = TSUDynamicCast(v10, -[TSWReviewResponse answerState](v9, "answerState")).n128_u64[0];
  v13 = v12;
  v14 = -[TSWReviewResponseEvaluatorDataSource choiceCount](v8, "choiceCount", v11);
  if (!v14)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
LABEL_22:
    v22 = +[NSDecimalNumber zero](NSDecimalNumber, "zero");
    return -[TSWReviewResponseEvaluationSummary initWithScore:correctCount:incorrectCount:missingCount:]([TSWReviewResponseEvaluationSummary alloc], "initWithScore:correctCount:incorrectCount:missingCount:", v22, v19, v18, v17);
  }
  v15 = v14;
  v24 = (void (**)(void))a5;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  do
  {
    v20 = objc_msgSend(objc_msgSend(v13, "selectedChoices"), "containsIndex:", v16);
    -[TSWReviewResponseEvaluatorDataSource fractionForChoiceIndex:](v8, "fractionForChoiceIndex:", v16);
    if (v20 && v21 > 0.0)
    {
      if (a3)
        (*((void (**)(id, uint64_t))a3 + 2))(a3, v16);
      ++v19;
    }
    else if (v20)
    {
      if (a4)
        (*((void (**)(id, uint64_t))a4 + 2))(a4, v16);
      ++v18;
    }
    else if (v21 > 0.0)
    {
      if (v24)
        v24[2]();
      ++v17;
    }
    ++v16;
  }
  while (v15 != v16);
  if (v19 < 1 || v18 || v17)
    goto LABEL_22;
  v22 = +[NSDecimalNumber one](NSDecimalNumber, "one");
  v18 = 0;
  return -[TSWReviewResponseEvaluationSummary initWithScore:correctCount:incorrectCount:missingCount:]([TSWReviewResponseEvaluationSummary alloc], "initWithScore:correctCount:incorrectCount:missingCount:", v22, v19, v18, v17);
}

@end
