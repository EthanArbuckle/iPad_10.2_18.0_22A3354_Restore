@implementation MOEventSerializationSessionHelper

- (MOEventSerializationSessionHelper)initWithRandomization:(BOOL)a3
{
  MOEventSerializationSessionHelper *v4;
  uint64_t v5;
  NSSet *randomizedKeys;
  NSMutableDictionary *v7;
  NSMutableDictionary *randomMapping;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MOEventSerializationSessionHelper;
  v4 = -[MOEventSerializationSessionHelper init](&v10, "init");
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("eventPlaceName"), CFSTR("eventLocationLatitude"), CFSTR("eventLocationLongitude"), CFSTR("eventMediaTitle"), CFSTR("eventMediaArtist"), CFSTR("localIdentifier"), CFSTR("name"), CFSTR("eventContactGivenName"), CFSTR("eventContactFamilyName"), CFSTR("eventLocalizedFullName"), CFSTR("eventItemURL"), CFSTR("eventPhotoMemoryTitle"), CFSTR("eventMediaPlaySessionsTitle"), CFSTR("eventMediaPlaySessionsAlbum"), CFSTR("eventMediaPlaySessionsGenre"), CFSTR("eventMediaPlaySessionsArtist"),
             CFSTR("bundlePlaceName"),
             CFSTR("bundleLocationLatitude"),
             CFSTR("bundleLocationLongitude"),
             CFSTR("bundleResourceName"),
             CFSTR("bundleResourceAssets"),
             CFSTR("bundlePromptLanguage"),
             CFSTR("bundleConcurrentMediaActionName"),
             CFSTR("bundleEnclosingArea"),
             CFSTR("media"),
             CFSTR("media_name"),
             CFSTR("city"),
             CFSTR("place"),
             CFSTR("Place"),
             CFSTR("place_string"),
             CFSTR("person"),
             CFSTR("person_string"),
             CFSTR("default_label"),
             CFSTR("person_"),
             CFSTR("me_person"),
             CFSTR("me_person_identified"),
             CFSTR("header"),
             CFSTR("title"),
             CFSTR("place_"),
             CFSTR("Place_"),
             CFSTR("media_type"),
             CFSTR("media_album"),
             CFSTR("unique_action_type_count"),
             CFSTR("unique_activity_count"),
             CFSTR("unique_place_count"),
             CFSTR("unique_action_"),
             CFSTR("unique_place_"),
             CFSTR("Unique_place_"),
             CFSTR("unique_city_"),
             CFSTR("reflective_interval"),
             CFSTR("valence_classification"),
             CFSTR("state_of_mind_label_count"),
             CFSTR("state_of_mind_label_1"),
             CFSTR("state_of_mind_label_2"),
             CFSTR("no_savoring_prompt"),
             CFSTR("no_reappraisal_prompt"),
             0));
    randomizedKeys = v4->_randomizedKeys;
    v4->_randomizedKeys = (NSSet *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    randomMapping = v4->_randomMapping;
    v4->_randomMapping = v7;

    v4->_shouldAvoidRandomization = !a3;
  }
  return v4;
}

