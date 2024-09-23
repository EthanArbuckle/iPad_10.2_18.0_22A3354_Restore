@implementation CNVCardPhoneLineGenerator

- (id)makeLineWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  v8 = v6;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  objc_msgSend((id)objc_opt_class(), "sanitizeNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)CNVCardPhoneLineGenerator;
  -[CNVCardLineGenerator makeLineWithName:value:](&v14, sel_makeLineWithName_value_, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)sanitizeNumber:(id)a3
{
  return (id)objc_msgSend(a3, "_cn_stringBySanitizingPhoneNumber");
}

- (id)standardLabelsForLabel:(id)a3
{
  id v3;
  void *v4;
  const __CFString **v5;
  uint64_t v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  const __CFString *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("_$!<Work>!$_")))
  {
    v19[0] = CFSTR("WORK");
    v19[1] = CFSTR("VOICE");
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = (const __CFString **)v19;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("_$!<Home>!$_")))
  {
    v18[0] = CFSTR("HOME");
    v18[1] = CFSTR("VOICE");
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = (const __CFString **)v18;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("_$!<Other>!$_")))
  {
    v17[0] = CFSTR("OTHER");
    v17[1] = CFSTR("VOICE");
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = (const __CFString **)v17;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("_$!<Mobile>!$_")))
    {
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone")))
      {
        v15[0] = CFSTR("IPHONE");
        v15[1] = CFSTR("CELL");
        v15[2] = CFSTR("VOICE");
        v4 = (void *)MEMORY[0x1E0C99D20];
        v5 = (const __CFString **)v15;
      }
      else
      {
        if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Apple Watch")))
        {
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("_$!<Main>!$_")))
          {
            v13 = CFSTR("MAIN");
            v4 = (void *)MEMORY[0x1E0C99D20];
            v5 = &v13;
          }
          else
          {
            if (objc_msgSend(v3, "isEqualToString:", CFSTR("_$!<WorkFAX>!$_")))
            {
              v12[0] = CFSTR("WORK");
              v12[1] = CFSTR("FAX");
              v4 = (void *)MEMORY[0x1E0C99D20];
              v5 = (const __CFString **)v12;
              goto LABEL_9;
            }
            if (objc_msgSend(v3, "isEqualToString:", CFSTR("_$!<HomeFAX>!$_")))
            {
              v11[0] = CFSTR("HOME");
              v11[1] = CFSTR("FAX");
              v4 = (void *)MEMORY[0x1E0C99D20];
              v5 = (const __CFString **)v11;
              goto LABEL_9;
            }
            if (objc_msgSend(v3, "isEqualToString:", CFSTR("_$!<OtherFAX>!$_")))
            {
              v10[0] = CFSTR("OTHER");
              v10[1] = CFSTR("FAX");
              v4 = (void *)MEMORY[0x1E0C99D20];
              v5 = (const __CFString **)v10;
              goto LABEL_9;
            }
            if (!objc_msgSend(v3, "isEqualToString:", CFSTR("_$!<Pager>!$_")))
            {
              v7 = 0;
              goto LABEL_11;
            }
            v9 = CFSTR("PAGER");
            v4 = (void *)MEMORY[0x1E0C99D20];
            v5 = &v9;
          }
          v6 = 1;
          goto LABEL_10;
        }
        v14[0] = CFSTR("APPLEWATCH");
        v14[1] = CFSTR("CELL");
        v14[2] = CFSTR("VOICE");
        v4 = (void *)MEMORY[0x1E0C99D20];
        v5 = (const __CFString **)v14;
      }
      v6 = 3;
      goto LABEL_10;
    }
    v16[0] = CFSTR("CELL");
    v16[1] = CFSTR("VOICE");
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = (const __CFString **)v16;
  }
LABEL_9:
  v6 = 2;
LABEL_10:
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v7;
}

@end
