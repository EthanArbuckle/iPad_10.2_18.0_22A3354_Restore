@implementation PSTableCell

- (void)layoutSubviews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  NSString *v31;
  _BOOL4 IsAccessibilityCategory;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  float v39;
  double v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  UIImageView *checkedImageView;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  float v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  CGFloat v90;
  double MaxX;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  double v98;
  double v99;
  int64_t v100;
  void *v101;
  void *v102;
  float v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  void *v113;
  void *v114;
  double v115;
  double v116;
  double v117;
  double v118;
  void *v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  id WeakRetained;
  void *v129;
  int v130;
  void *v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  void *v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  void *v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  id v159;
  id v160;
  objc_super v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;

  if (-[PSTableCell modernLayoutEnabled](self, "modernLayoutEnabled"))
  {
    -[PSTableCell setupModernLayoutConstraints](self, "setupModernLayoutConstraints");
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("PSTableCellVisualLabelDebugging"));

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "colorWithAlphaComponent:", 0.3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell textLabel](self, "textLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:", v6);

      objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
      v159 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "colorWithAlphaComponent:", 0.2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell detailTextLabel](self, "detailTextLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v8);

    }
    return;
  }
  v161.receiver = self;
  v161.super_class = (Class)PSTableCell;
  -[PSTableCell layoutSubviews](&v161, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("PSTableCellVisualLabelDebugging"));

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "colorWithAlphaComponent:", 0.3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell textLabel](self, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorWithAlphaComponent:", 0.2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell detailTextLabel](self, "detailTextLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v16);

  }
  v18 = -[PSTableCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PSTableCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v157 = v21;
  v158 = v20;
  v160 = v22;
  v24 = v23;

  -[PSTableCell contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v27 = v26;
  v29 = v28;

  -[PSTableCell traitCollection](self, "traitCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "preferredContentSizeCategory");
  v31 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v31);

  if (IsAccessibilityCategory)
  {
    -[PSTableCell textLabel](self, "textLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = 1045220557;
    objc_msgSend(v33, "_setHyphenationFactor:", v34);

    -[PSTableCell detailTextLabel](self, "detailTextLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v36) = 1055286886;
    objc_msgSend(v35, "_setHyphenationFactor:", v36);

  }
  if ((self->_alignment & 0xFFFFFFFE) == 2)
  {
    -[PSTableCell textLabel](self, "textLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "frame");
    if (self->_alignment == 2)
    {
      v39 = v27 * 0.5 - v38 * 0.5;
      v40 = roundf(v39);
    }
    else
    {
      v40 = v27 - v38 + -10.0;
    }
    objc_msgSend(v37, "setFrame:", v40);
    -[PSTableCell detailTextLabel](self, "detailTextLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "text");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "length");

    if (!v65)
      goto LABEL_26;
    objc_msgSend(v41, "frame");
    v47 = v66;
    v51 = v67;
    v61 = v27 - v63 + -10.0;
    *(float *)&v66 = v27 * 0.5 - v63 * 0.5;
    v68 = roundf(*(float *)&v66);
    if (self->_alignment == 2)
      v61 = v68;
    goto LABEL_25;
  }
  -[PSTableCell specifier](self, "specifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "propertyForKey:", CFSTR("LeftAlignLinkListDetailText"));
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = (void *)v42;
    v44 = -[PSTableCell type](self, "type");

    if (v44 != 2)
      goto LABEL_27;
    -[PSTableCell detailTextLabel](self, "detailTextLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTextAlignment:", 0);
    objc_msgSend(v41, "frame");
    v155 = v45;
    v47 = v46;
    v49 = v48;
    v51 = v50;
    -[PSTableCell textFieldOffset](self, "textFieldOffset");
    v53 = v52;
    -[PSTableCell textLabel](self, "textLabel");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "frame");
    v55 = v24;
    v57 = v56;
    -[PSTableCell _tableView](self, "_tableView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "layoutMargins");
    v60 = v57 + v59 + 6.0;

    if (v60 <= v53)
      v61 = v53;
    else
      v61 = v60;
    v24 = v55;
    v62 = v61 - v155;
    if (v18)
      v62 = 0.0;
    v63 = v49 - v62;
    if (v18)
      v61 = *(double *)&v160 - v61 - v49;
LABEL_25:
    objc_msgSend(v41, "setFrame:", v61, v47, v63, v51);
  }
LABEL_26:

LABEL_27:
  checkedImageView = self->_checkedImageView;
  if (!checkedImageView)
    goto LABEL_46;
  v153 = v24;
  -[UIImageView frame](checkedImageView, "frame");
  v71 = v70;
  v73 = v72;
  v154 = v29;
  v156 = v27;
  v74 = (v29 - v72) * 0.5;
  v75 = floorf(v74);
  v76 = v27 + -8.0 - v70;
  if (v18)
    v77 = 8.0;
  else
    v77 = v76;
  -[UIImageView setFrame:](self->_checkedImageView, "setFrame:", v77, v75);
  -[PSTableCell valueLabel](self, "valueLabel");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v78;
  if (v78)
  {
    objc_msgSend(v78, "frame");
    v84 = v80;
    v85 = v81;
    v86 = v83;
    if ((v18 & 1) != 0)
    {
      v152 = v82;
      -[PSTableCell detailTextLabel](self, "detailTextLabel");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "frame");
      v89 = v88;
      v162.origin.x = v77;
      v162.origin.y = v75;
      v162.size.width = v71;
      v162.size.height = v73;
      v90 = CGRectGetMaxX(v162) + v89 + 9.0;

      v84 = v84 + v90;
      objc_msgSend(v79, "setFrame:", v84, v85, v152, v86);
      v163.origin.x = v84;
      v163.origin.y = v85;
      v163.size.width = v152;
      v163.size.height = v86;
      MaxX = CGRectGetMaxX(v163);
      -[PSTableCell textLabel](self, "textLabel");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "frame");
      v93 = MaxX - (CGRectGetMinX(v164) + -6.0);

      if (v93 > 0.0)
      {
        v94 = v85;
        v95 = v152;
        goto LABEL_43;
      }
    }
    else
    {
      v96 = v82;
      v93 = CGRectGetMaxX(*(CGRect *)&v80) - (v76 + -9.0);
      if (v93 > 0.0)
      {
        v94 = v85;
        v95 = v96;
        -[PSTableCell textLabel](self, "textLabel");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "frame");
        v98 = v84 - (CGRectGetMaxX(v165) + 6.0);

        if (v98 > 0.0)
        {
          if (v93 <= v98)
            v99 = v95;
          else
            v99 = v95 - (v93 - v98);
          if (v93 <= v98)
            v84 = v84 - v93;
          else
            v84 = v84 - v98;
          goto LABEL_44;
        }
LABEL_43:
        v99 = v95 - v93;
LABEL_44:
        objc_msgSend(v79, "setFrame:", v84, v94, v99, v86);
      }
    }
  }

  v29 = v154;
  v27 = v156;
  v24 = v153;
LABEL_46:
  v100 = -[PSTableCell type](self, "type");
  if (v100 == 10)
  {
    -[PSTableCell iconImageView](self, "iconImageView");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v114;
    if (v114)
    {
      objc_msgSend(v114, "frame");
      v116 = v115;
      v118 = v117;
      -[PSTableCell contentView](self, "contentView");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "bounds");
      v121 = v120;
      v123 = v122;
      v125 = v124;
      v127 = v126;

      objc_msgSend(v102, "setFrame:", floor(v121 + v125 * 0.5 - v116 * 0.5), floor(v123 + v127 * 0.5 - v118 * 0.5), v116, v118);
    }
  }
  else
  {
    if (v100 != 14)
      goto LABEL_54;
    -[PSTableCell specifier](self, "specifier");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "propertyForKey:", CFSTR("height"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    if (v102)
    {
      objc_msgSend(v102, "floatValue");
      v24 = v103;
    }
    v104 = PSTextViewInsets();
    v106 = v158 + v105;
    v107 = v157 + v104;
    v109 = *(double *)&v160 - (v105 + v108);
    v111 = v24 - (v104 + v110);
    -[PSTableCell textView](self, "textView");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setFrame:", v106, v107, v109, v111);

    -[PSTableCell textLabel](self, "textLabel");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "setHidden:", 1);

  }
LABEL_54:
  WeakRetained = objc_loadWeakRetained((id *)&self->_specifier);
  objc_msgSend(WeakRetained, "propertyForKey:", CFSTR("prioritizeValueTextDisplay"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = objc_msgSend(v129, "BOOLValue");

  if (v130)
  {
    -[PSTableCell valueLabel](self, "valueLabel");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "sizeThatFits:", v27, v29);
    objc_msgSend(v131, "frame");
    v133 = v132;
    v135 = v134;
    v137 = v136;
    v139 = v138;
    UICeilToViewScale();
    v141 = v140 - v137;
    if (v140 - v137 > 0.0)
    {
      objc_msgSend(v131, "setFrame:", v133 - v141, v135, v137 + v141, v139);
      -[PSTableCell titleLabel](self, "titleLabel");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "frame");
      v144 = v143;
      v146 = v145;
      v148 = v147;
      v150 = v149;

      -[PSTableCell titleLabel](self, "titleLabel");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "setFrame:", v144, v146, v148 - v141, v150);

    }
  }
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)modernLayoutEnabled
{
  void *v3;
  NSString *v4;
  BOOL IsAccessibilityCategory;
  void *v6;
  void *v7;
  BOOL v8;

  -[PSTableCell traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (!IsAccessibilityCategory)
  {
    -[PSTableCell specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("useModernLayout"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "BOOLValue") & 1) != 0)
    {

      return 1;
    }
    if (_os_feature_enabled_impl())
    {
      v8 = -[PSTableCell shouldUseModernLayout](self, "shouldUseModernLayout");

      if (v8)
        return 1;
    }
    else
    {

    }
  }
  return 0;
}

