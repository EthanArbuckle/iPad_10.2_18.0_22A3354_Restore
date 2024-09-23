@implementation CarplayStaticEventDetailsTableViewCell

- (CarplayStaticEventDetailsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CarplayStaticEventDetailsTableViewCell *v4;
  CarplayStaticEventDetailsTableViewCell *v5;
  void *v6;
  uint64_t v7;
  UILabel *titleView;
  uint64_t v9;
  UILabel *locationView;
  void *v11;
  uint64_t v12;
  UILabel *dateView;
  uint64_t v14;
  UILabel *timeView;
  void *v16;
  void *v17;
  uint64_t v18;
  NSLayoutConstraint *timeBaselineToDateBaselineConstraint;
  void *v20;
  void *v21;
  uint64_t v22;
  NSLayoutConstraint *timeBaselineToTitleBaselineConstraint;
  void *v24;
  void *v25;
  uint64_t v26;
  NSLayoutConstraint *timeBaselineToLocationBaselineConstraint;
  void *v28;
  void *v29;
  uint64_t v30;
  NSLayoutConstraint *dateBaselineToTitleBaselineConstraint;
  void *v32;
  void *v33;
  uint64_t v34;
  NSLayoutConstraint *dateBaselineToLocationBaselineConstraint;
  void *v36;
  void *v37;
  uint64_t v38;
  NSLayoutConstraint *locationBaselineToTitleBaselineConstraint;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
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
  objc_super v72;
  _QWORD v73[10];

  v72.receiver = self;
  v72.super_class = (Class)CarplayStaticEventDetailsTableViewCell;
  v4 = -[CarplayStaticEventDetailsTableViewCell initWithStyle:reuseIdentifier:](&v72, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CarplayStaticEventDetailsTableViewCell setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CarplayStaticEventDetailsTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell _createPrimaryView](v5, "_createPrimaryView"));
    titleView = v5->_titleView;
    v5->_titleView = (UILabel *)v7;

    v9 = objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell _createSecondaryView](v5, "_createSecondaryView"));
    locationView = v5->_locationView;
    v5->_locationView = (UILabel *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v5->_locationView, "setTextColor:", v11);

    v12 = objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell _createSecondaryView](v5, "_createSecondaryView"));
    dateView = v5->_dateView;
    v5->_dateView = (UILabel *)v12;

    v14 = objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell _createSecondaryView](v5, "_createSecondaryView"));
    timeView = v5->_timeView;
    v5->_timeView = (UILabel *)v14;

    -[CarplayStaticEventDetailsTableViewCell addSubview:](v5, "addSubview:", v5->_titleView);
    -[CarplayStaticEventDetailsTableViewCell addSubview:](v5, "addSubview:", v5->_locationView);
    -[CarplayStaticEventDetailsTableViewCell addSubview:](v5, "addSubview:", v5->_dateView);
    -[CarplayStaticEventDetailsTableViewCell addSubview:](v5, "addSubview:", v5->_timeView);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v5->_timeView, "firstBaselineAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v5->_dateView, "lastBaselineAnchor"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 20.0));
    timeBaselineToDateBaselineConstraint = v5->_timeBaselineToDateBaselineConstraint;
    v5->_timeBaselineToDateBaselineConstraint = (NSLayoutConstraint *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v5->_timeView, "firstBaselineAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v5->_titleView, "lastBaselineAnchor"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 24.0));
    timeBaselineToTitleBaselineConstraint = v5->_timeBaselineToTitleBaselineConstraint;
    v5->_timeBaselineToTitleBaselineConstraint = (NSLayoutConstraint *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v5->_timeView, "firstBaselineAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v5->_locationView, "lastBaselineAnchor"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 28.0));
    timeBaselineToLocationBaselineConstraint = v5->_timeBaselineToLocationBaselineConstraint;
    v5->_timeBaselineToLocationBaselineConstraint = (NSLayoutConstraint *)v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v5->_dateView, "firstBaselineAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v5->_titleView, "lastBaselineAnchor"));
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, 24.0));
    dateBaselineToTitleBaselineConstraint = v5->_dateBaselineToTitleBaselineConstraint;
    v5->_dateBaselineToTitleBaselineConstraint = (NSLayoutConstraint *)v30;

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v5->_dateView, "firstBaselineAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v5->_locationView, "lastBaselineAnchor"));
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 28.0));
    dateBaselineToLocationBaselineConstraint = v5->_dateBaselineToLocationBaselineConstraint;
    v5->_dateBaselineToLocationBaselineConstraint = (NSLayoutConstraint *)v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v5->_locationView, "firstBaselineAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v5->_titleView, "lastBaselineAnchor"));
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 20.0));
    locationBaselineToTitleBaselineConstraint = v5->_locationBaselineToTitleBaselineConstraint;
    v5->_locationBaselineToTitleBaselineConstraint = (NSLayoutConstraint *)v38;

    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v5->_titleView, "firstBaselineAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell topAnchor](v5, "topAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:constant:", v70, 20.0));
    v73[0] = v69;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_titleView, "leadingAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell leadingAnchor](v5, "leadingAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, 12.0));
    v73[1] = v66;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_titleView, "trailingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell trailingAnchor](v5, "trailingAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
    v73[2] = v63;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_locationView, "leadingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell leadingAnchor](v5, "leadingAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 12.0));
    v73[3] = v60;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_locationView, "trailingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell trailingAnchor](v5, "trailingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v58));
    v73[4] = v57;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_dateView, "leadingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell leadingAnchor](v5, "leadingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, 12.0));
    v73[5] = v54;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_dateView, "trailingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell trailingAnchor](v5, "trailingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
    v73[6] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_timeView, "leadingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell leadingAnchor](v5, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v40, 12.0));
    v73[7] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_timeView, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell trailingAnchor](v5, "trailingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v43));
    v73[8] = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v5->_timeView, "lastBaselineAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell bottomAnchor](v5, "bottomAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, -14.0));
    v73[9] = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 10));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v48);

  }
  return v5;
}

