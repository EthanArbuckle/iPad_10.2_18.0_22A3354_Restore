@implementation DirectionsStartEndContentView

+ ($8452678F12DBC466148836A9D382CAFC)cellMetricsForIdiom:(SEL)a3
{
  $8452678F12DBC466148836A9D382CAFC *result;

  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  result = +[DirectionsStepTableViewCell cellMetricsForIdiom:](DirectionsStepTableViewCell, "cellMetricsForIdiom:");
  if (a4 != 5)
    *(_OWORD *)&retstr->var0 = xmmword_100E35110;
  return result;
}

+ (id)overviewFontProvider
{
  void *v2;
  id v3;
  Block_layout *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == (id)5)
    v4 = &stru_1011E7A38;
  else
    v4 = &stru_1011E7C38;
  return objc_retainBlock(v4);
}

+ (id)subtitleFontProvider
{
  void *v2;
  id v3;
  Block_layout *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == (id)5)
    v4 = &stru_1011E7A38;
  else
    v4 = &stru_1011E7A78;
  return objc_retainBlock(v4);
}

+ (id)subtitleDefaultFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0);
}

- (double)_topPaddingUsingFont:(id)a3 metrics:(id *)a4
{
  id v6;
  uint64_t v7;
  double var0;
  double v9;

  v6 = a3;
  v7 = sub_1002A8AA0(self);
  var0 = a4->var0;
  if (v7 != 5)
  {
    objc_msgSend(v6, "ascender");
    var0 = var0 - v9;
  }

  return var0;
}

+ (double)labelSpacing
{
  return 10.0;
}

- (double)_bottomPaddingUsingFont:(id)a3 metrics:(id *)a4
{
  id v6;
  uint64_t v7;
  double var1;
  double v9;

  v6 = a3;
  v7 = sub_1002A8AA0(self);
  var1 = a4->var1;
  if (v7 != 5)
  {
    objc_msgSend(v6, "descender");
    var1 = var1 - v9;
  }

  return var1;
}

+ (unint64_t)iconSize
{
  return 2;
}

+ (BOOL)useMarkerFallback
{
  return 1;
}

- (void)configureForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend((id)objc_opt_class(self), "_overviewTitleForWaypoint:route:", v12, v11);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  -[UILabel setText:](self->_overviewLabel, "setText:", v14);

  v15 = objc_msgSend((id)objc_opt_class(self), "_subtitleForWaypoint:route:selectedVehicle:displayedInRoutePlanning:", v12, v11, v10, v6);
  v17 = (id)objc_claimAutoreleasedReturnValue(v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_subtitleLabel, "attributedText"));
  LOBYTE(v14) = objc_msgSend(v16, "isEqualToAttributedString:", v17);

  -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v17);
  -[DirectionsStartEndContentView _setPinImageForWaypoint:](self, "_setPinImageForWaypoint:", v12);

  if ((v14 & 1) == 0)
    -[DirectionsStartEndContentView setNeedsLayout](self, "setNeedsLayout");

}

+ (id)_overviewTitleForWaypoint:(id)a3 route:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "_isStartWaypoint:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "legs"));

  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originListInstructionString"));

    if (!objc_msgSend(v10, "length"))
    {
      if (objc_msgSend(v5, "isDynamicCurrentLocation"))
      {
        v11 = MKLocalizedStringForCurrentLocation();
        v12 = objc_claimAutoreleasedReturnValue(v11);
LABEL_9:

        v10 = (void *)v12;
        goto LABEL_10;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = v14;
      v16 = CFSTR("Start [Directions Step]");
LABEL_8:
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, CFSTR("localized string not found"), 0));

      v10 = v15;
      goto LABEL_9;
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "destinationListInstructionString"));

    if (!objc_msgSend(v10, "length"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = v14;
      v16 = CFSTR("Arrive [Directions Step]");
      goto LABEL_8;
    }
  }
LABEL_10:

  return v10;
}