- (id)serializeEvent:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
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
  void *v26;
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
  NSMutableArray *v41;
  void *v42;
  NSMutableArray *v43;
  NSMutableDictionary *v44;
  NSMutableArray *v45;
  void *v46;
  void *v47;
  NSMutableArray *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSMutableArray *v65;
  void *v66;
  id v67;
  NSMutableArray *v68;
  NSMutableArray *v69;
  void *v70;
  NSMutableArray *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  NSMutableArray *v115;
  NSMutableArray *v116;
  NSMutableArray *v117;
  NSMutableDictionary *v118;
  NSMutableArray *v119;
  _QWORD v120[5];
  NSMutableArray *v121;
  _QWORD v122[5];
  id v123;
  NSMutableArray *v124;
  _QWORD v125[5];
  NSMutableArray *v126;
  _QWORD v127[5];
  NSMutableArray *v128;

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_new(NSMutableDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventID"), v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventStartDate"), v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventEndDate"), v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creationDate"));
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventCreationDate"), v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "provider")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventProvider"), v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "workoutType"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventWorkoutType"), v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "workoutTotalDistance"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventWorkoutTotalDistance"), v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "workoutTotalEnergyBurned"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventWorkoutTotalEnergyBurned"), v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "workoutDuration"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventWorkoutDuration"), v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "motionStepCount"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventMotionStepCount"), v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isFitnessPlusSession")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventIsFitnessPlusSession"), v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeName"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventPlaceName"), v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "placeType")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventPlaceType"), v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "placeUserType")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventPlaceUserType"), v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "poiCategory"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventPOICategory"), v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
      objc_msgSend(v26, "latitude");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventLocationLatitude"), v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
      objc_msgSend(v28, "longitude");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventLocationLongitude"), v29);

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "placeDiscovery")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventPlaceDiscovery"), v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaTitle"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventMediaTitle"), v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaArtist"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventMediaArtist"), v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaSumTimePlayed"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventMediaSumTimePlayed"), v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaRepetitions"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventMediaRepititions"), v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaEvent"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "mediaFirstPartyTimePlayedRatio"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventMediaFirstPartyTimePlayedRatio"), v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "category")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventCategory"), v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pCount"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("peopleCount"), v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "densityScore"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("peopleDensity"), v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "densityScanDuration"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("peopleDensityScanDuration"), v40);

    v41 = objc_opt_new(NSMutableArray);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mediaPlaySessions"));
    v127[0] = _NSConcreteStackBlock;
    v127[1] = 3221225472;
    v127[2] = __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke;
    v127[3] = &unk_1002AF8A0;
    v127[4] = self;
    v43 = v41;
    v128 = v43;
    objc_msgSend(v42, "enumerateObjectsUsingBlock:", v127);

    v119 = v43;
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventMediaPlaySessions"), v43);
    v44 = objc_opt_new(NSMutableDictionary);
    v45 = objc_opt_new(NSMutableArray);
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extendedAttributes"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "photoMomentPersons"));
    v125[0] = _NSConcreteStackBlock;
    v125[1] = 3221225472;
    v125[2] = __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke_2;
    v125[3] = &unk_1002AF8C8;
    v125[4] = self;
    v48 = v45;
    v126 = v48;
    objc_msgSend(v47, "enumerateObjectsUsingBlock:", v125);

    if (-[NSMutableArray count](v48, "count"))
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v44, CFSTR("persons"), v48);
    v117 = v48;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extendedAttributes"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "photoMomentLocalIdentifier"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v44, CFSTR("localIdentifier"), v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "extendedAttributes"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "photoMomentInferences"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v44, CFSTR("inferences"), v52);

    v118 = v44;
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventExtendedAttributes"), v44);
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactionContactScore"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventContactScore"), v53);

    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactionScoredContact"));
    objc_msgSend(v54, "score");
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventScoredContactScore"), v55);

    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactionScoredContact"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "contact"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "givenName"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventContactGivenName"), v58);

    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactionScoredContact"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "contact"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "familyName"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventContactFamilyName"), v61);

    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactionScoredContact"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "contact"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "localizedFullName"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventLocalizedFullName"), v64);

    v65 = objc_opt_new(NSMutableArray);
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactionContacts"));
    v122[0] = _NSConcreteStackBlock;
    v122[1] = 3221225472;
    v122[2] = __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke_3;
    v122[3] = &unk_1002AF8F0;
    v122[4] = self;
    v67 = v4;
    v123 = v67;
    v68 = v65;
    v124 = v68;
    objc_msgSend(v66, "enumerateObjectsUsingBlock:", v122);

    v116 = v68;
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventInteractionContacts"), v68);
    v69 = objc_opt_new(NSMutableArray);
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "interactions"));
    v120[0] = _NSConcreteStackBlock;
    v120[1] = 3221225472;
    v120[2] = __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke_4;
    v120[3] = &unk_1002AF918;
    v120[4] = self;
    v71 = v69;
    v121 = v71;
    objc_msgSend(v70, "enumerateObjectsUsingBlock:", v120);

    v115 = v71;
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventInteractions"), v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "itemURL"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "absoluteString"));

    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventItemURL"), v73);
    if (!self->_shouldAvoidRandomization && v73)
    {
      if (objc_msgSend(v73, "hasPrefix:", CFSTR("https://apple.news")))
      {
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "componentsSeparatedByString:", CFSTR("https://apple.news")));
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("eventItemURL")));
        if (v75 && objc_msgSend(v74, "count") == (id)2)
        {
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("https://apple.news"), "stringByAppendingString:", v75));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v76, CFSTR("eventItemURL"));

        }
      }
      if (objc_msgSend(v73, "hasPrefix:", CFSTR("https://music.apple.com")))
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "componentsSeparatedByString:", CFSTR("https://music.apple.com")));
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("eventItemURL")));
        if (v78 && objc_msgSend(v77, "count") == (id)2)
        {
          v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("https://music.apple.com"), "stringByAppendingString:", v78));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v79, CFSTR("eventItemURL"));

        }
      }
      if (objc_msgSend(v73, "hasPrefix:", CFSTR("https://podcasts.apple.com")))
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "componentsSeparatedByString:", CFSTR("https://podcasts.apple.com")));
        v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("eventItemURL")));
        if (v81 && objc_msgSend(v80, "count") == (id)2)
        {
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("https://podcasts.apple.com"), "stringByAppendingString:", v81));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v82, CFSTR("eventItemURL"));

        }
      }
      if (objc_msgSend(v73, "hasPrefix:", CFSTR("https://tv.apple.com")))
      {
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "componentsSeparatedByString:", CFSTR("https://tv.apple.com")));
        v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("eventItemURL")));
        if (v84 && objc_msgSend(v83, "count") == (id)2)
        {
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("https://tv.apple.com"), "stringByAppendingString:", v84));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v85, CFSTR("eventItemURL"));

        }
      }
    }
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "itemShareDirection")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventItemShareDirection"), v86);

    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v67, "itemIsPinned")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventItemIsPinned"), v87);

    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "itemAttributionsCount"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventItemAttributionsCount"), v88);

    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "appBundle"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventAppBundle"), v89);

    v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v67, "fromFirstParty")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventFromFirstParty"), v90);

    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "patterns"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventPatterns"), v91);

    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "photoMemoryTitle"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventPhotoMemoryTitle"), v92);

    v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "photoMemoryCategory")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventPhotoMemoryCategory"), v93);

    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "photoEvent"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v94, "photoMemorySubCategory")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventPhotoMemorySubCategory"), v95);

    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "photoMemoryTitle"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventPhotoMemoryTitle"), v96);

    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "photoEvent"));
    objc_msgSend(v97, "photoMemoryRelevanceScore");
    v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventPhotoMemoryRelevanceScore"), v98);

    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "photoEvent"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v99, "photoMemoryIsFavorite")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventPhotoMemoryIsFavorite"), v100);

    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "timeAtHomeSubType")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventTimeAtHomeSubtype"), v101);

    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "motionType")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventMotionType"), v102);

    objc_msgSend(v67, "familiarityIndexLOI");
    v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventFamiliarityIndexLOI"), v103);

    objc_msgSend(v67, "placeNameConfidence");
    v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventPlaceNameConfidence"), v104);

    objc_msgSend(v67, "confidenceScore");
    v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventConfidenceScore"), v105);

    v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "lifeEventCategory")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventLifeEventCategory"), v106);

    v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "mode")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventLocationMode"), v107);

    v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v67, "placeSource")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventPlaceSource"), v108);

    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "routineEvent"));
    if (v109)
    {
      v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "routineEvent"));
      v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v110, "isPreOnboardedVisit")));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventRoutineIsPreOnboardedVisit"), v111);

      v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "routineEvent"));
      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "poiCategory"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("eventRoutineEventPOICategory"), v113);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;

  if (a2)
  {
    v3 = a2;
    v22 = objc_opt_new(NSMutableDictionary);
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
    objc_msgSend(v4, "_savePropertyToDictionary:withKey:andValue:", v22, CFSTR("eventMediaPlaySessionsTitle"), v5);

    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "album"));
    objc_msgSend(v6, "_savePropertyToDictionary:withKey:andValue:", v22, CFSTR("eventMediaPlaySessionsAlbum"), v7);

    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleId"));
    objc_msgSend(v8, "_savePropertyToDictionary:withKey:andValue:", v22, CFSTR("eventMediaPlaySessionsBundleId"), v9);

    v10 = *(void **)(a1 + 32);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "genre"));
    objc_msgSend(v10, "_savePropertyToDictionary:withKey:andValue:", v22, CFSTR("eventMediaPlaySessionsGenre"), v11);

    v12 = *(void **)(a1 + 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mediaType"));
    objc_msgSend(v12, "_savePropertyToDictionary:withKey:andValue:", v22, CFSTR("eventMediaPlaySessionsMediaType"), v13);

    v14 = *(void **)(a1 + 32);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "artist"));
    objc_msgSend(v14, "_savePropertyToDictionary:withKey:andValue:", v22, CFSTR("eventMediaPlaySessionsArtist"), v15);

    v16 = *(void **)(a1 + 32);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v16, "_savePropertyToDictionary:withKey:andValue:", v22, CFSTR("eventMediaPlaySessionsStartDate"), v18);

    v19 = *(void **)(a1 + 32);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));

    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v19, "_savePropertyToDictionary:withKey:andValue:", v22, CFSTR("eventMediaPlaySessionsEndDate"), v21);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v22);
  }
}

