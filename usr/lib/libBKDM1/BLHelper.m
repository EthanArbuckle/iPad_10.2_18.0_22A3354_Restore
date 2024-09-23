@implementation BLHelper

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[9];
  _QWORD v41[9];
  _QWORD v42[21];
  _QWORD v43[21];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[8];
  _QWORD v47[8];
  _QWORD v48[11];
  _QWORD v49[11];
  _QWORD v50[4];
  _QWORD v51[4];
  _QWORD v52[6];
  _QWORD v53[6];
  _QWORD v54[4];
  _QWORD v55[4];
  _QWORD v56[9];
  _QWORD v57[9];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[8];
  _QWORD v61[8];
  _QWORD v62[17];
  _QWORD v63[17];
  _QWORD v64[4];
  _QWORD v65[4];
  _QWORD v66[7];
  _QWORD v67[7];
  _QWORD v68[17];
  _QWORD v69[17];
  _QWORD v70[11];
  _QWORD v71[11];
  _QWORD v72[53];
  _QWORD v73[55];

  v73[53] = *MEMORY[0x24BDAC8D0];
  v72[0] = &unk_251CB2A80;
  v72[1] = &unk_251CB2A98;
  v73[0] = CFSTR("NoEnrollees");
  v73[1] = CFSTR("MaxTemplateCount");
  v72[2] = &unk_251CB2AB0;
  v72[3] = &unk_251CB2AC8;
  v73[2] = CFSTR("ImageQueueIsEmpty");
  v73[3] = CFSTR("WakeOnMenuPinEnabled");
  v72[4] = &unk_251CB2AE0;
  v72[5] = &unk_251CB2AF8;
  v73[4] = CFSTR("ImageCaptured");
  v73[5] = CFSTR("StockholmAutoMatchStarted");
  v72[6] = &unk_251CB2B10;
  v72[7] = &unk_251CB2B28;
  v73[6] = CFSTR("TemplateListNotUpdated");
  v73[7] = CFSTR("MatchingStopped");
  v72[8] = &unk_251CB2B40;
  v72[9] = &unk_251CB2B58;
  v73[8] = CFSTR("MatchingFailed");
  v73[9] = CFSTR("SensorOperationModeFdet");
  v72[10] = &unk_251CB2B70;
  v72[11] = &unk_251CB2B88;
  v73[10] = CFSTR("TaskPaused");
  v73[11] = CFSTR("TaskResumed");
  v72[12] = &unk_251CB2BA0;
  v72[13] = &unk_251CB2BB8;
  v73[12] = CFSTR("TaskResumeFailed");
  v73[13] = CFSTR("FingerOn");
  v72[14] = &unk_251CB2BD0;
  v72[15] = &unk_251CB2BE8;
  v73[14] = CFSTR("FingerOff");
  v73[15] = CFSTR("EnrollmentComplete");
  v72[16] = &unk_251CB2C00;
  v72[17] = &unk_251CB2C18;
  v73[16] = CFSTR("EnrollmentCancelled");
  v73[17] = CFSTR("EnrollmentFailed");
  v72[18] = &unk_251CB2C30;
  v72[19] = &unk_251CB2C48;
  v73[18] = CFSTR("EnrollmentTimeout");
  v73[19] = CFSTR("UnknownError");
  v72[20] = &unk_251CB2C60;
  v72[21] = &unk_251CB2C78;
  v73[20] = CFSTR("ImageRejected");
  v73[21] = CFSTR("NoCalibration");
  v72[22] = &unk_251CB2C90;
  v72[23] = &unk_251CB2CA8;
  v73[22] = CFSTR("ImageForProcessing");
  v73[23] = CFSTR("TemplateListUpdated");
  v72[24] = &unk_251CB2CC0;
  v72[25] = &unk_251CB2CD8;
  v73[24] = CFSTR("RequestFingerOff");
  v73[25] = CFSTR("AutoMatchingStarted");
  v72[26] = &unk_251CB2CF0;
  v72[27] = &unk_251CB2D08;
  v73[26] = CFSTR("AutoMatchingStopped");
  v73[27] = CFSTR("CaptureRestart");
  v72[28] = &unk_251CB2D20;
  v72[29] = &unk_251CB2D38;
  v73[28] = CFSTR("ScanTooShort");
  v73[29] = CFSTR("AutoMatchingStartByHomeButton");
  v72[30] = &unk_251CB2D50;
  v72[31] = &unk_251CB2D68;
  v73[30] = CFSTR("MatchingCancelled");
  v73[31] = CFSTR("FingerOnBeforeFirstPasscodeUnlock");
  v72[32] = &unk_251CB2D80;
  v72[33] = &unk_251CB2D98;
  v73[32] = CFSTR("FingerOnInPasscodeLockout");
  v73[33] = CFSTR("FingerOnInBioLockout");
  v72[34] = &unk_251CB2DB0;
  v72[35] = &unk_251CB2DC8;
  v73[34] = CFSTR("ESDRecovery");
  v73[35] = CFSTR("ImageRejectedUnknown");
  v72[36] = &unk_251CB2DE0;
  v72[37] = &unk_251CB2DF8;
  v73[36] = CFSTR("ImageRejectedBadBlocks");
  v73[37] = CFSTR("ImageRejectedChFPN");
  v72[38] = &unk_251CB2E10;
  v72[39] = &unk_251CB2E28;
  v73[38] = CFSTR("ImageRejectedCaFPN");
  v73[39] = CFSTR("SensorOperationModeIdle");
  v72[40] = &unk_251CB2E40;
  v72[41] = &unk_251CB2E58;
  v73[40] = CFSTR("SensorOperationModeCapture");
  v73[41] = CFSTR("SensorOperationModePause");
  v72[42] = &unk_251CB2E70;
  v72[43] = &unk_251CB2E88;
  v73[42] = CFSTR("FingerOnTokenExpired");
  v73[43] = CFSTR("DirtOnSensorDetected");
  v72[44] = &unk_251CB2EA0;
  v72[45] = &unk_251CB2EB8;
  v73[44] = CFSTR("CalibrationDataLoaded");
  v73[45] = CFSTR("ImageWasAccepted");
  v72[46] = &unk_251CB2ED0;
  v72[47] = &unk_251CB2EE8;
  v73[46] = CFSTR("DesenseMitigationPause");
  v73[47] = CFSTR("MatchRetryAfterHomeButtonRelease");
  v72[48] = &unk_251CB2F00;
  v72[49] = &unk_251CB2F18;
  v73[48] = CFSTR("ImageRejectedMovement");
  v73[49] = CFSTR("FingerDetectCancelled");
  v72[50] = &unk_251CB2F30;
  v72[51] = &unk_251CB2F48;
  v73[50] = CFSTR("CredentialRemoved");
  v73[51] = CFSTR("BaseOffset");
  v72[52] = &unk_251CB2F60;
  v73[52] = CFSTR("MatchEvent");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 53);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)serviceStatusDict;
  serviceStatusDict = v2;

  v70[0] = &unk_251CB2A80;
  v70[1] = &unk_251CB2F78;
  v71[0] = CFSTR("SENSOR_IDLE");
  v71[1] = CFSTR("SENSOR_BUSY");
  v70[2] = &unk_251CB2F90;
  v70[3] = &unk_251CB2FA8;
  v71[2] = CFSTR("SENSOR_DATA_READY");
  v71[3] = CFSTR("SENSOR_CMD_NOT_SUPPORTED");
  v70[4] = &unk_251CB2FC0;
  v70[5] = &unk_251CB2FD8;
  v71[4] = CFSTR("SENSOR_HOLD");
  v71[5] = CFSTR("SENSOR_WAIT_FINGER");
  v71[6] = CFSTR("SENSOR_WAIT_MENU");
  v71[7] = CFSTR("SENSOR_CAP");
  v70[8] = &unk_251CB3020;
  v70[9] = &unk_251CB3038;
  v71[8] = CFSTR("SENSOR_CAP_RESTARTING");
  v71[9] = CFSTR("SENSOR_CAP_RCMD_RESTART");
  v70[6] = &unk_251CB2FF0;
  v70[7] = &unk_251CB3008;
  v70[10] = &unk_251CB3050;
  v71[10] = CFSTR("SENSOR_CAP_EARLY_RESTART");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 11);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)sensorStatusDict;
  sensorStatusDict = v4;

  v68[0] = &unk_251CB2AC8;
  v68[1] = &unk_251CB2AB0;
  v69[0] = CFSTR("UNINITIALIZED");
  v69[1] = CFSTR("ATE_TEST");
  v68[2] = &unk_251CB3068;
  v68[3] = &unk_251CB3080;
  v69[2] = CFSTR("UNPROVISIONED");
  v69[3] = CFSTR("PROVISIONED");
  v68[4] = &unk_251CB2B88;
  v68[5] = &unk_251CB3098;
  v69[4] = CFSTR("FAILURE");
  v69[5] = CFSTR("PATCHED");
  v68[6] = &unk_251CB2A80;
  v68[7] = &unk_251CB30B0;
  v69[6] = CFSTR("CS_OK");
  v69[7] = CFSTR("CS_CRC_ERROR");
  v68[8] = &unk_251CB30C8;
  v68[9] = &unk_251CB30E0;
  v69[8] = CFSTR("CS_LENGTH_ERROR");
  v69[9] = CFSTR("CS_CMD_ERROR");
  v68[10] = &unk_251CB2F78;
  v68[11] = &unk_251CB30F8;
  v69[10] = CFSTR("CS_CMD_NOT_ALLOWED");
  v69[11] = CFSTR("CS_BAD_TAG");
  v69[12] = CFSTR("CS_CAL_FAIL_ULPO");
  v69[13] = CFSTR("CS_CAL_FAIL_FREQ");
  v68[12] = &unk_251CB2FC0;
  v68[13] = &unk_251CB2FD8;
  v69[14] = CFSTR("CS_CAL_NVM_WRTE_FAIL");
  v69[15] = CFSTR("CS_CAL_FAIL_OFFSET");
  v68[14] = &unk_251CB2FF0;
  v68[15] = &unk_251CB3008;
  v68[16] = &unk_251CB3110;
  v69[16] = CFSTR("CS_FAILURE");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 17);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)sensorProvisionCommandStatusDict;
  sensorProvisionCommandStatusDict = v6;

  v66[0] = &unk_251CB2A80;
  v66[1] = &unk_251CB30B0;
  v67[0] = CFSTR("CS_Starting_FBFD");
  v67[1] = CFSTR("CS_FBFD");
  v66[2] = &unk_251CB30E0;
  v66[3] = &unk_251CB30F8;
  v67[2] = CFSTR("CS_IBFD");
  v67[3] = CFSTR("CS_FD_Settling");
  v66[4] = &unk_251CB30C8;
  v66[5] = &unk_251CB2F78;
  v67[4] = CFSTR("CS_FD_Motion");
  v67[5] = CFSTR("CS_FOffInCap");
  v66[6] = &unk_251CB3128;
  v67[6] = CFSTR("CS_Starting_IBFD");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)sensorWaitFingerCommandStatusDict;
  sensorWaitFingerCommandStatusDict = v8;

  v64[0] = &unk_251CB2A80;
  v64[1] = &unk_251CB30B0;
  v65[0] = CFSTR("TestPatch");
  v65[1] = CFSTR("ProdPatch");
  v64[2] = &unk_251CB30E0;
  v64[3] = &unk_251CB30F8;
  v65[2] = CFSTR("EngrPatch");
  v65[3] = CFSTR("EngrProdPatch?");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 4);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)sensorPatchTypeDict;
  sensorPatchTypeDict = v10;

  v62[0] = &unk_251CB2A80;
  v62[1] = &unk_251CB2BE8;
  v63[0] = CFSTR("SA_NO_ERRORS");
  v63[1] = CFSTR("SA_ERROR_SKE_UNWRAP_FAILURE");
  v62[2] = &unk_251CB2C00;
  v62[3] = &unk_251CB3140;
  v63[2] = CFSTR("SA_ERROR_AUTH_FAILURE");
  v63[3] = CFSTR("SA_ERROR_SPD_AUTH_FAILURE_SECOND_TIME");
  v62[4] = &unk_251CB3158;
  v62[5] = &unk_251CB2C48;
  v63[4] = CFSTR("SA_ERROR_BAD_STATE");
  v63[5] = CFSTR("SA_ERROR_BAD_PREVIOUS_STATE");
  v62[6] = &unk_251CB2C60;
  v62[7] = &unk_251CB2C78;
  v63[6] = CFSTR("SA_ERROR_BAD_PARAMETERS");
  v63[7] = CFSTR("SA_ERROR_IN_SEQUENCE_COUNTER");
  v62[8] = &unk_251CB3170;
  v62[9] = &unk_251CB2CA8;
  v63[8] = CFSTR("SA_ERROR_CRC_FAILURE");
  v63[9] = CFSTR("SA_ERROR_SPD_ROM_CHECKSUM_FAILURE");
  v62[10] = &unk_251CB2CC0;
  v62[11] = &unk_251CB3188;
  v63[10] = CFSTR("SA_ERROR_NVM_FAILURE");
  v63[11] = CFSTR("SA_ERROR_SKE_UNWRAP_ATTACK");
  v62[12] = &unk_251CB31A0;
  v62[13] = &unk_251CB31B8;
  v63[12] = CFSTR("SA_ERROR_KSM_MAGIC_ACCB_FAILURE");
  v63[13] = CFSTR("SA_ERROR_IN_TRNG_STATE");
  v62[14] = &unk_251CB2D20;
  v62[15] = &unk_251CB31D0;
  v63[14] = CFSTR("SA_ERROR_BAD_PROVISIONING");
  v63[15] = CFSTR("SA_ERROR_IN_CCM_LENGTH");
  v62[16] = &unk_251CB31E8;
  v63[16] = CFSTR("SA_ERROR_IN_DMA_LENGTH");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 17);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)sensorSecurityAssuranceDict;
  sensorSecurityAssuranceDict = v12;

  v61[0] = CFSTR("NoReset");
  v61[1] = CFSTR("PwrOnReset");
  v60[2] = &unk_251CB3080;
  v60[3] = &unk_251CB3200;
  v61[2] = CFSTR("WdogReset");
  v61[3] = CFSTR("ESDErrReset");
  v60[0] = &unk_251CB2A80;
  v60[1] = &unk_251CB2FC0;
  v60[4] = &unk_251CB2BD0;
  v60[5] = &unk_251CB2D50;
  v61[4] = CFSTR("ResetCmd");
  v61[5] = CFSTR("IdleCmd");
  v60[6] = &unk_251CB2ED0;
  v60[7] = &unk_251CB3218;
  v61[6] = CFSTR("SleepCmd");
  v61[7] = CFSTR("SelfResetAfterPatchLoad");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 8);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)sensorIndicatorResetSourceDict;
  sensorIndicatorResetSourceDict = v14;

  v58[0] = &unk_251CB2A80;
  v58[1] = &unk_251CB30B0;
  v59[0] = CFSTR("Idle");
  v59[1] = CFSTR("ShortScanning");
  v58[2] = &unk_251CB30E0;
  v59[2] = CFSTR("LongScanning");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)serviceScanningStateDict;
  serviceScanningStateDict = v16;

  v56[0] = &unk_251CB2A80;
  v56[1] = &unk_251CB30B0;
  v57[0] = CFSTR("DeviceIsUnlocked");
  v57[1] = CFSTR("DeviceIsLocked");
  v56[2] = &unk_251CB30E0;
  v56[3] = &unk_251CB30F8;
  v57[2] = CFSTR("DeviceIsLocking");
  v57[3] = CFSTR("Disabled");
  v57[4] = CFSTR("DeviceUnlockInProgress");
  v57[5] = CFSTR("DeviceInGracePeriod");
  v56[4] = &unk_251CB30C8;
  v56[5] = &unk_251CB2F78;
  v57[6] = CFSTR("DeviceInAssertDelay");
  v57[7] = CFSTR("DeviceInBioUnlock");
  v56[6] = &unk_251CB3128;
  v56[7] = &unk_251CB2F90;
  v56[8] = &unk_251CB3230;
  v57[8] = CFSTR("DeviceInBioUnlock (Artificial)");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 9);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)deviceLockStateDict;
  deviceLockStateDict = v18;

  v54[0] = &unk_251CB2A80;
  v54[1] = &unk_251CB30E0;
  v55[0] = CFSTR("IQ_ACC");
  v55[1] = CFSTR("IQ_ACC_COND");
  v54[2] = &unk_251CB30F8;
  v54[3] = &unk_251CB30C8;
  v55[2] = CFSTR("IQ_ACC_PREV");
  v55[3] = CFSTR("IQ_REJECT");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)imageQualityAsssessmentDict;
  imageQualityAsssessmentDict = v20;

  v52[0] = &unk_251CB2A80;
  v52[1] = &unk_251CB3248;
  v53[0] = CFSTR("IQ_FB_OK");
  v53[1] = CFSTR("IQ_FB_BADIMAGE");
  v52[2] = &unk_251CB3260;
  v52[3] = &unk_251CB3278;
  v53[2] = CFSTR("IQ_FB_BADBLOCKS");
  v53[3] = CFSTR("IQ_FB_CHFPN");
  v52[4] = &unk_251CB31A0;
  v52[5] = &unk_251CB31B8;
  v53[4] = CFSTR("IQ_FB_CAFPN");
  v53[5] = CFSTR("IQ_FB_MOTION");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 6);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)imageQualityFeedback;
  imageQualityFeedback = v22;

  v50[0] = &unk_251CB2A80;
  v50[1] = &unk_251CB30B0;
  v51[0] = CFSTR("Unknown (error?)");
  v51[1] = CFSTR("Secured (No internal data)");
  v50[2] = &unk_251CB30E0;
  v50[3] = &unk_251CB30F8;
  v51[2] = CFSTR("Unrestricted");
  v51[3] = CFSTR("Encrypted");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 4);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)loggingTypeDict;
  loggingTypeDict = v24;

  v48[0] = &unk_251CB2A80;
  v48[1] = &unk_251CB30B0;
  v49[0] = CFSTR("UnknownProvisioning");
  v49[1] = CFSTR("UninitializedProvisioning");
  v48[2] = &unk_251CB30E0;
  v48[3] = &unk_251CB30F8;
  v49[2] = CFSTR("ATE");
  v49[3] = CFSTR("Unprovisioned");
  v48[4] = &unk_251CB30C8;
  v48[5] = &unk_251CB2F78;
  v49[4] = CFSTR("ProvisionedWithUID");
  v49[5] = CFSTR("ProvisionedLocked");
  v48[6] = &unk_251CB3128;
  v48[7] = &unk_251CB2F90;
  v49[6] = CFSTR("ProvisionedWithStatic");
  v49[7] = CFSTR("ProvisionedUnknownKey");
  v48[8] = &unk_251CB3170;
  v48[9] = &unk_251CB2FA8;
  v49[8] = CFSTR("ProvisionedWithGID");
  v49[9] = CFSTR("ProvisionedWithTest");
  v48[10] = &unk_251CB3290;
  v49[10] = CFSTR("ProvisionedLockedUnknownKey");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 11);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)provisioningStateDict;
  provisioningStateDict = v26;

  v46[0] = &unk_251CB2A80;
  v46[1] = &unk_251CB30B0;
  v47[0] = CFSTR("Emergency");
  v47[1] = CFSTR("Alert");
  v46[2] = &unk_251CB30E0;
  v46[3] = &unk_251CB30F8;
  v47[2] = CFSTR("Critical");
  v47[3] = CFSTR("Error");
  v46[4] = &unk_251CB30C8;
  v46[5] = &unk_251CB2F78;
  v47[4] = CFSTR("Warning");
  v47[5] = CFSTR("Notice");
  v46[6] = &unk_251CB3128;
  v46[7] = &unk_251CB2F90;
  v47[6] = CFSTR("Info");
  v47[7] = CFSTR("Debug");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 8);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)aslLevelDict;
  aslLevelDict = v28;

  v44[0] = &unk_251CB2A80;
  v44[1] = &unk_251CB30B0;
  v45[0] = CFSTR("NoProb");
  v45[1] = CFSTR("Sweaty");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)imageQualityProblemClassDict;
  imageQualityProblemClassDict = v30;

  v43[0] = CFSTR("ReasonUnknown");
  v43[1] = CFSTR("ReasonCorruptedStatus");
  v42[2] = &unk_251CB30E0;
  v42[3] = &unk_251CB30F8;
  v42[0] = &unk_251CB2A80;
  v42[1] = &unk_251CB30B0;
  v43[2] = CFSTR("ReasonSPICommunication");
  v43[3] = CFSTR("ReasonIncompleteRecoveryOnWake");
  v42[4] = &unk_251CB30C8;
  v42[5] = &unk_251CB2F78;
  v43[4] = CFSTR("ReasonMultipleSPIErrors");
  v43[5] = CFSTR("ReasonSPIError");
  v42[6] = &unk_251CB3128;
  v42[7] = &unk_251CB2F90;
  v43[6] = CFSTR("ReasonUnexpectedReset");
  v43[7] = CFSTR("ReasonDroppedToBootROM");
  v42[8] = &unk_251CB3170;
  v42[9] = &unk_251CB2FA8;
  v43[8] = CFSTR("ReasonSensorESD");
  v43[9] = CFSTR("ReasonSimulatedESD");
  v42[10] = &unk_251CB3290;
  v42[11] = &unk_251CB32A8;
  v43[10] = CFSTR("ReasonNoResponse");
  v43[11] = CFSTR("ReasonBadStatusInWatchdog");
  v42[12] = &unk_251CB32C0;
  v42[13] = &unk_251CB32D8;
  v43[12] = CFSTR("ReasonNoInterruptAfterFingerOn");
  v43[13] = CFSTR("ReasonSensorWatchdog");
  v42[14] = &unk_251CB32F0;
  v42[15] = &unk_251CB3308;
  v43[14] = CFSTR("ReasonNoInterruptAFOIdle");
  v43[15] = CFSTR("ReasonNoInterruptAFOWait");
  v42[16] = &unk_251CB2FC0;
  v42[17] = &unk_251CB2FD8;
  v43[16] = CFSTR("ReasonNoInterruptAFOCapture");
  v43[17] = CFSTR("ReasonSPIErrorMasked");
  v42[18] = &unk_251CB2FF0;
  v42[19] = &unk_251CB3008;
  v43[18] = CFSTR("ReasonAOPTriggered");
  v43[19] = CFSTR("ReasonSEPDriverTriggered");
  v42[20] = &unk_251CB3320;
  v43[20] = CFSTR("ReasonSeqCounterOutOfBounds");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 21);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)resetReasonDict;
  resetReasonDict = v32;

  v40[0] = &unk_251CB30B0;
  v40[1] = &unk_251CB30E0;
  v41[0] = CFSTR("DeviceLocked");
  v41[1] = CFSTR("PasscodeLockout");
  v40[2] = &unk_251CB30C8;
  v40[3] = &unk_251CB3170;
  v41[2] = CFSTR("BioLockout");
  v41[3] = CFSTR("UnlockTokenPresent");
  v40[4] = &unk_251CB3338;
  v40[5] = &unk_251CB2FC0;
  v41[4] = CFSTR("ApplePayTokenPresent");
  v41[5] = CFSTR("BeforeFirstUnlock");
  v40[6] = &unk_251CB3080;
  v40[7] = &unk_251CB2BD0;
  v41[6] = CFSTR("PasscodeValidated");
  v41[7] = CFSTR("IdentificationLockout");
  v40[8] = &unk_251CB3350;
  v41[8] = CFSTR("CatacombCorrupted");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 9);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)sksLockStateDict;
  sksLockStateDict = v34;

  v38[0] = &unk_251CB3368;
  v38[1] = &unk_251CB3380;
  v39[0] = CFSTR("Unknown");
  v39[1] = CFSTR("Detected");
  v38[2] = &unk_251CB3398;
  v38[3] = &unk_251CB33B0;
  v39[2] = CFSTR("Rejected");
  v39[3] = CFSTR("Dismissed");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)wakeGestureStateDict;
  wakeGestureStateDict = v36;

}

