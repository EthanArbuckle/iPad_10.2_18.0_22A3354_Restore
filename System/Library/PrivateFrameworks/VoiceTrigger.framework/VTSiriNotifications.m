@implementation VTSiriNotifications

- (VTSiriNotifications)init
{
  VTSiriNotifications *v2;
  uint64_t v3;
  VTSiriPHash *hasher;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VTSiriNotifications;
  v2 = -[VTSiriNotifications init](&v6, sel_init);
  if (v2)
  {
    v2->_center = CFNotificationCenterGetDarwinNotifyCenter();
    +[VTSiriPHash sharedPhash](VTSiriPHash, "sharedPhash");
    v3 = objc_claimAutoreleasedReturnValue();
    hasher = v2->_hasher;
    v2->_hasher = (VTSiriPHash *)v3;

  }
  return v2;
}

- (void)broadcastAudioPayload:(id)a3 numSamples:(unint64_t)a4 superVectorScore:(double)a5 absoluteTime:(unint64_t)a6
{
  uint64_t v10;
  NSObject *v11;
  float32x4_t *v12;
  float32x4_t *v13;
  unint64_t v14;
  unint64_t v15;
  float32x4_t *v16;
  int16x4_t *v17;
  unint64_t v18;
  int16x8_t v19;
  float32x4_t v20;
  int32x4_t v21;
  unint64_t v22;
  float *v23;
  __int16 *v24;
  int v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  char v31;
  unsigned __int8 v32;
  char v33;
  unsigned __int16 v34;
  unint64_t v35;
  uint8_t buf[4];
  unint64_t v37;
  __int16 v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v35 = a6;
  v10 = objc_msgSend(objc_retainAutorelease(a3), "bytes");
  v11 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    v37 = a4;
    v38 = 2050;
    v39 = a6;
    _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "BTLE raw audio size = %{public}ld, absTime = %{public}llu", buf, 0x16u);
  }
  v12 = (float32x4_t *)malloc_type_malloc(0xC170uLL, 0x100004052888210uLL);
  v13 = v12;
  if (a4 >= 0x305C)
    v14 = 12380;
  else
    v14 = a4;
  if (v14)
  {
    if (v14 <= 0xF)
    {
      v15 = 0;
LABEL_12:
      v22 = v14 - v15;
      v23 = &v12->f32[v15];
      v24 = (__int16 *)(v10 + 2 * v15);
      do
      {
        v25 = *v24++;
        *v23++ = (float)v25;
        --v22;
      }
      while (v22);
      goto LABEL_14;
    }
    v15 = v14 & 0x3FF0;
    v16 = v12 + 2;
    v17 = (int16x4_t *)(v10 + 16);
    v18 = v15;
    do
    {
      v19 = *(int16x8_t *)v17[-2].i8;
      v20 = vcvtq_f32_s32(vmovl_s16(*v17));
      v21 = vmovl_high_s16(*(int16x8_t *)v17->i8);
      v16[-2] = vcvtq_f32_s32(vmovl_s16(*(int16x4_t *)v19.i8));
      v16[-1] = vcvtq_f32_s32(vmovl_high_s16(v19));
      *v16 = v20;
      v16[1] = vcvtq_f32_s32(v21);
      v16 += 4;
      v17 += 4;
      v18 -= 16;
    }
    while (v18);
    if (v14 != v15)
      goto LABEL_12;
  }
LABEL_14:
  if (a4 >> 2 <= 0xC16)
  {
    bzero(&v12->f32[v14], 49520 - 4 * v14);
    v26 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v37 = 12380 - v14;
      _os_log_impl(&dword_20D965000, v26, OS_LOG_TYPE_DEFAULT, "BTLE padded %{public}ld samples to fill out buffer", buf, 0xCu);
    }
  }
  v34 = -[VTSiriPHash pHash:length:](self->_hasher, "pHash:length:", v13, 12380);
  v33 = -[VTSiriPHash signalEstimate](self->_hasher, "signalEstimate");
  v32 = -[VTSiriPHash signalFractional](self->_hasher, "signalFractional");
  free(v13);
  v31 = 0;
  if (!+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman"))
    v31 = (int)(a5 * 10.0);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "appendBytes:length:", &v34, 2);
  objc_msgSend(v27, "appendBytes:length:", &v33, 1);
  objc_msgSend(v27, "appendBytes:length:", &v31, 1);
  objc_msgSend(v27, "appendBytes:length:", &v35, 8);
  objc_msgSend(v27, "appendBytes:length:", &v32, 1);
  v28 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v37 = (unint64_t)v27;
    _os_log_impl(&dword_20D965000, v28, OS_LOG_TYPE_INFO, "Advert data: %{public}@", buf, 0xCu);
  }
  if ((objc_msgSend(v27, "writeToFile:atomically:", CFSTR("/private/var/tmp/siriBC"), 0) & 1) == 0)
  {
    v29 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20D965000, v29, OS_LOG_TYPE_ERROR, "advert data write failed", buf, 2u);
    }
  }
  CFNotificationCenterPostNotification(self->_center, CFSTR("com.apple.siri.myriad.payload"), 0, 0, 1u);
  v30 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v30, OS_LOG_TYPE_INFO, "Posted siri audio hash notification", buf, 2u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasher, 0);
}

@end