- (PSSpecifier)specifier
{
  return (PSSpecifier *)objc_loadWeakRetained((id *)&self->_specifier);
}

+ (int64_t)cellTypeFromString:(id)a3
{
  id v3;
  int64_t v4;
  int v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 3)
    goto LABEL_2;
  v6 = objc_msgSend(v3, "characterAtIndex:", 2);
  if (v6 <= 75)
  {
    if (v6 == 69)
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PSEditTextCell")) & 1) != 0)
      {
        v4 = 8;
        goto LABEL_3;
      }
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PSEditTextViewCell")) & 1) != 0)
      {
        v4 = 14;
        goto LABEL_3;
      }
      goto LABEL_2;
    }
    if (v6 == 71)
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PSGroupCell")) & 1) != 0)
      {
        v4 = 0;
        goto LABEL_3;
      }
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PSGiantIconCell")) & 1) != 0)
      {
        v4 = 10;
        goto LABEL_3;
      }
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PSGiantCell")) & 1) != 0)
      {
        v4 = 11;
        goto LABEL_3;
      }
      goto LABEL_2;
    }
    goto LABEL_21;
  }
  if (v6 == 76)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PSLinkCell")) & 1) != 0)
    {
      v4 = 1;
      goto LABEL_3;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PSLinkListCell")) & 1) != 0)
    {
      v4 = 2;
      goto LABEL_3;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PSListItemCell")) & 1) != 0)
    {
      v4 = 3;
      goto LABEL_3;
    }
    goto LABEL_2;
  }
  if (v6 == 83)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PSSwitchCell")) & 1) != 0)
    {
      v4 = 6;
      goto LABEL_3;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PSSliderCell")) & 1) != 0)
    {
      v4 = 5;
      goto LABEL_3;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PSSegmentCell")) & 1) != 0)
    {
      v4 = 9;
      goto LABEL_3;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PSSecureEditTextCell")) & 1) != 0)
    {
      v4 = 12;
      goto LABEL_3;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PSSpinnerCell")) & 1) != 0)
    {
      v4 = 15;
      goto LABEL_3;
    }
    goto LABEL_2;
  }
  if (v6 != 84)
  {
LABEL_21:
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PSButtonCell")) & 1) != 0)
    {
      v4 = 13;
      goto LABEL_3;
    }
    _PSLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_DEFAULT, "CellType String (%@) Fell Back to PSDefaultCell", (uint8_t *)&v8, 0xCu);
    }

    goto LABEL_2;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PSTableCell")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("PSTitleValueCell")) & 1) != 0)
  {
    v4 = 4;
    goto LABEL_3;
  }
LABEL_2:
  v4 = -1;
LABEL_3:

  return v4;
}

+ (id)reuseIdentifierForClassAndType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSTableCell stringFromCellType:](PSTableCell, "stringFromCellType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)stringFromCellType:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0x11)
    return &stru_1E4A69238;
  else
    return off_1E4A663B8[a3 + 1];
}

void __55__PSTableCell_initWithStyle_reuseIdentifier_specifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "handleTraitCollectionChange:", v4);

}

void __39__PSTableCell_loadISIconFromSpecifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _BYTE *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "getLazyIconID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == *(void **)(a1 + 40))
  {
    v6 = v2;
    objc_msgSend(*(id *)(a1 + 32), "specifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = *(_BYTE **)(a1 + 32);
      if (v4[1105])
      {
        objc_msgSend(v4, "specifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setProperty:forKey:", *(_QWORD *)(a1 + 48), CFSTR("iconImage"));

        v4 = *(_BYTE **)(a1 + 32);
      }
      objc_msgSend(v4, "setIcon:", *(_QWORD *)(a1 + 48));
    }
  }
  else
  {

  }
}

- (void)setSpecifier:(id)a3
{
  PSSpecifier **p_specifier;
  id v5;
  void *v6;
  id v7;

  p_specifier = &self->_specifier;
  v5 = a3;
  objc_storeWeak((id *)p_specifier, v5);
  objc_msgSend(v5, "propertyForKey:", CFSTR("iconUTTypeIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell setLazyIconUTTypeIdentifier:](self, "setLazyIconUTTypeIdentifier:", v6);

  objc_msgSend(v5, "propertyForKey:", CFSTR("iconShapeOverride"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PSTableCell setLazyIconShapeOverride:](self, "setLazyIconShapeOverride:", v7);
}

- (void)setLazyIconUTTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lazyIconUTTypeIdentifier, a3);
}

- (void)setLazyIconShapeOverride:(id)a3
{
  objc_storeStrong((id *)&self->_lazyIconShapeOverride, a3);
}

- (void)setReusedCell:(BOOL)a3
{
  self->_reusedCell = a3;
}

+ (int64_t)cellStyle
{
  return 1;
}

+ (Class)cellClassForSpecifier:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a3, "propertyForKey:", CFSTR("cellClass"));
  if (v3)
    return (Class)v3;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)reuseIdentifierForSpecifier:(id)a3
{
  _QWORD *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (id)objc_msgSend(v3, "propertyForKey:", CFSTR("cellClass"));
  if (v4)
  {
    if (!objc_msgSend(v4, "isSubclassOfClass:", objc_opt_class()))
    {
      NSStringFromClass(+[PSTableCell cellClassForSpecifier:](PSTableCell, "cellClassForSpecifier:", v3));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSTableCell stringFromCellType:](PSTableCell, "stringFromCellType:", v3[7]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend(v4, "reuseIdentifierForClassAndType:", v3[7]);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PSTableCell reuseIdentifierForBasicCellTypes:](PSTableCell, "reuseIdentifierForBasicCellTypes:", v3[7]);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

+ (id)reuseIdentifierForBasicCellTypes:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE)
    return CFSTR("PSTableCell");
  else
    return off_1E4A66448[a3 - 1];
}

void __39__PSTableCell_loadISIconFromSpecifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "getLazyIconID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 != *(void **)(a1 + 40))
  {

LABEL_3:
    objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", *(_QWORD *)(a1 + 56));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setQueuePriority:", -4);
    objc_msgSend(v6, "setQualityOfService:", 25);
    objc_msgSend(*(id *)(a1 + 32), "lazyIconQueue:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addOperation:", v6);

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)imageDescriptor
{
  void *v3;
  double v4;
  double v5;
  unint64_t v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  -[PSTableCell cachedTraitCollection](self, "cachedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  v6 = -[PSTableCell iconShape](self, "iconShape");
  -[PSTableCell iconSizeForShape:scale:](self, "iconSizeForShape:scale:", v6, v5);
  if (v6 == 4)
  {
    objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A878]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setScale:", v5);
    objc_msgSend(v9, "setSize:", 60.0, 45.0);
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v7, v8, v5);
  }
  objc_msgSend(v9, "setDrawBorder:", 1);
  -[PSTableCell cachedTraitCollection](self, "cachedTraitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAppearance:", objc_msgSend(v10, "userInterfaceStyle") != 1);

  -[PSTableCell cachedTraitCollection](self, "cachedTraitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "layoutDirection"))
    v12 = 2;
  else
    v12 = 1;
  objc_msgSend(v9, "setLanguageDirection:", v12);

  -[PSTableCell cachedTraitCollection](self, "cachedTraitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContrast:", objc_msgSend(v13, "accessibilityContrast") == 1);

  objc_msgSend(v9, "setShape:", v6);
  return v9;
}

