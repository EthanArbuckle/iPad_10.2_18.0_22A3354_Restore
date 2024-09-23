@implementation PHRecentsPersonFaceTimeHeaderSummaryView

- (PHRecentsPersonFaceTimeHeaderSummaryView)initWithFrame:(CGRect)a3 recentCall:(id)a4 occurrenceDate:(id)a5 status:(unsigned int)a6 duration:(double)a7 type:(unsigned int)a8 dataUsage:(int64_t)a9
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  PHRecentsPersonFaceTimeHeaderSummaryView *v19;
  uint64_t v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  int v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  _UNKNOWN **v38;
  double v39;
  double v40;
  id v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  id v58;
  id v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  unint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  id v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  id v96;
  void *v98;
  const __CFString *v99;
  id v100;
  void *v101;
  int v102;
  void *v103;
  uint64_t v104;
  objc_super v105;
  _QWORD v106[4];
  _QWORD v107[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = a4;
  v105.receiver = self;
  v105.super_class = (Class)PHRecentsPersonFaceTimeHeaderSummaryView;
  v19 = -[PHRecentsPersonFaceTimeHeaderSummaryView initWithFrame:](&v105, "initWithFrame:", x, y, width, height);
  if (!v19)
    goto LABEL_52;
  if (objc_msgSend(UIApp, "userInterfaceStyle") == 1)
    v20 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
    v20 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v21 = (void *)v20;
  v22 = objc_alloc((Class)UILabel);
  v23 = CGRectZero.origin.y;
  v24 = CGRectZero.size.width;
  v25 = CGRectZero.size.height;
  v26 = objc_msgSend(v22, "initWithFrame:", CGRectZero.origin.x, v23, v24, v25);
  v104 = UIFontDescriptorTextStyleCaption1;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont phPreferredBoldFontForTextStyle:](UIFont, "phPreferredBoldFontForTextStyle:"));
  objc_msgSend(v26, "setFont:", v27);

  objc_msgSend(v26, "setTextColor:", v21);
  -[PHRecentsPersonFaceTimeHeaderSummaryView addSubview:](v19, "addSubview:", v26);
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v28) = 1144750080;
  objc_msgSend(v26, "setContentCompressionResistancePriority:forAxis:", 0, v28);
  LODWORD(v29) = 1148846080;
  objc_msgSend(v26, "setContentCompressionResistancePriority:forAxis:", 1, v29);
  LODWORD(v30) = 1132068864;
  objc_msgSend(v26, "setContentHuggingPriority:forAxis:", 0, v30);
  LODWORD(v31) = 1148846080;
  objc_msgSend(v26, "setContentHuggingPriority:forAxis:", 1, v31);
  objc_msgSend(v26, "setNumberOfLines:", 0);
  v32 = kCHCallTypeFaceTimeAudio;
  if (kCHCallStatusMissed == a6)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v32 == a8)
      v34 = CFSTR("MISSED_FACETIME_AUDIO");
    else
      v34 = CFSTR("MISSED_FACETIME");
LABEL_20:
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", v34, &stru_10008B240, CFSTR("Recents")));
    v102 = 0;
LABEL_21:
    v37 = v104;
    v38 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
LABEL_22:

    goto LABEL_23;
  }
  if (kCHCallStatusCancelled == a6)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v32 == a8)
      v34 = CFSTR("CANCELED_FACETIME_AUDIO");
    else
      v34 = CFSTR("CANCELED_FACETIME");
    goto LABEL_20;
  }
  if (kCHCallStatusAnsweredElsewhere == a6)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v32 == a8)
      v34 = CFSTR("ANSWERED_ELSEWHERE_FACETIME_AUDIO");
    else
      v34 = CFSTR("ANSWERED_ELSEWHERE_FACETIME");
    goto LABEL_20;
  }
  if (kCHCallStatusConnectedOutgoing == a6)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v33 = v35;
    if (v32 == a8)
      v36 = CFSTR("OUTGOING_FACETIME_AUDIO");
    else
      v36 = CFSTR("OUTGOING_FACETIME");
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", v36, &stru_10008B240, CFSTR("Recents")));
    v102 = 1;
    goto LABEL_21;
  }
  if (kCHCallStatusConnectedIncoming == a6)
  {
    v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v33 = v98;
    v38 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
    if (v32 == a8)
      v99 = CFSTR("INCOMING_FACETIME_AUDIO");
    else
      v99 = CFSTR("INCOMING_FACETIME");
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "localizedStringForKey:value:table:", v99, &stru_10008B240, CFSTR("Recents")));
    v102 = 1;
    v37 = v104;
    goto LABEL_22;
  }
  v102 = 0;
  v103 = 0;
  v37 = v104;
  v38 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
