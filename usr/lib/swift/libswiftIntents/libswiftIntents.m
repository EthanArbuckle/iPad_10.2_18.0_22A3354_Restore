INPlayMediaIntent __swiftcall INPlayMediaIntent.init(mediaItems:mediaContainer:playShuffled:playbackRepeatMode:resumePlayback:playbackQueueLocation:playbackSpeed:mediaSearch:)(Swift::OpaquePointer_optional mediaItems, INMediaItem_optional mediaContainer, Swift::Bool_optional playShuffled, INPlaybackRepeatMode playbackRepeatMode, Swift::Bool_optional resumePlayback, INPlaybackQueueLocation playbackQueueLocation, Swift::Double_optional playbackSpeed, INMediaSearch_optional mediaSearch)
{
  char v8;
  uint64_t v11;
  void *v12;
  int isa_low;
  NSArray v14;
  int value;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  double v22;

  v22 = *(double *)&resumePlayback.value;
  v8 = playbackQueueLocation;
  v11 = *(_QWORD *)&mediaContainer.is_nil;
  v12 = *(void **)&mediaItems.is_nil;
  isa_low = LOBYTE(mediaContainer.value.super.isa);
  if (mediaItems.value._rawValue)
  {
    type metadata accessor for INMediaItem();
    v14.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v14.super.isa = 0;
  }
  value = playShuffled.value;
  if (isa_low == 2)
  {
    v16 = 0;
    if (value != 2)
      goto LABEL_6;
LABEL_9:
    v17 = 0;
    v18 = *(void **)&playbackSpeed.is_nil;
    if ((v8 & 1) != 0)
      goto LABEL_7;
LABEL_10:
    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v22);
    goto LABEL_11;
  }
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, isa_low & 1);
  if (value == 2)
    goto LABEL_9;
LABEL_6:
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, value & 1);
  v18 = *(void **)&playbackSpeed.is_nil;
  if ((v8 & 1) == 0)
    goto LABEL_10;
LABEL_7:
  v19 = 0;
LABEL_11:
  v20 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithMediaItems_mediaContainer_playShuffled_playbackRepeatMode_resumePlayback_playbackQueueLocation_playbackSpeed_mediaSearch_, v14.super.isa, v12, v16, v11, v17, playbackRepeatMode, v19, v18);

  return (INPlayMediaIntent)v20;
}

unint64_t type metadata accessor for INMediaItem()
{
  unint64_t result;

  result = lazy cache variable for type metadata for INMediaItem;
  if (!lazy cache variable for type metadata for INMediaItem)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for INMediaItem);
  }
  return result;
}

INMediaSearch __swiftcall INMediaSearch.init(mediaType:sortOrder:mediaName:artistName:albumName:genreNames:moodNames:releaseDate:reference:mediaIdentifier:)(INMediaItemType mediaType, INMediaSortOrder sortOrder, Swift::String_optional mediaName, Swift::String_optional artistName, Swift::String_optional albumName, Swift::OpaquePointer_optional genreNames, Swift::OpaquePointer_optional moodNames, INDateComponentsRange_optional releaseDate, INMediaReference reference, Swift::String_optional mediaIdentifier)
{
  void *object;
  uint64_t countAndFlagsBits;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *rawValue;
  void *v17;
  uint64_t v18;
  NSArray v19;
  uint64_t v20;
  NSArray v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  object = albumName.value._object;
  countAndFlagsBits = albumName.value._countAndFlagsBits;
  v12 = artistName.value._object;
  v13 = artistName.value._countAndFlagsBits;
  if (mediaName.value._object)
  {
    v14 = (void *)MEMORY[0x20BD0EDCC](mediaName.value._countAndFlagsBits, mediaName.value._object);
    swift_bridgeObjectRelease();
    if (v12)
      goto LABEL_3;
  }
  else
  {
    v14 = 0;
    if (artistName.value._object)
    {
LABEL_3:
      v15 = (void *)MEMORY[0x20BD0EDCC](v13, v12);
      swift_bridgeObjectRelease();
      rawValue = genreNames.value._rawValue;
      if (object)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  v15 = 0;
  rawValue = genreNames.value._rawValue;
  if (object)
  {
LABEL_4:
    v17 = (void *)MEMORY[0x20BD0EDCC](countAndFlagsBits, object);
    swift_bridgeObjectRelease();
    v18 = *(_QWORD *)&genreNames.is_nil;
    if (rawValue)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v17 = 0;
  v18 = *(_QWORD *)&genreNames.is_nil;
  if (rawValue)
  {
LABEL_5:
    v19.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v20 = *(_QWORD *)&releaseDate.is_nil;
    if (v18)
      goto LABEL_6;
LABEL_12:
    v21.super.isa = 0;
    v23 = moodNames.value._rawValue;
    v22 = *(_QWORD *)&moodNames.is_nil;
    if (v20)
      goto LABEL_7;
LABEL_13:
    v24 = 0;
    goto LABEL_14;
  }
LABEL_11:
  v19.super.isa = 0;
  v20 = *(_QWORD *)&releaseDate.is_nil;
  if (!v18)
    goto LABEL_12;
LABEL_6:
  v21.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v23 = moodNames.value._rawValue;
  v22 = *(_QWORD *)&moodNames.is_nil;
  if (!v20)
    goto LABEL_13;
LABEL_7:
  v24 = (void *)MEMORY[0x20BD0EDCC](releaseDate.value.super.isa, v20);
  swift_bridgeObjectRelease();
LABEL_14:
  v25 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithMediaType_sortOrder_mediaName_artistName_albumName_genreNames_moodNames_releaseDate_reference_mediaIdentifier_, mediaType, sortOrder, v14, v15, v17, v19.super.isa, v21.super.isa, v23, v22, v24);

  return (INMediaSearch)v25;
}

id INParameter.init<A, B>(keyPath:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *ObjCClassFromMetadata;
  uint64_t v8;
  void *v9;
  id v10;

  v1 = *(_QWORD *)(*a1 + *MEMORY[0x24BEE46A8]);
  if (swift_isClassType())
    v2 = v1;
  else
    v2 = 0;
  if (v2 && (v3 = dispatch thunk of AnyKeyPath._kvcKeyPathString.getter(), v4))
  {
    v5 = v3;
    v6 = v4;
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    v8 = swift_getObjCClassFromMetadata();
    v9 = (void *)MEMORY[0x20BD0EDCC](v5, v6);
    swift_bridgeObjectRelease();
    v10 = objc_msgSend(ObjCClassFromMetadata, sel_parameterForClass_keyPath_, v8, v9);

    swift_release();
  }
  else
  {
    swift_release();
    return 0;
  }
  return v10;
}

INSetCarLockStatusIntent __swiftcall INSetCarLockStatusIntent.init(locked:carName:)(Swift::Bool_optional locked, INSpeakableString_optional carName)
{
  Class isa;
  Class v3;
  id v4;

  isa = carName.value.super.isa;
  if (locked.value == 2)
    v3 = 0;
  else
    v3 = Bool._bridgeToObjectiveC()().super.super.isa;
  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithLocked_carName_, v3, isa);

  return (INSetCarLockStatusIntent)v4;
}

uint64_t INSetCarLockStatusIntent.locked.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_locked);
  if (!v1)
    return 2;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_BOOLValue);

  return (uint64_t)v3;
}

INRequestRideIntent __swiftcall INRequestRideIntent.init(pickupLocation:dropOffLocation:rideOptionName:partySize:paymentMethod:scheduledPickupTime:)(CLPlacemark_optional pickupLocation, CLPlacemark_optional dropOffLocation, INSpeakableString_optional rideOptionName, Swift::Int_optional partySize, INPaymentMethod_optional paymentMethod, INDateComponentsRange_optional scheduledPickupTime)
{
  Class isa;
  void *v7;
  void *v8;
  CLPlacemarkInternal *internal;
  Class v10;
  id v11;
  id v12;

  isa = rideOptionName.value.super.isa;
  v7 = *(void **)&dropOffLocation.is_nil;
  v8 = *(void **)&pickupLocation.is_nil;
  internal = pickupLocation.value._internal;
  v10 = pickupLocation.value.super.isa;
  if (((uint64_t)dropOffLocation.value._internal & 1) != 0)
    v11 = 0;
  else
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, dropOffLocation.value.super.isa);
  v12 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPickupLocation_dropOffLocation_rideOptionName_partySize_paymentMethod_scheduledPickupTime_, v10, internal, v8, v11, v7, isa);

  return (INRequestRideIntent)v12;
}

id INRequestRideIntent.partySize.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_partySize);
  v2 = v1;
  if (!v1)
    return 0;
  v3 = objc_msgSend(v1, sel_integerValue);

  return v3;
}

id static INNotebookItemTypeResolutionResult.disambiguation(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  void *ObjCClassFromMetadata;
  Class isa;
  id v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    v3 = (uint64_t *)(a1 + 32);
    do
    {
      v4 = *v3++;
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v4);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      --v1;
    }
    while (v1);
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(ObjCClassFromMetadata, sel_disambiguationWithNotebookItemTypesToDisambiguate_, isa);

  return v7;
}

unint64_t type metadata accessor for NSNumber()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSNumber;
  if (!lazy cache variable for type metadata for NSNumber)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  }
  return result;
}

id INRideOption.usesMeteredFare.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_usesMeteredFare);
}

void INRideOption.usesMeteredFare.setter(void *a1)
{
  void *v1;

  objc_msgSend(v1, sel_setUsesMeteredFare_, a1);

}

void (*INRideOption.usesMeteredFare.modify(_QWORD *a1))(id *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_usesMeteredFare);
  return INRideOption.usesMeteredFare.modify;
}

void INRideOption.usesMeteredFare.modify(id *a1)
{
  id v1;

  v1 = *a1;
  objc_msgSend(a1[1], sel_setUsesMeteredFare_);

}

uint64_t INRideOption.usesMeteredFare.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_usesMeteredFare);
  if (!v1)
    return 2;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_BOOLValue);

  return (uint64_t)v3;
}

void key path getter for INRideOption.usesMeteredFare : INRideOption(id *a1@<X0>, unsigned __int8 *a2@<X8>)
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = objc_msgSend(*a1, sel_usesMeteredFare);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_BOOLValue);

  }
  else
  {
    v5 = 2;
  }
  *a2 = v5;
}

void key path setter for INRideOption.usesMeteredFare : INRideOption(unsigned __int8 *a1, void **a2)
{
  int v2;
  void *v3;
  id v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  if (v2 == 2)
    v4 = 0;
  else
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v2 & 1);
  v5 = v4;
  objc_msgSend(v3, sel_setUsesMeteredFare_);

}

void INRideOption.usesMeteredFare.setter(char a1)
{
  void *v1;
  id v3;
  id v4;

  if (a1 == 2)
    v3 = 0;
  else
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, a1 & 1);
  v4 = v3;
  objc_msgSend(v1, sel_setUsesMeteredFare_);

}

void (*INRideOption.usesMeteredFare.modify(_QWORD *a1))(uint64_t a1)
{
  void *v1;
  unsigned __int8 *v2;
  id v3;
  void *v4;
  unsigned __int8 v5;

  *a1 = v1;
  v2 = (unsigned __int8 *)(a1 + 1);
  v3 = objc_msgSend(v1, sel_usesMeteredFare);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_BOOLValue);

  }
  else
  {
    v5 = 2;
  }
  *v2 = v5;
  return INRideOption.usesMeteredFare.modify;
}

void INRideOption.usesMeteredFare.modify(uint64_t a1)
{
  int v2;
  id v3;
  id v4;

  v2 = *(unsigned __int8 *)(a1 + 8);
  if (v2 == 2)
    v3 = 0;
  else
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v2 & 1);
  v4 = v3;
  objc_msgSend(*(id *)a1, sel_setUsesMeteredFare_);

}

id sub_20954DDF0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_usesMeteredFare);
  *a2 = result;
  return result;
}

id sub_20954DE28(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUsesMeteredFare_, *a1);
}

id static INIntegerResolutionResult.confirmationRequired(with:)(uint64_t a1, char a2)
{
  id v2;
  id v3;

  if ((a2 & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a1);
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_confirmationRequiredWithValueToConfirm_, v2);

  return v3;
}

