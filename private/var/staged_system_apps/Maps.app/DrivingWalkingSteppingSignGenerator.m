@implementation DrivingWalkingSteppingSignGenerator

- (DrivingWalkingSteppingSignGenerator)initWithRoute:(id)a3
{
  return -[DrivingWalkingSteppingSignGenerator initWithRoute:options:](self, "initWithRoute:options:", a3, 0);
}

- (DrivingWalkingSteppingSignGenerator)initWithRoute:(id)a3 options:(int64_t)a4
{
  id v6;
  DrivingWalkingSteppingSignGenerator *v7;
  DrivingWalkingSteppingSignGenerator *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DrivingWalkingSteppingSignGenerator;
  v7 = -[DrivingWalkingSteppingSignGenerator init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    v7->_options = a4;
    -[DrivingWalkingSteppingSignGenerator _configureWithRoute:](v7, "_configureWithRoute:", v6);
  }

  return v8;
}

- (BOOL)_forWalkingNavigation
{
  return ((unint64_t)-[DrivingWalkingSteppingSignGenerator options](self, "options") >> 1) & 1;
}

- (BOOL)_showDistanceInMinorText
{
  return ((unint64_t)-[DrivingWalkingSteppingSignGenerator options](self, "options") >> 2) & 1;
}

- (void)_configureWithRoute:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *signs;
  NSArray *stepsWithCorrespondingSigns;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  NavSignViewModel *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  NSMutableArray *v23;
  void *v24;
  NSArray *v25;
  NSArray *v26;
  SteppingSignSizeAttributesCache *v27;
  SteppingSignSizeAttributesCache *sizeCache;
  id v29;

  v29 = a3;
  objc_storeStrong((id *)&self->_route, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "steps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  signs = self->_signs;
  self->_signs = 0;

  stepsWithCorrespondingSigns = self->_stepsWithCorrespondingSigns;
  self->_stepsWithCorrespondingSigns = 0;

  if (objc_msgSend(v5, "count"))
  {
    v10 = (uint64_t)objc_msgSend(v5, "count");
    if (v10 >= 1)
    {
      v11 = 0;
      v12 = v10 + 1;
      do
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v12 - 2));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geoStep"));
        v15 = v14;
        if (v14
          && (objc_msgSend(v14, "maneuverType") != 17 || (objc_msgSend(v13, "distance"), v16 >= 1.0)))
        {
          v17 = objc_alloc_init(NavSignViewModel);
          if (-[DrivingWalkingSteppingSignGenerator _forWalkingNavigation](self, "_forWalkingNavigation"))
            -[DrivingWalkingSteppingSignGenerator _configureSign:withStep:](self, "_configureSign:withStep:", v17, v13);
          else
            -[DrivingWalkingSteppingSignGenerator _configureSign:forSteppingWithStep:](self, "_configureSign:forSteppingWithStep:", v17, v13);
          -[NavSignViewModel setStepIndexRange:](v17, "setStepIndexRange:", v12 - 2, v11 + 1);
          objc_msgSend(v6, "addObject:", v17);
          objc_msgSend(v7, "addObject:", v13);

          v11 = 0;
        }
        else
        {
          ++v11;
        }

        --v12;
      }
      while (v12 > 1);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    objc_msgSend(v18, "stepIndexRange");
    objc_msgSend(v18, "setStepIndexRange:", 0, (char *)objc_msgSend(v18, "stepIndexRange") + v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allObjects"));
    v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v21));
    v23 = self->_signs;
    self->_signs = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reverseObjectEnumerator"));
    v25 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allObjects"));
    v26 = self->_stepsWithCorrespondingSigns;
    self->_stepsWithCorrespondingSigns = v25;

  }
  v27 = objc_alloc_init(SteppingSignSizeAttributesCache);
  sizeCache = self->_sizeCache;
  self->_sizeCache = v27;

}

