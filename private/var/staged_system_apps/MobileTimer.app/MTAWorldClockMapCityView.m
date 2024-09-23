@implementation MTAWorldClockMapCityView

+ (id)secondaryLabelFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.0);
}

- (MTAWorldClockMapCityView)initWithCity:(id)a3
{
  id v4;
  MTAWorldClockMapCityView *v5;
  void *v6;
  UILabel *v7;
  UILabel *timeLabel;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  id v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  UILabel *nameLabel;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MTAWorldClockMapCityView;
  v5 = -[MTAWorldClockMapCityView initWithFrame:](&v30, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MTAWorldClockMapCityView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = (UILabel *)objc_alloc_init((Class)UILabel);
    timeLabel = v5->_timeLabel;
    v5->_timeLabel = v7;

    v9 = v5->_timeLabel;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

    v11 = v5->_timeLabel;
    v12 = objc_msgSend((id)objc_opt_class(v5), "secondaryLabelFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[UILabel setFont:](v11, "setFont:", v13);

    v14 = v5->_timeLabel;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    -[UILabel setAdjustsFontSizeToFitWidth:](v5->_timeLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[MTAWorldClockMapCityView addSubview:](v5, "addSubview:", v5->_timeLabel);
    v16 = (UILabel *)objc_alloc_init((Class)UILabel);
    nameLabel = v5->_nameLabel;
    v5->_nameLabel = v16;

    v18 = v5->_nameLabel;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v18, "setBackgroundColor:", v19);

    v20 = v5->_nameLabel;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 15.0));
    -[UILabel setFont:](v20, "setFont:", v21);

    v22 = v5->_nameLabel;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v22, "setTextColor:", v23);

    -[MTAWorldClockMapCityView addSubview:](v5, "addSubview:", v5->_nameLabel);
    v24 = objc_alloc((Class)UIImageView);
    v25 = sub_10004C02C();
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = objc_msgSend(v24, "initWithImage:", v26);
    -[MTAWorldClockMapCityView setDotImageView:](v5, "setDotImageView:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockMapCityView dotImageView](v5, "dotImageView"));
    -[MTAWorldClockMapCityView addSubview:](v5, "addSubview:", v28);

    -[MTAWorldClockMapCityView setIconPlacement:](v5, "setIconPlacement:", 1);
    -[MTAWorldClockMapCityView setCity:](v5, "setCity:", v4);
  }

  return v5;
}

- (void)setTimeFormatter:(id)a3
{
  NSDateFormatter *v4;
  NSDateFormatter *timeFormatter;
  NSDateFormatter *v6;
  void *v7;
  id v8;

  if (self->_timeFormatter != a3)
  {
    v4 = (NSDateFormatter *)objc_msgSend(a3, "copy");
    timeFormatter = self->_timeFormatter;
    self->_timeFormatter = v4;

    v6 = self->_timeFormatter;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[WorldClockCity timeZone](self->_city, "timeZone"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v8));
    -[NSDateFormatter setTimeZone:](v6, "setTimeZone:", v7);

  }
}

- (double)timeLabelWidth
{
  double v2;

  -[UILabel frame](self->_timeLabel, "frame");
  return v2;
}

- (void)setTimeLabelWidth:(double)a3
{
  UILabel *timeLabel;
  NSDateFormatter *timeFormatter;
  void *v6;
  void *v7;

  timeLabel = self->_timeLabel;
  timeFormatter = self->_timeFormatter;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](timeFormatter, "stringFromDate:", v6));
  -[UILabel setText:](timeLabel, "setText:", v7);

  -[UILabel sizeToFit](self->_timeLabel, "sizeToFit");
  -[UILabel frame](self->_timeLabel, "frame");
  -[UILabel setFrame:](self->_timeLabel, "setFrame:");
}

- (void)setCity:(id)a3
{
  NSDateFormatter *timeFormatter;
  void *v6;
  void *v7;
  UILabel *nameLabel;
  void *v9;
  WorldClockCity *v10;

  v10 = (WorldClockCity *)a3;
  if (self->_city != v10)
  {
    objc_storeStrong((id *)&self->_city, a3);
    timeFormatter = self->_timeFormatter;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WorldClockCity timeZone](v10, "timeZone"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", v6));
    -[NSDateFormatter setTimeZone:](timeFormatter, "setTimeZone:", v7);

    -[MTAWorldClockMapCityView updateTime](self, "updateTime");
    nameLabel = self->_nameLabel;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WorldClockCity name](v10, "name"));
    -[UILabel setText:](nameLabel, "setText:", v9);

    -[UILabel sizeToFit](self->_nameLabel, "sizeToFit");
    -[MTAWorldClockMapCityView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[UILabel bounds](self->_timeLabel, "bounds", a3.width, a3.height);
  v5 = v4;
  -[UILabel bounds](self->_nameLabel, "bounds");
  v7 = fmax(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockMapCityView dotImageView](self, "dotImageView"));
  objc_msgSend(v8, "bounds");
  v10 = v7 + v9 + 4.0;

  v11 = 48.0;
  v12 = v10;
  result.height = v11;
  result.width = v12;
  return result;
}

