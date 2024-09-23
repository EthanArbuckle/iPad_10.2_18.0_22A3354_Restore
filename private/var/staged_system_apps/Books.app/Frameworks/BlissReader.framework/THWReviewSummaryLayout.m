@implementation THWReviewSummaryLayout

- (THWReviewSummaryLayout)initWithDelegate:(id)a3
{
  THWReviewSummaryLayout *v4;
  THWReviewSummaryLayout *v5;
  THWStackedControlContainer *v6;
  THWStackedControlContainer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THWReviewSummaryLayout;
  v4 = -[THWReviewSummaryLayout initWithInfo:](&v9, "initWithInfo:", 0);
  v5 = v4;
  if (v4)
  {
    v4->_delegate = (THWReviewSummaryLayoutDelegate *)a3;
    v6 = -[THWStackedControlContainer initWithDelegate:]([THWStackedControlContainer alloc], "initWithDelegate:", v4);
    v5->_resultStack = v6;
    -[THWControlContainer setTag:](v6, "setTag:", 7);
    v7 = -[THWStackedControlContainer initWithDelegate:]([THWStackedControlContainer alloc], "initWithDelegate:", v5);
    v5->_checkingStack = v7;
    -[THWControlContainer setTag:](v7, "setTag:", 6);
    -[THWReviewSummaryLayout p_updateStorages](v5, "p_updateStorages");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewSummaryLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (id)checkingLayout
{
  return objc_msgSend(-[THWReviewSummaryLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", self->_checkingStack, self);
}

- (id)resultsLayout
{
  return objc_msgSend(-[THWReviewSummaryLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", self->_resultStack, self);
}

- (id)checkingWPLayout
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(TSWPLayout);
  TSUDynamicCast(v3, objc_msgSend(-[THWReviewSummaryLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", self->_checkingAnswerStorage, -[THWReviewSummaryLayout checkingLayout](self, "checkingLayout")));
  return result;
}

- (id)summaryWPLayout
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(TSWPLayout);
  TSUDynamicCast(v3, objc_msgSend(-[THWReviewSummaryLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", self->_summaryStorage, -[THWReviewSummaryLayout resultsLayout](self, "resultsLayout")));
  return result;
}

- (id)instructionalWPLayout
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(TSWPLayout);
  TSUDynamicCast(v3, objc_msgSend(-[THWReviewSummaryLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", self->_instructionalStorage, -[THWReviewSummaryLayout resultsLayout](self, "resultsLayout")));
  return result;
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THWReviewSummaryRep, a2);
}

- (id)childInfosForLayout
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_resultStack, self->_checkingStack, 0);
}

- (id)dependentLayouts
{
  id v3;
  objc_super v5;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v5.receiver = self;
  v5.super_class = (Class)THWReviewSummaryLayout;
  objc_msgSend(v3, "addObjectsFromArray:", -[THWReviewSummaryLayout dependentLayouts](&v5, "dependentLayouts"));
  -[THWReviewSummaryLayout addDescendentLayoutsToArray:](self, "addDescendentLayoutsToArray:", v3);
  return v3;
}

- (void)validate
{
  objc_super v3;

  -[THWReviewSummaryLayout invalidateFrame](self, "invalidateFrame");
  v3.receiver = self;
  v3.super_class = (Class)THWReviewSummaryLayout;
  -[THWReviewSummaryLayout validate](&v3, "validate");
}

- (void)invalidateSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewSummaryLayout;
  -[THWReviewSummaryLayout invalidateSize](&v3, "invalidateSize");
  objc_msgSend(-[THWReviewSummaryLayout summaryWPLayout](self, "summaryWPLayout"), "invalidateSize");
  objc_msgSend(-[THWReviewSummaryLayout instructionalWPLayout](self, "instructionalWPLayout"), "invalidateSize");
  objc_msgSend(-[THWReviewSummaryLayout checkingWPLayout](self, "checkingWPLayout"), "invalidateSize");
}

- (id)storageWithStyle:(id)a3 string:(id)a4
{
  id v6;
  id v7;
  THWPStorage *v8;
  THWPStorage *v9;

  v6 = -[THWReviewSummaryLayoutDelegate reviewSummaryContext](self->_delegate, "reviewSummaryContext");
  v7 = objc_msgSend(objc_alloc((Class)TSSStylesheet), "initWithContext:", v6);
  v8 = [THWPStorage alloc];
  if (!a4)
    a4 = CFSTR(" ");
  v9 = -[THWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:](v8, "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:", v6, a4, 3, v7, a3, +[TSWPListStyle defaultStyleWithContext:](TSWPListStyle, "defaultStyleWithContext:", v6), 0, 0);

  return v9;
}

- (void)p_updateStorages
{
  id v3;
  id v4;
  const __CFString *v5;

  if (!self->_summaryStorage)
    self->_summaryStorage = (TSWPStorage *)-[THWReviewSummaryLayout storageWithStyle:string:](self, "storageWithStyle:string:", -[THWReviewSummaryLayoutDelegate reviewSummaryResultsParagraphStyle](self->_delegate, "reviewSummaryResultsParagraphStyle"), 0);
  if (!self->_instructionalStorage)
    self->_instructionalStorage = (TSWPStorage *)-[THWReviewSummaryLayout storageWithStyle:string:](self, "storageWithStyle:string:", -[THWReviewSummaryLayoutDelegate reviewSummaryInstructionalParagraphStyle](self->_delegate, "reviewSummaryInstructionalParagraphStyle"), 0);
  if (!self->_checkingAnswerStorage)
    self->_checkingAnswerStorage = (TSWPStorage *)-[THWReviewSummaryLayout storageWithStyle:string:](self, "storageWithStyle:string:", -[THWReviewSummaryLayoutDelegate reviewSummaryCheckingParagraphStyleWithIndent:](self->_delegate, "reviewSummaryCheckingParagraphStyleWithIndent:", 40.0), objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Checking Answers…"), &stru_43D7D8, 0));
  v3 = -[THWReviewSummaryLayoutDelegate reviewSummaryQuestionCount](self->_delegate, "reviewSummaryQuestionCount");
  v4 = -[THWReviewSummaryLayoutDelegate reviewSummaryCorrectCount](self->_delegate, "reviewSummaryCorrectCount");
  -[TSWPStorage replaceCharactersInRange:withString:undoTransaction:](self->_summaryStorage, "replaceCharactersInRange:withString:undoTransaction:", 0, -[TSWPStorage length](self->_summaryStorage, "length"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("%lu out of %lu Answers Correct"), &stru_43D7D8, 0), v4, v3), 0);
  if (v4 == v3)
    v5 = CFSTR("Congratulations!\nYou’ve successfully completed this review.");
  else
    v5 = CFSTR("Go back to review incorrect answers and try again, or start over and clear all answers.");
  -[TSWPStorage replaceCharactersInRange:withString:undoTransaction:](self->_instructionalStorage, "replaceCharactersInRange:withString:undoTransaction:", 0, -[TSWPStorage length](self->_instructionalStorage, "length"), objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", v5, &stru_43D7D8, 0), 0);
  -[THWReviewSummaryLayout invalidateChildren](self, "invalidateChildren");
}

- (id)controlContainerChildInfosForLayout:(id)a3
{
  if (objc_msgSend(a3, "tag") == (char *)&dword_4 + 2)
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", self->_checkingAnswerStorage);
  if (objc_msgSend(a3, "tag") == (char *)&dword_4 + 3)
    return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_summaryStorage, self->_instructionalStorage, 0);
  return 0;
}

- (double)stackedControlContainerWidth:(id)a3
{
  double result;

  objc_msgSend(-[THWReviewSummaryLayout geometry](self, "geometry", a3), "size");
  return result;
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

  v3 = 13.0;
  v4 = 15.0;
  v5 = 13.0;
  v6 = 15.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4
{
  return 25.0;
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
  return 2;
}

- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4
{
  return 0;
}

- (unsigned)stackedControlContainerVerticalAlignment:(id)a3
{
  return 1;
}

- (double)stackedControlContainerMinHeight:(id)a3
{
  double v3;

  objc_msgSend(-[THWReviewSummaryLayout geometry](self, "geometry", a3), "size");
  return v3;
}

- (BOOL)stackedControlContainer:(id)a3 autoGrowHorizontallyTextLayout:(id)a4
{
  return 1;
}

- (THWReviewSummaryLayoutDelegate)delegate
{
  return self->_delegate;
}

- (TSWPStorage)summaryStorage
{
  return self->_summaryStorage;
}

- (TSWPStorage)instructionalStorage
{
  return self->_instructionalStorage;
}

- (TSWPStorage)checkingAnswerStorage
{
  return self->_checkingAnswerStorage;
}

- (THWStackedControlContainer)resultStack
{
  return self->_resultStack;
}

- (THWStackedControlContainer)checkingStack
{
  return self->_checkingStack;
}

@end
