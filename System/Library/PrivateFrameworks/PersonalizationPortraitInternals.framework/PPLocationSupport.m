@implementation PPLocationSupport

+ (id)streetAddressOfLocation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "placemark");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thoroughfare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placemark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "subThoroughfare");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPNamedEntitySupport streetAddressFromThoroughfare:subThoroughfare:](PPNamedEntitySupport, "streetAddressFromThoroughfare:subThoroughfare:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fullAddressOfLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(a1, "streetAddressOfLocation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placemark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locality");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placemark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "administrativeArea");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placemark");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postalCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placemark");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "country");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPNamedEntitySupport fullAddressForStreetAddress:city:state:postalCode:country:](PPNamedEntitySupport, "fullAddressForStreetAddress:city:state:postalCode:country:", v5, v7, v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)mapTitleForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "placemark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "placemark");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
  }
  else
  {
    objc_msgSend(a1, "streetAddressOfLocation:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (BOOL)fuzzyMatchingLocations:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v88;

  v5 = a3;
  v6 = a4;
  if (v5 == v6)
  {
    v16 = 1;
    goto LABEL_42;
  }
  objc_msgSend(v5, "placemark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

LABEL_8:
    objc_msgSend(v5, "placemark");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postalCode");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      objc_msgSend(v6, "placemark");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "postalCode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v5, "placemark");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "postalCode");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "placemark");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "postalCode");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v23, "caseInsensitiveCompare:", v25);

        if (v26)
          goto LABEL_41;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "placemark");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "country");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;
      objc_msgSend(v6, "placemark");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "country");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        objc_msgSend(v5, "placemark");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "country");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "placemark");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "country");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v33, "caseInsensitiveCompare:", v35);

        if (v36)
          goto LABEL_41;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "placemark");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "locality");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v39 = (void *)v38;
      objc_msgSend(v6, "placemark");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "locality");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        objc_msgSend(v5, "placemark");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "locality");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "placemark");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "locality");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v43, "caseInsensitiveCompare:", v45);

        if (v46)
          goto LABEL_41;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "placemark");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "subLocality");
    v48 = objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v49 = (void *)v48;
      objc_msgSend(v6, "placemark");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "subLocality");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        objc_msgSend(v5, "placemark");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "subLocality");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "placemark");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "subLocality");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v53, "caseInsensitiveCompare:", v55);

        if (v56)
          goto LABEL_41;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "placemark");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "thoroughfare");
    v58 = objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      v59 = (void *)v58;
      objc_msgSend(v6, "placemark");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "thoroughfare");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (v61)
      {
        objc_msgSend(v5, "placemark");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "thoroughfare");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "placemark");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "thoroughfare");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v63, "caseInsensitiveCompare:", v65);

        if (v66)
          goto LABEL_41;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "placemark");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "subThoroughfare");
    v68 = objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      v69 = (void *)v68;
      objc_msgSend(v6, "placemark");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "subThoroughfare");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v71)
      {
        objc_msgSend(v5, "placemark");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "subThoroughfare");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "placemark");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "subThoroughfare");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v73, "caseInsensitiveCompare:", v75);

        if (v76)
          goto LABEL_41;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "placemark");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "administrativeArea");
    v78 = objc_claimAutoreleasedReturnValue();
    if (v78)
    {
      v79 = (void *)v78;
      objc_msgSend(v6, "placemark");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "administrativeArea");
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      if (v81)
      {
        objc_msgSend(v5, "placemark");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "administrativeArea");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "placemark");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "administrativeArea");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend(v83, "caseInsensitiveCompare:", v85);

        if (v86)
        {
LABEL_41:
          v16 = 0;
          goto LABEL_42;
        }
      }
    }
    else
    {

    }
    +[PPLocationSupport fullAddressOfLocation:](PPLocationSupport, "fullAddressOfLocation:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPLocationSupport fullAddressOfLocation:](PPLocationSupport, "fullAddressOfLocation:", v6);
    v88 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v88;
    v16 = 0;
    if (v12 && v88)
      v16 = objc_msgSend(v12, "caseInsensitiveCompare:", v88) == 0;
    goto LABEL_5;
  }
  v9 = (void *)v8;
  objc_msgSend(v6, "placemark");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_8;
  objc_msgSend(v5, "placemark");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placemark");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "caseInsensitiveCompare:", v15) == 0;

LABEL_5:
LABEL_42:

  return v16;
}

+ (id)locationFromThoroughfare:(id)a3 subThoroughfare:(id)a4 locality:(id)a5 subLocality:(id)a6 administrativeArea:(id)a7 postalCode:(id)a8 category:(unsigned __int16)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("Thoroughfare"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, CFSTR("SubThoroughfare"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, CFSTR("City"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, CFSTR("SubLocality"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v15, CFSTR("State"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, CFSTR("ZIP"));
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3F0]), "initWithLocation:addressDictionary:region:areasOfInterest:", 0, v20, 0, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B78]), "initWithPlacemark:category:mostRelevantRecord:", v21, a9, 0);

  return v22;
}

@end
