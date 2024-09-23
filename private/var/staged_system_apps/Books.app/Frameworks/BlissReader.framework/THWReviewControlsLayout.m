@implementation THWReviewControlsLayout

- (THWReviewControlsLayout)initWithDelegate:(id)a3
{
  THWReviewControlsLayout *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWReviewControlsLayout;
  result = -[THWReviewControlsLayout initWithInfo:](&v5, "initWithInfo:", 0);
  if (result)
    result->_delegate = (THWReviewControlsLayoutDelegate *)a3;
  return result;
}

- (THWReviewControlsLayout)init
{
  return -[THWReviewControlsLayout initWithDelegate:](self, "initWithDelegate:", 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewControlsLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THWReviewControlsRep, a2);
}

- (CGRect)prevButtonFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 2.0;
  v4 = 31.0;
  v5 = 31.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)nextButtonFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(-[THWReviewControlsLayout geometry](self, "geometry"), "frame");
  v3 = v2 + -31.0;
  v4 = 2.0;
  v5 = 31.0;
  v6 = 31.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)checkAnswerButtonFrame
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v2 = objc_msgSend(-[THWReviewControlsLayout geometry](self, "geometry"), "frame");
  v4 = TSURound(v2, (v3 + -107.0) * 0.5);
  v5 = 107.0;
  v6 = 2.0;
  v7 = 31.0;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (double)buttonCornerRadius
{
  return 3.0;
}

- (double)buttonStrokeWidth
{
  return 1.0;
}

- (NSString)buttonFontName
{
  return (NSString *)objc_msgSend(+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 12.0), "fontName");
}

- (double)buttonFontSize
{
  return 12.0;
}

- (TSUColor)primaryColor
{
  return (TSUColor *)-[THWReviewControlsLayoutDelegate primaryColor](self->_delegate, "primaryColor");
}

- (TSUColor)disabledPrimaryColor
{
  return (TSUColor *)-[THWReviewControlsLayoutDelegate disabledPrimaryColor](self->_delegate, "disabledPrimaryColor");
}

- (void)updateChildrenFromInfo
{
  THWButtonControlLayout *v3;
  THWButtonControlLayout *v4;
  THWButtonControlLayout *v5;
  objc_super v6;

  if (!self->_prevButton)
  {
    v3 = objc_alloc_init(THWButtonControlLayout);
    self->_prevButton = v3;
    -[THWControlLayout setTag:](v3, "setTag:", 0);
  }
  if (!self->_nextButton)
  {
    v4 = objc_alloc_init(THWButtonControlLayout);
    self->_nextButton = v4;
    -[THWControlLayout setTag:](v4, "setTag:", 1);
  }
  if (!self->_checkAnswerButton)
  {
    v5 = objc_alloc_init(THWButtonControlLayout);
    self->_checkAnswerButton = v5;
    -[THWControlLayout setTag:](v5, "setTag:", 2);
  }
  v6.receiver = self;
  v6.super_class = (Class)THWReviewControlsLayout;
  -[THWContainerLayout updateChildrenFromInfo](&v6, "updateChildrenFromInfo");
}

- (id)dependentLayouts
{
  NSMutableArray *v3;
  objc_super v5;

  v3 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", -[THWReviewControlsLayout children](self, "children"));
  v5.receiver = self;
  v5.super_class = (Class)THWReviewControlsLayout;
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", -[THWReviewControlsLayout dependentLayouts](&v5, "dependentLayouts"));
  return v3;
}

- (void)validate
{
  objc_super v3;

  -[THWReviewControlsLayout invalidateFrame](self, "invalidateFrame");
  v3.receiver = self;
  v3.super_class = (Class)THWReviewControlsLayout;
  -[THWReviewControlsLayout validate](&v3, "validate");
}

- (id)additionalLayouts
{
  id v3;
  void *v4;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = v3;
  if (self->_prevButton)
    objc_msgSend(v3, "addObject:");
  if (self->_nextButton)
    objc_msgSend(v4, "addObject:");
  if (self->_checkAnswerButton)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (id)layoutGeometryForLayout:(id)a3
{
  void *v4;
  char *v5;
  id v6;

  v4 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWControl, a3);
  if (!v4)
    return 0;
  v5 = (char *)objc_msgSend(v4, "tag");
  if (v5 == (_BYTE *)&dword_0 + 2)
  {
    v6 = objc_alloc((Class)TSDLayoutGeometry);
    -[THWReviewControlsLayout checkAnswerButtonFrame](self, "checkAnswerButtonFrame");
    return objc_msgSend(v6, "initWithFrame:");
  }
  if (v5 == (_BYTE *)&dword_0 + 1)
  {
    v6 = objc_alloc((Class)TSDLayoutGeometry);
    -[THWReviewControlsLayout nextButtonFrame](self, "nextButtonFrame");
    return objc_msgSend(v6, "initWithFrame:");
  }
  if (v5)
    return 0;
  v6 = objc_alloc((Class)TSDLayoutGeometry);
  -[THWReviewControlsLayout prevButtonFrame](self, "prevButtonFrame");
  return objc_msgSend(v6, "initWithFrame:");
}

- (unint64_t)tag
{
  return self->tag;
}

- (void)setTag:(unint64_t)a3
{
  self->tag = a3;
}

- (unint64_t)index
{
  return self->index;
}

- (void)setIndex:(unint64_t)a3
{
  self->index = a3;
}

- (THWButtonControlLayout)prevButton
{
  return self->_prevButton;
}

- (THWButtonControlLayout)nextButton
{
  return self->_nextButton;
}

- (THWButtonControlLayout)checkAnswerButton
{
  return self->_checkAnswerButton;
}

- (THWReviewControlsLayoutDelegate)delegate
{
  return self->_delegate;
}

@end
