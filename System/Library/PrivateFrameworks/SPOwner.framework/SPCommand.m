@implementation SPCommand

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)enableNotifyWhenFound:(id)a3
{
  id v3;
  SPCommand *v4;

  v3 = a3;
  v4 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:]([SPCommand alloc], "initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:", v3, 1, 0, 0, 0, 0, 0, 0);

  return v4;
}

+ (id)disableNotifyWhenFound:(id)a3
{
  id v3;
  SPCommand *v4;

  v3 = a3;
  v4 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:]([SPCommand alloc], "initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:", v3, 2, 0, 0, 0, 0, 0, 0);

  return v4;
}

+ (id)locate:(id)a3
{
  id v3;
  SPCommand *v4;

  v3 = a3;
  v4 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:]([SPCommand alloc], "initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:", v3, 0, 0, 0, 0, 0, 0, 0);

  return v4;
}

+ (id)playSoundWithBeaconUUID:(id)a3 duration:(double)a4
{
  id v5;
  SPCommand *v6;
  void *v7;
  void *v8;
  SPCommand *v9;

  v5 = a3;
  v6 = [SPCommand alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SPCommand initWithBeaconUUID:type:expiration:duration:playSoundContext:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:identifier:](v6, "initWithBeaconUUID:type:expiration:duration:playSoundContext:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:identifier:", v5, 3, 0, v7, 0, 0, 0, 0, 0, v8);

  return v9;
}

+ (id)playSoundWithBeaconUUID:(id)a3
{
  return +[SPCommand playSoundWithBeaconUUID:withContext:](SPCommand, "playSoundWithBeaconUUID:withContext:", a3, 0);
}

+ (id)unpairWithBeaconUUID:(id)a3
{
  id v3;
  SPCommand *v4;

  v3 = a3;
  v4 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:]([SPCommand alloc], "initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:", v3, 10, 0, 0, 0, 0, 0, 0);

  return v4;
}

+ (id)playSoundWithBeaconUUID:(id)a3 withContext:(int64_t)a4
{
  id v5;
  SPCommand *v6;
  void *v7;
  SPCommand *v8;

  v5 = a3;
  v6 = [SPCommand alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SPCommand initWithBeaconUUID:type:expiration:duration:playSoundContext:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:identifier:](v6, "initWithBeaconUUID:type:expiration:duration:playSoundContext:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:identifier:", v5, 3, 0, 0, a4, 0, 0, 0, 0, v7);

  return v8;
}

+ (id)stopSoundWithBeaconUUID:(id)a3
{
  id v3;
  SPCommand *v4;

  v3 = a3;
  v4 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:]([SPCommand alloc], "initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:", v3, 4, 0, 0, 0, 0, 0, 0);

  return v4;
}

+ (id)enableLostModeForBeaconUUID:(id)a3 message:(id)a4 phoneNumber:(id)a5 email:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  SPCommand *v13;
  void *v14;
  SPCommand *v15;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = [SPCommand alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeEmail:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:identifier:](v13, "initWithBeaconUUID:type:expiration:duration:handle:lostModeEmail:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:identifier:", v12, 5, 0, 0, 0, v9, v11, v10, 0, v14);

  return v15;
}

+ (id)disableLostModeForBeaconUUID:(id)a3
{
  id v3;
  SPCommand *v4;

  v3 = a3;
  v4 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:]([SPCommand alloc], "initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:", v3, 6, 0, 0, 0, 0, 0, 0);

  return v4;
}

+ (id)beginLeashingWithBeaconUUID:(id)a3
{
  id v3;
  SPCommand *v4;

  v3 = a3;
  v4 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:]([SPCommand alloc], "initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:", v3, 7, 0, 0, 0, 0, 0, 0);

  return v4;
}

+ (id)endLeashingWithBeaconUUID:(id)a3
{
  id v3;
  SPCommand *v4;

  v3 = a3;
  v4 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:]([SPCommand alloc], "initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:", v3, 8, 0, 0, 0, 0, 0, 0);

  return v4;
}

+ (id)connectToBeaconUUID:(id)a3
{
  id v3;
  SPCommand *v4;

  v3 = a3;
  v4 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:]([SPCommand alloc], "initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:", v3, 9, 0, 0, 0, 0, 0, 0);

  return v4;
}

+ (id)disconnectFromBeaconUUID:(id)a3
{
  id v3;
  SPCommand *v4;

  v3 = a3;
  v4 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:]([SPCommand alloc], "initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:", v3, 13, 0, 0, 0, 0, 0, 0);

  return v4;
}

