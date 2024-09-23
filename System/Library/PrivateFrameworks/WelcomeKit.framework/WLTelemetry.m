@implementation WLTelemetry

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  return (id)sharedInstance__sharedInstance;
}

void __29__WLTelemetry_sharedInstance__block_invoke()
{
  WLTelemetry *v0;
  void *v1;

  v0 = objc_alloc_init(WLTelemetry);
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

- (void)send:(id)a3 payload:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v6 = a4;
  v7 = a3;
  _WLLog(v4, 2, CFSTR("WLTelemetry will send an event - %@ with payload %@."), v8, v9, v10, v11, v12, (uint64_t)v7);
  v13 = v6;
  AnalyticsSendEventLazy();

}

id __28__WLTelemetry_send_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)wifiDidFail
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  WLPayload *v11;

  _WLLog(v7, 2, CFSTR("WLTelemetry got wifiDidFail event."), v2, v3, v4, v5, v6, v10);
  v11 = objc_alloc_init(WLPayload);
  -[WLPayload setState:](v11, "setState:", CFSTR("wifi_error"));
  -[WLPayload dictionary](v11, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLTelemetry send:payload:](self, "send:payload:", CFSTR("com.apple.welcomemat"), v9);

}

- (void)deviceDidFailWithTimeout
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  WLPayload *v11;

  _WLLog(v7, 2, CFSTR("WLTelemetry got deviceDidFailWithTimeout event."), v2, v3, v4, v5, v6, v10);
  v11 = objc_alloc_init(WLPayload);
  -[WLPayload setState:](v11, "setState:", CFSTR("device_discovery_error_timeout"));
  -[WLPayload dictionary](v11, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLTelemetry send:payload:](self, "send:payload:", CFSTR("com.apple.welcomemat"), v9);

}

- (void)deviceDidFailWithAuthenticationError
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  WLPayload *v11;

  _WLLog(v7, 2, CFSTR("WLTelemetry got deviceDidFailWithAuthenticationError event."), v2, v3, v4, v5, v6, v10);
  v11 = objc_alloc_init(WLPayload);
  -[WLPayload setState:](v11, "setState:", CFSTR("device_discovery_error_authentication_failed"));
  -[WLPayload dictionary](v11, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLTelemetry send:payload:](self, "send:payload:", CFSTR("com.apple.welcomemat"), v9);

}

- (void)migratorDidFinish:(id)a3
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v5 = a3;
  _WLLog(v3, 2, CFSTR("WLTelemetry got migratorDidFinish event."), v6, v7, v8, v9, v10, v11);
  objc_msgSend(v5, "dictionary");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[WLTelemetry send:payload:](self, "send:payload:", CFSTR("com.apple.welcomemat"), v12);
}

- (id)_telemetryDictionaryForPreparatoryDataDidComplete:(id)a3 contentType:(id)a4 duration:(double)a5 android:(id)a6 model:(id)a7 version:(id)a8
{
  void *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  _QWORD v26[6];
  _QWORD v27[7];

  v27[6] = *MEMORY[0x24BDAC8D0];
  v26[0] = CFSTR("contentType");
  v26[1] = CFSTR("dataType");
  v27[0] = a4;
  v27[1] = a3;
  v26[2] = CFSTR("durationInSeconds");
  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = (uint64_t)a5;
  v14 = (__CFString *)a8;
  v15 = (__CFString *)a7;
  v16 = (__CFString *)a6;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v12, "numberWithInteger:", v13);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = CFSTR("(unknown)");
  if (v16)
    v22 = v16;
  else
    v22 = CFSTR("(unknown)");
  v27[2] = v19;
  v27[3] = v22;
  v26[3] = CFSTR("androidOSVersion");
  v26[4] = CFSTR("androidDeviceModel");
  v26[5] = CFSTR("androidClientVersion");
  if (v15)
    v23 = v15;
  else
    v23 = CFSTR("(unknown)");
  if (v14)
    v21 = v14;
  v27[4] = v23;
  v27[5] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)preparatoryDataDidComplete:(id)a3 contentType:(id)a4 duration:(double)a5 android:(id)a6 model:(id)a7 version:(id)a8
{
  uint64_t v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog(v8, 2, CFSTR("Telemetry: preparatoryDataDidComplete %@ contentType %@ duration %@"), v19, v20, v21, v22, v23, (uint64_t)v14);

  v30 = v14;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  v24 = v18;
  v25 = v17;
  v26 = v16;
  v27 = v15;
  v28 = v14;
  AnalyticsSendEventLazy();

}