+ (id)stringFromStatus:(unsigned int)a3
{
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  if (a3 - 1 >= 0x31)
  {
    if (a3 - 100 <= 0xFF)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("?EnrollmentProgress: %d"), a3 - 100);
      goto LABEL_6;
    }
    v7 = (void *)serviceStatusDict;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      return v5;
    v4 = CFSTR("Unknown (%d)");
  }
  else
  {
    v4 = CFSTR("?EnrollmentCount: %d");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v4, v3);
LABEL_6:
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

+ (id)stringFromDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  unint64_t v21;
  uint64_t v22;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithUTF8String:", ");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
    objc_msgSend(v4, "appendString:", CFSTR("[nil]"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 1;
    v9 = 0x24BDBC000uLL;
    v10 = "]";
    v11 = *(_QWORD *)v27;
    v12 = ":";
    v24 = v5;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v5);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
        if ((v8 & 1) == 0)
          objc_msgSend(v4, "appendString:", CFSTR(","));
        objc_msgSend(v5, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "stringFromArray:", v15);
          v16 = v7;
          v17 = v4;
          v18 = v11;
          v19 = v12;
          v20 = v10;
          v21 = v9;
          v22 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v22;
          v9 = v21;
          v10 = v20;
          v12 = v19;
          v11 = v18;
          v4 = v17;
          v7 = v16;
          v5 = v24;
        }
        objc_msgSend(v4, "appendFormat:", CFSTR("%s%@%s%@%s"), "[", v14, v12, v15, v10);

        v8 = 0;
        ++v13;
      }
      while (v7 != v13);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v8 = 0;
    }
    while (v7);
  }

  objc_msgSend(v4, "appendString:", &stru_251CA43A8);
  return v4;
}

