@implementation TransitSteppingCameraFramer

- (void)rectForStep:(id)a3 currentStepIndex:(unint64_t)a4 handler:(id)a5
{
  void (**v8)(_QWORD, double, double, double, double);
  id v9;
  void *v10;
  void *v11;
  __n128 v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  __n128 v18;
  id v19;

  v19 = a3;
  v8 = (void (**)(_QWORD, double, double, double, double))a5;
  if (v8)
  {
    if (!v19)
    {
      v8[2](v8, MKMapRectNull.origin.x, MKMapRectNull.origin.y, MKMapRectNull.size.width, MKMapRectNull.size.height);
      goto LABEL_8;
    }
    v9 = v19;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "composedRoute"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "segmentForStepIndex:", objc_msgSend(v9, "stepIndex")));

    if (objc_msgSend(v9, "routeSegmentType") == (id)5)
    {
      v12.n128_f64[0] = sub_100778658(v9);
LABEL_5:
      ((void (*)(void (**)(_QWORD, double, double, double, double), __n128))v8[2])(v8, v12);
LABEL_6:

      goto LABEL_8;
    }
    if (objc_msgSend(v9, "routeSegmentType") == (id)6)
    {
      if (objc_msgSend(v9, "maneuver") == 3)
      {
        sub_100778E28(v9, v8);
        goto LABEL_6;
      }
      if (objc_msgSend(v9, "maneuver") == 9)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "composedRoute"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getPreviousStep"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "segmentForStepIndex:", objc_msgSend(v16, "stepIndex")));

        -[TransitSteppingCameraFramer _rectForTransitOrWalkingSegment:currentStepIndex:handler:](self, "_rectForTransitOrWalkingSegment:currentStepIndex:handler:", v17, a4, v8);
        goto LABEL_6;
      }
      if (objc_msgSend(v9, "maneuver") == 5 || objc_msgSend(v9, "maneuver") == 4)
        goto LABEL_20;
    }
    else
    {
      if (objc_msgSend(v9, "isArrivalStep"))
      {
        v13 = CLLocationCoordinate2DFromGEOLocationCoordinate2D(objc_msgSend(v9, "endGeoCoordinate"));
        v12.n128_f64[0] = MKMapRectMakeWithRadialDistance(v13, v14, 50.0);
        goto LABEL_5;
      }
      if (objc_msgSend(v9, "routeSegmentType") == (id)2)
      {
LABEL_20:
        -[TransitSteppingCameraFramer _rectForTransitOrWalkingSegment:currentStepIndex:handler:](self, "_rectForTransitOrWalkingSegment:currentStepIndex:handler:", v11, a4, v8);
        goto LABEL_6;
      }
    }
    v18.n128_u64[0] = *(_QWORD *)&MKMapRectNull.origin.x;
    ((void (*)(void (**)(_QWORD, double, double, double, double), __n128))v8[2])(v8, v18);
    goto LABEL_6;
  }
LABEL_8:

}

- (void)_rectForTransitOrWalkingSegment:(id)a3 currentStepIndex:(unint64_t)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MKMapSize size;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  char *i;
  void *v27;
  void *v28;
  MKMapRect *v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  _QWORD v42[4];
  NSObject *v43;
  uint64_t *v44;
  uint64_t v45;
  MKMapRect *v46;
  uint64_t v47;
  const char *v48;
  MKMapPoint origin;
  MKMapSize v50;
  MKMapRect v51;
  MKMapRect v52;

  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      v10 = (unint64_t)objc_msgSend(v7, "startStepIndex") <= a4
         && (unint64_t)objc_msgSend(v7, "endStepIndex") >= a4;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "steps"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "steps"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));

      if (v10)
      {
        if ((char *)objc_msgSend(v14, "stepIndex") - 1 <= (char *)a4)
          a4 = (unint64_t)objc_msgSend(v14, "stepIndex") - 1;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "composedRoute"));
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stepAtIndex:", a4));

        v12 = (void *)v16;
      }
      if (v12 == v14)
      {
        sub_100778E28(v14, v9);
        v12 = v14;
      }
      else
      {
        v45 = 0;
        v46 = (MKMapRect *)&v45;
        v47 = 0x4010000000;
        v48 = "";
        size = MKMapRectNull.size;
        origin = MKMapRectNull.origin;
        v50 = size;
        if (objc_msgSend(v7, "type") == (id)2)
        {
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "previousAlightingStep"));
          v19 = (void *)v18;
          if (v18)
            v20 = (void *)v18;
          else
            v20 = v12;
          v21 = v20;

          v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nextBoardingStep"));
          v23 = (void *)v22;
          if (v22)
            v24 = (void *)v22;
          else
            v24 = v14;
          v25 = v24;

          v14 = v25;
          v12 = v21;
        }
        for (i = (char *)objc_msgSend(v12, "stepIndex"); i < objc_msgSend(v14, "stepIndex"); ++i)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "composedRoute"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stepAtIndex:", i));

          v29 = v46;
          v52.origin.x = sub_100778658(v28);
          v52.origin.y = v30;
          v52.size.width = v31;
          v52.size.height = v32;
          v51 = MKMapRectUnion(v29[1], v52);
          v46[1] = v51;

        }
        v33 = dispatch_group_create();
        dispatch_group_enter(v33);
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_1005020AC;
        v42[3] = &unk_1011B9848;
        v44 = &v45;
        v34 = v33;
        v43 = v34;
        sub_100778E28(v12, v42);
        dispatch_group_enter(v34);
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100502100;
        v39[3] = &unk_1011B9848;
        v41 = &v45;
        v35 = v34;
        v40 = v35;
        sub_100778E28(v14, v39);
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100502154;
        v36[3] = &unk_1011AE540;
        v37 = v9;
        v38 = &v45;
        dispatch_group_notify(v35, (dispatch_queue_t)&_dispatch_main_q, v36);

        _Block_object_dispose(&v45, 8);
      }

    }
    else
    {
      (*((void (**)(id, double, double, double, double))v8 + 2))(v8, MKMapRectNull.origin.x, MKMapRectNull.origin.y, MKMapRectNull.size.width, MKMapRectNull.size.height);
    }
  }

}

@end