LABEL_23:
  objc_msgSend(v26, "setText:", v103);
  objc_msgSend(v26, "sizeThatFits:", 177.0, 1.79769313e308);
  v40 = v39 + 0.0;
  v41 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, v23, v24, v25);
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38[458], "phPreferredBoldFontForTextStyle:", v37));
  objc_msgSend(v41, "setFont:", v42);

  objc_msgSend(v41, "setTextColor:", v21);
  -[PHRecentsPersonFaceTimeHeaderSummaryView addSubview:](v19, "addSubview:", v41);
  objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v43) = 1144750080;
  objc_msgSend(v41, "setContentCompressionResistancePriority:forAxis:", 0, v43);
  LODWORD(v44) = 1148846080;
  objc_msgSend(v41, "setContentCompressionResistancePriority:forAxis:", 1, v44);
  LODWORD(v45) = 1132068864;
  objc_msgSend(v41, "setContentHuggingPriority:forAxis:", 0, v45);
  LODWORD(v46) = 1148846080;
  objc_msgSend(v41, "setContentHuggingPriority:forAxis:", 1, v46);
  objc_msgSend(v41, "setNumberOfLines:", 1);
  objc_msgSend(v41, "setText:", v103);
  objc_msgSend(v41, "setAlpha:", 0.0);
  v100 = v18;
  v101 = v21;
  if (v102)
  {
    v47 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, v23, v24, v25);
    objc_msgSend(v47, "setTextColor:", v21);
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38[458], "phPreferredFontForTextStyle:", v37));
    objc_msgSend(v47, "setFont:", v48);

    -[PHRecentsPersonFaceTimeHeaderSummaryView addSubview:](v19, "addSubview:", v47);
    objc_msgSend(v47, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v49) = 1148846080;
    objc_msgSend(v47, "setContentCompressionResistancePriority:forAxis:", 0, v49);
    LODWORD(v50) = 1148846080;
    objc_msgSend(v47, "setContentCompressionResistancePriority:forAxis:", 1, v50);
    LODWORD(v51) = 1148846080;
    objc_msgSend(v47, "setContentHuggingPriority:forAxis:", 0, v51);
    LODWORD(v52) = 1148846080;
    objc_msgSend(v47, "setContentHuggingPriority:forAxis:", 1, v52);
    v53 = sub_10003CCE0(a7);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", a9, 0));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v54, v55));
    objc_msgSend(v47, "setText:", v56);

    v18 = v100;
    objc_msgSend(v47, "sizeThatFits:", 177.0, 1.79769313e308);
    v40 = v40 + v57;

  }
  else
  {
    v47 = 0;
  }
  v58 = objc_msgSend(v18, "screenSharingType");
  if (v58)
  {
    v59 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, v23, v24, v25);
    objc_msgSend(v59, "setTextColor:", v101);
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont phPreferredFontForTextStyle:](UIFont, "phPreferredFontForTextStyle:", v104));
    objc_msgSend(v59, "setFont:", v60);

    -[PHRecentsPersonFaceTimeHeaderSummaryView addSubview:](v19, "addSubview:", v59);
    objc_msgSend(v59, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v61) = 1148846080;
    objc_msgSend(v59, "setContentCompressionResistancePriority:forAxis:", 0, v61);
    LODWORD(v62) = 1148846080;
    objc_msgSend(v59, "setContentCompressionResistancePriority:forAxis:", 1, v62);
    LODWORD(v63) = 1148846080;
    objc_msgSend(v59, "setContentHuggingPriority:forAxis:", 0, v63);
    LODWORD(v64) = 1148846080;
    objc_msgSend(v59, "setContentHuggingPriority:forAxis:", 1, v64);
    v65 = (unint64_t)objc_msgSend(v18, "screenSharingType");
    if ((CHCallScreenSharingTypeScreenShareOrRemoteControl & ~v65) != 0)
    {
      if ((objc_msgSend(v18, "screenSharingType") & 2) != 0)
      {
        v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v74 = objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("REMOTE_CONTROL"), &stru_10008B240, CFSTR("Recents")));
        v75 = v18;
        v76 = (void *)v74;
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "callerNameForDisplay"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v76, v77));
        objc_msgSend(v59, "setText:", v78);

      }
      else if ((objc_msgSend(v18, "screenSharingType") & 1) != 0)
      {
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("SHARED_SCREEN"), &stru_10008B240, CFSTR("Recents")));
        objc_msgSend(v59, "setText:", v72);

      }
    }
    else
    {
      v66 = v18;
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("SHARED_ALLOWED_REMOTE_CONTROL"), &stru_10008B240, CFSTR("Recents")));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "callerNameForDisplay"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v68, v69));
      objc_msgSend(v59, "setText:", v70);

      objc_msgSend(v59, "setNumberOfLines:", 2);
    }
    objc_msgSend(v59, "sizeThatFits:", 177.0, 1.79769313e308);
    v40 = v40 + v79;
  }
  else
  {
    v59 = 0;
  }
  v106[0] = CFSTR("Type");
  v106[1] = CFSTR("FakeType");
  v107[0] = v26;
  v107[1] = v41;
  v106[2] = CFSTR("Duration");
  v80 = v47;
  if (!v47)
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v107[2] = v80;
  v106[3] = CFSTR("ScreenSharingInfo");
  v81 = v59;
  if (!v59)
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v107[3] = v81;
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v107, v106, 4));
  if (!v59)
  {

    if (v47)
      goto LABEL_41;
LABEL_54:

    goto LABEL_41;
  }
  if (!v47)
    goto LABEL_54;
