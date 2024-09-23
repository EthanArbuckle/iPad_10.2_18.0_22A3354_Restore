@implementation TransitSchedulesDeparturePickerCollectionViewCell

- (TransitSchedulesDeparturePickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  TransitSchedulesDeparturePickerCollectionViewCell *v3;
  TransitSchedulesDeparturePickerCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitSchedulesDeparturePickerCollectionViewCell;
  v3 = -[TransitSchedulesDeparturePickerCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TransitSchedulesDeparturePickerCollectionViewCell configureViews](v3, "configureViews");
  return v4;
}

- (void)configureViews
{
  void *v3;
  UIButton *v4;
  UIButton *picker;
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
  _QWORD v20[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDeparturePickerCollectionViewCell contentView](self, "contentView"));
  v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 124));
  picker = self->_picker;
  self->_picker = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_picker, "titleLabel"));
  objc_msgSend(v6, "setTextAlignment:", 0);

  -[UIButton setContentHorizontalAlignment:](self->_picker, "setContentHorizontalAlignment:", 1);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_picker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setShowsMenuAsPrimaryAction:](self->_picker, "setShowsMenuAsPrimaryAction:", 1);
  -[UIButton setContextMenuInteractionEnabled:](self->_picker, "setContextMenuInteractionEnabled:", 1);
  objc_msgSend(v3, "addSubview:", self->_picker);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_picker, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v20[0] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_picker, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v7));
  v20[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_picker, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v20[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_picker, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v20[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

}

- (void)setDepartures:(id)a3 withSelectedDeparture:(id)a4 referenceDate:(id)a5 timeZone:(id)a6 timeDisplayStyle:(unint64_t)a7
{
  id v12;
  id v13;
  NSArray *v14;
  NSArray *departures;
  id v16;

  v12 = a5;
  v16 = a4;
  v13 = a3;
  -[TransitSchedulesDepartureBaseViewCell setTimeZone:](self, "setTimeZone:", a6);
  -[TransitSchedulesDepartureBaseViewCell setReferenceDate:](self, "setReferenceDate:", v12);

  -[TransitSchedulesDepartureBaseViewCell setTimeDisplayStyle:](self, "setTimeDisplayStyle:", a7);
  v14 = (NSArray *)objc_msgSend(v13, "copy");

  departures = self->_departures;
  self->_departures = v14;

  -[TransitSchedulesDeparturePickerCollectionViewCell _updateDeparturePickerWithSelectedDeparture:](self, "_updateDeparturePickerWithSelectedDeparture:", v16);
}

- (id)titleForDeparture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureBaseViewCell timeStringForDeparture:](self, "timeStringForDeparture:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDeparturePickerCollectionViewCell statusStringForDeparture:](self, "statusStringForDeparture:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] %@ time · %@ status"), CFSTR("localized string not found"), 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v5, v6));
  return v9;
}

- (void)_updateDeparturePickerWithSelectedDeparture:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *obj;
  id v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id buf[2];
  _BYTE v23[128];

  v15 = a3;
  if (!-[NSArray count](self->_departures, "count"))
  {
    v4 = sub_1004325AC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unable to populate the departures picker since there are no departures", (uint8_t *)buf, 2u);
    }

    -[UIButton setMenu:](self->_picker, "setMenu:", 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_initWeak(buf, self);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_departures;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDeparturePickerCollectionViewCell titleForDeparture:](self, "titleForDeparture:", v10));
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10068ACF4;
        v16[3] = &unk_1011ACEC0;
        objc_copyWeak(&v17, buf);
        v16[4] = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v11, 0, v11, v16));
        objc_msgSend(v12, "setState:", objc_msgSend(v15, "tripIdentifier") == objc_msgSend(v10, "tripIdentifier"));
        objc_msgSend(v6, "addObject:", v12);

        objc_destroyWeak(&v17);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1011EB268, v6));
  -[UIButton setMenu:](self->_picker, "setMenu:", v13);

  objc_destroyWeak(buf);
}

- (id)statusStringForDeparture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];

  v4 = a3;
  if (objc_msgSend(v4, "isCanceled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("Schedules Departure cell status - Canceled");
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));
    goto LABEL_10;
  }
  v8 = objc_msgSend(v4, "liveStatus") == 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureBaseViewCell referenceDate](self, "referenceDate"));
  LODWORD(v8) = objc_msgSend(v4, "isPastDepartureRelativeToDate:usingGracePeriod:", v9, v8);

  if ((_DWORD)v8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    v7 = CFSTR("Schedules Departure cell status - Departed");
    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "liveStatusString"));
  if (v6)
  {
    v11 = objc_alloc((Class)MKServerFormattedStringParameters);
    MKFormattedStringOptionsMakeDefault(v19);
    v12 = objc_msgSend(v11, "initWithOptions:variableOverrides:", v19, 0);
    v13 = objc_msgSend(objc_alloc((Class)MKServerFormattedString), "initWithGeoServerString:parameters:", v6, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "multiPartAttributedStringWithAttributes:", &__NSDictionary0__struct));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "attributedString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "string"));

  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureBaseViewCell emphasizedLowFrequencyDepartureDateForDeparture:](self, "emphasizedLowFrequencyDepartureDateForDeparture:", v4));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesDepartureBaseViewCell dateFormatter](self, "dateFormatter"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringFromDate:", v12));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_formattedDescriptionForLiveStatus:updatedDepartureTimeString:](NSString, "_navigation_formattedDescriptionForLiveStatus:updatedDepartureTimeString:", -[TransitSchedulesDepartureBaseViewCell effectiveLiveStatusForDeparture:](self, "effectiveLiveStatusForDeparture:", v4), v17));
  }

LABEL_10:
  return v10;
}

- (TransitSchedulesDeparturePickerCollectionViewCellDelegate)delegate
{
  return (TransitSchedulesDeparturePickerCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_departures, 0);
  objc_storeStrong((id *)&self->_picker, 0);
}

@end
