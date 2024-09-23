@implementation CarCardConfiguration

- (CarCardConfiguration)initWithKey:(id)a3 carSceneType:(int64_t)a4
{
  id v6;
  CarCardConfiguration *v7;
  CarCardConfiguration *v8;
  void *v9;
  NSString *v10;
  NSString *key;
  NSString *title;
  CarCardView *v13;
  double y;
  double width;
  double height;
  CarCardView *v17;
  CarCardView *cardView;
  CarCardContainerView *v19;
  CarCardContainerView *containerView;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v26;

  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CarCardConfiguration;
  v7 = -[CarCardConfiguration init](&v26, "init");
  v8 = v7;
  if (v7)
  {
    v7->_carSceneType = a4;
    if (!v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));

    }
    v10 = (NSString *)objc_msgSend(v6, "copy");
    key = v8->_key;
    v8->_key = v10;

    title = v8->_title;
    v8->_title = 0;

    v8->_titleNumberOfLines = 3;
    v8->_hidden = 1;
    v13 = [CarCardView alloc];
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v17 = -[CarCardView initWithFrame:](v13, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    cardView = v8->_cardView;
    v8->_cardView = v17;

    -[CarCardView setTranslatesAutoresizingMaskIntoConstraints:](v8->_cardView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = -[CarCardContainerView initWithFrame:]([CarCardContainerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    containerView = v8->_containerView;
    v8->_containerView = v19;

    -[CarCardContainerView setTranslatesAutoresizingMaskIntoConstraints:](v8->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CarCardContainerView setUserInteractionEnabled:](v8->_containerView, "setUserInteractionEnabled:", 0);
    -[CarCardContainerView setClipsToBounds:](v8->_containerView, "setClipsToBounds:", 0);
    LODWORD(v21) = 1148846080;
    -[CarCardContainerView setContentHuggingPriority:forAxis:](v8->_containerView, "setContentHuggingPriority:forAxis:", 1, v21);
    LODWORD(v22) = 1148846080;
    -[CarCardContainerView setContentHuggingPriority:forAxis:](v8->_containerView, "setContentHuggingPriority:forAxis:", 0, v22);
    LODWORD(v23) = 0;
    -[CarCardContainerView setContentCompressionResistancePriority:forAxis:](v8->_containerView, "setContentCompressionResistancePriority:forAxis:", 1, v23);
    LODWORD(v24) = 0;
    -[CarCardContainerView setContentCompressionResistancePriority:forAxis:](v8->_containerView, "setContentCompressionResistancePriority:forAxis:", 0, v24);
    -[CarCardContainerView addObserver:forKeyPath:options:context:](v8->_containerView, "addObserver:forKeyPath:options:context:", v8, CFSTR("bounds"), 1, off_1014B8828);
  }

  return v8;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  const __CFString *v16;
  __CFString *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CarCardConfiguration;
  v3 = -[CarCardConfiguration description](&v20, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration key](self, "key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration content](self, "content"));
  v7 = (id)objc_opt_class(v6);
  v8 = v7;
  if (v7)
  {
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_7;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_7:

    goto LABEL_9;
  }
  v14 = CFSTR("<nil>");
LABEL_9:

  if (-[CarCardConfiguration isHidden](self, "isHidden"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  if (self->_cardView)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  v17 = v15;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (key:%@, content:%@, hidden:%@, valid:%@)"), v4, v5, v14, v17, v16));

  return (NSString *)v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id v5;
  id v6;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class(self));
  objc_storeStrong(v4 + 22, self->_content);
  sub_10063F028((uint64_t)(v4 + 39), (__int128 *)&self->_layout);
  objc_storeStrong(v4 + 23, self->_title);
  v4[24] = (id)self->_titleNumberOfLines;
  v4[25] = (id)self->_accessory;
  objc_storeStrong(v4 + 26, self->_accessoryView);
  v5 = objc_retainBlock(self->_selectionHandler);
  v6 = v4[27];
  v4[27] = v5;

  *((_BYTE *)v4 + 168) = self->_ignoreContainerBoundsChanges;
  *((_BYTE *)v4 + 170) = self->_hidden;
  objc_storeStrong(v4 + 32, self->_hidingConstraints);
  objc_storeStrong(v4 + 31, self->_showingConstraints);
  objc_storeStrong(v4 + 33, self->_viewportConstraints);
  objc_storeStrong(v4 + 34, self->_mapInsetsConstraints);
  objc_storeStrong(v4 + 35, self->_collisionConstraints);
  objc_storeStrong(v4 + 36, self->_collisionLayoutGuides);
  objc_storeStrong(v4 + 37, self->_contentLayoutGuide);
  return v4;
}

- (void)dealloc
{
  CarCardContainerView *containerView;
  CarCardView *cardView;
  objc_super v5;

  -[CarCardContainerView removeObserver:forKeyPath:context:](self->_containerView, "removeObserver:forKeyPath:context:", self, CFSTR("bounds"), off_1014B8828);
  -[CarCardContainerView removeFromSuperview](self->_containerView, "removeFromSuperview");
  containerView = self->_containerView;
  self->_containerView = 0;

  -[CarCardView removeFromSuperview](self->_cardView, "removeFromSuperview");
  cardView = self->_cardView;
  self->_cardView = 0;

  v5.receiver = self;
  v5.super_class = (Class)CarCardConfiguration;
  -[CarCardConfiguration dealloc](&v5, "dealloc");
}

- (void)clear
{
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  HIDWORD(v18) = 0;
  *(_DWORD *)((char *)&v18 + 1) = 0;
  v8 = xmmword_100E34B90;
  v9 = xmmword_100E2D550;
  v10 = 3;
  v11 = 1148846080;
  v12 = 2;
  LODWORD(v13) = 1148846080;
  v14 = 0;
  v15 = 0;
  __asm { FMOV            V0.2D, #8.0 }
  v16 = _Q0;
  v17 = _Q0;
  LOBYTE(v18) = 1;
  v19 = 8;
  LOBYTE(v20) = 0;
  if (self)
    -[CarCardConfiguration setLayout:](self, "setLayout:", &v8);
  -[CarCardConfiguration setPreviousContent:](self, "setPreviousContent:", self->_content, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
  -[CarCardConfiguration setContent:](self, "setContent:", 0);
  -[CarCardConfiguration setTitle:](self, "setTitle:", 0);
  -[CarCardConfiguration setTitleNumberOfLines:](self, "setTitleNumberOfLines:", 3);
  -[CarCardConfiguration setAccessory:](self, "setAccessory:", 0);
  -[CarCardConfiguration setAccessoryView:](self, "setAccessoryView:", 0);
  -[CarCardConfiguration setSelectionHandler:](self, "setSelectionHandler:", 0);
}

- (void)reset
{
  CarCardContainerView *containerView;
  CarCardView *cardView;

  if (self->_cardView)
  {
    *(_WORD *)&self->_hidden = 1;
    -[CarCardConfiguration clear](self, "clear");
    -[CarCardContainerView removeFromSuperview](self->_containerView, "removeFromSuperview");
    containerView = self->_containerView;
    self->_containerView = 0;

    -[CarCardView removeFromSuperview](self->_cardView, "removeFromSuperview");
    cardView = self->_cardView;
    self->_cardView = 0;

    -[CarCardConfiguration _resetConstraints](self, "_resetConstraints");
  }
}

- (unint64_t)focusSortValue
{
  void *v3;
  void *v4;
  id *v5;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[16];
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[4];

  v19[0] = &off_101270228;
  v19[1] = &off_101270258;
  v20[0] = &off_101270240;
  v20[1] = &off_101270270;
  v19[2] = &off_101270288;
  v19[3] = &off_1012702B8;
  v20[2] = &off_1012702A0;
  v20[3] = &off_1012702D0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 4));
  v17[0] = &off_101270228;
  v17[1] = &off_101270288;
  v18[0] = &off_1012702E8;
  v18[1] = &off_101270300;
  v17[2] = &off_1012702B8;
  v17[3] = &off_101270258;
  v18[2] = &off_101270318;
  v18[3] = &off_101270330;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
  if (-[CarCardConfiguration effectiveCornerPosition](self, "effectiveCornerPosition") == -1)
  {
    -[CarCardConfiguration layout](self, "layout");
    v5 = (id *)v14;
    v6 = (id *)&v13;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v7));
    v9 = objc_msgSend(v8, "unsignedIntegerValue");
  }
  else
  {
    -[CarCardConfiguration layout](self, "layout");
    v5 = (id *)&v16;
    v6 = (id *)&v15;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v14[9]));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v7));
    v9 = objc_msgSend(v8, "unsignedIntegerValue");
  }
  v10 = (unint64_t)v9;

  return v10;
}

