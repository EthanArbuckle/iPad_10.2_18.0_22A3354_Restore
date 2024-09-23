@implementation THWReviewTextMultipleChoiceLayout

- (THWReviewTextMultipleChoiceLayout)initWithQuestion:(id)a3 index:(unint64_t)a4 delegate:(id)a5
{
  THWReviewTextMultipleChoiceLayout *v8;
  THWReviewTextMultipleChoiceLayout *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THWReviewTextMultipleChoiceLayout;
  v8 = -[THWReviewTextMultipleChoiceLayout initWithInfo:](&v11, "initWithInfo:", 0);
  v9 = v8;
  if (v8)
  {
    -[THWReviewTextMultipleChoiceLayout p_invalidateCachedGeometry](v8, "p_invalidateCachedGeometry");
    v9->_questionIndex = a4;
    v9->_question = (THWReviewQuestion *)a3;
    v9->_answerStack = -[THWStackedControlContainer initWithDelegate:]([THWStackedControlContainer alloc], "initWithDelegate:", v9);
    v9->_delegate = (THWReviewQuestionLayoutDelegate *)a5;
    -[THWReviewTextMultipleChoiceLayout p_setupAnswerLayouts](v9, "p_setupAnswerLayouts");
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewTextMultipleChoiceLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THWReviewTextMultipleChoiceRep, a2);
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (void)invalidateSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewTextMultipleChoiceLayout;
  -[THWReviewTextMultipleChoiceLayout invalidateSize](&v3, "invalidateSize");
  -[THWReviewTextMultipleChoiceLayout p_invalidateCachedGeometry](self, "p_invalidateCachedGeometry");
}

- (void)p_invalidateCachedGeometry
{
  CGSize v2;
  CGPoint origin;
  CGSize size;

  v2 = CGSizeZero;
  self->_answersSize = CGSizeZero;
  self->_imageSize = v2;
  self->_contentSize = v2;
  origin = CGRectNull.origin;
  size = CGRectNull.size;
  self->_imageFrame.origin = CGRectNull.origin;
  self->_imageFrame.size = size;
  self->_answersFrame.origin = origin;
  self->_answersFrame.size = size;
  self->_contentFrame.origin = origin;
  self->_contentFrame.size = size;
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

- (int)p_imagePlacement
{
  int v3;
  char *v4;

  v3 = -[THWReviewQuestion imagePlacement](-[THWReviewTextMultipleChoiceLayout question](self, "question"), "imagePlacement");
  v4 = (char *)-[THWReviewQuestionLayoutDelegate questionLayoutMode:](self->_delegate, "questionLayoutMode:", self);
  if (v4 == (_BYTE *)&dword_0 + 2)
    return 2;
  if (v4 == (_BYTE *)&dword_0 + 1)
    return 1;
  return v3;
}

- (BOOL)imageIsAtSide
{
  unsigned int v3;
  TSDImageInfo *v4;
  BOOL v6;

  v3 = -[THWReviewTextMultipleChoiceLayout p_imagePlacement](self, "p_imagePlacement");
  v4 = -[THWReviewQuestion imageInfo](-[THWReviewTextMultipleChoiceLayout question](self, "question"), "imageInfo");
  v6 = v3 == 2 || v3 == 4;
  return v4 && v6;
}

- (double)p_answersHeightForWidth:(double)a3
{
  double v3;

  -[THWReviewTextMultipleChoiceLayout p_answersSizeForWidth:](self, "p_answersSizeForWidth:", a3);
  return v3;
}

- (CGSize)p_answersSizeForWidth:(double)a3
{
  THWReviewTextMultipleChoiceLayoutHelper *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = -[THWReviewTextMultipleChoiceLayoutHelper initWithQuestion:]([THWReviewTextMultipleChoiceLayoutHelper alloc], "initWithQuestion:", -[THWReviewTextMultipleChoiceLayout question](self, "question"));
  -[THWReviewTextMultipleChoiceLayoutHelper answerStackSizeForWidth:](v4, "answerStackSizeForWidth:", a3);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)p_binSearchAnswersWidth:(double)a3 maxWidth:(double)a4 naturalWidth:(double)a5 height:(double)a6
{
  double result;
  double v12;
  double v13;
  double v15;
  double v16;

  if (a4 - a3 < 1.0)
    return a4;
  -[THWReviewTextMultipleChoiceLayout p_answersSizeForWidth:](self, "p_answersSizeForWidth:", (a3 + a4) * 0.5);
  if (v13 > a6 && v12 < a5)
  {
    v15 = (a3 + a4) * 0.5;
    v16 = a4;
  }
  else
  {
    v15 = a3;
    v16 = (a3 + a4) * 0.5;
  }
  -[THWReviewTextMultipleChoiceLayout p_binSearchAnswersWidth:maxWidth:naturalWidth:height:](self, "p_binSearchAnswersWidth:maxWidth:naturalWidth:height:", v15, v16, a5, a6);
  return result;
}

- (CGSize)p_maxSizeWithImageSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[THWReviewTextMultipleChoiceLayout minContentSize](self, "minContentSize");
  v6 = v5 * 0.5;
  if (width <= v6)
    v6 = width;
  else
    height = v6 / (width / height);
  v7 = height;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)p_contentIsScrollable
{
  char *v3;
  BOOL result;

  v3 = (char *)-[THWReviewQuestionLayoutDelegate questionLayoutMode:](self->_delegate, "questionLayoutMode:", self);
  result = -[THWReviewQuestionLayoutDelegate isExpanded](self->_delegate, "isExpanded");
  if ((unint64_t)(v3 - 1) >= 2)
    return 0;
  return result;
}

