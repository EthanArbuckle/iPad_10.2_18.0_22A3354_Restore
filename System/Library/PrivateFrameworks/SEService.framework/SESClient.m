@implementation SESClient

+ (id)sharedClient
{
  objc_opt_self();
  if (sharedClient_pred != -1)
    dispatch_once(&sharedClient_pred, &__block_literal_global_3);
  return (id)sharedClient_sharedClient;
}

void __25__SESClient_sharedClient__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedClient_sharedClient;
  sharedClient_sharedClient = v0;

  -[SESClient setServiceName:](sharedClient_sharedClient, CFSTR("com.apple.seserviced"));
}

- (void)setServiceName:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void)connectionResetHandler
{
  void *v1;
  _QWORD *obj;

  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    v1 = (void *)obj[2];
    obj[2] = 0;

    objc_sync_exit(obj);
  }
}

- (id)connectToService
{
  id *v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  id v139;
  id v140;
  void *v141;
  void *v143;
  _QWORD v144[4];
  id v145;
  _QWORD v146[4];
  id v147;
  id location[2];

  if (!a1)
  {
    v141 = 0;
    return v141;
  }
  v1 = a1;
  objc_sync_enter(v1);
  if (!v1[2])
  {
    v2 = objc_alloc(MEMORY[0x24BDD1988]);
    v3 = v1[1];
    v4 = objc_msgSend(v2, "initWithMachServiceName:options:", v3, 4096);
    v5 = v1[2];
    v1[2] = (id)v4;

    if (!v1[2])
    {
      SESDefaultLogObject();
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      SESCreateAndLogError();
      v141 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    objc_initWeak(location, v1);
    v6 = v1[2];
    v7 = MEMORY[0x24BDAC760];
    v146[0] = MEMORY[0x24BDAC760];
    v146[1] = 3221225472;
    v146[2] = __29__SESClient_connectToService__block_invoke;
    v146[3] = &unk_24C2BD018;
    objc_copyWeak(&v147, location);
    objc_msgSend(v6, "setInterruptionHandler:", v146);

    v8 = v1[2];
    v144[0] = v7;
    v144[1] = 3221225472;
    v144[2] = __29__SESClient_connectToService__block_invoke_309;
    v144[3] = &unk_24C2BD018;
    objc_copyWeak(&v145, location);
    objc_msgSend(v8, "setInvalidationHandler:", v144);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545E0C90);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v13);

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v17);

    v18 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v21);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_preWarmWithReply_, 0, 1);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_preWarm_reply_, 0, 1);

    v24 = (void *)MEMORY[0x24BDBCF20];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_listEndPointCAs_, 0, 1);

    v27 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, v29, v30, v31, v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v33);

    v34 = (void *)MEMORY[0x24BDBCF20];
    v35 = objc_opt_class();
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    v38 = objc_opt_class();
    v39 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, v36, v37, v38, v39, objc_opt_class(), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v40);

    v41 = (void *)MEMORY[0x24BDBCF20];
    v42 = objc_opt_class();
    v43 = objc_opt_class();
    v44 = objc_opt_class();
    v45 = objc_opt_class();
    v46 = objc_opt_class();
    objc_msgSend(v41, "setWithObjects:", v42, v43, v44, v45, v46, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v47);

    v48 = (void *)MEMORY[0x24BDBCF20];
    v49 = objc_opt_class();
    v50 = objc_opt_class();
    v51 = objc_opt_class();
    v52 = objc_opt_class();
    v53 = objc_opt_class();
    objc_msgSend(v48, "setWithObjects:", v49, v50, v51, v52, v53, objc_opt_class(), 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v54, sel_createLocalEndpointWithProxy_readerIdentifier_readerPublicKey_reply_, 0, 1);

    v55 = (void *)MEMORY[0x24BDBCF20];
    v56 = objc_opt_class();
    v57 = objc_opt_class();
    v58 = objc_opt_class();
    v59 = objc_opt_class();
    v60 = objc_opt_class();
    v61 = objc_opt_class();
    objc_msgSend(v55, "setWithObjects:", v56, v57, v58, v59, v60, v61, objc_opt_class(), 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_createLyonEndpointWithProxy_readerGroupIdentifier_readerPublicKey_homeUUID_privateMailboxSize_reply_, 0, 1);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545D88E8);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_createAlishaEndpointWithProxy_identifier_authorityIdentifier_subjectIdentifier_configuration_readerIdentifier_readerPublicKey_readerInformation_startDate_endDate_keyIdentifier_authorizedKeys_confidentialMailBoxSize_privateMailBoxSize_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_createHydraEndpointWithProxy_serverParams_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_createLyonHydraEndpointWithProxy_serverParams_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_createEncryptionKeyEndPointWithProxy_identifier_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_updateHydraMailboxesWithProxy_identifier_encryptedSEBlob_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_createLocalEndpointWithProxy_readerIdentifier_readerPublicKey_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_createLyonEndpointWithProxy_readerGroupIdentifier_readerPublicKey_homeUUID_privateMailboxSize_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_updateLyonCredentialDocumentStatusWithProxy_endpointIdentifier_accessDocumentPresent_accessDocumentSignedTimestamp_revocationDocumentPresent_revocationDocumentSignedTimestamp_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_configureEndpointWithProxy_identifier_privateData_confidentialData_contactlessVolatileVisibility_contactlessPersistentVisibility_wiredVolatileVisibility_wiredPersistentVisibility_keySlot_nfcExpressOnlyInLPM_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_cleanupAppletsWithNoEndpoints_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_remoteTerminationRequestWithProxy_remoteTerminationRequest_publicKeyIdentifier_taskID_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_deleteEndPointWithProxy_identifier_mustBeTerminated_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_setPrivateDataWithProxy_identifier_privateData_privateDataOffset_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_getPrivateDataWithProxy_identifier_privateDataOffset_privateDataLength_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_signWithSEKey_keyData_data_algorithm_laExternalizedContext_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_signPrecomputedDigest_keyData_digest_algorithm_laExternalizedContext_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_sharedSecretWithSEKey_keyData_publicKey_algorithm_laExternalizedContext_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_createPTAttestation_keyData_subjectIdentifier_nonce_OIDs_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_createSEKey_extractedACLs_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_deleteSEKey_keyData_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_listEndPointContainers_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_createSELegacyKey_subjectIdentifier_metaData_localValidationList_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_deleteSELegacyKey_keySlot_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_signWithSELegacyKey_keySlot_challenge_metaData_authorization_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_signPrecomputedWithSELegacyKey_keySlot_metaData_authorization_authorizationType_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_getSELegacyKeyOccupiedSlots_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_convertEndpointWithProxy_keyIdentifier_notBeforeDate_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_preAuthorizeEndpointWithProxy_keyIdentifier_bindingAttestation_reply_, 0, 0);
    objc_msgSend(v9, "setInterface:forSelector:argumentIndex:ofReply:", v63, sel_authorizeEndPointWithProxy_version_identifier_externalCA_instanceCA_endpointCertificate_encryptionKeyAttestation_bindingAttestation_bindingAttestationToken_confidentialDataOffset_confidentialDataLength_metaData_authorizationID_reply_, 0, 0);
    v64 = (void *)MEMORY[0x24BDBCF20];
    v65 = objc_opt_class();
    v66 = objc_opt_class();
    v67 = objc_opt_class();
    v68 = objc_opt_class();
    v69 = objc_opt_class();
    objc_msgSend(v64, "setWithObjects:", v65, v66, v67, v68, v69, objc_opt_class(), 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v70, sel_listEndPointsWithProxy_reply_, 0, 1);

    v71 = (void *)MEMORY[0x24BDBCF20];
    v72 = objc_opt_class();
    v73 = objc_opt_class();
    objc_msgSend(v71, "setWithObjects:", v72, v73, objc_opt_class(), 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v74, sel_createEndPointAuthorizationID_userAuth_reply_, 0, 1);

    v75 = (void *)MEMORY[0x24BDBCF20];
    v76 = objc_opt_class();
    objc_msgSend(v75, "setWithObjects:", v76, objc_opt_class(), 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v77, sel_authorizeEndPointWithProxy_version_identifier_externalCA_instanceCA_endpointCertificate_encryptionKeyAttestation_bindingAttestation_bindingAttestationToken_confidentialDataOffset_confidentialDataLength_metaData_authorizationID_reply_, 0, 1);

    v78 = (void *)MEMORY[0x24BDBCF20];
    v79 = objc_opt_class();
    objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v80, sel_signatureWithEndPointIdentifier_metaDataHash_authorization_reply_, 0, 1);

    v81 = (void *)MEMORY[0x24BDBCF20];
    v82 = objc_opt_class();
    objc_msgSend(v81, "setWithObjects:", v82, objc_opt_class(), 0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v83, sel_signatureISO18013WithEndPointIdentifier_toBeSigned_reply_, 0, 1);

    v84 = (void *)MEMORY[0x24BDBCF20];
    v85 = objc_opt_class();
    objc_msgSend(v84, "setWithObjects:", v85, objc_opt_class(), 0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v86, sel_getEndpointBindingAttestationRequestWithProxy_authorityIdentifier_reply_, 0, 1);

    v87 = (void *)MEMORY[0x24BDBCF20];
    v88 = objc_opt_class();
    v89 = objc_opt_class();
    v90 = objc_opt_class();
    objc_msgSend(v87, "setWithObjects:", v88, v89, v90, objc_opt_class(), 0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v91, sel_listEndPointAuthorizations_, 0, 1);

    v92 = (void *)MEMORY[0x24BDBCF20];
    v93 = objc_opt_class();
    v94 = objc_opt_class();
    objc_msgSend(v92, "setWithObjects:", v93, v94, objc_opt_class(), 0);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v95, sel_listEndPointContainers_reply_, 0, 1);

    v96 = (void *)MEMORY[0x24BDBCF20];
    v97 = objc_opt_class();
    v98 = objc_opt_class();
    objc_msgSend(v96, "setWithObjects:", v97, v98, objc_opt_class(), 0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v99, sel_createFiDOKeyForRelyingParty_relyingPartyAccountHash_challenge_usingProxy_callback_, 0, 0);

    v100 = (void *)MEMORY[0x24BDBCF20];
    v101 = objc_opt_class();
    v102 = objc_opt_class();
    objc_msgSend(v100, "setWithObjects:", v101, v102, objc_opt_class(), 0);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v103, sel_deleteFiDOKeyFor_usingProxy_callback_, 0, 0);

    v104 = (void *)MEMORY[0x24BDBCF20];
    v105 = objc_opt_class();
    v106 = objc_opt_class();
    v107 = objc_opt_class();
    objc_msgSend(v104, "setWithObjects:", v105, v106, v107, objc_opt_class(), 0);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v108, sel_checkMultipleFidoKeyPresence_usingProxy_callback_, 0, 0);

    v109 = (void *)MEMORY[0x24BDBCF20];
    v110 = objc_opt_class();
    v111 = objc_opt_class();
    v112 = objc_opt_class();
    objc_msgSend(v109, "setWithObjects:", v110, v111, v112, objc_opt_class(), 0);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v113, sel_signMultipleWithFidoKeysFor_challenges_forEndpointIdentifiers_externalizedAuth_usingProxy_callback_, 0, 0);

    v114 = (void *)MEMORY[0x24BDBCF20];
    v115 = objc_opt_class();
    v116 = objc_opt_class();
    objc_msgSend(v114, "setWithObjects:", v115, v116, objc_opt_class(), 0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v117, sel_verifyWithFidoKeyFor_signedChallenge_usingProxy_callback_, 0, 0);

    v118 = (void *)MEMORY[0x24BDBCF20];
    v119 = objc_opt_class();
    v120 = objc_opt_class();
    objc_msgSend(v118, "setWithObjects:", v119, v120, objc_opt_class(), 0);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v121, sel_createFiDOKeyForRelyingParty_relyingPartyAccountHash_challenge_usingProxy_callback_, 0, 1);

    v122 = (void *)MEMORY[0x24BDBCF20];
    v123 = objc_opt_class();
    v124 = objc_opt_class();
    objc_msgSend(v122, "setWithObjects:", v123, v124, objc_opt_class(), 0);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v125, sel_checkMultipleFidoKeyPresence_usingProxy_callback_, 0, 1);

    v126 = (void *)MEMORY[0x24BDBCF20];
    v127 = objc_opt_class();
    v128 = objc_opt_class();
    v129 = objc_opt_class();
    v130 = objc_opt_class();
    objc_msgSend(v126, "setWithObjects:", v127, v128, v129, v130, objc_opt_class(), 0);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v131, sel_signMultipleWithFidoKeysFor_challenges_forEndpointIdentifiers_externalizedAuth_usingProxy_callback_, 0, 1);

    v132 = (void *)MEMORY[0x24BDBCF20];
    v133 = objc_opt_class();
    objc_msgSend(v132, "setWithObjects:", v133, objc_opt_class(), 0);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v134, sel_createPrivacyKeyForGroupIdentifier_withOptions_completion_, 0, 1);

    v135 = (void *)MEMORY[0x24BDBCF20];
    v136 = objc_opt_class();
    v137 = objc_opt_class();
    objc_msgSend(v135, "setWithObjects:", v136, v137, objc_opt_class(), 0);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v138, sel_privacyKeysForGroupIdentifier_keyIdentifier_completion_, 0, 1);

    objc_msgSend(v9, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_deletePrivacyKey_completion_, 0, 0);
    v139 = v1[2];
    objc_msgSend(v139, "setRemoteObjectInterface:", v9);

    v140 = v1[2];
    objc_msgSend(v140, "resume");

    objc_destroyWeak(&v145);
    objc_destroyWeak(&v147);
    objc_destroyWeak(location);
  }
  v141 = 0;
