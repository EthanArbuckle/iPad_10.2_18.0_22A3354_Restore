@implementation SMUFilter

+ (id)gaussianBlurFilterWithInputRadius:(double)a3 inputHardEdges:(id)a4 inputNormalizeEdges:(id)a5 inputQuality:(id)a6 inputIntermediateBitDepth:(id)a7 inputDither:(id)a8 name:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A78]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setValue:forKey:", v22, CFSTR("inputRadius"));

  if (v15)
    objc_msgSend(v21, "setValue:forKey:", v15, CFSTR("inputHardEdges"));
  if (v16)
    objc_msgSend(v21, "setValue:forKey:", v16, CFSTR("inputNormalizeEdges"));
  if (v17)
    objc_msgSend(v21, "setValue:forKey:", v17, CFSTR("inputQuality"));
  if (v18)
    objc_msgSend(v21, "setValue:forKey:", v18, CFSTR("inputIntermediateBitDepth"));
  if (v19)
    objc_msgSend(v21, "setValue:forKey:", v19, CFSTR("inputDither"));
  objc_msgSend(v21, "setName:", v20);

  return v21;
}

+ (id)programTextBlurFilter1
{
  return (id)objc_msgSend(a1, "gaussianBlurFilterWithInputRadius:inputHardEdges:inputNormalizeEdges:inputQuality:inputIntermediateBitDepth:inputDither:name:", 0, 0, CFSTR("low"), CFSTR("low"), 0, CFSTR("blur1"), 40.0);
}

+ (id)programTextColorMatrixFilter
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  int v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A00]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 0;
  v5[1] = 0;
  v6 = 1065353216;
  v7 = 0u;
  v8 = 0u;
  v9 = 0;
  v10 = 1065353216;
  v11 = 0;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCAColorMatrix:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("inputColorMatrix"));

  return v2;
}

+ (id)programTextBlurFilter2
{
  return (id)objc_msgSend(a1, "gaussianBlurFilterWithInputRadius:inputHardEdges:inputNormalizeEdges:inputQuality:inputIntermediateBitDepth:inputDither:name:", MEMORY[0x24BDBD1C8], 0, CFSTR("default"), 0, 0, CFSTR("blur2"), 200.0);
}

+ (void)applyProgramTextFiltersToLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "programTextBlurFilter1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "programTextColorMatrixFilter", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(a1, "programTextBlurFilter2");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilters:", v8);

}

+ (id)programTextBackgroundVibrantColorMatrixFilter
{
  void *v2;
  void *v3;
  _OWORD v5[5];

  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5C30]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = xmmword_22BA8CEC0;
  v5[1] = xmmword_22BA8CED0;
  v5[2] = xmmword_22BA8CEE0;
  v5[3] = xmmword_22BA8CEF0;
  v5[4] = xmmword_22BA8CF00;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCAColorMatrix:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("inputColorMatrix"));

  return v2;
}

+ (void)applyProgramVibrantColorFilterToLayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "programTextBackgroundVibrantColorMatrixFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilters:", v6);

}

@end