- (CGRect)dotImageFrameForPlacement:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[MTAWorldClockMapCityView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockMapCityView dotImageView](self, "dotImageView"));
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;

  v14 = v6 - v11;
  if (a3 == 1)
    v14 = 0.0;
  v15 = (v8 - v13) * 0.5;
  v16 = floorf(v15);
  v17 = v11;
  v18 = v13;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v14;
  return result;
}

- (id)labelViews
{
  UILabel *nameLabel;
  _QWORD v4[2];

  nameLabel = self->_nameLabel;
  v4[0] = self->_timeLabel;
  v4[1] = nameLabel;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 2));
}

- (CGSize)sizeForIntersectionWithCityView:(id)a3 atOrigin:(CGPoint)a4 selfOrigin:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  id v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat width;
  CGFloat height;
  void *v15;
  void *v16;
  id v17;
  uint64_t *v18;
  char *v19;
  _QWORD *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  void *i;
  double *v46;
  double v47;
  CGFloat *v48;
  char *v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat *v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  double v74;
  double v75;
  uint64_t v76;
  id v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  double v90;
  double v91;
  CGSize result;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v10 = a3;
  -[MTAWorldClockMapCityView layoutIfNeeded](self, "layoutIfNeeded");
  objc_msgSend(v10, "layoutIfNeeded");
  -[MTAWorldClockMapCityView frame](self, "frame");
  v94 = CGRectOffset(v93, x, y);
  v11 = v94.origin.x;
  v12 = v94.origin.y;
  width = v94.size.width;
  height = v94.size.height;
  -[MTAWorldClockMapCityView frame](self, "frame");
  v122 = CGRectOffset(v95, v8, v7);
  v96.origin.x = v11;
  v96.origin.y = v12;
  v96.size.width = width;
  v96.size.height = height;
  if (CGRectIntersectsRect(v96, v122))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockMapCityView labelViews](self, "labelViews"));
    v77 = v10;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "labelViews"));
    v17 = objc_msgSend(v15, "count");
    v76 = (uint64_t)&v76;
    v18 = &v76 - 4 * (_QWORD)v17;
    if (v17)
    {
      v19 = 0;
      v20 = v18 + 2;
      v21 = v18 + 2;
      do
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v19, v76));
        objc_msgSend(v22, "frame");
        v98 = CGRectOffset(v97, x, y);
        *(CGRect *)(v20 - 2) = CGRectInset(v98, 0.0, 2.0);
        v20 += 4;

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v19));
        objc_msgSend(v23, "frame");
        v100 = CGRectOffset(v99, v8, v7);
        *(CGRect *)(v21 - 2) = CGRectInset(v100, 0.0, 2.0);
        v21 += 4;

        ++v19;
      }
      while (v17 != v19);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockMapCityView dotImageView](self, "dotImageView", v76));
    objc_msgSend(v24, "frame");
    v102 = CGRectOffset(v101, x, y);
    v103 = CGRectInset(v102, 1.0, 2.0);
    v25 = v103.origin.x;
    v84 = v103.origin.y;
    v85 = v103.origin.x;
    v26 = v103.origin.y;
    v27 = v103.size.width;
    v28 = v103.size.height;

    v10 = v77;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "dotImageView"));
    objc_msgSend(v29, "frame");
    v105 = CGRectOffset(v104, v8, v7);
    v106 = CGRectInset(v105, 1.0, 2.0);
    v30 = v106.origin.x;
    v82 = v106.origin.y;
    v83 = v106.origin.x;
    v31 = v106.origin.y;
    v80 = v106.size.height;
    v81 = v106.size.width;

    v32 = CGSizeZero.height;
    v90 = CGSizeZero.width;
    v91 = v32;
    v107.origin.x = v25;
    v107.origin.y = v26;
    v107.size.width = v27;
    v107.size.height = v28;
    v108 = CGRectInset(v107, 1.0, 2.0);
    v33 = v108.origin.x;
    v34 = v108.origin.y;
    v35 = v108.size.width;
    v36 = v108.size.height;
    v108.origin.x = v30;
    v108.origin.y = v31;
    v38 = v80;
    v37 = v81;
    v108.size.width = v81;
    v108.size.height = v80;
    v123 = CGRectInset(v108, 1.0, 2.0);
    v109.origin.x = v33;
    v109.origin.y = v34;
    v109.size.width = v35;
    v109.size.height = v36;
    v110 = CGRectIntersection(v109, v123);
    v39 = v90 + v110.size.width;
    v110.origin.y = v84;
    v110.origin.x = v85;
    v79 = v27;
    v110.size.width = v27;
    v78 = v28;
    v110.size.height = v28;
    v111 = CGRectInset(v110, 1.0, 2.0);
    v40 = v111.origin.x;
    v41 = v111.origin.y;
    v42 = v111.size.width;
    v43 = v111.size.height;
    v111.origin.y = v82;
    v111.origin.x = v83;
    v111.size.width = v37;
    v111.size.height = v38;
    v124 = CGRectInset(v111, 1.0, 2.0);
    v112.origin.x = v40;
    v112.origin.y = v41;
    v112.size.width = v42;
    v112.size.height = v43;
    v113 = CGRectIntersection(v112, v124);
    v44 = v91 + v113.size.height;
    if (v17)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        v91 = v44;
        v46 = (double *)&v18[4 * (_QWORD)i];
        v47 = *v46;
        v87 = v46[1];
        v88 = v47;
        v89 = v46[2];
        v86 = v46[3];
        v48 = (CGFloat *)(v18 + 2);
        v49 = (char *)v17;
        v50 = v39;
        do
        {
          v51 = *(v48 - 2);
          v52 = *(v48 - 1);
          v125.size.width = *v48;
          v53 = v48[1];
          v48 += 4;
          v90 = v125.size.width;
          v54 = v87;
          v55 = v88;
          v114.origin.x = v88;
          v114.origin.y = v87;
          v56 = v89;
          v114.size.width = v89;
          v57 = v86;
          v114.size.height = v86;
          v125.origin.x = v51;
          v125.origin.y = v52;
          v125.size.height = v53;
          v115 = CGRectIntersection(v114, v125);
          v50 = v50 + v115.size.width;
          v115.origin.x = v55;
          v115.origin.y = v54;
          v115.size.width = v56;
          v115.size.height = v57;
          v126.origin.x = v51;
          v126.origin.y = v52;
          v126.size.width = v90;
          v126.size.height = v53;
          v116 = CGRectIntersection(v115, v126);
          v91 = v91 + v116.size.height;
          --v49;
        }
        while (v49);
        v59 = v87;
        v58 = v88;
        v117.origin.x = v88;
        v117.origin.y = v87;
        v117.size.width = v89;
        v60 = v86;
        v117.size.height = v86;
        v62 = v82;
        v61 = v83;
        v127.origin.x = v83;
        v127.origin.y = v82;
        v64 = v80;
        v63 = v81;
        v127.size.width = v81;
        v127.size.height = v80;
        v118 = CGRectIntersection(v117, v127);
        v90 = v50 + v118.size.width;
        v118.origin.x = v58;
        v118.origin.y = v59;
        v118.size.width = v89;
        v118.size.height = v60;
        v128.origin.x = v61;
        v128.origin.y = v62;
        v128.size.width = v63;
        v128.size.height = v64;
        v119 = CGRectIntersection(v118, v128);
        v91 = v91 + v119.size.height;
        v65 = (CGFloat *)&v18[4 * (_QWORD)i];
        v67 = *v65;
        v66 = v65[1];
        v68 = v65[2];
        v69 = v65[3];
        v119.origin.x = *v65;
        v119.origin.y = v66;
        v119.size.width = v68;
        v119.size.height = v69;
        v71 = v84;
        v70 = v85;
        v129.origin.x = v85;
        v129.origin.y = v84;
        v72 = v79;
        v129.size.width = v79;
        v73 = v78;
        v129.size.height = v78;
        v120 = CGRectIntersection(v119, v129);
        v120.origin.x = v67;
        v39 = v90 + v120.size.width;
        v120.origin.y = v66;
        v120.size.width = v68;
        v120.size.height = v69;
        v130.origin.x = v70;
        v130.origin.y = v71;
        v130.size.width = v72;
        v130.size.height = v73;
        v121 = CGRectIntersection(v120, v130);
        v44 = v91 + v121.size.height;
      }
    }

  }
  else
  {
    v39 = CGSizeZero.width;
    v44 = CGSizeZero.height;
  }

  v74 = v39;
  v75 = v44;
  result.height = v75;
  result.width = v74;
  return result;
}

