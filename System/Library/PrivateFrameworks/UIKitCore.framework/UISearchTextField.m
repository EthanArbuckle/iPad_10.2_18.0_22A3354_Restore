@implementation UISearchTextField

- (double)_defaultHeightForBarMetrics:(int64_t)a3
{
  double result;

  -[_UISearchTextFieldVisualStyle defaultHeightForBarMetrics:](self->_visualStyle, "defaultHeightForBarMetrics:", a3);
  return result;
}

- (BOOL)_hasContent
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISearchTextField;
  if (-[UITextField _hasContent](&v6, sel__hasContent))
    return 1;
  -[_UISearchBarTextFieldTokenCounter tokenCharacterIndexes](self->_tokenCounter, "tokenCharacterIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (double)_clearButtonMarginX
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  float v9;
  double v10;
  double v12;
  objc_super v13;

  -[_UISearchTextFieldVisualStyle clearButtonInnerInset](self->_visualStyle, "clearButtonInnerInset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[_UISearchTextFieldVisualStyle clearButtonOuterInset](self->_visualStyle, "clearButtonOuterInset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v13.receiver = self;
      v13.super_class = (Class)UISearchTextField;
      -[UITextField _clearButtonMarginX](&v13, sel__clearButtonMarginX);
      return v12;
    }
  }
  -[_UISearchTextFieldVisualStyle clearButtonInnerInset](self->_visualStyle, "clearButtonInnerInset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6 + 0.0;

  -[_UISearchTextFieldVisualStyle clearButtonOuterInset](self->_visualStyle, "clearButtonOuterInset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v10 = v7 + v9;

  return v10;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0)
    -[UISearchTextField _searchIconViewRectForBounds:](self, "_searchIconViewRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  else
    -[UISearchTextField _bookmarkViewRectForBounds:](self, "_bookmarkViewRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_bookmarkViewRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  char **v12;
  objc_super *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id WeakRetained;
  void *v23;
  int v24;
  double v25;
  double v26;
  uint64_t v27;
  int v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  int v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  UISearchTextField *v40;
  objc_super v41;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UISearchTextFieldVisualStyle rightViewInset](self->_visualStyle, "rightViewInset");
  v9 = v8;
  -[_UISearchTextFieldVisualStyle rightViewInset](self->_visualStyle, "rightViewInset");
  v11 = v10;
  if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0)
  {
    v41.receiver = self;
    v12 = &selRef_leftViewRectForBounds_;
    v13 = &v41;
  }
  else
  {
    v40 = self;
    v12 = &selRef_rightViewRectForBounds_;
    v13 = (objc_super *)&v40;
  }
  v13->super_class = (Class)UISearchTextField;
  objc_msgSendSuper2(v13, *v12, x, y, width, height, v40);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20 + 0.0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v23 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "showsSearchResultsButton"))
  {
    v24 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
    -[_UISearchTextFieldVisualStyle searchResultsListButtonOffset](self->_visualStyle, "searchResultsListButtonOffset");
    if ((*(_QWORD *)&v24 & 0x80000) != 0)
      v26 = -v25;
    else
      v26 = v25;
    v21 = v21 + 0.5;
    v27 = 3;
  }
  else
  {
    v28 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
    -[_UISearchTextFieldVisualStyle searchBookmarkButtonOffset](self->_visualStyle, "searchBookmarkButtonOffset");
    if ((*(_QWORD *)&v28 & 0x80000) != 0)
      v26 = -v29;
    else
      v26 = v29;
    v27 = 2;
  }
  -[UISearchTextField _offsetValueForIcon:](self, "_offsetValueForIcon:", v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  v32 = v9 + v15 - v26;
  if (v30)
  {
    v33 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
    objc_msgSend(v30, "UIOffsetValue");
    if ((*(_QWORD *)&v33 & 0x80000) != 0)
      v34 = -v34;
    v32 = v32 + v34;
    v21 = v21 + v35;
  }

  v36 = v32;
  v37 = v21;
  v38 = v17 - (v9 - v11);
  v39 = v19;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (id)text
{
  void *v3;
  void *v4;

  -[UISearchTextField textualRange](self, "textualRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchTextField textInRange:](self, "textInRange:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)textInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[UISearchTextField textualRange](self, "textualRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIResponder _intersectionOfRange:andRange:](self, "_intersectionOfRange:andRange:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v12.receiver = self;
    v12.super_class = (Class)UISearchTextField;
    -[UITextField textInRange:](&v12, sel_textInRange_, v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Something is calling -textInRange: with a nil range. This argument is nonnull. Returning a default value.", buf, 2u);
      }

    }
    else
    {
      v9 = textInRange____s_category;
      if (!textInRange____s_category)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&textInRange____s_category);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Something is calling -textInRange: with a nil range. This argument is nonnull. Returning a default value.", buf, 2u);
      }
    }
    v7 = &stru_1E16EDF20;
  }

  return v7;
}

- (UITextRange)textualRange
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[_UISearchBarTextFieldTokenCounter characterRangeOfTextAfterLastToken](self->_tokenCounter, "characterRangeOfTextAfterLastToken");
  return (UITextRange *)-[UIResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:", v3, v4);
}

+ (BOOL)_wantsFadedEdges
{
  return 1;
}

+ (Class)_fieldEditorClass
{
  return (Class)objc_opt_class();
}

- (id)textInputTraits
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "textInputTraits");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UISearchTextField;
    -[UITextField textInputTraits](&v8, sel_textInputTraits);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)_updateLeftViewForMagnifyingGlassImage
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  UIImage *v6;

  v6 = self->_magnifyingGlassImage;
  if (-[UISearchTextField _supportsDynamicType](self, "_supportsDynamicType"))
  {
    if (-[UISearchTextField _alwaysHidesMagnifyingGlassForAccessibilityContentSizeCategory](self, "_alwaysHidesMagnifyingGlassForAccessibilityContentSizeCategory"))
    {
      -[UIView traitCollection](self, "traitCollection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "preferredContentSizeCategory");
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

      if (IsAccessibilityCategory)
      {

        v6 = 0;
      }
    }
  }
  -[UIImageView setImage:](self->_defaultLeftView, "setImage:", v6);
  -[UIView sizeToFit](self->_defaultLeftView, "sizeToFit");

}

- (BOOL)_alwaysHidesMagnifyingGlassForAccessibilityContentSizeCategory
{
  return (*((unsigned __int8 *)&self->_searchBarTextFieldFlags + 12) >> 2) & 1;
}

- (void)_updateDefaultLeftViewForFont:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = -[UISearchTextField _scalesMagnifyingGlassForDynamicTypeWithFont:](self, "_scalesMagnifyingGlassForDynamicTypeWithFont:");
  if (v4)
  {
    -[UIView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v6))
    {
      if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v6, CFSTR("UICTContentSizeCategoryAccessibilityXL")) != NSOrderedAscending)
      {
        v7 = 1;
LABEL_8:

        +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v9, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v6, CFSTR("UICTContentSizeCategoryAccessibilityM"));
    }
    v7 = 2;
    goto LABEL_8;
  }
  +[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  -[UIImageView setPreferredSymbolConfiguration:](self->_defaultLeftView, "setPreferredSymbolConfiguration:", v8);
  -[UIView setShowsLargeContentViewer:](self->_defaultLeftView, "setShowsLargeContentViewer:", !v4);

}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  float v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  float v40;
  double v41;
  float v42;
  float v43;
  double v44;
  float v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  objc_super v51;
  objc_super v52;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[UISearchTextField _shouldCenterPlaceholder](self, "_shouldCenterPlaceholder"))
  {
    -[UITextField _availableTextRectExcludingButtonsForBounds:](self, "_availableTextRectExcludingButtonsForBounds:", x, y, width, height);
    v9 = v8;
    v50 = v10;
    v12 = v11;
    v14 = v13;
    v52.receiver = self;
    v52.super_class = (Class)UISearchTextField;
    v15 = 0.0;
    if (-[UITextField _showsLeftView](&v52, sel__showsLeftView))
    {
      -[UISearchTextField _adjustmentsForSearchIconViewRectForBounds:](self, "_adjustmentsForSearchIconViewRectForBounds:", x, y, width, height);
      v17 = v16 * 0.5;
      -[_UISearchTextFieldVisualStyle leftViewToPlaceholderCenteredMargin](self->_visualStyle, "leftViewToPlaceholderCenteredMargin");
      v15 = v17 + v18 * 0.5;
    }
    -[UITextField _placeholderLabel](self, "_placeholderLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v12 - (v15 + v15);
    objc_msgSend(v19, "sizeThatFits:", v20, v14);
    if (v21 <= v20)
      v20 = v21;

    -[UITextField paddingLeft](self, "paddingLeft");
    v23 = v15 + v12 * 0.5 - v20 * 0.5 - v22;
    v24 = v23 - v9;
    v25 = v9 + v23;
    v26 = v12 - v24;
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    v28 = UIRectIntegralWithScale(v25, v50, v26, v14, v27);
    v30 = v29;
    v32 = v31;
  }
  else
  {
    v51.receiver = self;
    v51.super_class = (Class)UISearchTextField;
    -[UITextField placeholderRectForBounds:](&v51, sel_placeholderRectForBounds_, x, y, width, height);
    v28 = v33;
    v30 = v34;
    v36 = v35;
    v32 = v37;
    -[UITextField _placeholderLabel](self, "_placeholderLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sizeThatFits:", v36, v32);
    if (v39 <= v36)
      v20 = v39;
    else
      v20 = v36;

    if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0)
    {
      -[UITextField paddingLeft](self, "paddingLeft");
      v41 = v36 - v20 - v40;
      -[UITextField paddingRight](self, "paddingRight");
      v28 = v28 + v41 - v42;
    }
  }
  -[UITextField paddingLeft](self, "paddingLeft");
  v44 = v20 + v43;
  -[UITextField paddingRight](self, "paddingRight");
  v46 = v44 + v45;
  v47 = v28;
  v48 = v30;
  v49 = v32;
  result.size.height = v49;
  result.size.width = v46;
  result.origin.y = v48;
  result.origin.x = v47;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  -[UITextField editingRectForBounds:](&v8, sel_editingRectForBounds_);
  -[UISearchTextField _adjustedTextOrEditingRect:forBounds:](self, "_adjustedTextOrEditingRect:forBounds:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  -[UITextField textRectForBounds:](&v8, sel_textRectForBounds_);
  -[UISearchTextField _adjustedTextOrEditingRect:forBounds:](self, "_adjustedTextOrEditingRect:forBounds:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_availableTextRectForBounds:(CGRect)a3 forEditing:(BOOL)a4
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  v21.receiver = self;
  v21.super_class = (Class)UISearchTextField;
  -[UITextField _availableTextRectForBounds:forEditing:](&v21, sel__availableTextRectForBounds_forEditing_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (-[UITextField _hasSuffixField](self, "_hasSuffixField"))
  {
    -[_UISearchTextFieldVisualStyle searchTextResultsPadding](self->_visualStyle, "searchTextResultsPadding");
    v14 = v13;
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    v16 = v14 / v15 + -2.0;
    v10 = v10 - v16;
    if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) == 0)
      v16 = -0.0;
    v6 = v6 + v16;
  }
  v17 = v6;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)_adjustedTextOrEditingRect:(CGRect)a3 forBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double MinX;
  double v21;
  double v22;
  double v23;
  float v24;
  double v25;
  double v26;
  double v27;
  UIImageView *v28;
  UIImageView *defaultLeftView;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double MaxX;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  float v43;
  int v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  int v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  NSValue *searchTextOffsetValue;
  int v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t rect;
  double v67;
  double v68;
  double v69;
  double v70;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  if (UISearchBarUsesModernAppearance())
  {
    v68 = height;
    v69 = v8;
    v67 = y;
    -[UISearchTextField _searchIconViewRectForBounds:](self, "_searchIconViewRectForBounds:", x, y, width, height);
    v17 = v13;
    v18 = v14;
    v19 = v15;
    rect = v16;
    if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0)
      MinX = CGRectGetMinX(*(CGRect *)&v13);
    else
      MinX = CGRectGetMaxX(*(CGRect *)&v13);
    v70 = MinX;
    if (-[UISearchTextField _shouldHideMagnifyingGlassWhenEditingOrHasContent](self, "_shouldHideMagnifyingGlassWhenEditingOrHasContent"))
    {
      if (-[UISearchTextField _isEditingOrHasContent](self, "_isEditingOrHasContent"))
      {
        -[UITextField leftView](self, "leftView");
        v28 = (UIImageView *)objc_claimAutoreleasedReturnValue();
        defaultLeftView = self->_defaultLeftView;

        if (v28 == defaultLeftView)
        {
          v30 = rect;
          v31 = v17;
          v32 = v18;
          v33 = v19;
          if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0)
            MaxX = CGRectGetMaxX(*(CGRect *)&v31);
          else
            MaxX = CGRectGetMinX(*(CGRect *)&v31);
          v70 = MaxX;
        }
      }
    }
    v35 = x;
    v21 = v67;
    height = v68;
    v36 = v67;
    v37 = width;
    v38 = v68;
    if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0)
      v39 = CGRectGetMaxX(*(CGRect *)&v35);
    else
      v39 = CGRectGetMinX(*(CGRect *)&v35);
    v8 = v69;
    v40 = v70 - v39;
    if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0)
      v40 = -v40;
    if (v40 > 0.0)
    {
      -[_UISearchTextFieldVisualStyle textLeadingInset](self->_visualStyle, "textLeadingInset");
      v42 = v41;
      if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0)
        -[UITextField paddingRight](self, "paddingRight");
      else
        -[UITextField paddingLeft](self, "paddingLeft");
      v44 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
      v45 = v42 - v43;
      if ((v44 & 0x80000) != 0)
        v45 = -v45;
      v46 = v70 + v45;
      v47 = v11;
      v48 = v10;
      v49 = v9;
      v50 = v69;
      if ((v44 & 0x80000) != 0)
        v51 = CGRectGetMaxX(*(CGRect *)&v47);
      else
        v51 = CGRectGetMinX(*(CGRect *)&v47);
      v52 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
      v53 = v46 - v51;
      if ((v52 & 0x80000) != 0)
        v53 = -v53;
      v9 = v9 - v53;
      if ((*(_QWORD *)&v52 & 0x80000) == 0)
        v11 = v46;
    }
  }
  else
  {
    v21 = y;
    -[_UISearchTextFieldVisualStyle textLeftInsetLegacy](self->_visualStyle, "textLeftInsetLegacy");
    v23 = v22;
    -[UITextField paddingLeft](self, "paddingLeft");
    v25 = v23 - v24;
    v11 = v11 + v25;
    v9 = v9 - v25;
    if (!-[UITextField _showsClearButtonWhenNonEmpty:](self, "_showsClearButtonWhenNonEmpty:", -[UITextField isEditing](self, "isEditing")))
    {
      -[_UISearchTextFieldVisualStyle textRightInset](self->_visualStyle, "textRightInset");
      v9 = v9 - v26;
      if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0)
      {
        -[_UISearchTextFieldVisualStyle textRightInset](self->_visualStyle, "textRightInset");
        v11 = v11 + v27;
      }
    }
  }
  if (-[UIControl contentVerticalAlignment](self, "contentVerticalAlignment") == UIControlContentVerticalAlignmentTop)
  {
    -[UITextField font](self, "font");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "lineHeight");
    v56 = round(v21 + height * 0.5 - v55 * 0.5);

    -[UIView _currentScreenScale](self, "_currentScreenScale");
    v10 = v56 + 10.0 / v57;
  }
  searchTextOffsetValue = self->_searchTextOffsetValue;
  if (searchTextOffsetValue)
  {
    v59 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
    -[NSValue UIOffsetValue](searchTextOffsetValue, "UIOffsetValue");
    if ((*(_QWORD *)&v59 & 0x80000) != 0)
      v60 = -v60;
    v11 = v11 + v60;
    v10 = v10 + v61;
  }
  if (v9 >= 0.0)
    v62 = v9;
  else
    v62 = 0.0;
  v63 = v11;
  v64 = v10;
  v65 = v8;
  result.size.height = v65;
  result.size.width = v62;
  result.origin.y = v64;
  result.origin.x = v63;
  return result;
}

