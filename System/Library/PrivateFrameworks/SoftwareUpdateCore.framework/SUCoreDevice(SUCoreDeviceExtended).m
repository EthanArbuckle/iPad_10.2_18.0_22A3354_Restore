@implementation SUCoreDevice(SUCoreDeviceExtended)

- (uint64_t)rootVolumeUUID
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "oslog");
  v1 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    -[SUCoreDevice(SUCoreDeviceExtended) rootVolumeUUID].cold.1(v1, v2, v3, v4, v5, v6, v7, v8);

  return 0;
}

- (uint64_t)rootVolumeSealValid
{
  void *v0;
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint8_t v23[12];
  int v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  int v29;

  v29 = 0;
  v27 = 0u;
  v28 = 0u;
  v25 = xmmword_1DE07B230;
  v26 = 0;
  v24 = 1;
  if (getattrlist("/", &v25, &v27, 0x24uLL, 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "oslog");
    v1 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      -[SUCoreDevice(SUCoreDeviceExtended) rootVolumeSealValid].cold.5();
LABEL_16:
    v21 = 0;
    goto LABEL_17;
  }
  if ((BYTE7(v28) & 2) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "oslog");
    v1 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      -[SUCoreDevice(SUCoreDeviceExtended) rootVolumeSealValid].cold.1(v1, v3, v4, v5, v6, v7, v8, v9);
    goto LABEL_16;
  }
  if ((BYTE7(v27) & 2) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v1 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      -[SUCoreDevice(SUCoreDeviceExtended) rootVolumeSealValid].cold.2(v1, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_16;
  }
  if (fsctl("/", 0x20006832uLL, 0, 0))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v1 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      -[SUCoreDevice(SUCoreDeviceExtended) rootVolumeSealValid].cold.4();
    goto LABEL_16;
  }
  v19 = fsctl("/", 0x80044A58uLL, &v24, 0);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "oslog");
  v1 = objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      -[SUCoreDevice(SUCoreDeviceExtended) rootVolumeSealValid].cold.3();
    goto LABEL_16;
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_1DDFDD000, v1, OS_LOG_TYPE_DEFAULT, "[SUCoreDevice] RootVolumeSealValid: Root volume is sealed", v23, 2u);
  }
  v21 = 1;
LABEL_17:

  return v21;
}

- (void)rootVolumeUUID
{
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, a1, a3, "[SUCoreDevice] RootVolumeUUID: Not supported on this platform", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_1();
}

- (void)rootVolumeSealValid
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4();
  v0 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1DDFDD000, v1, v2, "[SUCoreDevice] RootVolumeSealValid: getattrlist failed for the root volume (%d: %s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

@end
