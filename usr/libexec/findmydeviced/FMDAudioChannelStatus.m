@implementation FMDAudioChannelStatus

- (FMDAudioChannelStatus)initWithName:(id)a3 active:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  FMDAudioChannelStatus *v7;
  FMDAudioChannelStatus *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDAudioChannelStatus;
  v7 = -[FMDBLEBeacon init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[FMDAudioChannelStatus setInEar:](v7, "setInEar:", 0);
    -[FMDAudioChannelStatus setOnHeadStatus:](v8, "setOnHeadStatus:", 0);
    -[FMDAudioChannelStatus setInCase:](v8, "setInCase:", 0);
    -[FMDAudioChannelStatus setLidClosed:](v8, "setLidClosed:", 0);
    -[FMDAudioChannelStatus setChannelName:](v8, "setChannelName:", v6);
    -[FMDBLEBeacon setActive:](v8, "setActive:", v4);
    -[FMDAudioChannelStatus setAvailability:](v8, "setAvailability:", 0);
    -[FMDAudioChannelStatus setAudioState:](v8, "setAudioState:", 0);
  }

  return v8;
}

- (FMDAudioChannelStatus)initWithConfiguration:(id)a3
{
  id v4;
  FMDAudioChannelStatus *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDAudioChannelStatus;
  v5 = -[FMDBLEBeacon initWithConfiguration:](&v8, "initWithConfiguration:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    -[FMDAudioChannelStatus setChannelName:](v5, "setChannelName:", v6);

    -[FMDAudioChannelStatus setInEar:](v5, "setInEar:", objc_msgSend(v4, "inEarStatus"));
    -[FMDAudioChannelStatus setOnHeadStatus:](v5, "setOnHeadStatus:", objc_msgSend(v4, "onHeadStatus"));
    -[FMDAudioChannelStatus setInCase:](v5, "setInCase:", objc_msgSend(v4, "inCaseStatus"));
    -[FMDAudioChannelStatus setLidClosed:](v5, "setLidClosed:", objc_msgSend(v4, "lidClosedStatus"));
    -[FMDAudioChannelStatus setAvailability:](v5, "setAvailability:", objc_msgSend(v4, "availability"));
    -[FMDAudioChannelStatus setAudioState:](v5, "setAudioState:", objc_msgSend(v4, "audioStateStatus"));
  }

  return v5;
}

- (FMDAudioChannelStatus)initWithDictionary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMDAudioChannelStatus;
  return -[FMDBLEBeacon init](&v4, "init", a3);
}

- (FMDAudioChannelStatus)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDAudioChannelStatus *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMDAudioChannelStatus;
  v6 = -[FMDBLEBeacon init](&v12, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSString, v5);
    v8 = NSStringFromSelector("channelName");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v9));
    -[FMDAudioChannelStatus setChannelName:](v6, "setChannelName:", v10);

  }
  return v6;
}

- (unint64_t)availability
{
  if (-[FMDBLEBeacon active](self, "active"))
    return self->_availability;
  else
    return 0;
}

- (NSNumber)playingSound
{
  NSNumber *playingSound;
  NSNumber *v4;

  playingSound = self->_playingSound;
  if (playingSound
    && -[NSNumber BOOLValue](playingSound, "BOOLValue")
    && (id)-[FMDAudioChannelStatus availability](self, "availability") == (id)1)
  {
    v4 = self->_playingSound;
  }
  else
  {
    v4 = (NSNumber *)&__kCFBooleanFalse;
  }
  return v4;
}

