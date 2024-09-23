@implementation AcSearchResultTableViewCell

+ (double)childItemRowSpacing
{
  return 10.0;
}

+ (id)identifierWithChildItemsCount:(unint64_t)a3
{
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  id v9;
  id v10;

  v5 = objc_alloc((Class)NSMutableString);
  v6 = (objc_class *)objc_opt_class(a1);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v5, "initWithString:", v8);

  if (a3)
    objc_msgSend(v9, "appendString:", CFSTR("ChildItems"));
  v10 = objc_msgSend(v9, "copy");

  return v10;
}

- (double)estimatedChildItemsStackViewWidthWithContentViewWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = 0.0;
  if (!self->super._accessibilityEnabled)
  {
    -[AcSearchResultTableViewCell iconSize](self, "iconSize");
    v7 = v6;
    objc_msgSend((id)objc_opt_class(self), "childItemRowSpacing");
    v5 = v7 + v8;
  }
  -[_SearchResultTableViewCell leadingMargin](self, "leadingMargin");
  v10 = a3 - v9;
  -[AcSearchResultTableViewCell trailingMargin](self, "trailingMargin");
  return v10 - v11 - v5;
}

- (double)iconSize
{
  uint64_t v2;
  double result;

  v2 = sub_1002A8AA0(self);
  result = 30.0;
  if (v2 == 5)
    return 24.0;
  return result;
}

- (double)labelStackViewSpacing
{
  return 2.0;
}

- (double)trailingMargin
{
  uint64_t v2;
  double result;

  v2 = sub_1002A8AA0(self);
  result = 10.0;
  if (v2 == 5)
    return 16.0;
  return result;
}

- (AcSearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  AcSearchResultTableViewCell *v7;
  AcSearchResultTableViewCell *v8;
  id v9;
  double y;
  double width;
  double height;
  UIImageView *v13;
  UIImageView *imageView;
  void *v15;
  double v16;
  double v17;
  _SearchResultChildItemGridView *v18;
  _SearchResultChildItemGridView *childItemGrid;
  double v20;
  double v21;
  double v22;
  void *v23;
  objc_super v25;

  v6 = a4;
  v25.receiver = self;
  v25.super_class = (Class)AcSearchResultTableViewCell;
  v7 = -[_SearchResultTableViewCell initWithStyle:reuseIdentifier:](&v25, "initWithStyle:reuseIdentifier:", a3, v6);
  v8 = v7;
  if (v7)
  {
    -[AcSearchResultTableViewCell setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("AutocompleteSearchResultTableViewCell"));
    -[_SearchResultTableViewCell setDisplaysDistanceAsSnippetLocationAboveThreshold:](v8, "setDisplaysDistanceAsSnippetLocationAboveThreshold:", 0);
    v9 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v13 = (UIImageView *)objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageView = v8->_imageView;
    v8->_imageView = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIImageView setBackgroundColor:](v8->_imageView, "setBackgroundColor:", v15);

    -[AcSearchResultTableViewCell iconSize](v8, "iconSize");
    v17 = v16;
    -[UIImageView setClipsToBounds:](v8->_imageView, "setClipsToBounds:", 1);
    -[UIImageView setMinimumLayoutSize:](v8->_imageView, "setMinimumLayoutSize:", v17, v17);
    -[UIImageView setMaximumLayoutSize:](v8->_imageView, "setMaximumLayoutSize:", v17, v17);
    -[UIImageView setAccessibilityIdentifier:](v8->_imageView, "setAccessibilityIdentifier:", CFSTR("ImageView"));
    if (!v8->super._accessibilityEnabled)
      -[NUIContainerStackView insertArrangedSubview:atIndex:](v8->super._containerStackView, "insertArrangedSubview:atIndex:", v8->_imageView, 0);
    if (objc_msgSend(v6, "containsString:", CFSTR("ChildItems")))
    {
      v18 = -[_SearchResultChildItemGridView initWithFrame:]([_SearchResultChildItemGridView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      childItemGrid = v8->_childItemGrid;
      v8->_childItemGrid = v18;

      objc_msgSend((id)objc_opt_class(v8), "childItemRowSpacing");
      -[_SearchResultChildItemGridView setRowSpacing:](v8->_childItemGrid, "setRowSpacing:");
      -[_SearchResultChildItemGridView setColumnSpacing:](v8->_childItemGrid, "setColumnSpacing:", 10.0);
      -[_SearchResultChildItemGridView setHorizontalDistribution:](v8->_childItemGrid, "setHorizontalDistribution:", 1);
      -[_SearchResultChildItemGridView setVerticalDistribution:](v8->_childItemGrid, "setVerticalDistribution:", 1);
      -[_SearchResultChildItemGridView setHorizontalAlignment:](v8->_childItemGrid, "setHorizontalAlignment:", 0);
      -[_SearchResultChildItemGridView setVerticalAlignment:](v8->_childItemGrid, "setVerticalAlignment:", 0);
      -[AcSearchResultTableViewCell updateChildItemGridAlignmentRectInset](v8, "updateChildItemGridAlignmentRectInset");
      -[NUIContainerStackView addArrangedSubview:](v8->super._rootStackView, "addArrangedSubview:", v8->_childItemGrid);
      -[NUIContainerStackView setAlignment:forView:inAxis:](v8->super._rootStackView, "setAlignment:forView:inAxis:", 0, v8->_childItemGrid, 0);
      -[_SearchResultTableViewCell leadingMargin](v8, "leadingMargin");
      v21 = v20;
      -[AcSearchResultTableViewCell trailingMargin](v8, "trailingMargin");
      -[NUIContainerStackView setLayoutMargins:](v8->super._containerStackView, "setLayoutMargins:", 15.0, v21, 10.0, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v23, "addObserver:selector:name:object:", v8, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    }
    if (sub_1002A8AA0(v8) == 5)
    {
      -[AcSearchResultTableViewCell _maps_setTableViewCellBackgroundConfiguration](v8, "_maps_setTableViewCellBackgroundConfiguration");
      -[AcSearchResultTableViewCell _setHighlightedLabelColors](v8, "_setHighlightedLabelColors");
      -[UIImageView setCustomAlignmentRectInsets:](v8->_imageView, "setCustomAlignmentRectInsets:", -3.0, 0.0, 0.0, 0.0);
    }
  }

  return v8;
}

- (void)_setHighlightedLabelColors
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell _highlightedLabelColor](self, "_highlightedLabelColor"));
  -[UILabel setHighlightedTextColor:](self->super._titleLabel, "setHighlightedTextColor:", v3);
  -[UILabel setHighlightedTextColor:](self->super._secondLabel, "setHighlightedTextColor:", v3);
  -[UILabel setHighlightedTextColor:](self->super._thirdLabel, "setHighlightedTextColor:", v3);
  -[UILabel setHighlightedTextColor:](self->super._secondPartLabel, "setHighlightedTextColor:", v3);
  -[UILabel setHighlightedTextColor:](self->super._secondPartDelimiterLabel, "setHighlightedTextColor:", v3);
  -[UILabel setHighlightedTextColor:](self->super._transitDelimiterLabel, "setHighlightedTextColor:", v3);
  -[UILabel setHighlightedTextColor:](self->super._contextualInformationLabel, "setHighlightedTextColor:", v3);

}

