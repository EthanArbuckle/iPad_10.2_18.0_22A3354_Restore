@implementation THWReviewLayout

- (THWReviewLayout)initWithInfo:(id)a3
{
  THWReviewLayout *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWReviewLayout;
  result = -[THWReviewLayout initWithInfo:](&v4, "initWithInfo:", a3);
  if (result)
    result->_questionIndex = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (void)p_invalidateExternal
{
  -[THWReviewLayout invalidateFrame](self, "invalidateFrame");
  -[THWReviewLayout invalidateChildren](self, "invalidateChildren");
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
  -[THWReviewLayout p_invalidateExternal](self, "p_invalidateExternal");
}

- (void)wasAddedToLayoutController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWReviewLayout;
  -[THWReviewLayout wasAddedToLayoutController:](&v4, "wasAddedToLayoutController:", a3);
  -[THWReviewLayout p_invalidateExternal](self, "p_invalidateExternal");
}

- (BOOL)isExpanded
{
  THWWidgetLayoutDelegate *delegate;

  delegate = self->_delegate;
  if (delegate)
    LOBYTE(delegate) = -[THWWidgetLayoutDelegate widgetLayoutMode:](delegate, "widgetLayoutMode:", self) == 1;
  return (char)delegate;
}

- (BOOL)isCompactFlowPresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsCompactFlow:](-[THWReviewLayout delegate](self, "delegate"), "widgetLayoutIsCompactFlow:", self);
}

- (BOOL)isReflowablePresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsReflowablePresentation:](-[THWReviewLayout delegate](self, "delegate"), "widgetLayoutIsReflowablePresentation:", self);
}

- (CGRect)controlsFrame
{
  double x;
  double width;
  double v4;
  double v5;
  CGRect result;

  x = self->_stageFrame.origin.x;
  width = self->_stageFrame.size.width;
  v4 = self->_stageFrame.origin.y + self->_stageFrame.size.height + 10.0;
  v5 = 34.0;
  result.size.height = v5;
  result.size.width = width;
  result.origin.y = v4;
  result.origin.x = x;
  return result;
}

- (CGSize)controlsSizeWithPanelWidth:(double)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = a3 + -24.0;
  v4 = 34.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)hasTitle
{
  return objc_msgSend(objc_msgSend(-[THWReviewLayout info](self, "info"), "adornmentInfo"), "title") != 0;
}

- (id)p_colorForStorage:(id)a3
{
  id v4;
  uint64_t v5;

  if (!a3)
    return 0;
  v4 = objc_msgSend(objc_msgSend(a3, "characterStyleAtCharIndex:effectiveRange:", 0, 0), "valueForProperty:", 18);
  if (!v4)
  {
    v4 = objc_msgSend(objc_msgSend(a3, "paragraphStyleAtCharIndex:effectiveRange:", 0, 0), "valueForProperty:", 18);
    v5 = objc_opt_class(TSUColor);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewLayout p_colorForStorage:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewLayout.m"), 207, CFSTR("TSWPParagraph style returned non-TSUColor"));
  }
  return v4;
}

- (id)p_labelColor
{
  id result;

  result = objc_msgSend(objc_msgSend(objc_msgSend(-[THWReviewLayout info](self, "info"), "adornmentInfo"), "title"), "containedStorage");
  if (result)
    return -[THWReviewLayout p_colorForStorage:](self, "p_colorForStorage:", result);
  return result;
}

- (id)p_backgroundFill
{
  NSNull *v3;
  id v4;

  v3 = +[NSNull null](NSNull, "null");
  v4 = objc_msgSend(objc_msgSend(-[THWReviewLayout info](self, "info"), "adornmentInfo"), "background");
  if (v4)
    return objc_msgSend(objc_msgSend(v4, "style"), "valueForProperty:", 516);
  else
    return v3;
}

- (id)p_backgroundColorFill
{
  id v2;
  uint64_t v3;

  v2 = -[THWReviewLayout p_backgroundFill](self, "p_backgroundFill");
  v3 = objc_opt_class(TSDColorFill);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    return v2;
  else
    return +[TSDColorFill whiteColor](TSDColorFill, "whiteColor");
}

- (id)p_fallbackTextColorToContrastWidgetBackground
{
  id v3;
  double v4;

  v3 = +[TSUColor blackColor](TSUColor, "blackColor");
  if (objc_msgSend(objc_msgSend(-[THWReviewLayout info](self, "info"), "adornmentInfo"), "background")
    && (objc_msgSend(-[THWReviewLayout p_backgroundColorFill](self, "p_backgroundColorFill"), "luminance"), v4 < 0.5))
  {
    return +[TSUColor whiteColor](TSUColor, "whiteColor");
  }
  else
  {
    return v3;
  }
}

