@implementation THNotesDetailTableViewHeaderView

- (THNotesDetailTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  THNotesDetailTableViewHeaderView *v3;
  CGFloat v4;
  CGFloat v5;
  UIButton *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THNotesDetailTableViewHeaderView;
  v3 = -[THNotesDetailTableViewHeaderView initWithReuseIdentifier:](&v8, "initWithReuseIdentifier:", a3);
  if (v3)
  {
    v3->_cellView = (UIView *)objc_alloc_init((Class)UIView);
    objc_msgSend(-[THNotesDetailTableViewHeaderView contentView](v3, "contentView"), "addSubview:", v3->_cellView);
    v3->_editControlView = (UIView *)objc_alloc_init((Class)UIView);
    objc_msgSend(-[THNotesDetailTableViewHeaderView contentView](v3, "contentView"), "addSubview:", v3->_editControlView);
    v3->_editControlImage = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:highlightedImage:", +[UIImage th_imageNamed:](UIImage, "th_imageNamed:", CFSTR("notes-detail-header-edit-N")), objc_msgSend(+[UIImage th_imageNamed:](UIImage, "th_imageNamed:", CFSTR("notes-detail-header-edit-A")), "imageWithRenderingMode:", 2));
    -[UIImageView setTintColor:](v3->_editControlImage, "setTintColor:", +[UIColor bc_booksBlue](UIColor, "bc_booksBlue"));
    -[UIImageView setContentMode:](v3->_editControlImage, "setContentMode:", 4);
    -[UIView addSubview:](v3->_editControlView, "addSubview:", v3->_editControlImage);
    -[UIImage size](-[UIImageView image](v3->_editControlImage, "image"), "size");
    v3->_editControlImageSize.width = v4;
    v3->_editControlImageSize.height = v5;
    v3->_separator = (UIView *)objc_alloc_init((Class)UIView);
    -[UIView setBackgroundColor:](v3->_separator, "setBackgroundColor:", +[UIColor bc_booksSeparatorColor](UIColor, "bc_booksSeparatorColor"));
    objc_msgSend(-[THNotesDetailTableViewHeaderView contentView](v3, "contentView"), "addSubview:", v3->_separator);
    v6 = (UIButton *)objc_alloc_init((Class)UIButton);
    v3->_selectionButton = v6;
    -[UIButton addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", v3, "headerCellPressed:", 64);
    objc_msgSend(-[THNotesDetailTableViewHeaderView contentView](v3, "contentView"), "addSubview:", v3->_selectionButton);
    objc_msgSend(-[THNotesDetailTableViewHeaderView contentView](v3, "contentView"), "setBackgroundColor:", +[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
    objc_msgSend(-[THNotesDetailTableViewHeaderView backgroundView](v3, "backgroundView"), "setBackgroundColor:", +[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
  }
  return v3;
}

- (void)prepareForReuse
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];

  v12.receiver = self;
  v12.super_class = (Class)THNotesDetailTableViewHeaderView;
  -[THNotesDetailTableViewHeaderView prepareForReuse](&v12, "prepareForReuse");
  self->_editing = 0;
  self->_selected = 0;
  self->_section = 0x7FFFFFFFFFFFFFFFLL;
  -[UIImageView setHighlighted:](self->_editControlImage, "setHighlighted:", 0);
  v3 = -[NSArray copy](-[UIView subviews](-[THNotesDetailTableViewHeaderView cellView](self, "cellView"), "subviews"), "copy");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "removeFromSuperview");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)dealloc
{
  objc_super v3;

  self->_cellView = 0;
  self->_editControlView = 0;

  self->_editControlImage = 0;
  self->_separator = 0;

  self->_selectionButton = 0;
  self->_chapterLabel = 0;

  self->_sectionLabel = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNotesDetailTableViewHeaderView;
  -[THNotesDetailTableViewHeaderView dealloc](&v3, "dealloc");
}

- (id)backgroundView
{
  id v3;
  Class v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THNotesDetailTableViewHeaderView;
  v3 = -[THNotesDetailTableViewHeaderView backgroundView](&v7, "backgroundView");
  if (!v3
    || (v4 = NSClassFromString(CFSTR("_UITableViewHeaderFooterViewBackground")),
        (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
  {
    v5 = objc_alloc((Class)UIView);
    objc_msgSend(v3, "frame");
    v3 = objc_msgSend(v5, "initWithFrame:");
    -[THNotesDetailTableViewHeaderView setBackgroundView:](self, "setBackgroundView:", v3);
  }
  return v3;
}

- (void)addChapterLabel:(id)a3
{
  -[UILabel removeFromSuperview](-[THNotesDetailTableViewHeaderView chapterLabel](self, "chapterLabel"), "removeFromSuperview");
  -[THNotesDetailTableViewHeaderView setChapterLabel:](self, "setChapterLabel:", a3);
  if (a3)
    -[UIView addSubview:](self->_cellView, "addSubview:", a3);
}

- (void)addSectionLabel:(id)a3
{
  -[UILabel removeFromSuperview](-[THNotesDetailTableViewHeaderView sectionLabel](self, "sectionLabel"), "removeFromSuperview");
  -[THNotesDetailTableViewHeaderView setSectionLabel:](self, "setSectionLabel:", a3);
  if (a3)
    -[UIView addSubview:](self->_cellView, "addSubview:", a3);
}

- (void)p_positionViewsForEditing:(BOOL)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double Width;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;

  -[THNotesDetailTableViewHeaderView bounds](self, "bounds");
  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  if (a3)
  {
    if (+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[THNotesDetailTableViewHeaderView semanticContentAttribute](self, "semanticContentAttribute")) == UIUserInterfaceLayoutDirectionLeftToRight)v9 = 35.0;
    v13 = v11 + -50.0;
    -[UIView setFrame:](self->_cellView, "setFrame:", v9, v10, v13, v12);
    v14 = 0.0;
    v15 = 1.0;
  }
  else
  {
    v13 = v7 + -15.0;
    -[UIView setFrame:](self->_cellView, "setFrame:", v5, v6, v7 + -15.0, v8);
    v14 = -55.0;
    v15 = 0.0;
  }
  -[UIView setFrame:](self->_editControlView, "setFrame:", v14, 0.0, 35.0, v12);
  -[UIImageView setAlpha:](self->_editControlImage, "setAlpha:", v15);
  -[UIImageView setFrame:](self->_editControlImage, "setFrame:", 15.0, 0.0, self->_editControlImageSize.width, v12);
  v23.origin.x = v9;
  v23.origin.y = v10;
  v23.size.width = v13;
  v23.size.height = v12;
  Width = CGRectGetWidth(v23);
  if (-[THNotesDetailTableViewHeaderView chapterLabel](self, "chapterLabel"))
  {
    -[UILabel frame](-[THNotesDetailTableViewHeaderView chapterLabel](self, "chapterLabel"), "frame");
    -[UILabel setFrame:](-[THNotesDetailTableViewHeaderView chapterLabel](self, "chapterLabel"), "setFrame:", v17, v18, Width - v17, v19);
  }
  if (-[THNotesDetailTableViewHeaderView sectionLabel](self, "sectionLabel"))
  {
    -[UILabel frame](-[THNotesDetailTableViewHeaderView sectionLabel](self, "sectionLabel"), "frame");
    -[UILabel setFrame:](-[THNotesDetailTableViewHeaderView sectionLabel](self, "sectionLabel"), "setFrame:", v20, v21, Width - v20, v22);
  }
}

- (void)setFrame:(CGRect)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)THNotesDetailTableViewHeaderView;
  -[THNotesDetailTableViewHeaderView setFrame:](&v14, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[THNotesDetailTableViewHeaderView p_positionViewsForEditing:](self, "p_positionViewsForEditing:", self->_editing);
  v4 = -[THNotesDetailTableViewHeaderView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIView setFrame:](self->_separator, "setFrame:", 0.0, v11 - 1.0 / TSUScreenScale(v4, v13), v9);
  -[UIButton setFrame:](self->_selectionButton, "setFrame:", v6, v8, v10, v12);
}

- (void)setEditing:(BOOL)a3
{
  -[THNotesDetailTableViewHeaderView setEditing:animated:](self, "setEditing:animated:", a3, 1);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v5[5];

  if (self->_editing != a3)
  {
    self->_editing = a3;
    if (a4)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_67F0;
      v5[3] = &unk_426DD0;
      v5[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.3);
    }
    else
    {
      -[THNotesDetailTableViewHeaderView p_positionViewsForEditing:](self, "p_positionViewsForEditing:");
    }
    -[THNotesDetailTableViewHeaderView setSelected:](self, "setSelected:", 0);
    -[THNotesDetailTableViewHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[UIImageView setHighlighted:](self->_editControlImage, "setHighlighted:");
  }
}

- (UIView)cellContentView
{
  return self->_cellView;
}

- (void)headerCellPressed:(id)a3
{
  -[THNotesDetailTableViewHeaderViewDelegate notesDetailTableViewHeaderView:selected:](self->_delegate, "notesDetailTableViewHeaderView:selected:");
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)selected
{
  return self->_selected;
}

- (unint64_t)section
{
  return self->_section;
}

- (void)setSection:(unint64_t)a3
{
  self->_section = a3;
}

- (THNotesDetailTableViewHeaderViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THNotesDetailTableViewHeaderViewDelegate *)a3;
}

- (UIView)cellView
{
  return self->_cellView;
}

- (void)setCellView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (UIView)editControlView
{
  return self->_editControlView;
}

- (void)setEditControlView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (UIImageView)editControlImage
{
  return self->_editControlImage;
}

- (void)setEditControlImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (UIButton)selectionButton
{
  return self->_selectionButton;
}

- (void)setSelectionButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (CGSize)editControlImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_editControlImageSize.width;
  height = self->_editControlImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setEditControlImageSize:(CGSize)a3
{
  self->_editControlImageSize = a3;
}

- (UILabel)chapterLabel
{
  return self->_chapterLabel;
}

- (void)setChapterLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (UILabel)sectionLabel
{
  return self->_sectionLabel;
}

- (void)setSectionLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
