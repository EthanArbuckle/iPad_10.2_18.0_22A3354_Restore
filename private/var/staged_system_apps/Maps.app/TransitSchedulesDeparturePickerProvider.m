@implementation TransitSchedulesDeparturePickerProvider

- (void)registerCellsForCollectionView:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(TransitSchedulesDeparturePickerCollectionViewCell), CFSTR("TransitDeparturePickerCellIdentifier"));

}

- (id)identifiersForDepartures:(id)a3
{
  void *v3;
  const __CFString *v5;

  if (objc_msgSend(a3, "count"))
  {
    v5 = CFSTR("TransitDeparturePickerCellIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  }
  else
  {
    v3 = &__NSArray0__struct;
  }
  return v3;
}

- (void)collectionView:(id)a3 selectedDeparture:(id)a4 atIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, objc_msgSend(a5, "section")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForItemAtIndexPath:", v8));

  v10 = objc_opt_class(TransitSchedulesDeparturePickerCollectionViewCell);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    objc_msgSend(v9, "setSelectedDeparture:", v11);

}

- (id)collectionView:(id)a3 departureCellWithIdentifier:(id)a4 indexPath:(id)a5 referenceDate:(id)a6 dataProvider:(id)a7
{
  id v11;
  id v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v11 = a7;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TransitDeparturePickerCellIdentifier"), a5));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v13, "setDelegate:", WeakRetained);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "departures"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectedDeparture"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timeZone"));
  v18 = objc_msgSend(v11, "timeDisplayStyle");

  objc_msgSend(v13, "setDepartures:withSelectedDeparture:referenceDate:timeZone:timeDisplayStyle:", v15, v16, v12, v17, v18);
  return v13;
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
}

@end