void __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;

  if (a2)
  {
    v3 = a2;
    v9 = objc_opt_new(NSMutableDictionary);
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    objc_msgSend(v4, "_savePropertyToDictionary:withKey:andValue:", v9, CFSTR("name"), v5);

    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "family"));

    objc_msgSend(v6, "_savePropertyToDictionary:withKey:andValue:", v9, CFSTR("family"), v7);
    v8 = v9;
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
      v8 = v9;
    }

  }
}

void __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke_3(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;

  if (a2)
  {
    v3 = a2;
    v17 = objc_opt_new(NSMutableDictionary);
    v4 = a1[4];
    objc_msgSend(v3, "score");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v4, "_savePropertyToDictionary:withKey:andValue:", v17, CFSTR("eventScoredContactScore"), v5);

    v6 = a1[4];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contact"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "givenName"));
    objc_msgSend(v6, "_savePropertyToDictionary:withKey:andValue:", v17, CFSTR("eventContactGivenName"), v8);

    v9 = a1[4];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contact"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "familyName"));
    objc_msgSend(v9, "_savePropertyToDictionary:withKey:andValue:", v17, CFSTR("eventContactFamilyName"), v11);

    v12 = a1[4];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contact"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedFullName"));
    objc_msgSend(v12, "_savePropertyToDictionary:withKey:andValue:", v17, CFSTR("eventLocalizedFullName"), v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "contactClassificationMap"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v3));

    if (v16)
      objc_msgSend(a1[4], "_savePropertyToDictionary:withKey:andValue:", v17, CFSTR("eventContactClassification"), v16);
    objc_msgSend(a1[6], "addObject:", v17);

  }
}

void __52__MOEventSerializationSessionHelper_serializeEvent___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSMutableDictionary *v15;

  if (a2)
  {
    v3 = a2;
    v15 = objc_opt_new(NSMutableDictionary);
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v4, "_savePropertyToDictionary:withKey:andValue:", v15, CFSTR("eventInteractionsStartDate"), v6);

    v7 = *(void **)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v7, "_savePropertyToDictionary:withKey:andValue:", v15, CFSTR("eventInteractionsEndDate"), v9);

    v10 = *(void **)(a1 + 32);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "mechanism")));
    objc_msgSend(v10, "_savePropertyToDictionary:withKey:andValue:", v15, CFSTR("eventInteractionsMechanism"), v11);

    v12 = *(void **)(a1 + 32);
    v13 = objc_msgSend(v3, "direction");

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
    objc_msgSend(v12, "_savePropertyToDictionary:withKey:andValue:", v15, CFSTR("eventInteractionsDirection"), v14);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);
  }
}

