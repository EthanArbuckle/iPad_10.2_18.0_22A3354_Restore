@implementation WK_RTCDefaultVideoDecoderFactory

- (WK_RTCDefaultVideoDecoderFactory)initWithH265:(BOOL)a3 vp9Profile0:(BOOL)a4 vp9Profile2:(BOOL)a5 vp9VTB:(BOOL)a6 av1:(BOOL)a7
{
  WK_RTCDefaultVideoDecoderFactory *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WK_RTCDefaultVideoDecoderFactory;
  result = -[WK_RTCDefaultVideoDecoderFactory init](&v13, sel_init);
  if (result)
  {
    result->_supportsH265 = a3;
    result->_supportsVP9Profile0 = a4;
    result->_supportsVP9Profile2 = a5;
    result->_supportsVP9VTB = (a4 || a5) && a6;
    result->_supportsAv1 = a7;
  }
  return result;
}

- (id)supportedCodecs
{
  void *v2;
  WK_RTCVideoCodecInfo *v3;
  void *v4;
  WK_RTCVideoCodecInfo *v5;
  WK_RTCVideoCodecInfo *v6;
  void *v7;
  WK_RTCVideoCodecInfo *v8;
  WK_RTCVideoCodecInfo *v9;
  void *v10;
  WK_RTCVideoCodecInfo *v11;
  WK_RTCVideoCodecInfo *v12;
  void *v13;
  WK_RTCVideoCodecInfo *v14;
  WK_RTCVideoCodecInfo *v15;
  WK_RTCVideoCodecInfo *v16;
  WK_RTCVideoCodecInfo *v17;
  WK_RTCVideoCodecInfo *v18;
  WK_RTCVideoCodecInfo *v19;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[5];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
  v3 = [WK_RTCVideoCodecInfo alloc];
  v28[0] = CFSTR("profile-level-id");
  v28[1] = CFSTR("level-asymmetry-allowed");
  v29[0] = CFSTR("640c1f");
  v29[1] = CFSTR("1");
  v28[2] = CFSTR("packetization-mode");
  v29[2] = CFSTR("1");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WK_RTCVideoCodecInfo initWithName:parameters:](v3, "initWithName:parameters:", CFSTR("H264"), v4);
  objc_msgSend(v2, "addObject:", v5);

  v6 = [WK_RTCVideoCodecInfo alloc];
  v26[0] = CFSTR("profile-level-id");
  v26[1] = CFSTR("level-asymmetry-allowed");
  v27[0] = CFSTR("42e01f");
  v27[1] = CFSTR("1");
  v26[2] = CFSTR("packetization-mode");
  v27[2] = CFSTR("1");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WK_RTCVideoCodecInfo initWithName:parameters:](v6, "initWithName:parameters:", CFSTR("H264"), v7);
  objc_msgSend(v2, "addObject:", v8);

  v9 = [WK_RTCVideoCodecInfo alloc];
  v24[0] = CFSTR("profile-level-id");
  v24[1] = CFSTR("level-asymmetry-allowed");
  v25[0] = CFSTR("640c1f");
  v25[1] = CFSTR("1");
  v24[2] = CFSTR("packetization-mode");
  v25[2] = CFSTR("0");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WK_RTCVideoCodecInfo initWithName:parameters:](v9, "initWithName:parameters:", CFSTR("H264"), v10);
  objc_msgSend(v2, "addObject:", v11);

  v12 = [WK_RTCVideoCodecInfo alloc];
  v22[0] = CFSTR("profile-level-id");
  v22[1] = CFSTR("level-asymmetry-allowed");
  v23[0] = CFSTR("42e01f");
  v23[1] = CFSTR("1");
  v22[2] = CFSTR("packetization-mode");
  v23[2] = CFSTR("0");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WK_RTCVideoCodecInfo initWithName:parameters:](v12, "initWithName:parameters:", CFSTR("H264"), v13);
  objc_msgSend(v2, "addObject:", v14);

  if (self->_supportsH265)
  {
    v15 = -[WK_RTCVideoCodecInfo initWithName:]([WK_RTCVideoCodecInfo alloc], "initWithName:", CFSTR("H265"));
    objc_msgSend(v2, "addObject:", v15);

  }
  v16 = -[WK_RTCVideoCodecInfo initWithName:]([WK_RTCVideoCodecInfo alloc], "initWithName:", CFSTR("VP8"));
  objc_msgSend(v2, "addObject:", v16);
  if (self->_supportsVP9Profile0)
  {
    v17 = -[WK_RTCVideoCodecInfo initWithName:parameters:]([WK_RTCVideoCodecInfo alloc], "initWithName:parameters:", CFSTR("VP9"), &unk_24C0E7020);
    objc_msgSend(v2, "addObject:", v17);

  }
  if (self->_supportsVP9Profile2)
  {
    v18 = -[WK_RTCVideoCodecInfo initWithName:parameters:]([WK_RTCVideoCodecInfo alloc], "initWithName:parameters:", CFSTR("VP9"), &unk_24C0E7048);
    objc_msgSend(v2, "addObject:", v18);

  }
  if (self->_supportsAv1)
  {
    v19 = -[WK_RTCVideoCodecInfo initWithName:]([WK_RTCVideoCodecInfo alloc], "initWithName:", CFSTR("AV1"));
    objc_msgSend(v2, "addObject:", v19);

  }
  return v2;
}

- (id)createDecoder:(id)a3
{
  id v4;
  void *v5;
  int v6;
  WK_RTCVideoDecoderH264 *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  WK_RTCVideoDecoderH264 *v16;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("H264"));

  if (v6)
  {
    v7 = objc_alloc_init(WK_RTCVideoDecoderH264);
LABEL_15:
    v16 = v7;

    return v16;
  }
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("VP8"));

  if (v9)
  {
    +[WK_RTCVideoDecoderVP8 vp8Decoder](WK_RTCVideoDecoderVP8, "vp8Decoder");
    v7 = (WK_RTCVideoDecoderH264 *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("H265"));

  if (v11)
  {
    v7 = objc_alloc_init(WK_RTCVideoDecoderH265);
    goto LABEL_15;
  }
  objc_msgSend(v4, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("VP9"));

  if (v13)
  {
    if (self->_supportsVP9VTB)
    {
      v7 = objc_alloc_init(WK_RTCVideoDecoderVTBVP9);
    }
    else
    {
      +[WK_RTCVideoDecoderVP9 vp9Decoder](WK_RTCVideoDecoderVP9, "vp9Decoder");
      v7 = (WK_RTCVideoDecoderH264 *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_15;
  }
  objc_msgSend(v4, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("AV1"));

  if (v15)
  {
    +[WK_RTCVideoDecoderAV1 av1Decoder](WK_RTCVideoDecoderAV1, "av1Decoder");
    v7 = (WK_RTCVideoDecoderH264 *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }

  return 0;
}

@end
