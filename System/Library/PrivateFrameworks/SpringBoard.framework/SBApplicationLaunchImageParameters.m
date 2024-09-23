@implementation SBApplicationLaunchImageParameters

- (SBApplicationLaunchImageParameters)init
{
  return (SBApplicationLaunchImageParameters *)-[SBApplicationLaunchImageParameters _initWithDefaultPNGName:extension:minOSVersionString:size:interfaceOrientation:](self, 0, 0, 0, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (id)_initWithDefaultPNGName:(void *)a3 extension:(void *)a4 minOSVersionString:(uint64_t)a5 size:(double)a6 interfaceOrientation:(double)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  if (a1)
  {
    if ((unint64_t)(a5 - 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithDefaultPNGName_extension_minOSVersionString_size_interfaceOrientation_, a1, CFSTR("SBApplicationLaunchImageParameters.m"), 53, CFSTR("orientation=%li is not a valid interfaceOrientation"), a5);

    }
    v24.receiver = a1;
    v24.super_class = (Class)SBApplicationLaunchImageParameters;
    a1 = objc_msgSendSuper2(&v24, sel_init);
    if (a1)
    {
      v17 = objc_msgSend(v13, "copy");
      v18 = (void *)*((_QWORD *)a1 + 1);
      *((_QWORD *)a1 + 1) = v17;

      v19 = objc_msgSend(v14, "copy");
      v20 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v19;

      v21 = objc_msgSend(v15, "copy");
      v22 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v21;

      *((double *)a1 + 4) = a6;
      *((double *)a1 + 5) = a7;
      *((_QWORD *)a1 + 6) = a5;
    }
  }

  return a1;
}

+ (id)launchImageParametersFromLaunchImagesInfo:(id)a3 withBundleIdentifier:(id)a4 isMonarchLinked:(BOOL)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t i;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  NSString *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  char v23;
  NSObject *v24;
  NSObject *v25;
  CGSize v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  uint32_t v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  void *v39;
  uint64_t v41;
  void *v42;
  id v43;
  NSObject *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE buf[12];
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  NSObject *v56;
  __int16 v57;
  NSString *v58;
  __int16 v59;
  __CFString *v60;
  _BYTE v61[128];
  uint64_t v62;
  NSSize v63;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v43 = a4;
  if (!v43)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBApplicationLaunchImageParameters.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v9 = v8;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
    if (v10)
    {
      v11 = v10;
      v38 = v8;
      v39 = 0;
      v12 = *(_QWORD *)v47;
      v13 = *MEMORY[0x1E0C9D820];
      v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v44 = v9;
      while (1)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v47 != v12)
            objc_enumerationMutation(v9);
          v16 = *(__CFString **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = (void *)MEMORY[0x1D17E5334]();
            v18 = v16;
            -[__CFString objectForKey:](v18, "objectForKey:", CFSTR("UILaunchImageSize"));
            v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            if (!v19)
            {
              v63.width = 320.0;
              v63.height = 480.0;
              NSStringFromSize(v63);
              v19 = (NSString *)objc_claimAutoreleasedReturnValue();
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[__CFString objectForKey:](v18, "objectForKey:", CFSTR("UILaunchImageOrientation"));
              v20 = objc_claimAutoreleasedReturnValue();
              if (v20)
                v21 = v20;
              else
                v21 = CFSTR("Portrait");
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0
                || (+[SBApplicationLaunchImageParameters validInfoPlistOrientationKeys](SBApplicationLaunchImageParameters, "validInfoPlistOrientationKeys"), v22 = (void *)objc_claimAutoreleasedReturnValue(), v23 = objc_msgSend(v22, "containsObject:", v21), v22, (v23 & 1) == 0))
              {
                XBLogCapture();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138544130;
                  *(_QWORD *)&buf[4] = v43;
                  v51 = 2114;
                  v52 = CFSTR("UILaunchImageOrientation");
                  v53 = 2114;
                  v54 = (const __CFString *)v21;
                  v55 = 2114;
                  v56 = v18;
                  _os_log_debug_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEBUG, "[.plist ingest] [%{public}@] Incorrect %{public}@ type (requires NSString) or invalid value ('%{public}@'), skipping...\n%{public}@", buf, 0x2Au);
                }
                v9 = v44;
                goto LABEL_49;
              }
              -[__CFString objectForKey:](v18, "objectForKey:", CFSTR("UILaunchImageMinimumOSVersion"));
              v24 = objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                XBLogCapture();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138544130;
                  *(_QWORD *)&buf[4] = v43;
                  v51 = 2114;
                  v52 = CFSTR("UILaunchImageMinimumOSVersion");
                  v53 = 2114;
                  v54 = (const __CFString *)v24;
                  v55 = 2114;
                  v56 = v18;
                  _os_log_debug_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEBUG, "[.plist ingest] [%{public}@] Incorrect %{public}@ type (requires NSString) in ('%{public}@'), skipping...\n%{public}@", buf, 0x2Au);
                }
                goto LABEL_48;
              }
              -[__CFString objectForKey:](v18, "objectForKey:", CFSTR("UILaunchImageName"));
              v25 = objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v26 = CGSizeFromString(v19);
                if (v26.width == v13 && v26.height == v14)
                {
                  XBLogCapture();
                  v27 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543874;
                    *(_QWORD *)&buf[4] = v43;
                    v51 = 2114;
                    v52 = (const __CFString *)v19;
                    v53 = 2114;
                    v54 = v18;
                    v28 = v27;
                    v29 = "[.plist ingest] [%{public}@] Invalid size string: %{public}@, skipping...\n%{public}@";
                    v30 = 32;
                    goto LABEL_36;
                  }