- (CGSize)answersSize
{
  CGSize *p_answersSize;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unsigned int v13;
  unsigned int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  p_answersSize = &self->_answersSize;
  width = self->_answersSize.width;
  height = self->_answersSize.height;
  if (width == CGSizeZero.width && height == CGSizeZero.height)
  {
    -[THWReviewTextMultipleChoiceLayout minContentSize](self, "minContentSize");
    v8 = v7;
    v10 = v9;
    -[THWReviewQuestion imageSize](-[THWReviewTextMultipleChoiceLayout question](self, "question"), "imageSize");
    v12 = v11;
    v13 = -[THWReviewTextMultipleChoiceLayout p_contentIsScrollable](self, "p_contentIsScrollable");
    v14 = -[THWReviewTextMultipleChoiceLayout imageIsAtSide](self, "imageIsAtSide");
    v15 = v8;
    if (v13)
    {
      if (v14)
      {
        v15 = v8 - v12 + -15.0 >= 150.0 ? v8 - v12 + -15.0 : 150.0;
        -[THWReviewTextMultipleChoiceLayout p_answersSizeForWidth:](self, "p_answersSizeForWidth:", 1.79769313e308);
        if (v16 > v15)
        {
          v17 = v8 * 0.5;
          if (v12 < v8 * 0.5)
            v17 = v12;
          v18 = v8 - v17 + -15.0;
          if (v16 >= v18)
            v15 = v18;
          else
            v15 = v16;
        }
      }
    }
    else if (v14)
    {
      v15 = v8 - v12 + -15.0;
      if (-[THWReviewQuestionLayoutDelegate isExpanded](self->_delegate, "isExpanded"))
      {
        if (v15 < 150.0)
          v15 = 150.0;
        -[THWReviewTextMultipleChoiceLayout p_answersHeightForWidth:](self, "p_answersHeightForWidth:", v15);
        if (v19 > v10)
        {
          v20 = fmin(v12, 150.0);
          -[THWReviewTextMultipleChoiceLayout p_answersSizeForWidth:](self, "p_answersSizeForWidth:", 1.79769313e308);
          if (v15 >= v8 + -15.0 - v20)
            v22 = v15;
          else
            v22 = v8 + -15.0 - v20;
          -[THWReviewTextMultipleChoiceLayout p_binSearchAnswersWidth:maxWidth:naturalWidth:height:](self, "p_binSearchAnswersWidth:maxWidth:naturalWidth:height:", v15, v22, v21, v10);
          v15 = ceil(v23);
        }
      }
    }
    -[THWReviewTextMultipleChoiceLayout p_answersSizeForWidth:](self, "p_answersSizeForWidth:", v15);
    width = v24 + 2.0;
    p_answersSize->width = width;
    p_answersSize->height = height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)imageSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize *p_imageSize;
  double width;
  double height;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGSize result;

  -[THWReviewQuestion imageSize](-[THWReviewTextMultipleChoiceLayout question](self, "question"), "imageSize");
  v4 = v3;
  v6 = v5;
  p_imageSize = &self->_imageSize;
  width = self->_imageSize.width;
  height = self->_imageSize.height;
  if (width == CGSizeZero.width && height == CGSizeZero.height)
  {
    if (!-[THWReviewQuestion imageInfo](-[THWReviewTextMultipleChoiceLayout question](self, "question"), "imageInfo")
      || v4 == 0.0
      || v6 == 0.0)
    {
      width = p_imageSize->width;
      height = self->_imageSize.height;
    }
    else
    {
      -[THWReviewQuestion imageSize](-[THWReviewTextMultipleChoiceLayout question](self, "question"), "imageSize");
      v12 = v11;
      v14 = v13;
      v15 = v11 / v13;
      -[THWReviewTextMultipleChoiceLayout minContentSize](self, "minContentSize");
      v17 = v16;
      v19 = v18;
      -[THWReviewTextMultipleChoiceLayout answersSize](self, "answersSize");
      v21 = v20;
      v23 = v22;
      if (-[THWReviewQuestionLayoutDelegate isExpanded](-[THWReviewTextMultipleChoiceLayout delegate](self, "delegate"), "isExpanded"))
      {
        if (-[THWReviewTextMultipleChoiceLayout imageIsAtSide](self, "imageIsAtSide"))
        {
          if (-[THWReviewQuestionLayoutDelegate questionLayoutMode:](self->_delegate, "questionLayoutMode:", self) == (char *)&dword_0 + 2)
          {
            -[THWReviewTextMultipleChoiceLayout p_maxSizeWithImageSize:](self, "p_maxSizeWithImageSize:", v12, v14);
            v12 = v24;
            v14 = v25;
          }
          else
          {
            v12 = v17 - v21 + -15.0;
            v14 = v12 / v15;
          }
        }
        else
        {
          v26 = fmax(v19 - v23 + -6.0, 150.0);
          if (v14 > v26)
          {
            v14 = v26;
            v12 = v15 * v26;
          }
        }
      }
      if (v12 > v17)
      {
        v14 = v17 / v15;
        v12 = v17;
      }
      if (v14 > v19)
      {
        if (-[THWReviewQuestionLayoutDelegate questionLayoutMode:](self->_delegate, "questionLayoutMode:", self) == (char *)&dword_0 + 2)
        {
          -[THWReviewTextMultipleChoiceLayout p_maxSizeWithImageSize:](self, "p_maxSizeWithImageSize:", v12, v14);
          v12 = v27;
          v14 = v28;
        }
        else
        {
          v12 = v19 * v15;
          v14 = v19;
        }
      }
      -[THWReviewQuestion imageSize](-[THWReviewTextMultipleChoiceLayout question](self, "question"), "imageSize");
      v29 = width / v15;
      if (v12 <= width)
      {
        v29 = v14;
        width = v12;
      }
      if (v29 > height)
        width = v15 * height;
      else
        height = v29;
      p_imageSize->width = width;
      self->_imageSize.height = height;
    }
  }
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)contentSize
{
  CGSize *p_contentSize;
  double height;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double width;
  CGSize result;

  p_contentSize = &self->_contentSize;
  height = self->_contentSize.height;
  if (self->_contentSize.width == CGSizeZero.width && height == CGSizeZero.height)
  {
    -[THWReviewTextMultipleChoiceLayout minContentSize](self, "minContentSize");
    p_contentSize->width = v6;
    p_contentSize->height = v7;
    -[THWReviewTextMultipleChoiceLayout imageSize](self, "imageSize");
    v9 = v8;
    -[THWReviewTextMultipleChoiceLayout answersSize](self, "answersSize");
    v11 = v10;
    switch(-[THWReviewTextMultipleChoiceLayout p_imagePlacement](self, "p_imagePlacement"))
    {
      case 1:
      case 3:
        height = v9 + v11 + 6.0;
        if (p_contentSize->height >= height)
          height = p_contentSize->height;
        goto LABEL_15;
      case 2:
      case 4:
        v12 = p_contentSize->height;
        if (v12 < v11)
          v12 = v11;
        if (v12 >= v9)
          height = v12;
        else
          height = v9;
LABEL_15:
        p_contentSize->height = height;
        break;
      default:
        height = p_contentSize->height;
        break;
    }
  }
  width = p_contentSize->width;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)imageFrame
{
  CGRect *p_imageFrame;
  TSDImageInfo *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  THWReviewQuestionLayoutDelegate *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double x;
  double y;
  double width;
  double height;
  double v30;
  double v31;
  CGSize size;
  CGPoint origin;
  CGRect result;

  p_imageFrame = &self->_imageFrame;
  if (CGRectIsNull(self->_imageFrame))
  {
    size = CGRectZero.size;
    origin = CGRectZero.origin;
    p_imageFrame->origin = CGRectZero.origin;
    p_imageFrame->size = size;
    v4 = -[THWReviewQuestion imageInfo](-[THWReviewTextMultipleChoiceLayout question](self, "question"), "imageInfo");
    -[THWReviewTextMultipleChoiceLayout imageSize](self, "imageSize");
    v6 = v5;
    v8 = v7;
    v9 = -[THWReviewTextMultipleChoiceLayout answersSize](self, "answersSize");
    if (v4 && v6 > 0.0 && v8 > 0.0)
    {
      v12 = v10;
      v13 = v11;
      v14 = -[THWReviewTextMultipleChoiceLayout delegate](self, "delegate");
      p_imageFrame->origin.x = TSDRectWithSize(v14);
      p_imageFrame->origin.y = v15;
      p_imageFrame->size.width = v16;
      p_imageFrame->size.height = v17;
      TSDRectWithSize(-[THWReviewTextMultipleChoiceLayout minContentSize](self, "minContentSize"));
      v18 = TSDCenterRectOverRect(p_imageFrame->origin.x);
      p_imageFrame->size.width = v20;
      p_imageFrame->size.height = v21;
      if (v18 < 0.0)
        v18 = 0.0;
      if (v19 < 0.0)
        v19 = 0.0;
      p_imageFrame->origin.x = v18;
      p_imageFrame->origin.y = v19;
      -[THWReviewTextMultipleChoiceLayout contentSize](self, "contentSize");
      v23 = v22;
      v25 = v24;
      v9 = (id)-[THWReviewTextMultipleChoiceLayout p_imagePlacement](self, "p_imagePlacement");
      switch((int)v9)
      {
        case 0:
        case 3:
        case 4:
          v9 = objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewTextMultipleChoiceLayout imageFrame]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewTextMultipleChoiceLayout.m"), 442, CFSTR("Unsupported image placement: %d"), v9);
          p_imageFrame->origin = origin;
          p_imageFrame->size = size;
          break;
        case 1:
          p_imageFrame->origin.y = 0.0;
          v9 = -[THWReviewQuestionLayoutDelegate isExpanded](v14, "isExpanded");
          if ((_DWORD)v9)
          {
            v31 = v25 - v8 - v13 + -6.0;
            if (v31 < 0.0)
              v31 = 0.0;
            p_imageFrame->origin.y = p_imageFrame->origin.y + v31 * 0.25;
          }
          break;
        case 2:
          p_imageFrame->origin.x = v23 - p_imageFrame->size.width;
          v9 = -[THWReviewQuestionLayoutDelegate isExpanded](v14, "isExpanded");
          if ((_DWORD)v9)
          {
            v30 = v23 - v6 - v12 + -15.0;
            if (v30 < 0.0)
              v30 = 0.0;
            p_imageFrame->origin.x = p_imageFrame->origin.x + v30 * -0.25;
          }
          break;
        default:
          break;
      }
    }
    x = TSDRoundedRect(v9);
    p_imageFrame->origin.x = x;
    p_imageFrame->origin.y = y;
    p_imageFrame->size.width = width;
    p_imageFrame->size.height = height;
  }
  else
  {
    x = p_imageFrame->origin.x;
    y = p_imageFrame->origin.y;
    width = p_imageFrame->size.width;
    height = p_imageFrame->size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)answersFrame
{
  CGRect *p_answersFrame;
  id v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  TSDImageInfo *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double x;
  double y;
  double width;
  double height;
  double v33;
  double v34;
  BOOL v35;
  double v36;
  double v37;
  CGFloat v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  p_answersFrame = &self->_answersFrame;
  if (CGRectIsNull(self->_answersFrame))
  {
    v4 = -[THWReviewTextMultipleChoiceLayout answersSize](self, "answersSize");
    v6 = v5;
    p_answersFrame->origin.x = TSDRectWithSize(v4);
    p_answersFrame->origin.y = v7;
    p_answersFrame->size.width = v8;
    p_answersFrame->size.height = v9;
    TSDRectWithSize(-[THWReviewTextMultipleChoiceLayout minContentSize](self, "minContentSize"));
    v10 = TSDCenterRectOverRect(p_answersFrame->origin.x);
    p_answersFrame->size.width = v12;
    p_answersFrame->size.height = v13;
    if (v10 < 0.0)
      v10 = 0.0;
    if (v11 < 0.0)
      v11 = 0.0;
    p_answersFrame->origin.x = v10;
    p_answersFrame->origin.y = v11;
    v14 = -[THWReviewQuestion imageInfo](-[THWReviewTextMultipleChoiceLayout question](self, "question"), "imageInfo");
    if (v14)
    {
      -[THWReviewTextMultipleChoiceLayout imageFrame](self, "imageFrame");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      -[THWReviewTextMultipleChoiceLayout imageSize](self, "imageSize");
      v24 = v23;
      -[THWReviewTextMultipleChoiceLayout contentSize](self, "contentSize");
      v26 = v25;
      v28 = v27;
      v14 = (TSDImageInfo *)-[THWReviewTextMultipleChoiceLayout p_imagePlacement](self, "p_imagePlacement");
      switch((int)v14)
      {
        case 0:
        case 3:
        case 4:
          v14 = (TSDImageInfo *)objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewTextMultipleChoiceLayout answersFrame]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewTextMultipleChoiceLayout.m"), 492, CFSTR("Unsupported image placement: %d"), v14);
          break;
        case 1:
          v39.origin.x = v16;
          v39.origin.y = v18;
          v39.size.width = v20;
          v39.size.height = v22;
          v40.origin.y = CGRectGetMaxY(v39) + 6.0;
          p_answersFrame->origin.y = v40.origin.y;
          v40.origin.x = p_answersFrame->origin.x;
          v40.size.width = p_answersFrame->size.width;
          v40.size.height = p_answersFrame->size.height;
          v37 = (v28 - CGRectGetMaxY(v40)) * 0.5;
          if (v37 < 0.0)
            v37 = 0.0;
          v38 = p_answersFrame->origin.y + v37;
          p_answersFrame->origin.x = (v26 - v6) * 0.5;
          p_answersFrame->origin.y = v38;
          break;
        case 2:
          v33 = v26 - v6 - v24 + -15.0;
          v34 = v33 * 0.5;
          v35 = v33 < 0.0;
          v36 = 0.0;
          if (!v35)
            v36 = v34;
          p_answersFrame->origin.x = v36;
          break;
        default:
          break;
      }
    }
    x = TSDRoundedRect(v14);
    p_answersFrame->origin.x = x;
    p_answersFrame->origin.y = y;
    p_answersFrame->size.width = width;
    p_answersFrame->size.height = height;
  }
  else
  {
    x = p_answersFrame->origin.x;
    y = p_answersFrame->origin.y;
    width = p_answersFrame->size.width;
    height = p_answersFrame->size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)contentFrame
{
  CGRect *p_contentFrame;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  p_contentFrame = &self->_contentFrame;
  if (CGRectIsNull(self->_contentFrame))
  {
    p_contentFrame->origin.x = TSDRectWithSize(-[THWReviewTextMultipleChoiceLayout contentSize](self, "contentSize"));
    p_contentFrame->origin.y = v4;
    p_contentFrame->size.width = v5;
    p_contentFrame->size.height = v6;
    TSDRectWithSize(-[THWReviewTextMultipleChoiceLayout minContentSize](self, "minContentSize"));
    x = TSDCenterRectOverRect(p_contentFrame->origin.x);
    p_contentFrame->size.width = width;
    p_contentFrame->size.height = height;
    if (x < 0.0)
      x = 0.0;
    if (y < 0.0)
      y = 0.0;
    p_contentFrame->origin.x = x;
    p_contentFrame->origin.y = y;
  }
  else
  {
    x = p_contentFrame->origin.x;
    y = p_contentFrame->origin.y;
    width = p_contentFrame->size.width;
    height = p_contentFrame->size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)childInfosForLayout
{
  NSMutableArray *v3;
  TSDImageInfo *v4;

  v3 = +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", self->_answerStack);
  v4 = -[THWReviewQuestion imageInfo](-[THWReviewTextMultipleChoiceLayout question](self, "question"), "imageInfo");
  if (v4)
    -[NSMutableArray addObject:](v3, "addObject:", v4);
  return v3;
}

- (id)dependentLayouts
{
  id v3;
  objc_super v5;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v5.receiver = self;
  v5.super_class = (Class)THWReviewTextMultipleChoiceLayout;
  objc_msgSend(v3, "addObjectsFromArray:", -[THWReviewTextMultipleChoiceLayout dependentLayouts](&v5, "dependentLayouts"));
  if (self->_answerLayouts)
    objc_msgSend(v3, "addObjectsFromArray:");
  -[THWReviewTextMultipleChoiceLayout addDescendentLayoutsToArray:](self, "addDescendentLayoutsToArray:", v3);
  return v3;
}

- (id)computeLayoutGeometry
{
  id v2;

  -[THWReviewTextMultipleChoiceLayout contentSize](self, "contentSize");
  v2 = objc_alloc((Class)TSDLayoutGeometry);
  return objc_msgSend(v2, "initWithFrame:", TSDRectWithSize(v2));
}

- (id)layoutGeometryForLayout:(id)a3
{
  uint64_t v5;
  id result;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = objc_opt_class(TSDImageLayout);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, a3).n128_u64[0];
  if (result)
  {
    -[THWReviewTextMultipleChoiceLayout imageFrame](self, "imageFrame", v7);
    return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v8, v9, v10, v11);
  }
  return result;
}

