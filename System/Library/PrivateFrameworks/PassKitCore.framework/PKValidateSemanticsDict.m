@implementation PKValidateSemanticsDict

void ___PKValidateSemanticsDict_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t i;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  int v120;
  int v121;
  char v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t j;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  NSObject *v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  uint8_t buf[4];
  id v153;
  _BYTE v154[128];
  _BYTE v155[128];
  uint64_t v156;

  v156 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 32))
      PKValidationErrorWithReason(CFSTR("Key \"%@\" for semantics of field \"%@\" is not a string"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    else
      PKValidationErrorWithReason(CFSTR("Key \"%@\" for additionalSemanitcs is not a string"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

    *a4 = 1;
    goto LABEL_67;
  }
  v16 = v7;
  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("departureLocationDescription")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("destinationLocationDescription")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("transitProvider")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("vehicleName")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("vehicleNumber")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("vehicleType")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("boardingGroup")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("boardingSequenceNumber")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("confirmationNumber")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("transitStatus")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("transitStatusReason")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("membershipProgramName")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("membershipProgramNumber")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("priorityStatus")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("securityScreening")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("flightCode")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("airlineCode")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("departureAirportCode")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("departureAirportName")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("departureTerminal")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("departureGate")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("destinationAirportCode")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("destinationAirportName")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("destinationTerminal")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("destinationGate")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("departurePlatform")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("departureStationName")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("destinationPlatform")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("destinationStationName")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("carNumber")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("eventName")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("venueName")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("venueEntrance")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("venueRoom")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("venuePhoneNumber")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("leagueName")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("leagueAbbreviation")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("homeTeamLocation")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("homeTeamName")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("homeTeamAbbreviation")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("awayTeamLocation")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("awayTeamName")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("awayTeamAbbreviation")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("sportName")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("genre")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("eventLiveMessage")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("admissionLevel")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("admissionLevelAbbreviation")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("attendeeName")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("venueRegionName")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("entranceDescription")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("venueEntranceGate")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("venueEntranceDoor")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("venueEntrancePortal")) & 1) != 0
    || objc_msgSend(v16, "isEqualToString:", CFSTR("additionalTicketAttributes")))
  {

    goto LABEL_58;
  }
  v30 = objc_msgSend(v16, "isEqualToString:", CFSTR("eventType"));

  if (!v30)
  {
    v31 = v16;
    if ((objc_msgSend(v31, "isEqualToString:", CFSTR("originalDepartureDate")) & 1) != 0
      || (objc_msgSend(v31, "isEqualToString:", CFSTR("currentDepartureDate")) & 1) != 0
      || (objc_msgSend(v31, "isEqualToString:", CFSTR("originalArrivalDate")) & 1) != 0
      || (objc_msgSend(v31, "isEqualToString:", CFSTR("currentArrivalDate")) & 1) != 0
      || (objc_msgSend(v31, "isEqualToString:", CFSTR("originalBoardingDate")) & 1) != 0
      || (objc_msgSend(v31, "isEqualToString:", CFSTR("currentBoardingDate")) & 1) != 0
      || (objc_msgSend(v31, "isEqualToString:", CFSTR("eventStartDate")) & 1) != 0
      || (objc_msgSend(v31, "isEqualToString:", CFSTR("venueDoorsOpenDate")) & 1) != 0
      || (objc_msgSend(v31, "isEqualToString:", CFSTR("venueGatesOpenDate")) & 1) != 0
      || (objc_msgSend(v31, "isEqualToString:", CFSTR("venueParkingLotsOpenDate")) & 1) != 0
      || (objc_msgSend(v31, "isEqualToString:", CFSTR("venueBoxOfficeOpenDate")) & 1) != 0
      || (objc_msgSend(v31, "isEqualToString:", CFSTR("venueFanZoneOpenDate")) & 1) != 0
      || (objc_msgSend(v31, "isEqualToString:", CFSTR("venueOpenDate")) & 1) != 0
      || objc_msgSend(v31, "isEqualToString:", CFSTR("venueCloseDate")))
    {

LABEL_84:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        PKValidationErrorWithReason(CFSTR("Value \"%@\" for semantic key \"%@\" is not a string, must be a date string"), v32, v33, v34, v35, v36, v37, v38, (uint64_t)v8);
        goto LABEL_60;
      }
      _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v8, 0, 0);
      v46 = (id)objc_claimAutoreleasedReturnValue();
      if (!v46)
      {
        PKValidationErrorWithReason(CFSTR("Value \"%@\" for semantic key \"%@\" is not a valid date string"), v39, v40, v41, v42, v43, v44, v45, (uint64_t)v8);
LABEL_87:
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v49 = *(void **)(v48 + 40);
        *(_QWORD *)(v48 + 40) = v47;

      }