LABEL_47:

LABEL_48:
                  v9 = v44;

LABEL_49:
LABEL_50:

                  objc_autoreleasePoolPop(v17);
                  continue;
                }
                v32 = XBInterfaceOrientationForString();
                if ((unint64_t)(v32 - 5) < 0xFFFFFFFFFFFFFFFELL || a5 || !BSFloatLessThanFloat())
                {
                  v45 = 0;
                  +[SBApplicationLaunchImageParameters _sanitizedImageNameFromName:withExtension:actualExtension:]((uint64_t)SBApplicationLaunchImageParameters, v25, CFSTR("png"), &v45);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = v32;
                  v27 = v45;
                  v33 = -[SBApplicationLaunchImageParameters _initWithDefaultPNGName:extension:minOSVersionString:size:interfaceOrientation:]([SBApplicationLaunchImageParameters alloc], v42, v27, v24, v41, v26.width, v26.height);
                  *(_QWORD *)buf = v33;
                  if (v33)
                  {
                    if (v39)
                      objc_msgSend(v39, "addObject:", v33);
                    else
                      v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", buf, 1);
                  }

                  goto LABEL_47;
                }
                XBLogCapture();
                v27 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                  goto LABEL_47;
                *(_DWORD *)buf = 138544642;
                *(_QWORD *)&buf[4] = v43;
                v51 = 2114;
                v52 = CFSTR("UILaunchImageOrientation");
                v53 = 2114;
                v54 = CFSTR("UILaunchImageSize");
                v55 = 2114;
                v56 = v21;
                v57 = 2114;
                v58 = v19;
                v59 = 2114;
                v60 = v18;
                v28 = v27;
                v29 = "[.plist ingest] [%{public}@] Incorrect combination of %{public}@ and %{public}@ ('%{public}@' and "
                      "'%{public}@'), skipping...\n"
                      "%{public}@";
                v30 = 62;
              }
              else
              {
                XBLogCapture();
                v27 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                  goto LABEL_47;
                *(_DWORD *)buf = 138544130;
                *(_QWORD *)&buf[4] = v43;
                v51 = 2114;
                v52 = CFSTR("UILaunchImageName");
                v53 = 2114;
                v54 = (const __CFString *)v19;
                v55 = 2114;
                v56 = v18;
                v28 = v27;
                v29 = "[.plist ingest] [%{public}@] Incorrect %{public}@ type (requires NSString) in ('%{public}@'), skip"
                      "ping...\n"
                      "%{public}@";
                v30 = 42;
              }
LABEL_36:
              _os_log_debug_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEBUG, v29, buf, v30);
              goto LABEL_47;
            }
            XBLogCapture();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = v43;
              v51 = 2114;
              v52 = CFSTR("UILaunchImageSize");
              v53 = 2114;
              v54 = (const __CFString *)v19;
              v55 = 2114;
              v56 = v18;
              _os_log_debug_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEBUG, "[.plist ingest] [%{public}@] Incorrect %{public}@ type (requires NSString) in ('%{public}@'), skipping...\n%{public}@", buf, 0x2Au);
            }
            goto LABEL_50;
          }
          XBLogCapture();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v43;
            v51 = 2114;
            v52 = v16;
            _os_log_debug_impl(&dword_1D0540000, v31, OS_LOG_TYPE_DEBUG, "[.plist ingest] [%{public}@] Incorrect launchImageInfo format (requires NSDictionary) in ('%{public}@'), skipping...", buf, 0x16u);
          }

        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
        if (!v11)
        {
          v8 = v38;
          v34 = v39;
          goto LABEL_58;
        }
      }
    }
  }
  else
  {
    if (!v8)
    {
      v34 = 0;
      goto LABEL_59;
    }
    XBLogCapture();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[SBApplicationLaunchImageParameters launchImageParametersFromLaunchImagesInfo:withBundleIdentifier:isMonarchLinked:].cold.1((uint64_t)v43, (uint64_t)v8, v9);
  }
  v34 = 0;