- (BOOL)_shouldHideMagnifyingGlassWhenEditingOrHasContent
{
  void *v3;
  void *v4;
  NSString *v5;
  BOOL IsAccessibilityCategory;

  -[UITextField font](self, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UISearchTextField _scalesMagnifyingGlassForDynamicTypeWithFont:](self, "_scalesMagnifyingGlassForDynamicTypeWithFont:", v3))
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  }
  else
  {
    IsAccessibilityCategory = 0;
  }

  return IsAccessibilityCategory;
}

- (BOOL)_scalesMagnifyingGlassForDynamicTypeWithFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (-[UISearchTextField _supportsDynamicType](self, "_supportsDynamicType"))
  {
    objc_msgSend(v4, "fontDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *(_QWORD *)off_1E167DC08);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "textStyleForScaling");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = v7;
    else
      v8 = v6;
    v9 = objc_msgSend(off_1E167A828, "_isSupportedDynamicFontTextStyle:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_supportsDynamicType
{
  return dyld_program_sdk_at_least();
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0)
    -[UISearchTextField _bookmarkViewRectForBounds:](self, "_bookmarkViewRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  else
    -[UISearchTextField _searchIconViewRectForBounds:](self, "_searchIconViewRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  double MaxX;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double MinX;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  unint64_t v46;
  NSObject *v47;
  NSObject *v48;
  CGFloat v49;
  objc_super v50;
  objc_super v51;
  uint8_t buf[16];
  objc_super v53;
  objc_super v54;
  objc_super v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v55.receiver = self;
  v55.super_class = (Class)UISearchTextField;
  -[UITextField clearButtonRectForBounds:](&v55, sel_clearButtonRectForBounds_);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v49 = v14;
  -[UIView traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16 != 6)
  {
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    if (v17 > 1.0)
    {
      -[UIView _currentScreenScale](self, "_currentScreenScale");
      v19 = 1.0 / v18;
      v20 = -v19;
      if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) != 0)
        v20 = v19;
      v9 = v9 + v20;
      v11 = v11 - v19;
    }
  }
  -[UIView traitCollection](self, "traitCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "userInterfaceIdiom");

  if (v22 == 5)
  {
    if ((*((_DWORD *)&self->super.super.super._viewFlags + 4) & 0x80000) == 0)
    {
      v56.origin.x = x;
      v56.origin.y = y;
      v56.size.width = width;
      v56.size.height = height;
      MaxX = CGRectGetMaxX(v56);
      v57.origin.x = v9;
      v57.origin.y = v11;
      v57.size.width = v13;
      v24 = v49;
      v57.size.height = v49;
      v25 = MaxX - CGRectGetWidth(v57);
      -[UISearchTextField _clearButtonMarginX](self, "_clearButtonMarginX");
      v54.receiver = self;
      v54.super_class = (Class)UISearchTextField;
      -[UITextField _clearButtonPadX](&v54, sel__clearButtonPadX);
      UIRoundToViewScale(self);
      v27 = round(v25 - v26);
      v53.receiver = self;
      v53.super_class = (Class)UISearchTextField;
      -[UITextField clearButtonOffset](&v53, sel_clearButtonOffset);
      v9 = v27 + v28;
      goto LABEL_12;
    }
    -[_UISearchTextFieldVisualStyle clearButtonInnerInset](self->_visualStyle, "clearButtonInnerInset");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v48, OS_LOG_TYPE_FAULT, "clearButtonInnerInset unexpectedly nil. Interpreted as 0.", buf, 2u);
        }

      }
      else
      {
        v46 = clearButtonRectForBounds____s_category;
        if (!clearButtonRectForBounds____s_category)
        {
          v46 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v46, (unint64_t *)&clearButtonRectForBounds____s_category);
        }
        v47 = *(NSObject **)(v46 + 8);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v47, OS_LOG_TYPE_ERROR, "clearButtonInnerInset unexpectedly nil. Interpreted as 0.", buf, 2u);
        }
      }
    }
    -[_UISearchTextFieldVisualStyle clearButtonInnerInset](self->_visualStyle, "clearButtonInnerInset");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");

    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    MinX = CGRectGetMinX(v58);
    UIRoundToViewScale(self);
    v33 = round(MinX + v32);
    v51.receiver = self;
    v51.super_class = (Class)UISearchTextField;
    -[UITextField clearButtonOffset](&v51, sel_clearButtonOffset);
    v35 = v33 + v34;
    v50.receiver = self;
    v50.super_class = (Class)UISearchTextField;
    -[UITextField _clearButtonPadX](&v50, sel__clearButtonPadX);
    v9 = v35 - v36;
  }
  v24 = v49;
LABEL_12:
  -[UISearchTextField _offsetValueForIcon:](self, "_offsetValueForIcon:", 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    v39 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
    objc_msgSend(v37, "UIOffsetValue");
    if ((*(_QWORD *)&v39 & 0x80000) != 0)
      v40 = -v40;
    v9 = v9 + v40;
    v11 = v11 + v41;
  }

  v42 = v9;
  v43 = v11;
  v44 = v13;
  v45 = v24;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.y = v43;
  result.origin.x = v42;
  return result;
}

- (CGRect)_searchIconViewRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  int v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  float v27;
  double MaxX;
  double v29;
  void *v30;
  void *v31;
  int v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGRect rect;
  __objc2_class *v51;
  objc_super v52;
  CGRect v53;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UISearchTextField _adjustmentsForSearchIconViewRectForBounds:](self, "_adjustmentsForSearchIconViewRectForBounds:");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (-[UISearchTextField _shouldCenterPlaceholder](self, "_shouldCenterPlaceholder"))
  {
    rect.origin.y = v15;
    rect.size.width = v13;
    v16 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
    -[UISearchTextField placeholderRectForBounds:](self, "placeholderRectForBounds:", x, y, width, height);
    rect.origin.x = v20;
    if ((v16 & 0x80000) != 0)
    {
      v35 = v17;
      v36 = v18;
      v37 = v19;
      *(_QWORD *)&rect.size.height = self;
      v51 = UISearchTextField;
      -[CGFloat rightViewRectForBounds:]((objc_super *)&rect.size.height, sel_rightViewRectForBounds_, x, y, width, height);
      -[UIView _currentScreenScale](self, "_currentScreenScale");
      v24 = v38;
      v53.origin.x = rect.origin.x;
      v53.origin.y = v35;
      v53.size.width = v36;
      v53.size.height = v37;
      MaxX = CGRectGetMaxX(v53);
      -[UITextField _placeholderLabel](self, "_placeholderLabel");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "text");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "length");

      v29 = -1.0;
      if (v41)
      {
        -[_UISearchTextFieldVisualStyle leftViewToPlaceholderCenteredMargin](self->_visualStyle, "leftViewToPlaceholderCenteredMargin");
        MaxX = MaxX + v42;
      }
    }
    else
    {
      v52.receiver = self;
      v52.super_class = (Class)UISearchTextField;
      -[UITextField leftViewRectForBounds:](&v52, sel_leftViewRectForBounds_, x, y, width, height);
      v22 = v21;
      -[UIView _currentScreenScale](self, "_currentScreenScale");
      v24 = v23;
      -[_UISearchTextFieldVisualStyle leftViewToPlaceholderCenteredMargin](self->_visualStyle, "leftViewToPlaceholderCenteredMargin");
      v26 = rect.origin.x - v22 - v25;
      -[UITextField paddingLeft](self, "paddingLeft");
      MaxX = v26 + v27;
      v29 = 1.0;
    }
    v9 = UIRectIntegralWithScale(MaxX + v29 / v24, v11, rect.size.width, rect.origin.y, v24);
    v11 = v43;
    v13 = v44;
    v15 = v45;
  }
  else
  {
    -[UISearchTextField _offsetValueForIcon:](self, "_offsetValueForIcon:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      v32 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
      objc_msgSend(v30, "UIOffsetValue");
      if ((*(_QWORD *)&v32 & 0x80000) != 0)
        v33 = -v33;
      v9 = v9 + v33;
      v11 = v11 + v34;
    }

  }
  v46 = v9;
  v47 = v11;
  v48 = v13;
  v49 = v15;
  result.size.height = v49;
  result.size.width = v48;
  result.origin.y = v47;
  result.origin.x = v46;
  return result;
}

