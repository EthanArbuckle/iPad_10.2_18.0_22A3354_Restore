@implementation OSASafeCreateDirectory

id __OSASafeCreateDirectory_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[16];
  _QWORD v22[18];

  v22[16] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("progname");
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
    v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("<unknown>");
  }
  v22[0] = v3;
  v22[1] = MEMORY[0x1E0C9AAB0];
  v21[1] = CFSTR("create_dir");
  v21[2] = CFSTR("create_dir_success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 78), v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(const __CFString **)(a1 + 32);
  v6 = *(const __CFString **)(a1 + 40);
  if (!v5)
    v5 = CFSTR("path sanitize failed");
  v20 = (void *)v4;
  v22[2] = v4;
  v22[3] = v5;
  v21[3] = CFSTR("start_path");
  v21[4] = CFSTR("path");
  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("path sanitize failed");
  v22[4] = v7;
  v21[5] = CFSTR("original_perms");
  v8 = *(unsigned __int8 *)(a1 + 78);
  if (*(_BYTE *)(a1 + 78))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 76));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &unk_1E4DFDCD8;
  }
  v22[5] = v9;
  v21[6] = CFSTR("modify_perms");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 79));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v10;
  v21[7] = CFSTR("modify_perms_success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v11;
  v22[8] = &unk_1E4DFDCF0;
  v21[8] = CFSTR("modify_perms_value");
  v21[9] = CFSTR("original_gid");
  v12 = *(unsigned __int8 *)(a1 + 78);
  if (*(_BYTE *)(a1 + 78))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &unk_1E4DFDCD8;
  }
  v22[9] = v13;
  v21[10] = CFSTR("modify_gid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 81));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v14;
  v21[11] = CFSTR("modify_gid_success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 82));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v15;
  v22[12] = &unk_1E4DFDD08;
  v21[12] = CFSTR("modify_gid_value");
  v21[13] = CFSTR("boot_time_appx");
  v16 = *(_QWORD *)(a1 + 56);
  v22[13] = *(_QWORD *)(a1 + 48);
  v22[14] = v16;
  v21[14] = CFSTR("proc_uptime_appx");
  v21[15] = CFSTR("framework");
  v22[15] = CFSTR("OSAnalytics");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  if (v8)

  if (v2)
  return v17;
}

@end
