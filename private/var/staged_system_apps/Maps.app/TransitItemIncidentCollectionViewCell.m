@implementation TransitItemIncidentCollectionViewCell

- (TransitItemIncidentCollectionViewCell)initWithFrame:(CGRect)a3
{
  TransitItemIncidentCollectionViewCell *v3;
  void *v4;
  MKTransitItemIncidentView *v5;
  MKTransitItemIncidentView *incidentView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[4];

  v26.receiver = self;
  v26.super_class = (Class)TransitItemIncidentCollectionViewCell;
  v3 = -[MapsThemeCollectionViewCell initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TransitItemIncidentCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (MKTransitItemIncidentView *)objc_alloc_init((Class)MKTransitItemIncidentView);
    incidentView = v3->_incidentView;
    v3->_incidentView = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitItemIncidentCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v7, "addSubview:", v3->_incidentView);

    -[MKTransitItemIncidentView setTranslatesAutoresizingMaskIntoConstraints:](v3->_incidentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKTransitItemIncidentView setLayoutMargins:](v3->_incidentView, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MKTransitItemIncidentView leadingAnchor](v3->_incidentView, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitItemIncidentCollectionViewCell contentView](v3, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
    v27[0] = v22;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MKTransitItemIncidentView trailingAnchor](v3->_incidentView, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitItemIncidentCollectionViewCell contentView](v3, "contentView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
    v27[1] = v18;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKTransitItemIncidentView topAnchor](v3->_incidentView, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitItemIncidentCollectionViewCell contentView](v3, "contentView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
    v27[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MKTransitItemIncidentView bottomAnchor](v3->_incidentView, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitItemIncidentCollectionViewCell contentView](v3, "contentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
    v27[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  }
  return v3;
}

- (void)configureWithIncidents:(id)a3 referenceDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    -[MKTransitItemIncidentView configureWithIncident:referenceDate:shouldShowImage:inSiri:](self->_incidentView, "configureWithIncident:referenceDate:shouldShowImage:inSiri:", v10, v7, 1, 0);

  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_100C071F8;
    v16 = sub_100C07208;
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100C07210;
    v11[3] = &unk_1011E9208;
    v11[4] = &v12;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] Multiple incidents"), CFSTR("localized string not found"), 0));

    -[MKTransitItemIncidentView configureWithMessage:incident:referenceDate:shouldShowImage:inSiri:](self->_incidentView, "configureWithMessage:incident:referenceDate:shouldShowImage:inSiri:", v9, v13[5], v7, 1, 0);
    _Block_object_dispose(&v12, 8);

  }
  -[MKTransitItemIncidentView setCellPosition:](self->_incidentView, "setCellPosition:", 0);
  -[TransitItemIncidentCollectionViewCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)updateTheme
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransitItemIncidentCollectionViewCell;
  -[MapsThemeCollectionViewCell updateTheme](&v3, "updateTheme");
  -[MKTransitItemIncidentView infoCardThemeChanged](self->_incidentView, "infoCardThemeChanged");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentView, 0);
}

@end