INPlayMediaIntent __swiftcall INPlayMediaIntent.init(mediaItems:mediaContainer:playShuffled:playbackRepeatMode:resumePlayback:)(Swift::OpaquePointer_optional mediaItems, INMediaItem_optional mediaContainer, Swift::Bool_optional playShuffled, INPlaybackRepeatMode playbackRepeatMode, Swift::Bool_optional resumePlayback)
{
  uint64_t v6;
  void *v7;
  int isa_low;
  NSArray v9;
  int value;
  id v11;
  id v12;
  id v13;

  v6 = *(_QWORD *)&mediaContainer.is_nil;
  v7 = *(void **)&mediaItems.is_nil;
  isa_low = LOBYTE(mediaContainer.value.super.isa);
  if (mediaItems.value._rawValue)
  {
    type metadata accessor for INMediaItem();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  value = playShuffled.value;
  if (isa_low != 2)
  {
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, isa_low & 1);
    if (value != 2)
      goto LABEL_6;
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  v11 = 0;
  if (value == 2)
    goto LABEL_8;
LABEL_6:
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, value & 1);
LABEL_9:
  v13 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithMediaItems_mediaContainer_playShuffled_playbackRepeatMode_resumePlayback_, v9.super.isa, v7, v11, v6, v12);

  return (INPlayMediaIntent)v13;
}

uint64_t INPlayMediaIntent.playShuffled.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_playShuffled);
}

uint64_t INPlayMediaIntent.resumePlayback.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_resumePlayback);
}

uint64_t INPlayMediaIntent.playShuffled.getter(SEL *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(v1, *a1);
  if (!v2)
    return 2;
  v3 = v2;
  v4 = objc_msgSend(v2, sel_BOOLValue);

  return (uint64_t)v4;
}

id INPlayMediaIntent.playbackSpeed.getter()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  result = objc_msgSend(v0, sel_playbackSpeed);
  v2 = result;
  if (result)
  {
    objc_msgSend(result, sel_doubleValue);
    v4 = v3;

    return (id)v4;
  }
  return result;
}

INSearchCallHistoryIntent __swiftcall INSearchCallHistoryIntent.init(dateCreated:recipient:callCapabilities:callTypes:unseen:)(INDateComponentsRange_optional dateCreated, INPerson_optional recipient, INCallCapabilityOptions callCapabilities, INCallRecordTypeOptions callTypes, Swift::Bool_optional unseen)
{
  uint64_t v5;
  Class isa;
  void *v7;
  Class v8;
  char v9;
  id v10;
  id v11;

  v5 = *(_QWORD *)&recipient.is_nil;
  isa = recipient.value.super.isa;
  v7 = *(void **)&dateCreated.is_nil;
  v8 = dateCreated.value.super.isa;
  v9 = callCapabilities;
  if (callCapabilities == 2)
    v10 = 0;
  else
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v9 & 1);
  v11 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithDateCreated_recipient_callCapabilities_callTypes_unseen_, v8, v7, isa, v5, v10);

  return (INSearchCallHistoryIntent)v11;
}

uint64_t INSearchCallHistoryIntent.unseen.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_unseen);
  if (!v1)
    return 2;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_BOOLValue);

  return (uint64_t)v3;
}

INSetDefrosterSettingsInCarIntent __swiftcall INSetDefrosterSettingsInCarIntent.init(enable:defroster:carName:)(Swift::Bool_optional enable, INCarDefroster defroster, INSpeakableString_optional carName)
{
  Class isa;
  id v6;
  id v7;

  isa = carName.value.super.isa;
  if (enable.value == 2)
    v6 = 0;
  else
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, enable.value);
  v7 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithEnable_defroster_carName_, v6, defroster, isa);

  return (INSetDefrosterSettingsInCarIntent)v7;
}

INSetDefrosterSettingsInCarIntent __swiftcall INSetDefrosterSettingsInCarIntent.init(enable:defroster:)(Swift::Bool_optional enable, INCarDefroster defroster)
{
  id v4;
  id v5;

  if (enable.value == 2)
    v4 = 0;
  else
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, enable.value);
  v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithEnable_defroster_, v4, defroster);

  return (INSetDefrosterSettingsInCarIntent)v5;
}

uint64_t INSetDefrosterSettingsInCarIntent.enable.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_enable);
  if (!v1)
    return 2;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_BOOLValue);

  return (uint64_t)v3;
}

id INSetClimateSettingsInCarIntent.init(enableFan:enableAirConditioner:enableClimateControl:enableAutoMode:airCirculationMode:fanSpeedIndex:fanSpeedPercentage:relativeFanSpeedSetting:temperature:relativeTemperatureSetting:climateZone:carName:)(unsigned __int8 a1, unsigned __int8 a2, char a3, char a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  int v19;
  int v20;
  uint64_t v21;
  char *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  Class isa;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  NSMeasurement v42;

  v40 = a5;
  v19 = a2;
  v20 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>?);
  MEMORY[0x24BDAC7A8]();
  v22 = (char *)&v35 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v20 == 2)
    v39 = 0;
  else
    v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v20 & 1);
  if (v19 == 2)
    v38 = 0;
  else
    v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v19 & 1);
  if (a3 == 2)
  {
    v37 = 0;
    if (a4 != 2)
    {
LABEL_9:
      v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, a4 & 1);
      goto LABEL_12;
    }
  }
  else
  {
    v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, a3 & 1);
    if (a4 != 2)
      goto LABEL_9;
  }
  v36 = 0;
LABEL_12:
  v41 = a11;
  if ((a7 & 1) != 0)
  {
    v23 = 0;
    if ((a9 & 1) != 0)
      goto LABEL_14;
  }
  else
  {
    v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a6);
    if ((a9 & 1) != 0)
    {
LABEL_14:
      v24 = 0;
      goto LABEL_17;
    }
  }
  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)&a8);
LABEL_17:
  outlined init with copy of Measurement<NSUnitTemperature>?(v41, (uint64_t)v22);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  v26 = *(_QWORD *)(v25 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v22, 1, v25) == 1)
  {
    isa = 0;
  }
  else
  {
    v42 = Measurement._bridgeToObjectiveC()();
    isa = v42.super.isa;
    (*(void (**)(char *, uint64_t, __n128))(v26 + 8))(v22, v25, *(__n128 *)&v42._doubleValue);
  }
  v28 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v30 = v38;
  v29 = v39;
  v32 = v36;
  v31 = v37;
  v33 = objc_msgSend(v28, sel_initWithEnableFan_enableAirConditioner_enableClimateControl_enableAutoMode_airCirculationMode_fanSpeedIndex_fanSpeedPercentage_relativeFanSpeedSetting_temperature_relativeTemperatureSetting_climateZone_carName_, v39, v38, v37, v36, v40, v23, v24, a10, isa, a12, a13, a14);

  outlined destroy of Measurement<NSUnitTemperature>?(v41);
  return v33;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD0F030]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t outlined init with copy of Measurement<NSUnitTemperature>?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Measurement<NSUnitTemperature>?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id INSetClimateSettingsInCarIntent.init(enableFan:enableAirConditioner:enableClimateControl:enableAutoMode:airCirculationMode:fanSpeedIndex:fanSpeedPercentage:relativeFanSpeedSetting:temperature:relativeTemperatureSetting:climateZone:)(unsigned __int8 a1, unsigned __int8 a2, char a3, char a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  int v17;
  int v18;
  uint64_t v19;
  char *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  Class isa;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  NSMeasurement v38;

  v37 = a5;
  v33 = a8;
  v17 = a2;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>?);
  MEMORY[0x24BDAC7A8]();
  v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v18 == 2)
    v36 = 0;
  else
    v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v18 & 1);
  if (v17 == 2)
    v35 = 0;
  else
    v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v17 & 1);
  if (a3 == 2)
  {
    v34 = 0;
    if (a4 != 2)
    {
LABEL_9:
      v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, a4 & 1);
      goto LABEL_12;
    }
  }
  else
  {
    v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, a3 & 1);
    if (a4 != 2)
      goto LABEL_9;
  }
  v21 = 0;
LABEL_12:
  if ((a7 & 1) != 0)
  {
    v22 = 0;
    if ((a9 & 1) != 0)
      goto LABEL_14;
  }
  else
  {
    v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a6);
    if ((a9 & 1) != 0)
    {
LABEL_14:
      v23 = 0;
      goto LABEL_17;
    }
  }
  v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)&v33);
LABEL_17:
  v33 = a11;
  outlined init with copy of Measurement<NSUnitTemperature>?(a11, (uint64_t)v20);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  v25 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v20, 1, v24) == 1)
  {
    isa = 0;
  }
  else
  {
    v38 = Measurement._bridgeToObjectiveC()();
    isa = v38.super.isa;
    (*(void (**)(char *, uint64_t, __n128))(v25 + 8))(v20, v24, *(__n128 *)&v38._doubleValue);
  }
  v27 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v29 = v35;
  v28 = v36;
  v30 = v34;
  v31 = objc_msgSend(v27, sel_initWithEnableFan_enableAirConditioner_enableClimateControl_enableAutoMode_airCirculationMode_fanSpeedIndex_fanSpeedPercentage_relativeFanSpeedSetting_temperature_relativeTemperatureSetting_climateZone_, v36, v35, v34, v21, v37, v22, v23, a10, isa, a12, a13);

  outlined destroy of Measurement<NSUnitTemperature>?(v33);
  return v31;
}

uint64_t INSetClimateSettingsInCarIntent.enableFan.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_enableFan);
}

uint64_t INSetClimateSettingsInCarIntent.enableAirConditioner.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_enableAirConditioner);
}

uint64_t INSetClimateSettingsInCarIntent.enableClimateControl.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_enableClimateControl);
}

uint64_t INSetClimateSettingsInCarIntent.enableAutoMode.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_enableAutoMode);
}

id INSetClimateSettingsInCarIntent.fanSpeedIndex.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_fanSpeedIndex);
  v2 = v1;
  if (!v1)
    return 0;
  v3 = objc_msgSend(v1, sel_integerValue);

  return v3;
}

id INSetClimateSettingsInCarIntent.fanSpeedPercentage.getter()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  result = objc_msgSend(v0, sel_fanSpeedPercentage);
  v2 = result;
  if (result)
  {
    objc_msgSend(result, sel_doubleValue);
    v4 = v3;

    return (id)v4;
  }
  return result;
}

INSetProfileInCarIntent __swiftcall INSetProfileInCarIntent.init(profileNumber:profileName:isDefaultProfile:carName:)(Swift::Int_optional profileNumber, Swift::String_optional profileName, Swift::Bool_optional isDefaultProfile, INSpeakableString_optional carName)
{
  Class isa;
  int value;
  void *object;
  uint64_t countAndFlagsBits;
  id v8;
  void *v9;
  id v10;
  id v11;

  isa = carName.value.super.isa;
  LOBYTE(value) = isDefaultProfile;
  object = profileName.value._object;
  countAndFlagsBits = profileName.value._countAndFlagsBits;
  if (!profileNumber.is_nil)
  {
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, profileNumber.value);
    value = value;
    if (object)
      goto LABEL_3;
LABEL_6:
    v9 = 0;
    if (value == 2)
      goto LABEL_4;
LABEL_7:
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, value & 1);
    goto LABEL_8;
  }
  v8 = 0;
  value = isDefaultProfile.value;
  if (!profileName.value._object)
    goto LABEL_6;
LABEL_3:
  v9 = (void *)MEMORY[0x20BD0EDCC](countAndFlagsBits, object);
  swift_bridgeObjectRelease();
  if (value != 2)
    goto LABEL_7;
LABEL_4:
  v10 = 0;
LABEL_8:
  v11 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithProfileNumber_profileName_defaultProfile_carName_, v8, v9, v10, isa);

  return (INSetProfileInCarIntent)v11;
}

