@implementation UIViewAuditIssuesAccessibility

+ (id)_axAuditContrastDetectionForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_axAuditTextCandidateForView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v15 = CFSTR("AX Audit: Element: %@ has an unknown contrast issue type.");
    v16 = v4;
    _AXLogWithFacility();
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), 4001, v15, v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("AXAuditIssueTypeKey"));

        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v13);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v6;
}

+ (id)_axAuditTextCandidateForView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  float v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v24;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIApplicationAuditIssuesAccessibility _axAuditGetTextFromObject:](UIApplicationAuditIssuesAccessibility, "_axAuditGetTextFromObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "alpha");
    if (v6 > 0.0
      && (objc_msgSend(v3, "isHidden") & 1) == 0
      && (objc_msgSend(v3, "isHiddenOrHasHiddenAncestor") & 1) == 0)
    {
      objc_msgSend(a1, "_axAuditCreateContrastIssueForView:text:", v3, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

    }
  }
  v8 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v3, "layer", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(v10, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectAtIndex:", 0);
      objc_msgSend(v12, "opacity");
      if (v13 > 0.0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "string");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");

          if (v15)
          {
            objc_msgSend(a1, "_axAuditCreateContrastIssueForCATextLayer:withView:", v12, v3);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v16);

          }
        }
      }
      objc_msgSend(v12, "sublayers");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        objc_msgSend(v12, "sublayers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        if (v20)
        {
          objc_msgSend(v12, "sublayers");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v21);

        }
      }

      if (!objc_msgSend(v10, "count"))
        break;
    }
    while (v11++ < 0x270F);
  }

  return v4;
}

+ (id)_axAuditCreateContrastIssueForView:(id)a3 text:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LOBYTE(v26) = 0;
    objc_opt_class();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("textColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(a1, "_axAuditHexValueForColor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v6, "backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v25 = 0;
    v26 = 0;
    v23 = 0.0;
    v24 = 0;
    v22 = 0;
    if ((objc_msgSend(v11, "getRed:green:blue:alpha:", &v26, &v25, &v24, &v23) & 1) != 0)
      v13 = 1;
    else
      v13 = objc_msgSend(v12, "getWhite:alpha:", &v22, &v23);
    v14 = 0;
    if (v13 && v23 > 0.0)
    {
      objc_msgSend(a1, "_axAuditHexValueForColor:", v12, v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v14 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LOBYTE(v26) = 0;
    objc_opt_class();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("font"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_BYTE)v26)
      abort();
    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v16, "pointSize");
      objc_msgSend(v17, "numberWithDouble:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }
  +[UIAccessibilityAuditUtilities dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:](UIAccessibilityAuditUtilities, "dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:", 0, v6, 0, v7, v10, v14, v18, 0, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  return v20;
}

+ (id)_axAuditCreateContrastIssueForCATextLayer:(id)a3 withView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v6, "superlayer");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    do
    {
      objc_msgSend(v18, "frame");
      v10 = v10 + v19;
      objc_msgSend(v18, "frame");
      v12 = v12 + v20;
      objc_msgSend(v18, "superlayer");
      v21 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v21;
    }
    while (v21);
  }
  objc_msgSend(v7, "accessibilityFrame");
  v23 = v10 + v22;
  objc_msgSend(v7, "accessibilityFrame");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v23, v12 + v24, v14, v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", objc_msgSend(v6, "foregroundColor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_axAuditHexValueForColor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "fontSize");
  *(float *)&v29 = v29;
  objc_msgSend(v28, "numberWithFloat:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIAccessibilityAuditUtilities dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:](UIAccessibilityAuditUtilities, "dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:", 0, v7, 0, v8, v27, 0, v30, v25, v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "mutableCopy");

  return v32;
}

+ (id)_axAuditHexValueForColor:(id)a3
{
  id v3;
  const CGFloat *Components;
  id v5;
  CGColor *v6;
  size_t NumberOfComponents;
  float v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v3 = objc_retainAutorelease(a3);
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(v3, "CGColor"));
  v5 = objc_retainAutorelease(v3);
  v6 = (CGColor *)objc_msgSend(v5, "CGColor");

  NumberOfComponents = CGColorGetNumberOfComponents(v6);
  if (NumberOfComponents == 2)
  {
    v8 = *Components * 255.0;
    v9 = llroundf(v8);
    v10 = v9;
    v11 = v9;
  }
  else if (NumberOfComponents < 3)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
  }
  else
  {
    v12 = *Components * 255.0;
    v11 = llroundf(v12);
    v13 = Components[1] * 255.0;
    v10 = llroundf(v13);
    v14 = Components[2] * 255.0;
    v9 = llroundf(v14);
  }
  v15 = v11 & ~(v11 >> 63);
  if (v15 >= 0xFF)
    v15 = 255;
  v16 = v10 & ~(v10 >> 63);
  if (v16 >= 0xFF)
    v16 = 255;
  v17 = v9 & ~(v9 >> 63);
  if (v17 >= 0xFF)
    v17 = 255;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02lX%02lX%02lX"), v15, v16, v17);
}

@end
