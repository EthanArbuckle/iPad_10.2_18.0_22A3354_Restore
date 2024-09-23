@implementation UIKeyboardPredictionCellMetrics

+ (id)secureCandidateEstimatedMetricsDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "interfaceOrientation");

  v6 = v3;
  +[UIKeyboardImpl keyboardScreen](UIKeyboardImpl, "keyboardScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "keyboardWidth");
  v10 = v9;
  if (_usesiPadStyle())
  {
    if (+[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode")
      && (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "isMinimized"),
          v11,
          v12)
      && ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl()))
    {
      v10 = dbl_18667AEF0[(unint64_t)(v5 - 3) < 2];
    }
    else
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "traitCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "systemInputAssistantViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_buttonBarWidthForTraitCollection:interfaceOrientation:", v14, v5);
      v17 = v16;

      v10 = v10 - (v17 + v17);
    }
  }

  objc_msgSend(a1, "secureCandidateEstimatedMetricsDictionaryForWidth:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)secureCandidateEstimatedMetricsDictionaryForWidth:(double)a3
{
  double v4;
  float v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  _QWORD *v22;
  float v23;
  float v24;
  double v25;
  double v26;
  double v27;
  float v28;
  double v29;
  double v30;
  double v31;
  float v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  _QWORD v38[8];
  _QWORD v39[8];
  _QWORD v40[8];
  _QWORD v41[9];

  v41[8] = *MEMORY[0x1E0C80C00];
  if (_usesiPadStyle())
  {
    v40[0] = *MEMORY[0x1E0DBE3A0];
    *(float *)&v4 = a3;
    v5 = floorf(*(float *)&v4);
    *(float *)&v4 = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v6;
    v40[1] = *MEMORY[0x1E0DBE3C8];
    v7 = a3 * 0.5;
    *(float *)&v7 = a3 * 0.5;
    *(float *)&v7 = floorf(*(float *)&v7);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v8;
    v40[2] = *MEMORY[0x1E0DBE3B8];
    v9 = a3 / 3.0;
    *(float *)&v9 = a3 / 3.0;
    *(float *)&v9 = floorf(*(float *)&v9);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v10;
    v40[3] = *MEMORY[0x1E0DBE3A8];
    *(float *)&v11 = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v12;
    v40[4] = *MEMORY[0x1E0DBE3D0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", floor(a3));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41[4] = v13;
    v40[5] = *MEMORY[0x1E0DBE398];
    v14 = a3 + -52.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", floor(v14));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v41[5] = v15;
    v40[6] = *MEMORY[0x1E0DBE3C0];
    v16 = v14 * 0.5;
    *(float *)&v16 = v14 * 0.5;
    *(float *)&v16 = floorf(*(float *)&v16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41[6] = v17;
    v40[7] = *MEMORY[0x1E0DBE3B0];
    v18 = v14 / 3.0;
    *(float *)&v18 = v14 / 3.0;
    *(float *)&v18 = floorf(*(float *)&v18);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41[7] = v19;
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = v41;
    v22 = v40;
  }
  else
  {
    v38[0] = *MEMORY[0x1E0DBE3A0];
    v23 = (a3 + -4.0) / 12.0;
    v24 = floorf(v23);
    v25 = a3 - (float)(v24 + v24) + -4.0;
    *(float *)&v25 = v25;
    *(float *)&v25 = floorf(*(float *)&v25);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v6;
    v38[1] = *MEMORY[0x1E0DBE3C8];
    v26 = (a3 + -2.0) * 0.5;
    *(float *)&v26 = v26;
    *(float *)&v26 = floorf(*(float *)&v26);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v8;
    v38[2] = *MEMORY[0x1E0DBE3B8];
    v27 = (a3 + -4.0) / 3.0;
    *(float *)&v27 = v27;
    *(float *)&v27 = floorf(*(float *)&v27);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v10;
    v38[3] = *MEMORY[0x1E0DBE3A8];
    v28 = a3;
    *(float *)&v29 = floorf(v28);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v12;
    v38[4] = *MEMORY[0x1E0DBE3D0];
    v30 = a3 + -52.0;
    v31 = a3 + -52.0 + -2.0;
    *(float *)&v31 = v31;
    v32 = floorf(*(float *)&v31);
    *(float *)&v31 = v32;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v13;
    v38[5] = *MEMORY[0x1E0DBE398];
    *(float *)&v33 = v32;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[5] = v15;
    v38[6] = *MEMORY[0x1E0DBE3C0];
    v34 = (v30 + -4.0) * 0.5;
    *(float *)&v34 = v34;
    *(float *)&v34 = floorf(*(float *)&v34);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39[6] = v17;
    v38[7] = *MEMORY[0x1E0DBE3B0];
    v35 = (v30 + -6.0) / 3.0;
    *(float *)&v35 = v35;
    *(float *)&v35 = floorf(*(float *)&v35);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39[7] = v19;
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = v39;
    v22 = v38;
  }
  objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

@end
