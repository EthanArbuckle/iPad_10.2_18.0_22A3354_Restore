@implementation UIColor

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
  void *v14;
  _UNKNOWN **v15;
  id v16;
  UIColor *v17;
  CGColor *v18;
  size_t NumberOfComponents;
  uint64_t v20;
  CFIndex v21;
  void *v22;
  __CFString *v23;
  CFIndex v24;
  uint64_t v25;
  const CGFloat *Components;
  const void **v27;
  uint64_t v28;
  uint64_t v29;
  CFArrayRef v30;
  const void **v31;
  const void *v32;
  void *v33;
  void *v34;
  _UNKNOWN **v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  CGColorSpace *space;
  CFStringRef v44;
  __CFDictionary *Mutable;
  id v46;
  _QWORD v47[2];
  _QWORD v48[2];

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
    v11 = (objc_class *)objc_opt_class(UIColor);
    v12 = NSStringFromClass(v11);
    v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    goto LABEL_7;
  }
  v13 = v9;
LABEL_7:
  v14 = v13;

  v47[0] = CFSTR("propertyFormat");
  v47[1] = CFSTR("propertyRuntimeType");
  v48[0] = CFSTR("color");
  v48[1] = v14;
  v15 = &_s10Foundation19PropertyListEncoderC6encodeyAA4DataVxKSERzlFTj_ptr;
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v48, v47, 2)));
  *a3 = v16;
  v17 = objc_retainAutorelease(self);
  v18 = -[UIColor CGColor](v17, "CGColor");
  if (v18)
  {
    v46 = v16;
    Mutable = CFDictionaryCreateMutable(0, 20, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    space = CGColorGetColorSpace(v18);
    v44 = CGColorSpaceCopyName(space);
    NumberOfComponents = CGColorGetNumberOfComponents(v18);
    v20 = NumberOfComponents << 32;
    v21 = (int)NumberOfComponents;
    if (NumberOfComponents << 32)
    {
      v22 = v14;
      v23 = CFStringCreateMutable(0, 0);
      v24 = v21 - 1;
      if ((unint64_t)v21 <= 1)
        v25 = 1;
      else
        v25 = v21;
      do
      {
        CFStringAppend(v23, CFSTR("CGf"));
        if (v24)
          CFStringAppend(v23, CFSTR(", "));
        --v24;
        --v25;
      }
      while (v25);
      v14 = v22;
      v15 = &_s10Foundation19PropertyListEncoderC6encodeyAA4DataVxKSERzlFTj_ptr;
    }
    else
    {
      v23 = &stru_38A98;
    }
    Components = CGColorGetComponents(v18);
    v27 = (const void **)malloc_type_malloc(v20 >> 29, 0x6004044C4A2DFuLL);
    if (v20 <= 0)
    {
      v30 = CFArrayCreate(0, v27, v21, &kCFTypeArrayCallBacks);
    }
    else
    {
      v28 = 0;
      if (v21 <= 1)
        v29 = 1;
      else
        v29 = v21;
      do
      {
        v27[v28] = CFNumberCreate(0, kCFNumberCGFloatType, &Components[v28]);
        ++v28;
      }
      while (v29 != v28);
      v30 = CFArrayCreate(0, v27, v21, &kCFTypeArrayCallBacks);
      v31 = v27;
      do
      {
        v32 = *v31++;
        CFRelease(v32);
        --v29;
      }
      while (v29);
    }
    free(v27);
    CGColorSpaceGetModel(space);
    v18 = Mutable;
    v16 = v46;
    if (v30)
      CFDictionaryAddValue(Mutable, CFSTR("componentValues"), v30);
    if (v23)
      CFDictionaryAddValue(Mutable, CFSTR("componentValuesFormat"), v23);
    if (v44)
      CFDictionaryAddValue(Mutable, CFSTR("colorSpaceName"), v44);
    if (v30)
      CFRelease(v30);
    if (v44)
      CFRelease(v44);
    if (v23)
      CFRelease(v23);
  }
  if ((objc_opt_respondsToSelector(v17, "_debugName") & 1) != 0
    && (objc_opt_respondsToSelector(v17, "_debugCatalogBundleIdentifier") & 1) != 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor _debugName](v17, "_debugName"));
    if (v33)
    {

    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor _debugCatalogBundleIdentifier](v17, "_debugCatalogBundleIdentifier"));

      if (!v34)
        goto LABEL_48;
    }
    v35 = v15;
    v36 = -[CGColor mutableCopy](v18, "mutableCopy");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor _debugCatalogBundleIdentifier](v17, "_debugCatalogBundleIdentifier"));

    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor _debugCatalogBundleIdentifier](v17, "_debugCatalogBundleIdentifier"));
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v38, CFSTR("catalogBundleID"));

    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor _debugName](v17, "_debugName"));

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIColor _debugName](v17, "_debugName"));
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v40, CFSTR("colorName"));

    }
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35[78], "dictionaryWithDictionary:", v36));

    v18 = (CGColor *)v41;
  }
LABEL_48:

  return v18;
}

@end
