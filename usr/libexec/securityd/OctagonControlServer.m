@implementation OctagonControlServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  const void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  const void *v14;
  NSObject *v15;
  int v17;
  unsigned int v18;
  __int16 v19;
  const __CFString *v20;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.octagon")));
  v6 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0 && (objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    v7 = sub_10000EF14("octagon");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v17 = 67109376;
      v18 = objc_msgSend(v4, "processIdentifier");
      v19 = 1024;
      LODWORD(v20) = objc_msgSend(v4, "effectiveUserIdentifier");
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "received connection from client pid %d (euid %u)", (uint8_t *)&v17, 0xEu);
    }

    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___OTControlProtocol));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SecXPCHelper safeErrorClasses](SecXPCHelper, "safeErrorClasses"));
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "appleAccountSignedIn:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "appleAccountSignedOut:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "notifyIDMSTrustLevelChangeForAltDSID:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "rpcEpochWithArguments:configuration:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "rpcPrepareIdentityAsApplicantWithArguments:configuration:reply:", 5, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "rpcVoucherWithArguments:configuration:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:maxCapability:reply:", 2, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "rpcJoinWithArguments:configuration:vouchData:vouchSig:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "status:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "status:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "fetchEgoPeerID:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "fetchCliqueStatus:configuration:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "fetchTrustStatus:configuration:reply:", 4, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "startOctagonStateMachine:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "resetAndEstablish:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "establish:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "leaveClique:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "removeFriendsInClique:peerIDs:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "peerDeviceNamesByPeerID:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "fetchAllViableBottles:source:reply:", 2, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "restoreFromBottle:entropy:bottleID:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "fetchEscrowContents:reply:", 3, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "createRecoveryKey:recoveryKey:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "joinWithRecoveryKey:recoveryKey:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "healthCheck:skipRateLimitingCheck:repair:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "simulateReceivePush:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "waitForOctagonUpgrade:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "postCDPFollowupResult:success:type:error:reply:", 3, 0);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "postCDPFollowupResult:success:type:error:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "tapToRadar:description:radar:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "refetchCKKSPolicy:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "setCDPEnabled:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "getCDPStatus:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "fetchEscrowRecords:source:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "setUserControllableViewsSyncStatus:enabled:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "fetchUserControllableViewsSyncStatus:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "resetAccountCDPContents:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "setLocalSecureElementIdentity:secureElementIdentity:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "removeLocalSecureElementIdentityPeerID:secureElementIdentityPeerID:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "fetchTrustedSecureElementIdentities:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "setAccountSetting:setting:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "fetchAccountSettings:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "fetchAccountWideSettingsWithForceFetch:arguments:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "waitForPriorityViewKeychainDataRecovery:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "createCustodianRecoveryKey:uuid:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "joinWithCustodianRecoveryKey:custodianRecoveryKey:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "preflightJoinWithCustodianRecoveryKey:custodianRecoveryKey:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "removeCustodianRecoveryKey:uuid:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "createInheritanceKey:uuid:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "generateInheritanceKey:uuid:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "storeInheritanceKey:ik:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "joinWithInheritanceKey:inheritanceKey:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "preflightJoinWithInheritanceKey:inheritanceKey:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "removeInheritanceKey:uuid:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "tlkRecoverabilityForEscrowRecordData:recordData:source:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "setMachineIDOverride:machineID:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "isRecoveryKeySet:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "recoverWithRecoveryKey:recoveryKey:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "removeRecoveryKey:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "preflightRecoverOctagonUsingRecoveryKey:recoveryKey:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "resetAcountData:resetReason:reply:", 0, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "totalTrustedPeers:reply:", 1, 1);
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v10, "areRecoveryKeysDistrusted:reply:", 1, 1);

    objc_msgSend(v4, "setExportedInterface:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](OTManager, "manager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonXPCEntitlementChecker createWithManager:entitlementBearer:](OctagonXPCEntitlementChecker, "createWithManager:entitlementBearer:", v11, v4));
    objc_msgSend(v4, "setExportedObject:", v12);

    objc_msgSend(v4, "resume");
    v13 = 1;
  }
  else
  {
    v14 = sub_10000EF14("SecError");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 67109378;
      v18 = objc_msgSend(v4, "processIdentifier");
      v19 = 2112;
      v20 = CFSTR("com.apple.private.octagon");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "octagon: Client pid: %d doesn't have entitlement: %@", (uint8_t *)&v17, 0x12u);
    }

    v13 = 0;
  }

  return v13;
}

@end
