@implementation CPManeuver

- (id)_maps_description
{
  CPManeuver *v2;
  CPManeuver *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __CFString *v51;
  _QWORD v52[13];

  v2 = self;
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if ((objc_opt_respondsToSelector(v3, "accessibilityIdentifier") & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPManeuver performSelector:](v3, "performSelector:", "accessibilityIdentifier"));
      v8 = v7;
      if (v7 && !objc_msgSend(v7, "isEqualToString:", v6))
      {
        v9 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v6, v3, v8));

        goto LABEL_7;
      }

    }
    v9 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v6, v3));
LABEL_7:

    goto LABEL_9;
  }
  v9 = CFSTR("<nil>");
LABEL_9:

  v52[0] = v9;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    index: %d"), -[CPManeuver index](v3, "index")));
  v52[1] = v50;
  v10 = NSStringFromCPManeuverType(-[CPManeuver maneuverType](v3, "maneuverType"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    maneuverType: %@"), v49));
  v52[2] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CPManeuver instructionVariants](v3, "instructionVariants"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "componentsJoinedByString:", CFSTR(" | ")));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    instructionVariants: %@"), v46));
  v52[3] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CPManeuver attributedInstructionVariants](v3, "attributedInstructionVariants"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "componentsJoinedByString:", CFSTR(" | ")));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    attributedInstructionVariants: %@"), v43));
  v52[4] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CPManeuver roadFollowingManeuverVariants](v3, "roadFollowingManeuverVariants"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "componentsJoinedByString:", CFSTR(" | ")));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    roadFollowingManeuverVariants: %@"), v40));
  v52[5] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CPManeuver initialTravelEstimates](v3, "initialTravelEstimates"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "distanceRemaining"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CPManeuver initialTravelEstimates](v3, "initialTravelEstimates"));
  objc_msgSend(v36, "timeRemaining");
  v37 = (void *)v11;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    initialTravelEstimates: %@, %0.1fs"), v11, v12));
  v52[6] = v35;
  v13 = NSStringFromCPTrafficSide(-[CPManeuver trafficSide](v3, "trafficSide"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    trafficSide: %@"), v34));
  v52[7] = v33;
  v14 = NSStringFromCPJunctionType(-[CPManeuver junctionType](v3, "junctionType"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    junctionType: %@"), v32));
  v52[8] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CPManeuver junctionElementAngles](v3, "junctionElementAngles"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "allObjects"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "valueForKey:", CFSTR("doubleValue")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "componentsJoinedByString:", CFSTR(", ")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    junctionElementAngles: %@"), v15));
  v52[9] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPManeuver junctionExitAngle](v3, "junctionExitAngle"));
  v51 = (__CFString *)v9;
  if (v17)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CPManeuver junctionExitAngle](v3, "junctionExitAngle"));
    objc_msgSend(v27, "doubleValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  }
  else
  {
    v18 = 0;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    junctionExitAngle: %@"), v18));
  v52[10] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CPManeuver exitInfo](v3, "exitInfo"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    exitInfo: %@"), v20));
  v52[11] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CPManeuver symbolImage](v3, "symbolImage"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("    symbolImage: %@"), v22));
  v52[12] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v52, 13));

  if (v17)
  {

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n")));

  return v25;
}

@end