- (id)_offsetValueForIcon:(int64_t)a3
{
  NSMutableDictionary *iconOffsets;
  void *v4;
  void *v5;

  iconOffsets = self->_iconOffsets;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](iconOffsets, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_shouldCenterPlaceholder
{
  id WeakRetained;
  void *v4;
  int v5;
  int v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  if (WeakRetained
    && ((-[UISearchTextField text](self, "text"),
         v4 = (void *)objc_claimAutoreleasedReturnValue(),
         !objc_msgSend(v4, "length"))
     && !self->_deferringFirstResponder
      ? (v5 = !-[UITextField _fieldEditorAttached](self, "_fieldEditorAttached"))
      : (v5 = 0),
        v4,
        objc_msgSend(WeakRetained, "centerPlaceholder")))
  {
    v6 = objc_msgSend(WeakRetained, "_forceCenteredPlaceholderLayout") | v5;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (CGRect)_adjustmentsForSearchIconViewRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  int v10;
  char **v11;
  objc_super *v12;
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
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  UISearchTextField *v32;
  objc_super v33;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UISearchTextFieldVisualStyle leftViewInset](self->_visualStyle, "leftViewInset");
  v9 = v8;
  v10 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
  if ((v10 & 0x80000) != 0)
  {
    v33.receiver = self;
    v11 = &selRef_rightViewRectForBounds_;
    v12 = &v33;
  }
  else
  {
    v32 = self;
    v11 = &selRef_leftViewRectForBounds_;
    v12 = (objc_super *)&v32;
  }
  v12->super_class = (Class)UISearchTextField;
  objc_msgSendSuper2(v12, *v11, x, y, width, height, v32);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[UIView _currentScreenScale](self, "_currentScreenScale");
  v22 = v21;
  v23 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
  -[_UISearchTextFieldVisualStyle leftViewInsetAddition](self->_visualStyle, "leftViewInsetAddition");
  if ((*(_QWORD *)&v23 & 0x80000) != 0)
    v24 = -v24;
  v25 = -v9;
  if ((*(_QWORD *)&v10 & 0x80000) != 0)
    v26 = -v9;
  else
    v26 = v9;
  v27 = v26 + v14;
  if ((*(_QWORD *)&v10 & 0x80000) != 0)
    v25 = v9;
  v28 = v18 - (v26 + v25);
  v29 = v16 + 0.0 + -1.0 / v22;
  v30 = v27 + v24;
  v31 = v20;
  result.size.height = v31;
  result.size.width = v28;
  result.origin.y = v29;
  result.origin.x = v30;
  return result;
}

- (id)_initWithFrame:(CGRect)a3 textLayoutManagerEnabled:(BOOL)a4 defersSearchImageConfiguration:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  uint64_t v10;
  void *v11;
  UIImageView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)UISearchTextField;
  v6 = -[UITextField _initWithFrame:textLayoutManagerEnabled:](&v18, sel__initWithFrame_textLayoutManagerEnabled_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  if (v6)
  {
    CommonStyleRegistration(v6);
    +[_UIVisualStyleRegistry registryForTraitEnvironment:](_UIVisualStyleRegistry, "registryForTraitEnvironment:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_msgSend(v8, "visualStyleClassForView:", v7);

    v10 = objc_msgSend([v9 alloc], "initWithInstance:", v7);
    v11 = (void *)*((_QWORD *)v7 + 144);
    *((_QWORD *)v7 + 144) = v10;

    v12 = objc_alloc_init(UIImageView);
    v13 = (void *)*((_QWORD *)v7 + 137);
    *((_QWORD *)v7 + 137) = v12;

    objc_msgSend(v7, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updateDefaultLeftViewForFont:", v14);

    objc_msgSend(*((id *)v7 + 144), "defaultLeftViewTintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v7 + 137), "setTintColor:", v15);

    _UINSLocalizedStringWithDefaultValue(CFSTR("Search"), CFSTR("Search"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v7 + 137), "setLargeContentTitle:", v16);

    if (!a5)
      objc_msgSend(v7, "_setMagnifyingGlassImage:", 0);
    objc_msgSend(v7, "setLeftView:", *((_QWORD *)v7 + 137));
    objc_msgSend(v7, "setLeftViewMode:", 3);
    objc_msgSend(v7, "setClearButtonMode:", 1);
    objc_msgSend(v7, "setBorderStyle:", 3);
    if (UISearchBarUsesModernAppearance())
    {
      objc_msgSend(*((id *)v7 + 144), "backgroundCornerRadius");
      objc_msgSend(v7, "_setRoundedRectBackgroundCornerRadius:");
    }
    *((_BYTE *)v7 + 1120) |= 3u;
    CommonInit(v7);
  }
  return v7;
}

- (void)_didSetFont:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UISearchTextField;
  -[UITextField _didSetFont:](&v17, sel__didSetFont_, v4);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_knownTokenLayoutViews;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "delegateView", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAtomFont:", v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v7);
  }

  -[UISearchTextField _updateDefaultLeftViewForFont:](self, "_updateDefaultLeftViewForFont:", v4);
  if (-[UISearchTextField _ignoresDynamicType](self, "_ignoresDynamicType"))
  {
    +[UIImageSymbolConfiguration unspecifiedConfiguration](UIImageSymbolConfiguration, "unspecifiedConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_configurationIgnoringDynamicType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView _setOverridingSymbolConfiguration:](self->_defaultLeftView, "_setOverridingSymbolConfiguration:", v12);

  }
  else
  {
    -[UIImageView _setOverridingSymbolConfiguration:](self->_defaultLeftView, "_setOverridingSymbolConfiguration:", 0);
  }
  if (-[UISearchTextField _supportsDynamicType](self, "_supportsDynamicType", (_QWORD)v13))
  {
    -[UISearchTextField _updateLeftViewForMagnifyingGlassImage](self, "_updateLeftViewForMagnifyingGlassImage");
    -[UISearchTextField _updateAlphaForMagnifyingGlass](self, "_updateAlphaForMagnifyingGlass");
  }

}

- (void)_updateAlphaForMagnifyingGlass
{
  double v3;
  BOOL v4;

  if (!-[UISearchTextField _shouldHideMagnifyingGlassWhenEditingOrHasContent](self, "_shouldHideMagnifyingGlassWhenEditingOrHasContent")|| (v4 = -[UISearchTextField _isEditingOrHasContent](self, "_isEditingOrHasContent"), v3 = 0.0, !v4))
  {
    -[UITextField _foregroundViewsAlpha](self, "_foregroundViewsAlpha", v3);
  }
  -[UIView setAlpha:](self->_defaultLeftView, "setAlpha:", v3);
}

- (BOOL)_ignoresDynamicType
{
  void *v2;
  BOOL v3;

  -[UIImageView _overridingSymbolConfiguration](self->_defaultLeftView, "_overridingSymbolConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (Class)_canvasViewClass
{
  return (Class)objc_opt_class();
}

- (UISearchBar)_searchBar
{
  return (UISearchBar *)objc_loadWeakRetained((id *)&self->_searchBar);
}

- (id)_createEffectsBackgroundViewWithStyle:(int64_t)a3 applyFilter:(id)a4
{
  id v6;
  void *v7;
  _UISearchBarSearchFieldBackgroundView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _UISearchBarSearchFieldBackgroundView *v13;

  v6 = a4;
  -[UITextField _systemBackgroundView](self, "_systemBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [_UISearchBarSearchFieldBackgroundView alloc];
  objc_msgSend(v7, "bounds");
  v13 = -[_UISearchBarSearchFieldBackgroundView initWithFrame:active:updateView:](v8, "initWithFrame:active:updateView:", -[UIControl isEnabled](self, "isEnabled"), 0, v9, v10, v11, v12);
  objc_msgSend(v7, "cornerRadius");
  -[_UISearchBarSearchFieldBackgroundView setCornerRadius:](v13, "setCornerRadius:");
  -[UISearchTextField _updateBackgroundView:withStyle:filter:](self, "_updateBackgroundView:withStyle:filter:", v13, a3, v6);

  -[_UISearchBarSearchFieldBackgroundView setBarStyle:](v13, "setBarStyle:", objc_msgSend(v7, "barStyle"));
  objc_msgSend(v7, "addSubview:", v13);

  return v13;
}

- (void)_setSearchBar:(id)a3
{
  UISearchBar **p_searchBar;
  id v5;

  p_searchBar = &self->_searchBar;
  v5 = a3;
  objc_storeWeak((id *)p_searchBar, v5);
  LOBYTE(p_searchBar) = objc_opt_respondsToSelector();

  *(_BYTE *)&self->_searchBarTextFieldFlags = *(_BYTE *)&self->_searchBarTextFieldFlags & 0xFE | p_searchBar & 1;
  -[_UISearchSuggestionControllerIOSBase searchTextFieldDidGainSearchBar:](self->_suggestionController, "searchTextFieldDidGainSearchBar:", self);
}

- (void)_setMagnifyingGlassImage:(id)a3
{
  UIImage *v4;
  UIImage *magnifyingGlassImage;

  v4 = (UIImage *)a3;
  if (!v4)
  {
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass"));
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  magnifyingGlassImage = self->_magnifyingGlassImage;
  self->_magnifyingGlassImage = v4;

  -[UISearchTextField _updateLeftViewForMagnifyingGlassImage](self, "_updateLeftViewForMagnifyingGlassImage");
}

- (void)updateForBackdropStyle:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  _UISearchBarSearchFieldBackgroundView *effectBackgroundBottom;
  _UISearchBarSearchFieldBackgroundView *effectBackgroundTop;
  _UISearchBarSearchFieldBackgroundView *v9;
  _UISearchBarSearchFieldBackgroundView *v10;
  UISearchTextField *v11;
  _UISearchBarSearchFieldBackgroundView *v12;
  _UISearchBarSearchFieldBackgroundView *v13;
  uint64_t v14;
  id *v15;
  UISearchTextField *v16;
  uint64_t v17;
  uint64_t v18;
  _UISearchBarSearchFieldBackgroundView *v19;
  _UISearchBarSearchFieldBackgroundView *v20;
  _UISearchBarSearchFieldBackgroundView *v21;
  _UISearchBarSearchFieldBackgroundView *v22;
  _UISearchBarSearchFieldBackgroundView *v23;
  _UISearchBarSearchFieldBackgroundView *v24;
  _UISearchBarSearchFieldBackgroundView *v25;
  _UISearchBarSearchFieldBackgroundView *v26;
  _UISearchBarSearchFieldBackgroundView *v27;
  _UISearchBarSearchFieldBackgroundView *v28;
  _UISearchBarSearchFieldBackgroundView *v29;
  _UISearchBarSearchFieldBackgroundView *v30;
  _UISearchBarSearchFieldBackgroundView *v31;

  -[UIView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 3)
  {
    -[UIView removeFromSuperview](self->_effectBackgroundBottom, "removeFromSuperview");
    effectBackgroundBottom = self->_effectBackgroundBottom;
    self->_effectBackgroundBottom = 0;

    -[UIView removeFromSuperview](self->_effectBackgroundTop, "removeFromSuperview");
    effectBackgroundTop = self->_effectBackgroundTop;
    self->_effectBackgroundTop = 0;
LABEL_3:

    return;
  }
  switch(a3)
  {
    case 2020:
      v12 = self->_effectBackgroundBottom;
      if (v12)
      {
        -[UIView removeFromSuperview](v12, "removeFromSuperview");
        v13 = self->_effectBackgroundBottom;
        self->_effectBackgroundBottom = 0;

      }
      v14 = *MEMORY[0x1E0CD2E98];
      if (self->_effectBackgroundTop)
      {
        v11 = self;
        goto LABEL_37;
      }
      v16 = self;
      v17 = 2020;
      goto LABEL_21;
    case 2005:
      v9 = self->_effectBackgroundBottom;
      if (v9)
      {
        -[UIView removeFromSuperview](v9, "removeFromSuperview");
        v10 = self->_effectBackgroundBottom;
        self->_effectBackgroundBottom = 0;

      }
      if (self->_effectBackgroundTop)
      {
        v11 = self;
LABEL_37:
        -[UISearchTextField _updateBackgroundView:withStyle:filter:](v11, "_updateBackgroundView:withStyle:filter:");
        return;
      }
      v16 = self;
      v17 = 2005;
      v18 = 0;
LABEL_22:
      v19 = -[UISearchTextField _createEffectsBackgroundViewWithStyle:applyFilter:](v16, "_createEffectsBackgroundViewWithStyle:applyFilter:", v17, v18);
      v20 = self->_effectBackgroundTop;
      self->_effectBackgroundTop = v19;

      return;
    case 2030:
      v21 = self->_effectBackgroundBottom;
      if (v21)
      {
        -[UISearchTextField _updateBackgroundView:withStyle:filter:](self, "_updateBackgroundView:withStyle:filter:", v21, 2030, *MEMORY[0x1E0CD2E80]);
      }
      else
      {
        v29 = -[UISearchTextField _createEffectsBackgroundViewWithStyle:applyFilter:](self, "_createEffectsBackgroundViewWithStyle:applyFilter:", 2030, *MEMORY[0x1E0CD2E80]);
        v30 = self->_effectBackgroundBottom;
        self->_effectBackgroundBottom = v29;

      }
      v14 = *MEMORY[0x1E0CD2EA0];
      if (self->_effectBackgroundTop)
      {
        v11 = self;
        goto LABEL_37;
      }
      v16 = self;
      v17 = 2030;
LABEL_21:
      v18 = v14;
      goto LABEL_22;
    case 2010:
      goto LABEL_18;
    case 2:
      if (!UISearchBarUsesModernAppearance())
      {
        v15 = (id *)MEMORY[0x1E0CD2BC0];
        goto LABEL_27;
      }
LABEL_18:
      v15 = (id *)MEMORY[0x1E0CD2E80];
LABEL_27:
      v22 = (_UISearchBarSearchFieldBackgroundView *)*v15;
      v23 = self->_effectBackgroundBottom;
      v31 = v22;
      if (v23)
      {
        -[UISearchTextField _updateBackgroundView:withStyle:filter:](self, "_updateBackgroundView:withStyle:filter:", v23, a3, v22);
      }
      else
      {
        v24 = -[UISearchTextField _createEffectsBackgroundViewWithStyle:applyFilter:](self, "_createEffectsBackgroundViewWithStyle:applyFilter:", a3, v22);
        v25 = self->_effectBackgroundBottom;
        self->_effectBackgroundBottom = v24;

      }
      v26 = self->_effectBackgroundTop;
      if (v26)
      {
        -[UISearchTextField _updateBackgroundView:withStyle:filter:](self, "_updateBackgroundView:withStyle:filter:", v26, a3, *MEMORY[0x1E0CD2E98]);
      }
      else
      {
        v27 = -[UISearchTextField _createEffectsBackgroundViewWithStyle:applyFilter:](self, "_createEffectsBackgroundViewWithStyle:applyFilter:", a3, *MEMORY[0x1E0CD2E98]);
        v28 = self->_effectBackgroundTop;
        self->_effectBackgroundTop = v27;

      }
      -[UIView setHidden:](self->_effectBackgroundBottom, "setHidden:", a3 == 2);
      effectBackgroundTop = v31;
      goto LABEL_3;
  }
}

- (void)_setIgnoresDynamicType:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    +[UIImageSymbolConfiguration unspecifiedConfiguration](UIImageSymbolConfiguration, "unspecifiedConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_configurationIgnoringDynamicType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[UIImageView _setOverridingSymbolConfiguration:](self->_defaultLeftView, "_setOverridingSymbolConfiguration:", v6);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_knownTokenLayoutViews;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = !v3;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "delegateView", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "leadingImage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_setOverridingSymbolConfiguration:", v6);

        objc_msgSend(v13, "textLabel");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setAdjustsFontForContentSizeCategory:", v11);

      }
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)_setSuggestionController:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionController, a3);
}

- (id)_clearButtonImageForState:(unint64_t)a3
{
  NSMutableDictionary *customClearButtons;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  objc_super v26;

  customClearButtons = self->_customClearButtons;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](customClearButtons, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v9 = WeakRetained;
  if (!a3 && !v7 && WeakRetained != 0)
  {
    v11 = 1;
    objc_msgSend(WeakRetained, "_colorForComponent:disabled:", 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[UITextField _partsShouldBeMini](self, "_partsShouldBeMini"))
    {
      if (UISearchBarUsesModernAppearance())
        v11 = 3;
      else
        v11 = 0;
    }
    -[UIView tintColor](self, "tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _GetTextFieldClearButtonWithCustomColorContrastSettings(0, v11, v12, v13, v14, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!_TextFieldScalesClearButton())
      goto LABEL_18;
    -[UIView traitCollection](self, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceIdiom");

    if (v16 == 6)
      goto LABEL_18;
    -[UITextField font](self, "font");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](self, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferredContentSizeCategory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v19))
    {
      if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v19, CFSTR("UICTContentSizeCategoryAccessibilityXL")) != NSOrderedAscending)
      {
        v20 = 1;
LABEL_17:

        +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v17, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "imageWithConfiguration:", v21);
        v22 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v22;
LABEL_18:

        goto LABEL_19;
      }
      UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v19, CFSTR("UICTContentSizeCategoryAccessibilityM"));
    }
    v20 = 2;
    goto LABEL_17;
  }
LABEL_19:
  if (v7)
  {
    v23 = v7;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)UISearchTextField;
    -[UITextField _clearButtonImageForState:](&v26, sel__clearButtonImageForState_, a3);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;

  return v24;
}

- (id)_placeholderColor
{
  id WeakRetained;
  void *v4;
  void *v5;
  objc_super v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v4 = WeakRetained;
  if (!WeakRetained
    || (objc_msgSend(WeakRetained, "_colorForComponent:disabled:", 3, 0),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)UISearchTextField;
    -[UITextField _placeholderColor](&v7, sel__placeholderColor);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)_updateBackgroundView:(id)a3 withStyle:(int64_t)a4 filter:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v7 = (void *)MEMORY[0x1E0CD2780];
  v10 = a3;
  objc_msgSend(v7, "filterWithType:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompositingFilter:", v8);

  objc_msgSend(v10, "setSearchBarStyle:", a4);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchTextField;
  -[UITextField layoutSubviews](&v3, sel_layoutSubviews);
  if (-[UISearchTextField _shouldHideMagnifyingGlassWhenEditingOrHasContent](self, "_shouldHideMagnifyingGlassWhenEditingOrHasContent"))
  {
    -[UISearchTextField _updateAlphaForMagnifyingGlass](self, "_updateAlphaForMagnifyingGlass");
  }
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)CFSTR("UISearchTextField");
}

- (BOOL)canBecomeFirstResponder
{
  unsigned int v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UISearchTextField;
  v3 = -[UITextField canBecomeFirstResponder](&v9, sel_canBecomeFirstResponder);
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v5 = WeakRetained;
  if (v3)
  {
    objc_msgSend(WeakRetained, "_searchController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "_searchController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = objc_msgSend(v7, "_searchBarShouldFinalizeBecomingFirstResponder");

    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }

  return v3;
}

- (BOOL)_delegateShouldBeginEditing
{
  unsigned int v3;
  id WeakRetained;
  void *v5;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  v3 = -[UITextField _delegateShouldBeginEditing](&v8, sel__delegateShouldBeginEditing);
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v5 = WeakRetained;
  if (v3)
    v6 = WeakRetained == 0;
  else
    v6 = 1;
  if (!v6)
    LOBYTE(v3) = objc_msgSend(WeakRetained, "_searchBarTextFieldShouldBeginEditing");

  return v3;
}

- (BOOL)_shouldSuppressSelectionHandles
{
  void *v3;
  uint64_t v4;
  BOOL v5;

  -[_UISearchBarTextFieldTokenCounter tokenCharacterIndexes](self->_tokenCounter, "tokenCharacterIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[_UISearchBarTextFieldTokenCounter characterRangeOfTextAfterLastToken](self->_tokenCounter, "characterRangeOfTextAfterLastToken");
    v5 = v4 == 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateHelpMessageOverrideWithMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UISearchTextField _searchBar](self, "_searchBar");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setHelperPlaceholderOverride:", v4);

}

- (void)tintColorDidChange
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  if (WeakRetained)
  {
    -[UIView superview](self, "superview");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      while (1)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v5, "superview");
        v6 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v6;
        if (!v6)
          goto LABEL_6;
      }

    }
    else
    {
LABEL_6:
      objc_msgSend(WeakRetained, "tintColorDidChange");
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)UISearchTextField;
  -[UITextField tintColorDidChange](&v7, sel_tintColorDidChange);

}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISearchTextField;
  v4 = a3;
  -[UITextField willMoveToWindow:](&v6, sel_willMoveToWindow_, v4);
  -[UISearchTextField _suggestionController](self, "_suggestionController", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchTextFieldWillMoveToWindow:", v4);

}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  -[UITextField _didMoveFromWindow:toWindow:](&v8, sel__didMoveFromWindow_toWindow_, a3);
  -[UISearchTextField _suggestionController](self, "_suggestionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _removeGeometryChangeObserver:](self, v6);

  if (a4)
  {
    -[UISearchTextField _suggestionController](self, "_suggestionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _addGeometryChangeObserver:](self, v7);

  }
}

- (_UISearchSuggestionControllerIOSBase)_suggestionController
{
  return self->_suggestionController;
}

- (int64_t)_preferredRenderingModeForPlaceholder
{
  return 1;
}

- (Class)_placeholderLabelClass
{
  return (Class)objc_opt_class();
}

- (void)_receivedKeyboardDidShowNotification:(id)a3
{
  id WeakRetained;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISearchTextField;
  -[UITextField _receivedKeyboardDidShowNotification:](&v6, sel__receivedKeyboardDidShowNotification_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  objc_msgSend(WeakRetained, "_searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_stopDeferringAndShowDeferredSearchSuggestions");

}

- (BOOL)becomeFirstResponder
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  id WeakRetained;
  void *v7;
  unsigned __int8 v8;
  objc_super v10;
  objc_super v11;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 6)
  {
    v11.receiver = self;
    v11.super_class = (Class)UISearchTextField;
    return -[UITextField becomeFirstResponder](&v11, sel_becomeFirstResponder);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
    objc_msgSend(WeakRetained, "_searchController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v7, "_startDeferringSettingSearchSuggestions");
    v10.receiver = self;
    v10.super_class = (Class)UISearchTextField;
    v8 = -[UITextField becomeFirstResponder](&v10, sel_becomeFirstResponder);
    v5 = v8;
    if (v7 && (v8 & 1) == 0)
      objc_msgSend(v7, "_stopDeferringAndShowDeferredSearchSuggestions");

  }
  return v5;
}

- (void)_becomeFirstResponder
{
  id WeakRetained;
  void *v4;
  void *v5;
  _BOOL4 deferringFirstResponder;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD aBlock[4];
  id v13;
  UISearchTextField *v14;
  objc_super v15;

  if (+[UIResponder _currentChangeIntent](UIResponder, "_currentChangeIntent") == 1)
    *((_BYTE *)&self->_searchBarTextFieldFlags + 12) |= 8u;
  v15.receiver = self;
  v15.super_class = (Class)UISearchTextField;
  -[UITextField _becomeFirstResponder](&v15, sel__becomeFirstResponder);
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v4 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "centerPlaceholder"))
  {
    -[UISearchTextField textInputTraits](self, "textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "deferBecomingResponder") & 1) != 0)
    {
      deferringFirstResponder = self->_deferringFirstResponder;

      if (!deferringFirstResponder)
      {
        self->_deferringFirstResponder = 1;
        -[UISearchTextField _setPreventSelectionViewActivation:](self, "_setPreventSelectionViewActivation:", 1);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __42__UISearchTextField__becomeFirstResponder__block_invoke;
        aBlock[3] = &unk_1E16B1B50;
        v7 = v4;
        v13 = v7;
        v14 = self;
        v8 = (void (**)(_QWORD))_Block_copy(aBlock);
        objc_msgSend(v7, "controller");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {

        }
        else
        {
          objc_msgSend(v7, "_searchController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
          {
            v8[2](v8);
            goto LABEL_16;
          }
        }
        objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v8);
LABEL_16:

        goto LABEL_13;
      }
    }
    else
    {

    }
  }
  if (-[UISearchTextField _shouldHideMagnifyingGlassWhenEditingOrHasContent](self, "_shouldHideMagnifyingGlassWhenEditingOrHasContent")&& !-[UISearchTextField _hasContent](self, "_hasContent"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__UISearchTextField__becomeFirstResponder__block_invoke_4;
    v11[3] = &unk_1E16B1B28;
    v11[4] = self;
    -[UISearchTextField _animateForFirstResponderChangeWithAnimations:](self, "_animateForFirstResponderChangeWithAnimations:", v11);
  }
LABEL_13:

}

- (void)_activateSelectionView
{
  objc_super v3;

  if (!-[UISearchTextField _preventSelectionViewActivation](self, "_preventSelectionViewActivation"))
  {
    v3.receiver = self;
    v3.super_class = (Class)UISearchTextField;
    -[UITextField _activateSelectionView](&v3, sel__activateSelectionView);
  }
}

- (BOOL)_preventSelectionViewActivation
{
  return self->__preventSelectionViewActivation;
}

- (void)_updateAtomViewSelection:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSHashTable *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  NSHashTable *v23;
  UISearchTextField *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[UITextField textStorage](self, "textStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UITextField selectionRange](self, "selectionRange");
    v7 = v6;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__19;
    v32 = __Block_byref_object_dispose__19;
    v33 = 0;
    -[UITextField textLayoutController](self, "textLayoutController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __46__UISearchTextField__updateAtomViewSelection___block_invoke;
    v21 = &unk_1E16B6920;
    v10 = v8;
    v22 = v10;
    v11 = v4;
    v26 = v5;
    v27 = v7;
    v23 = v11;
    v24 = self;
    v25 = &v28;
    objc_msgSend(v10, "enumerateTextLineFragmentsInRange:usingBlock:", v9, &v18);

    -[UISearchTextField tokens](self, "tokens", v18, v19, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") == 1)
    {
      -[UISearchTextField text](self, "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "length"))
      {
        v17 = v29[5] == 0;

        if (!v17)
          objc_msgSend((id)v29[5], "setSelectionStyle:animated:", 1, 0);
        goto LABEL_6;
      }

    }
LABEL_6:

    _Block_object_dispose(&v28, 8);
    goto LABEL_14;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = self->_knownTokenLayoutViews;
  v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v35;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v16++), "setSelectionStyle:animated:", 0, 0);
      }
      while (v14 != v16);
      v14 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v14);
  }
