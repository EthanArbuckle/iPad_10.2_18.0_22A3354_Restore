@implementation AEMinimalTemplate

+ (AEMinimalTemplate)templateWithString:(id)a3 error:(id *)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithString:error:", v6, a4);

  return (AEMinimalTemplate *)v7;
}

+ (AEMinimalTemplate)templateWithURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithURL:error:", v6, a4);

  return (AEMinimalTemplate *)v7;
}

+ (id)evaluateTemplateWithString:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithString:error:", v8, a5);
  v11 = v10;
  if (v10)
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "evaluateWithData:error:", v9, a5));
  else
    v12 = 0;

  return v12;
}

+ (id)evaluateTemplateWithURL:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithURL:error:", v8, a5);
  v11 = v10;
  if (v10)
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "evaluateWithData:error:", v9, a5));
  else
    v12 = 0;

  return v12;
}

- (AEMinimalTemplate)initWithString:(id)a3 error:(id *)a4
{
  id v6;
  AEMinimalTemplate *v7;
  AEMinimalTemplate *v8;
  AEMinimalTemplate *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AEMinimalTemplate;
  v7 = -[AEMinimalTemplate init](&v11, "init");
  v8 = v7;
  if (v7 && !-[AEMinimalTemplate parseTemplate:error:](v7, "parseTemplate:error:", v6, a4))
    v9 = 0;
  else
    v9 = v8;

  return v9;
}

- (AEMinimalTemplate)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  AEMinimalTemplate *v7;
  void *v8;
  AEMinimalTemplate *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AEMinimalTemplate;
  v7 = -[AEMinimalTemplate init](&v11, "init");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfURL:usedEncoding:error:](NSString, "stringWithContentsOfURL:usedEncoding:error:", v6, 0, a4));
    if (!v8 || !-[AEMinimalTemplate parseTemplate:error:](v7, "parseTemplate:error:", v8, a4))
    {

      v9 = 0;
      goto LABEL_7;
    }

  }
  v9 = v7;
LABEL_7:

  return v9;
}

- (id)evaluateWithData:(id)a3 error:(id *)a4
{
  return (id)objc_claimAutoreleasedReturnValue(-[AEMinimalTemplate evaluateWithData:templateSet:cycleContext:error:](self, "evaluateWithData:templateSet:cycleContext:error:", a3, 0, 0, a4));
}

- (id)evaluateWithData:(id)a3 templateSet:(id)a4 cycleContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v22[3];
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  id *v29;
  uint64_t v30;
  id *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v30 = 0;
  v31 = (id *)&v30;
  v32 = 0x3042000000;
  v33 = sub_FBAD0;
  v34 = sub_FBADC;
  v35 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_FBAE4;
  v23[3] = &unk_1C1F10;
  v29 = a6;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v24 = v13;
  v28 = &v30;
  v14 = v11;
  v25 = v14;
  v15 = v12;
  v26 = v15;
  v16 = v10;
  v27 = v16;
  v17 = objc_retainBlock(v23);
  objc_storeWeak(v31 + 5, v17);
  memset(v22, 0, sizeof(v22));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEMinimalTemplate steps](self, "steps"));
  v19 = v16;
  LOBYTE(v16) = ((uint64_t (*)(_QWORD *, void *, id, _QWORD, uint64_t *))v17[2])(v17, v18, v19, 0, v22);

  if ((v16 & 1) != 0)
    v20 = v13;
  else
    v20 = 0;
  sub_FCED8(v22);

  _Block_object_dispose(&v30, 8);
  objc_destroyWeak(&v35);

  return v20;
}

