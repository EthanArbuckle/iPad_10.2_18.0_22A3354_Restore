@implementation SearchUIMapCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  void *v3;
  void *v4;
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

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setSpacing:", 0.0);
  objc_msgSend(v3, "setAxis:", 1);
  v4 = (void *)objc_opt_new();
  -[SearchUIMapCardSectionView setSnapshotView:](self, "setSnapshotView:", v4);

  -[SearchUIMapCardSectionView snapshotView](self, "snapshotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholderVisibility:", 1);

  -[SearchUIMapCardSectionView snapshotView](self, "snapshotView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addArrangedSubview:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__mapButtonPressed);
  -[SearchUIMapCardSectionView setTapRecognizer:](self, "setTapRecognizer:", v7);

  -[SearchUIMapCardSectionView snapshotView](self, "snapshotView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIMapCardSectionView tapRecognizer](self, "tapRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addGestureRecognizer:", v9);

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setSpacing:", 10.0);
  objc_msgSend(v10, "setAlignment:", 2);
  objc_msgSend(v10, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v10, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  -[SearchUIMapCardSectionView setLabelsStackView:](self, "setLabelsStackView:", v10);
  objc_msgSend(v3, "addArrangedSubview:", v10);
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DBD940], "footnoteFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v12);

  +[SearchUIAutoLayout requireIntrinsicSizeForView:](SearchUIAutoLayout, "requireIntrinsicSizeForView:", v11);
  -[SearchUIMapCardSectionView setFootnoteDescriptorLabel:](self, "setFootnoteDescriptorLabel:", v11);
  objc_msgSend(v10, "addArrangedSubview:", v11);
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DBD940], "subheadFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v14);

  -[SearchUIMapCardSectionView setFootnoteLabel:](self, "setFootnoteLabel:", v13);
  objc_msgSend(v10, "addArrangedSubview:", v13);
  -[SearchUIMapCardSectionView setClipsToBounds:](self, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__updateSnapshot, *MEMORY[0x1E0DC59B0], 0);

  return v3;
}