- (void)layoutInHost:(id)a3 withLayoutGuide:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if ((self->_invalidationState & 2) != 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(-[CarCardConfiguration previousContent](self, "previousContent"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration previousContent](self, "previousContent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parentViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "containingViewController"));

      if (v10 == v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration previousContent](self, "previousContent"));
        objc_msgSend(v12, "removeFromParentViewController");

      }
    }
  }
  -[CarCardConfiguration _prepareConstraintsForHost:withLayoutGuide:](self, "_prepareConstraintsForHost:withLayoutGuide:", v13, v6);
  -[CarCardConfiguration _applyToCardView](self, "_applyToCardView");
  self->_invalidationState = 0;
  -[CarCardConfiguration updateVisibility](self, "updateVisibility");

}

- (void)_applyToCardView
{
  id v3;
  NSObject *v4;
  CarCardConfiguration *v5;
  CarCardConfiguration *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _OWORD v36[2];
  _OWORD v37[2];
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  char v43;
  __int128 v44;
  __int128 v45;
  _OWORD v46[2];
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  char v52;
  uint8_t buf[4];
  __CFString *v54;
  __int16 v55;
  CarCardConfiguration *v56;

  v3 = sub_10043333C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    goto LABEL_11;
  v5 = self;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

      goto LABEL_8;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543618;
  v54 = v12;
  v55 = 2112;
  v56 = v6;
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Will apply to card view (%@)", buf, 0x16u);

LABEL_11:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration collisionLayoutGuides](self, "collisionLayoutGuides"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration cardView](self, "cardView"));
  objc_msgSend(v14, "setCollisionLayoutGuides:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration contentLayoutGuide](self, "contentLayoutGuide"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration cardView](self, "cardView"));
  objc_msgSend(v16, "setContentLayoutGuide:", v15);

  v17 = -[CarCardConfiguration isTransitioning](self, "isTransitioning");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration cardView](self, "cardView"));
  objc_msgSend(v18, "setTransitioning:", v17);

  -[CarCardConfiguration layout](self, "layout");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration cardView](self, "cardView"));
  v36[0] = v44;
  v36[1] = v45;
  v37[0] = v46[0];
  *(_OWORD *)((char *)v37 + 12) = *(_OWORD *)((char *)v46 + 12);
  v20 = v47;
  v38 = v20;
  v21 = v48;
  v39 = v21;
  v40 = v49;
  v41 = v50;
  v42 = v51;
  v43 = v52;
  if (v19)
  {
    objc_msgSend(v19, "setLayout:", v36);
  }
  else
  {
    v22 = v21;

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration title](self, "title"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration cardView](self, "cardView"));
  objc_msgSend(v24, "setTitle:", v23);

  v25 = -[CarCardConfiguration titleNumberOfLines](self, "titleNumberOfLines");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration cardView](self, "cardView"));
  objc_msgSend(v26, "setTitleNumberOfLines:", v25);

  v27 = -[CarCardConfiguration accessory](self, "accessory");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration cardView](self, "cardView"));
  objc_msgSend(v28, "setAccessory:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration accessoryView](self, "accessoryView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration cardView](self, "cardView"));
  objc_msgSend(v30, "setAccessoryView:", v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration selectionHandler](self, "selectionHandler"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration cardView](self, "cardView"));
  objc_msgSend(v32, "setSelectionHandler:", v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration content](self, "content"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration cardView](self, "cardView"));
  objc_msgSend(v34, "setContent:", v33);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration cardView](self, "cardView"));
  objc_msgSend(v35, "setNeedsLayout");

  -[CarCardConfiguration _updateAvailableCardSize](self, "_updateAvailableCardSize");
}

- (void)_resetConstraints
{
  NSArray *hidingConstraints;
  NSArray *showingConstraints;
  NSArray *viewportConstraints;
  NSArray *mapInsetsConstraints;
  NSArray *collisionConstraints;
  NSDictionary *collisionLayoutGuides;
  UILayoutGuide *contentLayoutGuide;

  if (self->_showingConstraints)
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  if (self->_hidingConstraints)
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  if (self->_viewportConstraints)
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  if (self->_mapInsetsConstraints)
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  if (self->_collisionConstraints)
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  hidingConstraints = self->_hidingConstraints;
  self->_hidingConstraints = 0;

  showingConstraints = self->_showingConstraints;
  self->_showingConstraints = 0;

  viewportConstraints = self->_viewportConstraints;
  self->_viewportConstraints = 0;

  mapInsetsConstraints = self->_mapInsetsConstraints;
  self->_mapInsetsConstraints = 0;

  collisionConstraints = self->_collisionConstraints;
  self->_collisionConstraints = 0;

  collisionLayoutGuides = self->_collisionLayoutGuides;
  self->_collisionLayoutGuides = 0;

  contentLayoutGuide = self->_contentLayoutGuide;
  self->_contentLayoutGuide = 0;

}

- (void)_prepareConstraintsForHost:(id)a3 withLayoutGuide:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  CarCardConfiguration *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  char v18;
  _UNKNOWN **v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  CarCardConfiguration *v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSArray *v31;
  NSArray *hidingConstraints;
  NSArray *v33;
  NSArray *showingConstraints;
  NSArray *v35;
  NSArray *viewportConstraints;
  NSArray *v37;
  NSArray *mapInsetsConstraints;
  NSArray *v39;
  NSArray *collisionConstraints;
  NSDictionary *v41;
  NSDictionary *collisionLayoutGuides;
  UILayoutGuide *v43;
  UILayoutGuide *contentLayoutGuide;
  float64x2_t v45;
  float64x2_t v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  int64x2_t v50;
  int64x2_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  float64x2_t v55;
  float64x2_t v56;
  __int128 v57;
  uint64_t v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  void *v62;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "overlayContentView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewportLayoutGuide"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapInsetsLayoutGuide"));
  if (v7 && v8 && v49 && v48)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView superview](self->_containerView, "superview"));

    if (v9 != v8)
    {
      -[CarCardContainerView removeFromSuperview](self->_containerView, "removeFromSuperview");
      objc_msgSend(v8, "addSubview:", self->_containerView);
      -[CarCardView removeFromSuperview](self->_cardView, "removeFromSuperview");
      objc_msgSend(v8, "addSubview:", self->_cardView);
      -[CarCardConfiguration _resetConstraints](self, "_resetConstraints");
    }
    v58 = 0;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    -[CarCardConfiguration layout](self, "layout");
    v47 = -[CarCardConfiguration staysOnTop](self, "staysOnTop");
    if (self->_showingConstraints
      && self->_hidingConstraints
      && self->_viewportConstraints
      && self->_mapInsetsConstraints
      && self->_collisionConstraints)
    {
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v50, *(int64x2_t *)&self->_lastLayout.edgePosition), (int32x4_t)vceqq_s64(v51, *(int64x2_t *)&self->_lastLayout.primaryAxis))), 0xFuLL))) & 1) != 0&& (_QWORD)v52 == self->_lastLayout.primaryAxisFillMode&& (_QWORD)v53 == self->_lastLayout.secondaryAxisFillMode&& *((_QWORD *)&v57 + 1) == self->_lastLayout.edgesAffectingMapInsets&& v57 == self->_lastLayout.flipForRightHandDrive&& *((float *)&v52 + 2) == self->_lastLayout.primaryAxisFillModePriority&& *((float *)&v53 + 2) == self->_lastLayout.secondaryAxisFillModePriority)
      {
        v45 = *(float64x2_t *)&self->_lastLayout.margins.bottom;
        v46 = *(float64x2_t *)&self->_lastLayout.margins.top;
        v10 = *((id *)&v54 + 1);

        if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v55, v46), (int32x4_t)vceqq_f64(v56, v45))), 0xFuLL))) & 1) != 0&& self->_lastStaysOnTop == v47)
        {
          goto LABEL_36;
        }
      }
      else
      {
        v11 = *((id *)&v54 + 1);

      }
    }
    v12 = sub_10043333C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
