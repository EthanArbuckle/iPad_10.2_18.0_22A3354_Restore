@implementation MKMapView

- ($C79183323B9A0D5602617FF3BE5395AC)mapRectThatFits:(id)a3 minMetersPerPoint:(double)a4
{
  double var1;
  double var0;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  CLLocationCoordinate2D v12;
  CLLocationCoordinate2D v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  MKMapPoint v25;
  MKMapRect v26;
  MKMapRect v27;
  $C79183323B9A0D5602617FF3BE5395AC result;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  y = a3.var0.var1;
  x = a3.var0.var0;
  v10 = a3.var0.var0 + a3.var1.var0;
  v11 = a3.var0.var1 + a3.var1.var1;
  v9 = v11;
  v12 = MKCoordinateForMapPoint((MKMapPoint)a3.var0);
  v25.x = v10;
  v25.y = v9;
  v13 = MKCoordinateForMapPoint(v25);
  v15 = GEOCalculateDistance(v14, v12.latitude, v12.longitude, v13.latitude, v13.longitude);
  -[MKMapView bounds](self, "bounds");
  if (v15 / v16 < a4)
  {
    v17 = a4 / (v15 / v16);
    v18 = -(var0 * v17) * 0.5;
    v19 = -(var1 * v17) * 0.5;
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = var0;
    v26.size.height = var1;
    v27 = MKMapRectInset(v26, v18, v19);
    x = v27.origin.x;
    y = v27.origin.y;
    var0 = v27.size.width;
    var1 = v27.size.height;
  }
  v20 = x;
  v21 = y;
  v22 = var0;
  v23 = var1;
  result.var1.var1 = v23;
  result.var1.var0 = v22;
  result.var0.var1 = v21;
  result.var0.var0 = v20;
  return result;
}

- (UIEdgeInsets)defaultInsetsForPinAnnotations
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == (id)3)
    v4 = 10.0;
  else
    v4 = 40.0;
  if (v3 == (id)3)
    v5 = 0.0;
  else
    v5 = MKPopoverSmallCalloutHeight;
  +[MKPinAnnotationView _perceivedSize](MKPinAnnotationView, "_perceivedSize", MKPopoverSmallCalloutHeight);
  v7 = v6;
  v8 = v5 + v6;
  v9 = v4;
  v10 = v4;
  result.right = v10;
  result.bottom = v7;
  result.left = v9;
  result.top = v8;
  return result;
}

- (UIEdgeInsets)defaultInsetsForBalloonCallout
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 82.0;
  v3 = 45.0;
  v4 = 40.0;
  v5 = 40.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)splitViewInsetsForPinAnnotations
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  +[MKPinAnnotationView _perceivedSize](MKPinAnnotationView, "_perceivedSize");
  v3 = v2;
  v5 = v4;
  v6 = 0.0;
  v7 = v3;
  result.right = v3;
  result.bottom = v6;
  result.left = v7;
  result.top = v5;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)mapRectContainingSearchResults:(id)a3
{
  id v4;
  double v5;
  double v6;
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
  $C79183323B9A0D5602617FF3BE5395AC result;

  v4 = a3;
  -[MKMapView defaultInsetsForPinAnnotations](self, "defaultInsetsForPinAnnotations");
  -[MKMapView mapRectContainingSearchResults:edgePadding:](self, "mapRectContainingSearchResults:edgePadding:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.var1.var1 = v16;
  result.var1.var0 = v15;
  result.var0.var1 = v14;
  result.var0.var0 = v13;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)mapRectContainingSearchResults:(id)a3 edgePadding:(UIEdgeInsets)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  $C79183323B9A0D5602617FF3BE5395AC result;

  -[MKMapView mapRectThatFits:edgePadding:](self, "mapRectThatFits:edgePadding:", sub_1003C55D4(a3));
  -[MKMapView mapRectThatFits:minMetersPerPoint:](self, "mapRectThatFits:minMetersPerPoint:");
  result.var1.var1 = v8;
  result.var1.var0 = v7;
  result.var0.var1 = v6;
  result.var0.var0 = v5;
  return result;
}

