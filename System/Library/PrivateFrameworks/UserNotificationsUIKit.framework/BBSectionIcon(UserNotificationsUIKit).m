@implementation BBSectionIcon(UserNotificationsUIKit)

- (id)nc_imageForFormat:()UserNotificationsUIKit scale:userInterfaceStyle:usedUserInterfaceStyel:
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  char *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v56;
  void *v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_bestVariantForFormat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imagePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundlePath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemImageName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v9, "isPrecomposed");
  if (v12)
    v17 = v12;
  else
    v17 = v15;
  v56 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sectionInfoIcon.%@.%@.%@.%@.%ld.%d"), v17, v13, v11, v14, a4, v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v10, "length");
  v57 = (void *)v18;
  if (!v53)
  {
    v54 = v11;
    +[NCUIMappedImageCache sharedCache](NCUIMappedImageCache, "sharedCache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
LABEL_17:
      v20 = 0;
LABEL_34:
      v11 = v54;
      goto LABEL_35;
    }
    if (v12 && v13)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v12, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v19 = v23;
          objc_msgSend(v23, "size");
          v25 = v24;
          objc_msgSend(v19, "size");
          if (v25 != v26)
          {
            v27 = (void *)*MEMORY[0x1E0DC5F88];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F88], OS_LOG_TYPE_ERROR))
              -[BBSectionIcon(UserNotificationsUIKit) nc_imageForFormat:scale:userInterfaceStyle:usedUserInterfaceStyel:].cold.2((uint64_t)v12, v27, v22);
            goto LABEL_31;
          }
          objc_msgSend(v19, "size");
          if (a4 > 32)
          {
            if (a4 == 34)
            {
              *(double *)&v45 = 56.0;
              goto LABEL_63;
            }
            if (a4 == 33)
            {
              *(double *)&v45 = 176.0;
LABEL_63:
              v43 = *(double *)&v45;
              goto LABEL_64;
            }
          }
          else
          {
            v43 = 40.0;
            if (a4 == 14 || a4 == 17)
            {
LABEL_64:
              if (v42 >= v43)
                goto LABEL_31;
              v47 = (void *)*MEMORY[0x1E0DC5F88];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F88], OS_LOG_TYPE_ERROR))
                goto LABEL_31;
              v52 = v22;
              if (a4 > 32)
              {
                if (a4 == 34)
                {
                  v48 = 0x404C000000000000;
                }
                else
                {
                  if (a4 != 33)
                  {
LABEL_75:
                    v48 = 0x4043000000000000;
                    goto LABEL_76;
                  }
                  v48 = 0x4066000000000000;
                }
              }
              else
              {
                if (a4 != 14)
                {
                  v51 = 0x4044000000000000;
                  if (a4 == 17)
                  {
LABEL_77:
                    v49 = v47;
                    objc_msgSend(v52, "bundlePath");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 134218498;
                    v59 = v51;
                    v60 = 2114;
                    v61 = v12;
                    v62 = 2114;
                    v63 = v50;
                    _os_log_error_impl(&dword_1CFC3D000, v49, OS_LOG_TYPE_ERROR, "Notification icon is smaller than expanded size of %lf: %{public}@ in bundle %{public}@", buf, 0x20u);

                    v22 = v52;
                    goto LABEL_31;
                  }
                  goto LABEL_75;
                }
                v48 = 0x4044000000000000;
              }
LABEL_76:
              v51 = v48;
              goto LABEL_77;
            }
          }
          *(double *)&v45 = 38.0;
          goto LABEL_63;
        }
        v35 = (void *)*MEMORY[0x1E0DC5F88];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F88], OS_LOG_TYPE_ERROR))
          -[BBSectionIcon(UserNotificationsUIKit) nc_imageForFormat:scale:userInterfaceStyle:usedUserInterfaceStyel:].cold.1((uint64_t)v12, v35, v22);
      }
      v19 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v11 = v54;
    if (objc_msgSend(v54, "length"))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithContentsOfFile:", v54);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        v19 = v29;
        objc_msgSend(v29, "size");
        v31 = v30;
        objc_msgSend(v19, "size");
        if (v31 != v32)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F88], OS_LOG_TYPE_ERROR))
            -[BBSectionIcon(UserNotificationsUIKit) nc_imageForFormat:scale:userInterfaceStyle:usedUserInterfaceStyel:].cold.4();
          goto LABEL_32;
        }
        objc_msgSend(v19, "size");
        if (a4 <= 32)
        {
          v41 = 40.0;
          if (a4 == 14 || a4 == 17)
          {
LABEL_58:
            if (v40 < v41)
            {
              v46 = *MEMORY[0x1E0DC5F88];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F88], OS_LOG_TYPE_ERROR))
                -[BBSectionIcon(UserNotificationsUIKit) nc_imageForFormat:scale:userInterfaceStyle:usedUserInterfaceStyel:].cold.5(a4, (uint64_t)v54, v46);
            }
