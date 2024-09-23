@implementation THWReviewImageMultipleChoiceLayout

- (THWReviewImageMultipleChoiceLayout)initWithQuestion:(id)a3 index:(unint64_t)a4 delegate:(id)a5
{
  THWReviewImageMultipleChoiceLayout *v8;
  THWReviewImageMultipleChoiceLayout *v9;
  CGSize size;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)THWReviewImageMultipleChoiceLayout;
  v8 = -[THWReviewImageMultipleChoiceLayout initWithInfo:](&v12, "initWithInfo:", 0);
  v9 = v8;
  if (v8)
  {
    size = CGRectNull.size;
    v8->_contentFrame.origin = CGRectNull.origin;
    v8->_contentFrame.size = size;
    v8->_questionIndex = a4;
    v8->_question = (THWReviewQuestion *)a3;
    v9->_delegate = (THWReviewQuestionLayoutDelegate *)a5;
    -[THWReviewImageMultipleChoiceLayout p_setupAnswerLayouts](v9, "p_setupAnswerLayouts");
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageMultipleChoiceLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THWReviewImageMultipleChoiceRep, a2);
}

- (id)childInfosForLayout
{
  return 0;
}

- (id)dependentLayouts
{
  id v3;
  objc_super v5;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v5.receiver = self;
  v5.super_class = (Class)THWReviewImageMultipleChoiceLayout;
  objc_msgSend(v3, "addObjectsFromArray:", -[THWReviewImageMultipleChoiceLayout dependentLayouts](&v5, "dependentLayouts"));
  -[THWReviewImageMultipleChoiceLayout addDescendentLayoutsToArray:](self, "addDescendentLayoutsToArray:", v3);
  return v3;
}

- (id)additionalLayouts
{
  return self->_answerLayouts;
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (void)invalidateSize
{
  CGSize size;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWReviewImageMultipleChoiceLayout;
  -[THWReviewImageMultipleChoiceLayout invalidateSize](&v4, "invalidateSize");
  size = CGRectNull.size;
  self->_contentFrame.origin = CGRectNull.origin;
  self->_contentFrame.size = size;
  self->_rowCount = 0;
  self->_columnCount = 0;
}

- (CGSize)minContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[THWReviewQuestionLayoutDelegate questionAnswersLayoutSize:](self->_delegate, "questionAnswersLayoutSize:", self);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)p_layoutContentFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  char *v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t rowCount;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  CGRect *p_contentFrame;
  uint64_t v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  uint64_t v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;

  -[THWReviewImageMultipleChoiceLayout minContentSize](self, "minContentSize");
  v4 = v3;
  v6 = v5;
  v7 = (char *)-[THWReviewQuestionLayoutDelegate questionLayoutMode:](self->_delegate, "questionLayoutMode:", self);
  v8 = -[NSArray count](-[THWReviewQuestion choices](self->_question, "choices"), "count");
  -[THWReviewImageMultipleChoiceLayout p_imageSize](self, "p_imageSize");
  v11 = v9;
  v12 = v10;
  if (v8 < 2)
  {
    v13 = 1;
    self->_rowCount = 1;
    goto LABEL_17;
  }
  if (v8 != 2)
  {
    if (v8 < 9)
    {
      if (v7 != (_BYTE *)&dword_0 + 1)
      {
        self->_rowCount = 2;
        v13 = (v8 + 1) >> 1;
        goto LABEL_17;
      }
      v9 = v9 / v10;
      if (v11 / v10 > 1.5)
      {
        self->_rowCount = v8;
        v16 = 1;
LABEL_21:
        self->_columnCount = v16;
        goto LABEL_22;
      }
      v15 = (v8 + 1) >> 1;
    }
    else
    {
      v14 = v8 + 1;
      if (v7 != (_BYTE *)&dword_0 + 1)
      {
        self->_rowCount = v14 / 3;
        v13 = 3;
        goto LABEL_17;
      }
      v15 = v14 >> 1;
    }
    self->_rowCount = v15;
    v16 = 2;
    goto LABEL_21;
  }
  if (v7 == (_BYTE *)&dword_0 + 2 || !v7 && (v9 = v4 / (v9 * 2.0 + 6.0), v9 >= v6 / (v10 * 2.0 + 6.0)))
  {
    self->_rowCount = 1;
    v13 = 2;
  }
  else
  {
    self->_rowCount = 2;
    v13 = 1;
  }
LABEL_17:
  self->_columnCount = v13;
  if ((unint64_t)(v7 - 1) >= 2)
  {
    rowCount = self->_rowCount;
    v18 = (double)rowCount;
    v19 = (double)(rowCount - 1) * 6.0;
    v20 = v6;
    goto LABEL_28;
  }
LABEL_22:
  -[THWReviewQuestionLayoutDelegate questionLayoutSize:](self->_delegate, "questionLayoutSize:", self, v9);
  if (v21 >= v4)
    v22 = v4;
  else
    v22 = v21;
  if (v12 < v22)
    v22 = v12;
  v23 = self->_rowCount;
  v18 = (double)v23;
  v19 = (double)(v23 - 1) * 6.0;
  v20 = v19 + (double)v23 * v22;
