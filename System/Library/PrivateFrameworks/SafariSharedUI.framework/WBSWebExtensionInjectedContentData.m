@implementation WBSWebExtensionInjectedContentData

+ (id)supportedInjectedContentFeatures
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("css");
  v10[1] = CFSTR("js");
  v11[0] = CFSTR("14.0");
  v11[1] = CFSTR("14.0");
  v10[2] = CFSTR("matches");
  v8 = CFSTR("<all_urls>");
  v9 = CFSTR("14.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v2;
  v10[3] = CFSTR("exclude_matches");
  v6 = CFSTR("<all_urls>");
  v7 = CFSTR("14.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v3;
  v11[4] = CFSTR("14.0");
  v10[4] = CFSTR("run_at");
  v10[5] = CFSTR("all_frames");
  v11[5] = CFSTR("14.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webExtensionsController);
}

@end
