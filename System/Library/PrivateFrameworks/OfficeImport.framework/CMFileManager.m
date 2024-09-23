@implementation CMFileManager

+ (unint64_t)getFileTypeFromPath:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("doc"))
    && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("dot")))
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("docx"))
      && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("dotx"))
      && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("docm"))
      && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("dotm")))
    {
      if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("xls"))
        && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("xlt"))
        && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("xla")))
      {
        if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("xlsx"))
          && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("xltx"))
          && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("xlsm"))
          && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("xltm")))
        {
          if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("ppt"))
            && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("pot"))
            && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("pps")))
          {
            if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("pptx"))
              && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("pptm"))
              && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("potx"))
              && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("potm"))
              && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("ppsx"))
              && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("ppsm")))
            {
              if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("csv")))
                v4 = 0;
              else
                v4 = 7;
            }
            else
            {
              v4 = 6;
            }
          }
          else
          {
            v4 = 5;
          }
        }
        else
        {
          v4 = 4;
        }
      }
      else
      {
        v4 = 3;
      }
    }
    else
    {
      v4 = 2;
    }
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (id)uniqueFileName:(id)a3
{
  id v3;
  const __CFUUID *v4;
  __CFString *v5;
  void *v6;

  v3 = a3;
  v4 = CFUUIDCreate(0);
  v5 = (__CFString *)CFUUIDCreateString(0, v4);
  CFRelease(v4);
  -[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR(".%@"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)getTmpDirectory
{
  return CFSTR("~/tmp/");
}

+ (unint64_t)getFileTypeFromUTI:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_255AFDB00 != -1)
    dispatch_once(&qword_255AFDB00, &__block_literal_global_106);
  if ((objc_msgSend(v3, "conformsToType:", _MergedGlobals_53) & 1) != 0)
    goto LABEL_4;
  if ((objc_msgSend(v3, "conformsToType:", qword_255AFDA20) & 1) != 0)
  {
LABEL_6:
    v4 = 3;
    goto LABEL_15;
  }
  if ((objc_msgSend(v3, "conformsToType:", qword_255AFDA28) & 1) != 0)
  {
LABEL_8:
    v4 = 5;
    goto LABEL_15;
  }
  if ((objc_msgSend(v3, "conformsToType:", qword_255AFDA30) & 1) != 0)
  {
LABEL_10:
    v4 = 2;
    goto LABEL_15;
  }
  if ((objc_msgSend(v3, "conformsToType:", qword_255AFDA38) & 1) != 0)
  {
LABEL_12:
    v4 = 4;
    goto LABEL_15;
  }
  if ((objc_msgSend(v3, "conformsToType:", qword_255AFDA40) & 1) != 0)
    goto LABEL_14;
  if ((objc_msgSend(v3, "conformsToType:", qword_255AFDA48) & 1) != 0)
  {
LABEL_4:
    v4 = 1;
    goto LABEL_15;
  }
  if ((objc_msgSend(v3, "conformsToType:", qword_255AFDA50) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", qword_255AFDA60) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", qword_255AFDA58) & 1) != 0
    || qword_255AFDA68 && (objc_msgSend(v3, "conformsToType:") & 1) != 0
    || qword_255AFDA70 && (objc_msgSend(v3, "conformsToType:") & 1) != 0)
  {
    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "conformsToType:", qword_255AFDA78) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", qword_255AFDA80) & 1) != 0)
  {
    goto LABEL_6;
  }
  if ((objc_msgSend(v3, "conformsToType:", qword_255AFDA88) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", qword_255AFDA98) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", qword_255AFDA90) & 1) != 0
    || qword_255AFDAA0 && (objc_msgSend(v3, "conformsToType:") & 1) != 0
    || qword_255AFDAA8 && (objc_msgSend(v3, "conformsToType:") & 1) != 0)
  {
    goto LABEL_12;
  }
  if ((objc_msgSend(v3, "conformsToType:", qword_255AFDAB0) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", qword_255AFDAB8) & 1) != 0)
  {
    goto LABEL_8;
  }
  if ((objc_msgSend(v3, "conformsToType:", qword_255AFDAC8) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", qword_255AFDAC0) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", qword_255AFDAD8) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", qword_255AFDAD0) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", qword_255AFDAE0) & 1) != 0
    || qword_255AFDAE8 && (objc_msgSend(v3, "conformsToType:") & 1) != 0
    || qword_255AFDAF0 && (objc_msgSend(v3, "conformsToType:") & 1) != 0
    || qword_255AFDAF8 && (objc_msgSend(v3, "conformsToType:") & 1) != 0)
  {
LABEL_14:
    v4 = 6;
    goto LABEL_15;
  }
  if (objc_msgSend(v3, "conformsToType:", *MEMORY[0x24BDF8330]))
    v4 = 7;
  else
    v4 = 0;
