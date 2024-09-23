@implementation ICPlayActivityAudioQualityProperties

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unsigned int codec;
  unsigned int v8;
  void *v9;
  const __CFString *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_bitRate)
    objc_msgSend(v6, "appendFormat:", CFSTR(" bitRate: %zd"), self->_bitRate);
  if (self->_bitDepth)
    objc_msgSend(v6, "appendFormat:", CFSTR(" bitDepth: %zd"), self->_bitDepth);
  if (self->_channelLayoutDescription)
    objc_msgSend(v6, "appendFormat:", CFSTR("channels: %@"), self->_channelLayoutDescription);
  codec = self->_codec;
  if (codec)
  {
    v8 = bswap32(codec);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), v8, BYTE1(v8), BYTE2(v8), HIBYTE(v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("codec: %@"), v9);

  }
  if (self->_sampleRate)
    objc_msgSend(v6, "appendFormat:", CFSTR(" sampleRate: %zd"), self->_sampleRate);
  if (self->_spatialized)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(" spatialized: %@"), v10);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (NSString)codecString
{
  unsigned int v2;

  v2 = bswap32(self->_codec);
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), v2, BYTE1(v2), BYTE2(v2), HIBYTE(v2));
}

- (void)encodeWithCoder:(id)a3
{
  int64_t bitRate;
  id v5;

  bitRate = self->_bitRate;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", bitRate, CFSTR("bitRate"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_bitDepth, CFSTR("bitDepth"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_channelLayoutDescription, CFSTR("channelLayoutDescription"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_codec, CFSTR("codec"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_sampleRate, CFSTR("sampleRate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_spatialized, CFSTR("spatialized"));

}

- (ICPlayActivityAudioQualityProperties)initWithCoder:(id)a3
{
  id v4;
  ICPlayActivityAudioQualityProperties *v5;
  uint64_t v6;
  NSString *channelLayoutDescription;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICPlayActivityAudioQualityProperties;
  v5 = -[ICPlayActivityAudioQualityProperties init](&v9, sel_init);
  if (v5)
  {
    v5->_bitRate = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bitRate"));
    v5->_bitDepth = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("bitDepth"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("channelLayoutDescription"));
    v6 = objc_claimAutoreleasedReturnValue();
    channelLayoutDescription = v5->_channelLayoutDescription;
    v5->_channelLayoutDescription = (NSString *)v6;

    v5->_codec = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("codec"));
    v5->_sampleRate = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sampleRate"));
    v5->_spatialized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("spatialized"));
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[ICPlayActivityAudioQualityProperties _copyWithClass:zone:](self, "_copyWithClass:zone:", objc_opt_class(), a3);
}

- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4
{
  objc_class *v5;
  objc_class *v6;

  v5 = -[objc_class init](-[objc_class allocWithZone:](a3, "allocWithZone:", a4), "init");
  v6 = v5;
  if (v5)
  {
    *((_QWORD *)v5 + 1) = self->_bitRate;
    *((_QWORD *)v5 + 2) = self->_bitDepth;
    objc_storeStrong((id *)v5 + 3, self->_channelLayoutDescription);
    *((_DWORD *)v6 + 8) = self->_codec;
    *((_QWORD *)v6 + 5) = self->_sampleRate;
    *((_BYTE *)v6 + 48) = self->_spatialized;
  }
  return v6;
}

- (int64_t)bitRate
{
  return self->_bitRate;
}

- (int64_t)bitDepth
{
  return self->_bitDepth;
}

- (NSString)channelLayoutDescription
{
  return self->_channelLayoutDescription;
}

- (unsigned)codec
{
  return self->_codec;
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (BOOL)isSpatialized
{
  return self->_spatialized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelLayoutDescription, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