LABEL_14:

}

- (NSArray)tokens
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  UISearchTextField *v13;

  v3 = (void *)objc_opt_new();
  -[_UISearchBarTextFieldTokenCounter tokenCharacterIndexes](self->_tokenCounter, "tokenCharacterIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __27__UISearchTextField_tokens__block_invoke;
  v11 = &unk_1E16B2978;
  v12 = v3;
  v13 = self;
  v5 = v3;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", &v8);

  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11);
  return (NSArray *)v6;
}

- (void)_notifyDidBeginEditing
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISearchTextField;
  -[UITextField _notifyDidBeginEditing](&v5, sel__notifyDidBeginEditing);
  -[UISearchTextField _deferredSearchSuggestions](self, "_deferredSearchSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    *((_BYTE *)&self->_searchBarTextFieldFlags + 12) &= 0xCFu;
    -[UISearchTextField _suggestionController](self, "_suggestionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateSuggestions:userInitiated:", v3, 1);

    -[UISearchTextField _setDeferredSearchSuggestions:](self, "_setDeferredSearchSuggestions:", 0);
  }

}

- (id)_deferredSearchSuggestions
{
  return objc_getAssociatedObject(self, &_UISearchTextFieldDeferredSuggestions);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenForegroundColor, 0);
  objc_storeStrong((id *)&self->_tokenBackgroundColor, 0);
  objc_storeStrong((id *)&self->_suggestionController, 0);
  objc_destroyWeak((id *)&self->_searchBar);
  objc_storeStrong((id *)&self->_magnifyingGlassImage, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_tokenTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tokenCounter, 0);
  objc_storeStrong((id *)&self->_knownTokenLayoutViews, 0);
  objc_storeStrong((id *)&self->_defaultLeftView, 0);
  objc_storeStrong((id *)&self->_effectBackgroundBottom, 0);
  objc_storeStrong((id *)&self->_effectBackgroundTop, 0);
  objc_storeStrong((id *)&self->_searchTextOffsetValue, 0);
  objc_storeStrong((id *)&self->_iconOffsets, 0);
  objc_storeStrong((id *)&self->_customClearButtons, 0);
}

- (id)_initWithFrame:(CGRect)a3 textLayoutManagerEnabled:(BOOL)a4
{
  return -[UISearchTextField _initWithFrame:textLayoutManagerEnabled:defersSearchImageConfiguration:](self, "_initWithFrame:textLayoutManagerEnabled:defersSearchImageConfiguration:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_setClearButtonImage:(id)a3 forState:(unint64_t)a4
{
  NSMutableDictionary *customClearButtons;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  BOOL v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;

  v16 = a3;
  customClearButtons = self->_customClearButtons;
  if (!customClearButtons)
  {
    v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    v8 = self->_customClearButtons;
    self->_customClearButtons = v7;

    customClearButtons = self->_customClearButtons;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](customClearButtons, "objectForKey:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v14 = self->_customClearButtons;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", v13);
    goto LABEL_10;
  }
  if (v10)
    v11 = v10 == v16;
  else
    v11 = 0;
  if (!v11)
  {
    v12 = self->_customClearButtons;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v16, v13);
LABEL_10:

    -[UITextField _clearButton](self, "_clearButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:forState:", 0, 0);

    -[UITextField _updateButtons](self, "_updateButtons");
  }

}

- (void)_setBackgroundViewsAlpha:(double)a3
{
  -[UIView setAlpha:](self->_effectBackgroundTop, "setAlpha:");
  -[UIView setAlpha:](self->_effectBackgroundBottom, "setAlpha:", a3);
}

- (double)_maximumAlphaForLeadingView
{
  UIImageView *v3;
  BOOL v4;
  double result;
  objc_super v6;

  -[UITextField leftView](self, "leftView");
  v3 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  if (v3 != self->_defaultLeftView
    || !-[UISearchTextField _shouldHideMagnifyingGlassWhenEditingOrHasContent](self, "_shouldHideMagnifyingGlassWhenEditingOrHasContent"))
  {

    goto LABEL_6;
  }
  v4 = -[UISearchTextField _isEditingOrHasContent](self, "_isEditingOrHasContent");

  result = 0.0;
  if (!v4)
  {
LABEL_6:
    v6.receiver = self;
    v6.super_class = (Class)UISearchTextField;
    -[UITextField _maximumAlphaForLeadingView](&v6, sel__maximumAlphaForLeadingView, result);
  }
  return result;
}

- (double)_placeholderLabelAlphaForForegroundViewsAlpha:(double)a3
{
  _BOOL4 v4;
  double result;

  v4 = -[UIControl isEnabled](self, "isEnabled");
  result = a3 * 0.35;
  if (v4)
    return a3;
  return result;
}

- (void)_setAnimatesBackgroundCornerRadius:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[_UITextFieldRoundedRectBackgroundViewNeue setHasFlexibleCornerRadius:](self->_effectBackgroundTop, "setHasFlexibleCornerRadius:");
  -[_UITextFieldRoundedRectBackgroundViewNeue setHasFlexibleCornerRadius:](self->_effectBackgroundBottom, "setHasFlexibleCornerRadius:", v3);
}

- (void)setDelegate:(id)a3
{
  UISearchTextField *v3;
  void *v4;
  objc_super v5;

  v3 = self;
  v5.receiver = self;
  v5.super_class = (Class)UISearchTextField;
  -[UITextField setDelegate:](&v5, sel_setDelegate_, a3);
  -[UITextField delegate](v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (UISearchTextField *)((char *)v3 + 1108);
  HIDWORD(v3->super.super.super.super.super.isa) = objc_opt_respondsToSelector() & 1;
  v3->super.super.super.super._responderFlags = ($ED191FA5279C67AC4BE6375188FD581F)(objc_opt_respondsToSelector() & 1);

}

- (BOOL)_delegateShouldScrollToVisibleWhenBecomingFirstResponder
{
  unsigned int v3;
  UISearchBar **p_searchBar;
  id WeakRetained;
  void *v6;
  BOOL v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UISearchTextField;
  v3 = -[UITextField _delegateShouldScrollToVisibleWhenBecomingFirstResponder](&v10, sel__delegateShouldScrollToVisibleWhenBecomingFirstResponder);
  p_searchBar = &self->_searchBar;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v6 = WeakRetained;
  if (v3)
    v7 = WeakRetained == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = objc_loadWeakRetained((id *)p_searchBar);
    LOBYTE(v3) = objc_msgSend(v8, "_searchBarTextFieldShouldScrollToVisibleWhenBecomingFirstResponder");

  }
  return v3;
}

- (void)setText:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UISearchTextField;
  -[UITextField setText:](&v6, sel_setText_, v4);
  if (dyld_program_sdk_at_least())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
    objc_msgSend(WeakRetained, "_updateForNewSearchFieldText:", v4);

  }
}

- (_NSRange)_rangeForSetText
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[_UISearchBarTextFieldTokenCounter characterRangeOfTextAfterLastToken](self->_tokenCounter, "characterRangeOfTextAfterLastToken");
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)_initWithDeferredSearchIconImageConfiguration
{
  return -[UISearchTextField _initWithFrame:textLayoutManagerEnabled:defersSearchImageConfiguration:](self, "_initWithFrame:textLayoutManagerEnabled:defersSearchImageConfiguration:", objc_msgSend((id)objc_opt_class(), "_isTextLayoutManagerEnabled"), 1, *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24));
}

- (UIColor)tokenBackgroundColor
{
  UIColor *tokenBackgroundColor;
  UIColor *v3;
  void *v4;

  tokenBackgroundColor = self->_tokenBackgroundColor;
  if (tokenBackgroundColor)
  {
    v3 = tokenBackgroundColor;
  }
  else
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UISearchAtomView defaultAtomBackgroundColorForTraitCollection:](_UISearchAtomView, "defaultAtomBackgroundColorForTraitCollection:", v4);
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setTokenBackgroundColor:(UIColor *)tokenBackgroundColor
{
  UIColor *v5;
  UIColor **p_tokenBackgroundColor;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UIColor *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = tokenBackgroundColor;
  p_tokenBackgroundColor = &self->_tokenBackgroundColor;
  objc_storeStrong((id *)&self->_tokenBackgroundColor, tokenBackgroundColor);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_knownTokenLayoutViews;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *p_tokenBackgroundColor;
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "delegateView", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAtomBackgroundColor:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)_setTokenForegroundColor:(id)a3
{
  id v5;
  UIColor **p_tokenForegroundColor;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UIColor *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_tokenForegroundColor = &self->_tokenForegroundColor;
  objc_storeStrong((id *)&self->_tokenForegroundColor, a3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_knownTokenLayoutViews;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *p_tokenForegroundColor;
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "delegateView", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_setAtomForegroundColor:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)setAllowsCopyingTokens:(BOOL)allowsCopyingTokens
{
  *((_BYTE *)&self->_searchBarTextFieldFlags + 12) = *((_BYTE *)&self->_searchBarTextFieldFlags + 12) & 0xFE | allowsCopyingTokens;
}

- (BOOL)_shouldIgnoreBaseWritingDirectionChanges
{
  return 1;
}

- (void)_setOffsetValue:(id)a3 forIcon:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *iconOffsets;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  id v12;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_iconOffsets, "objectForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v12 && v7)
  {
    if ((objc_msgSend(v12, "isEqualToValue:", v7) & 1) != 0)
      goto LABEL_12;
  }
  else if ((v12 != 0) == (v7 != 0))
  {
    goto LABEL_12;
  }
  iconOffsets = self->_iconOffsets;
  if (!iconOffsets)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11 = self->_iconOffsets;
    self->_iconOffsets = v10;

    iconOffsets = self->_iconOffsets;
  }
  if (v12)
    -[NSMutableDictionary setObject:forKey:](iconOffsets, "setObject:forKey:", v12, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](iconOffsets, "removeObjectForKey:", v6);
  -[UITextField setNeedsLayout](self, "setNeedsLayout");
LABEL_12:

}

- (void)searchSuggestionController:(id)a3 didSelectSuggestion:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a4;
  if (self->_suggestionController == a3)
  {
    v12 = v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
    objc_msgSend(WeakRetained, "_searchController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_loadWeakRetained((id *)&self->_searchBar);
      objc_msgSend(v10, "_searchController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_searchBarTextFieldDidSelectSearchSuggestion:", v12);

    }
    else
    {
      -[UITextField delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "searchTextField:didSelectSuggestion:", self, v12);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10, "_dci_searchTextField:didSelectSuggestion:", self, v12);
      }
      -[UISearchTextField _dci_setSearchSuggestions:](self, "_dci_setSearchSuggestions:", 0);
      *((_BYTE *)&self->_searchBarTextFieldFlags + 12) |= 0x10u;
    }

    v7 = v12;
  }

}

- (void)_suggestionsMenuInteractionWillEndWithAnimator:(id)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  objc_msgSend(WeakRetained, "_searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISearchTextField.m"), 184, CFSTR("Should only be called on standalone searchBar or searchTextField. This is an internal UIKit bug"));

  }
  -[UITextField delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "_dci_searchTextField:willDismissSearchSuggestionsMenuWasSuggestionSelected:", self, (*((unsigned __int8 *)&self->_searchBarTextFieldFlags + 12) >> 4) & 1);
  if ((*((_BYTE *)&self->_searchBarTextFieldFlags + 12) & 0x10) == 0)
    *((_BYTE *)&self->_searchBarTextFieldFlags + 12) |= 0x20u;

}

- (void)_setDeferredSearchSuggestions:(id)a3
{
  objc_setAssociatedObject(self, &_UISearchTextFieldDeferredSuggestions, a3, (void *)1);
}

- (void)setSearchSuggestions:(NSArray *)searchSuggestions
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSArray *v11;

  v11 = searchSuggestions;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  objc_msgSend(WeakRetained, "_searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = objc_loadWeakRetained((id *)&self->_searchBar);
    objc_msgSend(v8, "_searchController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Please set suggestions on the associated searchController instead. self = %@, searchController = %@"), self, v9);

  }
  *((_BYTE *)&self->_searchBarTextFieldFlags + 12) &= 0xCFu;
  if (v11 && !-[UITextField isEditing](self, "isEditing"))
  {
    -[UISearchTextField _setDeferredSearchSuggestions:](self, "_setDeferredSearchSuggestions:", v11);
  }
  else
  {
    -[UISearchTextField _setDeferredSearchSuggestions:](self, "_setDeferredSearchSuggestions:", 0);
    -[UISearchTextField _suggestionController](self, "_suggestionController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateSuggestions:userInitiated:", v11, 1);

  }
}

