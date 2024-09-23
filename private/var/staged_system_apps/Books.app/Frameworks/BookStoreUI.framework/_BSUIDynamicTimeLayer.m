@implementation _BSUIDynamicTimeLayer

- (_BSUIDynamicTimeLayer)init
{
  _BSUIDynamicTimeLayer *v2;
  _BSUIDynamicTimeLayer *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_BSUIDynamicTimeLayer;
  v2 = -[_BSUIDynamicTimeLayer init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[_BSUIDynamicTimeLayer _generateDigits](v2, "_generateDigits");
    -[_BSUIDynamicTimeLayer setSavedAnimatedReadingTime:](v3, "setSavedAnimatedReadingTime:", -1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "_generateDigits", NSCurrentLocaleDidChangeNotification, 0);

  }
  return v3;
}

- (void)_generateDigits
{
  NSNumberFormatter *v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *digits;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 10));
  v3 = objc_opt_new(NSNumberFormatter);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  -[NSNumberFormatter setLocale:](v3, "setLocale:", v4);

  for (i = 0; i != 10; ++i)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", i));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v3, "stringFromNumber:", v6));
    objc_msgSend(v10, "addObject:", v7);

  }
  v8 = (NSArray *)objc_msgSend(v10, "copy");
  digits = self->_digits;
  self->_digits = v8;

}

- (void)setFont:(id)a3 useFontFallback:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  UIFont *v17;
  UIFont *font;
  UIFontDescriptorAttributeName v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fontDescriptor"));
  v24[0] = &off_2FB978;
  v23[0] = UIFontFeatureTypeIdentifierKey;
  v23[1] = UIFontFeatureSelectorIdentifierKey;
  if (v4)
    v8 = 6;
  else
    v8 = 2;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
  v24[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
  v25[0] = v10;
  v21[0] = UIFontFeatureTypeIdentifierKey;
  v21[1] = UIFontFeatureSelectorIdentifierKey;
  v22[0] = &off_2FB990;
  v22[1] = &off_2FB9A8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));
  v25[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));

  v19 = UIFontDescriptorFeatureSettingsAttribute;
  v20 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fontDescriptorByAddingAttributes:", v13));

  objc_msgSend(v6, "pointSize");
  v16 = v15;

  v17 = (UIFont *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v14, v16));
  font = self->_font;
  self->_font = v17;

}

- (id)newTextLayerAtFrame:(CGRect)a3 character:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CATextLayer *v10;
  void *v11;
  void *v12;
  id v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = objc_opt_new(CATextLayer);
  -[CATextLayer setAnchorPoint:](v10, "setAnchorPoint:", 0.0, 0.0);
  -[CATextLayer setFrame:](v10, "setFrame:", x, y, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIDynamicTimeLayer font](self, "font"));
  -[CATextLayer setFont:](v10, "setFont:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIDynamicTimeLayer font](self, "font"));
  objc_msgSend(v12, "pointSize");
  -[CATextLayer setFontSize:](v10, "setFontSize:");

  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[_BSUIDynamicTimeLayer color](self, "color")));
  -[CATextLayer setForegroundColor:](v10, "setForegroundColor:", objc_msgSend(v13, "CGColor"));

  -[CATextLayer setAlignmentMode:](v10, "setAlignmentMode:", kCAAlignmentCenter);
  -[_BSUIDynamicTimeLayer contentsScale](self, "contentsScale");
  -[CATextLayer setContentsScale:](v10, "setContentsScale:");
  -[CATextLayer setString:](v10, "setString:", v9);

  return v10;
}

- (void)setColor:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *color;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[UITraitCollection _currentTraitCollection](UITraitCollection, "_currentTraitCollection"));
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resolvedColorWithTraitCollection:", v11));
  color = self->_color;
  self->_color = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIDynamicTimeLayer outgoingLayers](self, "outgoingLayers"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_3C6F4;
  v14[3] = &unk_2E57E0;
  v8 = v4;
  v15 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIDynamicTimeLayer currentLayers](self, "currentLayers"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_3C744;
  v12[3] = &unk_2E57E0;
  v13 = v8;
  v10 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

}

