@implementation FRFeedPickerCardCollectionViewBaseCell

- (FRFeedPickerCardCollectionViewBaseCell)initWithFrame:(CGRect)a3
{
  FRFeedPickerCardCollectionViewBaseCell *v3;
  FRFeedPickerCardCollectionViewBaseCell *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CALayer *tagImageLayer;
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
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  double y;
  double width;
  double height;
  UIImageView *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  UIImageView *placeholderImageView;
  UIImageView *v49;
  void *v50;
  UILabel *v51;
  UILabel *placeholderTagLabel;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  objc_super v62;
  _QWORD v63[7];
  _QWORD v64[7];

  v62.receiver = self;
  v62.super_class = (Class)FRFeedPickerCardCollectionViewBaseCell;
  v3 = -[FRFeedPickerCollectionViewCell initWithFrame:](&v62, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell layer](v3, "layer"));
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell contentView](v4, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
    objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

    v8 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    tagImageLayer = v4->_tagImageLayer;
    v4->_tagImageLayer = (CALayer *)v8;

    -[CALayer fr_accessibilityUndoInvertColorsIfNecessary](v4->_tagImageLayer, "fr_accessibilityUndoInvertColorsIfNecessary");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v4, "accessibilityInvertColorsSettingDidChange:", UIAccessibilityInvertColorsStatusDidChangeNotification, 0);

    v63[0] = CFSTR("bounds");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v64[0] = v11;
    v63[1] = CFSTR("contents");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v64[1] = v12;
    v63[2] = CFSTR("contentsScale");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v64[2] = v13;
    v63[3] = CFSTR("onOrderIn");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v64[3] = v14;
    v63[4] = CFSTR("onOrderOut");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v64[4] = v15;
    v63[5] = CFSTR("sublayers");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v64[5] = v16;
    v63[6] = CFSTR("hidden");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v64[6] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v64, v63, 7));

    -[CALayer setActions:](v4->_tagImageLayer, "setActions:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FRCardConfiguration cardConfiguration](FRCardConfiguration, "cardConfiguration"));
    objc_msgSend(v19, "cardCornerRadius");
    -[CALayer setCornerRadius:](v4->_tagImageLayer, "setCornerRadius:");

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell contentView](v4, "contentView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layer"));
    objc_msgSend(v21, "addSublayer:", v4->_tagImageLayer);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[FRCardConfiguration cardConfiguration](FRCardConfiguration, "cardConfiguration"));
    objc_msgSend(v22, "cardCornerRadius");
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell contentView](v4, "contentView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layer"));
    objc_msgSend(v26, "setCornerRadius:", v24);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[FRCardConfiguration cardConfiguration](FRCardConfiguration, "cardConfiguration"));
    objc_msgSend(v27, "cardCornerRadius");
    v29 = v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell highlightedScrimView](v4, "highlightedScrimView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "layer"));
    objc_msgSend(v31, "setCornerRadius:", v29);

    v32 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v36 = (UIImageView *)objc_msgSend(v32, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v36, "setAccessibilityIgnoresInvertColors:", 1);
    -[UIImageView setContentMode:](v36, "setContentMode:", 4);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[FRCardConfiguration cardConfiguration](FRCardConfiguration, "cardConfiguration"));
    objc_msgSend(v37, "cardCornerRadius");
    v39 = v38;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v36, "layer"));
    objc_msgSend(v40, "setCornerRadius:", v39);

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v41, "scale");
    v43 = 1.0 / v42;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v36, "layer"));
    objc_msgSend(v44, "setBorderWidth:", v43);

    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.15)));
    v46 = objc_msgSend(v45, "CGColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v36, "layer"));
    objc_msgSend(v47, "setBorderColor:", v46);

    placeholderImageView = v4->_placeholderImageView;
    v4->_placeholderImageView = v36;
    v49 = v36;

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell contentView](v4, "contentView"));
    objc_msgSend(v50, "addSubview:", v4->_placeholderImageView);

    v51 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    placeholderTagLabel = v4->_placeholderTagLabel;
    v4->_placeholderTagLabel = v51;

    -[UILabel setNumberOfLines:](v4->_placeholderTagLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_placeholderTagLabel, "setLineBreakMode:", 4);
    -[UILabel setTextAlignment:](v4->_placeholderTagLabel, "setTextAlignment:", 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.4, 1.0));
    -[UILabel setTextColor:](v4->_placeholderTagLabel, "setTextColor:", v53);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell contentView](v4, "contentView"));
    objc_msgSend(v54, "addSubview:", v4->_placeholderTagLabel);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell contentView](v4, "contentView"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell notificationsBadgeButton](v4, "notificationsBadgeButton"));
    objc_msgSend(v55, "bringSubviewToFront:", v56);

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell contentView](v4, "contentView"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell actionButton](v4, "actionButton"));
    objc_msgSend(v57, "bringSubviewToFront:", v58);

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell contentView](v4, "contentView"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell highlightedScrimView](v4, "highlightedScrimView"));
    objc_msgSend(v59, "bringSubviewToFront:", v60);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIAccessibilityInvertColorsStatusDidChangeNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)FRFeedPickerCardCollectionViewBaseCell;
  -[FRFeedPickerCardCollectionViewBaseCell dealloc](&v4, "dealloc");
}

