@implementation ICMutablePlayActivityAudioQualityProperties

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ICPlayActivityAudioQualityProperties _copyWithClass:zone:](self, "_copyWithClass:zone:", objc_opt_class(), a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[ICPlayActivityAudioQualityProperties _copyWithClass:zone:](self, "_copyWithClass:zone:", objc_opt_class(), a3);
}

- (void)setBitRate:(int64_t)a3
{
  self->super._bitRate = a3;
}

- (void)setBitDepth:(int64_t)a3
{
  self->super._bitDepth = a3;
}

- (void)setChannelLayoutDescription:(id)a3
{
  objc_storeStrong((id *)&self->super._channelLayoutDescription, a3);
}

- (void)setCodec:(unsigned int)a3
{
  self->super._codec = a3;
}

- (void)setSampleRate:(int64_t)a3
{
  self->super._sampleRate = a3;
}

- (void)setSpatialized:(BOOL)a3
{
  self->super._spatialized = a3;
}

@end