INSetProfileInCarIntent __swiftcall INSetProfileInCarIntent.init(defaultProfile:)(Swift::Int_optional defaultProfile)
{
  id v1;
  id v2;

  if (defaultProfile.is_nil)
    v1 = 0;
  else
    v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, defaultProfile.value);
  v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithProfileNumber_profileName_defaultProfile_, 0, 0, v1);

  return (INSetProfileInCarIntent)v2;
}

INSetProfileInCarIntent __swiftcall INSetProfileInCarIntent.init(profileLabel:)(Swift::String_optional profileLabel)
{
  void *v1;
  id v2;

  if (profileLabel.value._object)
  {
    v1 = (void *)MEMORY[0x20BD0EDCC](profileLabel.value._countAndFlagsBits);
    swift_bridgeObjectRelease();
  }
  else
  {
    v1 = 0;
  }
  v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithProfileNumber_profileName_defaultProfile_, 0, v1, 0);

  return (INSetProfileInCarIntent)v2;
}

INSetProfileInCarIntent __swiftcall INSetProfileInCarIntent.init(profileLabel:isDefaultProfile:)(Swift::String_optional profileLabel, Swift::Bool_optional isDefaultProfile)
{
  int value;
  void *v3;
  id v4;
  id v5;

  value = isDefaultProfile.value;
  if (!profileLabel.value._object)
  {
    v3 = 0;
    if (isDefaultProfile.value == 2)
      goto LABEL_3;
LABEL_5:
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, value & 1);
    goto LABEL_6;
  }
  v3 = (void *)MEMORY[0x20BD0EDCC](profileLabel.value._countAndFlagsBits);
  swift_bridgeObjectRelease();
  if (value != 2)
    goto LABEL_5;
LABEL_3:
  v4 = 0;
LABEL_6:
  v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithProfileNumber_profileName_defaultProfile_, 0, v3, v4);

  return (INSetProfileInCarIntent)v5;
}

id INSetProfileInCarIntent.init(profileLabel:defaultProfile:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  void *v6;
  id v7;
  id v8;

  if (!a2)
  {
    v6 = 0;
    if ((a4 & 1) == 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = (void *)MEMORY[0x20BD0EDCC]();
  swift_bridgeObjectRelease();
  if ((a4 & 1) != 0)
    goto LABEL_5;
LABEL_3:
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a3);
LABEL_6:
  v8 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithProfileNumber_profileName_defaultProfile_, 0, v6, v7);

  return v8;
}

INSetProfileInCarIntent __swiftcall INSetProfileInCarIntent.init(profileNumber:defaultProfile:)(Swift::Int_optional profileNumber, Swift::Int_optional defaultProfile)
{
  Swift::Bool is_nil;
  Swift::Int value;
  id v4;
  id v5;
  id v6;

  is_nil = defaultProfile.is_nil;
  value = defaultProfile.value;
  if (profileNumber.is_nil)
  {
    v4 = 0;
    if (defaultProfile.is_nil)
      goto LABEL_3;
LABEL_5:
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, value);
    goto LABEL_6;
  }
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, profileNumber.value);
  if (!is_nil)
    goto LABEL_5;
LABEL_3:
  v5 = 0;
LABEL_6:
  v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithProfileNumber_profileName_defaultProfile_, v4, 0, v5);

  return (INSetProfileInCarIntent)v6;
}

INSetProfileInCarIntent __swiftcall INSetProfileInCarIntent.init(profileNumber:profileLabel:)(Swift::Int_optional profileNumber, Swift::String_optional profileLabel)
{
  void *object;
  uint64_t countAndFlagsBits;
  id v4;
  void *v5;
  id v6;

  object = profileLabel.value._object;
  countAndFlagsBits = profileLabel.value._countAndFlagsBits;
  if (profileNumber.is_nil)
  {
    v4 = 0;
    if (profileLabel.value._object)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, profileNumber.value);
  if (!object)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)MEMORY[0x20BD0EDCC](countAndFlagsBits, object);
  swift_bridgeObjectRelease();
LABEL_6:
  v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithProfileNumber_profileName_defaultProfile_, v4, v5, 0);

  return (INSetProfileInCarIntent)v6;
}

id INSetProfileInCarIntent.init(profileNumber:profileName:isDefaultProfile:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  int v5;
  id v8;
  void *v9;
  id v10;
  id v11;

  LOBYTE(v5) = a5;
  if ((a2 & 1) == 0)
  {
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a1);
    v5 = v5;
    if (a4)
      goto LABEL_3;
LABEL_6:
    v9 = 0;
    if (v5 == 2)
      goto LABEL_4;
LABEL_7:
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v5 & 1);
    goto LABEL_8;
  }
  v8 = 0;
  v5 = a5;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v9 = (void *)MEMORY[0x20BD0EDCC](a3, a4);
  swift_bridgeObjectRelease();
  if (v5 != 2)
    goto LABEL_7;
LABEL_4:
  v10 = 0;
LABEL_8:
  v11 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithProfileNumber_profileName_defaultProfile_, v8, v9, v10);

  return v11;
}

id INSetProfileInCarIntent.init(profileNumber:profileLabel:defaultProfile:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  id v10;
  void *v11;
  id v12;
  id v13;

  if ((a2 & 1) == 0)
  {
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a1);
    if (a4)
      goto LABEL_3;
LABEL_6:
    v11 = 0;
    if ((a6 & 1) == 0)
      goto LABEL_4;
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v11 = (void *)MEMORY[0x20BD0EDCC](a3, a4);
  swift_bridgeObjectRelease();
  if ((a6 & 1) != 0)
    goto LABEL_7;
LABEL_4:
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a5);
LABEL_8:
  v13 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithProfileNumber_profileName_defaultProfile_, v10, v11, v12);

  return v13;
}

uint64_t INSetProfileInCarIntent.isDefaultProfile.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_defaultProfile);
  if (!v1)
    return 2;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_BOOLValue);

  return (uint64_t)v3;
}

id INSetProfileInCarIntent.defaultProfile.getter()
{
  return INSetProfileInCarIntent.defaultProfile.getter((SEL *)&selRef_defaultProfile);
}

id INSetProfileInCarIntent.profileNumber.getter()
{
  return INSetProfileInCarIntent.defaultProfile.getter((SEL *)&selRef_profileNumber);
}

id INSetProfileInCarIntent.defaultProfile.getter(SEL *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(v1, *a1);
  v3 = v2;
  if (!v2)
    return 0;
  v4 = objc_msgSend(v2, sel_integerValue);

  return v4;
}

INSetSeatSettingsInCarIntent __swiftcall INSetSeatSettingsInCarIntent.init(enableHeating:enableCooling:enableMassage:seat:level:relativeLevel:carName:)(Swift::Bool_optional enableHeating, Swift::Bool_optional enableCooling, Swift::Bool_optional enableMassage, INCarSeat seat, Swift::Int_optional level, INRelativeSetting relativeLevel, INSpeakableString_optional carName)
{
  Class isa;
  Swift::Bool is_nil;
  int v11;
  id v13;
  int v14;
  id v15;
  id v16;
  id v17;
  id v18;
  Swift::Int value;

  isa = carName.value.super.isa;
  value = level.value;
  is_nil = level.is_nil;
  v11 = enableCooling.value;
  if (enableHeating.value == 2)
    v13 = 0;
  else
    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, enableHeating.value);
  v14 = enableMassage.value;
  if (v11 == 2)
  {
    v15 = 0;
    if (v14 != 2)
      goto LABEL_6;
LABEL_9:
    v16 = 0;
    if (is_nil)
      goto LABEL_7;
LABEL_10:
    v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, value);
    goto LABEL_11;
  }
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v11 & 1);
  if (v14 == 2)
    goto LABEL_9;
LABEL_6:
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v14 & 1);
  if (!is_nil)
    goto LABEL_10;
LABEL_7:
  v17 = 0;
LABEL_11:
  v18 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithEnableHeating_enableCooling_enableMassage_seat_level_relativeLevelSetting_carName_, v13, v15, v16, seat, v17, relativeLevel, isa);

  return (INSetSeatSettingsInCarIntent)v18;
}

INSetSeatSettingsInCarIntent __swiftcall INSetSeatSettingsInCarIntent.init(enableHeating:enableCooling:enableMassage:seat:level:relativeLevel:)(Swift::Bool_optional enableHeating, Swift::Bool_optional enableCooling, Swift::Bool_optional enableMassage, INCarSeat seat, Swift::Int_optional level, INRelativeSetting relativeLevel)
{
  Swift::Bool is_nil;
  int v10;
  id v12;
  int v13;
  id v14;
  id v15;
  id v16;
  id v17;
  Swift::Int value;

  is_nil = level.is_nil;
  value = level.value;
  v10 = enableCooling.value;
  if (enableHeating.value == 2)
    v12 = 0;
  else
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, enableHeating.value);
  v13 = enableMassage.value;
  if (v10 == 2)
  {
    v14 = 0;
    if (v13 != 2)
      goto LABEL_6;
LABEL_9:
    v15 = 0;
    if (is_nil)
      goto LABEL_7;
LABEL_10:
    v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, value);
    goto LABEL_11;
  }
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v10 & 1);
  if (v13 == 2)
    goto LABEL_9;
LABEL_6:
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v13 & 1);
  if (!is_nil)
    goto LABEL_10;
LABEL_7:
  v16 = 0;
LABEL_11:
  v17 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithEnableHeating_enableCooling_enableMassage_seat_level_relativeLevelSetting_, v12, v14, v15, seat, v16, relativeLevel);

  return (INSetSeatSettingsInCarIntent)v17;
}

uint64_t INSetSeatSettingsInCarIntent.enableHeating.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_enableHeating);
}

uint64_t INSetSeatSettingsInCarIntent.enableCooling.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_enableCooling);
}

uint64_t INSetSeatSettingsInCarIntent.enableMassage.getter()
{
  return INPlayMediaIntent.playShuffled.getter((SEL *)&selRef_enableMassage);
}

id INSetSeatSettingsInCarIntent.level.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_level);
  v2 = v1;
  if (!v1)
    return 0;
  v3 = objc_msgSend(v1, sel_integerValue);

  return v3;
}

