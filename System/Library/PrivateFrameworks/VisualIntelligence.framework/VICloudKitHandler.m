@implementation VICloudKitHandler

+ (void)uploadUserFeedbackToEnvironment:(int64_t)a3 container:(id)a4 request:(id)a5 sfReport:(id)a6 intermediateResults:(id)a7 deviceInfo:(id)a8 nsfwConfidence:(float)a9 imageData:(id)a10 reportIdentifier:(id)a11 completionHandler:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  _QWORD v39[4];
  id v40;

  v18 = a12;
  v19 = a11;
  v20 = a10;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  NSLog(CFSTR("VICloudKitHandler uploading... %@ %@"), v25, v19);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:", CFSTR("UserFeedback"));
  objc_msgSend(v26, "setObject:forKey:", v19, CFSTR("ReportIdentifier"));

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94BB8]), "initWithAssetContent:itemTypeHint:", v20, CFSTR("bin"));
  objc_msgSend(v26, "setObject:forKey:", v27, CFSTR("QueryImage"));

  objc_msgSend(v26, "setObject:forKey:", v24, CFSTR("VisualSearchRequest"));
  objc_msgSend(v26, "setObject:forKey:", v23, CFSTR("UserReportFeedback"));

  objc_msgSend(v26, "setObject:forKey:", v22, CFSTR("ParseFlowIntermediateResults"));
  objc_msgSend(v26, "setObject:forKey:", v21, CFSTR("DeviceInfo"));

  *(float *)&v28 = a9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v29, CFSTR("NSFWConfidence"));

  v30 = objc_alloc(MEMORY[0x1E0C94C28]);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", v25, a3);

  v32 = (void *)objc_msgSend(v30, "initWithContainerID:", v31);
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v33, "addObject:", v26);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", v33, 0);
  objc_msgSend(v34, "configuration");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPreferAnonymousRequests:", 1);

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __171__VICloudKitHandler_uploadUserFeedbackToEnvironment_container_request_sfReport_intermediateResults_deviceInfo_nsfwConfidence_imageData_reportIdentifier_completionHandler___block_invoke;
  v39[3] = &unk_1E9807818;
  v40 = v18;
  v36 = v18;
  objc_msgSend(v34, "setModifyRecordsCompletionBlock:", v39);
  objc_msgSend(v32, "publicCloudDatabase");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addOperation:", v34);

}

uint64_t __171__VICloudKitHandler_uploadUserFeedbackToEnvironment_container_request_sfReport_intermediateResults_deviceInfo_nsfwConfidence_imageData_reportIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  return result;
}

@end