LABEL_15:

  return v4;
}

void __36__CMFileManager_getFileTypeFromUTI___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.microsoft.word.doc"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_53;
  _MergedGlobals_53 = v0;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.microsoft.excel.xls"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_255AFDA20;
  qword_255AFDA20 = v2;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.microsoft.powerpoint.ppt"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_255AFDA28;
  qword_255AFDA28 = v4;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("org.openxmlformats.wordprocessingml.document"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_255AFDA30;
  qword_255AFDA30 = v6;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("org.openxmlformats.spreadsheetml.sheet"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_255AFDA38;
  qword_255AFDA38 = v8;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("org.openxmlformats.presentationml.presentation"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_255AFDA40;
  qword_255AFDA40 = v10;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.microsoft.word.dot"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)qword_255AFDA48;
  qword_255AFDA48 = v12;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("org.openxmlformats.wordprocessingml.template"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)qword_255AFDA50;
  qword_255AFDA50 = v14;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("org.openxmlformats.wordprocessingml.document.macroenabled"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)qword_255AFDA60;
  qword_255AFDA60 = v16;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("org.openxmlformats.wordprocessingml.template.macroenabled"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)qword_255AFDA58;
  qword_255AFDA58 = v18;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.microsoft.word.openxml.document"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)qword_255AFDA68;
  qword_255AFDA68 = v20;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.microsoft.word.openxml.template"));
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)qword_255AFDA70;
  qword_255AFDA70 = v22;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.microsoft.excel.xlt"));
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)qword_255AFDA78;
  qword_255AFDA78 = v24;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.microsoft.excel.xla"));
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)qword_255AFDA80;
  qword_255AFDA80 = v26;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("org.openxmlformats.spreadsheetml.template"));
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)qword_255AFDA88;
  qword_255AFDA88 = v28;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("org.openxmlformats.spreadsheetml.sheet.macroenabled"));
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)qword_255AFDA90;
  qword_255AFDA90 = v30;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("org.openxmlformats.spreadsheetml.template.macroenabled"));
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)qword_255AFDA98;
  qword_255AFDA98 = v32;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.microsoft.excel.openxml.workbook"));
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)qword_255AFDAA0;
  qword_255AFDAA0 = v34;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.microsoft.excel.openxml.template"));
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)qword_255AFDAA8;
  qword_255AFDAA8 = v36;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.microsoft.powerpoint.pps"));
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)qword_255AFDAB0;
  qword_255AFDAB0 = v38;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.microsoft.powerpoint.pot"));
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)qword_255AFDAB8;
  qword_255AFDAB8 = v40;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("org.openxmlformats.presentationml.template"));
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)qword_255AFDAC8;
  qword_255AFDAC8 = v42;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("org.openxmlformats.presentationml.slideshow"));
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)qword_255AFDAC0;
  qword_255AFDAC0 = v44;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("org.openxmlformats.presentationml.template.macroenabled"));
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)qword_255AFDAD0;
  qword_255AFDAD0 = v46;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("org.openxmlformats.presentationml.presentation.macroenabled"));
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)qword_255AFDAD8;
  qword_255AFDAD8 = v48;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("org.openxmlformats.presentationml.slideshow.macroenabled"));
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)qword_255AFDAE0;
  qword_255AFDAE0 = v50;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.microsoft.powerpoint.openxml.presentation"));
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)qword_255AFDAE8;
  qword_255AFDAE8 = v52;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.microsoft.powerpoint.openxml.template"));
  v54 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)qword_255AFDAF0;
  qword_255AFDAF0 = v54;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.microsoft.powerpoint.openxml.slideshow"));
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = (void *)qword_255AFDAF8;
  qword_255AFDAF8 = v56;

}

+ (id)canonicalUrlPrefix:(id)a3
{
  id v3;
  int v4;
  id v5;
  void *v6;

  v3 = a3;
  if (!objc_msgSend(v3, "length")
    || (v4 = objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v3, "length") - 1), v4 == 47)
    || v4 == 58)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("/"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)getUrlProtocol:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR(":"));
  if (v5)
  {
    objc_msgSend(v3, "substringToIndex:", v4 + 1);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_24F3BFFF8;
  }

  return v6;
}

@end