LABEL_58:

LABEL_59:
  v35 = (void *)objc_msgSend(v34, "copy");

  return v35;
}

+ (id)_sanitizedImageNameFromName:(void *)a3 withExtension:(_QWORD *)a4 actualExtension:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  objc_msgSend(v6, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "length"))
  {
    v10 = v9;

    objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") + ~objc_msgSend(v10, "length"));
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = v10;
    v6 = (id)v11;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v7);

  return v6;
}

+ (id)validInfoPlistOrientationKeys
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DA8FC0];
  v5[0] = *MEMORY[0x1E0DA8FB8];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0DA8FA8];
  v5[2] = *MEMORY[0x1E0DA8FA0];
  v5[3] = v3;
  v5[4] = *MEMORY[0x1E0DA8FB0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_defaultPNGName);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_extension);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_minOSVersionString);
  v7 = (id)objc_msgSend(v3, "appendCGSize:", self->_size.width, self->_size.height);
  v8 = (id)objc_msgSend(v3, "appendInteger:", self->_interfaceOrientation);
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSString *defaultPNGName;
  uint64_t v7;
  id v8;
  id v9;
  NSString *extension;
  id v11;
  id v12;
  NSString *minOSVersionString;
  id v14;
  id v15;
  id v16;
  id v17;
  int64_t interfaceOrientation;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  defaultPNGName = self->_defaultPNGName;
  v7 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __46__SBApplicationLaunchImageParameters_isEqual___block_invoke;
  v30[3] = &unk_1E8EA89D0;
  v8 = v4;
  v31 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", defaultPNGName, v30);
  extension = self->_extension;
  v28[0] = v7;
  v28[1] = 3221225472;
  v28[2] = __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_2;
  v28[3] = &unk_1E8EA89D0;
  v11 = v8;
  v29 = v11;
  v12 = (id)objc_msgSend(v5, "appendString:counterpart:", extension, v28);
  minOSVersionString = self->_minOSVersionString;
  v26[0] = v7;
  v26[1] = 3221225472;
  v26[2] = __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_3;
  v26[3] = &unk_1E8EA89D0;
  v14 = v11;
  v27 = v14;
  v15 = (id)objc_msgSend(v5, "appendString:counterpart:", minOSVersionString, v26);
  v24[0] = v7;
  v24[1] = 3221225472;
  v24[2] = __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_4;
  v24[3] = &unk_1E8EB5E60;
  v16 = v14;
  v25 = v16;
  v17 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", v24, self->_size.width, self->_size.height);
  interfaceOrientation = self->_interfaceOrientation;
  v22[0] = v7;
  v22[1] = 3221225472;
  v22[2] = __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_5;
  v22[3] = &unk_1E8EA3AB0;
  v23 = v16;
  v19 = v16;
  v20 = (id)objc_msgSend(v5, "appendInteger:counterpart:", interfaceOrientation, v22);
  LOBYTE(interfaceOrientation) = objc_msgSend(v5, "isEqual");

  return interfaceOrientation;
}

id __46__SBApplicationLaunchImageParameters_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

id __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

double __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_4(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 32);
}

uint64_t __46__SBApplicationLaunchImageParameters_isEqual___block_invoke_5(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  SBApplicationLaunchImageParameters *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __49__SBApplicationLaunchImageParameters_description__block_invoke;
  v11 = &unk_1E8E9E820;
  v12 = v3;
  v13 = self;
  v4 = v3;
  v5 = (id)objc_msgSend(v4, "modifyProem:", &v8);
  objc_msgSend(v4, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __49__SBApplicationLaunchImageParameters_description__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("name"), 1);
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("ext"), 1);
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("minOS"), 1);
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendSize:withName:", CFSTR("size"), *(double *)(*(_QWORD *)(a1 + 40) + 32), *(double *)(*(_QWORD *)(a1 + 40) + 40));
  v6 = *(void **)(a1 + 32);
  XBStringForInterfaceOrientation();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "appendObject:withName:", v8, 0);

}

- (NSString)defaultPNGName
{
  return self->_defaultPNGName;
}

- (NSString)extension
{
  return self->_extension;
}

- (NSString)minOSVersionString
{
  return self->_minOSVersionString;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minOSVersionString, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_defaultPNGName, 0);
}

+ (void)launchImageParametersFromLaunchImagesInfo:(uint64_t)a1 withBundleIdentifier:(uint64_t)a2 isMonarchLinked:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "[.plist ingest] [%{public}@] Incorrect launchImagesInfo format (requires NSArray) in ('%{public}@'), skipping...", (uint8_t *)&v3, 0x16u);
}

@end