- (UITraitCollection)cachedTraitCollection
{
  return self->_cachedTraitCollection;
}

- (void)handleTraitCollectionChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  id v15;

  v15 = a3;
  -[PSTableCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell setCachedTraitCollection:](self, "setCachedTraitCollection:", v4);

  objc_opt_class();
  -[PSTableCell lazyIconUTTypeIdentifier](self, "lazyIconUTTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  -[PSTableCell specifier](self, "specifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v15, "userInterfaceStyle");
  -[PSTableCell traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == objc_msgSend(v9, "userInterfaceStyle"))
  {
    v10 = objc_msgSend(v15, "accessibilityContrast");
    -[PSTableCell traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == objc_msgSend(v11, "accessibilityContrast"))
    {
      v12 = objc_msgSend(v15, "layoutDirection");
      -[PSTableCell traitCollection](self, "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12 != objc_msgSend(v13, "layoutDirection");

    }
    else
    {
      v14 = 1;
    }

  }
  else
  {
    v14 = 1;
  }

  if (v14 && v6 && v7)
    -[PSTableCell loadISIconFromSpecifier:](self, "loadISIconFromSpecifier:", v7);

}

- (void)setCachedTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_cachedTraitCollection, a3);
}

- (void)loadISIconFromSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  PSTableCell *v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  -[PSTableCell lazyIconUTTypeIdentifier](self, "lazyIconUTTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D3A820]);
    -[PSTableCell lazyIconUTTypeIdentifier](self, "lazyIconUTTypeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "initWithType:", v8);

  }
  -[PSTableCell imageDescriptor](self, "imageDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageForDescriptor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_msgSend(v10, "placeholder") & 1) == 0)
  {
    _PSLoggingFacility();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[PSTableCell specifier](self, "specifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v43 = "-[PSTableCell loadISIconFromSpecifier:]";
      v44 = 2112;
      v45 = v24;
      _os_log_impl(&dword_1A3819000, v22, OS_LOG_TYPE_DEFAULT, "%s: found fast icon for %@", buf, 0x16u);

    }
    -[PSTableCell getLazyIconID](self, "getLazyIconID");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[PSTableCell getLazyIconID](self, "getLazyIconID");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (v25 == v12)
    {
      -[PSTableCell specifier](self, "specifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
        goto LABEL_14;
      v27 = (void *)MEMORY[0x1E0CEA638];
      v28 = objc_msgSend(v10, "CGImage");
      objc_msgSend(v10, "scale");
      objc_msgSend(v27, "imageWithCGImage:scale:orientation:", v28, 0);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      -[PSTableCell getLazyIconID](self, "getLazyIconID");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (v29 == v12)
      {
        -[PSTableCell specifier](self, "specifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          if (self->_lazyIconDontUnload)
          {
            -[PSTableCell specifier](self, "specifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setProperty:forKey:", v25, CFSTR("iconImage"));

          }
          -[PSTableCell setIcon:](self, "setIcon:", v25);
        }
      }
      else
      {

      }
    }

  }
  else
  {
    -[PSTableCell blankIcon](self, "blankIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell setIcon:](self, "setIcon:", v11);

    -[PSTableCell getLazyIconID](self, "getLazyIconID");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[PSTableCell lazyIconQueue:](self, "lazyIconQueue:", v4);
      v14 = MEMORY[0x1E0C809B0];
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __39__PSTableCell_loadISIconFromSpecifier___block_invoke;
      v40[3] = &unk_1E4A655B8;
      v40[4] = self;
      v15 = v12;
      v41 = v15;
      v16 = (void *)MEMORY[0x1A8594D10](v40);
      v17 = (void *)MEMORY[0x1E0CB34C8];
      v32 = v14;
      v33 = 3221225472;
      v34 = __39__PSTableCell_loadISIconFromSpecifier___block_invoke_3;
      v35 = &unk_1E4A65848;
      v36 = self;
      v12 = v15;
      v37 = v12;
      v39 = v16;
      v18 = v4;
      v38 = v18;
      v19 = v16;
      objc_msgSend(v17, "blockOperationWithBlock:", &v32);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setQualityOfService:", 25, v32, v33, v34, v35, v36);
      -[PSTableCell lazyIconQueue:](self, "lazyIconQueue:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addOperation:", v20);

    }
  }
LABEL_14:

}

- (id)getLazyIconID
{
  NSURL *lazyIconAppID;
  NSURL *v4;
  void *v6;
  void *v7;
  id v8;

  lazyIconAppID = (NSURL *)self->_lazyIconAppID;
  if (lazyIconAppID || (lazyIconAppID = self->_lazyIconURL) != 0)
  {
    v4 = lazyIconAppID;
  }
  else
  {
    objc_opt_class();
    -[PSTableCell lazyIconUTTypeIdentifier](self, "lazyIconUTTypeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      -[PSTableCell lazyIconUTTypeIdentifier](self, "lazyIconUTTypeIdentifier");
      v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (NSString)lazyIconUTTypeIdentifier
{
  return self->_lazyIconUTTypeIdentifier;
}

- (id)lazyIconQueue:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "propertyForKey:", CFSTR("customIconQueue"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)lazyIconQueue____lazyIconQueue;
    if (!lazyIconQueue____lazyIconQueue)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      v6 = (void *)lazyIconQueue____lazyIconQueue;
      lazyIconQueue____lazyIconQueue = (uint64_t)v5;

      objc_msgSend((id)lazyIconQueue____lazyIconQueue, "setMaxConcurrentOperationCount:", 8);
      v4 = (void *)lazyIconQueue____lazyIconQueue;
    }
    v3 = v4;
  }
  return v3;
}

- (PSTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  id v9;
  PSTableCell *v10;
  PSTableCell *v11;
  uint64_t v12;
  UITraitCollection *cachedTraitCollection;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id location;

  v8 = a4;
  v9 = a5;
  v10 = -[PSTableCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", a3, v8);
  v11 = v10;
  if (v10)
  {
    v10->_alignment = 1;
    v10->_cellEnabled = 1;
    -[PSTableCell traitCollection](v10, "traitCollection");
    v12 = objc_claimAutoreleasedReturnValue();
    cachedTraitCollection = v11->_cachedTraitCollection;
    v11->_cachedTraitCollection = (UITraitCollection *)v12;

    objc_initWeak(&location, v11);
    objc_msgSend(MEMORY[0x1E0CEAB40], "systemTraitsAffectingColorAppearance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__PSTableCell_initWithStyle_reuseIdentifier_specifier___block_invoke;
    v17[3] = &unk_1E4A66348;
    objc_copyWeak(&v18, &location);
    v15 = (id)-[PSTableCell registerForTraitChanges:withHandler:](v11, "registerForTraitChanges:withHandler:", v14, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v4 = a4;
  v5 = a3;
  -[PSTableCell specifier](self, "specifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyForKey:", CFSTR("isTopLevelCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    -[PSTableCell specifier](self, "specifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "propertyForKey:", CFSTR("hasSelectionStyle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    v13 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v14 = (void *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    if (v5 && v12)
    {
      -[PSTableCell textLabel](self, "textLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHighlightedTextColor:", v16);

      -[PSTableCell detailTextLabel](self, "detailTextLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHighlightedTextColor:", v18);

      +[PSListController appearance](PSListController, "appearance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "padSelectionColor");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[PSListController appearance](PSListController, "appearance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "cellHighlightColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
LABEL_8:
        -[PSTableCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v14);

        goto LABEL_9;
      }
      -[PSTableCell textLabel](self, "textLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setHighlightedTextColor:", 0);

      -[PSTableCell detailTextLabel](self, "detailTextLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setHighlightedTextColor:", 0);

      +[PSListController appearance](PSListController, "appearance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "cellHighlightColor");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v20;
    objc_msgSend(v14, "setBackgroundColor:", v20);

    goto LABEL_8;
  }
LABEL_9:
  v26.receiver = self;
  v26.super_class = (Class)PSTableCell;
  -[PSTableCell setSelected:animated:](&v26, sel_setSelected_animated_, v5, v4);
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  NSString *lazyIconAppID;
  void *v15;
  void *v16;
  NSURL *v17;
  NSURL *lazyIconURL;
  NSURL *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  char v31;
  UILongPressGestureRecognizer *longTapRecognizer;
  UILongPressGestureRecognizer *v33;
  UILongPressGestureRecognizer *v34;
  void *v35;
  char v36;
  UILongPressGestureRecognizer *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  BOOL v44;
  BOOL v45;
  BOOL v46;
  unint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  PSTableCell *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  uint64_t v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  _BOOL4 lazyIcon;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  int64x2_t v104;
  NSObject *v105;
  id WeakRetained;
  void *v107;
  void *v108;
  void *v109;
  char v110;
  void *v111;
  id v112;
  void *v113;
  int v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  char v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  char v132;
  void *v133;
  void *v134;
  unint64_t v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint8_t buf[4];
  id v141;
  _BYTE v142[128];
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (_os_feature_enabled_impl())
  {
    v6 = objc_msgSend(v5, "cellType");
    switch(v6)
    {
      case 1:
      case 3:
      case 6:
        goto LABEL_3;
      case 2:
        if (!objc_msgSend(v5, "hasValidGetter"))
          goto LABEL_3;
        objc_msgSend(v5, "performGetter");
        v95 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v95)
          goto LABEL_3;
        break;
      case 4:
      case 5:
        break;
      default:
        if (v6 == 13)
        {
LABEL_3:
          -[PSTableCell textLabel](self, "textLabel");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setNumberOfLines:", 0);

          -[PSTableCell detailTextLabel](self, "detailTextLabel");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setNumberOfLines:", 0);

        }
        break;
    }
  }
  if (refreshCellContentsWithSpecifier__onceToken != -1)
    dispatch_once(&refreshCellContentsWithSpecifier__onceToken, &__block_literal_global_7);
  v9 = __useModernAccessibilityIdentifiers;
  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PSTableCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v10);
  }
  else
  {
    -[PSTableCell textLabel](self, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityIdentifier:", v10);

  }
  objc_msgSend(v5, "propertyForKey:", CFSTR("useLazyIcons"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_lazyIcon = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v5, "propertyForKey:", CFSTR("appIDForLazyIcon"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  lazyIconAppID = self->_lazyIconAppID;
  self->_lazyIconAppID = v13;

  objc_msgSend(v5, "propertyForKey:", CFSTR("dontUnloadLazyIcon"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_lazyIconDontUnload = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v5, "propertyForKey:", CFSTR("urlForLazyIcon"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v16;
    lazyIconURL = self->_lazyIconURL;
    self->_lazyIconURL = v17;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
      v19 = (NSURL *)objc_claimAutoreleasedReturnValue();
      lazyIconURL = self->_lazyIconURL;
      self->_lazyIconURL = v19;
    }
    else
    {
      lazyIconURL = self->_lazyIconURL;
      self->_lazyIconURL = 0;
    }
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = *((_QWORD *)v5 + 7);
    objc_msgSend(v5, "name");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "propertyForKey:", CFSTR("isCopyable"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isCopyable = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v5, "propertyForKey:", CFSTR("gestureRecognizers"));
    v23 = objc_claimAutoreleasedReturnValue();
    v133 = (void *)v23;
    v134 = (void *)v21;
    v135 = v20;
    v129 = 1105;
    if (v23 && (v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v131 = v16;
      v138 = 0u;
      v139 = 0u;
      v136 = 0u;
      v137 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v136, v142, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v137;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v137 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * i);
            -[PSTableCell gestureRecognizers](self, "gestureRecognizers", v129);
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v3, "containsObject:", v30);

            if ((v31 & 1) == 0)
              -[PSTableCell addGestureRecognizer:](self, "addGestureRecognizer:", v30);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v136, v142, 16);
        }
        while (v27);
      }

      v16 = v131;
      v21 = (uint64_t)v134;
      v20 = v135;
    }
    else
    {
      -[PSTableCell removeAllGestureRecognizers](self, "removeAllGestureRecognizers", 1105);
    }
    longTapRecognizer = self->_longTapRecognizer;
    if (self->_isCopyable)
    {
      if (!longTapRecognizer)
      {
        v33 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel_longPressed_);
        v34 = self->_longTapRecognizer;
        self->_longTapRecognizer = v33;

      }
      -[PSTableCell gestureRecognizers](self, "gestureRecognizers", v129);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "containsObject:", self->_longTapRecognizer);

      if ((v36 & 1) == 0)
        -[PSTableCell addGestureRecognizer:](self, "addGestureRecognizer:", self->_longTapRecognizer);
    }
    else
    {
      -[PSTableCell removeGestureRecognizer:](self, "removeGestureRecognizer:", longTapRecognizer);
      v37 = self->_longTapRecognizer;
      self->_longTapRecognizer = 0;

    }
    -[PSTableCell setTag:](self, "setTag:", v20, v129);
    -[PSTableCell setType:](self, "setType:", v20);
    if ((v20 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
      -[PSTableCell setAlignment:](self, "setAlignment:", 2);
    if (v20 == 11)
    {
      objc_msgSend(MEMORY[0x1E0CEA5F8], "metricsForTextStyle:", *MEMORY[0x1E0CEB538]);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 18.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "scaledFontForFont:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      -[PSTableCell titleLabel](self, "titleLabel");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setFont:", v40);

      -[PSTableCell titleLabel](self, "titleLabel");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setTextColor:", v43);

      v132 = 0;
      v44 = 0;
    }
    else
    {
      v45 = v20 == 3;
      v46 = v20 >= 0xD;
      v47 = v20;
      v44 = v20 == 13;
      v132 = v45;
      if (!v44 && v46 || ((1 << v47) & 0x240E) == 0)
      {
        -[PSTableCell setSelectionStyle:](self, "setSelectionStyle:", 0);
        -[PSTableCell _updateAccessoryTypeForSpecifier:](self, "_updateAccessoryTypeForSpecifier:", v5);
        if (v47 != 13)
          goto LABEL_47;
        goto LABEL_41;
      }
    }
    objc_msgSend(v5, "propertyForKey:", CFSTR("adjustFontSizeToFitWidth"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "BOOLValue");

    -[PSTableCell titleLabel](self, "titleLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setAdjustsFontSizeToFitWidth:", v49);

    -[PSTableCell _updateAccessoryTypeForSpecifier:](self, "_updateAccessoryTypeForSpecifier:", v5);
    if (!v44)
      goto LABEL_47;
LABEL_41:
    if (!-[PSTableCell accessoryType](self, "accessoryType"))
    {
      v51 = v16;
      -[PSTableCell titleLabel](self, "titleLabel");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSListController appearance](PSListController, "appearance");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "buttonTextColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v3;
      if (!v3)
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "tableCellBlueTextColor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[PSTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setTextColor:", v55);

      if (!v3)
      v16 = v51;
    }
LABEL_47:
    +[PSListController appearance](PSListController, "appearance");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "foregroundColor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      +[PSListController appearance](PSListController, "appearance");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "foregroundColor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell setBackgroundColor:](self, "setBackgroundColor:", v59);

    }
    if (-[PSTableCell type](self, "type") == 13
      && (+[PSListController appearance](PSListController, "appearance"),
          v60 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v60, "buttonTextColor"),
          v61 = (void *)objc_claimAutoreleasedReturnValue(),
          v61,
          v60,
          v61))
    {
      -[PSTableCell textLabel](self, "textLabel");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSListController appearance](PSListController, "appearance");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "buttonTextColor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setTextColor:", v65);

      -[PSTableCell textLabel](self, "textLabel");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSListController appearance](PSListController, "appearance");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "buttonTextColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v3);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setHighlightedTextColor:", v68);
    }
    else
    {
      +[PSListController appearance](PSListController, "appearance");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "textColor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v70 || v135 == 11)
      {
LABEL_56:
        +[PSListController appearance](PSListController, "appearance");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "altTextColor");
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72)
        {
          -[PSTableCell detailTextLabel](self, "detailTextLabel");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          +[PSListController appearance](PSListController, "appearance");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "altTextColor");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v75);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setTextColor:", v3);

        }
        if (v135 == 10)
          -[PSTableCell setShouldHideTitle:](self, "setShouldHideTitle:", 1);
        if (v21)
          -[PSTableCell setTitle:](self, "setTitle:", v21);
        +[PSListController appearance](PSListController, "appearance");
        v76 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "cellHighlightColor");
        v77 = objc_claimAutoreleasedReturnValue();
        if (v77)
        {
          v78 = (void *)v77;
          -[PSTableCell selectedBackgroundView](self, "selectedBackgroundView");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "backgroundColor");
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          if (v3)
            goto LABEL_66;
          v76 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
          +[PSListController appearance](PSListController, "appearance");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "cellHighlightColor");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "setBackgroundColor:", v81);

          -[PSTableCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v76);
        }

