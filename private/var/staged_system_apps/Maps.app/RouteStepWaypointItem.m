@implementation RouteStepWaypointItem

- (RouteStepWaypointItem)initWithWaypoint:(id)a3 waypointType:(unint64_t)a4 arrivalStep:(id)a5 vehicle:(id)a6 route:(id)a7 cellClass:(Class)a8 state:(unint64_t)a9 metrics:(id)a10 context:(int64_t)a11 scale:(double)a12
{
  id v20;
  RouteStepWaypointItem *v21;
  RouteStepWaypointItem *v22;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a5;
  v24 = a6;
  v20 = a10;
  v27.receiver = self;
  v27.super_class = (Class)RouteStepWaypointItem;
  v21 = -[RouteStepItem initWithCellClass:state:metrics:context:route:scale:](&v27, "initWithCellClass:state:metrics:context:route:scale:", a8, a9, v20, a11, a7, a12);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_waypoint, a3);
    v22->_waypointType = a4;
    objc_storeStrong((id *)&v22->_arrivalStep, a5);
    objc_storeStrong((id *)&v22->_vehicle, a6);
    objc_msgSend(v20, "imageAreaWidth");
    -[RouteStepItem setHairlineLeadingInset:](v22, "setHairlineLeadingInset:");
    objc_msgSend(v20, "textTrailingMargin");
    -[RouteStepItem setHairlineTrailingInset:](v22, "setHairlineTrailingInset:");
  }

  return v22;
}

- (void)reset
{
  self->_computedContent = 0;
}

- (NSAttributedString)primaryText
{
  if (!self->_computedContent)
    -[RouteStepWaypointItem _computeContent](self, "_computeContent");
  return self->_primaryText;
}

- (NSAttributedString)secondaryText
{
  if (!self->_computedContent)
    -[RouteStepWaypointItem _computeContent](self, "_computeContent");
  return self->_secondaryText;
}

- (UIImage)pinImage
{
  if (!self->_computedContent)
    -[RouteStepWaypointItem _computeContent](self, "_computeContent");
  return self->_pinImage;
}

- (void)_computeContent
{
  NSAttributedString *primaryText;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  id v34;
  unint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSAttributedString *v41;
  NSAttributedString *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  char isKindOfClass;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  id v62;
  NSAttributedString **p_secondaryText;
  NSAttributedString *secondaryText;
  void *v65;
  NSAttributedString *v66;
  NSAttributedString *v67;
  NSAttributedString *v68;
  NSAttributedString *v69;
  void *v70;
  NSAttributedString *v71;
  NSAttributedString *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  UIImage *v82;
  UIImage *v83;
  double v84;
  double v85;
  id v86;
  void *v87;
  UIImage *v88;
  UIImage *pinImage;
  id v90;
  uint64_t v91;
  int v92;
  void *v93;
  unint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[2];

  self->_computedContent = 1;
  primaryText = self->_primaryText;
  self->_primaryText = 0;

  v4 = -[RouteStepWaypointItem waypointType](self, "waypointType");
  if (self->_arrivalStep)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem route](self, "route"));
    v6 = objc_msgSend(v5, "legIndexForStepIndex:", -[GEOComposedRouteStep stepIndex](self->_arrivalStep, "stepIndex"));

  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem route](self, "route"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "legs"));
  v9 = objc_msgSend(v8, "count");

  if (v6 >= v9)
  {
    v97 = 0;
    v14 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem route](self, "route"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "legs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v6));

    if (v4)
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "destination"));
    else
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "origin"));
    v15 = (void *)v13;
    v16 = objc_opt_class(GEOComposedWaypointToRoute);
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
    }
    else if (v4)
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "destinationListInstructionString"));
    }
    else
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "originListInstructionString"));
    }
    v14 = (void *)v17;
    v97 = v12;

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointItem waypoint](self, "waypoint"));
  v19 = objc_msgSend(v18, "isDynamicCurrentLocation");

  if (objc_msgSend(v14, "length"))
    v20 = 0;
  else
    v20 = v19;
  if (v20 == 1)
  {
    v21 = MKLocalizedStringForCurrentLocation();
    v22 = objc_claimAutoreleasedReturnValue(v21);
LABEL_29:
    v92 = v20 ^ 1;

    v14 = (void *)v22;
    goto LABEL_30;
  }
  if (objc_msgSend(v14, "length"))
  {
    v92 = 0;
    goto LABEL_30;
  }
  v23 = -[RouteStepWaypointItem waypointType](self, "waypointType");
  switch(v23)
  {
    case 2uLL:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v24;
      v26 = CFSTR("Arrive [Directions Step]");
      goto LABEL_28;
    case 1uLL:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v24;
      v26 = CFSTR("Stop [Directions Step]");
      goto LABEL_28;
    case 0uLL:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v24;
      v26 = CFSTR("Start [Directions Step]");
LABEL_28:
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", v26, CFSTR("localized string not found"), 0));

      v14 = v25;
      goto LABEL_29;
  }
  v92 = 1;
