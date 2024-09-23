@implementation SBStripOrderingMapsByStripSize

void ____SBStripOrderingMapsByStripSize_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = &unk_1E91D17C0;
  v17[1] = &unk_1E91D17F0;
  v18[0] = &unk_1E91CEC50;
  v18[1] = &unk_1E91CEC68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = &unk_1E91D17C0;
  v15[1] = &unk_1E91D17F0;
  v16[0] = &unk_1E91CEC80;
  v16[1] = &unk_1E91CEC98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = &unk_1E91D17C0;
  v13[1] = &unk_1E91D17F0;
  v14[0] = &unk_1E91CECB0;
  v14[1] = &unk_1E91CECC8;
  v13[2] = &unk_1E91D17D8;
  v13[3] = &unk_1E91D1808;
  v14[2] = &unk_1E91CECE0;
  v14[3] = &unk_1E91CECF8;
  v13[4] = &unk_1E91D1820;
  v14[4] = &unk_1E91CED10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = &unk_1E91D17C0;
  v10 = &unk_1E91CED28;
  v11[0] = &unk_1E91D17F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = &unk_1E91D17D8;
  v7 = &unk_1E91D17C0;
  v8 = &unk_1E91CED40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v12[2] = v0;
  v11[2] = &unk_1E91D1808;
  v11[3] = &unk_1E91D1820;
  v11[4] = &unk_1E91D1838;
  v12[3] = v1;
  v12[4] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)__SBStripOrderingMapsByStripSize__map;
  __SBStripOrderingMapsByStripSize__map = v5;

}

@end
