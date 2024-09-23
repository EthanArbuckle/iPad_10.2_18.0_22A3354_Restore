@implementation TMLFont

- (TMLFont)initWithFont:(id)a3
{
  id v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  TMLFont *v11;

  v5 = a3;
  objc_msgSend_fontDescriptor(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (TMLFont *)objc_msgSend_initWithFontDescriptor_(self, v9, v10, v8);

  if (v11)
    objc_storeStrong((id *)&v11->_font, a3);

  return v11;
}

- (TMLFont)initWithFontDescriptor:(id)a3
{
  id v5;
  TMLFont *v6;
  TMLFont *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TMLFont;
  v6 = -[TMLFont init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fontDescriptor, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, v7, a3);
  return (id)objc_msgSend_initWithFontDescriptor_(v8, v9, v10, self->_fontDescriptor);
}

- (id)UIFontValue
{
  double v2;
  UIFont *font;
  void *v5;
  UIFontDescriptor *fontDescriptor;
  const char *v7;
  double v8;
  UIFont *v9;
  UIFont *v10;

  font = self->_font;
  if (!font)
  {
    v5 = (void *)MEMORY[0x24BEBB520];
    fontDescriptor = self->_fontDescriptor;
    objc_msgSend_pointSize(fontDescriptor, a2, v2);
    objc_msgSend_fontWithDescriptor_size_(v5, v7, v8, fontDescriptor);
    v9 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v10 = self->_font;
    self->_font = v9;

    font = self->_font;
  }
  return font;
}

+ (void)initializeJSContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  _QWORD v27[5];
  _QWORD v28[5];

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = sub_22AD54FC4;
  v28[3] = &unk_24F501838;
  v28[4] = a1;
  v6 = (void *)MEMORY[0x22E2E7E44](v28);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v7, v8, v6, CFSTR("font"));

  objc_msgSend_setObject_forKeyedSubscript_(v4, v9, v10, &unk_24F501878, CFSTR("includeFont"));
  if (qword_255B51C70 != -1)
    dispatch_once(&qword_255B51C70, &unk_24F501898);
  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = sub_22AD552E8;
  v27[3] = &unk_24F5018B8;
  v27[4] = a1;
  v11 = (void *)MEMORY[0x22E2E7E44](v27);
  objc_msgSend_objectForKeyedSubscript_(v4, v12, v13, CFSTR("font"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v14, v15, v16, v11, CFSTR("style"));

  objc_msgSend_objectForKeyedSubscript_(v4, v17, v18, CFSTR("font"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v19, v20, v21, &unk_24F5018F8, CFSTR("scaledValueForTextStyle"));

  objc_msgSend_objectForKeyedSubscript_(v4, v22, v23, CFSTR("font"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v24, v25, v26, &unk_24F501918, CFSTR("scaledValueForValue"));

}

- (id)bold
{
  id v3;
  UIFontDescriptor *fontDescriptor;
  const char *v5;
  double v6;
  int v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;

  v3 = objc_alloc((Class)objc_opt_class());
  fontDescriptor = self->_fontDescriptor;
  v7 = objc_msgSend_symbolicTraits(fontDescriptor, v5, v6);
  objc_msgSend_fontDescriptorWithSymbolicTraits_(fontDescriptor, v8, v9, v7 | 2u);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_initWithFontDescriptor_(v3, v11, v12, v10);

  return v13;
}

- (id)italic
{
  id v3;
  UIFontDescriptor *fontDescriptor;
  const char *v5;
  double v6;
  int v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;

  v3 = objc_alloc((Class)objc_opt_class());
  fontDescriptor = self->_fontDescriptor;
  v7 = objc_msgSend_symbolicTraits(fontDescriptor, v5, v6);
  objc_msgSend_fontDescriptorWithSymbolicTraits_(fontDescriptor, v8, v9, v7 | 1u);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_initWithFontDescriptor_(v3, v11, v12, v10);

  return v13;
}

- (id)withSize:(double)a3
{
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;

  v5 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_fontDescriptorWithSize_(self->_fontDescriptor, v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithFontDescriptor_(v5, v8, v9, v7);

  return v10;
}

- (id)withFamily:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  objc_msgSend_fontDescriptorWithFamily_(self->_fontDescriptor, v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend_initWithFontDescriptor_(v5, v9, v10, v8);
  return v11;
}

- (id)withWeight:(double)a3
{
  UIFontDescriptor *fontDescriptor;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  UIFontDescriptor *v14;
  id v15;
  const char *v16;
  double v17;
  UIFontDescriptor *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  fontDescriptor = self->_fontDescriptor;
  v23 = *MEMORY[0x24BEBB590];
  v21 = *MEMORY[0x24BEBB620];
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v5;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v6, v7, &v22, &v21, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, v10, v24, &v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fontDescriptorByAddingAttributes_(fontDescriptor, v12, v13, v11);
  v14 = (UIFontDescriptor *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc((Class)objc_opt_class());
  v18 = v14;
  if (!v14)
    v18 = self->_fontDescriptor;
  v19 = (void *)objc_msgSend_initWithFontDescriptor_(v15, v16, v17, v18);

  return v19;
}

- (id)withWidth:(double)a3
{
  UIFontDescriptor *fontDescriptor;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  UIFontDescriptor *v14;
  id v15;
  const char *v16;
  double v17;
  UIFontDescriptor *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  fontDescriptor = self->_fontDescriptor;
  v23 = *MEMORY[0x24BEBB590];
  v21 = *MEMORY[0x24BEBB630];
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v5;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v6, v7, &v22, &v21, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, v10, v24, &v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fontDescriptorByAddingAttributes_(fontDescriptor, v12, v13, v11);
  v14 = (UIFontDescriptor *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc((Class)objc_opt_class());
  v18 = v14;
  if (!v14)
    v18 = self->_fontDescriptor;
  v19 = (void *)objc_msgSend_initWithFontDescriptor_(v15, v16, v17, v18);

  return v19;
}

- (id)withSymbolicTraits:(unsigned int)a3
{
  double v3;
  int v6;
  const char *v7;
  double v8;
  UIFontDescriptor *v9;
  id v10;
  const char *v11;
  double v12;
  UIFontDescriptor *fontDescriptor;
  void *v14;

  v6 = objc_msgSend_symbolicTraits(self->_fontDescriptor, a2, v3);
  objc_msgSend_fontDescriptorWithSymbolicTraits_(self->_fontDescriptor, v7, v8, v6 | a3);
  v9 = (UIFontDescriptor *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc((Class)objc_opt_class());
  fontDescriptor = v9;
  if (!v9)
    fontDescriptor = self->_fontDescriptor;
  v14 = (void *)objc_msgSend_initWithFontDescriptor_(v10, v11, v12, fontDescriptor);

  return v14;
}

- (id)withAttributes:(id)a3
{
  double v3;
  UIFontDescriptor *v5;
  id v6;
  const char *v7;
  double v8;
  UIFontDescriptor *fontDescriptor;
  void *v10;

  objc_msgSend_fontDescriptorByAddingAttributes_(self->_fontDescriptor, a2, v3, a3);
  v5 = (UIFontDescriptor *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc((Class)objc_opt_class());
  fontDescriptor = v5;
  if (!v5)
    fontDescriptor = self->_fontDescriptor;
  v10 = (void *)objc_msgSend_initWithFontDescriptor_(v6, v7, v8, fontDescriptor);

  return v10;
}

- (id)withStyle:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  void *v23;
  TMLFont *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;

  v4 = (void *)MEMORY[0x24BDF6A80];
  v5 = a3;
  objc_msgSend_metricsForTextStyle_(v4, v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UIFontValue(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BEBB528];
  objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x24BDF6F30], v13, v14, *MEMORY[0x24BDF76A0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(v12, v16, v17, v5, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_pointSize(v18, v19, v20);
  objc_msgSend_fontWithSize_(v11, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = [TMLFont alloc];
  objc_msgSend_scaledFontForFont_(v8, v25, v26, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend_initWithFont_(v24, v28, v29, v27);

  return v30;
}

- (id)withAXRestrictedStyle:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  const char *v7;
  double v8;
  void *v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  double v27;
  double v28;
  const char *v29;
  const char *v30;
  double v31;
  double v32;
  double v33;
  const char *v34;
  const char *v35;
  void *v36;
  double v37;
  const char *v38;
  double v39;
  void *v40;
  const char *v41;
  double v42;
  const char *v43;
  double v44;
  void *v45;
  void *v46;
  const char *v47;
  double v48;
  const char *v49;
  double v50;
  void *v51;
  const char *v52;
  double v53;
  const char *v54;
  double v55;
  TMLFont *v56;
  const char *v57;
  double v58;
  void *v59;

  v4 = (objc_class *)MEMORY[0x24BDF6A80];
  v5 = a3;
  v6 = [v4 alloc];
  v9 = (void *)objc_msgSend_initForTextStyle_(v6, v7, v8, v5);
  v10 = (void *)MEMORY[0x24BEBB528];
  objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x24BDF6F30], v11, v12, *MEMORY[0x24BDF76A0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(v10, v14, v15, v5, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BEBB528];
  v18 = *MEMORY[0x24BDF7678];
  objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x24BDF6F30], v19, v20, *MEMORY[0x24BDF7678]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(v17, v22, v23, v5, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_pointSize(self, v25, v26);
  v28 = v27;
  objc_msgSend_pointSize(v16, v29, v27);
  if (v28 == v31)
  {
    objc_msgSend_UIFontValue(self, v30, v31);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_pointSize(self, v30, v31);
    v33 = v32;
    objc_msgSend_UIFontValue(self, v34, v32);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33 != 0.0)
    {
      objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(MEMORY[0x24BDF6F30], v35, v37, v18);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_scaledFontForFont_compatibleWithTraitCollection_(v9, v47, v48, v36, v46);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_UIFontValue(self, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pointSize(v40, v52, v53);
      objc_msgSend_scaledFontForFont_maximumPointSize_(v9, v54, v55, v51);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    objc_msgSend_pointSize(v16, v35, v37);
    objc_msgSend_fontWithSize_(v36, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_pointSize(v24, v41, v42);
  objc_msgSend_scaledFontForFont_maximumPointSize_(v9, v43, v44, v40);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  v56 = [TMLFont alloc];
  v59 = (void *)objc_msgSend_initWithFont_(v56, v57, v58, v45);

  return v59;
}

- (id)withScale:(double)a3
{
  id v5;
  UIFontDescriptor *fontDescriptor;
  const char *v7;
  double v8;
  double v9;
  const char *v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;

  v5 = objc_alloc((Class)objc_opt_class());
  fontDescriptor = self->_fontDescriptor;
  objc_msgSend_pointSize(fontDescriptor, v7, v8);
  objc_msgSend_fontDescriptorWithSize_(fontDescriptor, v10, v9 * a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_initWithFontDescriptor_(v5, v12, v13, v11);

  return v14;
}

- (id)withScaleTransform:(double)a3
{
  id v4;
  UIFontDescriptor *fontDescriptor;
  const char *v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  CGAffineTransform v12;
  CGAffineTransform v13;

  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeScale(&v13, a3, a3);
  v4 = objc_alloc((Class)objc_opt_class());
  fontDescriptor = self->_fontDescriptor;
  v12 = v13;
  objc_msgSend_fontDescriptorWithMatrix_(fontDescriptor, v6, v13.tx, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithFontDescriptor_(v4, v8, v9, v7);

  return v10;
}

- (NSString)familyName
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  void *v6;

  objc_msgSend_UIFontValue(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_familyName(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)fontName
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  void *v6;

  objc_msgSend_UIFontValue(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_familyName(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (double)pointSize
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend_UIFontValue(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pointSize(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (double)ascender
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend_UIFontValue(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ascender(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (double)descender
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend_UIFontValue(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descender(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (double)capHeight
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend_UIFontValue(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_capHeight(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (double)xHeight
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend_UIFontValue(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_xHeight(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (double)lineHeight
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend_UIFontValue(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lineHeight(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (double)leading
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend_UIFontValue(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_leading(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontDescriptor, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

@end