LABEL_66:
        objc_msgSend(v5, "propertyForKey:", CFSTR("iconImage"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if (v82)
        {
          v83 = self;
          v84 = v82;
LABEL_68:
          -[PSTableCell setIcon:](v83, "setIcon:", v84);
          goto LABEL_69;
        }
        -[PSTableCell imageView](self, "imageView");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "image");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        if (v93)
        {
          lazyIcon = self->_lazyIcon;

          if (!lazyIcon)
          {
            v83 = self;
            v84 = 0;
            goto LABEL_68;
          }
        }
        else
        {

        }
        if (self->_lazyIcon)
        {
          -[PSTableCell imageView](self, "imageView");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "image");
          v96 = objc_claimAutoreleasedReturnValue();
          if (v96)
          {
            v97 = (void *)v96;
            -[PSTableCell imageView](self, "imageView");
            v98 = v16;
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "image");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            -[PSTableCell blankIcon](self, "blankIcon");
            v101 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = v98;
            if (v100 != v101)
              goto LABEL_69;
          }
          else
          {

          }
          if (self->_lazyIconForceSynchronous)
          {
            self->_lazyIconForceSynchronous = 0;
            -[PSTableCell getLazyIcon](self, "getLazyIcon");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            if (v123)
            {
              -[PSTableCell setIcon:](self, "setIcon:", v123);
              if (*((_BYTE *)&self->super.super.super.super.isa + v130))
              {
                -[PSTableCell specifier](self, "specifier");
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v124, "setProperty:forKey:", v123, CFSTR("iconImage"));

              }
            }

          }
          else
          {
            -[PSTableCell loadISIconFromSpecifier:](self, "loadISIconFromSpecifier:", v5);
          }
        }