LABEL_88:

      goto LABEL_67;
    }
    v50 = objc_msgSend(v31, "isEqualToString:", CFSTR("eventEndDate"));

    if (v50)
      goto LABEL_84;
    if (objc_msgSend(v31, "isEqualToString:", CFSTR("eventStartDateInfo")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v58 = v8;
        v59 = objc_opt_class();
        _PKVerifyDictionaryKey(v58, CFSTR("date"), 1, v59, 0);
        v60 = objc_claimAutoreleasedReturnValue();
        if (!v60)
        {
          v61 = objc_opt_class();
          _PKVerifyDictionaryKey(v58, CFSTR("timeZone"), 1, v61, 0);
          v60 = objc_claimAutoreleasedReturnValue();
          if (!v60)
          {
            v62 = objc_opt_class();
            _PKVerifyDictionaryKey(v58, CFSTR("ignoreTimeComponents"), 1, v62, 0);
            v60 = objc_claimAutoreleasedReturnValue();
          }
        }

        v63 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v26 = *(void **)(v63 + 40);
        *(_QWORD *)(v63 + 40) = v60;
        goto LABEL_62;
      }
      PKValidationErrorWithReason(CFSTR("Value \"%@\" for semantic key \"%@\" is not a dictionary, must be a event info dictionary"), v51, v52, v53, v54, v55, v56, v57, (uint64_t)v8);
      goto LABEL_60;
    }
    v64 = v31;
    if ((objc_msgSend(v64, "isEqualToString:", CFSTR("departureLocation")) & 1) != 0
      || objc_msgSend(v64, "isEqualToString:", CFSTR("destinationLocation")))
    {

LABEL_102:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        PKValidateLocationDictionary(v8);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_61;
      }
      PKValidationErrorWithReason(CFSTR("Value \"%@\" for semantic key \"%@\" is not a dictionary, must be a location dictionary"), v66, v67, v68, v69, v70, v71, v72, (uint64_t)v8);
LABEL_60:
      v24 = objc_claimAutoreleasedReturnValue();
