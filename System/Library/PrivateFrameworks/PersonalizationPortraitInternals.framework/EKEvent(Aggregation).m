@implementation EKEvent(Aggregation)

- (uint64_t)pp_suggestedCategory
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(a1, "customObjectForKey:", *MEMORY[0x1E0D70F30]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v2);
  if (v3)
    v4 = objc_msgSend(MEMORY[0x1E0D70B30], "suggestedEventCategoryFromMetadata:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)pp_locationString
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint8_t v65[16];

  v2 = (void *)MEMORY[0x1C3BD6630]();
  switch(objc_msgSend(a1, "pp_suggestedCategory"))
  {
    case 1u:
      objc_msgSend(a1, "structuredLocation");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "title");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)v4;
        objc_msgSend(a1, "structuredLocation");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "title");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "length");

        if (v8)
          goto LABEL_28;
      }
      else
      {

      }
      objc_msgSend(a1, "pp_airports");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "second");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v53)
        goto LABEL_35;
      objc_msgSend(v53, "name");
      v56 = objc_claimAutoreleasedReturnValue();
      if (!v56)
        goto LABEL_35;
      v57 = (void *)v56;
      objc_msgSend(v53, "name");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "length");

      if (v59)
      {
        objc_msgSend(v53, "name");
        v54 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_35:
        objc_msgSend(v53, "iataCode");
        v54 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_29;
    case 2u:
      objc_msgSend(a1, "structuredLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "title");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(a1, "structuredLocation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "length");

        if (v14)
          goto LABEL_28;
      }
      else
      {

      }
      objc_msgSend(a1, "pp_foodReservationTitle");
      v60 = objc_claimAutoreleasedReturnValue();
      goto LABEL_50;
    case 3u:
      objc_msgSend(a1, "structuredLocation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "title");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        objc_msgSend(a1, "structuredLocation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "title");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "length");

        if (v20)
          goto LABEL_28;
      }
      else
      {

      }
      objc_msgSend(a1, "pp_trainReservationTitle");
      v60 = objc_claimAutoreleasedReturnValue();
      goto LABEL_50;
    case 4u:
      objc_msgSend(a1, "structuredLocation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "title");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        objc_msgSend(a1, "structuredLocation");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "title");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "length");

        if (v26)
          goto LABEL_28;
      }
      else
      {

      }
      objc_msgSend(a1, "pp_busReservationTitle");
      v60 = objc_claimAutoreleasedReturnValue();
      goto LABEL_50;
    case 5u:
      objc_msgSend(a1, "structuredLocation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "title");
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = (void *)v28;
        objc_msgSend(a1, "structuredLocation");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "title");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "length");

        if (v32)
          goto LABEL_28;
      }
      else
      {

      }
      objc_msgSend(a1, "pp_boatReservationTitle");
      v60 = objc_claimAutoreleasedReturnValue();
      goto LABEL_50;
    case 6u:
      objc_msgSend(a1, "structuredLocation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "title");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v35 = (void *)v34;
        objc_msgSend(a1, "structuredLocation");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "title");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "length");

        if (v38)
          goto LABEL_28;
      }
      else
      {

      }
      objc_msgSend(a1, "pp_carRentalPickupReservationTitle");
      v60 = objc_claimAutoreleasedReturnValue();
      goto LABEL_50;
    case 7u:
      objc_msgSend(a1, "structuredLocation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "title");
      v40 = objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v41 = (void *)v40;
        objc_msgSend(a1, "structuredLocation");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "title");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "length");

        if (v44)
          goto LABEL_28;
      }
      else
      {

      }
      objc_msgSend(a1, "pp_carRentalDropoffReservationTitle");
      v60 = objc_claimAutoreleasedReturnValue();
      goto LABEL_50;
    case 0xAu:
      objc_msgSend(a1, "structuredLocation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "title");
      v48 = objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        v49 = (void *)v48;
        objc_msgSend(a1, "structuredLocation");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "title");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "length");

        if (v52)
        {
LABEL_28:
          objc_msgSend(a1, "structuredLocation");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "title");
          v54 = objc_claimAutoreleasedReturnValue();
LABEL_29:
          v46 = (void *)v54;

          goto LABEL_51;
        }
      }
      else
      {

      }
      objc_msgSend(a1, "pp_lodgingName");
      v60 = objc_claimAutoreleasedReturnValue();
LABEL_50:
      v46 = (void *)v60;
LABEL_51:
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "componentsSeparatedByCharactersInSet:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "_pas_componentsJoinedByString:", CFSTR(" "));
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v2);
      return v63;
    default:
      pp_default_log_handle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v65 = 0;
        _os_log_fault_impl(&dword_1C392E000, v45, OS_LOG_TYPE_FAULT, "[EKEvent+Aggregation pp_location] Dealing with an unexpected PPSuggestedEventCategory", v65, 2u);
      }

      v46 = 0;
      goto LABEL_51;
  }
}