- (void)accessibilityInvertColorsSettingDidChange:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell tagImageLayer](self, "tagImageLayer", a3));
  objc_msgSend(v3, "fr_accessibilityUndoInvertColorsIfNecessary");

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  CGFloat v63;
  void *v64;
  double v65;
  double v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  objc_super v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)FRFeedPickerCardCollectionViewBaseCell;
  -[FRFeedPickerCollectionViewCell applyLayoutAttributes:](&v72, "applyLayoutAttributes:", v4);
  +[CATransaction begin](CATransaction, "begin");
  if (-[FRFeedPickerCardCollectionViewBaseCell disableTransitionAnimation](self, "disableTransitionAnimation"))
    +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", kCFBooleanTrue, kCATransactionDisableActions);
  v6 = objc_opt_class(FRCollectionViewFeedPickerLayoutAttributes, v5);
  v7 = FCDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeholderTopicFont"));
    -[FRFeedPickerCardCollectionViewBaseCell setPlaceholderTopicFont:](self, "setPlaceholderTopicFont:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeholderChannelFont"));
    -[FRFeedPickerCardCollectionViewBaseCell setPlaceholderChannelFont:](self, "setPlaceholderChannelFont:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeholderTopicAttributes"));
    -[FRFeedPickerCardCollectionViewBaseCell setPlaceholderTopicAttributes:](self, "setPlaceholderTopicAttributes:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeholderChannelAttributes"));
    -[FRFeedPickerCardCollectionViewBaseCell setPlaceholderChannelAttributes:](self, "setPlaceholderChannelAttributes:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeholderChannelImage"));
    -[FRFeedPickerCardCollectionViewBaseCell setPlaceholderChannelImage:](self, "setPlaceholderChannelImage:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeholderTopicImage"));
    -[FRFeedPickerCardCollectionViewBaseCell setPlaceholderTopicImage:](self, "setPlaceholderTopicImage:", v15);

  }
  else
  {
    -[FRFeedPickerCardCollectionViewBaseCell setPlaceholderTopicFont:](self, "setPlaceholderTopicFont:", 0);
    -[FRFeedPickerCardCollectionViewBaseCell setPlaceholderChannelFont:](self, "setPlaceholderChannelFont:", 0);
    -[FRFeedPickerCardCollectionViewBaseCell setPlaceholderTopicAttributes:](self, "setPlaceholderTopicAttributes:", 0);
    -[FRFeedPickerCardCollectionViewBaseCell setPlaceholderChannelAttributes:](self, "setPlaceholderChannelAttributes:", 0);
    -[FRFeedPickerCardCollectionViewBaseCell setPlaceholderChannelImage:](self, "setPlaceholderChannelImage:", 0);
    -[FRFeedPickerCardCollectionViewBaseCell setPlaceholderTopicImage:](self, "setPlaceholderTopicImage:", 0);
  }
  objc_msgSend(v4, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell tagImageLayer](self, "tagImageLayer"));
  objc_msgSend((id)v24, "setFrame:", v17, v19, v21, v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderImageView](self, "placeholderImageView"));
  objc_msgSend(v25, "frame");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  objc_msgSend(v4, "bounds");
  v78.origin.x = v34;
  v78.origin.y = v35;
  v78.size.width = v36;
  v78.size.height = v37;
  v73.origin.x = v27;
  v73.origin.y = v29;
  v73.size.width = v31;
  v73.size.height = v33;
  LOBYTE(v24) = CGRectEqualToRect(v73, v78);

  objc_msgSend(v4, "bounds");
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderImageView](self, "placeholderImageView"));
  objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[FRCardConfiguration cardConfiguration](FRCardConfiguration, "cardConfiguration"));
  objc_msgSend(v4, "bounds");
  objc_msgSend(v47, "bannerFrameForSize:", v48, v49);
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "preferredContentSizeCategory"));

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[FRCardConfiguration cardConfiguration](FRCardConfiguration, "cardConfiguration"));
  objc_msgSend(v60, "insetForFeed:sizeCategory:", 0, v59);
  v62 = v61;

  v74.origin.x = v51;
  v74.origin.y = v53;
  v74.size.width = v55;
  v74.size.height = v57;
  v63 = v62 * CGRectGetWidth(v74);
  v75.origin.x = v51;
  v75.origin.y = v53;
  v75.size.width = v55;
  v75.size.height = v57;
  v76 = CGRectInset(v75, v63, 0.0);
  v77 = CGRectIntegral(v76);
  -[FRFeedPickerCardCollectionViewBaseCell setChannelBannerFrame:](self, "setChannelBannerFrame:", v77.origin.x, v77.origin.y, v77.size.width, v77.size.height);
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[FRCardConfiguration cardConfiguration](FRCardConfiguration, "cardConfiguration"));
  objc_msgSend(v4, "bounds");
  objc_msgSend(v64, "topicFrameForSize:", v65, v66);
  -[FRFeedPickerCardCollectionViewBaseCell setTopicBannerFrame:](self, "setTopicBannerFrame:");

  if ((v24 & 1) == 0)
  {
    v67 = objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell populatedFeed](self, "populatedFeed"));
    if (v67)
    {
      v68 = (void *)v67;
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell feldsparContext](self, "feldsparContext"));

      if (v69)
      {
        -[FRFeedPickerCardCollectionViewBaseCell _clearImage](self, "_clearImage");
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell populatedFeed](self, "populatedFeed"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell feldsparContext](self, "feldsparContext"));
        -[FRFeedPickerCardCollectionViewBaseCell populateWithFeed:context:](self, "populateWithFeed:context:", v70, v71);

      }
    }
  }
  +[CATransaction commit](CATransaction, "commit");

}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FRFeedPickerCardCollectionViewBaseCell;
  -[FRFeedPickerCardCollectionViewBaseCell layoutSubviews](&v2, "layoutSubviews");
}

