@implementation TPSDeviceValidation

- (TPSDeviceValidation)initWithTargetDevices:(id)a3 excludeDevices:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSDeviceValidation;
  return -[TPSInclusivityValidation initWithTargetValues:excludeValues:](&v5, sel_initWithTargetValues_excludeValues_, a3, a4);
}

- (BOOL)_matchesDevices:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v4 = (void *)MGCopyAnswer();
  v5 = (void *)MGCopyAnswer();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__TPSDeviceValidation__matchesDevices___block_invoke;
  v10[3] = &unk_1EA1E0F28;
  v6 = v4;
  v11 = v6;
  v13 = &v14;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);
  v8 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __39__TPSDeviceValidation__matchesDevices___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("/"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("deviceFamily"));

    if (v8)
    {
      objc_msgSend(v11, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "caseInsensitiveCompare:", CFSTR("model"));

      if (v10 || objc_msgSend(v6, "caseInsensitiveCompare:", a1[5]))
        goto LABEL_8;
    }
    else if ((objc_msgSend(v6, "containsString:", a1[4]) & 1) == 0)
    {
LABEL_8:

      goto LABEL_9;
    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  NSObject *v14;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[TPSDeviceValidation targetDevices](self, "targetDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

LABEL_4:
    -[TPSDeviceValidation targetDevices](self, "targetDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      -[TPSDeviceValidation targetDevices](self, "targetDevices");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[TPSDeviceValidation _matchesDevices:](self, "_matchesDevices:", v9);

    }
    else
    {
      v10 = 1;
    }

    -[TPSDeviceValidation excludeDevices](self, "excludeDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TPSDeviceValidation _matchesDevices:](self, "_matchesDevices:", v11);

    v13 = v10 && !v12;
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[TPSDeviceValidation validateWithCompletion:].cold.2(self, v13, v14);
    goto LABEL_9;
  }
  -[TPSInclusivityValidation excludeValues](self, "excludeValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[TPSDeviceValidation validateWithCompletion:].cold.1((uint64_t)self, v14);
  v13 = 1;
LABEL_9:

  v4[2](v4, v13, 0);
}

- (void)validateWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "%@ - neither target nor exclude device(s) is specified.", (uint8_t *)&v4, 0xCu);

}

- (void)validateWithCompletion:(NSObject *)a3 .cold.2(void *a1, char a2, NSObject *a3)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_class();
  v7 = v6;
  objc_msgSend(a1, "targetDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "excludeDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138413058;
  v13 = v6;
  v14 = 2112;
  v15 = v9;
  v16 = 2112;
  v17 = v11;
  v18 = 1024;
  v19 = a2 & 1;
  _os_log_debug_impl(&dword_1DAC2F000, a3, OS_LOG_TYPE_DEBUG, "%@ - target devices: %@, exclude devices: %@. Valid: %d", (uint8_t *)&v12, 0x26u);

}

@end
