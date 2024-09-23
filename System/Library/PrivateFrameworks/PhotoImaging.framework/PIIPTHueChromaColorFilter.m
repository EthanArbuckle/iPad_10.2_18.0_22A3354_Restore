@implementation PIIPTHueChromaColorFilter

+ (id)filterHueKernel
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "hueChromaKernels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ipt_hue_chroma_filter_hue"));
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
  int v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  -[PIIPTHueChromaColorFilter inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PIIPTHueChromaColorFilter inputHueTarget](self, "inputHueTarget");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (void *)v4;
    else
      v6 = &unk_1E50519E8;
    v7 = v6;

    -[PIIPTHueChromaColorFilter inputHueRange](self, "inputHueRange");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &unk_1E50519F8;
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    -[PIIPTHueChromaColorFilter inputChromaMin](self, "inputChromaMin");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = &unk_1E50519E8;
    v15 = v14;

    -[PIIPTHueChromaColorFilter inputHueIsNormalized](self, "inputHueIsNormalized");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    if (v17)
      v18 = 1.0;
    else
      v18 = 6.28318531;
    v19 = (void *)MEMORY[0x1E0C9DDF8];
    objc_msgSend(v7, "doubleValue");
    v21 = v20;
    objc_msgSend(v11, "doubleValue");
    v23 = v22;

    objc_msgSend(v15, "doubleValue");
    v25 = v24;

    objc_msgSend(v19, "vectorWithX:Y:Z:W:", v21, v23, v18, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "filterHueKernel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIIPTHueChromaColorFilter inputImage](self, "inputImage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "extent");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    -[PIIPTHueChromaColorFilter inputImage](self, "inputImage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v37;
    v41[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "applyWithExtent:arguments:", v38, v30, v32, v34, v36);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = 0;
  }
  return v39;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (NSNumber)inputHueTarget
{
  return self->_inputHueTarget;
}

- (void)setInputHueTarget:(id)a3
{
  objc_storeStrong((id *)&self->_inputHueTarget, a3);
}

- (NSNumber)inputHueRange
{
  return self->_inputHueRange;
}

- (void)setInputHueRange:(id)a3
{
  objc_storeStrong((id *)&self->_inputHueRange, a3);
}

- (NSNumber)inputChromaMin
{
  return self->_inputChromaMin;
}

- (void)setInputChromaMin:(id)a3
{
  objc_storeStrong((id *)&self->_inputChromaMin, a3);
}

- (NSNumber)inputHueIsNormalized
{
  return self->_inputHueIsNormalized;
}

- (void)setInputHueIsNormalized:(id)a3
{
  objc_storeStrong((id *)&self->_inputHueIsNormalized, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputHueIsNormalized, 0);
  objc_storeStrong((id *)&self->_inputChromaMin, 0);
  objc_storeStrong((id *)&self->_inputHueRange, 0);
  objc_storeStrong((id *)&self->_inputHueTarget, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
