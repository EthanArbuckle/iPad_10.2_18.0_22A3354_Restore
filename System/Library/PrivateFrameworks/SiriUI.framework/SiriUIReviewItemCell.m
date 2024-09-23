@implementation SiriUIReviewItemCell

+ (UIEdgeInsets)_defaultEdgeInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom"))
    v3 = 0.0;
  else
    v3 = 15.0;

  v4 = 7.5;
  v5 = 14.0;
  v6 = 15.0;
  v7 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v7;
  result.top = v4;
  return result;
}

+ (int64_t)defaultCharacterLimit
{
  return 500;
}

+ (id)_displayTextForComment:(id)a3 characterLimit:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v5 = (void *)MEMORY[0x24BDD14A8];
  v6 = a3;
  objc_msgSend(v5, "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "length");
  if (v9 >= a4)
    v10 = a4;
  else
    v10 = v9;
  if (a4 <= 0)
    v11 = v9;
  else
    v11 = v10;
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\n\n"), CFSTR("\n"), 0, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length") > (unint64_t)a4)
  {
    objc_msgSend(v12, "substringToIndex:", a4);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "siriUILocalizedStringForKey:", CFSTR("REVIEW_TEXT_FORMAT"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("“%@”"), 0, v12);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = v12;
  }
  v17 = v16;

  return v17;
}

+ (CGSize)sizeThatFits:(CGSize)a3 withReview:(id)a4 characterLimit:(int64_t)a5
{
  double height;
  double width;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
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
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[3];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v47[2] = *MEMORY[0x24BDAC8D0];
  v9 = (void *)MEMORY[0x24BDF6750];
  v10 = a4;
  objc_msgSend(v9, "defaultParagraphStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "setMinimumLineHeight:", 20.0);
  objc_msgSend(v12, "setMaximumLineHeight:", 20.0);
  if (!sizeThatFits_withReview_characterLimit__sCommentAttributes)
  {
    v46[0] = *MEMORY[0x24BDF65F8];
    v13 = v46[0];
    objc_msgSend(a1, "_commentLabelFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = *MEMORY[0x24BDF6628];
    v47[0] = v14;
    v47[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)sizeThatFits_withReview_characterLimit__sCommentAttributes;
    sizeThatFits_withReview_characterLimit__sCommentAttributes = v15;

    v44 = v13;
    objc_msgSend(a1, "_authorFontAttribute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)sizeThatFits_withReview_characterLimit__sAuthorAttributes;
    sizeThatFits_withReview_characterLimit__sAuthorAttributes = v18;

  }
  objc_msgSend(v10, "comment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_displayTextForComment:characterLimit:", v20, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "author");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "length"))
    v23 = v22;
  else
    v23 = 0;
  v24 = v23;

  objc_msgSend(a1, "_defaultEdgeInsets");
  v27 = width - (v25 + v26);
  v30 = v28 + v29 + 1.0;
  objc_msgSend(v21, "boundingRectWithSize:options:attributes:context:", 1, sizeThatFits_withReview_characterLimit__sCommentAttributes, 0, v27, height);
  v32 = v30 + v31;
  objc_msgSend(v24, "boundingRectWithSize:options:attributes:context:", 0, sizeThatFits_withReview_characterLimit__sAuthorAttributes, 0, v27, height);
  v34 = v33;

  v35 = v32 + v34;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "scale");
  v38 = ceil(v27);
  v39 = ceil(v35);
  if (v37 >= 2.0)
    v40 = v27;
  else
    v40 = v38;
  if (v37 >= 2.0)
    v41 = v35;
  else
    v41 = v39;

  v42 = v40;
  v43 = v41;
  result.height = v43;
  result.width = v42;
  return result;
}

+ (id)_commentLabelFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "siriui_lightWeightFontWithSize:", 14.0);
}

+ (id)_authorFontAttribute
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "siriui_mediumWeightFontWithSize:", 14.0);
}

