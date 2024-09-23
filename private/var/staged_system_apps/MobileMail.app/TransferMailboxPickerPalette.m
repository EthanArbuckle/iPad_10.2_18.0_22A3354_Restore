@implementation TransferMailboxPickerPalette

- (TransferMailboxPickerPalette)initWithFrame:(CGRect)a3
{
  TransferMailboxPickerPalette *v3;
  TransferMailboxPickerPalette *v4;
  void *v5;
  id v6;
  double y;
  double width;
  double height;
  UILabel *v10;
  UILabel *sendersLabel;
  void *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *subjectLabel;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)TransferMailboxPickerPalette;
  v3 = -[TransferMailboxPickerPalette initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TransferMailboxPickerPalette setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
    -[TransferMailboxPickerPalette setOpaque:](v4, "setOpaque:", 0);
    -[TransferMailboxPickerPalette setBackgroundColor:](v4, "setBackgroundColor:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleHeadline1, 0x8000, 0));
    v6 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v10 = (UILabel *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    sendersLabel = v4->_sendersLabel;
    v4->_sendersLabel = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v5, 0.0));
    -[UILabel setFont:](v4->_sendersLabel, "setFont:", v12);

    -[UILabel setOpaque:](v4->_sendersLabel, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](v4->_sendersLabel, "setBackgroundColor:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_sendersLabel, "setTextColor:", v13);

    -[UILabel setLineBreakMode:](v4->_sendersLabel, "setLineBreakMode:", 4);
    -[UILabel setNumberOfLines:](v4->_sendersLabel, "setNumberOfLines:", 1);
    -[TransferMailboxPickerPalette addSubview:](v4, "addSubview:", v4->_sendersLabel);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleSubheadline2, 0x8000, 0));
    v15 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subjectLabel = v4->_subjectLabel;
    v4->_subjectLabel = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v14, 0.0));
    -[UILabel setFont:](v4->_subjectLabel, "setFont:", v17);

    -[UILabel setOpaque:](v4->_subjectLabel, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](v4->_subjectLabel, "setBackgroundColor:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_subjectLabel, "setTextColor:", v18);

    -[UILabel setLineBreakMode:](v4->_subjectLabel, "setLineBreakMode:", 4);
    -[UILabel setNumberOfLines:](v4->_subjectLabel, "setNumberOfLines:", 1);
    -[TransferMailboxPickerPalette addSubview:](v4, "addSubview:", v4->_subjectLabel);

  }
  return v4;
}

- (void)setSubject:(id)a3
{
  -[UILabel setText:](self->_subjectLabel, "setText:", a3);
}

- (NSString)subject
{
  return -[UILabel text](self->_subjectLabel, "text");
}

- (void)setMessageThumbnailWithView:(id)a3
{
  id v4;
  __n128 v5;
  UIImageView *messageThumbnailView;
  UIImageView *v7;
  double width;
  double height;
  double v10;
  double v11;
  unint64_t messageCount;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  UIImageView *v19;
  UIImageView *v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  TransferMailboxPickerPalette *v26;
  _QWORD *v27;
  double v28;
  double v29;
  uint64_t v30;
  _QWORD v31[3];
  unint64_t v32;

  v4 = a3;
  messageThumbnailView = self->_messageThumbnailView;
  if (messageThumbnailView)
  {
    -[UIImageView removeFromSuperview](messageThumbnailView, "removeFromSuperview");
    v7 = self->_messageThumbnailView;
    self->_messageThumbnailView = 0;

  }
  if (v4)
  {
    objc_msgSend(v4, "bounds");
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  v5.n128_f64[0] = height * (35.0 / width);
  v10 = UIRoundToViewScale(self, v5);
  if (v10 <= 58.0)
    v11 = v10;
  else
    v11 = 58.0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  messageCount = self->_messageCount;
  v32 = messageCount;
  if (!messageCount)
  {
    messageCount = 1;
    goto LABEL_13;
  }
  if (messageCount >= 4)
  {
    messageCount = 3;
LABEL_13:
    v32 = messageCount;
  }
  v13 = objc_alloc((Class)UIGraphicsImageRenderer);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat"));
  v15 = objc_msgSend(v13, "initWithSize:format:", v14, 35.0, v11 + (double)(messageCount - 1) * 2.5);

  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_1001E29C4;
  v24 = &unk_100523A78;
  v27 = v31;
  v16 = v4;
  v28 = v11 + (double)(messageCount - 1) * 2.5;
  v29 = v11;
  v30 = 0x4041800000000000;
  v25 = v16;
  v26 = self;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageWithActions:", &v21));
  v18 = objc_alloc((Class)UIImageView);
  v19 = (UIImageView *)objc_msgSend(v18, "initWithImage:", v17, v21, v22, v23, v24);
  v20 = self->_messageThumbnailView;
  self->_messageThumbnailView = v19;

  -[TransferMailboxPickerPalette addSubview:](self, "addSubview:", self->_messageThumbnailView);
  -[TransferMailboxPickerPalette setNeedsLayout](self, "setNeedsLayout");

  _Block_object_dispose(v31, 8);
}

- (void)_drawThumbnailInContext:(CGContext *)a3 view:(id)a4 frame:(CGRect)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  id v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v26 = a4;
  if (v26)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailAppBackgroundColor](UIColor, "mailAppBackgroundColor"));
    objc_msgSend(v11, "set");

    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    CGContextFillRect(a3, v27);
    objc_msgSend(v26, "bounds");
    v13 = v12;
    v15 = v14;
    CGContextSaveGState(a3);
    CGContextTranslateCTM(a3, x, y);
    CGContextScaleCTM(a3, width / v13, height / v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layer"));
    objc_msgSend(v16, "renderInContext:", a3);

    CGContextRestoreGState(a3);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v17, "set");

    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    CGContextFillRect(a3, v28);
  }
  -[TransferMailboxPickerPalette mui_currentScreenScale](self, "mui_currentScreenScale");
  v19 = 1.0 / v18;
  v20 = 1.0 / v18 * 0.5;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v30 = CGRectInset(v29, v20, v20);
  v21 = v30.origin.x;
  v22 = v30.origin.y;
  v23 = v30.size.width;
  v24 = v30.size.height;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.843137255, 1.0));
  objc_msgSend(v25, "set");

  v31.origin.x = v21;
  v31.origin.y = v22;
  v31.size.width = v23;
  v31.size.height = v24;
  CGContextStrokeRectWithWidth(a3, v31, v19);

}

