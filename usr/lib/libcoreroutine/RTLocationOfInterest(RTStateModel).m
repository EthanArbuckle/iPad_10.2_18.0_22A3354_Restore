@implementation RTLocationOfInterest(RTStateModel)

- (id)initWithOneState:()RTStateModel
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  double v63;
  double v64;
  uint64_t v65;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v60 = a1;
    objc_msgSend(v4, "stateDepiction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "Latitude_deg");
    v9 = v8;

    objc_msgSend(v5, "stateDepiction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "Longitude_deg");
    v13 = v12;

    objc_msgSend(v5, "stateDepiction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uncertainty_m");
    v17 = v16;

    objc_msgSend(v5, "stateDepiction");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "location");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "referenceFrame");

    objc_msgSend(v5, "stateDepiction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "mapItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "source") & 0xC;

    if (v23)
    {
      objc_msgSend(v5, "stateDepiction");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "mapItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "location");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "latitude");
      v9 = v27;

      objc_msgSend(v5, "stateDepiction");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "mapItem");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "location");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "longitude");
      v13 = v31;

      objc_msgSend(v5, "stateDepiction");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "mapItem");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "location");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v34, "referenceFrame");

    }
    objc_msgSend(v5, "stateDepiction");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "getRecentVisits:", 0.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v36;
    if (objc_msgSend(v36, "count"))
    {
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v36, "count"));
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __55__RTLocationOfInterest_RTStateModel__initWithOneState___block_invoke;
      v61[3] = &unk_1E92A2BC0;
      v63 = v9;
      v64 = v13;
      v65 = v17;
      v59 = v37;
      v62 = v59;
      objc_msgSend(v36, "enumerateObjectsUsingBlock:", v61);

    }
    else
    {
      v59 = 0;
    }
    v39 = objc_alloc(MEMORY[0x1E0D183B0]);
    objc_msgSend(v5, "stateDepiction");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "location");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "uncertainty_m");
    v54 = (void *)objc_msgSend(v39, "initWithLatitude:longitude:horizontalUncertainty:date:referenceFrame:", 0, v20, v9, v13, v42);

    objc_msgSend(v5, "stateDepiction");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "location");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "confidence");
    v44 = v43;
    objc_msgSend(v5, "uniqueId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stateDepiction");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v55, "type");
    objc_msgSend(v5, "stateDepiction");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "typeSource");
    objc_msgSend(v5, "stateDepiction");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "customLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stateDepiction");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "mapItem");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = (id)objc_msgSend(v60, "initWithLocation:confidence:identifier:type:typeSource:visits:customLabel:mapItem:", v54, v45, v46, v48, v59, v50, v44, v52);

    v38 = a1;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

@end