- (id)_highlightedLabelColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.7));

  return v3;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  unsigned int v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v7 = -[AcSearchResultTableViewCell isSelected](self, "isSelected");
  v8.receiver = self;
  v8.super_class = (Class)AcSearchResultTableViewCell;
  -[AcSearchResultTableViewCell setSelected:animated:](&v8, "setSelected:animated:", v5, v4);
  if (v7 != v5)
    -[AcSearchResultTableViewCell updateContent](self, "updateContent");
}

- (int64_t)containerAlignment
{
  unint64_t v3;
  UIImageView *imageView;
  double v5;
  int64_t v6;

  if (sub_1002A8AA0(self) != 5)
    return 3;
  v3 = -[_SearchResultTableViewCell numberOfLines](self, "numberOfLines");
  imageView = self->_imageView;
  if (v3 == 1)
    v5 = -3.0;
  else
    v5 = 0.0;
  if (v3 == 1)
    v6 = 3;
  else
    v6 = 1;
  -[UIImageView setCustomAlignmentRectInsets:](imageView, "setCustomAlignmentRectInsets:", -3.0, 0.0, v5, 0.0);
  return v6;
}

- (void)updateChildItemGridAlignmentRectInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[AcSearchResultTableViewCell iconSize](self, "iconSize");
  v4 = v3;
  -[NUIContainerStackView spacing](self->super._containerStackView, "spacing");
  if (self->super._accessibilityEnabled || (v6 = v5, sub_1005EC254()) || sub_1002A8AA0(self) == 5)
    -[_SearchResultTableViewCell leadingMargin](self, "leadingMargin");
  else
    v7 = v4 + v6 * 2.0 + 6.5;
  v8 = -v7;
  -[AcSearchResultTableViewCell trailingMargin](self, "trailingMargin");
  -[_SearchResultChildItemGridView setCustomAlignmentRectInsets:](self->_childItemGrid, "setCustomAlignmentRectInsets:", -4.5, v8, -10.0, -(v9 + 6.5));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  NSInteger v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell reuseIdentifier](self, "reuseIdentifier"));
  if ((objc_msgSend(v6, "containsString:", CFSTR("ChildItems")) & 1) != 0
    || self->super._accessibilityEnabled)
  {

LABEL_4:
    -[NUIContainerStackView sizeThatFits:](self->super._rootStackView, "sizeThatFits:", width, height);
    goto LABEL_12;
  }
  v9 = sub_1002A8AA0(self);

  if (v9 == 5)
    goto LABEL_4;
  v10 = -[AcSearchResultTableViewCell autocompleteCellType](self, "autocompleteCellType");
  v11 = (void *)objc_opt_class(self);
  if (v10 == 3)
    objc_msgSend(v11, "estimatedTwoLinesCellHeight");
  else
    objc_msgSend(v11, "estimatedCellHeight");
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell placeContextViewModel](self, "placeContextViewModel"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->super._contextualInformationLabel, "font"));
    v16 = -[UILabel numberOfLines](self->super._contextualInformationLabel, "numberOfLines");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell traitCollection](self, "traitCollection"));
    objc_msgSend(v17, "displayScale");
    +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v15, v16);
    v19 = v18;

    -[AcSearchResultTableViewCell paddingAboveContextualInformationStackView](self, "paddingAboveContextualInformationStackView");
    v13 = v13 + v19 + v20;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  objc_msgSend(v21, "_mapkit_scaledValueForValue:", v13);
  v23 = v22;

  v7 = width;
  v8 = v23;