- (void)_configureSign:(id)a3 withStep:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  GuidanceManeuverArtwork *v25;
  void *v26;
  GuidanceManeuverArtwork *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NavSignManeuverGuidanceInfo *v32;
  void *v33;
  void *v34;
  NavSignManeuverGuidanceInfo *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[6];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  int v50;
  void *v51;
  void *v52;

  v6 = a3;
  v7 = a4;
  v37 = v6;
  objc_msgSend(v6, "setStep:", v7);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[DrivingWalkingSteppingSignGenerator _distanceTextForStep:](self, "_distanceTextForStep:", v7));
  if (objc_msgSend(v7, "transportType") == 4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Navigation_DirectionsForUnknownTransport"), CFSTR("localized string not found"), 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mkServerFormattedString"));
    v52 = v10;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));

    v36 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentsForContext:", 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "instructionWithShorterAlternatives"));

    v13 = sub_10039DCD4(v12, &stru_1011E9660);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoStep"));
    v36 = objc_msgSend(v14, "maneuverType");

  }
  v15 = objc_msgSend(v7, "drivingSide");
  v16 = objc_alloc((Class)MKJunction);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoStep"));
  v18 = objc_msgSend(v17, "junctionType");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoStep"));
  v20 = objc_msgSend(v19, "maneuverType");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoStep"));
  v22 = objc_msgSend(v21, "junctionElements");
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoStep"));
  v24 = objc_msgSend(v16, "initWithType:maneuver:drivingSide:elements:count:", v18, v20, v15, v22, objc_msgSend(v23, "junctionElementsCount"));

  v25 = [GuidanceManeuverArtwork alloc];
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "artworkOverride"));
  v27 = -[GuidanceManeuverArtwork initWithManeuver:junction:drivingSide:artworkDataSource:](v25, "initWithManeuver:junction:drivingSide:artworkDataSource:", v36, v24, v15, v26);

  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_100C20948;
  v45 = sub_100C20958;
  v46 = 0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoStep"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100C20960;
  v40[3] = &unk_1011B10F8;
  v40[4] = &v47;
  v40[5] = &v41;
  objc_msgSend(v28, "shieldInfo:", v40);

  v29 = *((unsigned int *)v48 + 6);
  if ((_DWORD)v29)
  {
    v30 = v39;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NavSignShieldInfo shieldWithID:stringID:text:](NavSignShieldInfo, "shieldWithID:stringID:text:", v29, 0, v42[5]));
  }
  else
  {
    v31 = 0;
    v30 = v39;
  }
  v32 = [NavSignManeuverGuidanceInfo alloc];
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  if (v30)
  {
    v51 = v30;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1));
  }
  else
  {
    v34 = 0;
  }
  v35 = -[NavSignManeuverGuidanceInfo initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:](v32, "initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:", v33, v27, v34, v38, v31);
  objc_msgSend(v37, "setManeuverInfo:", v35);

  if (v30)
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
}

- (void)_configureSign:(id)a3 forSteppingWithStep:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  GuidanceManeuverArtwork *v12;
  id v13;
  void *v14;
  GuidanceManeuverArtwork *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NavSignManeuverGuidanceInfo *v21;
  void *v22;
  void *v23;
  void *v24;
  NavSignManeuverGuidanceInfo *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  _QWORD v33[6];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;
  void *v44;
  void *v45;

  v30 = a3;
  v32 = a4;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "geoStep"));
  objc_msgSend(v30, "setStep:", v32);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "contentsForContext:", 1));
  if ((objc_msgSend(v32, "isStartOrResumeStep") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v32, "distance");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringForDistance:"));
  }
  v26 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_geo_serverFormattedString"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForServerFormattedString:](NSString, "_navigation_stringForServerFormattedString:", v6));

  if (objc_msgSend(v32, "transportType") == 4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Navigation_DirectionsForUnknownTransport"), CFSTR("localized string not found"), 0));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "contentsForContext:", 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "instruction"));
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_geo_serverFormattedString"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForServerFormattedString:](NSString, "_navigation_stringForServerFormattedString:", v9));

  v10 = objc_msgSend(v32, "drivingSide");
  v11 = objc_msgSend(objc_alloc((Class)MKJunction), "initWithType:maneuver:drivingSide:elements:count:", objc_msgSend(v31, "junctionType"), objc_msgSend(v31, "maneuverType"), v10, objc_msgSend(v31, "junctionElements"), objc_msgSend(v31, "junctionElementsCount"));
  v12 = [GuidanceManeuverArtwork alloc];
  v13 = objc_msgSend(v31, "maneuverType");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "artworkOverride"));
  v15 = -[GuidanceManeuverArtwork initWithManeuver:junction:drivingSide:artworkDataSource:](v12, "initWithManeuver:junction:drivingSide:artworkDataSource:", v13, v11, v10, v14);

  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_100C20948;
  v38 = sub_100C20958;
  v39 = 0;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100C20E54;
  v33[3] = &unk_1011B10F8;
  v33[4] = &v40;
  v33[5] = &v34;
  objc_msgSend(v31, "shieldInfo:", v33);
  v16 = *((unsigned int *)v41 + 6);
  if ((_DWORD)v16)
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NavSignShieldInfo shieldWithID:stringID:text:](NavSignShieldInfo, "shieldWithID:stringID:text:", v16, 0, v35[5]));
  else
    v17 = 0;
  v18 = v11;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "mkServerFormattedString"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "mkServerFormattedString"));
  v21 = [NavSignManeuverGuidanceInfo alloc];
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  if (v19)
  {
    v45 = v19;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
    if (v20)
    {
LABEL_12:
      v44 = v20;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
      goto LABEL_15;
    }
  }
  else
  {
    v23 = 0;
    if (v20)
      goto LABEL_12;
  }
  v24 = 0;
