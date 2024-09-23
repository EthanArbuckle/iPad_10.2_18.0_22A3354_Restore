@implementation SBSpringBoardApplicationIcon

- (SBSpringBoardApplicationIcon)initWithInterfaceStyle:(int64_t)a3
{
  SBSpringBoardApplicationIcon *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSpringBoardApplicationIcon;
  v5 = -[SBLeafIcon initWithLeafIdentifier:applicationBundleID:](&v10, sel_initWithLeafIdentifier_applicationBundleID_, CFSTR("com.apple.springboard"), CFSTR("com.apple.springboard"));
  if (v5)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2)
        goto LABEL_7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "userInterfaceIdiom");

      if (v7 == 1)
      {
LABEL_7:
        v5->_interfaceStyle = a3;
        return v5;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("SBSpringBoardApplicationIcon.m"), 20, CFSTR("This icon can only be created on iPad"));

    goto LABEL_7;
  }
  return v5;
}

- (SBSpringBoardApplicationIcon)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithInterfaceStyle_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSpringBoardApplicationIcon.m"), 28, CFSTR("%s is unavailable; use %@ instead"),
    "-[SBSpringBoardApplicationIcon init]",
    v5);

  return 0;
}

- (SBSpringBoardApplicationIcon)initWithLeafIdentifier:(id)a3 applicationBundleID:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithInterfaceStyle_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSpringBoardApplicationIcon.m"), 32, CFSTR("%s is unavailable; use %@ instead"),
    "-[SBSpringBoardApplicationIcon initWithLeafIdentifier:applicationBundleID:]",
    v7);

  return 0;
}

- (id)displayNameForLocation:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("COMMAND_TAB_SPRINGBOARD_DISPLAY_NAME"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)canTruncateLabel
{
  return 0;
}

- (BOOL)canTightenLabel
{
  return 0;
}

- (BOOL)isUninstallSupported
{
  return 0;
}

- (id)_generateImageWithInfo:(SBIconImageInfo *)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v12;
  char v13;
  int v14;
  char v15;
  double v16;
  double v17;
  double v18;
  __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _QWORD v37[2];

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v37[1] = *MEMORY[0x1E0C80C00];
  v12 = __sb__runningInSpringBoard();
  v13 = v12;
  if (v12)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom") != 1)
    {

      goto LABEL_15;
    }
  }
  v14 = __sb__runningInSpringBoard();
  v15 = v14;
  if (v14)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v17 = v16;
  v18 = *(double *)(MEMORY[0x1E0DAB260] + 264);
  if ((v15 & 1) == 0)

  if ((v13 & 1) == 0)
  if (v17 >= v18)
  {
    objc_msgSend(CFSTR("SpringBoardAppIconiPad"), "stringByAppendingString:", CFSTR("Large"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
LABEL_15:
  v19 = CFSTR("SpringBoardAppIconiPad");
LABEL_16:
  if (self->_interfaceStyle == 2)
    v20 = CFSTR("Dark");
  else
    v20 = CFSTR("Light");
  -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc(MEMORY[0x1E0D3A810]);
  v24 = objc_retainAutorelease(v22);
  v25 = objc_msgSend(v24, "CGImage");
  objc_msgSend(v24, "scale");
  v26 = (void *)objc_msgSend(v23, "initWithCGImage:scale:", v25);
  v27 = objc_alloc(MEMORY[0x1E0D3A820]);
  v37[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v27, "initWithImages:", v28);

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v10, v9, v8);
  objc_msgSend(v29, "imageForDescriptor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    v33 = (void *)MEMORY[0x1E0CEA638];
    v34 = objc_msgSend(v31, "CGImage");
    objc_msgSend(v32, "scale");
    objc_msgSend(v33, "imageWithCGImage:scale:orientation:", v34, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

@end