- (BOOL)pp_isConnectionFromFlight:()Aggregation
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;

  v4 = a3;
  if ((objc_msgSend(a1, "isEqual:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(a1, "pp_airports");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pp_airports");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "second");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "first");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToPPFlightAirport:", v10);

    if ((v11 & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v4, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "endDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v13);
      v15 = v14;

      if (v15 <= 5184000.0)
      {
        objc_msgSend(a1, "endLocation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "geoLocation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "structuredLocation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "geoLocation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = 0;
        if (v17)
        {
          if (v19)
          {
            objc_msgSend(v17, "distanceFromLocation:", v19);
            if (v20 < 100000.0)
              v5 = 1;
          }
        }

      }
      else
      {
        v5 = 0;
      }
    }

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (id)pp_airports
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PPFlightAirport *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PPFlightAirport *v29;
  void *v30;
  void *v32;

  v2 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(a1, "customObjectForKey:", *MEMORY[0x1E0D70F30]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SGEventMetadataSchemaOrgKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "count"))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("departureAirport"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("iataCode"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9 || !objc_msgSend(v9, "length"))
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("reservationFor"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("departureAirportCode"));
        v12 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v12;
      }
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("departureAirport"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("name"));
      v16 = objc_claimAutoreleasedReturnValue();

      v32 = (void *)v16;
      v17 = -[PPFlightAirport initWithName:iataCode:role:]([PPFlightAirport alloc], "initWithName:iataCode:role:", v16, v9, 0);
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("iataCode"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21 || !objc_msgSend(v21, "length"))
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("reservationFor"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("arrivalAirportCode"));
        v24 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v24;
      }
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("name"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = -[PPFlightAirport initWithName:iataCode:role:]([PPFlightAirport alloc], "initWithName:iataCode:role:", v28, v21, 1);
      objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v17, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v30;
}

- (uint64_t)pp_isDupeOfFlightEvent:()Aggregation
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  objc_msgSend(a1, "pp_airports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iataCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pp_airports");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "first");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iataCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", v10))
  {

    goto LABEL_6;
  }
  v21 = a1;
  objc_msgSend(a1, "pp_airports");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "second");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iataCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pp_airports");
  v25 = v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "second");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "iataCode");
  v24 = v5;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v12, "isEqualToString:", v15);

  v4 = v25;
  if (v22)
  {
    objc_msgSend(v21, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "startDate");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v5 != (void *)v16)
    {
      v6 = (void *)v16;
LABEL_6:

      goto LABEL_7;
    }
    objc_msgSend(v21, "endDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 == v20)
    {
      v17 = 1;
      goto LABEL_8;
    }
  }
LABEL_7:
  v17 = 0;
LABEL_8:

  return v17;
}

- (uint64_t)pp_isDupeOfEvent:()Aggregation forCategory:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = v6;
  if (a4 != 1)
  {
    objc_msgSend(v6, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    if (v11 <= 86400.0)
    {
      objc_msgSend(v7, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "endDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v13);
      v15 = v14;

      if (v15 <= 86400.0)
      {
        -[EKEvent pp_eventNameForCategory:](a1, a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKEvent pp_eventNameForCategory:](v7, a4);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v16 && v17 && (objc_msgSend(v16, "isEqualToString:", v17) & 1) != 0)
        {

          v8 = 1;
          goto LABEL_12;
        }

      }
    }
    else
    {

    }
    v8 = 0;
    goto LABEL_12;
  }
  v8 = objc_msgSend(a1, "pp_isDupeOfFlightEvent:", v6);
LABEL_12:

  return v8;
}

- (id)pp_lodgingName
{
  return -[EKEvent pp_eventNameForCategory:](a1, 10);
}

- (uint64_t)pp_isDupeOfLodgingEvent:()Aggregation
{
  return objc_msgSend(a1, "pp_isDupeOfEvent:forCategory:", a3, 10);
}

- (id)pp_boatReservationTitle
{
  return -[EKEvent pp_eventNameForCategory:](a1, 5);
}

- (uint64_t)pp_isDupeOfBusEvent:()Aggregation
{
  return objc_msgSend(a1, "pp_isDupeOfEvent:forCategory:", a3, 4);
}

- (id)pp_busReservationTitle
{
  return -[EKEvent pp_eventNameForCategory:](a1, 4);
}

- (uint64_t)pp_isDupeOfBoatEvent:()Aggregation
{
  return objc_msgSend(a1, "pp_isDupeOfEvent:forCategory:", a3, 5);
}

- (id)pp_trainReservationTitle
{
  return -[EKEvent pp_eventNameForCategory:](a1, 3);
}

- (uint64_t)pp_isDupeOfTrainEvent:()Aggregation
{
  return objc_msgSend(a1, "pp_isDupeOfEvent:forCategory:", a3, 3);
}

- (id)pp_carRentalPickupReservationTitle
{
  return -[EKEvent pp_eventNameForCategory:](a1, 6);
}

- (uint64_t)pp_isDupeOfCarRentalPickupEvent:()Aggregation
{
  return objc_msgSend(a1, "pp_isDupeOfEvent:forCategory:", a3, 6);
}

- (id)pp_carRentalDropoffReservationTitle
{
  return -[EKEvent pp_eventNameForCategory:](a1, 7);
}

- (uint64_t)pp_isDupeOfCarRentalDropoffEvent:()Aggregation
{
  return objc_msgSend(a1, "pp_isDupeOfEvent:forCategory:", a3, 7);
}

- (id)pp_foodReservationTitle
{
  return -[EKEvent pp_eventNameForCategory:](a1, 2);
}

- (uint64_t)pp_isDupeOfFoodEvent:()Aggregation
{
  return objc_msgSend(a1, "pp_isDupeOfEvent:forCategory:", a3, 2);
}

@end
