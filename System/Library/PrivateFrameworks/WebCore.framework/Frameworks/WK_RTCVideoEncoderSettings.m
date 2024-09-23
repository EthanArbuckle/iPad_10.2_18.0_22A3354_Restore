@implementation WK_RTCVideoEncoderSettings

- (WK_RTCVideoEncoderSettings)initWithNativeVideoCodec:(const void *)a3
{
  WK_RTCVideoEncoderSettings *v4;
  WK_RTCVideoEncoderSettings *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WK_RTCVideoEncoderSettings;
  v4 = -[WK_RTCVideoEncoderSettings init](&v9, sel_init);
  v5 = v4;
  if (a3 && v4)
  {
    v6 = *(int *)a3;
    if (v6 >= 6)
      rtc::webrtc_checks_impl::UnreachableCodeReached((rtc::webrtc_checks_impl *)v4);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", (&off_24C0BC8B0)[v6]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WK_RTCVideoEncoderSettings setName:](v5, "setName:", v7);

    -[WK_RTCVideoEncoderSettings setWidth:](v5, "setWidth:", *((unsigned __int16 *)a3 + 2));
    -[WK_RTCVideoEncoderSettings setHeight:](v5, "setHeight:", *((unsigned __int16 *)a3 + 3));
    -[WK_RTCVideoEncoderSettings setStartBitrate:](v5, "setStartBitrate:", *((unsigned int *)a3 + 2));
    -[WK_RTCVideoEncoderSettings setMaxBitrate:](v5, "setMaxBitrate:", *((unsigned int *)a3 + 3));
    -[WK_RTCVideoEncoderSettings setMinBitrate:](v5, "setMinBitrate:", *((unsigned int *)a3 + 4));
    -[WK_RTCVideoEncoderSettings setMaxFramerate:](v5, "setMaxFramerate:", *((unsigned int *)a3 + 5));
    -[WK_RTCVideoEncoderSettings setQpMax:](v5, "setQpMax:", *((unsigned int *)a3 + 7));
    -[WK_RTCVideoEncoderSettings setMode:](v5, "setMode:", *((int *)a3 + 81));
  }
  return v5;
}