- (NSArray)searchSuggestions
{
  void *v2;
  void *v3;

  -[UISearchTextField _suggestionController](self, "_suggestionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)_dci_suggestionsMenuDismissalPassthroughViews
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  UIColor *tokenBackgroundColor;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UISearchTextField;
  -[UITextField encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", *((_BYTE *)&self->_searchBarTextFieldFlags + 12) & 1, CFSTR("UIAllowsCopyingTokens"));
  objc_msgSend(v4, "encodeBool:forKey:", (*((unsigned __int8 *)&self->_searchBarTextFieldFlags + 12) >> 1) & 1, CFSTR("UIAllowsDeletingTokens"));
  tokenBackgroundColor = self->_tokenBackgroundColor;
  if (tokenBackgroundColor)
    objc_msgSend(v4, "encodeObject:forKey:", tokenBackgroundColor, CFSTR("UITokenBackgroundColor"));

}

- (UISearchTextField)initWithCoder:(id)a3
{
  id v4;
  UISearchTextField *v5;
  UISearchTextField *v6;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  _UISearchTextFieldVisualStyle *visualStyle;
  char v11;
  uint64_t v12;
  UIColor *tokenBackgroundColor;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UISearchTextField;
  v5 = -[UITextField initWithCoder:](&v15, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    CommonStyleRegistration(v5);
    +[_UIVisualStyleRegistry registryForTraitEnvironment:](_UIVisualStyleRegistry, "registryForTraitEnvironment:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_msgSend(v7, "visualStyleClassForView:", v6);

    v9 = objc_msgSend([v8 alloc], "initWithInstance:", v6);
    visualStyle = v6->_visualStyle;
    v6->_visualStyle = (_UISearchTextFieldVisualStyle *)v9;

    CommonInit(v6);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIAllowsCopyingTokens")))
      *((_BYTE *)&v6->_searchBarTextFieldFlags + 12) = *((_BYTE *)&v6->_searchBarTextFieldFlags + 12) & 0xFE | objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAllowsCopyingTokens"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIAllowsDeletingTokens")))
    {
      if (objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAllowsDeletingTokens")))
        v11 = 2;
      else
        v11 = 0;
      *((_BYTE *)&v6->_searchBarTextFieldFlags + 12) = *((_BYTE *)&v6->_searchBarTextFieldFlags + 12) & 0xFD | v11;
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UITokenBackgroundColor")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UITokenBackgroundColor"));
      v12 = objc_claimAutoreleasedReturnValue();
      tokenBackgroundColor = v6->_tokenBackgroundColor;
      v6->_tokenBackgroundColor = (UIColor *)v12;

    }
  }

  return v6;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  if (-[_UISearchTextFieldVisualStyle usesCustomIntrinsicSize](self->_visualStyle, "usesCustomIntrinsicSize"))
  {
    -[_UISearchTextFieldVisualStyle defaultHeight](self->_visualStyle, "defaultHeight");
    v4 = v3;
    v5 = -1.0;
    if (-[UISearchTextField _supportsDynamicType](self, "_supportsDynamicType"))
    {
      -[UITextField font](self, "font");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_scaledValueForValue:", v4);
      UIRoundToViewScale(self);
      v4 = v7;

    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UISearchTextField;
    -[UIView intrinsicContentSize](&v12, sel_intrinsicContentSize);
    v5 = v8;
    v4 = v9;
  }
  v10 = v5;
  v11 = v4;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)canBecomeFocused
{
  void *v2;
  char v3;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "searchBarTextFieldCanBecomeFocused");

  return v3;
}

- (BOOL)_hasCustomClearButtonImage
{
  return -[NSMutableDictionary count](self->_customClearButtons, "count") != 0;
}

- (void)_setSearchTextOffetValue:(id)a3
{
  id v5;
  void *v6;
  NSValue *searchTextOffsetValue;
  int v8;
  id v9;

  v5 = a3;
  v6 = v5;
  searchTextOffsetValue = self->_searchTextOffsetValue;
  v9 = v5;
  if (v5)
  {
    if (!searchTextOffsetValue)
      goto LABEL_7;
    v8 = objc_msgSend(v5, "isEqualToValue:");
    v6 = v9;
    if (!v8 || !self->_searchTextOffsetValue)
      goto LABEL_7;
  }
  else if (searchTextOffsetValue)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_searchTextOffsetValue, a3);
    -[UITextField setNeedsLayout](self, "setNeedsLayout");
    v6 = v9;
  }

}

- (NSValue)_searchTextOffsetValue
{
  return self->_searchTextOffsetValue;
}

- (BOOL)_shouldResignOnEditingDidEndOnExit
{
  return 0;
}

- (void)_updateColorForMagnifyingGlass
{
  BOOL v3;
  _UISearchTextFieldVisualStyle *visualStyle;
  id v5;

  v3 = -[UISearchTextField _hasContent](self, "_hasContent");
  visualStyle = self->_visualStyle;
  if (v3)
    -[_UISearchTextFieldVisualStyle filledLeftViewTintColor](visualStyle, "filledLeftViewTintColor");
  else
    -[_UISearchTextFieldVisualStyle defaultLeftViewTintColor](visualStyle, "defaultLeftViewTintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](self->_defaultLeftView, "setTintColor:", v5);

}

- (BOOL)_isEditingOrHasContent
{
  return -[UITextField isEditing](self, "isEditing") || -[UISearchTextField _hasContent](self, "_hasContent");
}

- (CGSize)_clearButtonSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  -[NSMutableDictionary objectForKey:](self->_customClearButtons, "objectForKey:", &unk_1E1A96E70);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "size");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UISearchTextField;
    -[UISearchTextField _clearButtonSize](&v11, sel__clearButtonSize);
  }
  v7 = v5;
  v8 = v6;

  v9 = v7;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)_becomeFirstResponderWhenPossible
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  objc_super v14;

  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v4 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_9;
  v5 = WeakRetained;
  objc_msgSend(v5, "_searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend(v9, "isActive");

      if (!v11)
        goto LABEL_7;
    }
    else
    {

    }
LABEL_9:
    v14.receiver = self;
    v14.super_class = (Class)UISearchTextField;
    v12 = -[UIView _becomeFirstResponderWhenPossible](&v14, sel__becomeFirstResponderWhenPossible);
    goto LABEL_10;
  }
  v7 = v6;
  v8 = objc_msgSend(v6, "isActive");

  if ((v8 & 1) != 0)
    goto LABEL_9;
LABEL_7:
  v12 = 0;
LABEL_10:

  return v12;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  int v2;
  int v3;
  BOOL v4;
  id WeakRetained;
  char v6;
  int v7;

  if ((*(_BYTE *)&self->_searchBarTextFieldFlags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
    v6 = objc_msgSend(WeakRetained, "_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged");

    LOBYTE(v2) = v6;
  }
  else
  {
    v2 = dyld_program_sdk_at_least();
    if (v2)
    {
      if (_UIInternalPreferencesRevisionOnce != -1)
        dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
      v3 = _UIInternalPreferencesRevisionVar;
      if (_UIInternalPreferencesRevisionVar < 1
        || (v7 = _UIInternalPreference_UISearchTextFieldShouldSendContentChangeNotificationsForMarkedText,
            _UIInternalPreferencesRevisionVar == _UIInternalPreference_UISearchTextFieldShouldSendContentChangeNotificationsForMarkedText))
      {
        v4 = 1;
      }
      else
      {
        do
        {
          v4 = v3 >= v7;
          if (v3 < v7)
            break;
          _UIInternalPreferenceSync(v3, &_UIInternalPreference_UISearchTextFieldShouldSendContentChangeNotificationsForMarkedText, (uint64_t)CFSTR("UISearchTextFieldShouldSendContentChangeNotificationsForMarkedText"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          v7 = _UIInternalPreference_UISearchTextFieldShouldSendContentChangeNotificationsForMarkedText;
        }
        while (v3 != _UIInternalPreference_UISearchTextFieldShouldSendContentChangeNotificationsForMarkedText);
      }
      if (byte_1EDDA7DF4)
        LOBYTE(v2) = 1;
      else
        LOBYTE(v2) = v4;
    }
  }
  return v2;
}

- (CGRect)_suffixFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double MaxX;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  objc_super v18;
  CGRect v19;
  CGRect result;

  v18.receiver = self;
  v18.super_class = (Class)UISearchTextField;
  -[UITextField _suffixFrame](&v18, sel__suffixFrame);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[UIView bounds](self, "bounds");
  v17.receiver = self;
  v17.super_class = (Class)UISearchTextField;
  -[UITextField _availableTextRectForBounds:forEditing:](&v17, sel__availableTextRectForBounds_forEditing_, -[UITextField isEditing](self, "isEditing"), v9, v10, v11, v12);
  MaxX = CGRectGetMaxX(v19);
  v14 = v4;
  v15 = v6;
  v16 = v8;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = MaxX;
  return result;
}

- (int64_t)_suffixLabelTextAlignment
{
  return 2;
}

- (void)_highlightedDidChangeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISearchTextField;
  -[UITextField _highlightedDidChangeAnimated:](&v5, sel__highlightedDidChangeAnimated_);
  -[UISearchTextField __highlightedDidChangeAnimated:](self, "__highlightedDidChangeAnimated:", v3);
}

- (void)_applyHighlightedAnimated:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISearchTextField;
  -[UITextField _applyHighlightedAnimated:](&v5, sel__applyHighlightedAnimated_);
  -[UISearchTextField __highlightedDidChangeAnimated:](self, "__highlightedDidChangeAnimated:", v3);
}

- (void)__highlightedDidChangeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  double v6;
  _QWORD v7[5];
  BOOL v8;

  v3 = a3;
  v5 = -[UIControl isHighlighted](self, "isHighlighted");
  v6 = 0.3;
  if (!v3)
    v6 = 0.0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__UISearchTextField___highlightedDidChangeAnimated___block_invoke;
  v7[3] = &unk_1E16B1B78;
  v7[4] = self;
  v8 = v5;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v7, v6);
}

uint64_t __52__UISearchTextField___highlightedDidChangeAnimated___block_invoke(uint64_t a1)
{
  _BOOL8 v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setShowingTouch:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setShowingTouch:", *(unsigned __int8 *)(a1 + 40));
  v2 = (unint64_t)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "state") - 1) < 2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setShowingCursor:", v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setShowingCursor:", v2);
}

- (void)_hoverGestureChanged:(id)a3
{
  -[UISearchTextField _highlightedDidChangeAnimated:](self, "_highlightedDidChangeAnimated:", 1);
}

- (void)_clearBackgroundViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchTextField;
  -[UISearchTextField _clearBackgroundViews](&v3, sel__clearBackgroundViews);
  -[UISearchTextField _removeEffectsBackgroundViews](self, "_removeEffectsBackgroundViews");
}

- (void)_removeEffectsBackgroundViews
{
  _UISearchBarSearchFieldBackgroundView *effectBackgroundTop;
  _UISearchBarSearchFieldBackgroundView *effectBackgroundBottom;

  -[UIView removeFromSuperview](self->_effectBackgroundTop, "removeFromSuperview");
  effectBackgroundTop = self->_effectBackgroundTop;
  self->_effectBackgroundTop = 0;

  -[UIView removeFromSuperview](self->_effectBackgroundBottom, "removeFromSuperview");
  effectBackgroundBottom = self->_effectBackgroundBottom;
  self->_effectBackgroundBottom = 0;

}

- (void)_animateForFirstResponderChangeWithAnimations:(id)a3
{
  -[UISearchTextField _animateForFirstResponderChangeWithAnimations:completion:](self, "_animateForFirstResponderChangeWithAnimations:completion:", a3, 0);
}

- (void)_animateForFirstResponderChangeWithAnimations:(id)a3 completion:(id)a4
{
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, a3, a4, 0.25, 0.0);
}

void __42__UISearchTextField__becomeFirstResponder__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "_searchController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2
    && (objc_msgSend(*(id *)(a1 + 32), "_searchController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "_searchBarShouldFinalizeBecomingFirstResponder"),
        v3,
        !v4))
  {
    objc_msgSend(*(id *)(a1 + 40), "_setPreventSelectionViewActivation:", 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1105) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_clearBecomeFirstResponderWhenCapable");
    objc_msgSend(*(id *)(a1 + 40), "keyboardSceneDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_clearPreservedInputViewsWithRestorableResponder:", *(_QWORD *)(a1 + 40));

  }
  else if (objc_msgSend(*(id *)(a1 + 40), "_preventSelectionViewActivation"))
  {
    v7 = *(id *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__UISearchTextField__becomeFirstResponder__block_invoke_2;
    v8[3] = &unk_1E16B1B28;
    v8[4] = v7;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__UISearchTextField__becomeFirstResponder__block_invoke_3;
    v6[3] = &unk_1E16B3FD8;
    objc_msgSend(v7, "_animateForFirstResponderChangeWithAnimations:completion:", v8, v6);
    objc_msgSend(*(id *)(a1 + 40), "_setPreventSelectionViewActivation:", 0);
    objc_msgSend(*(id *)(a1 + 40), "__resumeBecomeFirstResponder");
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1105) = 1;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1104) = 0;
}

uint64_t __42__UISearchTextField__becomeFirstResponder__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutSubviews");
}

uint64_t __42__UISearchTextField__becomeFirstResponder__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateSelectionView");
}

uint64_t __42__UISearchTextField__becomeFirstResponder__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UISearchTextField;
  v3 = -[UITextField resignFirstResponder](&v12, sel_resignFirstResponder);
  if (v3)
  {
    if (self->_animatePlaceholderOnResignFirstResponder)
    {
      -[UISearchTextField text](self, "text");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "length");

      if (v5)
      {
        -[UISearchTextField textInputTraits](self, "textInputTraits");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = 0;
      }
      else
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __41__UISearchTextField_resignFirstResponder__block_invoke;
        v11[3] = &unk_1E16B1B28;
        v11[4] = self;
        -[UISearchTextField _animateForFirstResponderChangeWithAnimations:](self, "_animateForFirstResponderChangeWithAnimations:", v11);
        self->_animatePlaceholderOnResignFirstResponder = 0;
        -[UISearchTextField textInputTraits](self, "textInputTraits");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = 1;
      }
      objc_msgSend(v6, "setDeferBecomingResponder:", v8);

    }
    else if (-[UISearchTextField _shouldHideMagnifyingGlassWhenEditingOrHasContent](self, "_shouldHideMagnifyingGlassWhenEditingOrHasContent")&& !-[UISearchTextField _hasContent](self, "_hasContent"))
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __41__UISearchTextField_resignFirstResponder__block_invoke_2;
      v10[3] = &unk_1E16B1B28;
      v10[4] = self;
      -[UISearchTextField _animateForFirstResponderChangeWithAnimations:](self, "_animateForFirstResponderChangeWithAnimations:", v10);
    }
    *((_BYTE *)&self->_searchBarTextFieldFlags + 12) &= ~8u;
  }
  return v3;
}

uint64_t __41__UISearchTextField_resignFirstResponder__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutSubviews");
}

uint64_t __41__UISearchTextField_resignFirstResponder__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)canResignFirstResponder
{
  unsigned int v3;
  id WeakRetained;
  void *v5;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  v3 = -[UITextField canResignFirstResponder](&v8, sel_canResignFirstResponder);
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v5 = WeakRetained;
  if (v3)
    v6 = WeakRetained == 0;
  else
    v6 = 1;
  if (!v6)
    v3 = objc_msgSend(WeakRetained, "_transplanting") ^ 1;

  return v3;
}

- (BOOL)_needsDelayedSearchControllerPresentation
{
  return (*((unsigned __int8 *)&self->_searchBarTextFieldFlags + 12) >> 3) & 1;
}

- (void)_resetNeedsDelayedSearchControllerPresentation
{
  *((_BYTE *)&self->_searchBarTextFieldFlags + 12) &= ~8u;
}

- (BOOL)_delegateShouldEndEditing
{
  unsigned int v3;
  UISearchBar **p_searchBar;
  id WeakRetained;
  void *v6;
  BOOL v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UISearchTextField;
  v3 = -[UITextField _delegateShouldEndEditing](&v10, sel__delegateShouldEndEditing);
  p_searchBar = &self->_searchBar;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v6 = WeakRetained;
  if (v3)
    v7 = WeakRetained == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = objc_loadWeakRetained((id *)p_searchBar);
    LOBYTE(v3) = objc_msgSend(v8, "_searchBarTextFieldShouldEndEditing");

  }
  return v3;
}

