@implementation VoiceDialMaidenNameDataSource

- (unint64_t)personNameCount
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VoiceDialMaidenNameDataSource;
  return -[VoiceDialNameDataSource personNameCount](&v3, sel_personNameCount) + 2;
}

- (BOOL)getName:(id *)a3 phoneticName:(id *)a4 atIndex:(unint64_t)a5 forPerson:(void *)a6
{
  id v11;
  unint64_t v12;
  BOOL result;
  char v14;
  char v15;
  CFTypeRef v16;
  const void *v17;
  int v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *MaidenNameFromLastName;
  const __CFString *v22;
  char v23;
  objc_super v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)VoiceDialMaidenNameDataSource;
  v11 = -[VoiceDialNameDataSource personNameCount](&v25, sel_personNameCount);
  v12 = a5 - (_QWORD)v11;
  if (a5 < (unint64_t)v11)
  {
    v24.receiver = self;
    v24.super_class = (Class)VoiceDialMaidenNameDataSource;
    return -[VoiceDialNameDataSource getName:phoneticName:atIndex:forPerson:](&v24, sel_getName_phoneticName_atIndex_forPerson_, a3, a4, a5, a6);
  }
  if (!a3)
  {
    if (!a4)
      return 0;
LABEL_8:
    v14 = 0;
    *a4 = 0;
    if (!v12)
      goto LABEL_6;
    goto LABEL_9;
  }
  *a3 = 0;
  if (a4)
    goto LABEL_8;
  v14 = 1;
  if (!v12)
  {
LABEL_6:
    v15 = 0;
    goto LABEL_11;
  }
LABEL_9:
  if (v12 != 1)
    goto LABEL_22;
  v15 = 9;
LABEL_11:
  if (!VoiceDialPersonIsCompany(a6))
  {
    v16 = ABRecordCopyValue(a6, *MEMORY[0x24BE02758]);
    if (v16)
    {
      v17 = v16;
      v18 = *MEMORY[0x24BE02820];
      v19 = (const __CFString *)ABRecordCopyValue(a6, *MEMORY[0x24BE02820]);
      if (v19)
      {
        v20 = v19;
        MaidenNameFromLastName = VoiceDialMaidenNameDataSourceCreateMaidenNameFromLastName(v19);
        if (MaidenNameFromLastName)
        {
          v22 = MaidenNameFromLastName;
          if (a3)
            *a3 = VoiceDialPersonCopyCompositeNameWithSubstitution(a6, MaidenNameFromLastName, v18, v15);
          if ((v14 & 1) == 0)
            *a4 = VoiceDialPersonCopyCompositeNameWithSubstitution(a6, v22, v18, v15 | 6u);
          CFRelease(v22);
        }
        CFRelease(v20);
      }
      CFRelease(v17);
    }
  }
LABEL_22:
  if (!a3)
  {
    if ((v14 & 1) == 0)
      return *a4 != 0;
    return 0;
  }
  result = *a3 != 0;
  if (*a3)
    v23 = 1;
  else
    v23 = v14;
  if ((v23 & 1) == 0)
    return *a4 != 0;
  return result;
}

- (int)typeOfNameAtIndex:(unint64_t)a3
{
  id v5;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VoiceDialMaidenNameDataSource;
  v5 = -[VoiceDialNameDataSource personNameCount](&v8, sel_personNameCount);
  if (a3 >= (unint64_t)v5)
  {
    if (a3 - (unint64_t)v5 >= 2)
      return -1;
    else
      return 2;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VoiceDialMaidenNameDataSource;
    return -[VoiceDialNameDataSource typeOfNameAtIndex:](&v7, sel_typeOfNameAtIndex_, a3);
  }
}

- (BOOL)getNth:(unint64_t)a3 name:(id *)a4 phoneticName:(id *)a5 ofType:(int)a6 nameIndex:(unint64_t *)a7 forPerson:(void *)a8
{
  uint64_t v10;
  const __CFString *v15;
  const __CFString *v16;
  __CFString *v17;
  objc_super v19;
  objc_super v20;

  v10 = *(_QWORD *)&a6;
  if (a6 == 1
    && (v20.receiver = self,
        v20.super_class = (Class)VoiceDialMaidenNameDataSource,
        -[VoiceDialNameDataSource countOfNamesOfType:](&v20, sel_countOfNamesOfType_, 1) == a3))
  {
    if (a7)
      *a7 = 0x7FFFFFFFFFFFFFFFLL;
    if (a4)
    {
      if (VoiceDialPersonIsCompany(a8)
        || (v15 = (const __CFString *)ABRecordCopyValue(a8, *MEMORY[0x24BE02820])) == 0)
      {
        LOBYTE(a4) = 0;
      }
      else
      {
        v16 = v15;
        v17 = (id)VoiceDialMaidenNameDataSourceCreateMaidenNameFromLastName(v15);
        *a4 = v17;
        LOBYTE(a4) = v17 != 0;
        CFRelease(v16);
      }
    }
    if (a5)
      *a5 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)VoiceDialMaidenNameDataSource;
    LOBYTE(a4) = -[VoiceDialNameDataSource getNth:name:phoneticName:ofType:nameIndex:forPerson:](&v19, sel_getNth_name_phoneticName_ofType_nameIndex_forPerson_, a3, a4, a5, v10, a7, a8);
  }
  return (char)a4;
}

- (unint64_t)countOfNamesOfType:(int)a3
{
  unint64_t result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VoiceDialMaidenNameDataSource;
  result = -[VoiceDialNameDataSource countOfNamesOfType:](&v5, sel_countOfNamesOfType_);
  if (a3 == 1)
    ++result;
  return result;
}

- (int)matchingNameType:(id)a3 fromTypes:(unint64_t)a4 forPerson:(void *)a5
{
  id v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;
  CFStringRef MaidenNameFromLastName;
  CFStringRef v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VoiceDialMaidenNameDataSource;
  v9 = -[VoiceDialNameDataSource matchingNameType:fromTypes:forPerson:](&v15, sel_matchingNameType_fromTypes_forPerson_, v8, a4, a5);
  if (v9 == -1)
  {
    if ((a4 & 2) != 0 && (v10 = (const __CFString *)ABRecordCopyValue(a5, *MEMORY[0x24BE02820])) != 0)
    {
      v11 = v10;
      MaidenNameFromLastName = VoiceDialMaidenNameDataSourceCreateMaidenNameFromLastName(v10);
      if (MaidenNameFromLastName)
      {
        v13 = MaidenNameFromLastName;
        if (objc_msgSend(v8, "caseInsensitiveCompare:", MaidenNameFromLastName))
          v9 = -1;
        else
          v9 = 1;
        CFRelease(v13);
      }
      else
      {
        v9 = -1;
      }
      CFRelease(v11);
    }
    else
    {
      v9 = -1;
    }
  }

  return v9;
}

@end