- (CGPoint)hotspotOffsetForPlacement:(unint64_t)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  double MidY;
  double v9;
  CGPoint result;
  CGRect v11;
  CGRect v12;

  -[MTAWorldClockMapCityView dotImageFrameForPlacement:](self, "dotImageFrameForPlacement:", a3);
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  MidX = CGRectGetMidX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  MidY = CGRectGetMidY(v12);
  v9 = MidX;
  result.y = MidY;
  result.x = v9;
  return result;
}

- (CGPoint)hotspotOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[MTAWorldClockMapCityView hotspotOffsetForPlacement:](self, "hotspotOffsetForPlacement:", self->_iconPlacement);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)layoutIfNeeded
{
  objc_super v3;

  if (!self->_doneFirstLayout)
    -[MTAWorldClockMapCityView setNeedsLayout](self, "setNeedsLayout");
  v3.receiver = self;
  v3.super_class = (Class)MTAWorldClockMapCityView;
  -[MTAWorldClockMapCityView layoutIfNeeded](&v3, "layoutIfNeeded");
}

- (void)layoutSubviews
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
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UILabel *timeLabel;
  double v22;
  double v23;
  CGFloat v24;
  float v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;

  self->_doneFirstLayout = 1;
  -[MTAWorldClockMapCityView bounds](self, "bounds");
  v27 = v3;
  -[MTAWorldClockMapCityView dotImageFrameForPlacement:](self, "dotImageFrameForPlacement:", self->_iconPlacement);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAWorldClockMapCityView dotImageView](self, "dotImageView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[UILabel frame](self->_timeLabel, "frame");
  v14 = v13;
  v16 = v15;
  -[UILabel frame](self->_nameLabel, "frame");
  v18 = v17;
  v20 = v19;
  timeLabel = self->_timeLabel;
  if (self->_iconPlacement == 1)
  {
    -[UILabel setTextAlignment:](timeLabel, "setTextAlignment:", 0);
    -[UILabel setTextAlignment:](self->_nameLabel, "setTextAlignment:", 0);
    v28.origin.x = v5;
    v28.origin.y = v7;
    v28.size.width = v9;
    v28.size.height = v11;
    v22 = CGRectGetMaxX(v28) + 4.0;
    v23 = v22;
  }
  else
  {
    -[UILabel setTextAlignment:](timeLabel, "setTextAlignment:", 2);
    -[UILabel setTextAlignment:](self->_nameLabel, "setTextAlignment:", 2);
    v29.origin.x = v5;
    v29.origin.y = v7;
    v29.size.width = v9;
    v29.size.height = v11;
    v24 = CGRectGetMinX(v29) + -4.0;
    v22 = v24 - v14;
    v23 = v24 - v18;
  }
  v25 = (v27 - v20) * 0.5;
  v26 = floorf(v25);
  -[UILabel setFrame:](self->_timeLabel, "setFrame:", v22, v27 - v16, v14, v16);
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", v23, v26, v18, v20);
}