- (TSUColor)primaryColor
{
  TSUColor *result;
  TSUColor *v4;
  TSUColor *v5;

  if (-[THWReviewLayout isExpanded](self, "isExpanded"))
    return (TSUColor *)+[TSUColor blackColor](TSUColor, "blackColor");
  result = self->_primaryColor;
  if (!result)
  {
    v4 = (TSUColor *)objc_msgSend(-[THWReviewLayout info](self, "info"), "primaryColor");
    self->_primaryColor = v4;
    if (!v4)
    {
      v4 = -[THWReviewLayout p_labelColor](self, "p_labelColor");
      if (!v4)
        v4 = -[THWReviewLayout p_fallbackTextColorToContrastWidgetBackground](self, "p_fallbackTextColorToContrastWidgetBackground");
      self->_primaryColor = v4;
    }
    v5 = v4;
    return self->_primaryColor;
  }
  return result;
}

- (TSUColor)disabledPrimaryColor
{
  TSUColor *v4;
  CGColor *v5;
  CGFloat Alpha;
  CGColor *CopyWithAlpha;

  if (-[THWReviewLayout isExpanded](self, "isExpanded"))
    return (TSUColor *)+[TSUColor grayColor](TSUColor, "grayColor");
  if (!self->_disabledPrimaryColor)
  {
    v4 = -[THWReviewLayout primaryColor](self, "primaryColor");
    if (v4)
    {
      v5 = (CGColor *)-[TSUColor CGColor](v4, "CGColor");
      Alpha = CGColorGetAlpha(v5);
      CopyWithAlpha = CGColorCreateCopyWithAlpha(v5, Alpha * 0.4);
      self->_disabledPrimaryColor = (TSUColor *)objc_msgSend(objc_alloc((Class)TSUColor), "initWithCGColor:", CopyWithAlpha);
      CGColorRelease(CopyWithAlpha);
    }
  }
  return self->_disabledPrimaryColor;
}

- (CGSize)minimumContentSize
{
  uint64_t v3;
  double v4;
  id v5;
  double v6;
  double v7;
  CGSize result;

  v3 = objc_opt_class(THDocumentRoot);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, objc_msgSend(objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "canvas"), "documentRoot")).n128_u64[0];
  objc_msgSend(objc_msgSend(v5, "bookDescription", v4), "bookIsPaginatedForLandscape");
  v6 = 768.0;
  v7 = 704.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)maximumContentSize
{
  uint64_t v3;
  double v4;
  id v5;
  unsigned int v6;
  double v7;
  double v8;
  CGSize result;

  v3 = objc_opt_class(THDocumentRoot);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, objc_msgSend(objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "canvas"), "documentRoot")).n128_u64[0];
  v6 = objc_msgSend(objc_msgSend(v5, "bookDescription", v4), "bookIsPaginatedForLandscape");
  v7 = 768.0;
  if (v6)
    v7 = 1024.0;
  v8 = 1004.0;
  if (v6)
    v8 = 748.0;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)p_expandedSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[THWWidgetLayoutDelegate widgetLayoutBounds](self->_delegate, "widgetLayoutBounds");
  v4 = v3;
  v6 = v5;
  -[THWReviewLayout minimumContentSize](self, "minimumContentSize");
  v8 = v7;
  -[THWReviewLayout maximumContentSize](self, "maximumContentSize");
  if (v4 < v9)
    v9 = v4;
  if (v8 >= v9)
    v9 = v8;
  if (v6 < v10)
    v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGRect)p_expandedWidgetLayoutFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[THWWidgetLayoutDelegate widgetLayoutBounds](self->_delegate, "widgetLayoutBounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)p_expandedWidgetStageFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[THWWidgetLayoutDelegate widgetLayoutBounds](self->_delegate, "widgetLayoutBounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)layoutGeometryFromProvider
{
  id v3;
  objc_super v5;

  if (-[THWReviewLayout isExpanded](self, "isExpanded"))
  {
    v3 = objc_alloc((Class)TSDLayoutGeometry);
    -[THWReviewLayout p_expandedWidgetLayoutFrame](self, "p_expandedWidgetLayoutFrame");
    return objc_msgSend(v3, "initWithFrame:");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)THWReviewLayout;
    return -[THWReviewLayout layoutGeometryFromProvider](&v5, "layoutGeometryFromProvider");
  }
}

- (void)updateChildrenFromInfo
{
  THWReviewControlsLayout *v3;
  objc_super v4;

  if (!self->_stageCanvasLayout)
    self->_stageCanvasLayout = -[THWControlLayout initWithTag:]([THWPagedCanvasControlLayout alloc], "initWithTag:", 0);
  if (!self->_controlsLayout)
  {
    v3 = -[THWReviewControlsLayout initWithDelegate:]([THWReviewControlsLayout alloc], "initWithDelegate:", self);
    self->_controlsLayout = v3;
    -[THWReviewControlsLayout setTag:](v3, "setTag:", 1);
  }
  -[THWReviewLayout p_updatePageLayouts](self, "p_updatePageLayouts");
  if (self->_questionIndex == 0x7FFFFFFFFFFFFFFFLL)
    self->_questionIndex = -[THWReviewLayout p_initialQuestionIndex](self, "p_initialQuestionIndex");
  v4.receiver = self;
  v4.super_class = (Class)THWReviewLayout;
  -[THWContainerLayout updateChildrenFromInfo](&v4, "updateChildrenFromInfo");
}

