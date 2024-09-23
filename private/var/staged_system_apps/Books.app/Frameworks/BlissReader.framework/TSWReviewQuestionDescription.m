@implementation TSWReviewQuestionDescription

- (int64_t)questionCardinality_original
{
  return self->mCardinality;
}

- (void)setQuestionCardinality:(int64_t)a3
{
  -[TSWReviewQuestionDescription willModify](self, "willModify");
  self->mCardinality = a3;
}

- (NSString)questionCategoryName
{
  return self->mCategoryName;
}

- (void)setQuestionCategoryName:(id)a3
{
  id v5;

  -[TSWReviewQuestionDescription willModify](self, "willModify");
  v5 = a3;

  self->mCategoryName = (NSString *)a3;
}

- (NSString)questionGeneralFeedback
{
  return self->mGeneralFeedback;
}

- (void)setQuestionGeneralFeedback:(id)a3
{
  id v5;

  -[TSWReviewQuestionDescription willModify](self, "willModify");
  v5 = a3;

  self->mGeneralFeedback = (NSString *)a3;
}

- (NSString)questionID
{
  return self->mID;
}

- (void)setQuestionID:(id)a3
{
  id v5;

  -[TSWReviewQuestionDescription willModify](self, "willModify");
  v5 = a3;

  self->mID = (NSString *)a3;
}

- (TSWPStorage)questionPrompt
{
  return self->mPrompt;
}

- (void)setQuestionPrompt:(id)a3
{
  id v5;

  -[TSWReviewQuestionDescription willModify](self, "willModify");
  v5 = a3;

  self->mPrompt = (TSWPStorage *)a3;
}

- (NSString)questionPromptAlternateText
{
  return self->mPromptAlternateText;
}

- (void)setQuestionPromptAlternateText:(id)a3
{
  id v5;

  -[TSWReviewQuestionDescription willModify](self, "willModify");
  v5 = a3;

  self->mPromptAlternateText = (NSString *)a3;
}

- (TSPObject)questionReferenceContent
{
  return self->mReferenceContent;
}

- (void)setQuestionReferenceContent:(id)a3
{
  id v5;

  -[TSWReviewQuestionDescription willModify](self, "willModify");
  v5 = a3;

  self->mReferenceContent = (TSPObject *)a3;
}

- (int)questionReferenceContentPlacementHint
{
  return self->mReferenceContentPlacement;
}

- (void)setQuestionReferenceContentPlacementHint:(int)a3
{
  -[TSWReviewQuestionDescription willModify](self, "willModify");
  self->mReferenceContentPlacement = a3;
}

- (CGSize)questionReferenceContentSizeHint
{
  double width;
  double height;
  CGSize result;

  width = self->mReferenceContentSize.width;
  height = self->mReferenceContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setQuestionReferenceContentSizeHint:(CGSize)a3
{
  CGFloat height;
  CGFloat width;

  height = a3.height;
  width = a3.width;
  -[TSWReviewQuestionDescription willModify](self, "willModify");
  self->mReferenceContentSize.width = width;
  self->mReferenceContentSize.height = height;
}

- (NSString)questionReferenceContentType
{
  return self->mReferenceContentType;
}

- (void)setQuestionReferenceContentType:(id)a3
{
  id v5;

  -[TSWReviewQuestionDescription willModify](self, "willModify");
  v5 = a3;

  self->mReferenceContentType = (NSString *)a3;
}

- (NSString)questionReferenceContentAlternateText
{
  return self->mReferenceContentAlternateText;
}

- (void)setQuestionReferenceContentAlternateText:(id)a3
{
  id v5;

  -[TSWReviewQuestionDescription willModify](self, "willModify");
  v5 = a3;

  self->mReferenceContentAlternateText = (NSString *)a3;
}

- (BOOL)questionShuffle
{
  return self->mShuffle;
}

- (void)setQuestionShuffle:(BOOL)a3
{
  -[TSWReviewQuestionDescription willModify](self, "willModify");
  self->mShuffle = a3;
}

- (NSString)questionType
{
  return self->mType;
}

- (void)setQuestionType:(id)a3
{
  id v5;

  -[TSWReviewQuestionDescription willModify](self, "willModify");
  v5 = a3;

  self->mType = (NSString *)a3;
}

- (NSMutableArray)choiceDescriptions
{
  return self->mChoiceDescriptions;
}

- (void)setChoiceDescriptions:(id)a3
{
  id v5;

  -[TSWReviewQuestionDescription willModify](self, "willModify");
  v5 = a3;

  self->mChoiceDescriptions = (NSMutableArray *)a3;
}

- (TSWPStorage)questionChoiceNumberStyle
{
  return self->mChoiceNumberStyle;
}

- (void)setQuestionChoiceNumberStyle:(id)a3
{
  id v5;

  -[TSWReviewQuestionDescription willModify](self, "willModify");
  v5 = a3;

  self->mChoiceNumberStyle = (TSWPStorage *)a3;
}

- (NSString)questionFeedbackIfCorrect
{
  return self->mFeedbackCorrect;
}

- (void)setQuestionFeedbackIfCorrect:(id)a3
{
  id v5;

  -[TSWReviewQuestionDescription willModify](self, "willModify");
  v5 = a3;

  self->mFeedbackCorrect = (NSString *)a3;
}

- (NSString)questionFeedbackIfPartiallyCorrect
{
  return self->mFeedbackPartial;
}

- (void)setQuestionFeedbackIfPartiallyCorrect:(id)a3
{
  id v5;

  -[TSWReviewQuestionDescription willModify](self, "willModify");
  v5 = a3;

  self->mFeedbackPartial = (NSString *)a3;
}

- (NSString)questionFeedbackIfIncorrect
{
  return self->mFeedbackIncorrect;
}

- (void)setQuestionFeedbackIfIncorrect:(id)a3
{
  id v5;

  -[TSWReviewQuestionDescription willModify](self, "willModify");
  v5 = a3;

  self->mFeedbackIncorrect = (NSString *)a3;
}

+ (id)createQuestionDescriptionForQuestionType:(id)a3 withContext:(id)a4
{
  TSWReviewQuestionDescription *v6;

  if ((objc_msgSend(a3, "isEqualToString:", TSWReviewQuestionDescriptionTypeMultiChoiceValue) & 1) == 0
    && (objc_msgSend(a3, "isEqualToString:", TSWReviewQuestionDescriptionTypeMultiChoiceImageValue) & 1) == 0
    && (objc_msgSend(a3, "isEqualToString:", TSWReviewQuestionDescriptionTypeAssociativeTokenValue) & 1) == 0
    && !objc_msgSend(a3, "isEqualToString:", TSWReviewQuestionDescriptionTypeAssociativeImageValue)
    || (v6 = -[TSWReviewQuestionDescription initWithContext:]([TSWReviewQuestionDescription alloc], "initWithContext:", a4), -[TSWReviewQuestionDescription setValue:forKey:](v6, "setValue:forKey:", a3, TSWReviewQuestionDescriptionTypeKey), !v6))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSWReviewQuestionDescription createQuestionDescriptionForQuestionType:withContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewQuestionDescription.m"), 106, CFSTR("Unknown question type: %@"), a3);
    return 0;
  }
  return v6;
}