LABEL_30:
  v94 = v4;
  if (objc_msgSend(v14, "length"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](self, "metrics"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "primaryTextFontStyle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](self, "metrics"));
    objc_msgSend(v29, "primaryTextFontWeight");
    v31 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem traitCollection](self, "traitCollection"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", v28, v32, v31));

    v34 = objc_alloc((Class)NSAttributedString);
    v101[0] = v33;
    v100[0] = NSFontAttributeName;
    v100[1] = NSForegroundColorAttributeName;
    v35 = -[RouteStepItem state](self, "state");
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](self, "metrics"));
    v37 = v36;
    if (v35)
      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "primaryTextActiveTextColor"));
    else
      v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "primaryTextDisabledTextColor"));
    v39 = (void *)v38;
    v101[1] = v38;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v101, v100, 2));
    v41 = (NSAttributedString *)objc_msgSend(v34, "initWithString:attributes:", v14, v40);
    v42 = self->_primaryText;
    self->_primaryText = v41;

    v4 = v94;
  }
  if (v4)
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "destination"));
  else
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "origin"));
  v44 = (void *)v43;
  v45 = objc_opt_class(GEOComposedWaypointToRoute);
  isKindOfClass = objc_opt_isKindOfClass(v44, v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](self, "metrics"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "secondaryTextFontStyle"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](self, "metrics"));
  objc_msgSend(v49, "secondaryTextFontWeight");
  v51 = v50;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem traitCollection](self, "traitCollection"));
  v96 = objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", v48, v52, v51));

  v53 = -[RouteStepItem state](self, "state");
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](self, "metrics"));
  v55 = v54;
  if (v53)
    v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "secondaryTextActiveTextColor"));
  else
    v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "secondaryTextDisabledTextColor"));
  v57 = (void *)v56;

  v98[0] = NSFontAttributeName;
  v98[1] = NSForegroundColorAttributeName;
  v58 = (void *)v96;
  v99[0] = v96;
  v99[1] = v57;
  v59 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v99, v98, 2));
  v93 = v14;
  if (!v97)
  {
    v62 = 0;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_50;
LABEL_46:
    v95 = 0;
    goto LABEL_51;
  }
  if (!objc_msgSend(v44, "hasFindMyHandleID"))
  {
    if ((isKindOfClass & 1) != 0)
    {
      p_secondaryText = &self->_secondaryText;
      secondaryText = self->_secondaryText;
      self->_secondaryText = 0;

      v95 = 0;
      goto LABEL_54;
    }
    v62 = (id)objc_claimAutoreleasedReturnValue(+[RouteStepWaypointItemUtil attributedSubtitleForLeg:waypoint:isOrigin:attributes:](RouteStepWaypointItemUtil, "attributedSubtitleForLeg:waypoint:isOrigin:attributes:", v97, v44, v94 == 0, v59));
    goto LABEL_50;
  }
  v60 = objc_alloc((Class)NSAttributedString);
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "arrivingDisplayName"));
  v62 = objc_msgSend(v60, "initWithString:attributes:", v61, v59);

  if ((isKindOfClass & 1) != 0)
    goto LABEL_46;
LABEL_50:
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointItem waypoint](self, "waypoint"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "singleLineAddress"));

LABEL_51:
  p_secondaryText = &self->_secondaryText;
  v66 = self->_secondaryText;
  self->_secondaryText = 0;

  if (v62)
  {
    v67 = (NSAttributedString *)v62;
    v68 = v67;
LABEL_53:
    v69 = *p_secondaryText;
    *p_secondaryText = v67;
LABEL_57:

    goto LABEL_58;
  }
