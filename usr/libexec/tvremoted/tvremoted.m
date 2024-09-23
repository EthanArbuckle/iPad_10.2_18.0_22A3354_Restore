int main(int argc, const char **argv, const char **envp)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  TVRDServer *v9;
  id v10;
  void *v11;
  uint8_t v13[16];

  v3 = _TVRDXPCLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "The tvremote daemon is starting.", v13, 2u);
  }

  v5 = objc_autoreleasePoolPush();
  if ((_set_user_dir_suffix("com.apple.tvremoted") & 1) == 0)
  {
    v6 = _TVRDXPCLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      main_cold_1(v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TVRDLaunchEventHandlers sharedInstance](TVRDLaunchEventHandlers, "sharedInstance"));
  objc_msgSend(v8, "setupHandlers");

  v9 = objc_alloc_init(TVRDServer);
  v10 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.tvremotecore.xpc"));
  objc_msgSend(v10, "setDelegate:", v9);
  objc_msgSend(v10, "resume");
  objc_autoreleasePoolPop(v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v11, "run");

  return 0;
}

id _TVRDIRLog()
{
  if (_TVRDIRLog_onceToken != -1)
    dispatch_once(&_TVRDIRLog_onceToken, &__block_literal_global);
  return (id)_TVRDIRLog_log;
}

id _TVRDXPCLog()
{
  if (_TVRDXPCLog_onceToken != -1)
    dispatch_once(&_TVRDXPCLog_onceToken, &__block_literal_global_3);
  return (id)_TVRDXPCLog_log;
}

void sub_100004AD0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100005300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000578C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008C9C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000905C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100009A74(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_10000A77C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_10000FB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010AA8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void main_cold_1(NSObject *a1)
{
  int v2;
  int *v3;
  char *v4;
  _DWORD v5[2];
  __int16 v6;
  char *v7;

  v2 = *__error();
  v3 = __error();
  v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  v6 = 2080;
  v7 = v4;
  _os_log_fault_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_FAULT, "_set_user_dir_suffix failed. Error code: %d, Error: %s", (uint8_t *)v5, 0x12u);
}

id objc_msgSend__activateIRSessionManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_activateIRSessionManager");
}

id objc_msgSend__activateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_activateWithCompletion:");
}

id objc_msgSend__becameInterestedInDeviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_becameInterestedInDeviceWithIdentifier:");
}

id objc_msgSend__cachedDeviceForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cachedDeviceForIdentifier:");
}

id objc_msgSend__candidateForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_candidateForDevice:");
}

id objc_msgSend__connectToDeviceIfNeeded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectToDeviceIfNeeded:");
}

id objc_msgSend__createAssertionExpirationTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createAssertionExpirationTimer");
}

id objc_msgSend__deviceClassificationFromIRClassification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceClassificationFromIRClassification:");
}

id objc_msgSend__deviceForIdentifierInDeviceQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceForIdentifierInDeviceQuery:");
}

id objc_msgSend__deviceForKeyboardController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceForKeyboardController:");
}

id objc_msgSend__donateEventWithEventType_forDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_donateEventWithEventType:forDevice:");
}

id objc_msgSend__enableFindingSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableFindingSession:");
}

id objc_msgSend__enableTVRemoteControlCenterModule(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableTVRemoteControlCenterModule");
}

id objc_msgSend__fetchServiceTokenWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchServiceTokenWithCompletionHandler:");
}

id objc_msgSend__impl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_impl");
}

id objc_msgSend__informClientCouldNotLocateDeviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_informClientCouldNotLocateDeviceWithIdentifier:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_init");
}

id objc_msgSend__interestedClientProcessConnectionsForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_interestedClientProcessConnectionsForDevice:");
}

id objc_msgSend__invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidate");
}

id objc_msgSend__invalidateIRSessionManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidateIRSessionManager");
}

id objc_msgSend__invalidateRemoteAlertHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidateRemoteAlertHandle");
}

id objc_msgSend__isButtonOfNowPlayingType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isButtonOfNowPlayingType:");
}

id objc_msgSend__lostInterestInDeviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lostInterestInDeviceWithIdentifier:");
}

id objc_msgSend__newLockScreenBehaviour(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_newLockScreenBehaviour");
}

id objc_msgSend__processNameForPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_processNameForPid:");
}

id objc_msgSend__removeAllIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeAllIdentifiers");
}

id objc_msgSend__removeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeIdentifier:");
}

id objc_msgSend__restartIRSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restartIRSession");
}