LABEL_12:
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setObject:(id)a3
{
  id v5;
  id v6;
  __objc2_prot *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;
  id v14;
  __objc2_prot *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  unsigned int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  MKLocalSearchCompletion *completion;
  uint64_t v29;
  MKLocalSearchCompletion *v30;
  id v31;
  id v32;

  v5 = a3;
  -[_SearchResultTableViewCell setPublisherResult:](self, "setPublisherResult:", 0);
  objc_storeStrong(&self->_object, a3);
  v6 = v5;
  v7 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
  v8 = objc_opt_class(HistoryEntryRecentsItem);
  v32 = v6;
  if ((objc_opt_isKindOfClass(v32, v8) & 1) != 0)
    v9 = v32;
  else
    v9 = 0;
  v10 = v9;

  if (v10
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "historyEntry")),
        v12 = objc_msgSend(v11, "conformsToProtocol:", v7),
        v11,
        v12))
  {
    v13 = v32;
  }
  else
  {
    v13 = 0;
  }

  if (v13)
  {
    v14 = v32;
    v15 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
    v16 = objc_opt_class(HistoryEntryRecentsItem);
    v17 = v14;
    if ((objc_opt_isKindOfClass(v17, v16) & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    if (v19
      && (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "historyEntry")),
          v21 = objc_msgSend(v20, "conformsToProtocol:", v15),
          v20,
          v21))
    {
      v22 = v17;
    }
    else
    {
      v22 = 0;
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "historyEntry"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "geoMapItem"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v24));

    -[_SearchResultTableViewCell setMapItem:](self, "setMapItem:", v25);
    goto LABEL_24;
  }
  v26 = objc_opt_class(MKLocalSearchCompletion);
  if ((objc_opt_isKindOfClass(v32, v26) & 1) != 0)
  {
    objc_storeStrong((id *)&self->_completion, a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion publisherResult](self->_completion, "publisherResult"));

    completion = self->_completion;
    if (v27)
    {
      v22 = (id)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion publisherResult](completion, "publisherResult"));
      -[_SearchResultTableViewCell setPublisherResult:](self, "setPublisherResult:", v22);
LABEL_24:

      goto LABEL_25;
    }
    v22 = (id)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion mapItem](completion, "mapItem"));
LABEL_23:
    -[_SearchResultTableViewCell setMapItem:](self, "setMapItem:", v22);
    goto LABEL_24;
  }
  v29 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v32, v29) & 1) != 0)
  {
    v30 = self->_completion;
    self->_completion = 0;
    v31 = v32;

    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "mapItem"));
    goto LABEL_23;
  }
LABEL_25:

}

- (BOOL)isCompletionTypeAddress
{
  return -[MKLocalSearchCompletion _type](self->_completion, "_type") == (id)2;
}

