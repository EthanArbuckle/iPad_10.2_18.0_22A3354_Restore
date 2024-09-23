@implementation MOEvent

- (MOEvent)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 creationDate:(id)a6 provider:(unint64_t)a7 category:(unint64_t)a8
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  MOEvent *v21;
  MOEvent *v22;
  NSDate *v23;
  NSDate *startDate;
  NSDate *v25;
  NSDate *endDate;
  NSDate *v27;
  NSDate *creationDate;
  MOEvent *v29;
  id os_log;
  NSObject *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  SEL v35;
  MOEvent *v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  objc_super v45;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = v19;
  if (!v16)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:].cold.1();

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v33 = v32;
    v34 = CFSTR("Invalid parameter not satisfying: eventIdentifier");
    v35 = a2;
    v36 = self;
    v37 = 31;
    goto LABEL_20;
  }
  if (!v17)
  {
    v38 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:].cold.2();

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v33 = v32;
    v34 = CFSTR("Invalid parameter not satisfying: startDate");
    v35 = a2;
    v36 = self;
    v37 = 32;
    goto LABEL_20;
  }
  if (!v18)
  {
    v40 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:].cold.3();

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v33 = v32;
    v34 = CFSTR("Invalid parameter not satisfying: endDate");
    v35 = a2;
    v36 = self;
    v37 = 33;
    goto LABEL_20;
  }
  if (!v19)
  {
    v42 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:].cold.4();

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v33 = v32;
    v34 = CFSTR("Invalid parameter not satisfying: creationDate");
    v35 = a2;
    v36 = self;
    v37 = 34;
LABEL_20:
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v35, v36, CFSTR("MOEvent.m"), v37, v34);

    v29 = 0;
    goto LABEL_21;
  }
  v45.receiver = self;
  v45.super_class = (Class)MOEvent;
  v21 = -[MOEvent init](&v45, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_eventIdentifier, a3);
    v23 = (NSDate *)objc_msgSend(v17, "copy");
    startDate = v22->_startDate;
    v22->_startDate = v23;

    v25 = (NSDate *)objc_msgSend(v18, "copy");
    endDate = v22->_endDate;
    v22->_endDate = v25;

    v27 = (NSDate *)objc_msgSend(v20, "copy");
    creationDate = v22->_creationDate;
    v22->_creationDate = v27;

    v22->_provider = a7;
    v22->_category = a8;
    -[MOEvent initSubEvent](v22, "initSubEvent");
  }
  self = v22;
  v29 = self;
LABEL_21:

  return v29;
}

- (void)initSubEvent
{
  unint64_t category;
  MOEventRoutine *v4;
  MOEventRoutine *routineEvent;
  MOEventMotionActivity *v6;
  MOEventMotionActivity *motionActivityEvent;
  MOEventWorkout *v8;
  MOEventWorkout *workoutEvent;

  category = self->_category;
  if (category == 16)
  {
    v6 = objc_alloc_init(MOEventMotionActivity);
    motionActivityEvent = self->_motionActivityEvent;
    self->_motionActivityEvent = v6;

  }
  else if (category != 2)
  {
    if (category == 1)
    {
      v4 = objc_alloc_init(MOEventRoutine);
      routineEvent = self->_routineEvent;
      self->_routineEvent = v4;

    }
    return;
  }
  v8 = objc_alloc_init(MOEventWorkout);
  workoutEvent = self->_workoutEvent;
  self->_workoutEvent = v8;

}

+ (id)describeProvider:(unint64_t)a3
{
  __CFString *v3;

  if (a3 >= 0xC)
    v3 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unknown (%lu)"), a3);
  else
    v3 = off_1002ADC60[a3];
  return v3;
}

+ (id)describeCategory:(unint64_t)a3
{
  if (a3 - 1 > 0x17)
    return CFSTR("Unknown Category");
  else
    return off_1002ADCC0[a3 - 1];
}

- (id)describeCategory
{
  return +[MOEvent describeCategory:](MOEvent, "describeCategory:", -[MOEvent category](self, "category"));
}

- (id)describeProvider
{
  return +[MOEvent describeProvider:](MOEvent, "describeProvider:", -[MOEvent provider](self, "provider"));
}

- (unint64_t)photoMomentSource
{
  unint64_t result;

  result = (unint64_t)self->_photoEvent;
  if (result)
    return (unint64_t)objc_msgSend((id)result, "photoMomentSource");
  return result;
}

- (MOEventExtendedAttributes)extendedAttributes
{
  MOEventPhoto *photoEvent;

  photoEvent = self->_photoEvent;
  if (photoEvent)
    photoEvent = (MOEventPhoto *)objc_claimAutoreleasedReturnValue(-[MOEventPhoto extendedAttributes](photoEvent, "extendedAttributes"));
  return (MOEventExtendedAttributes *)photoEvent;
}

- (PHAsset)photoAsset
{
  MOEventPhoto *photoEvent;

  photoEvent = self->_photoEvent;
  if (photoEvent)
    photoEvent = (MOEventPhoto *)objc_claimAutoreleasedReturnValue(-[MOEventPhoto photoAsset](photoEvent, "photoAsset"));
  return (PHAsset *)photoEvent;
}

- (NSString)photoMemoryTitle
{
  MOEventPhoto *photoEvent;

  photoEvent = self->_photoEvent;
  if (photoEvent)
    photoEvent = (MOEventPhoto *)objc_claimAutoreleasedReturnValue(-[MOEventPhoto photoMemoryTitle](photoEvent, "photoMemoryTitle"));
  return (NSString *)photoEvent;
}

- (NSArray)photoMemoryAssets
{
  MOEventPhoto *photoEvent;

  photoEvent = self->_photoEvent;
  if (photoEvent)
    photoEvent = (MOEventPhoto *)objc_claimAutoreleasedReturnValue(-[MOEventPhoto photoMemoryAssets](photoEvent, "photoMemoryAssets"));
  return (NSArray *)photoEvent;
}

- (unint64_t)photoMemoryCategory
{
  unint64_t result;

  result = (unint64_t)self->_photoEvent;
  if (result)
    return (unint64_t)objc_msgSend((id)result, "photoMemoryCategory");
  return result;
}

- (unint64_t)timeAtHomeSubType
{
  unint64_t result;

  result = (unint64_t)self->_analyticsEvent;
  if (result)
    return (unint64_t)objc_msgSend((id)result, "timeAtHomeSubType");
  return result;
}

- (BOOL)isHighConfidence
{
  MOEventRoutine *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
    LOBYTE(routineEvent) = -[MOEventRoutine isHighConfidence](routineEvent, "isHighConfidence");
  return (char)routineEvent;
}

- (BOOL)isInvalid
{
  MOEventRoutine *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
    LOBYTE(routineEvent) = -[MOEventRoutine isInvalid](routineEvent, "isInvalid");
  return (char)routineEvent;
}

- (unint64_t)placeType
{
  unint64_t result;

  result = (unint64_t)self->_routineEvent;
  if (result)
    return (unint64_t)objc_msgSend((id)result, "placeType");
  return result;
}

- (unint64_t)placeUserType
{
  unint64_t result;

  result = (unint64_t)self->_routineEvent;
  if (result)
    return (unint64_t)objc_msgSend((id)result, "placeUserType");
  return result;
}

- (NSString)placeName
{
  MOEventRoutine *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
    routineEvent = (MOEventRoutine *)objc_claimAutoreleasedReturnValue(-[MOEventRoutine placeName](routineEvent, "placeName"));
  return (NSString *)routineEvent;
}

- (double)placeNameConfidence
{
  MOEventRoutine *routineEvent;
  double result;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
    return 0.0;
  -[MOEventRoutine placeNameConfidence](routineEvent, "placeNameConfidence");
  return result;
}

- (unint64_t)placeDiscovery
{
  unint64_t result;

  result = (unint64_t)self->_routineEvent;
  if (result)
    return (unint64_t)objc_msgSend((id)result, "placeDiscovery");
  return result;
}

- (RTLocation)location
{
  MOEventRoutine *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
    routineEvent = (MOEventRoutine *)objc_claimAutoreleasedReturnValue(-[MOEventRoutine location](routineEvent, "location"));
  return (RTLocation *)routineEvent;
}

- (RTAddress)address
{
  MOEventRoutine *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
    routineEvent = (MOEventRoutine *)objc_claimAutoreleasedReturnValue(-[MOEventRoutine address](routineEvent, "address"));
  return (RTAddress *)routineEvent;
}

- (GEOAddressObject)geoAddressObject
{
  MOEventRoutine *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
    routineEvent = (MOEventRoutine *)objc_claimAutoreleasedReturnValue(-[MOEventRoutine geoAddressObject](routineEvent, "geoAddressObject"));
  return (GEOAddressObject *)routineEvent;
}

- (unint64_t)mode
{
  unint64_t result;

  result = (unint64_t)self->_routineEvent;
  if (result)
    return (unint64_t)objc_msgSend((id)result, "mode");
  return result;
}

- (NSData)placeMapItem
{
  MOEventRoutine *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
    routineEvent = (MOEventRoutine *)objc_claimAutoreleasedReturnValue(-[MOEventRoutine placeMapItem](routineEvent, "placeMapItem"));
  return (NSData *)routineEvent;
}

- (NSString)poiCategory
{
  MOEventRoutine *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
    routineEvent = (MOEventRoutine *)objc_claimAutoreleasedReturnValue(-[MOEventRoutine poiCategory](routineEvent, "poiCategory"));
  return (NSString *)routineEvent;
}

- (unint64_t)placeSource
{
  unint64_t result;

  result = (unint64_t)self->_routineEvent;
  if (result)
    return (unint64_t)objc_msgSend((id)result, "placeSource");
  return result;
}

- (double)familiarityIndexLOI
{
  MOEventRoutine *routineEvent;
  double result;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
    return 0.0;
  -[MOEventRoutine familiarityIndexLOI](routineEvent, "familiarityIndexLOI");
  return result;
}

- (NSString)workoutType
{
  MOEventWorkout *workoutEvent;

  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
    workoutEvent = (MOEventWorkout *)objc_claimAutoreleasedReturnValue(-[MOEventWorkout workoutType](workoutEvent, "workoutType"));
  return (NSString *)workoutEvent;
}

- (NSNumber)workoutTotalDistance
{
  MOEventWorkout *workoutEvent;

  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
    workoutEvent = (MOEventWorkout *)objc_claimAutoreleasedReturnValue(-[MOEventWorkout workoutTotalDistance](workoutEvent, "workoutTotalDistance"));
  return (NSNumber *)workoutEvent;
}

- (NSNumber)workoutTotalEnergyBurned
{
  MOEventWorkout *workoutEvent;

  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
    workoutEvent = (MOEventWorkout *)objc_claimAutoreleasedReturnValue(-[MOEventWorkout workoutTotalEnergyBurned](workoutEvent, "workoutTotalEnergyBurned"));
  return (NSNumber *)workoutEvent;
}

- (NSNumber)workoutDuration
{
  MOEventWorkout *workoutEvent;

  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
    workoutEvent = (MOEventWorkout *)objc_claimAutoreleasedReturnValue(-[MOEventWorkout workoutDuration](workoutEvent, "workoutDuration"));
  return (NSNumber *)workoutEvent;
}