- (BOOL)isCoordinateVisible:(CLLocationCoordinate2D)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGPoint v23;
  CGRect v24;

  -[MKMapView convertCoordinate:toPointToView:](self, "convertCoordinate:toPointToView:", self, a3.latitude, a3.longitude);
  v5 = v4;
  v7 = v6;
  -[MKMapView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[MKMapView _edgeInsets](self, "_edgeInsets");
  v17 = v11 + v16;
  v20 = v13 - (v18 + v19);
  v24.size.height = v15 - (v16 + v21);
  v24.origin.x = v9 + v18;
  v24.origin.y = v17;
  v24.size.width = v20;
  v23.x = v5;
  v23.y = v7;
  return CGRectContainsPoint(v24, v23);
}

- (void)goToSearchResults:(id)a3 mapRegion:(id)a4 requireMapMovement:(BOOL)a5 animation:(int64_t)a6 minZoom:(id)a7 maxZoom:(id)a8 disableAdditionalViewportPadding:(BOOL)a9 completion:(id)a10
{
  uint64_t v10;

  LOBYTE(v10) = a9;
  -[MKMapView goToSearchResults:mapRegion:requireMapMovement:setCameraFromMapItemViewportFrame:animation:minZoom:maxZoom:disableAdditionalViewportPadding:completion:](self, "goToSearchResults:mapRegion:requireMapMovement:setCameraFromMapItemViewportFrame:animation:minZoom:maxZoom:disableAdditionalViewportPadding:completion:", a3, a4, a5, 1, a6, a7, a8, v10, a10);
}