uint64_t __85__WLTelemetry_preparatoryDataDidComplete_contentType_duration_android_model_version___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_telemetryDictionaryForPreparatoryDataDidComplete:contentType:duration:android:model:version:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(double *)(a1 + 80));
}

- (id)_telemetryDictionaryForContentTypeDidComplete:(id)a3 downloadByteCount:(unint64_t)a4 importRecordCount:(unint64_t)a5 importFailedRecordCount:(unint64_t)a6 downloadDuration:(unint64_t)a7 importDuration:(unint64_t)a8 android:(id)a9 model:(id)a10 version:(id)a11
{
  uint64_t v11;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  _QWORD v33[9];
  _QWORD v34[11];

  v34[9] = *MEMORY[0x24BDAC8D0];
  LODWORD(v11) = vcvtpd_u64_f64((double)a4 * 0.000000953674316);
  v34[0] = a3;
  v33[0] = CFSTR("contentType");
  v33[1] = CFSTR("recordCount");
  v16 = (void *)MEMORY[0x24BDD16E0];
  v17 = (__CFString *)a11;
  v18 = (__CFString *)a10;
  v19 = (__CFString *)a9;
  v20 = a3;
  objc_msgSend(v16, "numberWithUnsignedInteger:", a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v21;
  v33[2] = CFSTR("failedRecordCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v22;
  v33[3] = CFSTR("downloadSizeInMegabytes");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v23;
  v33[4] = CFSTR("downloadDurationInSeconds");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v24;
  v33[5] = CFSTR("importDurationInSeconds");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a8);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  v27 = CFSTR("(unknown)");
  if (v19)
    v28 = v19;
  else
    v28 = CFSTR("(unknown)");
  v34[5] = v25;
  v34[6] = v28;
  v33[6] = CFSTR("androidOSVersion");
  v33[7] = CFSTR("androidDeviceModel");
  v33[8] = CFSTR("androidClientVersion");
  if (v18)
    v29 = v18;
  else
    v29 = CFSTR("(unknown)");
  if (v17)
    v27 = v17;
  v34[7] = v29;
  v34[8] = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (void)contentTypeDidComplete:(id)a3 downloadByteCount:(unint64_t)a4 importRecordCount:(unint64_t)a5 importFailedRecordCount:(unint64_t)a6 downloadDuration:(unint64_t)a7 importDuration:(unint64_t)a8 android:(id)a9 model:(id)a10 version:(id)a11
{
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;

  v12 = a3;
  v13 = a9;
  v14 = a10;
  v15 = a11;
  _WLLog(v11, 2, CFSTR("Telemetry: contentTypeDidComplete %@"), v16, v17, v18, v19, v20, (uint64_t)v12);
  v25 = v12;
  v26 = v13;
  v27 = v15;
  v21 = v15;
  v22 = v14;
  v23 = v13;
  v24 = v12;
  AnalyticsSendEventLazy();

}

uint64_t __152__WLTelemetry_contentTypeDidComplete_downloadByteCount_importRecordCount_importFailedRecordCount_downloadDuration_importDuration_android_model_version___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_telemetryDictionaryForContentTypeDidComplete:downloadByteCount:importRecordCount:importFailedRecordCount:downloadDuration:importDuration:android:model:version:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)importDidFailSilentlyForContentType:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  _WLLog(v3, 2, CFSTR("Telemetry: recordImportDidFail contentType %@"), v5, v6, v7, v8, v9, (uint64_t)v4);
  v10 = v4;
  AnalyticsSendEventLazy();

}

