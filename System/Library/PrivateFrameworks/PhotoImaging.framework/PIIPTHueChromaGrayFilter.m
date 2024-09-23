@implementation PIIPTHueChromaGrayFilter

+ (id)filterLumaKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "hueChromaKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ipt_hue_chroma_filter_luma"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)outputImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  -[PIIPTHueChromaGrayFilter inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PIIPTHueChromaGrayFilter inputLumaTarget](self, "inputLumaTarget");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = &unk_1E5051A08;
    if (v4)
      v6 = (void *)v4;
    v7 = v6;

    -[PIIPTHueChromaGrayFilter inputLumaRange](self, "inputLumaRange");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &unk_1E5051A18;
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    -[PIIPTHueChromaGrayFilter inputChromaMax](self, "inputChromaMax");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = &unk_1E50519F8;
    if (v12)
      v14 = (void *)v12;
    v15 = v14;

    v16 = (void *)MEMORY[0x1E0C9DDF8];
    objc_msgSend(v7, "doubleValue");
    v18 = v17;

    objc_msgSend(v11, "doubleValue");
    v20 = v19;

    objc_msgSend(v15, "doubleValue");
    v22 = v21;

    objc_msgSend(v16, "vectorWithX:Y:Z:", v18, v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "filterLumaKernel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIIPTHueChromaGrayFilter inputImage](self, "inputImage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "extent");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[PIIPTHueChromaGrayFilter inputImage](self, "inputImage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v34;
    v38[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "applyWithExtent:arguments:", v35, v27, v29, v31, v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = 0;
  }
  return v36;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (NSNumber)inputLumaTarget
{
  return self->_inputLumaTarget;
}

- (void)setInputLumaTarget:(id)a3
{
  objc_storeStrong((id *)&self->_inputLumaTarget, a3);
}

- (NSNumber)inputLumaRange
{
  return self->_inputLumaRange;
}

- (void)setInputLumaRange:(id)a3
{
  objc_storeStrong((id *)&self->_inputLumaRange, a3);
}

- (NSNumber)inputChromaMax
{
  return self->_inputChromaMax;
}

- (void)setInputChromaMax:(id)a3
{
  objc_storeStrong((id *)&self->_inputChromaMax, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputChromaMax, 0);
  objc_storeStrong((id *)&self->_inputLumaRange, 0);
  objc_storeStrong((id *)&self->_inputLumaTarget, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
