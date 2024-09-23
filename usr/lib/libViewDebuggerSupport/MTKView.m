@implementation MTKView

+ (id)fallback_debugHierarchyPropertyDescriptions
{
  __CFDictionary *v2;
  __CFDictionary *v3;
  __CFDictionary *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  __CFDictionary *v8;
  void *v9;
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
  __CFDictionary *Mutable;
  _QWORD v30[26];

  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("propertyName"), CFSTR("delegate"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(Mutable, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v30[0] = Mutable;
  v28 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v28, CFSTR("propertyName"), CFSTR("deviceName"));
  CFDictionaryAddValue(v28, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v28, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v28, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v30[1] = v28;
  v27 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v27, CFSTR("propertyName"), CFSTR("preferredDeviceName"));
  CFDictionaryAddValue(v27, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v27, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v27, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v30[2] = v27;
  v26 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v26, CFSTR("propertyName"), CFSTR("colorPixelFormatName"));
  CFDictionaryAddValue(v26, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v26, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v26, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v30[3] = v26;
  v25 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v25, CFSTR("propertyName"), CFSTR("clearColorAsCGColor"));
  CFDictionaryAddValue(v25, CFSTR("propertyRuntimeType"), CFSTR("CGColor"));
  CFDictionaryAddValue(v25, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeColor"));
  CFDictionaryAddValue(v25, CFSTR("propertyFormat"), CFSTR("color"));
  v30[4] = v25;
  v24 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v24, CFSTR("propertyName"), CFSTR("depthStencilPixelFormatName"));
  CFDictionaryAddValue(v24, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v24, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v24, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v30[5] = v24;
  v23 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v23, CFSTR("propertyName"), CFSTR("clearDepth"));
  CFDictionaryAddValue(v23, CFSTR("propertyRuntimeType"), CFSTR("double"));
  CFDictionaryAddValue(v23, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v23, CFSTR("propertyFormat"), CFSTR("d"));
  v30[6] = v23;
  v22 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v22, CFSTR("propertyName"), CFSTR("clearStencil"));
  CFDictionaryAddValue(v22, CFSTR("propertyRuntimeType"), CFSTR("int"));
  CFDictionaryAddValue(v22, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v22, CFSTR("propertyFormat"), CFSTR("i"));
  v30[7] = v22;
  v21 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v21, CFSTR("propertyName"), CFSTR("sampleCount"));
  CFDictionaryAddValue(v21, CFSTR("propertyRuntimeType"), CFSTR("NSInteger"));
  CFDictionaryAddValue(v21, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v21, CFSTR("propertyFormat"), CFSTR("integer"));
  v30[8] = v21;
  v20 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v20, CFSTR("propertyName"), CFSTR("multisampleColorTexture"));
  CFDictionaryAddValue(v20, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v20, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v30[9] = v20;
  v19 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v19, CFSTR("propertyName"), CFSTR("multisampleColorAttachmentTextureUsage"));
  CFDictionaryAddValue(v19, CFSTR("propertyRuntimeType"), CFSTR("NSUInteger"));
  CFDictionaryAddValue(v19, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v19, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v30[10] = v19;
  v18 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v18, CFSTR("propertyName"), CFSTR("depthStencilPixelFormatName"));
  CFDictionaryAddValue(v18, CFSTR("propertyRuntimeType"), CFSTR("NSString"));
  CFDictionaryAddValue(v18, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeString"));
  CFDictionaryAddValue(v18, CFSTR("propertyFormat"), CFSTR("public.plain-text"));
  v30[11] = v18;
  v17 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v17, CFSTR("propertyName"), CFSTR("clearDepth"));
  CFDictionaryAddValue(v17, CFSTR("propertyRuntimeType"), CFSTR("double"));
  CFDictionaryAddValue(v17, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v17, CFSTR("propertyFormat"), CFSTR("d"));
  v30[12] = v17;
  v16 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v16, CFSTR("propertyName"), CFSTR("clearStencil"));
  CFDictionaryAddValue(v16, CFSTR("propertyRuntimeType"), CFSTR("int"));
  CFDictionaryAddValue(v16, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v16, CFSTR("propertyFormat"), CFSTR("i"));
  v30[13] = v16;
  v15 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v15, CFSTR("propertyName"), CFSTR("depthStencilTexture"));
  CFDictionaryAddValue(v15, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeObjectInfo"));
  CFDictionaryAddValue(v15, CFSTR("propertyFormat"), CFSTR("objectInfo"));
  v30[14] = v15;
  v14 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v14, CFSTR("propertyName"), CFSTR("depthStencilAttachmentTextureUsage"));
  CFDictionaryAddValue(v14, CFSTR("propertyRuntimeType"), CFSTR("NSUInteger"));
  CFDictionaryAddValue(v14, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v14, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v30[15] = v14;
  v13 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v13, CFSTR("propertyName"), CFSTR("preferredFramesPerSecond"));
  CFDictionaryAddValue(v13, CFSTR("propertyRuntimeType"), CFSTR("NSUInteger"));
  CFDictionaryAddValue(v13, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v13, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v30[16] = v13;
  v12 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v12, CFSTR("propertyName"), CFSTR("drawableSize"));
  CFDictionaryAddValue(v12, CFSTR("propertyRuntimeType"), CFSTR("CGSize"));
  CFDictionaryAddValue(v12, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeSize"));
  CFDictionaryAddValue(v12, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v30[17] = v12;
  v11 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v11, CFSTR("propertyName"), CFSTR("preferredDrawableSize"));
  CFDictionaryAddValue(v11, CFSTR("propertyRuntimeType"), CFSTR("CGSize"));
  CFDictionaryAddValue(v11, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeSize"));
  CFDictionaryAddValue(v11, CFSTR("propertyFormat"), CFSTR("CGf, CGf"));
  v30[18] = v11;
  v2 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v2, CFSTR("propertyName"), CFSTR("autoResizeDrawable"));
  CFDictionaryAddValue(v2, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v2, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v2, CFSTR("propertyFormat"), CFSTR("b"));
  v30[19] = v2;
  v3 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v3, CFSTR("propertyName"), CFSTR("framebufferOnly"));
  CFDictionaryAddValue(v3, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v3, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v3, CFSTR("propertyFormat"), CFSTR("b"));
  v30[20] = v3;
  v4 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v4, CFSTR("propertyName"), CFSTR("paused"));
  CFDictionaryAddValue(v4, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v4, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v4, CFSTR("propertyFormat"), CFSTR("b"));
  v30[21] = v4;
  v5 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v5, CFSTR("propertyName"), CFSTR("enableSetNeedsDisplay"));
  CFDictionaryAddValue(v5, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v5, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v5, CFSTR("propertyFormat"), CFSTR("b"));
  v30[22] = v5;
  v6 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v6, CFSTR("propertyName"), CFSTR("maximumDrawableCount"));
  CFDictionaryAddValue(v6, CFSTR("propertyRuntimeType"), CFSTR("NSUInteger"));
  CFDictionaryAddValue(v6, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeNumber"));
  CFDictionaryAddValue(v6, CFSTR("propertyFormat"), CFSTR("uinteger"));
  v30[23] = v6;
  v7 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v7, CFSTR("propertyName"), CFSTR("presentsWithTransaction"));
  CFDictionaryAddValue(v7, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v7, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v7, CFSTR("propertyFormat"), CFSTR("b"));
  v30[24] = v7;
  v8 = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(v8, CFSTR("propertyName"), CFSTR("allowsNextDrawableTimeout"));
  CFDictionaryAddValue(v8, CFSTR("propertyRuntimeType"), CFSTR("BOOL"));
  CFDictionaryAddValue(v8, CFSTR("propertyLogicalType"), CFSTR("DebugHierarchyLogicalPropertyTypeBool"));
  CFDictionaryAddValue(v8, CFSTR("propertyFormat"), CFSTR("b"));
  v30[25] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 26));

  return v9;
}

