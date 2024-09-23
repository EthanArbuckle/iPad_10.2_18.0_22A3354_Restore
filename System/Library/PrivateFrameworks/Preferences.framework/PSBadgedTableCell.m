@implementation PSBadgedTableCell

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  NSString *v7;
  _BOOL4 IsAccessibilityCategory;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PSBadgedTableCell traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  if (IsAccessibilityCategory && self->_badgeImageView)
  {
    if (-[PSBadgedTableCell _shouldUseRoundStyle](self, "_shouldUseRoundStyle"))
    {
      -[UILabel frame](self->_badgeNumberLabel, "frame");
      v10 = v9;
      -[UILabel frame](self->_badgeNumberLabel, "frame");
      if (v10 >= v11)
        v12 = v10;
      else
        v12 = v11;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "badgePadding");
      v14 = v13;
      -[UILabel frame](self->_badgeNumberLabel, "frame");
      v12 = v15 + v14 * 2.0;
      if (v12 < 30.0)
        v12 = 30.0;
    }
    width = width - (v12 + 20.0);
  }
  v18.receiver = self;
  v18.super_class = (Class)PSBadgedTableCell;
  -[PSBadgedTableCell sizeThatFits:](&v18, sel_sizeThatFits_, width, height);
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSBadgedTableCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v6, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("badgeNumber"), v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSBadgedTableCell badgeWithInteger:](self, "badgeWithInteger:", objc_msgSend(v5, "integerValue"));
}

- (void)badgeWithInteger:(int64_t)a3
{
  UIImageView *badgeImageView;
  UILabel *badgeNumberLabel;
  void *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *v10;
  void *v11;
  id v12;
  UILabel *v13;
  UILabel *v14;
  UILabel *v15;
  void *v16;
  void *v17;
  NSString *v18;
  _BOOL4 IsAccessibilityCategory;
  double v20;
  void *v21;
  double v22;
  double v23;
  BOOL v24;
  UILabel *v25;
  void *v26;
  UILabel *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  if (self->_badgeInt != a3)
  {
    self->_badgeInt = a3;
    -[UIImageView removeFromSuperview](self->_badgeImageView, "removeFromSuperview");
    badgeImageView = self->_badgeImageView;
    self->_badgeImageView = 0;

    -[UILabel removeFromSuperview](self->_badgeNumberLabel, "removeFromSuperview");
    badgeNumberLabel = self->_badgeNumberLabel;
    self->_badgeNumberLabel = 0;

    if (a3)
    {
      objc_msgSend((id)objc_opt_class(), "unreadBubbleImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "unreadBubbleImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:highlightedImage:", v7, v8);
      v10 = self->_badgeImageView;
      self->_badgeImageView = v9;

      -[PSBadgedTableCell contentView](self, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSubview:", self->_badgeImageView);

      v12 = objc_alloc(MEMORY[0x1E0CEA700]);
      v13 = (UILabel *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v14 = self->_badgeNumberLabel;
      self->_badgeNumberLabel = v13;

      v15 = self->_badgeNumberLabel;
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v15, "setBackgroundColor:", v16);

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "preferredContentSizeCategory");
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v18);

      v20 = 17.0;
      if (IsAccessibilityCategory)
      {
        objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "pointSize");
        v23 = v22;

        v20 = fmin(v23, 50.0);
      }
      v24 = -[PSBadgedTableCell _shouldUseRoundStyle](self, "_shouldUseRoundStyle");
      v25 = self->_badgeNumberLabel;
      if (v24)
        objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", v20);
      else
        objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v25, "setFont:", v26);

      v27 = self->_badgeNumberLabel;
      v28 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringFromNumber:numberStyle:", v29, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v27, "setText:", v30);

      -[UILabel setTextAlignment:](self->_badgeNumberLabel, "setTextAlignment:", 1);
      -[PSBadgedTableCell contentView](self, "contentView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addSubview:", self->_badgeNumberLabel);

    }
    -[PSBadgedTableCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSBadgedTableCell;
  -[PSTableCell setSelected:animated:](&v5, sel_setSelected_animated_, a3, a4);
  -[PSBadgedTableCell setNeedsLayout](self, "setNeedsLayout");
}

+ (id)reuseIdentifierForClassAndType:(int64_t)a3
{
  return CFSTR("PSBadgedTableCell");
}