- (CLLocation)workoutLocationStart
{
  MOEventWorkout *workoutEvent;

  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
    workoutEvent = (MOEventWorkout *)objc_claimAutoreleasedReturnValue(-[MOEventWorkout workoutLocationStart](workoutEvent, "workoutLocationStart"));
  return (CLLocation *)workoutEvent;
}

- (NSArray)workoutLocationRoute
{
  MOEventWorkout *workoutEvent;

  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
    workoutEvent = (MOEventWorkout *)objc_claimAutoreleasedReturnValue(-[MOEventWorkout workoutLocationRoute](workoutEvent, "workoutLocationRoute"));
  return (NSArray *)workoutEvent;
}

- (NSNumber)motionStepCount
{
  MOEventMotionActivity *motionActivityEvent;

  motionActivityEvent = self->_motionActivityEvent;
  if (motionActivityEvent)
    motionActivityEvent = (MOEventMotionActivity *)objc_claimAutoreleasedReturnValue(-[MOEventMotionActivity motionStepCount](motionActivityEvent, "motionStepCount"));
  return (NSNumber *)motionActivityEvent;
}

- (BOOL)isFitnessPlusSession
{
  MOEventWorkout *workoutEvent;

  workoutEvent = self->_workoutEvent;
  if (workoutEvent)
    LOBYTE(workoutEvent) = -[MOEventWorkout isFitnessPlusSession](workoutEvent, "isFitnessPlusSession");
  return (char)workoutEvent;
}

- (NSString)suggestedEventTitle
{
  MOEventProactiveSuggested *proactiveSuggestedEvent;

  proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
  if (proactiveSuggestedEvent)
    proactiveSuggestedEvent = (MOEventProactiveSuggested *)objc_claimAutoreleasedReturnValue(-[MOEventProactiveSuggested suggestedEventTitle](proactiveSuggestedEvent, "suggestedEventTitle"));
  return (NSString *)proactiveSuggestedEvent;
}

- (NSString)suggestedEventIdentifier
{
  MOEventProactiveSuggested *proactiveSuggestedEvent;

  proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
  if (proactiveSuggestedEvent)
    proactiveSuggestedEvent = (MOEventProactiveSuggested *)objc_claimAutoreleasedReturnValue(-[MOEventProactiveSuggested suggestedEventIdentifier](proactiveSuggestedEvent, "suggestedEventIdentifier"));
  return (NSString *)proactiveSuggestedEvent;
}

- (unint64_t)suggestedEventCategory
{
  unint64_t result;

  result = (unint64_t)self->_proactiveSuggestedEvent;
  if (result)
    return (unint64_t)objc_msgSend((id)result, "suggestedEventCategory");
  return result;
}

- (PPEvent)suggestedEvent
{
  MOEventProactiveSuggested *proactiveSuggestedEvent;

  proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
  if (proactiveSuggestedEvent)
    proactiveSuggestedEvent = (MOEventProactiveSuggested *)objc_claimAutoreleasedReturnValue(-[MOEventProactiveSuggested suggestedEvent](proactiveSuggestedEvent, "suggestedEvent"));
  return (PPEvent *)proactiveSuggestedEvent;
}

- (NSString)tripTitle
{
  MOEventTravel *travelEvent;

  travelEvent = self->_travelEvent;
  if (travelEvent)
    travelEvent = (MOEventTravel *)objc_claimAutoreleasedReturnValue(-[MOEventTravel tripTitle](travelEvent, "tripTitle"));
  return (NSString *)travelEvent;
}

- (NSArray)tripParts
{
  MOEventTravel *travelEvent;

  travelEvent = self->_travelEvent;
  if (travelEvent)
    travelEvent = (MOEventTravel *)objc_claimAutoreleasedReturnValue(-[MOEventTravel tripParts](travelEvent, "tripParts"));
  return (NSArray *)travelEvent;
}

- (NSString)mediaTitle
{
  MOEventMedia *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
    mediaEvent = (MOEventMedia *)objc_claimAutoreleasedReturnValue(-[MOEventMedia mediaTitle](mediaEvent, "mediaTitle"));
  return (NSString *)mediaEvent;
}

- (NSString)mediaAlbum
{
  MOEventMedia *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
    mediaEvent = (MOEventMedia *)objc_claimAutoreleasedReturnValue(-[MOEventMedia mediaAlbum](mediaEvent, "mediaAlbum"));
  return (NSString *)mediaEvent;
}

- (NSString)mediaPlayerBundleId
{
  MOEventMedia *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
    mediaEvent = (MOEventMedia *)objc_claimAutoreleasedReturnValue(-[MOEventMedia mediaPlayerBundleId](mediaEvent, "mediaPlayerBundleId"));
  return (NSString *)mediaEvent;
}

- (NSString)mediaProductId
{
  MOEventMedia *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
    mediaEvent = (MOEventMedia *)objc_claimAutoreleasedReturnValue(-[MOEventMedia mediaProductId](mediaEvent, "mediaProductId"));
  return (NSString *)mediaEvent;
}

- (NSString)mediaGenre
{
  MOEventMedia *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
    mediaEvent = (MOEventMedia *)objc_claimAutoreleasedReturnValue(-[MOEventMedia mediaGenre](mediaEvent, "mediaGenre"));
  return (NSString *)mediaEvent;
}

- (NSString)mediaType
{
  MOEventMedia *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
    mediaEvent = (MOEventMedia *)objc_claimAutoreleasedReturnValue(-[MOEventMedia mediaType](mediaEvent, "mediaType"));
  return (NSString *)mediaEvent;
}

- (NSString)mediaArtist
{
  MOEventMedia *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
    mediaEvent = (MOEventMedia *)objc_claimAutoreleasedReturnValue(-[MOEventMedia mediaArtist](mediaEvent, "mediaArtist"));
  return (NSString *)mediaEvent;
}

- (NSNumber)mediaRepetitions
{
  MOEventMedia *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
    mediaEvent = (MOEventMedia *)objc_claimAutoreleasedReturnValue(-[MOEventMedia mediaRepetitions](mediaEvent, "mediaRepetitions"));
  return (NSNumber *)mediaEvent;
}

- (NSNumber)mediaSumTimePlayed
{
  MOEventMedia *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
    mediaEvent = (MOEventMedia *)objc_claimAutoreleasedReturnValue(-[MOEventMedia mediaSumTimePlayed](mediaEvent, "mediaSumTimePlayed"));
  return (NSNumber *)mediaEvent;
}

- (NSArray)mediaPlaySessions
{
  MOEventMedia *mediaEvent;

  mediaEvent = self->_mediaEvent;
  if (mediaEvent)
    mediaEvent = (MOEventMedia *)objc_claimAutoreleasedReturnValue(-[MOEventMedia mediaPlaySessions](mediaEvent, "mediaPlaySessions"));
  return (NSArray *)mediaEvent;
}

- (MOWeather)predominantWeather
{
  MOEventRoutine *routineEvent;

  routineEvent = self->_routineEvent;
  if (routineEvent)
    routineEvent = (MOEventRoutine *)objc_claimAutoreleasedReturnValue(-[MOEventRoutine predominantWeather](routineEvent, "predominantWeather"));
  return (MOWeather *)routineEvent;
}

- (NSURL)itemURL
{
  MOEventSharedWithYou *sharedWithYouEvent;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
    sharedWithYouEvent = (MOEventSharedWithYou *)objc_claimAutoreleasedReturnValue(-[MOEventSharedWithYou itemURL](sharedWithYouEvent, "itemURL"));
  return (NSURL *)sharedWithYouEvent;
}

- (NSArray)itemSenders
{
  MOEventSharedWithYou *sharedWithYouEvent;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
    sharedWithYouEvent = (MOEventSharedWithYou *)objc_claimAutoreleasedReturnValue(-[MOEventSharedWithYou itemSenders](sharedWithYouEvent, "itemSenders"));
  return (NSArray *)sharedWithYouEvent;
}

- (NSArray)itemRecipients
{
  MOEventSharedWithYou *sharedWithYouEvent;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
    sharedWithYouEvent = (MOEventSharedWithYou *)objc_claimAutoreleasedReturnValue(-[MOEventSharedWithYou itemRecipients](sharedWithYouEvent, "itemRecipients"));
  return (NSArray *)sharedWithYouEvent;
}

- (unint64_t)itemShareDirection
{
  unint64_t result;

  result = (unint64_t)self->_sharedWithYouEvent;
  if (result)
    return (unint64_t)objc_msgSend((id)result, "itemShareDirection");
  return result;
}

- (BOOL)itemIsPinned
{
  MOEventSharedWithYou *sharedWithYouEvent;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
    LOBYTE(sharedWithYouEvent) = -[MOEventSharedWithYou itemIsPinned](sharedWithYouEvent, "itemIsPinned");
  return (char)sharedWithYouEvent;
}

- (unint64_t)itemSyndicationStatus
{
  MOEventSharedWithYou *sharedWithYouEvent;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
    return -[MOEventSharedWithYou itemSyndicationStatus](sharedWithYouEvent, "itemSyndicationStatus");
  else
    return 1;
}

- (NSNumber)itemAttributionsCount
{
  MOEventSharedWithYou *sharedWithYouEvent;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (sharedWithYouEvent)
    sharedWithYouEvent = (MOEventSharedWithYou *)objc_claimAutoreleasedReturnValue(-[MOEventSharedWithYou itemAttributionsCount](sharedWithYouEvent, "itemAttributionsCount"));
  return (NSNumber *)sharedWithYouEvent;
}

- (NSNumber)interactionContactScore
{
  MOEventSignificantContact *significantContactEvent;

  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
    significantContactEvent = (MOEventSignificantContact *)objc_claimAutoreleasedReturnValue(-[MOEventSignificantContact interactionContactScore](significantContactEvent, "interactionContactScore"));
  return (NSNumber *)significantContactEvent;
}

- (PPScoredContact)interactionScoredContact
{
  MOEventSignificantContact *significantContactEvent;

  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
    significantContactEvent = (MOEventSignificantContact *)objc_claimAutoreleasedReturnValue(-[MOEventSignificantContact interactionScoredContact](significantContactEvent, "interactionScoredContact"));
  return (PPScoredContact *)significantContactEvent;
}

- (NSString)interactionGroupName
{
  MOEventSignificantContact *significantContactEvent;

  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
    significantContactEvent = (MOEventSignificantContact *)objc_claimAutoreleasedReturnValue(-[MOEventSignificantContact interactionGroupName](significantContactEvent, "interactionGroupName"));
  return (NSString *)significantContactEvent;
}

- (NSArray)interactionContacts
{
  MOEventSignificantContact *significantContactEvent;

  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
    significantContactEvent = (MOEventSignificantContact *)objc_claimAutoreleasedReturnValue(-[MOEventSignificantContact interactionContacts](significantContactEvent, "interactionContacts"));
  return (NSArray *)significantContactEvent;
}

- (NSDictionary)contactClassificationMap
{
  MOEventSignificantContact *significantContactEvent;

  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
    significantContactEvent = (MOEventSignificantContact *)objc_claimAutoreleasedReturnValue(-[MOEventSignificantContact contactClassificationMap](significantContactEvent, "contactClassificationMap"));
  return (NSDictionary *)significantContactEvent;
}

- (NSSet)interactionMechanisms
{
  MOEventSignificantContact *significantContactEvent;

  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
    significantContactEvent = (MOEventSignificantContact *)objc_claimAutoreleasedReturnValue(-[MOEventSignificantContact interactionMechanisms](significantContactEvent, "interactionMechanisms"));
  return (NSSet *)significantContactEvent;
}

