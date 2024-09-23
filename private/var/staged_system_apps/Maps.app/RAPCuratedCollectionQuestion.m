@implementation RAPCuratedCollectionQuestion

- (RAPCuratedCollectionQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  id v6;
  RAPCuratedCollectionQuestion *v7;
  RAPCommentQuestion *v8;
  RAPCommentQuestion *commentQuestion;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RAPCuratedCollectionQuestion;
  v7 = -[RAPQuestion initWithReport:parentQuestion:](&v11, "initWithReport:parentQuestion:", v6, a4);
  if (v7)
  {
    v8 = -[RAPCommentQuestion initWithReport:parentQuestion:]([RAPCommentQuestion alloc], "initWithReport:parentQuestion:", v6, v7);
    commentQuestion = v7->_commentQuestion;
    v7->_commentQuestion = v8;

    -[RAPCommentQuestion setEmphasis:](v7->_commentQuestion, "setEmphasis:", 3);
    -[RAPQuestion addObserver:changeHandler:](v7->_commentQuestion, "addObserver:changeHandler:", v7, &stru_1011E7730);
  }

  return v7;
}

- (id)placeCollection
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "curatedCollectionContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "curatedCollection"));

  return v4;
}

- (NSArray)categoryItems
{
  NSArray *categoryItems;
  NSArray *v3;
  void *v5;
  RAPCuratedCollectionCategoryItem *v6;
  RAPCuratedCollectionCategoryItem *v7;
  RAPCuratedCollectionCategoryItem *v8;
  RAPCuratedCollectionCategoryItem *v9;
  NSArray *v10;
  NSArray *v11;

  categoryItems = self->_categoryItems;
  if (categoryItems)
  {
    v3 = categoryItems;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v6 = -[RAPCuratedCollectionCategoryItem initWithType:]([RAPCuratedCollectionCategoryItem alloc], "initWithType:", 1);
    objc_msgSend(v5, "addObject:", v6);

    v7 = -[RAPCuratedCollectionCategoryItem initWithType:]([RAPCuratedCollectionCategoryItem alloc], "initWithType:", 2);
    objc_msgSend(v5, "addObject:", v7);

    v8 = -[RAPCuratedCollectionCategoryItem initWithType:]([RAPCuratedCollectionCategoryItem alloc], "initWithType:", 3);
    objc_msgSend(v5, "addObject:", v8);

    v9 = -[RAPCuratedCollectionCategoryItem initWithType:]([RAPCuratedCollectionCategoryItem alloc], "initWithType:", 4);
    objc_msgSend(v5, "addObject:", v9);

    v10 = (NSArray *)objc_msgSend(v5, "copy");
    v11 = self->_categoryItems;
    self->_categoryItems = v10;

    v3 = self->_categoryItems;
  }
  return v3;
}

- (BOOL)isComplete
{
  unint64_t selectedQuestionType;
  BOOL v3;
  uint64_t v4;

  selectedQuestionType = self->_selectedQuestionType;
  v3 = selectedQuestionType > 4;
  v4 = (1 << selectedQuestionType) & 0x16;
  if (v3 || v4 == 0)
    return 0;
  else
    return -[RAPQuestion isComplete](self->_commentQuestion, "isComplete");
}

- (void)setSelectedQuestionType:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;

  if (self->_selectedQuestionType != a3)
  {
    self->_selectedQuestionType = a3;
    switch(a3)
    {
      case 1uLL:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v5 = v4;
        v6 = CFSTR("Broken Link [Brooklyn RAP]");
        goto LABEL_8;
      case 2uLL:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v5 = v4;
        v6 = CFSTR("Inaccurate Description [Brooklyn RAP]");
        goto LABEL_8;
      case 3uLL:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v5 = v4;
        v6 = CFSTR("Inaccurate Place Details Description [Brooklyn RAP]");
        goto LABEL_8;
      case 4uLL:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v5 = v4;
        v6 = CFSTR("Other Description[Brooklyn RAP]");
LABEL_8:
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

        -[RAPCommentQuestion _setPlaceholderText:](self->_commentQuestion, "_setPlaceholderText:", v10);
        break;
      default:
        v10 = &stru_1011EB268;
        -[RAPCommentQuestion _setPlaceholderText:](self->_commentQuestion, "_setPlaceholderText:", &stru_1011EB268);
        break;
    }
    -[RAPCommentQuestion setComment:](self->_commentQuestion, "setComment:", &stru_1011EB268);
    if (-[RAPCuratedCollectionQuestion _selectedCorrectionType](self, "_selectedCorrectionType"))
    {
      v7 = -[RAPCuratedCollectionQuestion analyticTarget](self, "analyticTarget");
      v8 = -[RAPCuratedCollectionQuestion _selectedCorrectionType](self, "_selectedCorrectionType");
      if (v8 >= 4)
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v8));
      else
        v9 = off_1011E7750[(int)v8];
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 232, v7, v9);

    }
  }
}

- (int)_selectedCorrectionType
{
  unint64_t v2;

  v2 = -[RAPCuratedCollectionQuestion selectedQuestionType](self, "selectedQuestionType");
  if (v2 - 1 > 3)
    return 0;
  else
    return dword_100E3F140[v2 - 1];
}

- (void)_fillSubmissionParameters:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "details"));

  if (!v4)
  {
    v5 = objc_alloc_init((Class)GEORPFeedbackDetails);
    objc_msgSend(v20, "setDetails:", v5);

  }
  if ((id)-[RAPCuratedCollectionQuestion selectedQuestionType](self, "selectedQuestionType") == (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "details"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "poiFeedback"));

    if (!v7)
    {
      v8 = objc_alloc_init((Class)GEORPPoiFeedback);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "details"));
      objc_msgSend(v9, "setPoiFeedback:", v8);

    }
    v10 = (id)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "curatedCollectionContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geoContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "details"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "poiFeedback"));
    objc_msgSend(v14, "setPoiCuratedCollectionContext:", v12);

  }
  else
  {
    objc_msgSend(v20, "setType:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "details"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "curatedCollectionFeedback"));

    if (!v10)
    {
      v10 = objc_alloc_init((Class)GEORPCuratedCollectionFeedback);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "details"));
      objc_msgSend(v16, "setCuratedCollectionFeedback:", v10);

    }
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "curatedCollectionCorrections"));
    if (!v11)
    {
      v11 = objc_alloc_init((Class)GEORPCuratedCollectionCorrections);
      objc_msgSend(v10, "setCuratedCollectionCorrections:", v11);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "curatedCollectionContext"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "geoContext"));
    objc_msgSend(v10, "setCuratedCollectionContext:", v19);

    objc_msgSend(v11, "setCorrectionType:", -[RAPCuratedCollectionQuestion _selectedCorrectionType](self, "_selectedCorrectionType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCuratedCollectionQuestion commentQuestion](self, "commentQuestion"));
    objc_msgSend(v12, "_fillSubmissionParameters:", v20);
  }

}

- (int)analyticTarget
{
  return 40;
}

- (RAPCommentQuestion)commentQuestion
{
  return self->_commentQuestion;
}

- (void)setCategoryItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)selectedQuestionType
{
  return self->_selectedQuestionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryItems, 0);
  objc_storeStrong((id *)&self->_commentQuestion, 0);
}

@end