uint64_t static NSString.deferredLocalizedIntentsString(with:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;

  swift_bridgeObjectRetain();
  specialized withVaList<A>(_:_:)(a3, v3, a1, a2);
  v8 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t static NSString.deferredLocalizedIntentsString(with:table:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized withVaList<A>(_:_:)(a5, v5, a1, a2, a3, a4);
  v12 = v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

void static NSString.deferredLocalizedIntentsString(with:table:arguments:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *ObjCClassFromMetadata;
  void *v11;
  void *v12;
  id v13;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v11 = (void *)MEMORY[0x20BD0EDCC](a1, a2);
  v12 = (void *)MEMORY[0x20BD0EDCC](a3, a4);
  v13 = objc_msgSend(ObjCClassFromMetadata, sel_deferredLocalizedIntentsStringWithFormat_fromTable_arguments_, v11, v12, a5);

  if (!v13)
    __break(1u);
}

void specialized withVaList<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *ObjCClassFromMetadata;
  void *v28;
  id v29;
  _QWORD v32[3];
  uint64_t v33;
  uint64_t v34;

  type metadata accessor for __VaListBuilder();
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = 8;
  v5[3] = 0;
  v6 = v5 + 3;
  v5[4] = 0;
  v5[5] = 0;
  v7 = *(_QWORD *)(a1 + 16);
  if (v7)
  {
    v8 = 0;
    v9 = a1 + 32;
    while (1)
    {
      outlined init with copy of CVarArg(v9 + 40 * v8, (uint64_t)v32);
      v10 = v33;
      v11 = v34;
      __swift_project_boxed_opaque_existential_1(v32, v33);
      v12 = MEMORY[0x20BD0EEBC](v10, v11);
      v13 = *v6;
      v14 = *(_QWORD *)(v12 + 16);
      v15 = __OFADD__(*v6, v14);
      v16 = *v6 + v14;
      if (v15)
      {
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        return;
      }
      v17 = v12;
      v18 = v5[4];
      if (v18 >= v16)
        goto LABEL_18;
      if (v18 + 0x4000000000000000 < 0)
        goto LABEL_29;
      v19 = (char *)v5[5];
      if (2 * v18 > v16)
        v16 = 2 * v18;
      v5[4] = v16;
      if ((unint64_t)(v16 - 0x1000000000000000) >> 61 != 7)
        goto LABEL_30;
      v20 = (char *)swift_slowAlloc();
      v5[5] = v20;
      if (v19)
        break;
LABEL_19:
      if (!v20)
        goto LABEL_31;
      v22 = *(_QWORD *)(v17 + 16);
      if (v22)
      {
        v23 = (uint64_t *)(v17 + 32);
        v24 = *v6;
        while (1)
        {
          v25 = *v23++;
          *(_QWORD *)&v20[8 * v24] = v25;
          v24 = *v6 + 1;
          if (__OFADD__(*v6, 1))
            break;
          *v6 = v24;
          if (!--v22)
            goto LABEL_3;
        }
        __break(1u);
        goto LABEL_28;
      }
LABEL_3:
      ++v8;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
      if (v8 == v7)
        goto LABEL_25;
    }
    if (v20 != v19 || v20 >= &v19[8 * v13])
      memmove(v20, v19, 8 * v13);
    __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_18:
    v20 = (char *)v5[5];
    goto LABEL_19;
  }
LABEL_25:
  v26 = __VaListBuilder.va_list()();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v28 = (void *)MEMORY[0x20BD0EDCC](a3, a4);
  v29 = objc_msgSend(ObjCClassFromMetadata, sel_deferredLocalizedIntentsStringWithFormat_fromTable_arguments_, v28, 0, v26);

  if (!v29)
    goto LABEL_32;
  swift_release();
}

void specialized withVaList<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *ObjCClassFromMetadata;
  void *v30;
  void *v31;
  id v32;
  _QWORD v37[3];
  uint64_t v38;
  uint64_t v39;

  type metadata accessor for __VaListBuilder();
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 8;
  v7[3] = 0;
  v8 = v7 + 3;
  v7[4] = 0;
  v7[5] = 0;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    v10 = 0;
    v11 = a1 + 32;
    while (1)
    {
      outlined init with copy of CVarArg(v11 + 40 * v10, (uint64_t)v37);
      v12 = v38;
      v13 = v39;
      __swift_project_boxed_opaque_existential_1(v37, v38);
      v14 = MEMORY[0x20BD0EEBC](v12, v13);
      v15 = *v8;
      v16 = *(_QWORD *)(v14 + 16);
      v17 = __OFADD__(*v8, v16);
      v18 = *v8 + v16;
      if (v17)
      {
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        return;
      }
      v19 = v14;
      v20 = v7[4];
      if (v20 >= v18)
        goto LABEL_18;
      if (v20 + 0x4000000000000000 < 0)
        goto LABEL_29;
      v21 = (char *)v7[5];
      if (2 * v20 > v18)
        v18 = 2 * v20;
      v7[4] = v18;
      if ((unint64_t)(v18 - 0x1000000000000000) >> 61 != 7)
        goto LABEL_30;
      v22 = (char *)swift_slowAlloc();
      v7[5] = v22;
      if (v21)
        break;
LABEL_19:
      if (!v22)
        goto LABEL_31;
      v24 = *(_QWORD *)(v19 + 16);
      if (v24)
      {
        v25 = (uint64_t *)(v19 + 32);
        v26 = *v8;
        while (1)
        {
          v27 = *v25++;
          *(_QWORD *)&v22[8 * v26] = v27;
          v26 = *v8 + 1;
          if (__OFADD__(*v8, 1))
            break;
          *v8 = v26;
          if (!--v24)
            goto LABEL_3;
        }
        __break(1u);
        goto LABEL_28;
      }
LABEL_3:
      ++v10;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
      if (v10 == v9)
        goto LABEL_25;
    }
    if (v22 != v21 || v22 >= &v21[8 * v15])
      memmove(v22, v21, 8 * v15);
    __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_18:
    v22 = (char *)v7[5];
    goto LABEL_19;
  }
LABEL_25:
  v28 = __VaListBuilder.va_list()();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v30 = (void *)MEMORY[0x20BD0EDCC](a3, a4);
  v31 = (void *)MEMORY[0x20BD0EDCC](a5, a6);
  v32 = objc_msgSend(ObjCClassFromMetadata, sel_deferredLocalizedIntentsStringWithFormat_fromTable_arguments_, v30, v31, v28);

  if (!v32)
    goto LABEL_32;
  swift_release();
}

uint64_t outlined init with copy of CVarArg(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

id INCallRecord.init(identifier:dateCreated:caller:callRecordType:callCapability:callDuration:unseen:numberOfCalls:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, char a9, uint64_t a10, char a11)
{
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  Class isa;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v29;
  uint64_t v30;

  v29 = a5;
  v30 = a6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8]();
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = (void *)MEMORY[0x20BD0EDCC](a1, a2);
  swift_bridgeObjectRelease();
  outlined init with copy of Date?(a3, (uint64_t)v18);
  v20 = type metadata accessor for Date();
  v21 = *(_QWORD *)(v20 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v18, 1, v20) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v20);
  }
  if ((a8 & 1) != 0)
    v23 = 0;
  else
    v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)&a7);
  if (a9 != 2)
  {
    v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, a9 & 1);
    if ((a11 & 1) != 0)
      goto LABEL_8;
LABEL_10:
    v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a10);
    goto LABEL_11;
  }
  v24 = 0;
  if ((a11 & 1) == 0)
    goto LABEL_10;
LABEL_8:
  v25 = 0;
LABEL_11:
  v26 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v27 = objc_msgSend(v26, sel_initWithIdentifier_dateCreated_caller_callRecordType_callCapability_callDuration_unseen_numberOfCalls_, v19, isa, a4, v29, v30, v23, v24, v25);

  outlined destroy of Date?(a3);
  return v27;
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Date?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id INCallRecord.init(identifier:dateCreated:caller:callRecordType:callCapability:callDuration:unseen:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, char a9)
{
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  Class isa;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v26;
  uint64_t v27;

  v26 = a5;
  v27 = a6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (void *)MEMORY[0x20BD0EDCC](a1, a2);
  swift_bridgeObjectRelease();
  outlined init with copy of Date?(a3, (uint64_t)v16);
  v18 = type metadata accessor for Date();
  v19 = *(_QWORD *)(v18 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
  }
  if ((a8 & 1) != 0)
  {
    v21 = 0;
    if (a9 != 2)
      goto LABEL_5;
LABEL_7:
    v22 = 0;
    goto LABEL_8;
  }
  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)&a7);
  if (a9 == 2)
    goto LABEL_7;
LABEL_5:
  v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, a9 & 1);
LABEL_8:
  v23 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v24 = objc_msgSend(v23, sel_initWithIdentifier_dateCreated_caller_callRecordType_callCapability_callDuration_unseen_, v17, isa, a4, v26, v27, v21, v22);

  outlined destroy of Date?(a3);
  return v24;
}

id INCallRecord.callDuration.getter()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  result = objc_msgSend(v0, sel_callDuration);
  v2 = result;
  if (result)
  {
    objc_msgSend(result, sel_doubleValue);
    v4 = v3;

    return (id)v4;
  }
  return result;
}

uint64_t INCallRecord.unseen.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_unseen);
  if (!v1)
    return 2;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_BOOLValue);

  return (uint64_t)v3;
}

id INCallRecord.numberOfCalls.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_numberOfCalls);
  v2 = v1;
  if (!v1)
    return 0;
  v3 = objc_msgSend(v1, sel_integerValue);

  return v3;
}

id static INDoubleResolutionResult.confirmationRequired(with:)(uint64_t a1, char a2)
{
  id v2;
  id v3;

  if ((a2 & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)&a1);
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_confirmationRequiredWithValueToConfirm_, v2);

  return v3;
}

id INMediaUserContext.numberOfLibraryItems.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_numberOfLibraryItems);
  v2 = v1;
  if (!v1)
    return 0;
  v3 = objc_msgSend(v1, sel_integerValue);

  return v3;
}

void key path getter for INMediaUserContext.numberOfLibraryItems : INMediaUserContext(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(*a1, sel_numberOfLibraryItems);
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, sel_integerValue);

  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v4 == 0;
}

void key path setter for INMediaUserContext.numberOfLibraryItems : INMediaUserContext(uint64_t a1, void **a2)
{
  void *v2;
  Class isa;
  Class v4;

  v2 = *a2;
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
    isa = 0;
  else
    isa = Int._bridgeToObjectiveC()().super.super.isa;
  v4 = isa;
  objc_msgSend(v2, sel_setNumberOfLibraryItems_);

}

void INMediaUserContext.numberOfLibraryItems.setter(uint64_t a1, char a2)
{
  void *v2;
  NSNumber v3;
  Class isa;

  if ((a2 & 1) != 0)
    v3.super.super.isa = 0;
  else
    v3.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
  isa = v3.super.super.isa;
  objc_msgSend(v2, sel_setNumberOfLibraryItems_);

}

void (*INMediaUserContext.numberOfLibraryItems.modify(uint64_t a1))(uint64_t a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = objc_msgSend(v1, sel_numberOfLibraryItems);
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, sel_integerValue);

  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = v4 == 0;
  return INMediaUserContext.numberOfLibraryItems.modify;
}

void INMediaUserContext.numberOfLibraryItems.modify(uint64_t a1)
{
  Class isa;
  Class v3;

  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
    isa = 0;
  else
    isa = Int._bridgeToObjectiveC()().super.super.isa;
  v3 = isa;
  objc_msgSend(*(id *)(a1 + 16), sel_setNumberOfLibraryItems_);

}

void _INIntentSetImageKeyPath.setImage<A>(_:forParameterNamed:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v3 = v2;
  v5 = *(_QWORD *)(*a2 + *MEMORY[0x24BEE46A8]);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v15 - v7;
  v9 = dispatch thunk of AnyKeyPath._kvcKeyPathString.getter();
  if (v10)
  {
    v11 = v9;
    v12 = v10;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v3, v5);
    type metadata accessor for INIntent();
    swift_dynamicCast();
    v13 = (void *)v15[1];
    v14 = (void *)MEMORY[0x20BD0EDCC](v11, v12);
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_setImage_forParameterNamed_, a1, v14);

  }
}

unint64_t type metadata accessor for INIntent()
{
  unint64_t result;

  result = lazy cache variable for type metadata for INIntent;
  if (!lazy cache variable for type metadata for INIntent)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for INIntent);
  }
  return result;
}

id _INIntentSetImageKeyPath.image<A>(forParameterNamed:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[2];

  v2 = v1;
  v3 = *(_QWORD *)(*a1 + *MEMORY[0x24BEE46A8]);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v15 - v5;
  v7 = dispatch thunk of AnyKeyPath._kvcKeyPathString.getter();
  if (!v8)
    return 0;
  v9 = v7;
  v10 = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2, v3);
  type metadata accessor for INIntent();
  swift_dynamicCast();
  v11 = (void *)v15[1];
  v12 = (void *)MEMORY[0x20BD0EDCC](v9, v10);
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_imageForParameterNamed_, v12);

  return v13;
}

INDeleteTasksIntent __swiftcall INDeleteTasksIntent.init(taskList:tasks:all:)(INTaskList_optional taskList, Swift::OpaquePointer_optional tasks, Swift::Bool_optional all)
{
  Class isa;
  int rawValue_low;
  NSArray v5;
  id v6;
  id v7;

  isa = taskList.value.super.isa;
  rawValue_low = LOBYTE(tasks.value._rawValue);
  if (!*(_QWORD *)&taskList.is_nil)
  {
    v5.super.isa = 0;
    if (LOBYTE(tasks.value._rawValue) == 2)
      goto LABEL_3;
LABEL_5:
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, rawValue_low & 1);
    goto LABEL_6;
  }
  type metadata accessor for INTask();
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (rawValue_low != 2)
    goto LABEL_5;
LABEL_3:
  v6 = 0;
LABEL_6:
  v7 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithTaskList_tasks_all_, isa, v5.super.isa, v6);

  return (INDeleteTasksIntent)v7;
}