LABEL_6:
  objc_sync_exit(v1);

  return v141;
}

void __29__SESClient_connectToService__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  SESDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20A048000, v2, OS_LOG_TYPE_ERROR, "Connection interrupted", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SESClient connectionResetHandler](WeakRetained);

}

void __29__SESClient_connectToService__block_invoke_309(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  SESDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20A048000, v2, OS_LOG_TYPE_ERROR, "Connection interrupted", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SESClient connectionResetHandler](WeakRetained);

}

- (id)remoteObjectProxyWithError:(id *)a1
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!a1)
    return 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  -[SESClient connectToService](a1);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v12[5];
  if (v4)
  {
    v5 = 0;
    if (a2)
      *a2 = objc_retainAutorelease(v4);
  }
  else
  {
    v6 = a1[2];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __40__SESClient_remoteObjectProxyWithError___block_invoke;
    v10[3] = &unk_24C2BCCB0;
    v10[4] = &v11;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12[5])
    {
      if (a2)
      {
        SESDefaultLogObject();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        *a2 = (id)objc_claimAutoreleasedReturnValue();

      }
      v5 = 0;
    }
    else
    {
      v5 = v7;
    }

  }
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __40__SESClient_remoteObjectProxyWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)synchronousRemoteObjectProxyWithError:(id *)a1
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (!a1)
    return 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  -[SESClient connectToService](a1);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v12[5];
  if (v4)
  {
    v5 = 0;
    if (a2)
      *a2 = objc_retainAutorelease(v4);
  }
  else
  {
    v6 = a1[2];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__SESClient_synchronousRemoteObjectProxyWithError___block_invoke;
    v10[3] = &unk_24C2BCCB0;
    v10[4] = &v11;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && !v12[5])
    {
      v5 = v7;
    }
    else
    {
      if (a2)
      {
        SESDefaultLogObject();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        SESCreateAndLogError();
        *a2 = (id)objc_claimAutoreleasedReturnValue();

      }
      v5 = 0;
    }

  }
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __51__SESClient_synchronousRemoteObjectProxyWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
