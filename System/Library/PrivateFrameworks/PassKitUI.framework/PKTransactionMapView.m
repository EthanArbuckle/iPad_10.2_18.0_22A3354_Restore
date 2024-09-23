@implementation PKTransactionMapView

- (PKTransactionMapView)initWithFrame:(CGRect)a3
{
  PKTransactionMapView *v3;
  id v4;
  uint64_t v5;
  MKMapView *internalMapView;
  MKMapView *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKTransactionMapView;
  v3 = -[PKTransactionMapView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CC1870]);
    -[PKTransactionMapView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    internalMapView = v3->_internalMapView;
    v3->_internalMapView = (MKMapView *)v5;

    -[MKMapView setMapType:](v3->_internalMapView, "setMapType:", 0);
    -[MKMapView setShowsBuildings:](v3->_internalMapView, "setShowsBuildings:", 1);
    v7 = v3->_internalMapView;
    objc_msgSend(MEMORY[0x1E0CC1910], "filterIncludingAllCategories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKMapView setPointOfInterestFilter:](v7, "setPointOfInterestFilter:", v8);

    -[MKMapView setDelegate:](v3->_internalMapView, "setDelegate:", v3);
    -[MKMapView setShowsAttribution:](v3->_internalMapView, "setShowsAttribution:", 0);
    -[MKMapView setUserInteractionEnabled:](v3->_internalMapView, "setUserInteractionEnabled:", 0);
    -[PKTransactionMapView addSubview:](v3, "addSubview:", v3->_internalMapView);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)PKTransactionMapView;
  -[PKTransactionMapView layoutSubviews](&v11, sel_layoutSubviews);
  -[PKTransactionMapView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MKMapView setFrame:](self->_internalMapView, "setFrame:");
  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.width = v8;
  v12.size.height = v10;
  if (!CGRectEqualToRect(v12, self->_lastLaidBounds))
    -[PKTransactionMapView _centerMapAnimated:](self, "_centerMapAnimated:", 1);
}

- (void)setTransaction:(id)a3
{
  PKPaymentTransaction *v5;
  void *v6;
  PKPaymentTransaction *v7;

  v5 = (PKPaymentTransaction *)a3;
  if (self->_transaction != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_transaction, a3);
    -[MKMapView annotations](self->_internalMapView, "annotations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      -[MKMapView removeAnnotations:](self->_internalMapView, "removeAnnotations:", v6);
    -[PKTransactionMapView _updateLocations](self, "_updateLocations");

    v5 = v7;
  }

}

- (void)setMerchant:(id)a3
{
  PKMerchant *v5;
  void *v6;
  PKMerchant *v7;

  v5 = (PKMerchant *)a3;
  if (self->_merchant != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_merchant, a3);
    -[MKMapView annotations](self->_internalMapView, "annotations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      -[MKMapView removeAnnotations:](self->_internalMapView, "removeAnnotations:", v6);
    -[PKTransactionMapView _updateLocations](self, "_updateLocations");

    v5 = v7;
  }

}

- (void)setUsesDarkAppearance:(BOOL)a3
{
  if (((!self->_usesDarkAppearance ^ a3) & 1) == 0)
  {
    self->_usesDarkAppearance = a3;
    -[MKMapView _setShowsNightMode:](self->_internalMapView, "_setShowsNightMode:");
  }
}

