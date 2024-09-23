@implementation TUAnswerRequest

- (TUAnswerRequest)initWithUniqueProxyIdentifier:(id)a3
{
  id v4;
  TUAnswerRequest *v5;
  uint64_t v6;
  NSString *uniqueProxyIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUAnswerRequest;
  v5 = -[TUAnswerRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    uniqueProxyIdentifier = v5->_uniqueProxyIdentifier;
    v5->_uniqueProxyIdentifier = (NSString *)v6;

  }
  return v5;
}

- (TUAnswerRequest)initWithCall:(id)a3
{
  void *v4;
  TUAnswerRequest *v5;

  objc_msgSend(a3, "uniqueProxyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TUAnswerRequest initWithUniqueProxyIdentifier:](self, "initWithUniqueProxyIdentifier:", v4);

  return v5;
}

- (TUAnswerRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUAnswerRequest.m"), 39, CFSTR("%s is unavailable, use a designated initializer instead"), "-[TUAnswerRequest init]");

  return 0;
}

- (NSString)description
{
  id v3;
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
  void *v14;
  void *v15;
  void *v16;
  NSSize v18;
  NSSize v19;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  -[TUAnswerRequest uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" uniqueProxyIdentifier=%@"), v4);

  -[TUAnswerRequest localLandscapeAspectRatio](self, "localLandscapeAspectRatio");
  NSStringFromSize(v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localLandscapeAspectRatio=%@"), v5);

  -[TUAnswerRequest localPortraitAspectRatio](self, "localPortraitAspectRatio");
  NSStringFromSize(v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" localPortraitAspectRatio=%@"), v6);

  -[TUAnswerRequest dateAnswered](self, "dateAnswered");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" dateAnswered=%@"), v7);

  -[TUAnswerRequest sourceIdentifier](self, "sourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TUAnswerRequest sourceIdentifier](self, "sourceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" sourceIdentifier=%@"), v9);

  }
  -[TUAnswerRequest endpointIDSDestination](self, "endpointIDSDestination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TUAnswerRequest endpointIDSDestination](self, "endpointIDSDestination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" endpointIDSDestination=%@"), v11);

  }
  -[TUAnswerRequest endpointRapportMediaSystemIdentifier](self, "endpointRapportMediaSystemIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TUAnswerRequest endpointRapportMediaSystemIdentifier](self, "endpointRapportMediaSystemIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" endpointRapportMediaSystemIdentifier=%@"), v13);

  }
  -[TUAnswerRequest endpointRapportEffectiveIdentifier](self, "endpointRapportEffectiveIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TUAnswerRequest endpointRapportEffectiveIdentifier](self, "endpointRapportEffectiveIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" endpointRapportEffectiveIdentifier=%@"), v15);

  }
  if (-[TUAnswerRequest downgradeToAudio](self, "downgradeToAudio"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" downgradeToAudio=%d"), -[TUAnswerRequest downgradeToAudio](self, "downgradeToAudio"));
  if (-[TUAnswerRequest wantsHoldMusic](self, "wantsHoldMusic"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" wantsHoldMusic=%d"), -[TUAnswerRequest wantsHoldMusic](self, "wantsHoldMusic"));
  if (-[TUAnswerRequest pauseVideoToStart](self, "pauseVideoToStart"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" pauseVideoToStart=%d"), -[TUAnswerRequest pauseVideoToStart](self, "pauseVideoToStart"));
  if (-[TUAnswerRequest allowBluetoothAnswerWithoutDowngrade](self, "allowBluetoothAnswerWithoutDowngrade"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" allowBluetoothAnswerWithoutDowngrade=%d"), -[TUAnswerRequest allowBluetoothAnswerWithoutDowngrade](self, "allowBluetoothAnswerWithoutDowngrade"));
  if (-[TUAnswerRequest sendToScreening](self, "sendToScreening"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" sendToScreening=%d"), -[TUAnswerRequest sendToScreening](self, "sendToScreening"));
  if (-[TUAnswerRequest screeningDueToUserInteraction](self, "screeningDueToUserInteraction"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" screeningDueToUserInteraction=%d"), -[TUAnswerRequest screeningDueToUserInteraction](self, "screeningDueToUserInteraction"));
  if (-[TUAnswerRequest behavior](self, "behavior"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" behavior=%ld"), -[TUAnswerRequest behavior](self, "behavior"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v16 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUAnswerRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  TUAnswerRequest *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *sourceIdentifier;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  IDSDestination *endpointIDSDestination;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSString *endpointRapportMediaSystemIdentifier;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSString *endpointRapportEffectiveIdentifier;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  CGFloat v35;
  CGFloat v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSDate *dateAnswered;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_uniqueProxyIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TUAnswerRequest initWithUniqueProxyIdentifier:](self, "initWithUniqueProxyIdentifier:", v7);

  if (v8)
  {
    v9 = objc_opt_class();
    NSStringFromSelector(sel_sourceIdentifier);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    sourceIdentifier = v8->_sourceIdentifier;
    v8->_sourceIdentifier = (NSString *)v11;

    v13 = objc_opt_class();
    NSStringFromSelector(sel_endpointIDSDestination);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    endpointIDSDestination = v8->_endpointIDSDestination;
    v8->_endpointIDSDestination = (IDSDestination *)v15;

    v17 = objc_opt_class();
    NSStringFromSelector(sel_endpointRapportMediaSystemIdentifier);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    endpointRapportMediaSystemIdentifier = v8->_endpointRapportMediaSystemIdentifier;
    v8->_endpointRapportMediaSystemIdentifier = (NSString *)v19;

    v21 = objc_opt_class();
    NSStringFromSelector(sel_endpointRapportEffectiveIdentifier);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    endpointRapportEffectiveIdentifier = v8->_endpointRapportEffectiveIdentifier;
    v8->_endpointRapportEffectiveIdentifier = (NSString *)v23;

    NSStringFromSelector(sel_wantsHoldMusic);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_wantsHoldMusic = objc_msgSend(v4, "decodeBoolForKey:", v25);

    NSStringFromSelector(sel_sendToScreening);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_sendToScreening = objc_msgSend(v4, "decodeBoolForKey:", v26);

    NSStringFromSelector(sel_screeningDueToUserInteraction);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_screeningDueToUserInteraction = objc_msgSend(v4, "decodeBoolForKey:", v27);

    NSStringFromSelector(sel_pauseVideoToStart);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_pauseVideoToStart = objc_msgSend(v4, "decodeBoolForKey:", v28);

    NSStringFromSelector(sel_downgradeToAudio);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_downgradeToAudio = objc_msgSend(v4, "decodeBoolForKey:", v29);

    NSStringFromSelector(sel_behavior);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_behavior = objc_msgSend(v4, "decodeIntegerForKey:", v30);

    NSStringFromSelector(sel_localLandscapeAspectRatio);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeSizeForKey:", v31);
    v8->_localLandscapeAspectRatio.width = v32;
    v8->_localLandscapeAspectRatio.height = v33;

    NSStringFromSelector(sel_localPortraitAspectRatio);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeSizeForKey:", v34);
    v8->_localPortraitAspectRatio.width = v35;
    v8->_localPortraitAspectRatio.height = v36;

    v37 = objc_opt_class();
    NSStringFromSelector(sel_dateAnswered);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v37, v38);
    v39 = objc_claimAutoreleasedReturnValue();
    dateAnswered = v8->_dateAnswered;
    v8->_dateAnswered = (NSDate *)v39;

  }
  return v8;
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
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  int64_t v25;
  void *v26;
  double width;
  double height;
  void *v29;
  double v30;
  double v31;
  void *v32;
  NSDate *dateAnswered;
  id v34;

  v4 = a3;
  -[TUAnswerRequest uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_uniqueProxyIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUAnswerRequest sourceIdentifier](self, "sourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sourceIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUAnswerRequest endpointIDSDestination](self, "endpointIDSDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_endpointIDSDestination);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[TUAnswerRequest endpointRapportMediaSystemIdentifier](self, "endpointRapportMediaSystemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_endpointRapportMediaSystemIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUAnswerRequest endpointRapportEffectiveIdentifier](self, "endpointRapportEffectiveIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_endpointRapportEffectiveIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  v15 = -[TUAnswerRequest wantsHoldMusic](self, "wantsHoldMusic");
  NSStringFromSelector(sel_wantsHoldMusic);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

  v17 = -[TUAnswerRequest sendToScreening](self, "sendToScreening");
  NSStringFromSelector(sel_sendToScreening);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

  v19 = -[TUAnswerRequest screeningDueToUserInteraction](self, "screeningDueToUserInteraction");
  NSStringFromSelector(sel_screeningDueToUserInteraction);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v19, v20);

  v21 = -[TUAnswerRequest pauseVideoToStart](self, "pauseVideoToStart");
  NSStringFromSelector(sel_pauseVideoToStart);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v21, v22);

  v23 = -[TUAnswerRequest downgradeToAudio](self, "downgradeToAudio");
  NSStringFromSelector(sel_downgradeToAudio);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v23, v24);

  v25 = -[TUAnswerRequest behavior](self, "behavior");
  NSStringFromSelector(sel_behavior);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v25, v26);

  width = self->_localLandscapeAspectRatio.width;
  height = self->_localLandscapeAspectRatio.height;
  NSStringFromSelector(sel_localLandscapeAspectRatio);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeSize:forKey:", v29, width, height);

  v30 = self->_localPortraitAspectRatio.width;
  v31 = self->_localPortraitAspectRatio.height;
  NSStringFromSelector(sel_localPortraitAspectRatio);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeSize:forKey:", v32, v30, v31);

  dateAnswered = self->_dateAnswered;
  NSStringFromSelector(sel_dateAnswered);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", dateAnswered, v34);

}