- (BOOL)_delegateShouldClear
{
  unsigned int v3;
  id WeakRetained;
  void *v5;
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  v3 = -[UITextField _delegateShouldClear](&v8, sel__delegateShouldClear);
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v5 = WeakRetained;
  if (v3)
    v6 = WeakRetained == 0;
  else
    v6 = 1;
  if (!v6)
    LOBYTE(v3) = objc_msgSend(WeakRetained, "_searchBarTextFieldShouldClear");

  return v3;
}

- (BOOL)_delegateShouldChangeCharactersInTextStorageRange:(_NSRange)a3 replacementString:(id)a4 delegateCares:(BOOL *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  unsigned int v10;
  id WeakRetained;
  void *v12;
  BOOL v13;
  objc_super v15;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UISearchTextField;
  v10 = -[UITextField _delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:](&v15, sel__delegateShouldChangeCharactersInTextStorageRange_replacementString_delegateCares_, location, length, v9, a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v12 = WeakRetained;
  if (v10)
    v13 = WeakRetained == 0;
  else
    v13 = 1;
  if (!v13)
    LOBYTE(v10) = objc_msgSend(WeakRetained, "_searchBarTextFieldShouldChangeCharactersInRange:replacementString:", location, length, v9);

  return v10;
}

- (void)_setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  double v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  BOOL v22;
  BOOL v23;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UISearchTextField;
  -[UITextField _setEnabled:animated:](&v24, sel__setEnabled_animated_);
  -[UITextField _placeholderLabel](self, "_placeholderLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchTextField _placeholderColor](self, "_placeholderColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v8);

  v9 = 0.35;
  if (v5)
    v9 = 1.0;
  objc_msgSend(v7, "setAlpha:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
      objc_msgSend(WeakRetained, "_textColor");
    else
      -[UISearchTextField _placeholderColor](self, "_placeholderColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTextColor:](self, "setTextColor:", v12);

  }
  -[UITextField rightView](self, "rightView");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[UITextField rightView](self, "rightView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UITextField rightView](self, "rightView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setEnabled:", v5);

    }
  }
  -[UITextField textStorage](self, "textStorage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)off_1E1678C48;
  v20 = objc_msgSend(v18, "length");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __42__UISearchTextField__setEnabled_animated___block_invoke;
  v21[3] = &__block_descriptor_34_e53_v40__0___UISearchTokenAttachment_8__NSRange_QQ_16_B32l;
  v22 = v5;
  v23 = a4;
  objc_msgSend(v18, "enumerateAttribute:inRange:options:usingBlock:", v19, 0, v20, 0, v21);

}

void __42__UISearchTextField__setEnabled_animated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "_viewProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setEnabled:animated:", *(unsigned __int8 *)(a1 + 32), *(unsigned __int8 *)(a1 + 33));
  }

}

- (void)_setBottomEffectBackgroundVisible:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[_UISearchBarSearchFieldBackgroundView searchBarStyle](self->_effectBackgroundBottom, "searchBarStyle") == 2)
    -[UIView setHidden:](self->_effectBackgroundBottom, "setHidden:", !v3);
}

- (void)_defaultInsertTextSuggestion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UISearchTextField textualRange](self, "textualRange");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UISearchTextField replaceRange:withText:](self, "replaceRange:withText:", v6, v5);
}

- (void)insertTextSuggestion:(id)a3
{
  UISearchBar **p_searchBar;
  id v5;
  id WeakRetained;
  id v7;

  p_searchBar = &self->_searchBar;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_searchBar);
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "insertTextSuggestion:", v5);
  else
    -[UISearchTextField _defaultInsertTextSuggestion:](self, "_defaultInsertTextSuggestion:", v5);

}

- (BOOL)_shouldDetermineInterfaceStyleTextColor
{
  return 0;
}

- (BOOL)_textShouldFillFieldEditorHeight
{
  return 0;
}

- (BOOL)_shouldOverrideEditingFont
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchTextField;
  return -[UITextField _shouldOverrideEditingFont](&v3, sel__shouldOverrideEditingFont);
}

- (void)_setAlwaysHidesMagnifyingGlassForAccessibilityContentSizeCategory:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)&self->_searchBarTextFieldFlags + 12);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 4;
    else
      v4 = 0;
    *((_BYTE *)&self->_searchBarTextFieldFlags + 12) = v3 & 0xFB | v4;
    -[UISearchTextField _updateLeftViewForMagnifyingGlassImage](self, "_updateLeftViewForMagnifyingGlassImage");
  }
}

- (void)didAddTextAttachmentViews:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_self();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          -[UISearchTextField _willAddTokenLayoutView:](self, "_willAddTokenLayoutView:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)didRemoveTextAttachmentViews:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_self();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          -[UISearchTextField _didRemoveTokenLayoutView:](self, "_didRemoveTokenLayoutView:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)didLayoutTextAttachmentView:(id)a3 inFragmentRect:(CGRect)a4
{
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
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
  id v31;

  v31 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  v7 = v31;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v31;
    if (-[UITextField _fieldEditorAttached](self, "_fieldEditorAttached"))
    {
      -[UITextField _fieldEditor](self, "_fieldEditor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      -[UITextField _fieldEditor](self, "_fieldEditor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "convertRect:fromView:", v18, v11, v13, v15, v17);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;

    }
    else
    {
      -[UITextField editRect](self, "editRect");
      objc_msgSend(v8, "convertRect:fromView:", self);
      v20 = v27;
      v22 = v28;
      v24 = v29;
      v26 = v30;
    }
    objc_msgSend(v8, "updateMaskLayerForVisibleRect:", v20, v22, v24, v26);

    v7 = v31;
  }

}

- (BOOL)_shouldAppendTextInViewDescription
{
  return self->_tokenCounter != 0;
}

void __27__UISearchTextField_tokens__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1136), "tokenAtCharacterIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_newAttributedStringWithToken:(id)a3
{
  id v4;
  _UISearchTokenAttachment *v5;
  void *v6;
  void **v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_UISearchTokenAttachment initWithToken:]([_UISearchTokenAttachment alloc], "initWithToken:", v4);

  if (-[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v6;
    v7 = (void **)v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v6;
    v7 = &v13;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "addAttribute:value:range:", *(_QWORD *)off_1E16792C0, v8, 0, 1);
  v11 = (void *)objc_msgSend(v10, "copy");

  return v11;
}

- (void)setTokens:(NSArray *)tokens
{
  NSArray *v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger length;
  NSArray *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UISearchTextField *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id WeakRetained;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  UISearchTextField *v27;
  NSArray *v28;
  NSRange v29;
  NSRange v30;

  v4 = tokens;
  v5 = -[UIResponder _selectedNSRange](self, "_selectedNSRange");
  v7 = v6;
  v8 = -[_UISearchBarTextFieldTokenCounter characterRangeOfAllTokens](self->_tokenCounter, "characterRangeOfAllTokens");
  v10 = v9;
  v29.location = v5;
  v29.length = v7;
  v30.location = v8;
  v30.length = v10;
  length = NSIntersectionRange(v29, v30).length;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __31__UISearchTextField_setTokens___block_invoke;
  v26 = &unk_1E16B1B50;
  v27 = self;
  v12 = v4;
  v28 = v12;
  v13 = _Block_copy(&v23);
  v14 = v13;
  if (length)
  {
    (*((void (**)(void *))v13 + 2))(v13);
    v15 = -[_UISearchBarTextFieldTokenCounter characterRangeOfAllTokens](self->_tokenCounter, "characterRangeOfAllTokens", v23, v24, v25, v26, v27);
    v16 = self;
    v18 = v17;
  }
  else
  {
    if (v5 >= v8 + v10)
    {
      v20 = -[NSArray count](v12, "count", v23, v24, v25, v26, v27);
      -[_UISearchBarTextFieldTokenCounter tokenCharacterIndexes](self->_tokenCounter, "tokenCharacterIndexes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      PreservingSelectionForTokenChange(self, 0, v20 - objc_msgSend(v19, "count"), v14);
      goto LABEL_7;
    }
    (*((void (**)(void *))v13 + 2))(v13);
    v15 = -[_UISearchBarTextFieldTokenCounter characterRangeOfTextAfterLastToken](self->_tokenCounter, "characterRangeOfTextAfterLastToken", v23, v24, v25, v26, v27);
    v16 = self;
    v18 = 0;
  }
  -[UIResponder _textRangeFromNSRange:](v16, "_textRangeFromNSRange:", v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setSelectedTextRange:](self, "setSelectedTextRange:", v19);
LABEL_7:

  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  objc_msgSend(WeakRetained, "_searchController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchController __searchTextFieldDidSetOrInsertTokens:]((uint64_t)v22, self);

}

void __31__UISearchTextField_setTokens___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  uint64_t v10;

  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __31__UISearchTextField_setTokens___block_invoke_2;
  v8 = &unk_1E16B6830;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v4;
  ManipulateTextStorage(v2, 1, &v5);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout", v5, v6, v7, v8);

}

void __31__UISearchTextField_setTokens___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(*(id *)(a1 + 40), "_newAttributedStringWithToken:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        objc_msgSend(v4, "appendAttributedString:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1136), "characterRangeOfAllTokens");
  objc_msgSend(v3, "replaceCharactersInRange:withAttributedString:", v11, v12, v4);

}

- (void)insertToken:(UISearchToken *)token atIndex:(NSInteger)tokenIndex
{
  UISearchToken *v7;
  unint64_t v8;
  UISearchToken *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  _QWORD v13[5];
  UISearchToken *v14;
  unint64_t v15;

  v7 = token;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISearchTextField.m"), 1898, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token != nil"));

  }
  v8 = -[_UISearchBarTextFieldTokenCounter characterIndexForInsertingTokenAtIndex:](self->_tokenCounter, "characterIndexForInsertingTokenAtIndex:", tokenIndex);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__UISearchTextField_insertToken_atIndex___block_invoke;
  v13[3] = &unk_1E16B1C28;
  v13[4] = self;
  v14 = v7;
  v15 = v8;
  v9 = v7;
  PreservingSelectionForTokenChange(self, v8, 1, v13);
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  objc_msgSend(WeakRetained, "_searchController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchController __searchTextFieldDidSetOrInsertTokens:]((uint64_t)v11, self);

}

void __41__UISearchTextField_insertToken_atIndex___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  void *v6;
  id v7;
  uint64_t v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__UISearchTextField_insertToken_atIndex___block_invoke_2;
  v5[3] = &unk_1E16B6858;
  v2 = (void *)a1[5];
  v6 = (void *)a1[4];
  v3 = v2;
  v4 = a1[6];
  v7 = v3;
  v8 = v4;
  ManipulateTextStorage(v6, 1, v5);

}

void __41__UISearchTextField_insertToken_atIndex___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  v6 = (id)objc_msgSend(v3, "_newAttributedStringWithToken:", v4);
  objc_msgSend(v5, "insertAttributedString:atIndex:", v6, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)removeTokenAtIndex:(NSInteger)tokenIndex
{
  unint64_t v5;
  void *v7;
  _QWORD v8[6];

  if (tokenIndex < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISearchTextField.m"), 1913, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tokenIndex >= 0"));

  }
  v5 = -[_UISearchBarTextFieldTokenCounter characterIndexForSelectingOrRemovingTokenAtIndex:](self->_tokenCounter, "characterIndexForSelectingOrRemovingTokenAtIndex:", tokenIndex);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__UISearchTextField_removeTokenAtIndex___block_invoke;
  v8[3] = &unk_1E16B1888;
  v8[4] = self;
  v8[5] = v5;
  PreservingSelectionForTokenChange(self, v5, -1, v8);
}

void __40__UISearchTextField_removeTokenAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  void *v3;
  uint64_t v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__UISearchTextField_removeTokenAtIndex___block_invoke_2;
  v2[3] = &unk_1E16B6880;
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  v4 = v1;
  ManipulateTextStorage(v3, 1, v2);
}

uint64_t __40__UISearchTextField_removeTokenAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "replaceCharactersInRange:withString:", *(_QWORD *)(a1 + 40), 1, &stru_1E16EDF20);
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (UITextPosition)positionOfTokenAtIndex:(NSInteger)tokenIndex
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  if (tokenIndex < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISearchTextField.m"), 1926, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tokenIndex >= 0"));

  }
  -[_UISearchBarTextFieldTokenCounter tokenCharacterIndexes](self->_tokenCounter, "tokenCharacterIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (tokenIndex < 0 || v6 <= tokenIndex)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Token index %ld out of range [0, %lu)"), tokenIndex, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  -[UITextField beginningOfDocument](self, "beginningOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField positionFromPosition:offset:](self, "positionFromPosition:offset:", v7, -[_UISearchBarTextFieldTokenCounter characterIndexForSelectingOrRemovingTokenAtIndex:](self->_tokenCounter, "characterIndexForSelectingOrRemovingTokenAtIndex:", tokenIndex));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextPosition *)v8;
}

- (NSArray)tokensInRange:(UITextRange *)textRange
{
  UITextRange *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  UISearchTextField *v17;

  v5 = textRange;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISearchTextField.m"), 1938, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("textRange != nil"));

  }
  v6 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v5);
  v8 = v7;
  v9 = (void *)objc_opt_new();
  -[_UISearchBarTextFieldTokenCounter tokenCharacterIndexes](self->_tokenCounter, "tokenCharacterIndexes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __35__UISearchTextField_tokensInRange___block_invoke;
  v15[3] = &unk_1E16B2978;
  v16 = v9;
  v17 = self;
  v11 = v9;
  objc_msgSend(v10, "enumerateIndexesInRange:options:usingBlock:", v6, v8, 0, v15);

  v12 = (void *)objc_msgSend(v11, "copy");
  return (NSArray *)v12;
}

void __35__UISearchTextField_tokensInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1136), "tokenAtCharacterIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)replaceTextualPortionOfRange:(UITextRange *)textRange withToken:(UISearchToken *)token atIndex:(NSUInteger)tokenIndex
{
  UITextRange *v9;
  UISearchToken *v10;
  UISearchToken *v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSRange v16;
  unint64_t v18;
  uint64_t *v19;
  void *v20;
  NSUInteger v21;
  NSUInteger length;
  void *v23;
  void *v24;
  _QWORD v25[5];
  UISearchToken *v26;
  uint64_t *v27;
  NSRange v28;
  NSUInteger v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  NSRange v35;
  NSRange v36;
  NSRange v37;

  v9 = textRange;
  v10 = token;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISearchTextField.m"), 1956, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("textRange != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISearchTextField.m"), 1957, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token != nil"));

LABEL_3:
  v12 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v9);
  v14 = v13;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3010000000;
  v33 = &unk_18685B0AF;
  v34 = xmmword_1866794A0;
  v36.location = -[_UISearchBarTextFieldTokenCounter characterRangeOfTextAfterLastToken](self->_tokenCounter, "characterRangeOfTextAfterLastToken");
  v36.length = v15;
  v35.location = v12;
  v35.length = v14;
  v16 = NSIntersectionRange(v35, v36);
  if (v16.location == 0x7FFFFFFFFFFFFFFFLL || v16.length == 0)
  {
    -[UISearchTextField insertToken:atIndex:](self, "insertToken:atIndex:", v11, tokenIndex);
    v18 = -[_UISearchBarTextFieldTokenCounter characterIndexForSelectingOrRemovingTokenAtIndex:](self->_tokenCounter, "characterIndexForSelectingOrRemovingTokenAtIndex:", tokenIndex);
    v19 = v31;
    v31[4] = v18;
  }
  else
  {
    if (-[UITextField hasMarkedText](self, "hasMarkedText"))
    {
      -[UITextField markedTextRange](self, "markedTextRange");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37.location = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v20);
      v37.length = v21;
      length = NSIntersectionRange(v16, v37).length;

      if (length)
        -[UITextField unmarkText](self, "unmarkText");
    }
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __68__UISearchTextField_replaceTextualPortionOfRange_withToken_atIndex___block_invoke;
    v25[3] = &unk_1E16B68A8;
    v28 = v16;
    v25[4] = self;
    v29 = tokenIndex;
    v26 = v11;
    v27 = &v30;
    ManipulateTextStorage(self, 0, v25);

    v19 = v31;
    v18 = v31[4];
  }
  -[UITextField setSelectionRange:](self, "setSelectionRange:", v18, v19[5]);
  _Block_object_dispose(&v30, 8);

}