- (PSBadgedTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PSBadgedTableCell *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PSBadgedTableCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v14, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  if (v9)
  {
    objc_msgSend(v8, "propertyForKey:", CFSTR("badgeNumber"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      -[PSBadgedTableCell badgeWithInteger:](v9, "badgeWithInteger:", objc_msgSend(v10, "integerValue"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel_resetLocale, *MEMORY[0x1E0C99720], 0);

  }
  return v9;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSBadgedTableCell;
  -[PSTableCell setHighlighted:animated:](&v5, sel_setHighlighted_animated_, a3, a4);
  -[PSBadgedTableCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  NSString *v15;
  _BOOL4 IsAccessibilityCategory;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  void *v25;
  double v26;
  double v27;
  float v28;
  double v29;
  UILabel *badgeNumberLabel;
  void *v31;
  double v32;
  void *v33;
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
  CGFloat v46;
  double MinX;
  double MaxX;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double Width;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double Height;
  CGFloat v67;
  double v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t i;
  void *v76;
  id v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double MinY;
  void *v86;
  void *v87;
  double v88;
  double v89;
  CGFloat v90;
  double v91;
  void *v92;
  double v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  CGFloat v98;
  double v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  CGFloat v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  void *v117;
  CGFloat v118;
  double v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  CGFloat v123;
  CGFloat rect;
  CGFloat recta;
  CGFloat v126;
  char v127;
  double v128;
  double v129;
  double v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  objc_super v135;
  _BYTE v136[128];
  uint64_t v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;

  v137 = *MEMORY[0x1E0C80C00];
  v135.receiver = self;
  v135.super_class = (Class)PSBadgedTableCell;
  -[PSTableCell layoutSubviews](&v135, sel_layoutSubviews);
  if (!self->_badgeImageView)
    return;
  -[UILabel sizeToFit](self->_badgeNumberLabel, "sizeToFit");
  -[PSBadgedTableCell layoutManager](self, "layoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentRectForCell:forState:", self, 0);
  rect = v5;
  v126 = v4;
  v7 = v6;
  v9 = v8;

  -[UIImageView frame](self->_badgeImageView, "frame");
  v11 = v10;
  v13 = v12;
  -[PSBadgedTableCell traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredContentSizeCategory");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

  if (-[PSBadgedTableCell _shouldUseRoundStyle](self, "_shouldUseRoundStyle"))
  {
    if (IsAccessibilityCategory)
    {
      -[UILabel frame](self->_badgeNumberLabel, "frame");
      v13 = v17;
      -[UILabel frame](self->_badgeNumberLabel, "frame");
      if (v13 < v18)
        v13 = v18;
      v11 = v13;
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badgePadding");
    v20 = v19;
    -[UILabel frame](self->_badgeNumberLabel, "frame");
    v13 = v21;
    -[UILabel frame](self->_badgeNumberLabel, "frame");
    v11 = v22 + v20 * 2.0;
    -[PSBadgedTableCell minimumBadgeWidth](self, "minimumBadgeWidth");
    if (v11 < v23)
      v11 = v23;
  }
  v24 = -[PSBadgedTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PSBadgedTableCell accessoryView](self, "accessoryView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v26 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[PSBadgedTableCell contentAccessoryPadding](self, "contentAccessoryPadding");
    v26 = v27;
  }

  v122 = v9;
  v123 = v7;
  if (!v24)
    v26 = v7 - v26 - v11;
  v28 = (v9 - v13) * 0.5;
  v29 = floorf(v28);
  -[UIImageView setFrame:](self->_badgeImageView, "setFrame:", v26, v29, v11, v13);
  badgeNumberLabel = self->_badgeNumberLabel;
  if ((-[PSBadgedTableCell isHighlighted](self, "isHighlighted") & 1) == 0)
    -[PSBadgedTableCell isSelected](self, "isSelected");
  objc_msgSend((id)objc_opt_class(), "badgeNumberLabelTextColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](badgeNumberLabel, "setTextColor:", v31);

  if (-[PSBadgedTableCell _shouldUseRoundStyle](self, "_shouldUseRoundStyle"))
    v32 = v29;
  else
    v32 = v29 + -1.0;
  -[UILabel setFrame:](self->_badgeNumberLabel, "setFrame:", v26, v32, v11, v13);
  -[PSBadgedTableCell textLabel](self, "textLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "frame");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;

  v129 = v11;
  v130 = v26;
  v128 = v13;
  v42 = v35;
  v43 = v37;
  v44 = v39;
  v45 = v41;
  if ((v24 & 1) != 0)
  {
    v118 = v41;
    v46 = v37;
    MinX = CGRectGetMinX(*(CGRect *)&v42);
    v138.origin.x = v26;
    v138.origin.y = v29;
    v138.size.width = v11;
    v138.size.height = v13;
    if (MinX >= CGRectGetMaxX(v138))
    {
      v52 = v35;
      v59 = v29;
      v53 = v46;
      v41 = v118;
      if (!IsAccessibilityCategory)
        goto LABEL_42;
      goto LABEL_28;
    }
    v139.origin.x = v35;
    v120 = v46;
    v139.origin.y = v46;
    v139.size.width = v39;
    v41 = v118;
    v139.size.height = v118;
    MaxX = CGRectGetMaxX(v139);
    v140.origin.x = v26;
    v119 = v29;
    v140.origin.y = v29;
    v140.size.width = v11;
    v140.size.height = v13;
    v49 = MaxX - CGRectGetMaxX(v140);
    -[PSBadgedTableCell contentAccessoryPadding](self, "contentAccessoryPadding");
    v51 = v49 - v50;
    v52 = v35 + v39 - v51;
    v39 = v51;
    v53 = v120;
LABEL_23:
    -[PSBadgedTableCell textLabel](self, "textLabel", *(_QWORD *)&v118);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setFrame:", v52, v53, v39, v41);

    v59 = v119;
    if (!IsAccessibilityCategory)
      goto LABEL_42;
LABEL_28:
    v144.origin.x = v52;
    v144.origin.y = v53;
    v144.size.width = v39;
    v144.size.height = v41;
    Width = CGRectGetWidth(v144);
    -[PSBadgedTableCell textLabel](self, "textLabel");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "sizeThatFits:", Width, 1.79769313e308);
    v63 = v62;
    v65 = v64;

    v145.origin.y = rect;
    v145.origin.x = v126;
    v145.size.height = v122;
    v145.size.width = v123;
    Height = CGRectGetHeight(v145);
    v146.origin.x = v52;
    v146.origin.y = v53;
    v146.size.width = v63;
    v146.size.height = v65;
    v67 = CGRectGetHeight(v146);
    v68 = PSRoundToPixel((Height - v67) * 0.5);
    -[PSBadgedTableCell textLabel](self, "textLabel");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setFrame:", v52, v68, v63, v65);

    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    -[PSBadgedTableCell subviews](self, "subviews");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v131, v136, 16);
    if (v71)
    {
      v72 = v71;
      v127 = v24;
      v73 = 0;
      v74 = *(_QWORD *)v132;
      do
      {
        for (i = 0; i != v72; ++i)
        {
          if (*(_QWORD *)v132 != v74)
            objc_enumerationMutation(v70);
          v76 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v77 = v76;

            v73 = v77;
          }
        }
        v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v131, v136, 16);
      }
      while (v72);

      if (v73)
      {
        objc_msgSend(v73, "frame");
        v79 = v78;
        recta = v80;
        v82 = v81;
        v84 = v83;
        v147.origin.x = v52;
        v147.origin.y = v68;
        v147.size.width = v63;
        v147.size.height = v65;
        MinY = CGRectGetMinY(v147);
        -[PSBadgedTableCell textLabel](self, "textLabel");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "font");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "lineHeight");
        v89 = v88;
        v148.origin.x = v79;
        v148.origin.y = recta;
        v148.size.width = v82;
        v148.size.height = v84;
        v90 = CGRectGetHeight(v148);
        v91 = MinY + PSRoundToPixel((v89 - v90) * 0.5);

        objc_msgSend(v73, "setFrame:", v79, v91, v82, v84);
      }
      LOBYTE(v24) = v127;
    }
    else
    {

      v73 = 0;
    }
    -[PSBadgedTableCell textLabel](self, "textLabel", *(_QWORD *)&v118);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "frame");
    v93 = CGRectGetMinY(v149);
    -[PSBadgedTableCell textLabel](self, "textLabel");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "font");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "lineHeight");
    v97 = v96;
    v150.origin.x = v130;
    v150.origin.y = v59;
    v150.size.width = v129;
    v150.size.height = v128;
    v98 = CGRectGetHeight(v150);
    v99 = v59 - (v93 + PSRoundToPixel((v97 - v98) * 0.5));

    v59 = v59 - v99;
    -[UIImageView setFrame:](self->_badgeImageView, "setFrame:", v130, v59, v129, v128);
    -[UILabel setFrame:](self->_badgeNumberLabel, "setFrame:", v130, v59, v129, v128);

    goto LABEL_42;
  }
  v121 = v37;
  v54 = CGRectGetMaxX(*(CGRect *)&v42);
  v141.origin.x = v26;
  v141.origin.y = v29;
  v141.size.width = v11;
  v141.size.height = v13;
  if (v54 > CGRectGetMinX(v141))
  {
    v142.origin.x = v26;
    v119 = v29;
    v142.origin.y = v29;
    v142.size.width = v11;
    v142.size.height = v13;
    v55 = CGRectGetMinX(v142);
    v143.origin.x = v35;
    v53 = v121;
    v143.origin.y = v121;
    v143.size.width = v39;
    v143.size.height = v41;
    v56 = v55 - CGRectGetMinX(v143);
    -[PSBadgedTableCell contentAccessoryPadding](self, "contentAccessoryPadding");
    v39 = v56 - v57;
    v52 = v35;
    goto LABEL_23;
  }
  v52 = v35;
  v59 = v29;
  v53 = v121;
  if (IsAccessibilityCategory)
    goto LABEL_28;