- (NSString)uniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier;
}

- (void)setUniqueProxyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CGSize)localLandscapeAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_localLandscapeAspectRatio.width;
  height = self->_localLandscapeAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLocalLandscapeAspectRatio:(CGSize)a3
{
  self->_localLandscapeAspectRatio = a3;
}

- (CGSize)localPortraitAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_localPortraitAspectRatio.width;
  height = self->_localPortraitAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3
{
  self->_localPortraitAspectRatio = a3;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (IDSDestination)endpointIDSDestination
{
  return self->_endpointIDSDestination;
}

- (void)setEndpointIDSDestination:(id)a3
{
  objc_storeStrong((id *)&self->_endpointIDSDestination, a3);
}

- (NSString)endpointRapportMediaSystemIdentifier
{
  return self->_endpointRapportMediaSystemIdentifier;
}

- (void)setEndpointRapportMediaSystemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_endpointRapportMediaSystemIdentifier, a3);
}

- (NSString)endpointRapportEffectiveIdentifier
{
  return self->_endpointRapportEffectiveIdentifier;
}

- (void)setEndpointRapportEffectiveIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_endpointRapportEffectiveIdentifier, a3);
}

- (BOOL)wantsHoldMusic
{
  return self->_wantsHoldMusic;
}

- (void)setWantsHoldMusic:(BOOL)a3
{
  self->_wantsHoldMusic = a3;
}