LABEL_69:
        objc_msgSend(v5, "propertyForKey:", CFSTR("alignment"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v85;
        if (v85)
          -[PSTableCell setAlignment:](self, "setAlignment:", objc_msgSend(v85, "intValue"));
        objc_msgSend(v5, "propertyForKey:", CFSTR("useHighLegibilityAlternate"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v87, "BOOLValue");

        if (!v88)
          goto LABEL_94;
        v89 = objc_msgSend(v5, "cellType");
        if (v89 == 4
          && (objc_msgSend(v5, "name"), v3 = (void *)objc_claimAutoreleasedReturnValue(), !objc_msgSend(v3, "length")))
        {
          v90 = v16;
          -[PSTableCell titleLabel](self, "titleLabel");
          v91 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v90 = v16;
          -[PSTableCell valueLabel](self, "valueLabel");
          v91 = (id)objc_claimAutoreleasedReturnValue();

          if (v89 != 4)
            goto LABEL_91;
        }

LABEL_91:
        objc_msgSend(v91, "font");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        PSHighLegibilityAlternateFont(v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();

        if (v103)
          objc_msgSend(v91, "setFont:", v103);

        v16 = v90;
LABEL_94:
        if (!objc_msgSend(v5, "controllerLoadAction")
          && (CFPreferencesGetAppBooleanValue(CFSTR("kDontUseOldAction"), CFSTR("com.apple.Preferences"), 0)
           || !objc_msgSend(v5, "legacyAction"))
          && !*((_QWORD *)v5 + 3)
          && !*((_QWORD *)v5 + 8))
        {
          v104 = vdupq_n_s64(v135);
          if ((vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v104, (int64x2_t)xmmword_1A38ECD30), (int32x4_t)vceqq_s64(v104, (int64x2_t)xmmword_1A38ECD40)))) & 1) == 0&& !*((_QWORD *)v5 + 6)&& !v82)
          {
            -[PSTableCell setCellEnabled:](self, "setCellEnabled:", 0);
            _PSLoggingFacility();
            v105 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
            {
              WeakRetained = objc_loadWeakRetained((id *)&self->_specifier);
              *(_DWORD *)buf = 138412290;
              v141 = WeakRetained;
              _os_log_impl(&dword_1A3819000, v105, OS_LOG_TYPE_DEFAULT, "########### Reminder: By default an 'action' Specifier without a setter will be disabled by Settings.\n%@", buf, 0xCu);

            }
          }
        }
        objc_msgSend(v5, "values");
        v107 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v107)
          objc_msgSend(v5, "loadValuesAndTitlesFromDataSource");
        if (v135 > 0xD || ((1 << v135) & 0x200A) == 0)
        {
          if (*((_QWORD *)v5 + 2))
          {
            v118 = objc_loadWeakRetained((id *)v5 + 1);
            v119 = objc_opt_respondsToSelector();

            if ((v119 & 1) != 0)
            {
              v120 = objc_loadWeakRetained((id *)v5 + 1);
              SFPerformSelector();
              v121 = (void *)objc_claimAutoreleasedReturnValue();

              if (v121 && v135 != 9)
              {
                if (v135 == 4 || v135 == 2)
                {
                  objc_msgSend(v5, "shortTitleDictionary");
                  v122 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v5, "titleDictionary");
                  v122 = (void *)objc_claimAutoreleasedReturnValue();
                }
                v125 = v122;
                if (v122)
                {
                  objc_msgSend(v122, "objectForKey:", v121);
                  v126 = objc_claimAutoreleasedReturnValue();

                  v121 = (void *)v126;
                }

              }
              if (v121)
              {
                if (v135 == 4
                  && (objc_msgSend(v5, "name"),
                      v127 = (void *)objc_claimAutoreleasedReturnValue(),
                      v128 = objc_msgSend(v127, "length"),
                      v127,
                      !v128))
                {
                  -[PSTableCell setTitle:](self, "setTitle:", v121);
                }
                else
                {
                  -[PSTableCell setValue:](self, "setValue:", v121);
                }

              }
            }
          }
        }
        objc_msgSend(v5, "propertyForKey:", CFSTR("enabled"));
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = v108;
        if (v108)
          -[PSTableCell setCellEnabled:](self, "setCellEnabled:", objc_msgSend(v108, "BOOLValue"));
        if (*((_QWORD *)v5 + 3))
        {
          v110 = v132;
          if (*((_QWORD *)v5 + 2))
            v110 = 1;
          if ((v110 & 1) != 0)
            goto LABEL_116;
        }
        objc_msgSend(v5, "propertyForKey:", CFSTR("cellClass"));
        v111 = (void *)objc_claimAutoreleasedReturnValue();

        if (v111)
        {
LABEL_116:
          v112 = objc_loadWeakRetained((id *)v5 + 1);
          -[PSTableCell setValueChangedTarget:action:specifier:](self, "setValueChangedTarget:action:specifier:", v112, *((_QWORD *)v5 + 3), v5);

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("allowMultilineTitleKey"));
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = objc_msgSend(v113, "BOOLValue");

        if (v114)
        {
          -[PSTableCell textLabel](self, "textLabel");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "setNumberOfLines:", 0);

        }
        goto LABEL_120;
      }
      -[PSTableCell textLabel](self, "textLabel");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSListController appearance](PSListController, "appearance");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "textColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v3);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setTextColor:", v68);
    }

    goto LABEL_56;
  }
LABEL_120:
  if (-[PSTableCell modernLayoutEnabled](self, "modernLayoutEnabled"))
  {
    -[PSTableCell textLabel](self, "textLabel");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "setNumberOfLines:", 0);

    -[PSTableCell detailTextLabel](self, "detailTextLabel");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setNumberOfLines:", 0);

    -[PSTableCell setupModernLayoutConstraints](self, "setupModernLayoutConstraints");
  }

}