LABEL_42:
  if (-[PSBadgedTableCell style](self, "style", *(_QWORD *)&v118) != 3)
    return;
  -[PSBadgedTableCell detailTextLabel](self, "detailTextLabel");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "frame");
  v102 = v101;
  v104 = v103;
  v106 = v105;
  v108 = v107;

  if ((v24 & 1) != 0)
  {
    v151.size.width = v129;
    v151.origin.x = v130;
    v151.origin.y = v59;
    v151.size.height = v128;
    v109 = CGRectGetMaxX(v151);
    -[PSBadgedTableCell contentAccessoryPadding](self, "contentAccessoryPadding");
    v111 = v109 + v110;
    v152.origin.x = v102;
    v152.origin.y = v104;
    v152.size.width = v106;
    v152.size.height = v108;
    if (CGRectGetMinX(v152) >= v111)
      return;
    v153.origin.x = v102;
    v153.origin.y = v104;
    v153.size.width = v106;
    v153.size.height = v108;
    v112 = v111 - CGRectGetMinX(v153);
    v154.origin.x = v102;
    v154.origin.y = v104;
    v154.size.width = v106;
    v154.size.height = v108;
    v113 = CGRectGetMaxX(v154) - v111;
  }
  else
  {
    v155.size.width = v129;
    v155.origin.x = v130;
    v155.origin.y = v59;
    v155.size.height = v128;
    v114 = CGRectGetMinX(v155);
    -[PSBadgedTableCell contentAccessoryPadding](self, "contentAccessoryPadding");
    v116 = v114 - v115;
    v156.origin.x = v102;
    v156.origin.y = v104;
    v156.size.width = v106;
    v156.size.height = v108;
    if (CGRectGetMaxX(v156) <= v116)
      return;
    v157.origin.x = v102;
    v157.origin.y = v104;
    v157.size.width = v106;
    v157.size.height = v108;
    CGRectGetMinX(v157);
    v158.origin.x = v102;
    v158.origin.y = v104;
    v158.size.width = v106;
    v158.size.height = v108;
    v113 = v116 - CGRectGetMinX(v158);
    v112 = -0.0;
  }
  -[PSBadgedTableCell detailTextLabel](self, "detailTextLabel");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setFrame:", v102 + v112, v104, v113, v108);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

  v4.receiver = self;
  v4.super_class = (Class)PSBadgedTableCell;
  -[PSTableCell dealloc](&v4, sel_dealloc);
}