- (void)_updateSnapshot
{
  double v3;
  double v4;
  id v5;

  -[SearchUIMapCardSectionView snapshotView](self, "snapshotView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  -[SearchUIMapCardSectionView _updateSnapshotWithSize:](self, "_updateSnapshotWithSize:", v3, v4);

}

- (void)_updateSnapshotWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  double y;
  double v35;
  double v36;
  double x;
  uint64_t j;
  MKMapPoint v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CLLocationCoordinate2D v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id obj;
  void *v69;
  void *v70;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  id from;
  id location;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;
  CLLocationCoordinate2D v89;
  MKMapRect v90;
  MKMapRect v91;

  height = a3.height;
  width = a3.width;
  v88 = *MEMORY[0x1E0C80C00];
  -[SearchUIMapCardSectionView mapSnapshotter](self, "mapSnapshotter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  v6 = (void *)objc_opt_new();
  -[SearchUIMapCardSectionView snapshotView](self, "snapshotView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTlkImage:", v6);

  -[SearchUICardSectionView section](self, "section");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    -[SearchUIMapCardSectionView requestedMapHeight](self, "requestedMapHeight");
    if (height == v8)
    {
      objc_msgSend(v67, "boundingMapRegion");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (void *)objc_opt_new();
      objc_msgSend(v65, "setSize:", width, height);
      v69 = (void *)objc_opt_new();
      v70 = (void *)objc_opt_new();
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      objc_msgSend(v67, "pins");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v83;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v83 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
            v13 = objc_alloc_init(MEMORY[0x1E0CC1908]);
            objc_msgSend(v12, "label");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setTitle:", v14);

            objc_msgSend(v12, "location");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SearchUIMapCardSectionView _clLocationFromSFLatLng:](self, "_clLocationFromSFLatLng:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "coordinate");
            objc_msgSend(v13, "setCoordinate:");

            objc_msgSend(v69, "addObject:", v13);
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1878]), "initWithAnnotation:reuseIdentifier:", v13, 0);
            objc_msgSend(v12, "pinText");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setGlyphText:", v18);

            objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setMarkerTintColor:", v19);

            objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setGlyphTintColor:", v20);

            objc_msgSend(v70, "addObject:", v17);
          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
        }
        while (v9);
      }

      objc_msgSend(v70, "reverseObjectEnumerator");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "allObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setAnnotationViews:", v22);

      if (v66 && (objc_msgSend(v66, "altitudeInMeters"), v23 == 0.0))
      {
        objc_msgSend(v66, "northLat");
        v41 = v40;
        objc_msgSend(v66, "southLat");
        v43 = v42;
        objc_msgSend(v66, "eastLng");
        v45 = v44;
        objc_msgSend(v66, "westLng");
        v47 = v45 - v46;
        if (v45 - v46 >= 0.0)
          v48 = 0.0;
        else
          v48 = 360.0;
        objc_msgSend(v66, "northLat");
        v50 = v49;
        objc_msgSend(v66, "eastLng");
        v51 = v41 - v43;
        v53 = v52 + (v47 + v48) * -0.5;
        v54 = 0.0;
        if (v53 <= -180.0)
          v54 = 360.0;
        v55 = CLLocationCoordinate2DMake(v50 + v51 * -0.5, v53 + v54);
        objc_msgSend(v65, "setRegion:", v55.latitude, v55.longitude, v51, v47 + v48);
      }
      else
      {
        objc_msgSend(v67, "location");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v67, "location");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUIMapCardSectionView _clLocationFromSFLatLng:](self, "_clLocationFromSFLatLng:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "coordinate");
          v28 = v27;
          v30 = v29;

          MEMORY[0x1DF0A8218](v28, v30, 500.0, 500.0);
          objc_msgSend(v65, "setRegion:");
        }
        else
        {
          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          v31 = v69;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
          if (v32)
          {
            v33 = *(_QWORD *)v79;
            y = INFINITY;
            v35 = -INFINITY;
            v36 = -INFINITY;
            x = INFINITY;
            do
            {
              for (j = 0; j != v32; ++j)
              {
                if (*(_QWORD *)v79 != v33)
                  objc_enumerationMutation(v31);
                objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * j), "coordinate");
                v39 = MKMapPointForCoordinate(v89);
                if (v39.x < x)
                  x = v39.x;
                if (v39.y < y)
                  y = v39.y;
                if (v39.x >= v36)
                  v36 = v39.x;
                if (v39.y >= v35)
                  v35 = v39.y;
              }
              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
            }
            while (v32);
          }
          else
          {
            y = INFINITY;
            v35 = -INFINITY;
            v36 = -INFINITY;
            x = INFINITY;
          }

          objc_msgSend(v67, "pins");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "firstObject");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "pinText");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (v58)
            v59 = 0.5;
          else
            v59 = 0.2;

          v90.size.width = v36 - x;
          v90.size.height = v35 - y;
          v90.origin.x = x;
          v90.origin.y = y;
          v91 = MKMapRectInset(v90, -(v59 * (v36 - x)), -(v59 * (v35 - y)));
          objc_msgSend(v65, "setMapRect:", v91.origin.x, v91.origin.y, v91.size.width, v91.size.height);
        }
      }
      objc_msgSend(v66, "altitudeInMeters");
      if (v60 != 0.0)
      {
        objc_msgSend(v66, "altitudeInMeters");
        v62 = v61;
        objc_msgSend(v65, "camera");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setAltitude:", v62);

      }
      v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1868]), "initWithOptions:", v65);
      -[SearchUIMapCardSectionView setMapSnapshotter:](self, "setMapSnapshotter:", v64);
      objc_initWeak(&location, self);
      objc_initWeak(&from, v64);
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __54__SearchUIMapCardSectionView__updateSnapshotWithSize___block_invoke;
      v72[3] = &unk_1EA1F6CA0;
      objc_copyWeak(&v74, &location);
      objc_copyWeak(&v75, &from);
      v73 = v67;
      objc_msgSend(v64, "startWithCompletionHandler:", v72);

      objc_destroyWeak(&v75);
      objc_destroyWeak(&v74);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

    }
  }

}

void __54__SearchUIMapCardSectionView__updateSnapshotWithSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "mapSnapshotter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)(a1 + 48));

    if (!a3 && v7 == v8)
    {
      objc_msgSend(v6, "section");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 32);

      if (v9 == v10)
      {
        v11 = objc_alloc(MEMORY[0x1E0DBD970]);
        objc_msgSend(v15, "image");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithImage:", v12);

        objc_msgSend(v6, "snapshotView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTlkImage:", v13);

      }
    }
  }

}