LABEL_35:

      objc_msgSend(v8, "removeConstraints:", self->_hidingConstraints);
      objc_msgSend(v8, "removeConstraints:", self->_showingConstraints);
      -[CarCardConfiguration _resetConstraints](self, "_resetConstraints");
      v31 = (NSArray *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration _hidingLayoutConstraintsForHost:withLayoutGuide:](self, "_hidingLayoutConstraintsForHost:withLayoutGuide:", v6, v7));
      hidingConstraints = self->_hidingConstraints;
      self->_hidingConstraints = v31;

      v33 = (NSArray *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration _showingLayoutConstraintsForHost:withLayoutGuide:](self, "_showingLayoutConstraintsForHost:withLayoutGuide:", v6, v7));
      showingConstraints = self->_showingConstraints;
      self->_showingConstraints = v33;

      v35 = (NSArray *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration _viewportConstraintsForHost:](self, "_viewportConstraintsForHost:", v6));
      viewportConstraints = self->_viewportConstraints;
      self->_viewportConstraints = v35;

      v37 = (NSArray *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration _mapInsetsConstraintsForHost:](self, "_mapInsetsConstraintsForHost:", v6));
      mapInsetsConstraints = self->_mapInsetsConstraints;
      self->_mapInsetsConstraints = v37;

      v39 = (NSArray *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration _collisionConstraintsForHost:](self, "_collisionConstraintsForHost:", v6));
      collisionConstraints = self->_collisionConstraints;
      self->_collisionConstraints = v39;

      v41 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration _collisionLayoutGuidesForHost:](self, "_collisionLayoutGuidesForHost:", v6));
      collisionLayoutGuides = self->_collisionLayoutGuides;
      self->_collisionLayoutGuides = v41;

      v43 = (UILayoutGuide *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentLayoutGuide"));
      contentLayoutGuide = self->_contentLayoutGuide;
      self->_contentLayoutGuide = v43;

      -[CarCardConfiguration _updateCardContainerPriorities](self, "_updateCardContainerPriorities");
      sub_10063F028((uint64_t)&self->_lastLayout, (__int128 *)v50.i8);
      self->_lastStaysOnTop = v47;
LABEL_36:

      goto LABEL_37;
    }
    v14 = self;
    v15 = (objc_class *)objc_opt_class(v14);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_opt_respondsToSelector(v14, "accessibilityIdentifier");
    v19 = MKPlaceCollectionsLogicController_ptr;
    if ((v18 & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration performSelector:](v14, "performSelector:", "accessibilityIdentifier"));
      v21 = v20;
      if (v20 && (objc_msgSend(v20, "isEqualToString:", v17) & 1) == 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v17, v14, v21));

LABEL_29:
        v23 = v22;
        v24 = v14;
        v25 = (objc_class *)objc_opt_class(v24);
        v26 = NSStringFromClass(v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        if ((objc_opt_respondsToSelector(v24, "accessibilityIdentifier") & 1) != 0)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration performSelector:](v24, "performSelector:", "accessibilityIdentifier"));
          v29 = v28;
          if (v28 && (objc_msgSend(v28, "isEqualToString:", v27) & 1) == 0)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v27, v24, v29));

            goto LABEL_34;
          }

        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v27, v24));
LABEL_34:

        *(_DWORD *)buf = 138543618;
        v60 = v23;
        v61 = 2112;
        v62 = v30;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}@] Will prepare card constraints (%@)", buf, 0x16u);

        goto LABEL_35;
      }

      v19 = MKPlaceCollectionsLogicController_ptr;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19[390], "stringWithFormat:", CFSTR("%@<%p>"), v17, v14));
    goto LABEL_29;
  }
LABEL_37:

}

- (id)_cardToContainerLayoutConstraints
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t cornerPosition;
  NSNumber *v7;
  NSNumber *v8;
  void *v9;
  unsigned int v10;
  unint64_t edgePosition;
  NSNumber *v12;
  NSNumber *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  NSNumber *v20;
  NSNumber *v21;
  void *v22;
  unsigned int v23;
  unint64_t v24;
  NSNumber *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  id v49;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if ((self->_layout.primaryAxisFillMode > 1 || self->_layout.primaryAxis != 1)
    && (self->_layout.secondaryAxisFillMode > 1 || self->_layout.primaryAxis))
  {
    goto LABEL_5;
  }
  cornerPosition = self->_layout.cornerPosition;
  v7 = self->_layout.primaryAxisFillLimit;
  v8 = self->_layout.secondaryAxisFillLimit;
  if (self->_layout.flipForRightHandDrive)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v10 = objc_msgSend(v9, "rightHandDrive");

    if (v10)
    {
      switch(cornerPosition)
      {
        case 1uLL:
          cornerPosition = 2;
          break;
        case 2uLL:
          cornerPosition = 1;
          break;
        case 4uLL:
          cornerPosition = 8;
          break;
        case 8uLL:
          cornerPosition = 4;
          break;
      }
    }
  }

  edgePosition = self->_layout.edgePosition;
  v12 = self->_layout.primaryAxisFillLimit;
  v13 = self->_layout.secondaryAxisFillLimit;
  if (self->_layout.flipForRightHandDrive)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v15 = objc_msgSend(v14, "rightHandDrive");

    if (v15)
    {
      if (edgePosition == 2)
      {
        edgePosition = 8;
      }
      else if (edgePosition == 8)
      {
        edgePosition = 2;
      }
    }
  }

  if (cornerPosition - 1 < 2 || edgePosition == 1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView bottomAnchor](self->_cardView, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:", v17));
    v4 = 0;
    v5 = (void *)v18;
  }
  else
  {
    if (edgePosition != 4 && cornerPosition != 8 && cornerPosition != 4)
    {
LABEL_5:
      v4 = 0;
      v5 = 0;
      goto LABEL_30;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView topAnchor](self->_cardView, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintGreaterThanOrEqualToAnchor:", v17));
    v5 = 0;
    v4 = (void *)v18;
  }

  objc_msgSend(v3, "addObject:", v18);
LABEL_30:
  if (self->_layout.primaryAxisFillMode <= 1 && !self->_layout.primaryAxis
    || self->_layout.secondaryAxisFillMode <= 1 && self->_layout.primaryAxis == 1)
  {
    v19 = self->_layout.cornerPosition;
    v20 = self->_layout.primaryAxisFillLimit;
    v21 = self->_layout.secondaryAxisFillLimit;
    if (self->_layout.flipForRightHandDrive)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
      v23 = objc_msgSend(v22, "rightHandDrive");

      if (v23)
      {
        switch(v19)
        {
          case 1uLL:
            v19 = 2;
            break;
          case 2uLL:
            v19 = 1;
            break;
          case 4uLL:
            v19 = 8;
            break;
          case 8uLL:
            v19 = 4;
            break;
        }
      }
    }

    v24 = self->_layout.edgePosition;
    v25 = self->_layout.secondaryAxisFillLimit;
    if (self->_layout.flipForRightHandDrive
      && (v26 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance")),
          v27 = objc_msgSend(v26, "rightHandDrive"),
          v26,
          v27))
    {
      if (v24 == 8)
      {
        v24 = 2;
      }
      else if (v24 == 2)
      {

LABEL_55:
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView leftAnchor](self->_cardView, "leftAnchor"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView leftAnchor](self->_containerView, "leftAnchor"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintGreaterThanOrEqualToAnchor:", v29));
        v31 = 0;
        v32 = v30;
LABEL_56:

        objc_msgSend(v3, "addObject:", v30);
        goto LABEL_62;
      }

    }
    else
    {

      if (v24 == 8)
        goto LABEL_55;
    }
    if (v19 == 8 || v19 == 2)
      goto LABEL_55;
    if (v24 == 2 || v19 == 4 || v19 == 1)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView rightAnchor](self->_cardView, "rightAnchor"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView rightAnchor](self->_containerView, "rightAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:", v29));
      v32 = 0;
      v31 = v30;
      goto LABEL_56;
    }
  }
  v32 = 0;
  v31 = 0;
