@implementation ICRadioTrackInfoContentReference

- (ICRadioTrackInfoContentReference)initWithStoreIdentifier:(id)a3 trackInfo:(id)a4
{
  id v6;
  ICRadioTrackInfoContentReference *v7;
  uint64_t v8;
  NSDictionary *trackInfo;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICRadioTrackInfoContentReference;
  v7 = -[ICRadioStoreContentReference initWithStoreIdentifier:](&v11, sel_initWithStoreIdentifier_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    trackInfo = v7->_trackInfo;
    v7->_trackInfo = (NSDictionary *)v8;

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICRadioStoreContentReference storeIdentifier](self, "storeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRadioTrackInfoContentReference trackInfo](self, "trackInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<ICRadioTrackInfoContentReference: %p adamID=%@> trackInfo=%@"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)rawContentDictionaryWithSubscriptionStatus:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICRadioTrackInfoContentReference;
  -[ICRadioStoreContentReference rawContentDictionaryWithSubscriptionStatus:](&v8, sel_rawContentDictionaryWithSubscriptionStatus_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_trackInfo, CFSTR("track-info"));
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICRadioTrackInfoContentReference;
  v5 = -[ICRadioStoreContentReference copyWithZone:](&v9, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSDictionary copyWithZone:](self->_trackInfo, "copyWithZone:", a3);
    v7 = (void *)v5[3];
    v5[3] = v6;

  }
  return v5;
}

- (ICRadioTrackInfoContentReference)initWithCoder:(id)a3
{
  id v4;
  ICRadioTrackInfoContentReference *v5;
  uint64_t v6;
  NSDictionary *trackInfo;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICRadioTrackInfoContentReference;
  v5 = -[ICRadioStoreContentReference initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("trackInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    trackInfo = v5->_trackInfo;
    v5->_trackInfo = (NSDictionary *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICRadioTrackInfoContentReference;
  v4 = a3;
  -[ICRadioStoreContentReference encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_trackInfo, CFSTR("trackInfo"), v5.receiver, v5.super_class);

}

- (NSDictionary)trackInfo
{
  return self->_trackInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackInfo, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
