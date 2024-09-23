@implementation POIAnnotation

- (POIAnnotation)initWithItem:(id)a3 defaultLocale:(id)a4
{
  id v7;
  id v8;
  POIAnnotation *v9;
  POIAnnotation *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSString *v24;
  NSString *textLocale;
  uint64_t v26;
  NSString *subtext;
  void *v28;
  NSString *v29;
  NSString *subtextLocale;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD *v37;
  void *v38;
  char *v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  VKCustomFeature *v47;
  VKCustomFeature *customFeature;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  double latitude;
  double longitude;
  void *v58;
  void *v59;
  double v60;
  double v61;
  VKCustomFeature *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  VKCustomFeature *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  VKCustomFeature *v77;
  void *v78;
  void *v79;
  VKCustomFeature *v80;
  void *v81;
  id v82;
  void *v83;
  BOOL v84;
  POIAnnotation *v85;
  VKCustomFeature *v87;
  VKCustomFeature *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  VKCustomFeature *v96;
  void *v97;
  void *v98;
  VKCustomFeature *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  VKCustomFeature *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  unsigned int v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  VKCustomFeature *v127;
  void *v128;
  id v129;
  NSObject *v130;
  id v131;
  NSObject *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  objc_super v141;
  uint64_t v142;
  uint8_t buf[4];
  _BYTE v144[18];
  __int16 v145;
  int v146;
  __int16 v147;
  const char *v148;

  v7 = a3;
  v8 = a4;
  v141.receiver = self;
  v141.super_class = (Class)POIAnnotation;
  v9 = -[POIAnnotation init](&v141, "init");
  v10 = v9;
  if (!v9)
    goto LABEL_46;
  objc_storeStrong((id *)&v9->_compoundItem, a3);
  v10->_presentationAttributesHash = sub_100BB5D14(v7);
  objc_msgSend(v7, "coordinate");
  v12 = v11;
  objc_msgSend(v7, "coordinate");
  v10->_coordinate.latitude = v12;
  v10->_coordinate.longitude = v13;
  v10->_showsBalloonCallout = objc_msgSend(v7, "showsBalloonCallout");
  v10->_sortOrder = (unint64_t)objc_msgSend(v7, "sortOrder");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subtitle"));
  if (objc_msgSend((id)qword_1014D4300, "length"))
  {
    v16 = (id)qword_1014D4300;

    v8 = v16;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "value"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "prefix"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "value"));

  if (objc_msgSend(v19, "length"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Custom POI title with prefix"), CFSTR("localized string not found"), 0));
    v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v19, v17));

    v17 = (void *)v22;
  }
  objc_storeStrong((id *)&v10->_text, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "locale"));
  if (v23)
    v24 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "locale"));
  else
    v24 = (NSString *)v8;
  textLocale = v10->_textLocale;
  v10->_textLocale = v24;

  v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "value"));
  subtext = v10->_subtext;
  v10->_subtext = (NSString *)v26;

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "locale"));
  if (v28)
    v29 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "locale"));
  else
    v29 = (NSString *)v8;
  subtextLocale = v10->_subtextLocale;
  v10->_subtextLocale = v29;

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "labelGeometry"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "labelShape"));
  v33 = objc_msgSend(v32, "count");

  v139 = v15;
  v140 = v14;
  v137 = v19;
  v138 = v17;
  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "labelGeometry"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "labelShape"));
    v36 = objc_msgSend(v35, "count");

    v37 = malloc_type_malloc(24 * (_QWORD)v36, 0x1000040504FFAC1uLL);
    v38 = v37;
    if (v36)
    {
      v39 = 0;
      v40 = v37 + 2;
      do
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "labelGeometry"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "labelShape"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndex:", v39));

        objc_msgSend(v43, "lat");
        *(v40 - 2) = v44;
        objc_msgSend(v43, "lng");
        *(v40 - 1) = v45;
        objc_msgSend(v43, "elevationM");
        *v40 = v46;
        v40 += 3;

        ++v39;
      }
      while (v36 != v39);
    }
    v47 = (VKCustomFeature *)objc_msgSend(objc_alloc((Class)VKCustomFeature), "initLineWithCoordinates:count:", v38, v36);
    customFeature = v10->_customFeature;
    v10->_customFeature = v47;

    free(v38);
    goto LABEL_17;
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enhancedPlacement"));

  if (v53)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enhancedPlacement"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "elevationInMeters"));

    if (v55)
    {
      latitude = v10->_coordinate.latitude;
      longitude = v10->_coordinate.longitude;
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enhancedPlacement"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "elevationInMeters"));
      objc_msgSend(v59, "doubleValue");
      v61 = v60;

      v62 = (VKCustomFeature *)objc_msgSend(objc_alloc((Class)VKCustomFeature), "initWithCoordinate3D:", latitude, longitude, v61);
    }
    else
    {
      v62 = (VKCustomFeature *)objc_msgSend(objc_alloc((Class)VKCustomFeature), "initWithCoordinate:", v10->_coordinate.latitude, v10->_coordinate.longitude);
    }
    v96 = v10->_customFeature;
    v10->_customFeature = v62;

    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enhancedPlacement"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "buildingHeightInMeters"));

    if (v98)
    {
      v99 = v10->_customFeature;
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enhancedPlacement"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "buildingHeightInMeters"));
      objc_msgSend(v101, "floatValue");
      -[VKCustomFeature setBuildingHeight:](v99, "setBuildingHeight:");

    }
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enhancedPlacement"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "buildingFaceAzimuth"));

    if (v103)
    {
      v104 = v10->_customFeature;
      v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enhancedPlacement"));
      v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "buildingFaceAzimuth"));
      objc_msgSend(v106, "floatValue");
      -[VKCustomFeature setBuildingFaceAzimuth:](v104, "setBuildingFaceAzimuth:");

    }
    goto LABEL_17;
  }
  if (VKLocationCoordinate2DIsValid(v10->_coordinate.latitude, v10->_coordinate.longitude))
  {
    v87 = (VKCustomFeature *)objc_msgSend(objc_alloc((Class)VKCustomFeature), "initWithCoordinate:", v10->_coordinate.latitude, v10->_coordinate.longitude);
    v88 = v10->_customFeature;
    v10->_customFeature = v87;

    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchResult"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "findMyHandle"));
    if (v90)
    {

LABEL_50:
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchResult"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "findMyHandle"));
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "identifier"));
      v94 = v93;
      if (v93)
      {
        v95 = v93;
      }
      else
      {
        v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchResult"));
        v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "autocompletePerson"));
        v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "handle"));
        v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "handle"));
        v116 = objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "handleIdentifier"));

        v95 = (id)v116;
      }

      v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchResult"));
      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "findMyHandle"));
      v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "contact"));
      v120 = v119;
      if (v119)
      {
        v121 = v119;
      }
      else
      {
        v122 = v95;
        v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchResult"));
        v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "autocompletePerson"));
        v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "contact"));
        v125 = v124;
        if (v124)
          v126 = v124;
        else
          v126 = (id)objc_claimAutoreleasedReturnValue(+[CNContact contactWithDisplayName:emailOrPhoneNumber:](CNContact, "contactWithDisplayName:emailOrPhoneNumber:", 0, v122));
        v121 = v126;

        v95 = v122;
      }

      if (!v121)
      {
        v129 = sub_1004318FC();
        v130 = objc_claimAutoreleasedReturnValue(v129);
        if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)v144 = "-[POIAnnotation initWithItem:defaultLocale:]";
          *(_WORD *)&v144[8] = 2080;
          *(_QWORD *)&v144[10] = "CustomPOIsController.m";
          v145 = 1024;
          v146 = 170;
          v147 = 2080;
          v148 = "contact != nil";
          _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100A70734())
        {
          v131 = sub_1004318FC();
          v132 = objc_claimAutoreleasedReturnValue(v131);
          if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
          {
            v133 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v144 = v133;
            _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
      }
      v127 = v10->_customFeature;
      v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "identifier"));
      -[VKCustomFeature setImageProvider:withKey:](v127, "setImageProvider:withKey:", v121, v128);

      goto LABEL_17;
    }
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchResult"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "autocompletePerson"));
    v109 = objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "handle"));
    if (v109)
    {
      v110 = (void *)v109;
      v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchResult"));
      v112 = objc_msgSend(v111, "locationType");

      if (v112 == 4)
        goto LABEL_50;
    }
    else
    {

    }
  }
