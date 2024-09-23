@implementation PKPassSemanticsFromDictionary

void __PKPassSemanticsFromDictionary_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  int v8;
  id v9;
  int v10;
  id v11;
  int v12;
  id v13;
  int v14;
  id v15;
  int v16;
  id v17;
  int v18;
  int v19;
  char v20;
  int v21;
  NSObject *v22;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("departureLocationDescription")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("destinationLocationDescription")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("transitProvider")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("vehicleName")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("vehicleNumber")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("vehicleType")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("boardingGroup")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("boardingSequenceNumber")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("confirmationNumber")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("transitStatus")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("transitStatusReason")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("membershipProgramName")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("membershipProgramNumber")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("priorityStatus")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("securityScreening")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("flightCode")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("airlineCode")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("departureAirportCode")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("departureAirportName")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("departureTerminal")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("departureGate")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("destinationAirportCode")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("destinationAirportName")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("destinationTerminal")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("destinationGate")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("departurePlatform")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("departureStationName")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("destinationPlatform")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("destinationStationName")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("carNumber")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("eventName")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("venueName")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("venueEntrance")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("venueRoom")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("venuePhoneNumber")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("leagueName")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("leagueAbbreviation")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("homeTeamLocation")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("homeTeamName")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("homeTeamAbbreviation")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("awayTeamLocation")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("awayTeamName")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("awayTeamAbbreviation")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("sportName")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("genre")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("eventLiveMessage")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("admissionLevel")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("admissionLevelAbbreviation")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("attendeeName")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("venueRegionName")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("entranceDescription")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("venueEntranceGate")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("venueEntranceDoor")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("venueEntrancePortal")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("additionalTicketAttributes")))
  {

LABEL_57:
    PKPassSemanticStringInDictionary(v3, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_58;
  }
  v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("eventType"));

  if (v6)
    goto LABEL_57;
  v7 = v3;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("originalDepartureDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("currentDepartureDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("originalArrivalDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("currentArrivalDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("originalBoardingDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("currentBoardingDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("eventStartDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("venueDoorsOpenDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("venueGatesOpenDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("venueParkingLotsOpenDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("venueBoxOfficeOpenDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("venueFanZoneOpenDate")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("venueOpenDate")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("venueCloseDate")))
  {

LABEL_77:
    PKPassSemanticDateInDictionary(v7, *(void **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_58;
  }
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("eventEndDate"));

  if (v8)
    goto LABEL_77;
  v9 = v7;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("departureLocation")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("destinationLocation")))
  {

LABEL_83:
    PKPassSemanticLocationInDictionary(v9, *(void **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_58;
  }
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("venueLocation"));

  if (v10)
    goto LABEL_83;
  v11 = v9;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("balance")))
  {

LABEL_87:
    PKPassSemanticCurrencyAmountInDictionary(v11, *(void **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_58;
  }
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("balance"));

  if (v12)
    goto LABEL_87;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("passengerName")))
  {
    PKPassSemanticPersonNameComponentsInDictionary(v11, *(void **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_58;
  }
  v13 = v11;
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("flightNumber")) & 1) != 0
    || (objc_msgSend(v13, "isEqualToString:", CFSTR("duration")) & 1) != 0
    || objc_msgSend(v13, "isEqualToString:", CFSTR("tailgatingAllowed")))
  {

LABEL_95:
    PKPassSemanticNumberInDictionary(v13, *(void **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_58;
  }
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("silenceRequested"));

  if (v14)
    goto LABEL_95;
  v15 = v13;
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("artistIDs")) & 1) != 0
    || (objc_msgSend(v15, "isEqualToString:", CFSTR("performerNames")) & 1) != 0
    || objc_msgSend(v15, "isEqualToString:", CFSTR("albumIDs")))
  {

LABEL_101:
    PKPassSemanticStringsInDictionary(v15, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_58;
  }
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("playlistIDs"));

  if (v16)
    goto LABEL_101;
  v17 = v15;
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("seats")))
  {
    _os_feature_enabled_impl();

LABEL_107:
    PKPassSemanticDictionariesInDictionary(v17, *(void **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_58;
  }
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("wifiAccess"));
  v19 = _os_feature_enabled_impl();
  if (!v19 || (v18 & 1) != 0)
  {
    v21 = v19 | v18;

    if (v21 == 1)
      goto LABEL_107;
  }
  else
  {
    v20 = objc_msgSend(v17, "isEqualToString:", CFSTR("airPlay"));

    if ((v20 & 1) != 0)
      goto LABEL_107;
  }
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("eventStartDateInfo")))
  {
    PKPassSemanticEventDateInfoInDictionary(v17, *(void **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_58:
    v5 = v4;
    objc_msgSend(v4, "setFieldKey:", *(_QWORD *)(a1 + 56));
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v5, v3);

    }
    goto LABEL_60;
  }
  PKLogFacilityTypeGetObject(0);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138543362;
    v24 = v17;
    _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Ignoring semantic value for unknown key %{public}@.", (uint8_t *)&v23, 0xCu);
  }

  objc_msgSend(0, "setFieldKey:", *(_QWORD *)(a1 + 56));
LABEL_60:

}

@end