- (void)setReadingTime:(int64_t)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v6;
  unsigned int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  __CFString *timeSeparator;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char *i;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *j;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  void *k;
  id v55;
  void *v56;
  double v57;
  void *v58;
  id v59;
  id v60;
  uint64_t v61;
  void *m;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *n;
  unint64_t v68;
  _BOOL4 v69;
  __CFString *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[6];
  _QWORD v81[7];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[5];
  id v91;
  id v92;
  __CFString *v93;
  id v94;
  id v95;
  _QWORD *v96;
  _QWORD *v97;
  uint64_t v98;
  _QWORD v99[3];
  char v100;
  _QWORD v101[4];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];

  v4 = a4;
  v6 = a3 & ~(a3 >> 63);
  if (-[_BSUIDynamicTimeLayer savedAnimatedReadingTime](self, "savedAnimatedReadingTime") == v6)
    return;
  v69 = v4;
  -[_BSUIDynamicTimeLayer setSavedAnimatedReadingTime:](self, "setSavedAnimatedReadingTime:", v6);
  v7 = -[_BSUIDynamicTimeLayer useFontFallback](self, "useFontFallback");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIDynamicTimeLayer font](self, "font"));
  objc_msgSend(v8, "pointSize");
  v10 = v9 / 72.0;

  v11 = 38.0;
  if (v7)
    v11 = 44.0;
  v12 = v11 * v10;
  v13 = v10 * 16.0;
  -[_BSUIDynamicTimeLayer bounds](self, "bounds");
  v15 = v14;
  v16 = v6 >> 5;
  v17 = 3;
  v18 = 2;
  if (v6 <= 0x257)
    v18 = 3;
  v68 = v6 >> 4;
  if (v6 >> 4 <= 0x176)
    v17 = v18;
  if (v16 <= 0x752)
    v19 = v17;
  else
    v19 = 4;
  v20 = (double)v19;
  if (v6 >= 0x258)
    v21 = v19;
  else
    v21 = v19 + 1;
  v22 = v13 + v12 * v20;
  v23 = v12 * v20;
  if (v6 >= 0x258)
    v24 = v23;
  else
    v24 = v22;
  timeSeparator = (__CFString *)self->_timeSeparator;
  if (!timeSeparator)
    timeSeparator = CFSTR(":");
  v26 = timeSeparator;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIDynamicTimeLayer currentLayers](self, "currentLayers"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v19 + 1));
  v101[0] = 0;
  v101[1] = v101;
  v101[2] = 0x2020000000;
  *(double *)&v101[3] = (v15 - v24) * 0.5;
  v99[0] = 0;
  v99[1] = v99;
  v99[2] = 0x2020000000;
  v100 = 0;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v27, "count")));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v27, "count")));
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_3D134;
  v90[3] = &unk_2E5808;
  v96 = v101;
  v90[4] = self;
  v71 = v28;
  v91 = v71;
  v31 = v27;
  v92 = v31;
  v70 = v26;
  v93 = v70;
  v97 = v99;
  v98 = v21;
  v32 = v29;
  v94 = v32;
  v33 = v30;
  v95 = v33;
  v34 = objc_retainBlock(v90);
  if (v6 < 0x258)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_digits, "objectAtIndexedSubscript:", v6 / 0x3C));
    ((void (*)(_QWORD *, void *, double))v34[2])(v34, v35, v12);

    ((void (*)(_QWORD *, __CFString *, double))v34[2])(v34, v70, v13);
    v36 = v6 % 0x3C;
    v37 = v6 % 0x3C / 0xA;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_digits, "objectAtIndexedSubscript:", v37));
    ((void (*)(_QWORD *, void *, double))v34[2])(v34, v38, v12);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_digits, "objectAtIndexedSubscript:", (v36 - 10 * v37)));
    ((void (*)(_QWORD *, void *, double))v34[2])(v34, v39, v12);
    goto LABEL_26;
  }
  if (v16 >= 0x753)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_digits, "objectAtIndexedSubscript:", (_QWORD)(v6 / 0xEA60 - 10 * ((v6 / 0xEA60 * (unsigned __int128)0x199999999999999AuLL) >> 64))));
    ((void (*)(_QWORD *, void *, double))v34[2])(v34, v40, v12);

LABEL_24:
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_digits, "objectAtIndexedSubscript:", (_QWORD)(v6 / 0x1770 - 10 * ((v6 / 0x1770 * (unsigned __int128)0x199999999999999AuLL) >> 64)), v68));
    ((void (*)(_QWORD *, void *, double))v34[2])(v34, v41, v12);

    goto LABEL_25;
  }
  if (v68 >= 0x177)
    goto LABEL_24;
LABEL_25:
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_digits, "objectAtIndexedSubscript:", (_QWORD)(v6 / 0x258 - 10 * ((v6 / 0x258 * (unsigned __int128)0x199999999999999AuLL) >> 64)), v68));
  ((void (*)(_QWORD *, void *, double))v34[2])(v34, v42, v12);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_digits, "objectAtIndexedSubscript:", (_QWORD)(v6 / 0x3C - 10 * ((v6 / 0x3C * (unsigned __int128)0x199999999999999AuLL) >> 64))));
  ((void (*)(_QWORD *, void *, double))v34[2])(v34, v39, v12);