+ (id)stringFromSensorIndicator:(unsigned __int8)a3
{
  int v3;
  void *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;

  v3 = (char)a3;
  v4 = (void *)MEMORY[0x24BDD17C8];
  if ((a3 & 1) != 0)
    v5 = "SPIErr";
  else
    v5 = "NoSPIErr";
  if ((a3 & 2) != 0)
    v6 = "FOn";
  else
    v6 = "FOff";
  if ((a3 & 4) != 0)
    v7 = "Calib";
  else
    v7 = "NotCalib";
  v8 = (void *)sensorIndicatorResetSourceDict;
  if ((a3 & 8) != 0)
    v9 = "Int";
  else
    v9 = "NoInt";
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3 & 0x70);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = "Data";
  if (v3 >= 0)
    v13 = "NoData";
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%s,%s,%s,%s,%@,%s"), v5, v6, v7, v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)stringFromSensorProvisionCommandStatus:(id *)a3
{
  int var1;
  void *v4;
  __CFString *v5;
  void *v6;

  var1 = a3->var1;
  if (var1 == 23)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("EARLY_DIFF:%d"), a3->var2);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (var1 == 22)
  {
    v5 = CFSTR("0");
  }
  else
  {
    if (var1 == 17)
      v4 = (void *)sensorWaitFingerCommandStatusDict;
    else
      v4 = (void *)sensorProvisionCommandStatusDict;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3->var2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v6);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)stringFromSensorSecurityAssurance:(id *)a3
{
  int var1;
  int var2;
  void *v6;
  void *v7;
  __CFString *v8;

  var1 = a3->var1;
  if ((var1 - 22) < 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("EARLY_SUBARRAY:%d"), a3->var2);
LABEL_10:
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v8;
  }
  if (var1 != 17)
  {
    v6 = (void *)sensorSecurityAssuranceDict;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3->var4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  var2 = a3->var2;
  if (var2 == 5 || var2 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MID0:%d"), a3->var4);
    goto LABEL_10;
  }
  v8 = CFSTR("0");
  return v8;
}

