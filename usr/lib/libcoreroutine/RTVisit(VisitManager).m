@implementation RTVisit(VisitManager)

- (uint64_t)initWithDefaultsDictionanry:()VisitManager
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("VisitIncidentDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D18578];
  objc_msgSend(v4, "objectForKey:", CFSTR("VisitIncidentType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "visitIncidentTypeFromString:", v7);

  objc_msgSend(v4, "objectForKey:", CFSTR("Latitude"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v4, "objectForKey:", CFSTR("Longitude"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v4, "objectForKey:", CFSTR("Uncertainty"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithLatitude:longitude:horizontalUncertainty:date:", v5, v11, v14, v17);
  objc_msgSend(v4, "objectForKey:", CFSTR("VisitIncidentEntryDate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("VisitIncidentExitDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("Confidence"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  v24 = objc_msgSend(a1, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", v5, v8, v18, v19, v20, 0, v23, 0);
  return v24;
}

@end