- (id)attributedTitleString
{
  void *v3;
  void *v4;
  MKLocalSearchCompletion *completion;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell titleRegularFont](self, "titleRegularFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell titleHighlightFont](self, "titleHighlightFont"));
  completion = self->_completion;
  if (completion)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion title](completion, "title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion titleHighlightRanges](self->_completion, "titleHighlightRanges"));
    if (sub_1002A8AA0(self) == 5)
    {
      if ((-[AcSearchResultTableViewCell isSelected](self, "isSelected") & 1) != 0)
        v8 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      else
        v8 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      v20 = (void *)v8;
      if ((-[AcSearchResultTableViewCell isSelected](self, "isSelected") & 1) != 0)
        v23 = objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell _highlightedLabelColor](self, "_highlightedLabelColor"));
      else
        v23 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v21 = (void *)v23;
      -[UILabel setTextColor:](self->super._titleLabel, "setTextColor:", v23);
      v22 = objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithText:highlightRanges:font:highlightedFont:highlightedTextColor:](NSAttributedString, "attributedStringWithText:highlightRanges:font:highlightedFont:highlightedTextColor:", v6, v7, v3, v4, v20));
    }
    else
    {
      if (!-[AcSearchResultTableViewCell shouldEnableGrayscaleHighlighting](self, "shouldEnableGrayscaleHighlighting"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithText:boldInRange:font:bold:](NSAttributedString, "attributedStringWithText:boldInRange:font:bold:", v6, v7, v3, v4));
LABEL_19:

        goto LABEL_22;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v22 = objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithText:highlightRanges:font:highlightedFont:highlightedTextColor:unhighlightedTextColor:](NSAttributedString, "attributedStringWithText:highlightRanges:font:highlightedFont:highlightedTextColor:unhighlightedTextColor:", v6, v7, v4, v4, v20, v21));
    }
    v11 = (void *)v22;

    goto LABEL_19;
  }
  if (sub_1002A8AA0(self) == 5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](self->super._titleLabel, "setTextColor:", v9);

  }
  v26.receiver = self;
  v26.super_class = (Class)AcSearchResultTableViewCell;
  v10 = -[_SearchResultTableViewCell attributedTitleString](&v26, "attributedTitleString");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell searchQuery](self, "searchQuery"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "string"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell searchQuery](self, "searchQuery"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_prefixMatchesForSearchString:", v14));

    LODWORD(v14) = -[AcSearchResultTableViewCell shouldEnableGrayscaleHighlighting](self, "shouldEnableGrayscaleHighlighting");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "string"));
    if ((_DWORD)v14)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v19 = objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithText:highlightRanges:font:highlightedFont:highlightedTextColor:unhighlightedTextColor:](NSAttributedString, "attributedStringWithText:highlightRanges:font:highlightedFont:highlightedTextColor:unhighlightedTextColor:", v16, v15, v4, v4, v17, v18));
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell titleRegularFont](self, "titleRegularFont"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell titleHighlightFont](self, "titleHighlightFont"));
      v19 = objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithText:boldInRange:font:bold:](NSAttributedString, "attributedStringWithText:boldInRange:font:bold:", v16, v15, v17, v18));
    }
    v24 = (void *)v19;

    v11 = v24;
  }
LABEL_22:

  return v11;
}

- (id)titleRegularFont
{
  id v2;
  void *v3;

  if (sub_1002A8AA0(self) == 5)
  {
    v2 = sub_10094EC28();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  }
  return v3;
}

- (id)titleHighlightFont
{
  id v2;
  void *v3;

  if (sub_1002A8AA0(self) == 5)
  {
    v2 = sub_10094EC28();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17SemiBold](UIFont, "system17SemiBold"));
  }
  return v3;
}

- (id)titleFont
{
  id v2;
  void *v3;

  if (sub_1002A8AA0(self) == 5)
  {
    v2 = sub_10094EC28();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17SemiBold](UIFont, "system17SemiBold"));
  }
  return v3;
}

- (id)secondaryLabelFont
{
  id v2;
  void *v3;

  if (sub_1002A8AA0(self) == 5)
  {
    v2 = sub_10094EC34();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  }
  return v3;
}

- (id)attributedFirstPartDetailString
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  __CFString *v23;
  id v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v30[2];
  _QWORD v31[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell autocompleteClientSourceString](self, "autocompleteClientSourceString"));
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v3, "addObject:", v4);
  if (-[AcSearchResultTableViewCell wantsTwoLineLayout](self, "wantsTwoLineLayout"))
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell publisherResult](self, "publisherResult"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell publisherResult](self, "publisherResult"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publisher"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "publisherAttribution"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subtitle"));

    if (objc_msgSend(v11, "length"))
      objc_msgSend(v3, "addObject:", v11);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell distanceString](self, "distanceString"));
    if (objc_msgSend(v11, "length"))
      objc_msgSend(v3, "addObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell shortenedAddressStringForMapItem:](self, "shortenedAddressStringForMapItem:", v12));

    if (-[AcSearchResultTableViewCell isCompletionTypeAddress](self, "isCompletionTypeAddress"))
    {
      v14 = objc_claimAutoreleasedReturnValue(-[MKLocalSearchCompletion subtitle](self->_completion, "subtitle"));

      v15 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v13 = (void *)v14;
      v6 = (void *)v15;
    }
    if (objc_msgSend(v13, "length"))
      objc_msgSend(v3, "addObject:", v13);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v17 = objc_msgSend(v16, "userInterfaceLayoutDirection");

  if (v17 == (id)1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reverseObjectEnumerator"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allObjects"));
    v20 = objc_msgSend(v19, "mutableCopy");

    v3 = v20;
  }
  v21 = objc_msgSend((id)objc_opt_class(self), "_delimiterString");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", v22));

  v24 = objc_alloc((Class)NSMutableAttributedString);
  if (v23)
    v25 = v23;
  else
    v25 = &stru_1011EB268;
  v30[0] = NSForegroundColorAttributeName;
  v30[1] = NSFontAttributeName;
  v31[0] = v6;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v31[1] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));
  v28 = objc_msgSend(v24, "initWithString:attributes:", v25, v27);

  self->super._onlyDistanceOrEmpty = 0;
  return v28;
}