- (id)_createPrimaryView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v3, "setTextColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell _titleFont](self, "_titleFont"));
  objc_msgSend(v3, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v6);

  objc_msgSend(v3, "setNumberOfLines:", 0);
  return v3;
}

- (id)_titleFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell traitCollection](self, "traitCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", UIFontTextStyleTitle3, v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v4, 0.0));

  return v5;
}

- (id)_createSecondaryView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
  objc_msgSend(v3, "setTextColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleCallout, v5));
  objc_msgSend(v3, "setFont:", v6);

  return v3;
}

- (void)updateWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  NSAttributedStringKey v75;
  _UNKNOWN **v76;

  v4 = a3;
  -[CarplayStaticEventDetailsTableViewCell setEvent:](self, "setEvent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "virtualConference"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "joinMethods"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "conferenceURLForDisplay"));
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "virtualConference"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "joinMethods"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  v15 = objc_msgSend(v14, "isBroadcast");

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CUIKLocationDescriptionGenerator conferenceStringForURL:conferenceURLIsBroadcast:options:](CUIKLocationDescriptionGenerator, "conferenceStringForURL:conferenceURLIsBroadcast:options:", v11, v15, 96));
  v17 = !+[CarplayUtilities eventCanDialIn:](CarplayUtilities, "eventCanDialIn:", v4)
     && objc_msgSend(v16, "length") != 0;
  v69 = v11;
  if (+[CarplayUtilities eventCanNavigate:](CarplayUtilities, "eventCanNavigate:", v4))
  {
    v18 = 0;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell event](self, "event"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "location"));
    v18 = objc_msgSend(v20, "length") != 0;

  }
  v21 = v17 || v18;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell locationBaselineToTitleBaselineConstraint](self, "locationBaselineToTitleBaselineConstraint"));
  v23 = v22;
  v70 = v16;
  if (v17 || v18)
  {
    objc_msgSend(v22, "setActive:", 1);

    if (v17)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "string"));
      v25 = +[CarplayUtilities numberOfLinesInString:](CarplayUtilities, "numberOfLinesInString:", v24);

      if (!v18)
      {
LABEL_17:
        -[UILabel setNumberOfLines:](self->_locationView, "setNumberOfLines:", v25);
        v28 = objc_alloc_init((Class)NSMutableAttributedString);
        if (v18)
        {
          v29 = objc_alloc((Class)NSAttributedString);
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell event](self, "event"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "location"));
          v32 = objc_msgSend(v29, "initWithString:", v31);
          objc_msgSend(v28, "appendAttributedString:", v32);

          if (v17)
          {
            v33 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR("\n"));
            objc_msgSend(v28, "appendAttributedString:", v33);

