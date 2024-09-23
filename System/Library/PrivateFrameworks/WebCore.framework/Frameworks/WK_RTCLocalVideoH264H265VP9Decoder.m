@implementation WK_RTCLocalVideoH264H265VP9Decoder

- (id)initH264DecoderWithCallback:(id)a3
{
  id v4;
  WK_RTCLocalVideoH264H265VP9Decoder *v5;
  WK_RTCVideoDecoderH264 *v6;
  WK_RTCVideoDecoderH264 *m_h264Decoder;
  WK_RTCVideoDecoderH264 *v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WK_RTCLocalVideoH264H265VP9Decoder;
  v5 = -[WK_RTCLocalVideoH264H265VP9Decoder init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(WK_RTCVideoDecoderH264);
    m_h264Decoder = v5->m_h264Decoder;
    v5->m_h264Decoder = v6;

    v8 = v5->m_h264Decoder;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __66__WK_RTCLocalVideoH264H265VP9Decoder_initH264DecoderWithCallback___block_invoke;
    v10[3] = &unk_24C0C55D8;
    v11 = v4;
    -[WK_RTCVideoDecoderH264 setCallback:](v8, "setCallback:", v10);

  }
  return v5;
}

- (id)initH265DecoderWithCallback:(id)a3
{
  id v4;
  WK_RTCLocalVideoH264H265VP9Decoder *v5;
  WK_RTCVideoDecoderH265 *v6;
  WK_RTCVideoDecoderH265 *m_h265Decoder;
  WK_RTCVideoDecoderH265 *v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WK_RTCLocalVideoH264H265VP9Decoder;
  v5 = -[WK_RTCLocalVideoH264H265VP9Decoder init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(WK_RTCVideoDecoderH265);
    m_h265Decoder = v5->m_h265Decoder;
    v5->m_h265Decoder = v6;

    v8 = v5->m_h265Decoder;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __66__WK_RTCLocalVideoH264H265VP9Decoder_initH265DecoderWithCallback___block_invoke;
    v10[3] = &unk_24C0C55D8;
    v11 = v4;
    -[WK_RTCVideoDecoderH265 setCallback:](v8, "setCallback:", v10);

  }
  return v5;
}

- (id)initVP9DecoderWithCallback:(id)a3
{
  id v4;
  WK_RTCLocalVideoH264H265VP9Decoder *v5;
  WK_RTCVideoDecoderVTBVP9 *v6;
  WK_RTCVideoDecoderVTBVP9 *m_vp9Decoder;
  WK_RTCVideoDecoderVTBVP9 *v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WK_RTCLocalVideoH264H265VP9Decoder;
  v5 = -[WK_RTCLocalVideoH264H265VP9Decoder init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(WK_RTCVideoDecoderVTBVP9);
    m_vp9Decoder = v5->m_vp9Decoder;
    v5->m_vp9Decoder = v6;

    v8 = v5->m_vp9Decoder;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __65__WK_RTCLocalVideoH264H265VP9Decoder_initVP9DecoderWithCallback___block_invoke;
    v10[3] = &unk_24C0C55D8;
    v11 = v4;
    -[WK_RTCVideoDecoderVTBVP9 setCallback:](v8, "setCallback:", v10);

  }
  return v5;
}

- (int64_t)setFormat:(const char *)a3 size:(unint64_t)a4 width:(unsigned __int16)a5 height:(unsigned __int16)a6
{
  int64_t result;

  if (self->m_h264Decoder)
    return -[WK_RTCVideoDecoderH264 setAVCFormat:size:width:height:](self->m_h264Decoder, "setAVCFormat:size:width:height:", a3, a4, a5, a6);
  result = (int64_t)self->m_h265Decoder;
  if (result)
    return objc_msgSend((id)result, "setHVCCFormat:size:width:height:", a3, a4, a5, a6);
  return result;
}

- (int64_t)decodeData:(const char *)a3 size:(unint64_t)a4 timeStamp:(int64_t)a5
{
  int64_t result;

  result = (int64_t)self->m_h264Decoder;
  if (result)
    return objc_msgSend((id)result, "decodeData:size:timeStamp:", a3, a4, a5);
  result = (int64_t)self->m_h265Decoder;
  if (result)
    return objc_msgSend((id)result, "decodeData:size:timeStamp:", a3, a4, a5);
  result = (int64_t)self->m_vp9Decoder;
  if (result)
    return objc_msgSend((id)result, "decodeData:size:timeStamp:", a3, a4, a5);
  return result;
}

- (void)setWidth:(unsigned __int16)a3 height:(unsigned __int16)a4
{
  WK_RTCVideoDecoderVTBVP9 *m_vp9Decoder;

  m_vp9Decoder = self->m_vp9Decoder;
  if (m_vp9Decoder)
    -[WK_RTCVideoDecoderVTBVP9 setWidth:height:](m_vp9Decoder, "setWidth:height:", a3, a4);
}

- (int64_t)releaseDecoder
{
  WK_RTCVideoDecoderVTBVP9 *m_h264Decoder;
  WK_RTCVideoDecoderVTBVP9 *m_vp9Decoder;

  m_h264Decoder = (WK_RTCVideoDecoderVTBVP9 *)self->m_h264Decoder;
  if (m_h264Decoder || (m_h264Decoder = (WK_RTCVideoDecoderVTBVP9 *)self->m_h265Decoder) != 0)
    m_vp9Decoder = m_h264Decoder;
  else
    m_vp9Decoder = self->m_vp9Decoder;
  return -[WK_RTCVideoDecoderVTBVP9 releaseDecoder](m_vp9Decoder, "releaseDecoder");
}

- (void)flush
{
  WK_RTCVideoDecoderVTBVP9 *m_h264Decoder;
  WK_RTCVideoDecoderVTBVP9 *m_vp9Decoder;

  m_h264Decoder = (WK_RTCVideoDecoderVTBVP9 *)self->m_h264Decoder;
  if (m_h264Decoder || (m_h264Decoder = (WK_RTCVideoDecoderVTBVP9 *)self->m_h265Decoder) != 0)
    m_vp9Decoder = m_h264Decoder;
  else
    m_vp9Decoder = self->m_vp9Decoder;
  -[WK_RTCVideoDecoderVTBVP9 flush](m_vp9Decoder, "flush");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_vp9Decoder, 0);
  objc_storeStrong((id *)&self->m_h265Decoder, 0);
  objc_storeStrong((id *)&self->m_h264Decoder, 0);
}

@end