- (void)updateWithRowModel:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SearchUIMapCardSectionView;
  -[SearchUICardSectionView updateWithRowModel:](&v26, sel_updateWithRowModel_, a3);
  -[SearchUICardSectionView section](self, "section");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardSectionView section](self, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "interactive");

  v7 = v6 ^ 1u;
  -[SearchUIMapCardSectionView tapRecognizer](self, "tapRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v7);

  -[SearchUIMapCardSectionView snapshotView](self, "snapshotView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CFAA78];
  -[SearchUIMapCardSectionView requestedMapHeight](self, "requestedMapHeight");
  LODWORD(v11) = 1148846080;
  objc_msgSend(v9, "setLayoutSize:withContentPriority:", v10, v12, v11);

  -[SearchUIMapCardSectionView _updateSnapshot](self, "_updateSnapshot");
  objc_msgSend(v4, "footnoteLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v4, "footnoteLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "isEqualToString:", &stru_1EA1FB118);
  }
  else
  {
    v14 = 1;
  }
  -[SearchUIMapCardSectionView footnoteDescriptorLabel](self, "footnoteDescriptorLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidden:", v14);

  if (v13)
  objc_msgSend(v4, "footnoteLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIMapCardSectionView footnoteDescriptorLabel](self, "footnoteDescriptorLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v16);

  objc_msgSend(v4, "footnote");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v4, "footnote");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", &stru_1EA1FB118);
  }
  else
  {
    v19 = 1;
  }
  -[SearchUIMapCardSectionView footnoteLabel](self, "footnoteLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setHidden:", v19);

  if (v18)
  objc_msgSend(v4, "footnote");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIMapCardSectionView footnoteLabel](self, "footnoteLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v21);

  objc_msgSend(v4, "footnoteLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = 0;
  }
  else
  {
    objc_msgSend(v4, "footnote");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v22 == 0;
  }
  -[SearchUIMapCardSectionView labelsStackView](self, "labelsStackView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidden:", v24);

  if (!v23)
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SearchUIMapCardSectionView mapSnapshotter](self, "mapSnapshotter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)SearchUIMapCardSectionView;
  -[NUIContainerStackView dealloc](&v4, sel_dealloc);
}

- (double)requestedMapHeight
{
  void *v2;
  double v3;

  -[SearchUICardSectionView section](self, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = dbl_1DAE1D5D0[objc_msgSend(v2, "sizeFormat") == 1];

  return v3;
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  -[SearchUIMapCardSectionView snapshotView](self, "snapshotView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v10)
  {
    -[SearchUIMapCardSectionView snapshotView](self, "snapshotView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;
    v16 = v15;

    if (width != v14 || height != v16)
      -[SearchUIMapCardSectionView _updateSnapshotWithSize:](self, "_updateSnapshotWithSize:", width, height);
  }
  else
  {

  }
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)_mapButtonPressed
{
  -[SearchUIMapCardSectionView sendMapFeedbackWithTriggerEvent:placemarkData:](self, "sendMapFeedbackWithTriggerEvent:placemarkData:", 2, 0);
}

- (void)sendMapFeedbackWithTriggerEvent:(unint64_t)a3 placemarkData:(id)a4
{
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_alloc(MEMORY[0x1E0D8C4D8]);
    -[SearchUICardSectionView section](self, "section");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithCardSection:destination:triggerEvent:actionCardType:", v9, 0, a3, 1);

    objc_msgSend(v10, "setModifiedPlacemarkData:", v12);
    -[SearchUICardSectionView feedbackDelegate](self, "feedbackDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didEngageCardSection:", v10);

  }
}

- (id)_clLocationFromSFLatLng:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = (objc_class *)MEMORY[0x1E0C9E3B8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "lat");
  v7 = v6;
  objc_msgSend(v4, "lng");
  v9 = v8;

  return (id)objc_msgSend(v5, "initWithLatitude:longitude:", v7, v9);
}

+ (id)_postalAddressFromPlacemark:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x1E0C97378];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "thoroughfare");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStreet:", v6);

  objc_msgSend(v4, "locality");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCity:", v7);

  objc_msgSend(v4, "administrativeArea");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", v8);

  objc_msgSend(v4, "country");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCountry:", v9);

  objc_msgSend(v4, "postalCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPostalCode:", v10);
  v11 = (void *)objc_msgSend(v5, "copy");

  return v11;
}

- (TLKLabel)footnoteDescriptorLabel
{
  return self->_footnoteDescriptorLabel;
}

- (void)setFootnoteDescriptorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteDescriptorLabel, a3);
}

- (TLKLabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
  objc_storeStrong((id *)&self->_footnoteLabel, a3);
}

- (MKPinAnnotationView)pinAnnotationView
{
  return self->_pinAnnotationView;
}

- (void)setPinAnnotationView:(id)a3
{
  objc_storeStrong((id *)&self->_pinAnnotationView, a3);
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapRecognizer, a3);
}

- (CLPlacemark)currentPlacemark
{
  return self->_currentPlacemark;
}

- (void)setCurrentPlacemark:(id)a3
{
  objc_storeStrong((id *)&self->_currentPlacemark, a3);
}

- (TLKStackView)labelsStackView
{
  return self->_labelsStackView;
}

- (void)setLabelsStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelsStackView, a3);
}

- (TLKImageView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotView, a3);
}

- (MKMapSnapshotter)mapSnapshotter
{
  return self->_mapSnapshotter;
}

- (void)setMapSnapshotter:(id)a3
{
  objc_storeStrong((id *)&self->_mapSnapshotter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapSnapshotter, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_currentPlacemark, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_pinAnnotationView, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_footnoteDescriptorLabel, 0);
}

@end