- (NSArray)interactions
{
  MOEventSignificantContact *significantContactEvent;

  significantContactEvent = self->_significantContactEvent;
  if (significantContactEvent)
    significantContactEvent = (MOEventSignificantContact *)objc_claimAutoreleasedReturnValue(-[MOEventSignificantContact interactions](significantContactEvent, "interactions"));
  return (NSArray *)significantContactEvent;
}

- (BOOL)isGComplete
{
  MOEventPeopleDiscovery *peopleDiscoveryEvent;

  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (peopleDiscoveryEvent)
    LOBYTE(peopleDiscoveryEvent) = -[MOEventPeopleDiscovery isGComplete](peopleDiscoveryEvent, "isGComplete");
  return (char)peopleDiscoveryEvent;
}

- (int64_t)gaPR
{
  int64_t result;

  result = (int64_t)self->_peopleDiscoveryEvent;
  if (result)
    return (int64_t)objc_msgSend((id)result, "gaPR");
  return result;
}

- (NSNumber)pCount
{
  MOEventPeopleDiscovery *peopleDiscoveryEvent;

  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (peopleDiscoveryEvent)
    peopleDiscoveryEvent = (MOEventPeopleDiscovery *)objc_claimAutoreleasedReturnValue(-[MOEventPeopleDiscovery pCount](peopleDiscoveryEvent, "pCount"));
  return (NSNumber *)peopleDiscoveryEvent;
}

- (NSNumber)densityScore
{
  MOEventPeopleDiscovery *peopleDiscoveryEvent;

  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (peopleDiscoveryEvent)
    peopleDiscoveryEvent = (MOEventPeopleDiscovery *)objc_claimAutoreleasedReturnValue(-[MOEventPeopleDiscovery densityScore](peopleDiscoveryEvent, "densityScore"));
  return (NSNumber *)peopleDiscoveryEvent;
}

- (NSNumber)densityScanDuration
{
  MOEventPeopleDiscovery *peopleDiscoveryEvent;

  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (peopleDiscoveryEvent)
    peopleDiscoveryEvent = (MOEventPeopleDiscovery *)objc_claimAutoreleasedReturnValue(-[MOEventPeopleDiscovery densityScanDuration](peopleDiscoveryEvent, "densityScanDuration"));
  return (NSNumber *)peopleDiscoveryEvent;
}

- (NSDictionary)scoredTopics
{
  MOEventPortrait *portraitEvent;

  portraitEvent = self->_portraitEvent;
  if (portraitEvent)
    portraitEvent = (MOEventPortrait *)objc_claimAutoreleasedReturnValue(-[MOEventPortrait scoredTopics](portraitEvent, "scoredTopics"));
  return (NSDictionary *)portraitEvent;
}

- (unint64_t)motionType
{
  unint64_t result;

  result = (unint64_t)self->_motionActivityEvent;
  if (result)
    return (unint64_t)objc_msgSend((id)result, "motionType");
  return result;
}

- (NSDictionary)trends
{
  MOEventAnalytics *analyticsEvent;

  analyticsEvent = self->_analyticsEvent;
  if (analyticsEvent)
    analyticsEvent = (MOEventAnalytics *)objc_claimAutoreleasedReturnValue(-[MOEventAnalytics trends](analyticsEvent, "trends"));
  return (NSDictionary *)analyticsEvent;
}

- (NSDictionary)patterns
{
  MOEventAnalytics *analyticsEvent;

  analyticsEvent = self->_analyticsEvent;
  if (analyticsEvent)
    analyticsEvent = (MOEventAnalytics *)objc_claimAutoreleasedReturnValue(-[MOEventAnalytics patterns](analyticsEvent, "patterns"));
  return (NSDictionary *)analyticsEvent;
}

- (unint64_t)lifeEventCategory
{
  unint64_t result;

  result = (unint64_t)self->_lifeEventsEvent;
  if (result)
    return (unint64_t)objc_msgSend((id)result, "lifeEventCategory");
  return result;
}

- (double)confidenceScore
{
  MOEventLifeEvents *lifeEventsEvent;
  double result;

  lifeEventsEvent = self->_lifeEventsEvent;
  if (!lifeEventsEvent)
    return 0.0;
  -[MOEventLifeEvents confidenceScore](lifeEventsEvent, "confidenceScore");
  return result;
}

- (void)setPhotoMomentSource:(unint64_t)a3
{
  MOEventPhoto *photoEvent;
  MOEventPhoto *v6;
  MOEventPhoto *v7;

  photoEvent = self->_photoEvent;
  if (!photoEvent)
  {
    v6 = objc_alloc_init(MOEventPhoto);
    v7 = self->_photoEvent;
    self->_photoEvent = v6;

    photoEvent = self->_photoEvent;
  }
  -[MOEventPhoto setPhotoMomentSource:](photoEvent, "setPhotoMomentSource:", a3);
}

- (void)setExtendedAttributes:(id)a3
{
  id v4;
  MOEventPhoto *photoEvent;
  MOEventPhoto *v6;
  MOEventPhoto *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    photoEvent = self->_photoEvent;
    v8 = v4;
    if (!photoEvent)
    {
      v6 = objc_alloc_init(MOEventPhoto);
      v7 = self->_photoEvent;
      self->_photoEvent = v6;

      photoEvent = self->_photoEvent;
    }
    -[MOEventPhoto setExtendedAttributes:](photoEvent, "setExtendedAttributes:", v8);
    v4 = v8;
  }

}

- (void)setPhotoAsset:(id)a3
{
  id v4;
  MOEventPhoto *photoEvent;
  MOEventPhoto *v6;
  MOEventPhoto *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    photoEvent = self->_photoEvent;
    v8 = v4;
    if (!photoEvent)
    {
      v6 = objc_alloc_init(MOEventPhoto);
      v7 = self->_photoEvent;
      self->_photoEvent = v6;

      photoEvent = self->_photoEvent;
    }
    -[MOEventPhoto setPhotoAsset:](photoEvent, "setPhotoAsset:", v8);
    v4 = v8;
  }

}

- (void)setPhotoMemoryTitle:(id)a3
{
  id v4;
  MOEventPhoto *photoEvent;
  MOEventPhoto *v6;
  MOEventPhoto *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    photoEvent = self->_photoEvent;
    v8 = v4;
    if (!photoEvent)
    {
      v6 = objc_alloc_init(MOEventPhoto);
      v7 = self->_photoEvent;
      self->_photoEvent = v6;

      photoEvent = self->_photoEvent;
    }
    -[MOEventPhoto setPhotoMemoryTitle:](photoEvent, "setPhotoMemoryTitle:", v8);
    v4 = v8;
  }

}

- (void)setPhotoMemoryAssets:(id)a3
{
  id v4;
  MOEventPhoto *photoEvent;
  MOEventPhoto *v6;
  MOEventPhoto *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    photoEvent = self->_photoEvent;
    v8 = v4;
    if (!photoEvent)
    {
      v6 = objc_alloc_init(MOEventPhoto);
      v7 = self->_photoEvent;
      self->_photoEvent = v6;

      photoEvent = self->_photoEvent;
    }
    -[MOEventPhoto setPhotoMemoryAssets:](photoEvent, "setPhotoMemoryAssets:", v8);
    v4 = v8;
  }

}

- (void)setPhotoMemoryCategory:(unint64_t)a3
{
  MOEventPhoto *photoEvent;
  MOEventPhoto *v6;
  MOEventPhoto *v7;

  photoEvent = self->_photoEvent;
  if (!photoEvent)
  {
    v6 = objc_alloc_init(MOEventPhoto);
    v7 = self->_photoEvent;
    self->_photoEvent = v6;

    photoEvent = self->_photoEvent;
  }
  -[MOEventPhoto setPhotoMemoryCategory:](photoEvent, "setPhotoMemoryCategory:", a3);
}

- (void)setTimeAtHomeSubType:(unint64_t)a3
{
  MOEventAnalytics *analyticsEvent;
  MOEventAnalytics *v6;
  MOEventAnalytics *v7;

  analyticsEvent = self->_analyticsEvent;
  if (!analyticsEvent)
  {
    v6 = objc_alloc_init(MOEventAnalytics);
    v7 = self->_analyticsEvent;
    self->_analyticsEvent = v6;

    analyticsEvent = self->_analyticsEvent;
  }
  -[MOEventAnalytics setTimeAtHomeSubType:](analyticsEvent, "setTimeAtHomeSubType:", a3);
}

- (void)setIsHighConfidence:(BOOL)a3
{
  _BOOL8 v3;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  v3 = a3;
  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setIsHighConfidence:](routineEvent, "setIsHighConfidence:", v3);
}

- (void)setIsInvalid:(BOOL)a3
{
  _BOOL8 v3;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  v3 = a3;
  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setIsInvalid:](routineEvent, "setIsInvalid:", v3);
}

- (void)setPlaceType:(unint64_t)a3
{
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setPlaceType:](routineEvent, "setPlaceType:", a3);
}

- (void)setPlaceUserType:(unint64_t)a3
{
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setPlaceUserType:](routineEvent, "setPlaceUserType:", a3);
}

- (void)setPlaceName:(id)a3
{
  id v4;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    -[MOEventRoutine setPlaceName:](routineEvent, "setPlaceName:", v8);
    v4 = v8;
  }

}

- (void)setPlaceNameConfidence:(double)a3
{
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setPlaceNameConfidence:](routineEvent, "setPlaceNameConfidence:", a3);
}

- (void)setPlaceDiscovery:(unint64_t)a3
{
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setPlaceDiscovery:](routineEvent, "setPlaceDiscovery:", a3);
}

- (void)setLocation:(id)a3
{
  id v4;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    -[MOEventRoutine setLocation:](routineEvent, "setLocation:", v8);
    v4 = v8;
  }

}

- (void)setAddress:(id)a3
{
  id v4;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    -[MOEventRoutine setAddress:](routineEvent, "setAddress:", v8);
    v4 = v8;
  }

}

- (void)setGeoAddressObject:(id)a3
{
  id v4;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    -[MOEventRoutine setGeoAddressObject:](routineEvent, "setGeoAddressObject:", v8);
    v4 = v8;
  }

}

- (void)setMode:(unint64_t)a3
{
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setMode:](routineEvent, "setMode:", a3);
}

- (void)setPlaceMapItem:(id)a3
{
  id v4;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    -[MOEventRoutine setPlaceMapItem:](routineEvent, "setPlaceMapItem:", v8);
    v4 = v8;
  }

}

- (void)setPoiCategory:(id)a3
{
  id v4;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    -[MOEventRoutine setPoiCategory:](routineEvent, "setPoiCategory:", v8);
    v4 = v8;
  }

}

- (void)setPlaceSource:(unint64_t)a3
{
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setPlaceSource:](routineEvent, "setPlaceSource:", a3);
}

- (void)setFamiliarityIndexLOI:(double)a3
{
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;

  routineEvent = self->_routineEvent;
  if (!routineEvent)
  {
    v6 = objc_alloc_init(MOEventRoutine);
    v7 = self->_routineEvent;
    self->_routineEvent = v6;

    routineEvent = self->_routineEvent;
  }
  -[MOEventRoutine setFamiliarityIndexLOI:](routineEvent, "setFamiliarityIndexLOI:", a3);
}

