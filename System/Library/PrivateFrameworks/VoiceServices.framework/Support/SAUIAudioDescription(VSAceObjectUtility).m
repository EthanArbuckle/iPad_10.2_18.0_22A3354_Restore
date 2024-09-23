@implementation SAUIAudioDescription(VSAceObjectUtility)

- (id)vsDescription
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  objc_msgSend(a1, "formatID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  v4 = HIBYTE(v3);
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = BYTE2(v3);
  v7 = BYTE1(v3);
  v8 = v3;
  objc_msgSend(a1, "sampleRate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;
  objc_msgSend(a1, "bitsPerChannel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");
  objc_msgSend(a1, "framesPerPacket");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("'%c%c%c%c', %.0fhz, %d bits, %d FPP, "), v4, v6, v7, v8, *(_QWORD *)&v11, v13, objc_msgSend(v14, "intValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