+ (id)startBTFindingWithBeaconUUID:(id)a3
{
  id v3;
  SPCommand *v4;

  v3 = a3;
  v4 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:]([SPCommand alloc], "initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:", v3, 14, 0, 0, 0, 0, 0, 0);

  return v4;
}

+ (id)stopBTFindingWithBeaconUUID:(id)a3
{
  id v3;
  SPCommand *v4;

  v3 = a3;
  v4 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:]([SPCommand alloc], "initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:", v3, 15, 0, 0, 0, 0, 0, 0);

  return v4;
}

+ (id)setObfuscatedIdentifier:(id)a3
{
  id v3;
  SPCommand *v4;
  void *v5;
  SPCommand *v6;

  v3 = a3;
  v4 = [SPCommand alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:](v4, "initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:", v5, 11, 0, 0, 0, 0, 0, v3);

  return v6;
}

+ (id)updateAccessoryFirmware:(id)a3
{
  id v3;
  SPCommand *v4;

  v3 = a3;
  v4 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:]([SPCommand alloc], "initWithBeaconUUID:type:expiration:duration:handle:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:", v3, 12, 0, 0, 0, 0, 0, 0);

  return v4;
}

+ (id)startNotifyWhenFound:(id)a3
{
  return +[SPCommand enableNotifyWhenFound:](SPCommand, "enableNotifyWhenFound:", a3);
}

+ (id)stopNotifyWhenFound:(id)a3
{
  return +[SPCommand disableNotifyWhenFound:](SPCommand, "disableNotifyWhenFound:", a3);
}

- (SPCommand)initWithBeaconUUID:(id)a3 type:(int64_t)a4 expiration:(id)a5 duration:(id)a6 handle:(id)a7 lostModeMessage:(id)a8 lostModePhoneNumber:(id)a9 obfuscatedIdentifier:(id)a10
{
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  SPCommand *v26;

  v17 = (void *)MEMORY[0x1E0CB3A28];
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a3;
  objc_msgSend(v17, "UUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeEmail:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:identifier:](self, "initWithBeaconUUID:type:expiration:duration:handle:lostModeEmail:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:identifier:", v24, a4, v23, v22, v21, 0, v20, v19, v18, v25);

  return v26;
}

- (SPCommand)initWithBeaconUUID:(id)a3 type:(int64_t)a4 expiration:(id)a5 duration:(id)a6 handle:(id)a7 lostModeEmail:(id)a8 lostModeMessage:(id)a9 lostModePhoneNumber:(id)a10 obfuscatedIdentifier:(id)a11 identifier:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  SPCommand *v26;
  SPCommand *v27;
  objc_super v30;

  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v30.receiver = self;
  v30.super_class = (Class)SPCommand;
  v26 = -[SPCommand init](&v30, sel_init);
  v27 = v26;
  if (v26)
  {
    -[SPCommand setIdentifier:](v26, "setIdentifier:", v25);
    -[SPCommand setBeaconIdentifier:](v27, "setBeaconIdentifier:", v17);
    -[SPCommand setType:](v27, "setType:", a4);
    -[SPCommand setExpiration:](v27, "setExpiration:", v18);
    -[SPCommand setDuration:](v27, "setDuration:", v19);
    -[SPCommand setHandle:](v27, "setHandle:", v20);
    -[SPCommand setLostModeEmail:](v27, "setLostModeEmail:", v21);
    -[SPCommand setLostModeMessage:](v27, "setLostModeMessage:", v22);
    -[SPCommand setLostModePhoneNumber:](v27, "setLostModePhoneNumber:", v23);
    -[SPCommand setObfuscatedIdentifier:](v27, "setObfuscatedIdentifier:", v24);
  }

  return v27;
}

