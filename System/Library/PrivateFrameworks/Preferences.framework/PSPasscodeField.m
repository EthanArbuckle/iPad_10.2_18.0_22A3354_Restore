@implementation PSPasscodeField

- (PSPasscodeField)initWithNumberOfEntryFields:(unint64_t)a3
{
  PSPasscodeField *v4;
  uint64_t v5;
  NSMutableArray *dotOutlineViews;
  uint64_t v7;
  NSMutableArray *dotFullViews;
  uint64_t v9;
  NSMutableArray *dashViews;
  uint64_t v11;
  NSMutableArray *digitViews;
  NSMutableString *v13;
  NSMutableString *stringValue;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PSPasscodeField;
  v4 = -[PSPasscodeField initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    dotOutlineViews = v4->_dotOutlineViews;
    v4->_dotOutlineViews = (NSMutableArray *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    dotFullViews = v4->_dotFullViews;
    v4->_dotFullViews = (NSMutableArray *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    dashViews = v4->_dashViews;
    v4->_dashViews = (NSMutableArray *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    digitViews = v4->_digitViews;
    v4->_digitViews = (NSMutableArray *)v11;

    v13 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    stringValue = v4->_stringValue;
    v4->_stringValue = v13;

    v4->_enabled = 1;
    v4->_shouldBecomeFirstResponderOnTap = 1;
    v4->_securePasscodeEntry = 1;
    -[PSPasscodeField setNumberOfEntryFields:](v4, "setNumberOfEntryFields:", a3);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v4, sel_passcodeFieldTapped_);
    -[PSPasscodeField addGestureRecognizer:](v4, "addGestureRecognizer:", v15);

  }
  return v4;
}

- (id)dotFullImage
{
  return GetImage(CFSTR("passcodeDot-full"), CFSTR("passcodeDotInverted-full"));
}

- (id)dotOutlineImage
{
  return GetImage(CFSTR("passcodeDot-outline"), CFSTR("passcodeDotInverted-outline"));
}

- (id)dashImage
{
  return GetImage(CFSTR("passcodeDash"), CFSTR("passcodeDashInverted"));
}

- (void)setNumberOfEntryFields:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  if (self->_numberOfEntryFields != a3)
  {
    v3 = a3;
    self->_numberOfEntryFields = a3;
    v5 = 424;
    -[NSMutableArray removeAllObjects](self->_dotFullViews, "removeAllObjects");
    v6 = 416;
    -[NSMutableArray removeAllObjects](self->_dotOutlineViews, "removeAllObjects");
    v7 = 432;
    -[NSMutableArray removeAllObjects](self->_dashViews, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_digitViews, "removeAllObjects");
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 28.0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    +[PSListController appearance](PSListController, "appearance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSPasscodeField dotFullImage](self, "dotFullImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSPasscodeField dotOutlineImage](self, "dotOutlineImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSPasscodeField dashImage](self, "dashImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v12 = *MEMORY[0x1E0C9D648];
      v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v25 = v9;
      v26 = v10;
      do
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v9);
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v5), "addObject:", v16);
        v17 = v5;
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v10);
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v6), "addObject:", v18);
        v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v11);
        v20 = v11;
        v21 = v6;
        v22 = (void *)v19;
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v7), "addObject:", v19);
        v23 = v7;
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v12, v13, v14, v15);
        objc_msgSend(v24, "setFont:", v28);
        objc_msgSend(v24, "setTextColor:", v27);
        -[NSMutableArray addObject:](self->_digitViews, "addObject:", v24);

        v7 = v23;
        v6 = v21;
        v11 = v20;

        v5 = v17;
        v9 = v25;
        v10 = v26;

        --v3;
      }
      while (v3);
    }
    -[PSPasscodeField sizeToFit](self, "sizeToFit");
    -[PSPasscodeField setNeedsLayout](self, "setNeedsLayout");

  }
}