void __68__UISearchTextField_replaceTextualPortionOfRange_withToken_atIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = a2;
  objc_msgSend(v5, "replaceCharactersInRange:withString:", v3, v4, &stru_1E16EDF20);
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "_newAttributedStringWithToken:", *(_QWORD *)(a1 + 40));
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "characterIndexForInsertingTokenAtIndex:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v5, "insertAttributedString:atIndex:", v7, v6);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v6;
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");

}

- (UIColor)_tokenForegroundColor
{
  UIColor *tokenForegroundColor;
  UIColor *v3;
  void *v4;

  tokenForegroundColor = self->_tokenForegroundColor;
  if (tokenForegroundColor)
  {
    v3 = tokenForegroundColor;
  }
  else
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UISearchAtomView _defaultAtomForegroundColorForTraitCollection:](_UISearchAtomView, "_defaultAtomForegroundColorForTraitCollection:", v4);
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)selectedTokens
{
  void *v3;
  void *v4;

  -[UITextField selectedTextRange](self, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchTextField tokensInRange:](self, "tokensInRange:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)allowsCopyingTokens
{
  return *((_BYTE *)&self->_searchBarTextFieldFlags + 12) & 1;
}

- (BOOL)allowsDeletingTokens
{
  return (*((unsigned __int8 *)&self->_searchBarTextFieldFlags + 12) >> 1) & 1;
}

- (void)setAllowsDeletingTokens:(BOOL)allowsDeletingTokens
{
  char v3;

  if (allowsDeletingTokens)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)&self->_searchBarTextFieldFlags + 12) = *((_BYTE *)&self->_searchBarTextFieldFlags + 12) & 0xFD | v3;
}

- (void)_willAddTokenLayoutView:(id)a3
{
  NSHashTable *knownTokenLayoutViews;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  knownTokenLayoutViews = self->_knownTokenLayoutViews;
  v5 = a3;
  if (!-[NSHashTable count](knownTokenLayoutViews, "count"))
  {
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_addScrollViewScrollObserver:", self);

  }
  objc_msgSend(v5, "delegateView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAtomBackgroundColor:", self->_tokenBackgroundColor);
  objc_msgSend(v10, "_setAtomForegroundColor:", self->_tokenForegroundColor);
  -[UITextField font](self, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAtomFont:", v7);

  -[UIImageView _overridingSymbolConfiguration](self->_defaultLeftView, "_overridingSymbolConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setOverridingSymbolConfiguration:", v8);

  -[NSHashTable addObject:](self->_knownTokenLayoutViews, "addObject:", v5);
  objc_msgSend(v5, "setEnabled:", -[UIControl isEnabled](self, "isEnabled"));

}

- (void)_didRemoveTokenLayoutView:(id)a3
{
  id v4;

  -[NSHashTable removeObject:](self->_knownTokenLayoutViews, "removeObject:", a3);
  if (!-[NSHashTable count](self->_knownTokenLayoutViews, "count"))
  {
    -[UITextField _fieldEditor](self, "_fieldEditor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_removeScrollViewScrollObserver:", self);

  }
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  id v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UITextField _fieldEditor](self, "_fieldEditor");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_knownTokenLayoutViews;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          -[UITextField editRect](self, "editRect", (_QWORD)v12);
          objc_msgSend(v11, "convertRect:fromView:", self);
          objc_msgSend(v11, "updateMaskLayerForVisibleRect:");
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (unint64_t)_characterIndexForTokenTapGestureRecognizer
{
  UITapGestureRecognizer *tokenTapGestureRecognizer;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  CGPoint v25;
  CGRect v26;
  CGRect v27;

  tokenTapGestureRecognizer = self->_tokenTapGestureRecognizer;
  -[UITextField _textCanvasView](self, "_textCanvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITapGestureRecognizer locationInView:](tokenTapGestureRecognizer, "locationInView:", v4);
  v6 = v5;
  v8 = v7;

  -[UITextField textContainerOrigin](self, "textContainerOrigin");
  v10 = v9;
  v12 = v11;
  v13 = v6 - v9;
  v14 = v8 - v11;
  -[UITextField textContainer](self, "textContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField textLayoutController](self, "textLayoutController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextLayoutControllerBase nearestTextRangeAtPoint:inContainer:](v16, (uint64_t)v15, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "boundingRectForRange:", v17);
  v27 = CGRectOffset(v26, -v10, -v12);
  v27.origin.y = v27.origin.y + -5000.0;
  v27.size.height = v27.size.height + 10000.0;
  v25.x = v13;
  v25.y = v14;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  if (CGRectContainsPoint(v27, v25))
  {
    objc_msgSend(v16, "beginningOfDocument");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "start");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v16, "offsetFromPosition:toPosition:", v19, v20);

    -[UITextField textStorage](self, "textStorage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678C48, v21, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v21;

  }
  return v18;
}

- (void)_tokenTapGestureRecognized
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[UISearchTextField _characterIndexForTokenTapGestureRecognizer](self, "_characterIndexForTokenTapGestureRecognizer");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = v3;
    if (!-[UIView isFirstResponder](self, "isFirstResponder"))
      -[UISearchTextField becomeFirstResponder](self, "becomeFirstResponder");
    -[UITextField selectedTextRange](self, "selectedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    if (v5
      && (objc_msgSend(v5, "isEmpty") & 1) == 0
      && (-[UIResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:", v4, 1),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = -[UIResponder _range:containsRange:](self, "_range:containsRange:", v10, v6),
          v6,
          v7))
    {
      -[UITextField interactionAssistant](self, "interactionAssistant");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "showSelectionCommands");

      -[UISearchTextField _activateSelectionView](self, "_activateSelectionView");
    }
    else
    {
      -[UIResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:", v4, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField setSelectedTextRange:](self, "setSelectedTextRange:", v9);

    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  objc_super v4;

  if (self->_tokenTapGestureRecognizer == a3)
    return -[UISearchTextField _characterIndexForTokenTapGestureRecognizer](self, "_characterIndexForTokenTapGestureRecognizer") != 0x7FFFFFFFFFFFFFFFLL;
  v4.receiver = self;
  v4.super_class = (Class)UISearchTextField;
  return -[UITextField gestureRecognizerShouldBegin:](&v4, sel_gestureRecognizerShouldBegin_);
}

- (_NSRange)_rangeForClearButton
{
  id v2;
  NSUInteger v3;
  objc_super v4;
  _NSRange result;

  if ((*((_BYTE *)&self->_searchBarTextFieldFlags + 12) & 2) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)UISearchTextField;
    v2 = -[UITextField _rangeForClearButton](&v4, sel__rangeForClearButton);
  }
  else
  {
    v2 = (id)-[UISearchTextField _rangeForSetText](self, "_rangeForSetText");
  }
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (_NSRange)_textRangeForTextStorageRange:(_NSRange)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[_UISearchBarTextFieldTokenCounter subrangeOfTextAfterLastTokenForCharacterRange:](self->_tokenCounter, "subrangeOfTextAfterLastTokenForCharacterRange:", a3.location, a3.length);
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)attributedTextInRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[UISearchTextField textualRange](self, "textualRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIResponder _intersectionOfRange:andRange:](self, "_intersectionOfRange:andRange:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v12.receiver = self;
    v12.super_class = (Class)UISearchTextField;
    -[UITextField attributedTextInRange:](&v12, sel_attributedTextInRange_, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Something is calling -attributedTextInRange: with a nil range. This argument is nonnull. Returning a default value.", buf, 2u);
      }

    }
    else
    {
      v9 = attributedTextInRange____s_category;
      if (!attributedTextInRange____s_category)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&attributedTextInRange____s_category);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Something is calling -attributedTextInRange: with a nil range. This argument is nonnull. Returning a default value.", buf, 2u);
      }
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
  }

  return v7;
}

- (id)attributedText
{
  void *v3;
  void *v4;

  -[UISearchTextField textualRange](self, "textualRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchTextField attributedTextInRange:](self, "attributedTextInRange:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  objc_super v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[UISearchTextField textualRange](self, "textualRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIResponder _intersectionOfRange:andRange:](self, "_intersectionOfRange:andRange:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13.receiver = self;
    v13.super_class = (Class)UISearchTextField;
    -[UITextField replaceRange:withText:](&v13, sel_replaceRange_withText_, v9, v7);

  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Something is calling -replaceRange:withText: with a nil range. This argument is nonnull. Doing nothing.", buf, 2u);
    }

  }
  else
  {
    v10 = replaceRange_withText____s_category;
    if (!replaceRange_withText____s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&replaceRange_withText____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Something is calling -replaceRange:withText: with a nil range. This argument is nonnull. Doing nothing.", buf, 2u);
    }
  }

}

- (void)replaceRangeWithTextWithoutClosingTyping:(id)a3 replacementText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  objc_super v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[UISearchTextField textualRange](self, "textualRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIResponder _intersectionOfRange:andRange:](self, "_intersectionOfRange:andRange:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13.receiver = self;
    v13.super_class = (Class)UISearchTextField;
    -[UITextField replaceRange:withText:](&v13, sel_replaceRange_withText_, v9, v7);

  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Something is calling -replaceRangeWithTextWithoutClosingTyping:replacementText: with a nil range. This argument is nonnull. Doing nothing.", buf, 2u);
    }

  }
  else
  {
    v10 = replaceRangeWithTextWithoutClosingTyping_replacementText____s_category;
    if (!replaceRangeWithTextWithoutClosingTyping_replacementText____s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&replaceRangeWithTextWithoutClosingTyping_replacementText____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Something is calling -replaceRangeWithTextWithoutClosingTyping:replacementText: with a nil range. This argument is nonnull. Doing nothing.", buf, 2u);
    }
  }

}

- (void)replaceRange:(id)a3 withAttributedText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  objc_super v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[UISearchTextField textualRange](self, "textualRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIResponder _intersectionOfRange:andRange:](self, "_intersectionOfRange:andRange:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13.receiver = self;
    v13.super_class = (Class)UISearchTextField;
    -[UITextField replaceRange:withAttributedText:](&v13, sel_replaceRange_withAttributedText_, v9, v7);

  }
  else if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Something is calling -replaceRange:withAttributedText: with a nil range. This argument is nonnull. Doing nothing.", buf, 2u);
    }

  }
  else
  {
    v10 = replaceRange_withAttributedText____s_category;
    if (!replaceRange_withAttributedText____s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&replaceRange_withAttributedText____s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Something is calling -replaceRange:withAttributedText: with a nil range. This argument is nonnull. Doing nothing.", buf, 2u);
    }
  }

}

- (void)_redirectSelectionToAvoidClobberingTokens
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[UITextField selectedTextRange](self, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    -[UISearchTextField textualRange](self, "textualRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[UIResponder _range:containsRange:](self, "_range:containsRange:", v4, v8))
    {
      -[UITextField endOfDocument](self, "endOfDocument");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField endOfDocument](self, "endOfDocument");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField setSelectedTextRange:](self, "setSelectedTextRange:", v7);

    }
    v3 = v8;
  }

}

- (void)insertText:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[UISearchTextField _redirectSelectionToAvoidClobberingTokens](self, "_redirectSelectionToAvoidClobberingTokens");
  v5.receiver = self;
  v5.super_class = (Class)UISearchTextField;
  -[UITextField insertText:](&v5, sel_insertText_, v4);

}

- (_NSRange)insertFilteredText:(id)a3
{
  id v4;
  id WeakRetained;
  UISearchTextField *v6;
  UISearchTextField *v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  objc_super v13;
  _NSRange result;

  v4 = a3;
  -[UISearchTextField _redirectSelectionToAvoidClobberingTokens](self, "_redirectSelectionToAvoidClobberingTokens");
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("\n")))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
    objc_msgSend(WeakRetained, "_searchController");
    v6 = (UISearchTextField *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = v6;
    else
      v7 = self;
    -[UISearchTextField setSearchSuggestions:](v7, "setSearchSuggestions:", 0);

  }
  v13.receiver = self;
  v13.super_class = (Class)UISearchTextField;
  v8 = -[UITextField insertFilteredText:](&v13, sel_insertFilteredText_, v4);
  v10 = v9;

  v11 = (NSUInteger)v8;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (void)insertAttributedText:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[UISearchTextField _redirectSelectionToAvoidClobberingTokens](self, "_redirectSelectionToAvoidClobberingTokens");
  v5.receiver = self;
  v5.super_class = (Class)UISearchTextField;
  -[UITextField insertAttributedText:](&v5, sel_insertAttributedText_, v4);

}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  objc_super v8;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  if (!-[UITextField hasMarkedText](self, "hasMarkedText") && objc_msgSend(v7, "length"))
    -[UISearchTextField _redirectSelectionToAvoidClobberingTokens](self, "_redirectSelectionToAvoidClobberingTokens");
  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  -[UITextField setMarkedText:selectedRange:](&v8, sel_setMarkedText_selectedRange_, v7, location, length);

}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  objc_super v8;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  if (!-[UITextField hasMarkedText](self, "hasMarkedText") && objc_msgSend(v7, "length"))
    -[UISearchTextField _redirectSelectionToAvoidClobberingTokens](self, "_redirectSelectionToAvoidClobberingTokens");
  v8.receiver = self;
  v8.super_class = (Class)UISearchTextField;
  -[UITextField setAttributedMarkedText:selectedRange:](&v8, sel_setAttributedMarkedText_selectedRange_, v7, location, length);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  $C6D5663E714698769DA9CC700B7B0763 *p_searchBarTextFieldFlags;
  _BOOL4 v8;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v20;
  char v21;
  BOOL v22;
  _BOOL4 v24;
  objc_super v25;
  objc_super v26;

  v6 = a4;
  p_searchBarTextFieldFlags = &self->_searchBarTextFieldFlags;
  if (self->_searchBarTextFieldFlags.delegateImplementsItemProviderForCopyingTokens)
    v8 = 0;
  else
    v8 = self->_searchBarTextFieldFlags.delegateImplementsUnderscoredItemProviderForCopyingTokens == 0;
  if (sel_cut_ == a3 || sel_copy_ == a3)
  {
    -[UITextField selectedTextRange](self, "selectedTextRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "start");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "end");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[UITextField offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v11, v12);

    if (!v13)
    {
      LOBYTE(self) = 0;
LABEL_27:

      goto LABEL_28;
    }
    -[UISearchTextField textualRange](self, "textualRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "start");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "end");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UITextField offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v15, v16) < 1)
    {
      LODWORD(self) = 0;
    }
    else
    {
      -[UISearchTextField textualRange](self, "textualRange");
      v24 = v8;
      v17 = v6;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(self) = -[UIResponder _range:intersectsRange:](self, "_range:intersectsRange:", v10, v18);

      v6 = v17;
      v8 = v24;
    }

    if (((self | v8) & 1) == 0)
    {
      v20 = *((unsigned __int8 *)p_searchBarTextFieldFlags + 12);
      v21 = v20 & 1;
      v22 = (~v20 & 3) == 0;
      if (sel_cut_ == a3)
        LOBYTE(self) = v22;
      else
        LOBYTE(self) = v21;
    }
LABEL_26:

    goto LABEL_27;
  }
  if (sel__define_ == a3 || sel__translate_ == a3)
  {
    -[UITextField selectedTextRange](self, "selectedTextRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchTextField textualRange](self, "textualRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIResponder _range:intersectsRange:](self, "_range:intersectsRange:", v10, v14))
    {
      v26.receiver = self;
      v26.super_class = (Class)UISearchTextField;
      LOBYTE(self) = -[UITextField canPerformAction:withSender:](&v26, sel_canPerformAction_withSender_, a3, v6);
    }
    else
    {
      LOBYTE(self) = 0;
    }
    goto LABEL_26;
  }
  v25.receiver = self;
  v25.super_class = (Class)UISearchTextField;
  LOBYTE(self) = -[UITextField canPerformAction:withSender:](&v25, sel_canPerformAction_withSender_, a3, v6);
LABEL_28:

  return (char)self;
}