- (SiriUIReviewItemCell)initWithFrame:(CGRect)a3
{
  SiriUIReviewItemCell *v3;
  SiriUIReviewItemCell *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UILabel *commentLabel;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  uint64_t v18;
  UILabel *authorLabel;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SiriUIReviewItemCell;
  v3 = -[SiriUIContentCollectionViewCell initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SiriUIContentCollectionViewCell setKeylineType:](v3, "setKeylineType:", 1);
    v5 = objc_alloc(MEMORY[0x24BDF6B68]);
    v6 = *MEMORY[0x24BDBF090];
    v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], v7, v8, v9);
    commentLabel = v4->_commentLabel;
    v4->_commentLabel = (UILabel *)v10;

    v12 = v4->_commentLabel;
    objc_msgSend((id)objc_opt_class(), "_commentLabelFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12, "setFont:", v13);

    v14 = v4->_commentLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    v16 = v4->_commentLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v16, "setBackgroundColor:", v17);

    -[UILabel setNumberOfLines:](v4->_commentLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_commentLabel, "setLineBreakMode:", 4);
    -[SiriUIReviewItemCell addSubview:](v4, "addSubview:", v4->_commentLabel);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v6, v7, v8, v9);
    authorLabel = v4->_authorLabel;
    v4->_authorLabel = (UILabel *)v18;

    v20 = v4->_authorLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v20, "setTextColor:", v21);

    v22 = v4->_authorLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v22, "setBackgroundColor:", v23);

    -[SiriUIReviewItemCell addSubview:](v4, "addSubview:", v4->_authorLabel);
    objc_msgSend((id)objc_opt_class(), "_defaultEdgeInsets");
    v4->_contentInsets.top = v24;
    v4->_contentInsets.left = v25;
    v4->_contentInsets.bottom = v26;
    v4->_contentInsets.right = v27;
    v4->_characterLimit = objc_msgSend((id)objc_opt_class(), "defaultCharacterLimit");
  }
  return v4;
}

- (void)prepareForReuse
{
  UIView *ratingView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUIReviewItemCell;
  -[SiriUIContentCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[UILabel setText:](self->_commentLabel, "setText:", 0);
  -[UILabel setAttributedText:](self->_authorLabel, "setAttributedText:", 0);
  -[UIView removeFromSuperview](self->_ratingView, "removeFromSuperview");
  ratingView = self->_ratingView;
  self->_ratingView = 0;

}

- (void)configureWithReview:(id)a3 ratingView:(id)a4 offset:(UIOffset)a5
{
  CGFloat vertical;
  CGFloat horizontal;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  vertical = a5.vertical;
  horizontal = a5.horizontal;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "comment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIReviewItemCell _setComment:](self, "_setComment:", v11);

  -[SiriUIReviewItemCell _setRatingView:](self, "_setRatingView:", v9);
  self->_ratingOffset.horizontal = horizontal;
  self->_ratingOffset.vertical = vertical;
  objc_msgSend(v10, "lastUpdated");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "author");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeZoneId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIReviewItemCell _setAuthor:andDate:timeZoneId:hasRatingView:](self, "_setAuthor:andDate:timeZoneId:hasRatingView:", v12, v13, v14, v9 != 0);

}

- (void)_setComment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_displayTextForComment:characterLimit:", v4, self->_characterLimit);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setMinimumLineHeight:", 20.0);
  objc_msgSend(v7, "setMaximumLineHeight:", 20.0);
  v8 = objc_alloc(MEMORY[0x24BDD1458]);
  v11 = *MEMORY[0x24BDF6628];
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithString:attributes:", v5, v9);

  -[UILabel setAttributedText:](self->_commentLabel, "setAttributedText:", v10);
}

- (void)_setRatingView:(id)a3
{
  id v5;

  v5 = a3;
  -[UIView removeFromSuperview](self->_ratingView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_ratingView, a3);
  if (self->_ratingView)
    -[SiriUIReviewItemCell addSubview:](self, "addSubview:");

}

