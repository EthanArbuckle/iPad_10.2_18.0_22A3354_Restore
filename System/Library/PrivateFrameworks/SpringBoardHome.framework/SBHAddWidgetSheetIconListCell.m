@implementation SBHAddWidgetSheetIconListCell

- (SBHAddWidgetSheetIconListCell)initWithFrame:(CGRect)a3
{
  return (SBHAddWidgetSheetIconListCell *)sub_1D01532E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBHAddWidgetSheetIconListCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _sSo29SBHAddWidgetSheetIconListCellC15SpringBoardHomeE5coderABSgSo7NSCoderC_tcfc_0();
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SBHAddWidgetSheetIconListCell *v12;

  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo);
  v8 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo);
  v9 = *(double *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo);
  v10 = *(double *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                  + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo);
  v11 = *(double *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                  + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo);
  *v7 = v3;
  v7[1] = v4;
  v7[2] = v5;
  v7[3] = v6;
  v12 = self;
  sub_1D0154438(v8, v9, v10, v11);

}

- (NSString)title
{
  SBHAddWidgetSheetIconListCell *v2;
  UILabel *v3;
  NSString *v4;
  void *v5;

  v2 = self;
  v3 = -[SBHAddWidgetSheetIconListCell textLabel](v2, sel_textLabel);
  v4 = -[UILabel text](v3, sel_text);

  if (v4)
  {
    sub_1D015F030();

    v5 = (void *)sub_1D015F024();
    swift_bridgeObjectRelease();
  }
  else
  {

    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  SBHAddWidgetSheetIconListCell *v6;
  UILabel *v7;
  id v8;

  if (a3)
  {
    sub_1D015F030();
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  v7 = -[SBHAddWidgetSheetIconListCell textLabel](v6, sel_textLabel);
  if (v5)
  {
    v8 = (id)sub_1D015F024();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  -[UILabel setText:](v7, sel_setText_, v8);

}

- (UIImage)iconImage
{
  void *v2;
  SBHAddWidgetSheetIconListCell *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView);
  v3 = self;
  v4 = objc_msgSend(v2, sel_image);
  if (!v4)
    v4 = objc_msgSend(*(id *)((char *)&v3->super.super.super.super.super.isa+ OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView), sel_image);

  return (UIImage *)v4;
}

- (void)setIconImage:(id)a3
{
  id v5;
  SBHAddWidgetSheetIconListCell *v6;

  v5 = a3;
  v6 = self;
  sub_1D0154704(a3);

}

- (UIColor)iconBackgroundColor
{
  return (UIColor *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView), sel_backgroundColor);
}

- (void)setIconBackgroundColor:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView), sel_setBackgroundColor_, a3);
}

- (SBIconListView)iconListView
{
  return (SBIconListView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                   + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconListView));
}

- (void)setIconListView:(id)a3
{
  void *v4;
  SBHAddWidgetSheetIconListCell *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconListView);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconListView) = (Class)a3;
  v6 = a3;
  v5 = self;
  sub_1D0154894(v4);

}

- (BOOL)separatorVisible
{
  return *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorVisible);
}

- (void)setSeparatorVisible:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorVisible) = a3;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorView), sel_setHidden_, !a3);
}

- (BOOL)wantsHeaderView
{
  return *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_wantsHeaderView);
}

- (void)setWantsHeaderView:(BOOL)a3
{
  SBHAddWidgetSheetIconListCell *v3;

  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR___SBHAddWidgetSheetIconListCell_wantsHeaderView) = a3;
  v3 = self;
  sub_1D0155034();

}

- (void)prepareForReuse
{
  SBHAddWidgetSheetIconListCell *v2;

  v2 = self;
  SBHAddWidgetSheetIconListCell.prepareForReuse()();

}

- (BOOL)_descendantsShouldHighlight
{
  return 0;
}

- (UILabel)textLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR___SBHAddWidgetSheetIconListCell_textLabel));
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  id v6;
  id v7;
  SBHAddWidgetSheetIconListCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D0154CEC(v7, v6);

}

- (void)iconListView:(id)a3 didRemoveIconView:(id)a4
{
  void *v6;
  id v7;
  id v8;
  SBHAddWidgetSheetIconListCell *v9;
  id v10;

  v6 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelViewsForIconViews);
  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = objc_msgSend(v6, sel_objectForKey_, v8);
  if (v10)
    objc_msgSend(v10, sel_removeFromSuperview);
  objc_msgSend(v6, sel_removeObjectForKey_, v8);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconListView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelViewsForIconViews));
}

@end