- (BOOL)parseTemplate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  unsigned int v13;
  __CFString *v14;
  AEMinimalTemplateStepText *v15;
  unsigned int v16;
  unsigned __int8 v17;
  __CFString *v18;
  AEMinimalTemplateStepText *v19;
  unsigned int v20;
  id v21;
  unsigned int v22;
  AEMinimalTemplateStepIf *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  void *v32;
  AEMinimalTemplateStepText *v33;
  unsigned int v34;
  unsigned int v35;
  __CFString *v36;
  AEMinimalTemplateStepEmbed *v37;
  const __CFString *v38;
  BOOL v39;
  void *v40;
  void *v41;
  void *v43;
  AEMinimalTemplate *v44;
  id v45;
  id v46;
  void *v47;
  void *v49;
  __CFString *v50;
  id v51;
  id v52;
  AEMinimalTemplateStepText *v53;
  __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  __CFString *v60;
  id v61;
  _QWORD v62[4];
  id v63;
  uint64_t *v64;
  _QWORD v65[4];
  id v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v5));
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableCharacterSet characterSetWithRange:](NSMutableCharacterSet, "characterSetWithRange:", 97, 26));
  objc_msgSend(v8, "addCharactersInRange:", 65, 26);
  objc_msgSend(v8, "addCharactersInString:", CFSTR(".$@_"));
  v52 = objc_msgSend(v8, "copy");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableCharacterSet characterSetWithRange:](NSMutableCharacterSet, "characterSetWithRange:", 97, 26));
  objc_msgSend(v9, "addCharactersInRange:", 65, 26);
  v51 = objc_msgSend(v9, "copy");

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("{}")));
  objc_msgSend(v6, "setCharactersToBeSkipped:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v44 = self;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = sub_FDBC8;
  v72 = sub_FDBD8;
  v73 = 0;
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_FDBE0;
  v65[3] = &unk_1C1F38;
  v67 = &v68;
  v43 = v10;
  v46 = v10;
  v66 = v46;
  v11 = objc_retainBlock(v65);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_FDD28;
  v62[3] = &unk_1C1F60;
  v45 = (id)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
  v63 = v45;
  v64 = &v74;
  v12 = objc_retainBlock(v62);
  v50 = CFSTR("EOF encountered after {{ token");
  while ((objc_msgSend(v6, "isAtEnd") & 1) == 0)
  {
    v61 = 0;
    v13 = objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("{{"), &v61);
    v14 = (__CFString *)v61;
    if (v13)
    {
      v15 = objc_alloc_init(AEMinimalTemplateStepText);
      -[AEMinimalTemplateStepText setText:](v15, "setText:", v14);
      ((void (*)(_QWORD *, AEMinimalTemplateStepText *))v11[2])(v11, v15);
      ((void (*)(_QWORD *, __CFString *))v12[2])(v12, v14);

    }
    if (!objc_msgSend(v6, "scanString:intoString:", CFSTR("{{"), 0))
      goto LABEL_16;
    objc_msgSend(v6, "scanCharactersFromSet:intoString:", v7, 0);
    if ((objc_msgSend(v6, "isAtEnd") & 1) != 0)
      goto LABEL_72;
    v16 = objc_msgSend(v5, "characterAtIndex:", objc_msgSend(v6, "scanLocation"));
    if (v16 == 39)
    {
      objc_msgSend(v6, "scanString:intoString:", CFSTR("'"), 0);
      v59 = v14;
      objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("'"), &v59);
      v18 = v59;

      if (!objc_msgSend(v6, "scanString:intoString:", CFSTR("'"), 0))
      {
        v14 = v18;
        v38 = CFSTR("Unterminated string command");
        goto LABEL_71;
      }
      v19 = objc_alloc_init(AEMinimalTemplateStepText);
      -[AEMinimalTemplateStepText setText:](v19, "setText:", v18);
      ((void (*)(_QWORD *, AEMinimalTemplateStepText *))v11[2])(v11, v19);
      ((void (*)(_QWORD *, __CFString *))v12[2])(v12, v18);
      goto LABEL_14;
    }
    if (v16 == 46)
    {
      objc_msgSend(v6, "scanString:intoString:", CFSTR("."), 0);
      v60 = v14;
      v17 = objc_msgSend(v6, "scanCharactersFromSet:intoString:", v52, &v60);
      v18 = v60;

      if ((v17 & 1) == 0)
      {

        v18 = CFSTR(".");
      }
      v19 = objc_alloc_init(AEMinimalTemplateStepField);
      -[AEMinimalTemplateStepText setKeyPath:](v19, "setKeyPath:", v18);
      ((void (*)(_QWORD *, AEMinimalTemplateStepText *))v11[2])(v11, v19);
LABEL_14:
      v14 = v18;
      goto LABEL_15;
    }
    v58 = v14;
    v20 = objc_msgSend(v6, "scanCharactersFromSet:intoString:", v51, &v58);
    v18 = v58;

    if (!v20)
    {
      v14 = v18;
      v38 = CFSTR("Unexpected characters after {{ token");
      goto LABEL_71;
    }
    if (-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("if")))
    {
      if (!objc_msgSend(v6, "scanCharactersFromSet:intoString:", v7, 0))
      {
        v14 = v18;
        v38 = CFSTR("Unexpected characters after 'if' command");
        goto LABEL_71;
      }
      v21 = objc_msgSend(v6, "scanString:intoString:", CFSTR("!"), 0);
      if ((_DWORD)v21)
        objc_msgSend(v6, "scanCharactersFromSet:intoString:", v7, 0);
      v57 = v18;
      v22 = objc_msgSend(v6, "scanCharactersFromSet:intoString:", v52, &v57);
      v14 = v57;

      if (!v22)
      {
        v38 = CFSTR("Missing conditional in 'if' command");
        goto LABEL_71;
      }
      if (v69[5])
        objc_msgSend(v49, "addObject:");
      v23 = objc_alloc_init(AEMinimalTemplateStepIf);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      -[AEMinimalTemplateStepIf setThenSteps:](v23, "setThenSteps:", v24);

      -[AEMinimalTemplateStepIf setConditional:](v23, "setConditional:", v14);
      -[AEMinimalTemplateStepIf setNegated:](v23, "setNegated:", v21);
    }
    else
    {
      if (-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("else")))
      {
        v25 = v69[5];
        if (!v25
          || (objc_opt_class(AEMinimalTemplateStepIf), (objc_opt_isKindOfClass(v25, v26) & 1) == 0)
          || (v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v69[5], "elseSteps")),
              v27,
              v27))
        {
          v14 = v18;
          v38 = CFSTR("Unexpected {{else}} command");
          goto LABEL_71;
        }
        v19 = (AEMinimalTemplateStepText *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        objc_msgSend((id)v69[5], "setElseSteps:", v19);
        goto LABEL_14;
      }
      if (-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("end")))
      {
        v28 = (void *)v69[5];
        if (!v28)
        {
          v14 = v18;
          v38 = CFSTR("Unexpected {{end}} command");
          goto LABEL_71;
        }
        v19 = v28;
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "lastObject"));
        v30 = (void *)v69[5];
        v69[5] = v29;

        if (v69[5])
          objc_msgSend(v49, "removeLastObject");
        ((void (*)(_QWORD *, AEMinimalTemplateStepText *))v11[2])(v11, v19);
        objc_msgSend(v6, "scanUpToCharactersFromSet:intoString:", v47, 0);
        goto LABEL_14;
      }
      if (!-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("range")))
      {
        if (!-[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("embed")))
        {
          v50 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown command '%@'"), v18));
          v14 = v18;
          goto LABEL_72;
        }
        if (!objc_msgSend(v6, "scanCharactersFromSet:intoString:", v7, 0))
        {
          v14 = v18;
          v38 = CFSTR("Unexpected characters after 'embed' command");
          goto LABEL_71;
        }
        if ((objc_msgSend(v6, "isAtEnd") & 1) != 0
          || !objc_msgSend(v6, "scanString:intoString:", CFSTR("'"), 0))
        {
          v54 = v18;
          v34 = objc_msgSend(v6, "scanCharactersFromSet:intoString:", v51, &v54);
          v14 = v54;

          if (!v34)
          {
            v38 = CFSTR("Missing name in embed");
            goto LABEL_71;
          }
          v33 = v14;
        }
        else
        {
          v55 = v18;
          objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("'"), &v55);
          v14 = v55;

          if ((objc_msgSend(v6, "scanString:intoString:", CFSTR("'"), 0) & 1) == 0)
          {
            v38 = CFSTR("Unterminated string in embed");
LABEL_71:
            v50 = (__CFString *)v38;
LABEL_72:

            goto LABEL_73;
          }
          v33 = v14;
          ((void (*)(_QWORD *, AEMinimalTemplateStepText *))v12[2])(v12, v33);
        }
        objc_msgSend(v6, "scanCharactersFromSet:intoString:", v7, 0);
        v53 = v33;
        v35 = objc_msgSend(v6, "scanCharactersFromSet:intoString:", v52, &v53);
        v14 = v53;

        if (v35)
          v36 = v14;
        else
          v36 = 0;
        v37 = objc_alloc_init(AEMinimalTemplateStepEmbed);
        -[AEMinimalTemplateStepEmbed setName:](v37, "setName:", v33);
        -[AEMinimalTemplateStepEmbed setKeyPath:](v37, "setKeyPath:", v36);
        ((void (*)(_QWORD *, AEMinimalTemplateStepEmbed *))v11[2])(v11, v37);

        v19 = v33;
        goto LABEL_15;
      }
      if (!objc_msgSend(v6, "scanCharactersFromSet:intoString:", v7, 0))
      {
        v14 = v18;
        v38 = CFSTR("Unexpected characters after 'range' command");
        goto LABEL_71;
      }
      v56 = v18;
      v31 = objc_msgSend(v6, "scanCharactersFromSet:intoString:", v52, &v56);
      v14 = v56;

      if (!v31)
      {
        v38 = CFSTR("Missing keyPath in 'range' command");
        goto LABEL_71;
      }
      if (v69[5])
        objc_msgSend(v49, "addObject:");
      v23 = objc_alloc_init(AEMinimalTemplateStepRange);
      -[AEMinimalTemplateStepIf setKeyPath:](v23, "setKeyPath:", v14);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      -[AEMinimalTemplateStepIf setSteps:](v23, "setSteps:", v32);

    }
    v19 = (AEMinimalTemplateStepText *)v69[5];
    v69[5] = (uint64_t)v23;
LABEL_15:

    objc_msgSend(v6, "scanCharactersFromSet:intoString:", v7, 0);
    if ((objc_msgSend(v6, "scanString:intoString:", CFSTR("}}"), 0) & 1) == 0)
    {
      v38 = CFSTR("Missing }} token");
      goto LABEL_71;
    }
LABEL_16:

  }
  if (!v69[5])
  {
    v50 = 0;
    -[AEMinimalTemplate setSteps:](v44, "setSteps:", v46);
    v39 = 1;
    goto LABEL_76;
  }
  v50 = CFSTR("EOF encountered with unbalanced commands");
LABEL_73:
  if (a4)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v75[3]));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", CFSTR("Parse error"), NSLocalizedDescriptionKey, v40, CFSTR("line"), v50, NSLocalizedFailureReasonErrorKey, 0, v43));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("AEMinimalTemplateErrorDomain"), 1, v41));

  }
  v39 = 0;
LABEL_76:

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);

  return v39;
}

- (NSArray)steps
{
  return self->_steps;
}

- (void)setSteps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_steps, 0);
}

@end