+ (id)fallback_debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)GenericRGB
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id *v12;
  id v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t Name;
  const char *v20;
  id *v21;
  id v22;
  id v23;
  SEL v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *v30;
  SEL v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[3];
  _QWORD v40[3];

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("deviceName")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "device"));
LABEL_5:
    v11 = v10;
    v12 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("preferredDeviceName")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "preferredDevice"));
    goto LABEL_5;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("colorPixelFormatName")))
  {
    v14 = objc_msgSend(v9, "colorPixelFormat");
  }
  else
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("clearColorAsCGColor")))
    {
      objc_msgSend(v9, "clearColor");
      GenericRGB = (id *)CGColorCreateGenericRGB(v15, v16, v17, v18);
      goto LABEL_8;
    }
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("depthStencilPixelFormatName")))
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("maximumDrawableCount")))
      {
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
        v12 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "maximumDrawableCount")));
      }
      else
      {
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("presentsWithTransaction")))
        {
          v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
          v22 = objc_msgSend(v11, "presentsWithTransaction");
        }
        else
        {
          if (!objc_msgSend(v8, "isEqualToString:", CFSTR("allowsNextDrawableTimeout")))
          {
            v11 = v9;
            v23 = v8;
            if (!objc_msgSend(v23, "length"))
              goto LABEL_39;
            v24 = NSSelectorFromString((NSString *)v23);
            if ((objc_opt_respondsToSelector(v11, v24) & 1) != 0)
            {
              v25 = (NSString *)v23;
            }
            else
            {
              if ((unint64_t)objc_msgSend(v23, "length") < 2)
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "uppercaseString"));
              }
              else
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringToIndex:", 1));
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "uppercaseString"));
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 1));
                v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingString:", v28));

              }
              v30 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("is"), "stringByAppendingString:", v29));
              v31 = NSSelectorFromString(v30);
              v25 = (objc_opt_respondsToSelector(v11, v31) & 1) != 0 ? v30 : 0;

            }
            if (v25)
            {
              GenericRGB = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", v25));
            }
            else
            {
LABEL_39:
              if (GenericRGB)
              {
                v32 = (__CFString *)v23;
                if (v11)
                  v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v11));
                else
                  v33 = &stru_38A98;
                if (v32)
                  v34 = v32;
                else
                  v34 = &stru_38A98;
                v39[0] = CFSTR("propertyName");
                v39[1] = CFSTR("objectDescription");
                v40[0] = v34;
                v40[1] = v33;
                v39[2] = CFSTR("errorDescription");
                v40[2] = &stru_38A98;
                v35 = v34;
                v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 3));
                v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DebugHierarchyErrorDomain"), 100, v36));

                v38 = objc_retainAutorelease(v37);
                *GenericRGB = v38;

                v25 = 0;
                GenericRGB = 0;
              }
              else
              {
                v25 = 0;
              }
            }

            goto LABEL_7;
          }
          v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
          v22 = objc_msgSend(v11, "allowsNextDrawableTimeout");
        }
        v12 = (id *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v22));
      }
LABEL_6:
      GenericRGB = v12;
LABEL_7:

      goto LABEL_8;
    }
    v14 = objc_msgSend(v9, "depthStencilPixelFormat");
  }
  Name = MTLPixelFormatGetName(v14);
  if (Name)
    v20 = (const char *)Name;
  else
    v20 = "Invalid";
  GenericRGB = (id *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v20));
  if (objc_msgSend(GenericRGB, "hasPrefix:", CFSTR("MTLPixelFormat")))
  {
    v21 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(GenericRGB, "substringFromIndex:", objc_msgSend(CFSTR("MTLPixelFormat"), "length")));

    GenericRGB = v21;
  }
LABEL_8:

  return GenericRGB;
}

@end