- (BOOL)isExpandedOnly
{
  return objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THWExpandedOnlyHosting, objc_msgSend(-[THWReviewLayout info](self, "info"), "parentInfo")), "isExpandedOnly");
}

- (unint64_t)questionLayoutMode:(id)a3
{
  unsigned int v4;

  if (!-[THWReviewLayout isExpanded](self, "isExpanded", a3))
    return 0;
  v4 = objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "isCompactWidth");
  if (objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "isCompactHeight"))
    return 2;
  else
    return v4;
}

- (CGSize)questionLayoutSize:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
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
  CGSize result;

  v5 = objc_opt_class(TSDLayout);
  TSUDynamicCast(v5, a3);
  v7 = v6;
  v8 = objc_opt_class(THWStackedControlContainerLayout);
  *(_QWORD *)&v9 = TSUDynamicCast(v8, objc_msgSend(v7, "parent")).n128_u64[0];
  v11 = v10;
  -[THWReviewLayout stackedControlContainerWidth:](self, "stackedControlContainerWidth:", v10, v9);
  v13 = v12;
  -[THWReviewLayout stackedControlContainerMinHeight:](self, "stackedControlContainerMinHeight:", v11);
  v15 = v14;
  -[THWReviewLayout stackedControlContainerInsets:](self, "stackedControlContainerInsets:", v11);
  v18 = v13 - v16 - v17;
  v21 = v15 - v19 - v20;
  v22 = v18;
  result.height = v21;
  result.width = v22;
  return result;
}

- (CGSize)questionAnswersLayoutSize:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  v5 = objc_opt_class(TSDLayout);
  TSUDynamicCast(v5, a3);
  v7 = v6;
  v8 = objc_opt_class(THWStackedControlContainerLayout);
  *(_QWORD *)&v9 = TSUDynamicCast(v8, objc_msgSend(v7, "parent")).n128_u64[0];
  v11 = v10;
  -[THWReviewLayout stackedControlContainerWidth:](self, "stackedControlContainerWidth:", v10, v9);
  v13 = v12;
  -[THWReviewLayout stackedControlContainerInsets:](self, "stackedControlContainerInsets:", v11);
  v15 = v14;
  v17 = v16;
  objc_msgSend(v11, "heightForFlexibleChildLayout:", v7);
  v19 = v18;
  v20 = v13 - v15 - v17;
  result.height = v19;
  result.width = v20;
  return result;
}

- (BOOL)usePhoneLayout
{
  if (-[THWWidgetLayoutDelegate widgetLayoutMode:](self->_delegate, "widgetLayoutMode:", self) != 1)
    return 0;
  if ((objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "isCompactWidth") & 1) != 0)
    return 1;
  return objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "isCompactHeight");
}

- (id)controlContainerChildInfosForLayout:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;

  if (objc_msgSend(a3, "tag") != &dword_4)
    return 0;
  v5 = +[NSMutableArray array](NSMutableArray, "array");
  v6 = objc_msgSend(a3, "index");
  if (!-[THWReviewLayout usePhoneLayout](self, "usePhoneLayout"))
  {
    v7 = -[THWReviewLayout questionNumberStorageAtPageIndex:](self, "questionNumberStorageAtPageIndex:", v6);
    if (v7)
      objc_msgSend(v5, "addObject:", v7);
  }
  v8 = objc_msgSend(-[THWReviewLayout p_questionAtPageIndex:](self, "p_questionAtPageIndex:", v6), "prompt");
  if (v8)
    objc_msgSend(v5, "addObject:", v8);
  return v5;
}

- (id)controlContainerAdditionalChildLayouts:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  THWReviewSummaryLayout *summaryLayout;
  id v11;
  id v12;

  if (objc_msgSend(a3, "tag") == &dword_4)
  {
    v5 = objc_msgSend(a3, "index");
    v6 = +[NSMutableArray array](NSMutableArray, "array");
    v7 = -[THWReviewLayout p_dividerLayoutForPageIndex:](self, "p_dividerLayoutForPageIndex:", v5);
    if (v7)
      objc_msgSend(v6, "addObject:", v7);
    v8 = -[THWReviewLayout p_questionLayoutForPageIndex:](self, "p_questionLayoutForPageIndex:", v5);
    if (v8)
      objc_msgSend(v6, "addObject:", v8);
    return v6;
  }
  if (objc_msgSend(a3, "tag") == (char *)&dword_4 + 1)
  {
    summaryLayout = self->_summaryLayout;
    if (summaryLayout)
      return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", summaryLayout);
    summaryLayout = -[THWReviewSummaryLayout initWithDelegate:]([THWReviewSummaryLayout alloc], "initWithDelegate:", self);
    self->_summaryLayout = summaryLayout;
    if (summaryLayout)
      return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", summaryLayout);
    return 0;
  }
  if (objc_msgSend(a3, "tag") != (char *)&dword_0 + 2)
    return 0;
  v11 = objc_msgSend(a3, "index");
  if (v11 >= (id)-[NSArray count](self->_scrollableCanvasLayouts, "count"))
    return 0;
  v12 = -[NSArray objectAtIndexedSubscript:](self->_scrollableCanvasLayouts, "objectAtIndexedSubscript:", v11);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1);
}

