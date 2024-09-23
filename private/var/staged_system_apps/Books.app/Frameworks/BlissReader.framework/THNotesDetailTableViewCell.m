@implementation THNotesDetailTableViewCell

- (THNotesDetailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 tableView:(id)a5 sizingDelegate:(id)a6
{
  THNotesDetailTableViewCell *v8;
  THNotesDetailTableViewCell *v9;
  id v10;
  UIView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  THNotesDetailTableViewCellLayoutManager *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)THNotesDetailTableViewCell;
  v8 = -[THNotesDetailTableViewCell initWithStyle:reuseIdentifier:](&v18, "initWithStyle:reuseIdentifier:", a3, a4);
  v9 = v8;
  if (v8)
  {
    v8->mSizingDelegate = (THNotesDetailSizingDelegate *)a6;
    -[THNotesDetailTableViewCell setAutoresizesSubviews:](v8, "setAutoresizesSubviews:", 1);
    -[THNotesDetailTableViewCell setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    objc_msgSend(-[THNotesDetailTableViewCell contentView](v9, "contentView"), "setAutoresizesSubviews:", 1);
    objc_msgSend(-[THNotesDetailTableViewCell contentView](v9, "contentView"), "setAutoresizingMask:", 18);
    objc_msgSend(-[THNotesDetailTableViewCell contentView](v9, "contentView"), "setBackgroundColor:", +[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
    v10 = objc_alloc((Class)UIView);
    -[THNotesDetailTableViewCell bounds](v9, "bounds");
    v11 = (UIView *)objc_msgSend(v10, "initWithFrame:");
    v9->mMyView = v11;
    -[UIView setTag:](v11, "setTag:", 12);
    -[UIView setAutoresizingMask:](v9->mMyView, "setAutoresizingMask:", 18);
    -[UIView setAutoresizesSubviews:](v9->mMyView, "setAutoresizesSubviews:", 1);
    -[UIView setBackgroundColor:](v9->mMyView, "setBackgroundColor:", +[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
    objc_msgSend(-[THNotesDetailTableViewCell contentView](v9, "contentView"), "addSubview:", v9->mMyView);
    -[THNotesDetailTableViewCell frame](v9, "frame");
    v13 = v12;
    v15 = v14;
    objc_msgSend(a5, "frame");
    -[THNotesDetailTableViewCell setFrame:](v9, "setFrame:", v13, v15);
    v16 = objc_alloc_init(THNotesDetailTableViewCellLayoutManager);
    -[THNotesDetailTableViewCellLayoutManager setDelegate:](v16, "setDelegate:", v9);
    -[THNotesDetailTableViewCell setLayoutManager:](v9, "setLayoutManager:", v16);

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  self->mIndexPath = 0;
  self->mMyView = 0;

  self->mTableViewCellController = 0;
  self->mLongPressGR = 0;

  self->mHighlightedText = 0;
  self->mNoteText = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNotesDetailTableViewCell;
  -[THNotesDetailTableViewCell dealloc](&v3, "dealloc");
}

- (void)populateWithCellController:(id)a3 annotation:(id)a4 cellWidth:(double)a5 highlightLayer:(id)a6 highlightTextFrame:(CGRect)a7 editingHighlightLayer:(id)a8 pageNumberString:(id)a9 topAdjustment:(double)a10 showDivider:(BOOL)a11
{
  _BOOL8 v11;
  double width;
  double y;
  double x;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  id v38;
  uint64_t v39;
  double height;
  CGRect v42;
  CGRect v43;

  v11 = a11;
  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  -[THNotesDetailTableViewCell setTableViewCellController:](self, "setTableViewCellController:", a3);
  -[UIView bounds](-[THNotesDetailTableViewCell myView](self, "myView"), "bounds");
  objc_msgSend(-[THNotesDetailTableViewCellController view](self->mTableViewCellController, "view"), "setFrame:", v21, v22, v23, v24);
  -[UIView addSubview:](-[THNotesDetailTableViewCell myView](self, "myView"), "addSubview:", -[THNotesDetailTableViewCellController view](self->mTableViewCellController, "view"));
  -[THNotesDetailTableViewCellController populateWithAnnotation:cellWidth:highlightLayer:highlightTextFrame:editingHighlightLayer:pageNumberString:topAdjustment:showDivider:](self->mTableViewCellController, "populateWithAnnotation:cellWidth:highlightLayer:highlightTextFrame:editingHighlightLayer:pageNumberString:topAdjustment:showDivider:", a4, a6, a8, a9, v11, a5, x, y, width, height, a10);
  objc_msgSend(-[THNotesDetailTableViewCellController view](self->mTableViewCellController, "view"), "layoutIfNeeded");
  -[THNotesDetailTableViewCell frame](self, "frame");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(-[THNotesDetailTableViewCellController view](self->mTableViewCellController, "view"), "frame");
  -[THNotesDetailTableViewCell setFrame:](self, "setFrame:", v26, v28, v30);
  -[TSWButton frame](-[THNotesDetailTableViewCellController returnToBook](self->mTableViewCellController, "returnToBook"), "frame");
  v31 = v42.origin.x;
  v32 = v42.origin.y;
  v33 = v42.size.width;
  v34 = v42.size.height;
  v35 = CGRectGetHeight(v42);
  v43.origin.x = v31;
  v43.origin.y = v32;
  v43.size.width = v33;
  v43.size.height = v34;
  v36 = CGRectGetWidth(v43);
  v37 = v35 * 0.5 + -60.0;
  if (v35 >= 60.0)
    v37 = v35;
  if (v36 < 60.0)
    v36 = v36 * 0.5 + -60.0;
  -[TSWButton setHitRegionEdgeInsets:](-[THNotesDetailTableViewCellController returnToBook](self->mTableViewCellController, "returnToBook"), "setHitRegionEdgeInsets:", floor(v37), floor(v36), ceil(v37), ceil(v36));
  v38 = -[TSWButton addTarget:action:forControlEvents:](-[THNotesDetailTableViewCellController returnToBook](self->mTableViewCellController, "returnToBook"), "addTarget:action:forControlEvents:", self, "returnToBook:", 64);
  if (isPhone(v38, v39))
  {
    -[THNotesDetailTableViewCell setLongPressGR:](self, "setLongPressGR:", objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "p_handleGR:"));
    -[UILongPressGestureRecognizer setDelegate:](-[THNotesDetailTableViewCell longPressGR](self, "longPressGR"), "setDelegate:", self);
    -[THNotesDetailTableViewCell addGestureRecognizer:](self, "addGestureRecognizer:", -[THNotesDetailTableViewCell longPressGR](self, "longPressGR"));
  }
}

- (void)copy:(id)a3
{
  id v4;
  NSString *v5;

  if (-[THNotesDetailTableViewCell highlightedText](self, "highlightedText", a3))
  {
    v4 = -[THBookViewController activityItemProviderWithCachedAnnotation:](-[THNotesDetailTableViewController bookViewController](self->mMyTableViewController, "bookViewController"), "activityItemProviderWithCachedAnnotation:", -[THNotesDetailTableViewCellController annotation](self->mTableViewCellController, "annotation"));
    if (!v4)
      return;
    v5 = (NSString *)objc_msgSend(v4, "pasteboardString");
  }
  else
  {
    if (!-[THNotesDetailTableViewCell noteText](self, "noteText"))
      return;
    v5 = -[THNotesDetailTableViewCell noteText](self, "noteText");
  }
  if (v5)
    -[UIPasteboard setString:](+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"), "setString:", v5);
}

- (void)returnToBook:(id)a3
{
  if (-[THNotesDetailTableViewCellController annotation](self->mTableViewCellController, "annotation", a3))
  {
    if ((-[THAnnotation annotationIsOrphan](-[THNotesDetailTableViewCellController annotation](self->mTableViewCellController, "annotation"), "annotationIsOrphan") & 1) == 0)-[THNotesDetailTableViewControllerDelegate tableViewController:navigateToNote:](-[THNotesDetailTableViewController delegate](-[THNotesDetailTableViewCell myTableViewController](self, "myTableViewController"), "delegate"), "tableViewController:navigateToNote:", -[THNotesDetailTableViewCell myTableViewController](self, "myTableViewController"), -[THNotesDetailTableViewCellController annotation](self->mTableViewCellController, "annotation"));
  }
}

- (void)searchText:(id)a3
{
  NSString *v4;

  if (-[THNotesDetailTableViewCell highlightedText](self, "highlightedText", a3))
    v4 = -[THNotesDetailTableViewCell highlightedText](self, "highlightedText");
  else
    v4 = -[THNotesDetailTableViewCell noteText](self, "noteText");
  -[THNotesDetailTableViewControllerDelegate tableViewController:searchBookForText:](-[THNotesDetailTableViewController delegate](-[THNotesDetailTableViewCell myTableViewController](self, "myTableViewController"), "delegate"), "tableViewController:searchBookForText:", -[THNotesDetailTableViewCell myTableViewController](self, "myTableViewController"), v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGPoint v18;
  CGRect v19;

  if (-[THNotesDetailTableViewCell longPressGR](self, "longPressGR") != a3)
    return 1;
  -[TSWButton bounds](-[THNotesDetailTableViewCellController returnToBook](self->mTableViewCellController, "returnToBook"), "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(a4, "locationInView:", -[THNotesDetailTableViewCellController returnToBook](self->mTableViewCellController, "returnToBook"));
  v18.x = v16;
  v18.y = v17;
  v19.origin.x = v9;
  v19.origin.y = v11;
  v19.size.width = v13;
  v19.size.height = v15;
  return !CGRectContainsPoint(v19, v18)
      && (-[THNotesDetailTableViewCell isEditing](self, "isEditing") & 1) == 0
      && -[THNotesDetailTableViewCell longPressGR](self, "longPressGR") == a3;
}

- (void)p_handleGR:(id)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double x;
  double v15;
  double y;
  double v17;
  double width;
  double v19;
  double height;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  NSString *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  UIMenuController *v31;
  id v32;
  _QWORD v33[2];
  _QWORD v34[2];
  CGPoint v35;
  CGPoint v36;
  CGRect v37;
  CGRect v38;

  self->mHighlightedText = 0;
  self->mNoteText = 0;
  objc_msgSend(a3, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  if (-[THNotesDetailTableViewCell longPressGR](self, "longPressGR") == a3)
  {
    -[THNotesDetailTableViewCellHighlightView frame](-[THNotesDetailTableViewCellController highlightView](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "highlightView"), "frame");
    v35.x = v6;
    v35.y = v8;
    if (CGRectContainsPoint(v37, v35)
      && objc_msgSend(-[THAnnotation annotationRepresentativeText](-[THNotesDetailTableViewCellController annotation](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "annotation"), "annotationRepresentativeText"), "length"))
    {
      -[THNotesDetailTableViewCellController highlightTextFrame](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "highlightTextFrame");
      -[THNotesDetailTableViewCell convertRect:fromView:](self, "convertRect:fromView:", -[THNotesDetailTableViewCellController highlightView](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "highlightView"), v9, v10, v11, v12);
      x = v13;
      y = v15;
      width = v17;
      height = v19;
      -[THNotesDetailTableViewCell setHighlightedText:](self, "setHighlightedText:", -[THAnnotation annotationRepresentativeText](-[THNotesDetailTableViewCellController annotation](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "annotation"), "annotationRepresentativeText"));
    }
    else
    {
      x = CGRectZero.origin.x;
      y = CGRectZero.origin.y;
      width = CGRectZero.size.width;
      height = CGRectZero.size.height;
      -[UILabel frame](-[THNotesDetailTableViewCellController noteLabel](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "noteLabel"), "frame");
      v36.x = v6;
      v36.y = v8;
      if (CGRectContainsPoint(v38, v36)
        && objc_msgSend(-[THAnnotation annotationNote](-[THNotesDetailTableViewCellController annotation](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "annotation"), "annotationNote"), "length"))
      {
        -[UILabel frame](-[THNotesDetailTableViewCellController noteLabel](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "noteLabel"), "frame");
        x = v21;
        y = v22;
        width = v23;
        height = v24;
        v25 = -[NSParagraphStyle mutableCopy](+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"), "mutableCopy");
        objc_msgSend(v25, "setLineBreakMode:", -[UILabel lineBreakMode](-[THNotesDetailTableViewCellController noteLabel](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "noteLabel"), "lineBreakMode"));
        v26 = -[UILabel text](-[THNotesDetailTableViewCellController noteLabel](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "noteLabel"), "text");
        v33[0] = NSFontAttributeName;
        v33[1] = NSParagraphStyleAttributeName;
        v34[0] = -[UILabel font](-[THNotesDetailTableViewCellController noteLabel](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "noteLabel"), "font");
        v34[1] = v25;
        -[NSString boundingRectWithSize:options:attributes:context:](v26, "boundingRectWithSize:options:attributes:context:", 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2), 0, width, height);
        v28 = v27;
        v30 = v29;

        if (v28 < width)
        {
          height = v30;
          width = v28;
        }
        -[THNotesDetailTableViewCell setNoteText:](self, "setNoteText:", -[THAnnotation annotationNote](-[THNotesDetailTableViewCellController annotation](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "annotation"), "annotationNote"));
      }
    }
    if (-[THNotesDetailTableViewCell highlightedText](self, "highlightedText")
      || -[THNotesDetailTableViewCell noteText](self, "noteText"))
    {
      -[THNotesDetailTableViewCell becomeFirstResponder](self, "becomeFirstResponder");
      v31 = +[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController");
      v32 = objc_msgSend(objc_alloc((Class)UIMenuItem), "initWithTitle:action:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Search"), &stru_43D7D8, 0), "searchText:");
      -[UIMenuController setMenuItems:](v31, "setMenuItems:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v32));

      -[UIMenuController setTargetRect:inView:](v31, "setTargetRect:inView:", self, x, y, width, height);
      -[UIMenuController setMenuVisible:animated:](v31, "setMenuVisible:animated:", 1, 1);
    }
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if ("copy:" != a3)
    return "searchText:" == a3;
  if (-[THNotesDetailTableViewCellController annotation](self->mTableViewCellController, "annotation"))
    return -[THBookViewController allowCopy](-[THNotesDetailTableViewController bookViewController](self->mMyTableViewController, "bookViewController"), "allowCopy");
  return 1;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  uint64_t v7;
  void *v8;
  double v9;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)THNotesDetailTableViewCell;
  -[THNotesDetailTableViewCell setEditing:animated:](&v10, "setEditing:animated:");
  v7 = objc_opt_class(THNotesDetailTableViewCellHighlightView);
  *(_QWORD *)&v9 = TSUDynamicCast(v7, -[THNotesDetailTableViewCell viewWithTag:](self, "viewWithTag:", 4)).n128_u64[0];
  if (v8)
    objc_msgSend(v8, "setEditing:animated:", v5, v4, v9);
  -[THNotesDetailTableViewCell setNeedsLayout](self, "setNeedsLayout", v9);
}

- (void)p_hideView:(BOOL)a3 withTag:(int64_t)a4 subViewOf:(id)a5
{
  _BOOL4 v5;
  id v6;
  double v7;

  v5 = a3;
  v6 = objc_msgSend(a5, "viewWithTag:", a4);
  if (v6)
  {
    v7 = 1.0;
    if (v5)
      v7 = 0.0;
    objc_msgSend(v6, "setAlpha:", v7);
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  +[CATransaction begin](CATransaction, "begin", a3, a4);
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  objc_msgSend(-[THNotesDetailTableViewCell selectedBackgroundView](self, "selectedBackgroundView"), "setAlpha:", 0.0);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIColor *v6;
  id v7;
  objc_super v8;

  v4 = a3;
  v6 = -[UIView backgroundColor](-[THNotesDetailTableViewCellController highlightColorBar](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController", a3, a4), "highlightColorBar"), "backgroundColor");
  v7 = -[UIImageView backgroundColor](-[THNotesDetailTableViewCellController divider](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "divider"), "backgroundColor");
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v8.receiver = self;
  v8.super_class = (Class)THNotesDetailTableViewCell;
  -[THNotesDetailTableViewCell setSelected:animated:](&v8, "setSelected:animated:", v4, 0);
  objc_msgSend(-[THNotesDetailTableViewCell selectedBackgroundView](self, "selectedBackgroundView"), "setAlpha:", 0.0);
  +[CATransaction commit](CATransaction, "commit");
  -[UIView setBackgroundColor:](-[THNotesDetailTableViewCellController highlightColorBar](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "highlightColorBar"), "setBackgroundColor:", v6);
  -[UIImageView setBackgroundColor:](-[THNotesDetailTableViewCellController divider](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "divider"), "setBackgroundColor:", v7);
}

- (void)willTransitionToState:(unint64_t)a3
{
  uint64_t v5;
  THNotesDetailTableViewCellController **p_mTableViewCellController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THNotesDetailTableViewCell;
  -[THNotesDetailTableViewCell willTransitionToState:](&v7, "willTransitionToState:");
  self->mCellState = a3;
  if (a3 - 1 < 2)
  {
    v5 = 0;
    p_mTableViewCellController = &self->mTableViewCellController;
LABEL_6:
    -[TSWButton setEnabled:](-[THNotesDetailTableViewCellController returnToBook](*p_mTableViewCellController, "returnToBook"), "setEnabled:", v5);
    return;
  }
  if (!a3)
  {
    p_mTableViewCellController = &self->mTableViewCellController;
    if ((-[THAnnotation annotationIsOrphan](-[THNotesDetailTableViewCellController annotation](*p_mTableViewCellController, "annotation"), "annotationIsOrphan") & 1) == 0)
    {
      v5 = 1;
      goto LABEL_6;
    }
  }
}

- (void)setIndexPath:(id)a3
{

  self->mIndexPath = (NSIndexPath *)objc_msgSend(a3, "copy");
}

- (CGRect)p_getFrameForViewWithTag:(int64_t)a3 parentView:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(objc_msgSend(a4, "viewWithTag:", a3), "frame");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)p_setTransform:(CGAffineTransform *)a3 onViewWithTag:(int64_t)a4 parentView:(id)a5
{
  id v6;
  __int128 v7;
  _OWORD v8[3];

  v6 = objc_msgSend(a5, "viewWithTag:", a4);
  v7 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&a3->tx;
  objc_msgSend(v6, "setTransform:", v8);
}

- (CGRect)editControlCenteringRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView frame](-[THNotesDetailTableViewCellController highlightColorBar](-[THNotesDetailTableViewCell tableViewCellController](self, "tableViewCellController"), "highlightColorBar"), "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSIndexPath)indexPath
{
  return self->mIndexPath;
}

- (UIView)myView
{
  return self->mMyView;
}

- (void)setMyView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (THNotesDetailTableViewController)myTableViewController
{
  return self->mMyTableViewController;
}

- (void)setMyTableViewController:(id)a3
{
  self->mMyTableViewController = (THNotesDetailTableViewController *)a3;
}

- (BOOL)isSectionHeaderCell
{
  return self->mIsSectionHeaderCell;
}

- (void)setIsSectionHeaderCell:(BOOL)a3
{
  self->mIsSectionHeaderCell = a3;
}

- (THNotesDetailTableViewCellController)tableViewCellController
{
  return self->mTableViewCellController;
}

- (void)setTableViewCellController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (UILongPressGestureRecognizer)longPressGR
{
  return self->mLongPressGR;
}

- (void)setLongPressGR:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)highlightedText
{
  return self->mHighlightedText;
}

- (void)setHighlightedText:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSString)noteText
{
  return self->mNoteText;
}

- (void)setNoteText:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (THNotesDetailSizingDelegate)sizingDelegate
{
  return self->mSizingDelegate;
}

- (void)setSizingDelegate:(id)a3
{
  self->mSizingDelegate = (THNotesDetailSizingDelegate *)a3;
}

@end