LABEL_28:
  TSDShrinkSizeToFitInSize((double)(self->_columnCount - 1) * 6.0 + (double)self->_columnCount * v11, v19 + v18 * v12, v4, v20);
  p_contentFrame = &self->_contentFrame;
  v26 = TSDRectWithSize(v25);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = TSDRectWithSize(v33);
  THIntegralCenterRectInRect(v26, v28, v30, v32, v34, v35, v36, v37);
  p_contentFrame->origin.x = v38;
  p_contentFrame->origin.y = v39;
  p_contentFrame->size.width = v40;
  p_contentFrame->size.height = v41;
}

- (CGRect)contentFrame
{
  CGRect *p_contentFrame;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  p_contentFrame = &self->_contentFrame;
  if (CGRectIsNull(self->_contentFrame))
    -[THWReviewImageMultipleChoiceLayout p_layoutContentFrame](self, "p_layoutContentFrame");
  x = p_contentFrame->origin.x;
  y = p_contentFrame->origin.y;
  width = p_contentFrame->size.width;
  height = p_contentFrame->size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)rowCount
{
  if (CGRectIsNull(self->_contentFrame))
    -[THWReviewImageMultipleChoiceLayout p_layoutContentFrame](self, "p_layoutContentFrame");
  return self->_rowCount;
}

- (unint64_t)columnCount
{
  if (CGRectIsNull(self->_contentFrame))
    -[THWReviewImageMultipleChoiceLayout p_layoutContentFrame](self, "p_layoutContentFrame");
  return self->_columnCount;
}

- (id)computeLayoutGeometry
{
  id v2;

  -[THWReviewImageMultipleChoiceLayout contentFrame](self, "contentFrame");
  v2 = objc_alloc((Class)TSDLayoutGeometry);
  return objc_msgSend(v2, "initWithFrame:", TSDRectWithSize(v2));
}

- (id)layoutGeometryForLayout:(id)a3
{
  void *v4;
  void *v5;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWControl, a3);
  if (!v4)
    return 0;
  v5 = v4;
  if (objc_msgSend(v4, "tag"))
    return 0;
  -[THWReviewImageMultipleChoiceLayout p_frameForChoiceIndex:](self, "p_frameForChoiceIndex:", objc_msgSend(v5, "index"));
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v7, v8, v9, v10);
}

- (id)layoutForChoiceIndex:(unint64_t)a3
{
  if (-[NSArray count](self->_answerLayouts, "count") <= a3)
    return 0;
  else
    return -[NSArray objectAtIndex:](self->_answerLayouts, "objectAtIndex:", a3);
}

- (void)p_setupAnswerLayouts
{
  NSUInteger v3;
  NSMutableArray *v4;
  uint64_t i;
  THWButtonControlLayout *v6;

  if (!self->_answerLayouts)
  {
    v3 = -[NSArray count](-[THWReviewQuestion choices](self->_question, "choices"), "count");
    v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v3);
    if (v3)
    {
      for (i = 0; i != v3; ++i)
      {
        v6 = -[THWControlLayout initWithTag:index:]([THWButtonControlLayout alloc], "initWithTag:index:", 0, i);
        -[NSMutableArray addObject:](v4, "addObject:", v6);

      }
    }
    self->_answerLayouts = (NSArray *)-[NSMutableArray copy](v4, "copy");
  }
}

- (CGSize)p_imageSize
{
  CGFloat width;
  CGFloat height;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = -[THWReviewQuestion choices](self->_question, "choices", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "contentImage");
        if (v9)
        {
          objc_msgSend(v9, "size");
          width = v10;
          height = v11;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:
  v12 = width;
  v13 = height;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGRect)p_frameForChoiceIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;
  float v15;
  float v16;
  ldiv_t v17;
  double v18;
  NSUInteger v19;
  double v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  -[THWReviewImageMultipleChoiceLayout contentFrame](self, "contentFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[THWReviewImageMultipleChoiceLayout rowCount](self, "rowCount");
  v14 = -[THWReviewImageMultipleChoiceLayout columnCount](self, "columnCount");
  v15 = (v10 + (double)(unint64_t)(v14 - 1) * -6.0) / (double)(unint64_t)v14;
  v16 = floorf(v15);
  v17 = ldiv(a3, v14);
  v18 = v6 + (double)(unint64_t)v17.rem * (v16 + 6.0);
  if (v17.quot + 1 >= v13)
  {
    v19 = -[NSArray count](-[THWReviewQuestion choices](self->_question, "choices"), "count");
    v20 = v18 + floorf(v16 * 0.5);
    if (v14 * v13 != v19)
      v18 = v20;
  }
  v21 = (v12 + (double)(v13 - 1) * -6.0) / (double)v13;
  v22 = floorf(v21);
  v23 = v8 + (double)(unint64_t)v17.quot * (v22 + 6.0);
  v24 = v18;
  v25 = v16;
  result.size.height = v22;
  result.size.width = v25;
  result.origin.y = v23;
  result.origin.x = v24;
  return result;
}

- (unint64_t)questionIndex
{
  return self->_questionIndex;
}

- (THWReviewQuestion)question
{
  return self->_question;
}

- (NSArray)answerLayouts
{
  return self->_answerLayouts;
}

- (THWReviewQuestionLayoutDelegate)delegate
{
  return self->_delegate;
}

@end
