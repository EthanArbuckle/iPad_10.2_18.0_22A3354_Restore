uint64_t AceObjectIntegerForProperty(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "propertyForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

id AceObjectWithClass(objc_class *a1)
{
  return objc_alloc_init(a1);
}

id AceObjectWithClassAndDictionary(objc_class *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend([a1 alloc], "initWithDictionary:", v4);

  return v5;
}

void AceObjectSetDoubleForProperty(void *a1, void *a2, double a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  v7 = a1;
  v8 = (id)objc_msgSend([v5 alloc], "initWithDouble:", a3);
  objc_msgSend(v7, "setProperty:forKey:", v8, v6);

}

double AceObjectDoubleForProperty(void *a1, uint64_t a2)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "propertyForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "doubleValue");
    v3 = v4;
  }

  return v3;
}

void AceObjectSetFloatForProperty(void *a1, void *a2, float a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  double v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  v7 = a1;
  v8 = [v5 alloc];
  *(float *)&v9 = a3;
  v10 = (id)objc_msgSend(v8, "initWithFloat:", v9);
  objc_msgSend(v7, "setProperty:forKey:", v10, v6);

}

float AceObjectFloatForProperty(void *a1, uint64_t a2)
{
  void *v2;
  float v3;
  float v4;

  objc_msgSend(a1, "propertyForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "floatValue");
    v3 = v4;
  }

  return v3;
}

void AceObjectSetIntegerForProperty(void *a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  v7 = a1;
  v8 = (id)objc_msgSend([v5 alloc], "initWithInteger:", a3);
  objc_msgSend(v7, "setProperty:forKey:", v8, v6);

}

void AceObjectSetBoolForProperty(void *a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  v7 = a1;
  v8 = (id)objc_msgSend([v5 alloc], "initWithBool:", a3);
  objc_msgSend(v7, "setProperty:forKey:", v8, v6);

}

uint64_t AceObjectBoolForProperty(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "propertyForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

void AceObjectSetCopyingObjectForProperty(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a2;
  v6 = a1;
  v7 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(v6, "setProperty:forKey:", v7, v5);

}

uint64_t AceObjectCopyingObjectForProperty(void *a1, const char *a2)
{
  return objc_msgSend(a1, "propertyForKey:", a2);
}

id AceObjectAceObjectForProperty(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertyForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AceObject aceObjectWithDictionary:](AceObject, "aceObjectWithDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void AceObjectSetAceObjectForProperty(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a2;
  v6 = a1;
  objc_msgSend(a3, "dictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, v5);

}

id AceObjectClassArrayForProperty(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "propertyForKey:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AceObject aceObjectArrayWithDictionaryArray:baseClass:](AceObject, "aceObjectArrayWithDictionaryArray:baseClass:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id AceObjectProtocolArrayForProperty(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a1, "propertyForKey:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AceObject aceObjectArrayWithDictionaryArray:baseProtocol:](AceObject, "aceObjectArrayWithDictionaryArray:baseProtocol:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void AceObjectSetArrayForProperty(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = a1;
  +[AceObject dictionaryArrayWithAceObjectArray:](AceObject, "dictionaryArrayWithAceObjectArray:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "copy");

  objc_msgSend(v6, "setProperty:forKey:", v8, v5);
}

id AceObjectClassArrayDictionaryForProperty(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a1, "propertyForKey:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __AceObjectClassArrayDictionaryForProperty_block_invoke;
  v7[3] = &__block_descriptor_40_e20___NSArray_24__0_8_16lu32l8;
  v7[4] = a3;
  objc_msgSend(v4, "_sa_mappedDictionaryWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id AceObjectProtocolArrayDictionaryForProperty(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  objc_msgSend(a1, "propertyForKey:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __AceObjectProtocolArrayDictionaryForProperty_block_invoke;
  v10[3] = &unk_1E4C7C008;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "_sa_mappedDictionaryWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void AceObjectSetAceObjectArrayDictionaryForProperty(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a2;
  v6 = a1;
  objc_msgSend(a3, "_sa_mappedDictionaryWithBlock:", &__block_literal_global_227);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, v5);

}

id AceObjectClassDictionaryForProperty(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "propertyForKey:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AceObject aceObjectDictionaryWithDictionary:baseClass:](AceObject, "aceObjectDictionaryWithDictionary:baseClass:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id AceObjectProtocolDictionaryForProperty(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a1, "propertyForKey:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AceObject aceObjectDictionaryWithDictionary:baseProtocol:](AceObject, "aceObjectDictionaryWithDictionary:baseProtocol:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void AceObjectSetAceObjectDictionaryForProperty(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a2;
  v6 = a1;
  +[AceObject dictionaryWithAceObjectDictionary:](AceObject, "dictionaryWithAceObjectDictionary:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, v5);

}

id AceObjectURLForProperty(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertyForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void AceObjectSetURLForProperty(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a2;
  v6 = a1;
  objc_msgSend(a3, "absoluteString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, v5);

}

id AceObjectURLArrayForProperty(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "propertyForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sa_mappedArrayWithBlock:", &__block_literal_global_230);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void AceObjectSetURLArrayForProperty(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a2;
  v6 = a1;
  objc_msgSend(a3, "_sa_mappedArrayWithBlock:", &__block_literal_global_232);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, v5);

}

uint64_t SACalendarRecurrenceFrequencyForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Daily")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Weekly")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Monthly")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Yearly")))
  {
    v2 = 4;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *stringForSACalendarRecurrenceFrequency(int a1)
{
  if ((a1 - 1) > 3)
    return 0;
  else
    return off_1E4C7C430[a1 - 1];
}

uint64_t SASSpeechFailureReasonForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Timeout")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Corrupt")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Invalid")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("EmptyResult")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Error")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Retry")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Unsupported")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("QuotaExceeded")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("TrafficLimitExceeded")) & 1) != 0)
  {
    v2 = 9;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("ApiQuotaLimitExceeded")))
  {
    v2 = 10;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *stringForSASSpeechFailureReason(int a1)
{
  if ((a1 - 1) > 9)
    return 0;
  else
    return off_1E4C7C720[a1 - 1];
}

uint64_t SASCodecForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PCM_Mono_16Bit_8000Hz")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PCM_Mono_16Bit_11025Hz")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PCM_Mono_16Bit_16000Hz")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PCM_Mono_16Bit_22050Hz")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PCM_Mono_16Bit_32000Hz")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Speex_NB_Quality7")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Speex_WB_Quality8")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ALAC_Mono_8000Hz")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ALAC_Mono_16000Hz")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("OPUS_Mono_8000Hz")) & 1) != 0)
  {
    v2 = 10;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("OPUS_Mono_16000Hz")))
  {
    v2 = 11;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *stringForSASCodec(int a1)
{
  if ((a1 - 1) > 0xA)
    return 0;
  else
    return off_1E4C7CA10[a1 - 1];
}

uint64_t SAAlarmDayOfWeekForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Never")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Sunday")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Monday")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Tuesday")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Wednesday")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Thursday")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Friday")) & 1) != 0)
  {
    v2 = 7;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Saturday")))
  {
    v2 = 8;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *stringForSAAlarmDayOfWeek(int a1)
{
  if ((a1 - 1) > 7)
    return 0;
  else
    return off_1E4C7D0F8[a1 - 1];
}

uint64_t SAMPPlaybackPositionForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("NextItem")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PreviousItem")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Beginning")))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *stringForSAMPPlaybackPosition(int a1)
{
  if ((a1 - 1) > 2)
    return 0;
  else
    return off_1E4C7DF38[a1 - 1];
}