- (CGSize)dotFullSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[NSMutableArray firstObject](self->_dotFullViews, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)promptSize
{
  int *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  if (self->_securePasscodeEntry)
    v2 = &OBJC_IVAR___PSPasscodeField__dotOutlineViews;
  else
    v2 = &OBJC_IVAR___PSPasscodeField__dashViews;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v2), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)digitFont
{
  void *v2;
  void *v3;

  -[NSMutableArray firstObject](self->_digitViews, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t i;
  float v25;
  double v26;
  double v27;
  double v28;
  double v29;
  unint64_t numberOfEntryFields;
  double v31;
  float v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  _QWORD v40[2];
  CGSize result;

  v40[1] = *MEMORY[0x1E0C80C00];
  -[PSPasscodeField dotFullSize](self, "dotFullSize", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[PSPasscodeField promptSize](self, "promptSize");
  v9 = v8;
  v11 = v10;
  -[PSPasscodeField digitFont](self, "digitFont");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    v39 = *MEMORY[0x1E0CEA098];
    v40[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("0"), "sizeWithAttributes:", v14);
    v16 = v15;
    v18 = v17;

  }
  else
  {
    v16 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = self->_fieldSpacing;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v35;
    v23 = 0.0;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "floatValue", (_QWORD)v34);
        v23 = v23 + v25;
      }
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v21);
  }
  else
  {
    v23 = 0.0;
  }
  if (v7 >= v11)
    v26 = v7;
  else
    v26 = v11;
  if (v26 >= v18)
    v27 = v26;
  else
    v27 = v18;
  if (v5 >= v9)
    v28 = v5;
  else
    v28 = v9;
  if (v28 >= v16)
    v29 = v28;
  else
    v29 = v16;

  numberOfEntryFields = self->_numberOfEntryFields;
  v31 = v23 + (v29 + 25.0) * (double)numberOfEntryFields + -25.0;
  v32 = v27;
  v33 = ceilf(v32);
  result.height = v33;
  result.width = v31;
  return result;
}

- (void)setForegroundColor:(id)a3
{
  UIColor *v5;
  void **p_foregroundColor;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIColor *v15;

  v5 = (UIColor *)a3;
  p_foregroundColor = (void **)&self->_foregroundColor;
  if (self->_foregroundColor != v5)
  {
    v15 = v5;
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    GetImageTemplate(CFSTR("passcodeDot-full"), *p_foregroundColor);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GetImageTemplate(CFSTR("passcodeDot-outline"), *p_foregroundColor);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GetImageTemplate(CFSTR("passcodeDash"), *p_foregroundColor);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_numberOfEntryFields)
    {
      v10 = 0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_dotFullViews, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setImage:", v7);

        -[NSMutableArray objectAtIndexedSubscript:](self->_dotOutlineViews, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setImage:", v8);

        -[NSMutableArray objectAtIndexedSubscript:](self->_dashViews, "objectAtIndexedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setImage:", v9);

        -[NSMutableArray objectAtIndexedSubscript:](self->_digitViews, "objectAtIndexedSubscript:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTextColor:", *p_foregroundColor);

        ++v10;
      }
      while (v10 < self->_numberOfEntryFields);
    }

    v5 = v15;
  }

}

- (void)passcodeFieldTapped:(id)a3
{
  if (-[PSPasscodeField shouldBecomeFirstResponderOnTap](self, "shouldBecomeFirstResponderOnTap", a3))
    -[PSPasscodeField becomeFirstResponder](self, "becomeFirstResponder");
}

- (BOOL)isSecureTextEntry
{
  return 1;
}

