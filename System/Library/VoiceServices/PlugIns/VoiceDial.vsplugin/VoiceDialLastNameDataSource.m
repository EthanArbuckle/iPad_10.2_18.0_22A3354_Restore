@implementation VoiceDialLastNameDataSource

- (unint64_t)personNameCount
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VoiceDialLastNameDataSource;
  return -[VoiceDialNameDataSource personNameCount](&v3, sel_personNameCount) + 1;
}

- (BOOL)getName:(id *)a3 phoneticName:(id *)a4 atIndex:(unint64_t)a5 forPerson:(void *)a6
{
  id v11;
  id v12;
  id v13;
  objc_super v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VoiceDialLastNameDataSource;
  v11 = -[VoiceDialNameDataSource personNameCount](&v16, sel_personNameCount);
  if ((unint64_t)v11 <= a5)
  {
    v12 = v11;
    if (a3)
    {
      v13 = 0;
      *a3 = 0;
      if (v12 == (id)a5)
      {
        if (-[VoiceDialNameDataSource useCompositeNamesOnly](self, "useCompositeNamesOnly"))
        {
          v13 = *a3;
        }
        else
        {
          v13 = (id)ABRecordCopyValue(a6, *MEMORY[0x24BE02820]);
          *a3 = v13;
        }
      }
      LOBYTE(a3) = v13 != 0;
    }
    if (a4)
    {
      *a4 = 0;
      if (v12 == (id)a5 && !-[VoiceDialNameDataSource useCompositeNamesOnly](self, "useCompositeNamesOnly"))
        *a4 = -[VoiceDialNameDataSource copyPronunciationPropertyForPerson:withNameType:](self, "copyPronunciationPropertyForPerson:withNameType:", a6, 1);
      LOBYTE(a3) = (a3 & 1) != 0 || *a4 != 0;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)VoiceDialLastNameDataSource;
    LOBYTE(a3) = -[VoiceDialNameDataSource getName:phoneticName:atIndex:forPerson:](&v15, sel_getName_phoneticName_atIndex_forPerson_, a3, a4, a5, a6);
  }
  return (char)a3;
}

- (unint64_t)indexOfMainNameOfType:(int)a3
{
  objc_super v4;
  objc_super v5;

  if (a3 == 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)VoiceDialLastNameDataSource;
    return -[VoiceDialNameDataSource personNameCount](&v5, sel_personNameCount);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)VoiceDialLastNameDataSource;
    return -[VoiceDialNameDataSource indexOfMainNameOfType:](&v4, sel_indexOfMainNameOfType_);
  }
}

- (int)typeOfNameAtIndex:(unint64_t)a3
{
  id v5;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VoiceDialLastNameDataSource;
  v5 = -[VoiceDialNameDataSource personNameCount](&v8, sel_personNameCount);
  if ((unint64_t)v5 <= a3)
  {
    if (v5 == (id)a3)
      return 1;
    else
      return -1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VoiceDialLastNameDataSource;
    return -[VoiceDialNameDataSource typeOfNameAtIndex:](&v7, sel_typeOfNameAtIndex_, a3);
  }
}

@end