LABEL_17:
  -[VKCustomFeature setText:locale:](v10->_customFeature, "setText:locale:", v10->_text, v10->_textLocale);
  -[VKCustomFeature setAnnotationText:locale:](v10->_customFeature, "setAnnotationText:locale:", v10->_subtext, v10->_subtextLocale);
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "styleAttributes"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "styleAttributes"));
  v51 = v50;
  if (byte_1014D42F8)
    v52 = objc_msgSend(v50, "copyWithAirportStyleAttributes");
  else
    v52 = objc_msgSend(v50, "copy");
  v63 = v52;

  v64 = 1;
  if ((objc_opt_respondsToSelector(v7, "isRouteStartOrEnd") & 1) != 0)
  {
    if (objc_msgSend(v7, "isRouteStartOrEnd"))
      v64 = 2;
    else
      v64 = 1;
  }
  *(_DWORD *)buf = 65567;
  *(_DWORD *)v144 = v64;
  *(_QWORD *)&v144[4] = 0x100010024;
  objc_msgSend(v63, "replaceAttributes:count:", buf, 2);
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "labelGeometry"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "labelShape"));
  v67 = objc_msgSend(v66, "count");

  if (v67)
  {
    v142 = 0x1500000005;
    objc_msgSend(v63, "replaceAttributes:count:", &v142, 1);
  }
  objc_storeStrong((id *)&v10->_styleAttributes, v63);
  if (GEOConfigGetBOOL(MapsConfig_OverrideTransitNodeCustomPOIType, off_1014B2FC8)
    && objc_msgSend(v63, "isTransit"))
  {
    v142 = 0x7F00000006;
    objc_msgSend(v63, "replaceAttributes:count:", &v142, 1);
  }
  -[VKCustomFeature setStyleAttributes:](v10->_customFeature, "setStyleAttributes:", v63);
  if (objc_msgSend(v63, "isCustomPOI"))
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clientFeatureID"));
    -[VKCustomFeature setClientFeatureID:](v10->_customFeature, "setClientFeatureID:", objc_msgSend(v68, "clientFeatureID"));

  }
  v10->_isLabelPOI = objc_msgSend(v63, "isLabelPOI");
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
  v70 = v69;
  if (v69)
  {
    -[VKCustomFeature setBusinessID:](v10->_customFeature, "setBusinessID:", objc_msgSend(v69, "_muid"));
    -[VKCustomFeature setFeatureID:](v10->_customFeature, "setFeatureID:", objc_msgSend(v70, "_customIconID"));
    if (objc_msgSend(v70, "_hasAreaHighlightId"))
      -[VKCustomFeature setFeatureID:](v10->_customFeature, "setFeatureID:", objc_msgSend(v70, "_areaHighlightId"));
    -[VKCustomFeature setSortKey:](v10->_customFeature, "setSortKey:", objc_msgSend(v7, "sortOrder"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "_venueInfo"));
    v72 = v10->_customFeature;
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "venueIdentifier"));
    -[VKCustomFeature setVenueID:](v72, "setVenueID:", objc_msgSend(v73, "venueID"));

    v134 = v71;
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "venueIdentifier"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "componentIdentifiers"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "firstObject"));

    -[VKCustomFeature setVenueBuildingID:](v10->_customFeature, "setVenueBuildingID:", objc_msgSend(v76, "buildingID"));
    v77 = v10->_customFeature;
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "floorInfo"));
    -[VKCustomFeature setVenueLevelID:](v77, "setVenueLevelID:", objc_msgSend(v78, "levelID"));

    -[VKCustomFeature setVenueComponentID:](v10->_customFeature, "setVenueComponentID:", objc_msgSend(v76, "unitID"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchResult"));
    if (objc_msgSend(v79, "type") == 3 && objc_msgSend(v79, "hasFloorOrdinal"))
    {
      -[VKCustomFeature setVenueFloorOrdinal:](v10->_customFeature, "setVenueFloorOrdinal:", (__int16)objc_msgSend(v79, "floorOrdinal"));
    }
    else
    {
      v80 = v10->_customFeature;
      v81 = v49;
      v82 = v8;
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "floorInfo"));
      -[VKCustomFeature setVenueFloorOrdinal:](v80, "setVenueFloorOrdinal:", objc_msgSend(v83, "ordinal"));

      v8 = v82;
      v49 = v81;
    }
    v84 = objc_msgSend(v70, "_venueFeatureType") == (id)1 || objc_msgSend(v70, "_venueFeatureType") == (id)2;
    v10->_isVenueOrBuilding = v84;

  }
  v85 = v10;