- (void)setFieldSpacing:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_fieldSpacing != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_fieldSpacing, a3);
    -[PSPasscodeField sizeToFit](self, "sizeToFit");
    -[PSPasscodeField setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)layoutSubviews
{
  int *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  float v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  _BOOL4 securePasscodeEntry;
  double v51;
  uint64_t v52;
  _QWORD v53[3];
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v53[1] = *MEMORY[0x1E0C80C00];
  if (self->_securePasscodeEntry)
    v3 = &OBJC_IVAR___PSPasscodeField__dotOutlineViews;
  else
    v3 = &OBJC_IVAR___PSPasscodeField__dashViews;
  v4 = *(id *)((char *)&self->super.super.super.isa + *v3);
  if (self->_numberOfEntryFields)
  {
    v5 = 0;
    securePasscodeEntry = self->_securePasscodeEntry;
    while (v5 >= -[NSMutableString length](self->_stringValue, "length"))
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_dotFullViews, "objectAtIndexedSubscript:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

      -[NSMutableArray objectAtIndexedSubscript:](self->_digitViews, "objectAtIndexedSubscript:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeFromSuperview");

      -[NSMutableArray objectAtIndexedSubscript:](self->_digitViews, "objectAtIndexedSubscript:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", 0);

      objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "superview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
LABEL_15:
      if (++v5 >= self->_numberOfEntryFields)
        goto LABEL_16;
    }
    -[NSMutableArray objectAtIndexedSubscript:](self->_dotOutlineViews, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[NSMutableArray objectAtIndexedSubscript:](self->_dotFullViews, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[NSMutableArray objectAtIndexedSubscript:](self->_digitViews, "objectAtIndexedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[NSMutableArray objectAtIndexedSubscript:](self->_dashViews, "objectAtIndexedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    if (securePasscodeEntry)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_dotFullViews, "objectAtIndexedSubscript:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_digitViews, "objectAtIndexedSubscript:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableString substringWithRange:](self->_stringValue, "substringWithRange:", v5, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_digitViews, "objectAtIndexedSubscript:", v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v16);

    }
    objc_msgSend(v10, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
LABEL_13:
      -[PSPasscodeField addSubview:](self, "addSubview:", v10);

    goto LABEL_15;
  }
LABEL_16:
  -[PSPasscodeField digitFont](self, "digitFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSPasscodeField dotFullSize](self, "dotFullSize");
  v49 = v21;
  v51 = v20;
  -[PSPasscodeField promptSize](self, "promptSize");
  v47 = v23;
  v48 = v22;
  v52 = *MEMORY[0x1E0CEA098];
  v53[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("0"), "sizeWithAttributes:", v24);
  v45 = v26;
  v46 = v25;

  if (self->_numberOfEntryFields)
  {
    v27 = 0;
    if (v51 >= v48)
      v28 = v51;
    else
      v28 = v48;
    if (v28 < v46)
      v28 = v46;
    if (v49 >= v47)
      v29 = v49;
    else
      v29 = v47;
    if (v29 < v45)
      v29 = v45;
    v44 = v28 + 25.0;
    v30 = (v28 - v51) * 0.5;
    v31 = (v29 - v49) * 0.5;
    v32 = (v28 - v48) * 0.5;
    v33 = (v29 - v47) * 0.5;
    v34 = (v28 - v46) * 0.5;
    v35 = (v29 - v45) * 0.5;
    v36 = 0.0;
    do
    {
      v37 = 0.0;
      if ((uint64_t)(v27 - 1) >= 0 && -[NSArray count](self->_fieldSpacing, "count") > v27 - 1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_fieldSpacing, "objectAtIndexedSubscript:", v27 - 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "floatValue");
        v37 = v39;

      }
      v36 = v36 + v37;
      v40 = v36 + v44 * (double)v27;
      -[NSMutableArray objectAtIndexedSubscript:](self->_dotFullViews, "objectAtIndexedSubscript:", v27);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v54.origin.x = v30 + v40;
      v54.origin.y = v31;
      v54.size.height = v49;
      v54.size.width = v51;
      v55 = CGRectIntegral(v54);
      objc_msgSend(v41, "setFrame:", v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
      objc_msgSend(v4, "objectAtIndexedSubscript:", v27);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v56.origin.x = v32 + v40;
      v56.origin.y = v33;
      v56.size.height = v47;
      v56.size.width = v48;
      v57 = CGRectIntegral(v56);
      objc_msgSend(v42, "setFrame:", v57.origin.x, v57.origin.y, v57.size.width, v57.size.height);
      -[NSMutableArray objectAtIndexedSubscript:](self->_digitViews, "objectAtIndexedSubscript:", v27);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v58.origin.x = v34 + v40;
      v58.origin.y = v35;
      v58.size.height = v45;
      v58.size.width = v46;
      v59 = CGRectIntegral(v58);
      objc_msgSend(v43, "setFrame:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);

      ++v27;
    }
    while (v27 < self->_numberOfEntryFields);
  }

}

- (void)_delegateEnteredPasscode:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PSPasscodeField forceDisplayIfNeeded](self, "forceDisplayIfNeeded");
  v5 = dispatch_time(0, 76000000);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PSPasscodeField__delegateEnteredPasscode___block_invoke;
  v7[3] = &unk_1E4A655B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, MEMORY[0x1E0C80D38], v7);

}