- (TSWReviewQuestionDescription)initWithContext:(id)a3
{
  TSWReviewQuestionDescription *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWReviewQuestionDescription;
  v3 = -[TSWReviewQuestionDescription initWithContext:](&v5, "initWithContext:", a3);
  if (v3)
    -[TSWReviewQuestionDescription setChoiceDescriptions:](v3, "setChoiceDescriptions:", +[NSMutableArray array](NSMutableArray, "array"));
  return v3;
}

- (void)addChoice:(id)a3
{
  -[NSMutableArray addObject:](-[TSWReviewQuestionDescription choiceDescriptions](self, "choiceDescriptions"), "addObject:", a3);
}

- (void)dealloc
{
  objc_super v3;

  self->mCategoryName = 0;
  self->mReferenceContent = 0;

  self->mReferenceContentType = 0;
  self->mReferenceContentAlternateText = 0;

  self->mGeneralFeedback = 0;
  self->mID = 0;

  self->mPrompt = 0;
  self->mPromptAlternateText = 0;

  self->mType = 0;
  self->mChoiceDescriptions = 0;

  self->mChoiceNumberStyle = 0;
  self->mFeedbackCorrect = 0;

  self->mFeedbackPartial = 0;
  self->mFeedbackIncorrect = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWReviewQuestionDescription;
  -[TSWReviewQuestionDescription dealloc](&v3, "dealloc");
}

- (id)choiceAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](-[TSWReviewQuestionDescription choiceDescriptions](self, "choiceDescriptions"), "objectAtIndex:", a3);
}

- (unint64_t)indexOfChoice:(id)a3
{
  return (unint64_t)-[NSMutableArray indexOfObjectIdenticalTo:](-[TSWReviewQuestionDescription choiceDescriptions](self, "choiceDescriptions"), "indexOfObjectIdenticalTo:", a3);
}

- (int64_t)numberOfChoices
{
  return (int64_t)-[NSMutableArray count](-[TSWReviewQuestionDescription choiceDescriptions](self, "choiceDescriptions"), "count");
}

- (int64_t)questionCardinality
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  NSNumber *v7;
  _QWORD v9[6];
  _QWORD v10[4];

  if (!-[TSWReviewQuestionDescription questionCardinality_original](self, "questionCardinality_original"))
  {
    v3 = -[TSWReviewQuestionDescription questionType](self, "questionType");
    if (v3 == TSWReviewQuestionDescriptionTypeAssociativeTokenValue
      || (v4 = -[TSWReviewQuestionDescription questionType](self, "questionType"),
          v4 == TSWReviewQuestionDescriptionTypeAssociativeImageValue))
    {
      v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 3);
      -[TSWReviewQuestionDescription setValue:forKey:](self, "setValue:forKey:", v7, TSWReviewQuestionDescriptionCardinalityKey);
    }
    else
    {
      v5 = -[TSWReviewQuestionDescription questionType](self, "questionType");
      if (v5 == TSWReviewQuestionDescriptionTypeMultiChoiceValue
        || (v6 = -[TSWReviewQuestionDescription questionType](self, "questionType"),
            v6 == TSWReviewQuestionDescriptionTypeMultiChoiceImageValue))
      {
        v10[0] = 0;
        v10[1] = v10;
        v10[2] = 0x2020000000;
        v10[3] = 0;
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_1BAF44;
        v9[3] = &unk_42B298;
        v9[4] = self;
        v9[5] = v10;
        -[NSMutableArray enumerateObjectsUsingBlock:](-[TSWReviewQuestionDescription choiceDescriptions](self, "choiceDescriptions"), "enumerateObjectsUsingBlock:", v9);
        _Block_object_dispose(v10, 8);
      }
    }
  }
  return -[TSWReviewQuestionDescription questionCardinality_original](self, "questionCardinality_original");
}

@end