+ (id)_subtitleForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t (**v19)(void);
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  uint64_t (**v27)(void);
  uint64_t v28;
  void *v29;
  uint8_t v31[8];
  NSAttributedStringKey v32;
  void *v33;

  v9 = a3;
  v10 = a4;
  if ((objc_msgSend(v10, "_isChargingWaypoint:", v9) & 1) != 0)
  {
    if (a5)
    {
      v11 = objc_msgSend(v10, "_isStartWaypoint:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "steps"));
      v13 = v12;
      if ((v11 & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
        v15 = 0;
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
        v15 = 2;
      }

      v26 = objc_msgSend((id)objc_opt_class(a1), "subtitleFontProvider");
      v27 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(v26);
      v28 = v27[2]();
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "attributedChargeStringForWaypointType:font:textColor:includeDaysAgo:", v15, v29, 0, v11));

    }
    else
    {
      v24 = sub_10043214C();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to generate a proper subtitle for Directions cell. Waypoint was a charge stop, but there was no selected vehicle.", v31, 2u);
      }

      v23 = 0;
    }
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "singleLineAddress"));
    if (v16)
    {
      v17 = objc_alloc((Class)NSAttributedString);
      v32 = NSFontAttributeName;
      v18 = objc_msgSend((id)objc_opt_class(a1), "subtitleFontProvider");
      v19 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(v18);
      v20 = v19[2]();
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v33 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
      v23 = objc_msgSend(v17, "initWithString:attributes:", v16, v22);

    }
    else
    {
      v23 = 0;
    }

  }
  return v23;
}

- (double)heightForWaypoint:(id)a3 route:(id)a4 selectedVehicle:(id)a5 displayedInRoutePlanning:(BOOL)a6 width:(double)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t (**v19)(void);
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  id v37;
  uint64_t (**v38)(void);
  uint64_t v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  id v44;
  NSObject *v45;
  NSString *v46;
  void *v47;
  double v48;
  double v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE buf[32];
  _BYTE v56[32];
  double v57;
  __int16 v58;
  void *v59;
  CGRect v60;

  v8 = a6;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_opt_class(self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndContentView traitCollection](self, "traitCollection"));
  v17 = objc_msgSend(v16, "userInterfaceIdiom");
  if (v15)
  {
    objc_msgSend(v15, "cellMetricsForIdiom:", v17);
  }
  else
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
  }

  v18 = objc_msgSend((id)objc_opt_class(self), "overviewFontProvider");
  v19 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(v18);
  v20 = v19[2]();
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  *(_OWORD *)v56 = v53;
  *(_OWORD *)&v56[16] = v54;
  v57 = 0.0;
  *(_OWORD *)buf = v51;
  *(_OWORD *)&buf[16] = v52;
  -[DirectionsStartEndContentView _topPaddingUsingFont:metrics:](self, "_topPaddingUsingFont:metrics:", v21, buf);
  v23 = v22;

  v24 = UIFloorToViewScale(self, a7 - (*((double *)&v53 + 1) + *(double *)&v54 + *(double *)&v53 + *((double *)&v54 + 1)));
  v25 = objc_msgSend((id)objc_opt_class(self), "_overviewTitleForWaypoint:route:", v14, v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = objc_msgSend((id)objc_opt_class(self), "overviewFontProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  -[DirectionsStartEndContentView _heightForText:width:fontProvider:](self, "_heightForText:width:fontProvider:", v26, v28, v24);
  v30 = v29;

  v31 = v23 + 0.0 + v30;
  v32 = objc_msgSend((id)objc_opt_class(self), "_subtitleForWaypoint:route:selectedVehicle:displayedInRoutePlanning:", v14, v13, v12, v8);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);

  if (v33)
  {
    objc_msgSend((id)objc_opt_class(self), "labelSpacing");
    v35 = v31 + v34;
    -[DirectionsStartEndContentView _heightForAttributedText:width:](self, "_heightForAttributedText:width:", v33, v24);
    v31 = v35 + v36;
  }
  v37 = objc_msgSend((id)objc_opt_class(self), "subtitleFontProvider");
  v38 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(v37);
  v39 = v38[2]();
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  *(_OWORD *)v56 = v53;
  *(_OWORD *)&v56[16] = v54;
  v57 = 0.0;
  *(_OWORD *)buf = v51;
  *(_OWORD *)&buf[16] = v52;
  -[DirectionsStartEndContentView _bottomPaddingUsingFont:metrics:](self, "_bottomPaddingUsingFont:metrics:", v40, buf);
  v42 = v41;

  v43 = v31 + v42;
  if (v43 >= 0.0)
  {
    v49 = *((double *)&v52 + 1);
    if (*((double *)&v52 + 1) <= v43)
      v49 = v43;
    v48 = UIFloorToViewScale(self, v49);
  }
  else
  {
    v44 = sub_100431C0C();
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      -[DirectionsStartEndContentView bounds](self, "bounds");
      v46 = NSStringFromCGRect(v60);
      v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
      *(_DWORD *)buf = 134219778;
      *(double *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v26;
      *(_WORD *)v56 = 2112;
      *(_QWORD *)&v56[2] = v33;
      *(_WORD *)&v56[10] = 2048;
      *(double *)&v56[12] = v42;
      *(_WORD *)&v56[20] = 2048;
      *(double *)&v56[22] = v43;
      *(_WORD *)&v56[30] = 2048;
      v57 = a7;
      v58 = 2112;
      v59 = v47;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_FAULT, "Invalid height for start/end, topPadding: %f textHeight: %f topText: %@ bottomText: %@ bottomPadding: %f totalHeight: %f width: %f bounds: %@", buf, 0x52u);

    }
    v48 = 0.0;
  }

  return v48;
}