- (void)_createAnnotationsForTransaction:(id)a3
{
  id v4;

  -[PKTransactionMapView _annotationsForTransaction:](self, "_annotationsForTransaction:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    -[MKMapView addAnnotations:](self->_internalMapView, "addAnnotations:", v4);
  -[PKTransactionMapView _centerMapAnimated:](self, "_centerMapAnimated:", 1);

}

- (void)_centerMapAnimated:(BOOL)a3
{
  _BOOL8 v3;
  CGRect *p_lastLaidBounds;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  v3 = a3;
  p_lastLaidBounds = &self->_lastLaidBounds;
  -[PKTransactionMapView bounds](self, "bounds");
  p_lastLaidBounds->origin.x = v6;
  p_lastLaidBounds->origin.y = v7;
  p_lastLaidBounds->size.width = v8;
  p_lastLaidBounds->size.height = v9;
  -[PKTransactionMapView _mapRectForTransaction:](self, "_mapRectForTransaction:", self->_transaction);
  -[MKMapView setVisibleMapRect:animated:](self->_internalMapView, "setVisibleMapRect:animated:", v3);
}

- (id)_annotationsForTransaction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  PKMerchant *v10;
  PKMerchant *merchant;
  PKMerchant *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "transactionType");
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v6 == 2)
    {
      if (self->_startStationLocation)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0CC1908]);
        -[CLLocation coordinate](self->_startStationLocation, "coordinate");
        objc_msgSend(v8, "setCoordinate:");
        objc_msgSend(v7, "addObject:", v8);

        if (!self->_endStationLocation)
          goto LABEL_20;
        goto LABEL_18;
      }
      if (self->_endStationLocation)
      {
LABEL_18:
        v9 = objc_alloc_init(MEMORY[0x1E0CC1908]);
        -[CLLocation coordinate](self->_endStationLocation, "coordinate");
        objc_msgSend(v9, "setCoordinate:");
LABEL_19:
        objc_msgSend(v7, "addObject:", v9);

        goto LABEL_20;
      }
    }
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  if (self->_preferredLocation)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CC1908]);
    -[CLLocation coordinate](self->_preferredLocation, "coordinate");
    objc_msgSend(v9, "setCoordinate:");
    if (self->_showsMerchantName)
    {
      objc_msgSend(v5, "merchant");
      v10 = (PKMerchant *)objc_claimAutoreleasedReturnValue();
      merchant = v10;
      if (!v10)
        merchant = self->_merchant;
      v12 = merchant;

      -[PKMerchant displayName](v12, "displayName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[PKMerchant useRawMerchantData](v12, "useRawMerchantData") & 1) == 0)
      {
        -[PKMerchant mapsMerchant](v12, "mapsMerchant");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (void *)v15;
        else
          v17 = v13;
        v18 = v17;

        v13 = v18;
      }
      objc_msgSend(v9, "setTitle:", v13);

    }
    goto LABEL_19;
  }
LABEL_20:
  v19 = (void *)objc_msgSend(v7, "copy");

  return v19;
}

- ($A065595DCE73A88B82602ADD7A2713F6)_mapRectForTransaction:(id)a3
{
  id v4;
  void *v5;
  CLLocation *startStationLocation;
  CLLocation *endStationLocation;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CLLocation *v20;
  uint64_t v21;
  double v22;
  CLLocationDegrees v23;
  double v24;
  CLLocationDegrees v25;
  double v26;
  MKMapPoint v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CLLocationCoordinate2D v32;
  CLLocationCoordinate2D v33;
  CLLocationCoordinate2D v34;
  $A065595DCE73A88B82602ADD7A2713F6 result;

  v4 = a3;
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "transactionType") != 2)
    goto LABEL_7;
  startStationLocation = self->_startStationLocation;
  endStationLocation = self->_endStationLocation;
  if (!startStationLocation)
  {
    if (endStationLocation)
    {
LABEL_10:
      v20 = endStationLocation;
      goto LABEL_11;
    }
LABEL_7:
    v20 = self->_preferredLocation;
    if (!v20)
    {
      v13 = *MEMORY[0x1E0CC1648];
      v15 = *(double *)(MEMORY[0x1E0CC1648] + 8);
      v17 = *(double *)(MEMORY[0x1E0CC1648] + 16);
      v19 = *(double *)(MEMORY[0x1E0CC1648] + 24);
      goto LABEL_12;
    }
LABEL_11:
    v21 = -[CLLocation coordinate](v20, "coordinate");
    v23 = v22;
    v25 = v24;
    v26 = MEMORY[0x1A1AE38F4](v21) * 300.0;
    v34.latitude = v23;
    v34.longitude = v25;
    v27 = MKMapPointForCoordinate(v34);
    v13 = v27.x - v26;
    v15 = v27.y - v26;
    v19 = v26 + v26;

    v17 = v19;
    goto LABEL_12;
  }
  if (!endStationLocation)
  {
    endStationLocation = self->_startStationLocation;
    goto LABEL_10;
  }
  -[CLLocation coordinate](startStationLocation, "coordinate");
  MKMapPointForCoordinate(v32);
  -[CLLocation coordinate](self->_endStationLocation, "coordinate");
  MKMapPointForCoordinate(v33);
  -[CLLocation coordinate](self->_startStationLocation, "coordinate");
  v9 = v8;
  v10 = -[CLLocation coordinate](self->_endStationLocation, "coordinate");
  MEMORY[0x1A1AE38F4](v10, (v9 + v11) * 0.5);
  -[PKTransactionMapView bounds](self, "bounds");
  _MKMapRectThatFits();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