+ (id)stringFromSensorAdditionalData:(id *)a3
{
  unsigned int var1;
  __CFString *v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  var1 = a3->var1;
  v4 = CFSTR("-");
  if (var1 <= 0xF)
  {
    if (a3->var1)
    {
      if (var1 == 5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%dms"), *(unsigned int *)(&a3->var5 + 1), v7, v8, v9);
      }
      else
      {
        if (var1 != 7)
          return v4;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%dB"), *(unsigned int *)(&a3->var5 + 1), v7, v8, v9);
      }
    }
    else
    {
      HIDWORD(v5) = a3->var3 & 2;
      LODWORD(v5) = *(_DWORD *)(&a3->var5 + 1);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(PID:%x,SR:A%d,PR:%d)"), (unsigned __int16)v5, BYTE2(v5), (v5 >> 24), v9);
    }
LABEL_15:
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  switch(a3->var1)
  {
    case 0x10u:
LABEL_3:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(F1-FBFD_THRESH1:%d,F1:%d)"), HIWORD(*(_DWORD *)(&a3->var5 + 1)), (unsigned __int16)*(_DWORD *)(&a3->var5 + 1), v8, v9);
      goto LABEL_15;
    case 0x11u:
      switch(a3->var2)
      {
        case 1u:
          goto LABEL_3;
        case 2u:
        case 5u:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(MID4:%d,MID3:%d,MID2:%d,MID1:%d)"), HIBYTE(*(_DWORD *)(&a3->var5 + 1)), BYTE2(*(_DWORD *)(&a3->var5 + 1)), BYTE1(*(_DWORD *)(&a3->var5 + 1)), *(_DWORD *)(&a3->var5 + 1));
          goto LABEL_15;
        case 3u:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(0,IBFD_STABLE_CNT:%d,IBFD_REGION_FP_CNT:%d,IBFD_REGION_FP:0x%02x)"), BYTE2(*(_DWORD *)(&a3->var5 + 1)), BYTE1(*(_DWORD *)(&a3->var5 + 1)), *(_DWORD *)(&a3->var5 + 1), v9);
          goto LABEL_15;
        case 4u:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(0,LAST_FDMB_MEAN:%d,FDMF_MEAN:%d,FBFD_FLAGS:0x%02x)"), BYTE2(*(_DWORD *)(&a3->var5 + 1)), BYTE1(*(_DWORD *)(&a3->var5 + 1)), *(_DWORD *)(&a3->var5 + 1), v9);
          goto LABEL_15;
        default:
          return v4;
      }
    case 0x15u:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(CAP_PIX_DIFF:%d,IBFD_REGION_FP_CNT:%d,IBFD_REGION_FP:0x%02x,FD_PIX_DIFF:%d)"), HIBYTE(*(_DWORD *)(&a3->var5 + 1)), BYTE1(*(_DWORD *)(&a3->var5 + 1)), *(_DWORD *)(&a3->var5 + 1), BYTE1(*(_DWORD *)(&a3->var5 + 1)));
      goto LABEL_15;
    case 0x16u:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(RCMD_MEAN:%d,RCMD_REGION_CNT:%d,EARLY_DIFF:%d,FDMD_MEAN:%d)"), HIBYTE(*(_DWORD *)(&a3->var5 + 1)), BYTE2(*(_DWORD *)(&a3->var5 + 1)), BYTE1(*(_DWORD *)(&a3->var5 + 1)), *(_DWORD *)(&a3->var5 + 1));
      goto LABEL_15;
    case 0x17u:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(EARLY_DIFF2:%d,EARLY_W2:%d,EARLY_DIFF1:%d,EARLY_W1:%d)"), HIBYTE(*(_DWORD *)(&a3->var5 + 1)), BYTE2(*(_DWORD *)(&a3->var5 + 1)), BYTE1(*(_DWORD *)(&a3->var5 + 1)), *(_DWORD *)(&a3->var5 + 1));
      goto LABEL_15;
    default:
      return v4;
  }
  return v4;
}

+ (id)stringFromSensorStatusLog:(id *)a3 maskUnstableFields:(BOOL)a4
{
  uint64_t var1;
  uint64_t v7;
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
  uint64_t v22;
  uint64_t var5;
  uint64_t var4;
  uint64_t v25;
  uint64_t var3;
  uint64_t v27;
  uint64_t var2;
  void *v29;
  void *v30;

  var1 = a3->var1;
  if (!a4 || (_DWORD)var1 != 17)
    goto LABEL_6;
  if (a3->var2 != 1)
  {
    var1 = 17;
LABEL_6:
    var2 = a3->var2;
    v30 = (void *)MEMORY[0x24BDD17C8];
    var3 = a3->var3;
    var4 = a3->var4;
    var5 = a3->var5;
    v18 = (void *)sensorStatusDict;
    v22 = *(unsigned int *)(&a3->var5 + 1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", var1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringFromSensorProvisionCommandStatus:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)sensorPatchTypeDict;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3->var3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringFromSensorSecurityAssurance:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringFromSensorIndicator:", a3->var5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringFromSensorAdditionalData:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0x%08x (%@,%@,%@,%@,(%@),%@)"), var1, var2, var3, var4, var5, v22, v10, v11, v14, v15, v16, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v27 = a3->var3;
  v29 = (void *)MEMORY[0x24BDD17C8];
  v25 = a3->var4;
  v7 = a3->var5;
  v8 = (void *)sensorStatusDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringFromSensorProvisionCommandStatus:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)sensorPatchTypeDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3->var3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringFromSensorSecurityAssurance:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringFromSensorIndicator:", a3->var5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("0x%02x,0x%02x,0x%02x,0x%02x,0x%02x,0xxxxxxxxx (%@,%@,%@,%@,(%@),x)"), 17, 1, v27, v25, v7, v10, v11, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v17;
}

+ (BOOL)writeImageAsPGM:(id)a3 withWidth:(unsigned int)a4 height:(unsigned int)a5 toFile:(id)a6 withComment:(id)a7 attributes:(id)a8
{
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;

  v11 = *(_QWORD *)&a5;
  v12 = *(_QWORD *)&a4;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "createFileAtPath:contents:attributes:", v14, 0, v16);

  if ((v18 & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BLHelper.m", 568, 0);
    v19 = 0;
LABEL_9:
    v27 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "file", ", "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/BioLog/BLHelper.m", 572, 0);
    goto LABEL_9;
  }
  objc_msgSend(CFSTR("P5\n"), "dataUsingEncoding:", 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "writeData:", v20);

  if (v15)
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n#"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("#%@\n"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "dataUsingEncoding:", 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "writeData:", v24);

    v15 = v23;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i %i 255\n"), v12, v11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dataUsingEncoding:", 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "writeData:", v26);

  objc_msgSend(v19, "writeData:", v13);
  v27 = 1;
  objc_msgSend(v19, "closeFile");
LABEL_6:

  return v27;
}

+ (id)stringFromScanningState:(unsigned int)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)serviceScanningStateDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ScanningState%s%@"), ": ", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)stringFromMobileKeyBagState:(unsigned int)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)deviceLockStateDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("MobileKeyBag%s%@"), ": ", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)systemVersion
{
  __CFString *v2;

  v2 = (__CFString *)MGCopyAnswer();
  if (!v2)
    v2 = CFSTR("Unknown");
  return v2;
}