- (NSNumber)muted
{
  NSNumber *playingSound;
  void *v3;

  playingSound = self->_playingSound;
  if (playingSound)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSNumber BOOLValue](playingSound, "BOOLValue") ^ 1));
  else
    v3 = &__kCFBooleanFalse;
  return (NSNumber *)v3;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAudioChannelStatus playingSound](self, "playingSound"));
  objc_msgSend(v3, "fm_safelySetObject:forKey:", v4, CFSTR("playing"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDAudioChannelStatus availability](self, "availability")));
  objc_msgSend(v3, "fm_safelySetObject:forKey:", v5, CFSTR("available"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAudioChannelStatus channelName](self, "channelName"));
  objc_msgSend(v3, "fm_safelySetObject:forKey:", v6, CFSTR("name"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAudioChannelStatus muted](self, "muted"));
  objc_msgSend(v3, "fm_safeSetObject:forKey:", v7, CFSTR("muted"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  if (!objc_msgSend(v8, "isInternalBuild"))
    goto LABEL_4;
  v9 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("DebugBeaconInfo"), kFMDNotBackedUpPrefDomain);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDBLEBeacon primary](self, "primary")));
    objc_msgSend(v3, "fm_safelySetObject:forKey:", v10, CFSTR("primary"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDBLEBeacon utpConnected](self, "utpConnected")));
    objc_msgSend(v3, "fm_safelySetObject:forKey:", v11, CFSTR("utpConnected"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDAudioChannelStatus inEar](self, "inEar")));
    objc_msgSend(v3, "fm_safelySetObject:forKey:", v12, CFSTR("In Ear"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDAudioChannelStatus onHeadStatus](self, "onHeadStatus")));
    objc_msgSend(v3, "fm_safelySetObject:forKey:", v13, CFSTR("On Head"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDAudioChannelStatus inCase](self, "inCase")));
    objc_msgSend(v3, "fm_safelySetObject:forKey:", v14, CFSTR("In Case"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDAudioChannelStatus lidClosed](self, "lidClosed")));
    objc_msgSend(v3, "fm_safelySetObject:forKey:", v8, CFSTR("Lid Closed"));
LABEL_4:

  }
  return (NSDictionary *)v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDBLEBeacon primary](self, "primary")));
  objc_msgSend(v3, "fm_safelySetObject:forKey:", v4, CFSTR("primary"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDBLEBeacon utpConnected](self, "utpConnected")));
  objc_msgSend(v3, "fm_safelySetObject:forKey:", v5, CFSTR("utpConnected"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAudioChannelStatus playingSound](self, "playingSound"));
  objc_msgSend(v3, "fm_safelySetObject:forKey:", v6, CFSTR("playing"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDAudioChannelStatus availability](self, "availability")));
  objc_msgSend(v3, "fm_safelySetObject:forKey:", v7, CFSTR("available"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDAudioChannelStatus inEar](self, "inEar")));
  objc_msgSend(v3, "fm_safelySetObject:forKey:", v8, CFSTR("In Ear"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDAudioChannelStatus onHeadStatus](self, "onHeadStatus")));
  objc_msgSend(v3, "fm_safelySetObject:forKey:", v9, CFSTR("On Head"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDAudioChannelStatus inCase](self, "inCase")));
  objc_msgSend(v3, "fm_safelySetObject:forKey:", v10, CFSTR("In Case"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDAudioChannelStatus lidClosed](self, "lidClosed")));
  objc_msgSend(v3, "fm_safelySetObject:forKey:", v11, CFSTR("Lid Closed"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAudioChannelStatus channelName](self, "channelName"));
  objc_msgSend(v3, "fm_safelySetObject:forKey:", v12, CFSTR("name"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
  return (NSString *)v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[FMDAudioChannelStatus channelName](self, "channelName"));
  v5 = NSStringFromSelector("channelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "encodeObject:forKey:", v7, v6);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)channelName
{
  return self->_channelName;
}

- (void)setChannelName:(id)a3
{
  objc_storeStrong((id *)&self->_channelName, a3);
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (unint64_t)inEar
{
  return self->_inEar;
}

- (void)setInEar:(unint64_t)a3
{
  self->_inEar = a3;
}

- (unint64_t)onHeadStatus
{
  return self->_onHeadStatus;
}

- (void)setOnHeadStatus:(unint64_t)a3
{
  self->_onHeadStatus = a3;
}

- (unint64_t)inCase
{
  return self->_inCase;
}

- (void)setInCase:(unint64_t)a3
{
  self->_inCase = a3;
}

- (unint64_t)lidClosed
{
  return self->_lidClosed;
}

- (void)setLidClosed:(unint64_t)a3
{
  self->_lidClosed = a3;
}

- (void)setAvailability:(unint64_t)a3
{
  self->_availability = a3;
}

- (unint64_t)audioState
{
  return self->_audioState;
}

- (void)setAudioState:(unint64_t)a3
{
  self->_audioState = a3;
}

- (void)setPlayingSound:(id)a3
{
  objc_storeStrong((id *)&self->_playingSound, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playingSound, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_channelName, 0);
}

@end