LABEL_46:
  return v10;
}

- (id)feature
{
  self->_featureGivenToVectorKit = 1;
  return self->_customFeature;
}

- (MKMapItem)mapItem
{
  return -[PersonalizedCompoundItem mapItem](self->_compoundItem, "mapItem");
}

- (ParkedCar)parkedCar
{
  return -[PersonalizedCompoundItem parkedCar](self->_compoundItem, "parkedCar");
}

- (SearchResult)searchResult
{
  return -[PersonalizedCompoundItem searchResult](self->_compoundItem, "searchResult");
}

- (VKLabelMarker)sourceLabelMarker
{
  return -[PersonalizedCompoundItem sourceLabelMarker](self->_compoundItem, "sourceLabelMarker");
}

- (AddressBookAddress)address
{
  return -[PersonalizedCompoundItem address](self->_compoundItem, "address");
}

- (SearchDotPlace)searchDotPlace
{
  return -[PersonalizedCompoundItem searchDotPlace](self->_compoundItem, "searchDotPlace");
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  return -[PersonalizedCompoundItem styleAttributes](self->_compoundItem, "styleAttributes");
}

- (NSSet)keys
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem keys](self->_compoundItem, "keys"));
  if (v3)
    v4 = objc_claimAutoreleasedReturnValue(-[PersonalizedCompoundItem keys](self->_compoundItem, "keys"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v5 = (void *)v4;

  return (NSSet *)v5;
}

- (PersonalizedItem)personalizedItem
{
  return (PersonalizedItem *)self->_compoundItem;
}

- (id)debugDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[POIAnnotation description](self, "description"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("self"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_text, CFSTR("title"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_subtext, CFSTR("subtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOFeatureStyleAttributes description](self->_styleAttributes, "description"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("styleAttributes"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[POIAnnotation address](self, "address"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addressValue"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = CFSTR("(null)");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("address"));

  v11 = objc_msgSend(v3, "copy");
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  POIAnnotation *v4;
  uint64_t v5;
  POIAnnotation *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = (POIAnnotation *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[POIAnnotation keys](self, "keys"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[POIAnnotation keys](v6, "keys"));

      v9 = objc_msgSend(v7, "intersectsSet:", v8);
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (BOOL)showsBalloonCallout
{
  return self->_showsBalloonCallout;
}

- (NSString)title
{
  return self->_text;
}

- (NSString)subtitle
{
  return self->_subtext;
}

- (BOOL)isLabelPOI
{
  return self->_isLabelPOI;
}

- (BOOL)isVenueOrBuilding
{
  return self->_isVenueOrBuilding;
}

- (PersonalizedCompoundItem)compoundItem
{
  return self->_compoundItem;
}

- (unint64_t)presentationAttributesHash
{
  return self->_presentationAttributesHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compoundItem, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_subtextLocale, 0);
  objc_storeStrong((id *)&self->_subtext, 0);
  objc_storeStrong((id *)&self->_textLocale, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_customFeature, 0);
}

@end