LABEL_41:
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-0@1000-[Type]-0@1000-|"), 0, 0, v82));
  -[PHRecentsPersonFaceTimeHeaderSummaryView addConstraints:](v19, "addConstraints:", v83);

  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0@1000-[FakeType]"), 0, 0, v82));
  -[PHRecentsPersonFaceTimeHeaderSummaryView addConstraints:](v19, "addConstraints:", v84);

  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 3, 0, v41, 3, 1.0, 0.0));
  -[PHRecentsPersonFaceTimeHeaderSummaryView addConstraint:](v19, "addConstraint:", v85);

  if (v58)
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-0@1000-[ScreenSharingInfo]-0@1000-|"), 0, 0, v82));
    -[PHRecentsPersonFaceTimeHeaderSummaryView addConstraints:](v19, "addConstraints:", v86);

    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v59, 3, 0, v26, 4, 1.0, 0.0));
    -[PHRecentsPersonFaceTimeHeaderSummaryView addConstraint:](v19, "addConstraint:", v87);

  }
  if (v102)
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-0@1000-[Duration]-0@1000-|"), 0, 0, v82));
    -[PHRecentsPersonFaceTimeHeaderSummaryView addConstraints:](v19, "addConstraints:", v88);

    if (v59)
      v90 = v59;
    else
      v90 = v26;
    LODWORD(v89) = 1148846080;
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v47, 3, 0, v90, 11, 1.0, 4.30000019, v89));
    -[PHRecentsPersonFaceTimeHeaderSummaryView addConstraint:](v19, "addConstraint:", v91);

    v92 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont phPreferredFontForTextStyle:](UIFont, "phPreferredFontForTextStyle:", v104));
    objc_msgSend(v92, "_bodyLeading");
    v94 = v93;
    objc_msgSend(v26, "_baselineOffsetFromBottom");
    v40 = v40 - (v95 - v94 * 0.75);

  }
  v18 = v100;
  -[PHRecentsPersonFaceTimeHeaderSummaryView setTopmostLabel:](v19, "setTopmostLabel:", v41);
  if (v47)
    v96 = v47;
  else
    v96 = v26;
  -[PHRecentsPersonFaceTimeHeaderSummaryView setBottommostLabel:](v19, "setBottommostLabel:", v96);
  -[PHRecentsPersonFaceTimeHeaderSummaryView setIntrinsicContentHeight:](v19, "setIntrinsicContentHeight:", v40);

LABEL_52:
  return v19;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[PHRecentsPersonFaceTimeHeaderSummaryView intrinsicContentHeight](self, "intrinsicContentHeight");
  v3 = v2;
  v4 = 177.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (UILabel)topmostLabel
{
  return self->_topmostLabel;
}

- (void)setTopmostLabel:(id)a3
{
  self->_topmostLabel = (UILabel *)a3;
}

- (UILabel)bottommostLabel
{
  return self->_bottommostLabel;
}

- (void)setBottommostLabel:(id)a3
{
  self->_bottommostLabel = (UILabel *)a3;
}

- (double)intrinsicContentHeight
{
  return self->_intrinsicContentHeight;
}

- (void)setIntrinsicContentHeight:(double)a3
{
  self->_intrinsicContentHeight = a3;
}

@end
