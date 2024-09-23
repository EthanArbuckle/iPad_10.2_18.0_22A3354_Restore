@implementation _MCDReusableCell

- (_MCDReusableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _MCDReusableCell *v4;
  _MCDReusableCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MCDReusableCell;
  v4 = -[_MCDReusableCell initWithStyle:reuseIdentifier:](&v8, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[_MCDReusableCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("CPListItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDReusableCell textLabel](v5, "textLabel"));
    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("CPListItemTitle"));

  }
  return v5;
}

+ (id)cellForTableView:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend((id)objc_opt_class(a1), "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6));

  return v10;
}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (CGSize)sizeForArtwork
{
  double v2;
  double v3;
  CGSize result;

  v2 = 36.0;
  v3 = 36.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIImageView)artworkImageView
{
  return (UIImageView *)-[_MCDReusableCell viewWithTag:](self, "viewWithTag:", 1000);
}

- (void)setPlaceholderTintColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_placeholderTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeholderTintColor, a3);
    -[_MCDReusableCell _updateArtworkImageViewTintColor](self, "_updateArtworkImageViewTintColor");
    v5 = v6;
  }

}

- (void)setPlaceholderHighlightedTintColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_placeholderHighlightedTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeholderHighlightedTintColor, a3);
    -[_MCDReusableCell _updateArtworkImageViewTintColor](self, "_updateArtworkImageViewTintColor");
    v5 = v6;
  }

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MCDReusableCell;
  -[_MCDReusableCell setHighlighted:animated:](&v5, "setHighlighted:animated:", a3, a4);
  -[_MCDReusableCell _updateArtworkImageViewTintColor](self, "_updateArtworkImageViewTintColor");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MCDReusableCell;
  -[_MCDReusableCell setSelected:animated:](&v5, "setSelected:animated:", a3, a4);
  -[_MCDReusableCell _updateArtworkImageViewTintColor](self, "_updateArtworkImageViewTintColor");
}

- (void)_updateArtworkImageViewTintColor
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[_MCDReusableCell artworkImageView](self, "artworkImageView"));
  if ((-[_MCDReusableCell isHighlighted](self, "isHighlighted") & 1) != 0
    || (-[_MCDReusableCell isSelected](self, "isSelected") & 1) != 0)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[_MCDReusableCell placeholderHighlightedTintColor](self, "placeholderHighlightedTintColor"));
  }
  else
  {
    v3 = objc_claimAutoreleasedReturnValue(-[_MCDReusableCell placeholderTintColor](self, "placeholderTintColor"));
  }
  v4 = (void *)v3;
  objc_msgSend(v5, "setTintColor:", v3);

}