- (id)serializeEventBundle:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
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
  NSMutableArray *v21;
  void *v22;
  NSMutableArray *v23;
  void *v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  MOEventSerializationSessionHelper *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSMutableDictionary *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSMutableDictionary *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSMutableDictionary *v66;
  NSMutableArray *v67;
  void *v68;
  NSMutableArray *v69;
  NSMutableArray *v70;
  void *v71;
  NSMutableArray *v72;
  NSMutableDictionary *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  NSMutableArray *v109;
  void *v110;
  NSMutableArray *v111;
  NSMutableDictionary *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  NSMutableArray *v124;
  void *v125;
  NSMutableArray *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  NSMutableDictionary *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  NSMutableDictionary *v182;
  void *v183;
  void *v184;
  void *v185;
  NSMutableDictionary *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  id v202;
  id v203;
  id v204;
  void *j;
  void *v206;
  NSMutableDictionary *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  NSMutableDictionary *v213;
  NSMutableArray *v214;
  NSMutableDictionary *v215;
  NSMutableArray *v216;
  NSMutableDictionary *v217;
  NSMutableArray *v218;
  NSMutableArray *v219;
  NSMutableArray *v220;
  NSMutableDictionary *v221;
  NSMutableDictionary *v222;
  NSMutableDictionary *v223;
  NSMutableDictionary *v224;
  id obj;
  NSMutableArray *v226;
  uint64_t v227;
  void *v228;
  MOEventSerializationSessionHelper *v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  _QWORD v234[5];
  NSMutableArray *v235;
  _QWORD v236[5];
  NSMutableArray *v237;
  _QWORD v238[5];
  NSMutableArray *v239;
  _QWORD v240[5];
  NSMutableArray *v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  _QWORD v246[4];
  NSMutableArray *v247;
  _BYTE v248[128];
  _BYTE v249[128];

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_new(NSMutableDictionary);
    objc_msgSend(v4, "buildResources");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("bundleID"), v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("SuggestionID"), v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("bundleStartDate"), v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("bundleEndDate"), v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creationDate"));
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("bundleCreationDate"), v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstCreationDate"));
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("bundleFirstCreationDate"), v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "filtered")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("bundleFiltered"), v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "bundleSubType")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("bundleSubType"), v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "bundleSuperType")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("bundleSuperType"), v20);

    v21 = objc_opt_new(NSMutableArray);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "events"));
    v246[0] = _NSConcreteStackBlock;
    v246[1] = 3221225472;
    v246[2] = __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke;
    v246[3] = &unk_1002AF940;
    v23 = v21;
    v247 = v23;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v246);

    v220 = v23;
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("bundleEvents"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subBundleIDs"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("subBundleIDs"), v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subSuggestionIDs"));
    v229 = self;
    v223 = v5;
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](self, "_savePropertyToDictionary:withKey:andValue:", v5, CFSTR("subSuggestionIDs"), v25);

    v26 = objc_opt_new(NSMutableDictionary);
    v242 = 0u;
    v243 = 0u;
    v244 = 0u;
    v245 = 0u;
    v228 = v4;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaData"));
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v242, v249, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v243;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(_QWORD *)v243 != v30)
            objc_enumerationMutation(v27);
          v32 = *(id *)(*((_QWORD *)&v242 + 1) + 8 * (_QWORD)i);
          v34 = objc_opt_class(NSNumber, v33);
          v35 = v32;
          if ((objc_opt_isKindOfClass(v32, v34) & 1) != 0)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringValue"));

          }
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "metaData"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", v32));
          -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v26, v35, v37);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v242, v249, 16);
      }
      while (v29);
    }

    v38 = v229;
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v223, CFSTR("bundleMetadata"), v26);
    v39 = v228;
    if (v229->_shouldAvoidRandomization)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "labels"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v223, CFSTR("bundleLabels"), v40);

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "promptLanguages"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v223, CFSTR("bundlePromptLanguages"), v41);

    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "promptLanguage"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v223, CFSTR("bundlePromptLanguage"), v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v228, "interfaceType")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v223, CFSTR("bundleInterfaceType"), v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v228, "summarizationGranularity")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v223, CFSTR("bundleSummarizationGranularity"), v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v228, "isAggregatedAndSuppressed")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v223, CFSTR("bundleIsAggregatedAndSuppressed"), v45);

    v46 = objc_opt_new(NSMutableDictionary);
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "action"));

    v221 = v46;
    if (v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "action"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v48, "actionType")));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v46, CFSTR("bundleActionType"), v49);

      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "action"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v50, "actionSubtype")));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v46, CFSTR("bundleActionSubType"), v51);

      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "action"));
      objc_msgSend(v52, "actionNameConfidence");
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v46, CFSTR("bundleActionNameConfidence"), v53);

      if (objc_msgSend(v228, "interfaceType") == (id)10 && !v229->_shouldAvoidRandomization)
      {
        -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v46, CFSTR("bundleActionName"), CFSTR("PhotoMemory"));
        v39 = v228;
      }
      else
      {
        v39 = v228;
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "action"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "actionName"));
        -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v46, CFSTR("bundleActionName"), v55);

      }
    }
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v223, CFSTR("bundleAction"), v46);
    v56 = objc_opt_new(NSMutableDictionary);
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "concurrentMediaAction"));

    v222 = v56;
    if (v57)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "concurrentMediaAction"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v58, "actionType")));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v56, CFSTR("bundleActionType"), v59);

      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "concurrentMediaAction"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v60, "actionSubtype")));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v56, CFSTR("bundleActionSubType"), v61);

      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "concurrentMediaAction"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "actionName"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v56, CFSTR("bundleConcurrentMediaActionName"), v63);

      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "concurrentMediaAction"));
      objc_msgSend(v64, "actionNameConfidence");
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v56, CFSTR("bundleActionNameConfidence"), v65);

    }
    v66 = v223;
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v223, CFSTR("bundleConcurrentMediaAction"), v56);
    v67 = objc_opt_new(NSMutableArray);
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "actions"));
    v240[0] = _NSConcreteStackBlock;
    v240[1] = 3221225472;
    v240[2] = __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_2;
    v240[3] = &unk_1002AF968;
    v240[4] = v229;
    v69 = v67;
    v241 = v69;
    objc_msgSend(v68, "enumerateObjectsUsingBlock:", v240);

    v219 = v69;
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v223, CFSTR("bundleBackgroundAction"), v69);
    v70 = objc_opt_new(NSMutableArray);
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "persons"));
    v238[0] = _NSConcreteStackBlock;
    v238[1] = 3221225472;
    v238[2] = __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_3;
    v238[3] = &unk_1002AF8C8;
    v238[4] = v229;
    v72 = v70;
    v239 = v72;
    objc_msgSend(v71, "enumerateObjectsUsingBlock:", v238);

    v218 = v72;
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v223, CFSTR("bundlePersons"), v72);
    v73 = objc_opt_new(NSMutableDictionary);
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));

    v4 = v39;
    if (v74)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v75, "placeUserType")));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v73, CFSTR("bundlePlaceUserType"), v76);

      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v77, "placeType")));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v73, CFSTR("bundlePlaceType"), v78);

      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "placeName"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v73, CFSTR("bundlePlaceName"), v80);

      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v81, "proposition")));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v73, CFSTR("bundlePlaceProposition"), v82);

      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));
      objc_msgSend(v83, "placeNameConfidence");
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v73, CFSTR("bundlePlaceNameConfidence"), v84);

      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "location"));
      objc_msgSend(v86, "latitude");
      v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v73, CFSTR("bundleLocationLatitude"), v87);

      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "location"));
      objc_msgSend(v89, "longitude");
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v73, CFSTR("bundleLocationLongitude"), v90);

      v38 = v229;
      v66 = v223;

      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v91, "locationMode")));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v73, CFSTR("bundleLocationMode"), v92);

      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "poiCategory"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v73, CFSTR("bundlePoiCategory"), v94);

      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));
      objc_msgSend(v95, "distanceToHomeInMiles");
      v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v73, CFSTR("bundleDistanceToHomeInMiles"), v96);

      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));
      objc_msgSend(v97, "familiarityIndexLOI");
      v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v73, CFSTR("familiarityIndexLOI"), v98);

      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "enclosingArea"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v73, CFSTR("bundleEnclosingArea"), v100);

      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));
      v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "startDate"));
      objc_msgSend(v102, "timeIntervalSinceReferenceDate");
      v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v73, CFSTR("bundleStartDate"), v103);

      v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));
      v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "endDate"));
      objc_msgSend(v105, "timeIntervalSinceReferenceDate");
      v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v73, CFSTR("bundleEndDate"), v106);

      v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "place"));
      objc_msgSend(v107, "priorityScore");
      v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v73, CFSTR("bundlePlacePriorityScore"), v108);

    }
    v217 = v73;
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v66, CFSTR("bundlePlace"), v73);
    v109 = objc_opt_new(NSMutableArray);
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "places"));
    v236[0] = _NSConcreteStackBlock;
    v236[1] = 3221225472;
    v236[2] = __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_4;
    v236[3] = &unk_1002AF990;
    v236[4] = v38;
    v111 = v109;
    v237 = v111;
    objc_msgSend(v110, "enumerateObjectsUsingBlock:", v236);

    v216 = v111;
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v66, CFSTR("bundlePlaces"), v111);
    v112 = objc_opt_new(NSMutableDictionary);
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "time"));

    if (v113)
    {
      v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "time"));
      objc_msgSend(v114, "timestamp");
      v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v112, CFSTR("bundleTimestamp"), v115);

      v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "time"));
      v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "timeString"));

      if (v117)
      {
        v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "time"));
        v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "timeString"));
        -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v112, CFSTR("bundleTimestring"), v119);

      }
      v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "time"));
      v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v120, "timeTag")));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v112, CFSTR("bundleTimetag"), v121);

      v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "time"));
      v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "timeZone"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v112, CFSTR("bundleTimezone"), v123);

    }
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v66, CFSTR("bundleTime"), v112);
    v124 = objc_opt_new(NSMutableArray);
    v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resources"));
    v234[0] = _NSConcreteStackBlock;
    v234[1] = 3221225472;
    v234[2] = __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_5;
    v234[3] = &unk_1002AF9B8;
    v234[4] = v38;
    v126 = v124;
    v235 = v126;
    objc_msgSend(v125, "enumerateObjectsUsingBlock:", v234);

    v214 = v126;
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v66, CFSTR("bundleResources"), v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "photoSource")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v66, CFSTR("bundlePhotoSource"), v127);

    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visitEventsRejectedByWatchLocation"));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v66, CFSTR("bundleVisitEventsRejectedByWatchLocation"), v128);

    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionEngagementEvents"));
    if (v129)
    {
      v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionEngagementEvents"));
      v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "allObjects"));

      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v66, CFSTR("bundleSuggestionEngagementEvents"), v131);
    }
    objc_msgSend(v4, "suggestionEngagementViewCount");
    v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "suggestionEngagementViewCount")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v66, CFSTR("bundleSuggestionEngagementViewCount"), v132);

    v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appEntryEngagementEvents"));
    v134 = v221;
    if (v133)
    {
      v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appEntryEngagementEvents"));
      v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "allObjects"));

      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v66, CFSTR("bundleAppEntryEngagementEvents"), v136);
    }
    v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));

    if (v137)
    {
      v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rankingDictionary"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v66, CFSTR("bundleRanking"), v138);

    }
    v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaDataForRank"));

    if (v139)
    {
      v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaDataForRank"));
      v141 = objc_msgSend(v140, "mutableCopy");

      if (!v38->_shouldAvoidRandomization)
      {
        objc_msgSend(v141, "removeObjectForKey:", CFSTR("StateOfMindLabels"));
        objc_msgSend(v141, "removeObjectForKey:", CFSTR("StateOfMindDomains"));
        objc_msgSend(v141, "removeObjectForKey:", CFSTR("StateOfMindValence"));
        objc_msgSend(v141, "removeObjectForKey:", CFSTR("StateOfMindValenceClassification"));
        objc_msgSend(v141, "removeObjectForKey:", CFSTR("StateOfMindReflectiveInterval"));
        objc_msgSend(v141, "removeObjectForKey:", CFSTR("StateOfMindLoggedIn3pApp"));
        objc_msgSend(v141, "removeObjectForKey:", CFSTR("StateOfMindLoggedInJournalApp"));
      }
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v66, CFSTR("bundleMetaDataForRanking"), v141);

    }
    v215 = v112;
    v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "timeAtHomeSubType")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v66, CFSTR("bundleTimeAtHomeSubtype"), v142);

    v143 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "includedInSummaryBundleOnly")));
    -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v66, CFSTR("bundleIncludedInSummaryBundleOnly"), v143);

    v224 = objc_opt_new(NSMutableDictionary);
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));

    if (v144)
    {
      v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "identifier"));
      v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "UUIDString"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("outlierMetadataidentifier"), v147);

      v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v148, "isFiltered")));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("isFiltered"), v149);

      v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "phenotype"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("phenotype"), v151);

      v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "topLevelActivityHistogram"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("topLevelActivityHistogram"), v153);

      v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "secondLevelActivityHistogram"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("secondLevelActivityHistogram"), v155);

      v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "activityTypeFromPhotoTraitsHistogram"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("activityTypeFromPhotoTraitsHistogram"), v157);

      v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "timeTagHistogram"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("timeTagHistogram"), v159);

      v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "dayOfWeekHistogram"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("dayOfWeekHistogram"), v161);

      v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "timeContextFromPhotoTraitsHistogram"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("timeContextFromPhotoTraitsHistogram"), v163);

      v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "placeNameHistogram"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("placeNameHistogram"), v165);

      v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "combinedPlaceTypeHistogram"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("combinedPlaceTypeHistogram"), v167);

      v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "enclosingPlaceNameHistogram"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("enclosingPlaceNameHistogram"), v169);

      v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "placeTypeFromPhotoTraitsHistogram"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("placeTypeFromPhotoTraitsHistogram"), v171);

      v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "contactNamesHistogram"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("contactNamesHistogram"), v173);

      v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "personRelationshipHistogram"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("personRelationshipHistogram"), v175);

      v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "socialEventFromPhotoTraitsHistogram"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("socialEventFromPhotoTraitsHistogram"), v177);

      v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v178, "otherSubjectFromPhotoTraitsHistogram"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("otherSubjectFromPhotoTraitsHistogram"), v179);

      v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterMetadata"));
      v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "subBundleGoodnessScores"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v224, CFSTR("subBundleGoodnessScores"), v181);

      v134 = v221;
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v66, CFSTR("clusterMetadata"), v224);
    }
    v182 = objc_opt_new(NSMutableDictionary);
    v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outlierMetadata"));

    if (v183)
    {
      v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outlierMetadata"));
      v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "identifier"));
      v186 = v182;
      v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v185, "UUIDString"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v186, CFSTR("outlierMetadataidentifier"), v187);

      v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outlierMetadata"));
      v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "updatedDate"));
      objc_msgSend(v189, "timeIntervalSinceReferenceDate");
      v190 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v186, CFSTR("updatedDate"), v190);

      v182 = v186;
      v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outlierMetadata"));
      v192 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v191, "isSignificant")));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v186, CFSTR("isSignificant"), v192);

      v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outlierMetadata"));
      objc_msgSend(v193, "outlierScore");
      v194 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v186, CFSTR("outlierScore"), v194);

      v195 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outlierMetadata"));
      objc_msgSend(v195, "outlierScoreThreshold");
      v196 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v186, CFSTR("outlierScoreThreshold"), v196);

      v197 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outlierMetadata"));
      objc_msgSend(v197, "bundleGoodnessScore");
      v198 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v186, CFSTR("bundleGoodnessScore"), v198);

      v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outlierMetadata"));
      objc_msgSend(v199, "bundleGoodnessScoreThreshold");
      v200 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v186, CFSTR("bundleGoodnessScoreThreshold"), v200);

      v134 = v221;
      -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v38, "_savePropertyToDictionary:withKey:andValue:", v66, CFSTR("outlierMetadata"), v186);
    }
    v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "photoTraits"));
    v202 = objc_msgSend(v201, "count");

    if (v202)
    {
      v213 = v182;
      v226 = objc_opt_new(NSMutableArray);
      v230 = 0u;
      v231 = 0u;
      v232 = 0u;
      v233 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "photoTraits"));
      v203 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v230, v248, 16);
      if (v203)
      {
        v204 = v203;
        v227 = *(_QWORD *)v231;
        do
        {
          for (j = 0; j != v204; j = (char *)j + 1)
          {
            if (*(_QWORD *)v231 != v227)
              objc_enumerationMutation(obj);
            v206 = *(void **)(*((_QWORD *)&v230 + 1) + 8 * (_QWORD)j);
            v207 = objc_opt_new(NSMutableDictionary);
            v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "identifier"));
            v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v208, "UUIDString"));
            -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v207, CFSTR("identifier"), v209);

            v210 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "name"));
            -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v207, CFSTR("name"), v210);

            v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "relevantAssetUUIDs"));
            -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v207, CFSTR("relevantAssetUUIDs"), v211);

            if (-[NSMutableDictionary count](v207, "count"))
              -[NSMutableArray addObject:](v226, "addObject:", v207);

          }
          v204 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v230, v248, 16);
        }
        while (v204);
      }

      v66 = v223;
      if (-[NSMutableArray count](v226, "count"))
        -[MOEventSerializationSessionHelper _savePropertyToDictionary:withKey:andValue:](v229, "_savePropertyToDictionary:withKey:andValue:", v223, CFSTR("photoTraits"), v226);

      v4 = v228;
      v134 = v221;
      v182 = v213;
    }

  }
  else
  {
    v66 = 0;
  }

  return v66;
}

