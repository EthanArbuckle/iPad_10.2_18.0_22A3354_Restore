@implementation SVXAlarmAndTimerUtilities

- (SVXAlarmAndTimerUtilities)init
{
  SVXAlarmAndTimerUtilities *v2;
  uint64_t v3;
  SVXBundleUtils *bundleUtils;
  SVXSpeechSynthesisUtils *v5;
  SVXSpeechSynthesisUtils *speechSynthesisUtils;
  SVXNSLocaleFactory *v7;
  SVXNSLocaleFactory *localeFactory;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SVXAlarmAndTimerUtilities;
  v2 = -[SVXAlarmAndTimerUtilities init](&v10, sel_init);
  if (v2)
  {
    +[SVXBundleUtils sharedInstance](SVXBundleUtils, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    bundleUtils = v2->_bundleUtils;
    v2->_bundleUtils = (SVXBundleUtils *)v3;

    v5 = objc_alloc_init(SVXSpeechSynthesisUtils);
    speechSynthesisUtils = v2->_speechSynthesisUtils;
    v2->_speechSynthesisUtils = v5;

    v7 = objc_alloc_init(SVXNSLocaleFactory);
    localeFactory = v2->_localeFactory;
    v2->_localeFactory = v7;

  }
  return v2;
}

- (BOOL)getIsSpeakable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "orderedFiringAlarms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedFiringTimers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "hasOtherRunningTimers");

  if (objc_msgSend(v4, "count") || objc_msgSend(v5, "count"))
  {
    v7 = objc_msgSend(v4, "count");
    if (objc_msgSend(v5, "count") + v7 == 1 && (objc_msgSend(v5, "count") ? (v8 = v6) : (v8 = 0), (v8 & 1) == 0))
    {
      objc_msgSend(v4, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "length"))
      {
        v9 = 1;
      }
      else
      {
        objc_msgSend(v5, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v13, "length") != 0;

      }
    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)createSpeechSynthesisRequestWithContext:(id)a3 instanceContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  SVXSpeechSynthesisRequest *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int64_t v16;
  id v17;
  SVXBundleUtils *bundleUtils;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[SVXAlarmAndTimerUtilities getIsSpeakable:](self, "getIsSpeakable:", v6))
  {
    objc_msgSend(v6, "orderedFiringAlarms");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "orderedFiringTimers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v7;
    if (-[SVXAlarmAndTimerUtilities _isEndpoint:](self, "_isEndpoint:", v7))
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE09270]), "initWithInstanceContext:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SVXAlarmAndTimerUtilities createSpeechSynthesisRequestWithContext:instanceContext:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("SVXAlarmAndTimerUtilities.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferences != nil"));

    }
    -[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:](self->_speechSynthesisUtils, "getOutputVoiceInfoWithAllowsFallback:preferences:", 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[SVXAlarmAndTimerUtilities createSpeechSynthesisRequestWithContext:instanceContext:]";
      v34 = 2112;
      v35 = v12;
      _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s outputVoiceInfo = %@", buf, 0x16u);
    }
    v30 = v11;
    objc_msgSend(v12, "languageCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "gender");
    if (!v15)
      v15 = objc_msgSend(MEMORY[0x24BE093A0], "defaultGenderForOutputVoiceLanguageCode:", v14);
    v16 = -[SVXSpeechSynthesisUtils getGenderFromVoiceGender:](self->_speechSynthesisUtils, "getGenderFromVoiceGender:", v15);
    v17 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    bundleUtils = self->_bundleUtils;
    -[SVXAlarmAndTimerUtilities siriVOXFrameworkBundle](self, "siriVOXFrameworkBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXBundleUtils getLocalizedStringWithBundle:table:key:languageCode:gender:](bundleUtils, "getLocalizedStringWithBundle:table:key:languageCode:gender:", v19, CFSTR("Clock"), CFSTR("SIRI_VOX_FIRING_ALARM_OR_TIMER_ANNOUNCEMENT_CONCATENATION"), v14, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[SVXAlarmAndTimerUtilities _timersListTextWithFiringTimers:concatenationString:languageCode:gender:](self, "_timersListTextWithFiringTimers:concatenationString:languageCode:gender:", v8, v20, v14, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXAlarmAndTimerUtilities _textFromFiringTimers:timersListText:languageCode:gender:](self, "_textFromFiringTimers:timersListText:languageCode:gender:", v8, v21, v14, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendString:", v22);

    -[SVXAlarmAndTimerUtilities _textFromActiveTimersAndAlarms:orderedFiringAlarms:concatenationString:](self, "_textFromActiveTimersAndAlarms:orderedFiringAlarms:concatenationString:", v8, v31, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendString:", v23);

    -[SVXAlarmAndTimerUtilities _alarmsListTextWithFiringAlarms:concatenationString:languageCode:preferences:](self, "_alarmsListTextWithFiringAlarms:concatenationString:languageCode:preferences:", v31, v20, v14, v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXAlarmAndTimerUtilities _textFromFiringAlarms:alarmsListText:languageCode:gender:](self, "_textFromFiringAlarms:alarmsListText:languageCode:gender:", v31, v24, v14, v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendString:", v25);

    if (objc_msgSend(v17, "length"))
      v10 = -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:]([SVXSpeechSynthesisRequest alloc], "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", 3, 1, v17, 0, 0, 0, 0);
    else
      v10 = 0;

    v7 = v29;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_timersListTextWithFiringTimers:(id)a3 concatenationString:(id)a4 languageCode:(id)a5 gender:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (objc_msgSend(v9, "count"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v9, "count") >= 2 && v13 == objc_msgSend(v9, "count") - 1)
        objc_msgSend(v12, "appendString:", v10);
      objc_msgSend(v14, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");

      if (v17)
      {
        objc_msgSend(v12, "appendString:", v15);
      }
      else
      {
        objc_msgSend(v14, "svx_speakableDurationStringWithLanguageCode:gender:", v11, a6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendString:", v18);

      }
      if ((unint64_t)objc_msgSend(v9, "count") >= 3 && v13 < objc_msgSend(v9, "count") - 2)
        objc_msgSend(v12, "appendString:", CFSTR(" @{tts#\x1B\\pause=150\\} "));

      ++v13;
    }
    while (v13 < objc_msgSend(v9, "count"));
  }

  return v12;
}

- (id)_alarmsListTextWithFiringAlarms:(id)a3 concatenationString:(id)a4 languageCode:(id)a5 preferences:(id)a6
{
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id v23;
  id v24;
  void *v25;

  v9 = a3;
  v21 = a4;
  v24 = a5;
  v23 = a6;
  v10 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (objc_msgSend(v9, "count"))
  {
    v11 = 0;
    v25 = v10;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v9, "count") >= 2 && v11 == objc_msgSend(v9, "count") - 1)
        objc_msgSend(v10, "appendString:", v21);
      objc_msgSend(v12, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
      {
        objc_msgSend(v10, "appendString:", v13);
      }
      else
      {
        v14 = objc_alloc_init(MEMORY[0x24BDBCE68]);
        objc_msgSend(v14, "setHour:", objc_msgSend(v12, "hour"));
        objc_msgSend(v14, "setMinute:", objc_msgSend(v12, "minute"));
        -[SVXAlarmAndTimerUtilities _getLocaleWithLanguageCode:preferences:](self, "_getLocaleWithLanguageCode:preferences:", v24, v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SVXAlarmAndTimerUtilities _getCalendarWithLocale:](self, "_getCalendarWithLocale:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dateFromComponents:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SVXAlarmAndTimerUtilities _getDateFormatterWithLocale:calendar:](self, "_getDateFormatterWithLocale:calendar:", v15, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringFromDate:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "appendString:", v19);

        v10 = v25;
      }
      if ((unint64_t)objc_msgSend(v9, "count") >= 3 && v11 < objc_msgSend(v9, "count") - 2)
        objc_msgSend(v10, "appendString:", CFSTR(" @{tts#\x1B\\pause=150\\} "));

      ++v11;
    }
    while (v11 < objc_msgSend(v9, "count"));
  }

  return v10;
}