LABEL_12:

  v28 = v13;
  v29 = v15;
  v30 = v17;
  v31 = v19;
  result.var1.var1 = v31;
  result.var1.var0 = v30;
  result.var0.var1 = v29;
  result.var0.var0 = v28;
  return result;
}

- (void)_updateLocations
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(void *, void *, _QWORD *);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[7];
  id v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD aBlock[4];
  id v23;
  id v24;
  id location;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[5];
  id v39;

  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__7;
  v38[4] = __Block_byref_object_dispose__7;
  -[PKPaymentTransaction preferredLocation](self->_transaction, "preferredLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v39 = v3;
  }
  else
  {
    -[PKMerchant mapsMerchant](self->_merchant, "mapsMerchant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v39 = (id)objc_claimAutoreleasedReturnValue();

  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__7;
  v36 = __Block_byref_object_dispose__7;
  -[PKPaymentTransaction startStationLocation](self->_transaction, "startStationLocation");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__7;
  v30 = __Block_byref_object_dispose__7;
  -[PKPaymentTransaction endStationLocation](self->_transaction, "endStationLocation");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPaymentTransaction transactionType](self->_transaction, "transactionType");
  v7 = objc_alloc_init(MEMORY[0x1E0D66B90]);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PKTransactionMapView__updateLocations__block_invoke;
  aBlock[3] = &unk_1E3E66768;
  v9 = v7;
  v23 = v9;
  objc_copyWeak(&v24, &location);
  v10 = (void (**)(void *, void *, _QWORD *))_Block_copy(aBlock);
  if (v6 == 2)
  {
    -[PKPaymentTransaction startStationLocation](self->_transaction, "startStationLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v21[0] = v8;
      v21[1] = 3221225472;
      v21[2] = __40__PKTransactionMapView__updateLocations__block_invoke_4;
      v21[3] = &unk_1E3E66790;
      v21[4] = &v32;
      v10[2](v10, v11, v21);
    }
    -[PKPaymentTransaction endStationLocation](self->_transaction, "endStationLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __40__PKTransactionMapView__updateLocations__block_invoke_5;
      v20[3] = &unk_1E3E66790;
      v20[4] = &v26;
      v10[2](v10, v12, v20);
    }
  }
  else
  {
    v12 = 0;
  }
  if (!v33[5] && !v27[5])
  {
    -[PKPaymentTransaction preferredLocation](self->_transaction, "preferredLocation");
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
    if (v13
      || (-[PKMerchant mapsMerchant](self->_merchant, "mapsMerchant"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "location"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v12))
    {
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __40__PKTransactionMapView__updateLocations__block_invoke_6;
      v19[3] = &unk_1E3E66790;
      v19[4] = v38;
      v10[2](v10, v12, v19);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __40__PKTransactionMapView__updateLocations__block_invoke_7;
  v17[3] = &unk_1E3E667E0;
  objc_copyWeak(&v18, &location);
  v17[4] = v38;
  v17[5] = &v32;
  v17[6] = &v26;
  v16 = (id)objc_msgSend(v9, "evaluateWithInput:completion:", v15, v17);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(v38, 8);

}

void __40__PKTransactionMapView__updateLocations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__PKTransactionMapView__updateLocations__block_invoke_2;
    v8[3] = &unk_1E3E66740;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    v9 = v5;
    v10 = v6;
    objc_msgSend(v7, "addOperation:", v8);

    objc_destroyWeak(&v11);
  }

}

void __40__PKTransactionMapView__updateLocations__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__PKTransactionMapView__updateLocations__block_invoke_3;
    v10[3] = &unk_1E3E66718;
    v9 = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v13 = v7;
    v11 = v6;
    objc_msgSend(WeakRetained, "_shiftLocationIfNeeded:completion:", v9, v10);

  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }

}