- (void)goToSearchResults:(id)a3 mapRegion:(id)a4 requireMapMovement:(BOOL)a5 setCameraFromMapItemViewportFrame:(BOOL)a6 animation:(int64_t)a7 minZoom:(id)a8 maxZoom:(id)a9 disableAdditionalViewportPadding:(BOOL)a10 completion:(id)a11
{
  _BOOL4 v12;
  _BOOL4 v13;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  double v27;
  CLLocationDegrees v28;
  CLLocationDegrees v29;
  MKMapPoint v30;
  float v31;
  double v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  float v46;
  float v47;
  _BOOL8 v48;
  id v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void *i;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  id v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  id v82;
  uint64_t v83;
  double v84;
  double v85;
  double v86;
  double v87;
  id v88;
  double v89;
  double v90;
  _QWORD *v91;
  int64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  _BOOL4 v96;
  id v97;
  id v98;
  double v99;
  _QWORD v101[4];
  id v102;
  double v103;
  double v104;
  double v105;
  double v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[4];
  id v112;
  double v113;
  double v114;
  double v115;
  double v116;
  _BYTE v117[128];
  CLLocationCoordinate2D v118;

  v12 = a6;
  v13 = a5;
  v16 = a3;
  v17 = a4;
  v18 = a8;
  v19 = a9;
  v20 = a11;
  if (objc_msgSend(v16, "count"))
  {
    if (objc_msgSend(v16, "count") == (id)1)
    {
      v97 = v17;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mapItem"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_viewportFrame"));

      if (v24 && v12)
      {
        v25 = v19;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_viewportFrame"));
        objc_msgSend(v26, "latitude");
        v28 = v27;
        objc_msgSend(v26, "longitude");
        v118 = CLLocationCoordinate2DMake(v28, v29);
        v30 = MKMapPointForCoordinate(v118);
        objc_msgSend(v26, "distance");
        v32 = v31;
        v33 = -[MKMapView frame](self, "frame");
        v36 = MKMapRectMakeWithZoomLevel(v33, v30.x, v30.y, v32, v34, v35);
        v38 = v37;
        v40 = v39;
        v42 = v41;
        -[MKMapView frame](self, "frame");
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", v36, v38, v40, v42, v43, v44));
        objc_msgSend(v26, "pitch");
        objc_msgSend(v45, "setPitch:", v46);
        objc_msgSend(v26, "heading");
        objc_msgSend(v45, "setHeading:", v47);
        v111[0] = _NSConcreteStackBlock;
        v111[1] = 3221225472;
        v111[2] = sub_1003C610C;
        v111[3] = &unk_1011B43E8;
        v112 = v20;
        v113 = v36;
        v114 = v38;
        v115 = v40;
        v116 = v42;
        -[MKMapView setCamera:animated:completionHandler:](self, "setCamera:animated:completionHandler:", v45, 0, v111);

        v19 = v25;
        v17 = v97;
        goto LABEL_52;
      }

      v17 = v97;
    }
    v48 = a10;
    v96 = v13;
    if (v13)
    {
      v49 = 0;
      v50 = 0;
    }
    else
    {
      v94 = v19;
      v95 = v18;
      v98 = v17;
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v51 = v16;
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v107, v117, 16);
      if (v52)
      {
        v53 = v52;
        v49 = 0;
        v50 = 0;
        v54 = *(_QWORD *)v108;
        do
        {
          for (i = 0; i != v53; i = (char *)i + 1)
          {
            if (*(_QWORD *)v108 != v54)
              objc_enumerationMutation(v51);
            v56 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v56, "coordinate");
            if (-[MKMapView isCoordinateVisible:](self, "isCoordinateVisible:"))
            {
              if (!v49)
                v49 = v56;
              ++v50;
            }
          }
          v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v107, v117, 16);
        }
        while (v53);
      }
      else
      {
        v49 = 0;
        v50 = 0;
      }

      v17 = v98;
      v19 = v94;
      v18 = v95;
      v48 = a10;
    }
    -[MKMapView regionForSearchResults:suggestedRegion:minZoom:maxZoom:disableAdditionalViewportPadding:](self, "regionForSearchResults:suggestedRegion:minZoom:maxZoom:disableAdditionalViewportPadding:", v16, v18, v19, v48, GEOMapRectForMapRegion(v17, v21));
    v58 = v57;
    v60 = v59;
    v62 = v61;
    v64 = v63;
    v65 = -[MKMapView bounds](self, "bounds");
    v99 = v62;
    v68 = v58 + v62;
    v69 = v64;
    v71 = v70 / (v68 - v58);
    if (v71 >= v67 / (v60 + v64 - v60))
      v72 = v67 / (v60 + v64 - v60);
    else
      v72 = v71;
    v73 = fabs(v72);
    if (v73 >= INFINITY && v73 <= INFINITY)
      v72 = MKZoomScaleForZoomLevelF(v65, v66, 12.0);
    -[MKMapView visibleMapRect](self, "visibleMapRect");
    v75 = v74;
    v77 = v76;
    v79 = v78;
    v81 = v80;
    v82 = -[MKMapView bounds](self, "bounds");
    if (v84 / (v75 + v79 - v75) >= v85 / (v77 + v81 - v77))
      v86 = v85 / (v77 + v81 - v77);
    else
      v86 = v84 / (v75 + v79 - v75);
    v87 = fabs(v86);
    if (v87 >= INFINITY && v87 <= INFINITY)
      v86 = MKZoomScaleForZoomLevelF(v82, v83, 12.0);
    v88 = v18;
    v89 = v69;
    if (v20)
    {
      v101[0] = _NSConcreteStackBlock;
      v101[1] = 3221225472;
      v101[2] = sub_1003C6130;
      v101[3] = &unk_1011B43E8;
      v102 = v20;
      v103 = v58;
      v104 = v60;
      v90 = v99;
      v105 = v99;
      v106 = v89;
      v91 = objc_retainBlock(v101);

    }
    else
    {
      v91 = 0;
      v90 = v99;
    }
    if (v96 || !v50)
    {
      v92 = a7;
      if (!a7)
      {
        v93 = v96;
        goto LABEL_50;
      }
    }
    else
    {
      if (v72 / v86 <= 4.0)
      {
        if (v20)
          (*((void (**)(id, uint64_t, id, double, double, double, double))v20 + 2))(v20, 1, v49, v58, v60, v90, v89);
        goto LABEL_51;
      }
      v92 = a7;
      if (!a7)
      {
        v93 = v72 / v86 < 18.0;
LABEL_50:
        -[MKMapView _setVisibleMapRect:animated:completionHandler:](self, "_setVisibleMapRect:animated:completionHandler:", v93, v91, v58, v60, v90, v89);
LABEL_51:

        v18 = v88;
        goto LABEL_52;
      }
    }
    v93 = v92 != 2;
    goto LABEL_50;
  }
  if (v20)
    (*((void (**)(id, uint64_t, _QWORD, double, double, double, double))v20 + 2))(v20, 1, 0, MKMapRectNull.origin.x, MKMapRectNull.origin.y, MKMapRectNull.size.width, MKMapRectNull.size.height);
LABEL_52:

}

- (BOOL)rectIsEmpty:(id)a3
{
  BOOL v3;

  v3 = fabs(a3.var1.var0) < 0.000001;
  return fabs(a3.var1.var1) < 0.000001 || v3;
}