id __51__WLTelemetry_importDidFailSilentlyForContentType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("contentType");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didResolveTimeEstimate:(unint64_t)a3 forDownloadTask:(id)a4 threshold:(unint64_t)a5 actualTime:(unint64_t)a6
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v7 = a4;
  _WLLog(v6, 2, CFSTR("Telemetry: timeEstimateDidResolve task %@ estimate %lu threshold %lu actual time %lu"), v8, v9, v10, v11, v12, (uint64_t)v7);
  v13 = v7;
  AnalyticsSendEventLazy();

}

id __75__WLTelemetry_didResolveTimeEstimate_forDownloadTask_threshold_actualTime___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v1 = a1[7];
  v2 = (unint64_t)(100 * a1[5]) / a1[6];
  v8[0] = a1[4];
  v7[0] = CFSTR("downloadTask");
  v7[1] = CFSTR("magnitude");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("accuracy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)userDidChooseToInstallMigratableApps:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  _WLLog(v8, 2, CFSTR("Telemetry: installAppChoice %d"), v3, v4, v5, v6, v7, a3);
  AnalyticsSendEventLazy();
}

id __52__WLTelemetry_userDidChooseToInstallMigratableApps___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("install");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didLookupAppsWithMatchedApps:(unint64_t)a3 mismatchedApps:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  _WLLog(v8, 2, CFSTR("Telemetry: didLookupAppsWithMatchedApps:%ld mismatchedApps:%ld"), a4, v4, v5, v6, v7, a3);
  AnalyticsSendEventLazy();
}

id __59__WLTelemetry_didLookupAppsWithMatchedApps_mismatchedApps___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("matched_apps");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("mismatched_apps");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)photoLibraryDidFailWithExtension:(id)a3
{
  uint64_t v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;

  v4 = (__CFString *)a3;
  if (v4)
    v10 = v4;
  else
    v10 = &stru_24EFCBDE0;
  _WLLog(v3, 2, CFSTR("Telemetry: photoLibraryDidFailWithExtension:%@"), v5, v6, v7, v8, v9, (uint64_t)v10);
  v11 = v10;
  AnalyticsSendEventLazy();

}

id __48__WLTelemetry_photoLibraryDidFailWithExtension___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("extension");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didLoadQRCode:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  _WLLog(v8, 2, CFSTR("Telemetry: didLoadQRCode:%d"), v3, v4, v5, v6, v7, a3);
  AnalyticsSendEventLazy();
}

id __29__WLTelemetry_didLoadQRCode___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("enabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)didLoadAndroidStore:(id)a3 selected:(BOOL)a4 canceled:(BOOL)a5 inAttempts:(unint64_t)a6
{
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;

  v7 = (__CFString *)a3;
  if (v7)
    v13 = v7;
  else
    v13 = &stru_24EFCBDE0;
  _WLLog(v6, 2, CFSTR("Telemetry: didLoadAndroidStore:%@ selected:%d canceled:%d inAttempts:%ld"), v8, v9, v10, v11, v12, (uint64_t)v13);
  v14 = v13;
  AnalyticsSendEventLazy();

}

id __64__WLTelemetry_didLoadAndroidStore_selected_canceled_inAttempts___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v9[0] = *(_QWORD *)(a1 + 32);
  v8[0] = CFSTR("android_store");
  v8[1] = CFSTR("attempts");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("canceled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("selected");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 49));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)daemonDidGetInterrupted
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  _WLLog(v7, 2, CFSTR("Telemetry: daemonDidGetInterrupted"), v2, v3, v4, v5, v6, vars0);
  AnalyticsSendEventLazy();
}

void *__38__WLTelemetry_daemonDidGetInterrupted__block_invoke()
{
  return &unk_24EFCF298;
}

@end
