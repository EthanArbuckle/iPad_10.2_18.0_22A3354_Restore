@implementation SBSUserNotificationColorDefinition(SBUserNotificationColorResolving)

- (id)sb_resolvedColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;

  objc_msgSend(a1, "colorName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "sbui_systemColorNamed:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(a1, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CEA478];
    objc_msgSend(v4, "red");
    v8 = v7;
    objc_msgSend(v5, "green");
    v10 = v9;
    objc_msgSend(v5, "blue");
    v12 = v11;
    objc_msgSend(v5, "alpha");
    objc_msgSend(v6, "colorWithRed:green:blue:alpha:", v8, v10, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v14;
  }

  return v3;
}

@end