LABEL_15:
  v25 = -[NavSignManeuverGuidanceInfo initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:](v21, "initWithSignID:maneuverArtwork:majorTextAlternatives:minorTextAlternatives:shieldInfo:", v22, v15, v23, v24, v17);
  objc_msgSend(v30, "setManeuverInfo:", v25);

  if (v20)
  if (v19)

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

}

- (void)configureNavSignView:(id)a3 withSign:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "setFlipMajorAndMinorTextInLabels:", -[DrivingWalkingSteppingSignGenerator _showDistanceInMinorText](self, "_showDistanceInMinorText"));
  objc_msgSend(v10, "setShieldSize:", 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "maneuverInfo"));

  objc_msgSend(v10, "setManeuverGuidanceInfo:", v7);
  if (-[DrivingWalkingSteppingSignGenerator _forWalkingNavigation](self, "_forWalkingNavigation"))
    v8 = objc_claimAutoreleasedReturnValue(+[NavSignLayoutDelegateManager defaultLayoutDelegateForWalking](NavSignLayoutDelegateManager, "defaultLayoutDelegateForWalking"));
  else
    v8 = objc_claimAutoreleasedReturnValue(+[NavSignLayoutDelegateManager defaultLayoutDelegateForStepping](NavSignLayoutDelegateManager, "defaultLayoutDelegateForStepping"));
  v9 = (void *)v8;
  objc_msgSend(v10, "setSignLayoutDelegate:", v8);

  objc_msgSend(v10, "refreshSign");
  objc_msgSend(v10, "layoutIfNeeded");

}

- (id)_distanceTextForStep:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "distance");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DrivingWalkingSteppingSignGenerator _distanceTextForStep:distance:](self, "_distanceTextForStep:distance:", v4));

  return v5;
}

- (id)_distanceTextForStep:(id)a3 distance:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if ((objc_msgSend(v5, "isStartOrResumeStep") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsForContext:", 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForDistance:", a4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mkServerFormattedString"));

  }
  return v6;
}

- (void)resetDistanceForSignAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if ((unint64_t)a3 <= 0x7FFFFFFFFFFFFFFELL
    && (unint64_t)-[NSMutableArray count](self->_signs, "count") > a3)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_signs, "objectAtIndexedSubscript:", a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "step"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DrivingWalkingSteppingSignGenerator _distanceTextForStep:](self, "_distanceTextForStep:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "maneuverInfo"));
    objc_msgSend(v7, "setMajorText:", v6);

  }
}

- (void)updateSignForStepAtIndex:(int64_t)a3 maneuverInfo:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = -[DrivingWalkingSteppingSignGenerator signIndexForStepIndex:](self, "signIndexForStepIndex:", a3);
  if (v6 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v7 = v6;
    if (v6 < (unint64_t)-[NSMutableArray count](self->_signs, "count"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_signs, "objectAtIndexedSubscript:", v7));
      objc_msgSend(v8, "setManeuverInfo:", v9);
      -[SteppingSignSizeAttributesCache invalidateSizeAttributesForSignAtIndex:](self->_sizeCache, "invalidateSizeAttributesForSignAtIndex:", v7);

    }
  }

}

- (void)updateDistance:(double)a3 forStepAtIndex:(int64_t)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = -[DrivingWalkingSteppingSignGenerator signIndexForStepIndex:](self, "signIndexForStepIndex:", a4);
  if (v6 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v7 = v6;
    if (v6 < (unint64_t)-[NSMutableArray count](self->_signs, "count"))
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_stepsWithCorrespondingSigns, "objectAtIndexedSubscript:", v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_signs, "objectAtIndexedSubscript:", v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DrivingWalkingSteppingSignGenerator _distanceTextForStep:distance:](self, "_distanceTextForStep:distance:", v11, a3));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "maneuverInfo"));
      objc_msgSend(v10, "setMajorText:", v9);

    }
  }
}

