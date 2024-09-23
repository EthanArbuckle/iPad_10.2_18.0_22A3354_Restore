@implementation WK_RTCLocalVideoH264H265Encoder

- (WK_RTCLocalVideoH264H265Encoder)initWithCodecInfo:(id)a3 scalabilityMode:(unsigned __int8)a4
{
  int v4;
  id v6;
  WK_RTCLocalVideoH264H265Encoder *v7;
  void *v8;
  int v9;
  WK_RTCVideoEncoderH265 *v10;
  WK_RTCVideoEncoderH265 *m_h265Encoder;
  WK_RTCVideoEncoderH264 *v12;
  WK_RTCVideoEncoderH264 *m_h264Encoder;
  WK_RTCLocalVideoH264H265Encoder *v14;
  objc_super v16;

  v4 = a4;
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WK_RTCLocalVideoH264H265Encoder;
  v7 = -[WK_RTCLocalVideoH264H265Encoder init](&v16, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("H265"));

    if (v9)
    {
      v10 = -[WK_RTCVideoEncoderH265 initWithCodecInfo:]([WK_RTCVideoEncoderH265 alloc], "initWithCodecInfo:", v6);
      m_h265Encoder = v7->m_h265Encoder;
      v7->m_h265Encoder = v10;

    }
    else
    {
      v12 = -[WK_RTCVideoEncoderH264 initWithCodecInfo:]([WK_RTCVideoEncoderH264 alloc], "initWithCodecInfo:", v6);
      m_h264Encoder = v7->m_h264Encoder;
      v7->m_h264Encoder = v12;

      if (v4 == 1)
        -[WK_RTCVideoEncoderH264 enableL1T2ScalabilityMode](v7->m_h264Encoder, "enableL1T2ScalabilityMode");
      if (!v7->m_h264Encoder)
      {
        v14 = 0;
        goto LABEL_8;
      }
    }
  }
  v14 = v7;
LABEL_8:

  return v14;
}

- (int)codecType
{
  if (self->m_h264Encoder)
    return 4;
  else
    return 5;
}

- (void)setCallback:(id)a3
{
  id v4;
  WK_RTCVideoEncoderH264 *m_h264Encoder;
  id v6;

  v4 = a3;
  m_h264Encoder = self->m_h264Encoder;
  v6 = v4;
  if (m_h264Encoder)
    -[WK_RTCVideoEncoderH264 setCallback:](m_h264Encoder, "setCallback:", v4);
  else
    -[WK_RTCVideoEncoderH265 setCallback:](self->m_h265Encoder, "setCallback:", v4);

}

- (int64_t)releaseEncoder
{
  void *m_h264Encoder;

  m_h264Encoder = self->m_h264Encoder;
  if (!m_h264Encoder)
    m_h264Encoder = self->m_h265Encoder;
  return objc_msgSend(m_h264Encoder, "releaseEncoder");
}

- (int64_t)startEncodeWithSettings:(id)a3 numberOfCores:(int)a4
{
  uint64_t v4;
  id v6;
  WK_RTCVideoEncoderH264 *m_h264Encoder;
  uint64_t v8;
  int64_t v9;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  m_h264Encoder = self->m_h264Encoder;
  if (m_h264Encoder)
    v8 = -[WK_RTCVideoEncoderH264 startEncodeWithSettings:numberOfCores:](m_h264Encoder, "startEncodeWithSettings:numberOfCores:", v6, v4);
  else
    v8 = -[WK_RTCVideoEncoderH265 startEncodeWithSettings:numberOfCores:](self->m_h265Encoder, "startEncodeWithSettings:numberOfCores:", v6, v4);
  v9 = v8;

  return v9;
}

- (int64_t)encode:(id)a3 codecSpecificInfo:(id)a4 frameTypes:(id)a5
{
  id v8;
  id v9;
  id v10;
  WK_RTCVideoEncoderH264 *m_h264Encoder;
  uint64_t v12;
  int64_t v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  m_h264Encoder = self->m_h264Encoder;
  if (m_h264Encoder)
    v12 = -[WK_RTCVideoEncoderH264 encode:codecSpecificInfo:frameTypes:](m_h264Encoder, "encode:codecSpecificInfo:frameTypes:", v8, v9, v10);
  else
    v12 = -[WK_RTCVideoEncoderH265 encode:codecSpecificInfo:frameTypes:](self->m_h265Encoder, "encode:codecSpecificInfo:frameTypes:", v8, v9, v10);
  v13 = v12;

  return v13;
}

- (int)setBitrate:(unsigned int)a3 framerate:(unsigned int)a4
{
  void *m_h264Encoder;

  m_h264Encoder = self->m_h264Encoder;
  if (!m_h264Encoder)
    m_h264Encoder = self->m_h265Encoder;
  return objc_msgSend(m_h264Encoder, "setBitrate:framerate:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (void)setLowLatency:(BOOL)a3
{
  _BOOL8 v3;
  WK_RTCVideoEncoderH264 *m_h264Encoder;

  v3 = a3;
  m_h264Encoder = self->m_h264Encoder;
  if (m_h264Encoder)
    -[WK_RTCVideoEncoderH264 setH264LowLatencyEncoderEnabled:](m_h264Encoder, "setH264LowLatencyEncoderEnabled:", a3);
  -[WK_RTCVideoEncoderH265 setLowLatency:](self->m_h265Encoder, "setLowLatency:", v3);
}

- (void)setUseAnnexB:(BOOL)a3
{
  void *m_h264Encoder;

  if (self->m_h264Encoder)
    m_h264Encoder = self->m_h264Encoder;
  else
    m_h264Encoder = self->m_h265Encoder;
  objc_msgSend(m_h264Encoder, "setUseAnnexB:", a3);
}

- (void)setDescriptionCallback:(id)a3
{
  id v4;
  WK_RTCVideoEncoderH264 *m_h264Encoder;
  id v6;

  v4 = a3;
  m_h264Encoder = self->m_h264Encoder;
  v6 = v4;
  if (m_h264Encoder)
    -[WK_RTCVideoEncoderH264 setDescriptionCallback:](m_h264Encoder, "setDescriptionCallback:", v4);
  else
    -[WK_RTCVideoEncoderH265 setDescriptionCallback:](self->m_h265Encoder, "setDescriptionCallback:", v4);

}

- (void)setErrorCallback:(id)a3
{
  id v4;
  WK_RTCVideoEncoderH264 *m_h264Encoder;
  id v6;

  v4 = a3;
  m_h264Encoder = self->m_h264Encoder;
  v6 = v4;
  if (m_h264Encoder)
    -[WK_RTCVideoEncoderH264 setErrorCallback:](m_h264Encoder, "setErrorCallback:", v4);
  else
    -[WK_RTCVideoEncoderH265 setErrorCallback:](self->m_h265Encoder, "setErrorCallback:", v4);

}

- (void)flush
{
  void *m_h264Encoder;

  m_h264Encoder = self->m_h264Encoder;
  if (!m_h264Encoder)
    m_h264Encoder = self->m_h265Encoder;
  objc_msgSend(m_h264Encoder, "flush");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_h265Encoder, 0);
  objc_storeStrong((id *)&self->m_h264Encoder, 0);
}

@end
