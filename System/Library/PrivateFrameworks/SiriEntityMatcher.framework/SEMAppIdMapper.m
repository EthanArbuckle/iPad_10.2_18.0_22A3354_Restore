@implementation SEMAppIdMapper

+ (id)convertToUniversalAppId:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend__getKnownAppIdMap(SEMAppIdMapper, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v6, v7, (uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v3;
  if (v8)
  {
    v10 = qword_25441F970;
    v11 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
    v9 = v8;
    if (v11)
    {
      v14 = 136315650;
      v15 = "+[SEMAppIdMapper convertToUniversalAppId:]";
      v16 = 2112;
      v17 = v3;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_2462C4000, v10, OS_LOG_TYPE_INFO, "%s Convert %@ to a universal appId: %@", (uint8_t *)&v14, 0x20u);
      v9 = v8;
    }
  }
  v12 = v9;

  return v12;
}

+ (id)_getKnownAppIdMap
{
  if (qword_25441F900 != -1)
    dispatch_once(&qword_25441F900, &unk_25175EC20);
  return (id)qword_25441F8F8;
}

+ (id)_buildKnownIdentifierToUniversalOriginAppIdMap
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[6];
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BEA3878];
  v6[0] = CFSTR("com.apple.siriVoiceShortcuts");
  v6[1] = CFSTR("com.apple.VoiceShortcuts");
  v7[0] = v2;
  v7[1] = v2;
  v3 = *MEMORY[0x24BEA3868];
  v6[2] = CFSTR("com.apple.MobileSMS");
  v6[3] = CFSTR("com.apple.iChat");
  v7[2] = v3;
  v7[3] = v3;
  v4 = *MEMORY[0x24BEA3870];
  v6[4] = CFSTR("com.apple.mobileslideshow");
  v6[5] = CFSTR("com.apple.Photos");
  v7[4] = v4;
  v7[5] = v4;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v7, v6, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
