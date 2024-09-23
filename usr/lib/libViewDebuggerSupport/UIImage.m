@implementation UIImage

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
  uint64_t IsUIKitImage;
  uint64_t IsSystemSymbol;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  UIImage *v50;
  NSData *v51;
  void *v52;
  unint64_t v53;
  unint64_t v54;
  __CFDictionary *Mutable;
  __CFDictionary *v56;
  void *v57;
  void *v59;
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[4];

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
    v11 = (objc_class *)objc_opt_class(UIImage);
    v12 = NSStringFromClass(v11);
    v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    goto LABEL_7;
  }
  v13 = v9;
LABEL_7:
  v14 = v13;

  v62[0] = CFSTR("propertyFormat");
  v62[1] = CFSTR("propertyRuntimeType");
  v63[0] = CFSTR("image");
  v63[1] = v14;
  v59 = v14;
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v63, v62, 2)));
  *a3 = v15;
  v16 = _UIImageIsFromMainBundle(self);
  IsUIKitImage = _UIImageIsUIKitImage(self);
  IsSystemSymbol = _UIImageIsSystemSymbol(self);
  v60[0] = CFSTR("isFromMainBundle");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v16));
  v61[0] = v19;
  v60[1] = CFSTR("isUIKitImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", IsUIKitImage));
  v61[1] = v20;
  v60[2] = CFSTR("isSystemSymbol");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", IsSystemSymbol));
  v61[2] = v21;
  v60[3] = CFSTR("width");
  -[UIImage size](self, "size");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v61[3] = v22;
  v60[4] = CFSTR("height");
  -[UIImage size](self, "size");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v23));
  v61[4] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 5));
  v26 = objc_msgSend(v25, "mutableCopy");

  v27 = _UIImageIdentityName(self);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  if (v28)
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("imageName"));
  v29 = _UIImageIdentityBundleIdentifier(self);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  if (v30)
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("bundleIdentifier"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage symbolConfiguration](self, "symbolConfiguration"));

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage symbolConfiguration](self, "symbolConfiguration"));
    v33 = _UIImageSymbolConfigurationTextualSummary();
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

    if (v34)
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v34, CFSTR("symbolConfigurationSummary"));

  }
  if ((objc_opt_respondsToSelector(self, "hasBaseline") & 1) != 0 && -[UIImage hasBaseline](self, "hasBaseline"))
  {
    -[UIImage baselineOffsetFromBottom](self, "baselineOffsetFromBottom");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v35, CFSTR("baselineOffsetFromBottom"));

  }
  if ((objc_opt_respondsToSelector(self, "hasMidline") & 1) != 0
    && -[UIImage hasMidline](self, "hasMidline"))
  {
    -[UIImage midlineOffsetFromCenter](self, "midlineOffsetFromCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v36, CFSTR("midlineOffsetFromCenter"));

  }
  if ((objc_opt_respondsToSelector(self, "hasContentInsets") & 1) != 0
    && -[UIImage hasContentInsets](self, "hasContentInsets"))
  {
    -[UIImage contentInsets](self, "contentInsets");
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v64[0] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v38));
    v64[1] = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v40));
    v64[2] = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v42));
    v64[3] = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 4));

    objc_msgSend(v26, "setObject:forKeyedSubscript:", v47, CFSTR("contentInsets"));
  }
  if ((objc_opt_respondsToSelector(self, "_CGPDFPage") & 1) != 0 && -[UIImage _CGPDFPage](self, "_CGPDFPage"))
  {
    v48 = CFSTR("PDF");
LABEL_30:
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v48, CFSTR("vectorImageType"));
    goto LABEL_31;
  }
  if ((objc_opt_respondsToSelector(self, "_CGSVGDocument") & 1) != 0)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage _CGSVGDocument](self, "_CGSVGDocument"));

    if (v49)
    {
      v48 = CFSTR("SVG");
      goto LABEL_30;
    }
  }
LABEL_31:
  v50 = (UIImage *)objc_claimAutoreleasedReturnValue(-[UIImage _imageResizedForDisplayInInspector](self, "_imageResizedForDisplayInInspector"));
  v51 = UIImagePNGRepresentation(v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

  v53 = v52;
  v54 = (unint64_t)v26;
  if (v54 | v53)
  {
    Mutable = CFDictionaryCreateMutable(0, 2, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v56 = Mutable;
    v57 = v59;
    if (v53)
      CFDictionaryAddValue(Mutable, CFSTR("imageData"), (const void *)v53);
    if (v54)
      CFDictionaryAddValue(v56, CFSTR("metadata"), (const void *)v54);
  }
  else
  {
    v56 = 0;
    v57 = v59;
  }

  return v56;
}

- (id)_imageResizedForDisplayInInspector
{
  double v3;
  UIImage *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  UIImage *ImageFromCurrentImageContext;
  CGSize v11;

  if (_UIImageIsSystemSymbol(self) && (-[UIImage size](self, "size"), v3 >= 2.22044605e-16))
  {
    -[UIImage size](self, "size");
    v6 = v5 * 84.0;
    -[UIImage size](self, "size");
    v8 = v6 / v7;
    v11.width = v8;
    v11.height = 84.0;
    UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
    -[UIImage drawInRect:](self, "drawInRect:", 0.0, 0.0, v8, 84.0);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
  }
  else
  {
    v4 = self;
  }
  return v4;
}

@end