- (double)_heightForAttributedText:(id)a3 width:(double)a4
{
  double Height;
  CGRect v7;

  objc_msgSend(a3, "boundingRectWithSize:options:context:", 3, 0, a4, 2000.0);
  Height = CGRectGetHeight(v7);
  return UIFloorToViewScale(self, Height);
}

- (double)_heightForText:(id)a3 width:(double)a4 fontProvider:(id)a5
{
  uint64_t (*v8)(id);
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double Height;
  double v22;
  NSAttributedStringKey v24;
  void *v25;
  CGRect v26;

  v8 = (uint64_t (*)(id))*((_QWORD *)a5 + 2);
  v9 = a3;
  v10 = v8(a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v24 = NSFontAttributeName;
  v25 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 3, v12, 0, a4, 2000.0);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v26.origin.x = v14;
  v26.origin.y = v16;
  v26.size.width = v18;
  v26.size.height = v20;
  Height = CGRectGetHeight(v26);
  v22 = UIFloorToViewScale(self, Height);

  return v22;
}

- (DirectionsStartEndContentView)initWithFrame:(CGRect)a3
{
  DirectionsStartEndContentView *v3;
  DirectionsStartEndContentView *v4;
  UILabel *v5;
  UILabel *overviewLabel;
  UILabel *v7;
  id v8;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *subtitleLabel;
  UILabel *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIImageView *v19;
  UIImageView *pinView;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)DirectionsStartEndContentView;
  v3 = -[DirectionsStartEndContentView initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[DirectionsStartEndContentView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("DirectionsStartEndContent"));
    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    overviewLabel = v4->_overviewLabel;
    v4->_overviewLabel = v5;

    v7 = v4->_overviewLabel;
    v8 = objc_msgSend((id)objc_opt_class(v4), "overviewFontProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v7, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_overviewLabel, "setTextColor:", v10);

    -[UILabel setTextAlignment:](v4->_overviewLabel, "setTextAlignment:", +[NSLocale currentTextAlignment](NSLocale, "currentTextAlignment"));
    -[UILabel setBackgroundColor:](v4->_overviewLabel, "setBackgroundColor:", 0);
    -[UILabel setNumberOfLines:](v4->_overviewLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v4->_overviewLabel, "setLineBreakMode:", 0);
    -[UILabel setOpaque:](v4->_overviewLabel, "setOpaque:", 0);
    -[UILabel setAccessibilityIdentifier:](v4->_overviewLabel, "setAccessibilityIdentifier:", CFSTR("OverviewLabel"));
    -[DirectionsStartEndContentView addSubview:](v4, "addSubview:", v4->_overviewLabel);
    v11 = (UILabel *)objc_alloc_init((Class)UILabel);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v11;

    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0);
    v13 = v4->_subtitleLabel;
    v14 = objc_msgSend((id)objc_opt_class(v4), "subtitleFontProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v13, v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v16);

    -[UILabel setAccessibilityIdentifier:](v4->_subtitleLabel, "setAccessibilityIdentifier:", CFSTR("SubtitleLabel"));
    -[DirectionsStartEndContentView addSubview:](v4, "addSubview:", v4->_subtitleLabel);
    if (sub_1002A8AA0(v4) == 5)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      -[UILabel setHighlightedTextColor:](v4->_overviewLabel, "setHighlightedTextColor:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      -[UILabel setHighlightedTextColor:](v4->_subtitleLabel, "setHighlightedTextColor:", v18);

    }
    v19 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    pinView = v4->_pinView;
    v4->_pinView = v19;

    -[UIImageView setContentMode:](v4->_pinView, "setContentMode:", 4);
    -[UIImageView setAccessibilityIdentifier:](v4->_pinView, "setAccessibilityIdentifier:", CFSTR("PinView"));
    -[DirectionsStartEndContentView addSubview:](v4, "addSubview:", v4->_pinView);
    v4->_identifier = 0;
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  id v5;
  CGFloat y;
  double x;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double MinX;
  double Width;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double MaxY;
  double v26;
  double v27;
  void *v28;
  id v29;
  UILabel *subtitleLabel;
  void *v31;
  double MaxX;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *i;
  void *v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  objc_super v50;
  _BYTE v51[128];
  _QWORD v52[3];
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v50.receiver = self;
  v50.super_class = (Class)DirectionsStartEndContentView;
  -[DirectionsStartEndContentView layoutSubviews](&v50, "layoutSubviews");
  v49 = 0;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndContentView traitCollection](self, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");
  if (v3)
  {
    objc_msgSend(v3, "cellMetricsForIdiom:", v5);
  }
  else
  {
    v49 = 0;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
  }

  -[DirectionsStartEndContentView bounds](self, "bounds");
  y = v53.origin.y;
  v53.origin.x = v8 + *(double *)&v48 + *(double *)&v47 + *((double *)&v48 + 1);
  x = v53.origin.x;
  v9 = v53.size.width - (CGRectGetMinX(v53) + *((double *)&v47 + 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_overviewLabel, "text"));
  v11 = objc_msgSend((id)objc_opt_class(self), "overviewFontProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  -[DirectionsStartEndContentView _heightForText:width:fontProvider:](self, "_heightForText:width:fontProvider:", v10, v12, v9);
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_subtitleLabel, "attributedText"));
  -[DirectionsStartEndContentView _heightForAttributedText:width:](self, "_heightForAttributedText:width:", v15, v9);
  v17 = v16;

  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = v9;
  v54.size.height = v14;
  MinX = CGRectGetMinX(v54);
  v55.origin.x = x;
  v55.origin.y = y;
  v55.size.width = v9;
  v55.size.height = v14;
  Width = CGRectGetWidth(v55);
  v20 = 0.0;
  v56.origin.y = 0.0;
  v56.origin.x = MinX;
  v56.size.width = Width;
  v56.size.height = v17;
  if (CGRectGetHeight(v56) > 0.0)
  {
    objc_msgSend((id)objc_opt_class(self), "labelSpacing");
    v20 = v21;
  }
  v57.origin.x = x;
  v57.origin.y = y;
  v57.size.width = v9;
  v57.size.height = v14;
  v22 = v20 + CGRectGetHeight(v57);
  v58.origin.y = 0.0;
  v58.origin.x = MinX;
  v58.size.width = Width;
  v58.size.height = v17;
  v23 = v22 + CGRectGetHeight(v58);
  -[DirectionsStartEndContentView bounds](self, "bounds");
  v24 = (CGRectGetHeight(v59) - v23) * 0.5;
  v60.origin.x = x;
  v60.origin.y = v24;
  v60.size.width = v9;
  v60.size.height = v14;
  MaxY = CGRectGetMaxY(v60);
  objc_msgSend((id)objc_opt_class(self), "labelSpacing");
  v27 = MaxY + v26;
  -[UILabel setFrame:](self->_overviewLabel, "setFrame:", x, v24, v9, v14);
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", MinX, v27, Width, v17);
  -[DirectionsStartEndContentView _updateStyleValuesFromTheme](self, "_updateStyleValuesFromTheme");
  -[DirectionsStartEndContentView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_pinView, "setFrame:");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v29 = objc_msgSend(v28, "userInterfaceLayoutDirection");

  if (v29 == (id)1)
  {
    subtitleLabel = self->_subtitleLabel;
    v52[0] = self->_overviewLabel;
    v52[1] = subtitleLabel;
    v52[2] = self->_pinView;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 3));
    -[DirectionsStartEndContentView bounds](self, "bounds");
    MaxX = CGRectGetMaxX(v61);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v33 = v31;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v38, "frame", (_QWORD)v41);
          objc_msgSend(v38, "setFrame:", MaxX - v39 - v40);
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v35);
    }

  }
}