unint64_t type metadata accessor for INTask()
{
  unint64_t result;

  result = lazy cache variable for type metadata for INTask;
  if (!lazy cache variable for type metadata for INTask)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for INTask);
  }
  return result;
}

uint64_t INDeleteTasksIntent.all.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_all);
  if (!v1)
    return 2;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_BOOLValue);

  return (uint64_t)v3;
}

unint64_t INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.getter()
{
  return INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.getter((SEL *)&selRef_fuelPercentRemaining);
}

void INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.setter(uint64_t a1)
{
  INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.setter(a1, (SEL *)&selRef_setFuelPercentRemaining_);
}

void (*INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  void *v1;
  void *v2;
  id v4;
  void *v5;
  int v6;
  int v7;

  v2 = v1;
  *(_QWORD *)a1 = v2;
  v4 = objc_msgSend(v2, sel_fuelPercentRemaining);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, sel_floatValue);
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  *(_DWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 12) = v5 == 0;
  return INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.modify;
}

void INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.modify(uint64_t a1, uint64_t a2)
{
  INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.modify(a1, a2, (SEL *)&selRef_setFuelPercentRemaining_);
}

unint64_t INGetCarPowerLevelStatusIntentResponse.chargePercentRemaining.getter()
{
  return INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.getter((SEL *)&selRef_chargePercentRemaining);
}

unint64_t INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.getter(SEL *a1)
{
  void *v1;
  id v2;
  void *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;

  v2 = objc_msgSend(v1, *a1);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, sel_floatValue);
    v5 = v4;

    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return v6 | ((unint64_t)(v3 == 0) << 32);
}

void key path getter for INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining : INGetCarPowerLevelStatusIntentResponse(id *a1@<X0>, SEL *a2@<X3>, uint64_t a3@<X8>)
{
  id v4;
  void *v5;
  int v6;
  int v7;

  v4 = objc_msgSend(*a1, *a2);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, sel_floatValue);
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  *(_DWORD *)a3 = v7;
  *(_BYTE *)(a3 + 4) = v5 == 0;
}

void key path setter for INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining : INGetCarPowerLevelStatusIntentResponse(int *a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  id v7;
  int v8;
  id v9;
  double v10;
  id v11;

  v6 = *a2;
  if ((a1[1] & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = *a1;
    v9 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
    LODWORD(v10) = v8;
    v7 = objc_msgSend(v9, sel_initWithFloat_, v10);
  }
  v11 = v7;
  objc_msgSend(v6, *a5);

}

void INGetCarPowerLevelStatusIntentResponse.chargePercentRemaining.setter(uint64_t a1)
{
  INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.setter(a1, (SEL *)&selRef_setChargePercentRemaining_);
}

void INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.setter(uint64_t a1, SEL *a2)
{
  void *v2;
  int v4;
  id v5;
  double v6;
  id v7;
  id v8;

  if ((a1 & 0x100000000) != 0)
  {
    v7 = 0;
  }
  else
  {
    v4 = a1;
    v5 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
    LODWORD(v6) = v4;
    v7 = objc_msgSend(v5, sel_initWithFloat_, v6);
  }
  v8 = v7;
  objc_msgSend(v2, *a2);

}

void (*INGetCarPowerLevelStatusIntentResponse.chargePercentRemaining.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  void *v1;
  void *v2;
  id v4;
  void *v5;
  int v6;
  int v7;

  v2 = v1;
  *(_QWORD *)a1 = v2;
  v4 = objc_msgSend(v2, sel_chargePercentRemaining);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, sel_floatValue);
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  *(_DWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 12) = v5 == 0;
  return INGetCarPowerLevelStatusIntentResponse.chargePercentRemaining.modify;
}

void INGetCarPowerLevelStatusIntentResponse.chargePercentRemaining.modify(uint64_t a1, uint64_t a2)
{
  INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.modify(a1, a2, (SEL *)&selRef_setChargePercentRemaining_);
}

void INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining.modify(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v5;
  int v6;
  id v7;
  double v8;
  id v9;

  if ((*(_BYTE *)(a1 + 12) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = *(_DWORD *)(a1 + 8);
    v7 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
    LODWORD(v8) = v6;
    v5 = objc_msgSend(v7, sel_initWithFloat_, v8);
  }
  v9 = v5;
  objc_msgSend(*(id *)a1, *a3);

}

uint64_t INGetCarPowerLevelStatusIntentResponse.charging.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_charging);
  if (!v1)
    return 2;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_BOOLValue);

  return (uint64_t)v3;
}

void key path getter for INGetCarPowerLevelStatusIntentResponse.charging : INGetCarPowerLevelStatusIntentResponse(id *a1@<X0>, unsigned __int8 *a2@<X8>)
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = objc_msgSend(*a1, sel_charging);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_BOOLValue);

  }
  else
  {
    v5 = 2;
  }
  *a2 = v5;
}

void key path setter for INGetCarPowerLevelStatusIntentResponse.charging : INGetCarPowerLevelStatusIntentResponse(unsigned __int8 *a1, void **a2)
{
  int v2;
  void *v3;
  id v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  if (v2 == 2)
    v4 = 0;
  else
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v2 & 1);
  v5 = v4;
  objc_msgSend(v3, sel_setCharging_);

}

void INGetCarPowerLevelStatusIntentResponse.charging.setter(char a1)
{
  void *v1;
  id v3;
  id v4;

  if (a1 == 2)
    v3 = 0;
  else
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, a1 & 1);
  v4 = v3;
  objc_msgSend(v1, sel_setCharging_);

}

void (*INGetCarPowerLevelStatusIntentResponse.charging.modify(_QWORD *a1))(uint64_t a1)
{
  void *v1;
  unsigned __int8 *v2;
  id v3;
  void *v4;
  unsigned __int8 v5;

  *a1 = v1;
  v2 = (unsigned __int8 *)(a1 + 1);
  v3 = objc_msgSend(v1, sel_charging);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_BOOLValue);

  }
  else
  {
    v5 = 2;
  }
  *v2 = v5;
  return INGetCarPowerLevelStatusIntentResponse.charging.modify;
}

void INGetCarPowerLevelStatusIntentResponse.charging.modify(uint64_t a1)
{
  int v2;
  id v3;
  id v4;

  v2 = *(unsigned __int8 *)(a1 + 8);
  if (v2 == 2)
    v3 = 0;
  else
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v2 & 1);
  v4 = v3;
  objc_msgSend(*(id *)a1, sel_setCharging_);

}

id INGetCarPowerLevelStatusIntentResponse.minutesToFull.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_minutesToFull);
  v2 = v1;
  if (!v1)
    return 0;
  v3 = objc_msgSend(v1, sel_integerValue);

  return v3;
}

void key path getter for INGetCarPowerLevelStatusIntentResponse.minutesToFull : INGetCarPowerLevelStatusIntentResponse(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(*a1, sel_minutesToFull);
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, sel_integerValue);

  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v4 == 0;
}

void key path setter for INGetCarPowerLevelStatusIntentResponse.minutesToFull : INGetCarPowerLevelStatusIntentResponse(uint64_t a1, void **a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *a2;
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, *(_QWORD *)a1);
  v4 = v3;
  objc_msgSend(v2, sel_setMinutesToFull_);

}

void INGetCarPowerLevelStatusIntentResponse.minutesToFull.setter(uint64_t a1, char a2)
{
  void *v2;
  id v3;
  id v4;

  if ((a2 & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a1);
  v4 = v3;
  objc_msgSend(v2, sel_setMinutesToFull_);

}

void (*INGetCarPowerLevelStatusIntentResponse.minutesToFull.modify(uint64_t a1))(uint64_t a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = objc_msgSend(v1, sel_minutesToFull);
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, sel_integerValue);

  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = v4 == 0;
  return INGetCarPowerLevelStatusIntentResponse.minutesToFull.modify;
}

void INGetCarPowerLevelStatusIntentResponse.minutesToFull.modify(uint64_t a1)
{
  id v2;
  id v3;

  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, *(_QWORD *)a1);
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 16), sel_setMinutesToFull_);

}

void sub_209551070(id *a1@<X0>, uint64_t a2@<X8>)
{
  key path getter for INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining : INGetCarPowerLevelStatusIntentResponse(a1, (SEL *)&selRef_fuelPercentRemaining, a2);
}

void sub_20955108C(int *a1, void **a2, uint64_t a3, uint64_t a4)
{
  key path setter for INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining : INGetCarPowerLevelStatusIntentResponse(a1, a2, a3, a4, (SEL *)&selRef_setFuelPercentRemaining_);
}

void sub_2095510A8(id *a1@<X0>, uint64_t a2@<X8>)
{
  key path getter for INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining : INGetCarPowerLevelStatusIntentResponse(a1, (SEL *)&selRef_chargePercentRemaining, a2);
}

void sub_2095510C4(int *a1, void **a2, uint64_t a3, uint64_t a4)
{
  key path setter for INGetCarPowerLevelStatusIntentResponse.fuelPercentRemaining : INGetCarPowerLevelStatusIntentResponse(a1, a2, a3, a4, (SEL *)&selRef_setChargePercentRemaining_);
}

id INSearchForPhotosIntentResponse.searchResultsCount.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_searchResultsCount);
  v2 = v1;
  if (!v1)
    return 0;
  v3 = objc_msgSend(v1, sel_integerValue);

  return v3;
}

void key path getter for INSearchForPhotosIntentResponse.searchResultsCount : INSearchForPhotosIntentResponse(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(*a1, sel_searchResultsCount);
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, sel_integerValue);

  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v4 == 0;
}

void key path setter for INSearchForPhotosIntentResponse.searchResultsCount : INSearchForPhotosIntentResponse(uint64_t a1, void **a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *a2;
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, *(_QWORD *)a1);
  v4 = v3;
  objc_msgSend(v2, sel_setSearchResultsCount_);

}

void INSearchForPhotosIntentResponse.searchResultsCount.setter(uint64_t a1, char a2)
{
  void *v2;
  id v3;
  id v4;

  if ((a2 & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a1);
  v4 = v3;
  objc_msgSend(v2, sel_setSearchResultsCount_);

}

void (*INSearchForPhotosIntentResponse.searchResultsCount.modify(uint64_t a1))(uint64_t a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = objc_msgSend(v1, sel_searchResultsCount);
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, sel_integerValue);

  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = v4 == 0;
  return INSearchForPhotosIntentResponse.searchResultsCount.modify;
}

void INSearchForPhotosIntentResponse.searchResultsCount.modify(uint64_t a1)
{
  id v2;
  id v3;

  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, *(_QWORD *)a1);
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 16), sel_setSearchResultsCount_);

}

INSnoozeTasksIntent __swiftcall INSnoozeTasksIntent.init(tasks:nextTriggerTime:all:)(Swift::OpaquePointer_optional tasks, INDateComponentsRange_optional nextTriggerTime, Swift::Bool_optional all)
{
  void *v3;
  int isa_low;
  NSArray v5;
  id v6;
  id v7;

  v3 = *(void **)&tasks.is_nil;
  isa_low = LOBYTE(nextTriggerTime.value.super.isa);
  if (!tasks.value._rawValue)
  {
    v5.super.isa = 0;
    if (LOBYTE(nextTriggerTime.value.super.isa) == 2)
      goto LABEL_3;
LABEL_5:
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, isa_low & 1);
    goto LABEL_6;
  }
  type metadata accessor for INTask();
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (isa_low != 2)
    goto LABEL_5;
LABEL_3:
  v6 = 0;
LABEL_6:
  v7 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithTasks_nextTriggerTime_all_, v5.super.isa, v3, v6);

  return (INSnoozeTasksIntent)v7;
}

uint64_t INSnoozeTasksIntent.all.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_all);
  if (!v1)
    return 2;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_BOOLValue);

  return (uint64_t)v3;
}

INSaveProfileInCarIntent __swiftcall INSaveProfileInCarIntent.init(profileNumber:profileLabel:)(Swift::Int_optional profileNumber, Swift::String_optional profileLabel)
{
  void *object;
  uint64_t countAndFlagsBits;
  id v4;
  void *v5;
  id v6;

  object = profileLabel.value._object;
  countAndFlagsBits = profileLabel.value._countAndFlagsBits;
  if (profileNumber.is_nil)
  {
    v4 = 0;
    if (profileLabel.value._object)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, profileNumber.value);
  if (!object)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)MEMORY[0x20BD0EDCC](countAndFlagsBits, object);
  swift_bridgeObjectRelease();
