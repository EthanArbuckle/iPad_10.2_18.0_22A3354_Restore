@implementation VMUOptionParser

- (VMUOptionParser)init
{
  VMUOptionParser *v2;
  uint64_t v3;
  NSMutableArray *optionDescriptions;
  uint64_t v5;
  NSMutableArray *appleInternalOptionDescriptions;
  uint64_t v7;
  NSMutableDictionary *optionBlockByString;
  uint64_t v9;
  NSMutableString *shortOpts;
  CFArrayCallBacks callBacks;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VMUOptionParser;
  v2 = -[VMUOptionParser init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    optionDescriptions = v2->_optionDescriptions;
    v2->_optionDescriptions = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    appleInternalOptionDescriptions = v2->_appleInternalOptionDescriptions;
    v2->_appleInternalOptionDescriptions = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    optionBlockByString = v2->_optionBlockByString;
    v2->_optionBlockByString = (NSMutableDictionary *)v7;

    callBacks.version = 1;
    callBacks.retain = 0;
    callBacks.copyDescription = 0;
    callBacks.equal = 0;
    callBacks.release = (CFArrayReleaseCallBack)_arrayFreeValue;
    v2->_longOptStructs = CFArrayCreateMutable(0, 0, &callBacks);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR(":"));
    shortOpts = v2->_shortOpts;
    v2->_shortOpts = (NSMutableString *)v9;

    v2->_parametersShowAsAssignment = 1;
  }
  return v2;
}

- (void)dealloc
{
  __CFArray *longOptStructs;
  objc_super v4;

  longOptStructs = self->_longOptStructs;
  if (longOptStructs)
  {
    CFRelease(longOptStructs);
    self->_longOptStructs = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VMUOptionParser;
  -[VMUOptionParser dealloc](&v4, sel_dealloc);
}

- (void)registerOptionWithLongName:(id)a3 shortName:(id)a4 argumentKind:(int)a5 argumentName:(id)a6 optionDescription:(id)a7 handler:(id)a8
{
  -[VMUOptionParser registerOptionWithLongName:shortName:argumentKind:argumentName:optionDescription:flags:handler:](self, "registerOptionWithLongName:shortName:argumentKind:argumentName:optionDescription:flags:handler:", a3, a4, *(_QWORD *)&a5, a6, a7, 0, a8);
}

- (void)registerOptionWithLongName:(id)a3 shortName:(id)a4 argumentKind:(int)a5 argumentName:(id)a6 optionDescription:(id)a7 flags:(unint64_t)a8 handler:(id)a9
{
  char v9;
  id v15;
  id v16;
  id v17;
  id v18;
  size_t v19;
  id v20;
  id v21;
  char v22;
  char *v23;
  id v24;
  char *v25;
  NSMutableDictionary *optionBlockByString;
  void *v27;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  const char *v33;
  _BOOL4 v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t spacing;
  uint64_t v42;
  id v43;
  void *context;
  id v45;

  v9 = a8;
  v45 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  context = (void *)MEMORY[0x1A85A9758]();
  if (v45)
  {
    v19 = objc_msgSend(v45, "length") + 33;
    v43 = v17;
    v20 = v18;
    v21 = v16;
    v22 = v9;
    v23 = (char *)malloc_type_malloc(v19, 0x189F0BE4uLL);
    v24 = objc_retainAutorelease(v45);
    strlcpy(v23 + 32, (const char *)objc_msgSend(v24, "UTF8String"), v19);
    *(_QWORD *)v23 = v23 + 32;
    *((_DWORD *)v23 + 2) = a5;
    *((_QWORD *)v23 + 2) = 0;
    *((_DWORD *)v23 + 6) = 1;
    v25 = v23;
    v9 = v22;
    v16 = v21;
    v18 = v20;
    v17 = v43;
    CFArrayAppendValue(self->_longOptStructs, v25);
    optionBlockByString = self->_optionBlockByString;
    v27 = (void *)MEMORY[0x1A85A995C](v18);
    -[NSMutableDictionary setObject:forKey:](optionBlockByString, "setObject:forKey:", v27, v24);

  }
  if (v15)
  {
    -[NSMutableString appendString:](self->_shortOpts, "appendString:", v15);
    if (a5 == 1)
      -[NSMutableString appendString:](self->_shortOpts, "appendString:", CFSTR(":"));
    v28 = self->_optionBlockByString;
    v29 = (void *)MEMORY[0x1A85A995C](v18);
    -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v29, v15);

  }
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("        "));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v15)
    {
      objc_msgSend(v30, "appendFormat:", CFSTR("-%@"), v15);
      if (!v45)
      {
        if (!a5 || !v16)
          goto LABEL_34;
        v34 = a5 == 1;
        goto LABEL_22;
      }
      objc_msgSend(v31, "appendString:", CFSTR("/"));
      v32 = v45;
    }
    else
    {
      v32 = v45;
      if (!v45)
      {
        if (!a5 || !v16)
          goto LABEL_34;
        v34 = a5 == 1;
LABEL_26:
        if (self->_parametersShowAsAssignment)
          v35 = 61;
        else
          v35 = 32;
        goto LABEL_29;
      }
    }
    if (self->_singleHyphenLongNames)
      v33 = "-";
    else
      v33 = "--";
    objc_msgSend(v31, "appendFormat:", CFSTR("%s%@"), v33, v32);
    if (!a5 || !v16)
      goto LABEL_34;
    v34 = a5 == 1;
    if (!v15)
      goto LABEL_26;