- (void)_copySelectionPopulatingActuallyCopiedTokenCharacterIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  unint64_t v32;
  NSObject *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  uint8_t buf[16];

  v4 = a3;
  -[UISearchTextField textualRange](self, "textualRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField selectedTextRange](self, "selectedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIResponder _intersectionOfRange:andRange:](self, "_intersectionOfRange:andRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UITextField offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v8, v9);

  v34 = v4;
  if (v10 < 1)
  {
    v14 = 0;
  }
  else
  {
    -[UITextField _inputController](self, "_inputController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v7);
    objc_msgSend(v11, "_itemProviderForCopyingRange:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = objc_opt_new();
  v16 = (void *)v15;
  v17 = MEMORY[0x1E0C809B0];
  if (self->_searchBarTextFieldFlags.delegateImplementsItemProviderForCopyingTokens
    || self->_searchBarTextFieldFlags.delegateImplementsUnderscoredItemProviderForCopyingTokens)
  {
    -[UITextField delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISearchBarTextFieldTokenCounter tokenCharacterIndexes](self->_tokenCounter, "tokenCharacterIndexes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField selectedTextRange](self, "selectedTextRange");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v20);
    v23 = v22;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __81__UISearchTextField__copySelectionPopulatingActuallyCopiedTokenCharacterIndexes___block_invoke;
    v38[3] = &unk_1E16B68D0;
    v38[4] = self;
    v39 = v18;
    v40 = v16;
    v24 = v16;
    v25 = v34;
    v41 = v34;
    v26 = v18;
    objc_msgSend(v19, "enumerateIndexesInRange:options:usingBlock:", v21, v23, 0, v38);

    v17 = MEMORY[0x1E0C809B0];
  }
  else
  {
    v31 = (void *)v15;
    v32 = _copySelectionPopulatingActuallyCopiedTokenCharacterIndexes____s_category;
    if (!_copySelectionPopulatingActuallyCopiedTokenCharacterIndexes____s_category)
    {
      v32 = __UILogCategoryGetNode("Search", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v32, (unint64_t *)&_copySelectionPopulatingActuallyCopiedTokenCharacterIndexes____s_category);
    }
    v33 = *(NSObject **)(v32 + 8);
    v25 = v34;
    v24 = v31;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_ERROR, "Delegate agreed to copy a token but cannot provide an item provider for that token", buf, 2u);
    }
  }
  -[UISearchTextField _searchBar](self, "_searchBar");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "_dataOwnerForCopy");
  v35[0] = v17;
  v35[1] = 3221225472;
  v35[2] = __81__UISearchTextField__copySelectionPopulatingActuallyCopiedTokenCharacterIndexes___block_invoke_2;
  v35[3] = &unk_1E16B1B50;
  v36 = v24;
  v37 = v14;
  v29 = v14;
  v30 = v24;
  +[UIPasteboard _performAsDataOwner:block:](UIPasteboard, "_performAsDataOwner:block:", v28, v35);

}

void __81__UISearchTextField__copySelectionPopulatingActuallyCopiedTokenCharacterIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "tokenAtCharacterIndex:", a2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v9 = (id)v4;
  if (*(_DWORD *)(v5 + 1112))
  {
    objc_msgSend(*(id *)(a1 + 40), "searchTextField:itemProviderForCopyingToken:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!*(_DWORD *)(v5 + 1116))
    {
      v7 = 0;
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 40), "_searchTextField:itemProviderForCopyingToken:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "registeredTypeIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
      objc_msgSend(*(id *)(a1 + 56), "addIndex:", a2);
    }
  }
LABEL_9:

}

void __81__UISearchTextField__copySelectionPopulatingActuallyCopiedTokenCharacterIndexes___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v4, "arrayByAddingObject:");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = v4;
    }
    v9 = v5;
    +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItemProviders:", v9);

  }
  else if (v3)
  {
    v10[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setItemProviders:", v6);

  }
}

- (void)copy:(id)a3
{
  -[UISearchTextField _copySelectionPopulatingActuallyCopiedTokenCharacterIndexes:](self, "_copySelectionPopulatingActuallyCopiedTokenCharacterIndexes:", 0);
}

- (void)cut:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;

  -[UITextField selectedTextRange](self, "selectedTextRange", a3);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[UISearchTextField textualRange](self, "textualRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIResponder _range:intersectsRange:](self, "_range:intersectsRange:", v16, v4))
  {
    -[UIResponder _intersectionOfRange:andRange:](self, "_intersectionOfRange:andRange:", v16, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v5);
    if (!-[UISearchTextField _delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:](self, "_delegateShouldChangeCharactersInTextStorageRange:replacementString:delegateCares:", v6, v7, &stru_1E16EDF20, 0))goto LABEL_16;
  }
  else
  {
    v5 = 0;
  }
  v8 = (void *)objc_opt_new();
  -[UISearchTextField _copySelectionPopulatingActuallyCopiedTokenCharacterIndexes:](self, "_copySelectionPopulatingActuallyCopiedTokenCharacterIndexes:", v8);
  if ((*((_BYTE *)&self->_searchBarTextFieldFlags + 12) & 2) != 0
    && (self->_searchBarTextFieldFlags.delegateImplementsItemProviderForCopyingTokens
     || self->_searchBarTextFieldFlags.delegateImplementsUnderscoredItemProviderForCopyingTokens))
  {
    -[UITextField _inputController](self, "_inputController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v16;
    goto LABEL_11;
  }
  if (v5)
  {
    -[UITextField _inputController](self, "_inputController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v5;
LABEL_11:
    objc_msgSend(v9, "replaceRange:withText:", v11, &stru_1E16EDF20);

  }
  v12 = objc_msgSend(v8, "firstIndex");
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v12; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v8, "firstIndex"))
    {
      -[UITextField _inputController](self, "_inputController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:", i, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "replaceRange:withText:", v15, &stru_1E16EDF20);

      objc_msgSend(v8, "shiftIndexesStartingAtIndex:by:", i + 1, -1);
    }
  }

LABEL_16:
}

- (void)paste:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISearchTextField;
  -[UITextField paste:](&v3, sel_paste_, a3);
}

+ (Class)_textPasteItemClass
{
  return (Class)objc_opt_class();
}

- (void)_pasteSessionDidFinish:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UISearchBarTextFieldTokenCounter tokenCharacterIndexes](self->_tokenCounter, "tokenCharacterIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "originalItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "_searchTokenResult");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            -[UISearchTextField insertToken:atIndex:](self, "insertToken:atIndex:", v13, v6++);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v14.receiver = self;
  v14.super_class = (Class)UISearchTextField;
  -[UITextField _pasteSessionDidFinish:](&v14, sel__pasteSessionDidFinish_, v4);

}

- (void)deleteBackward
{
  void *v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSRange v11;
  objc_super v12;
  objc_super v13;
  objc_super v14;
  objc_super v15;
  objc_super v16;
  NSRange v17;
  NSRange v18;

  -[UITextField selectedTextRange](self, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v3);
    v6 = v5;
    -[UISearchTextField textualRange](self, "textualRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v7);
    v10 = v9;

    if (v6)
    {
      if (v4 >= v8)
      {
        -[UITextField deleteBackward](&v12, sel_deleteBackward, self, UISearchTextField, v13.receiver, v13.super_class, v14.receiver, v14.super_class, v15.receiver, v15.super_class, v16.receiver, v16.super_class);
      }
      else if ((*((_BYTE *)&self->_searchBarTextFieldFlags + 12) & 2) != 0)
      {
        -[UITextField deleteBackward](&v15, sel_deleteBackward, v12.receiver, v12.super_class, v13.receiver, v13.super_class, v14.receiver, v14.super_class, self, UISearchTextField, v16.receiver, v16.super_class);
      }
      else if (v4 + v6 > v8)
      {
        v17.location = v4;
        v17.length = v6;
        v18.location = v8;
        v18.length = v10;
        v11 = NSIntersectionRange(v17, v18);
        -[UITextField setSelectionRange:](self, "setSelectionRange:", v11.location, v11.length);
        -[UITextField deleteBackward](&v14, sel_deleteBackward, v12.receiver, v12.super_class, v13.receiver, v13.super_class, self, UISearchTextField, v15.receiver, v15.super_class, v16.receiver, v16.super_class);
      }
    }
    else if (v8 && v4 && v4 <= v8)
    {
      -[UITextField setSelectionRange:](self, "setSelectionRange:", v4 - 1, 1);
    }
    else
    {
      -[UITextField deleteBackward](&v13, sel_deleteBackward, v12.receiver, v12.super_class, self, UISearchTextField, v14.receiver, v14.super_class, v15.receiver, v15.super_class, v16.receiver, v16.super_class);
    }
  }
  else
  {
    -[UITextField deleteBackward](&v16, sel_deleteBackward, v12.receiver, v12.super_class, v13.receiver, v13.super_class, v14.receiver, v14.super_class, v15.receiver, v15.super_class, self, UISearchTextField);
  }

}

uint64_t __46__UISearchTextField__updateAtomViewSelection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  _QWORD v9[4];
  __int128 v10;
  __int128 v11;

  v3 = objc_msgSend(*(id *)(a1 + 32), "characterRangeForTextRange:", a2);
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)off_1E1678C48;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__UISearchTextField__updateAtomViewSelection___block_invoke_2;
  v9[3] = &unk_1E16B68F8;
  v6 = *(_OWORD *)(a1 + 64);
  v10 = *(_OWORD *)(a1 + 48);
  v11 = v6;
  return objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v5, v3, v7, 0, v9);
}

void __46__UISearchTextField__updateAtomViewSelection___block_invoke_2(_QWORD *a1, void *a2, unint64_t a3, uint64_t a4)
{
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  _BOOL4 v21;
  int v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v27 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v27;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v27, "_viewProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v12 = a1[6];
    if (a3 >= v12)
    {
      v13 = a1[7];
      if (a3 - v12 < v13)
      {
        v14 = a3 == v12;
        v15 = a3 + a4 == v13 + v12;
        v16 = (void *)a1[4];
        objc_msgSend(v16, "beginningOfDocument");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "positionFromPosition:offset:", v17, a3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v16, "baseWritingDirectionForPosition:inDirection:", v18, 0);

        if (v19 == 1)
          v20 = v15;
        else
          v20 = v14;
        if (v19 == 1)
          v21 = v14;
        else
          v21 = v15;
        v22 = v20 || v21;
        v23 = !v20;
        v24 = 4;
        if (v23)
          v24 = 0;
        v23 = !v21;
        v25 = 8;
        if (v23)
          v25 = 0;
        v26 = v24 | v25;
        if (v22)
          v11 = v26;
        else
          v11 = 1;
        objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v10);
      }
    }
    objc_msgSend(v10, "setSelectionStyle:animated:", v11, 0);

    v8 = v27;
  }

}

- (void)fieldEditorDidChangeSelection:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[UISearchTextField _updateAtomViewSelection:](self, "_updateAtomViewSelection:", -[UITextField _fieldEditorAttached](self, "_fieldEditorAttached"));
  v7.receiver = self;
  v7.super_class = (Class)UISearchTextField;
  -[UITextField fieldEditorDidChangeSelection:](&v7, sel_fieldEditorDidChangeSelection_, v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_searchFieldSelectionChanged");

}

- (void)_clearSearchSuggestionsIfNecessary
{
  void *v2;
  int v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  _BYTE *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((a1[1120] & 0x20) != 0)
    {
      objc_msgSend(a1, "_suggestionController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "hasVisibleMenu");

      if (v3)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
          {
            v7 = 138412290;
            v8 = a1;
            _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "UIKit inconsistency: Menu became visible with clear-search-suggestions still pending. Search suggestions will not be cleared. %@", (uint8_t *)&v7, 0xCu);
          }

        }
        else
        {
          v4 = _clearSearchSuggestionsIfNecessary___s_category;
          if (!_clearSearchSuggestionsIfNecessary___s_category)
          {
            v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v4, (unint64_t *)&_clearSearchSuggestionsIfNecessary___s_category);
          }
          v5 = *(NSObject **)(v4 + 8);
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            v7 = 138412290;
            v8 = a1;
            _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "UIKit inconsistency: Menu became visible with clear-search-suggestions still pending. Search suggestions will not be cleared. %@", (uint8_t *)&v7, 0xCu);
          }
        }
      }
      else
      {
        objc_msgSend(a1, "setSearchSuggestions:", 0);
      }
    }
    a1[1120] &= ~0x20u;
  }
}

- (void)_notifyDidEndEditing
{
  objc_super v3;

  -[UISearchTextField _clearSearchSuggestionsIfNecessary](self);
  v3.receiver = self;
  v3.super_class = (Class)UISearchTextField;
  -[UITextField _notifyDidEndEditing](&v3, sel__notifyDidEndEditing);
}

- (BOOL)allowsDraggingAttachments
{
  return 1;
}

- (id)_rangeOfCustomDraggableObjectsInRange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[_UISearchBarTextFieldTokenCounter characterRangeOfAllTokens](self->_tokenCounter, "characterRangeOfAllTokens");
  if (v6)
  {
    -[UIResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIResponder _intersectionOfRange:andRange:](self, "_intersectionOfRange:andRange:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_customDraggableObjectsForRange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v4 = a3;
  -[UITextField delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = -[UIResponder _nsrangeForTextRange:](self, "_nsrangeForTextRange:", v4);
    v8 = v7;
    v9 = (void *)objc_opt_new();
    -[_UISearchBarTextFieldTokenCounter tokenCharacterIndexes](self->_tokenCounter, "tokenCharacterIndexes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __53__UISearchTextField__customDraggableObjectsForRange___block_invoke;
    v15[3] = &unk_1E16B68D0;
    v15[4] = self;
    v16 = v5;
    v17 = v4;
    v11 = v9;
    v18 = v11;
    objc_msgSend(v10, "enumerateIndexesInRange:options:usingBlock:", v6, v8, 0, v15);

    v12 = v18;
    v13 = v11;

  }
  else
  {
    v13 = (id)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

void __53__UISearchTextField__customDraggableObjectsForRange___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1136), "tokenAtCharacterIndex:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "searchTextField:itemProviderForCopyingToken:", *(_QWORD *)(a1 + 32), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[UITextDraggableObject draggableObjectWithItemProvider:fromRange:](UITextDraggableObject, "draggableObjectWithItemProvider:fromRange:", v5, *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *(_QWORD *)off_1E1678C48, a2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "_viewProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__UISearchTextField__customDraggableObjectsForRange___block_invoke_2;
    v12[3] = &unk_1E16B6948;
    v13 = v10;
    v11 = v10;
    objc_msgSend(v6, "setTargetedPreviewProvider:", v12);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v6);

  }
}

uint64_t __53__UISearchTextField__customDraggableObjectsForRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "targetedDragPreviewInContainerView:", a2);
}

- (void)fieldEditorDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[UISearchTextField _clearSearchSuggestionsIfNecessary](self);
  v5.receiver = self;
  v5.super_class = (Class)UISearchTextField;
  -[UITextField fieldEditorDidChange:](&v5, sel_fieldEditorDidChange_, v4);

}

- (void)_setPreventSelectionViewActivation:(BOOL)a3
{
  self->__preventSelectionViewActivation = a3;
}

- (BOOL)_alwaysShowsClearButtonWhenEmpty
{
  return self->__alwaysShowsClearButtonWhenEmpty;
}

- (void)_setAlwaysShowsClearButtonWhenEmpty:(BOOL)a3
{
  self->__alwaysShowsClearButtonWhenEmpty = a3;
}

@end