- (double)stackedControlContainerWidth:(id)a3
{
  return CGRectGetWidth(self->_stageFrame);
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
  unsigned int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v3 = -[THWReviewLayout p_useCompactPadding](self, "p_useCompactPadding", a3);
  v4 = 13.0;
  if (v3)
    v4 = 7.0;
  v5 = 15.0;
  v6 = 15.0;
  v7 = v4;
  result.right = v6;
  result.bottom = v7;
  result.left = v5;
  result.top = v4;
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  id v10;
  id v11;
  id v12;
  double result;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  double v17;

  v6 = objc_msgSend(a3, "index");
  v7 = objc_opt_class(TSWPStorage);
  *(_QWORD *)&v9 = TSUDynamicCast(v7, objc_msgSend(a4, "info")).n128_u64[0];
  if (!v8)
  {
    v14 = objc_opt_class(THWReviewDividerLayout);
    *(_QWORD *)&result = TSUDynamicCast(v14, a4).n128_u64[0];
    if (!v15)
      return 0.0;
    goto LABEL_6;
  }
  v10 = v8;
  v11 = objc_msgSend(-[THWReviewLayout info](self, "info", v9), "questionAtIndex:", v6);
  if (-[THWReviewLayout questionNumberStorageAtPageIndex:](self, "questionNumberStorageAtPageIndex:", v6) != v10)
  {
    v12 = objc_msgSend(v11, "prompt");
    result = 0.0;
    if (v12 != v10)
      return result;
LABEL_6:
    v16 = !-[THWReviewLayout p_useCompactPadding](self, "p_useCompactPadding", result);
    result = 14.0;
    v17 = 7.0;
    goto LABEL_8;
  }
  v16 = !-[THWReviewLayout usePhoneLayout](self, "usePhoneLayout");
  result = 5.0;
  v17 = 0.0;
LABEL_8:
  if (!v16)
    return v17;
  return result;
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
  uint64_t v6;
  id result;
  double v8;
  id v9;

  v6 = objc_opt_class(THWReviewDividerLayout);
  *(_QWORD *)&v8 = TSUDynamicCast(v6, a4).n128_u64[0];
  if (result)
  {
    -[THWReviewLayout p_useCompactPadding](self, "p_useCompactPadding", v8);
    v9 = objc_alloc((Class)TSDLayoutGeometry);
    return objc_msgSend(v9, "initWithFrame:", TSDRectWithSize(v9));
  }
  return result;
}

- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4
{
  return 0;
}

- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4
{
  return 0;
}

- (BOOL)stackedControlContainer:(id)a3 isHeightFlexibleForLayout:(id)a4
{
  return TSUProtocolCast(&OBJC_PROTOCOL___THWReviewQuestionLayout, a4, a3) != 0;
}

- (double)stackedControlContainerMinHeight:(id)a3
{
  return self->_stageFrame.size.height;
}

- (id)childInfosForLayout
{
  id v3;

  v3 = objc_msgSend(-[THWReviewLayout info](self, "info"), "childInfos");
  if (!-[THWReviewLayout isExpanded](self, "isExpanded")
    && objc_msgSend(-[THWReviewLayout info](self, "info"), "adornmentInfo"))
  {
    v3 = objc_msgSend(objc_msgSend(-[THWReviewLayout info](self, "info"), "adornmentInfo"), "interleavedInfosWithInfos:", v3);
  }
  if (v3)
    return v3;
  else
    return +[NSArray array](NSArray, "array");
}

- (id)infosForStagePages:(_NSRange)a3
{
  NSArray *stagePages;
  NSUInteger length;
  NSUInteger location;

  stagePages = self->_stagePages;
  if (stagePages
    && (length = a3.length, location = a3.location, a3.location + a3.length <= -[NSArray count](stagePages, "count")))
  {
    return -[NSArray subarrayWithRange:](self->_stagePages, "subarrayWithRange:", location, length);
  }
  else
  {
    return 0;
  }
}

- (id)infosForScrollablePage:(unint64_t)a3
{
  id v6;

  if (-[NSArray count](self->_questionStackedContainers, "count") <= a3)
    return 0;
  v6 = -[NSArray objectAtIndexedSubscript:](self->_questionStackedContainers, "objectAtIndexedSubscript:", a3);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1);
}

- (id)layoutForQuestion:(id)a3
{
  return -[THWReviewLayout p_questionLayoutForPageIndex:](self, "p_questionLayoutForPageIndex:", objc_msgSend(-[THWReviewLayout info](self, "info"), "indexOfQuestion:", a3));
}

- (id)additionalLayouts
{
  id v3;
  void *v4;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = v3;
  if (self->_stageCanvasLayout)
    objc_msgSend(v3, "addObject:");
  if (self->_controlsLayout && !-[THWReviewLayout isExpanded](self, "isExpanded"))
    objc_msgSend(v4, "addObject:", self->_controlsLayout);
  return v4;
}