- ($C79183323B9A0D5602617FF3BE5395AC)regionForSearchResults:(id)a3 suggestedRegion:(id)a4 minZoom:(id)a5 maxZoom:(id)a6 disableAdditionalViewportPadding:(BOOL)a7
{
  _BOOL4 v7;
  double var1;
  double var0;
  double v12;
  double v13;
  id v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  char v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unsigned int v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  void *v39;
  char v40;
  double v41;
  double top;
  double v43;
  double left;
  double v45;
  double bottom;
  double v47;
  double right;
  unsigned int v49;
  id v50;
  unint64_t v51;
  unint64_t v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  float v58;
  float v59;
  float v60;
  float v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  BOOL v79;
  double v80;
  double v81;
  MKMapPoint v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double y;
  id v92;
  double x;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  CLLocationCoordinate2D v99;
  CLLocationCoordinate2D v100;
  CLLocationCoordinate2D v101;
  MKMapPoint v102;
  MKMapPoint v103;
  MKMapPoint v104;
  MKMapRect v105;
  MKMapRect v106;
  MKMapRect v107;
  $C79183323B9A0D5602617FF3BE5395AC result;

  v7 = a7;
  var1 = a4.var1.var1;
  var0 = a4.var1.var0;
  v12 = a4.var0.var1;
  v13 = a4.var0.var0;
  v15 = a3;
  v16 = (unint64_t)a5;
  v17 = (unint64_t)a6;
  if (-[MKMapView rectIsEmpty:](self, "rectIsEmpty:", v13, v12, var0, var1))
  {
    if (objc_msgSend(v15, "count") != (id)1)
    {
      v18 = 0;
LABEL_21:
      -[MKMapView mapRectContainingSearchResults:](self, "mapRectContainingSearchResults:", v15);
      v13 = v30;
      v12 = v31;
      var0 = v32;
      var1 = v33;
      v29 = -[MKMapView rectIsEmpty:](self, "rectIsEmpty:");
      goto LABEL_22;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
LABEL_16:
    if (v18)
    {
      -[MKMapView displayMapRegionForSearchResult:](self, "displayMapRegionForSearchResult:", v18);
      v13 = v25;
      v12 = v26;
      var0 = v27;
      var1 = v28;
      if (!-[MKMapView rectIsEmpty:](self, "rectIsEmpty:"))
      {
        v29 = 0;
        goto LABEL_23;
      }
    }
    goto LABEL_21;
  }
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v19 = v15;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v94, v98, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v95;
    while (2)
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v95 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)i), "coordinate");
        v102 = MKMapPointForCoordinate(v99);
        v105.origin.x = v13;
        v105.origin.y = v12;
        v105.size.width = var0;
        v105.size.height = var1;
        if (MKMapRectContainsPoint(v105, v102))
        {
          v24 = 0;
          goto LABEL_14;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v94, v98, 16);
      if (v21)
        continue;
      break;
    }
  }
  v24 = 1;
