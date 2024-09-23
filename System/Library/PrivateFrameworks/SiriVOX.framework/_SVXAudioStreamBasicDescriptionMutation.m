@implementation _SVXAudioStreamBasicDescriptionMutation

- (_SVXAudioStreamBasicDescriptionMutation)init
{
  return -[_SVXAudioStreamBasicDescriptionMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXAudioStreamBasicDescriptionMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXAudioStreamBasicDescriptionMutation *v6;
  _SVXAudioStreamBasicDescriptionMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXAudioStreamBasicDescriptionMutation;
  v6 = -[_SVXAudioStreamBasicDescriptionMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setSampleRate:(double)a3
{
  self->_sampleRate = a3;
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (void)setFormatID:(unsigned int)a3
{
  self->_formatID = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (void)setFormatFlags:(unsigned int)a3
{
  self->_formatFlags = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (void)setBytesPerPacket:(unsigned int)a3
{
  self->_bytesPerPacket = a3;
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (void)setFramesPerPacket:(unsigned int)a3
{
  self->_framesPerPacket = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (void)setBytesPerFrame:(unsigned int)a3
{
  self->_bytesPerFrame = a3;
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (void)setChannelsPerFrame:(unsigned int)a3
{
  self->_channelsPerFrame = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (void)setBitsPerChannel:(unsigned int)a3
{
  self->_bitsPerChannel = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (void)setReserved:(unsigned int)a3
{
  self->_reserved = a3;
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)generate
{
  SVXAudioStreamBasicDescription *baseModel;
  __int16 mutationFlags;
  SVXAudioStreamBasicDescription *v5;
  double v6;
  double sampleRate;
  uint64_t formatID;
  uint64_t formatFlags;
  uint64_t bytesPerPacket;
  uint64_t framesPerPacket;
  uint64_t bytesPerFrame;
  uint64_t channelsPerFrame;
  unsigned int bitsPerChannel;
  unsigned int reserved;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v5 = -[SVXAudioStreamBasicDescription initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:]([SVXAudioStreamBasicDescription alloc], "initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:", self->_formatID, self->_formatFlags, self->_bytesPerPacket, self->_framesPerPacket, self->_bytesPerFrame, self->_channelsPerFrame, self->_sampleRate, *(_QWORD *)&self->_bitsPerChannel);
    return v5;
  }
  mutationFlags = (__int16)self->_mutationFlags;
  if ((mutationFlags & 1) != 0)
  {
    if ((mutationFlags & 2) != 0)
    {
      sampleRate = self->_sampleRate;
      if ((mutationFlags & 4) != 0)
      {
LABEL_7:
        formatID = self->_formatID;
        if ((mutationFlags & 8) != 0)
          goto LABEL_8;
        goto LABEL_17;
      }
    }
    else
    {
      -[SVXAudioStreamBasicDescription sampleRate](baseModel, "sampleRate");
      sampleRate = v6;
      mutationFlags = (__int16)self->_mutationFlags;
      if ((mutationFlags & 4) != 0)
        goto LABEL_7;
    }
    formatID = -[SVXAudioStreamBasicDescription formatID](self->_baseModel, "formatID");
    mutationFlags = (__int16)self->_mutationFlags;
    if ((mutationFlags & 8) != 0)
    {
LABEL_8:
      formatFlags = self->_formatFlags;
      if ((mutationFlags & 0x10) != 0)
        goto LABEL_9;
      goto LABEL_18;
    }
LABEL_17:
    formatFlags = -[SVXAudioStreamBasicDescription formatFlags](self->_baseModel, "formatFlags");
    mutationFlags = (__int16)self->_mutationFlags;
    if ((mutationFlags & 0x10) != 0)
    {
LABEL_9:
      bytesPerPacket = self->_bytesPerPacket;
      if ((mutationFlags & 0x20) != 0)
        goto LABEL_10;
      goto LABEL_19;
    }
LABEL_18:
    bytesPerPacket = -[SVXAudioStreamBasicDescription bytesPerPacket](self->_baseModel, "bytesPerPacket");
    mutationFlags = (__int16)self->_mutationFlags;
    if ((mutationFlags & 0x20) != 0)
    {
LABEL_10:
      framesPerPacket = self->_framesPerPacket;
      if ((mutationFlags & 0x40) != 0)
        goto LABEL_11;
      goto LABEL_20;
    }
LABEL_19:
    framesPerPacket = -[SVXAudioStreamBasicDescription framesPerPacket](self->_baseModel, "framesPerPacket");
    mutationFlags = (__int16)self->_mutationFlags;
    if ((mutationFlags & 0x40) != 0)
    {
LABEL_11:
      bytesPerFrame = self->_bytesPerFrame;
      if ((mutationFlags & 0x80) != 0)
        goto LABEL_12;
      goto LABEL_21;
    }
LABEL_20:
    bytesPerFrame = -[SVXAudioStreamBasicDescription bytesPerFrame](self->_baseModel, "bytesPerFrame");
    mutationFlags = (__int16)self->_mutationFlags;
    if ((mutationFlags & 0x80) != 0)
    {
LABEL_12:
      channelsPerFrame = self->_channelsPerFrame;
      if ((mutationFlags & 0x100) != 0)
        goto LABEL_13;
      goto LABEL_22;
    }
LABEL_21:
    channelsPerFrame = -[SVXAudioStreamBasicDescription channelsPerFrame](self->_baseModel, "channelsPerFrame");
    mutationFlags = (__int16)self->_mutationFlags;
    if ((mutationFlags & 0x100) != 0)
    {
LABEL_13:
      bitsPerChannel = self->_bitsPerChannel;
      if ((mutationFlags & 0x200) != 0)
      {
LABEL_14:
        reserved = self->_reserved;
LABEL_24:
        v5 = -[SVXAudioStreamBasicDescription initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:]([SVXAudioStreamBasicDescription alloc], "initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:", formatID, formatFlags, bytesPerPacket, framesPerPacket, bytesPerFrame, channelsPerFrame, sampleRate, __PAIR64__(reserved, bitsPerChannel));
        return v5;
      }
LABEL_23:
      reserved = -[SVXAudioStreamBasicDescription reserved](self->_baseModel, "reserved");
      goto LABEL_24;
    }
LABEL_22:
    bitsPerChannel = -[SVXAudioStreamBasicDescription bitsPerChannel](self->_baseModel, "bitsPerChannel");
    if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
      goto LABEL_14;
    goto LABEL_23;
  }
  v5 = (SVXAudioStreamBasicDescription *)-[SVXAudioStreamBasicDescription copy](baseModel, "copy");
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