LABEL_22:
    v35 = 32;
LABEL_29:
    v36 = !v34;
    v37 = 93;
    if (!v36)
      v37 = 62;
    v42 = v37;
    v38 = 91;
    if (!v36)
      v38 = 60;
    objc_msgSend(v31, "appendFormat:", CFSTR("%c%c%@%c"), v35, v38, v16, v42);
LABEL_34:
    v39 = objc_msgSend(v31, "length");
    objc_msgSend(v31, "appendFormat:", CFSTR("[@@@spacing@@@]%@"), v17);
    if ((v9 & 1) != 0)
    {
      if (!os_variant_has_internal_content())
      {
LABEL_41:

        goto LABEL_42;
      }
      v40 = 40;
    }
    else
    {
      v40 = 32;
    }
    objc_msgSend(*(id *)((char *)&self->super.isa + v40), "addObject:", v31);
    spacing = self->_spacing;
    if (spacing <= v39 + 2)
      spacing = v39 + 2;
    self->_spacing = spacing;
    goto LABEL_41;
  }
LABEL_42:
  objc_autoreleasePoolPop(context);

}

- (int)optind
{
  return *MEMORY[0x1E0C844E0];
}

- (id)parseArgumentsArray:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = malloc_type_malloc(8 * objc_msgSend(v6, "count") + 8, 0x10040436913F5uLL);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  v11 = v8;
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v19;
    v11 = v8;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v9);
        v15 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14));
        *v11++ = objc_msgSend(v15, "UTF8String", (_QWORD)v18);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  *v11 = 0;
  -[VMUOptionParser parseArguments:withBlock:](self, "parseArguments:withBlock:", v8, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  free(v8);

  return v16;
}

