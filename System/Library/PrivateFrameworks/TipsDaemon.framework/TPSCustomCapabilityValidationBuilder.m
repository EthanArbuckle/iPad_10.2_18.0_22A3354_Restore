@implementation TPSCustomCapabilityValidationBuilder

+ (id)targetValidationForCapability:(id)a3
{
  id v4;
  TPSTargetingValidation *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  TPSTargetingValidation *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(TPSTargetingValidation);
  if (objc_msgSend(v4, "type") == 2)
  {
    objc_msgSend(a1, "deviceCapabilityValidationMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_msgSend(v6, "objectForKeyedSubscript:", v7);

    if (v8)
    {
      v9 = (TPSTargetingValidation *)objc_alloc_init(v8);

      v5 = v9;
    }
    objc_msgSend(v4, "key");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v4, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v4, "key");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v13;
        objc_msgSend(v4, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPSTargetingValidation setTargetContext:](v5, "setTargetContext:", v15);

      }
    }
    -[TPSTargetingValidation setJoinType:](v5, "setJoinType:", objc_msgSend(v4, "joinType"));
  }

  return v5;
}

+ (id)deviceCapabilityValidationMap
{
  if (deviceCapabilityValidationMap_onceToken != -1)
    dispatch_once(&deviceCapabilityValidationMap_onceToken, &__block_literal_global_1);
  return (id)deviceCapabilityValidationMap_capabilityMap;
}

void __69__TPSCustomCapabilityValidationBuilder_deviceCapabilityValidationMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[69];
  _QWORD v3[70];

  v3[69] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("BetaUser");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("6a4a9403835f9f19136d51a5fda2eb4cdbb2f115");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("62e200ccfc12f2f7df0045e62966165a84b22865");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("AppleArcadeSubscription");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("AppleCardSetup");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("AppleCashFamily");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("AppleCashSetup");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("ApplePayActivation");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("ApplePayPeer");
  v3[8] = objc_opt_class();
  v2[9] = CFSTR("ApplePaySetup");
  v3[9] = objc_opt_class();
  v2[10] = CFSTR("AppleTVHomePod");
  v3[10] = objc_opt_class();
  v2[11] = CFSTR("AppStoreRegion");
  v3[11] = objc_opt_class();
  v2[12] = CFSTR("f26177587586682d72004e360c3d302bcd88fded");
  v3[12] = objc_opt_class();
  v2[13] = CFSTR("32971e46f383403dfbcf0e9ce5455486d889c24");
  v3[13] = objc_opt_class();
  v2[14] = CFSTR("2f480e181229a3cfe6797ccd6710bd93b8303c4c");
  v3[14] = objc_opt_class();
  v2[15] = CFSTR("e2144efa67e3162124c9db7498f21dc65ced81a5");
  v3[15] = objc_opt_class();
  v2[16] = CFSTR("58656d847de7d3f11b334345d2a09a0a171e4803");
  v3[16] = objc_opt_class();
  v2[17] = CFSTR("6aac0d229f037e21ac5a19d6836811e6cf1df434");
  v3[17] = objc_opt_class();
  v2[18] = CFSTR("ContainsLanguage");
  v3[18] = objc_opt_class();
  v2[19] = CFSTR("ContextualEvent");
  v3[19] = objc_opt_class();
  v2[20] = CFSTR("DictationLanguages");
  v3[20] = objc_opt_class();
  v2[21] = CFSTR("DualSim");
  v3[21] = objc_opt_class();
  v2[22] = CFSTR("97a844593f69be5f9b53f9d6492f343887622d07");
  v3[22] = objc_opt_class();
  v2[23] = CFSTR("ExcludeApps");
  v3[23] = objc_opt_class();
  v2[24] = CFSTR("b83326572480b130f53f6be070dcdba8dbb7ffee");
  v3[24] = objc_opt_class();
  v2[25] = CFSTR("FamilyHasChild");
  v3[25] = objc_opt_class();
  v2[26] = CFSTR("FamilyIsChildAccount");
  v3[26] = objc_opt_class();
  v2[27] = CFSTR("FamilyOrganizer");
  v3[27] = objc_opt_class();
  v2[28] = CFSTR("32316fa371b1b1a819b91ee347c5db5e2841e942");
  v3[28] = objc_opt_class();
  v2[29] = CFSTR("b82a54bd17d8787ff536a1e2619eceea03b5e7c8");
  v3[29] = objc_opt_class();
  v2[30] = CFSTR("9e401c3ab1c7e98e989f578806e04139d2ab12c2");
  v3[30] = objc_opt_class();
  v2[31] = CFSTR("HKFeatureStatus");
  v3[31] = objc_opt_class();
  v2[32] = CFSTR("HealthRecordsAccountInfoStatus");
  v3[32] = objc_opt_class();
  v2[33] = CFSTR("HeySiriAvailable");
  v3[33] = objc_opt_class();
  v2[34] = CFSTR("HeySiriEnabled");
  v3[34] = objc_opt_class();
  v2[35] = CFSTR("HeySiriEverUsed");
  v3[35] = objc_opt_class();
  v2[36] = CFSTR("HomeSetup");
  v3[36] = objc_opt_class();
  v2[37] = CFSTR("HomeSetupWithAccessories");
  v3[37] = objc_opt_class();
  v2[38] = CFSTR("f351e061575fb4e0fd7988380c83c47ba0d52434");
  v3[38] = objc_opt_class();
  v2[39] = CFSTR("f591050f8d0408ad3bc4e62cab04daa3a0d273df");
  v3[39] = objc_opt_class();
  v2[40] = CFSTR("KeyboardExtendedSuggestions");
  v3[40] = objc_opt_class();
  v2[41] = CFSTR("HandwritingKeyboardEnabled");
  v3[41] = objc_opt_class();
  v2[42] = CFSTR("InstalledKeyboards");
  v3[42] = objc_opt_class();
  v2[43] = CFSTR("17eb06719c9d3aabf50bb59c4a7e774a60c65777");
  v3[43] = objc_opt_class();
  v2[44] = CFSTR("74d51db7850d6d7ce6338bdd62165a98508cad47");
  v3[44] = objc_opt_class();
  v2[45] = CFSTR("MedicalIDEnabled");
  v3[45] = objc_opt_class();
  v2[46] = CFSTR("MultipleLanguages");
  v3[46] = objc_opt_class();
  v2[47] = CFSTR("HavePeopleSuggestion");
  v3[47] = objc_opt_class();
  v2[48] = CFSTR("ReminderCloudKit");
  v3[48] = objc_opt_class();
  v2[49] = CFSTR("ReminderCompletedItems");
  v3[49] = objc_opt_class();
  v2[50] = CFSTR("ReminderListWithCustomBadge");
  v3[50] = objc_opt_class();
  v2[51] = CFSTR("ReminderCustomSmartList");
  v3[51] = objc_opt_class();
  v2[52] = CFSTR("ReminderHashtags");
  v3[52] = objc_opt_class();
  v2[53] = CFSTR("ScreenTimeCloudDevice");
  v3[53] = objc_opt_class();
  v2[54] = CFSTR("ScreenTimeCurrentDevice");
  v3[54] = objc_opt_class();
  v2[55] = CFSTR("773abb50868ad190f9ba0c5d33b8db96440db9f5");
  v3[55] = objc_opt_class();
  v2[56] = CFSTR("SiriEnabled");
  v3[56] = objc_opt_class();
  v2[57] = CFSTR("SiriLanguageMatchesSystemLanguage");
  v3[57] = objc_opt_class();
  v2[58] = CFSTR("SleepSetup");
  v3[58] = objc_opt_class();
  v2[59] = CFSTR("SupportSpatialAudio");
  v3[59] = objc_opt_class();
  v2[60] = CFSTR("iCloudAccount");
  v3[60] = objc_opt_class();
  v2[61] = CFSTR("iCloudBackup");
  v3[61] = objc_opt_class();
  v2[62] = CFSTR("iCloudDrive");
  v3[62] = objc_opt_class();
  v2[63] = CFSTR("iCloudFindMyDevice");
  v3[63] = objc_opt_class();
  v2[64] = CFSTR("CloudMusicCatalogPlayback");
  v3[64] = objc_opt_class();
  v2[65] = CFSTR("iCloudPhotoLibrary");
  v3[65] = objc_opt_class();
  v2[66] = CFSTR("13eda8c5e84d02c01729dba5c716bebd337f48cc");
  v3[66] = objc_opt_class();
  v2[67] = CFSTR("e0be4ec01737fdec5a211693a64dad134bcfa88a");
  v3[67] = objc_opt_class();
  v2[68] = CFSTR("678eced4f962f217a8df044a40d2bde4a8f12746");
  v3[68] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 69);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)deviceCapabilityValidationMap_capabilityMap;
  deviceCapabilityValidationMap_capabilityMap = v0;

}