- (id)attributedSecondPartDetailString
{
  void *v3;
  id v4;
  void *v6;
  __CFString *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[2];
  _QWORD v15[2];

  if (-[AcSearchResultTableViewCell isCompletionTypeAddress](self, "isCompletionTypeAddress")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell publisherResult](self, "publisherResult")),
        v3,
        v3))
  {
    v4 = 0;
  }
  else
  {
    if (-[AcSearchResultTableViewCell wantsTwoLineLayout](self, "wantsTwoLineLayout")
      && -[_SearchResultTableViewCell _showOpenStateLabel](self, "_showOpenStateLabel"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell hoursBuilderForSearchCell](self, "hoursBuilderForSearchCell"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedOpenState"));

    }
    else
    {
      v7 = 0;
    }
    v8 = objc_alloc((Class)NSAttributedString);
    if (v7)
      v9 = v7;
    else
      v9 = &stru_1011EB268;
    v14[0] = NSForegroundColorAttributeName;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v15[0] = v10;
    v14[1] = NSFontAttributeName;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
    v15[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
    v13 = objc_msgSend(v8, "initWithString:attributes:", v9, v12);
    v4 = objc_msgSend(v13, "copy");

  }
  return v4;
}

- (id)delimiterColor
{
  AcSearchResultTableViewCell *v3;

  if (-[AcSearchResultTableViewCell wantsTwoLineLayout](self, "wantsTwoLineLayout"))
    v3 = (AcSearchResultTableViewCell *)UIColor;
  else
    v3 = self;
  return (id)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell secondaryLabelColor](v3, "secondaryLabelColor"));
}

- (id)attributedSubtitleString
{
  void *v3;
  id v5;
  objc_super v6;

  if (-[AcSearchResultTableViewCell isCompletionTypeAddress](self, "isCompletionTypeAddress"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell publisherResult](self, "publisherResult"));

  if (v3)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)AcSearchResultTableViewCell;
  v5 = -[_SearchResultTableViewCell attributedSubtitleString](&v6, "attributedSubtitleString");
  return (id)objc_claimAutoreleasedReturnValue(v5);
}

- (id)distanceString
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;
  double v11;
  double v12;

  if (!-[AcSearchResultTableViewCell isCompletionTypeAddress](self, "isCompletionTypeAddress"))
    goto LABEL_4;
  v11 = 0.0;
  v12 = 0.0;
  if ((-[MKLocalSearchCompletion getCoordinate:](self->_completion, "getCoordinate:", &v11) & 1) == 0
    || (v3 = v11,
        v4 = v12,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell currentLocation](self, "currentLocation")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString distanceStringFromLocation:toCoordinate:withMapItem:showsDistance:onlyUseThreshold:maximumDistance:useShortThreshold:](NSString, "distanceStringFromLocation:toCoordinate:withMapItem:showsDistance:onlyUseThreshold:maximumDistance:useShortThreshold:", v5, v6, &self->super._showDistance, 1, 0, 1, v3, v4)), v6, v5, !v7))
  {
LABEL_4:
    v10.receiver = self;
    v10.super_class = (Class)AcSearchResultTableViewCell;
    v8 = -[_SearchResultTableViewCell distanceString](&v10, "distanceString");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }
  return v7;
}

- (void)didUpdateMapItem
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AcSearchResultTableViewCell;
  -[_SearchResultTableViewCell didUpdateMapItem](&v3, "didUpdateMapItem");
  ++self->_imageState;
  -[UIImageView setImage:](self->_imageView, "setImage:", 0);
  -[AcSearchResultTableViewCell loadPhoto](self, "loadPhoto");
  -[AcSearchResultTableViewCell updateChildItems](self, "updateChildItems");
}

- (void)didUpdatePublisherResult
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AcSearchResultTableViewCell;
  -[_SearchResultTableViewCell didUpdatePublisherResult](&v3, "didUpdatePublisherResult");
  -[AcSearchResultTableViewCell loadPhoto](self, "loadPhoto");
  -[AcSearchResultTableViewCell updateChildItems](self, "updateChildItems");
}

- (void)updateThirdLineVisibility
{
  void *v3;
  unsigned __int8 v4;

  if (-[AcSearchResultTableViewCell wantsTwoLineLayout](self, "wantsTwoLineLayout"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->super._secondLabel, "text"));
    if (objc_msgSend(v3, "length"))
    {

    }
    else
    {
      v4 = -[UILabel isHidden](self->super._thirdLabel, "isHidden");

      if ((v4 & 1) == 0)
        return;
    }
    -[UILabel setHidden:](self->super._thirdLabel, "setHidden:", 1);
  }
}

- (void)updateContent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AcSearchResultTableViewCell;
  -[_SearchResultTableViewCell updateContent](&v3, "updateContent");
  -[AcSearchResultTableViewCell updateThirdLineVisibility](self, "updateThirdLineVisibility");
  -[AcSearchResultTableViewCell _updateAccessoryTintColor](self, "_updateAccessoryTintColor");
}

- (void)_updateAccessoryTintColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (sub_1002A8AA0(self) == 5
    && (id)-[_SearchResultTableViewCell accessoryViewType](self, "accessoryViewType") == (id)1)
  {
    if (-[AcSearchResultTableViewCell isSelected](self, "isSelected"))
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell accessoryView](self, "accessoryView"));
      objc_msgSend(v3, "setTintColor:", v6);
    }
    else
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell accessoryView](self, "accessoryView"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "theme"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyColor"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell accessoryView](self, "accessoryView"));
      objc_msgSend(v5, "setTintColor:", v4);

    }
  }
}