- (id)parseArguments:(char *)a3 withBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  CFIndex Count;
  CFIndex v10;
  option *v11;
  _OWORD *ValueAtIndex;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  id v22;
  uint64_t *v23;
  unint64_t v24;
  option *v25;
  uint64_t v26;
  void *v27;
  NSMutableDictionary *optionBlockByString;
  const char *name;
  void *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  id v32;
  void *v33;
  id v34;
  NSMutableDictionary *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  int v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  int v48;
  void *v49;
  void *context;
  option *v52;
  VMUOptionParser *v53;
  void *v54;
  void (**v55)(id, void *, id *);
  char *v56;
  id v57;
  id v58;
  id v59;
  int v60;

  v55 = (void (**)(id, void *, id *))a4;
  v6 = (void *)MEMORY[0x1A85A9758]();
  v56 = (char *)-[NSMutableString UTF8String](self->_shortOpts, "UTF8String");
  if (a3 && *a3)
  {
    v7 = 0;
    while (a3[++v7])
      ;
    Count = CFArrayGetCount(self->_longOptStructs);
    v52 = (option *)malloc_type_calloc(Count + 1, 0x20uLL, 0x10500402E37B38AuLL);
    if (Count >= 1)
    {
      v10 = 0;
      v11 = v52;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(self->_longOptStructs, v10);
        v13 = ValueAtIndex[1];
        *(_OWORD *)&v11->name = *ValueAtIndex;
        *(_OWORD *)&v11->flag = v13;
        ++v11;
        ++v10;
      }
      while (Count != v10);
    }
    v60 = 0;
    v14 = getopt_long_only(v7, a3, v56, v52, &v60);
    context = v6;
    v53 = self;
    if ((_DWORD)v14 != -1)
    {
      v20 = v14;
      v21 = 0;
      v22 = 0;
      v54 = 0;
      v23 = (uint64_t *)MEMORY[0x1E0C844D0];
      v24 = 0x1E0CB3000uLL;
      v25 = v52;
      while (1)
      {
        v26 = *v23;
        if (*v23)
        {
          objc_msgSend(*(id *)(v24 + 2368), "stringWithUTF8String:");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = 0;
        }
        if ((_DWORD)v20 == 63)
        {
          VMUOptionParserError(-1, CFSTR("unrecognized option '%s'"), v26, v15, v16, v17, v18, v19, (uint64_t)a3[*MEMORY[0x1E0C844E0] - 1]);
        }
        else
        {
          if ((_DWORD)v20 != 58)
          {
            if ((_DWORD)v20 == 1)
            {
              optionBlockByString = v53->_optionBlockByString;
              if (v25[v60].name)
                name = v25[v60].name;
              else
                name = "";
              objc_msgSend(*(id *)(v24 + 2368), "stringWithUTF8String:", name);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKey:](optionBlockByString, "objectForKey:", v30);
              v31 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

              if (v31)
              {
                v32 = v54;
                if (v22)
                  v33 = v54;
                else
                  v33 = 0;
                v59 = v33;
                ((void (**)(_QWORD, void *, id *))v31)[2](v31, v27, &v59);
                v34 = v59;
                if (v22)
                  v32 = v34;
                v54 = v32;
                v24 = 0x1E0CB3000;
                if (!v22)
                  v22 = v34;

              }
            }
            else
            {
              v35 = v53->_optionBlockByString;
              objc_msgSend(*(id *)(v24 + 2368), "stringWithFormat:", CFSTR("%c"), v20, context);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKey:](v35, "objectForKey:", v36);
              v31 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

              if (v31)
              {
                v37 = v54;
                if (v22)
                  v38 = v54;
                else
                  v38 = 0;
                v58 = v38;
                ((void (**)(_QWORD, void *, id *))v31)[2](v31, v27, &v58);
                v39 = v58;
                if (v22)
                  v37 = v39;
                v54 = v37;
                if (!v22)
                  v22 = v39;

              }
              v25 = v52;
              v24 = 0x1E0CB3000;
            }
            goto LABEL_41;
          }
          VMUOptionParserError(-1, CFSTR("%s flag supplied with no argument"), v26, v15, v16, v17, v18, v19, (uint64_t)a3[*MEMORY[0x1E0C844E0] - 1]);
        }
        v31 = v21;
        v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
LABEL_41:

        v20 = getopt_long_only(v7, a3, v56, v25, &v60);
        if ((_DWORD)v20 == -1)
          goto LABEL_45;
      }
    }
    v54 = 0;
    v22 = 0;
    v21 = 0;
    v25 = v52;
LABEL_45:
    v41 = *MEMORY[0x1E0C844E0];
    v42 = v7 - 1;
    if (*MEMORY[0x1E0C844E0] <= (int)v7 - 1)
    {
      v44 = v54;
      while (1)
      {
        if (v55)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3[v41]);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            v46 = v44;
          else
            v46 = 0;
          v57 = v46;
          v55[2](v55, v45, &v57);
          v47 = v57;
          if (v22)
            v44 = v47;
          else
            v22 = v47;

          v42 = v7 - 1;
        }
        if (v22)
          break;
        v43 = 0;
        v48 = *MEMORY[0x1E0C844E0];
        v41 = *MEMORY[0x1E0C844E0] + 1;
        *MEMORY[0x1E0C844E0] = v41;
        if (v48 >= v42)
          goto LABEL_60;
      }
      v43 = v22;
    }
    else
    {
      v43 = v22;
      v44 = v54;
    }
LABEL_60:
    *MEMORY[0x1E0C844E0] = 0;
    -[NSMutableDictionary removeAllObjects](v53->_optionBlockByString, "removeAllObjects");
    free(v25);

    objc_autoreleasePoolPop(context);
    if (v43)
      v49 = v43;
    else
      v49 = v21;
    v40 = v49;

  }
  else
  {
    objc_autoreleasePoolPop(v6);
    v40 = 0;
  }

  return v40;
}