- (id)controlContainerChildInfosForLayout:(id)a3
{
  return 0;
}

- (id)controlContainerAdditionalChildLayouts:(id)a3
{
  return self->_answerLayouts;
}

- (double)stackedControlContainerWidth:(id)a3
{
  double v3;

  -[THWReviewTextMultipleChoiceLayout answersFrame](self, "answersFrame", a3);
  return v3;
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

- (double)stackedControlContainerMinHeight:(id)a3
{
  double v4;
  double v5;
  double v6;

  -[THWReviewTextMultipleChoiceLayout answersSize](self, "answersSize", a3);
  v5 = v4;
  -[THWReviewTextMultipleChoiceLayout minContentSize](self, "minContentSize");
  if (v5 >= v6)
    return v6;
  else
    return v5;
}

- (unsigned)stackedControlContainerVerticalAlignment:(id)a3
{
  return 1;
}

- (double)reviewTextAnswerLayoutWidth:(id)a3
{
  double v3;

  -[THWReviewTextMultipleChoiceLayout answersFrame](self, "answersFrame", a3);
  return v3;
}

- (id)reviewTextAnswerLayoutListLabelParagraphStyle:(id)a3
{
  return -[THWReviewQuestion choiceNumberStyle](self->_question, "choiceNumberStyle", a3);
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
  NSArray *v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
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
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v3);
          v10 = -[THWReviewTextAnswerLayout initWithChoice:index:delegate:]([THWReviewTextAnswerLayout alloc], "initWithChoice:index:delegate:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), (char *)i + v7, self);
          -[NSMutableArray addObject:](v4, "addObject:", v10);

        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v7 += (uint64_t)i;
      }
      while (v6);
    }
    self->_answerLayouts = (NSArray *)-[NSMutableArray copy](v4, "copy");
  }
}

- (unint64_t)questionIndex
{
  return self->_questionIndex;
}

- (THWReviewQuestion)question
{
  return self->_question;
}

- (THWStackedControlContainer)answerStack
{
  return self->_answerStack;
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