- (void)setAccessoryViewType:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AcSearchResultTableViewCell;
  -[_SearchResultTableViewCell setAccessoryViewType:](&v4, "setAccessoryViewType:", a3);
  -[AcSearchResultTableViewCell _updateAccessoryTintColor](self, "_updateAccessoryTintColor");
}

- (void)setupPlaceContextContent:(id)a3
{
  NUIContainerStackView *labelStackView;
  objc_super v4;

  labelStackView = self->super._labelStackView;
  v4.receiver = self;
  v4.super_class = (Class)AcSearchResultTableViewCell;
  -[_SearchResultTableViewCell setupPlaceContextContent:inStackView:](&v4, "setupPlaceContextContent:inStackView:", a3, labelStackView);
}

- (void)loadPhoto
{
  int imageState;
  _QWORD *v4;
  void *v5;
  MKLocalSearchCompletion *v6;
  double v7;
  double v8;
  void *v9;
  int *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  _QWORD *v21;
  _QWORD v22[4];
  _QWORD *v23;
  _QWORD v24[5];
  int v25;

  imageState = self->_imageState;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10083C0F4;
  v24[3] = &unk_1011D8C50;
  v25 = imageState;
  v24[4] = self;
  v4 = objc_retainBlock(v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell mapItem](self, "mapItem"));
  v6 = self->_completion;
  -[AcSearchResultTableViewCell iconSize](self, "iconSize");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell publisherResult](self, "publisherResult"));

  v10 = &OBJC_IVAR___VenueFloorViewController__floorOrdinals;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell publisherResult](self, "publisherResult"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "publisher"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "publisherAttribution"));
    v15 = objc_msgSend(v14, "iconIdentifier");
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10083C128;
    v22[3] = &unk_1011ACBF8;
    v23 = v4;
    objc_msgSend(v11, "getImageForPublisherWithIconIdentifier:completion:", v15, v22);

    v10 = &OBJC_IVAR___VenueFloorViewController__floorOrdinals;
    v16 = 5.0;
    v17 = v23;
  }
  else
  {
    v16 = v8 * 0.5;
    if (v6
      && (!-[MKLocalSearchCompletion _type](v6, "_type") || -[MKLocalSearchCompletion _type](v6, "_type") == (id)3))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "searchImage"));
      -[UIImageView setImage:](self->_imageView, "setImage:", v18);

    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10083C194;
      v20[3] = &unk_1011ACBF8;
      v21 = v4;
      objc_msgSend(v19, "getImageForMapItem:completion:", v5, v20);

      v17 = v21;
    }
  }

  objc_msgSend(*(id *)&self->super.super.MKTableViewCell_opaque[v10[909]], "_setContinuousCornerRadius:", v16);
}

- (void)updateChildItems
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell childItems](self, "childItems"));
  if (-[ChildItemButtonProtocol count](self->_childItemButtons, "count"))
  {
    v3 = 0;
    do
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChildItemButtonProtocol objectAtIndexedSubscript:](self->_childItemButtons, "objectAtIndexedSubscript:", v3));
      objc_msgSend(v4, "setDelegate:", self);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v3));
      objc_msgSend(v4, "setChildItem:", v5);

      ++v3;
    }
    while (v3 < (unint64_t)-[ChildItemButtonProtocol count](self->_childItemButtons, "count"));
  }

}

- (void)setChildItems:(id)a3 viewModel:(id)a4
{
  NSArray *v7;
  NSArray *childItems;
  ChildItemsViewModel *v9;
  _SearchResultChildItemGridView *childItemGrid;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  BOOL v20;
  id v21;
  ChildItemButtonProtocol *v22;
  ChildItemButtonProtocol *childItemButtons;
  id v24;

  v24 = a4;
  v7 = (NSArray *)objc_msgSend(a3, "copy");
  childItems = self->_childItems;
  self->_childItems = v7;

  v9 = self->_childItemsViewModel;
  objc_storeStrong((id *)&self->_childItemsViewModel, a4);
  if (!-[ChildItemsViewModel isEqual:](self->_childItemsViewModel, "isEqual:", v9))
  {
    childItemGrid = self->_childItemGrid;
    if (childItemGrid)
    {
      -[_SearchResultChildItemGridView removeAllArrangedSubviews](childItemGrid, "removeAllArrangedSubviews");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (_QWORD)objc_msgSend(v24, "numberOfColumns") * (_QWORD)objc_msgSend(v24, "numberOfRows")));
      if (objc_msgSend(v24, "numberOfRows"))
      {
        v12 = 0;
        v13 = 0;
        do
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v24, "numberOfColumns")));
          if (objc_msgSend(v24, "numberOfColumns"))
          {
            v15 = 0;
            v16 = v24;
            do
            {
              if (v13 + v15 >= (unint64_t)objc_msgSend(v16, "childItemsCount"))
              {
                v18 = objc_alloc_init((Class)UIView);
                v19 = v14;
              }
              else
              {
                if (sub_1002A8AA0(self) == 5)
                  v17 = objc_claimAutoreleasedReturnValue(+[ChildItemCatalystButton childItemCatalystButton](ChildItemCatalystButton, "childItemCatalystButton"));
                else
                  v17 = objc_claimAutoreleasedReturnValue(+[ChildItemButton button](ChildItemButton, "button"));
                v18 = (id)v17;
                objc_msgSend(v14, "addObject:", v17);
                v19 = v11;
              }
              objc_msgSend(v19, "addObject:", v18);

              v20 = ++v15 >= (unint64_t)objc_msgSend(v24, "numberOfColumns");
              v16 = v24;
            }
            while (!v20);
            v13 += v15;
          }
          if (objc_msgSend(v14, "count"))
            v21 = -[_SearchResultChildItemGridView addRowWithArrangedSubviews:](self->_childItemGrid, "addRowWithArrangedSubviews:", v14);

          ++v12;
        }
        while (v12 < (unint64_t)objc_msgSend(v24, "numberOfRows"));
      }
      v22 = (ChildItemButtonProtocol *)objc_msgSend(v11, "copy");
      childItemButtons = self->_childItemButtons;
      self->_childItemButtons = v22;

    }
  }

}