LABEL_54:
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointItem vehicle](self, "vehicle"));

  if (v70)
  {
    v69 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointItem _stepWithEVInfo](self, "_stepWithEVInfo"));
    v71 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(-[NSAttributedString attributedChargeStringForWaypointType:font:textColor:includeDaysAgo:](v69, "attributedChargeStringForWaypointType:font:textColor:includeDaysAgo:", -[RouteStepWaypointItem waypointType](self, "waypointType"), v96, v57, v94 == 0));
LABEL_56:
    v72 = *p_secondaryText;
    *p_secondaryText = v71;

    v68 = 0;
    goto LABEL_57;
  }
  if (objc_msgSend(v95, "length"))
  {
    v67 = (NSAttributedString *)objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v95, v59);
    v68 = 0;
    goto LABEL_53;
  }
  if (v92)
  {
    v90 = objc_alloc((Class)NSAttributedString);
    v91 = MKLocalizedStringForUnknownLocation();
    v69 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(v91);
    v71 = (NSAttributedString *)objc_msgSend(v90, "initWithString:attributes:", v69, v59);
    goto LABEL_56;
  }
  v68 = 0;
LABEL_58:
  v73 = v57;
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "chargingInfo"));

  v75 = (void *)v59;
  if (v74)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes evChargerStyleAttributes](GEOFeatureStyleAttributes, "evChargerStyleAttributes"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](self, "metrics"));
    v78 = objc_msgSend(v77, "iconSize");
    -[RouteStepItem scale](self, "scale");
    v79 = v76;
    v80 = v78;
  }
  else
  {
    if ((isKindOfClass & 1) == 0)
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointItem waypoint](self, "waypoint"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "mapItemIfLoaded"));
      -[RouteStepItem scale](self, "scale");
      v85 = v84;
      v83 = (UIImage *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](self, "metrics"));
      v86 = -[UIImage iconSize](v83, "iconSize");
      v87 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](self, "metrics"));
      v88 = (UIImage *)objc_claimAutoreleasedReturnValue(+[MKMapItem _maps_markerImageForMapItem:scale:size:useMarkerFallback:](MKMapItem, "_maps_markerImageForMapItem:scale:size:useMarkerFallback:", v77, v86, objc_msgSend(v87, "useMarkerFallback"), v85));
      pinImage = self->_pinImage;
      self->_pinImage = v88;

      v58 = (void *)v96;
      goto LABEL_63;
    }
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes customSavedRouteStyleAttributes](GEOFeatureStyleAttributes, "customSavedRouteStyleAttributes"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](self, "metrics"));
    v81 = objc_msgSend(v77, "iconSize");
    -[RouteStepItem scale](self, "scale");
    v79 = v76;
    v80 = v81;
  }
  v82 = (UIImage *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v79, v80, 0));
  v83 = self->_pinImage;
  self->_pinImage = v82;
LABEL_63:

}

- (id)_stepWithEVInfo
{
  void *v2;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = -[RouteStepWaypointItem waypointType](self, "waypointType");
  if (v4 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem route](self, "route"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastEVStep"));
LABEL_18:
    v2 = (void *)v7;
    goto LABEL_19;
  }
  if (v4 != 1)
  {
    if (v4)
      return v2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem route](self, "route"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "steps"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

LABEL_19:
    return v2;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem route](self, "route", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "legs"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
LABEL_8:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
      v15 = objc_msgSend(v14, "endStepIndex");
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointItem arrivalStep](self, "arrivalStep"));
      v17 = objc_msgSend(v16, "stepIndex");

      if (v15 >= v17)
        break;
      if (v11 == (id)++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
    v18 = objc_msgSend(v14, "legIndex");

    if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
      return 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem route](self, "route"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastEVStepInLegWithIndex:", v18));
    goto LABEL_18;
  }
LABEL_14:

  return 0;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointItem primaryText](self, "primaryText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepWaypointItem secondaryText](self, "secondaryText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; primaryText = %@; secondaryText = %@>"),
                   v3,
                   self,
                   v5,
                   v7));

  return v8;
}

- (DirectionsWaypoint)waypoint
{
  return self->_waypoint;
}

- (unint64_t)waypointType
{
  return self->_waypointType;
}

- (GEOComposedRouteStep)arrivalStep
{
  return self->_arrivalStep;
}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_arrivalStep, 0);
  objc_storeStrong((id *)&self->_waypoint, 0);
  objc_storeStrong((id *)&self->_pinImage, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
}

@end
