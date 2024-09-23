@implementation NSDictionary(PVTransformAnimation)

+ (id)dictionaryWithPVTransformAnimationInfo:()PVTransformAnimation
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("tV");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("tS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a3 + 8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = CFSTR("X");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a3 + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  v12[3] = CFSTR("Y");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a3 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v12[4] = CFSTR("S");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a3 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v8;
  v12[5] = CFSTR("R");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a3 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)PVTransformAnimationInfo
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  CMTime v15;

  v4 = MEMORY[0x1E0CA2E68];
  *(_OWORD *)a2 = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(v4 + 16);
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_OWORD *)(a2 + 40) = xmmword_1B304EED0;
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("tV"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("tS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CMTimeMake(&v15, objc_msgSend(v5, "longLongValue"), objc_msgSend(v6, "intValue"));
  *(CMTime *)a2 = v15;
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("X"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  *(_QWORD *)(a2 + 24) = v8;
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Y"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  *(_QWORD *)(a2 + 32) = v10;
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("S"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "doubleValue");
  *(_QWORD *)(a2 + 40) = v12;
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("R"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "doubleValue");
  *(_QWORD *)(a2 + 48) = v14;

}

@end