- (void)_clearImage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[FRFeedPickerCardCollectionViewBaseCell setImage:](self, "setImage:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderImageView](self, "placeholderImageView"));
  objc_msgSend(v3, "setHidden:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell tagImageLayer](self, "tagImageLayer"));
  objc_msgSend(v4, "setHidden:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell imageUpdateOperation](self, "imageUpdateOperation"));
  objc_msgSend(v5, "cancel");

  -[FRFeedPickerCardCollectionViewBaseCell setImageUpdateOperation:](self, "setImageUpdateOperation:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell actionButton](self, "actionButton"));
  objc_msgSend(v6, "setAlpha:", 1.0);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FRFeedPickerCardCollectionViewBaseCell;
  -[FRFeedPickerCollectionViewCell prepareForReuse](&v5, "prepareForReuse");
  -[FRFeedPickerCardCollectionViewBaseCell _clearImage](self, "_clearImage");
  -[FRFeedPickerCardCollectionViewBaseCell setAccessibilityLabel:](self, "setAccessibilityLabel:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderTagLabel](self, "placeholderTagLabel"));
  objc_msgSend(v3, "setAttributedText:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderImageView](self, "placeholderImageView"));
  objc_msgSend(v4, "setImage:", 0);

}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell tagImageLayer](self, "tagImageLayer"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contents"));
  v18 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v18, "CGImage");

  if (v6 != v7)
  {
    v8 = objc_retainAutorelease(v18);
    v9 = objc_msgSend(v8, "CGImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell tagImageLayer](self, "tagImageLayer"));
    objc_msgSend(v10, "setContents:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell tagImageLayer](self, "tagImageLayer"));
    objc_msgSend(v11, "setHidden:", v8 == 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell tagImageLayer](self, "tagImageLayer"));
    v13 = objc_msgSend(v12, "isHidden") ^ 1;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderImageView](self, "placeholderImageView"));
    objc_msgSend(v14, "setHidden:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell tagImageLayer](self, "tagImageLayer"));
    v16 = objc_msgSend(v15, "isHidden") ^ 1;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderTagLabel](self, "placeholderTagLabel"));
    objc_msgSend(v17, "setHidden:", v16);

  }
}

- (void)populateWithFeed:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  __CFString *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  id v49;
  uint64_t v50;
  const __CFString *v51;
  objc_super v52;

  v6 = a3;
  v7 = a4;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell imageUpdateOperation](self, "imageUpdateOperation"));

  if (v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100077424();
  v52.receiver = self;
  v52.super_class = (Class)FRFeedPickerCardCollectionViewBaseCell;
  -[FRFeedPickerCollectionViewCell populateWithFeed:context:](&v52, "populateWithFeed:context:", v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell cardCellDelegate](self, "cardCellDelegate"));
  if (!v9
    || (v10 = (void *)v9,
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell cardCellDelegate](self, "cardCellDelegate")),
        v12 = objc_msgSend(v11, "shouldLoadImageForCell:", self),
        v11,
        v10,
        v12))
  {
    -[FRFeedPickerCardCollectionViewBaseCell reloadTagImage](self, "reloadTagImage");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell tagImageLayer](self, "tagImageLayer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contents"));

  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backingTag"));
    if (objc_msgSend(v15, "tagType") == (id)1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderTopicImage](self, "placeholderTopicImage"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderImageView](self, "placeholderImageView"));
      objc_msgSend(v17, "setImage:", v16);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderTopicFont](self, "placeholderTopicFont"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderTagLabel](self, "placeholderTagLabel"));
      objc_msgSend(v19, "setFont:", v18);

      -[FRFeedPickerCardCollectionViewBaseCell topicBannerFrame](self, "topicBannerFrame");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderTagLabel](self, "placeholderTagLabel"));
      objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

      v29 = objc_alloc((Class)NSAttributedString);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      v31 = v30;
      if (!v30)
        v30 = &stru_1000DF290;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uppercaseString](v30, "uppercaseString"));
      v33 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderTopicAttributes](self, "placeholderTopicAttributes"));
      v34 = objc_msgSend(v29, "initWithString:attributes:", v32, v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderTagLabel](self, "placeholderTagLabel"));
      objc_msgSend(v35, "setAttributedText:", v34);

    }
    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderChannelImage](self, "placeholderChannelImage"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderImageView](self, "placeholderImageView"));
      objc_msgSend(v37, "setImage:", v36);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderChannelFont](self, "placeholderChannelFont"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderTagLabel](self, "placeholderTagLabel"));
      objc_msgSend(v39, "setFont:", v38);

      -[FRFeedPickerCardCollectionViewBaseCell channelBannerFrame](self, "channelBannerFrame");
      v41 = v40;
      v43 = v42;
      v45 = v44;
      v47 = v46;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderTagLabel](self, "placeholderTagLabel"));
      objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

      v49 = objc_alloc((Class)NSAttributedString);
      v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      v31 = (void *)v50;
      if (v50)
        v51 = (const __CFString *)v50;
      else
        v51 = &stru_1000DF290;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderChannelAttributes](self, "placeholderChannelAttributes"));
      v33 = objc_msgSend(v49, "initWithString:attributes:", v51, v32);
      v34 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell placeholderTagLabel](self, "placeholderTagLabel"));
      objc_msgSend(v34, "setAttributedText:", v33);
    }

  }
}