- (VideoCodec)nativeVideoCodec
{
  VideoCodec *result;

  *(_QWORD *)&retstr->var0 = 0;
  *(_QWORD *)&retstr->var3 = 0;
  *(_QWORD *)&retstr->var5 = 0;
  retstr->var7 = 1;
  retstr->var8 = 0;
  retstr->var9 = 0;
  *(_OWORD *)&retstr->var10[0].var0 = 0u;
  *(_OWORD *)&retstr->var10[0].var4 = 0u;
  *(_OWORD *)&retstr->var10[0].var8 = 0u;
  *(_OWORD *)&retstr->var10[1].var3 = 0u;
  *(_OWORD *)&retstr->var10[1].var7 = 0u;
  *(_OWORD *)&retstr->var10[2].var2 = 0u;
  *(_OWORD *)&retstr->var10[2].var5 = 0u;
  retstr->var10[0].var3 = 1;
  *(_QWORD *)&retstr->var10[0].var6 = 0;
  *(_QWORD *)&retstr->var10[0].var4 = 0;
  retstr->var10[0].var8 = 0;
  retstr->var10[1].var3 = 1;
  retstr->var10[1].var8 = 0;
  *(_QWORD *)&retstr->var10[1].var4 = 0;
  *(_QWORD *)&retstr->var10[1].var6 = 0;
  retstr->var10[2].var3 = 1;
  *(_QWORD *)&retstr->var10[2].var6 = 0;
  *(_QWORD *)&retstr->var10[2].var4 = 0;
  *(_OWORD *)&retstr->var11[0].var0 = 0u;
  retstr->var10[2].var8 = 0;
  *(_OWORD *)&retstr->var11[4].var0 = 0u;
  *(_OWORD *)&retstr->var11[4].var4 = 0u;
  *(_OWORD *)&retstr->var11[3].var1 = 0u;
  *(_OWORD *)&retstr->var11[3].var5 = 0u;
  *(_OWORD *)&retstr->var11[2].var2 = 0u;
  *(_OWORD *)&retstr->var11[2].var6 = 0u;
  *(_OWORD *)&retstr->var11[1].var3 = 0u;
  *(_OWORD *)&retstr->var11[1].var7 = 0u;
  *(_OWORD *)&retstr->var11[0].var4 = 0u;
  *(_OWORD *)&retstr->var11[0].var8 = 0u;
  retstr->var11[0].var3 = 1;
  *(_QWORD *)&retstr->var11[0].var4 = 0;
  *(_QWORD *)&retstr->var11[0].var6 = 0;
  retstr->var11[0].var8 = 0;
  retstr->var11[1].var3 = 1;
  *(_QWORD *)&retstr->var11[1].var6 = 0;
  *(_QWORD *)&retstr->var11[1].var4 = 0;
  retstr->var11[1].var8 = 0;
  retstr->var11[2].var3 = 1;
  *(_QWORD *)&retstr->var11[2].var4 = 0;
  *(_QWORD *)&retstr->var11[2].var6 = 0;
  retstr->var11[2].var8 = 0;
  retstr->var11[3].var3 = 1;
  *(_QWORD *)&retstr->var11[3].var6 = 0;
  *(_QWORD *)&retstr->var11[3].var4 = 0;
  retstr->var11[3].var8 = 0;
  retstr->var11[4].var3 = 1;
  *(_QWORD *)&retstr->var11[4].var4 = 0;
  *(_QWORD *)&retstr->var11[4].var6 = 0;
  *(_QWORD *)&retstr->var11[4].var8 = 0;
  retstr->var11[4].var8 = 0;
  retstr->var13 = 0;
  retstr->var14.var0 = 0;
  retstr->var14.var1 = 0;
  retstr->var15 = 0;
  retstr->var18 = 0;
  retstr->var19 = 0;
  retstr->var16 = 0uLL;
  retstr->var17 = 0;
  retstr->var1 = -[WK_RTCVideoEncoderSettings width](self, "width");
  retstr->var2 = -[WK_RTCVideoEncoderSettings height](self, "height");
  retstr->var3 = -[WK_RTCVideoEncoderSettings startBitrate](self, "startBitrate");
  retstr->var4 = -[WK_RTCVideoEncoderSettings maxBitrate](self, "maxBitrate");
  retstr->var5 = -[WK_RTCVideoEncoderSettings minBitrate](self, "minBitrate");
  retstr->var4 = -[WK_RTCVideoEncoderSettings maxBitrate](self, "maxBitrate");
  retstr->var8 = -[WK_RTCVideoEncoderSettings qpMax](self, "qpMax");
  result = -[WK_RTCVideoEncoderSettings mode](self, "mode");
  retstr->var12 = (int)result;
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned __int16)a3
{
  self->_width = a3;
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHeight:(unsigned __int16)a3
{
  self->_height = a3;
}

- (unsigned)startBitrate
{
  return self->_startBitrate;
}

- (void)setStartBitrate:(unsigned int)a3
{
  self->_startBitrate = a3;
}

- (unsigned)maxBitrate
{
  return self->_maxBitrate;
}

- (void)setMaxBitrate:(unsigned int)a3
{
  self->_maxBitrate = a3;
}

- (unsigned)minBitrate
{
  return self->_minBitrate;
}

- (void)setMinBitrate:(unsigned int)a3
{
  self->_minBitrate = a3;
}

- (unsigned)maxFramerate
{
  return self->_maxFramerate;
}

- (void)setMaxFramerate:(unsigned int)a3
{
  self->_maxFramerate = a3;
}

- (unsigned)qpMax
{
  return self->_qpMax;
}

- (void)setQpMax:(unsigned int)a3
{
  self->_qpMax = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