- (void)setIsDimmedStep:(BOOL)a3
{
  if (self->_isDimmedStep != a3)
  {
    self->_isDimmedStep = a3;
    -[DirectionsStartEndContentView _updateStyleValuesFromTheme](self, "_updateStyleValuesFromTheme");
  }
}

- (void)_updateStyleValuesFromTheme
{
  void *v3;
  double v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndContentView _labelColor](self, "_labelColor"));
  -[UILabel setTextColor:](self->_overviewLabel, "setTextColor:", v3);

  if (self->_isDimmedStep)
    -[DirectionsStartEndContentView _dimAlpha](self, "_dimAlpha");
  else
    v4 = 1.0;
  -[UIImageView setAlpha:](self->_pinView, "setAlpha:", v4);
}

- (double)_dimAlpha
{
  void *v2;
  double v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndContentView traitCollection](self, "traitCollection"));
  v3 = dbl_100E35020[objc_msgSend(v2, "userInterfaceStyle") == (id)2];

  return v3;
}

- (id)_labelColor
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  if (self->_isDimmedStep)
  {
    -[DirectionsStartEndContentView _dimAlpha](self, "_dimAlpha");
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "colorWithAlphaComponent:"));

    v3 = (void *)v4;
  }
  return v3;
}

- (void)_setPinImageForWaypoint:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t identifier;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  DirectionsStartEndContentView *v21;
  uint64_t v22;
  int64_t v23;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "responseSearch"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "responseSearch"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "place"));

    if (v8)
    {
      -[UIImageView setImage:](self->_pinView, "setImage:", 0);
      identifier = self->_identifier;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndContentView window](self, "window"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "screen"));
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStartEndContentView window](self, "window"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "screen"));
        objc_msgSend(v13, "scale");
        v15 = v14;

      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
        objc_msgSend(v12, "screenScale");
        v15 = v16;
      }

      global_queue = dispatch_get_global_queue(0, 0);
      v18 = objc_claimAutoreleasedReturnValue(global_queue);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100311C58;
      v19[3] = &unk_1011B15D8;
      v22 = v15;
      v20 = v4;
      v21 = self;
      v23 = identifier;
      dispatch_async(v18, v19);

    }
  }

}

- (void)prepareForReuse
{
  ++self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_overviewLabel, 0);
}

@end
