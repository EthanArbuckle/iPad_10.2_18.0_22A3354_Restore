@implementation THNotesDetailTableViewCellController

- (THNotesDetailTableViewCellController)initWithSizingDelegate:(id)a3
{
  THNotesDetailTableViewCellController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THNotesDetailTableViewCellController;
  result = -[THNotesDetailTableViewCellController init](&v5, "init");
  if (result)
    result->mSizingDelegate = (THNotesDetailSizingDelegate *)a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->mNoteLabel = 0;
  self->mReturnToBook = 0;

  self->mDateLabel = 0;
  self->mDivider = 0;

  self->mAnnotation = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNotesDetailTableViewCellController;
  -[THNotesDetailTableViewCellController dealloc](&v3, "dealloc");
}

- (void)populateWithAnnotation:(id)a3 cellWidth:(double)a4 highlightLayer:(id)a5 highlightTextFrame:(CGRect)a6 editingHighlightLayer:(id)a7 pageNumberString:(id)a8 topAdjustment:(double)a9 showDivider:(BOOL)a10
{
  _BOOL4 v10;
  double height;
  double width;
  double y;
  double x;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  id v28;
  double v29;
  double v30;
  double MaxY;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  id v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  unsigned __int8 v57;
  TSWButton *v58;
  double v59;
  double v60;
  double v61;
  _BOOL8 v62;
  id v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  UILabel *v78;
  double v79;
  double v80;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v10 = a10;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  if (!qword_543270)
  {
    qword_543270 = (uint64_t)objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend((id)qword_543270, "setDateStyle:", 2);
    objc_msgSend((id)qword_543270, "setTimeStyle:", 1);
    objc_msgSend((id)qword_543270, "setDoesRelativeDateFormatting:", 1);
  }
  -[THNotesDetailTableViewCellController setAnnotation:](self, "setAnnotation:", a3, a4, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a9);
  -[THNotesDetailTableViewCellHighlightView populateWithHighlgihtLayer:editingHighlightLayer:](-[THNotesDetailTableViewCellController highlightView](self, "highlightView"), "populateWithHighlgihtLayer:editingHighlightLayer:", a5, a7);
  -[THNotesDetailTableViewCellHighlightView setTag:](-[THNotesDetailTableViewCellController highlightView](self, "highlightView"), "setTag:", 4);
  -[THNotesDetailTableViewCellHighlightView setBackgroundColor:](-[THNotesDetailTableViewCellController highlightView](self, "highlightView"), "setBackgroundColor:", +[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  -[THNotesDetailTableViewCellHighlightView frame](-[THNotesDetailTableViewCellController highlightView](self, "highlightView"), "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[THNotesDetailTableViewCellHighlightView intrinsicContentSize](-[THNotesDetailTableViewCellController highlightView](self, "highlightView"), "intrinsicContentSize");
  v27 = v26;
  -[THNotesDetailTableViewCellHighlightView setFrame:](-[THNotesDetailTableViewCellController highlightView](self, "highlightView"), "setFrame:", v21, v23, v25, v26);
  -[THNotesDetailTableViewCellController setHighlightTextFrame:](self, "setHighlightTextFrame:", x, y, width, height);
  v28 = objc_msgSend(objc_msgSend(a3, "annotationNote"), "length");
  if (v28)
  {
    -[UILabel setText:](-[THNotesDetailTableViewCellController noteLabel](self, "noteLabel"), "setText:", objc_msgSend(a3, "annotationNote"));
    -[UILabel setNumberOfLines:](-[THNotesDetailTableViewCellController noteLabel](self, "noteLabel"), "setNumberOfLines:", -[THNotesDetailSizingDelegate maxNoteLabelLines](self->mSizingDelegate, "maxNoteLabelLines"));
    -[THNotesDetailSizingDelegate noteLabelHorizontalInset](self->mSizingDelegate, "noteLabelHorizontalInset");
    v30 = v29;
    v82.origin.x = v21;
    v82.origin.y = v23;
    v82.size.width = v25;
    v82.size.height = v27;
    MaxY = CGRectGetMaxY(v82);
    -[THNotesDetailSizingDelegate marginAboveNote](self->mSizingDelegate, "marginAboveNote");
    v33 = MaxY + v32;
    -[THNotesDetailSizingDelegate rightMargin](self->mSizingDelegate, "rightMargin");
    v35 = a4 - v30 - v34;
    -[UILabel sizeThatFits:](-[THNotesDetailTableViewCellController noteLabel](self, "noteLabel"), "sizeThatFits:", v35, 100000.0);
    v37 = v36;
  }
  else
  {
    -[UILabel frame](-[THNotesDetailTableViewCellController noteLabel](self, "noteLabel"), "frame");
    v30 = v38;
    v33 = v39;
    v35 = v40;
    v37 = 0.0;
  }
  -[UILabel setFrame:](-[THNotesDetailTableViewCellController noteLabel](self, "noteLabel"), "setFrame:", v30, v33, v35, v37);
  -[UILabel setTag:](-[THNotesDetailTableViewCellController noteLabel](self, "noteLabel"), "setTag:", 6);
  -[UILabel setTextColor:](-[THNotesDetailTableViewCellController noteLabel](self, "noteLabel"), "setTextColor:", +[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
  -[UIView setBackgroundColor:](-[THNotesDetailTableViewCellController highlightColorBar](self, "highlightColorBar"), "setBackgroundColor:", objc_msgSend(+[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", objc_msgSend(a3, "annotationStyle"), 4, objc_msgSend(a3, "annotationIsUnderline")), "notesSidebarBarColor"));
  -[UIView frame](-[THNotesDetailTableViewCellController highlightColorBar](self, "highlightColorBar"), "frame");
  v42 = v41;
  v44 = v43;
  -[THNotesDetailSizingDelegate colorBarHorizontalInset](self->mSizingDelegate, "colorBarHorizontalInset");
  v46 = v45;
  v83.origin.x = v21;
  v83.origin.y = v23;
  v83.size.width = v25;
  v83.size.height = v27;
  v47 = CGRectGetMaxY(v83);
  -[THNotesDetailSizingDelegate highlightColorBarDescent](self->mSizingDelegate, "highlightColorBarDescent");
  -[UIView setFrame:](-[THNotesDetailTableViewCellController highlightColorBar](self, "highlightColorBar"), "setFrame:", v46, v42, v44, v47 + v48 - v42);
  v49 = objc_msgSend(a3, "annotationCreationDate");
  -[UILabel setText:](-[THNotesDetailTableViewCellController dateLabel](self, "dateLabel"), "setText:", objc_msgSend((id)qword_543270, "stringFromDate:", v49));
  -[UILabel sizeToFit](-[THNotesDetailTableViewCellController dateLabel](self, "dateLabel"), "sizeToFit");
  -[UILabel setTag:](-[THNotesDetailTableViewCellController dateLabel](self, "dateLabel"), "setTag:", 7);
  -[UILabel frame](-[THNotesDetailTableViewCellController dateLabel](self, "dateLabel"), "frame");
  v51 = v50;
  v53 = v52;
  v55 = v54;
  -[THNotesDetailSizingDelegate dateLabelHorizontalInset](self->mSizingDelegate, "dateLabelHorizontalInset");
  -[UILabel setFrame:](-[THNotesDetailTableViewCellController dateLabel](self, "dateLabel"), "setFrame:", v56, v51, v53, v55);
  if (!a8)
    a8 = &stru_43D7D8;
  -[TSWButton setTitle:forState:](-[THNotesDetailTableViewCellController returnToBook](self, "returnToBook"), "setTitle:forState:", a8, 0);
  v57 = -[THAnnotation annotationIsOrphan](-[THNotesDetailTableViewCellController annotation](self, "annotation"), "annotationIsOrphan");
  v58 = -[THNotesDetailTableViewCellController returnToBook](self, "returnToBook");
  if ((v57 & 1) != 0)
  {
    -[TSWButton setEnabled:](v58, "setEnabled:", 0);
    -[TSWButton setAlpha:](-[THNotesDetailTableViewCellController returnToBook](self, "returnToBook"), "setAlpha:", 0.0);
  }
  else
  {
    -[TSWButton setTag:](v58, "setTag:", 5);
    -[TSWButton frame](-[THNotesDetailTableViewCellController returnToBook](self, "returnToBook"), "frame");
    if (v59 + -32.0 >= 0.0)
      v60 = 0.0;
    else
      v60 = (v59 + -32.0) * 0.5;
    -[TSWButton frame](-[THNotesDetailTableViewCellController returnToBook](self, "returnToBook", v59 + -32.0), "frame");
    -[TSWButton setHitRegionEdgeInsets:](-[THNotesDetailTableViewCellController returnToBook](self, "returnToBook"), "setHitRegionEdgeInsets:", v60, fmin(v61 + -32.0, 0.0), v60, 0.0);
  }
  v62 = !v10;
  -[UIImageView setHidden:](-[THNotesDetailTableViewCellController divider](self, "divider"), "setHidden:", v62);
  if (!v62)
  {
    -[UIImageView setBackgroundColor:](-[THNotesDetailTableViewCellController divider](self, "divider"), "setBackgroundColor:", +[UIColor bc_booksSeparatorColor](UIColor, "bc_booksSeparatorColor"));
    v63 = -[UIImageView frame](-[THNotesDetailTableViewCellController divider](self, "divider"), "frame");
    v65 = v64;
    v67 = v66;
    v69 = v68;
    v71 = 1.0 / TSUScreenScale(v63, v70);
    -[UIImageView setFrame:](-[THNotesDetailTableViewCellController divider](self, "divider"), "setFrame:", v65, v67 - v71, v69, v71);
  }
  -[UIImageView setTag:](-[THNotesDetailTableViewCellController divider](self, "divider"), "setTag:", 3);
  objc_msgSend(-[THNotesDetailTableViewCellController view](self, "view"), "frame");
  v73 = v72;
  v75 = v74;
  v77 = v76;
  if (v28)
    v78 = -[THNotesDetailTableViewCellController noteLabel](self, "noteLabel");
  else
    v78 = -[THNotesDetailTableViewCellController highlightView](self, "highlightView");
  -[UILabel frame](v78, "frame");
  v79 = CGRectGetMaxY(v84);
  -[THNotesDetailSizingDelegate marginAboveSeparator](self->mSizingDelegate, "marginAboveSeparator");
  objc_msgSend(-[THNotesDetailTableViewCellController view](self, "view"), "setFrame:", v73, v75, v77, v79 + v80);
  objc_msgSend(-[THNotesDetailTableViewCellController view](self, "view"), "setTag:", 9);
}

- (UILabel)noteLabel
{
  return self->mNoteLabel;
}

- (void)setNoteLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (CGRect)highlightTextFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mHighlightTextFrame.origin.x;
  y = self->mHighlightTextFrame.origin.y;
  width = self->mHighlightTextFrame.size.width;
  height = self->mHighlightTextFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setHighlightTextFrame:(CGRect)a3
{
  self->mHighlightTextFrame = a3;
}

- (UILabel)dateLabel
{
  return self->mDateLabel;
}

- (void)setDateLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (UIImageView)divider
{
  return self->mDivider;
}

- (void)setDivider:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (THAnnotation)annotation
{
  return self->mAnnotation;
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (TSWButton)returnToBook
{
  return self->mReturnToBook;
}

- (void)setReturnToBook:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (UIView)highlightColorBar
{
  return self->_highlightColorBar;
}

- (void)setHighlightColorBar:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (THNotesDetailTableViewCellHighlightView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end
