@implementation TransitRouteStepCell

+ (id)cellWithRoute:(id)a3 sign:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithRoute:sign:", v7, v6);

  return v8;
}

- (TransitRouteStepCell)initWithRoute:(id)a3 sign:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  TransitRouteStepCell *v10;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteStepCell sign](self, "sign"));
  v9 = -[TransitRouteStepCell signIndexForSign:](self, "signIndexForSign:", v8);

  v12.receiver = self;
  v12.super_class = (Class)TransitRouteStepCell;
  v10 = -[RouteStepCell initWithRoute:stepIndex:mapType:](&v12, "initWithRoute:stepIndex:mapType:", v7, v9, 104);

  if (v10)
    -[TransitRouteStepCell setSign:](v10, "setSign:", v6);

  return v10;
}

- (TransitSteppingCameraFramer)cameraFramer
{
  TransitSteppingCameraFramer *cameraFramer;
  TransitSteppingCameraFramer *v4;
  TransitSteppingCameraFramer *v5;

  cameraFramer = self->_cameraFramer;
  if (!cameraFramer)
  {
    v4 = objc_alloc_init(TransitSteppingCameraFramer);
    v5 = self->_cameraFramer;
    self->_cameraFramer = v4;

    cameraFramer = self->_cameraFramer;
  }
  return cameraFramer;
}

- (id)routeStep
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteStepCell sign](self, "sign"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "step"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteStepCell sign](self, "sign"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "step"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepCell route](self, "route"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteStepCell sign](self, "sign"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stepAtIndex:", objc_msgSend(v7, "stepIndexRange")));

  }
  return v6;
}

- (int64_t)signIndexForSign:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "step"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "step"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "segment"));

    if (!v7)
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_6;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "segment"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "steps"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

  }
  v10 = -[TransitRouteStepCell signIndexForStepIndex:](self, "signIndexForStepIndex:", objc_msgSend(v6, "stepIndex"));

LABEL_6:
  return v10;
}

- (int64_t)signIndexForStepIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepCell route](self, "route"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "steppingSigns"));
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = 0;
  while (1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepCell route](self, "route"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "steppingSigns"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v8));

    v12 = objc_msgSend(v11, "stepIndexRange");
    v14 = v13;

    if (a3 >= (unint64_t)v12 && a3 - (uint64_t)v12 < v14)
      break;
    ++v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepCell route](self, "route"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "steppingSigns"));
    v17 = objc_msgSend(v16, "count");

    if (v8 >= (unint64_t)v17)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v8;
}

- (unint64_t)numberOfSteps
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steppingSigns](self->super._route, "steppingSigns"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (id)instructionStringsArray
{
  id v3;
  void *v4;
  unsigned int v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSAttributedStringKey v27;
  void *v28;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteStepCell sign](self, "sign"));
  v5 = objc_msgSend(v4, "hasValidInstructions");

  if (v5)
  {
    v27 = NSFontAttributeName;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.5));
    v28 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteStepCell sign](self, "sign"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "majorFormattedInstruction"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteStepCell sign](self, "sign"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "majorFormattedInstruction"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedStringForComposedString:defaultAttributes:](NSAttributedString, "_mapkit_attributedStringForComposedString:defaultAttributes:", v11, v7));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "string"));

      if (v13)
        objc_msgSend(v3, "addObject:", v13);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteStepCell sign](self, "sign"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "minorFormattedInstruction"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteStepCell sign](self, "sign"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "minorFormattedInstruction"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedStringForComposedString:defaultAttributes:](NSAttributedString, "_mapkit_attributedStringForComposedString:defaultAttributes:", v17, v7));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "string"));

      if (v19)
        objc_msgSend(v3, "addObject:", v19);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteStepCell sign](self, "sign"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tertiaryFormattedInstruction"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitRouteStepCell sign](self, "sign"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tertiaryFormattedInstruction"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString _mapkit_attributedStringForComposedString:defaultAttributes:](NSAttributedString, "_mapkit_attributedStringForComposedString:defaultAttributes:", v23, v7));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "string"));

      if (v25)
        objc_msgSend(v3, "addObject:", v25);

    }
  }
  return v3;
}

- (id)snapshotBlock
{
  id v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100690EC4;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  v2 = objc_msgSend(v4, "copy");
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (TransitSegmentSteppingModeSign)sign
{
  return self->_sign;
}

- (void)setSign:(id)a3
{
  objc_storeStrong((id *)&self->_sign, a3);
}

- (void)setCameraFramer:(id)a3
{
  objc_storeStrong((id *)&self->_cameraFramer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraFramer, 0);
  objc_storeStrong((id *)&self->_sign, 0);
}

@end