- (void)updateInstruction:(id)a3 forSignAtIndex:(int64_t)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  if ((unint64_t)a4 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v11 = v6;
    v7 = (unint64_t)-[NSMutableArray count](self->_signs, "count") > a4;
    v6 = v11;
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_signs, "objectAtIndexedSubscript:", a4));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mkServerFormattedString"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "maneuverInfo"));
      objc_msgSend(v10, "setMinorText:", v9);

      -[SteppingSignSizeAttributesCache invalidateSizeAttributesForSignAtIndex:](self->_sizeCache, "invalidateSizeAttributesForSignAtIndex:", a4);
      v6 = v11;
    }
  }

}

- (void)setCellVendor:(id)a3
{
  CellVendor **p_cellVendor;
  id v4;

  p_cellVendor = &self->_cellVendor;
  v4 = a3;
  objc_storeWeak((id *)p_cellVendor, v4);
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(NavSignCollectionViewCell), CFSTR("NavSignCellIdentifier"));

}

- (id)currentViewStateForSignAtIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if ((unint64_t)a3 <= 0x7FFFFFFFFFFFFFFELL)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_signs, "objectAtIndexedSubscript:", v3, v4));
  else
    v5 = 0;
  return v5;
}

- (void)invalidateSizeCaches
{
  -[SteppingSignSizeAttributesCache invalidateSizeAttributes](self->_sizeCache, "invalidateSizeAttributes");
}

- (id)signAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DrivingWalkingSteppingSignGenerator cellVendor](self, "cellVendor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", a3, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("NavSignCellIdentifier"), v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_signs, "objectAtIndexedSubscript:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navSignView"));
  -[DrivingWalkingSteppingSignGenerator configureNavSignView:withSign:](self, "configureNavSignView:withSign:", v9, v8);

  return v7;
}

- (id)auxViewAtIndex:(int64_t)a3
{
  return 0;
}

- (id)stepAtSignIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL
    || (unint64_t)-[NSMutableArray count](self->_signs, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_signs, "objectAtIndexedSubscript:", a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "step"));

  }
  return v6;
}

- (int64_t)signIndexForStep:(id)a3
{
  return -[DrivingWalkingSteppingSignGenerator signIndexForStepIndex:](self, "signIndexForStepIndex:", objc_msgSend(a3, "stepIndex"));
}

- (int64_t)signIndexForStepIndex:(int64_t)a3
{
  int64_t v5;
  void *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;

  if (!-[NSMutableArray count](self->_signs, "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0;
  while (1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_signs, "objectAtIndexedSubscript:", v5));
    v7 = objc_msgSend(v6, "stepIndexRange");
    v9 = v8;

    if (a3 >= (unint64_t)v7 && a3 - (uint64_t)v7 < v9)
      break;
    if (++v5 >= (unint64_t)-[NSMutableArray count](self->_signs, "count"))
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (CGSize)sizeForSignAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingSignSizeAttributesCache sizeAttributesForSignAtIndex:fittingSize:](self->_sizeCache, "sizeAttributesForSignAtIndex:fittingSize:"));
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "size");
    v11 = v10;
    v13 = v12;

  }
  else if ((unint64_t)-[NSMutableArray count](self->_signs, "count") <= a3)
  {
    v11 = CGSizeZero.width;
    v13 = CGSizeZero.height;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_signs, "objectAtIndexedSubscript:", a3));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DrivingWalkingSteppingSignGenerator _signSizeAttributesForSign:fittingSize:](self, "_signSizeAttributesForSign:fittingSize:", v14, width, height));
    -[SteppingSignSizeAttributesCache setSizeAttributes:forSignAtIndex:fittingSize:](self->_sizeCache, "setSizeAttributes:forSignAtIndex:fittingSize:", v15, a3, width, height);
    objc_msgSend(v15, "size");
    v11 = v16;
    v13 = v17;

  }
  v18 = v11;
  v19 = v13;
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)distanceFromPageControlBaselineToBottomOfSignAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v13;
  double v14;

  height = a4.height;
  width = a4.width;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingSignSizeAttributesCache sizeAttributesForSignAtIndex:fittingSize:](self->_sizeCache, "sizeAttributesForSignAtIndex:fittingSize:"));
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "signToPageControlDistance");
    v11 = v10;