- (id)_senderStringForWidth:(double)a3
{
  uint64_t v5;
  double v6;
  double v7;
  NSUInteger v8;
  uint64_t v9;
  size_t v10;
  char *v11;
  unint64_t v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  NSArray *senders;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v36;
  id v37;
  char *v38;
  char *v39;
  id v40;

  if (-[NSArray count](self->_senders, "count"))
  {
    v40 = (id)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_sendersLabel, "font"));
    v5 = MFLocalizedAddressSeparator();
    v37 = (id)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v37, "_legacy_sizeWithFont:", v40);
    v7 = v6;
    v8 = -[NSArray count](self->_senders, "count");
    v36 = (uint64_t)&v36;
    v9 = __chkstk_darwin(v8);
    v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v9)
      memset((char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 255, v10);
    v12 = 0;
    v38 = v11;
    v39 = v11 - 8;
    v13 = 0.0;
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_senders, "objectAtIndex:", v12));
      objc_msgSend(v14, "_legacy_sizeWithFont:", v40);
      v16 = v15;
      *(double *)&v11[8 * v12] = v15;

      if (v12)
      {
        v16 = v7 + v16;
        *(double *)&v11[8 * v12] = v16;
      }
      v17 = v13 + v16;
      if (v13 + v16 <= a3)
      {
        ++v12;
        v13 = v13 + v16;
      }
      else
      {
        v18 = -(uint64_t)v12;
        v19 = (double *)&v39[8 * v12];
        while (1)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter ef_formatInteger:withGrouping:](NSNumberFormatter, "ef_formatInteger:withGrouping:", (char *)-[NSArray count](self->_senders, "count") + v18, 1));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("AND_N_MORE"), &stru_100531B00, CFSTR("Main")));

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v20));
          objc_msgSend(v23, "_legacy_sizeWithFont:", v40);
          v25 = v24;

          if (!v18 || v13 + v25 <= a3)
            break;
          v26 = *v19--;
          v13 = v13 - v26;

          ++v18;
        }

        v12 = -v18;
        v11 = v38;
      }
    }
    while (v12 < -[NSArray count](self->_senders, "count") && v17 <= a3);
    senders = self->_senders;
    if (v12)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](senders, "subarrayWithRange:", 0, v12));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "ef_map:", &stru_100523A98));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "componentsJoinedByString:", v37));

      if (v12 < -[NSArray count](self->_senders, "count"))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter ef_formatInteger:withGrouping:](NSNumberFormatter, "ef_formatInteger:withGrouping:", (char *)-[NSArray count](self->_senders, "count") - v12, 1));
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("AND_N_MORE"), &stru_100531B00, CFSTR("Main")));

        v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringByAppendingFormat:", v33, v31));
        v30 = (void *)v34;
      }
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](senders, "objectAtIndex:", 0));
    }

  }
  else
  {
    v30 = 0;
  }
  return v30;
}

