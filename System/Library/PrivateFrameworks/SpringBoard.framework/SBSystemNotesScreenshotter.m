@implementation SBSystemNotesScreenshotter

- (id)takeScreenshotOfDisplay:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[6];
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isMainDisplay"))
  {
    v4 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
  }
  else
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowSceneForDisplayIdentity:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_referenceBounds");
    if (v7 > v8)
      v4 = 1;
    else
      v4 = 3;

  }
  objc_msgSend(v3, "UIScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x1E0CEC3E8];
  v24[0] = v9;
  v11 = *MEMORY[0x1E0CEC3C0];
  v23[0] = v10;
  v23[1] = v11;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "displayGamut"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0CEC3C8];
  v24[1] = v14;
  v24[2] = MEMORY[0x1E0C9AAA0];
  v16 = *MEMORY[0x1E0CEC3D0];
  v23[2] = v15;
  v23[3] = v16;
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "scale");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v18;
  v23[4] = *MEMORY[0x1E0CEC3E0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = *MEMORY[0x1E0CEC3D8];
  v24[4] = v19;
  v24[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)_UIRenderDisplay();
  return v21;
}

uint64_t __54__SBSystemNotesScreenshotter_takeScreenshotOfDisplay___block_invoke()
{
  return _UIRenderingBufferCreate();
}

@end