- (id)autocompleteClientSourceString
{
  void *v3;

  if (-[AcSearchResultTableViewCell supportsClientServerDifferentiation](self, "supportsClientServerDifferentiation"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteClientSource autocompleteClientSourceTitleWithType:](AutocompleteClientSource, "autocompleteClientSourceTitleWithType:", -[AcSearchResultTableViewCell autocompleteClientSourceType](self, "autocompleteClientSourceType")));
  else
    v3 = 0;
  return v3;
}

- (BOOL)wantsTwoLineLayout
{
  return (id)-[AcSearchResultTableViewCell autocompleteCellType](self, "autocompleteCellType") == (id)3
      || (id)-[AcSearchResultTableViewCell autocompleteCellType](self, "autocompleteCellType") == (id)4;
}

- (BOOL)supportsClientServerDifferentiation
{
  return (char *)-[AcSearchResultTableViewCell autocompleteCellType](self, "autocompleteCellType") - 3 < (char *)2;
}

- (void)prepareForReuse
{
  MKLocalSearchCompletion *completion;
  objc_super v4;

  -[_SearchResultTableViewCell _clearModel](self, "_clearModel");
  v4.receiver = self;
  v4.super_class = (Class)AcSearchResultTableViewCell;
  -[_SearchResultTableViewCell prepareForReuse](&v4, "prepareForReuse");
  completion = self->_completion;
  self->_completion = 0;

  -[AcSearchResultTableViewCell setAutocompleteCellType:](self, "setAutocompleteCellType:", 0);
  -[AcSearchResultTableViewCell setAutocompleteClientSourceType:](self, "setAutocompleteClientSourceType:", 0);
  -[AcSearchResultTableViewCell setSearchQuery:](self, "setSearchQuery:", 0);
}

- (void)addTransitLabelWithFirstPartDetailString:(id)a3 secondPartDetailString:(id)a4
{
  id v6;
  unsigned int v7;
  MKTransitInfoLabelView *transitInfoLabel;
  MKTransitInfoLabelView *v9;
  MKTransitInfoLabelView *v10;
  void *v11;
  double v12;
  void *v13;
  UILabel *transitDelimiterLabel;
  UILabel *v15;
  UILabel *v16;
  double v17;
  NUIContainerStackView *secondLabelStackView;
  MKTransitInfoLabelView *v19;
  char *v20;
  MKTransitInfoLabelView *v21;
  MKTransitInfoLabelView *v22;
  void *v23;
  char *v24;
  id v25;

  v25 = a3;
  v6 = a4;
  v7 = -[AcSearchResultTableViewCell wantsTwoLineLayout](self, "wantsTwoLineLayout");
  transitInfoLabel = self->super._transitInfoLabel;
  if (v7)
  {
    if (!transitInfoLabel)
    {
      v9 = (MKTransitInfoLabelView *)objc_alloc_init((Class)MKTransitInfoLabelView);
      v10 = self->super._transitInfoLabel;
      self->super._transitInfoLabel = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[MKTransitInfoLabelView setBackgroundColor:](self->super._transitInfoLabel, "setBackgroundColor:", v11);

      LODWORD(v12) = 1144733696;
      -[MKTransitInfoLabelView setContentCompressionResistancePriority:forAxis:](self->super._transitInfoLabel, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    }
    v13 = v25;
    if (!v25)
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell attributedFirstPartDetailString](self, "attributedFirstPartDetailString"));
    v25 = v13;
    if (objc_msgSend(v13, "length"))
      goto LABEL_10;
    if (!v6)
      v6 = (id)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell attributedSecondPartDetailString](self, "attributedSecondPartDetailString"));
    if (objc_msgSend(v6, "length"))
    {
LABEL_10:
      transitDelimiterLabel = self->super._transitDelimiterLabel;
      if (!transitDelimiterLabel)
      {
        v15 = (UILabel *)objc_claimAutoreleasedReturnValue(-[_SearchResultTableViewCell _delimiterLabel](self, "_delimiterLabel"));
        v16 = self->super._transitDelimiterLabel;
        self->super._transitDelimiterLabel = v15;

        LODWORD(v17) = 1144717312;
        -[UILabel setContentCompressionResistancePriority:forAxis:](self->super._transitDelimiterLabel, "setContentCompressionResistancePriority:forAxis:", 0, v17);
        transitDelimiterLabel = self->super._transitDelimiterLabel;
      }
      -[NUIContainerStackView insertArrangedSubview:atIndex:](self->super._secondLabelStackView, "insertArrangedSubview:atIndex:", transitDelimiterLabel, 0);
    }
    secondLabelStackView = self->super._secondLabelStackView;
    v19 = self->super._transitInfoLabel;
    v20 = 0;
    goto LABEL_19;
  }
  if (!transitInfoLabel)
  {
    v21 = (MKTransitInfoLabelView *)objc_alloc_init((Class)MKTransitInfoLabelView);
    v22 = self->super._transitInfoLabel;
    self->super._transitInfoLabel = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MKTransitInfoLabelView setBackgroundColor:](self->super._transitInfoLabel, "setBackgroundColor:", v23);

  }
  if (!self->_childItemGrid)
  {
    v19 = self->super._transitInfoLabel;
    goto LABEL_21;
  }
  v24 = (char *)-[NUIContainerStackView indexOfArrangedSubview:](self->super._labelStackView, "indexOfArrangedSubview:");
  v19 = self->super._transitInfoLabel;
  if (v24 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_21:
    -[NUIContainerStackView addArrangedSubview:](self->super._labelStackView, "addArrangedSubview:", v19);
    goto LABEL_22;
  }
  v20 = v24 - 1;
  secondLabelStackView = self->super._labelStackView;