LABEL_26:

  for (i = (char *)objc_msgSend(v71, "count"); i < objc_msgSend(v31, "count", v68); ++i)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", i));
    objc_msgSend(v32, "addObject:", v44);

  }
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIDynamicTimeLayer outgoingLayers](self, "outgoingLayers"));
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v86, v105, 16);
  if (v46)
  {
    v47 = *(_QWORD *)v87;
    do
    {
      for (j = 0; j != v46; j = (char *)j + 1)
      {
        if (*(_QWORD *)v87 != v47)
          objc_enumerationMutation(v45);
        objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)j), "removeFromSuperlayer");
      }
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v86, v105, 16);
    }
    while (v46);
  }

  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 0);
  v49 = objc_msgSend(v32, "copy");
  -[_BSUIDynamicTimeLayer setOutgoingLayers:](self, "setOutgoingLayers:", v49);

  v50 = objc_msgSend(v71, "copy");
  -[_BSUIDynamicTimeLayer setCurrentLayers:](self, "setCurrentLayers:", v50);

  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v51 = v33;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v82, v104, 16);
  if (v52)
  {
    v53 = *(_QWORD *)v83;
    do
    {
      for (k = 0; k != v52; k = (char *)k + 1)
      {
        if (*(_QWORD *)v83 != v53)
          objc_enumerationMutation(v51);
        -[_BSUIDynamicTimeLayer addSublayer:](self, "addSublayer:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)k));
      }
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v82, v104, 16);
    }
    while (v52);
  }

  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 0);
  if (v69)
  {
    v55 = objc_msgSend(v51, "count");
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIDynamicTimeLayer outgoingLayers](self, "outgoingLayers"));
    if (v55 >= objc_msgSend(v56, "count"))
      v57 = 0.0;
    else
      v57 = 0.12;

    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_3D320;
    v81[3] = &unk_2E5830;
    *(double *)&v81[5] = v57;
    v81[6] = 0x3FB47AE147AE147BLL;
    v81[4] = self;
    objc_msgSend(v51, "enumerateObjectsUsingBlock:", v81);
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIDynamicTimeLayer outgoingLayers](self, "outgoingLayers"));
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_3D580;
    v80[3] = &unk_2E5858;
    v80[4] = self;
    v80[5] = 0x3FB47AE147AE147BLL;
    objc_msgSend(v58, "enumerateObjectsUsingBlock:", v80);

  }
  else
  {
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v59 = v51;
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v76, v103, 16);
    if (v60)
    {
      v61 = *(_QWORD *)v77;
      do
      {
        for (m = 0; m != v60; m = (char *)m + 1)
        {
          if (*(_QWORD *)v77 != v61)
            objc_enumerationMutation(v59);
          v63 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)m);
          objc_msgSend(v63, "frame");
          objc_msgSend(v63, "setFrame:");
        }
        v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v76, v103, 16);
      }
      while (v60);
    }

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIDynamicTimeLayer outgoingLayers](self, "outgoingLayers"));
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v72, v102, 16);
    if (v65)
    {
      v66 = *(_QWORD *)v73;
      do
      {
        for (n = 0; n != v65; n = (char *)n + 1)
        {
          if (*(_QWORD *)v73 != v66)
            objc_enumerationMutation(v64);
          objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)n), "removeFromSuperlayer");
        }
        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v72, v102, 16);
      }
      while (v65);
    }

  }
  _Block_object_dispose(v99, 8);
  _Block_object_dispose(v101, 8);

}

- (int64_t)savedAnimatedReadingTime
{
  return self->_savedAnimatedReadingTime;
}

- (void)setSavedAnimatedReadingTime:(int64_t)a3
{
  self->_savedAnimatedReadingTime = a3;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (BOOL)useFontFallback
{
  return self->_useFontFallback;
}

- (void)setUseFontFallback:(BOOL)a3
{
  self->_useFontFallback = a3;
}

- (NSString)timeSeparator
{
  return self->_timeSeparator;
}

- (void)setTimeSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_timeSeparator, a3);
}

- (NSArray)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
  objc_storeStrong((id *)&self->_digits, a3);
}

- (NSArray)outgoingLayers
{
  return self->_outgoingLayers;
}

- (void)setOutgoingLayers:(id)a3
{
  objc_storeStrong((id *)&self->_outgoingLayers, a3);
}

- (NSArray)currentLayers
{
  return self->_currentLayers;
}

- (void)setCurrentLayers:(id)a3
{
  objc_storeStrong((id *)&self->_currentLayers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayers, 0);
  objc_storeStrong((id *)&self->_outgoingLayers, 0);
  objc_storeStrong((id *)&self->_digits, 0);
  objc_storeStrong((id *)&self->_timeSeparator, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

@end
