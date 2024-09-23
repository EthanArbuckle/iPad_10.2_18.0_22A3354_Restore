void sub_100003DA8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003E50;
  v6[3] = &unk_1000081F0;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v4 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = v4;
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

}

void sub_100003E50(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "incidentType"));
  v3 = +[TrafficIncidentIntentSupport incidentTypeForINTrafficIncidentType:](TrafficIncidentIntentSupport, "incidentTypeForINTrafficIncidentType:", objc_msgSend(v2, "type"));

  if (!*(_QWORD *)(a1 + 40))
    goto LABEL_18;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "isClear"));
  if (objc_msgSend(v4, "BOOLValue"))
  {

LABEL_5:
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "incidentType"));
    if (!v7)
    {
LABEL_8:
      v10 = objc_msgSend(objc_alloc((Class)INSupportedTrafficIncidentType), "initWithType:localizedDisplayString:", 0, 0);
      v11 = objc_claimAutoreleasedReturnValue(+[INReportIncidentIncidentTypeResolutionResult successWithResolvedSupportedTrafficIncidentType:](INReportIncidentIncidentTypeResolutionResult, "successWithResolvedSupportedTrafficIncidentType:", v10));
LABEL_15:
      v14 = (id)v11;

      goto LABEL_19;
    }
    v8 = v7;
    if ((_DWORD)v3)
    {
      v9 = objc_msgSend(*(id *)(a1 + 40), "isIncidentTypeSupported:", v3);

      if ((v9 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
LABEL_13:
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_supportedIncidentTypesForIncidentLayout:", *(_QWORD *)(a1 + 40)));
    v11 = objc_claimAutoreleasedReturnValue(+[INReportIncidentIncidentTypeResolutionResult resolutionResultUnsupportedWithReason:alternativeItems:](INReportIncidentIncidentTypeResolutionResult, "resolutionResultUnsupportedWithReason:alternativeItems:", 2, v10));
    goto LABEL_15;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "additionalDetails"));
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("update"));

  if (v6)
    goto LABEL_5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "incidentType"));

  if (!v12)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_supportedIncidentTypesForIncidentLayout:", *(_QWORD *)(a1 + 40)));
    v11 = objc_claimAutoreleasedReturnValue(+[INReportIncidentIncidentTypeResolutionResult disambiguationWithSupportedTrafficIncidentTypesToDisambiguate:](INReportIncidentIncidentTypeResolutionResult, "disambiguationWithSupportedTrafficIncidentTypesToDisambiguate:", v10));
    goto LABEL_15;
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "isIncidentTypeSupported:", v3))
  {
    if (!objc_msgSend(*(id *)(a1 + 40), "isIncidentTypeSupported:", v3) || !(_DWORD)v3)
      goto LABEL_13;
LABEL_18:
    v14 = (id)objc_claimAutoreleasedReturnValue(+[INReportIncidentIncidentTypeResolutionResult unsupportedForReason:](INReportIncidentIncidentTypeResolutionResult, "unsupportedForReason:", 1));
    goto LABEL_19;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "incidentType"));
  v14 = (id)objc_claimAutoreleasedReturnValue(+[INReportIncidentIncidentTypeResolutionResult successWithResolvedSupportedTrafficIncidentType:](INReportIncidentIncidentTypeResolutionResult, "successWithResolvedSupportedTrafficIncidentType:", v13));

LABEL_19:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t sub_100004168(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id MAPSGetIncidentsReportingLog()
{
  if (qword_10000D108 != -1)
    dispatch_once(&qword_10000D108, &stru_100008280);
  return (id)qword_10000D100;
}

void sub_100004344(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Maps", "IncidentsReporting");
  v2 = (void *)qword_10000D100;
  qword_10000D100 = (uint64_t)v1;

}

void sub_1000044F8(uint64_t a1, void *a2, void *a3, void *a4)
{
  TrafficIncidentLayout *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *i;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  TrafficIncidentLayout *v23;
  int v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  id v33;
  TrafficIncidentLayout *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  TrafficIncidentLayout *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];

  v6 = a2;
  v7 = a3;
  v8 = a4;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficIncidentLayout feedbackResult](v6, "feedbackResult"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutConfigResult"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "forms"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v12)
  {
    v13 = v12;
    v32 = v8;
    v33 = v7;
    v34 = v6;
    v14 = 0;
    v15 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v18 = objc_msgSend(v17, "formType", v32, v33, v34);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "feedbackRequestParameters"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layoutConfigParameters"));
        v21 = objc_msgSend(v20, "formType");

        if (v18 == v21)
        {
          v22 = v17;

          v14 = v22;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v13);

    v7 = v33;
    v6 = v34;
    v8 = v32;
    if (v14)
    {
      v23 = -[TrafficIncidentLayout initWithLayoutFormConfig:location:]([TrafficIncidentLayout alloc], "initWithLayoutFormConfig:location:", v14, *(_QWORD *)(a1 + 40));
      v24 = *(_DWORD *)(a1 + 56);
      if (v24 == 7)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutStorage sharedInstance](TrafficIncidentLayoutStorage, "sharedInstance"));
        objc_msgSend(v25, "saveIncidentLayout:", v23);
      }
      else
      {
        if (v24 != 9)
        {
LABEL_21:
          v29 = MAPSGetIncidentsReportingLog();
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v23;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "LayoutItem %@", buf, 0xCu);
          }

          v31 = *(_QWORD *)(a1 + 48);
          if (v31)
            (*(void (**)(uint64_t, TrafficIncidentLayout *))(v31 + 16))(v31, v23);

          goto LABEL_26;
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutStorage sharedInstance](TrafficIncidentLayoutStorage, "sharedInstance"));
        objc_msgSend(v25, "saveIncidentVotingLayout:", v23);
      }

      goto LABEL_21;
    }
  }
  else
  {

  }
  v26 = MAPSGetIncidentsReportingLog();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v41 = v6;
    v42 = 2112;
    v43 = v8;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Error: Layout config not included in response: %@ error: %@", buf, 0x16u);
  }

  v28 = *(_QWORD *)(a1 + 48);
  if (v28)
    (*(void (**)(uint64_t, _QWORD))(v28 + 16))(v28, 0);