- (void)setWorkoutType:(id)a3
{
  id v4;
  MOEventWorkout *workoutEvent;
  MOEventWorkout *v6;
  MOEventWorkout *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    -[MOEventWorkout setWorkoutType:](workoutEvent, "setWorkoutType:", v8);
    v4 = v8;
  }

}

- (void)setWorkoutTotalDistance:(id)a3
{
  id v4;
  MOEventWorkout *workoutEvent;
  MOEventWorkout *v6;
  MOEventWorkout *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    -[MOEventWorkout setWorkoutTotalDistance:](workoutEvent, "setWorkoutTotalDistance:", v8);
    v4 = v8;
  }

}

- (void)setWorkoutTotalEnergyBurned:(id)a3
{
  id v4;
  MOEventWorkout *workoutEvent;
  MOEventWorkout *v6;
  MOEventWorkout *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    -[MOEventWorkout setWorkoutTotalEnergyBurned:](workoutEvent, "setWorkoutTotalEnergyBurned:", v8);
    v4 = v8;
  }

}

- (void)setWorkoutDuration:(id)a3
{
  id v4;
  MOEventWorkout *workoutEvent;
  MOEventWorkout *v6;
  MOEventWorkout *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    -[MOEventWorkout setWorkoutDuration:](workoutEvent, "setWorkoutDuration:", v8);
    v4 = v8;
  }

}

- (void)setWorkoutLocationStart:(id)a3
{
  id v4;
  MOEventWorkout *workoutEvent;
  MOEventWorkout *v6;
  MOEventWorkout *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    -[MOEventWorkout setWorkoutLocationStart:](workoutEvent, "setWorkoutLocationStart:", v8);
    v4 = v8;
  }

}

- (void)setWorkoutLocationRoute:(id)a3
{
  id v4;
  MOEventWorkout *workoutEvent;
  MOEventWorkout *v6;
  MOEventWorkout *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    workoutEvent = self->_workoutEvent;
    v8 = v4;
    if (!workoutEvent)
    {
      v6 = objc_alloc_init(MOEventWorkout);
      v7 = self->_workoutEvent;
      self->_workoutEvent = v6;

      workoutEvent = self->_workoutEvent;
    }
    -[MOEventWorkout setWorkoutLocationRoute:](workoutEvent, "setWorkoutLocationRoute:", v8);
    v4 = v8;
  }

}

- (void)setMotionStepCount:(id)a3
{
  id v4;
  MOEventMotionActivity *motionActivityEvent;
  MOEventMotionActivity *v6;
  MOEventMotionActivity *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    motionActivityEvent = self->_motionActivityEvent;
    v8 = v4;
    if (!motionActivityEvent)
    {
      v6 = objc_alloc_init(MOEventMotionActivity);
      v7 = self->_motionActivityEvent;
      self->_motionActivityEvent = v6;

      motionActivityEvent = self->_motionActivityEvent;
    }
    -[MOEventMotionActivity setMotionStepCount:](motionActivityEvent, "setMotionStepCount:", v8);
    v4 = v8;
  }

}

- (void)setIsFitnessPlusSession:(BOOL)a3
{
  _BOOL8 v3;
  MOEventWorkout *workoutEvent;
  MOEventWorkout *v6;
  MOEventWorkout *v7;

  v3 = a3;
  workoutEvent = self->_workoutEvent;
  if (!workoutEvent)
  {
    v6 = objc_alloc_init(MOEventWorkout);
    v7 = self->_workoutEvent;
    self->_workoutEvent = v6;

    workoutEvent = self->_workoutEvent;
  }
  -[MOEventWorkout setIsFitnessPlusSession:](workoutEvent, "setIsFitnessPlusSession:", v3);
}

- (void)setSuggestedEventTitle:(id)a3
{
  id v4;
  MOEventProactiveSuggested *proactiveSuggestedEvent;
  MOEventProactiveSuggested *v6;
  MOEventProactiveSuggested *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    v8 = v4;
    if (!proactiveSuggestedEvent)
    {
      v6 = objc_alloc_init(MOEventProactiveSuggested);
      v7 = self->_proactiveSuggestedEvent;
      self->_proactiveSuggestedEvent = v6;

      proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    }
    -[MOEventProactiveSuggested setSuggestedEventTitle:](proactiveSuggestedEvent, "setSuggestedEventTitle:", v8);
    v4 = v8;
  }

}

- (void)setSuggestedEventIdentifier:(id)a3
{
  id v4;
  MOEventProactiveSuggested *proactiveSuggestedEvent;
  MOEventProactiveSuggested *v6;
  MOEventProactiveSuggested *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    v8 = v4;
    if (!proactiveSuggestedEvent)
    {
      v6 = objc_alloc_init(MOEventProactiveSuggested);
      v7 = self->_proactiveSuggestedEvent;
      self->_proactiveSuggestedEvent = v6;

      proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    }
    -[MOEventProactiveSuggested setSuggestedEventIdentifier:](proactiveSuggestedEvent, "setSuggestedEventIdentifier:", v8);
    v4 = v8;
  }

}

- (void)setSuggestedEventCategory:(unint64_t)a3
{
  MOEventProactiveSuggested *proactiveSuggestedEvent;
  MOEventProactiveSuggested *v6;
  MOEventProactiveSuggested *v7;

  proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
  if (!proactiveSuggestedEvent)
  {
    v6 = objc_alloc_init(MOEventProactiveSuggested);
    v7 = self->_proactiveSuggestedEvent;
    self->_proactiveSuggestedEvent = v6;

    proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
  }
  -[MOEventProactiveSuggested setSuggestedEventCategory:](proactiveSuggestedEvent, "setSuggestedEventCategory:", a3);
}

- (void)setSuggestedEvent:(id)a3
{
  id v4;
  MOEventProactiveSuggested *proactiveSuggestedEvent;
  MOEventProactiveSuggested *v6;
  MOEventProactiveSuggested *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    v8 = v4;
    if (!proactiveSuggestedEvent)
    {
      v6 = objc_alloc_init(MOEventProactiveSuggested);
      v7 = self->_proactiveSuggestedEvent;
      self->_proactiveSuggestedEvent = v6;

      proactiveSuggestedEvent = self->_proactiveSuggestedEvent;
    }
    -[MOEventProactiveSuggested setSuggestedEvent:](proactiveSuggestedEvent, "setSuggestedEvent:", v8);
    v4 = v8;
  }

}

- (void)setTripTitle:(id)a3
{
  id v4;
  MOEventTravel *travelEvent;
  MOEventTravel *v6;
  MOEventTravel *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    travelEvent = self->_travelEvent;
    v8 = v4;
    if (!travelEvent)
    {
      v6 = objc_alloc_init(MOEventTravel);
      v7 = self->_travelEvent;
      self->_travelEvent = v6;

      travelEvent = self->_travelEvent;
    }
    -[MOEventTravel setTripTitle:](travelEvent, "setTripTitle:", v8);
    v4 = v8;
  }

}

- (void)setTripParts:(id)a3
{
  id v4;
  MOEventTravel *travelEvent;
  MOEventTravel *v6;
  MOEventTravel *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    travelEvent = self->_travelEvent;
    v8 = v4;
    if (!travelEvent)
    {
      v6 = objc_alloc_init(MOEventTravel);
      v7 = self->_travelEvent;
      self->_travelEvent = v6;

      travelEvent = self->_travelEvent;
    }
    -[MOEventTravel setTripParts:](travelEvent, "setTripParts:", v8);
    v4 = v8;
  }

}

- (void)setMediaTitle:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaTitle:](mediaEvent, "setMediaTitle:", v8);
    v4 = v8;
  }

}

- (void)setMediaAlbum:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaAlbum:](mediaEvent, "setMediaAlbum:", v8);
    v4 = v8;
  }

}

- (void)setMediaPlayerBundleId:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaPlayerBundleId:](mediaEvent, "setMediaPlayerBundleId:", v8);
    v4 = v8;
  }

}

- (void)setMediaProductId:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaProductId:](mediaEvent, "setMediaProductId:", v8);
    v4 = v8;
  }

}

- (void)setMediaGenre:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaGenre:](mediaEvent, "setMediaGenre:", v8);
    v4 = v8;
  }

}

- (void)setMediaType:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaType:](mediaEvent, "setMediaType:", v8);
    v4 = v8;
  }

}

- (void)setMediaArtist:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaArtist:](mediaEvent, "setMediaArtist:", v8);
    v4 = v8;
  }

}

- (void)setMediaRepetitions:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaRepetitions:](mediaEvent, "setMediaRepetitions:", v8);
    v4 = v8;
  }

}

- (void)setMediaSumTimePlayed:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaSumTimePlayed:](mediaEvent, "setMediaSumTimePlayed:", v8);
    v4 = v8;
  }

}

- (void)setMediaPlaySessions:(id)a3
{
  id v4;
  MOEventMedia *mediaEvent;
  MOEventMedia *v6;
  MOEventMedia *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    mediaEvent = self->_mediaEvent;
    v8 = v4;
    if (!mediaEvent)
    {
      v6 = objc_alloc_init(MOEventMedia);
      v7 = self->_mediaEvent;
      self->_mediaEvent = v6;

      mediaEvent = self->_mediaEvent;
    }
    -[MOEventMedia setMediaPlaySessions:](mediaEvent, "setMediaPlaySessions:", v8);
    v4 = v8;
  }

}

- (void)setPredominantWeather:(id)a3
{
  id v4;
  MOEventRoutine *routineEvent;
  MOEventRoutine *v6;
  MOEventRoutine *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    routineEvent = self->_routineEvent;
    v8 = v4;
    if (!routineEvent)
    {
      v6 = objc_alloc_init(MOEventRoutine);
      v7 = self->_routineEvent;
      self->_routineEvent = v6;

      routineEvent = self->_routineEvent;
    }
    -[MOEventRoutine setPredominantWeather:](routineEvent, "setPredominantWeather:", v8);
    v4 = v8;
  }

}

- (void)setItemURL:(id)a3
{
  id v4;
  MOEventSharedWithYou *sharedWithYouEvent;
  MOEventSharedWithYou *v6;
  MOEventSharedWithYou *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    sharedWithYouEvent = self->_sharedWithYouEvent;
    v8 = v4;
    if (!sharedWithYouEvent)
    {
      v6 = objc_alloc_init(MOEventSharedWithYou);
      v7 = self->_sharedWithYouEvent;
      self->_sharedWithYouEvent = v6;

      sharedWithYouEvent = self->_sharedWithYouEvent;
    }
    -[MOEventSharedWithYou setItemURL:](sharedWithYouEvent, "setItemURL:", v8);
    v4 = v8;
  }

}

- (void)setItemSenders:(id)a3
{
  id v4;
  MOEventSharedWithYou *sharedWithYouEvent;
  MOEventSharedWithYou *v6;
  MOEventSharedWithYou *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    sharedWithYouEvent = self->_sharedWithYouEvent;
    v8 = v4;
    if (!sharedWithYouEvent)
    {
      v6 = objc_alloc_init(MOEventSharedWithYou);
      v7 = self->_sharedWithYouEvent;
      self->_sharedWithYouEvent = v6;

      sharedWithYouEvent = self->_sharedWithYouEvent;
    }
    -[MOEventSharedWithYou setItemSenders:](sharedWithYouEvent, "setItemSenders:", v8);
    v4 = v8;
  }

}