void __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventIdentifier"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

void __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  NSMutableDictionary *v14;

  if (a2)
  {
    v3 = a2;
    v14 = objc_opt_new(NSMutableDictionary);
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "actionType")));
    objc_msgSend(v4, "_savePropertyToDictionary:withKey:andValue:", v14, CFSTR("bundleActionType"), v5);

    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v3, "actionSubtype")));
    objc_msgSend(v6, "_savePropertyToDictionary:withKey:andValue:", v14, CFSTR("bundleActionSubType"), v7);

    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionName"));
    objc_msgSend(v8, "_savePropertyToDictionary:withKey:andValue:", v14, CFSTR("bundleActionName"), v9);

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v3, "actionNameConfidence");
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
    objc_msgSend(v10, "_savePropertyToDictionary:withKey:andValue:", v14, CFSTR("bundleActionNameConfidence"), v13);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
  }
}

void __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSMutableDictionary *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSMutableArray *v21;
  id v22;
  id v23;
  void *i;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSMutableDictionary *v33;
  id v34;
  id obj;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v3 = a2;
  if (v3)
  {
    v4 = objc_opt_new(NSMutableDictionary);
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    objc_msgSend(v5, "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("name"), v6);

    v7 = *(void **)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "family"));
    objc_msgSend(v7, "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("family"), v8);

    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contactIdentifier"));
    objc_msgSend(v9, "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("contactIdentifier"), v10);

    v11 = *(void **)(a1 + 32);
    objc_msgSend(v3, "significanceScore");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v11, "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("significanceScore"), v12);

    v13 = *(void **)(a1 + 32);
    objc_msgSend(v3, "priorityScore");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v13, "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("priorityScore"), v14);

    v15 = *(void **)(a1 + 32);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "isPHPersonTypeImportant")));
    objc_msgSend(v15, "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("isPHPersonTypeImportant"), v16);

    v17 = *(void **)(a1 + 32);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "isMePerson")));
    objc_msgSend(v17, "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("isMePerson"), v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "personRelationships"));
    v20 = objc_msgSend(v19, "count");

    if (v20)
    {
      v33 = v4;
      v21 = objc_opt_new(NSMutableArray);
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v34 = v3;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "personRelationships"));
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v22)
      {
        v23 = v22;
        v36 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v36)
              objc_enumerationMutation(obj);
            v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
            v26 = objc_opt_new(NSMutableDictionary);
            v27 = *(void **)(a1 + 32);
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "relationship")));
            objc_msgSend(v27, "_savePropertyToDictionary:withKey:andValue:", v26, CFSTR("personRelationshipTag"), v28);

            v29 = *(void **)(a1 + 32);
            objc_msgSend(v25, "score");
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            objc_msgSend(v29, "_savePropertyToDictionary:withKey:andValue:", v26, CFSTR("personRelationshipScore"), v30);

            v31 = *(void **)(a1 + 32);
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "source"));
            objc_msgSend(v31, "_savePropertyToDictionary:withKey:andValue:", v26, CFSTR("personRelationshipSource"), v32);

            -[NSMutableArray addObject:](v21, "addObject:", v26);
          }
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v23);
      }

      v4 = v33;
      if (-[NSMutableArray count](v21, "count"))
        objc_msgSend(*(id *)(a1 + 32), "_savePropertyToDictionary:withKey:andValue:", v33, CFSTR("personRelationships"), v21);

      v3 = v34;
    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4, v33);

  }
}

