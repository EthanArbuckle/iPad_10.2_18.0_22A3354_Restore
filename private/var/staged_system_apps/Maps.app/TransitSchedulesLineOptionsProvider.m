@implementation TransitSchedulesLineOptionsProvider

- (NSArray)identifiers
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v2, "addObject:", CFSTR("LineOptionsSectionCellPinIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v4 = objc_msgSend(v3, "isUsingOfflineMaps");

  if ((v4 & 1) == 0)
    objc_msgSend(v2, "addObject:", CFSTR("LineOptionsSectionCellViewOnMapIdentifier"));
  objc_msgSend(v2, "addObject:", CFSTR("LineOptionsSectionCellDirectionsIdentifier"));
  objc_msgSend(v2, "addObject:", CFSTR("LineOptionsSectionCellLineInfoIdentifier"));
  v5 = objc_msgSend(v2, "copy");

  return (NSArray *)v5;
}

+ (Class)cellClass
{
  return (Class)objc_opt_class(TransitSchedulesLineOptionsProviderViewCell, a2);
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  id *v20;
  const __CFString *v21;
  const __CFString *v22;
  void (*v23)(uint64_t);
  void ***v24;
  void *v25;
  void *v26;
  void ***v27;
  id v28;
  void *v29;
  void **v30;
  uint64_t v31;
  void **v32;
  uint64_t v33;
  void **v34;
  uint64_t v35;
  void **v36;
  uint64_t v37;
  void **v38;
  uint64_t v39;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class(TransitSchedulesLineOptionsProviderViewCell);
  if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
  {
    v12 = v10;
    v13 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      v14 = v12;
    else
      v14 = 0;
    v15 = v14;

    if (!v15)
      goto LABEL_16;
    objc_initWeak(&location, self);
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("LineOptionsSectionCellPinIdentifier")))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesLineOptionsProvider delegate](self, "delegate"));
      v17 = objc_msgSend(v16, "isPinnedTransitLine");

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (v17)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] Unpin Line"), CFSTR("localized string not found"), 0));
        v20 = (id *)&v39;

        v21 = CFSTR("UnpinLine");
        v38 = _NSConcreteStackBlock;
        v22 = CFSTR("pin.slash.fill");
        v23 = sub_10054813C;
        v24 = &v38;
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] Pin line"), CFSTR("localized string not found"), 0));
        v20 = (id *)&v37;

        v21 = CFSTR("PinLine");
        v36 = _NSConcreteStackBlock;
        v22 = CFSTR("pin.fill");
        v23 = sub_100548184;
        v24 = &v36;
      }
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("LineOptionsSectionCellViewOnMapIdentifier")))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] View on Map"), CFSTR("localized string not found"), 0));
      v20 = (id *)&v35;

      v21 = CFSTR("ViewLineOnMap");
      v34 = _NSConcreteStackBlock;
      v22 = CFSTR("map.fill");
      v23 = sub_1005481CC;
      v24 = &v34;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("LineOptionsSectionCellDirectionsIdentifier")))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] Get Directions"), CFSTR("localized string not found"), 0));
      v20 = (id *)&v33;

      v21 = CFSTR("GetDirectionsToStation");
      v32 = _NSConcreteStackBlock;
      v22 = CFSTR("arrow.triangle.turn.up.right.circle.fill");
      v23 = sub_100548214;
      v24 = &v32;
    }
    else
    {
      if (!objc_msgSend(v15, "isEqualToString:", CFSTR("LineOptionsSectionCellLineInfoIdentifier")))
      {
        v22 = 0;
        v19 = 0;
        v21 = 0;
        v27 = 0;
        goto LABEL_15;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("[Transit Schedules] Line Info"), CFSTR("localized string not found"), 0));
      v20 = (id *)&v31;

      v21 = CFSTR("LineInfo");
      v30 = _NSConcreteStackBlock;
      v22 = CFSTR("info.circle.fill");
      v23 = sub_10054825C;
      v24 = &v30;
    }
    v24[1] = (void **)3221225472;
    v24[2] = (void **)v23;
    v24[3] = (void **)&unk_1011BAB10;
    objc_copyWeak(v20, &location);
    v27 = objc_retainBlock(v24);
    objc_destroyWeak(v20);
LABEL_15:
    v28 = v8;
    objc_msgSend(v28, "setTitle:symbolName:action:axIdentifierForAction:", v19, v22, v27, v21);

    objc_destroyWeak(&location);
LABEL_16:

  }
}

- (BOOL)allowsCellSelection
{
  return 0;
}

- (TransitSchedulesLineOptionsProviderDelegate)delegate
{
  return (TransitSchedulesLineOptionsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
