@implementation UIFont

- (id)fallback_debugHierarchyValueWithOutOptions:(id *)a3 outError:(id *)a4
{
  objc_class *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  NSString *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  id v33;
  _QWORD v34[9];
  _QWORD v35[9];
  _QWORD v36[2];
  _QWORD v37[2];

  v6 = (objc_class *)objc_opt_class(self);
  if (!v6 || (v7 = v6, !object_isClass(v6)))
  {
    v10 = 0;
    goto LABEL_4;
  }
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (!v9)
  {
LABEL_4:
    v11 = (objc_class *)objc_opt_class(UIFont);
    v12 = NSStringFromClass(v11);
    v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    goto LABEL_7;
  }
  v13 = v9;
LABEL_7:
  v14 = v13;
  v31 = v13;

  v36[0] = CFSTR("propertyFormat");
  v36[1] = CFSTR("propertyRuntimeType");
  v37[0] = CFSTR("font");
  v37[1] = v14;
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2)));
  *a3 = v15;
  v33 = v15;
  v34[0] = CFSTR("familyName");
  v16 = objc_claimAutoreleasedReturnValue(-[UIFont familyName](self, "familyName"));
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_38A98;
  v35[0] = v18;
  v34[1] = CFSTR("fontName");
  v19 = objc_claimAutoreleasedReturnValue(-[UIFont fontName](self, "fontName", v31));
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = &stru_38A98;
  v35[1] = v21;
  v34[2] = CFSTR("pointSize");
  -[UIFont pointSize](self, "pointSize");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v35[2] = v22;
  v34[3] = CFSTR("ascender");
  -[UIFont ascender](self, "ascender");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v35[3] = v23;
  v34[4] = CFSTR("descender");
  -[UIFont descender](self, "descender");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v35[4] = v24;
  v34[5] = CFSTR("capHeight");
  -[UIFont capHeight](self, "capHeight");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v35[5] = v25;
  v34[6] = CFSTR("xHeight");
  -[UIFont xHeight](self, "xHeight");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v35[6] = v26;
  v34[7] = CFSTR("lineHeight");
  -[UIFont lineHeight](self, "lineHeight");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v35[7] = v27;
  v34[8] = CFSTR("leading");
  -[UIFont leading](self, "leading");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v35[8] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 9));

  return v29;
}

@end