- (void)layoutSubviews
{
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double height;
  double v20;
  double v21;
  void *v22;
  double v23;
  __n128 v24;
  double v25;
  double v26;
  __n128 v27;
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
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  objc_super v46;
  CGRect v47;

  v46.receiver = self;
  v46.super_class = (Class)TransferMailboxPickerPalette;
  -[TransferMailboxPickerPalette layoutSubviews](&v46, "layoutSubviews");
  v3 = -[TransferMailboxPickerPalette mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
  -[TransferMailboxPickerPalette _contentRect](self, "_contentRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = v8 + -67.0 + -16.0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransferMailboxPickerPalette _senderStringForWidth:](self, "_senderStringForWidth:", v12));
  -[UILabel setText:](self->_sendersLabel, "setText:", v13);

  v14 = v5;
  v15 = v7;
  v16 = v9;
  v17 = v11;
  if ((v3 & 1) != 0)
    v18 = CGRectGetMaxX(*(CGRect *)&v14) - v12 + -67.0;
  else
    v18 = CGRectGetMinX(*(CGRect *)&v14) + 67.0;
  height = CGSizeZero.height;
  -[UILabel sizeThatFits:](self->_sendersLabel, "sizeThatFits:", CGSizeZero.width, height);
  -[UILabel setFrame:](self->_sendersLabel, "setFrame:", v18, 0.0, v12, v20);
  -[UILabel sizeThatFits:](self->_subjectLabel, "sizeThatFits:", CGSizeZero.width, height);
  -[UILabel setFrame:](self->_subjectLabel, "setFrame:", v18, 0.0, v12, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_subjectLabel, "font"));
  objc_msgSend(v22, "_bodyLeading");
  v24.n128_f64[0] = v23 * 0.5;
  v25 = UIRoundToViewScale(self, v24);

  -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_sendersLabel, "_firstLineBaselineOffsetFromBoundsTop");
  -[UILabel _setFirstLineCapFrameOriginY:](self->_subjectLabel, "_setFirstLineCapFrameOriginY:", v25 + v26);
  -[UILabel frame](self->_subjectLabel, "frame");
  v27.n128_f64[0] = (v11 - CGRectGetMaxY(v47)) * 0.5;
  v28 = UIRoundToViewScale(self, v27);
  -[UILabel frame](self->_sendersLabel, "frame");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  -[UILabel frame](self->_subjectLabel, "frame");
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v43 = v28 + v32;
  v45 = v28 + v44;
  -[UILabel setFrame:](self->_sendersLabel, "setFrame:", v30, v43, v34, v36);
  -[UILabel setFrame:](self->_subjectLabel, "setFrame:", v38, v45, v40, v42);
  if (self->_messageThumbnailView)
  {
    -[TransferMailboxPickerPalette messageThumbnailViewFrame](self, "messageThumbnailViewFrame");
    -[UIImageView setFrame:](self->_messageThumbnailView, "setFrame:");
  }
}

- (CGRect)messageThumbnailViewFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double MaxX;
  __n128 v25;
  double MinX;
  CGFloat x;
  __n128 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  -[UIImageView frame](self->_messageThumbnailView, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TransferMailboxPickerPalette _contentRect](self, "_contentRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = -[TransferMailboxPickerPalette mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
  v20 = v12;
  v21 = v14;
  v22 = v16;
  v23 = v18;
  if ((v19 & 1) != 0)
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v20);
    v33.origin.x = v4;
    v33.origin.y = v6;
    v33.size.width = v8;
    v33.size.height = v10;
    v25.n128_f64[0] = MaxX - (CGRectGetWidth(v33) * -0.5 + 67.0);
  }
  else
  {
    MinX = CGRectGetMinX(*(CGRect *)&v20);
    v34.origin.x = v4;
    v34.origin.y = v6;
    v34.size.width = v8;
    v34.size.height = v10;
    v25.n128_f64[0] = MinX + (67.0 - CGRectGetWidth(v34)) * 0.5;
  }
  v35.origin.x = UIRoundToViewScale(self, v25);
  x = v35.origin.x;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  v28.n128_f64[0] = (68.0 - CGRectGetHeight(v35)) * 0.5;
  v29 = UIRoundToViewScale(self, v28);
  v30 = x;
  v31 = v8;
  v32 = v10;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v29;
  result.origin.x = v30;
  return result;
}

- (CGRect)_contentRect
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
  double v13;
  CGRect result;

  -[TransferMailboxPickerPalette safeAreaInsets](self, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  -[TransferMailboxPickerPalette bounds](self, "bounds");
  v9 = v4 + v8;
  v11 = v10 + 0.0;
  v13 = v12 - (v4 + v6);
  result.size.height = v7;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  objc_msgSend((id)objc_opt_class(self), "defaultHeight");
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

+ (double)defaultHeight
{
  return 68.0;
}

- (UIView)messageThumbnailView
{
  return &self->_messageThumbnailView->super;
}

- (NSArray)senders
{
  return self->_senders;
}

- (void)setSenders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)messageCount
{
  return self->_messageCount;
}

- (void)setMessageCount:(unint64_t)a3
{
  self->_messageCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageThumbnailView, 0);
  objc_storeStrong((id *)&self->_subjectLabel, 0);
  objc_storeStrong((id *)&self->_sendersLabel, 0);
  objc_storeStrong((id *)&self->_senders, 0);
}

@end