id objc_msgSend__setIdentifier_alternateIdentifiers_name_model_supportedButtons_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setIdentifier:alternateIdentifiers:name:model:supportedButtons:");
}

id objc_msgSend__setup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setup");
}

id objc_msgSend__setupDistnotedHandlers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupDistnotedHandlers");
}

id objc_msgSend__setupNotificationHandlers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupNotificationHandlers");
}

id objc_msgSend__setupNotifydHandlers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupNotifydHandlers");
}

id objc_msgSend__setupSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupSession");
}

id objc_msgSend__startGeneralDeviceQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startGeneralDeviceQuery");
}

id objc_msgSend__stopGeneralDeviceQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopGeneralDeviceQuery");
}

id objc_msgSend__switchToCurrentUserProfileForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_switchToCurrentUserProfileForDevice:");
}

id objc_msgSend__updateDevicesWithRecommendations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateDevicesWithRecommendations:");
}

id objc_msgSend_aa_altDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_altDSID");
}

id objc_msgSend_acquireLockScreenAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireLockScreenAssertion");
}

id objc_msgSend_acquireSecureAppAssertionWithType_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireSecureAppAssertionWithType:errorHandler:");
}

id objc_msgSend_acquireWakeToRemoteAlertAssertionWithDefinition_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireWakeToRemoteAlertAssertionWithDefinition:errorHandler:");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activateWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithContext:");
}

id objc_msgSend_addEvent_forCandidate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEvent:forCandidate:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_alertHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertHandle");
}

id objc_msgSend_allIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allIdentifiers");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_alternateIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alternateIdentifiers");
}

id objc_msgSend_ams_activeiCloudAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_activeiCloudAccount");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appendString_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:withName:");
}

id objc_msgSend_applicationIsInstalled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationIsInstalled:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayOfStatesFromDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayOfStatesFromDevices:");
}

id objc_msgSend_assertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assertion");
}

id objc_msgSend_attentionState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attentionState");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "build");
}

id objc_msgSend_builderWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "builderWithObject:");
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "button");
}

id objc_msgSend_buttonType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonType");
}

id objc_msgSend_cachedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedDevices");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_cancelSearchForDeviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelSearchForDeviceWithIdentifier:");
}

id objc_msgSend_candidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "candidate");
}

id objc_msgSend_candidateIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "candidateIdentifier");
}

id objc_msgSend_candidateResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "candidateResults");
}

id objc_msgSend_challengeAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "challengeAttributes");
}

id objc_msgSend_challengeType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "challengeType");
}

id objc_msgSend_classification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classification");
}

id objc_msgSend_clientConnection_addedInterestedDeviceIdentifier_connectionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:addedInterestedDeviceIdentifier:connectionContext:");
}

id objc_msgSend_clientConnection_cancelledAuthChallengeForDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:cancelledAuthChallengeForDeviceIdentifier:");
}

id objc_msgSend_clientConnection_fetchUpNextInfoForDeviceWithIdentifier_paginationToken_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:fetchUpNextInfoForDeviceWithIdentifier:paginationToken:completion:");
}

id objc_msgSend_clientConnection_isConnectedToDeviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:isConnectedToDeviceWithIdentifier:");
}

id objc_msgSend_clientConnection_markAsWatchedForDeviceWithIdentifier_mediaIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:markAsWatchedForDeviceWithIdentifier:mediaIdentifier:completion:");
}

id objc_msgSend_clientConnection_playItem_deviceIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:playItem:deviceIdentifier:completion:");
}

id objc_msgSend_clientConnection_receivedAuthChallengeLocallyEnteredCode_forDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:receivedAuthChallengeLocallyEnteredCode:forDeviceIdentifier:");
}

id objc_msgSend_clientConnection_reiteratedInterestInDeviceIdentifier_connectionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:reiteratedInterestInDeviceIdentifier:connectionContext:");
}

id objc_msgSend_clientConnection_removeItemForDeviceWithIdentifier_mediaIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:removeItemForDeviceWithIdentifier:mediaIdentifier:completion:");
}

id objc_msgSend_clientConnection_removedInterestedDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:removedInterestedDeviceIdentifier:");
}

id objc_msgSend_clientConnection_requestsEnablingFindingSession_forDeviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:requestsEnablingFindingSession:forDeviceWithIdentifier:");
}

id objc_msgSend_clientConnection_requestsEnablingRemoteOnLockscreen_forDeviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:requestsEnablingRemoteOnLockscreen:forDeviceWithIdentifier:");
}

