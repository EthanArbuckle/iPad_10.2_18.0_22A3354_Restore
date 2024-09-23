@implementation STMutableVoiceControlStatusDomainData

- (void)setVoiceControlActive:(BOOL)a3
{
  if (self->super._voiceControlActive != a3)
    self->super._voiceControlActive = a3;
}

- (void)setListeningState:(unint64_t)a3
{
  if (self->super._listeningState != a3)
    self->super._listeningState = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[STVoiceControlStatusDomainData initWithData:](+[STVoiceControlStatusDomainData allocWithZone:](STVoiceControlStatusDomainData, "allocWithZone:", a3), self);
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
