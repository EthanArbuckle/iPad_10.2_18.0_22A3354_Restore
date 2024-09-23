@implementation CALayer

+ (id)fallback_debugHierarchyChildGroupingID
{
  return CFSTR("com.apple.QuartzCore.CALayer");
}

+ (id)fallback_debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6;
  void *v7;

  v6 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.QuartzCore.CALayer")))
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sublayers"));
  else
    v7 = 0;

  return v7;
}

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *Mutable;
  __CFDictionary *v3;
  __CFDictionary *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  __CFDictionary *v9;
  __CFDictionary *v10;
  __CFDictionary *v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  __CFDictionary *v14;
  __CFDictionary *v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  __CFDictionary *v18;
  __CFDictionary *v19;
  __CFDictionary *v20;
  __CFDictionary *v21;
  __CFDictionary *v22;
  __CFDictionary *v23;
  __CFDictionary *v24;
  __CFDictionary *v25;
  __CFDictionary *v26;
  __CFDictionary *v27;
  __CFDictionary *v28;
  __CFDictionary *v29;
  __CFDictionary *v30;
  __CFDictionary *v31;
  __CFDictionary *v32;
  __CFDictionary *v33;
  __CFDictionary *v34;
  __CFDictionary *v35;
  __CFDictionary *v36;
  __CFDictionary *v37;
  __CFDictionary *v38;
  objc_class *v39;
  objc_class *v40;
  NSString *v41;
  objc_class *v42;
  __CFDictionary *v43;
  CFNumberRef v44;
  CFNumberRef v45;
  __CFDictionary *v46;
  __CFDictionary *v47;
  CFNumberRef v48;
  __CFDictionary *v49;
  CFNumberRef v50;
  __CFDictionary *v51;
  CFNumberRef v52;
  __CFDictionary *v53;
  CFNumberRef v54;
  void *v55;
  objc_class *v57;
  __CFDictionary *v58;
  __CFDictionary *v59;
  __CFDictionary *v60;
  __CFDictionary *v61;
  __CFDictionary *v62;
  __CFDictionary *v63;
  __CFDictionary *v64;
  __CFDictionary *v65;
  __CFDictionary *v66;
  __CFDictionary *v67;
  __CFDictionary *v68;
  __CFDictionary *v69;
  __CFDictionary *v70;
  __CFDictionary *v71;
  __CFDictionary *v72;
  __CFDictionary *v73;
  __CFDictionary *v74;
  __CFDictionary *v75;
  __CFDictionary *v76;
  __CFDictionary *v77;
  __CFDictionary *v79;
  __CFDictionary *v80;
  __CFDictionary *v81;
  __CFDictionary *v82;
  __CFDictionary *v83;
  __CFDictionary *v84;
  __CFDictionary *v85;
  __CFDictionary *v86;
  __CFDictionary *v87;
  __CFDictionary *v88;
  __CFDictionary *v89;
  __CFDictionary *v90;
  __CFDictionary *v91;
  __CFDictionary *v92;
  __CFDictionary *v93;
  __CFDictionary *v94;
  __CFDictionary *v95;
  __CFDictionary *v96;
  uint64_t valuePtr;
  _QWORD v98[44];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("anchorPoint"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyRuntimeType"), CFSTR("CGPoint"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypePoint"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v96 = Mutable;
  v98[0] = Mutable;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("anchorPointZ"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("CGf"));
  v95 = v3;
  v98[1] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("backgroundColor"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("color"));
  v94 = v4;
  v98[2] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("borderColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("color"));
  v93 = v5;
  v98[3] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("borderWidth"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("CGf"));
  v92 = v6;
  v98[4] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("bounds"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("CGRect"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeRect"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v91 = v7;
  v98[5] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("contentsCenter"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("CGRect"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeRect"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v90 = v8;
  v98[6] = v8;
  v9 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v9, CFSTR("propertyName"), CFSTR("contentsGravity"));
  CFDictionaryAddValue(v9, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v9, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v9, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v89 = v9;
  v98[7] = v9;
  v10 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v10, CFSTR("propertyName"), CFSTR("contentsScale"));
  CFDictionaryAddValue(v10, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v10, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v10, CFSTR("propertyFormat"), CFSTR("CGf"));
  v88 = v10;
  v98[8] = v10;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("contentsRect"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("CGRect"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeRect"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v87 = v11;
  v98[9] = v11;
  v12 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, CFSTR("propertyName"), CFSTR("cornerRadius"));
  CFDictionaryAddValue(v12, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v12, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v12, CFSTR("propertyFormat"), CFSTR("CGf"));
  v86 = v12;
  v98[10] = v12;
  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("delegate"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v13, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v85 = v13;
  v98[11] = v13;
  v14 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, CFSTR("propertyName"), CFSTR("doubleSided"));
  CFDictionaryAddValue(v14, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v14, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v14, CFSTR("propertyFormat"), CFSTR("b"));
  v84 = v14;
  v98[12] = v14;
  v15 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, CFSTR("propertyName"), CFSTR("frame"));
  CFDictionaryAddValue(v15, CFSTR("propertyRuntimeType"), CFSTR("CGRect"));
  CFDictionaryAddValue(v15, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeRect"));
  CFDictionaryAddValue(v15, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf"));
  v83 = v15;
  v98[13] = v15;
  v16 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, CFSTR("propertyName"), CFSTR("geometryFlipped"));
  CFDictionaryAddValue(v16, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v16, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v16, CFSTR("propertyFormat"), CFSTR("b"));
  v82 = v16;
  v98[14] = v16;
  v17 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, CFSTR("propertyName"), CFSTR("hidden"));
  CFDictionaryAddValue(v17, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v17, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v17, CFSTR("propertyFormat"), CFSTR("b"));
  v81 = v17;
  v98[15] = v17;
  v18 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, CFSTR("propertyName"), CFSTR("magnificationFilter"));
  CFDictionaryAddValue(v18, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v18, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v18, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v80 = v18;
  v98[16] = v18;
  v19 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, CFSTR("propertyName"), CFSTR("mask"));
  CFDictionaryAddValue(v19, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v19, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v77 = v19;
  v98[17] = v19;
  v20 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v20, CFSTR("propertyName"), CFSTR("masksToBounds"));
  CFDictionaryAddValue(v20, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v20, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v20, CFSTR("propertyFormat"), CFSTR("b"));
  v76 = v20;
  v98[18] = v20;
  v21 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v21, CFSTR("propertyName"), CFSTR("minificationFilter"));
  CFDictionaryAddValue(v21, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v21, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v21, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v75 = v21;
  v98[19] = v21;
  v22 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v22, CFSTR("propertyName"), CFSTR("minificationFilterBias"));
  CFDictionaryAddValue(v22, CFSTR("propertyRuntimeType"), CFSTR("float"));
  CFDictionaryAddValue(v22, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v22, CFSTR("propertyFormat"), CFSTR("f"));
  v74 = v22;
  v98[20] = v22;
  v23 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v23, CFSTR("propertyName"), CFSTR("needsDisplayOnBoundsChange"));
  CFDictionaryAddValue(v23, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v23, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v23, CFSTR("propertyFormat"), CFSTR("b"));
  v73 = v23;
  v98[21] = v23;
  v24 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v24, CFSTR("propertyName"), CFSTR("name"));
  CFDictionaryAddValue(v24, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v24, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v24, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v72 = v24;
  v98[22] = v24;
  v25 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v25, CFSTR("propertyName"), CFSTR("opacity"));
  CFDictionaryAddValue(v25, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v25, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v25, CFSTR("propertyFormat"), CFSTR("CGf"));
  v71 = v25;
  v98[23] = v25;
  v26 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v26, CFSTR("propertyName"), CFSTR("opaque"));
  CFDictionaryAddValue(v26, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v26, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v26, CFSTR("propertyFormat"), CFSTR("b"));
  v70 = v26;
  v98[24] = v26;
  v27 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v27, CFSTR("propertyName"), CFSTR("position"));
  CFDictionaryAddValue(v27, CFSTR("propertyRuntimeType"), CFSTR("CGPoint"));
  CFDictionaryAddValue(v27, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypePoint"));
  CFDictionaryAddValue(v27, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v69 = v27;
  v98[25] = v27;
  v28 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v28, CFSTR("propertyName"), CFSTR("shadowColor"));
  CFDictionaryAddValue(v28, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v28, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v28, CFSTR("propertyFormat"), CFSTR("color"));
  v68 = v28;
  v98[26] = v28;
  v29 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v29, CFSTR("propertyName"), CFSTR("rasterizationScale"));
  CFDictionaryAddValue(v29, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v29, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v29, CFSTR("propertyFormat"), CFSTR("CGf"));
  v67 = v29;
  v98[27] = v29;
  v30 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v30, CFSTR("propertyName"), CFSTR("shadowOpacity"));
  CFDictionaryAddValue(v30, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v30, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v30, CFSTR("propertyFormat"), CFSTR("CGf"));
  v66 = v30;
  v98[28] = v30;
  v31 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v31, CFSTR("propertyName"), CFSTR("shadowRadius"));
  CFDictionaryAddValue(v31, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v31, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v31, CFSTR("propertyFormat"), CFSTR("CGf"));
  v65 = v31;
  v98[29] = v31;
  v32 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v32, CFSTR("propertyName"), CFSTR("shadowOffset"));
  CFDictionaryAddValue(v32, CFSTR("propertyRuntimeType"), CFSTR("CGSize"));
  CFDictionaryAddValue(v32, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeSize"));
  CFDictionaryAddValue(v32, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v64 = v32;
  v98[30] = v32;
  v33 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v33, CFSTR("propertyName"), CFSTR("shouldRasterize"));
  CFDictionaryAddValue(v33, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v33, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v33, CFSTR("propertyFormat"), CFSTR("b"));
  v63 = v33;
  v98[31] = v33;
  v34 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v34, CFSTR("propertyName"), CFSTR("sublayerTransform"));
  CFDictionaryAddValue(v34, CFSTR("propertyRuntimeType"), CFSTR("CATransform3D"));
  CFDictionaryAddValue(v34, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeMatrix4"));
  CFDictionaryAddValue(v34, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf"));
  v62 = v34;
  v98[32] = v34;
  v35 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v35, CFSTR("propertyName"), CFSTR("transform"));
  CFDictionaryAddValue(v35, CFSTR("propertyRuntimeType"), CFSTR("CATransform3D"));
  CFDictionaryAddValue(v35, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeMatrix4"));
  CFDictionaryAddValue(v35, CFSTR("propertyFormat"), CFSTR("CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf, CGf"));
  v61 = v35;
  v98[33] = v35;
  v36 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v36, CFSTR("propertyName"), CFSTR("zPosition"));
  CFDictionaryAddValue(v36, CFSTR("propertyRuntimeType"), CFSTR("CGFloat"));
  CFDictionaryAddValue(v36, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v36, CFSTR("propertyFormat"), CFSTR("CGf"));
  v60 = v36;
  v98[34] = v36;
  v37 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v37, CFSTR("propertyName"), CFSTR("compositingFilter"));
  CFDictionaryAddValue(v37, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v37, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v37, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v59 = v37;
  v98[35] = v37;
  v38 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v38, CFSTR("propertyName"), CFSTR("contentsDescription"));
  CFDictionaryAddValue(v38, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v38, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v38, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v58 = v38;
  v98[36] = v38;
  v39 = (objc_class *)objc_opt_class(a1);
  if (v39)
  {
    v40 = v39;
    if (object_isClass(v39))
    {
      v41 = NSStringFromClass(v40);
      v39 = (objc_class *)objc_claimAutoreleasedReturnValue(v41);
    }
    else
    {
      v39 = 0;
    }
  }
  v42 = v39;
  v43 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v43, CFSTR("propertyName"), CFSTR("encodedPresentationLayer"));
  if (v42)
    CFDictionaryAddValue(v43, CFSTR("propertyRuntimeType"), v42);
  CFDictionaryAddValue(v43, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeCustom"));
  CFDictionaryAddValue(v43, CFSTR("propertyFormat"), CFSTR("public.data"));
  valuePtr = 8;
  v44 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v43, CFSTR("visibility"), v44);
  CFRelease(v44);
  valuePtr = 1;
  v45 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v43, CFSTR("propertyOptions"), v45);
  CFRelease(v45);
  v57 = v42;

  v98[37] = v43;
  v79 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v79, CFSTR("propertyName"), CFSTR("optimizationOpportunities"));
  CFDictionaryAddValue(v79, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeCustom"));
  CFDictionaryAddValue(v79, CFSTR("propertyFormat"), CFSTR("custom"));
  v98[38] = v79;
  v46 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v46, CFSTR("propertyName"), CFSTR("optimizationOpportunities_includingInternals"));
  CFDictionaryAddValue(v46, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeCustom"));
  CFDictionaryAddValue(v46, CFSTR("propertyFormat"), CFSTR("custom"));
  v98[39] = v46;
  v47 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v47, CFSTR("propertyName"), CFSTR("renderInfoRenderingPasses"));
  CFDictionaryAddValue(v47, CFSTR("propertyRuntimeType"), CFSTR("int"));
  CFDictionaryAddValue(v47, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v47, CFSTR("propertyFormat"), CFSTR("i"));
  valuePtr = 4;
  v48 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v47, CFSTR("visibility"), v48);
  CFRelease(v48);
  v98[40] = v47;
  v49 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v49, CFSTR("propertyName"), CFSTR("renderInfoOffscreenFlags"));
  CFDictionaryAddValue(v49, CFSTR("propertyRuntimeType"), CFSTR("unsigned long"));
  CFDictionaryAddValue(v49, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v49, CFSTR("propertyFormat"), CFSTR("ul"));
  valuePtr = 4;
  v50 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v49, CFSTR("visibility"), v50);
  CFRelease(v50);
  v98[41] = v49;
  v51 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v51, CFSTR("propertyName"), CFSTR("renderInfoGroupFlags"));
  CFDictionaryAddValue(v51, CFSTR("propertyRuntimeType"), CFSTR("unsigned long"));
  CFDictionaryAddValue(v51, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v51, CFSTR("propertyFormat"), CFSTR("ul"));
  valuePtr = 4;
  v52 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v51, CFSTR("visibility"), v52);
  CFRelease(v52);
  v98[42] = v51;
  v53 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v53, CFSTR("propertyName"), CFSTR("dbg_ListID"));
  CFDictionaryAddValue(v53, CFSTR("propertyRuntimeType"), CFSTR("NSInteger"));
  CFDictionaryAddValue(v53, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v53, CFSTR("propertyFormat"), CFSTR("integer"));
  valuePtr = 8;
  v54 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v53, CFSTR("visibility"), v54);
  CFRelease(v54);
  v98[43] = v53;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v98, 44));

  return v55;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  id v8;
  id v9;
  id v10;
  id *v11;
  void *v12;
  id *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  SEL v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *v25;
  SEL v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[3];
  __CFString *v35;
  __CFString *v36;
  const __CFString *v37;

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("encodedPresentationLayer")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("compositingFilter")))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "compositingFilter"));
LABEL_9:
      v10 = v12;
      v11 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("contentsDescription")))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contents"));
      goto LABEL_9;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("renderInfoRenderingPasses")))
    {
      LODWORD(v36) = 0;
      v35 = 0;
      if (objc_msgSend(v9, "getRendererInfo:size:", &v35, 12))
      {
        v14 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v35));