- (id)_textFromFiringTimers:(id)a3 timersListText:(id)a4 languageCode:(id)a5 gender:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SVXBundleUtils *bundleUtils;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  SVXBundleUtils *v19;
  const __CFString *v20;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    bundleUtils = self->_bundleUtils;
    -[SVXAlarmAndTimerUtilities siriVOXFrameworkBundle](self, "siriVOXFrameworkBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXBundleUtils getLocalizedStringWithBundle:table:key:languageCode:gender:](bundleUtils, "getLocalizedStringWithBundle:table:key:languageCode:gender:", v15, CFSTR("Clock"), CFSTR("SIRI_VOX_FIRING_TIMER_ANNOUNCEMENT_MULTI"), v12, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", v16, v11);
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    v19 = self->_bundleUtils;
    -[SVXAlarmAndTimerUtilities siriVOXFrameworkBundle](self, "siriVOXFrameworkBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v20 = CFSTR("SIRI_VOX_FIRING_TITLED_TIMER_ANNOUNCEMENT_SINGLE");
    else
      v20 = CFSTR("SIRI_VOX_FIRING_UNTITLED_TIMER_ANNOUNCEMENT_SINGLE");
    -[SVXBundleUtils getLocalizedStringWithBundle:table:key:languageCode:gender:](v19, "getLocalizedStringWithBundle:table:key:languageCode:gender:", v16, CFSTR("Clock"), v20, v12, a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", v21, v11);

    goto LABEL_8;
  }
LABEL_9:

  return v13;
}