- (id)computeLayoutGeometry
{
  id v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  char v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)THWReviewLayout;
  v3 = -[THWReviewLayout computeLayoutGeometry](&v20, "computeLayoutGeometry");
  if (-[THWReviewLayout isExpanded](self, "isExpanded"))
  {
    -[THWReviewLayout p_expandedWidgetStageFrame](self, "p_expandedWidgetStageFrame");
    self->_stageFrame.origin.x = v4;
    self->_stageFrame.origin.y = v5;
    self->_stageFrame.size.width = v6;
    self->_stageFrame.size.height = v7;
    self->_stageCornerRadius = 0.0;
    if (-[THWReviewLayout isExpanded](self, "isExpanded"))
    {
      v8 = objc_opt_respondsToSelector(self->_delegate, "expandedHeightForPanel:allowDefault:");
      v9 = 0.0;
      v10 = 0.0;
      if ((v8 & 1) != 0)
      {
        -[THWWidgetLayoutDelegate expandedHeightForPanel:allowDefault:](self->_delegate, "expandedHeightForPanel:allowDefault:", 0, 1, 0.0);
        v10 = v11;
        -[THWWidgetLayoutDelegate expandedHeightForPanel:allowDefault:](self->_delegate, "expandedHeightForPanel:allowDefault:", 1, 1);
        v9 = fmax(v12, 54.0);
      }
      self->_stageFrame.origin.y = v10 + self->_stageFrame.origin.y;
      self->_stageFrame.size.height = self->_stageFrame.size.height - (v9 + v10);
    }
  }
  else
  {
    v13 = objc_msgSend(-[THWReviewLayout info](self, "info"), "stageGeometry");
    objc_msgSend(v13, "frame");
    self->_stageFrame.origin.x = v14;
    self->_stageFrame.origin.y = v15;
    self->_stageFrame.size.width = v16;
    self->_stageFrame.size.height = v17;
    objc_msgSend(v13, "cornerRadius");
    self->_stageCornerRadius = v18;
  }
  return v3;
}

- (unint64_t)numberOfStagePages
{
  unint64_t result;

  result = (unint64_t)objc_msgSend(objc_msgSend(-[THWReviewLayout info](self, "info"), "questions"), "count");
  if (result > 1)
    ++result;
  return result;
}

- (void)setQuestionIndex:(unint64_t)a3
{
  if (self->_questionIndex != a3)
  {
    self->_questionIndex = a3;
    -[THWReviewLayout invalidateChildren](self, "invalidateChildren");
  }
}

- (unint64_t)questionCount
{
  return (unint64_t)objc_msgSend(objc_msgSend(-[THWReviewLayout info](self, "info"), "questions"), "count");
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (void)invalidateSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewLayout;
  -[THWReviewLayout invalidateSize](&v3, "invalidateSize");
  -[THWReviewLayout invalidateQuestionLayouts](self, "invalidateQuestionLayouts");
}

- (void)invalidateQuestionLayouts
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = -[TSUIntegerKeyDictionary allValues](self->_questionLayouts, "allValues");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v7), "invalidateSize");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = -[TSUIntegerKeyDictionary allValues](self->_dividerLayouts, "allValues", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "invalidateSize");
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }
}

- (id)layoutGeometryForLayout:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  double width;
  double height;
  double x;
  double y;
  id v13;
  id v14;
  double v15;
  CGRect *p_stageFrame;

  v5 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWControl, a3);
  if (v5)
  {
    v6 = v5;
    switch((unint64_t)objc_msgSend(v5, "tag"))
    {
      case 0uLL:
        v7 = objc_alloc((Class)TSDLayoutGeometry);
        x = self->_stageFrame.origin.x;
        y = self->_stageFrame.origin.y;
        width = self->_stageFrame.size.width;
        height = self->_stageFrame.size.height;
        return objc_msgSend(v7, "initWithFrame:", x, y, width, height);
      case 1uLL:
        v13 = objc_alloc((Class)TSDLayoutGeometry);
        -[THWReviewLayout controlsFrame](self, "controlsFrame");
        goto LABEL_9;
      case 2uLL:
        v14 = objc_alloc((Class)TSDLayoutGeometry);
        v15 = (double)(unint64_t)objc_msgSend(v6, "index");
        p_stageFrame = &self->_stageFrame;
        x = CGRectGetWidth(*p_stageFrame) * v15;
        width = p_stageFrame->size.width;
        height = p_stageFrame->size.height;
        y = 0.0;
        v7 = v14;
        return objc_msgSend(v7, "initWithFrame:", x, y, width, height);
      case 3uLL:
      case 5uLL:
        v7 = objc_alloc((Class)TSDLayoutGeometry);
        width = self->_stageFrame.size.width;
        height = self->_stageFrame.size.height;
        x = 0.0;
        y = 0.0;
        return objc_msgSend(v7, "initWithFrame:", x, y, width, height);
      default:
        return 0;
    }
  }
  if (self->_summaryLayout != a3)
    return 0;
  v13 = objc_alloc((Class)TSDLayoutGeometry);
  x = TSDRectWithSize(v13);
LABEL_9:
  v7 = v13;
  return objc_msgSend(v7, "initWithFrame:", x, y, width, height);
}

