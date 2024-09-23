@implementation SBInCallPresentationScreenSharingIcon

- (id)displayNameForLocation:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SCREEN_SHARING"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[2];

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v24[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", CFSTR("ScreenSharingIcon"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0D3A810]);
  v11 = objc_retainAutorelease(v9);
  v12 = objc_msgSend(v11, "CGImage");
  objc_msgSend(v11, "scale");
  v13 = (void *)objc_msgSend(v10, "initWithCGImage:scale:", v12);
  v14 = objc_alloc(MEMORY[0x1E0D3A820]);
  v24[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithImages:", v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v8, v7, v6);
  objc_msgSend(v16, "prepareImageForDescriptor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = (void *)MEMORY[0x1E0CEA638];
    v21 = objc_msgSend(v18, "CGImage");
    objc_msgSend(v19, "scale");
    objc_msgSend(v20, "imageWithCGImage:scale:orientation:", v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end
