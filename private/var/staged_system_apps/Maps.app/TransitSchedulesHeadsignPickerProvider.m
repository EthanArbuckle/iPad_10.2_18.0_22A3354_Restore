@implementation TransitSchedulesHeadsignPickerProvider

- (void)registerCellsForCollectionView:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a3;
  v4 = objc_opt_class(TransitSchedulesHeadsignPickerCollectionViewCell);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[TransitSchedulesHeadsignPickerCollectionViewCell cellIdentifier](TransitSchedulesHeadsignPickerCollectionViewCell, "cellIdentifier"));
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v4, v5);

}

- (void)collectionView:(id)a3 selectedHeadsignForDepartureSequence:(id)a4 atIndexPath:(id)a5
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

  v10 = objc_opt_class(TransitSchedulesHeadsignPickerCollectionViewCell);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    objc_msgSend(v9, "setSelectedDepartureSequence:", v11);

}

- (id)collectionView:(id)a3 headsignCellWithIdentifier:(id)a4 indexPath:(id)a5 dataProvider:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransitSchedulesHeadsignPickerCollectionViewCell cellIdentifier](TransitSchedulesHeadsignPickerCollectionViewCell, "cellIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v10));

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v13, "setDelegate:", WeakRetained);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "departureSequences"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedDepartureSequence"));

  objc_msgSend(v13, "setDepartureSequences:withSelectedDepartureSequence:", v15, v16);
  return v13;
}

- (id)identifiersForDepartureSequences:(id)a3
{
  void *v3;
  void *v4;
  void *v6;

  if (!objc_msgSend(a3, "count"))
    return &__NSArray0__struct;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TransitSchedulesHeadsignPickerCollectionViewCell cellIdentifier](TransitSchedulesHeadsignPickerCollectionViewCell, "cellIdentifier"));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return v4;
}

- (TransitSchedulesHeadsignPickerCollectionViewCellDelegate)delegate
{
  return (TransitSchedulesHeadsignPickerCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