- (void)_notificationsBadgeButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell cardCellDelegate](self, "cardCellDelegate", a3));
  objc_msgSend(v4, "presentNotificationSettingsForCell:", self);

}

- (void)unloadTagImage
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell imageUpdateOperation](self, "imageUpdateOperation"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell imageUpdateOperation](self, "imageUpdateOperation"));
    objc_msgSend(v4, "cancel");

    -[FRFeedPickerCardCollectionViewBaseCell setImageUpdateOperation:](self, "setImageUpdateOperation:", 0);
  }
  -[FRFeedPickerCardCollectionViewBaseCell setImage:](self, "setImage:", 0);
}

- (id)_imageGenerationOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  FRFeedImageGenerationOptions *v17;
  void *v18;
  FRFeedImageGenerationOptions *v19;

  +[NSThread isMainThread](NSThread, "isMainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCollectionViewCell populatedFeed](self, "populatedFeed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell tagImageLayer](self, "tagImageLayer"));
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v11, "scale");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FRCardConfiguration cardConfiguration](FRCardConfiguration, "cardConfiguration"));
  objc_msgSend(v14, "cardCornerRadius");
  v16 = v15;

  v17 = [FRFeedImageGenerationOptions alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v19 = -[FRFeedImageGenerationOptions initWithFeed:size:punchThroughEffect:cornerRadius:scale:sizeCategory:parentBackgroundColor:](v17, "initWithFeed:size:punchThroughEffect:cornerRadius:scale:sizeCategory:parentBackgroundColor:", v3, 0, v5, v18, v8, v10, v16, v13);

  return v19;
}

