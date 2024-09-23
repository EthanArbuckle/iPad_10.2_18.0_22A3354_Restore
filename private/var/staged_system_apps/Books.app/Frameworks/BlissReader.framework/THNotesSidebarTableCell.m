@implementation THNotesSidebarTableCell

- (THNotesSidebarTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  THNotesSidebarTableCell *v4;
  THNotesSidebarTableCell *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)THNotesSidebarTableCell;
  v4 = -[THNotesSidebarTableCell initWithStyle:reuseIdentifier:](&v12, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[THNotesSidebarTableCell p_borderWidth](v4, "p_borderWidth");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell imageBorderWidthConstraint](v5, "imageBorderWidthConstraint"));
    objc_msgSend(v8, "setConstant:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell topBorderWidthConstraint](v5, "topBorderWidthConstraint"));
    objc_msgSend(v9, "setConstant:", v7);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell bottomBorderWidthConstraint](v5, "bottomBorderWidthConstraint"));
    objc_msgSend(v10, "setConstant:", v7);

    -[THNotesSidebarTableCell p_handleHighlightChange:](v5, "p_handleHighlightChange:", 0);
  }
  return v5;
}

- (void)setNeedsMigration:(BOOL)a3
{
  if (self->_needsMigration != a3)
  {
    self->_needsMigration = a3;
    -[THNotesSidebarTableCell _updateCountLabel](self, "_updateCountLabel");
  }
}

- (void)setAnnotationCount:(unint64_t)a3
{
  if (self->_annotationCount != a3)
  {
    self->_annotationCount = a3;
    -[THNotesSidebarTableCell _updateCountLabel](self, "_updateCountLabel");
  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNotesSidebarTableCell;
  -[THNotesSidebarTableCell prepareForReuse](&v3, "prepareForReuse");
  -[THNotesSidebarTableCell setDelegate:](self, "setDelegate:", 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  unsigned int v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v7 = -[THNotesSidebarTableCell isSelected](self, "isSelected");
  v9.receiver = self;
  v9.super_class = (Class)THNotesSidebarTableCell;
  -[THNotesSidebarTableCell setSelected:animated:](&v9, "setSelected:animated:", v5, v4);
  -[THNotesSidebarTableCell p_handleHighlightChange:](self, "p_handleHighlightChange:", v5);
  if (v7 != v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell delegate](self, "delegate"));
    objc_msgSend(v8, "notesSidebarCell:selectionDidChange:", self, v5);

  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  unsigned int v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v7 = -[THNotesSidebarTableCell isHighlighted](self, "isHighlighted");
  v9.receiver = self;
  v9.super_class = (Class)THNotesSidebarTableCell;
  -[THNotesSidebarTableCell setHighlighted:animated:](&v9, "setHighlighted:animated:", v5, v4);
  -[THNotesSidebarTableCell p_handleHighlightChange:](self, "p_handleHighlightChange:", v5);
  if (v7 != v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell delegate](self, "delegate"));
    objc_msgSend(v8, "notesSidebarCell:highlightDidChange:", self, v5);

  }
}

- (void)setSectionProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[THNotesSidebarTableCell setAnnotationCount:](self, "setAnnotationCount:", objc_msgSend(v13, "annotationCount"));
  -[THNotesSidebarTableCell setNeedsMigration:](self, "setNeedsMigration:", objc_msgSend(v13, "needsMigration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subtitle"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subtitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell chapterLabel](self, "chapterLabel"));
    objc_msgSend(v6, "setText:", v5);

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell chapterLabel](self, "chapterLabel"));
    objc_msgSend(v5, "setText:", &stru_43D7D8);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell chapterName](self, "chapterName"));
  objc_msgSend(v8, "setText:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "image"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell chapterThumb](self, "chapterThumb"));
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "setHidden:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "image"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell chapterThumb](self, "chapterThumb"));
    objc_msgSend(v12, "setImage:", v11);

  }
  else
  {
    objc_msgSend(v10, "setHidden:", 1);
  }

}

- (void)p_handleHighlightChange:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell countLabel](self, "countLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell chapterLabel](self, "chapterLabel"));
  objc_msgSend(v7, "setTextColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell chapterName](self, "chapterName"));
  objc_msgSend(v9, "setTextColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSeparatorColor](UIColor, "bc_booksSeparatorColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell topBorder](self, "topBorder"));
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSeparatorColor](UIColor, "bc_booksSeparatorColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell bottomBorder](self, "bottomBorder"));
  objc_msgSend(v13, "setBackgroundColor:", v12);

  v15 = (id)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSeparatorColor](UIColor, "bc_booksSeparatorColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell imageBorder](self, "imageBorder"));
  objc_msgSend(v14, "setBackgroundColor:", v15);

}

- (double)p_borderWidth
{
  return 1.0 / TSUScreenScale(self, a2);
}

- (BOOL)topBorderVisible
{
  void *v2;
  double v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell topBorderWidthConstraint](self, "topBorderWidthConstraint"));
  objc_msgSend(v2, "constant");
  v4 = v3 > 0.0;

  return v4;
}