- (id)_textFromActiveTimersAndAlarms:(id)a3 orderedFiringAlarms:(id)a4 concatenationString:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  id v10;
  void *v11;
  const __CFString *v12;

  v7 = a3;
  v8 = a4;
  v9 = (__CFString *)a5;
  v10 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (objc_msgSend(v7, "count") == 1 && objc_msgSend(v8, "count") == 1)
  {
    v11 = v10;
    v12 = v9;
LABEL_9:
    objc_msgSend(v11, "appendString:", v12);
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "count") && (unint64_t)objc_msgSend(v8, "count") > 1
    || (unint64_t)objc_msgSend(v7, "count") >= 2 && objc_msgSend(v8, "count"))
  {
    v12 = CFSTR(" @{tts#\x1B\\pause=500\\} ");
    v11 = v10;
    goto LABEL_9;
  }
LABEL_10:

  return v10;
}

- (id)_textFromFiringAlarms:(id)a3 alarmsListText:(id)a4 languageCode:(id)a5 gender:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SVXBundleUtils *bundleUtils;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  SVXBundleUtils *v19;
  const __CFString *v20;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    bundleUtils = self->_bundleUtils;
    -[SVXAlarmAndTimerUtilities siriVOXFrameworkBundle](self, "siriVOXFrameworkBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXBundleUtils getLocalizedStringWithBundle:table:key:languageCode:gender:](bundleUtils, "getLocalizedStringWithBundle:table:key:languageCode:gender:", v15, CFSTR("Clock"), CFSTR("SIRI_VOX_FIRING_ALARM_ANNOUNCEMENT_MULTI"), v12, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", v16, v11);
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    v19 = self->_bundleUtils;
    -[SVXAlarmAndTimerUtilities siriVOXFrameworkBundle](self, "siriVOXFrameworkBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v20 = CFSTR("SIRI_VOX_FIRING_TITLED_ALARM_ANNOUNCEMENT_SINGLE");
    else
      v20 = CFSTR("SIRI_VOX_FIRING_UNTITLED_ALARM_ANNOUNCEMENT_SINGLE");
    -[SVXBundleUtils getLocalizedStringWithBundle:table:key:languageCode:gender:](v19, "getLocalizedStringWithBundle:table:key:languageCode:gender:", v16, CFSTR("Clock"), v20, v12, a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendFormat:", v21, v11);

    goto LABEL_8;
  }
LABEL_9:

  return v13;
}

- (id)siriVOXFrameworkBundle
{
  return -[SVXBundleUtils getSiriVOXFramework](self->_bundleUtils, "getSiriVOXFramework");
}

- (id)_getLocaleWithLanguageCode:(id)a3 preferences:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[SVXNSLocaleFactory canonicalLocaleIdentifierFromString:](self->_localeFactory, "canonicalLocaleIdentifierFromString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = v8;
  else
    v9 = v6;
  -[SVXNSLocaleFactory localeWithLocaleIdentifier:](self->_localeFactory, "localeWithLocaleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[SVXSpeechSynthesisUtils getLocaleWithAllowsFallback:preferences:](self->_speechSynthesisUtils, "getLocaleWithAllowsFallback:preferences:", 1, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_getCalendarWithLocale:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocale:", v4);

  return v5;
}

- (id)_getDateFormatterWithLocale:(id)a3 calendar:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BDD1500];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setCalendar:", v6);

  objc_msgSend(v8, "setLocale:", v7);
  objc_msgSend(v8, "setDateStyle:", 0);
  objc_msgSend(v8, "setTimeStyle:", 1);
  return v8;
}

- (BOOL)_isEndpoint:(id)a3
{
  void *v4;
  void *v5;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SVXAlarmAndTimerUtilities _isEndpoint:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SVXAlarmAndTimerUtilities.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("instanceContext != nil"));

  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeFactory, 0);
  objc_storeStrong((id *)&self->_speechSynthesisUtils, 0);
  objc_storeStrong((id *)&self->_bundleUtils, 0);
}

@end