void __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
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
  void *v26;
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
  double v37;
  double v38;
  void *v39;
  NSMutableDictionary *v40;

  if (a2)
  {
    v3 = a2;
    v40 = objc_opt_new(NSMutableDictionary);
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "placeUserType")));
    objc_msgSend(v4, "_savePropertyToDictionary:withKey:andValue:", v40, CFSTR("bundlePlaceUserType"), v5);

    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "placeType")));
    objc_msgSend(v6, "_savePropertyToDictionary:withKey:andValue:", v40, CFSTR("bundlePlaceType"), v7);

    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "placeName"));
    objc_msgSend(v8, "_savePropertyToDictionary:withKey:andValue:", v40, CFSTR("bundlePlaceName"), v9);

    v10 = *(void **)(a1 + 32);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "proposition")));
    objc_msgSend(v10, "_savePropertyToDictionary:withKey:andValue:", v40, CFSTR("bundlePlaceProposition"), v11);

    v12 = *(void **)(a1 + 32);
    objc_msgSend(v3, "placeNameConfidence");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v12, "_savePropertyToDictionary:withKey:andValue:", v40, CFSTR("bundlePlaceNameConfidence"), v13);

    v14 = *(void **)(a1 + 32);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "location"));
    objc_msgSend(v15, "latitude");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v14, "_savePropertyToDictionary:withKey:andValue:", v40, CFSTR("bundleLocationLatitude"), v16);

    v17 = *(void **)(a1 + 32);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "location"));
    objc_msgSend(v18, "longitude");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v17, "_savePropertyToDictionary:withKey:andValue:", v40, CFSTR("bundleLocationLongitude"), v19);

    v20 = *(void **)(a1 + 32);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "locationMode")));
    objc_msgSend(v20, "_savePropertyToDictionary:withKey:andValue:", v40, CFSTR("bundleLocationMode"), v21);

    v22 = *(void **)(a1 + 32);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "poiCategory"));
    objc_msgSend(v22, "_savePropertyToDictionary:withKey:andValue:", v40, CFSTR("bundlePoiCategory"), v23);

    v24 = *(void **)(a1 + 32);
    objc_msgSend(v3, "distanceToHomeInMiles");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v24, "_savePropertyToDictionary:withKey:andValue:", v40, CFSTR("bundleDistanceToHomeInMiles"), v25);

    v26 = *(void **)(a1 + 32);
    objc_msgSend(v3, "familiarityIndexLOI");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v26, "_savePropertyToDictionary:withKey:andValue:", v40, CFSTR("familiarityIndexLOI"), v27);

    v28 = *(void **)(a1 + 32);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enclosingArea"));
    objc_msgSend(v28, "_savePropertyToDictionary:withKey:andValue:", v40, CFSTR("bundleEnclosingArea"), v29);

    v30 = *(void **)(a1 + 32);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    objc_msgSend(v31, "timeIntervalSinceReferenceDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v30, "_savePropertyToDictionary:withKey:andValue:", v40, CFSTR("bundleStartDate"), v32);

    v33 = *(void **)(a1 + 32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    objc_msgSend(v34, "timeIntervalSinceReferenceDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v33, "_savePropertyToDictionary:withKey:andValue:", v40, CFSTR("bundleEndDate"), v35);

    v36 = *(void **)(a1 + 32);
    objc_msgSend(v3, "priorityScore");
    v38 = v37;

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v38));
    objc_msgSend(v36, "_savePropertyToDictionary:withKey:andValue:", v40, CFSTR("bundlePlacePriorityScore"), v39);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v40);
  }
}