- (void)setTopBorderVisible:(BOOL)a3
{
  double v4;
  double v5;
  id v6;

  v4 = 0.0;
  if (a3)
  {
    -[THNotesSidebarTableCell p_borderWidth](self, "p_borderWidth");
    v4 = v5;
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell topBorderWidthConstraint](self, "topBorderWidthConstraint"));
  objc_msgSend(v6, "setConstant:", v4);

}

- (BOOL)bottomBorderVisible
{
  void *v2;
  double v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell bottomBorderWidthConstraint](self, "bottomBorderWidthConstraint"));
  objc_msgSend(v2, "constant");
  v4 = v3 > 0.0;

  return v4;
}

- (void)setBottomBorderVisible:(BOOL)a3
{
  double v4;
  double v5;
  id v6;

  v4 = 0.0;
  if (a3)
  {
    -[THNotesSidebarTableCell p_borderWidth](self, "p_borderWidth");
    v4 = v5;
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell bottomBorderWidthConstraint](self, "bottomBorderWidthConstraint"));
  objc_msgSend(v6, "setConstant:", v4);

}

- (BOOL)imageBorderVisible
{
  void *v2;
  double v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell imageBorderWidthConstraint](self, "imageBorderWidthConstraint"));
  objc_msgSend(v2, "constant");
  v4 = v3 > 0.0;

  return v4;
}

- (void)setImageBorderVisible:(BOOL)a3
{
  double v4;
  double v5;
  id v6;

  v4 = 0.0;
  if (a3)
  {
    -[THNotesSidebarTableCell p_borderWidth](self, "p_borderWidth");
    v4 = v5;
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell imageBorderWidthConstraint](self, "imageBorderWidthConstraint"));
  objc_msgSend(v6, "setConstant:", v4);

}

- (void)_updateCountLabel
{
  const __CFString *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (-[THNotesSidebarTableCell annotationCount](self, "annotationCount"))
  {
    if (!-[THNotesSidebarTableCell needsMigration](self, "needsMigration"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[THNotesSidebarTableCell annotationCount](self, "annotationCount")));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v4, 1));

      goto LABEL_7;
    }
    v3 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "…"));
  }
  else
  {
    v3 = &stru_43D7D8;
  }
  v6 = (__CFString *)v3;
LABEL_7:
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THNotesSidebarTableCell countLabel](self, "countLabel"));
  objc_msgSend(v5, "setText:", v6);

}

- (THNotesSidebarTableCellDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THNotesSidebarTableCellDelegate *)a3;
}

- (UILabel)noResultsLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_noResultsLabel);
}

- (void)setNoResultsLabel:(id)a3
{
  objc_storeWeak((id *)&self->_noResultsLabel, a3);
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setCountLabel:(id)a3
{
  objc_storeStrong((id *)&self->_countLabel, a3);
}

- (UIImageView)chapterThumb
{
  return self->_chapterThumb;
}

- (void)setChapterThumb:(id)a3
{
  objc_storeStrong((id *)&self->_chapterThumb, a3);
}

- (UILabel)chapterLabel
{
  return self->_chapterLabel;
}

- (void)setChapterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_chapterLabel, a3);
}

- (UILabel)chapterName
{
  return self->_chapterName;
}

- (void)setChapterName:(id)a3
{
  objc_storeStrong((id *)&self->_chapterName, a3);
}

- (UIView)topBorder
{
  return self->_topBorder;
}

- (void)setTopBorder:(id)a3
{
  objc_storeStrong((id *)&self->_topBorder, a3);
}

- (UIView)bottomBorder
{
  return self->_bottomBorder;
}

- (void)setBottomBorder:(id)a3
{
  objc_storeStrong((id *)&self->_bottomBorder, a3);
}

- (UIView)imageBorder
{
  return self->_imageBorder;
}

- (void)setImageBorder:(id)a3
{
  objc_storeStrong((id *)&self->_imageBorder, a3);
}

- (unint64_t)annotationCount
{
  return self->_annotationCount;
}

- (BOOL)needsMigration
{
  return self->_needsMigration;
}

- (NSLayoutConstraint)imageBorderWidthConstraint
{
  return self->_imageBorderWidthConstraint;
}

- (void)setImageBorderWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageBorderWidthConstraint, a3);
}

- (NSLayoutConstraint)topBorderWidthConstraint
{
  return self->_topBorderWidthConstraint;
}

- (void)setTopBorderWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topBorderWidthConstraint, a3);
}

- (NSLayoutConstraint)bottomBorderWidthConstraint
{
  return self->_bottomBorderWidthConstraint;
}

- (void)setBottomBorderWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomBorderWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomBorderWidthConstraint, 0);
  objc_storeStrong((id *)&self->_topBorderWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageBorderWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageBorder, 0);
  objc_storeStrong((id *)&self->_bottomBorder, 0);
  objc_storeStrong((id *)&self->_topBorder, 0);
  objc_storeStrong((id *)&self->_chapterName, 0);
  objc_storeStrong((id *)&self->_chapterLabel, 0);
  objc_storeStrong((id *)&self->_chapterThumb, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_destroyWeak((id *)&self->_noResultsLabel);
}

@end