+ (id)stringFromIQAssessment:(unsigned int)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)imageQualityAsssessmentDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)stringFromIQFeedback:(unsigned int)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)imageQualityFeedback;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)stringFromLoggingType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)loggingTypeDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)stringFromProvisioningState:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)provisioningStateDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (unint64_t)writeASLToFile:(id)a3 withAttributes:(id)a4 filter:(id)a5 history:(double)a6 errorKeywords:(id)a7 containsErrors:(unint64_t *)a8
{
  return 0;
}

+ (id)stringFromClientObject:(id)a3
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

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "clientInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", CFSTR("BKClientBundleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "appendString:", v7);
    }
    else
    {
      objc_msgSend(v3, "clientInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForKey:", CFSTR("BKClientProcessName"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendString:", v9);

    }
    objc_msgSend(v3, "clientInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", CFSTR("BKClientConnectionId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("[%@]"), v11);

  }
  else
  {
    objc_msgSend(v4, "appendString:", CFSTR("<Unknown>"));
  }

  return v4;
}

+ (id)stringFromClientObjectArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
    objc_msgSend(v5, "appendString:", CFSTR("[nil]"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = 1;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        if ((v10 & 1) == 0)
          objc_msgSend(v5, "appendString:", CFSTR(","), (_QWORD)v15);
        objc_msgSend(a1, "stringFromClientObject:", v12, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v13);

        v10 = 0;
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v10 = 0;
    }
    while (v8);
  }

  return v5;
}

+ (id)stringFromIQProblemClass:(unsigned int)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)imageQualityProblemClassDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)stringFromArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
    objc_msgSend(v4, "appendString:", CFSTR("[nil]"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = 1;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        if ((v9 & 1) == 0)
          objc_msgSend(v4, "appendString:", CFSTR(","), (_QWORD)v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "stringValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendString:", v12);
LABEL_12:

          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "appendString:", v11);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "uuid");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "UUIDString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "appendString:", v13);

            goto LABEL_12;
          }
        }
LABEL_17:
        v9 = 0;
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v9 = 0;
    }
    while (v7);
  }

  return v4;
}

+ (id)stringFromResetReason:(unsigned int)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)resetReasonDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)stringFromSKSLockState:(unsigned __int16)a3
{
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend((id)sksLockStateDict, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "intValue") & v3) != 0)
        {
          if (objc_msgSend(v4, "length"))
            objc_msgSend(v4, "appendString:", CFSTR(","));
          objc_msgSend((id)sksLockStateDict, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendString:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if (!objc_msgSend(v4, "length"))
    objc_msgSend(v4, "appendFormat:", CFSTR("Unknown (%d)"), v3);
  return v4;
}

+ (id)stringFromWakeGestureState:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)wakeGestureStateDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