LABEL_23:
        a6 = v14;
        goto LABEL_12;
      }
LABEL_24:
      a6 = (id *)&off_55168;
      goto LABEL_12;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("renderInfoOffscreenFlags")))
    {
      LODWORD(v36) = 0;
      v35 = 0;
      if (!objc_msgSend(v9, "getRendererInfo:size:", &v35, 12))
        goto LABEL_24;
      v15 = HIDWORD(v35);
LABEL_22:
      v14 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v15));
      goto LABEL_23;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("renderInfoGroupFlags")))
    {
      LODWORD(v36) = 0;
      v35 = 0;
      if (!objc_msgSend(v9, "getRendererInfo:size:", &v35, 12))
        goto LABEL_24;
      v15 = v36;
      goto LABEL_22;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("dbg_ListID")))
    {
      if ((objc_opt_respondsToSelector(v9, "swiftUI_displayListID") & 1) != 0)
      {
        v14 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v9, "swiftUI_displayListID")));
        goto LABEL_23;
      }
LABEL_35:
      a6 = 0;
      goto LABEL_12;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("optimizationOpportunities")))
    {
      if ((objc_opt_respondsToSelector(v9, "optimizationOpportunities:") & 1) == 0)
        goto LABEL_35;
      v16 = v9;
      v17 = 0;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("optimizationOpportunities_includingInternals")))
      {
        v10 = v9;
        v18 = v8;
        if (!objc_msgSend(v18, "length"))
          goto LABEL_48;
        v19 = NSSelectorFromString((NSString *)v18);
        if ((objc_opt_respondsToSelector(v10, v19) & 1) != 0)
        {
          v20 = (NSString *)v18;
        }
        else
        {
          if ((unint64_t)objc_msgSend(v18, "length") < 2)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uppercaseString"));
          }
          else
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "substringToIndex:", 1));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uppercaseString"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "substringFromIndex:", 1));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingString:", v23));

          }
          v25 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v24));
          v26 = NSSelectorFromString(v25);
          v20 = (objc_opt_respondsToSelector(v10, v26) & 1) != 0 ? v25 : 0;

        }
        if (v20)
        {
          a6 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", v20));
        }
        else
        {
LABEL_48:
          if (a6)
          {
            v27 = (__CFString *)v18;
            if (v10)
              v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v10));
            else
              v28 = &stru_38A98;
            if (v27)
              v29 = v27;
            else
              v29 = &stru_38A98;
            v34[0] = CFSTR("propertyName");
            v34[1] = CFSTR("objectDescription");
            v35 = v29;
            v36 = v28;
            v34[2] = CFSTR("errorDescription");
            v37 = &stru_38A98;
            v30 = v29;
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, v34, 3));
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v31));

            v33 = objc_retainAutorelease(v32);
            *a6 = v33;

            v20 = 0;
            a6 = 0;
          }
          else
          {
            v20 = 0;
          }
        }

        goto LABEL_11;
      }
      if ((objc_opt_respondsToSelector(v9, "optimizationOpportunities:") & 1) == 0)
        goto LABEL_35;
      v16 = v9;
      v17 = 1;
    }
    v14 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "optimizationOpportunities:", v17));
    goto LABEL_23;
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentationLayer"));
  if (!v10)
  {
    v10 = v9;
    if (!v10)
      goto LABEL_35;
  }
  v11 = (id *)CAEncodeLayerTree(v10);
LABEL_10:
  a6 = v11;
LABEL_11:

LABEL_12:
  return a6;
}

@end