LABEL_32:
            if ((v16 & 1) != 0)
              goto LABEL_33;
            goto LABEL_16;
          }
          goto LABEL_56;
        }
        if (a4 == 34)
        {
          *(double *)&v44 = 56.0;
        }
        else
        {
          if (a4 != 33)
          {
LABEL_56:
            *(double *)&v44 = 38.0;
            goto LABEL_57;
          }
          *(double *)&v44 = 176.0;
        }
LABEL_57:
        v41 = *(double *)&v44;
        goto LABEL_58;
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F88], OS_LOG_TYPE_ERROR))
        -[BBSectionIcon(UserNotificationsUIKit) nc_imageForFormat:scale:userInterfaceStyle:usedUserInterfaceStyel:].cold.3();
    }
    else
    {
      if (objc_msgSend(v56, "length"))
      {
        NCIconImageForApplicationIdentifierWithFormat(v56, a4, a5);
        v33 = v56;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 1;
        v34 = a6;
        goto LABEL_36;
      }
      if (objc_msgSend(v15, "length"))
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
    }
    v19 = 0;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:scale:", v10, a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v16 & 1) == 0)
  {
    v54 = v11;
LABEL_16:
    v28 = v19;
    _NCIconImageForImageWithFormat(v19, a4, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
      goto LABEL_17;
LABEL_33:
    +[NCUIMappedImageCache sharedCache](NCUIMappedImageCache, "sharedCache");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setImage:forKey:", v19, v57);

    +[NCUIMappedImageCache sharedCache](NCUIMappedImageCache, "sharedCache");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "imageForKey:", v57);
    v38 = objc_claimAutoreleasedReturnValue();

    v20 = 0;
    v19 = (void *)v38;
    goto LABEL_34;
  }
LABEL_6:
  v20 = 0;
LABEL_35:
  v34 = a6;
  v33 = v56;
LABEL_36:
  if (v34)
    *v34 = v20;

  return v19;
}

- (void)nc_imageForFormat:()UserNotificationsUIKit scale:userInterfaceStyle:usedUserInterfaceStyel:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(a3, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_1CFC3D000, v4, v6, "Notification icon is not found: %{public}@ in bundle %{public}@", v7);

  OUTLINED_FUNCTION_0_0();
}

- (void)nc_imageForFormat:()UserNotificationsUIKit scale:userInterfaceStyle:usedUserInterfaceStyel:.cold.2(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(a3, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_1CFC3D000, v4, v6, "Notification icon width does not match height: %{public}@ in bundle %{public}@", v7);

  OUTLINED_FUNCTION_0_0();
}

- (void)nc_imageForFormat:()UserNotificationsUIKit scale:userInterfaceStyle:usedUserInterfaceStyel:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1CFC3D000, v0, v1, "Notification icon is not found: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)nc_imageForFormat:()UserNotificationsUIKit scale:userInterfaceStyle:usedUserInterfaceStyel:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1CFC3D000, v0, v1, "Notification icon width does not match height: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)nc_imageForFormat:()UserNotificationsUIKit scale:userInterfaceStyle:usedUserInterfaceStyel:.cold.5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 0x4044000000000000;
  v4 = 0x404C000000000000;
  v5 = 0x4043000000000000;
  if (a1 == 33)
    v5 = 0x4066000000000000;
  if (a1 != 34)
    v4 = v5;
  if (a1 != 14 && a1 != 17)
    v3 = v4;
  v7 = 134218242;
  v8 = v3;
  v9 = 2114;
  v10 = a2;
  OUTLINED_FUNCTION_3_0(&dword_1CFC3D000, a3, (uint64_t)a3, "Notification icon is smaller than expanded size of %lf: %{public}@", (uint8_t *)&v7);
  OUTLINED_FUNCTION_1_1();
}

@end
