@implementation TPSPlaceholderWidgetContent

- (id)titleContent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("type");
  v13[1] = CFSTR("text");
  v14[0] = CFSTR("text");
  v14[1] = CFSTR("– – – – ");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v11[0] = CFSTR("type");
  v11[1] = CFSTR("text");
  v12[0] = CFSTR("text");
  v12[1] = CFSTR("– – – – – – – – – – – – –");
  v11[2] = CFSTR("marks");
  v8 = CFSTR("type");
  v9 = CFSTR("accentColor");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bodyText
{
  return CFSTR("– – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – ");
}

@end