id objc_msgSend_clientConnection_requestsSendingButtonEvent_toDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:requestsSendingButtonEvent:toDeviceIdentifier:");
}

id objc_msgSend_clientConnection_requestsSendingEvent_toDeviceWithIdentifier_options_response_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:requestsSendingEvent:toDeviceWithIdentifier:options:response:");
}

id objc_msgSend_clientConnection_requestsSendingGameControllerEvent_toDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:requestsSendingGameControllerEvent:toDeviceIdentifier:");
}

id objc_msgSend_clientConnection_requestsSendingInputDataPayload_toDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:requestsSendingInputDataPayload:toDeviceIdentifier:");
}

id objc_msgSend_clientConnection_requestsSendingInputReturnKeyToDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:requestsSendingInputReturnKeyToDeviceIdentifier:");
}

id objc_msgSend_clientConnection_requestsSendingInputText_toDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:requestsSendingInputText:toDeviceIdentifier:");
}

id objc_msgSend_clientConnection_requestsSendingTouchEvent_toDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:requestsSendingTouchEvent:toDeviceIdentifier:");
}

id objc_msgSend_clientConnection_requestsSuggestedDeviceWithResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnection:requestsSuggestedDeviceWithResponse:");
}

id objc_msgSend_clientConnectionRequestsEndingDeviceQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnectionRequestsEndingDeviceQuery:");
}

id objc_msgSend_clientConnectionRequestsStartingDeviceQuery_withResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnectionRequestsStartingDeviceQuery:withResponse:");
}

id objc_msgSend_clientConnectionSeveredConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientConnectionSeveredConnection:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_codeToEnterOnDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "codeToEnterOnDevice");
}

id objc_msgSend_conciseDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conciseDescription");
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connect");
}

id objc_msgSend_connectionContextByID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionContextByID");
}

id objc_msgSend_connectionState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionState");
}

id objc_msgSend_connectionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionType");
}

id objc_msgSend_containsIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsIdentifier:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countForObject:");
}

id objc_msgSend_createServiceWithParameters_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createServiceWithParameters:reply:");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_dataForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataForKey:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_deleteCandidate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteCandidate:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_device_disconnectedForReason_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device:disconnectedForReason:error:");
}

id objc_msgSend_deviceConnected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceConnected:");
}

id objc_msgSend_deviceIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIdentifiers");
}

id objc_msgSend_deviceQueryDidUpdateDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceQueryDidUpdateDevices:");
}

id objc_msgSend_deviceQueryObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceQueryObservers");
}

id objc_msgSend_deviceQueryUpdatedDiscoveredDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceQueryUpdatedDiscoveredDevices:");
}

id objc_msgSend_deviceStateFromDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceStateFromDevice:");
}

id objc_msgSend_deviceUpdatedState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceUpdatedState:");
}

id objc_msgSend_deviceWithState_encounteredAuthChallengeOfType_attributes_codeToEnterOnDevice_throttleSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceWithState:encounteredAuthChallengeOfType:attributes:codeToEnterOnDevice:throttleSeconds:");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devices");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didInteractWithDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didInteractWithDevice:");
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnect");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventType");
}

id objc_msgSend_fetchActiveEndpointWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchActiveEndpointWithCompletion:");
}

id objc_msgSend_fetchUpNextInfoWithPaginationToken_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchUpNextInfoWithPaginationToken:completion:");
}

id objc_msgSend_filteredDeviceListHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredDeviceListHandler");
}

id objc_msgSend_filteredSetUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredSetUsingPredicate:");
}

id objc_msgSend_findDeviceWithIdentifier_timeout_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findDeviceWithIdentifier:timeout:completion:");
}

id objc_msgSend_firstUnlocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstUnlocked");
}

id objc_msgSend_generalDeviceQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generalDeviceQuery");
}

id objc_msgSend_handleIconElementRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleIconElementRequest:completionHandler:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasStarted");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierToCandidateMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierToCandidateMap");
}

id objc_msgSend_identifierToDeviceMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierToDeviceMap");
}

id objc_msgSend_idsIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idsIdentifier");
}

id objc_msgSend_informDeviceQueryObserversWithUpdatedSuggestions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "informDeviceQueryObserversWithUpdatedSuggestions");
}

id objc_msgSend_initWithCandidateIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCandidateIdentifier:");
}

id objc_msgSend_initWithEventType_eventSubType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventType:eventSubType:");
}