uint64_t SAMPPlayStateForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Playing")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Paused")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Stopped")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Interrupted")) & 1) != 0)
  {
    v2 = 4;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Muted")))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *stringForSAMPPlayState(int a1)
{
  if ((a1 - 1) > 4)
    return 0;
  else
    return off_1E4C7DFD8[a1 - 1];
}

uint64_t SAMPSearchPropertyForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Album")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Artist")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Composer")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Genre")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Title")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("RadioStation")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PlaylistDateCreatedValue")) & 1) != 0)
  {
    v2 = 7;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PlaylistDateModifiedValue")))
  {
    v2 = 8;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *stringForSAMPSearchProperty(int a1)
{
  if ((a1 - 1) > 7)
    return 0;
  else
    return off_1E4C7E120[a1 - 1];
}

uint64_t SAMPTypeForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Album")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Artist")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AudioBook")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Compilation")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Composer")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("GeniusMix")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Genre")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ITunesU")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MusicVideo")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Playlist")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Podcast")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PodcastCollection")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PodcastStation")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("RadioStation")) & 1) != 0)
  {
    v2 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Song")) & 1) != 0)
  {
    v2 = 15;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("TVShow")) & 1) != 0)
  {
    v2 = 16;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Video")))
  {
    v2 = 17;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *stringForSAMPType(int a1)
{
  if ((a1 - 1) > 0x10)
    return 0;
  else
    return off_1E4C7E390[a1 - 1];
}

uint64_t SAReminderDayOfWeekForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Sunday")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Monday")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Tuesday")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Wednesday")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Thursday")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Friday")) & 1) != 0)
  {
    v2 = 6;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Saturday")))
  {
    v2 = 7;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

__CFString *stringForSAReminderDayOfWeek(int a1)
{
  if ((a1 - 1) > 6)
    return 0;
  else
    return off_1E4C7FBE0[a1 - 1];
}

uint64_t SAEmailSearchStatusForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Read")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Unread")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *stringForSAEmailSearchStatus(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unread");
  if (a1 != 2)
    v1 = 0;
  if (a1 == 1)
    return CFSTR("Read");
  else
    return v1;
}

uint64_t SAEmailCreateTypeForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("New")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Reply")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("Forward")))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t stringForSAEmailCreateType(int a1)
{
  if ((a1 - 1) > 2)
    return 0;
  else
    return (uint64_t)*(&off_1E4C888B0 + a1 - 1);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1E0C9A3F8]();
}

uint64_t _CFPropertyListCreateSingleValue()
{
  return MEMORY[0x1E0C9A410]();
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