LABEL_26:

}

void sub_1000048B0(id a1)
{
  TrafficIncidentLayoutStorage *v1;
  void *v2;

  v1 = objc_alloc_init(TrafficIncidentLayoutStorage);
  v2 = (void *)qword_10000D118;
  qword_10000D118 = (uint64_t)v1;

}

id objc_msgSend_INTrafficIncidentTypeForincidentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "INTrafficIncidentTypeForincidentType:");
}

id objc_msgSend__fetchTrafficIncidentsLayoutForLocation_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchTrafficIncidentsLayoutForLocation:completion:");
}

id objc_msgSend__generateRequestParamsForFormType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateRequestParamsForFormType:");
}

id objc_msgSend__populateLayoutFields_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_populateLayoutFields:");
}

id objc_msgSend__sharedUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sharedUserDefaults");
}

id objc_msgSend__supportedIncidentTypesForIncidentLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_supportedIncidentTypesForIncidentLayout:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_additionalDetails(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "additionalDetails");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_cachedIncidentLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedIncidentLayout");
}

id objc_msgSend_clearSensitiveFields_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearSensitiveFields:");
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinate");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocation");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeArrayOfObjectsOfClass:forKey:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeInt32ForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt32ForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultTraits(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultTraits");
}

id objc_msgSend_disambiguationWithSupportedTrafficIncidentTypesToDisambiguate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disambiguationWithSupportedTrafficIncidentTypesToDisambiguate:");
}

id objc_msgSend_displayIncidentOnMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayIncidentOnMap");
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enabled");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeInt32_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt32:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_feedbackRequestParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedbackRequestParameters");
}

id objc_msgSend_feedbackResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedbackResult");
}

id objc_msgSend_fetchTrafficIncidentsLayoutForLocation_formType_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchTrafficIncidentsLayoutForLocation:formType:completion:");
}

id objc_msgSend_formType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formType");
}

id objc_msgSend_forms(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forms");
}

id objc_msgSend_hasDisplayIncidentOnMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasDisplayIncidentOnMap");
}

id objc_msgSend_incidentField(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incidentField");
}

id objc_msgSend_incidentType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incidentType");
}

id objc_msgSend_incidentTypeForINTrafficIncidentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incidentTypeForINTrafficIncidentType:");
}

id objc_msgSend_initWithCLLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCLLocation:");
}

id objc_msgSend_initWithCode_userActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCode:userActivity:");
}

id objc_msgSend_initWithFeedbackRequestParameters_traits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFeedbackRequestParameters:traits:");
}

id objc_msgSend_initWithLayoutFormConfig_location_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLayoutFormConfig:location:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTrafficIncidentType_displayOnMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTrafficIncidentType:displayOnMap:");
}

id objc_msgSend_initWithType_localizedDisplayString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:localizedDisplayString:");
}

id objc_msgSend_isClear(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isClear");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isIncidentTypeSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIncidentTypeSupported:");
}

id objc_msgSend_latLng(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latLng");
}

id objc_msgSend_layoutConfigParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutConfigParameters");
}

id objc_msgSend_layoutConfigResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutConfigResult");
}

id objc_msgSend_layoutFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutFields");
}

id objc_msgSend_layoutItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutItems");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedTitleForIncidentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedTitleForIncidentType:");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "location");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "radius");
}

id objc_msgSend_resolutionResultUnsupportedWithReason_alternativeItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolutionResultUnsupportedWithReason:alternativeItems:");
}

id objc_msgSend_saveIncidentLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveIncidentLayout:");
}

id objc_msgSend_saveIncidentVotingLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveIncidentVotingLayout:");
}

id objc_msgSend_setDeviceLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceLocation:");
}

id objc_msgSend_setDisplayIncidentOnMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayIncidentOnMap:");
}

id objc_msgSend_setFormType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFormType:");
}

id objc_msgSend_setIncidentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncidentType:");
}

id objc_msgSend_setLayoutConfigParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLayoutConfigParameters:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedLocationManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedLocationManager");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedService");
}

id objc_msgSend_shouldInvalidateLayoutForLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldInvalidateLayoutForLocation:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_submitWithHandler_networkActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitWithHandler:networkActivity:");
}

id objc_msgSend_successWithResolvedSupportedTrafficIncidentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successWithResolvedSupportedTrafficIncidentType:");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_ticketForFeedbackRequest_traits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ticketForFeedbackRequest:traits:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_trafficType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trafficType");
}

id objc_msgSend_ttl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ttl");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unsupportedForReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsupportedForReason:");
}

id objc_msgSend_userLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userLocation");
}