- (void)resetLocale
{
  UILabel *badgeNumberLabel;
  void *v4;
  void *v5;
  void *v6;

  badgeNumberLabel = self->_badgeNumberLabel;
  v4 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_badgeInt);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringFromNumber:numberStyle:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](badgeNumberLabel, "setText:", v6);

  -[PSBadgedTableCell setNeedsLayout](self, "setNeedsLayout");
}

- (double)contentAccessoryPadding
{
  return 10.0;
}

- (double)minimumBadgeWidth
{
  return 30.0;
}

- (BOOL)_shouldUseRoundStyle
{
  double v2;

  objc_msgSend((id)objc_opt_class(), "badgePadding");
  return v2 == 0.0;
}

+ (double)badgePadding
{
  return 0.0;
}

+ (id)unreadBubbleImage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PSBadgedTableCell_unreadBubbleImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (unreadBubbleImage_onceToken != -1)
    dispatch_once(&unreadBubbleImage_onceToken, block);
  return (id)unreadBubbleImage_image;
}

void __38__PSBadgedTableCell_unreadBubbleImage__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;

  v2 = (void *)MEMORY[0x1E0CEA638];
  PSPreferencesFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("UnreadBubble"), v3, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)unreadBubbleImage_image;
  unreadBubbleImage_image = v6;

  objc_msgSend(*(id *)(a1 + 32), "badgePadding");
  if (v8 != 0.0)
  {
    v9 = (void *)unreadBubbleImage_image;
    objc_msgSend(*(id *)(a1 + 32), "badgePadding");
    objc_msgSend(v9, "stretchableImageWithLeftCapWidth:topCapHeight:", (uint64_t)v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)unreadBubbleImage_image;
    unreadBubbleImage_image = v11;

  }
}

+ (id)badgeNumberLabelTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeNumberLabel, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
}

@end
