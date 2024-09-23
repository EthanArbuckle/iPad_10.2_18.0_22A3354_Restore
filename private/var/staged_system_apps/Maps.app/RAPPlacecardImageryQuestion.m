@implementation RAPPlacecardImageryQuestion

- (RAPPlacecardImageryQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 supportedIssueItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  RAPPlacecardImageryQuestion *v11;
  RAPPlacecardImageryQuestion *v12;
  RAPCommentQuestion *v13;
  RAPCommentQuestion *commentQuestion;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)RAPPlacecardImageryQuestion;
  v11 = -[RAPQuestion initWithReport:parentQuestion:](&v16, "initWithReport:parentQuestion:", v8, v9);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_issueItems, a5);
    v13 = -[RAPCommentQuestion initWithReport:parentQuestion:]([RAPCommentQuestion alloc], "initWithReport:parentQuestion:", v8, v9);
    commentQuestion = v12->_commentQuestion;
    v12->_commentQuestion = v13;

    -[RAPCommentQuestion setEmphasis:](v12->_commentQuestion, "setEmphasis:", 3);
    -[RAPQuestion addObserver:changeHandler:](v12->_commentQuestion, "addObserver:changeHandler:", v12, &stru_1011D98D0);
  }

  return v12;
}

- (void)setIssueType:(unint64_t)a3
{
  RAPCommentQuestion *commentQuestion;
  void *v5;

  if (self->_issueType != a3)
  {
    self->_issueType = a3;
    commentQuestion = self->_commentQuestion;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlacecardImageryQuestion placeholderText](self, "placeholderText"));
    -[RAPCommentQuestion _setPlaceholderText:](commentQuestion, "_setPlaceholderText:", v5);

    -[RAPCommentQuestion setShouldShowEmail:](self->_commentQuestion, "setShouldShowEmail:", (self->_issueType & 0xFFFFFFFFFFFFFFFELL) == 6);
    -[RAPQuestion _setComplete:allowInvokingDidChange:](self, "_setComplete:allowInvokingDidChange:", -[RAPPlacecardImageryQuestion isComplete](self, "isComplete"), 1);
  }
}

- (BOOL)isComplete
{
  BOOL result;
  unint64_t issueType;

  result = 0;
  issueType = self->_issueType;
  if (issueType <= 8)
  {
    if (((1 << issueType) & 0x13C) != 0)
    {
      return 1;
    }
    else if (((1 << issueType) & 0xC2) != 0)
    {
      return -[RAPQuestion isComplete](self->_commentQuestion, "isComplete");
    }
  }
  return result;
}

- (id)placeholderText
{
  unint64_t issueType;
  __CFString *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  issueType = self->_issueType;
  v3 = &stru_1011EB268;
  if (issueType <= 8)
  {
    if (((1 << issueType) & 0x13C) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Optional details [RAP]");
LABEL_6:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

      return v3;
    }
    if (((1 << issueType) & 0xC2) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v5 = v4;
      v6 = CFSTR("Details [RAP]");
      goto LABEL_6;
    }
  }
  return v3;
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("What's wrong with this photo? [UGC]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (BOOL)isAnonymous
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPPlacecardImageryQuestion;
  v3 = -[RAPQuestion isAnonymous](&v5, "isAnonymous");
  if (v3)
    LOBYTE(v3) = (self->_issueType & 0xFFFFFFFFFFFFFFFELL) != 6;
  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4;
  id v5;
  uint64_t issueType_low;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  v5 = objc_alloc_init((Class)GEORPPoiImageFeedbackCorrections);
  v21 = v5;
  if (self->_issueType - 1 < 8)
    issueType_low = LODWORD(self->_issueType);
  else
    issueType_low = 0;
  objc_msgSend(v5, "setCorrectionType:", issueType_low);
  v7 = objc_alloc_init((Class)GEORPPoiImageFeedbackContext);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placecardImageryContext"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reportedPlace"));
  objc_msgSend(v7, "setPlace:", v10);

  v11 = objc_alloc_init((Class)GEORPFeedbackClientImageInfo);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "photoURL"));
  objc_msgSend(v11, "setImageUrl:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "photoIdentifier"));
  objc_msgSend(v11, "setProviderImageId:", v13);

  objc_msgSend(v7, "setImageInfo:", v11);
  objc_msgSend(v4, "setType:", 13);
  v14 = objc_alloc_init((Class)GEORPFeedbackDetails);
  objc_msgSend(v4, "setDetails:", v14);

  v15 = objc_alloc_init((Class)GEORPPoiImageFeedback);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  objc_msgSend(v16, "setPoiImageFeedback:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "poiImageFeedback"));
  objc_msgSend(v18, "setPoiImageCorrections:", v21);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "poiImageFeedback"));
  objc_msgSend(v20, "setPoiImageContext:", v7);

  -[RAPCommentQuestion _fillSubmissionParameters:](self->_commentQuestion, "_fillSubmissionParameters:", v4);
}

- (RAPCommentQuestion)commentQuestion
{
  return self->_commentQuestion;
}

- (unint64_t)issueType
{
  return self->_issueType;
}

- (NSArray)issueItems
{
  return self->_issueItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issueItems, 0);
  objc_storeStrong((id *)&self->_commentQuestion, 0);
}

@end