- (id)_cachedImageIfPerformanceAllows
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  const __CFArray *v11;
  const __CFArray *v12;
  const void *ValueAtIndex;
  void *v14;
  void *v16;
  CFTypeRef cf;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell cardCellDelegate](self, "cardCellDelegate"));
  v4 = objc_msgSend(v3, "canLoadCachedImageSynchronouslyForCell:", self);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell imageUpdateOperation](self, "imageUpdateOperation"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell imageUpdateOperation](self, "imageUpdateOperation"));
    objc_msgSend(v6, "cancel");

    -[FRFeedPickerCardCollectionViewBaseCell setImageUpdateOperation:](self, "setImageUpdateOperation:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell _imageGenerationOptions](self, "_imageGenerationOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cachedImagePath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if (v10)
  {
    cf = 0;
    v11 = (const __CFArray *)CPBitmapCreateImagesFromPath(v8, 0, 2, &cf);
    v12 = v11;
    if (v11 && CFArrayGetCount(v11) >= 1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v12, 0);
      objc_msgSend(v7, "scale");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", ValueAtIndex, 0));
    }
    else
    {
      v16 = (void *)FCDefaultLog;
      if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR))
        sub_1000774E4((uint64_t)v8, (__CFError **)&cf, v16);
      v14 = 0;
    }
    if (cf)
      CFRelease(cf);
    if (v12)
      CFRelease(v12);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)reloadCachedTagImage
{
  id v3;

  +[NSThread isMainThread](NSThread, "isMainThread");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell _cachedImageIfPerformanceAllows](self, "_cachedImageIfPerformanceAllows"));
  -[FRFeedPickerCardCollectionViewBaseCell setImage:](self, "setImage:", v3);

}

- (void)reloadTagImage
{
  void *v3;

  +[NSThread isMainThread](NSThread, "isMainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell imageUpdateOperation](self, "imageUpdateOperation"));

  if (!v3)
    -[FRFeedPickerCardCollectionViewBaseCell _updateImageAsync](self, "_updateImageAsync");
}

- (void)_updateImageAsync
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  FRFeedImageGenerationOperation *v10;
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
  id v22;
  dispatch_queue_global_t global_queue;
  NSObject *v24;
  FRFeedImageGenerationOperation *v25;
  _QWORD v26[4];
  FRFeedImageGenerationOperation *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31[5];
  id from;
  id location;

  -[FRFeedPickerCardCollectionViewBaseCell reloadCachedTagImage](self, "reloadCachedTagImage");
  +[NSThread isMainThread](NSThread, "isMainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell imageUpdateOperation](self, "imageUpdateOperation"));

  if (v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100077590();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell tagImageLayer](self, "tagImageLayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contents"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedCollectionViewCell actionButton](self, "actionButton"));
    objc_msgSend(v6, "setAlpha:", 0.0);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell _imageGenerationOptions](self, "_imageGenerationOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));

  v10 = -[FRFeedImageGenerationOperation initWithOptions:]([FRFeedImageGenerationOperation alloc], "initWithOptions:", v7);
  -[FRFeedPickerCardCollectionViewBaseCell setImageUpdateOperation:](self, "setImageUpdateOperation:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell tagImageLayer](self, "tagImageLayer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contents"));

  if (!v12)
    -[FRFeedImageGenerationOperation setQueuePriority:](v10, "setQueuePriority:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerCardCollectionViewBaseCell tagImageLayer](self, "tagImageLayer"));
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  objc_initWeak(&location, self);
  objc_initWeak(&from, v10);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001BEF0;
  v28[3] = &unk_1000D97F8;
  objc_copyWeak(&v30, &from);
  objc_copyWeak(v31, &location);
  v31[1] = v15;
  v31[2] = v17;
  v31[3] = v19;
  v31[4] = v21;
  v22 = v9;
  v29 = v22;
  -[FRFeedImageGenerationOperation setCompletionBlock:](v10, "setCompletionBlock:", v28);
  global_queue = dispatch_get_global_queue(-32768, 0);
  v24 = objc_claimAutoreleasedReturnValue(global_queue);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001C1EC;
  v26[3] = &unk_1000D9758;
  v27 = v10;
  v25 = v10;
  dispatch_async(v24, v26);

  objc_destroyWeak(v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (FRFeedPickerCardCollectionViewCellDelegate)cardCellDelegate
{
  return (FRFeedPickerCardCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_cardCellDelegate);
}

- (void)setCardCellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cardCellDelegate, a3);
}

- (UIImageView)placeholderImageView
{
  return self->_placeholderImageView;
}

- (void)setPlaceholderImageView:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderImageView, a3);
}