void __58__MOEventSerializationSessionHelper_serializeEventBundle___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSMutableDictionary *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;

  if (a2)
  {
    v3 = a2;
    v4 = objc_opt_new(NSMutableDictionary);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v5, "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("bundleResourceValue"), v6);

    v7 = *(void **)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    objc_msgSend(v7, "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("bundleResourceName"), v8);

    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assets"));
    objc_msgSend(v9, "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("bundleResourceAssets"), v10);

    v11 = *(void **)(a1 + 32);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "type")));
    objc_msgSend(v11, "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("bundleResourceType"), v12);

    v13 = *(void **)(a1 + 32);
    objc_msgSend(v3, "priorityScore");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v13, "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("bundleResourcePriorityScore"), v14);

    v15 = *(void **)(a1 + 32);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "photoCurationScore"));
    objc_msgSend(v15, "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("bundleResourcePhotoCurationScore"), v16);

    v17 = *(void **)(a1 + 32);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "photoFaceCount")));
    objc_msgSend(v17, "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("bundleResourcePhotoFaceCount"), v18);

    v19 = *(void **)(a1 + 32);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "photoAssetMediaType")));
    objc_msgSend(v19, "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("bundleResourcePhotoAssetMediaType"), v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "data"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v21));

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("MOWorkoutMetaDataKeyActivityType")));
    v24 = (void *)v23;
    if (v23)
    {
      v26 = CFSTR("MOWorkoutMetaDataKeyActivityType");
      v27 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
      objc_msgSend(*(id *)(a1 + 32), "_savePropertyToDictionary:withKey:andValue:", v4, CFSTR("bundleResourceMetadata"), v25);

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

  }
}