void __44__PSPasscodeField__delegateEnteredPasscode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 464));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(WeakRetained, "passcodeField:enteredPasscode:", v2, v3);

}

- (id)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  -[NSMutableString setString:](self->_stringValue, "setString:", a3);
  -[PSPasscodeField setNeedsLayout](self, "setNeedsLayout");
  if (-[NSMutableString length](self->_stringValue, "length") == self->_numberOfEntryFields)
    -[PSPasscodeField _delegateEnteredPasscode:](self, "_delegateEnteredPasscode:", self->_stringValue);
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSPasscodeField;
  v2 = -[PSPasscodeField becomeFirstResponder](&v5, sel_becomeFirstResponder);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setReturnKeyEnabled:", 0);

  }
  return v2;
}

- (int64_t)keyboardType
{
  if (PSUsePadStylePIN())
    return 11;
  else
    return 127;
}

- (int64_t)keyboardAppearance
{
  void *v3;
  char v4;

  +[PSListController appearance](PSListController, "appearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesDarkTheme");

  if ((v4 & 1) != 0)
    return 1;
  else
    return self->_keyboardAppearance;
}

- (void)insertText:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[PSPasscodeField isEnabled](self, "isEnabled")
    && -[NSMutableString length](self->_stringValue, "length") != self->_numberOfEntryFields
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("\n")) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "passcodeField:shouldInsertText:", self, v9);
      v7 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v7;
    }
    else
    {
      v8 = v9;
    }
    v9 = v8;
    if (objc_msgSend(v8, "length"))
    {
      -[NSMutableString appendString:](self->_stringValue, "appendString:", v9);
      -[PSPasscodeField setNeedsLayout](self, "setNeedsLayout");
      if (-[NSMutableString length](self->_stringValue, "length") == self->_numberOfEntryFields)
        -[PSPasscodeField _delegateEnteredPasscode:](self, "_delegateEnteredPasscode:", self->_stringValue);
    }
  }

}

- (BOOL)hasText
{
  return -[NSMutableString length](self->_stringValue, "length") != 0;
}

- (void)deleteBackward
{
  if (-[NSMutableString length](self->_stringValue, "length"))
  {
    -[NSMutableString deleteCharactersInRange:](self->_stringValue, "deleteCharactersInRange:", -[NSMutableString length](self->_stringValue, "length") - 1, 1);
    -[PSPasscodeField setNeedsLayout](self, "setNeedsLayout");
  }
}

- (PSPasscodeFieldDelegate)delegate
{
  return (PSPasscodeFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)numberOfEntryFields
{
  return self->_numberOfEntryFields;
}

- (BOOL)securePasscodeEntry
{
  return self->_securePasscodeEntry;
}

- (void)setSecurePasscodeEntry:(BOOL)a3
{
  self->_securePasscodeEntry = a3;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->_keyboardAppearance = a3;
}

- (NSArray)fieldSpacing
{
  return self->_fieldSpacing;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)shouldBecomeFirstResponderOnTap
{
  return self->_shouldBecomeFirstResponderOnTap;
}

- (void)setShouldBecomeFirstResponderOnTap:(BOOL)a3
{
  self->_shouldBecomeFirstResponderOnTap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldSpacing, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_digitViews, 0);
  objc_storeStrong((id *)&self->_dashViews, 0);
  objc_storeStrong((id *)&self->_dotFullViews, 0);
  objc_storeStrong((id *)&self->_dotOutlineViews, 0);
}

@end