LABEL_14:

  if (objc_msgSend(v19, "count") != (id)1)
  {
    v18 = 0;
    if ((v24 & 1) == 0)
      goto LABEL_28;
    goto LABEL_21;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
  if ((v24 & 1) != 0)
    goto LABEL_16;
  v29 = 0;
LABEL_22:
  if (v18)
  {
LABEL_23:
    objc_msgSend(v18, "coordinate");
    v103 = MKMapPointForCoordinate(v100);
    v106.origin.x = v13;
    v106.origin.y = v12;
    v106.size.width = var0;
    v106.size.height = var1;
    if (!MKMapRectContainsPoint(v106, v103))
    {
      -[MKMapView displayMapRegionForSearchResult:](self, "displayMapRegionForSearchResult:", v18);
      v13 = v34;
      v12 = v35;
      var0 = v36;
      var1 = v37;
      v29 = -[MKMapView rectIsEmpty:](self, "rectIsEmpty:");
    }
    v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mapItem"));
    if (objc_msgSend(v38, "_hasVenueFeatureType"))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mapItem"));
      if (objc_msgSend(v39, "_venueFeatureType") == (id)1)
      {

      }
      else
      {
        v49 = v29;
        v50 = v15;
        v51 = v16;
        v52 = v17;
        v53 = v7;
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mapItem"));
        v92 = objc_msgSend(v54, "_venueFeatureType");

        v7 = v53;
        v17 = v52;
        v16 = v51;
        v15 = v50;
        v29 = v49;

        if (v92 != (id)2)
          goto LABEL_36;
      }
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mapItem"));
      v56 = objc_msgSend(v55, "_hasDisplayMaxZoom");

      if (!v56)
      {
LABEL_36:
        if (v29)
        {
          objc_msgSend(v18, "coordinate");
          v13 = MKMapRectMakeWithRadialDistance(v62, v63, 500.0);
          v12 = v64;
          var0 = v65;
          var1 = v66;
        }
        v40 = 0;
        if (v7)
          goto LABEL_39;
LABEL_29:
        -[MKMapView splitViewInsetsForPinAnnotations](self, "splitViewInsetsForPinAnnotations");
        top = v41;
        left = v43;
        bottom = v45;
        right = v47;
        goto LABEL_40;
      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mapItem"));
      objc_msgSend(v57, "_displayMaxZoom");
      -[MKMapView _mapKitZoomLevelForVectorKitTileZoomLevel:](self, "_mapKitZoomLevelForVectorKitTileZoomLevel:", v58);
      v38 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

      if (!v16 || (objc_msgSend(v38, "floatValue"), v60 = v59, objc_msgSend((id)v16, "floatValue"), v60 > v61))
      {
        v38 = v38;

        v16 = (unint64_t)v38;
      }
    }

    goto LABEL_36;
  }
LABEL_28:
  v40 = 1;
  if (!v7)
    goto LABEL_29;
LABEL_39:
  top = UIEdgeInsetsZero.top;
  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
LABEL_40:
  -[MKMapView mapRectThatFits:edgePadding:](self, "mapRectThatFits:edgePadding:", v13, v12, var0, var1, top, left, bottom, right);
  -[MKMapView mapRectThatFits:minMetersPerPoint:](self, "mapRectThatFits:minMetersPerPoint:");
  v68 = v67;
  v70 = v69;
  v72 = v71;
  v74 = v73;
  if (v17 | v16)
  {
    if ((v40 & 1) != 0)
    {
      v75 = sub_1003C55D4(v15);
      v104.x = v75 + v76 * 0.5;
      v104.y = v78 + v77 * 0.5;
      y = v104.y;
      x = v104.x;
      v107.origin.x = v68;
      v107.origin.y = v70;
      v107.size.width = v72;
      v107.size.height = v74;
      v79 = MKMapRectContainsPoint(v107, v104);
      v81 = y;
      v80 = x;
      if (!v79)
      {
        v80 = var0 * 0.5 + v13;
        v81 = var1 * 0.5 + v12;
      }
    }
    else
    {
      objc_msgSend(v18, "coordinate");
      v82 = MKMapPointForCoordinate(v101);
      v80 = v82.x;
      v81 = v82.y;
    }
    -[MKMapView clampRect:toMinZoom:maxZoom:withFixedPoint:](self, "clampRect:toMinZoom:maxZoom:withFixedPoint:", v16, v17, v68, v70, v72, v74, v80, v81, *(_QWORD *)&y);
    v68 = v83;
    v70 = v84;
    v72 = v85;
    v74 = v86;
  }

  v87 = v68;
  v88 = v70;
  v89 = v72;
  v90 = v74;
  result.var1.var1 = v90;
  result.var1.var0 = v89;
  result.var0.var1 = v88;
  result.var0.var0 = v87;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)displayMapRegionForSearchResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double x;
  double v8;
  double y;
  double v10;
  double width;
  double v12;
  double height;
  double v14;
  double v15;
  double v16;
  double v17;
  $C79183323B9A0D5602617FF3BE5395AC result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_geoMapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayMapRegionOrNil"));

  if (v5)
  {
    x = GEOMapRectForMapRegion(v5, v6);
    y = v8;
    width = v10;
    height = v12;
  }
  else
  {
    x = MKMapRectNull.origin.x;
    y = MKMapRectNull.origin.y;
    width = MKMapRectNull.size.width;
    height = MKMapRectNull.size.height;
  }

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.var1.var1 = v17;
  result.var1.var0 = v16;
  result.var0.var1 = v15;
  result.var0.var0 = v14;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)clampRect:(id)a3 toMinZoom:(id)a4 maxZoom:(id)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  $C79183323B9A0D5602617FF3BE5395AC result;

  -[MKMapView clampRect:toMinZoom:maxZoom:withFixedPoint:](self, "clampRect:toMinZoom:maxZoom:withFixedPoint:", a4, a5, a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1, a3.var0.var0 + a3.var1.var0 * 0.5, a3.var0.var1 + a3.var1.var1 * 0.5);
  result.var1.var1 = v8;
  result.var1.var0 = v7;
  result.var0.var1 = v6;
  result.var0.var0 = v5;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)clampRect:(id)a3 toMinZoom:(id)a4 maxZoom:(id)a5 withFixedPoint:(id)a6
{
  double var1;
  double var0;
  double v9;
  double v10;
  double v11;
  double v12;
  id v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  long double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  $C79183323B9A0D5602617FF3BE5395AC result;

  var1 = a6.var1;
  var0 = a6.var0;
  v9 = a3.var1.var1;
  v10 = a3.var1.var0;
  v11 = a3.var0.var1;
  v12 = a3.var0.var0;
  v14 = a4;
  v15 = a5;
  -[MKMapView _zoomLevelForMapRect:includeAccessoryPadding:](self, "_zoomLevelForMapRect:includeAccessoryPadding:", 0, v12, v11, v10, v9);
  v17 = v16;
  if (v14 && (objc_msgSend(v14, "doubleValue"), v18 = v14, v17 < v19)
    || v15 && (objc_msgSend(v15, "doubleValue"), v18 = v15, v17 > v20))
  {
    objc_msgSend(v18, "doubleValue");
    v22 = exp2(v17 - v21);
    v23 = v10 * v22;
    v24 = v9 * v22;
    v12 = v12 * (v23 / v10) + var0 * (1.0 - v23 / v10);
    v11 = v11 * (v24 / v9) + var1 * (1.0 - v24 / v9);
    v10 = v23;
    v9 = v24;
  }

  v25 = v12;
  v26 = v11;
  v27 = v10;
  v28 = v9;
  result.var1.var1 = v28;
  result.var1.var0 = v27;
  result.var0.var1 = v26;
  result.var0.var0 = v25;
  return result;
}