- (void)setItemRecipients:(id)a3
{
  id v4;
  MOEventSharedWithYou *sharedWithYouEvent;
  MOEventSharedWithYou *v6;
  MOEventSharedWithYou *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    sharedWithYouEvent = self->_sharedWithYouEvent;
    v8 = v4;
    if (!sharedWithYouEvent)
    {
      v6 = objc_alloc_init(MOEventSharedWithYou);
      v7 = self->_sharedWithYouEvent;
      self->_sharedWithYouEvent = v6;

      sharedWithYouEvent = self->_sharedWithYouEvent;
    }
    -[MOEventSharedWithYou setItemRecipients:](sharedWithYouEvent, "setItemRecipients:", v8);
    v4 = v8;
  }

}

- (void)setItemShareDirection:(unint64_t)a3
{
  MOEventSharedWithYou *sharedWithYouEvent;
  MOEventSharedWithYou *v6;
  MOEventSharedWithYou *v7;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (!sharedWithYouEvent)
  {
    v6 = objc_alloc_init(MOEventSharedWithYou);
    v7 = self->_sharedWithYouEvent;
    self->_sharedWithYouEvent = v6;

    sharedWithYouEvent = self->_sharedWithYouEvent;
  }
  -[MOEventSharedWithYou setItemShareDirection:](sharedWithYouEvent, "setItemShareDirection:", a3);
}

- (void)setItemIsPinned:(BOOL)a3
{
  _BOOL8 v3;
  MOEventSharedWithYou *sharedWithYouEvent;
  MOEventSharedWithYou *v6;
  MOEventSharedWithYou *v7;

  v3 = a3;
  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (!sharedWithYouEvent)
  {
    v6 = objc_alloc_init(MOEventSharedWithYou);
    v7 = self->_sharedWithYouEvent;
    self->_sharedWithYouEvent = v6;

    sharedWithYouEvent = self->_sharedWithYouEvent;
  }
  -[MOEventSharedWithYou setItemIsPinned:](sharedWithYouEvent, "setItemIsPinned:", v3);
}

- (void)setItemSyndicationStatus:(unint64_t)a3
{
  MOEventSharedWithYou *sharedWithYouEvent;
  MOEventSharedWithYou *v6;
  MOEventSharedWithYou *v7;

  sharedWithYouEvent = self->_sharedWithYouEvent;
  if (!sharedWithYouEvent)
  {
    v6 = objc_alloc_init(MOEventSharedWithYou);
    v7 = self->_sharedWithYouEvent;
    self->_sharedWithYouEvent = v6;

    sharedWithYouEvent = self->_sharedWithYouEvent;
  }
  -[MOEventSharedWithYou setItemSyndicationStatus:](sharedWithYouEvent, "setItemSyndicationStatus:", a3);
}

- (void)setItemAttributionsCount:(id)a3
{
  id v4;
  MOEventSharedWithYou *sharedWithYouEvent;
  MOEventSharedWithYou *v6;
  MOEventSharedWithYou *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    sharedWithYouEvent = self->_sharedWithYouEvent;
    v8 = v4;
    if (!sharedWithYouEvent)
    {
      v6 = objc_alloc_init(MOEventSharedWithYou);
      v7 = self->_sharedWithYouEvent;
      self->_sharedWithYouEvent = v6;

      sharedWithYouEvent = self->_sharedWithYouEvent;
    }
    -[MOEventSharedWithYou setItemAttributionsCount:](sharedWithYouEvent, "setItemAttributionsCount:", v8);
    v4 = v8;
  }

}

- (void)setInteractionContactScore:(id)a3
{
  id v4;
  MOEventSignificantContact *significantContactEvent;
  MOEventSignificantContact *v6;
  MOEventSignificantContact *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    -[MOEventSignificantContact setInteractionContactScore:](significantContactEvent, "setInteractionContactScore:", v8);
    v4 = v8;
  }

}

- (void)setInteractionScoredContact:(id)a3
{
  id v4;
  MOEventSignificantContact *significantContactEvent;
  MOEventSignificantContact *v6;
  MOEventSignificantContact *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    -[MOEventSignificantContact setInteractionScoredContact:](significantContactEvent, "setInteractionScoredContact:", v8);
    v4 = v8;
  }

}

- (void)setInteractionGroupName:(id)a3
{
  id v4;
  MOEventSignificantContact *significantContactEvent;
  MOEventSignificantContact *v6;
  MOEventSignificantContact *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    -[MOEventSignificantContact setInteractionGroupName:](significantContactEvent, "setInteractionGroupName:", v8);
    v4 = v8;
  }

}

- (void)setInteractionContacts:(id)a3
{
  id v4;
  MOEventSignificantContact *significantContactEvent;
  MOEventSignificantContact *v6;
  MOEventSignificantContact *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    -[MOEventSignificantContact setInteractionContacts:](significantContactEvent, "setInteractionContacts:", v8);
    v4 = v8;
  }

}

- (void)setContactClassificationMap:(id)a3
{
  id v4;
  MOEventSignificantContact *significantContactEvent;
  MOEventSignificantContact *v6;
  MOEventSignificantContact *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    -[MOEventSignificantContact setContactClassificationMap:](significantContactEvent, "setContactClassificationMap:", v8);
    v4 = v8;
  }

}

- (void)setInteractionMechanisms:(id)a3
{
  id v4;
  MOEventSignificantContact *significantContactEvent;
  MOEventSignificantContact *v6;
  MOEventSignificantContact *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    -[MOEventSignificantContact setInteractionMechanisms:](significantContactEvent, "setInteractionMechanisms:", v8);
    v4 = v8;
  }

}

- (void)setInteractions:(id)a3
{
  id v4;
  MOEventSignificantContact *significantContactEvent;
  MOEventSignificantContact *v6;
  MOEventSignificantContact *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    significantContactEvent = self->_significantContactEvent;
    v8 = v4;
    if (!significantContactEvent)
    {
      v6 = objc_alloc_init(MOEventSignificantContact);
      v7 = self->_significantContactEvent;
      self->_significantContactEvent = v6;

      significantContactEvent = self->_significantContactEvent;
    }
    -[MOEventSignificantContact setInteractions:](significantContactEvent, "setInteractions:", v8);
    v4 = v8;
  }

}

- (void)setIsGComplete:(BOOL)a3
{
  _BOOL8 v3;
  MOEventPeopleDiscovery *peopleDiscoveryEvent;
  MOEventPeopleDiscovery *v6;
  MOEventPeopleDiscovery *v7;

  v3 = a3;
  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (!peopleDiscoveryEvent)
  {
    v6 = objc_alloc_init(MOEventPeopleDiscovery);
    v7 = self->_peopleDiscoveryEvent;
    self->_peopleDiscoveryEvent = v6;

    peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  }
  -[MOEventPeopleDiscovery setIsGComplete:](peopleDiscoveryEvent, "setIsGComplete:", v3);
}

- (void)setGaPR:(int64_t)a3
{
  MOEventPeopleDiscovery *peopleDiscoveryEvent;
  MOEventPeopleDiscovery *v6;
  MOEventPeopleDiscovery *v7;

  peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  if (!peopleDiscoveryEvent)
  {
    v6 = objc_alloc_init(MOEventPeopleDiscovery);
    v7 = self->_peopleDiscoveryEvent;
    self->_peopleDiscoveryEvent = v6;

    peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
  }
  -[MOEventPeopleDiscovery setGaPR:](peopleDiscoveryEvent, "setGaPR:", a3);
}

- (void)setPCount:(id)a3
{
  id v4;
  MOEventPeopleDiscovery *peopleDiscoveryEvent;
  MOEventPeopleDiscovery *v6;
  MOEventPeopleDiscovery *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    v8 = v4;
    if (!peopleDiscoveryEvent)
    {
      v6 = objc_alloc_init(MOEventPeopleDiscovery);
      v7 = self->_peopleDiscoveryEvent;
      self->_peopleDiscoveryEvent = v6;

      peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    }
    -[MOEventPeopleDiscovery setPCount:](peopleDiscoveryEvent, "setPCount:", v8);
    v4 = v8;
  }

}

- (void)setDensityScore:(id)a3
{
  id v4;
  MOEventPeopleDiscovery *peopleDiscoveryEvent;
  MOEventPeopleDiscovery *v6;
  MOEventPeopleDiscovery *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    v8 = v4;
    if (!peopleDiscoveryEvent)
    {
      v6 = objc_alloc_init(MOEventPeopleDiscovery);
      v7 = self->_peopleDiscoveryEvent;
      self->_peopleDiscoveryEvent = v6;

      peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    }
    -[MOEventPeopleDiscovery setDensityScore:](peopleDiscoveryEvent, "setDensityScore:", v8);
    v4 = v8;
  }

}

- (void)setDensityScanDuration:(id)a3
{
  id v4;
  MOEventPeopleDiscovery *peopleDiscoveryEvent;
  MOEventPeopleDiscovery *v6;
  MOEventPeopleDiscovery *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    v8 = v4;
    if (!peopleDiscoveryEvent)
    {
      v6 = objc_alloc_init(MOEventPeopleDiscovery);
      v7 = self->_peopleDiscoveryEvent;
      self->_peopleDiscoveryEvent = v6;

      peopleDiscoveryEvent = self->_peopleDiscoveryEvent;
    }
    -[MOEventPeopleDiscovery setDensityScanDuration:](peopleDiscoveryEvent, "setDensityScanDuration:", v8);
    v4 = v8;
  }

}

- (void)setScoredTopics:(id)a3
{
  id v4;
  MOEventPortrait *portraitEvent;
  MOEventPortrait *v6;
  MOEventPortrait *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    portraitEvent = self->_portraitEvent;
    v8 = v4;
    if (!portraitEvent)
    {
      v6 = objc_alloc_init(MOEventPortrait);
      v7 = self->_portraitEvent;
      self->_portraitEvent = v6;

      portraitEvent = self->_portraitEvent;
    }
    -[MOEventPortrait setScoredTopics:](portraitEvent, "setScoredTopics:", v8);
    v4 = v8;
  }

}

- (void)setMotionType:(unint64_t)a3
{
  MOEventMotionActivity *motionActivityEvent;
  MOEventMotionActivity *v6;
  MOEventMotionActivity *v7;

  motionActivityEvent = self->_motionActivityEvent;
  if (!motionActivityEvent)
  {
    v6 = objc_alloc_init(MOEventMotionActivity);
    v7 = self->_motionActivityEvent;
    self->_motionActivityEvent = v6;

    motionActivityEvent = self->_motionActivityEvent;
  }
  -[MOEventMotionActivity setMotionType:](motionActivityEvent, "setMotionType:", a3);
}

- (void)setTrends:(id)a3
{
  id v4;
  MOEventAnalytics *analyticsEvent;
  MOEventAnalytics *v6;
  MOEventAnalytics *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    analyticsEvent = self->_analyticsEvent;
    v8 = v4;
    if (!analyticsEvent)
    {
      v6 = objc_alloc_init(MOEventAnalytics);
      v7 = self->_analyticsEvent;
      self->_analyticsEvent = v6;

      analyticsEvent = self->_analyticsEvent;
    }
    -[MOEventAnalytics setTrends:](analyticsEvent, "setTrends:", v8);
    v4 = v8;
  }

}