- (SPCommand)initWithBeaconUUID:(id)a3 type:(int64_t)a4 expiration:(id)a5 duration:(id)a6 playSoundContext:(int64_t)a7 handle:(id)a8 lostModeMessage:(id)a9 lostModePhoneNumber:(id)a10 obfuscatedIdentifier:(id)a11 identifier:(id)a12
{
  id v17;
  SPCommand *v18;
  SPCommand *v19;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a5;
  v27 = a6;
  v26 = a8;
  v25 = a9;
  v24 = a10;
  v23 = a11;
  v17 = a12;
  v30.receiver = self;
  v30.super_class = (Class)SPCommand;
  v18 = -[SPCommand init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a12);
    objc_storeStrong((id *)&v19->_beaconIdentifier, a3);
    v19->_type = a4;
    objc_storeStrong((id *)&v19->_expiration, a5);
    objc_storeStrong((id *)&v19->_duration, a6);
    v19->_playSoundContext = a7;
    objc_storeStrong((id *)&v19->_handle, a8);
    objc_storeStrong((id *)&v19->_lostModeMessage, a9);
    objc_storeStrong((id *)&v19->_lostModePhoneNumber, a10);
    objc_storeStrong((id *)&v19->_obfuscatedIdentifier, a11);
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SPCommand *v14;
  SPCommand *v16;

  v16 = [SPCommand alloc];
  -[SPCommand identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SPCommand type](self, "type");
  -[SPCommand expiration](self, "expiration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommand duration](self, "duration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommand handle](self, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommand lostModeEmail](self, "lostModeEmail");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommand lostModeMessage](self, "lostModeMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommand lostModePhoneNumber](self, "lostModePhoneNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommand obfuscatedIdentifier](self, "obfuscatedIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommand identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SPCommand initWithBeaconUUID:type:expiration:duration:handle:lostModeEmail:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:identifier:](v16, "initWithBeaconUUID:type:expiration:duration:handle:lostModeEmail:lostModeMessage:lostModePhoneNumber:obfuscatedIdentifier:identifier:", v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[SPCommand identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[SPCommand beaconIdentifier](self, "beaconIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("beaconIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPCommand type](self, "type"), CFSTR("type"));
  -[SPCommand expiration](self, "expiration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("expiration"));

  -[SPCommand duration](self, "duration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("duration"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SPCommand playSoundContext](self, "playSoundContext"), CFSTR("playSoundContext"));
  -[SPCommand handle](self, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("handle"));

  -[SPCommand lostModeEmail](self, "lostModeEmail");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("lostModeEmail"));

  -[SPCommand lostModeMessage](self, "lostModeMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("lostModeMessage"));

  -[SPCommand lostModePhoneNumber](self, "lostModePhoneNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("lostModePhoneNumber"));

  -[SPCommand obfuscatedIdentifier](self, "obfuscatedIdentifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("obfuscatedIdentifier"));

}

- (SPCommand)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *identifier;
  NSUUID *v7;
  NSUUID *beaconIdentifier;
  NSDate *v9;
  NSDate *expiration;
  NSNumber *v11;
  NSNumber *duration;
  SPHandle *v13;
  SPHandle *handle;
  NSString *v15;
  NSString *lostModeEmail;
  NSString *v17;
  NSString *lostModeMessage;
  NSString *v19;
  NSString *lostModePhoneNumber;
  NSString *v21;
  NSString *obfuscatedIdentifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("beaconIdentifier"));
  v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  beaconIdentifier = self->_beaconIdentifier;
  self->_beaconIdentifier = v7;

  self->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expiration"));
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  expiration = self->_expiration;
  self->_expiration = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("duration"));
  v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  duration = self->_duration;
  self->_duration = v11;

  self->_playSoundContext = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("playSoundContext"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
  v13 = (SPHandle *)objc_claimAutoreleasedReturnValue();
  handle = self->_handle;
  self->_handle = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lostModeEmail"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  lostModeEmail = self->_lostModeEmail;
  self->_lostModeEmail = v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lostModeMessage"));
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  lostModeMessage = self->_lostModeMessage;
  self->_lostModeMessage = v17;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lostModePhoneNumber"));
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  lostModePhoneNumber = self->_lostModePhoneNumber;
  self->_lostModePhoneNumber = v19;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("obfuscatedIdentifier"));
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();

  obfuscatedIdentifier = self->_obfuscatedIdentifier;
  self->_obfuscatedIdentifier = v21;

  return self;
}

- (NSString)taskName
{
  unint64_t v2;

  v2 = -[SPCommand type](self, "type");
  if (v2 > 0xF)
    return (NSString *)0;
  else
    return (NSString *)*off_1E5E172C8[v2];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (void)setBeaconIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)playSoundContext
{
  return self->_playSoundContext;
}

- (void)setPlaySoundContext:(int64_t)a3
{
  self->_playSoundContext = a3;
}

- (SPHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)lostModeEmail
{
  return self->_lostModeEmail;
}

- (void)setLostModeEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)lostModeMessage
{
  return self->_lostModeMessage;
}

- (void)setLostModeMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)lostModePhoneNumber
{
  return self->_lostModePhoneNumber;
}

- (void)setLostModePhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)obfuscatedIdentifier
{
  return self->_obfuscatedIdentifier;
}

- (void)setObfuscatedIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)enableLostMode
{
  return self->_enableLostMode;
}

- (void)setEnableLostMode:(BOOL)a3
{
  self->_enableLostMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obfuscatedIdentifier, 0);
  objc_storeStrong((id *)&self->_lostModePhoneNumber, 0);
  objc_storeStrong((id *)&self->_lostModeMessage, 0);
  objc_storeStrong((id *)&self->_lostModeEmail, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_beaconIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