LABEL_6:
  v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithProfileNumber_profileLabel_, v4, v5);

  return (INSaveProfileInCarIntent)v6;
}

id INSaveProfileInCarIntent.profileNumber.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_profileNumber);
  v2 = v1;
  if (!v1)
    return 0;
  v3 = objc_msgSend(v1, sel_integerValue);

  return v3;
}

uint64_t INMediaDestination.playlistName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  if (v0[1])
    v1 = *v0;
  else
    v1 = 0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t INMediaDestination.description.getter()
{
  return INMediaDestination.description.getter((SEL *)&selRef_description);
}

uint64_t INMediaDestination.debugDescription.getter()
{
  return INMediaDestination.description.getter((SEL *)&selRef_debugDescription);
}

uint64_t INMediaDestination.description.getter(SEL *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;

  v3 = v1[1];
  if (v3)
  {
    v4 = *v1;
    v5 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    v6 = (void *)MEMORY[0x20BD0EDCC](v4, v3);
    v7 = objc_msgSend(v5, sel_playlistDestinationWithName_, v6);
    swift_bridgeObjectRelease();

  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_self(), sel_libraryDestination);
  }
  v8 = objc_msgSend(v7, *a1);

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return v9;
}

void INMediaDestination.hash(into:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v1 = v0[1];
  if (v1)
  {
    v2 = *v0;
    v3 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    v4 = (void *)MEMORY[0x20BD0EDCC](v2, v1);
    v5 = objc_msgSend(v3, sel_playlistDestinationWithName_, v4);
    swift_bridgeObjectRelease();

  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_self(), sel_libraryDestination);
  }
  NSObject.hash(into:)();

}

Swift::Int INMediaDestination.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *v0;
  v1 = v0[1];
  Hasher.init(_seed:)();
  if (v1)
  {
    v3 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    v4 = (void *)MEMORY[0x20BD0EDCC](v2, v1);
    v5 = objc_msgSend(v3, sel_playlistDestinationWithName_, v4);
    swift_bridgeObjectRelease();

  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_self(), sel_libraryDestination);
  }
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance INMediaDestination()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v1 = v0[1];
  if (v1)
  {
    v2 = *v0;
    v3 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    v4 = (void *)MEMORY[0x20BD0EDCC](v2, v1);
    v5 = objc_msgSend(v3, sel_playlistDestinationWithName_, v4);
    swift_bridgeObjectRelease();

  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_self(), sel_libraryDestination);
  }
  NSObject.hash(into:)();

}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance INMediaDestination()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *v0;
  v1 = v0[1];
  Hasher.init(_seed:)();
  if (v1)
  {
    v3 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    v4 = (void *)MEMORY[0x20BD0EDCC](v2, v1);
    v5 = objc_msgSend(v3, sel_playlistDestinationWithName_, v4);
    swift_bridgeObjectRelease();

  }
  else
  {
    v5 = objc_msgSend((id)objc_opt_self(), sel_libraryDestination);
  }
  NSObject.hash(into:)();

  return Hasher._finalize()();
}

INMediaDestination __swiftcall INMediaDestination._bridgeToObjectiveC()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v1 = v0[1];
  if (!v1)
    return (INMediaDestination)objc_msgSend((id)objc_opt_self(), sel_libraryDestination);
  v2 = *v0;
  v3 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x20BD0EDCC](v2, v1);
  v5 = objc_msgSend(v3, sel_playlistDestinationWithName_, v4);
  swift_bridgeObjectRelease();

  return (INMediaDestination)v5;
}

void static INMediaDestination._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t *a2)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  outlined consume of INMediaDestination?(*a2, a2[1]);
  v4 = a1;
  v5 = objc_msgSend(v4, sel_playlistName);
  if (v5)
  {
    v6 = v5;
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;

  }
  else
  {

    v7 = 0;
    v9 = 0;
  }
  *a2 = v7;
  a2[1] = v9;
}

uint64_t static INMediaDestination._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t *a2)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  outlined consume of INMediaDestination?(*a2, a2[1]);
  v4 = a1;
  v5 = objc_msgSend(v4, sel_playlistName);
  if (v5)
  {
    v6 = v5;
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;

  }
  else
  {

    v7 = 0;
    v9 = 0;
  }
  *a2 = v7;
  a2[1] = v9;
  return 1;
}

void static INMediaDestination._unconditionallyBridgeFromObjectiveC(_:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1)
  {
    v3 = a1;
    v4 = objc_msgSend(v3, sel_playlistName);
    if (v4)
    {
      v5 = v4;
      v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v8 = v7;

    }
    else
    {

      v6 = 0;
      v8 = 0;
    }
    *a2 = v6;
    a2[1] = v8;
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance INMediaDestination()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v1 = v0[1];
  if (!v1)
    return objc_msgSend((id)objc_opt_self(), sel_libraryDestination);
  v2 = *v0;
  v3 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x20BD0EDCC](v2, v1);
  v5 = objc_msgSend(v3, sel_playlistDestinationWithName_, v4);
  swift_bridgeObjectRelease();

  return v5;
}

void protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance INMediaDestination(void *a1, uint64_t *a2)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  outlined consume of INMediaDestination?(*a2, a2[1]);
  v4 = a1;
  v5 = objc_msgSend(v4, sel_playlistName);
  if (v5)
  {
    v6 = v5;
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;

  }
  else
  {

    v7 = 0;
    v9 = 0;
  }
  *a2 = v7;
  a2[1] = v9;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance INMediaDestination(void *a1, uint64_t *a2)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  outlined consume of INMediaDestination?(*a2, a2[1]);
  v4 = a1;
  v5 = objc_msgSend(v4, sel_playlistName);
  if (v5)
  {
    v6 = v5;
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;

  }
  else
  {

    v7 = 0;
    v9 = 0;
  }
  *a2 = v7;
  a2[1] = v9;
  return 1;
}

uint64_t specialized static INMediaDestination.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[1];
  v4 = a2[1];
  if (v3)
  {
    if (v4)
    {
      if (*a1 != *a2 || v3 != v4)
        return _stringCompareWithSmolCheck(_:_:expecting:)();
      return 1;
    }
    return 0;
  }
  if (v4)
    return 0;
  swift_bridgeObjectRelease_n();
  return 1;
}

uint64_t outlined consume of INMediaDestination?(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t lazy protocol witness table accessor for type INMediaDestination and conformance INMediaDestination()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination;
  if (!lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination)
  {
    result = MEMORY[0x20BD0F03C](&protocol conformance descriptor for INMediaDestination, &type metadata for INMediaDestination);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination;
  if (!lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination)
  {
    result = MEMORY[0x20BD0F03C](&protocol conformance descriptor for INMediaDestination, &type metadata for INMediaDestination);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination;
  if (!lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination)
  {
    result = MEMORY[0x20BD0F03C](&protocol conformance descriptor for INMediaDestination, &type metadata for INMediaDestination);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination;
  if (!lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination)
  {
    result = MEMORY[0x20BD0F03C](&protocol conformance descriptor for INMediaDestination, &type metadata for INMediaDestination);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination;
  if (!lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination)
  {
    result = MEMORY[0x20BD0F03C](&protocol conformance descriptor for INMediaDestination, &type metadata for INMediaDestination);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INMediaDestination and conformance INMediaDestination);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for INMediaDestination(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for INMediaDestination()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for INMediaDestination(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for INMediaDestination(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for INMediaDestination(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for INMediaDestination(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t getEnumTag for INMediaDestination(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *destructiveInjectEnumTag for INMediaDestination(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for INMediaDestination()
{
  return &type metadata for INMediaDestination;
}

INStartWorkoutIntent __swiftcall INStartWorkoutIntent.init(workoutName:goalValue:workoutGoalUnitType:workoutLocationType:isOpenEnded:)(INSpeakableString_optional workoutName, Swift::Double_optional goalValue, INWorkoutGoalUnitType workoutGoalUnitType, INWorkoutLocationType workoutLocationType, Swift::Bool_optional isOpenEnded)
{
  Class isa;
  int value;
  id v9;
  id v10;
  id v11;

  isa = workoutName.value.super.isa;
  value = isOpenEnded.value;
  if (goalValue.is_nil)
  {
    v9 = 0;
    if (isOpenEnded.value != 2)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)&workoutName.is_nil);
  if (value == 2)
    goto LABEL_5;
LABEL_3:
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, value & 1);
LABEL_6:
  v11 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithWorkoutName_goalValue_workoutGoalUnitType_workoutLocationType_isOpenEnded_, isa, v9, workoutGoalUnitType, workoutLocationType, v10);

  return (INStartWorkoutIntent)v11;
}

id INStartWorkoutIntent.goalValue.getter()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  result = objc_msgSend(v0, sel_goalValue);
  v2 = result;
  if (result)
  {
    objc_msgSend(result, sel_doubleValue);
    v4 = v3;

    return (id)v4;
  }
  return result;
}

uint64_t INStartWorkoutIntent.isOpenEnded.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_isOpenEnded);
  if (!v1)
    return 2;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_BOOLValue);

  return (uint64_t)v3;
}

id INRestaurantReservation.init(itemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:reservationDuration:partySize:restaurantLocation:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, char a11, void *a12)
{
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  Class isa;
  void *v25;
  char v26;
  NSArray v27;
  id v28;
  id v29;
  uint64_t v31;
  uint64_t v32;

  v32 = a5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8]();
  v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v21 = (void *)MEMORY[0x20BD0EDCC](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = 0;
  }
  outlined init with copy of Date?(a4, (uint64_t)v20, &demangling cache variable for type metadata for Date?);
  v22 = type metadata accessor for Date();
  v23 = *(_QWORD *)(v22 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v20, 1, v22) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
  }
  if (a7)
  {
    v25 = (void *)MEMORY[0x20BD0EDCC](a6, a7);
    swift_bridgeObjectRelease();
    v26 = a11;
    if (a8)
    {
LABEL_8:
      type metadata accessor for INReservationAction();
      v27.super.isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  else
  {
    v25 = 0;
    v26 = a11;
    if (a8)
      goto LABEL_8;
  }
  v27.super.isa = 0;
LABEL_11:
  if ((v26 & 1) != 0)
    v28 = 0;
  else
    v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a10);
  v29 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithItemReference_reservationNumber_bookingTime_reservationStatus_reservationHolderName_actions_reservationDuration_partySize_restaurantLocation_, a1, v21, isa, v32, v25, v27.super.isa, a9, v28, a12);

  outlined destroy of Date?(a4, &demangling cache variable for type metadata for Date?);
  return v29;
}

unint64_t type metadata accessor for INReservationAction()
{
  unint64_t result;

  result = lazy cache variable for type metadata for INReservationAction;
  if (!lazy cache variable for type metadata for INReservationAction)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for INReservationAction);
  }
  return result;
}

id INRestaurantReservation.init(itemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:url:reservationDuration:partySize:restaurantLocation:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, char a12, void *a13)
{
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  Class isa;
  uint64_t v26;
  NSArray v27;
  uint64_t v28;
  uint64_t v29;
  NSURL *v30;
  void *v31;
  void *v32;
  void *v33;
  Class v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v44 = a5;
  v45 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8]();
  v20 = (char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8]();
  v22 = (char *)&v43 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v47 = MEMORY[0x20BD0EDCC](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    v47 = 0;
  }
  v48 = a4;
  outlined init with copy of Date?(a4, (uint64_t)v22, &demangling cache variable for type metadata for Date?);
  v23 = type metadata accessor for Date();
  v24 = *(_QWORD *)(v23 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v22, v23);
  }
  if (a7)
  {
    v26 = MEMORY[0x20BD0EDCC](a6, a7);
    swift_bridgeObjectRelease();
    if (a8)
    {
LABEL_8:
      type metadata accessor for INReservationAction();
      v27.super.isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  else
  {
    v26 = 0;
    if (a8)
      goto LABEL_8;
  }
  v27.super.isa = 0;
LABEL_11:
  outlined init with copy of Date?(a9, (uint64_t)v20, &demangling cache variable for type metadata for URL?);
  v28 = type metadata accessor for URL();
  v29 = *(_QWORD *)(v28 - 8);
  v31 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v20, 1, v28) != 1)
  {
    URL._bridgeToObjectiveC()(v30);
    v31 = v32;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v20, v28);
  }
  v46 = a9;
  v33 = (void *)v26;
  v34 = isa;
  v35 = v33;
  if ((a12 & 1) != 0)
    v36 = 0;
  else
    v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a11);
  v38 = v44;
  v37 = v45;
  v39 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v40 = (void *)v47;
  v41 = objc_msgSend(v39, sel_initWithItemReference_reservationNumber_bookingTime_reservationStatus_reservationHolderName_actions_URL_reservationDuration_partySize_restaurantLocation_, v37, v47, v34, v38, v35, v27.super.isa, v31, a10, v36, a13);

  outlined destroy of Date?(v46, &demangling cache variable for type metadata for URL?);
  outlined destroy of Date?(v48, &demangling cache variable for type metadata for Date?);
  return v41;
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of Date?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id INRestaurantReservation.partySize.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_partySize);
  v2 = v1;
  if (!v1)
    return 0;
  v3 = objc_msgSend(v1, sel_integerValue);

  return v3;
}