- (UILabel)placeholderTagLabel
{
  return self->_placeholderTagLabel;
}

- (void)setPlaceholderTagLabel:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderTagLabel, a3);
}

- (CALayer)tagImageLayer
{
  return self->_tagImageLayer;
}

- (void)setTagImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_tagImageLayer, a3);
}

- (UIFont)placeholderTopicFont
{
  return self->_placeholderTopicFont;
}

- (void)setPlaceholderTopicFont:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderTopicFont, a3);
}

- (UIFont)placeholderChannelFont
{
  return self->_placeholderChannelFont;
}

- (void)setPlaceholderChannelFont:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderChannelFont, a3);
}

- (NSDictionary)placeholderTopicAttributes
{
  return self->_placeholderTopicAttributes;
}

- (void)setPlaceholderTopicAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderTopicAttributes, a3);
}

- (NSDictionary)placeholderChannelAttributes
{
  return self->_placeholderChannelAttributes;
}

- (void)setPlaceholderChannelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderChannelAttributes, a3);
}

- (CGRect)channelBannerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_channelBannerFrame.origin.x;
  y = self->_channelBannerFrame.origin.y;
  width = self->_channelBannerFrame.size.width;
  height = self->_channelBannerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setChannelBannerFrame:(CGRect)a3
{
  self->_channelBannerFrame = a3;
}

- (CGRect)topicBannerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_topicBannerFrame.origin.x;
  y = self->_topicBannerFrame.origin.y;
  width = self->_topicBannerFrame.size.width;
  height = self->_topicBannerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTopicBannerFrame:(CGRect)a3
{
  self->_topicBannerFrame = a3;
}

- (BOOL)disableTransitionAnimation
{
  return self->_disableTransitionAnimation;
}

- (void)setDisableTransitionAnimation:(BOOL)a3
{
  self->_disableTransitionAnimation = a3;
}

- (NSOperation)imageUpdateOperation
{
  return self->_imageUpdateOperation;
}

- (void)setImageUpdateOperation:(id)a3
{
  objc_storeStrong((id *)&self->_imageUpdateOperation, a3);
}

- (UIImage)placeholderChannelImage
{
  return self->_placeholderChannelImage;
}

- (void)setPlaceholderChannelImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderChannelImage, a3);
}

- (UIImage)placeholderTopicImage
{
  return self->_placeholderTopicImage;
}

- (void)setPlaceholderTopicImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderTopicImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderTopicImage, 0);
  objc_storeStrong((id *)&self->_placeholderChannelImage, 0);
  objc_storeStrong((id *)&self->_imageUpdateOperation, 0);
  objc_storeStrong((id *)&self->_placeholderChannelAttributes, 0);
  objc_storeStrong((id *)&self->_placeholderTopicAttributes, 0);
  objc_storeStrong((id *)&self->_placeholderChannelFont, 0);
  objc_storeStrong((id *)&self->_placeholderTopicFont, 0);
  objc_storeStrong((id *)&self->_tagImageLayer, 0);
  objc_storeStrong((id *)&self->_placeholderTagLabel, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_destroyWeak((id *)&self->_cardCellDelegate);
}

@end