- (BOOL)reviewSummaryShouldShowResults
{
  return -[THWReviewLayout p_haveAnswersBeenCheckedForAllQuestions](self, "p_haveAnswersBeenCheckedForAllQuestions");
}

- (unint64_t)reviewSummaryQuestionCount
{
  return (unint64_t)objc_msgSend(objc_msgSend(-[THWReviewLayout info](self, "info"), "questions"), "count");
}

- (unint64_t)reviewSummaryCorrectCount
{
  return -[THWReviewLayout p_countCorrectAnswers](self, "p_countCorrectAnswers");
}

- (id)p_paragraphStyleWithSize:(double)a3 bold:(BOOL)a4 indent:(double)a5
{
  _BOOL8 v6;
  id v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;

  v6 = a4;
  v9 = objc_alloc_init((Class)TSSPropertyMap);
  objc_msgSend(v9, "setBoolValue:forProperty:", v6, 19);
  *(float *)&v10 = a3;
  objc_msgSend(v9, "setFloatValue:forProperty:", 17, v10);
  objc_msgSend(v9, "setIntValue:forProperty:", 2, 86);
  *(float *)&a5 = a5;
  LODWORD(v11) = LODWORD(a5);
  objc_msgSend(v9, "setFloatValue:forProperty:", 81, v11);
  LODWORD(v12) = LODWORD(a5);
  objc_msgSend(v9, "setFloatValue:forProperty:", 80, v12);
  objc_msgSend(v9, "setIntValue:forProperty:", 0, 21);
  objc_msgSend(v9, "setIntValue:forProperty:", 0, 22);
  objc_msgSend(v9, "setObject:forProperty:", +[TSWPLineSpacing lineSpacing](TSWPLineSpacing, "lineSpacing"), 85);
  v13 = objc_msgSend(-[THWReviewLayout info](self, "info"), "questionNumberStyle");
  v14 = objc_msgSend(objc_msgSend(v13, "stylesheet"), "variationOfStyle:propertyMap:", v13, v9);

  return v14;
}

- (id)reviewSummaryResultsParagraphStyle
{
  return -[THWReviewLayout p_paragraphStyleWithSize:bold:indent:](self, "p_paragraphStyleWithSize:bold:indent:", 1, 28.0, 0.0);
}

- (id)reviewSummaryCheckingParagraphStyleWithIndent:(double)a3
{
  return -[THWReviewLayout p_paragraphStyleWithSize:bold:indent:](self, "p_paragraphStyleWithSize:bold:indent:", 0, 24.0, a3);
}

- (id)reviewSummaryInstructionalParagraphStyle
{
  return -[THWReviewLayout p_paragraphStyleWithSize:bold:indent:](self, "p_paragraphStyleWithSize:bold:indent:", 0, 21.0, 0.0);
}

- (id)reviewSummaryTitleParagraphStyle
{
  return -[THWReviewLayout p_paragraphStyleWithSize:bold:indent:](self, "p_paragraphStyleWithSize:bold:indent:", 1, 14.0, 0.0);
}

- (id)reviewSummaryContext
{
  return objc_msgSend(-[THWReviewLayout info](self, "info"), "context");
}

- (double)p_margin
{
  double result;

  objc_msgSend(-[THWReviewLayout info](self, "info"), "contentPadding");
  return result;
}

- (BOOL)p_useCompactPadding
{
  if (-[THWReviewLayout isExpanded](self, "isExpanded")
    && objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "isCompactWidth"))
  {
    return objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "isCompactHeight");
  }
  else
  {
    return 0;
  }
}

- (id)p_questionAtPageIndex:(unint64_t)a3
{
  return objc_msgSend(-[THWReviewLayout info](self, "info"), "questionAtIndex:", a3);
}