LABEL_21:
            objc_msgSend(v28, "appendAttributedString:", v70);
          }
        }
        else if (v17)
        {
          goto LABEL_21;
        }
        v34 = objc_alloc_init((Class)NSMutableParagraphStyle);
        objc_msgSend(v34, "setLineSpacing:", -1.0);
        objc_msgSend(v34, "setLineBreakMode:", 4);
        objc_msgSend(v28, "addAttribute:value:range:", NSParagraphStyleAttributeName, v34, 0, objc_msgSend(v28, "length"));
        -[UILabel setAttributedText:](self->_locationView, "setAttributedText:", v28);

        goto LABEL_23;
      }
    }
    else
    {
      v25 = 0;
      if (!v18)
        goto LABEL_17;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell event](self, "event"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "location"));
    v25 += +[CarplayUtilities numberOfLinesInString:](CarplayUtilities, "numberOfLinesInString:", v27);

    goto LABEL_17;
  }
  objc_msgSend(v22, "setActive:", 0);

  -[UILabel setText:](self->_locationView, "setText:", 0);
LABEL_23:
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell event](self, "event"));
  v73 = 0;
  v74 = 0;
  v71 = 0;
  v72 = 0;
  CalDetailStringsForCalendarEvent(v35, 2, &v74, &v73, &v72, &v71, 0, -[CarplayStaticEventDetailsTableViewCell showDayName](self, "showDayName") ^ 1);
  v36 = v74;
  v37 = v73;
  v38 = v72;
  v39 = v71;

  -[UILabel setText:](self->_dateView, "setText:", v36);
  -[UILabel setText:](self->_timeView, "setText:", v37);
  v40 = !v21;
  if (!v36 || !v21)
  {
    if (v36)
      v48 = v17 || v18;
    else
      v48 = 1;
    if ((v48 & 1) != 0)
    {
      if (v36)
        v40 = 1;
      if ((v40 & 1) != 0)
      {
        if (v21 || v36 != 0)
          goto LABEL_40;
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell timeBaselineToDateBaselineConstraint](self, "timeBaselineToDateBaselineConstraint"));
        objc_msgSend(v49, "setActive:", 0);

        v50 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell timeBaselineToTitleBaselineConstraint](self, "timeBaselineToTitleBaselineConstraint"));
        objc_msgSend(v50, "setActive:", 1);

        v51 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell timeBaselineToLocationBaselineConstraint](self, "timeBaselineToLocationBaselineConstraint"));
        v52 = v51;
        v53 = 0;
      }
      else
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell timeBaselineToDateBaselineConstraint](self, "timeBaselineToDateBaselineConstraint"));
        objc_msgSend(v60, "setActive:", 0);

        v61 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell timeBaselineToTitleBaselineConstraint](self, "timeBaselineToTitleBaselineConstraint"));
        objc_msgSend(v61, "setActive:", 0);

        v51 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell timeBaselineToLocationBaselineConstraint](self, "timeBaselineToLocationBaselineConstraint"));
        v52 = v51;
        v53 = 1;
      }
      objc_msgSend(v51, "setActive:", v53);

      v57 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell dateBaselineToTitleBaselineConstraint](self, "dateBaselineToTitleBaselineConstraint"));
      v58 = v57;
      v59 = 0;
    }
    else
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell timeBaselineToDateBaselineConstraint](self, "timeBaselineToDateBaselineConstraint"));
      objc_msgSend(v54, "setActive:", 1);

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell timeBaselineToTitleBaselineConstraint](self, "timeBaselineToTitleBaselineConstraint"));
      objc_msgSend(v55, "setActive:", 0);

      v56 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell timeBaselineToLocationBaselineConstraint](self, "timeBaselineToLocationBaselineConstraint"));
      objc_msgSend(v56, "setActive:", 0);

      v57 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell dateBaselineToTitleBaselineConstraint](self, "dateBaselineToTitleBaselineConstraint"));
      v58 = v57;
      v59 = 1;
    }
    objc_msgSend(v57, "setActive:", v59);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell dateBaselineToLocationBaselineConstraint](self, "dateBaselineToLocationBaselineConstraint"));
    v46 = v45;
    v47 = 0;
  }
  else
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell timeBaselineToDateBaselineConstraint](self, "timeBaselineToDateBaselineConstraint"));
    objc_msgSend(v41, "setActive:", 1);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell timeBaselineToTitleBaselineConstraint](self, "timeBaselineToTitleBaselineConstraint"));
    objc_msgSend(v42, "setActive:", 0);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell timeBaselineToLocationBaselineConstraint](self, "timeBaselineToLocationBaselineConstraint"));
    objc_msgSend(v43, "setActive:", 0);

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell dateBaselineToTitleBaselineConstraint](self, "dateBaselineToTitleBaselineConstraint"));
    objc_msgSend(v44, "setActive:", 0);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell dateBaselineToLocationBaselineConstraint](self, "dateBaselineToLocationBaselineConstraint"));
    v46 = v45;
    v47 = 1;
  }
  objc_msgSend(v45, "setActive:", v47);