- (void)_setAuthor:(id)a3 andDate:(id)a4 timeZoneId:(id)a5 hasRatingView:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v6 = a6;
  v26[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x24BDD1688]);
  v12 = objc_msgSend(v9, "length");
  v13 = (uint64_t *)MEMORY[0x24BDF65F8];
  if (v12)
  {
    if (v6)
    {
      objc_msgSend(CFSTR(" "), "stringByAppendingString:", v9);
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v14;
    }
    if (v10)
    {
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(" "));
      v15 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v15;
    }
    v25 = *v13;
    objc_msgSend((id)objc_opt_class(), "_authorFontAttribute");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v9, v17);
    objc_msgSend(v11, "appendAttributedString:", v18);

  }
  if (v10)
  {
    -[SiriUIReviewItemCell _relativeStringFromDate:](self, "_relativeStringFromDate:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
    {
      v23 = *v13;
      objc_msgSend((id)objc_opt_class(), "_authorDateFontAttribute");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v19, v21);
      objc_msgSend(v11, "appendAttributedString:", v22);

    }
  }
  -[UILabel setAttributedText:](self->_authorLabel, "setAttributedText:", v11);
  -[UILabel sizeToFit](self->_authorLabel, "sizeToFit");

}

- (id)_relativeStringFromDate:(id)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "timeIntervalSinceNow");
    if ((uint64_t)(v5 / -60.0) > 1)
    {
      v11 = (uint64_t)(v5 / -3600.0);
      if (v11 > 1)
      {
        if ((uint64_t)(v5 / -86400.0) >= 1)
        {
          objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v4, 1, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        v19 = (void *)MEMORY[0x24BDD16F0];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "sruif_localizedStringFromNumber:", v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v18 = CFSTR("LESS_THAN_ONE_DAY_HOURS_FORMAT");
      }
      else
      {
        v12 = (void *)MEMORY[0x24BDD16F0];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sruif_localizedStringFromNumber:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        v18 = CFSTR("LESS_THAN_ONE_HOUR_MINUTES_FORMAT");
      }
      objc_msgSend(v16, "siriUILocalizedStringForKey:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@"), 0, v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDD16F0], "sruif_localizedStringFromNumber:", &unk_24D7EF4F0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SiriUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "siriUILocalizedStringForKey:", CFSTR("LESS_THAN_ONE_MINUTE_AGO_FORMAT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
LABEL_11:

  return v10;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double left;
  double top;
  double right;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UILabel *commentLabel;
  CGFloat y;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double MaxY;
  void *v38;
  double v39;
  CGFloat width;
  UILabel *authorLabel;
  double v42;
  double height;
  double v44;
  CGFloat v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  BOOL v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  UIView *ratingView;
  double v61;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double MidY;
  double v69;
  void *v70;
  double v71;
  BOOL v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CGRect recta;
  __objc2_class *v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  *(_QWORD *)&recta.size.height = self;
  v82 = SiriUIReviewItemCell;
  -[CGFloat layoutSubviews]((objc_super *)&recta.size.height, sel_layoutSubviews);
  -[SiriUIReviewItemCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  recta.origin.y = v8;
  recta.size.width = v7;
  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  right = self->_contentInsets.right;
  -[UILabel frame](self->_authorLabel, "frame");
  v13 = v12;
  -[UIView frame](self->_ratingView, "frame");
  v15 = v14;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  v18 = v17;
  -[UIView frame](self->_ratingView, "frame");
  v20 = ceil(v19);
  if (v18 >= 2.0)
    v20 = v19;
  v80 = v20;

  commentLabel = self->_commentLabel;
  recta.origin.x = v4;
  if (commentLabel)
  {
    if (v13 < v15)
      v13 = v15;
    v83.origin.x = v4;
    v83.origin.y = v6;
    y = recta.origin.y;
    v83.size.width = recta.size.width;
    v83.size.height = recta.origin.y;
    -[UILabel sizeThatFits:](commentLabel, "sizeThatFits:", CGRectGetWidth(v83) - left - right, v13);
    v24 = v23;
    v26 = v25;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "scale");
    v29 = v28 < 2.0;
    v30 = ceil(left);
    v31 = ceil(top);
    v32 = ceil(v24);
    v33 = ceil(v26);
    if (v29)
      v26 = v33;
    if (v29)
      v24 = v32;
    if (v29)
      v34 = v31;
    else
      v34 = top;
    v35 = left;
    if (v29)
      v36 = v30;
    else
      v36 = left;

    -[UILabel setFrame:](self->_commentLabel, "setFrame:", v36, v34, v24, v26);
    v84.origin.x = v36;
    v84.origin.y = v34;
    v84.size.width = v24;
    v84.size.height = v26;
    MaxY = CGRectGetMaxY(v84);
    -[UILabel font](self->_commentLabel, "font");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "descender");
    v79 = MaxY + v39;

    width = recta.size.width;
  }
  else
  {
    v79 = top;
    v35 = left;
    y = recta.origin.y;
    width = recta.size.width;
  }
  authorLabel = self->_authorLabel;
  v42 = v35;
  if (authorLabel)
  {
    -[UILabel frame](authorLabel, "frame");
    height = v85.size.height;
    v44 = v35 + v80;
    v85.origin.x = v35 + v80;
    v45 = y;
    v46 = v79 - CGRectGetHeight(v85);
    -[UILabel font](self->_authorLabel, "font");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "descender");
    v49 = v46 - v48 + 21.0;

    v86.origin.x = recta.origin.x;
    v86.origin.y = v6;
    v86.size.width = width;
    v86.size.height = v45;
    v50 = CGRectGetMaxX(v86) - v44;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "scale");
    v53 = v52 < 2.0;
    v54 = ceil(v44);
    v55 = ceil(v49);
    v56 = ceil(v50);
    v57 = ceil(height);
    if (v53)
      v58 = v54;
    else
      v58 = v44;
    if (v53)
      v49 = v55;
    if (v53)
      v50 = v56;
    if (v53)
      v59 = v57;
    else
      v59 = height;

    -[UILabel setFrame:](self->_authorLabel, "setFrame:", v58, v49, v50, v59);
  }
  ratingView = self->_ratingView;
  if (ratingView)
  {
    -[UIView frame](ratingView, "frame");
    v62 = v61;
    v64 = v63;
    v66 = v65;
    v67 = v42 + self->_ratingOffset.horizontal;
    -[UILabel frame](self->_authorLabel, "frame");
    MidY = CGRectGetMidY(v87);
    v88.origin.x = v67;
    v88.origin.y = v62;
    v88.size.width = v64;
    v88.size.height = v66;
    v69 = self->_ratingOffset.vertical + MidY + CGRectGetHeight(v88) * -0.5;
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "scale");
    v72 = v71 < 2.0;
    v73 = ceil(v67);
    v74 = ceil(v69);
    v75 = ceil(v64);
    v76 = ceil(v66);
    if (v72)
      v77 = v73;
    else
      v77 = v67;
    if (v72)
      v78 = v74;
    else
      v78 = v69;
    if (v72)
      v64 = v75;
    if (v72)
      v66 = v76;

    -[UIView setFrame:](self->_ratingView, "setFrame:", v77, v78, v64, v66);
  }
}

- (int64_t)characterLimit
{
  return self->_characterLimit;
}

- (void)setCharacterLimit:(int64_t)a3
{
  self->_characterLimit = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingView, 0);
  objc_storeStrong((id *)&self->_authorLabel, 0);
  objc_storeStrong((id *)&self->_commentLabel, 0);
}

@end