LABEL_62:
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView topAnchor](self->_cardView, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
  if (v4)
    *(float *)&v35 = 50.0;
  else
    *(float *)&v35 = 1000.0;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:priority:", v34, 0.0, v35));
  objc_msgSend(v3, "addObject:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView leftAnchor](self->_cardView, "leftAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView leftAnchor](self->_containerView, "leftAnchor"));
  if (v32)
    *(float *)&v39 = 50.0;
  else
    *(float *)&v39 = 1000.0;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:priority:", v38, 0.0, v39));
  objc_msgSend(v3, "addObject:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView bottomAnchor](self->_cardView, "bottomAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor"));
  if (v5)
    *(float *)&v43 = 50.0;
  else
    *(float *)&v43 = 1000.0;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:priority:", v42, 0.0, v43));
  objc_msgSend(v3, "addObject:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView rightAnchor](self->_cardView, "rightAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView rightAnchor](self->_containerView, "rightAnchor"));
  if (v31)
    *(float *)&v47 = 50.0;
  else
    *(float *)&v47 = 1000.0;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:priority:", v46, 0.0, v47));
  objc_msgSend(v3, "addObject:", v48);

  v49 = objc_msgSend(v3, "copy");
  return v49;
}

- (void)_updateCardContainerPriorities
{
  double v2;
  float v4;
  float v5;
  float v6;
  _BOOL8 v7;
  double v8;
  double v9;
  double v10;

  if (self->_layout.primaryAxisFillMode > 1)
  {
    v4 = 250.0;
    LODWORD(v2) = 1148846080;
  }
  else
  {
    v4 = (float)((float)(self->_layout.primaryAxisFillModePriority / 1000.0) * 998.0) + 1.0;
    *(float *)&v2 = 1000.0 - v4;
  }
  if (self->_layout.secondaryAxisFillMode > 1)
  {
    v6 = 1000.0;
    v5 = 250.0;
  }
  else
  {
    v5 = (float)((float)(self->_layout.secondaryAxisFillModePriority / 1000.0) * 998.0) + 1.0;
    v6 = 1000.0 - v5;
  }
  v7 = self->_layout.primaryAxis != 1;
  -[CarCardContainerView setContentHuggingPriority:forAxis:](self->_containerView, "setContentHuggingPriority:forAxis:", v2);
  *(float *)&v8 = v6;
  -[CarCardContainerView setContentHuggingPriority:forAxis:](self->_containerView, "setContentHuggingPriority:forAxis:", v7, v8);
  *(float *)&v9 = v4;
  -[CarCardView setContentCompressionResistancePriority:forAxis:](self->_cardView, "setContentCompressionResistancePriority:forAxis:", self->_layout.primaryAxis, v9);
  *(float *)&v10 = v5;
  -[CarCardView setContentCompressionResistancePriority:forAxis:](self->_cardView, "setContentCompressionResistancePriority:forAxis:", v7, v10);
}

- (id)_sharedLayoutConstraintsForHost:(id)a3 withLayoutGuide:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  float secondaryAxisFillModePriority;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  id v38;
  id v40;
  id v41;
  double v42;
  double v43;
  void *v44;
  id v45;
  void *v46;
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];

  v40 = a3;
  v45 = a4;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[CarCardConfiguration layout](self, "layout");
  -[CarCardConfiguration effectiveMargins](self, "effectiveMargins");
  v42 = v6;
  v43 = v7;
  v9 = v8;
  v11 = v10;
  switch(-[CarCardConfiguration effectiveEdgePosition](self, "effectiveEdgePosition"))
  {
    case 1uLL:
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView rightAnchor](self->_containerView, "rightAnchor", v40));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "rightAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintLessThanOrEqualToAnchor:constant:", v12, -v43));
      v50[0] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView leftAnchor](self->_containerView, "leftAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leftAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:constant:", v15, v42));
      v50[1] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView centerXAnchor](self->_containerView, "centerXAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "centerXAnchor"));
      LODWORD(v19) = 1148829696;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:priority:", v18, 0.0, v19));
      v50[2] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 3));
      objc_msgSend(v46, "addObjectsFromArray:", v21);
      goto LABEL_6;
    case 2uLL:
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor", v40));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "bottomAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintLessThanOrEqualToAnchor:constant:", v12, -v11));
      v49[0] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:constant:", v15, v9));
      v49[1] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView centerYAnchor](self->_containerView, "centerYAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "centerYAnchor"));
      LODWORD(v22) = 1148829696;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:priority:", v18, 0.0, v22));
      v49[2] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 3));
      objc_msgSend(v46, "addObjectsFromArray:", v21);
      goto LABEL_6;
    case 4uLL:
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView rightAnchor](self->_containerView, "rightAnchor", v40));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "rightAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintLessThanOrEqualToAnchor:constant:", v12, -v43));
      v48[0] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView leftAnchor](self->_containerView, "leftAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leftAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:constant:", v15, v42));
      v48[1] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView centerXAnchor](self->_containerView, "centerXAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "centerXAnchor"));
      LODWORD(v23) = 1148829696;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:priority:", v18, 0.0, v23));
      v48[2] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 3));
      objc_msgSend(v46, "addObjectsFromArray:", v21);
      goto LABEL_6;
    case 8uLL:
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor", v40));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "bottomAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintLessThanOrEqualToAnchor:constant:", v12, -v11));
      v47[0] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:constant:", v15, v9));
      v47[1] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView centerYAnchor](self->_containerView, "centerYAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "centerYAnchor"));
      LODWORD(v24) = 1148829696;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:priority:", v18, 0.0, v24));
      v47[2] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 3));
      objc_msgSend(v46, "addObjectsFromArray:", v21);
LABEL_6:

      break;
    default:
      break;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView widthAnchor](self->_containerView, "widthAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "widthAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:constant:", v26, -(v42 + v43)));
  objc_msgSend(v46, "addObject:", v27);

  secondaryAxisFillModePriority = self->_layout.secondaryAxisFillModePriority;
  *(float *)&v29 = (float)((float)(self->_layout.primaryAxisFillModePriority / 1000.0) * 502.0) + 249.0;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView widthAnchor](self->_containerView, "widthAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "widthAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:priority:", v31, -(v42 + v43), COERCE_DOUBLE(__PAIR64__(HIDWORD(v43), v29))));
  objc_msgSend(v46, "addObject:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView heightAnchor](self->_containerView, "heightAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "heightAnchor"));
  *(float *)&v35 = (float)((float)(secondaryAxisFillModePriority / 1000.0) * 502.0) + 249.0;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:priority:", v34, -(v9 + v11), v35));
  objc_msgSend(v46, "addObject:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration _cardToContainerLayoutConstraints](self, "_cardToContainerLayoutConstraints", v40));
  objc_msgSend(v46, "addObjectsFromArray:", v37);

  v38 = objc_msgSend(v46, "copy");
  return v38;
}