LABEL_19:
  -[NUIContainerStackView insertArrangedSubview:atIndex:](secondLabelStackView, "insertArrangedSubview:atIndex:", v19, v20);
LABEL_22:

}

- (void)removeTransitLabel
{
  objc_super v3;

  if (self->super._transitInfoLabel)
  {
    v3.receiver = self;
    v3.super_class = (Class)AcSearchResultTableViewCell;
    -[_SearchResultTableViewCell removeTransitLabel](&v3, "removeTransitLabel");
    -[NUIContainerStackView removeArrangedSubview:](self->super._secondLabelStackView, "removeArrangedSubview:", self->super._transitInfoLabel);
    -[MKTransitInfoLabelView removeFromSuperview](self->super._transitInfoLabel, "removeFromSuperview");
  }
  if (self->super._transitDelimiterLabel)
  {
    -[NUIContainerStackView removeArrangedSubview:](self->super._secondLabelStackView, "removeArrangedSubview:");
    -[UILabel removeFromSuperview](self->super._transitDelimiterLabel, "removeFromSuperview");
  }
}

- (void)didTapChildItemButtonForChildItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell delegate](self, "delegate"));
    v6 = objc_opt_respondsToSelector(v5, "didTapItemInChildItems:atIndexPath:forCell:");

    v4 = v10;
    if ((v6 & 1) != 0)
    {
      v7 = -[NSArray indexOfObject:](self->_childItems, "indexOfObject:", v10);
      v4 = v10;
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v7, 0));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[AcSearchResultTableViewCell delegate](self, "delegate"));
        objc_msgSend(v9, "didTapItemInChildItems:atIndexPath:forCell:", self->_childItems, v8, self);

        v4 = v10;
      }
    }
  }

}

- (double)paddingAboveContextualInformationStackView
{
  return 4.0;
}

- (id)object
{
  return self->_object;
}

- (AcSearchResultTableViewCellDelegate)delegate
{
  return (AcSearchResultTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)autocompleteCellType
{
  return self->_autocompleteCellType;
}

- (void)setAutocompleteCellType:(int64_t)a3
{
  self->_autocompleteCellType = a3;
}

- (int64_t)autocompleteClientSourceType
{
  return self->_autocompleteClientSourceType;
}

- (void)setAutocompleteClientSourceType:(int64_t)a3
{
  self->_autocompleteClientSourceType = a3;
}

- (BOOL)shouldEnableGrayscaleHighlighting
{
  return self->_shouldEnableGrayscaleHighlighting;
}

- (void)setShouldEnableGrayscaleHighlighting:(BOOL)a3
{
  self->_shouldEnableGrayscaleHighlighting = a3;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_searchQuery, a3);
}

- (ChildItemsViewModel)childItemsViewModel
{
  return self->_childItemsViewModel;
}

- (void)setChildItemsViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_childItemsViewModel, a3);
}

- (NSArray)childItems
{
  return self->_childItems;
}

- (void)setChildItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childItems, 0);
  objc_storeStrong((id *)&self->_childItemsViewModel, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_childItemGrid, 0);
  objc_storeStrong((id *)&self->_childItemButtons, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_completion, 0);
}

@end