- (void)p_updatePageLayouts
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t i;
  THWControlContainer *v9;
  THWScrollableCanvasControlLayout *v10;
  THWStackedControlContainer *v11;
  THWControlContainer *v12;
  THWScrollableCanvasControlLayout *v13;
  THWControlContainer *v14;
  id v15;

  v3 = -[THWReviewLayout numberOfStagePages](self, "numberOfStagePages");
  if ((void *)-[NSArray count](self->_stagePages, "count") != v3)
  {

    self->_stagePages = 0;
    self->_scrollableCanvasLayouts = 0;

    self->_questionStackedContainers = 0;
    if (v3)
    {
      v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v3);
      v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v3);
      v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v3);
      v6 = objc_msgSend(objc_msgSend(-[THWReviewLayout info](self, "info"), "questions"), "count");
      if (v6)
      {
        v7 = (unint64_t)v6;
        for (i = 0; i != v7; ++i)
        {
          v9 = -[THWControlContainer initWithDelegate:]([THWControlContainer alloc], "initWithDelegate:", self);
          -[THWControlContainer setTag:](v9, "setTag:", 2);
          -[THWControlContainer setIndex:](v9, "setIndex:", i);
          objc_msgSend(v4, "addObject:", v9);

          v10 = objc_alloc_init(THWScrollableCanvasControlLayout);
          -[THWControlLayout setTag:](v10, "setTag:", 3);
          -[THWControlLayout setIndex:](v10, "setIndex:", i);
          objc_msgSend(v5, "addObject:", v10);

          v11 = -[THWStackedControlContainer initWithDelegate:]([THWStackedControlContainer alloc], "initWithDelegate:", self);
          -[THWControlContainer setTag:](v11, "setTag:", 4);
          -[THWControlContainer setIndex:](v11, "setIndex:", i);
          objc_msgSend(v15, "addObject:", v11);

        }
        if (v7 > 1)
        {
          v12 = -[THWControlContainer initWithDelegate:]([THWControlContainer alloc], "initWithDelegate:", self);
          -[THWControlContainer setTag:](v12, "setTag:", 2);
          -[THWControlContainer setIndex:](v12, "setIndex:", v7);
          objc_msgSend(v4, "addObject:", v12);

          v13 = objc_alloc_init(THWScrollableCanvasControlLayout);
          -[THWControlLayout setTag:](v13, "setTag:", 3);
          -[THWControlLayout setIndex:](v13, "setIndex:", v7);
          objc_msgSend(v5, "addObject:", v13);

          v14 = -[THWControlContainer initWithDelegate:]([THWControlContainer alloc], "initWithDelegate:", self);
          -[THWControlContainer setTag:](v14, "setTag:", 5);
          objc_msgSend(v15, "addObject:", v14);

        }
      }
      self->_stagePages = (NSArray *)objc_msgSend(v4, "copy");
      self->_scrollableCanvasLayouts = (NSArray *)objc_msgSend(v5, "copy");
      self->_questionStackedContainers = (NSArray *)objc_msgSend(v15, "copy");

    }
  }
}

- (id)questionNumberStorageAtPageIndex:(unint64_t)a3
{
  id v5;
  id v6;
  id v7;
  NSNumber *v8;
  THWPStorage *v9;
  NSString *v10;
  id v11;
  id v12;
  id v13;

  v5 = -[THWReviewLayout info](self, "info");
  v6 = objc_msgSend(objc_msgSend(v5, "questions"), "count");
  if ((uint64_t)v6 < 2)
    return 0;
  v7 = v6;
  v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3);
  v9 = (THWPStorage *)-[NSMutableDictionary objectForKey:](self->_questionNumberStorages, "objectForKey:", v8);
  if (!v9)
  {
    if (!self->_questionNumberStorages)
      self->_questionNumberStorages = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Question %lu of %lu"), &stru_43D7D8, 0), a3 + 1, v7);
    v11 = objc_msgSend(v5, "questionNumberStyle");
    v12 = objc_msgSend(v5, "context");
    v13 = objc_msgSend(objc_alloc((Class)TSSStylesheet), "initWithContext:", v12);
    v9 = -[THWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:]([THWPStorage alloc], "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:", v12, v10, 3, v13, v11, +[TSWPListStyle defaultStyleWithContext:](TSWPListStyle, "defaultStyleWithContext:", v12), 0, 0);

    -[NSMutableDictionary setObject:forKey:](self->_questionNumberStorages, "setObject:forKey:", v9, v8);
  }
  return v9;
}

- (id)summaryTitleStorage
{
  id result;

  result = self->_summaryTitleStorage;
  if (!result)
  {
    result = -[THWReviewSummaryLayout storageWithStyle:string:](-[THWReviewLayout summaryLayout](self, "summaryLayout"), "storageWithStyle:string:", -[THWReviewSummaryLayoutDelegate reviewSummaryTitleParagraphStyle](-[THWReviewSummaryLayout delegate](-[THWReviewLayout summaryLayout](self, "summaryLayout"), "delegate"), "reviewSummaryTitleParagraphStyle"), objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Summary"), &stru_43D7D8, 0));
    self->_summaryTitleStorage = (TSWPStorage *)result;
  }
  return result;
}

- (id)p_questionLayoutForPageIndex:(unint64_t)a3
{
  TSUIntegerKeyDictionary *questionLayouts;
  id v6;
  id v7;
  objc_class *v8;

  questionLayouts = self->_questionLayouts;
  if (questionLayouts)
  {
    v6 = -[TSUIntegerKeyDictionary objectForKey:](questionLayouts, "objectForKey:", a3);
    if (v6)
      return v6;
  }
  else
  {
    self->_questionLayouts = (TSUIntegerKeyDictionary *)objc_alloc_init((Class)TSUIntegerKeyDictionary);
  }
  v7 = -[THWReviewLayout p_questionAtPageIndex:](self, "p_questionAtPageIndex:", a3);
  v8 = (objc_class *)objc_msgSend(v7, "layoutClass");
  if (!v8)
    return 0;
  v6 = objc_msgSend([v8 alloc], "initWithQuestion:index:delegate:", v7, a3, self);
  if (v6)
    -[TSUIntegerKeyDictionary setObject:forKey:](self->_questionLayouts, "setObject:forKey:", v6, a3);
  return v6;
}

- (id)p_responseController
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(THDocumentRoot);
  TSUDynamicCast(v3, objc_msgSend(objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "canvas"), "documentRoot"));
  return result;
}