- (void)setPatterns:(id)a3
{
  id v4;
  MOEventAnalytics *analyticsEvent;
  MOEventAnalytics *v6;
  MOEventAnalytics *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    analyticsEvent = self->_analyticsEvent;
    v8 = v4;
    if (!analyticsEvent)
    {
      v6 = objc_alloc_init(MOEventAnalytics);
      v7 = self->_analyticsEvent;
      self->_analyticsEvent = v6;

      analyticsEvent = self->_analyticsEvent;
    }
    -[MOEventAnalytics setPatterns:](analyticsEvent, "setPatterns:", v8);
    v4 = v8;
  }

}

- (void)setLifeEventCategory:(unint64_t)a3
{
  MOEventLifeEvents *lifeEventsEvent;
  MOEventLifeEvents *v6;
  MOEventLifeEvents *v7;

  lifeEventsEvent = self->_lifeEventsEvent;
  if (!lifeEventsEvent)
  {
    v6 = objc_alloc_init(MOEventLifeEvents);
    v7 = self->_lifeEventsEvent;
    self->_lifeEventsEvent = v6;

    lifeEventsEvent = self->_lifeEventsEvent;
  }
  -[MOEventLifeEvents setLifeEventCategory:](lifeEventsEvent, "setLifeEventCategory:", a3);
}

- (void)setConfidenceScore:(double)a3
{
  MOEventLifeEvents *lifeEventsEvent;
  MOEventLifeEvents *v6;
  MOEventLifeEvents *v7;

  lifeEventsEvent = self->_lifeEventsEvent;
  if (!lifeEventsEvent)
  {
    v6 = objc_alloc_init(MOEventLifeEvents);
    v7 = self->_lifeEventsEvent;
    self->_lifeEventsEvent = v6;

    lifeEventsEvent = self->_lifeEventsEvent;
  }
  -[MOEventLifeEvents setConfidenceScore:](lifeEventsEvent, "setConfidenceScore:", a3);
}

- (id)_descriptionOf:(unint64_t)a3
{
  return +[MOEventProactiveSuggested describeCategory:](MOEventProactiveSuggested, "describeCategory:", a3);
}

- (id)displayNameOfScoredTopics:(id)a3
{
  return +[MOEventPortrait displayNameOfScoredTopics:](MOEventPortrait, "displayNameOfScoredTopics:", a3);
}

+ (id)FormatDate:(id)a3
{
  id v3;
  id v4;
  void *v5;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v4, "setDateStyle:", 4);
    objc_msgSend(v4, "setTimeStyle:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate:", v3));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)descriptionOfMode:(unint64_t)a3
{
  return +[MOEventRoutine descriptionOfMode:](MOEventRoutine, "descriptionOfMode:", a3);
}

- (id)descriptionOfPhotoMomentSource:(unint64_t)a3
{
  return +[MOEventPhoto descriptionOfPhotoMomentSource:](MOEventPhoto, "descriptionOfPhotoMomentSource:", a3);
}

- (id)descriptionOfMotionType:(unint64_t)a3
{
  return +[MOEventMotionActivity descriptionOfMotionType:](MOEventMotionActivity, "descriptionOfMotionType:", a3);
}

- (id)descriptionOfLifeEventCategory:(unint64_t)a3
{
  return +[MOEventLifeEvents descriptionOfLifeEventCategory:](MOEventLifeEvents, "descriptionOfLifeEventCategory:", a3);
}

