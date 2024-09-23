@implementation NSLayoutXAxisAnchor

- (id)_maps_constraintWithRHDAnchor:(id)a3 relation:(int64_t)a4 constant:(double)a5 priority:(float)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  unsigned __int8 v19;
  double v20;
  uint64_t v21;
  void *v22;

  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutXAxisAnchor item](self, "item"));
  v12 = objc_opt_class(UIView);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    v13 = v11;
  else
    v13 = 0;
  v14 = v13;

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
    if (objc_msgSend(v15, "_car_isHybridInstrumentCluster"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
      v17 = objc_msgSend(v16, "_car_hybridInstrumentClusterAlignment") == (id)2;

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v19 = objc_msgSend(v18, "rightHandDrive");

  if ((v19 & 1) == 0 && !v17)
    goto LABEL_14;
  a5 = -a5;
  if (a4 == -1)
    goto LABEL_18;
  if (a4 != 1)
  {
LABEL_14:
    if (a4 != 1)
    {
      if (!a4)
      {
        v21 = objc_claimAutoreleasedReturnValue(-[NSLayoutXAxisAnchor constraintEqualToAnchor:constant:](self, "constraintEqualToAnchor:constant:", v10, a5));
        goto LABEL_20;
      }
      if (a4 != -1)
      {
        v22 = 0;
        goto LABEL_21;
      }
      goto LABEL_17;
    }
LABEL_18:
    v21 = objc_claimAutoreleasedReturnValue(-[NSLayoutXAxisAnchor constraintGreaterThanOrEqualToAnchor:constant:](self, "constraintGreaterThanOrEqualToAnchor:constant:", v10, a5));
    goto LABEL_20;
  }
LABEL_17:
  v21 = objc_claimAutoreleasedReturnValue(-[NSLayoutXAxisAnchor constraintLessThanOrEqualToAnchor:constant:](self, "constraintLessThanOrEqualToAnchor:constant:", v10, a5));
LABEL_20:
  v22 = (void *)v21;
LABEL_21:
  *(float *)&v20 = a6;
  objc_msgSend(v22, "setPriority:", v20);

  return v22;
}

@end