- (void)setIcon:(id)a3
{
  int v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3 == 0;
  v5 = a3;
  -[PSTableCell imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  -[PSTableCell imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v5);

  if (v4 != v8)
    -[PSTableCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)_updateAccessoryTypeForSpecifier:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PSTableCell *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v5 = v4[7];
    v13 = v4;
    objc_msgSend(v4, "propertyForKey:", CFSTR("accessory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = (int)objc_msgSend(v6, "intValue");
      v9 = self;
    }
    else
    {
      if ((unint64_t)(v5 - 1) > 1)
      {
        if (self->_checked)
          goto LABEL_5;
      }
      else
      {
        if (!self->_forceHideDisclosureIndicator)
        {
          objc_msgSend(v13, "propertyForKey:", CFSTR("hidesDisclosureIndicator"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "BOOLValue"))
          {

          }
          else
          {
            objc_msgSend(v13, "propertyForKey:", CFSTR("useEtched"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "BOOLValue");

            if ((v12 & 1) == 0)
            {
              v9 = self;
              v8 = 1;
              goto LABEL_4;
            }
          }
        }
        if (-[PSTableCell accessoryType](self, "accessoryType") != 1)
          goto LABEL_5;
      }
      v9 = self;
      v8 = 0;
    }
LABEL_4:
    -[PSTableCell setAccessoryType:](v9, "setAccessoryType:", v8);
LABEL_5:

    v4 = v13;
  }

}

- (void)setTitle:(id)a3
{
  _BOOL4 shouldHideTitle;
  id v5;
  void *v6;
  NSString *v7;
  NSString *hiddenTitle;
  id v9;

  shouldHideTitle = self->_shouldHideTitle;
  v5 = a3;
  v6 = v5;
  if (shouldHideTitle)
  {
    v7 = (NSString *)objc_msgSend(v5, "copy");

    hiddenTitle = self->_hiddenTitle;
    self->_hiddenTitle = v7;
  }
  else
  {
    -[PSTableCell textLabel](self, "textLabel");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v6);

    hiddenTitle = (NSString *)v9;
  }

}

- (void)setValueChangedTarget:(id)a3 action:(SEL)a4 specifier:(id)a5
{
  -[PSTableCell setCellTarget:](self, "setCellTarget:", a3, a4, a5);
  -[PSTableCell setCellAction:](self, "setCellAction:", a4);
}

- (void)setCellTarget:(id)a3
{
  objc_storeWeak(&self->_pTarget, a3);
}

- (void)setCellAction:(SEL)a3
{
  self->_pAction = a3;
}

- (CGSize)iconSizeForShape:(unint64_t)a3 scale:(double)a4
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  if (a3 == 4)
  {
    v4 = PSSizeForMessagesIcon();
  }
  else
  {
    PSBlankIconImage();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v8 = v7;
    v10 = v9;

    v4 = v8;
    v5 = v10;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (unint64_t)iconShape
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;

  objc_opt_class();
  -[PSTableCell lazyIconShapeOverride](self, "lazyIconShapeOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5)
    return 0;
  -[PSTableCell lazyIconShapeOverride](self, "lazyIconShapeOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

- (NSNumber)lazyIconShapeOverride
{
  return self->_lazyIconShapeOverride;
}

- (void)setCellEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  if (self->_cellEnabled != a3)
  {
    v3 = a3;
    self->_cellEnabled = a3;
    -[PSTableCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
    -[PSTableCell titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v3);

    -[PSTableCell detailTextLabel](self, "detailTextLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v3);

    -[PSTableCell imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v8 = 0.5;
    if (v3)
      v8 = 1.0;
    objc_msgSend(v7, "setAlpha:", v8);

  }
}

- (BOOL)canReload
{
  return -[PSTableCell isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
}

- (void)setValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v5 = a3;
  if (self->_value != v5)
  {
    v12 = v5;
    objc_storeStrong(&self->_value, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PSTableCell detailTextLabel](self, "detailTextLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = v12;
LABEL_7:
      objc_msgSend(v6, "setText:", v8);

      v5 = v12;
      goto LABEL_8;
    }
    v5 = v12;
    if (!self->_value)
    {
      -[PSTableCell detailTextLabel](self, "detailTextLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      v5 = v12;
      if (v11)
      {
        -[PSTableCell detailTextLabel](self, "detailTextLabel");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = 0;
        goto LABEL_7;
      }
    }
  }
LABEL_8:

}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  -[PSTableCell refreshCellContentsWithSpecifier:](self, "refreshCellContentsWithSpecifier:", a3, a4);
  -[PSTableCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)forceSynchronousIconLoadOnNextIconLoad
{
  self->_lazyIconForceSynchronous = 1;
}

- (id)value
{
  return self->_value;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSTableCell;
  -[PSTableCell setHighlighted:animated:](&v4, sel_setHighlighted_animated_, a3, a4);
}

- (void)setForceHideDisclosureIndicator:(BOOL)a3
{
  id WeakRetained;

  if (self->_forceHideDisclosureIndicator != a3)
  {
    self->_forceHideDisclosureIndicator = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_specifier);
    -[PSTableCell _updateAccessoryTypeForSpecifier:](self, "_updateAccessoryTypeForSpecifier:", WeakRetained);

  }
}

void __39__PSTableCell_loadISIconFromSpecifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "getLazyIcon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PSTableCell_loadISIconFromSpecifier___block_invoke_2;
    block[3] = &unk_1E4A66370;
    v3 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    v6 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __48__PSTableCell_refreshCellContentsWithSpecifier___block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("useModernAccessibilityIdentifiers"), CFSTR("com.apple.preferences-framework"), 0);
  __useModernAccessibilityIdentifiers = (_DWORD)result != 0;
  return result;
}

+ (double)defaultCellHeight
{
  return *MEMORY[0x1E0CEBC10];
}

- (void)dealloc
{
  objc_super v3;

  -[PSTableCell _invalidateHighlightContext](self, "_invalidateHighlightContext");
  v3.receiver = self;
  v3.super_class = (Class)PSTableCell;
  -[PSTableCell dealloc](&v3, sel_dealloc);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)longPressed:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  if (objc_msgSend(a3, "state") == 1)
  {
    -[PSTableCell becomeFirstResponder](self, "becomeFirstResponder");
    objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[PSTableCell frame](self, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[PSTableCell superview](self, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTargetRect:inView:", v12, v5, v7, v9, v11);

    objc_msgSend(v13, "setMenuVisible:animated:", 1, 1);
  }
}

- (id)_copyableText
{
  void *v3;
  void *v4;
  void *v5;

  -[PSTableCell detailTextLabel](self, "detailTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PSTableCell titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)copy:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PSTableCell _copyableText](self, "_copyableText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:", v4);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BOOL v4;
  void *v5;

  if (sel_copy_ != a3)
    return 0;
  -[PSTableCell _copyableText](self, "_copyableText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5 != 0;

  return v4;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id value;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  -[PSTableCell _invalidateHighlightContext](self, "_invalidateHighlightContext");
  -[PSTableCell detailTextLabel](self, "detailTextLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PSTableCell detailTextLabel](self, "detailTextLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", 0);

  }
  -[PSTableCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PSTableCell textLabel](self, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", 0);

  }
  -[PSTableCell setValueChangedTarget:action:specifier:](self, "setValueChangedTarget:action:specifier:", 0, 0, 0);
  -[PSTableCell setCellEnabled:](self, "setCellEnabled:", 1);
  -[PSTableCell imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PSTableCell setIcon:](self, "setIcon:", 0);
    -[PSTableCell imageView](self, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHighlightedImage:", 0);

  }
  value = self->_value;
  self->_value = 0;

  self->_alignment = 1;
  self->_forceHideDisclosureIndicator = 0;
  -[PSTableCell specifier](self, "specifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removePropertyForKey:", CFSTR("cellObject"));

  -[PSTableCell specifier](self, "specifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removePropertyForKey:", CFSTR("control"));

  -[PSTableCell cellRemovedFromView](self, "cellRemovedFromView");
  -[PSTableCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", 0);
  -[PSTableCell textLabel](self, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHighlightedTextColor:", 0);

  -[PSTableCell detailTextLabel](self, "detailTextLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHighlightedTextColor:", 0);

  v17.receiver = self;
  v17.super_class = (Class)PSTableCell;
  -[PSTableCell prepareForReuse](&v17, sel_prepareForReuse);
}

- (BOOL)shouldUseModernLayout
{
  return -[PSTableCell isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
}

- (void)setupModernLayoutConstraints
{
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;

  -[PSTableCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMarginsGuide");
  v114 = (id)objc_claimAutoreleasedReturnValue();

  -[PSTableCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell _separatorView:](self, "_separatorView:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    objc_msgSend(v7, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell textLabel](self, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

    objc_msgSend(v7, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell trailingAnchor](self, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v17);

    objc_msgSend(v7, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToConstant:", 0.5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v19);

  }
  -[PSTableCell selectedBackgroundView](self, "selectedBackgroundView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell subviews](self, "subviews");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "containsObject:", v20);

  if (v22)
  {
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v20, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell topAnchor](self, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v25);

    objc_msgSend(v20, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell leadingAnchor](self, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v28);

    objc_msgSend(v20, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell trailingAnchor](self, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v31);

    objc_msgSend(v20, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell bottomAnchor](self, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v34);

  }
  -[PSTableCell imageView](self, "imageView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PSTableCell imageView](self, "imageView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:constant:", v38, 8.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v39);

  -[PSTableCell imageView](self, "imageView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v43);

  -[PSTableCell imageView](self, "imageView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintLessThanOrEqualToAnchor:constant:", v46, -8.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v47);

  -[PSTableCell imageView](self, "imageView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerYAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v51);

  -[PSTableCell imageView](self, "imageView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v53) = 1148846080;
  objc_msgSend(v52, "setContentCompressionResistancePriority:forAxis:", 0, v53);

  -[PSTableCell imageView](self, "imageView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v55) = 1148846080;
  objc_msgSend(v54, "setContentCompressionResistancePriority:forAxis:", 1, v55);

  -[PSTableCell textLabel](self, "textLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PSTableCell textLabel](self, "textLabel");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintGreaterThanOrEqualToAnchor:constant:", v59, 13.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v60);

  -[PSTableCell imageView](self, "imageView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "image");
  v62 = objc_claimAutoreleasedReturnValue();
  if (!v62)
  {

    goto LABEL_9;
  }
  v63 = (void *)v62;
  -[PSTableCell imageView](self, "imageView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "isHidden");

  if ((v65 & 1) != 0)
  {
LABEL_9:
    -[PSTableCell textLabel](self, "textLabel");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v69);
    goto LABEL_10;
  }
  -[PSTableCell textLabel](self, "textLabel");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "leadingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell imageView](self, "imageView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "trailingAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:constant:", v69, 15.0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v70);

LABEL_10:
  v113 = v20;

  -[PSTableCell textLabel](self, "textLabel");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "bottomAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintLessThanOrEqualToAnchor:constant:", v73, -13.0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v74);

  -[PSTableCell textLabel](self, "textLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "centerYAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v78);

  -[PSTableCell detailTextLabel](self, "detailTextLabel");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PSTableCell detailTextLabel](self, "detailTextLabel");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "topAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintGreaterThanOrEqualToAnchor:constant:", v82, 13.0);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v83);

  -[PSTableCell detailTextLabel](self, "detailTextLabel");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "leadingAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell textLabel](self, "textLabel");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "trailingAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "constraintGreaterThanOrEqualToAnchor:constant:", v87, 6.0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v88);

  if (-[PSTableCell accessoryType](self, "accessoryType")
    || (-[PSTableCell accessoryView](self, "accessoryView", v20),
        v89 = (void *)objc_claimAutoreleasedReturnValue(),
        v89,
        v89))
  {
    v90 = v7;
    -[PSTableCell detailTextLabel](self, "detailTextLabel", v113);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "trailingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v4;
  }
  else
  {
    v90 = v7;
    -[PSTableCell detailTextLabel](self, "detailTextLabel");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "trailingAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v114;
  }
  objc_msgSend(v93, "trailingAnchor");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSTableCell detailTextLabel](self, "detailTextLabel");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "trailingAnchor");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "constraintLessThanOrEqualToAnchor:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v100) = 1132068864;
  objc_msgSend(v95, "setPriority:", v100);
  objc_msgSend(v5, "addObject:", v95);
  objc_msgSend(v5, "addObject:", v99);
  -[PSTableCell detailTextLabel](self, "detailTextLabel");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "bottomAnchor");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "constraintLessThanOrEqualToAnchor:constant:", v103, -13.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v104);

  -[PSTableCell detailTextLabel](self, "detailTextLabel");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "centerYAnchor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "constraintEqualToAnchor:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v108);

  v109 = (void *)MEMORY[0x1E0CB3718];
  -[PSTableCell constraints](self, "constraints");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "deactivateConstraints:", v110);

  -[PSTableCell setConstraints:](self, "setConstraints:", v5);
  v111 = (void *)MEMORY[0x1E0CB3718];
  -[PSTableCell constraints](self, "constraints");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "activateConstraints:", v112);

}

- (id)titleTextLabel
{
  void *v3;

  if (-[PSTableCell tag](self, "tag") == 10)
  {
    v3 = 0;
  }
  else
  {
    -[PSTableCell titleLabel](self, "titleLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_contentString
{
  void *v2;
  void *v3;

  -[PSTableCell textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_urlSession
{
  NSURLSession *urlSession;
  NSURLSession *v4;
  NSURLSession *v5;

  urlSession = self->_urlSession;
  if (!urlSession)
  {
    objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
    v4 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
    v5 = self->_urlSession;
    self->_urlSession = v4;

    urlSession = self->_urlSession;
  }
  return urlSession;
}

- (id)getLazyIcon
{
  void *v3;
  void *v4;
  id v5;
  NSURL *lazyIconURL;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  intptr_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  -[PSTableCell getIconFromIconServices](self, "getIconFromIconServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    lazyIconURL = self->_lazyIconURL;
    if (lazyIconURL)
    {
      objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:cachePolicy:timeoutInterval:", lazyIconURL, 2, 20.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = dispatch_semaphore_create(0);
      v20 = 0;
      v21 = &v20;
      v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__1;
      v24 = __Block_byref_object_dispose__1;
      v25 = 0;
      -[PSTableCell _urlSession](self, "_urlSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __26__PSTableCell_getLazyIcon__block_invoke;
      v17 = &unk_1E4A66398;
      v19 = &v20;
      v10 = v8;
      v18 = v10;
      objc_msgSend(v9, "dataTaskWithRequest:completionHandler:", v7, &v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "resume", v14, v15, v16, v17);
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
      v12 = (void *)v21[5];
      if (v12)
      {
        v5 = v12;

        _Block_object_dispose(&v20, 8);
        goto LABEL_8;
      }

      _Block_object_dispose(&v20, 8);
    }
    v5 = 0;
    goto LABEL_8;
  }
  v5 = v3;
LABEL_8:

  return v5;
}

intptr_t __26__PSTableCell_getLazyIcon__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a2 && !a4)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", a2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getIconFromIconServices
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;

  if (self->_lazyIconAppID
    || (-[PSTableCell lazyIconUTTypeIdentifier](self, "lazyIconUTTypeIdentifier"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[PSTableCell imageDescriptor](self, "imageDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shape");
    -[PSTableCell cachedTraitCollection](self, "cachedTraitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    v8 = v7;

    if (self->_lazyIconAppID)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", self->_lazyIconAppID);
      if (!v9)
      {
LABEL_14:
        v21 = 0;
LABEL_20:

        return v21;
      }
    }
    else
    {
      objc_opt_class();
      -[PSTableCell lazyIconUTTypeIdentifier](self, "lazyIconUTTypeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;

      if (!v12)
        goto LABEL_14;
      -[PSTableCell lazyIconUTTypeIdentifier](self, "lazyIconUTTypeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithType:", v13);

      if (!v9)
        goto LABEL_14;
    }
    objc_msgSend(v9, "prepareImageForDescriptor:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = v14;
      v16 = (void *)MEMORY[0x1E0CEA638];
      v17 = objc_msgSend(v14, "CGImage");
      objc_msgSend(v15, "scale");
      objc_msgSend(v16, "imageWithCGImage:scale:orientation:", v17, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v5 == 4)
      {
        -[PSTableCell iconSizeForShape:scale:](self, "iconSizeForShape:scale:", 4, v8);
        objc_msgSend(v19, "imageByPreparingThumbnailOfSize:");
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = v18;
      }
      v21 = v20;

    }
    else
    {
      v21 = 0;
    }

    goto LABEL_20;
  }
  v21 = 0;
  return v21;
}

- (id)blankIcon
{
  if (-[PSTableCell iconShape](self, "iconShape") == 4)
    PSBlankMessageAppIconImage();
  else
    PSBlankIconImage();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)cellRemovedFromView
{
  -[PSTableCell setSpecifier:](self, "setSpecifier:", 0);
  if (self->_lazyIcon && !self->_lazyIconDontUnload)
    -[PSTableCell setIcon:](self, "setIcon:", 0);
}

- (id)getIcon
{
  return 0;
}

- (id)title
{
  NSString *v2;
  void *v3;

  if (self->_shouldHideTitle)
  {
    v2 = self->_hiddenTitle;
  }
  else
  {
    -[PSTableCell textLabel](self, "textLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "text");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)setShouldHideTitle:(BOOL)a3
{
  self->_shouldHideTitle = a3;
}

- (void)setChecked:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *checkedImageView;
  void *v11;
  UIImageView *v12;
  PSTableCell *v13;
  uint64_t v14;

  if (self->_checked != a3)
  {
    v3 = a3;
    self->_checked = a3;
    v5 = -[PSTableCell accessoryType](self, "accessoryType");
    if (v3)
    {
      if (v5 == 1 || -[PSTableCell accessoryType](self, "accessoryType") == 2)
      {
        v6 = objc_alloc(MEMORY[0x1E0CEA658]);
        -[PSTableCell _checkmarkImage:](self, "_checkmarkImage:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSTableCell _checkmarkImage:](self, "_checkmarkImage:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (UIImageView *)objc_msgSend(v6, "initWithImage:highlightedImage:", v7, v8);
        checkedImageView = self->_checkedImageView;
        self->_checkedImageView = v9;

        -[PSTableCell contentView](self, "contentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSubview:", self->_checkedImageView);

        -[PSTableCell setNeedsLayout](self, "setNeedsLayout");
        return;
      }
      v13 = self;
      v14 = 3;
    }
    else
    {
      if (v5 == 1 || -[PSTableCell accessoryType](self, "accessoryType") == 2)
      {
        -[UIImageView removeFromSuperview](self->_checkedImageView, "removeFromSuperview");
        v12 = self->_checkedImageView;
        self->_checkedImageView = 0;

        return;
      }
      v13 = self;
      v14 = 0;
    }
    -[PSTableCell setAccessoryType:](v13, "setAccessoryType:", v14);
  }
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (BOOL)canBeChecked
{
  return self->_type == 3;
}

- (void)setAlignment:(int)a3
{
  if (self->_alignment != a3)
  {
    self->_alignment = a3;
    -[PSTableCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTarget:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB3978];
  v6 = a3;
  objc_msgSend(v4, "callStackSymbols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("########### IMPORTANT!!! setTarget: is Deprecated. Please move to setCellTarget: immediately! %@"), v5);

  -[PSTableCell setCellTarget:](self, "setCellTarget:", v6);
}

- (id)target
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("########### IMPORTANT!!! target is Deprecated. Please move to cellTarget immediately! %@"), v3);

  return -[PSTableCell cellTarget](self, "cellTarget");
}

- (void)setAction:(SEL)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("########### IMPORTANT!!! setAction: is Deprecated. Please move to setCellAction: immediately! %@"), v5);

  -[PSTableCell setCellAction:](self, "setCellAction:", a3);
}

- (SEL)action
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("########### IMPORTANT!!! action is Deprecated. Please move to cellAction immediately! %@"), v3);

  return -[PSTableCell cellAction](self, "cellAction");
}

- (id)cellTarget
{
  return objc_loadWeakRetained(&self->_pTarget);
}

- (SEL)cellAction
{
  return self->_pAction;
}

- (BOOL)cellEnabled
{
  return self->_cellEnabled;
}

- (double)textFieldOffset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  -[PSTableCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = 115.0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PSTableCell;
    -[PSTableCell textFieldOffset](&v8, sel_textFieldOffset);
    v5 = v6;
  }

  return v5;
}

- (void)highlightCellForDuration:(double)a3 animateUnighlight:(BOOL)a4
{
  _BOOL8 v4;
  PSTableCellHighlightContext *v7;
  PSTableCellHighlightContext *customHighlightContext;

  v4 = a4;
  -[PSTableCell _invalidateHighlightContext](self, "_invalidateHighlightContext");
  +[PSTableCellHighlightContext contextWithCell:](PSTableCellHighlightContext, "contextWithCell:", self);
  v7 = (PSTableCellHighlightContext *)objc_claimAutoreleasedReturnValue();
  customHighlightContext = self->_customHighlightContext;
  self->_customHighlightContext = v7;

  -[PSTableCellHighlightContext performHighlightForDuration:animateUnhighlight:](self->_customHighlightContext, "performHighlightForDuration:animateUnhighlight:", v4, a3);
}

- (void)_invalidateHighlightContext
{
  PSTableCellHighlightContext *customHighlightContext;

  -[PSTableCellHighlightContext invalidate](self->_customHighlightContext, "invalidate");
  customHighlightContext = self->_customHighlightContext;
  self->_customHighlightContext = 0;

}

- (id)_checkmarkImage:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  objc_super v12;

  v3 = a3;
  +[PSListController appearance](PSListController, "appearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)PSTableCell;
    -[PSTableCell _checkmarkImage:](&v12, sel__checkmarkImage_, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithTintColor:renderingMode:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PSTableCell;
    -[PSTableCell _checkmarkImage:](&v11, sel__checkmarkImage_, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_disclosureChevronImage:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  objc_super v13;

  v3 = a3;
  +[PSListController appearance](PSListController, "appearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellAccessoryColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)PSTableCell;
    -[PSTableCell _disclosureChevronImage:](&v13, sel__disclosureChevronImage_, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_flatImageWithColor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageFlippedForRightToLeftLayoutDirection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PSTableCell;
    -[PSTableCell _disclosureChevronImage:](&v12, sel__disclosureChevronImage_, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageFlippedForRightToLeftLayoutDirection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)reusedCell
{
  return self->_reusedCell;
}

- (BOOL)forceHideDisclosureIndicator
{
  return self->_forceHideDisclosureIndicator;
}

- (BOOL)isCopyable
{
  return self->_isCopyable;
}

- (void)setIsCopyable:(BOOL)a3
{
  self->_isCopyable = a3;
}

- (UILongPressGestureRecognizer)longTapRecognizer
{
  return self->_longTapRecognizer;
}

- (void)setLongTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longTapRecognizer, a3);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyIconShapeOverride, 0);
  objc_storeStrong((id *)&self->_lazyIconUTTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedTraitCollection, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_longTapRecognizer, 0);
  objc_storeStrong((id *)&self->_lazyIconURL, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_customHighlightContext, 0);
  objc_storeStrong((id *)&self->_lazyIconAppID, 0);
  objc_destroyWeak((id *)&self->_specifier);
  objc_destroyWeak(&self->_pTarget);
  objc_storeStrong((id *)&self->_hiddenTitle, 0);
  objc_storeStrong((id *)&self->_checkedImageView, 0);
  objc_storeStrong(&self->_value, 0);
}

- (NSURL)lazyIconURL
{
  return self->_lazyIconURL;
}

- (void)setLazyIconURL:(id)a3
{
  objc_storeStrong((id *)&self->_lazyIconURL, a3);
}

- (id)_automationID
{
  void *v3;
  unint64_t v4;
  id v5;
  void *v6;

  -[PSTableCell title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PSTableCell description](self, "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = -[PSTableCell tag](self, "tag");
  if (v4 <= 0xD && ((1 << v4) & 0x2C06) != 0)
  {
    objc_msgSend(CFSTR("BTN "), "stringByAppendingString:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v6 = v5;

  return v6;
}

- (id)scriptingInfoWithChildren
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;
  objc_super v32;
  __int128 v33;
  __int128 v34;

  -[PSTableCell title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PSTableCell description](self, "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = 0u;
  v34 = 0u;
  switch(-[PSTableCell tag](self, "tag"))
  {
    case 2:
    case 4:
    case 8:
      -[PSTableCell superview](self, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSTableCell frame](self, "frame");
      objc_msgSend(v4, "convertRect:toView:", 0);
      *(_QWORD *)&v33 = v5;
      *((_QWORD *)&v33 + 1) = v6;
      *(_QWORD *)&v34 = v7;
      *((_QWORD *)&v34 + 1) = v8;

      objc_msgSend(CFSTR("DAT "), "stringByAppendingString:", v3);
      v9 = objc_claimAutoreleasedReturnValue();

      -[PSTableCell valueLabel](self, "valueLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "text");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5:
      -[PSTableCell control](self, "control");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      -[PSTableCell convertRect:toView:](self, "convertRect:toView:", 0);
      *(_QWORD *)&v33 = v13;
      *((_QWORD *)&v33 + 1) = v14;
      *(_QWORD *)&v34 = v15;
      *((_QWORD *)&v34 + 1) = v16;
      objc_msgSend(CFSTR("SLD "), "stringByAppendingString:", v3);
      v9 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "value");
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%f"), v18);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6:
      -[PSTableCell control](self, "control");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      -[PSTableCell convertRect:toView:](self, "convertRect:toView:", 0);
      *(_QWORD *)&v33 = v19;
      *((_QWORD *)&v33 + 1) = v20;
      *(_QWORD *)&v34 = v21;
      *((_QWORD *)&v34 + 1) = v22;
      objc_msgSend(CFSTR("BTN "), "stringByAppendingString:", v3);
      v9 = objc_claimAutoreleasedReturnValue();

      v23 = objc_msgSend(v10, "isOn");
      v24 = CFSTR("OFF");
      if (v23)
        v24 = CFSTR("ON");
      v11 = v24;
LABEL_10:
      v25 = v11;
      v3 = (void *)v9;

      v26 = (void *)MEMORY[0x1E0C99DE8];
      v31.receiver = self;
      v31.super_class = (Class)PSTableCell;
      -[PSTableCell scriptingInfoWithChildren](&v31, sel_scriptingInfoWithChildren);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "arrayWithArray:", v27);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v33, 32);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKey:", v29, CFSTR("CGRect"));

      objc_msgSend(v28, "setObject:forKey:", v3, CFSTR("ID"));
      if (v25)
        objc_msgSend(v28, "setObject:forKey:", v25, CFSTR("Value"));
      objc_msgSend(v12, "addObject:", v28);

      break;
    default:
      v32.receiver = self;
      v32.super_class = (Class)PSTableCell;
      -[PSTableCell scriptingInfoWithChildren](&v32, sel_scriptingInfoWithChildren);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }

  return v12;
}

@end