LABEL_61:
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;
LABEL_62:

      goto LABEL_67;
    }
    v65 = objc_msgSend(v64, "isEqualToString:", CFSTR("venueLocation"));

    if (v65)
      goto LABEL_102;
    v73 = v64;
    if (objc_msgSend(v73, "isEqualToString:", CFSTR("balance")))
    {

LABEL_108:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        _PKValidateCurrencyAmountDictionary(v8, v73);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_61;
      }
      PKValidationErrorWithReason(CFSTR("Value \"%@\" for semantic key \"%@\" is not a dictionary, must be a currency amount dictionary"), v75, v76, v77, v78, v79, v80, v81, (uint64_t)v8);
      goto LABEL_60;
    }
    v74 = objc_msgSend(v73, "isEqualToString:", CFSTR("balance"));

    if (v74)
      goto LABEL_108;
    if (objc_msgSend(v73, "isEqualToString:", CFSTR("passengerName")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_67;
      PKValidationErrorWithReason(CFSTR("Value \"%@\" for semantic key \"%@\" is not a dictionary, must be a person name components dictionary"), v82, v83, v84, v85, v86, v87, v88, (uint64_t)v8);
      goto LABEL_60;
    }
    v89 = v73;
    if ((objc_msgSend(v89, "isEqualToString:", CFSTR("flightNumber")) & 1) != 0
      || (objc_msgSend(v89, "isEqualToString:", CFSTR("duration")) & 1) != 0
      || objc_msgSend(v89, "isEqualToString:", CFSTR("tailgatingAllowed")))
    {

LABEL_119:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_67;
      PKValidationErrorWithReason(CFSTR("Value \"%@\" for semantic key \"%@\" is not a number."), v91, v92, v93, v94, v95, v96, v97, (uint64_t)v8);
      goto LABEL_60;
    }
    v90 = objc_msgSend(v89, "isEqualToString:", CFSTR("silenceRequested"));

    if (v90)
      goto LABEL_119;
    v98 = v89;
    if ((objc_msgSend(v98, "isEqualToString:", CFSTR("artistIDs")) & 1) != 0
      || (objc_msgSend(v98, "isEqualToString:", CFSTR("performerNames")) & 1) != 0
      || objc_msgSend(v98, "isEqualToString:", CFSTR("albumIDs")))
    {

LABEL_126:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        PKValidationErrorWithReason(CFSTR("Value \"%@\" for semantic key \"%@\" is not an array, must be an array of strings."), v100, v101, v102, v103, v104, v105, v106, (uint64_t)v8);
        goto LABEL_60;
      }
      v150 = 0u;
      v151 = 0u;
      v148 = 0u;
      v149 = 0u;
      v46 = v8;
      v107 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v148, v155, 16);
      if (v107)
      {
        v108 = v107;
        v109 = *(_QWORD *)v149;
        while (2)
        {
          for (i = 0; i != v108; ++i)
          {
            if (*(_QWORD *)v149 != v109)
              objc_enumerationMutation(v46);
            v111 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              PKValidationErrorWithReason(CFSTR("Value \"%@\" in array for semantic key \"%@\" is not an string."), v112, v113, v114, v115, v116, v117, v118, v111);
              goto LABEL_87;
            }
          }
          v108 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v148, v155, 16);
          if (v108)
            continue;
          break;
        }
      }
      goto LABEL_88;
    }
    v99 = objc_msgSend(v98, "isEqualToString:", CFSTR("playlistIDs"));

    if (v99)
      goto LABEL_126;
    v119 = v98;
    if (objc_msgSend(v119, "isEqualToString:", CFSTR("seats")))
    {
      _os_feature_enabled_impl();

LABEL_143:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        PKValidationErrorWithReason(CFSTR("Value \"%@\" for semantic key \"%@\" is not an array, must be an array of dictionaries."), v123, v124, v125, v126, v127, v128, v129, (uint64_t)v8);
        goto LABEL_60;
      }
      v146 = 0u;
      v147 = 0u;
      v144 = 0u;
      v145 = 0u;
      v46 = v8;
      v130 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v144, v154, 16);
      if (v130)
      {
        v131 = v130;
        v132 = *(_QWORD *)v145;
        while (2)
        {
          for (j = 0; j != v131; ++j)
          {
            if (*(_QWORD *)v145 != v132)
              objc_enumerationMutation(v46);
            v134 = *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              PKValidationErrorWithReason(CFSTR("Value \"%@\" in array for semantic key \"%@\" is not a dictionary."), v135, v136, v137, v138, v139, v140, v141, v134);
              goto LABEL_87;
            }
          }
          v131 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v144, v154, 16);
          if (v131)
            continue;
          break;
        }
      }
      goto LABEL_88;
    }
    v120 = objc_msgSend(v119, "isEqualToString:", CFSTR("wifiAccess"));
    v121 = _os_feature_enabled_impl();
    if (!v121 || (v120 & 1) != 0)
    {
      v142 = v121 | v120;

      if (v142 == 1)
        goto LABEL_143;
    }
    else
    {
      v122 = objc_msgSend(v119, "isEqualToString:", CFSTR("airPlay"));

      if ((v122 & 1) != 0)
        goto LABEL_143;
    }
    PKLogFacilityTypeGetObject(0);
    v143 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v153 = v119;
      _os_log_impl(&dword_18FC92000, v143, OS_LOG_TYPE_DEFAULT, "Ignoring semantic value for unknown key \"%@\".", buf, 0xCu);
    }

    goto LABEL_67;
  }
LABEL_58:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PKValidationErrorWithReason(CFSTR("Value for semantic key \"%@\" is not a string"), v17, v18, v19, v20, v21, v22, v23, (uint64_t)v16);
    goto LABEL_60;
  }
LABEL_67:

}

@end
