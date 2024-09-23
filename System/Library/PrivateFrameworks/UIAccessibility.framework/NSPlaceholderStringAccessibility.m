@implementation NSPlaceholderStringAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSPlaceholderString");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (NSPlaceholderStringAccessibility)initWithFormat:(id)a3 locale:(id)a4 arguments:(char *)a5
{
  id v8;
  id v9;
  NSPlaceholderStringAccessibility *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  NSPlaceholderStringAccessibility *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  char *v61;
  char *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v61 = a5;
  v62 = a5;
  v60.receiver = self;
  v60.super_class = (Class)NSPlaceholderStringAccessibility;
  v10 = -[NSPlaceholderStringAccessibility initWithFormat:locale:arguments:](&v60, sel_initWithFormat_locale_arguments_, v8, v9, a5);
  if (v10)
  {
    objc_msgSend(v8, "_accessibilityAttributedLocalizedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithString:", v10);
    if (v11)
    {
      objc_msgSend(v11, "coalescedAttributes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAttributes:", v13);

    }
    NSClassFromString(CFSTR("__NSLocalizedString"));
    v46 = v11;
    v47 = v9;
    v51 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "safeDictionaryForKey:", CFSTR("config"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?<!%)%((#(?=([0-9]?)))?[0-9]*([+-])?(\\.)?[0-9]*)?([hl]{0,2}|[qLztj]{0,1}|[*])((#@[a-zA-Z0-9]+@)|([@dDxXoOuifeEgGcCsSpaAF]{1}))"), 0, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v55, "count");
    v50 = objc_msgSend(v12, "length");
    v53 = v14;
    v54 = v15;
    if (v15)
    {
      v49 = 0;
      v16 = 0;
      v52 = *MEMORY[0x1E0C9B338];
      v48 = v8;
      do
      {
        objc_msgSend(v55, "objectAtIndexedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "range");
        objc_msgSend(v8, "substringWithRange:", v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        objc_msgSend(v14, "allKeys");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v57;
          while (2)
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v57 != v24)
                objc_enumerationMutation(v21);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%%#@%@@"), *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v20, "isEqualToString:", v26))
              {
                v27 = (void *)MEMORY[0x1E0CB3940];
                v14 = v53;
                objc_msgSend(v53, "objectForKey:", v52);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "stringWithFormat:", CFSTR("%%%@"), v28);
                v29 = objc_claimAutoreleasedReturnValue();

                v20 = (void *)v29;
                goto LABEL_19;
              }

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
            if (v23)
              continue;
            break;
          }
          v14 = v53;
        }
LABEL_19:

        if (objc_msgSend(v20, "hasPrefix:", CFSTR("%@")))
        {
          v30 = (id *)v61;
          v61 += 8;
          v31 = *v30;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v31, "_accessibilityAttributedLocalizedString");
            v32 = objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              v33 = (void *)v32;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v34 = v31;
LABEL_37:
                v37 = v34;
                if (v34)
                {
                  v38 = -[NSPlaceholderStringAccessibility rangeOfString:options:range:](v51, "rangeOfString:options:range:", v34, 0, v49, v50);
                  if (v38 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v40 = v38;
                    v41 = v39;
                    objc_msgSend(v33, "coalescedAttributes");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "setAttributes:withRange:", v42, v40, v41);

                    v14 = v53;
                    v49 = v40 + v41;
                    v50 = objc_msgSend(v12, "length") - (v40 + v41);
                  }
                  v8 = v48;
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v31, "string");
                  v34 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_37;
                }
                v37 = 0;
              }

            }
          }

          goto LABEL_44;
        }
        if (objc_msgSend(v20, "hasPrefix:", CFSTR("%*")))
          v61 += 8;
        if ((objc_msgSend(v20, "_containsSubstring:", CFSTR("g")) & 1) != 0
          || (objc_msgSend(v20, "_containsSubstring:", CFSTR("f")) & 1) != 0
          || (objc_msgSend(v20, "_containsSubstring:", CFSTR("G")) & 1) != 0
          || (objc_msgSend(v20, "_containsSubstring:", CFSTR("F")) & 1) != 0
          || (objc_msgSend(v20, "_containsSubstring:", CFSTR("a")) & 1) != 0
          || objc_msgSend(v20, "_containsSubstring:", CFSTR("A")))
        {
          v35 = v20;
          v36 = CFSTR("L");
        }
        else
        {
          if (objc_msgSend(v20, "_containsSubstring:", CFSTR("s"))
            || objc_msgSend(v20, "_containsSubstring:", CFSTR("c"))
            || objc_msgSend(v20, "_containsSubstring:", CFSTR("p"))
            || objc_msgSend(v20, "_containsSubstring:", CFSTR("z"))
            || (objc_msgSend(v20, "_containsSubstring:", CFSTR("d")) & 1) == 0
            && (objc_msgSend(v20, "_containsSubstring:", CFSTR("D")) & 1) == 0
            && !objc_msgSend(v20, "_containsSubstring:", CFSTR("i"))
            && (objc_msgSend(v20, "_containsSubstring:", CFSTR("u")) & 1) == 0
            && (objc_msgSend(v20, "_containsSubstring:", CFSTR("U")) & 1) == 0
            && (objc_msgSend(v20, "_containsSubstring:", CFSTR("x")) & 1) == 0
            && (objc_msgSend(v20, "_containsSubstring:", CFSTR("X")) & 1) == 0
            && !objc_msgSend(v20, "_containsSubstring:", CFSTR("o"))
            || objc_msgSend(v20, "_containsSubstring:", CFSTR("ll")))
          {
            goto LABEL_34;
          }
          v35 = v20;
          v36 = CFSTR("l");
        }
        objc_msgSend(v35, "_containsSubstring:", v36);
LABEL_34:
        v61 += 8;
LABEL_44:

        ++v16;
      }
      while (v16 != v54);
    }
    v10 = v51;
    if ((objc_msgSend(v12, "hasAttributes") & 1) != 0)
    {
      v43 = (void *)objc_msgSend(v12, "copy");
      -[NSPlaceholderStringAccessibility _setAccessibilityAttributedLocalizedString:](v51, "_setAccessibilityAttributedLocalizedString:", v43);

      v14 = v53;
    }

    v9 = v47;
  }

  return v10;
}

@end
