@implementation MesaCAImageInfo

+ (id)imageInfoFromImageProcessingResult:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  MesaCAImageInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v22;
  NSObject *v23;
  __int128 v24;
  int v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "bytes");
  if (!v3)
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136316162;
    v27 = "imgProcResData";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsDefines.m";
    v34 = 1024;
    v35 = 72;
    goto LABEL_20;
  }
  v5 = v4;
  if ((unint64_t)objc_msgSend(v3, "length") <= 0x88)
  {
    if (__osLog)
      v22 = __osLog;
    else
      v22 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136316162;
    v27 = "[imgProcResData length] >= sizeof(imgProcResFull->imgProcessingResult)";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsDefines.m";
    v34 = 1024;
    v35 = 73;
LABEL_20:
    _os_log_impl(&dword_24B74E000, v22, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_21:
    v6 = 0;
    goto LABEL_9;
  }
  v6 = objc_alloc_init(MesaCAImageInfo);
  v24 = *(_OWORD *)(v5 + 83);
  v25 = *(_DWORD *)(v5 + 99);
  -[MesaCAImageInfo setSource:](v6, "setSource:", &v24);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v5 + 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCAImageInfo setAssessment:](v6, "setAssessment:", v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v5 + 14));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCAImageInfo setFeedback:](v6, "setFeedback:", v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(v5 + 81));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCAImageInfo setTidButtonState:](v6, "setTidButtonState:", v9);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v5 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCAImageInfo setImageProblemClass:](v6, "setImageProblemClass:", v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *(unsigned __int8 *)(v5 + 80));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCAImageInfo setWakeOnMenuPinUsed:](v6, "setWakeOnMenuPinUsed:", v11);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v5 + 36));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCAImageInfo setImagePixelOutlierCount:](v6, "setImagePixelOutlierCount:", v12);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(float)(*(float *)(v5 + 24) * 1000.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCAImageInfo setImageContrast:](v6, "setImageContrast:", v13);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(float)(*(float *)(v5 + 28) * 1000.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCAImageInfo setImageBrightness:](v6, "setImageBrightness:", v14);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(float)(*(float *)(v5 + 32) * 10000.0));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MesaCAImageInfo setImageFeatureStrength:](v6, "setImageFeatureStrength:", v15);

  v16 = *(float *)(v5 + 103);
  if (v16 > 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(float)((float)(*(float *)(v5 + 24) / v16) * 1000.0));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCAImageInfo setImageContrastNorm:](v6, "setImageContrastNorm:", v17);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(float)((float)(*(float *)(v5 + 28) / *(float *)(v5 + 103)) * 1000.0));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCAImageInfo setImageBrightnessNorm:](v6, "setImageBrightnessNorm:", v18);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(float)((float)(*(float *)(v5 + 32) / *(float *)(v5 + 103)) * 10000.0));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MesaCAImageInfo setImageFeatureStrengthNorm:](v6, "setImageFeatureStrengthNorm:", v19);

  }
  if (*(_DWORD *)(v5 + 133))
  {
    if ((unint64_t)objc_msgSend(v3, "length") <= 0xEB)
    {
      if (__osLog)
        v23 = __osLog;
      else
        v23 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v27 = "[imgProcResData length] >= sizeof(*imgProcResFull)";
        v28 = 2048;
        v29 = 0;
        v30 = 2080;
        v31 = "";
        v32 = 2080;
        v33 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsDefines.m";
        v34 = 1024;
        v35 = 95;
LABEL_32:
        _os_log_impl(&dword_24B74E000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      if (*(_DWORD *)(v5 + 133) > 0x62u)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5 + 137);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MesaCAImageInfo setDeblurringInfo:](v6, "setDeblurringInfo:", v20);

        goto LABEL_9;
      }
      if (__osLog)
        v23 = __osLog;
      else
        v23 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v27 = "imgProcResFull->imgProcessingResult.imgDeblurringInfoSize >= sizeof(imgProcResFull->imgDeblurringInfo)";
        v28 = 2048;
        v29 = 0;
        v30 = 2080;
        v31 = "";
        v32 = 2080;
        v33 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/MesaCoreAnalytics/MesaCoreAnalyticsDefines.m";
        v34 = 1024;
        v35 = 96;
        goto LABEL_32;
      }
    }
  }
LABEL_9:

  return v6;
}

- ($7287BE6C16BD8CBBAFC45DEB4D81687E)source
{
  $7287BE6C16BD8CBBAFC45DEB4D81687E *result;

  objc_copyStruct(retstr, &self->_source, 20, 1, 0);
  return result;
}

- (void)setSource:(id *)a3
{
  objc_copyStruct(&self->_source, a3, 20, 1, 0);
}

- (NSNumber)assessment
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAssessment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)feedback
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFeedback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)tidButtonState
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTidButtonState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)imageProblemClass
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setImageProblemClass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)wakeOnMenuPinUsed
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWakeOnMenuPinUsed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)imagePixelOutlierCount
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setImagePixelOutlierCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)imageContrast
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setImageContrast:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)imageBrightness
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setImageBrightness:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)imageFeatureStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setImageFeatureStrength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSNumber)imageContrastNorm
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setImageContrastNorm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)imageBrightnessNorm
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setImageBrightnessNorm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)imageFeatureStrengthNorm
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setImageFeatureStrengthNorm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)driveVoltage
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDriveVoltage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSData)deblurringInfo
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDeblurringInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deblurringInfo, 0);
  objc_storeStrong((id *)&self->_driveVoltage, 0);
  objc_storeStrong((id *)&self->_imageFeatureStrengthNorm, 0);
  objc_storeStrong((id *)&self->_imageBrightnessNorm, 0);
  objc_storeStrong((id *)&self->_imageContrastNorm, 0);
  objc_storeStrong((id *)&self->_imageFeatureStrength, 0);
  objc_storeStrong((id *)&self->_imageBrightness, 0);
  objc_storeStrong((id *)&self->_imageContrast, 0);
  objc_storeStrong((id *)&self->_imagePixelOutlierCount, 0);
  objc_storeStrong((id *)&self->_wakeOnMenuPinUsed, 0);
  objc_storeStrong((id *)&self->_imageProblemClass, 0);
  objc_storeStrong((id *)&self->_tidButtonState, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_assessment, 0);
}

@end