- (BOOL)isShowingImagery
{
  MKMapType v2;

  v2 = -[MKMapView mapType](self, "mapType");
  return v2 != MKMapTypeMutedStandard && v2 != MKMapTypeStandard;
}

- (id)snapshotImage
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "scale");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView snapshotImageWithScale:](self, "snapshotImageWithScale:"));

  return v4;
}

- (id)snapshotImageWithScale:(double)a3
{
  return -[MKMapView snapshotImageWithScale:allowSnapshotting:](self, "snapshotImageWithScale:allowSnapshotting:", 1, a3);
}

- (id)snapshotImageWithScale:(double)a3 allowSnapshotting:(BOOL)a4
{
  _BOOL4 v4;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  UIImage *ImageFromCurrentImageContext;
  void *v19;
  CGSize v21;

  v4 = a4;
  -[MKMapView bounds](self, "bounds");
  v21.width = v7;
  v21.height = v8;
  UIGraphicsBeginImageContextWithOptions(v21, 0, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView window](self, "window"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "windowScene"));

  if (objc_msgSend(v10, "activationState"))
  {
    v11 = objc_msgSend(v10, "activationState");
    if (!v4 || v11 != (id)1)
      goto LABEL_10;
  }
  else if (!v4)
  {
    goto LABEL_10;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView window](self, "window"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "screen"));
  if (!v13)
  {

    goto LABEL_10;
  }
  v14 = (void *)v13;
  v15 = +[UIApplication _maps_isAnySceneForegroundForRole:](UIApplication, "_maps_isAnySceneForegroundForRole:", _UIWindowSceneSessionTypeCoverSheet);

  if (v15)
  {
LABEL_10:
    v16 = -[MKMapView rendersInBackground](self, "rendersInBackground");
    -[MKMapView setRendersInBackground:](self, "setRendersInBackground:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView layer](self, "layer"));
    objc_msgSend(v17, "renderInContext:", UIGraphicsGetCurrentContext());

    -[MKMapView setRendersInBackground:](self, "setRendersInBackground:", v16);
    goto LABEL_11;
  }
  -[MKMapView bounds](self, "bounds");
  -[MKMapView drawViewHierarchyInRect:afterScreenUpdates:](self, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
LABEL_11:
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v19 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v19;
}

+ (double)_animationDurationFromMapRect:(id)a3 toMapRect:(id)a4
{
  double v4;
  double v5;

  v4 = sqrt((a3.var0.var1 + a3.var1.var1 * 0.5 - (a3.var0.var1 + a3.var1.var1 * 0.5))* (a3.var0.var1 + a3.var1.var1 * 0.5 - (a3.var0.var1 + a3.var1.var1 * 0.5))+ (a3.var0.var0 + a3.var1.var0 * 0.5 - (a4.var0.var0 + a4.var1.var0 * 0.5))* (a3.var0.var0 + a3.var1.var0 * 0.5 - (a4.var0.var0 + a4.var1.var0 * 0.5)));
  v5 = vabdd_f64(a3.var1.var0 * 0.866025404, a4.var1.var0 * 0.866025404);
  if (v4 <= v5)
    v4 = v5;
  return fmin(fmax(v4 * 0.00001, 0.2), 1.0);
}

- (void)animateToVisibleMapRect:(id)a3 usingDefaultAnimationDuration:(BOOL)a4 completion:(id)a5
{
  -[MKMapView animateToVisibleMapRect:usingDefaultAnimationDuration:resetHeading:completion:](self, "animateToVisibleMapRect:usingDefaultAnimationDuration:resetHeading:completion:", a4, 0, a5, a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
}

- (void)animateToVisibleMapRect:(id)a3 usingDefaultAnimationDuration:(BOOL)a4 resetHeading:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  double var1;
  double var0;
  double v10;
  double v11;
  id v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  _QWORD v31[5];
  id v32;

  v6 = a5;
  v7 = a4;
  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v10 = a3.var0.var1;
  v11 = a3.var0.var0;
  v13 = a6;
  if (v11 != MKMapRectNull.origin.x || v10 != MKMapRectNull.origin.y)
  {
    -[MKMapView mapRectThatFits:edgePadding:](self, "mapRectThatFits:edgePadding:", v11, v10, var0, var1, 60.0, 60.0, 60.0, 60.0);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[MKMapView bounds](self, "bounds");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", v16, v18, v20, v22, v23, v24));
    v26 = v25;
    if (v6)
    {
      objc_msgSend(v25, "setHeading:", 0.0);
      if (!v7)
      {
LABEL_7:
        v27 = (void *)objc_opt_class(self);
        -[MKMapView visibleMapRect](self, "visibleMapRect");
        objc_msgSend(v27, "_animationDurationFromMapRect:toMapRect:");
        v29 = v28;
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100992414;
        v31[3] = &unk_1011AC8B0;
        v31[4] = self;
        v32 = v26;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v31, v13, v29);

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView camera](self, "camera"));
      objc_msgSend(v30, "heading");
      objc_msgSend(v26, "setHeading:");

      if (!v7)
        goto LABEL_7;
    }
    -[MKMapView setCamera:animated:completionHandler:](self, "setCamera:animated:completionHandler:", v26, 1, v13);
    goto LABEL_10;
  }
