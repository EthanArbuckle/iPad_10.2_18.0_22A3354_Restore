@implementation WK_RTCVideoEncoderFactoryH264

- (id)supportedCodecs
{
  void *v2;
  void *v3;
  WK_RTCVideoCodecInfo *v4;
  void *v5;
  WK_RTCVideoCodecInfo *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("profile-level-id");
  v11[1] = CFSTR("level-asymmetry-allowed");
  v12[0] = CFSTR("640c1f");
  v12[1] = CFSTR("1");
  v11[2] = CFSTR("packetization-mode");
  v12[2] = CFSTR("1");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WK_RTCVideoCodecInfo initWithName:parameters:]([WK_RTCVideoCodecInfo alloc], "initWithName:parameters:", CFSTR("H264"), v3);
  objc_msgSend(v2, "addObject:", v4);
  v9[0] = CFSTR("profile-level-id");
  v9[1] = CFSTR("level-asymmetry-allowed");
  v10[0] = CFSTR("42e01f");
  v10[1] = CFSTR("1");
  v9[2] = CFSTR("packetization-mode");
  v10[2] = CFSTR("1");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WK_RTCVideoCodecInfo initWithName:parameters:]([WK_RTCVideoCodecInfo alloc], "initWithName:parameters:", CFSTR("H264"), v5);
  objc_msgSend(v2, "addObject:", v6);
  v7 = (void *)objc_msgSend(v2, "copy");

  return v7;
}

- (id)createEncoder:(id)a3
{
  id v3;
  WK_RTCVideoEncoderH264 *v4;

  v3 = a3;
  v4 = -[WK_RTCVideoEncoderH264 initWithCodecInfo:]([WK_RTCVideoEncoderH264 alloc], "initWithCodecInfo:", v3);

  return v4;
}

@end
