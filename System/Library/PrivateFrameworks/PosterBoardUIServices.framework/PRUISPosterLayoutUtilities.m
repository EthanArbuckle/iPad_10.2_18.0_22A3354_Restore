@implementation PRUISPosterLayoutUtilities

+ (id)titleBoundsForLayout:(unint64_t)a3 orientation:(int64_t)a4 role:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  const __CFString **v13;
  uint64_t *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int IsLandscape;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  if (a6)
  {
    if (a3)
    {
LABEL_3:
      v11 = (void *)MEMORY[0x24BDD1540];
      v34 = *MEMORY[0x24BDD0FD8];
      v35[0] = CFSTR("Unsupported layout, must be HorizontalTopCentered.");
      v12 = (void *)MEMORY[0x24BDBCE70];
      v13 = (const __CFString **)v35;
      v14 = &v34;
LABEL_19:
      objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pr_errorWithCode:userInfo:", 2, v30);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      v29 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PRUISPosterLayoutUtilities.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outError != nil"));

    if (a3)
      goto LABEL_3;
  }
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE74E98]) & 1) == 0)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD0FD8];
    v33 = CFSTR("Unsupported role, must be LockScreen.");
    v12 = (void *)MEMORY[0x24BDBCE70];
    v13 = &v33;
    v14 = &v32;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  if (v17 >= v18)
    v19 = v18;
  else
    v19 = v17;
  if (v17 >= v18)
    v20 = v17;
  else
    v20 = v18;
  IsLandscape = BSInterfaceOrientationIsLandscape();
  if (IsLandscape)
    v22 = v20;
  else
    v22 = v19;
  if (!IsLandscape)
    v19 = v20;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74DC0]), "initWithTraitEnvironment:", v16);
  objc_msgSend(v23, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", 1, 1, 0, 0.0, 0.0, v22, v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rect");
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:", v25 / v22, v26 / v19, v27 / v22, v28 / v19);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v29;
}

@end
