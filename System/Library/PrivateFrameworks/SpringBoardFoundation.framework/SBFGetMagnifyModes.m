@implementation SBFGetMagnifyModes

void __SBFGetMagnifyModes_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MGCopyAnswer();
  if (objc_msgSend(v0, "hasPrefix:", CFSTR("N56")))
  {
    +[SBFMagnifyMode magnifyModeWithSize:name:](SBFMagnifyMode, "magnifyModeWithSize:name:", CFSTR("Large"), 1242.0, 2208.0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v1;
    +[SBFMagnifyMode magnifyModeWithSize:name:](SBFMagnifyMode, "magnifyModeWithSize:name:", CFSTR("Medium"), 1125.0, 2001.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)SBFGetMagnifyModes_SBFMagnifyModes;
    SBFGetMagnifyModes_SBFMagnifyModes = v3;

    objc_msgSend((id)SBFGetMagnifyModes_SBFMagnifyModes, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    LODWORD(v7) = 1066225631;
  }
  else
  {
    if (!objc_msgSend(v0, "hasPrefix:", CFSTR("N61")))
    {
      +[SBFMagnifyMode magnifyModeWithSize:name:](SBFMagnifyMode, "magnifyModeWithSize:name:", CFSTR("Medium"), 640.0, 1136.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)SBFGetMagnifyModes_SBFMagnifyModes;
      SBFGetMagnifyModes_SBFMagnifyModes = v12;

      goto LABEL_7;
    }
    +[SBFMagnifyMode magnifyModeWithSize:name:](SBFMagnifyMode, "magnifyModeWithSize:name:", CFSTR("Medium"), 750.0, 1334.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    +[SBFMagnifyMode magnifyModeWithSize:name:](SBFMagnifyMode, "magnifyModeWithSize:name:", CFSTR("Small"), 640.0, 1136.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)SBFGetMagnifyModes_SBFMagnifyModes;
    SBFGetMagnifyModes_SBFMagnifyModes = v10;

    objc_msgSend((id)SBFGetMagnifyModes_SBFMagnifyModes, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    LODWORD(v7) = 1066795008;
  }
  objc_msgSend(v5, "setZoomFactor:", v7);
LABEL_7:

}

@end