uint64_t __40__PKTransactionMapView__updateLocations__block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __40__PKTransactionMapView__updateLocations__block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __40__PKTransactionMapView__updateLocations__block_invoke_5(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __40__PKTransactionMapView__updateLocations__block_invoke_6(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __40__PKTransactionMapView__updateLocations__block_invoke_7(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  _QWORD block[4];
  void (**v10)(_QWORD);
  _QWORD aBlock[5];
  __int128 v12;
  uint64_t v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__PKTransactionMapView__updateLocations__block_invoke_8;
    aBlock[3] = &unk_1E3E667B8;
    aBlock[4] = WeakRetained;
    v12 = *(_OWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 48);
    v7 = (void (**)(_QWORD))_Block_copy(aBlock);
    v8 = v7;
    if ((a2 & 1) != 0)
    {
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = __40__PKTransactionMapView__updateLocations__block_invoke_9;
      block[3] = &unk_1E3E61590;
      v10 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      v7[2](v7);
    }

  }
}

uint64_t __40__PKTransactionMapView__updateLocations__block_invoke_8(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 464), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 472), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 480), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_createAnnotationsForTransaction:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496));
}

uint64_t __40__PKTransactionMapView__updateLocations__block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_shiftLocationIfNeeded:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6 && objc_msgSend(MEMORY[0x1E0CC1A28], "isLocationShiftRequiredForLocation:", v6))
    {
      -[PKTransactionMapView _locationShifter](self, "_locationShifter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __58__PKTransactionMapView__shiftLocationIfNeeded_completion___block_invoke;
      v9[3] = &unk_1E3E66808;
      v11 = v7;
      v10 = v6;
      objc_msgSend(v8, "shiftLocation:withCompletionHandler:", v10, v9);

    }
    else
    {
      (*((void (**)(id, id))v7 + 2))(v7, v6);
    }
  }

}

void __58__PKTransactionMapView__shiftLocationIfNeeded_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(void);
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  if (v3)
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKTransactionMapView: Failed to successfully shift location requiring shift. Falling back to original location.", v6, 2u);
    }

    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v4();

}

- (id)_locationShifter
{
  _MKLocationShifter *locationShifter;
  _MKLocationShifter *v4;
  _MKLocationShifter *v5;

  locationShifter = self->_locationShifter;
  if (!locationShifter)
  {
    v4 = (_MKLocationShifter *)objc_alloc_init(MEMORY[0x1E0CC1A28]);
    v5 = self->_locationShifter;
    self->_locationShifter = v4;

    locationShifter = self->_locationShifter;
  }
  return locationShifter;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  PKMerchant *v8;
  PKMerchant *merchant;
  PKMerchant *v10;
  void *v11;
  void *v12;
  double v13;

  v5 = (objc_class *)MEMORY[0x1E0CC1878];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithAnnotation:reuseIdentifier:", v6, 0);

  objc_msgSend(v7, "sizeToFit");
  -[PKPaymentTransaction merchant](self->_transaction, "merchant");
  v8 = (PKMerchant *)objc_claimAutoreleasedReturnValue();
  merchant = v8;
  if (!v8)
    merchant = self->_merchant;
  v10 = merchant;

  PKMapsStylingInfoForMerchant(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 && -[PKPaymentTransaction transactionType](self->_transaction, "transactionType") == 2)
  {
    PKGEOFeaturesStyleAttributesFromTransitType(-[PKPaymentTransaction transitType](self->_transaction, "transitType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setStyleAttributes:", v12);
LABEL_8:

    goto LABEL_9;
  }
  if (v11)
  {
    objc_msgSend(v7, "_setWalletMerchantStylingInfo:", v11);
    v13 = PKUIScreenScale();
    -[PKMerchant category](v10, "category");
    PKColorForMerchantCategory(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMarkerTintColor:", v12);
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

- (BOOL)showsMerchantName
{
  return self->_showsMerchantName;
}

- (void)setShowsMerchantName:(BOOL)a3
{
  self->_showsMerchantName = a3;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (BOOL)usesDarkAppearance
{
  return self->_usesDarkAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_endStationLocation, 0);
  objc_storeStrong((id *)&self->_startStationLocation, 0);
  objc_storeStrong((id *)&self->_preferredLocation, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_internalMapView, 0);
}

@end