- (BOOL)pauseVideoToStart
{
  return self->_pauseVideoToStart;
}

- (void)setPauseVideoToStart:(BOOL)a3
{
  self->_pauseVideoToStart = a3;
}

- (BOOL)downgradeToAudio
{
  return self->_downgradeToAudio;
}

- (void)setDowngradeToAudio:(BOOL)a3
{
  self->_downgradeToAudio = a3;
}

- (int64_t)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(int64_t)a3
{
  self->_behavior = a3;
}

- (BOOL)sendToScreening
{
  return self->_sendToScreening;
}

- (void)setSendToScreening:(BOOL)a3
{
  self->_sendToScreening = a3;
}

- (BOOL)screeningDueToUserInteraction
{
  return self->_screeningDueToUserInteraction;
}

- (void)setScreeningDueToUserInteraction:(BOOL)a3
{
  self->_screeningDueToUserInteraction = a3;
}

- (NSDate)dateAnswered
{
  return self->_dateAnswered;
}

- (void)setDateAnswered:(id)a3
{
  objc_storeStrong((id *)&self->_dateAnswered, a3);
}

- (BOOL)allowBluetoothAnswerWithoutDowngrade
{
  return self->_allowBluetoothAnswerWithoutDowngrade;
}

- (void)setAllowBluetoothAnswerWithoutDowngrade:(BOOL)a3
{
  self->_allowBluetoothAnswerWithoutDowngrade = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateAnswered, 0);
  objc_storeStrong((id *)&self->_endpointRapportEffectiveIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointRapportMediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_endpointIDSDestination, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueProxyIdentifier, 0);
}

@end
