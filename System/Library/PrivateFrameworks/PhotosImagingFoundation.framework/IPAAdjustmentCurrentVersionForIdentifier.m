@implementation IPAAdjustmentCurrentVersionForIdentifier

void __IPAAdjustmentCurrentVersionForIdentifier_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[11];
  _QWORD v14[13];

  v14[11] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("Effect");
  +[IPAAdjustmentVersion versionFromArchivalRepresentation:](IPAAdjustmentVersion, "versionFromArchivalRepresentation:", CFSTR("1"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v12;
  v13[1] = CFSTR("Crop");
  +[IPAAdjustmentVersion versionFromArchivalRepresentation:](IPAAdjustmentVersion, "versionFromArchivalRepresentation:", CFSTR("1"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v0;
  v13[2] = CFSTR("SmartTone");
  +[IPAAdjustmentVersion versionFromArchivalRepresentation:](IPAAdjustmentVersion, "versionFromArchivalRepresentation:", CFSTR("1"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v1;
  v13[3] = CFSTR("SmartBlackAndWhite");
  +[IPAAdjustmentVersion versionFromArchivalRepresentation:](IPAAdjustmentVersion, "versionFromArchivalRepresentation:", CFSTR("1"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v2;
  v13[4] = CFSTR("WhiteBalance");
  +[IPAAdjustmentVersion versionFromArchivalRepresentation:](IPAAdjustmentVersion, "versionFromArchivalRepresentation:", CFSTR("1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v3;
  v13[5] = CFSTR("RedEyeBB");
  +[IPAAdjustmentVersion versionFromArchivalRepresentation:](IPAAdjustmentVersion, "versionFromArchivalRepresentation:", CFSTR("1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v4;
  v13[6] = CFSTR("AutoEnhance");
  +[IPAAdjustmentVersion versionFromArchivalRepresentation:](IPAAdjustmentVersion, "versionFromArchivalRepresentation:", CFSTR("1"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v5;
  v13[7] = CFSTR("PosterFrame");
  +[IPAAdjustmentVersion versionForMajor:minor:](IPAAdjustmentVersion, "versionForMajor:minor:", 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v6;
  v13[8] = CFSTR("Trim");
  +[IPAAdjustmentVersion versionForMajor:minor:](IPAAdjustmentVersion, "versionForMajor:minor:", 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[8] = v7;
  v13[9] = CFSTR("SloMo");
  +[IPAAdjustmentVersion versionForMajor:minor:](IPAAdjustmentVersion, "versionForMajor:minor:", 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[9] = v8;
  v13[10] = CFSTR("PortraitVideo");
  +[IPAAdjustmentVersion versionForMajor:minor:](IPAAdjustmentVersion, "versionForMajor:minor:", 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[10] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 11);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)IPAAdjustmentCurrentVersionForIdentifier_s_currentVersionMapping;
  IPAAdjustmentCurrentVersionForIdentifier_s_currentVersionMapping = v10;

}

@end