- (void)_savePropertyToDictionary:(id)a3 withKey:(id)a4 andValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = v10;
  if (v9 && v10)
  {
    if (self->_shouldAvoidRandomization
      || (v13 = objc_opt_class(NSDictionary, v11), (objc_opt_isKindOfClass(v12, v13) & 1) != 0))
    {
LABEL_5:
      objc_msgSend(v8, "setObject:forKey:", v12, v9, (_QWORD)v23);
      goto LABEL_6;
    }
    if (!-[NSSet containsObject:](self->_randomizedKeys, "containsObject:", v9))
    {
      v15 = objc_opt_class(NSString, v14);
      if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v16 = self->_randomizedKeys;
        v17 = -[NSSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v24;
          while (2)
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(_QWORD *)v24 != v19)
                objc_enumerationMutation(v16);
              if (objc_msgSend(v9, "containsString:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), (_QWORD)v23))
              {

                goto LABEL_19;
              }
            }
            v18 = -[NSSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            if (v18)
              continue;
            break;
          }
        }

      }
      goto LABEL_5;
    }
LABEL_19:
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_randomMapping, "objectForKey:", v12));
    if (!v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUIDString"));

      -[NSMutableDictionary setObject:forKey:](self->_randomMapping, "setObject:forKey:", v21, v12);
    }
    objc_msgSend(v8, "setObject:forKey:", v21, v9);

  }
LABEL_6:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_randomMapping, 0);
  objc_storeStrong((id *)&self->_randomizedKeys, 0);
}

@end
