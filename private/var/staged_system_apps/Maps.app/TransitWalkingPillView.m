@implementation TransitWalkingPillView

- (TransitWalkingPillView)init
{
  TransitWalkingPillView *v2;
  TransitWalkingPillView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitWalkingPillView;
  v2 = -[TransitWalkingPillView init](&v5, "init");
  v3 = v2;
  if (v2)
    -[TransitWalkingPillView _configureViews](v2, "_configureViews");
  return v3;
}

- (void)_configureViews
{
  TransitArtworkListView *v3;
  TransitArtworkListView *artwortListView;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v3 = objc_alloc_init(TransitArtworkListView);
  artwortListView = self->_artwortListView;
  self->_artwortListView = v3;

  -[TransitArtworkListView setTranslatesAutoresizingMaskIntoConstraints:](self->_artwortListView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TransitWalkingPillView addSubview:](self, "addSubview:", self->_artwortListView);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView topAnchor](self->_artwortListView, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitWalkingPillView topAnchor](self, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:", v19));
  v21[0] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView bottomAnchor](self->_artwortListView, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitWalkingPillView bottomAnchor](self, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:", v16));
  v21[1] = v15;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView centerYAnchor](self->_artwortListView, "centerYAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitWalkingPillView centerYAnchor](self, "centerYAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v6));
  v21[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView leadingAnchor](self->_artwortListView, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitWalkingPillView leadingAnchor](self, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v21[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitArtworkListView trailingAnchor](self->_artwortListView, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitWalkingPillView trailingAnchor](self, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
  v21[4] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    text = self->_text;
    self->_text = v4;

    -[TransitWalkingPillView _updateListView](self, "_updateListView");
  }

}

- (void)_updateListView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitWalkingPillView _walkingArtwork](self, "_walkingArtwork"));
  v4 = objc_claimAutoreleasedReturnValue(-[TransitWalkingPillView _textArtwork](self, "_textArtwork"));
  v5 = (void *)v4;
  if (v3 && v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitWalkingPillView _walkingArtwork](self, "_walkingArtwork"));
    v13[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitWalkingPillView _textArtwork](self, "_textArtwork"));
    v13[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));

    v12 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    v11 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    -[TransitArtworkListView setArtworkData:](self->_artwortListView, "setArtworkData:", v10);
    -[TransitWalkingPillView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[TransitWalkingPillView layoutIfNeeded](self, "layoutIfNeeded");

  }
}

- (id)_walkingArtwork
{
  id v2;
  void *v3;

  v2 = objc_msgSend(objc_alloc((Class)MKTransitShield), "initWithShieldType:text:color:", 210002, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitArtwork artworkWithShield:accessibilityText:](MKTransitArtwork, "artworkWithShield:accessibilityText:", v2, 0));

  return v3;
}

- (id)_textArtwork
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitWalkingPillView text](self, "text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_geo_serverFormattedString"));

  v4 = objc_msgSend(objc_alloc((Class)MKTransitText), "initWithFormattedString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitArtwork artworkWithText:](MKTransitArtwork, "artworkWithText:", v4));

  return v5;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[TransitArtworkListView intrinsicContentSize](self->_artwortListView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_artwortListView, 0);
}

@end
