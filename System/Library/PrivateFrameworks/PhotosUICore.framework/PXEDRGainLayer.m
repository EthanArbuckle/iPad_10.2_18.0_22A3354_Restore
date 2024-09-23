@implementation PXEDRGainLayer

+ (id)layer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("backgroundColor");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("bounds");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = CFSTR("position");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActions:", v6);

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", &unk_1E53EDF08, *MEMORY[0x1E0CD2CB8]);
  objc_msgSend(v7, "setValue:forKey:", &unk_1E53EDF20, *MEMORY[0x1E0CD2DA8]);
  objc_msgSend(v7, "setName:", CFSTR("modulationFilter"));
  v12 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFilters:", v8);

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E50]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompositingFilter:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

  return v2;
}

@end