LABEL_11:

}

- (id)snapshotOptions
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init((Class)MKMapSnapshotOptions);
  -[MKMapView bounds](self, "bounds");
  objc_msgSend(v3, "setSize:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "scale");
  objc_msgSend(v3, "setScale:");

  objc_msgSend(v3, "setMapType:", -[MKMapView mapType](self, "mapType"));
  -[MKMapView visibleMapRect](self, "visibleMapRect");
  objc_msgSend(v3, "setMapRect:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView camera](self, "camera"));
  objc_msgSend(v3, "setCamera:", v7);

  return v3;
}

- (void)getRapSnapshotImageDataWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  UIImage *v6;
  id v7;
  NSData *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (MapsFeature_IsEnabled_RAPCommunityID(v4, v5))
  {
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue(-[MKMapView snapshotOptions](self, "snapshotOptions"));
    v7 = objc_msgSend(objc_alloc((Class)MKMapSnapshotter), "initWithOptions:", v6);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100AD0CE4;
    v9[3] = &unk_1011E1E70;
    v10 = v4;
    objc_msgSend(v7, "startWithCompletionHandler:", v9);

  }
  else
  {
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue(-[MKMapView snapshotImage](self, "snapshotImage"));
    v8 = UIImageJPEGRepresentation(v6, 0.400000006);
    v7 = (id)objc_claimAutoreleasedReturnValue(v8);
    (*((void (**)(id, id))v4 + 2))(v4, v7);
  }

}

- (void)_performFlyoverAnnouncementAnimation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:flyoverAnimationID:", 17024, objc_msgSend(v4, "animationID"));

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flyover"));
  -[MKMapView _performFlyoverAnimation:](self, "_performFlyoverAnimation:", v6);

}

@end