- (id)description
{
  __CFString *analyticsEvent;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  __CFString *v23;

  if ((id)-[MOEvent provider](self, "provider") == (id)5)
  {
    analyticsEvent = (__CFString *)self->_analyticsEvent;
    if (analyticsEvent)
LABEL_3:
      analyticsEvent = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString description](analyticsEvent, "description"));
  }
  else
  {
    v13 = (char *)-[MOEvent category](self, "category") - 1;
    analyticsEvent = 0;
    switch((unint64_t)v13)
    {
      case 0uLL:
        analyticsEvent = (__CFString *)self->_routineEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 1uLL:
        analyticsEvent = (__CFString *)self->_workoutEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 2uLL:
      case 3uLL:
      case 5uLL:
        analyticsEvent = (__CFString *)self->_mediaEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 4uLL:
      case 0x10uLL:
        analyticsEvent = (__CFString *)self->_photoEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 6uLL:
        analyticsEvent = (__CFString *)self->_portraitEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 7uLL:
        analyticsEvent = (__CFString *)self->_travelEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 8uLL:
        analyticsEvent = (__CFString *)self->_sharedWithYouEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 9uLL:
        analyticsEvent = (__CFString *)self->_significantContactEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 0xAuLL:
      case 0xBuLL:
        analyticsEvent = (__CFString *)self->_proactiveSuggestedEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 0xCuLL:
        break;
      case 0xEuLL:
      case 0x14uLL:
      case 0x16uLL:
        analyticsEvent = (__CFString *)self->_peopleDiscoveryEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 0xFuLL:
        analyticsEvent = (__CFString *)self->_motionActivityEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      case 0x15uLL:
        analyticsEvent = (__CFString *)self->_lifeEventsEvent;
        if (analyticsEvent)
          goto LABEL_3;
        break;
      default:
        analyticsEvent = CFSTR("no other details");
        break;
    }
  }
  v23 = analyticsEvent;
  v19 = objc_alloc((Class)NSString);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent eventIdentifier](self, "eventIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent identifierFromProvider](self, "identifierFromProvider"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent startDate](self, "startDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MOEvent FormatDate:](MOEvent, "FormatDate:", v22));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent endDate](self, "endDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEvent FormatDate:](MOEvent, "FormatDate:", v21));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent creationDate](self, "creationDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOEvent FormatDate:](MOEvent, "FormatDate:", v17));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent sourceCreationDate](self, "sourceCreationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOEvent FormatDate:](MOEvent, "FormatDate:", v16));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent expirationDate](self, "expirationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MOEvent FormatDate:](MOEvent, "FormatDate:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent timeZone](self, "timeZone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent describeProvider](self, "describeProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent describeCategory](self, "describeCategory"));
  v20 = objc_msgSend(v19, "initWithFormat:", CFSTR("<MOEvent eventIdentifier, %@, identifierFromProvider, %@, startDate, %@, endDate, %@, creationDate, %@, sourceCreationDate, %@, expirationDate, %@, timeZone, %@, provider, %@, category, %@, rehydrationFailCount, %lu, source app, %@, %@>"), v18, v14, v15, v4, v5, v6, v8, v9, v10, v11, -[MOEvent rehydrationFailCount](self, "rehydrationFailCount"), self->_appBundle, v23);

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  MOEvent *v21;
  MOEvent *v22;
  uint64_t v23;
  MOEvent *v24;
  id v25;
  uint64_t v26;
  NSString *identifierFromProvider;
  uint64_t v28;
  id v29;
  uint64_t v30;
  NSDate *expirationDate;
  uint64_t v32;
  id v33;
  uint64_t v34;
  NSDate *sourceCreationDate;
  uint64_t v36;
  id v37;
  uint64_t v38;
  NSString *appBundle;
  uint64_t v40;
  id v41;
  uint64_t v42;
  MOEventPhoto *photoEvent;
  uint64_t v44;
  id v45;
  uint64_t v46;
  MOEventRoutine *routineEvent;
  uint64_t v48;
  id v49;
  uint64_t v50;
  MOEventWorkout *workoutEvent;
  uint64_t v52;
  id v53;
  uint64_t v54;
  MOEventProactiveSuggested *proactiveSuggestedEvent;
  uint64_t v56;
  id v57;
  uint64_t v58;
  MOEventTravel *travelEvent;
  uint64_t v60;
  id v61;
  uint64_t v62;
  MOEventMedia *mediaEvent;
  uint64_t v64;
  id v65;
  uint64_t v66;
  MOEventSharedWithYou *sharedWithYouEvent;
  uint64_t v68;
  id v69;
  uint64_t v70;
  MOEventSignificantContact *significantContactEvent;
  uint64_t v72;
  id v73;
  uint64_t v74;
  MOEventPeopleDiscovery *peopleDiscoveryEvent;
  uint64_t v76;
  id v77;
  uint64_t v78;
  MOEventPortrait *portraitEvent;
  uint64_t v80;
  id v81;
  uint64_t v82;
  MOEventMotionActivity *motionActivityEvent;
  uint64_t v84;
  id v85;
  uint64_t v86;
  MOEventAnalytics *analyticsEvent;
  uint64_t v88;
  id v89;
  uint64_t v90;
  MOEventLifeEvents *lifeEventsEvent;
  uint64_t v92;
  id v93;
  uint64_t v94;
  MOEventStateOfMind *stateOfMindEvent;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), CFSTR("eventIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v8), CFSTR("startDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v11), CFSTR("endDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v14), CFSTR("creationDate"));
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)v16;
  if (v7)
    v18 = v16 == 0;
  else
    v18 = 1;
  if (v18 || v10 == 0 || v13 == 0)
  {
    v21 = 0;
  }
  else
  {
    v22 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](self, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v7, v10, v13, v16, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("provider")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category")));
    v24 = v22;
    if (v22)
    {
      v25 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v23), CFSTR("identifierFromProvider"));
      v26 = objc_claimAutoreleasedReturnValue(v25);
      identifierFromProvider = v24->_identifierFromProvider;
      v24->_identifierFromProvider = (NSString *)v26;

      v29 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v28), CFSTR("expirationDate"));
      v30 = objc_claimAutoreleasedReturnValue(v29);
      expirationDate = v24->_expirationDate;
      v24->_expirationDate = (NSDate *)v30;

      v24->_fromFirstParty = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fromFirstParty"));
      v33 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v32), CFSTR("sourceCreationDate"));
      v34 = objc_claimAutoreleasedReturnValue(v33);
      sourceCreationDate = v24->_sourceCreationDate;
      v24->_sourceCreationDate = (NSDate *)v34;

      v24->_rehydrationFailCount = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rehydrationFailCount"));
      v37 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v36), CFSTR("appBundle"));
      v38 = objc_claimAutoreleasedReturnValue(v37);
      appBundle = v24->_appBundle;
      v24->_appBundle = (NSString *)v38;

      v41 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOEventPhoto, v40), CFSTR("photoEvent"));
      v42 = objc_claimAutoreleasedReturnValue(v41);
      photoEvent = v24->_photoEvent;
      v24->_photoEvent = (MOEventPhoto *)v42;

      v45 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOEventRoutine, v44), CFSTR("routineEvent"));
      v46 = objc_claimAutoreleasedReturnValue(v45);
      routineEvent = v24->_routineEvent;
      v24->_routineEvent = (MOEventRoutine *)v46;

      v49 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOEventWorkout, v48), CFSTR("workoutEvent"));
      v50 = objc_claimAutoreleasedReturnValue(v49);
      workoutEvent = v24->_workoutEvent;
      v24->_workoutEvent = (MOEventWorkout *)v50;

      v53 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOEventProactiveSuggested, v52), CFSTR("proactiveSuggestedEvent"));
      v54 = objc_claimAutoreleasedReturnValue(v53);
      proactiveSuggestedEvent = v24->_proactiveSuggestedEvent;
      v24->_proactiveSuggestedEvent = (MOEventProactiveSuggested *)v54;

      v57 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOEventTravel, v56), CFSTR("travelEvent"));
      v58 = objc_claimAutoreleasedReturnValue(v57);
      travelEvent = v24->_travelEvent;
      v24->_travelEvent = (MOEventTravel *)v58;

      v61 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOEventMedia, v60), CFSTR("mediaEvent"));
      v62 = objc_claimAutoreleasedReturnValue(v61);
      mediaEvent = v24->_mediaEvent;
      v24->_mediaEvent = (MOEventMedia *)v62;

      v65 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOEventSharedWithYou, v64), CFSTR("sharedWithYouEvent"));
      v66 = objc_claimAutoreleasedReturnValue(v65);
      sharedWithYouEvent = v24->_sharedWithYouEvent;
      v24->_sharedWithYouEvent = (MOEventSharedWithYou *)v66;

      v69 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOEventSignificantContact, v68), CFSTR("significantContactEvent"));
      v70 = objc_claimAutoreleasedReturnValue(v69);
      significantContactEvent = v24->_significantContactEvent;
      v24->_significantContactEvent = (MOEventSignificantContact *)v70;

      v73 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOEventPeopleDiscovery, v72), CFSTR("peopleDiscoveryEvent"));
      v74 = objc_claimAutoreleasedReturnValue(v73);
      peopleDiscoveryEvent = v24->_peopleDiscoveryEvent;
      v24->_peopleDiscoveryEvent = (MOEventPeopleDiscovery *)v74;

      v77 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOEventPortrait, v76), CFSTR("portraitEvent"));
      v78 = objc_claimAutoreleasedReturnValue(v77);
      portraitEvent = v24->_portraitEvent;
      v24->_portraitEvent = (MOEventPortrait *)v78;

      v81 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOEventMotionActivity, v80), CFSTR("motionActivityEvent"));
      v82 = objc_claimAutoreleasedReturnValue(v81);
      motionActivityEvent = v24->_motionActivityEvent;
      v24->_motionActivityEvent = (MOEventMotionActivity *)v82;

      v85 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOEventAnalytics, v84), CFSTR("analyticsEvent"));
      v86 = objc_claimAutoreleasedReturnValue(v85);
      analyticsEvent = v24->_analyticsEvent;
      v24->_analyticsEvent = (MOEventAnalytics *)v86;

      v89 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOEventLifeEvents, v88), CFSTR("lifeEventsEvent"));
      v90 = objc_claimAutoreleasedReturnValue(v89);
      lifeEventsEvent = v24->_lifeEventsEvent;
      v24->_lifeEventsEvent = (MOEventLifeEvents *)v90;

      v93 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOEventStateOfMind, v92), CFSTR("stateOfMindEvent"));
      v94 = objc_claimAutoreleasedReturnValue(v93);
      stateOfMindEvent = v24->_stateOfMindEvent;
      v24->_stateOfMindEvent = (MOEventStateOfMind *)v94;

    }
    self = v24;
    v21 = self;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *eventIdentifier;
  id v5;

  eventIdentifier = self->_eventIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", eventIdentifier, CFSTR("eventIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_provider, CFSTR("provider"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifierFromProvider, CFSTR("identifierFromProvider"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fromFirstParty, CFSTR("fromFirstParty"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceCreationDate, CFSTR("sourceCreationDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rehydrationFailCount, CFSTR("rehydrationFailCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appBundle, CFSTR("appBundle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoEvent, CFSTR("photoEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_routineEvent, CFSTR("routineEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutEvent, CFSTR("workoutEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proactiveSuggestedEvent, CFSTR("proactiveSuggestedEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_travelEvent, CFSTR("travelEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaEvent, CFSTR("mediaEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedWithYouEvent, CFSTR("sharedWithYouEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_significantContactEvent, CFSTR("significantContactEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peopleDiscoveryEvent, CFSTR("peopleDiscoveryEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_portraitEvent, CFSTR("portraitEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_motionActivityEvent, CFSTR("motionActivityEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_analyticsEvent, CFSTR("analyticsEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lifeEventsEvent, CFSTR("lifeEventsEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stateOfMindEvent, CFSTR("stateOfMindEvent"));

}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent eventIdentifier](self, "eventIdentifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (id)copy
{
  MOEvent *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MOEvent *v8;
  MOEventPhoto *v9;
  MOEventPhoto *photoEvent;
  MOEventRoutine *v11;
  MOEventRoutine *routineEvent;
  MOEventWorkout *v13;
  MOEventWorkout *workoutEvent;
  MOEventProactiveSuggested *v15;
  MOEventProactiveSuggested *proactiveSuggestedEvent;
  MOEventTravel *v17;
  MOEventTravel *travelEvent;
  MOEventMedia *v19;
  MOEventMedia *mediaEvent;
  MOEventSharedWithYou *v21;
  MOEventSharedWithYou *sharedWithYouEvent;
  MOEventSignificantContact *v23;
  MOEventSignificantContact *significantContactEvent;
  MOEventPeopleDiscovery *v25;
  MOEventPeopleDiscovery *peopleDiscoveryEvent;
  MOEventPortrait *v27;
  MOEventPortrait *portraitEvent;
  MOEventMotionActivity *v29;
  MOEventMotionActivity *motionActivityEvent;
  MOEventAnalytics *v31;
  MOEventAnalytics *analyticsEvent;
  MOEventLifeEvents *v33;
  MOEventLifeEvents *lifeEventsEvent;
  MOEventStateOfMind *v35;
  MOEventStateOfMind *stateOfMindEvent;

  v3 = [MOEvent alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent eventIdentifier](self, "eventIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent startDate](self, "startDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent endDate](self, "endDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent creationDate](self, "creationDate"));
  v8 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v3, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v4, v5, v6, v7, -[MOEvent provider](self, "provider"), -[MOEvent category](self, "category"));

  objc_storeStrong((id *)&v8->_expirationDate, self->_expirationDate);
  objc_storeStrong((id *)&v8->_sourceCreationDate, self->_sourceCreationDate);
  objc_storeStrong((id *)&v8->_identifierFromProvider, self->_identifierFromProvider);
  v8->_rehydrationFailCount = self->_rehydrationFailCount;
  objc_storeStrong((id *)&v8->_appBundle, self->_appBundle);
  v9 = (MOEventPhoto *)-[MOEventPhoto copy](self->_photoEvent, "copy");
  photoEvent = v8->_photoEvent;
  v8->_photoEvent = v9;

  v11 = (MOEventRoutine *)-[MOEventRoutine copy](self->_routineEvent, "copy");
  routineEvent = v8->_routineEvent;
  v8->_routineEvent = v11;

  v13 = (MOEventWorkout *)-[MOEventWorkout copy](self->_workoutEvent, "copy");
  workoutEvent = v8->_workoutEvent;
  v8->_workoutEvent = v13;

  v15 = (MOEventProactiveSuggested *)-[MOEventProactiveSuggested copy](self->_proactiveSuggestedEvent, "copy");
  proactiveSuggestedEvent = v8->_proactiveSuggestedEvent;
  v8->_proactiveSuggestedEvent = v15;

  v17 = (MOEventTravel *)-[MOEventTravel copy](self->_travelEvent, "copy");
  travelEvent = v8->_travelEvent;
  v8->_travelEvent = v17;

  v19 = (MOEventMedia *)-[MOEventMedia copy](self->_mediaEvent, "copy");
  mediaEvent = v8->_mediaEvent;
  v8->_mediaEvent = v19;

  v21 = (MOEventSharedWithYou *)-[MOEventSharedWithYou copy](self->_sharedWithYouEvent, "copy");
  sharedWithYouEvent = v8->_sharedWithYouEvent;
  v8->_sharedWithYouEvent = v21;

  v23 = (MOEventSignificantContact *)-[MOEventSignificantContact copy](self->_significantContactEvent, "copy");
  significantContactEvent = v8->_significantContactEvent;
  v8->_significantContactEvent = v23;

  v25 = (MOEventPeopleDiscovery *)-[MOEventPeopleDiscovery copy](self->_peopleDiscoveryEvent, "copy");
  peopleDiscoveryEvent = v8->_peopleDiscoveryEvent;
  v8->_peopleDiscoveryEvent = v25;

  v27 = (MOEventPortrait *)-[MOEventPortrait copy](self->_portraitEvent, "copy");
  portraitEvent = v8->_portraitEvent;
  v8->_portraitEvent = v27;

  v29 = (MOEventMotionActivity *)-[MOEventMotionActivity copy](self->_motionActivityEvent, "copy");
  motionActivityEvent = v8->_motionActivityEvent;
  v8->_motionActivityEvent = v29;

  v31 = (MOEventAnalytics *)-[MOEventAnalytics copy](self->_analyticsEvent, "copy");
  analyticsEvent = v8->_analyticsEvent;
  v8->_analyticsEvent = v31;

  v33 = (MOEventLifeEvents *)-[MOEventLifeEvents copy](self->_lifeEventsEvent, "copy");
  lifeEventsEvent = v8->_lifeEventsEvent;
  v8->_lifeEventsEvent = v33;

  v35 = (MOEventStateOfMind *)-[MOEventStateOfMind copy](self->_stateOfMindEvent, "copy");
  stateOfMindEvent = v8->_stateOfMindEvent;
  v8->_stateOfMindEvent = v35;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOEvent *v5;
  uint64_t v6;
  MOEvent *v7;
  uint64_t v8;
  MOEvent *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v5 = (MOEvent *)a3;
  v7 = v5;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    if (v5)
    {
      v8 = objc_opt_class(self, v6);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        v9 = v7;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent eventIdentifier](self, "eventIdentifier"));
        if (v10
          || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent eventIdentifier](v9, "eventIdentifier"))) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent eventIdentifier](self, "eventIdentifier"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent eventIdentifier](v9, "eventIdentifier"));
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if (v10)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v13 = 1;
        }

        goto LABEL_12;
      }
    }
    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (NSDate)sourceCreationDate
{
  NSDate *sourceCreationDate;

  sourceCreationDate = self->_sourceCreationDate;
  if (!sourceCreationDate)
    sourceCreationDate = self->_endDate;
  return sourceCreationDate;
}

- (BOOL)isHomeWorkVisit
{
  unint64_t v3;

  if (self->_category != 1)
    goto LABEL_5;
  v3 = -[MOEvent placeUserType](self, "placeUserType");
  if (v3 != 1)
  {
    if ((id)-[MOEvent placeUserType](self, "placeUserType") == (id)2)
    {
      LOBYTE(v3) = 1;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (double)duration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent endDate](self, "endDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent startDate](self, "startDate"));
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (id)formatAddressWithFormatOption:(id)a3
{
  MOEventRoutine *routineEvent;
  void *v5;
  id os_log;
  NSObject *v8;
  void *v9;

  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRoutine formatAddressWithFormatOption:](routineEvent, "formatAddressWithFormatOption:", a3));
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MOEvent formatAddressWithFormatOption:].cold.1();

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEvent.m"), 1736, CFSTR("request formatAddressWithFormatOption on non routine event instance (in %s:%d)"), "-[MOEvent formatAddressWithFormatOption:]", 1736);

    v5 = 0;
  }
  return v5;
}

- (id)formatLocalityWithFormatOption:(id)a3
{
  MOEventRoutine *routineEvent;
  void *v5;
  id os_log;
  NSObject *v8;
  void *v9;

  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRoutine formatLocalityWithFormatOption:](routineEvent, "formatLocalityWithFormatOption:", a3));
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MOEvent formatLocalityWithFormatOption:].cold.1();

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEvent.m"), 1745, CFSTR("request formatLocalityWithFormatOption on non routine event instance (in %s:%d)"), "-[MOEvent formatLocalityWithFormatOption:]", 1745);

    v5 = 0;
  }
  return v5;
}