id static INBooleanResolutionResult.confirmationRequired(with:)(char a1)
{
  id v2;
  id v3;

  if (a1 == 2)
    v2 = 0;
  else
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, a1 & 1);
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_confirmationRequiredWithValueToConfirm_, v2);

  return v3;
}

void INShortcut.init(intent:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;

  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA170]), sel_initWithIntent_, a1);
  if (!v4)
  {

    v7 = 0;
    v8 = -1;
    goto LABEL_7;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, sel_intent);
  if (v6)
  {
    v7 = v6;

    v8 = 0;
LABEL_7:
    *(_QWORD *)a2 = v7;
    *(_BYTE *)(a2 + 8) = v8;
    return;
  }
  v9 = objc_msgSend(v5, sel_userActivity);
  if (v9)
  {
    v7 = v9;

    v8 = 1;
    goto LABEL_7;
  }
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t INShortcut.init(userActivity:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 1;
  return result;
}

id INShortcut.intent.getter()
{
  uint64_t v0;
  id v1;
  id v2;

  if ((*(_BYTE *)(v0 + 8) & 1) != 0)
    return 0;
  v1 = *(id *)v0;
  v2 = *(id *)v0;
  return v1;
}

id INShortcut.userActivity.getter()
{
  uint64_t v0;
  id v1;
  id v2;

  if (*(_BYTE *)(v0 + 8) != 1)
    return 0;
  v1 = *(id *)v0;
  v2 = *(id *)v0;
  return v1;
}

id INShortcut.description.getter()
{
  return INShortcut.description.getter((SEL *)&selRef_description);
}

id INShortcut.debugDescription.getter()
{
  return INShortcut.description.getter((SEL *)&selRef_debugDescription);
}

id INShortcut.description.getter(SEL *a1)
{
  uint64_t v1;
  void *v3;
  char v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id result;
  id v10;
  uint64_t v11;

  v3 = *(void **)v1;
  v4 = *(_BYTE *)(v1 + 8);
  v5 = objc_allocWithZone(MEMORY[0x24BDDA170]);
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    v7 = objc_msgSend(v5, sel_initWithUserActivity_, v3);
LABEL_5:
    v10 = objc_msgSend(v7, *a1);

    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    return (id)v11;
  }
  v8 = v3;
  result = objc_msgSend(v6, sel_initWithIntent_, v8);
  if (result)
  {
    v7 = result;

    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void INShortcut.hash(into:)()
{
  uint64_t v0;
  void *v1;
  char v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v1 = *(void **)v0;
  v2 = *(_BYTE *)(v0 + 8);
  v3 = objc_allocWithZone(MEMORY[0x24BDDA170]);
  v4 = v3;
  if ((v2 & 1) != 0)
  {
    v5 = objc_msgSend(v3, sel_initWithUserActivity_, v1);
LABEL_5:
    v8 = v5;
    NSObject.hash(into:)();

    return;
  }
  v6 = v1;
  v7 = objc_msgSend(v4, sel_initWithIntent_, v6);
  if (v7)
  {

    v5 = v7;
    goto LABEL_5;
  }
  __break(1u);
}

id INShortcut.hashValue.getter()
{
  uint64_t v0;
  void *v1;
  char v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id result;

  v1 = *(void **)v0;
  v2 = *(_BYTE *)(v0 + 8);
  Hasher.init(_seed:)();
  v3 = objc_allocWithZone(MEMORY[0x24BDDA170]);
  v4 = v3;
  if ((v2 & 1) != 0)
  {
    v5 = objc_msgSend(v3, sel_initWithUserActivity_, v1);
LABEL_5:
    NSObject.hash(into:)();

    return (id)Hasher._finalize()();
  }
  v6 = v1;
  result = objc_msgSend(v4, sel_initWithIntent_, v6);
  if (result)
  {
    v5 = result;

    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void protocol witness for Hashable.hash(into:) in conformance INShortcut()
{
  uint64_t v0;
  void *v1;
  char v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v1 = *(void **)v0;
  v2 = *(_BYTE *)(v0 + 8);
  v3 = objc_allocWithZone(MEMORY[0x24BDDA170]);
  v4 = v3;
  if ((v2 & 1) != 0)
  {
    v5 = objc_msgSend(v3, sel_initWithUserActivity_, v1);
LABEL_5:
    v8 = v5;
    NSObject.hash(into:)();

    return;
  }
  v6 = v1;
  v7 = objc_msgSend(v4, sel_initWithIntent_, v6);
  if (v7)
  {

    v5 = v7;
    goto LABEL_5;
  }
  __break(1u);
}

id protocol witness for Hashable._rawHashValue(seed:) in conformance INShortcut()
{
  uint64_t v0;
  void *v1;
  char v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id result;

  v1 = *(void **)v0;
  v2 = *(_BYTE *)(v0 + 8);
  Hasher.init(_seed:)();
  v3 = objc_allocWithZone(MEMORY[0x24BDDA170]);
  v4 = v3;
  if ((v2 & 1) != 0)
  {
    v5 = objc_msgSend(v3, sel_initWithUserActivity_, v1);
LABEL_5:
    NSObject.hash(into:)();

    return (id)Hasher._finalize()();
  }
  v6 = v1;
  result = objc_msgSend(v4, sel_initWithIntent_, v6);
  if (result)
  {
    v5 = result;

    goto LABEL_5;
  }
  __break(1u);
  return result;
}

INShortcut __swiftcall INShortcut._bridgeToObjectiveC()()
{
  uint64_t v0;
  void *v1;
  char v2;
  id v3;
  void *v4;
  INShortcut result;
  id v6;
  Class isa;

  v1 = *(void **)v0;
  v2 = *(_BYTE *)(v0 + 8);
  v3 = objc_allocWithZone(MEMORY[0x24BDDA170]);
  v4 = v3;
  if ((v2 & 1) != 0)
    return (INShortcut)objc_msgSend(v3, sel_initWithUserActivity_, v1);
  v6 = v1;
  result.super.isa = (Class)objc_msgSend(v4, sel_initWithIntent_, v6);
  if (result.super.isa)
  {
    isa = result.super.isa;

    return (INShortcut)isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void static INShortcut._unconditionallyBridgeFromObjectiveC(_:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  id v4;
  id v5;

  if (a1
    && ((v3 = a1, v4 = objc_msgSend(v3, sel_intent), (v5 = v4) != 0)
     || (v5 = objc_msgSend(v3, sel_userActivity)) != 0))
  {

    *(_QWORD *)a2 = v5;
    *(_BYTE *)(a2 + 8) = v4 == 0;
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance INShortcut()
{
  uint64_t v0;
  void *v1;
  char v2;
  id v3;
  void *v4;
  id result;
  id v6;
  id v7;

  v1 = *(void **)v0;
  v2 = *(_BYTE *)(v0 + 8);
  v3 = objc_allocWithZone(MEMORY[0x24BDDA170]);
  v4 = v3;
  if ((v2 & 1) != 0)
    return objc_msgSend(v3, sel_initWithUserActivity_, v1);
  v6 = v1;
  result = objc_msgSend(v4, sel_initWithIntent_, v6);
  if (result)
  {
    v7 = result;

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t specialized static INShortcut.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;

  v2 = *(void **)a1;
  v3 = *(void **)a2;
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
  {
    if ((*(_BYTE *)(a2 + 8) & 1) == 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v6 & 1;
  }
  if ((*(_BYTE *)(a2 + 8) & 1) == 0)
    goto LABEL_5;
LABEL_3:
  type metadata accessor for NSObject();
  v4 = v3;
  v5 = v2;
  v6 = static NSObject.== infix(_:_:)();

  return v6 & 1;
}

void specialized static INShortcut._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v4;
  id v5;
  id v6;
  char v7;
  id v8;

  outlined consume of INShortcut?(*(id *)a2, *(_BYTE *)(a2 + 8));
  v4 = a1;
  v5 = objc_msgSend(v4, sel_intent);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
LABEL_5:

    *(_QWORD *)a2 = v6;
    *(_BYTE *)(a2 + 8) = v7;
    return;
  }
  v8 = objc_msgSend(v4, sel_userActivity);
  if (v8)
  {
    v6 = v8;
    v7 = 1;
    goto LABEL_5;
  }
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t specialized static INShortcut._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v4;
  id v5;
  id v6;
  uint64_t result;

  outlined consume of INShortcut?(*(id *)a2, *(_BYTE *)(a2 + 8));
  v4 = a1;
  v5 = objc_msgSend(v4, sel_intent);
  v6 = v5;
  if (v5 || (v6 = objc_msgSend(v4, sel_userActivity)) != 0)
  {

    *(_QWORD *)a2 = v6;
    *(_BYTE *)(a2 + 8) = v5 == 0;
    return 1;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type INShortcut and conformance INShortcut()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type INShortcut and conformance INShortcut;
  if (!lazy protocol witness table cache variable for type INShortcut and conformance INShortcut)
  {
    result = MEMORY[0x20BD0F03C](&protocol conformance descriptor for INShortcut, &type metadata for INShortcut);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INShortcut and conformance INShortcut);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type INShortcut and conformance INShortcut;
  if (!lazy protocol witness table cache variable for type INShortcut and conformance INShortcut)
  {
    result = MEMORY[0x20BD0F03C](&protocol conformance descriptor for INShortcut, &type metadata for INShortcut);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INShortcut and conformance INShortcut);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type INShortcut and conformance INShortcut;
  if (!lazy protocol witness table cache variable for type INShortcut and conformance INShortcut)
  {
    result = MEMORY[0x20BD0F03C](&protocol conformance descriptor for INShortcut, &type metadata for INShortcut);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INShortcut and conformance INShortcut);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type INShortcut and conformance INShortcut;
  if (!lazy protocol witness table cache variable for type INShortcut and conformance INShortcut)
  {
    result = MEMORY[0x20BD0F03C](&protocol conformance descriptor for INShortcut, &type metadata for INShortcut);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INShortcut and conformance INShortcut);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type INShortcut and conformance INShortcut;
  if (!lazy protocol witness table cache variable for type INShortcut and conformance INShortcut)
  {
    result = MEMORY[0x20BD0F03C](&protocol conformance descriptor for INShortcut, &type metadata for INShortcut);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type INShortcut and conformance INShortcut);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for INShortcut(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = v3;
  return a1;
}

void destroy for INShortcut(id *a1)
{

}

uint64_t assignWithCopy for INShortcut(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for INShortcut(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for INShortcut(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for INShortcut(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for INShortcut(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t destructiveInjectEnumTag for INShortcut(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for INShortcut()
{
  return &type metadata for INShortcut;
}

void outlined consume of INShortcut?(id a1, char a2)
{
  if (a2 != -1)

}

unint64_t type metadata accessor for NSObject()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSObject;
  if (!lazy cache variable for type metadata for NSObject)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSObject);
  }
  return result;
}

id INLodgingReservation.init(itemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:lodgingBusinessLocation:reservationDuration:numberOfAdults:numberOfChildren:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, char a12, uint64_t a13, char a14)
{
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  Class isa;
  uint64_t v27;
  NSArray v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  Class v35;
  void *v36;
  id v37;
  uint64_t v39;
  void *v40;
  Class v41;
  uint64_t v42;
  uint64_t v43;

  v42 = a5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8]();
  v22 = (char *)&v39 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v23 = MEMORY[0x20BD0EDCC](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    v23 = 0;
  }
  outlined init with copy of Date?(a4, (uint64_t)v22, &demangling cache variable for type metadata for Date?);
  v24 = type metadata accessor for Date();
  v25 = *(_QWORD *)(v24 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v22, 1, v24) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v22, v24);
  }
  if (a7)
  {
    v27 = MEMORY[0x20BD0EDCC](a6, a7);
    swift_bridgeObjectRelease();
  }
  else
  {
    v27 = 0;
  }
  v40 = a1;
  v41 = isa;
  v43 = a4;
  if (a8)
  {
    type metadata accessor for INReservationAction();
    v28.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v28.super.isa = 0;
  }
  if ((a12 & 1) != 0)
  {
    v29 = (void *)v27;
    v30 = (void *)v23;
    v31 = 0;
    v32 = a9;
    v33 = a10;
    if ((a14 & 1) != 0)
      goto LABEL_14;
LABEL_16:
    v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), byte_24C1B705E, a13);
    goto LABEL_17;
  }
  v29 = (void *)v27;
  v30 = (void *)v23;
  v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a11);
  v32 = a9;
  v33 = a10;
  if ((a14 & 1) == 0)
    goto LABEL_16;
LABEL_14:
  v34 = 0;
LABEL_17:
  v36 = v40;
  v35 = v41;
  v37 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithItemReference_reservationNumber_bookingTime_reservationStatus_reservationHolderName_actions_lodgingBusinessLocation_reservationDuration_numberOfAdults_numberOfChildren_, v40, v30, v41, v42, v29, v28.super.isa, v32, v33, v31, v34);

  outlined destroy of Date?(v43, &demangling cache variable for type metadata for Date?);
  return v37;
}

id INLodgingReservation.init(itemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:url:lodgingBusinessLocation:reservationDuration:numberOfAdults:numberOfChildren:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, char a13, uint64_t a14, char a15)
{
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  Class isa;
  void *v29;
  NSArray v30;
  uint64_t v31;
  uint64_t v32;
  NSURL *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  Class v43;
  uint64_t v44;
  Class v45;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  Class v53;
  Class v54;
  uint64_t v55;

  v50 = a5;
  v51 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8]();
  v22 = (char *)&v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8]();
  v24 = (char *)&v49 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v25 = (void *)MEMORY[0x20BD0EDCC](a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    v25 = 0;
  }
  v55 = a4;
  outlined init with copy of Date?(a4, (uint64_t)v24, &demangling cache variable for type metadata for Date?);
  v26 = type metadata accessor for Date();
  v27 = *(_QWORD *)(v26 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v24, 1, v26) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v27 + 8))(v24, v26);
  }
  if (a7)
  {
    v29 = (void *)MEMORY[0x20BD0EDCC](a6, a7);
    swift_bridgeObjectRelease();
    v54 = isa;
    if (a8)
    {
LABEL_8:
      type metadata accessor for INReservationAction();
      v30.super.isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  else
  {
    v29 = 0;
    v54 = isa;
    if (a8)
      goto LABEL_8;
  }
  v30.super.isa = 0;
LABEL_11:
  v52 = a9;
  outlined init with copy of Date?(a9, (uint64_t)v22, &demangling cache variable for type metadata for URL?);
  v31 = type metadata accessor for URL();
  v32 = *(_QWORD *)(v31 - 8);
  v34 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v22, 1, v31) != 1)
  {
    URL._bridgeToObjectiveC()(v33);
    v34 = v35;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v31);
  }
  v53 = v30.super.isa;
  if ((a13 & 1) != 0)
    v36 = 0;
  else
    v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a12);
  v37 = v50;
  if ((a15 & 1) != 0)
    v38 = 0;
  else
    v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), byte_24C1B705E, a14);
  v39 = v51;
  v40 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v48 = v36;
  v41 = v36;
  v42 = v34;
  v47 = v34;
  v43 = v54;
  v44 = v37;
  v45 = v53;
  v51 = objc_msgSend(v40, sel_initWithItemReference_reservationNumber_bookingTime_reservationStatus_reservationHolderName_actions_URL_lodgingBusinessLocation_reservationDuration_numberOfAdults_numberOfChildren_, v39, v25, v54, v44, v29, v53, v47, a10, a11, v48, v38);

  outlined destroy of Date?(v52, &demangling cache variable for type metadata for URL?);
  outlined destroy of Date?(v55, &demangling cache variable for type metadata for Date?);
  return v51;
}

