@implementation STMutableStatusBarDataAdditionsStatusDomainData

- (STMutableStatusBarDataAdditionsStatusDomainData)initWithEntryDictionaryData:(id)a3
{
  void *v4;
  STMutableStatusBarDataAdditionsStatusDomainData *v5;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v5 = (STMutableStatusBarDataAdditionsStatusDomainData *)-[STStatusBarDataAdditionsStatusDomainData _initWithEntryDictionaryData:]((id *)&self->super.super.isa, v4);

  return v5;
}

- (STMutableDictionaryData)entryDictionaryData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STMutableStatusBarDataAdditionsStatusDomainData;
  -[STStatusBarDataAdditionsStatusDomainData entryDictionaryData](&v3, sel_entryDictionaryData);
  return (STMutableDictionaryData *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setPersonNameEntry:(id)a3
{
  -[STMutableStatusBarDataAdditionsStatusDomainData _updateEntry:forKey:](self, a3, CFSTR("personNameEntry"));
}

- (void)_updateEntry:(void *)a3 forKey:
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (a1)
  {
    if (v7)
    {
      -[STStatusBarDataAdditionsStatusDomainData _expectedClassForKey:](a1, v5);
      objc_opt_isKindOfClass();
      objc_msgSend(a1, "entryDictionaryData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v7, v5);
    }
    else
    {
      objc_msgSend(a1, "entryDictionaryData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObjectForKey:", v5);
    }

  }
}

- (void)setBluetoothEntry:(id)a3
{
  -[STMutableStatusBarDataAdditionsStatusDomainData _updateEntry:forKey:](self, a3, CFSTR("bluetoothEntry"));
}

- (void)setThermalEntry:(id)a3
{
  -[STMutableStatusBarDataAdditionsStatusDomainData _updateEntry:forKey:](self, a3, CFSTR("thermalEntry"));
}

- (void)setActivityEntry:(id)a3
{
  -[STMutableStatusBarDataAdditionsStatusDomainData _updateEntry:forKey:](self, a3, CFSTR("activityEntry"));
}

- (void)setTetheringEntry:(id)a3
{
  -[STMutableStatusBarDataAdditionsStatusDomainData _updateEntry:forKey:](self, a3, CFSTR("tetheringEntry"));
}

- (void)setLockEntry:(id)a3
{
  -[STMutableStatusBarDataAdditionsStatusDomainData _updateEntry:forKey:](self, a3, CFSTR("lockEntry"));
}

- (void)setFocusModeEntry:(id)a3
{
  -[STMutableStatusBarDataAdditionsStatusDomainData _updateEntry:forKey:](self, a3, CFSTR("focusModeEntry"));
}

- (void)setRingerSilenceEntry:(id)a3
{
  -[STMutableStatusBarDataAdditionsStatusDomainData _updateEntry:forKey:](self, a3, CFSTR("ringerSilenceEntry"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STStatusBarDataAdditionsStatusDomainData initWithData:](+[STStatusBarDataAdditionsStatusDomainData allocWithZone:](STStatusBarDataAdditionsStatusDomainData, "allocWithZone:", a3), self);
}

- (BOOL)applyDiff:(id)a3
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v4, "applyToMutableData:", self);

  return isKindOfClass & 1;
}

@end
