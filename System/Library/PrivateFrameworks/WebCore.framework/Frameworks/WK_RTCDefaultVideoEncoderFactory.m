@implementation WK_RTCDefaultVideoEncoderFactory

- (WK_RTCDefaultVideoEncoderFactory)initWithH265:(BOOL)a3 vp9Profile0:(BOOL)a4 vp9Profile2:(BOOL)a5 lowLatencyH264:(BOOL)a6 av1:(BOOL)a7
{
  WK_RTCDefaultVideoEncoderFactory *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WK_RTCDefaultVideoEncoderFactory;
  result = -[WK_RTCDefaultVideoEncoderFactory init](&v13, sel_init);
  if (result)
  {
    result->_supportsH265 = a3;
    result->_supportsVP9Profile0 = a4;
    result->_supportsVP9Profile2 = a5;
    result->_useLowLatencyH264 = a6;
    result->_supportsAv1 = a7;
  }
  return result;
}

+ (id)supportedCodecs
{
  return (id)objc_msgSend(a1, "supportedCodecsWithH265:vp9Profile0:vp9Profile2:av1:", 1, 1, 1, 1);
}

+ (id)supportedCodecsWithH265:(BOOL)a3 vp9Profile0:(BOOL)a4 vp9Profile2:(BOOL)a5 av1:(BOOL)a6
{
  void *v6;
  WK_RTCVideoCodecInfo *v7;
  void *v8;
  WK_RTCVideoCodecInfo *v9;
  WK_RTCVideoCodecInfo *v10;
  void *v11;
  WK_RTCVideoCodecInfo *v12;
  WK_RTCVideoCodecInfo *v13;
  void *v14;
  WK_RTCVideoCodecInfo *v15;
  WK_RTCVideoCodecInfo *v16;
  void *v17;
  WK_RTCVideoCodecInfo *v18;
  WK_RTCVideoCodecInfo *v19;
  WK_RTCVideoCodecInfo *v20;
  WK_RTCVideoCodecInfo *v21;
  WK_RTCVideoCodecInfo *v23;
  WK_RTCVideoCodecInfo *v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[5];

  v27 = a5;
  v28 = a6;
  v25 = a3;
  v26 = a4;
  v36[3] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 8);
  v7 = [WK_RTCVideoCodecInfo alloc];
  v35[0] = CFSTR("profile-level-id");
  v35[1] = CFSTR("level-asymmetry-allowed");
  v36[0] = CFSTR("640c1f");
  v36[1] = CFSTR("1");
  v35[2] = CFSTR("packetization-mode");
  v36[2] = CFSTR("1");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WK_RTCVideoCodecInfo initWithName:parameters:](v7, "initWithName:parameters:", CFSTR("H264"), v8);
  objc_msgSend(v6, "addObject:", v9);

  v10 = [WK_RTCVideoCodecInfo alloc];
  v33[0] = CFSTR("profile-level-id");
  v33[1] = CFSTR("level-asymmetry-allowed");
  v34[0] = CFSTR("42e01f");
  v34[1] = CFSTR("1");
  v33[2] = CFSTR("packetization-mode");
  v34[2] = CFSTR("1");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WK_RTCVideoCodecInfo initWithName:parameters:](v10, "initWithName:parameters:", CFSTR("H264"), v11);
  objc_msgSend(v6, "addObject:", v12);

  v13 = [WK_RTCVideoCodecInfo alloc];
  v31[0] = CFSTR("profile-level-id");
  v31[1] = CFSTR("level-asymmetry-allowed");
  v32[0] = CFSTR("640c1f");
  v32[1] = CFSTR("1");
  v31[2] = CFSTR("packetization-mode");
  v32[2] = CFSTR("0");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WK_RTCVideoCodecInfo initWithName:parameters:](v13, "initWithName:parameters:", CFSTR("H264"), v14);
  objc_msgSend(v6, "addObject:", v15);

  v16 = [WK_RTCVideoCodecInfo alloc];
  v29[0] = CFSTR("profile-level-id");
  v29[1] = CFSTR("level-asymmetry-allowed");
  v30[0] = CFSTR("42e01f");
  v30[1] = CFSTR("1");
  v29[2] = CFSTR("packetization-mode");
  v30[2] = CFSTR("0");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[WK_RTCVideoCodecInfo initWithName:parameters:](v16, "initWithName:parameters:", CFSTR("H264"), v17);
  objc_msgSend(v6, "addObject:", v18);

  if (v25)
  {
    v19 = -[WK_RTCVideoCodecInfo initWithName:]([WK_RTCVideoCodecInfo alloc], "initWithName:", CFSTR("H265"));
    objc_msgSend(v6, "addObject:", v19);

  }
  v20 = -[WK_RTCVideoCodecInfo initWithName:]([WK_RTCVideoCodecInfo alloc], "initWithName:", CFSTR("VP8"));
  objc_msgSend(v6, "addObject:", v20);
  if (!v26)
  {
    if (!v27)
      goto LABEL_5;
LABEL_9:
    v24 = -[WK_RTCVideoCodecInfo initWithName:parameters:]([WK_RTCVideoCodecInfo alloc], "initWithName:parameters:", CFSTR("VP9"), &unk_24C0E7098);
    objc_msgSend(v6, "addObject:", v24);

    if (!v28)
      goto LABEL_7;
    goto LABEL_6;
  }
  v23 = -[WK_RTCVideoCodecInfo initWithName:parameters:]([WK_RTCVideoCodecInfo alloc], "initWithName:parameters:", CFSTR("VP9"), &unk_24C0E7070);
  objc_msgSend(v6, "addObject:", v23);

  if (v27)
    goto LABEL_9;