LABEL_3:

    return v11;
  }
  v11 = 20.0;
  if ((a3 & 0x8000000000000000) == 0 && (unint64_t)-[NSMutableArray count](self->_signs, "count") > a3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_signs, "objectAtIndexedSubscript:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DrivingWalkingSteppingSignGenerator _signSizeAttributesForSign:fittingSize:](self, "_signSizeAttributesForSign:fittingSize:", v13, width, height));
    -[SteppingSignSizeAttributesCache setSizeAttributes:forSignAtIndex:fittingSize:](self->_sizeCache, "setSizeAttributes:forSignAtIndex:fittingSize:", v9, a3, width, height);
    objc_msgSend(v9, "signToPageControlDistance");
    v11 = v14;

    goto LABEL_3;
  }
  return v11;
}

- (id)_signSizeAttributesForSign:(id)a3 fittingSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  NavManeuverSignView *steppingSizingView;
  NavManeuverSignView *v9;
  NavManeuverSignView *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unsigned int v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  SteppingSignSizeAttributes *v23;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  steppingSizingView = self->_steppingSizingView;
  if (!steppingSizingView)
  {
    v9 = -[NavSignView initWithFrame:]([NavManeuverSignView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v10 = self->_steppingSizingView;
    self->_steppingSizingView = v9;

    -[NavManeuverSignView setTranslatesAutoresizingMaskIntoConstraints:](self->_steppingSizingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    steppingSizingView = self->_steppingSizingView;
  }
  -[NavManeuverSignView clearContent](steppingSizingView, "clearContent");
  -[DrivingWalkingSteppingSignGenerator configureNavSignView:withSign:](self, "configureNavSignView:withSign:", self->_steppingSizingView, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavManeuverSignView widthAnchor](self->_steppingSizingView, "widthAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", width));

  objc_msgSend(v12, "setActive:", 1);
  -[NavManeuverSignView systemLayoutSizeFittingSize:](self->_steppingSizingView, "systemLayoutSizeFittingSize:", width, height);
  v14 = v13;
  v16 = v15;
  objc_msgSend(v12, "setActive:", 0);
  v17 = -[DrivingWalkingSteppingSignGenerator _forWalkingNavigation](self, "_forWalkingNavigation");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavSignView minorLabel](self->_steppingSizingView, "minorLabel"));
  v19 = objc_msgSend(v18, "lineCount");

  v20 = 3.0;
  if (v17)
    v20 = 6.0;
  v21 = -2.0;
  if (v17)
    v21 = 4.0;
  if ((unint64_t)v19 <= 1)
    v22 = v21;
  else
    v22 = v20;
  v23 = -[SteppingSignSizeAttributes initWithSize:signToPageControlDistance:]([SteppingSignSizeAttributes alloc], "initWithSize:signToPageControlDistance:", v14, v16, v22);

  return v23;
}

- (double)distanceFromPageControlBaselineToTopOfAuxView
{
  unsigned int v2;
  double result;

  v2 = -[DrivingWalkingSteppingSignGenerator _forWalkingNavigation](self, "_forWalkingNavigation");
  result = 17.0;
  if (v2)
    return 13.0;
  return result;
}

- (void)rectForSignAtIndex:(int64_t)a3 currentStepIndex:(unint64_t)a4 handler:(id)a5
{
  void *v7;
  double v8;
  void (**v9)(double);

  v9 = (void (**)(double))a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DrivingWalkingSteppingSignGenerator stepAtSignIndex:](self, "stepAtSignIndex:", a3));
  v8 = sub_1007787B0(v7);
  if (v9)
    v9[2](v8);

}

- (int64_t)numberOfSigns
{
  return (int64_t)-[NSMutableArray count](self->_signs, "count");
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (NSArray)stepsWithCorrespondingSigns
{
  return self->_stepsWithCorrespondingSigns;
}

- (CellVendor)cellVendor
{
  return (CellVendor *)objc_loadWeakRetained((id *)&self->_cellVendor);
}

- (unint64_t)signLayoutType
{
  return self->_signLayoutType;
}

- (void)setSignLayoutType:(unint64_t)a3
{
  self->_signLayoutType = a3;
}

- (int64_t)options
{
  return self->_options;
}

- (NSMutableArray)signs
{
  return self->_signs;
}

- (void)setSigns:(id)a3
{
  objc_storeStrong((id *)&self->_signs, a3);
}

- (NavManeuverSignView)steppingSizingView
{
  return self->_steppingSizingView;
}

- (void)setSteppingSizingView:(id)a3
{
  objc_storeStrong((id *)&self->_steppingSizingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_steppingSizingView, 0);
  objc_storeStrong((id *)&self->_signs, 0);
  objc_destroyWeak((id *)&self->_cellVendor);
  objc_storeStrong((id *)&self->_stepsWithCorrespondingSigns, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_sizeCache, 0);
}

@end