- (void)setIconPlacement:(unint64_t)a3
{
  if (self->_iconPlacement != a3)
  {
    self->_iconPlacement = a3;
    -[MTAWorldClockMapCityView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)runMode
{
  return 0;
}

- (void)updateTime
{
  UILabel *timeLabel;
  NSDateFormatter *timeFormatter;
  void *v4;
  id v5;

  timeLabel = self->_timeLabel;
  timeFormatter = self->_timeFormatter;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](timeFormatter, "stringFromDate:", v5));
  -[UILabel setText:](timeLabel, "setText:", v4);

}

- (void)start
{
  +[MTUIAnalogClockView registerClock:](MTUIAnalogClockView, "registerClock:", self);
  -[MTAWorldClockMapCityView updateTime](self, "updateTime");
}

- (void)stop
{
  +[MTUIAnalogClockView unregisterClock:](MTUIAnalogClockView, "unregisterClock:", self);
}

- (WorldClockCity)city
{
  return self->_city;
}

- (NSDateFormatter)timeFormatter
{
  return self->_timeFormatter;
}

- (unint64_t)iconPlacement
{
  return self->_iconPlacement;
}

- (UIImageView)dotImageView
{
  return self->_dotImageView;
}

- (void)setDotImageView:(id)a3
{
  objc_storeStrong((id *)&self->_dotImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotImageView, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
}

@end