- (void)usage:(id)a3 shouldExit:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  FILE **v8;
  NSString *customUsageDescription;
  FILE *v10;
  const char *v11;
  FILE *v12;
  const char *v13;
  NSString *discussionDescription;
  id v15;

  v4 = a4;
  v15 = a3;
  objc_msgSend(v15, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CB2D50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (FILE **)MEMORY[0x1E0C80C10];
  if (v7 && objc_msgSend(v15, "code"))
    fprintf(*v8, "[invalid usage]: %s\n\n", (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
  customUsageDescription = self->_customUsageDescription;
  if (customUsageDescription)
  {
    fprintf(*v8, "%s\n", -[NSString UTF8String](customUsageDescription, "UTF8String"));
  }
  else
  {
    if (self->_purposeDescription)
    {
      v10 = *v8;
      v11 = getprogname();
      fprintf(v10, "%s: %s\n\n", v11, -[NSString UTF8String](self->_purposeDescription, "UTF8String"));
    }
    if (self->_syntaxDescription)
    {
      v12 = *v8;
      v13 = getprogname();
      fprintf(v12, "Usage: %s %s\n\n", v13, -[NSString UTF8String](self->_syntaxDescription, "UTF8String"));
    }
    discussionDescription = self->_discussionDescription;
    if (discussionDescription)
      fprintf(*v8, "%s\n\n", -[NSString UTF8String](discussionDescription, "UTF8String"));
    -[VMUOptionParser printOptionDescriptions:](self, "printOptionDescriptions:", self->_optionDescriptions);
    if (-[NSMutableArray count](self->_appleInternalOptionDescriptions, "count"))
    {
      fwrite("\nApple-internal options:\n", 0x19uLL, 1uLL, *v8);
      -[VMUOptionParser printOptionDescriptions:](self, "printOptionDescriptions:", self->_appleInternalOptionDescriptions);
    }
  }
  if (v4)
  {
    if (!self->_abortOnError)
      exit(objc_msgSend(v15, "code"));
    abort();
  }

}

- (void)usage:(id)a3
{
  -[VMUOptionParser usage:shouldExit:](self, "usage:shouldExit:", a3, 1);
}

- (void)clearOptionDescriptions
{
  -[NSMutableArray removeAllObjects](self->_optionDescriptions, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_appleInternalOptionDescriptions, "removeAllObjects");
}

- (void)printOptionDescriptions:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v14 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v14)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "rangeOfString:", CFSTR("[@@@spacing@@@]"));
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%*s"), self->_spacing - v8, ");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("[@@@spacing@@@]"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%*s"), (LODWORD(self->_spacing) + 3), ");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s\n", (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

- (NSString)purposeDescription
{
  return self->_purposeDescription;
}

- (void)setPurposeDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)syntaxDescription
{
  return self->_syntaxDescription;
}

- (void)setSyntaxDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)discussion
{
  return self->_discussionDescription;
}

- (void)setDiscussion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)singleHyphenLongNames
{
  return self->_singleHyphenLongNames;
}

- (void)setSingleHyphenLongNames:(BOOL)a3
{
  self->_singleHyphenLongNames = a3;
}

- (BOOL)parametersShowAsAssignment
{
  return self->_parametersShowAsAssignment;
}

- (void)setParametersShowAsAssignment:(BOOL)a3
{
  self->_parametersShowAsAssignment = a3;
}

- (NSString)customUsageDescription
{
  return self->_customUsageDescription;
}

- (void)setCustomUsageDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)abortOnError
{
  return self->_abortOnError;
}

- (void)setAbortOnError:(BOOL)a3
{
  self->_abortOnError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customUsageDescription, 0);
  objc_storeStrong((id *)&self->_shortOpts, 0);
  objc_storeStrong((id *)&self->_optionBlockByString, 0);
  objc_storeStrong((id *)&self->_appleInternalOptionDescriptions, 0);
  objc_storeStrong((id *)&self->_optionDescriptions, 0);
  objc_storeStrong((id *)&self->_discussionDescription, 0);
  objc_storeStrong((id *)&self->_syntaxDescription, 0);
  objc_storeStrong((id *)&self->_purposeDescription, 0);
}

@end
