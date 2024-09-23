@implementation SKFilesystem

+ (id)buildFilesystems
{
  __objc2_class *v3;
  id v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000047C8;
  block[3] = &unk_100044BD8;
  block[4] = a1;
  if (qword_100051A58 != -1)
    dispatch_once(&qword_100051A58, block);
  v3 = &OBJC_METACLASS___SKVolume;
  v4 = (id)qword_100051A68;
  objc_sync_enter(v4);
  if (byte_100051A70)
  {
    v3 = (__objc2_class *)(id)qword_100051A60;
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "extensionFilesystemsMapping"));
    v7 = objc_msgSend(v6, "count");
    byte_100051A70 = v7 != 0;
    if (v7)
    {
      objc_msgSend((id)qword_100051A68, "addEntriesFromDictionary:", v6);
      v8 = objc_claimAutoreleasedReturnValue(+[SKFilesystem collectFilesystemsWithPersonalityMapping:](SKFilesystem, "collectFilesystemsWithPersonalityMapping:", qword_100051A68));
      v9 = (void *)qword_100051A60;
      qword_100051A60 = v8;

      v5 = 0;
    }
    else
    {
      v3 = (__objc2_class *)(id)qword_100051A60;
      v5 = 1;
    }

  }
  objc_sync_exit(v4);

  if (!v5)
    v3 = (__objc2_class *)(id)qword_100051A60;
  return v3;
}

- (BOOL)supportsJournaling
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystem dmPersonality](self, "dmPersonality"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HFS+")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystem dmPersonality](self, "dmPersonality"));
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Journaled HFS+")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystem dmPersonality](self, "dmPersonality"));
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Case-sensitive HFS+")) & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKFilesystem dmPersonality](self, "dmPersonality"));
        v4 = objc_msgSend(v7, "isEqualToString:", CFSTR("Case-sensitive Journaled HFS+"));

      }
    }

  }
  return v4;
}

@end