- (id)_showingLayoutConstraintsForHost:(id)a3 withLayoutGuide:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[CarCardConfiguration effectiveMargins](self, "effectiveMargins");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = -[CarCardConfiguration effectiveEdgePosition](self, "effectiveEdgePosition");
  v18 = -[CarCardConfiguration effectiveCornerPosition](self, "effectiveCornerPosition");
  switch(v17)
  {
    case 0uLL:
      switch(v18)
      {
        case 0uLL:
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView centerYAnchor](self->_containerView, "centerYAnchor"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerYAnchor"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
          objc_msgSend(v8, "addObject:", v21);

          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView centerXAnchor](self->_containerView, "centerXAnchor"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerXAnchor"));
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
          goto LABEL_16;
        case 1uLL:
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
          v30 = v28;
          v31 = v29;
          v32 = v10;
          goto LABEL_9;
        case 2uLL:
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
          v35 = v33;
          v36 = v34;
          v37 = v10;
          goto LABEL_12;
        case 4uLL:
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
          v32 = -v14;
          v30 = v28;
          v31 = v29;
LABEL_9:
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, v32));
          objc_msgSend(v8, "addObject:", v38);

          goto LABEL_10;
        case 8uLL:
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
          v37 = -v14;
          v35 = v33;
          v36 = v34;
LABEL_12:
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v37));
          objc_msgSend(v8, "addObject:", v39);

          goto LABEL_13;
        default:
          goto LABEL_17;
      }
    case 1uLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
      v25 = v22;
      v26 = v23;
      v27 = v10;
      goto LABEL_15;
    case 2uLL:
LABEL_10:
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView leftAnchor](self->_containerView, "leftAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leftAnchor"));
      v25 = v22;
      v26 = v23;
      v27 = v12;
      goto LABEL_15;
    case 4uLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
      v27 = -v14;
      goto LABEL_14;
    case 8uLL:
LABEL_13:
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView rightAnchor](self->_containerView, "rightAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rightAnchor"));
      v27 = -v16;
LABEL_14:
      v25 = v22;
      v26 = v23;
LABEL_15:
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, v27));
LABEL_16:
      v40 = (void *)v24;
      objc_msgSend(v8, "addObject:", v24);

      break;
    default:
      break;
  }
LABEL_17:
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration _sharedLayoutConstraintsForHost:withLayoutGuide:](self, "_sharedLayoutConstraintsForHost:withLayoutGuide:", v6, v7));
  objc_msgSend(v8, "addObjectsFromArray:", v41);

  v42 = objc_msgSend(v8, "copy");
  return v42;
}

- (id)_hidingLayoutConstraintsForHost:(id)a3 withLayoutGuide:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[CarCardConfiguration layout](self, "layout", 0, 0);
  -[CarCardConfiguration effectiveMargins](self, "effectiveMargins");
  v10 = v9;
  v12 = v11;
  v13 = -[CarCardConfiguration effectiveEdgePosition](self, "effectiveEdgePosition");
  v14 = -[CarCardConfiguration effectiveCornerPosition](self, "effectiveCornerPosition");
  switch(v13)
  {
    case 0uLL:
      switch(v14)
      {
        case 1uLL:
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, v10));
          objc_msgSend(v8, "addObject:", v23);

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView rightAnchor](self->_containerView, "rightAnchor"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leftAnchor"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
          goto LABEL_9;
        case 2uLL:
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, v10));
          objc_msgSend(v8, "addObject:", v26);

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView leftAnchor](self->_containerView, "leftAnchor"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rightAnchor"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
          goto LABEL_9;
        case 4uLL:
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -v12));
          objc_msgSend(v8, "addObject:", v29);

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView rightAnchor](self->_cardView, "rightAnchor"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leftAnchor"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
          goto LABEL_9;
        case 8uLL:
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -v12));
          objc_msgSend(v8, "addObject:", v32);

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView leftAnchor](self->_containerView, "leftAnchor"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rightAnchor"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
LABEL_9:
          objc_msgSend(v8, "addObject:", v17);
          goto LABEL_7;
        default:
          goto LABEL_8;
      }
    case 1uLL:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
      objc_msgSend(v8, "addObject:", v17);
      goto LABEL_7;
    case 2uLL:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView rightAnchor](self->_containerView, "rightAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leftAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
      objc_msgSend(v8, "addObject:", v17);
      goto LABEL_7;
    case 4uLL:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
      objc_msgSend(v8, "addObject:", v17);
      goto LABEL_7;
    case 8uLL:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView leftAnchor](self->_containerView, "leftAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rightAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
      objc_msgSend(v8, "addObject:", v17);
LABEL_7:

      break;
    default:
      break;
  }
LABEL_8:
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration _sharedLayoutConstraintsForHost:withLayoutGuide:](self, "_sharedLayoutConstraintsForHost:withLayoutGuide:", v6, v7));
  objc_msgSend(v8, "addObjectsFromArray:", v18);

  v19 = objc_msgSend(v8, "copy");
  return v19;
}

- (id)_viewportConstraintsForHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  CarCardView *cardView;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewportLayoutGuide"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[CarCardConfiguration layout](self, "layout", 0, 0);
    v7 = -[CarCardConfiguration effectiveEdgePosition](self, "effectiveEdgePosition");
    v8 = -[CarCardConfiguration effectiveCornerPosition](self, "effectiveCornerPosition");
    switch(v7)
    {
      case 0uLL:
        switch(v8)
        {
          case 1uLL:
          case 2uLL:
            goto LABEL_13;
          case 4uLL:
            cardView = self->_cardView;
            goto LABEL_14;
          case 8uLL:
            cardView = self->_cardView;
LABEL_14:
            v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView topAnchor](cardView, "topAnchor"));
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:", v11));
            objc_msgSend(v6, "addObject:", v12);
            goto LABEL_8;
          default:
            goto LABEL_9;
        }
      case 1uLL:
LABEL_13:
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView bottomAnchor](self->_cardView, "bottomAnchor"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:", v11));
        objc_msgSend(v6, "addObject:", v12);
        goto LABEL_8;
      case 2uLL:
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView rightAnchor](self->_cardView, "rightAnchor"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leftAnchor"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:", v11));
        objc_msgSend(v6, "addObject:", v12);
        goto LABEL_8;
      case 4uLL:
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView topAnchor](self->_cardView, "topAnchor"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:", v11));
        objc_msgSend(v6, "addObject:", v12);
        goto LABEL_8;
      case 8uLL:
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView leftAnchor](self->_cardView, "leftAnchor"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rightAnchor"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintGreaterThanOrEqualToAnchor:", v11));
        objc_msgSend(v6, "addObject:", v12);
LABEL_8:

        break;
      default:
        break;
    }
LABEL_9:
    v9 = objc_msgSend(v6, "copy");

  }
  else
  {
    v9 = &__NSArray0__struct;
  }

  return v9;
}

- (id)_mapInsetsConstraintsForHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentLayoutGuide"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapInsetsLayoutGuide"));
  if (v6
    && (v7 = -[CarCardConfiguration effectiveEdgesAffectingMapInsets](self, "effectiveEdgesAffectingMapInsets")) != 0)
  {
    v8 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[CarCardConfiguration layout](self, "layout");
    v9 = -[CarCardConfiguration effectiveEdgePosition](self, "effectiveEdgePosition");
    v10 = -[CarCardConfiguration effectiveCornerPosition](self, "effectiveCornerPosition");
    switch(v9)
    {
      case 0uLL:
        switch(v10)
        {
          case 1uLL:
            if ((v8 & 4) != 0)
              goto LABEL_20;
            break;
          case 2uLL:
            if ((v8 & 4) != 0)
              goto LABEL_20;
            break;
          case 4uLL:
            if ((v8 & 1) != 0)
              goto LABEL_24;
            break;
          case 8uLL:
            if ((v8 & 1) != 0)
              goto LABEL_24;
            break;
          default:
            goto LABEL_15;
        }
        break;
      case 1uLL:
        if ((v8 & 4) != 0)
        {
LABEL_20:
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView bottomAnchor](self->_cardView, "bottomAnchor"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:", v14));
          objc_msgSend(v16, "addObject:", v15);
          goto LABEL_14;
        }
        break;
      case 2uLL:
        if ((v8 & 8) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView rightAnchor](self->_cardView, "rightAnchor"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leftAnchor"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintLessThanOrEqualToAnchor:", v14));
          objc_msgSend(v16, "addObject:", v15);
          goto LABEL_14;
        }
        break;
      case 4uLL:
        if ((v8 & 1) != 0)
        {
LABEL_24:
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView topAnchor](self->_cardView, "topAnchor"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintGreaterThanOrEqualToAnchor:", v14));
          objc_msgSend(v16, "addObject:", v15);
          goto LABEL_14;
        }
        break;
      case 8uLL:
        if ((v8 & 2) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView leftAnchor](self->_cardView, "leftAnchor"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rightAnchor"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintGreaterThanOrEqualToAnchor:", v14));
          objc_msgSend(v16, "addObject:", v15);
LABEL_14:

        }
        break;
      default:
        break;
    }
LABEL_15:
    v11 = objc_msgSend(v16, "copy");

  }
  else
  {
    v11 = &__NSArray0__struct;
  }

  return v11;
}

- (id)_collisionConstraintsForHost:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;

  v4 = a3;
  if (-[CarCardConfiguration staysOnTop](self, "staysOnTop"))
  {
    v5 = &__NSArray0__struct;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = -[CarCardConfiguration effectiveEdgePosition](self, "effectiveEdgePosition");
    v8 = -[CarCardConfiguration effectiveCornerPosition](self, "effectiveCornerPosition");
    switch(v7)
    {
      case 0uLL:
        switch(v8)
        {
          case 1uLL:
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 2));
            if (v9)
            {
              v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor"));
              v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
              objc_msgSend(v6, "addObject:", v12);

            }
            v13 = v4;
            v14 = 1;
            goto LABEL_44;
          case 2uLL:
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 8));
            if (v9)
            {
              v58 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor"));
              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v59));
              objc_msgSend(v6, "addObject:", v60);

            }
            v61 = v4;
            v62 = 1;
            goto LABEL_49;
          case 4uLL:
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 2));
            if (v9)
            {
              v63 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
              v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v64));
              objc_msgSend(v6, "addObject:", v65);

            }
            v13 = v4;
            v14 = 4;
LABEL_44:
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collisionGuideForEdge:", v14));
            if (!v21)
              goto LABEL_35;
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView rightAnchor](self->_containerView, "rightAnchor"));
            v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leftAnchor"));
            goto LABEL_51;
          case 8uLL:
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 8));
            if (v9)
            {
              v67 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
              v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v68));
              objc_msgSend(v6, "addObject:", v69);

            }
            v61 = v4;
            v62 = 4;
LABEL_49:
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "collisionGuideForEdge:", v62));
            if (!v21)
              goto LABEL_35;
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView leftAnchor](self->_containerView, "leftAnchor"));
            v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "rightAnchor"));
LABEL_51:
            v26 = (void *)v66;
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v66));
            objc_msgSend(v6, "addObject:", v55);
            break;
          default:
            goto LABEL_36;
        }
        goto LABEL_33;
      case 1uLL:
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 1));
        if (v9)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView leftAnchor](self->_containerView, "leftAnchor"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leftAnchor"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
          objc_msgSend(v6, "addObject:", v30);

          v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView rightAnchor](self->_containerView, "rightAnchor"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rightAnchor"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
          objc_msgSend(v6, "addObject:", v33);

        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 2));
        if (v21)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
          objc_msgSend(v6, "addObject:", v36);

        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 8));
        if (!v25)
          goto LABEL_34;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor"));
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
        break;
      case 2uLL:
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 2));
        if (v9)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
          objc_msgSend(v6, "addObject:", v17);

          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
          objc_msgSend(v6, "addObject:", v20);

        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 4));
        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView rightAnchor](self->_containerView, "rightAnchor"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leftAnchor"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
          objc_msgSend(v6, "addObject:", v24);

        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 1));
        if (!v25)
          goto LABEL_34;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView rightAnchor](self->_containerView, "rightAnchor"));
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leftAnchor"));
        break;
      case 4uLL:
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 4));
        if (v9)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView leftAnchor](self->_containerView, "leftAnchor"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leftAnchor"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
          objc_msgSend(v6, "addObject:", v39);

          v40 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView rightAnchor](self->_containerView, "rightAnchor"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rightAnchor"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v41));
          objc_msgSend(v6, "addObject:", v42);

        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 2));
        if (v21)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v44));
          objc_msgSend(v6, "addObject:", v45);

        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 8));
        if (!v25)
          goto LABEL_34;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
        break;
      case 8uLL:
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 8));
        if (v9)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v47));
          objc_msgSend(v6, "addObject:", v48);

          v49 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView bottomAnchor](self->_containerView, "bottomAnchor"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v50));
          objc_msgSend(v6, "addObject:", v51);

        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 4));
        if (v21)
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView leftAnchor](self->_containerView, "leftAnchor"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "rightAnchor"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v53));
          objc_msgSend(v6, "addObject:", v54);

        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collisionGuideForEdge:", 1));
        if (!v25)
          goto LABEL_34;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView leftAnchor](self->_containerView, "leftAnchor"));
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "rightAnchor"));
        break;
      default:
        goto LABEL_36;
    }
    v55 = (void *)v27;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
    objc_msgSend(v6, "addObject:", v56);

LABEL_33:
LABEL_34:

LABEL_35:
LABEL_36:
    v5 = objc_msgSend(v6, "copy");

  }
  return v5;
}

- (id)_collisionLayoutGuidesForHost:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(&off_1012741C0, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(&off_1012741C0);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collisionGuideForEdge:", objc_msgSend(v9, "unsignedIntegerValue")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, v9);

      }
      v6 = objc_msgSend(&off_1012741C0, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v4;
}

- (CGRect)collisionLayoutGuideFrameForEdge:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
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
  CGRect result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration collisionLayoutGuides](self, "collisionLayoutGuides"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));
  objc_msgSend(v6, "layoutFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  CarCardConfiguration *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  CarCardConfiguration *v21;

  if (self->_hidden != a3)
  {
    v3 = a3;
    self->_hidden = a3;
    -[CarCardConfiguration updateVisibility](self, "updateVisibility");
    v5 = sub_10043333C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_11:

      return;
    }
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    v14 = CFSTR("NO");
    if (v3)
      v14 = CFSTR("YES");
    v15 = v14;
    *(_DWORD *)buf = 138543874;
    v17 = v13;
    v18 = 2112;
    v19 = v15;
    v20 = 2112;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Did set hidden (hidden:%@, configuration:%@)", buf, 0x20u);

    goto LABEL_11;
  }
}

