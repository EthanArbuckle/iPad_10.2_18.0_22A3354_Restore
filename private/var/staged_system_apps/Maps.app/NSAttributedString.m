@implementation NSAttributedString

- (id)_maps_attributedStringByApplyingBindingFormatReplacements:(id)a3
{
  return -[NSAttributedString _mapkit_attributedStringByApplyingBindingFormatReplacements:](self, "_mapkit_attributedStringByApplyingBindingFormatReplacements:", a3);
}

- (id)_maps_attributedStringWithExcessiveHeightCharacterSupport
{
  return -[NSAttributedString _maps_attributedStringWithExcessiveHeightCharacterSupport:](self, "_maps_attributedStringWithExcessiveHeightCharacterSupport:", 1.29999995);
}

- (id)_maps_attributedStringWithExcessiveHeightCharacterSupport:(double)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSAttributedString *v11;
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSAttributedString string](self, "string"));
  if ((objc_msgSend(v5, "_maps_containsExcessiveHeightCharacters") & 1) != 0)
  {
    v6 = -[NSAttributedString mutableCopy](self, "mutableCopy");
    v7 = objc_msgSend(v5, "length");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attribute:atIndex:effectiveRange:", NSParagraphStyleAttributeName, 0, 0));
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
      v10 = objc_msgSend(v12, "mutableCopy");

    }
    objc_msgSend(v10, "setLineHeightMultiple:", a3);
    objc_msgSend(v6, "addAttribute:value:range:", NSParagraphStyleAttributeName, v10, 0, v7);
    v11 = (NSAttributedString *)objc_msgSend(v6, "copy");

  }
  else
  {
    v11 = self;
  }

  return v11;
}

- (id)_maps_attributedStringByAppendingRidesharingSpecialPricingBadge:(id)a3 representativeContentFont:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSAttributedString *v23;
  _QWORD v25[2];
  _QWORD v26[2];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "lineHeight");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "badgeImageWithMaximumDimension:"));

  if (v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)NSTextAttachment), "initWithData:ofType:", 0, 0);
    objc_msgSend(v9, "setImage:", v8);
    objc_msgSend(v6, "lineHeight");
    v11 = v10;
    objc_msgSend(v8, "size");
    v13 = (v11 - v12) * 0.5;
    objc_msgSend(v6, "descender");
    v15 = v14 + v13;
    objc_msgSend(v8, "size");
    objc_msgSend(v9, "setBounds:", 0.0, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v9));
    v19 = (void *)objc_opt_class(self);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SUBTITLE - SURGE ICON INDICATOR [Ridesharing format string]"), CFSTR("localized string not found"), 0));
    v25[0] = CFSTR("subtitle");
    v25[1] = CFSTR("surgeIcon");
    v26[0] = self;
    v26[1] = v18;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
    v23 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_mapkit_attributedStringWithBindingFormat:replacements:attributes:", v21, v22, 0));

  }
  else
  {
    v23 = self;
  }

  return v23;
}

+ (id)unsafeBoldCharacterSet
{
  if (qword_1014D39A0 != -1)
    dispatch_once(&qword_1014D39A0, &stru_1011DBD90);
  return (id)qword_1014D39A8;
}

+ (NSAttributedString)attributedStringWithText:(id)a3 boldInRange:(id)a4 font:(id)a5 bold:(id)a6
{
  return (NSAttributedString *)objc_msgSend(a1, "attributedStringWithText:highlightRanges:font:highlightedFont:highlightedTextColor:", a3, a4, a5, a6, 0);
}

+ (NSAttributedString)attributedStringWithText:(id)a3 highlightRanges:(id)a4 font:(id)a5 highlightedFont:(id)a6 highlightedTextColor:(id)a7
{
  return (NSAttributedString *)objc_msgSend(a1, "attributedStringWithText:highlightRanges:font:highlightedFont:highlightedTextColor:unhighlightedTextColor:", a3, a4, a5, a6, a7, 0);
}

+ (NSAttributedString)attributedStringWithText:(id)a3 highlightRanges:(id)a4 font:(id)a5 highlightedFont:(id)a6 highlightedTextColor:(id)a7 unhighlightedTextColor:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  NSAttributedStringKey v43;
  id v44;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v37 = a7;
  v17 = a8;
  if (objc_msgSend(v13, "length"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString unsafeBoldCharacterSet](NSAttributedString, "unsafeBoldCharacterSet"));
    v19 = objc_alloc((Class)NSMutableAttributedString);
    v43 = NSFontAttributeName;
    v44 = v15;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
    v21 = objc_msgSend(v19, "initWithString:attributes:", v13, v20);

    if (v17)
      objc_msgSend(v21, "addAttribute:value:range:", NSForegroundColorAttributeName, v17, 0, objc_msgSend(v13, "length"));
    if (objc_msgSend(v14, "count") && objc_msgSend(v13, "rangeOfCharacterFromSet:", v18) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v32 = v18;
      v33 = v17;
      v34 = v15;
      v35 = v14;
      v36 = v13;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v22 = v14;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(_QWORD *)v39 != v25)
              objc_enumerationMutation(v22);
            v27 = (char *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i), "rangeValue", v32, v33, v34, v35, v36);
            if (v27 != (char *)0x7FFFFFFFFFFFFFFFLL)
            {
              v29 = v27;
              v30 = v28;
              if (&v27[v28] <= objc_msgSend(v21, "length"))
              {
                if (v16)
                  objc_msgSend(v21, "addAttribute:value:range:", NSFontAttributeName, v16, v29, v30);
                if (v37)
                  objc_msgSend(v21, "addAttribute:value:range:", NSForegroundColorAttributeName, v37, v29, v30);
              }
            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        }
        while (v24);
      }

      v14 = v35;
      v13 = v36;
      v17 = v33;
      v15 = v34;
      v18 = v32;
    }

  }
  else
  {
    v21 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", &stru_1011EB268);
  }

  return (NSAttributedString *)v21;
}

- (NSAttributedString)_maps_attributedStringByReplacingWhitespaceToAvoidOrphanWords
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  const char *v20;
  int64x2_t v21;

  v2 = -[NSAttributedString mutableCopy](self, "mutableCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "string"));
  v17 = 0;
  v18 = &v17;
  v19 = 0x3010000000;
  v20 = "";
  v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100911098;
  v12[3] = &unk_1011BE128;
  v12[4] = &v13;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, objc_msgSend(v3, "length"), 3, v12);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009110B0;
  v11[3] = &unk_1011BE128;
  v11[4] = &v17;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, objc_msgSend(v3, "length"), 259, v11);
  v4 = v18[4];
  if (v4 && v4 != 0x7FFFFFFFFFFFFFFFLL && (unint64_t)v18[5] <= 1 && (unint64_t)v14[3] > 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
    v9 = v4 - 1;
    v10 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v8, 0, v9, 1);

    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v2, "replaceCharactersInRange:withString:", v9, 1, CFSTR(" "));
    v5 = objc_msgSend(v2, "copy");
  }
  else
  {
    v5 = v2;
  }
  v6 = v5;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return (NSAttributedString *)v6;
}

@end