- (id)p_dataController
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(THDocumentRoot);
  TSUDynamicCast(v3, objc_msgSend(objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "canvas"), "documentRoot"));
  return result;
}

- (unint64_t)p_countCorrectAnswers
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = -[THWReviewLayout p_responseController](self, "p_responseController");
  v4 = objc_msgSend(v3, "newTemporateReviewResponseMOC");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(-[THWReviewLayout info](self, "info", 0), "questions");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(objc_msgSend(v3, "responseForQuestionID:temporaryMOC:", objc_msgSend(v11, "questionID"), v4), "userHasCheckedAnswer")&& objc_msgSend(v11, "evaluateAnswerWithResponseController:updateScore:choiceBlock:", v3, 0, 0) == 6)
        {
          ++v8;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)p_haveAnswersBeenCheckedForAllQuestions
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  double v14;
  id v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = -[THWReviewLayout p_responseController](self, "p_responseController");
  v4 = objc_msgSend(v3, "newTemporateReviewResponseMOC");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(-[THWReviewLayout info](self, "info"), "questions");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v3, "responseForQuestionID:temporaryMOC:", objc_msgSend(v10, "questionID"), v4);
        if (objc_msgSend(objc_msgSend(v11, "answerState"), "hasUserSelected")
          && (objc_msgSend(v11, "userHasCheckedAnswer") & 1) == 0)
        {
          if (objc_msgSend(v10, "type") != 2)
            goto LABEL_15;
          v12 = objc_opt_class(TSWReviewMatchingAnswerState);
          *(_QWORD *)&v14 = TSUDynamicCast(v12, objc_msgSend(v11, "answerState")).n128_u64[0];
          if (!v13)
          {
            objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v14), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewLayout p_haveAnswersBeenCheckedForAllQuestions]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewLayout.m"), 1125, CFSTR("invalid nil value for '%s'"), "matchingAnswerState");
LABEL_15:
            v16 = 0;
            goto LABEL_16;
          }
          v15 = objc_msgSend(v13, "numSelectedTargets", v14);
          if (v15 == objc_msgSend(objc_msgSend(v10, "choices"), "count"))
            goto LABEL_15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_16:

  return v16;
}

- (unint64_t)p_initialQuestionIndex
{
  id v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  v3 = -[THWReviewLayout p_dataController](self, "p_dataController");
  v4 = objc_msgSend(v3, "newTemporaryReviewDataMOC");
  v5 = objc_msgSend(v3, "reviewWidgetDataForWidgetID:temporaryMOC:", objc_msgSend(-[THWReviewLayout info](self, "info"), "reviewID"), v4);
  if (v5)
  {
    v6 = objc_msgSend(v5, "currentPage");
    if (v6 >= (id)-[THWReviewLayout numberOfStagePages](self, "numberOfStagePages"))
      v7 = 0;
    else
      v7 = (unint64_t)v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)p_dividerLayoutForPageIndex:(unint64_t)a3
{
  TSUIntegerKeyDictionary *dividerLayouts;
  THWReviewDividerLayout *v6;

  dividerLayouts = self->_dividerLayouts;
  if (dividerLayouts)
  {
    v6 = (THWReviewDividerLayout *)-[TSUIntegerKeyDictionary objectForKey:](dividerLayouts, "objectForKey:", a3);
    if (v6)
      return v6;
  }
  else
  {
    self->_dividerLayouts = (TSUIntegerKeyDictionary *)objc_alloc_init((Class)TSUIntegerKeyDictionary);
  }
  v6 = objc_alloc_init(THWReviewDividerLayout);
  if (v6)
    -[TSUIntegerKeyDictionary setObject:forKey:](self->_dividerLayouts, "setObject:forKey:", v6, a3);
  return v6;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (CGRect)stageFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_stageFrame.origin.x;
  y = self->_stageFrame.origin.y;
  width = self->_stageFrame.size.width;
  height = self->_stageFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)stageCornerRadius
{
  return self->_stageCornerRadius;
}

- (unint64_t)questionIndex
{
  return self->_questionIndex;
}

- (THWReviewSummaryLayout)summaryLayout
{
  return self->_summaryLayout;
}

- (THWReviewControlsLayout)controlsLayout
{
  return self->_controlsLayout;
}

- (NSArray)stagePages
{
  return self->_stagePages;
}

- (void)setStagePages:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (NSArray)scrollableCanvasLayouts
{
  return self->_scrollableCanvasLayouts;
}

- (void)setScrollableCanvasLayouts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (NSArray)questionStackedContainers
{
  return self->_questionStackedContainers;
}

- (void)setQuestionStackedContainers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 360);
}

- (THWPagedCanvasControlLayout)stageCanvasLayout
{
  return self->_stageCanvasLayout;
}

- (TSUIntegerKeyDictionary)questionLayouts
{
  return self->_questionLayouts;
}

- (NSMutableDictionary)questionNumberStorages
{
  return self->_questionNumberStorages;
}

- (TSUIntegerKeyDictionary)dividerLayouts
{
  return self->_dividerLayouts;
}

@end
