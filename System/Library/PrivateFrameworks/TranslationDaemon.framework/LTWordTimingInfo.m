@implementation LTWordTimingInfo

void __58___LTWordTimingInfo_Daemon__wordTimingInfoFromArray_text___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  float v6;
  uint64_t v7;
  unsigned int v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDF64E0];
  v4 = a2;
  v9 = objc_alloc_init(v3);
  objc_msgSend(v9, "setLength:", objc_msgSend(v4, "length"));
  objc_msgSend(v9, "setOffset:", objc_msgSend(v4, "offset"));
  objc_msgSend(v4, "word");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWord:", v5);

  objc_msgSend(v9, "setSampleIndex:", objc_msgSend(v4, "sample_idx"));
  objc_msgSend(v4, "timestamp");
  objc_msgSend(v9, "setStartTime:", v6);
  v7 = objc_msgSend(v4, "offset");
  v8 = objc_msgSend(v4, "length");

  objc_msgSend(v9, "setTextRange:", v7, v8);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

}

void __67___LTWordTimingInfo_Daemon__wordTimingInfoFromSiriTTSService_text___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = (objc_class *)MEMORY[0x24BDF64E0];
  v4 = a2;
  v10 = objc_alloc_init(v3);
  objc_msgSend(v4, "textRange");
  objc_msgSend(v10, "setLength:", v5);
  objc_msgSend(v10, "setOffset:", objc_msgSend(v4, "textRange"));
  objc_msgSend(v10, "setWord:", &stru_251A15610);
  objc_msgSend(v4, "startTime");
  objc_msgSend(v10, "setStartTime:", v6 * 1000.0);
  v7 = objc_msgSend(v4, "textRange");
  v9 = v8;

  objc_msgSend(v10, "setTextRange:", v7, v9);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

}

@end
