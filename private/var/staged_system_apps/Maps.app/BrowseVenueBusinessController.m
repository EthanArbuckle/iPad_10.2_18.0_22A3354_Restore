@implementation BrowseVenueBusinessController

- (BrowseVenueBusinessController)initWithDelegate:(id)a3
{
  id v4;
  BrowseVenueBusinessController *v5;
  BrowseVenueBusinessController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BrowseVenueBusinessController;
  v5 = -[BrowseVenueBusinessController init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)setContentView:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_contentView, a3);
  v5 = a3;
  -[LocalSearchView setAccessibilityIdentifier:](self->_contentView, "setAccessibilityIdentifier:", CFSTR("BrowseVenueContentView"));
  -[LocalSearchView setState:](self->_contentView, "setState:", 1);
  -[BrowseVenueBusinessController updateContentViewForVenueAndReturnYESIfChanged](self, "updateContentViewForVenueAndReturnYESIfChanged");
  objc_msgSend(v5, "setText:forState:", 0, 3);
  objc_msgSend(v5, "setText:forState:", 0, 4);

}

- (BOOL)updateContentViewForVenueAndReturnYESIfChanged
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseVenueBusinessController venue](self, "venue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortName"));

  v5 = objc_msgSend(v4, "length");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = v6;
  if (v5)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Browse [venue with name]"), CFSTR("localized string not found"), 0));

    v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4));
    v7 = (void *)v8;
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Browse [venue without name]"), CFSTR("localized string not found"), 0));
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseVenueBusinessController contentView](self, "contentView"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textForState:", 1));

  if (!(v11 | v9) || v11 && (objc_msgSend((id)v11, "isEqualToString:", v9) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseVenueBusinessController contentView](self, "contentView"));
    v12 = 1;
    objc_msgSend(v13, "setText:forState:", v9, 1);

  }
  return v12;
}

- (BOOL)shouldBeVisible
{
  void *v3;
  unint64_t v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseVenueBusinessController venue](self, "venue"));
  if (v3)
  {
    v4 = -[BrowseVenueBusinessController lastUpdatedMapType](self, "lastUpdatedMapType");
    v5 = v4 - 1 >= 4 && v4 != 107;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)handleVenueWithFocusDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  dispatch_time_t v14;
  _QWORD block[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseVenueBusinessController venue](self, "venue"));
  if (objc_msgSend(v5, "venueID"))
  {

  }
  else
  {
    v6 = objc_msgSend(v4, "venueID");

    if (!v6)
      goto LABEL_12;
  }
  if (!-[BrowseVenueBusinessController updatingVenueAsync](self, "updatingVenueAsync"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseVenueBusinessController delegate](self, "delegate"));
    v8 = objc_msgSend(v7, "viewHasAppeared");

    if (v4 || (v8 & 1) != 0)
    {
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v10 = v9;
      -[BrowseVenueBusinessController lastVenueUpdateTimestamp](self, "lastVenueUpdateTimestamp");
      v12 = v10 - v11;
      if (v12 >= 1.0)
        v13 = 100000000;
      else
        v13 = (uint64_t)((1.0 - v12) * 1000000000.0);
      -[BrowseVenueBusinessController setUpdatingVenueAsync:](self, "setUpdatingVenueAsync:", 1);
      v14 = dispatch_time(0, v13);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100456D68;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      -[BrowseVenueBusinessController immediatelyHandleVenueWithFocusDidChange:](self, "immediatelyHandleVenueWithFocusDidChange:", 0);
    }
  }
LABEL_12:

}

- (void)handleMapTypeDidChange:(unint64_t)a3
{
  id v5;

  if (-[BrowseVenueBusinessController lastUpdatedMapType](self, "lastUpdatedMapType") != a3)
  {
    -[BrowseVenueBusinessController setLastUpdatedMapType:](self, "setLastUpdatedMapType:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BrowseVenueBusinessController delegate](self, "delegate"));
    objc_msgSend(v5, "businessControllerVisibilityDidChange:", self);

  }
}

- (void)immediatelyHandleVenueWithFocusDidChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseVenueBusinessController venue](self, "venue"));
  if (objc_msgSend(v4, "venueID"))
  {

    goto LABEL_4;
  }
  v5 = objc_msgSend(v9, "venueID");

  if (v5)
  {
LABEL_4:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseVenueBusinessController venue](self, "venue"));
    -[BrowseVenueBusinessController setVenue:](self, "setVenue:", v9);
    if (-[BrowseVenueBusinessController shouldBeVisible](self, "shouldBeVisible"))
    {
      v7 = -[BrowseVenueBusinessController updateContentViewForVenueAndReturnYESIfChanged](self, "updateContentViewForVenueAndReturnYESIfChanged");
      if (v9 && v6)
      {
        if (!v7)
        {
LABEL_13:

          goto LABEL_14;
        }
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseVenueBusinessController delegate](self, "delegate"));
        objc_msgSend(v8, "businessControllerContentSizeDidChange:", self);
LABEL_12:

        goto LABEL_13;
      }
    }
    else if (v9 && v6)
    {
      goto LABEL_13;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseVenueBusinessController delegate](self, "delegate"));
    objc_msgSend(v8, "businessControllerVisibilityDidChange:", self);
    goto LABEL_12;
  }
LABEL_14:

}

- (BOOL)showInCardFooterWhenCardHasExpandedLayout
{
  return 0;
}

- (void)sendAnalyticsOnUserActionWithTarget:(int)a3
{
  -[BrowseVenueBusinessController captureUserAction:onTarget:eventValue:](self, "captureUserAction:onTarget:eventValue:", 1055, *(_QWORD *)&a3, 0);
}

- (void)sendAnalyticsOnBecomeVisibleWithTarget:(int)a3
{
  -[BrowseVenueBusinessController captureUserAction:onTarget:eventValue:](self, "captureUserAction:onTarget:eventValue:", 1054, *(_QWORD *)&a3, 0);
}

- (void)captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v12 = objc_alloc_init((Class)GEOPlaceActionDetails);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseVenueBusinessController venue](self, "venue"));
  v10 = objc_msgSend(v9, "businessID");

  if (v10)
    objc_msgSend(v12, "setBusinessID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v11, "captureUserAction:onTarget:eventValue:placeActionDetails:", v6, v5, v8, v12);

}

- (LocalSearchView)contentView
{
  return self->_contentView;
}

- (LocalSearchBusinessControllerDelegate)delegate
{
  return (LocalSearchBusinessControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (VKVenueFeatureMarker)venue
{
  return self->_venue;
}

- (void)setVenue:(id)a3
{
  objc_storeStrong((id *)&self->_venue, a3);
}

- (double)lastVenueUpdateTimestamp
{
  return self->_lastVenueUpdateTimestamp;
}

- (void)setLastVenueUpdateTimestamp:(double)a3
{
  self->_lastVenueUpdateTimestamp = a3;
}

- (BOOL)updatingVenueAsync
{
  return self->_updatingVenueAsync;
}

- (void)setUpdatingVenueAsync:(BOOL)a3
{
  self->_updatingVenueAsync = a3;
}

- (unint64_t)lastUpdatedMapType
{
  return self->_lastUpdatedMapType;
}

- (void)setLastUpdatedMapType:(unint64_t)a3
{
  self->_lastUpdatedMapType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