LABEL_40:
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell event](self, "event"));
  v63 = objc_msgSend(v62, "status");

  if (v63 == (id)3)
  {
    v64 = objc_alloc((Class)NSAttributedString);
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell event](self, "event"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "title"));
    v75 = NSStrikethroughStyleAttributeName;
    v76 = &off_1001BC520;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));
    v68 = objc_msgSend(v64, "initWithString:attributes:", v66, v67);
    -[UILabel setAttributedText:](self->_titleView, "setAttributedText:", v68);

  }
  else
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[CarplayStaticEventDetailsTableViewCell event](self, "event"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "title"));
    -[UILabel setText:](self->_titleView, "setText:", v66);
  }

}

- (BOOL)isSelectable
{
  return 0;
}

- (void)cellWasTapped
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CarplayStaticEventDetailsTableViewCell.m"), 214, CFSTR("Static event details cell was tapped, but it should not have been able to be selected"));

}

- (BOOL)showDayName
{
  return self->_showDayName;
}

- (void)setShowDayName:(BOOL)a3
{
  self->_showDayName = a3;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (UILabel)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (UILabel)locationView
{
  return self->_locationView;
}

- (void)setLocationView:(id)a3
{
  objc_storeStrong((id *)&self->_locationView, a3);
}

- (UILabel)dateView
{
  return self->_dateView;
}

- (void)setDateView:(id)a3
{
  objc_storeStrong((id *)&self->_dateView, a3);
}

- (UILabel)timeView
{
  return self->_timeView;
}

- (void)setTimeView:(id)a3
{
  objc_storeStrong((id *)&self->_timeView, a3);
}

- (NSLayoutConstraint)timeBaselineToDateBaselineConstraint
{
  return self->_timeBaselineToDateBaselineConstraint;
}

- (void)setTimeBaselineToDateBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_timeBaselineToDateBaselineConstraint, a3);
}

- (NSLayoutConstraint)timeBaselineToTitleBaselineConstraint
{
  return self->_timeBaselineToTitleBaselineConstraint;
}

- (void)setTimeBaselineToTitleBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_timeBaselineToTitleBaselineConstraint, a3);
}

- (NSLayoutConstraint)locationBaselineToTitleBaselineConstraint
{
  return self->_locationBaselineToTitleBaselineConstraint;
}

- (void)setLocationBaselineToTitleBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_locationBaselineToTitleBaselineConstraint, a3);
}

- (NSLayoutConstraint)timeBaselineToLocationBaselineConstraint
{
  return self->_timeBaselineToLocationBaselineConstraint;
}

- (void)setTimeBaselineToLocationBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_timeBaselineToLocationBaselineConstraint, a3);
}

- (NSLayoutConstraint)dateBaselineToTitleBaselineConstraint
{
  return self->_dateBaselineToTitleBaselineConstraint;
}

- (void)setDateBaselineToTitleBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_dateBaselineToTitleBaselineConstraint, a3);
}

- (NSLayoutConstraint)dateBaselineToLocationBaselineConstraint
{
  return self->_dateBaselineToLocationBaselineConstraint;
}

- (void)setDateBaselineToLocationBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_dateBaselineToLocationBaselineConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateBaselineToLocationBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_dateBaselineToTitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_timeBaselineToLocationBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_locationBaselineToTitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_timeBaselineToTitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_timeBaselineToDateBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_locationView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
