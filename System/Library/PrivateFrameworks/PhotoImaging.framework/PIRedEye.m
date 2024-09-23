@implementation PIRedEye

- (id)outputImage
{
  CIImage *v3;
  void *v4;
  CIImage *inputDestinationImage;
  CIImage *v6;
  void *v7;
  BOOL v8;
  NSArray *inputCorrectionInfo;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  __CFString *inputCameraModel;
  double Width;
  double v28;
  double Height;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD rect[5];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  const __CFString *v50;
  void *v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _BYTE v54[128];
  uint64_t v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = self->_inputImage;
  v4 = v3;
  inputDestinationImage = self->_inputDestinationImage;
  if (!inputDestinationImage)
    inputDestinationImage = v3;
  v6 = inputDestinationImage;
  v7 = v6;
  if (v4)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8
    && (inputCorrectionInfo = self->_inputCorrectionInfo) != 0
    && -[NSArray count](inputCorrectionInfo, "count"))
  {
    objc_msgSend(v4, "extent");
    v11 = v10;
    *(double *)&rect[1] = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v7, "extent");
    v19 = v18;
    *(double *)rect = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    inputCameraModel = (__CFString *)self->_inputCameraModel;
    if (!inputCameraModel)
      inputCameraModel = &stru_1E501A310;
    rect[2] = inputCameraModel;
    v56.origin.x = v19;
    v56.origin.y = v21;
    v56.size.width = v23;
    v56.size.height = v25;
    Width = CGRectGetWidth(v56);
    v57.origin.x = v11;
    v57.origin.y = v13;
    v57.size.width = v15;
    v57.size.height = v17;
    v28 = Width / CGRectGetWidth(v57);
    *(_QWORD *)&v58.origin.x = rect[0];
    v58.origin.y = v21;
    v58.size.width = v23;
    v58.size.height = v25;
    Height = CGRectGetHeight(v58);
    *(_QWORD *)&v59.origin.x = rect[1];
    v59.origin.y = v13;
    v59.size.width = v15;
    v59.size.height = v17;
    v30 = Height / CGRectGetHeight(v59);
    if (v28 <= v30)
      v31 = v30;
    else
      v31 = v28;
    *(_OWORD *)&rect[3] = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    rect[1] = self->_inputCorrectionInfo;
    v32 = objc_msgSend((id)rect[1], "countByEnumeratingWithState:objects:count:", &rect[3], v54, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v47;
      do
      {
        v35 = 0;
        v36 = v7;
        v37 = v4;
        do
        {
          if (*(_QWORD *)v47 != v34)
            objc_enumerationMutation((id)rect[1]);
          v38 = *(_QWORD *)(rect[4] + 8 * v35);
          v52[0] = CFSTR("inputCorrectionInfo");
          v52[1] = CFSTR("inputCameraModel");
          v53[0] = v38;
          v53[1] = rect[2];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "imageByApplyingFilter:withInputParameters:", CFSTR("CIRedEyeCorrection"), v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v40, "imageByCompositingOverImage:", v37);
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = CFSTR("inputScale");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v41;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "imageByApplyingFilter:withInputParameters:", CFSTR("CILanczosScaleTransform"), v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "imageByCompositingOverImage:", v36);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          ++v35;
          v36 = v7;
          v37 = v4;
        }
        while (v33 != v35);
        v33 = objc_msgSend((id)rect[1], "countByEnumeratingWithState:objects:count:", &rect[3], v54, 16);
      }
      while (v33);
    }

    v44 = v7;
  }
  else
  {
    v44 = v7;
  }

  return v44;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CIImage)inputDestinationImage
{
  return self->_inputDestinationImage;
}

- (void)setInputDestinationImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputDestinationImage, a3);
}

- (NSArray)inputCorrectionInfo
{
  return self->_inputCorrectionInfo;
}

- (void)setInputCorrectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_inputCorrectionInfo, a3);
}

- (NSString)inputCameraModel
{
  return self->_inputCameraModel;
}

- (void)setInputCameraModel:(id)a3
{
  objc_storeStrong((id *)&self->_inputCameraModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputCameraModel, 0);
  objc_storeStrong((id *)&self->_inputCorrectionInfo, 0);
  objc_storeStrong((id *)&self->_inputDestinationImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