id objc_msgSend_initWithIntent_controlKind_controlType_extensionBundleIdentifier_containerBundleIdentifier_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIntent:controlKind:controlType:extensionBundleIdentifier:containerBundleIdentifier:size:");
}

id objc_msgSend_initWithIntent_moduleIdentifier_containerBundleIdentifier_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIntent:moduleIdentifier:containerBundleIdentifier:size:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithServiceName_viewControllerClassName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:viewControllerClassName:");
}

id objc_msgSend_initWithServicePackage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServicePackage:");
}

id objc_msgSend_initWithServiceToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceToken:");
}

id objc_msgSend_initWithXPCConnection_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithXPCConnection:delegate:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectsSet:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateAssertionExpirationTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateAssertionExpirationTimer");
}

id objc_msgSend_irSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "irSession");
}

id objc_msgSend_irSessionManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "irSessionManager");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isLockScreenAssertionActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLockScreenAssertionActive");
}

id objc_msgSend_isManagedConfigProfileInstalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isManagedConfigProfileInstalled");
}

id objc_msgSend_isPersistOnLockScreenEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPersistOnLockScreenEnabled");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isWakeToRemoteOnLockScreenDisabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWakeToRemoteOnLockScreenDisabled");
}

id objc_msgSend_keyboardController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyboardController");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_markAsWatchedWithMediaIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markAsWatchedWithMediaIdentifier:completion:");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_mutableIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableIdentifiers");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newHandleWithDefinition_configurationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newHandleWithDefinition:configurationContext:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pause");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phase");
}

id objc_msgSend_playItem_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playItem:completion:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processNewDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processNewDevices:");
}

id objc_msgSend_refreshState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshState");
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerObserver:");
}

id objc_msgSend_releaseLockScreenAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseLockScreenAssertion");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeInterestForDeviceWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeInterestForDeviceWithIdentifier:");
}

id objc_msgSend_removeItemWithMediaIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemWithMediaIdentifier:completion:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_requestCurrentContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestCurrentContext");
}

id objc_msgSend_requestCurrentRecommendedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestCurrentRecommendedDevices");
}

id objc_msgSend_requestInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestInterface");
}

id objc_msgSend_responseInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseInterface");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runWithConfiguration:");
}

id objc_msgSend_screenLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "screenLocked");
}

id objc_msgSend_sendButtonEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendButtonEvent:");
}

id objc_msgSend_sendEvent_options_response_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEvent:options:response:");
}

id objc_msgSend_sendGameControllerEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendGameControllerEvent:");
}

id objc_msgSend_sendReturnKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendReturnKey");
}

id objc_msgSend_sendTextActionPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendTextActionPayload:");
}

id objc_msgSend_sendTouchEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendTouchEvent:");
}

id objc_msgSend_serviceToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceToken");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAlertHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlertHandle:");
}

id objc_msgSend_setAvOutpuDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAvOutpuDeviceIdentifier:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setClassification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClassification:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisconnectError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisconnectError:");
}

id objc_msgSend_setDisconnectReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisconnectReason:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFilteredDeviceListHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilteredDeviceListHandler:");
}

id objc_msgSend_setFirstUnlockHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFirstUnlockHandler:");
}

id objc_msgSend_setHasStarted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasStarted:");
}

id objc_msgSend_setIdsIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdsIdentifier:");
}

id objc_msgSend_setInformDeviceQueryObserversWithUpdatedSuggestions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInformDeviceQueryObserversWithUpdatedSuggestions:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIrSessionManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIrSessionManager:");
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOfStatesFromDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOfStatesFromDevices:");
}

id objc_msgSend_setRapportIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRapportIdentifier:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setScreenLockedChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScreenLockedChangedHandler:");
}

id objc_msgSend_setSuggestedDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSuggestedDevices:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_setupHandlers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupHandlers");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startAssertionExpirationTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAssertionExpirationTimer");
}

id objc_msgSend_stateDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateDictionary");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_suggestedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestedDevices");
}

id objc_msgSend_suggestedDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestedDevices:");
}

id objc_msgSend_systemMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemMonitor");
}

id objc_msgSend_throttleSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "throttleSeconds");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timerWithTimeInterval:repeats:block:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unregisterObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterObserver:");
}

id objc_msgSend_updateCandidates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCandidates:");
}

id objc_msgSend_updateDevice_withConnectionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDevice:withConnectionContext:");
}

id objc_msgSend_updateNodes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateNodes:");
}

id objc_msgSend_userEnteredCodeLocally_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userEnteredCodeLocally:");
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection");
}
