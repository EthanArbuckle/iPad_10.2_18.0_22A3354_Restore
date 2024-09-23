@implementation THWReviewTextMultipleChoiceLayoutHelper

- (THWReviewTextMultipleChoiceLayoutHelper)initWithQuestion:(id)a3
{
  THWReviewTextMultipleChoiceLayoutHelper *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWReviewTextMultipleChoiceLayoutHelper;
  v4 = -[THWReviewTextMultipleChoiceLayoutHelper init](&v6, "init");
  if (v4)
  {
    v4->_question = (THWReviewQuestion *)a3;
    -[THWReviewTextMultipleChoiceLayoutHelper _setupAnswerLayouts](v4, "_setupAnswerLayouts");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewTextMultipleChoiceLayoutHelper;
  -[THWReviewTextMultipleChoiceLayoutHelper dealloc](&v3, "dealloc");
}

- (CGSize)answerStackSizeForWidth:(double)a3
{
  double v5;
  THWStackedControlContainer *v6;
  double v7;
  double v8;
  _QWORD v9[7];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  THWStackedControlContainer *v18;
  CGSize result;

  -[THWReviewTextMultipleChoiceLayoutHelper answerLayoutWidth](self, "answerLayoutWidth");
  if (v5 != a3)
  {
    v14 = 0;
    v15 = (double *)&v14;
    v16 = 0x2020000000;
    v17 = 0;
    v10 = 0;
    v11 = (double *)&v10;
    v12 = 0x2020000000;
    v13 = 0;
    -[THWReviewTextMultipleChoiceLayoutHelper setAnswerLayoutWidth:](self, "setAnswerLayoutWidth:", a3);
    v6 = -[THWStackedControlContainer initWithDelegate:]([THWStackedControlContainer alloc], "initWithDelegate:", self);
    v18 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_13DA0C;
    v9[3] = &unk_429F18;
    v9[4] = v6;
    v9[5] = &v10;
    v9[6] = &v14;
    +[TSDLayoutController temporaryLayoutControllerForInfos:useInBlock:](TSDLayoutController, "temporaryLayoutControllerForInfos:useInBlock:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1), v9);

    -[THWReviewTextMultipleChoiceLayoutHelper setAnswerStackSize:](self, "setAnswerStackSize:", v15[3], v11[3]);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  -[THWReviewTextMultipleChoiceLayoutHelper answerStackSize](self, "answerStackSize");
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)controlContainerChildInfosForLayout:(id)a3
{
  return 0;
}

- (id)controlContainerAdditionalChildLayouts:(id)a3
{
  return -[THWReviewTextMultipleChoiceLayoutHelper answerLayouts](self, "answerLayouts", a3);
}

- (CGPoint)stackedControlContainerOrigin:(id)a3
{
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UIEdgeInsets)stackedControlContainerInsets:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4
{
  return 20.0;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingBefore:(id)a4
{
  return 0.0;
}

- (double)stackedControlContainer:(id)a3 verticalSpacingAfter:(id)a4
{
  return 0.0;
}

- (double)stackedControlContainer:(id)a3 verticalSpacingBefore:(id)a4
{
  return 0.0;
}

- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4
{
  return 0;
}

- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4
{
  return 0;
}

- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4
{
  return 0;
}

- (unsigned)stackedControlContainerVerticalAlignment:(id)a3
{
  return 1;
}

- (id)reviewTextAnswerLayoutListLabelParagraphStyle:(id)a3
{
  return -[THWReviewQuestion choiceNumberStyle](-[THWReviewTextMultipleChoiceLayoutHelper question](self, "question", a3), "choiceNumberStyle");
}

- (void)_setupAnswerLayouts
{
  NSArray *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  THWReviewTextAnswerLayout *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (!self->_answerLayouts)
  {
    v3 = -[THWReviewQuestion choices](self->_question, "choices");
    v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSArray count](v3, "count"));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v3);
          v10 = -[THWReviewTextAnswerLayout initWithChoice:index:delegate:]([THWReviewTextAnswerLayout alloc], "initWithChoice:index:delegate:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), (char *)v9 + v7, self);
          -[NSMutableArray addObject:](v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }
        while (v6 != v9);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v7 += (uint64_t)v9;
      }
      while (v6);
    }
    self->_answerLayouts = (NSArray *)-[NSMutableArray copy](v4, "copy");
  }
}

- (THWReviewQuestion)question
{
  return self->_question;
}

- (NSArray)answerLayouts
{
  return self->_answerLayouts;
}

- (double)answerLayoutWidth
{
  return self->_answerLayoutWidth;
}

- (void)setAnswerLayoutWidth:(double)a3
{
  self->_answerLayoutWidth = a3;
}

- (CGSize)answerStackSize
{
  double width;
  double height;
  CGSize result;

  width = self->_answerStackSize.width;
  height = self->_answerStackSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAnswerStackSize:(CGSize)a3
{
  self->_answerStackSize = a3;
}

@end