- (void)setArtworkRadiusKind:(unint64_t)a3
{
  if (self->_artworkRadiusKind != a3)
  {
    self->_artworkRadiusKind = a3;
    -[_MCDReusableCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)horizontalMargin
{
  return 8.0;
}

- (void)layoutBadges:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  id v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  CGFloat v74;
  CGFloat v75;
  double MaxX;
  id v77;
  id v78;
  id v79;
  double v80;
  uint64_t v81;
  void *j;
  void *v83;
  double v84;
  CGFloat v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double MidY;
  double v91;
  void *v92;
  id v93;
  double v94;
  double v95;
  double v96;
  double v97;
  uint64_t v98;
  double v99;
  _QWORD rect[5];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _BYTE v108[128];
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;

  v4 = a3;
  -[_MCDReusableCell horizontalMargin](self, "horizontalMargin");
  v6 = v5;
  if (objc_msgSend(v4, "count"))
    v6 = v6 + (double)(unint64_t)(2 * (_QWORD)objc_msgSend(v4, "count") + 2);
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v104;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v104 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "setHidden:", 0);
        objc_msgSend(v12, "bounds");
        v6 = v6 + v13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v103, v108, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDReusableCell textLabel](self, "textLabel"));
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDReusableCell contentView](self, "contentView"));
  v24 = objc_msgSend(v23, "bounds");
  v29 = MPURectByRemovingUserInterfaceLayoutDirectionInRect(v24, v16, v18, v20, v22, v25, v26, v27, v28);
  v31 = v30;
  v98 = v32;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDReusableCell contentView](self, "contentView"));
  objc_msgSend(v33, "frame");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDReusableCell contentView](self, "contentView"));
  v43 = objc_msgSend(v42, "bounds");
  v48 = MPURectByRemovingUserInterfaceLayoutDirectionInRect(v43, v35, v37, v39, v41, v44, v45, v46, v47);
  v50 = v49;
  v52 = v51;
  v54 = v53;

  v109.origin.x = v48;
  v109.origin.y = v50;
  v109.size.width = v52;
  v109.size.height = v54;
  v55 = CGRectGetMaxX(v109) - v29;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDReusableCell textLabel](self, "textLabel"));
  objc_msgSend(v56, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v58 = v57;

  if (v6 + v58 >= v55)
    v59 = v55 - v6;
  else
    v59 = v58;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDReusableCell contentView](self, "contentView", v6 + v58, v98));
  v61 = objc_msgSend(v60, "bounds");
  v66 = MPURectByApplyingUserInterfaceLayoutDirectionInRect(v61, v29, v31, v59, v99, v62, v63, v64, v65);
  v68 = v67;
  v70 = v69;
  v72 = v71;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDReusableCell textLabel](self, "textLabel"));
  objc_msgSend(v73, "setFrame:", v66, v68, v70, v72);

  *(double *)rect = v29;
  v110.origin.x = v29;
  v74 = v31;
  v110.origin.y = v31;
  v75 = v59;
  v110.size.width = v59;
  v110.size.height = v99;
  MaxX = CGRectGetMaxX(v110);
  memset(&rect[1], 0, 32);
  v101 = 0u;
  v102 = 0u;
  v77 = v7;
  v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &rect[1], v107, 16);
  if (v78)
  {
    v79 = v78;
    v80 = MaxX + 4.0;
    v81 = *(_QWORD *)rect[3];
    do
    {
      for (j = 0; j != v79; j = (char *)j + 1)
      {
        if (*(_QWORD *)rect[3] != v81)
          objc_enumerationMutation(v77);
        v83 = *(void **)(rect[2] + 8 * (_QWORD)j);
        objc_msgSend(v83, "frame");
        v85 = v84;
        v87 = v86;
        v89 = v88;
        *(_QWORD *)&v111.origin.x = rect[0];
        v111.origin.y = v74;
        v111.size.width = v75;
        v111.size.height = v99;
        MidY = CGRectGetMidY(v111);
        v112.origin.x = v80;
        v112.origin.y = v85;
        v112.size.width = v87;
        v112.size.height = v89;
        v91 = MidY + CGRectGetHeight(v112) * -0.5;
        v92 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDReusableCell contentView](self, "contentView"));
        v93 = objc_msgSend(v92, "bounds");
        objc_msgSend(v83, "setFrame:", MPURectByApplyingUserInterfaceLayoutDirectionInRect(v93, v80, v91, v87, v89, v94, v95, v96, v97));

        v113.origin.x = v80;
        v113.origin.y = v91;
        v113.size.width = v87;
        v113.size.height = v89;
        v80 = CGRectGetMaxX(v113) + 2.0;
      }
      v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &rect[1], v107, 16);
    }
    while (v79);
  }

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 44.0;
  result.height = v3;
  return result;
}

- (UIColor)placeholderTintColor
{
  return self->_placeholderTintColor;
}

- (UIColor)placeholderHighlightedTintColor
{
  return self->_placeholderHighlightedTintColor;
}

- (unint64_t)artworkRadiusKind
{
  return self->_artworkRadiusKind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderHighlightedTintColor, 0);
  objc_storeStrong((id *)&self->_placeholderTintColor, 0);
}

@end