- (void)updateVisibility
{
  CarCardView *cardView;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  CarCardConfiguration *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  id v20;
  CarCardConfiguration *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;

  cardView = self->_cardView;
  if (!cardView)
  {
    v10 = sub_10043333C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v12 = self;
    v13 = (objc_class *)objc_opt_class(v12);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration performSelector:](v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_13;
      }

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_13:

    *(_DWORD *)buf = 138543362;
    v28 = v18;
    v19 = "[%{public}@] Will not update visibility constraints, no card view";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);

    goto LABEL_23;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView window](cardView, "window"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
  if (!v5)
  {

LABEL_15:
    v20 = sub_10043333C();
    v11 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v21 = self;
      v22 = (objc_class *)objc_opt_class(v21);
      v23 = NSStringFromClass(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      if ((objc_opt_respondsToSelector(v21, "accessibilityIdentifier") & 1) != 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration performSelector:](v21, "performSelector:", "accessibilityIdentifier"));
        v26 = v25;
        if (v25 && !objc_msgSend(v25, "isEqualToString:", v24))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v24, v21, v26));

          goto LABEL_21;
        }

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v24, v21));
LABEL_21:

      *(_DWORD *)buf = 138543362;
      v28 = v18;
      v19 = "[%{public}@] Will not update visibility constraints, no window or window detached for card view";
      goto LABEL_22;
    }
LABEL_23:

    return;
  }
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardView window](self->_cardView, "window"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
  v9 = objc_msgSend(v8, "activationState");

  if (v9 == (id)-1)
    goto LABEL_15;
  if (-[CarCardConfiguration isHidden](self, "isHidden"))
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_showingConstraints);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_hidingConstraints);
    if (!-[CarCardConfiguration isTransitioning](self, "isTransitioning"))
    {
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_viewportConstraints);
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_mapInsetsConstraints);
      +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_collisionConstraints);
    }
  }
  else
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_hidingConstraints);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_showingConstraints);
    if (!-[CarCardConfiguration isTransitioning](self, "isTransitioning"))
    {
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_viewportConstraints);
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_mapInsetsConstraints);
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_collisionConstraints);
    }
  }
}

- (void)setAccessoryView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_accessoryView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_accessoryView, a3);
    v5 = v6;
    self->_invalidationState |= 2uLL;
  }

}

- (void)setTitle:(id)a3
{
  id v5;
  NSString *title;
  id v7;
  void *v8;
  unsigned __int8 v9;
  unint64_t v10;

  v5 = a3;
  title = self->_title;
  v10 = (unint64_t)v5;
  v7 = title;
  v8 = (void *)v10;
  if (v10 | (unint64_t)v7)
  {
    v9 = objc_msgSend((id)v10, "isEqual:", v7);

    v8 = (void *)v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_title, a3);
      v8 = (void *)v10;
      self->_invalidationState |= 4uLL;
    }
  }

}

- (void)setTitleNumberOfLines:(int64_t)a3
{
  if (self->_titleNumberOfLines != a3)
  {
    self->_titleNumberOfLines = a3;
    self->_invalidationState |= 4uLL;
  }
}

- (void)setContent:(id)a3
{
  CarCardContent *v5;
  CarCardContent *v6;

  v5 = (CarCardContent *)a3;
  if (self->_content != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_content, a3);
    v5 = v6;
    self->_invalidationState |= 2uLL;
  }

}

- (void)setLayout:(id *)a3
{
  $BB93BFCD997B2E6D069363521B6038E4 *p_layout;
  NSNumber *secondaryAxisFillLimit;
  NSNumber *primaryAxisFillLimit;
  char v8;
  NSNumber *v9;
  NSNumber *v10;
  _BOOL4 v11;
  _BOOL4 v12;

  p_layout = &self->_layout;
  primaryAxisFillLimit = self->_layout.primaryAxisFillLimit;
  secondaryAxisFillLimit = self->_layout.secondaryAxisFillLimit;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*(int64x2_t *)&self->_layout.edgePosition, *(int64x2_t *)&a3->var0), (int32x4_t)vceqq_s64(*(int64x2_t *)&self->_layout.primaryAxis, *(int64x2_t *)&a3->var2))), 0xFuLL))) & 1) != 0&& self->_layout.primaryAxisFillMode == a3->var4&& self->_layout.secondaryAxisFillMode == a3->var6&& self->_layout.edgesAffectingMapInsets == a3->var12&& self->_layout.flipForRightHandDrive == a3->var11&& self->_layout.primaryAxisFillModePriority == a3->var5&& self->_layout.secondaryAxisFillModePriority == a3->var7)
  {
    v8 = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_layout.margins.top, *(float64x2_t *)&a3->var10.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_layout.margins.bottom, *(float64x2_t *)&a3->var10.bottom))), 0xFuLL)));
    v9 = secondaryAxisFillLimit;

    if ((v8 & 1) != 0)
      goto LABEL_21;
  }
  else
  {
    v10 = secondaryAxisFillLimit;

  }
  v11 = self->_layout.primaryAxis != a3->var2
     || self->_layout.primaryAxisFillMode != a3->var4
     || self->_layout.secondaryAxisFillMode != a3->var6;
  v12 = self->_layout.cornerPosition != a3->var1 || p_layout->edgePosition != a3->var0;
  if (self->_layout.primaryAxisFillModePriority != a3->var5
    || v11
    || v12
    || self->_layout.secondaryAxisFillModePriority != a3->var7)
  {
    self->_invalidationState |= 1uLL;
  }
  sub_10063F028((uint64_t)p_layout, (__int128 *)a3);
LABEL_21:

}

- (void)setStaysOnTop:(BOOL)a3
{
  if (self->_staysOnTop != a3)
  {
    self->_staysOnTop = a3;
    self->_invalidationState |= 4uLL;
  }
}

- (void)setSelectionHandler:(id)a3
{
  id v4;
  id selectionHandler;

  if (self->_selectionHandler != a3)
  {
    v4 = objc_retainBlock(a3);
    selectionHandler = self->_selectionHandler;
    self->_selectionHandler = v4;

    self->_invalidationState |= 4uLL;
  }
}

- (void)setTransitioning:(BOOL)a3
{
  if (self->_transitioning != a3)
  {
    self->_transitioning = a3;
    -[CarCardView setTransitioning:](self->_cardView, "setTransitioning:");
  }
}

- (unint64_t)effectiveEdgePosition
{
  unint64_t v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;

  -[CarCardConfiguration layout](self, "layout");
  v2 = v8;
  if (v11)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v4 = objc_msgSend(v3, "rightHandDrive");

    v5 = 8;
    v6 = 2;
    if (v8 != 8)
      v6 = v8;
    if (v8 != 2)
      v5 = v6;
    if (v4)
      v2 = v5;
  }

  return v2;
}

- (unint64_t)effectiveCornerPosition
{
  unint64_t v2;
  void *v3;
  unsigned int v4;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;

  -[CarCardConfiguration layout](self, "layout");
  v2 = v6;
  if (v9)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v4 = objc_msgSend(v3, "rightHandDrive");

    if (v4)
    {
      switch(v6)
      {
        case 1uLL:
          v2 = 2;
          break;
        case 2uLL:
          v2 = 1;
          break;
        case 4uLL:
          v2 = 8;
          break;
        case 8uLL:
          v2 = 4;
          break;
      }
    }
  }

  return v2;
}

- (UIEdgeInsets)effectiveMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[CarCardConfiguration layout](self, "layout", 0, 0, 0);

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (unint64_t)effectiveEdgesAffectingMapInsets
{
  unint64_t v3;
  void *v4;
  unsigned int v5;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  unint64_t v12;

  -[CarCardConfiguration layout](self, "layout");
  v3 = v12;

  -[CarCardConfiguration layout](self, "layout");
  if (v9)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v5 = objc_msgSend(v4, "rightHandDrive");

    if (v5)
      return (v12 >> 2) & 2 | (8 * ((v12 >> 1) & 1)) | v12;
  }
  else
  {

  }
  return v3;
}