+ (id)watchCapabilityValidationMap
{
  if (watchCapabilityValidationMap_onceToken != -1)
    dispatch_once(&watchCapabilityValidationMap_onceToken, &__block_literal_global_214);
  return (id)watchCapabilityValidationMap_capabilityMap;
}

void __68__TPSCustomCapabilityValidationBuilder_watchCapabilityValidationMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("FallDetection");
  v2[1] = CFSTR("ECG");
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)watchCapabilityValidationMap_capabilityMap;
  watchCapabilityValidationMap_capabilityMap = v0;

}

+ (id)targetValidationForNRDeviceCapability:(id)a3
{
  id v4;
  TPSTargetingValidation *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  TPSTargetingValidation *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(TPSTargetingValidation);
  if (objc_msgSend(v4, "type") == 4)
  {
    objc_msgSend(a1, "watchCapabilityValidationMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_msgSend(v6, "objectForKeyedSubscript:", v7);

    if (v8)
    {
      v9 = (TPSTargetingValidation *)objc_alloc_init(v8);

      v5 = v9;
    }
    objc_msgSend(v4, "key");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v4, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v4, "key");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v13;
        objc_msgSend(v4, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPSTargetingValidation setTargetContext:](v5, "setTargetContext:", v15);

      }
    }
    -[TPSTargetingValidation setJoinType:](v5, "setJoinType:", objc_msgSend(v4, "joinType"));
  }

  return v5;
}

@end