id INLodgingReservation.numberOfAdults.getter()
{
  return INSetProfileInCarIntent.defaultProfile.getter((SEL *)&selRef_numberOfAdults);
}

id INLodgingReservation.numberOfChildren.getter()
{
  return INSetProfileInCarIntent.defaultProfile.getter((SEL *)&selRef_numberOfChildren);
}

uint64_t INGetCarLockStatusIntentResponse.locked.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_locked);
  if (!v1)
    return 2;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_BOOLValue);

  return (uint64_t)v3;
}

void key path getter for INGetCarLockStatusIntentResponse.locked : INGetCarLockStatusIntentResponse(id *a1@<X0>, unsigned __int8 *a2@<X8>)
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = objc_msgSend(*a1, sel_locked);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_BOOLValue);

  }
  else
  {
    v5 = 2;
  }
  *a2 = v5;
}

void key path setter for INGetCarLockStatusIntentResponse.locked : INGetCarLockStatusIntentResponse(unsigned __int8 *a1, void **a2)
{
  int v2;
  void *v3;
  id v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  if (v2 == 2)
    v4 = 0;
  else
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v2 & 1);
  v5 = v4;
  objc_msgSend(v3, sel_setLocked_);

}

void INGetCarLockStatusIntentResponse.locked.setter(char a1)
{
  void *v1;
  id v3;
  id v4;

  if (a1 == 2)
    v3 = 0;
  else
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, a1 & 1);
  v4 = v3;
  objc_msgSend(v1, sel_setLocked_);

}

void (*INGetCarLockStatusIntentResponse.locked.modify(_QWORD *a1))(uint64_t a1)
{
  void *v1;
  unsigned __int8 *v2;
  id v3;
  void *v4;
  unsigned __int8 v5;

  *a1 = v1;
  v2 = (unsigned __int8 *)(a1 + 1);
  v3 = objc_msgSend(v1, sel_locked);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_BOOLValue);

  }
  else
  {
    v5 = 2;
  }
  *v2 = v5;
  return INGetCarLockStatusIntentResponse.locked.modify;
}

void INGetCarLockStatusIntentResponse.locked.modify(uint64_t a1)
{
  int v2;
  id v3;
  id v4;

  v2 = *(unsigned __int8 *)(a1 + 8);
  if (v2 == 2)
    v3 = 0;
  else
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v2 & 1);
  v4 = v3;
  objc_msgSend(*(id *)a1, sel_setLocked_);

}

INFocusStatus __swiftcall INFocusStatus.init(isFocused:)(Swift::Bool_optional isFocused)
{
  id v2;
  id v3;

  if (isFocused.value == 2)
    v2 = 0;
  else
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, isFocused.value);
  v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithIsFocused_, v2);

  return (INFocusStatus)v3;
}

uint64_t INFocusStatus.isFocused.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_isFocused);
  if (!v1)
    return 2;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_BOOLValue);

  return (uint64_t)v3;
}

INSetRadioStationIntent __swiftcall INSetRadioStationIntent.init(radioType:frequency:stationName:channel:presetNumber:)(INRadioType radioType, Swift::Double_optional frequency, Swift::String_optional stationName, Swift::String_optional channel, Swift::Int_optional presetNumber)
{
  uint64_t v5;
  Swift::Int value;
  void *object;
  uint64_t countAndFlagsBits;
  void *v9;
  id v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  id v16;
  char v18;

  v5 = *(_QWORD *)&presetNumber.is_nil;
  value = presetNumber.value;
  object = channel.value._object;
  countAndFlagsBits = channel.value._countAndFlagsBits;
  v9 = stationName.value._object;
  if ((stationName.value._countAndFlagsBits & 1) != 0)
  {
    v11 = 0;
    if (channel.value._countAndFlagsBits)
    {
LABEL_3:
      v12 = (void *)MEMORY[0x20BD0EDCC](v9, countAndFlagsBits);
      swift_bridgeObjectRelease();
      v13 = v18;
      if (value)
        goto LABEL_4;
LABEL_8:
      v14 = 0;
      if ((v13 & 1) == 0)
        goto LABEL_5;
LABEL_9:
      v15 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)&frequency.is_nil);
    if (countAndFlagsBits)
      goto LABEL_3;
  }
  v12 = 0;
  v13 = v18;
  if (!value)
    goto LABEL_8;
LABEL_4:
  v14 = (void *)MEMORY[0x20BD0EDCC](object, value);
  swift_bridgeObjectRelease();
  if ((v13 & 1) != 0)
    goto LABEL_9;
LABEL_5:
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v5);
LABEL_10:
  v16 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRadioType_frequency_stationName_channel_presetNumber_, radioType, v11, v12, v14, v15);

  return (INSetRadioStationIntent)v16;
}

id INSetRadioStationIntent.frequency.getter()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  result = objc_msgSend(v0, sel_frequency);
  v2 = result;
  if (result)
  {
    objc_msgSend(result, sel_doubleValue);
    v4 = v3;

    return (id)v4;
  }
  return result;
}

id INSetRadioStationIntent.presetNumber.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_presetNumber);
  v2 = v1;
  if (!v1)
    return 0;
  v3 = objc_msgSend(v1, sel_integerValue);

  return v3;
}

id INStartPhotoPlaybackIntentResponse.searchResultsCount.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, sel_searchResultsCount);
  v2 = v1;
  if (!v1)
    return 0;
  v3 = objc_msgSend(v1, sel_integerValue);

  return v3;
}

void INStartPhotoPlaybackIntentResponse.searchResultsCount.setter(uint64_t a1, char a2)
{
  void *v2;
  id v3;
  id v4;

  if ((a2 & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a1);
  v4 = v3;
  objc_msgSend(v2, sel_setSearchResultsCount_);

}

void (*INStartPhotoPlaybackIntentResponse.searchResultsCount.modify(uint64_t a1))(uint64_t a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = objc_msgSend(v1, sel_searchResultsCount);
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, sel_integerValue);

  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = v4 == 0;
  return INSearchForPhotosIntentResponse.searchResultsCount.modify;
}

NSMeasurement __swiftcall Measurement._bridgeToObjectiveC()()
{
  objc_class *v0;
  void *v1;
  double v2;
  NSMeasurement result;

  v0 = (objc_class *)MEMORY[0x24BDCB430]();
  result._doubleValue = v2;
  result._unit = v1;
  result.super.isa = v0;
  return result;
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x24BDCE5D8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x24BDCFC08]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x24BDCFD28]();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t NSObject.hash(into:)()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t dispatch thunk of AnyKeyPath._kvcKeyPathString.getter()
{
  return MEMORY[0x24BEE20B8]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t __VaListBuilder.deallocStorage(wordCount:storage:)()
{
  return MEMORY[0x24BEE2BC0]();
}

uint64_t __VaListBuilder.va_list()()
{
  return MEMORY[0x24BEE2BC8]();
}

uint64_t type metadata accessor for __VaListBuilder()
{
  return MEMORY[0x24BEE2BD0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t dispatch thunk of CVarArg._cVarArgEncoding.getter()
{
  return MEMORY[0x24BEE45D8]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