- (void)_setShowContainerVisualisation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView viewWithTag:](self->_containerView, "viewWithTag:", 1234));
  v6 = v5;
  if (v3)
  {
    if (!v5)
    {
      v6 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v6, "setTag:", 1234);
      objc_msgSend(v6, "setUserInteractionEnabled:", 0);
      -[CarCardContainerView addSubview:](self->_containerView, "addSubview:", v6);
      v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
      v23[0] = v19;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", 4.0));
      v23[1] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rightAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView leftAnchor](self->_containerView, "leftAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, -2.0));
      v23[2] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardContainerView topAnchor](self->_containerView, "topAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 2.0));
      v23[3] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

    }
    v15 = (double)(arc4random() % 0xA) / 10.0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v15, 0.800000012, 0.600000024, 0.300000012));
    -[CarCardContainerView setBackgroundColor:](self->_containerView, "setBackgroundColor:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v15, 0.800000012, 0.600000024, 0.800000012));
    objc_msgSend(v6, "setBackgroundColor:", v17);

  }
  else
  {
    objc_msgSend(v5, "removeFromSuperview");

    v22 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CarCardContainerView setBackgroundColor:](self->_containerView, "setBackgroundColor:");

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  CarCardConfiguration *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_1014B8828 != a6)
  {
    v23.receiver = self;
    v23.super_class = (Class)CarCardConfiguration;
    -[CarCardConfiguration observeValueForKeyPath:ofObject:change:context:](&v23, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_13;
  }
  if (!self->_ignoreContainerBoundsChanges && objc_msgSend(v10, "isEqualToString:", CFSTR("bounds")))
  {
    v13 = sub_10043333C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      -[CarCardConfiguration _updateAvailableCardSize](self, "_updateAvailableCardSize");
      goto LABEL_13;
    }
    v15 = self;
    v16 = (objc_class *)objc_opt_class(v15);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if ((objc_opt_respondsToSelector(v15, "accessibilityIdentifier") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration performSelector:](v15, "performSelector:", "accessibilityIdentifier"));
      v20 = v19;
      if (v19 && !objc_msgSend(v19, "isEqualToString:", v18))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v18, v15, v20));

        goto LABEL_11;
      }

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v18, v15));
LABEL_11:

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration key](v15, "key"));
    *(_DWORD *)buf = 138543618;
    v25 = v21;
    v26 = 2112;
    v27 = v22;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}@] %@ notified of container bounds change", buf, 0x16u);

    goto LABEL_12;
  }
LABEL_13:

}

- (void)_updateAvailableCardSize
{
  void *v3;
  char v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration content](self, "content"));
  v4 = objc_opt_respondsToSelector(v3, "setAvailableCardSize:");

  if ((v4 & 1) != 0)
  {
    -[CarCardContainerView bounds](self->_containerView, "bounds");
    v6 = v5;
    v8 = v7;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration content](self, "content"));
    objc_msgSend(v9, "setAvailableCardSize:", v6, v8);

  }
}

- (void)_startIgnoringContainerBoundsChanges
{
  id v3;
  NSObject *v4;
  CarCardConfiguration *v5;
  CarCardConfiguration *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint8_t buf[4];
  __CFString *v15;
  __int16 v16;
  void *v17;

  v3 = sub_10043333C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration key](v6, "key"));
    *(_DWORD *)buf = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] %@ will start ignoring container bounds changes", buf, 0x16u);

  }
  self->_ignoreContainerBoundsChanges = 1;
}

- (void)_stopIgnoringContainerBoundsChanges
{
  _BOOL4 ignoreContainerBoundsChanges;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  CarCardConfiguration *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CarCardConfiguration *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;

  ignoreContainerBoundsChanges = self->_ignoreContainerBoundsChanges;
  v4 = sub_10043333C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (ignoreContainerBoundsChanges)
  {
    if (!v6)
    {
LABEL_9:

      self->_ignoreContainerBoundsChanges = 0;
      -[CarCardConfiguration _updateAvailableCardSize](self, "_updateAvailableCardSize");
      return;
    }
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration key](v7, "key"));
    *(_DWORD *)buf = 138543618;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] %@ will stop ignoring container bounds changes", buf, 0x16u);

    goto LABEL_9;
  }
  if (v6)
  {
    v15 = self;
    v16 = (objc_class *)objc_opt_class(v15);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if ((objc_opt_respondsToSelector(v15, "accessibilityIdentifier") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration performSelector:](v15, "performSelector:", "accessibilityIdentifier"));
      v20 = v19;
      if (v19 && !objc_msgSend(v19, "isEqualToString:", v18))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v18, v15, v20));

        goto LABEL_16;
      }

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v18, v15));
LABEL_16:

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarCardConfiguration key](v15, "key"));
    *(_DWORD *)buf = 138543618;
    v24 = v21;
    v25 = 2112;
    v26 = v22;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] %@ told to stop ignoring container bounds changes, but wasn't", buf, 0x16u);

  }
}

- (CarCardContent)content
{
  return self->_content;
}

- ($B1874A4E4729613F071A632570863A63)layout
{
  __int128 v5;
  $B1874A4E4729613F071A632570863A63 *result;
  __int128 v7;

  v5 = *(_OWORD *)&self->_layout.primaryAxis;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_layout.edgePosition;
  *(_OWORD *)&retstr->var2 = v5;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->_layout.primaryAxisFillMode;
  *(_OWORD *)(&retstr->var5 + 1) = *(_OWORD *)(&self->_layout.primaryAxisFillModePriority + 1);
  retstr->var8 = self->_layout.primaryAxisFillLimit;
  result = self->_layout.secondaryAxisFillLimit;
  retstr->var9 = result;
  v7 = *(_OWORD *)&self->_layout.margins.bottom;
  *(_OWORD *)&retstr->var10.top = *(_OWORD *)&self->_layout.margins.top;
  *(_OWORD *)&retstr->var10.bottom = v7;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&self->_layout.flipForRightHandDrive;
  retstr->var13 = self->_layout.horizontallyCenterMapInsets;
  return result;
}

- (BOOL)staysOnTop
{
  return self->_staysOnTop;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)titleNumberOfLines
{
  return self->_titleNumberOfLines;
}

- (unint64_t)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(unint64_t)a3
{
  self->_accessory = a3;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (NSString)key
{
  return self->_key;
}

- (CarCardView)cardView
{
  return self->_cardView;
}

- (CarCardContainerView)containerView
{
  return self->_containerView;
}

- (NSArray)showingConstraints
{
  return self->_showingConstraints;
}

- (NSArray)hidingConstraints
{
  return self->_hidingConstraints;
}

- (NSArray)viewportConstraints
{
  return self->_viewportConstraints;
}

- (NSArray)mapInsetsConstraints
{
  return self->_mapInsetsConstraints;
}

- (NSArray)collisionConstraints
{
  return self->_collisionConstraints;
}

- (NSDictionary)collisionLayoutGuides
{
  return self->_collisionLayoutGuides;
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (unint64_t)invalidationState
{
  return self->_invalidationState;
}

- (CarCardContent)previousContent
{
  return (CarCardContent *)objc_loadWeakRetained((id *)&self->_previousContent);
}

- (void)setPreviousContent:(id)a3
{
  objc_storeWeak((id *)&self->_previousContent, a3);
}

- (void).cxx_destruct
{

  objc_destroyWeak((id *)&self->_previousContent);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_collisionLayoutGuides, 0);
  objc_storeStrong((id *)&self->_collisionConstraints, 0);
  objc_storeStrong((id *)&self->_mapInsetsConstraints, 0);
  objc_storeStrong((id *)&self->_viewportConstraints, 0);
  objc_storeStrong((id *)&self->_hidingConstraints, 0);
  objc_storeStrong((id *)&self->_showingConstraints, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_content, 0);

}

@end
