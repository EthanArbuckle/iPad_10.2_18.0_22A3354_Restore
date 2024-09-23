@implementation WK_RTCCodecSpecificInfoH264

- (CodecSpecificInfo)nativeCodecSpecificInfo
{
  CodecSpecificInfo *result;

  retstr->var2 = 1;
  retstr->var3.var0.var0 = 0;
  retstr->var4.var0.var0 = 0;
  LOBYTE(retstr->var4.var0.var1.var2) = 0;
  LOBYTE(retstr[1].var0) = 0;
  *(_WORD *)&retstr[1].var1.var0.var0 = 0;
  bzero(&retstr->var1, 0x658uLL);
  retstr->var0 = 4;
  retstr->var1.var2.var0 = self->_packetizationMode;
  return result;
}

- (unint64_t)packetizationMode
{
  return self->_packetizationMode;
}

- (void)setPacketizationMode:(unint64_t)a3
{
  self->_packetizationMode = a3;
}

@end