- (id)formatAdministrativeAreaWithFormatOption:(id)a3
{
  MOEventRoutine *routineEvent;
  void *v5;
  id os_log;
  NSObject *v8;
  void *v9;

  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRoutine formatAdministrativeAreaWithFormatOption:](routineEvent, "formatAdministrativeAreaWithFormatOption:", a3));
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MOEvent formatAdministrativeAreaWithFormatOption:].cold.1();

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEvent.m"), 1754, CFSTR("request formatLocalityWithFormatOption on non routine event instance (in %s:%d)"), "-[MOEvent formatAdministrativeAreaWithFormatOption:]", 1754);

    v5 = 0;
  }
  return v5;
}

- (id)formatCountryWithFormatOption:(id)a3
{
  MOEventRoutine *routineEvent;
  void *v5;
  id os_log;
  NSObject *v8;
  void *v9;

  routineEvent = self->_routineEvent;
  if (routineEvent)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRoutine formatCountryWithFormatOption:](routineEvent, "formatCountryWithFormatOption:", a3));
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MOEvent formatCountryWithFormatOption:].cold.1();

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEvent.m"), 1763, CFSTR("request formatCountryWithFormatOption on non routine event instance (in %s:%d)"), "-[MOEvent formatCountryWithFormatOption:]", 1763);

    v5 = 0;
  }
  return v5;
}

- (NSUUID)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_eventIdentifier, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setSourceCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_sourceCreationDate, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (unint64_t)provider
{
  return self->_provider;
}

- (unint64_t)category
{
  return self->_category;
}

- (NSString)identifierFromProvider
{
  return self->_identifierFromProvider;
}

- (void)setIdentifierFromProvider:(id)a3
{
  objc_storeStrong((id *)&self->_identifierFromProvider, a3);
}

- (BOOL)fromFirstParty
{
  return self->_fromFirstParty;
}

- (void)setFromFirstParty:(BOOL)a3
{
  self->_fromFirstParty = a3;
}

- (unint64_t)rehydrationFailCount
{
  return self->_rehydrationFailCount;
}

- (void)setRehydrationFailCount:(unint64_t)a3
{
  self->_rehydrationFailCount = a3;
}

- (NSString)appBundle
{
  return self->_appBundle;
}

- (void)setAppBundle:(id)a3
{
  objc_storeStrong((id *)&self->_appBundle, a3);
}

- (MOEventPhoto)photoEvent
{
  return self->_photoEvent;
}

- (void)setPhotoEvent:(id)a3
{
  objc_storeStrong((id *)&self->_photoEvent, a3);
}

- (MOEventRoutine)routineEvent
{
  return self->_routineEvent;
}

- (void)setRoutineEvent:(id)a3
{
  objc_storeStrong((id *)&self->_routineEvent, a3);
}

- (MOEventWorkout)workoutEvent
{
  return self->_workoutEvent;
}

- (void)setWorkoutEvent:(id)a3
{
  objc_storeStrong((id *)&self->_workoutEvent, a3);
}

- (MOEventProactiveSuggested)proactiveSuggestedEvent
{
  return self->_proactiveSuggestedEvent;
}

- (void)setProactiveSuggestedEvent:(id)a3
{
  objc_storeStrong((id *)&self->_proactiveSuggestedEvent, a3);
}

- (MOEventTravel)travelEvent
{
  return self->_travelEvent;
}

- (void)setTravelEvent:(id)a3
{
  objc_storeStrong((id *)&self->_travelEvent, a3);
}

- (MOEventMedia)mediaEvent
{
  return self->_mediaEvent;
}

- (void)setMediaEvent:(id)a3
{
  objc_storeStrong((id *)&self->_mediaEvent, a3);
}

- (MOEventSharedWithYou)sharedWithYouEvent
{
  return self->_sharedWithYouEvent;
}

- (void)setSharedWithYouEvent:(id)a3
{
  objc_storeStrong((id *)&self->_sharedWithYouEvent, a3);
}

- (MOEventSignificantContact)significantContactEvent
{
  return self->_significantContactEvent;
}

- (void)setSignificantContactEvent:(id)a3
{
  objc_storeStrong((id *)&self->_significantContactEvent, a3);
}

- (MOEventPeopleDiscovery)peopleDiscoveryEvent
{
  return self->_peopleDiscoveryEvent;
}

- (void)setPeopleDiscoveryEvent:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDiscoveryEvent, a3);
}

- (MOEventPortrait)portraitEvent
{
  return self->_portraitEvent;
}

- (void)setPortraitEvent:(id)a3
{
  objc_storeStrong((id *)&self->_portraitEvent, a3);
}

- (MOEventMotionActivity)motionActivityEvent
{
  return self->_motionActivityEvent;
}

- (void)setMotionActivityEvent:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityEvent, a3);
}

- (MOEventAnalytics)analyticsEvent
{
  return self->_analyticsEvent;
}

- (void)setAnalyticsEvent:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsEvent, a3);
}

- (MOEventLifeEvents)lifeEventsEvent
{
  return self->_lifeEventsEvent;
}

- (void)setLifeEventsEvent:(id)a3
{
  objc_storeStrong((id *)&self->_lifeEventsEvent, a3);
}

- (MOEventStateOfMind)stateOfMindEvent
{
  return self->_stateOfMindEvent;
}

- (void)setStateOfMindEvent:(id)a3
{
  objc_storeStrong((id *)&self->_stateOfMindEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateOfMindEvent, 0);
  objc_storeStrong((id *)&self->_lifeEventsEvent, 0);
  objc_storeStrong((id *)&self->_analyticsEvent, 0);
  objc_storeStrong((id *)&self->_motionActivityEvent, 0);
  objc_storeStrong((id *)&self->_portraitEvent, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryEvent, 0);
  objc_storeStrong((id *)&self->_significantContactEvent, 0);
  objc_storeStrong((id *)&self->_sharedWithYouEvent, 0);
  objc_storeStrong((id *)&self->_mediaEvent, 0);
  objc_storeStrong((id *)&self->_travelEvent, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestedEvent, 0);
  objc_storeStrong((id *)&self->_workoutEvent, 0);
  objc_storeStrong((id *)&self->_routineEvent, 0);
  objc_storeStrong((id *)&self->_photoEvent, 0);
  objc_storeStrong((id *)&self->_appBundle, 0);
  objc_storeStrong((id *)&self->_identifierFromProvider, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_sourceCreationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

- (id)bundleSourceType
{
  unint64_t v2;

  v2 = -[MOEvent category](self, "category") - 1;
  if (v2 <= 0x17 && ((0xF1E2BFu >> v2) & 1) != 0)
    return *off_1002ADD80[v2];
  else
    return 0;
}

- (double)weightedDurationWithTimeZone:(id)a3
{
  double result;

  -[MOEvent weightedDurationWithTimeZone:overnightStartDateHour:overnightDurationHours:overnightDurationWeight:](self, "weightedDurationWithTimeZone:overnightStartDateHour:overnightDurationHours:overnightDurationWeight:", a3, 0.0, 6.0, 0.1);
  return result;
}

- (double)weightedDurationWithTimeZone:(id)a3 overnightStartDateHour:(double)a4 overnightDurationHours:(double)a5 overnightDurationWeight:(double)a6
{
  id v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v37;

  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent endDate](self, "endDate"));

  v12 = 0.0;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent startDate](self, "startDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent endDate](self, "endDate"));
    v15 = objc_msgSend(v13, "isAfterDate:", v14);

    if ((v15 & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent startDate](self, "startDate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v16, v10));

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOEvent endDate](self, "endDate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v18, v10));

      v20 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v17, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "startOfDayWithBoundaryOfADay:", 10800.0));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dateByAddingTimeInterval:", 86400.0));

      if ((objc_msgSend(v20, "containsDate:", v22) & 1) != 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime dateFromDate:hour:](MOTime, "dateFromDate:hour:", v17, (uint64_t)a4));
        if (objc_msgSend(v23, "isBeforeDate:", v17))
        {
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dateByAddingTimeInterval:", 86400.0));

          v23 = (void *)v24;
        }
        v37 = v22;
        v25 = v23;
        v26 = 0.0;
        v27 = v25;
        if (objc_msgSend(v25, "isBeforeDate:", v19))
        {
          v28 = a5 * 3600.0;
          v29 = v25;
          do
          {
            v30 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:duration:", v29, v28);
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "intersectionWithDateInterval:", v30));
            v32 = v31;
            if (v31)
            {
              objc_msgSend(v31, "duration");
              v26 = v26 + v33;
            }

            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "dateByAddingTimeInterval:", 86400.0));
            v29 = v27;
          }
          while ((objc_msgSend(v27, "isBeforeDate:", v19) & 1) != 0);
        }

        -[MOEvent duration](self, "duration");
        v12 = v34 + (a6 + -1.0) * v26;

        v22 = v37;
      }
      else
      {
        -[MOEvent duration](self, "duration");
        v12 = v35;
      }

    }
  }

  return v12;
}

- (MOEvent)initWithEventMO:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MOEvent *v20;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creationDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "provider"));
    v10 = objc_msgSend(v9, "unsignedIntegerValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "category"));
    self = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](self, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v5, v6, v7, v8, v10, objc_msgSend(v11, "unsignedIntegerValue"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceCreationDate"));
    -[MOEvent setSourceCreationDate:](self, "setSourceCreationDate:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expirationDate"));
    -[MOEvent setExpirationDate:](self, "setExpirationDate:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mode"));
    -[MOEvent setMode:](self, "setMode:", objc_msgSend(v14, "unsignedIntValue"));

    -[MOEvent setIsInvalid:](self, "setIsInvalid:", objc_msgSend(v4, "isInvalid"));
    -[MOEvent setIsHighConfidence:](self, "setIsHighConfidence:", objc_msgSend(v4, "isHighConfidence"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifierFromProvider"));
    -[MOEvent setIdentifierFromProvider:](self, "setIdentifierFromProvider:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trends"));
    -[MOEvent setTrends:](self, "setTrends:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "patterns"));
    -[MOEvent setPatterns:](self, "setPatterns:", v17);

    -[MOEvent setIsGComplete:](self, "setIsGComplete:", objc_msgSend(v4, "isGatheringComplete"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeAtHomeSubType"));
    -[MOEvent setTimeAtHomeSubType:](self, "setTimeAtHomeSubType:", objc_msgSend(v18, "unsignedIntegerValue"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rehydrationFailCount"));
    -[MOEvent setRehydrationFailCount:](self, "setRehydrationFailCount:", objc_msgSend(v19, "unsignedIntegerValue"));

    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)initWithEventIdentifier:startDate:endDate:creationDate:provider:category:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: eventIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithEventIdentifier:startDate:endDate:creationDate:provider:category:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: startDate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithEventIdentifier:startDate:endDate:creationDate:provider:category:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: endDate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithEventIdentifier:startDate:endDate:creationDate:provider:category:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: creationDate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)formatAddressWithFormatOption:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "request formatAddressWithFormatOption on non routine event instance (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)formatLocalityWithFormatOption:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "request formatLocalityWithFormatOption on non routine event instance (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)formatAdministrativeAreaWithFormatOption:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "request formatLocalityWithFormatOption on non routine event instance (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)formatCountryWithFormatOption:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "request formatCountryWithFormatOption on non routine event instance (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