LABEL_5:
  if (v28)
  {
LABEL_6:
    v21 = -[WK_RTCVideoCodecInfo initWithName:]([WK_RTCVideoCodecInfo alloc], "initWithName:", CFSTR("AV1"));
    objc_msgSend(v6, "addObject:", v21);

  }
LABEL_7:

  return v6;
}

- (id)createEncoder:(id)a3
{
  id v4;
  void *v5;
  int v6;
  WK_RTCVideoEncoderH264 *v7;
  void *v8;
  int v9;
  WK_RTCVideoEncoderH265 *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  WK_RTCVideoEncoderH265 *v17;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("H264"));

  if (!v6)
  {
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("VP8"));

    if (v9)
    {
      +[WK_RTCVideoEncoderVP8 vp8Encoder](WK_RTCVideoEncoderVP8, "vp8Encoder");
      v10 = (WK_RTCVideoEncoderH265 *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("VP9"));

      if (v12)
      {
        +[WK_RTCVideoEncoderVP9 vp9Encoder:](WK_RTCVideoEncoderVP9, "vp9Encoder:", v4);
        v10 = (WK_RTCVideoEncoderH265 *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("H265"));

        if (v14)
        {
          v10 = -[WK_RTCVideoEncoderH265 initWithCodecInfo:]([WK_RTCVideoEncoderH265 alloc], "initWithCodecInfo:", v4);
        }
        else
        {
          objc_msgSend(v4, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("AV1"));

          if (!v16)
          {

            return 0;
          }
          +[WK_RTCVideoEncoderAV1 av1Encoder](WK_RTCVideoEncoderAV1, "av1Encoder");
          v10 = (WK_RTCVideoEncoderH265 *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    v17 = v10;

    return v17;
  }
  v7 = -[WK_RTCVideoEncoderH264 initWithCodecInfo:]([WK_RTCVideoEncoderH264 alloc], "initWithCodecInfo:", v4);
  -[WK_RTCVideoEncoderH264 setH264LowLatencyEncoderEnabled:](v7, "setH264LowLatencyEncoderEnabled:", self->_useLowLatencyH264);

  return v7;
}

- (id)supportedCodecs
{
  return (id)objc_msgSend((id)objc_opt_class(), "supportedCodecsWithH265:vp9Profile0:vp9Profile2:av1:", self->_supportsH265, self->_supportsVP9Profile0, self->_supportsVP9Profile2, self->_supportsAv1);
}

@end
