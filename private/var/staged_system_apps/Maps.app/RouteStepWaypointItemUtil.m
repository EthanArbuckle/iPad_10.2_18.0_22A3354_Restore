@implementation RouteStepWaypointItemUtil

+ (id)attributedSubtitleForLeg:(id)a3 waypoint:(id)a4 isOrigin:(BOOL)a5 attributes:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (a5)
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originListSecondaryInstructions"));
  else
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "destinationListSecondaryInstructions"));
  v13 = v12;
  if (objc_msgSend(v12, "count"))
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100657778;
    v22[3] = &unk_1011B8980;
    v23 = v9;
    v24 = v10;
    v25 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_geo_compactMap:", v22));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1006577FC;
    v19[3] = &unk_1011BF080;
    v20 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", &stru_1011EB268);
    v21 = v14;
    v15 = v14;
    v16 = v20;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v19);
    v17 = objc_msgSend(v16, "copy");

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
