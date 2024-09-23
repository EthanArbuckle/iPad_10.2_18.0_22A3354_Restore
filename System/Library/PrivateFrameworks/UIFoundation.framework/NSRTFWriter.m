@implementation NSRTFWriter

- (uint64_t)writeEscapedUTF8String:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  int v6;

  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(a2, "UTF8String");
    v4 = (_BYTE *)v3;
    v5 = (_BYTE *)v3;
    while (1)
    {
      v6 = *v4;
      if (v6 == 92)
      {
        objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:");
        v6 = *v4;
        v5 = v4;
      }
      else if (!*v4)
      {
        return objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", v5, v3 - (_QWORD)v5);
      }
      if (v6 == 125 || v6 == 123)
      {
        objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", v5, v3 - (_QWORD)v5);
        objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", "\\", 1);
        v5 = v4;
      }
      ++v4;
      ++v3;
    }
  }
  return result;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("NSRTFWriteOpenStepCompatibleEncodings"));
    if (v3)
      generateOpenStepCompatible = objc_msgSend(v3, "BOOLValue");
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSRTFWritePreserveNaturalAlignment")))__NSPreserveNaturalAlignment = 1;
  }
}

- (uint64_t)_mostCompatibleCharset:(uint64_t)result
{
  unsigned int v2;

  if (result)
  {
    result = CFStringConvertNSStringEncodingToEncoding(objc_msgSend(a2, "mostCompatibleStringEncoding"));
    v2 = result;
    if (result <= 0xFE && generateOpenStepCompatible)
    {
      switch((int)result)
      {
        case 0:
          return result;
        case 1:
          goto LABEL_16;
        case 2:
          goto LABEL_18;
        case 3:
          goto LABEL_17;
        case 4:
          goto LABEL_15;
        case 5:
          goto LABEL_14;
        case 6:
          goto LABEL_13;
        case 7:
          goto LABEL_6;
        default:
          result = 77;
          switch(v2)
          {
            case 0x15u:
              goto LABEL_10;
            case 0x16u:
            case 0x17u:
            case 0x18u:
            case 0x1Au:
            case 0x1Bu:
            case 0x1Cu:
              return result;
            case 0x19u:
              goto LABEL_12;
            case 0x1Du:
              goto LABEL_8;
            case 0x1Eu:
              goto LABEL_11;
            default:
              if (v2 == 35)
                goto LABEL_20;
              break;
          }
          break;
      }
    }
    else
    {
      result = 0;
      switch(v2)
      {
        case 0x500u:
          return result;
        case 0x501u:
LABEL_8:
          result = 238;
          break;
        case 0x502u:
LABEL_6:
          result = 204;
          break;
        case 0x503u:
LABEL_13:
          result = 161;
          break;
        case 0x504u:
LABEL_20:
          result = 162;
          break;
        case 0x505u:
LABEL_14:
          result = 177;
          break;
        case 0x506u:
LABEL_15:
          result = 178;
          break;
        case 0x507u:
          result = 186;
          break;
        case 0x508u:
LABEL_11:
          result = 163;
          break;
        case 0x509u:
        case 0x50Au:
        case 0x50Bu:
        case 0x50Cu:
        case 0x50Du:
        case 0x50Eu:
        case 0x50Fu:
LABEL_23:
          if (v2 > 0xFE)
            result = 0;
          else
            result = v2 + 77;
          break;
        case 0x510u:
          result = 130;
          break;
        default:
          switch(v2)
          {
            case 0x41Du:
LABEL_10:
              result = 222;
              break;
            case 0x41Eu:
            case 0x41Fu:
              goto LABEL_23;
            case 0x420u:
LABEL_16:
              result = 128;
              break;
            case 0x421u:
LABEL_12:
              result = 134;
              break;
            case 0x422u:
LABEL_17:
              result = 129;
              break;
            case 0x423u:
LABEL_18:
              result = 136;
              break;
            default:
              if (v2 != 33)
                goto LABEL_23;
              result = 2;
              break;
          }
          break;
      }
    }
  }
  return result;
}

- (id)initWithAttributedString:(void *)a1
{
  id v2;
  uint64_t v4;
  CFStringEncoding SystemEncoding;
  CFStringEncoding v6;
  int v7;
  int v8;
  objc_super v10;

  v2 = a1;
  if (a1)
  {
    v4 = objc_msgSend(a1, "zone");
    v10.receiver = v2;
    v10.super_class = (Class)NSRTFWriter;
    v2 = objc_msgSendSuper2(&v10, sel_init);
    if (v2)
    {
      *((_QWORD *)v2 + 1) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DF0], "allocWithZone:", v4), "init");
      *((_QWORD *)v2 + 2) = a2;
      *((_QWORD *)v2 + 3) = objc_msgSend(a2, "length");
      SystemEncoding = CFStringGetSystemEncoding();
      if (SystemEncoding <= 0xFE && generateOpenStepCompatible)
      {
        v6 = SystemEncoding;
        SystemEncoding = 1280;
        switch(v6)
        {
          case 0u:
            break;
          case 1u:
            SystemEncoding = 1056;
            break;
          case 2u:
            SystemEncoding = 1059;
            break;
          case 3u:
            SystemEncoding = 1058;
            break;
          case 4u:
            SystemEncoding = 1286;
            break;
          case 5u:
            SystemEncoding = 1285;
            break;
          case 6u:
            SystemEncoding = 1283;
            break;
          case 7u:
            SystemEncoding = 1282;
            break;
          default:
            SystemEncoding = 0;
            break;
        }
      }
      *((_QWORD *)v2 + 20) = 0x407B000000000000;
      v7 = *((_DWORD *)v2 + 38);
      if (__NSPreserveNaturalAlignment)
        v8 = 16;
      else
        v8 = 0;
      *((_DWORD *)v2 + 37) = SystemEncoding;
      *((_DWORD *)v2 + 38) = v7 & 0xFFFFFFEF | v8;
      *((_QWORD *)v2 + 24) = -1;
      *((_QWORD *)v2 + 25) = -1;
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  NSZoneFree(0, self->_layoutSections);
  v3.receiver = self;
  v3.super_class = (Class)NSRTFWriter;
  -[NSRTFWriter dealloc](&v3, sel_dealloc);
}

- (uint64_t)RTFD
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    *(_DWORD *)(result + 152) |= 0x80u;
    result = objc_msgSend(-[NSRTFWriter RTFDFileWrapper]((_QWORD *)result), "serializedRepresentation");
    *(_DWORD *)(v1 + 152) &= ~0x80u;
  }
  return result;
}

- (_QWORD)RTFDFileWrapper
{
  _QWORD *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  if (result)
  {
    v1 = result;
    v2 = objc_allocWithZone(MEMORY[0x1E0CB3650]);
    v3 = (void *)objc_msgSend(v2, "initDirectoryWithFileWrappers:", MEMORY[0x1E0C9AA70]);
    v4 = objc_allocWithZone(MEMORY[0x1E0CB3650]);
    v5 = (void *)objc_msgSend(v4, "initRegularFileWithContents:", objc_msgSend(MEMORY[0x1E0C99D50], "data"));
    -[NSRTFWriter _setRTFDFileWrapper:](v1, v3);
    objc_msgSend(v5, "setPreferredFilename:", CFSTR("TXT.rtf"));
    objc_msgSend(v3, "addFileWrapper:", v5);
    -[NSRTFWriter writeRTF]((uint64_t)v1);
    v6 = v1[1];
    objc_msgSend(v3, "removeFileWrapper:", v5);

    objc_msgSend(v3, "addRegularFileWithContents:preferredFilename:", v6, CFSTR("TXT.rtf"));
    return v3;
  }
  return result;
}

- (_QWORD)_setRTFDFileWrapper:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = (void *)result[4];
    if (v4 != a2)
    {

      result = a2;
      v3[4] = result;
    }
  }
  return result;
}

- (uint64_t)RTF
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    -[NSRTFWriter writeRTF](result);
    return *(_QWORD *)(v1 + 8);
  }
  return result;
}

- (uint64_t)setDocumentAttributes:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[7];

  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 168);
    if (v4 != a2)
    {

      v5 = a2;
      *(_QWORD *)(v3 + 168) = v5;
      v6 = objc_msgSend(v5, "objectForKey:", CFSTR("PaperMargin"));
      v7 = *(void **)(v3 + 168);
      if (v6)
      {
        v8 = (void *)v6;
        v7 = (void *)objc_msgSend(*(id *)(v3 + 168), "mutableCopy");
        objc_msgSend(v8, "UIEdgeInsetsValue");
        v10 = v9;
        v12 = v11;
        v14 = v13;
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("TopMargin"));
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10), CFSTR("LeftMargin"));
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14), CFSTR("RightMargin"));
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12), CFSTR("BottomMargin"));

        *(_QWORD *)(v3 + 168) = v7;
      }
      v15 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("PaperSize"));
      if (v15)
      {
        objc_msgSend(v15, "sizeValue");
        v17 = v16;
      }
      else
      {
        v17 = 612.0;
      }
      v18 = (void *)objc_msgSend(*(id *)(v3 + 168), "objectForKey:", CFSTR("LeftMargin"));
      v19 = 90.0;
      v20 = 90.0;
      if (v18)
      {
        objc_msgSend(v18, "doubleValue");
        v20 = v21;
      }
      v22 = (void *)objc_msgSend(*(id *)(v3 + 168), "objectForKey:", CFSTR("RightMargin"));
      if (v22)
      {
        objc_msgSend(v22, "doubleValue");
        v19 = v23;
      }
      *(double *)(v3 + 160) = v17 - (v20 + v19);
      v24 = (void *)objc_msgSend(*(id *)(v3 + 168), "objectForKey:", CFSTR("NSTextLayoutSectionsAttribute"));
      result = objc_msgSend(v24, "count");
      if (result)
      {
        v25 = objc_msgSend(v24, "count");
        result = (uint64_t)NSAllocateCollectable(24 * v25 + 24, 0);
        *(_QWORD *)(v3 + 176) = result;
        if (result)
        {
          v26 = result;
          v27 = *(_QWORD *)(v3 + 24);
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __37__NSRTFWriter_setDocumentAttributes___block_invoke;
          v28[3] = &__block_descriptor_56_e15_v32__0_8Q16_B24l;
          v28[4] = result;
          v28[5] = 0;
          v28[6] = v27;
          objc_msgSend(v24, "enumerateObjectsUsingBlock:", v28);
          result = CFQSortArray();
          *(_OWORD *)(v26 + 24 * v25) = xmmword_18D6CBB80;
        }
      }
    }
  }
  return result;
}

uint64_t __37__NSRTFWriter_setDocumentAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSUInteger location;
  uint64_t v7;
  NSUInteger length;
  NSRange v9;
  uint64_t v10;
  NSUInteger *v11;
  uint64_t result;
  NSRange v13;

  location = objc_msgSend(a2, "objectForKey:", CFSTR("NSTextLayoutSectionRange"));
  v7 = *(_QWORD *)(a1 + 32);
  if (location)
  {
    v13.location = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("NSTextLayoutSectionRange")), "rangeValue");
    v9 = NSIntersectionRange(v13, *(NSRange *)(a1 + 40));
    length = v9.length;
    location = v9.location;
  }
  else
  {
    length = 0;
  }
  v10 = 3 * a3;
  v11 = (NSUInteger *)(v7 + 8 * v10);
  *v11 = location;
  v11[1] = length;
  result = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("NSTextLayoutSectionOrientation")), "unsignedIntegerValue");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * v10 + 16) = result;
  return result;
}

- (uint64_t)writeRTF
{
  id *v1;

  if (result)
  {
    v1 = (id *)result;
    if (!*(_QWORD *)(result + 40))
    {
      -[NSRTFWriter collectResources](result);
      objc_msgSend(v1[1], "appendBytes:length:", "{", 1);
      -[NSRTFWriter writeHeader](v1);
      -[NSRTFWriter writeBody](v1);
      return objc_msgSend(v1[1], "appendBytes:length:", "}", 1);
    }
  }
  return result;
}

- (uint64_t)collectResources
{
  uint64_t v1;
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIFont *v9;
  const __CFString *v10;
  CFTypeRef v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  Class NSColorClass_5;
  void *v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const __CFString *attribute;
  unint64_t v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    *(_QWORD *)(result + 40) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", objc_msgSend((id)result, "zone")), "initWithCapacity:", 10);
    *(_QWORD *)(v1 + 48) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", objc_msgSend((id)v1, "zone")), "initWithCapacity:", 10);
    *(_QWORD *)(v1 + 56) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", objc_msgSend((id)v1, "zone")), "initWithCapacity:", 4);
    *(_QWORD *)(v1 + 64) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", objc_msgSend((id)v1, "zone")), "initWithCapacity:", 4);
    *(_QWORD *)(v1 + 208) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)(v1 + 216) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)(v1 + 72) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", objc_msgSend((id)v1, "zone")), "init");
    v2 = (void *)_rtfBlackColor();
    -[NSRTFWriter _addColor:](v1, v2);
    v3 = (void *)_rtfWhiteColor();
    result = -[NSRTFWriter _addColor:](v1, v3);
    if (*(_QWORD *)(v1 + 24))
    {
      v33 = 0;
      v4 = 0;
      v35 = 0;
      attribute = (const __CFString *)*MEMORY[0x1E0CA83B0];
      v36 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        v44 = 0;
        v45 = 0;
        v5 = (void *)objc_msgSend(*(id *)(v1 + 16), "attributesAtIndex:effectiveRange:", v4, &v44);
        v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSParagraphStyle"));
        v7 = (void *)objc_msgSend(v6, "textBlocks");
        v8 = objc_msgSend(v7, "count");
        v9 = (UIFont *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSFont"));
        if (v9 || (v9 = (UIFont *)NSDefaultFont()) != 0)
        {
          v10 = -[NSRTFWriter _plainFontNameForFont:](v1, v9);
          if (!objc_msgSend(*(id *)(v1 + 40), "objectForKeyedSubscript:", v10))
          {
            objc_msgSend(*(id *)(v1 + 40), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:"), v10);
            objc_msgSend(*(id *)(v1 + 48), "setObject:forKeyedSubscript:", v9, v10);
            ++v33;
          }
          v11 = CTFontCopyAttribute((CTFontRef)v9, attribute);
          v12 = (id)CFMakeCollectable(v11);
        }
        else
        {
          v12 = 0;
        }
        -[NSRTFWriter _addColor:](v1, (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSColor")));
        -[NSRTFWriter _addColor:](v1, (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSBackgroundColor")));
        -[NSRTFWriter _addColor:](v1, (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSStrokeColor")));
        -[NSRTFWriter _addColor:](v1, (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSUnderlineColor")));
        -[NSRTFWriter _addColor:](v1, (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSStrikethroughColor")));
        v13 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSTextHighlightStyle"));
        if (v13)
        {
          v14 = v13;
          if (-[NSArray indexOfObject:](+[NSRTFReader defaultTextHighlightStyles](NSRTFReader, "defaultTextHighlightStyles"), "indexOfObject:", v13) == 0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(*(id *)(v1 + 208), "indexOfObject:", v14) == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(*(id *)(v1 + 208), "addObject:", v14);
          }
          v15 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSTextHighlightColorScheme"));
          if (v15)
          {
            v16 = v15;
            if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NSTextHighlightColorSchemeDefault")) & 1) == 0
              && -[NSArray indexOfObject:](+[NSRTFReader defaultTextHighlightColorSchemes](NSRTFReader, "defaultTextHighlightColorSchemes"), "indexOfObject:", v16) == 0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(*(id *)(v1 + 216), "indexOfObject:", v16) == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(*(id *)(v1 + 216), "addObject:", v16);
            }
          }
        }
        result = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("NSShadow")), "shadowColor");
        if (result)
        {
          v42 = 0.0;
          v43 = 0.0;
          v41 = 0.0;
          objc_msgSend((id)RGBColorForColor((void *)result), "getRed:green:blue:alpha:", &v43, &v42, &v41, 0);
          v17 = v42;
          v18 = v43;
          v19 = v41;
          NSColorClass_5 = getNSColorClass_5();
          if (v18 == v17 && v17 == v19)
            v21 = (void *)-[objc_class colorWithCalibratedWhite:alpha:](NSColorClass_5, "colorWithCalibratedWhite:alpha:", v43, 1.0);
          else
            v21 = (void *)-[objc_class colorWithCalibratedRed:green:blue:alpha:](NSColorClass_5, "colorWithCalibratedRed:green:blue:alpha:", v43, v42, v41, 1.0);
          result = -[NSRTFWriter _addColor:](v1, v21);
        }
        if (v8)
        {
          for (i = 0; i != v8; ++i)
          {
            v23 = (void *)objc_msgSend(v7, "objectAtIndex:", i);
            -[NSRTFWriter _addColor:](v1, (void *)objc_msgSend(v23, "backgroundColor"));
            -[NSRTFWriter _addColor:](v1, (void *)objc_msgSend(v23, "borderColorForEdge:", 0));
            -[NSRTFWriter _addColor:](v1, (void *)objc_msgSend(v23, "borderColorForEdge:", 2));
            -[NSRTFWriter _addColor:](v1, (void *)objc_msgSend(v23, "borderColorForEdge:", 1));
            -[NSRTFWriter _addColor:](v1, (void *)objc_msgSend(v23, "borderColorForEdge:", 3));
            objc_opt_class();
            result = objc_opt_isKindOfClass();
            if ((result & 1) != 0)
            {
              v24 = (void *)objc_msgSend(v23, "table");
              -[NSRTFWriter _addColor:](v1, (void *)objc_msgSend(v24, "backgroundColor"));
              -[NSRTFWriter _addColor:](v1, (void *)objc_msgSend(v24, "borderColorForEdge:", 0));
              -[NSRTFWriter _addColor:](v1, (void *)objc_msgSend(v24, "borderColorForEdge:", 2));
              -[NSRTFWriter _addColor:](v1, (void *)objc_msgSend(v24, "borderColorForEdge:", 1));
              result = -[NSRTFWriter _addColor:](v1, (void *)objc_msgSend(v24, "borderColorForEdge:", 3));
            }
          }
        }
        if (v4 >= v36 && v4 - v36 < v35)
          goto LABEL_34;
        result = objc_msgSend(v6, "textLists");
        if (result)
        {
          v25 = (void *)result;
          result = objc_msgSend((id)result, "count");
          if (result)
            break;
        }
        v35 = 0;
        v36 = 0x7FFFFFFFFFFFFFFFLL;
        if (v12)
        {
LABEL_37:
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v28 = (void *)objc_msgSend(v12, "allValues");
          result = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          if (result)
          {
            v29 = result;
            v30 = *(_QWORD *)v38;
            do
            {
              v31 = 0;
              do
              {
                if (*(_QWORD *)v38 != v30)
                  objc_enumerationMutation(v28);
                v32 = (void *)-[objc_class colorWithCGColor:](getNSColorClass_5(), "colorWithCGColor:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v31));
                -[NSRTFWriter _addColor:](v1, v32);
                ++v31;
              }
              while (v29 != v31);
              result = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
              v29 = result;
            }
            while (result);
          }
        }
LABEL_44:
        v4 = v45 + v44;
        if ((unint64_t)(v45 + v44) >= *(_QWORD *)(v1 + 24))
          return result;
      }
      v26 = objc_msgSend(*(id *)(v1 + 16), "rangeOfTextList:atIndex:", objc_msgSend(v25, "objectAtIndex:", 0), v4);
      v35 = v27;
      v36 = v26;
      result = objc_msgSend(*(id *)(v1 + 72), "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:"));
LABEL_34:
      if (v12)
        goto LABEL_37;
      goto LABEL_44;
    }
  }
  return result;
}

- (id)writeHeader
{
  id *v1;

  if (result)
  {
    v1 = result;
    -[NSRTFWriter _writeVersionsAndEncodings]((uint64_t)result);
    -[NSRTFWriter _writeTextScalingAndRenderingHint](v1);
    -[NSRTFWriter writeFontTable]((uint64_t)v1);
    -[NSRTFWriter writeColorTable]((unint64_t)v1);
    -[NSRTFWriter writeHighlightStyleTable]((uint64_t)v1);
    -[NSRTFWriter writeHighlightColorSchemeTable]((uint64_t)v1);
    -[NSRTFWriter writeListTable]((uint64_t)v1);
    -[NSRTFWriter writeInfo]((uint64_t)v1);
    -[NSRTFWriter writePaperSize]((uint64_t)v1);
    -[NSRTFWriter writeHyphenation](v1);
    -[NSRTFWriter writeDefaultTabInterval](v1);
    return -[NSRTFWriter writeBackgroundColor](v1);
  }
  return result;
}

- (id)writeBody
{
  unint64_t v1;
  unint64_t v2;
  __CFString *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  id *v7;
  char v8;
  NSArray *v9;
  char v10;
  void *v11;
  void *v12;
  NSUInteger v13;
  NSParagraphStyle *v14;
  NSArray *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  NSUInteger v27;
  unsigned int v29;
  uint64_t v30;
  id *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  int v39;
  void *v40;
  unint64_t v41;
  __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  BOOL v47;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  int v55;
  unint64_t v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  __int16 v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  void *v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  void *v74;
  const char *Uid;
  void *v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  char *v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id *v97;
  unint64_t v98;
  uint64_t v99;
  __CFString *v100;
  void *v101;
  id *v102;
  uint64_t v103;
  void *v104;
  unint64_t v105;
  unint64_t v106;
  char v107;
  id *v108;
  NSArray *v109;
  unint64_t v110;
  __int128 v111;
  __int128 v112;
  _OWORD v113[4];
  uint64_t v114;
  NSUInteger v115;
  unint64_t v116;
  char __str[8];
  uint64_t v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = (unint64_t)result;
  v115 = 0;
  v116 = 0;
  v114 = 0;
  memset(v113, 0, sizeof(v113));
  v111 = 0u;
  v112 = 0u;
  result = (id *)objc_msgSend(result[2], "string");
  v2 = *(_QWORD *)(v1 + 24);
  v112 = v2;
  *((_QWORD *)&v111 + 1) = result;
  if (!v2)
    return result;
  v3 = (__CFString *)result;
  v4 = v2 >= 0x20 ? 32 : v2;
  v110 = v4;
  result = (id *)objc_msgSend(result, sel_getUid("getCharacters:range:"));
  v5 = v115;
  v6 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)&v111 = 1;
  LOWORD(v114) = v113[0];
  if (v115 >= v6)
    return result;
  v7 = 0;
  v107 = 0;
  v8 = 0;
  v103 = 0;
  v102 = 0;
  v9 = 0;
  v99 = 0;
  v10 = 1;
  v100 = v3;
  do
  {
    v11 = (void *)objc_msgSend(*(id *)(v1 + 16), "attributesAtIndex:longestEffectiveRange:inRange:", v5, &v115, 0);
    v12 = v11;
    v13 = v115 - v5;
    if (v115 < v5)
    {
      v115 = v5;
      v116 += v13;
    }
    v104 = v11;
    if ((v10 & 1) == 0)
      goto LABEL_36;
    v108 = v7;
    v14 = (NSParagraphStyle *)objc_msgSend(v11, "objectForKey:", CFSTR("NSParagraphStyle"));
    v15 = -[NSParagraphStyle textBlocks](v14, "textBlocks");
    v16 = -[NSParagraphStyle textLists](v14, "textLists");
    if (v14)
    {
      if (v15)
        goto LABEL_15;
    }
    else
    {
      v14 = +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
      if (v15)
      {
LABEL_15:
        v17 = -[NSArray count](v15, "count");
        if (v17)
        {
          v18 = v17;
          if ((-[NSArray isEqual:](v15, "isEqual:", v9) & 1) == 0)
          {
            for (i = 0; i != v18; ++i)
            {
              v20 = -[NSArray objectAtIndex:](v15, "objectAtIndex:", i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = objc_msgSend(v20, "table");
                if (v21)
                {
                  v22 = (void *)v21;
                  if (objc_msgSend(*(id *)(v1 + 16), "_atStartOfTextTableRow:atIndex:", v21, v115))
                    -[NSRTFWriter writeTableHeader:atIndex:nestingLevel:](v1, v22, v115, i);
                }
              }
            }
          }
        }
      }
    }
    -[NSRTFWriter writeParagraphStyle:](v1, v14);
    if (-[NSArray count](v16, "count"))
    {
      v23 = objc_msgSend(*(id *)(v1 + 72), "count");
      v3 = v100;
      if (v23)
      {
        v24 = v23;
        v25 = 0;
        while (1)
        {
          v26 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 72), "objectAtIndex:", v25), "rangeValue");
          if (v115 >= v26 && v115 - v26 < v27)
            break;
          if (v24 == ++v25)
            goto LABEL_34;
        }
        snprintf(__str, 0x64uLL, "\\ls%ld\\ilvl%ld", v25 + 1, -[NSArray count](v16, "count") - 1);
        objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", __str, strlen(__str));
      }
LABEL_34:
      v9 = v15;
    }
    else
    {
      v9 = v15;
      v3 = v100;
    }
    v12 = v104;
    v7 = v108;
LABEL_36:
    if (!v103)
    {
      if (objc_msgSend(v12, "objectForKey:", CFSTR("NSLink")))
      {
        *(_QWORD *)__str = 0;
        v118 = 0;
        v29 = -[NSRTFWriter writeLinkInfo:]((CFDataRef)v1, (const __CFURL *)objc_msgSend(*(id *)(v1 + 16), "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("NSLink"), v115, __str, 0, *(_QWORD *)(v1 + 24)));
        v30 = v118 + *(_QWORD *)__str;
        v31 = v102;
        if (v29)
          v31 = v7;
        v102 = v31;
        if (!v29)
          v30 = 0;
        v103 = v30;
      }
      else
      {
        v103 = 0;
      }
    }
    -[NSRTFWriter writeCharacterAttributes:previousAttributes:](v1, v12, v7);
    v32 = -[NSRTFWriter textFlowWithAttributes:range:](v1, v12, &v115);
    if (v32 != v99)
    {
      v33 = v32;
      -[NSRTFWriter writeTextFlow:](v1, v32);
      v99 = v33;
    }
    v34 = (void *)objc_msgSend(v12, "objectForKey:", NSGlyphInfoAttributeName);
    if (v34)
    {
      objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "{", 1);
      -[NSRTFWriter writeGlyphInfo:](v1, v34);
    }
    v101 = v34;
    v35 = v111;
    v36 = *((_QWORD *)&v112 + 1) + v111 - 1;
    v37 = 1 - (*((_QWORD *)&v112 + 1) + v111);
    if (v116)
    {
      v38 = 0;
      v39 = (unsigned __int16)v114;
      v109 = v9;
      while (1)
      {
        switch(v39)
        {
          case 9:
            if ((v107 & 1) != 0)
            {
              writeCharacters(*(_QWORD *)(v1 + 8), v3, v36, v38 + v37 + v115 + 1, 1u);
              v36 = v111 + *((_QWORD *)&v112 + 1);
              objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "}", 1);
LABEL_103:
              v107 = 0;
              goto LABEL_104;
            }
            if ((v10 & 1) == 0
              || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v104, "objectForKey:", CFSTR("NSParagraphStyle")), "textLists"), "count"))
            {
              goto LABEL_103;
            }
            v59 = *((_QWORD *)&v112 + 1);
            v60 = v111;
            if ((unint64_t)v111 < v110)
            {
              v61 = v111 + 1;
              *(_QWORD *)&v111 = v111 + 1;
              v62 = *((_WORD *)v113 + v60);
LABEL_122:
              LOWORD(v114) = v62;
              goto LABEL_123;
            }
            v71 = v110 + *((_QWORD *)&v112 + 1);
            if ((unint64_t)v112 <= v110 + *((_QWORD *)&v112 + 1))
            {
              v61 = v110 + 1;
              *(_QWORD *)&v111 = v110 + 1;
              v62 = -1;
              goto LABEL_122;
            }
            v72 = v38;
            if ((unint64_t)v112 - (v110 + *((_QWORD *)&v112 + 1)) >= 0x20)
              v73 = 32;
            else
              v73 = v112 - (v110 + *((_QWORD *)&v112 + 1));
            *((_QWORD *)&v112 + 1) += v110;
            v110 = v73;
            v74 = (void *)*((_QWORD *)&v111 + 1);
            Uid = sel_getUid("getCharacters:range:");
            v76 = v74;
            v9 = v109;
            v77 = v73;
            v38 = v72;
            objc_msgSend(v76, Uid, v113, v71, v77);
            v62 = v113[0];
            LOWORD(v114) = v113[0];
            *(_QWORD *)&v111 = 1;
            v61 = 1;
LABEL_123:
            v106 = v60 + v59;
            v78 = v60 + v59 - 1;
            while (1)
            {
              v79 = v110;
              if (v61 - 1 >= v110)
                break;
              v80 = 0x7FFFFFFFFFFFFFFFLL;
              switch(v62)
              {
                case 9:
                  v80 = *((_QWORD *)&v112 + 1) + v61 - 1;
                  goto LABEL_131;
                case 10:
                case 12:
                  goto LABEL_143;
                case 11:
                  goto LABEL_131;
                case 13:
                  v81 = *((_QWORD *)&v112 + 1) + v61;
                  if (v81 >= -[__CFString length](v3, "length")
                    || -[__CFString characterAtIndex:](v3, "characterAtIndex:", v81) != 10)
                  {
                    goto LABEL_143;
                  }
                  v79 = v110;
                  v61 = v111;
LABEL_131:
                  if (v61 < v79)
                  {
                    v82 = (char *)&v110 + 2 * v61++;
                    *(_QWORD *)&v111 = v61;
                    v62 = *((_WORD *)v82 + 20);
LABEL_139:
                    LOWORD(v114) = v62;
                    goto LABEL_140;
                  }
                  v83 = *((_QWORD *)&v112 + 1) + v79;
                  if ((unint64_t)v112 <= *((_QWORD *)&v112 + 1) + v79)
                  {
                    v61 = v79 + 1;
                    *(_QWORD *)&v111 = v79 + 1;
                    v62 = -1;
                    goto LABEL_139;
                  }
                  v84 = v38;
                  if ((unint64_t)v112 - (*((_QWORD *)&v112 + 1) + v79) >= 0x20)
                    v85 = 32;
                  else
                    v85 = v112 - (*((_QWORD *)&v112 + 1) + v79);
                  *((_QWORD *)&v112 + 1) += v79;
                  v110 = v85;
                  v86 = (void *)*((_QWORD *)&v111 + 1);
                  v87 = sel_getUid("getCharacters:range:");
                  v88 = v86;
                  v9 = v109;
                  v89 = v85;
                  v38 = v84;
                  objc_msgSend(v88, v87, v113, v83, v89);
                  v62 = v113[0];
                  LOWORD(v114) = v113[0];
                  *(_QWORD *)&v111 = 1;
                  v61 = 1;
LABEL_140:
                  if (v80 != 0x7FFFFFFFFFFFFFFFLL)
                    goto LABEL_143;
                  break;
                default:
                  if (DWORD2(v112) != 8233)
                    goto LABEL_131;
                  goto LABEL_143;
              }
            }
            v80 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_143:
            v90 = *((_QWORD *)&v112 + 1);
            if (*((_QWORD *)&v112 + 1) > v78 || v110 + *((_QWORD *)&v112 + 1) <= v78)
            {
              if (v78 > 0xF)
              {
                v93 = v112;
                v91 = v38;
                if ((uint64_t)v112 - 16 >= v78)
                {
                  v92 = v106 - 17;
                }
                else if ((unint64_t)v112 >= 0x20)
                {
                  v92 = v112 - 32;
                }
                else
                {
                  v92 = 0;
                }
                *((_QWORD *)&v112 + 1) = v92;
              }
              else
              {
                v91 = v38;
                v92 = 0;
                *((_QWORD *)&v112 + 1) = 0;
                v93 = v112;
              }
              v94 = v93 - v92;
              if (v94 >= 0x20)
                v95 = 32;
              else
                v95 = v94;
              v110 = v95;
              objc_msgSend(*((id *)&v111 + 1), sel_getUid("getCharacters:range:"), v113, v92, v95);
              LOWORD(v114) = v113[0];
              v90 = *((_QWORD *)&v112 + 1);
              v9 = v109;
              v38 = v91;
            }
            v107 = 0;
            v96 = v78 - v90;
            *(_QWORD *)&v111 = v96 + 1;
            LOWORD(v114) = *((_WORD *)v113 + v96);
            if (v78 == 0x7FFFFFFFFFFFFFFFLL || v80 == 0x7FFFFFFFFFFFFFFFLL || v80 <= v106)
            {
              v10 = 0;
            }
            else
            {
              objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "{\\listtext", 10);
              v10 = 0;
              v107 = 1;
            }
LABEL_105:
            v63 = v111;
            if ((unint64_t)v111 >= v110)
            {
              v64 = *((_QWORD *)&v112 + 1) + v110;
              if ((unint64_t)v112 > *((_QWORD *)&v112 + 1) + v110)
              {
                v65 = v38;
                if ((unint64_t)v112 - (*((_QWORD *)&v112 + 1) + v110) >= 0x20)
                  v66 = 32;
                else
                  v66 = v112 - (*((_QWORD *)&v112 + 1) + v110);
                *((_QWORD *)&v112 + 1) += v110;
                v110 = v66;
                v67 = (void *)*((_QWORD *)&v111 + 1);
                v68 = sel_getUid("getCharacters:range:");
                v69 = v67;
                v9 = v109;
                v70 = v66;
                v38 = v65;
                objc_msgSend(v69, v68, v113, v64, v70);
                v39 = LOWORD(v113[0]);
                LOWORD(v114) = v113[0];
                *(_QWORD *)&v111 = 1;
                v35 = 1;
                goto LABEL_114;
              }
              v35 = v110 + 1;
              *(_QWORD *)&v111 = v110 + 1;
              v39 = 0xFFFF;
            }
            else
            {
              v35 = v111 + 1;
              *(_QWORD *)&v111 = v111 + 1;
              v39 = *((unsigned __int16 *)v113 + v63);
            }
            LOWORD(v114) = v39;
LABEL_114:
            ++v38;
            v37 = -(uint64_t)v36;
            if (v38 >= v116)
              goto LABEL_163;
            break;
          case 10:
          case 12:
            goto LABEL_63;
          case 11:
            goto LABEL_58;
          case 13:
            v41 = v35 + *((_QWORD *)&v112 + 1);
            if (v41 < -[__CFString length](v3, "length")
              && -[__CFString characterAtIndex:](v3, "characterAtIndex:", v41) == 10)
            {
              goto LABEL_58;
            }
            goto LABEL_63;
          default:
            if (v39 == 8233)
            {
LABEL_63:
              v44 = objc_msgSend((id)objc_msgSend(v104, "objectForKey:", CFSTR("NSWritingDirection")), "count");
              v105 = v38;
              writeCharacters(*(_QWORD *)(v1 + 8), v3, v36, v37 + v38 + v115, *(_DWORD *)(v1 + 148));
              while (v44)
              {
                --v44;
                *(_WORD *)__str = 8236;
                writeCharacters(*(_QWORD *)(v1 + 8), (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", __str, 1), 0, 1, *(_DWORD *)(v1 + 148));
              }
              if ((v107 & 1) != 0)
                objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "}", 1);
              v36 = v111 + *((_QWORD *)&v112 + 1);
              if (v9 && (v45 = -[NSArray count](v9, "count")) != 0)
              {
                v46 = v45;
                v47 = v103 != 0;
                if (v36 < *(_QWORD *)(v1 + 24)
                  && (v48 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 16), "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v36, 0), "textBlocks"), v49 = objc_msgSend(v48, "count"), v48))
                {
                  v50 = 0;
                  if (v46 >= v49)
                    v51 = v49;
                  else
                    v51 = v46;
                  if (v51)
                  {
                    do
                    {
                      v52 = objc_msgSend(v48, "objectAtIndex:", v50);
                      if ((id)v52 != -[NSArray objectAtIndex:](v109, "objectAtIndex:", v50))
                        goto LABEL_78;
                      ++v50;
                    }
                    while (v51 != v50);
                    v50 = v51;
                  }
LABEL_78:
                  v3 = v100;
                }
                else
                {
                  v50 = 0;
                }
                v55 = 0;
                v56 = v46 - 1;
                do
                {
                  if (v56 >= v50)
                  {
                    if (v47)
                      objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "}}", 2);
                    v47 = 0;
                    v55 |= -[NSRTFWriter writeCellTerminator:atIndex:nestingLevel:](v1, -[NSArray objectAtIndex:](v109, "objectAtIndex:", v56), v36 - 1, v56);
                  }
                  v8 |= *(_QWORD *)(v1 + 24) == v36;
                  --v56;
                }
                while (v56 != -1);
                v57 = "\\\n";
                if ((v55 & 1) != 0)
                  v57 = "\n";
                if (v39 == 12)
                  v58 = "\\page\n";
                else
                  v58 = v57;
                objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", v58, strlen(v58));
                if (v103 != 0 && !v47)
                {
                  -[NSRTFWriter restoreAttributes:](v1, v102);
                  v103 = 0;
                }
                v107 = 0;
                v10 = 1;
                v9 = v109;
              }
              else
              {
                if (v39 == 12)
                {
                  v53 = "\\page ";
                  v54 = 6;
                }
                else
                {
                  v53 = "\\\n";
                  v54 = 2;
                }
                objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", v53, v54);
                v107 = 0;
                v10 = 1;
              }
              v38 = v105;
              goto LABEL_105;
            }
            if (v39 == 65532)
            {
              writeCharacters(*(_QWORD *)(v1 + 8), v3, v36, v37 + v38 + v115, *(_DWORD *)(v1 + 148));
              v40 = (void *)objc_msgSend(v104, "objectForKey:", CFSTR("NSAttachment"));
              objc_msgSend(v104, "objectForKey:", NSAttachmentEditableDataAttributeName);
              objc_msgSend(v104, "objectForKey:", NSAttachmentEditableDataTypeIdentifierAttributeName);
              -[NSRTFWriter writeAttachment:editableData:editableTypeIdentifier:](v1, v40);
              -[NSRTFWriter writeImageGlyph:attributes:](v1, (void *)objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("CTAdaptiveImageProvider")), (uint64_t)v104);
              v36 = v111 + *((_QWORD *)&v112 + 1);
              goto LABEL_105;
            }
LABEL_58:
            if ((v10 & 1) != 0)
            {
              if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v104, "objectForKey:", CFSTR("NSParagraphStyle")), "textLists"), "count"))
              {
                v42 = (__CFString *)-[NSRTFWriter _markerStringAtCharacterIndex:](v1, v36);
                if (-[__CFString length](v42, "length"))
                {
                  -[__CFString rangeOfString:options:range:](v3, "rangeOfString:options:range:", v42, 10, v36, -[__CFString length](v3, "length") - v36);
                  if (!v43)
                  {
                    objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "{\\listtext", 10);
                    writeCharacters(*(_QWORD *)(v1 + 8), v42, 0, -[__CFString length](v42, "length"), *(_DWORD *)(v1 + 148));
                    objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "}", 1);
                  }
                }
              }
            }
LABEL_104:
            v10 = 0;
            goto LABEL_105;
        }
      }
    }
    v38 = 0;
LABEL_163:
    writeCharacters(*(_QWORD *)(v1 + 8), v3, v36, v37 + v38 + v115, *(_DWORD *)(v1 + 148));
    if (v101)
      objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "}", 1);
    v5 = v115 + v116;
    v115 = v5;
    result = (id *)v104;
    if (v103 == v5)
    {
      objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "}}", 2);
      -[NSRTFWriter restoreAttributes:](v1, v102);
      v103 = 0;
      v5 = v115;
      result = v102;
    }
    v7 = result;
  }
  while (v5 < *(_QWORD *)(v1 + 24));
  if (result)
  {
    result = (id *)objc_msgSend((id)objc_msgSend(result, "objectForKey:", CFSTR("NSWritingDirection")), "count");
    if (result)
    {
      v97 = result;
      do
      {
        v97 = (id *)((char *)v97 - 1);
        *(_WORD *)__str = 8236;
        result = (id *)writeCharacters(*(_QWORD *)(v1 + 8), (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", __str, 1), 0, 1, *(_DWORD *)(v1 + 148));
      }
      while (v97);
    }
  }
  if (!(v8 & 1 | (v9 == 0)))
  {
    result = -[NSArray count](v9, "count");
    if (result)
    {
      v98 = (unint64_t)result - 1;
      do
      {
        result = (id *)-[NSRTFWriter writeCellTerminator:atIndex:nestingLevel:](v1, -[NSArray objectAtIndex:](v9, "objectAtIndex:", v98), *(_QWORD *)(v1 + 24) - 1, v98);
        --v98;
      }
      while (v98 != -1);
    }
  }
  return result;
}

- (BOOL)_canWriteColor:(_BOOL8)result
{
  CGColorSpace *ColorSpace;

  if (result)
  {
    getUIColorClass_1[0]();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(a2, "CGColor"));
      return CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelPattern;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_addColor:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    if (a2)
    {
      v3 = result;
      result = -[NSRTFWriter _canWriteColor:](result, a2);
      if ((_DWORD)result)
      {
        result = objc_msgSend(*(id *)(v3 + 56), "objectForKeyedSubscript:", a2);
        if (!result)
        {
          v4 = objc_msgSend(*(id *)(v3 + 64), "count");
          objc_msgSend(*(id *)(v3 + 56), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4), a2);
          return objc_msgSend(*(id *)(v3 + 64), "addObject:", a2);
        }
      }
    }
  }
  return result;
}

- (const)_plainFontNameForFont:(uint64_t)a1
{
  NSString *v4;
  int v5;
  UIFontDescriptorSymbolicTraits v6;
  UIFont *v7;
  uint64_t v8;
  UIFont *v9;
  uint64_t v10;
  UIFont *v11;
  NSMapTable *v12;
  __int128 v13;
  NSMapTableValueCallBacks v14;
  NSMapTableKeyCallBacks keyCallBacks;

  if (!a1)
    return 0;
  if (!a2)
    return &stru_1E260C7D0;
  if (_plainFontNameForFont__tigerCompatibility == 255)
  {
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("NSRTFWriterTigerCompatibility"));
    _plainFontNameForFont__tigerCompatibility = v5;
    if (v5)
      return (const __CFString *)-[UIFont fontName](a2, "fontName");
  }
  else if (_plainFontNameForFont__tigerCompatibility)
  {
    return (const __CFString *)-[UIFont fontName](a2, "fontName");
  }
  os_unfair_lock_lock_with_options();
  if (!_plainFontNameForFont__fontToPlainNameTable)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&rtfWritingLock);
LABEL_12:
    v6 = -[UIFontDescriptor symbolicTraits](-[UIFont fontDescriptor](a2, "fontDescriptor"), "symbolicTraits");
    v7 = a2;
    if ((v6 & 0xFFFFFFC) == 0)
    {
      v7 = a2;
      if ((v6 & 3) != 0)
      {
        v8 = -[UIFontDescriptor fontDescriptorWithSymbolicTraits:](-[UIFont fontDescriptor](a2, "fontDescriptor"), "fontDescriptorWithSymbolicTraits:", v6 & 0xFFFFFFFC);
        -[UIFont pointSize](a2, "pointSize");
        v9 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v8);
        v10 = -[UIFontDescriptor fontDescriptorWithSymbolicTraits:](-[UIFont fontDescriptor](v9, "fontDescriptor"), "fontDescriptorWithSymbolicTraits:", -[UIFontDescriptor symbolicTraits](-[UIFont fontDescriptor](v9, "fontDescriptor"), "symbolicTraits") | 3);
        -[UIFont pointSize](v9, "pointSize");
        if (-[UIFont isEqual:](v9, "isEqual:", +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v10)))v7 = v9;
        else
          v7 = a2;
      }
    }
    v4 = -[UIFont fontName](v7, "fontName");
    if (-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("LastResort")))
    {
      v11 = (UIFont *)NSDefaultFont();
    }
    else if (-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("AquaKana")))
    {
      v11 = +[UIFont systemFontOfSize:](NSFont, "systemFontOfSize:", 0.0);
    }
    else
    {
      if (!-[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("AquaKana-Bold")))
      {
LABEL_24:
        os_unfair_lock_lock_with_options();
        v12 = (NSMapTable *)_plainFontNameForFont__fontToPlainNameTable;
        if (!_plainFontNameForFont__fontToPlainNameTable)
        {
          v13 = *(_OWORD *)(MEMORY[0x1E0CB2FB0] + 16);
          *(_OWORD *)&keyCallBacks.hash = *MEMORY[0x1E0CB2FB0];
          *(_OWORD *)&keyCallBacks.retain = v13;
          *(_OWORD *)&keyCallBacks.describe = *(_OWORD *)(MEMORY[0x1E0CB2FB0] + 32);
          v14 = *(NSMapTableValueCallBacks *)*(_QWORD *)&MEMORY[0x1E0CB2FB8];
          v12 = NSCreateMapTableWithZone(&keyCallBacks, &v14, 0x14uLL, 0);
          _plainFontNameForFont__fontToPlainNameTable = (uint64_t)v12;
        }
        NSMapInsert(v12, a2, v4);
        os_unfair_lock_unlock((os_unfair_lock_t)&rtfWritingLock);
        return (const __CFString *)v4;
      }
      v11 = +[UIFont boldSystemFontOfSize:](NSFont, "boldSystemFontOfSize:", 0.0);
    }
    v4 = -[UIFont fontName](v11, "fontName");
    goto LABEL_24;
  }
  v4 = (NSString *)NSMapGet((NSMapTable *)_plainFontNameForFont__fontToPlainNameTable, a2);
  os_unfair_lock_unlock((os_unfair_lock_t)&rtfWritingLock);
  if (!v4)
    goto LABEL_12;
  return (const __CFString *)v4;
}

- (uint64_t)writeFontTable
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  double v15;
  double v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  __CFString *v22;
  id v23;
  uint64_t v24;
  const void *v25;
  NSMapTable *v26;
  __int128 v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  const void *v41;
  NSMapTableValueCallBacks valueCallBacks;
  NSMapTableKeyCallBacks keyCallBacks;
  char __str[100];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 40), "count");
    v3 = (void *)objc_msgSend(*(id *)(v1 + 40), "keyEnumerator");
    v38 = (uint64_t)&v38;
    v16 = MEMORY[0x1E0C80A78](v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
    v18 = (char *)&v38 - v17;
    objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "{\\fonttbl", 9, v16);
    if (v2)
      bzero(v18, 8 * v2);
    v19 = objc_msgSend(v3, "nextObject");
    if (v19)
    {
      v20 = v19;
      do
      {
        *(_QWORD *)&v18[8
                      * objc_msgSend((id)objc_msgSend(*(id *)(v1 + 40), "objectForKey:", v20), "unsignedIntegerValue")] = v20;
        v20 = objc_msgSend(v3, "nextObject");
      }
      while (v20);
    }
    if (v2)
    {
      v21 = 0;
      v40 = v2;
      v39 = v18;
      do
      {
        v22 = *(__CFString **)&v18[8 * v21];
        v23 = +[UIFont _fontWithName:size:](NSFont, "_fontWithName:size:", v22, 12.0);
        if (!v23)
          v23 = (id)objc_msgSend(*(id *)(v1 + 48), "objectForKey:", v22);
        snprintf(__str, 0x64uLL, "\\f%ld\\f", v21);
        objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", __str, strlen(__str));
        v24 = objc_msgSend(v23, "familyName");
        if (v24)
        {
          v25 = (const void *)v24;
          os_unfair_lock_lock_with_options();
          v26 = (NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable;
          if (!rtfFontFamilyForFontFamily_fontMapTable)
          {
            v27 = *(_OWORD *)(MEMORY[0x1E0CB2FB0] + 16);
            *(_OWORD *)&keyCallBacks.hash = *MEMORY[0x1E0CB2FB0];
            *(_OWORD *)&keyCallBacks.retain = v27;
            *(_OWORD *)&keyCallBacks.describe = *(_OWORD *)(MEMORY[0x1E0CB2FB0] + 32);
            valueCallBacks = *(NSMapTableValueCallBacks *)*(_QWORD *)&MEMORY[0x1E0CB2C40];
            rtfFontFamilyForFontFamily_fontMapTable = (uint64_t)NSCreateMapTableWithZone(&keyCallBacks, &valueCallBacks, 5uLL, 0);
            NSMapInsertKnownAbsent((NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable, CFSTR("Times-Roman"), (const void *)1);
            NSMapInsertKnownAbsent((NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable, CFSTR("Helvetica"), (const void *)2);
            NSMapInsertKnownAbsent((NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable, CFSTR("Courier"), (const void *)3);
            NSMapInsertKnownAbsent((NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable, CFSTR("Symbol"), (const void *)6);
            NSMapInsertKnownAbsent((NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable, CFSTR("Ohlfs"), (const void *)3);
            v26 = (NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable;
          }
          v28 = NSMapGet(v26, v25);
          if (!v28)
          {
            if ((rtfFontFamilyForFontFamily_loadedExternalFile & 1) != 0)
            {
              v28 = 0;
            }
            else
            {
              os_unfair_lock_unlock((os_unfair_lock_t)&rtfWritingLock);
              v29 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", CFSTR("NSRTFFontFamilyMappings"), CFSTR("plist"));
              v41 = v25;
              if (v29)
                v30 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v29);
              else
                v30 = 0;
              os_unfair_lock_lock_with_options();
              if ((rtfFontFamilyForFontFamily_loadedExternalFile & 1) == 0)
              {
                rtfFontFamilyForFontFamily_loadedExternalFile = 1;
                if (v30)
                {
                  for (i = 1; i != 8; ++i)
                  {
                    v32 = (void *)objc_msgSend(v30, "objectForKey:", rtfFontFamilyNames[i]);
                    v33 = objc_msgSend(v32, "count");
                    if (v33)
                    {
                      v34 = v33 - 1;
                      do
                        NSMapInsert((NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable, (const void *)objc_msgSend(v32, "objectAtIndex:", v34--), (const void *)i);
                      while (v34 != -1);
                    }
                  }
                }
              }

              v28 = NSMapGet((NSMapTable *)rtfFontFamilyForFontFamily_fontMapTable, v41);
              v2 = v40;
              v18 = v39;
            }
          }
          os_unfair_lock_unlock((os_unfair_lock_t)&rtfWritingLock);
        }
        else
        {
          v28 = 0;
        }
        -[NSRTFWriter writeEscapedUTF8String:](v1, rtfFontFamilyNames[(_QWORD)v28]);
        v35 = -[NSRTFWriter _mostCompatibleCharset:](v1, v23);
        snprintf(__str, 0x64uLL, "\\fcharset%d ", v35);
        objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", __str, strlen(__str));
        writeCharacters(*(_QWORD *)(v1 + 8), v22, 0, -[__CFString length](v22, "length"), *(_DWORD *)(v1 + 148));
        if (v21 % 3 == 2)
          v36 = ";\n";
        else
          v36 = ";";
        if (v21 % 3 == 2)
          v37 = 2;
        else
          v37 = 1;
        objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", v36, v37);
        ++v21;
      }
      while (v21 != v2);
    }
    return objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "}\n", 2);
  }
  return result;
}

- (unint64_t)writeColorTable
{
  unint64_t v1;
  unint64_t v2;
  unint64_t i;
  void *v4;
  double v5;
  double v6;
  double v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  CGColor *v13;
  uint64_t v14;
  CGColorSpace *ColorSpace;
  CGColorSpace *v16;
  CGColorSpaceModel Model;
  CFStringRef v18;
  const void *v19;
  unsigned int v20;
  size_t NumberOfComponents;
  BOOL v22;
  uint64_t v23;
  char *v24;
  double v25;
  void *v26;
  const char *v27;
  int v28;
  unsigned __int8 *v29;
  int v30;
  const char *v31;
  uint64_t v32;
  CFTypeRef v33;
  CFTypeRef v34;
  CFTypeRef v35;
  CFTypeRef v36;
  CFTypeRef v37;
  CFTypeRef v38;
  const __CFString *v39;
  const __CFString *cf2;
  const __CFString *v41;
  CFStringRef cf1;
  double v43;
  double v44;
  _QWORD v45[5];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char __str[200];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 56), "count");
    if (result >= 2)
    {
      v2 = result;
      objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "{\\colortbl;", 11);
      for (i = 1; i != v2; ++i)
      {
        v4 = (void *)RGBColorForColor((void *)objc_msgSend(*(id *)(v1 + 64), "objectAtIndexedSubscript:", i));
        if (v4)
        {
          v44 = 0.0;
          *(double *)v45 = 0.0;
          v43 = 0.0;
          objc_msgSend(v4, "getRed:green:blue:alpha:", v45, &v44, &v43, 0);
          v5 = *(double *)v45;
          if (*(double *)v45 >= 0.0)
          {
            if (*(double *)v45 > 1.0)
            {
              *(double *)v45 = 1.0;
              v5 = 1.0;
            }
          }
          else
          {
            *(double *)v45 = 0.0;
            v5 = 0.0;
          }
          v6 = v44;
          if (v44 >= 0.0)
          {
            if (v44 > 1.0)
            {
              v44 = 1.0;
              v6 = 1.0;
            }
          }
          else
          {
            v44 = 0.0;
            v6 = 0.0;
          }
          v7 = v43;
          if (v43 >= 0.0)
          {
            if (v43 > 1.0)
            {
              v43 = 1.0;
              v7 = 1.0;
            }
          }
          else
          {
            v43 = 0.0;
            v7 = 0.0;
          }
          snprintf(__str, 0xC8uLL, "\\red%d\\green%d\\blue%d", (int)(v5 * 255.0 + 0.5), (int)(v6 * 255.0 + 0.5), (int)(v7 * 255.0 + 0.5));
          objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", __str, strlen(__str));
        }
        if (i + -3 - 5 * (i / 5) == 1)
          v8 = ";\n";
        else
          v8 = ";";
        if (i + -3 - 5 * (i / 5) == 1)
          v9 = 2;
        else
          v9 = 1;
        objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", v8, v9);
      }
      objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "}\n{\\*\\expandedcolortbl;;", 24);
      if (v2 >= 3)
      {
        v41 = (const __CFString *)*MEMORY[0x1E0C9D968];
        v38 = (CFTypeRef)*MEMORY[0x1E0C9D978];
        v39 = (const __CFString *)*MEMORY[0x1E0C9D930];
        cf2 = (const __CFString *)*MEMORY[0x1E0C9D908];
        v37 = (CFTypeRef)*MEMORY[0x1E0C9DA10];
        v36 = (CFTypeRef)*MEMORY[0x1E0C9D960];
        v10 = 2;
        v35 = (CFTypeRef)*MEMORY[0x1E0C9D988];
        v33 = (CFTypeRef)*MEMORY[0x1E0C9D958];
        v34 = (CFTypeRef)*MEMORY[0x1E0C9DA00];
        while (1)
        {
          v11 = (void *)objc_msgSend(*(id *)(v1 + 64), "objectAtIndexedSubscript:", v10);
          if (v11)
            break;
LABEL_94:
          if (v10 % 5 == 4)
            v31 = ";\n";
          else
            v31 = ";";
          if (v10 % 5 == 4)
            v32 = 2;
          else
            v32 = 1;
          objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", v31, v32);
          if (++v10 == v2)
            return objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "}\n", 2);
        }
        v12 = v11;
        v13 = (CGColor *)objc_msgSend(v11, "CGColor");
        if (!v13 || (v14 = (uint64_t)v13, (ColorSpace = CGColorGetColorSpace(v13)) == 0))
        {
          v20 = 0;
          goto LABEL_37;
        }
        v16 = ColorSpace;
        cf1 = CGColorSpaceCopyName(ColorSpace);
        Model = CGColorSpaceGetModel(v16);
        if (Model)
        {
          if (Model != kCGColorSpaceModelCMYK)
          {
            v18 = cf1;
            if (Model != kCGColorSpaceModelRGB)
            {
              v19 = 0;
              v20 = 0;
              v14 = 0;
              if (!cf1)
                goto LABEL_70;
              goto LABEL_69;
            }
            if (cf1)
            {
              if (CFEqual(cf1, cf2))
              {
                v19 = 0;
                v20 = 5;
LABEL_64:
                if (CGColorGetComponents((CGColorRef)v14)
                  && (NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)v14), NumberOfComponents - 1 <= 4))
                {
                  v14 = NumberOfComponents;
                  __memcpy_chk();
                }
                else
                {
                  v14 = 0;
                }
                v18 = cf1;
                if (cf1)
                  goto LABEL_69;
LABEL_70:
                if (v19)
                  CFRelease(v19);
                if (v14)
                {
LABEL_73:
                  if (v20)
                    v22 = v14 == 0;
                  else
                    v22 = 1;
                  if (!v22)
                  {
                    v23 = 0;
                    v24 = &__str[snprintf(__str, 0xC8uLL, "\\cs%s", *((const char **)&rtfColorSpaceKeyword + v20))];
                    do
                    {
                      v25 = *(double *)&v45[v23];
                      if (v14 - 1 > v23 || v25 < 1.0)
                        v24 += snprintf(v24, (char *)&v50 - v24, "\\c%ld", llround(v25 * 100000.0));
                      ++v23;
                    }
                    while (v14 != v23);
                    objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", __str, strlen(__str));
                  }
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                  {
                    v26 = (void *)objc_msgSend(v12, "_systemColorName");
                    if (v26)
                    {
                      v27 = (const char *)objc_msgSend(v26, "UTF8String");
                      if (v27)
                      {
                        v28 = *(unsigned __int8 *)v27;
                        if (*v27)
                        {
                          v29 = (unsigned __int8 *)(v27 + 1);
                          while ((v28 & 0xDFu) - 65 < 0x1A || v28 == 95 || (v28 - 58) >= 0xFFFFFFF6)
                          {
                            v30 = *v29++;
                            v28 = v30;
                            if (!v30)
                              goto LABEL_92;
                          }
                        }
                        else
                        {
LABEL_92:
                          if (snprintf(__str, 0x64uLL, "\\cname %s", v27) <= 0x63)
                            objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", __str, strlen(__str));
                        }
                      }
                    }
                  }
                  goto LABEL_94;
                }
LABEL_37:
                if (objc_msgSend(v12, "getRed:green:blue:alpha:", v45, &v46, &v47, &v48))
                {
                  v20 = 1;
                  v14 = 4;
                }
                else
                {
                  v14 = 0;
                }
                goto LABEL_73;
              }
              if (CFEqual(cf1, v37) || CFEqual(cf1, v36))
              {
                v19 = 0;
                v20 = 1;
                goto LABEL_64;
              }
              if (CFEqual(cf1, v35))
              {
                v19 = 0;
                v20 = 2;
                goto LABEL_64;
              }
              if (CFEqual(cf1, v34) || CFEqual(cf1, v33))
              {
                v19 = 0;
                v20 = 3;
                goto LABEL_64;
              }
            }
            v14 = newCGColorByConvertingToColorSpaceWithName(v14, cf2);
            if (v14)
            {
              v20 = 5;
              goto LABEL_63;
            }
LABEL_102:
            v19 = 0;
            v20 = 0;
            if (!v18)
              goto LABEL_70;
LABEL_69:
            CFRelease(v18);
            goto LABEL_70;
          }
          v18 = cf1;
          if (cf1 && CFEqual(cf1, v41))
          {
            v19 = 0;
            v20 = 6;
            goto LABEL_64;
          }
          v14 = newCGColorByConvertingToColorSpaceWithName(v14, v41);
          if (!v14)
            goto LABEL_102;
          v20 = 6;
        }
        else
        {
          v18 = cf1;
          if (cf1 && (CFEqual(cf1, v38) || CFEqual(cf1, v39)))
          {
            v19 = 0;
            v20 = 4;
            goto LABEL_64;
          }
          v14 = newCGColorByConvertingToColorSpaceWithName(v14, v39);
          if (!v14)
            goto LABEL_102;
          v20 = 4;
        }
LABEL_63:
        v19 = (const void *)v14;
        goto LABEL_64;
      }
      return objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "}\n", 2);
    }
  }
  return result;
}

- (uint64_t)writeHighlightStyleTable
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 208), "count");
    if (result)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v2 = *(void **)(v1 + 208);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (result)
      {
        v3 = result;
        v4 = 0;
        v5 = *(_QWORD *)v10;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v10 != v5)
              objc_enumerationMutation(v2);
            v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
            if (objc_msgSend(v7, "length")
              && -[NSArray indexOfObject:](+[NSRTFReader defaultTextHighlightStyles](NSRTFReader, "defaultTextHighlightStyles"), "indexOfObject:", v7) == 0x7FFFFFFFFFFFFFFFLL)
            {
              if ((v4 & 1) == 0)
                objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "{\\*\\AppleHighlightTable;", 24);
              v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@;"), v7);
              writeCharacters(*(_QWORD *)(v1 + 8), v8, 0, -[__CFString length](v8, "length"), 0x600u);

              v4 = 1;
            }
            ++v6;
          }
          while (v3 != v6);
          result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          v3 = result;
        }
        while (result);
        if ((v4 & 1) != 0)
          return objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "}\n", 2);
      }
    }
  }
  return result;
}

- (uint64_t)writeHighlightColorSchemeTable
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 216), "count");
    if (result)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v2 = *(void **)(v1 + 216);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (result)
      {
        v3 = result;
        v4 = 0;
        v5 = *(_QWORD *)v10;
        do
        {
          v6 = 0;
          do
          {
            if (*(_QWORD *)v10 != v5)
              objc_enumerationMutation(v2);
            v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
            if (objc_msgSend(v7, "length")
              && -[NSArray indexOfObject:](+[NSRTFReader defaultTextHighlightColorSchemes](NSRTFReader, "defaultTextHighlightColorSchemes"), "indexOfObject:", v7) == 0x7FFFFFFFFFFFFFFFLL)
            {
              if ((v4 & 1) == 0)
                objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "{\\*\\AppleHilightClrSchTbl;", 26);
              v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@;"), v7);
              writeCharacters(*(_QWORD *)(v1 + 8), v8, 0, -[__CFString length](v8, "length"), 0x600u);

              v4 = 1;
            }
            ++v6;
          }
          while (v3 != v6);
          result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          v3 = result;
        }
        while (result);
        if ((v4 & 1) != 0)
          return objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "}\n", 2);
      }
    }
  }
  return result;
}

- (uint64_t)writeListTable
{
  id *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  __CFString *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  int v37;
  uint64_t v38;
  unint64_t v39;
  char __str[300];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (id *)result;
    result = objc_msgSend(*(id *)(result + 72), "count");
    if (result)
    {
      v2 = result;
      objc_msgSend(v1[1], "appendBytes:length:", "{\\*\\listtable", 13);
      v3 = 0;
      v4 = 1;
      v35 = v2;
      do
      {
        v5 = objc_msgSend((id)objc_msgSend(v1[9], "objectAtIndex:", v3), "rangeValue");
        v7 = v6;
        v39 = v5;
        v8 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v36 = v3 + 1;
        snprintf(__str, 0x12CuLL, "{\\list\\listtemplateid%lu\\listhybrid", v3 + 1);
        objc_msgSend(v1[1], "appendBytes:length:", __str, strlen(__str));
        v9 = v5 + v7;
        if (v5 < v5 + v7)
        {
          do
          {
            v10 = (void *)objc_msgSend((id)objc_msgSend(v1[2], "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle")), "textLists");
            v11 = objc_msgSend(v10, "count");
            if (v11 > objc_msgSend(v8, "count"))
              v8 = v10;
          }
          while (v39 < v9);
        }
        v38 = objc_msgSend(v8, "count");
        if (v38)
        {
          v12 = 0;
          v13 = 1;
          v37 = v4;
          do
          {
            v14 = (void *)objc_msgSend(v8, "objectAtIndex:", v12);
            v15 = (__CFString *)objc_msgSend(v14, "markerFormat");
            v16 = objc_msgSend(v14, "listOptions");
            v17 = objc_msgSend(v14, "startingItemNumber");
            v18 = -[__CFString length](v15, "length");
            -[__CFString rangeOfString:](v15, "rangeOfString:", CFSTR("{decimal}"));
            if (v19)
            {
              v20 = 0;
            }
            else
            {
              -[__CFString rangeOfString:](v15, "rangeOfString:", CFSTR("{upper-roman}"));
              if (v21)
              {
                v20 = 1;
              }
              else
              {
                -[__CFString rangeOfString:](v15, "rangeOfString:", CFSTR("{lower-roman}"));
                if (v22)
                {
                  v20 = 2;
                }
                else
                {
                  -[__CFString rangeOfString:](v15, "rangeOfString:", CFSTR("{upper-alpha}"));
                  if (v23 || (-[__CFString rangeOfString:](v15, "rangeOfString:", CFSTR("{upper-latin}")), v24))
                  {
                    v20 = 3;
                  }
                  else
                  {
                    -[__CFString rangeOfString:](v15, "rangeOfString:", CFSTR("{lower-alpha}"));
                    if (v31 || (-[__CFString rangeOfString:](v15, "rangeOfString:", CFSTR("{lower-latin}")), v32))
                      v20 = 4;
                    else
                      v20 = 23;
                  }
                }
              }
            }
            snprintf(__str, 0x12CuLL, "{\\listlevel\\levelnfc%lu\\levelnfcn%lu\\leveljc0\\leveljcn0\\levelfollow0\\levelstartat%ld\\levelspace360\\levelindent0", v20, v20, v17);
            objc_msgSend(v1[1], "appendBytes:length:", __str, strlen(__str));
            objc_msgSend(v1[1], "appendBytes:length:", "{\\*\\levelmarker ", 16);
            if (v18)
              writeCharacters((uint64_t)v1[1], v15, 0, v18, 0x600u);
            objc_msgSend(v1[1], "appendBytes:length:", "}", 1);
            if ((v16 & 1) != 0)
              objc_msgSend(v1[1], "appendBytes:length:", "\\levelprepend", 13);
            snprintf(__str, 0x12CuLL, "{\\leveltext\\leveltemplateid%d", v12 + v4 - 100 * (v13 / 0x64));
            objc_msgSend(v1[1], "appendBytes:length:", __str, strlen(__str));
            if (objc_msgSend(v14, "isOrdered"))
            {
              v25 = (__CFString *)objc_msgSend(v14, "_markerPrefix");
              v26 = (__CFString *)objc_msgSend(v14, "_markerSuffix");
              v27 = -[__CFString length](v25, "length");
              v28 = -[__CFString length](v26, "length");
              snprintf(__str, 0x12CuLL, "\\'%02x", v27 + 1 + v28);
              objc_msgSend(v1[1], "appendBytes:length:", __str, strlen(__str));
              if (v27)
                writeCharacters((uint64_t)v1[1], v25, 0, v27, 0x600u);
              snprintf(__str, 0x12CuLL, "\\'%02x", v12);
              objc_msgSend(v1[1], "appendBytes:length:", __str, strlen(__str));
              if (v28)
                writeCharacters((uint64_t)v1[1], v26, 0, v28, 0x600u);
              snprintf(__str, 0x12CuLL, ";}{\\levelnumbers\\'%02x;}", v27 + 1);
              objc_msgSend(v1[1], "appendBytes:length:", __str, strlen(__str));
              v4 = v37;
            }
            else
            {
              v29 = (__CFString *)objc_msgSend(v14, "markerForItemNumber:", 1);
              v30 = -[__CFString length](v29, "length");
              snprintf(__str, 0x12CuLL, "\\'%02x", v30);
              objc_msgSend(v1[1], "appendBytes:length:", __str, strlen(__str));
              if (v30)
                writeCharacters((uint64_t)v1[1], v29, 0, v30, 0x600u);
              objc_msgSend(v1[1], "appendBytes:length:", ";}{\\levelnumbers;}", 18);
            }
            v34 = vcvtmd_s64_f64((double)(unint64_t)++v12 * 36.0 * 20.0 + 0.01);
            snprintf(__str, 0x12CuLL, "\\fi-360\\li%ld\\lin%ld }", v34, v34);
            objc_msgSend(v1[1], "appendBytes:length:", __str, strlen(__str));
            ++v13;
          }
          while (v38 != v12);
        }
        v3 = v36;
        snprintf(__str, 0x12CuLL, "{\\listname ;}\\listid%lu}", v36);
        objc_msgSend(v1[1], "appendBytes:length:", __str, strlen(__str));
        if (v36 < v35)
          objc_msgSend(v1[1], "appendBytes:length:", "\n", 1);
        v4 += 100;
      }
      while (v36 != v35);
      objc_msgSend(v1[1], "appendBytes:length:", "}\n{\\*\\listoverridetable", 23);
      v33 = 0;
      do
      {
        ++v33;
        snprintf(__str, 0x12CuLL, "{\\listoverride\\listid%lu\\listoverridecount0\\ls%lu}", v33, v33);
        objc_msgSend(v1[1], "appendBytes:length:", __str, strlen(__str));
      }
      while (v35 != v33);
      return objc_msgSend(v1[1], "appendBytes:length:", "}\n", 2);
    }
  }
  return result;
}

- (uint64_t)writePaperSize
{
  uint64_t v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  NSSize *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char *v30;
  char __str[200];
  uint64_t v32;
  NSSize v33;

  v32 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(*(id *)(result + 168), "objectForKey:", CFSTR("PaperSize"));
    if (v2)
    {
      objc_msgSend(v2, "sizeValue");
      v4 = v3;
      v6 = v5;
    }
    else
    {
      v6 = 792.0;
      v4 = 612.0;
    }
    v7 = (void *)objc_msgSend(*(id *)(v1 + 168), "objectForKey:", CFSTR("ViewSize"));
    v8 = (NSSize *)MEMORY[0x1E0CB3440];
    if (v7)
    {
      objc_msgSend(v7, "sizeValue");
      v10 = v9;
      v12 = v11;
    }
    else
    {
      v10 = *MEMORY[0x1E0CB3440];
      v12 = *(double *)(MEMORY[0x1E0CB3440] + 8);
    }
    v13 = (void *)objc_msgSend(*(id *)(v1 + 168), "objectForKey:", CFSTR("LeftMargin"));
    v14 = 90.0;
    v15 = 90.0;
    if (v13)
    {
      objc_msgSend(v13, "doubleValue");
      v15 = v16;
    }
    v17 = (void *)objc_msgSend(*(id *)(v1 + 168), "objectForKey:", CFSTR("RightMargin"));
    if (v17)
    {
      objc_msgSend(v17, "doubleValue");
      v14 = v18;
    }
    v19 = (void *)objc_msgSend(*(id *)(v1 + 168), "objectForKey:", CFSTR("BottomMargin"));
    if (v19)
    {
      objc_msgSend(v19, "doubleValue");
      v21 = v20;
    }
    else
    {
      v21 = 72.0;
    }
    v22 = (void *)objc_msgSend(*(id *)(v1 + 168), "objectForKey:", CFSTR("TopMargin"));
    if (v22)
    {
      objc_msgSend(v22, "doubleValue");
      v24 = v23;
    }
    else
    {
      v24 = 72.0;
    }
    v25 = (void *)objc_msgSend(*(id *)(v1 + 168), "objectForKey:", CFSTR("ViewZoom"));
    if (v25)
    {
      objc_msgSend(v25, "doubleValue");
      v27 = (uint64_t)v26;
    }
    else
    {
      v27 = -1;
    }
    v28 = (void *)objc_msgSend(*(id *)(v1 + 168), "objectForKey:", CFSTR("ViewMode"));
    if (v28)
      v29 = objc_msgSend(v28, "integerValue");
    else
      v29 = -1;
    __str[0] = 0;
    v30 = __str;
    if (v4 != 612.0 || v6 != 792.0)
    {
      snprintf(__str, 0xC8uLL, "\\paperw%ld\\paperh%ld", vcvtmd_s64_f64(v4 * 20.0 + 0.01), vcvtmd_s64_f64(v6 * 20.0 + 0.01));
      v30 = &__str[strlen(__str)];
    }
    if (v15 != 90.0)
    {
      snprintf(v30, __str - v30 + 200, "\\margl%ld", vcvtmd_s64_f64(v15 * 20.0 + 0.01));
      v30 += strlen(v30);
    }
    if (v14 != 90.0)
    {
      snprintf(v30, __str - v30 + 200, "\\margr%ld", vcvtmd_s64_f64(v14 * 20.0 + 0.01));
      v30 += strlen(v30);
    }
    if (v21 != 72.0)
    {
      snprintf(v30, __str - v30 + 200, "\\margb%ld", vcvtmd_s64_f64(v21 * 20.0 + 0.01));
      v30 += strlen(v30);
    }
    if (v24 != 72.0)
    {
      snprintf(v30, __str - v30 + 200, "\\margt%ld", vcvtmd_s64_f64(v24 * 20.0 + 0.01));
      v30 += strlen(v30);
    }
    v33.width = v10;
    v33.height = v12;
    result = NSEqualSizes(v33, *v8);
    if ((result & 1) == 0)
    {
      snprintf(v30, __str - v30 + 200, "\\vieww%ld\\viewh%ld", vcvtmd_s64_f64(v10 * 20.0 + 0.01), vcvtmd_s64_f64(v12 * 20.0 + 0.01));
      result = strlen(v30);
      v30 += result;
    }
    if ((v29 & 0x8000000000000000) == 0)
    {
      snprintf(v30, __str - v30 + 200, "\\viewkind%ld", v29);
      result = strlen(v30);
      v30 += result;
    }
    if (v27 >= 1)
      result = snprintf(v30, __str - v30 + 200, "\\viewscale%ld", v27);
    if (__str[0])
    {
      objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", __str, strlen(__str));
      return objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", "\n", 1);
    }
  }
  return result;
}

- (id)writeHyphenation
{
  id *v1;
  double v2;
  char __str[200];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = (id *)objc_msgSend(result[21], "objectForKey:", CFSTR("HyphenationFactor"));
    if (result)
    {
      result = (id *)objc_msgSend(result, "doubleValue");
      if (v2 > 0.0)
      {
        __str[0] = 0;
        snprintf(__str, 0xC8uLL, "\\hyphauto1\\hyphfactor%ld\n", (uint64_t)(v2 * 100.0 + 0.5));
        return (id *)objc_msgSend(v1[1], "appendBytes:length:", __str, strlen(__str));
      }
    }
  }
  return result;
}

- (id)writeDefaultTabInterval
{
  id *v1;
  void *v2;
  double v3;
  char __str[200];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(result[21], "objectForKey:", CFSTR("DefaultTabInterval"));
    if (v2)
    {
      result = (id *)objc_msgSend(v2, "doubleValue");
      goto LABEL_4;
    }
    result = (id *)objc_msgSend(v1[2], "length");
    if (result)
    {
      result = (id *)objc_msgSend(v1[2], "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), 0, 0);
      if (result)
      {
        result = (id *)objc_msgSend(result, "defaultTabInterval");
LABEL_4:
        if (v3 > 0.0)
        {
          __str[0] = 0;
          snprintf(__str, 0xC8uLL, "\\deftab%ld\n", vcvtmd_s64_f64(v3 * 20.0 + 0.01));
          return (id *)objc_msgSend(v1[1], "appendBytes:length:", __str, strlen(__str));
        }
      }
    }
  }
  return result;
}

- (id)writeBackgroundColor
{
  id *v1;
  unsigned int v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  char __str[500];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = (id *)objc_msgSend(result[21], "objectForKey:", CFSTR("BackgroundColor"));
    if (result)
    {
      result = (id *)RGBColorForColor(result);
      if (result)
      {
        v5 = 0.0;
        v6 = 0.0;
        v3 = 0;
        v4 = 0.0;
        __str[0] = 0;
        result = (id *)objc_msgSend(result, "getRed:green:blue:alpha:", &v6, &v5, &v4, &v3);
        v2 = (vcvtmd_s64_f64(v5 * 255.0 + 0.5) << 8) | (vcvtmd_s64_f64(v4 * 255.0 + 0.5) << 16) | vcvtmd_s64_f64(v6 * 255.0 + 0.5);
        if (v2 != 0xFFFFFF)
        {
          snprintf(__str, 0x1F4uLL, "{\\*\\background {\\shp{\\*\\shpinst\\shpleft0\\shptop0\\shpright0\\shpbottom0\\shpfhdr0\\shpbxmargin\\shpbymargin\\shpwr0\\shpwrk0\\shpfblwtxt1\\shpz0\\shplid1025{\\sp{\\sn shapeType}{\\sv 1}}{\\sp{\\sn fFlipH}{\\sv 0}}{\\sp{\\sn fFlipV}{\\sv 0}}{\\sp{\\sn fillColor}{\\sv %d}}{\\sp{\\sn fFilled}{\\sv 1}}{\\sp{\\sn lineWidth}{\\sv 0}}{\\sp{\\sn fLine}{\\sv 0}}{\\sp{\\sn bWMode}{\\sv 9}}{\\sp{\\sn fBackground}{\\sv 1}}}}}\n", v2);
          return (id *)objc_msgSend(v1[1], "appendBytes:length:", __str, strlen(__str));
        }
      }
    }
  }
  return result;
}

- (uint64_t)_setTextScalingConversionTarget:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 200) = a2;
  return result;
}

- (uint64_t)_setTextScalingConversionSource:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 192) = a2;
  return result;
}

+ (double)cocoaVersion
{
  objc_opt_self();
  if (cocoaVersion_onceToken != -1)
    dispatch_once(&cocoaVersion_onceToken, &__block_literal_global_38);
  return *(double *)&cocoaVersion_cocoaVersion;
}

double __27__NSRTFWriter_cocoaVersion__block_invoke()
{
  void *v0;
  double result;

  v0 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "valueForKey:", CFSTR("_NSRTFWriterCocoaVersion"));
  if (v0)
  {
    objc_msgSend(v0, "doubleValue");
    cocoaVersion_cocoaVersion = *(_QWORD *)&result;
  }
  else
  {
    result = *(double *)&cocoaVersion_cocoaVersion;
  }
  if (result < 1.0)
  {
    result = _NSGetUIFoundationVersionNumber() + 1851.0;
    cocoaVersion_cocoaVersion = *(_QWORD *)&result;
  }
  return result;
}

- (uint64_t)_writeVersionsAndEncodings
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  double v6;
  CFStringEncoding SystemEncoding;
  CFStringEncoding v8;
  const char *v9;
  UInt32 v10;
  char __str[200];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(*(id *)(result + 168), "objectForKey:", CFSTR("ReadOnly"));
    if (v2)
      v3 = objc_msgSend(v2, "integerValue");
    else
      v3 = 0;
    v4 = (void *)objc_msgSend(*(id *)(v1 + 168), "objectForKey:", CFSTR("NoCocoaVersion"));
    if (v4)
      v5 = objc_msgSend(v4, "integerValue") < 1;
    else
      v5 = 1;
    objc_opt_class();
    v6 = +[NSRTFWriter cocoaVersion]();
    SystemEncoding = CFStringGetSystemEncoding();
    if (SystemEncoding <= 0xFE && generateOpenStepCompatible)
    {
      v8 = SystemEncoding;
      SystemEncoding = 1280;
      switch(v8)
      {
        case 0u:
          break;
        case 1u:
          SystemEncoding = 1056;
          if (!v5)
            goto LABEL_30;
          goto LABEL_25;
        case 2u:
          SystemEncoding = 1059;
          if (!v5)
            goto LABEL_30;
          goto LABEL_25;
        case 3u:
          SystemEncoding = 1058;
          if (!v5)
            goto LABEL_30;
          goto LABEL_25;
        case 4u:
          SystemEncoding = 1286;
          if (!v5)
            goto LABEL_30;
          goto LABEL_25;
        case 5u:
          SystemEncoding = 1285;
          if (!v5)
            goto LABEL_30;
          goto LABEL_25;
        case 6u:
          SystemEncoding = 1283;
          if (!v5)
            goto LABEL_30;
          goto LABEL_25;
        case 7u:
          SystemEncoding = 1282;
          break;
        default:
          SystemEncoding = 0;
          if (!v5)
            goto LABEL_30;
          goto LABEL_25;
      }
    }
    if (v5)
    {
LABEL_25:
      CFStringConvertEncodingToWindowsCodepage(SystemEncoding);
      if (floor((v6 - floor(v6)) * 1000.0 + 0.5) >= 1.0)
        snprintf(__str, 0xC8uLL, "\\rtf1\\%s\\ansicpg%ld\\cocoartf%ld\\cocoasubrtf%ld\n");
      else
        snprintf(__str, 0xC8uLL, "\\rtf1\\%s\\ansicpg%ld\\cocoartf%ld\n");
      *(_DWORD *)(v1 + 152) |= 0x40u;
    }
    else
    {
LABEL_30:
      if (SystemEncoding >= 0xFF)
        v9 = "ansi";
      else
        v9 = "mac";
      v10 = CFStringConvertEncodingToWindowsCodepage(SystemEncoding);
      snprintf(__str, 0xC8uLL, "\\rtf1\\%s\\ansicpg%ld\n", v9, v10);
    }
    result = objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", __str, strlen(__str));
    if (v3)
    {
      snprintf(__str, 0xC8uLL, "\\readonlydoc%ld", v3);
      return objc_msgSend(*(id *)(v1 + 8), "appendBytes:length:", __str, strlen(__str));
    }
  }
  return result;
}

- (id)_writeTextScalingAndRenderingHint
{
  id *v1;
  double v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v7;
  uint64_t v8;
  char __str[100];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = (id *)objc_msgSend(result[21], "objectForKey:", 0x1E26138B0);
    if (((_BYTE)v1[19] & 0x40) != 0 || result && (result = (id *)objc_msgSend(result, "doubleValue"), v2 >= 2466.0))
    {
      v3 = _NSTextScalingTypeForCurrentEnvironment();
      v4 = (void *)objc_msgSend(v1[21], "objectForKey:", CFSTR("TextScaling"));
      if (v4)
      {
        v5 = objc_msgSend(v4, "integerValue");
        if (v5 < 2 && v3 != v5)
          v3 = v5;
      }
      v7 = (unint64_t)v1[25];
      if (v7 <= 1)
      {
        *((_DWORD *)v1 + 38) |= 0x20u;
        v3 = v7;
      }
      v8 = _NSTextScalingTypeForCurrentEnvironment();
      snprintf(__str, 0x64uLL, "\\cocoatextscaling%ld\\cocoaplatform%ld", v3, v8);
      return (id *)objc_msgSend(v1[1], "appendBytes:length:", __str, strlen(__str));
    }
  }
  return result;
}

- (uint64_t)writeStringDocumentAttribute:(const char *)a3 withRTFKeyword:
{
  uint64_t v4;
  __CFString *v5;
  char __str[100];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    result = objc_msgSend(*(id *)(result + 168), "objectForKey:", a2);
    if (result)
    {
      v5 = (__CFString *)result;
      snprintf(__str, 0x64uLL, "\n{%s ", a3);
      objc_msgSend(*(id *)(v4 + 8), "appendBytes:length:", __str, strlen(__str));
      writeCharacters(*(_QWORD *)(v4 + 8), v5, 0, -[__CFString length](v5, "length"), *(_DWORD *)(v4 + 148));
      return objc_msgSend(*(id *)(v4 + 8), "appendBytes:length:", "}", 1);
    }
  }
  return result;
}

- (uint64_t)writeDateDocumentAttribute:(const char *)a3 withRTFKeyword:
{
  uint64_t v4;
  void *v5;
  char __str[100];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    result = objc_msgSend(*(id *)(result + 168), "objectForKey:", a2);
    if (result)
    {
      v5 = (void *)result;
      snprintf(__str, 0x64uLL, "\n{%s", a3);
      objc_msgSend(*(id *)(v4 + 8), "appendBytes:length:", __str, strlen(__str));
      -[NSRTFWriter writeDate:](v4, v5);
      return objc_msgSend(*(id *)(v4 + 8), "appendBytes:length:", "}", 1);
    }
  }
  return result;
}

- (uint64_t)writeDate:(uint64_t)result
{
  uint64_t v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  char __str[300];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    objc_msgSend(a2, "timeIntervalSinceReferenceDate");
    v5 = v4;
    v6 = objc_alloc(MEMORY[0x1E0C99D48]);
    v7 = (void *)objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    v8 = (void *)objc_msgSend(v7, "components:fromDate:", 252, a2);

    snprintf(__str, 0x12CuLL, "\\yr%d\\mo%d\\dy%d\\hr%d\\min%d\\sec%d", objc_msgSend(v8, "year"), objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "hour"), objc_msgSend(v8, "minute"), objc_msgSend(v8, "second"));
    result = objc_msgSend(*(id *)(v3 + 8), "appendBytes:length:", __str, strlen(__str));
    if (v5 < 2147483650.0)
    {
      snprintf(__str, 0x12CuLL, "\\timesinceref%ld", (uint64_t)v5);
      return objc_msgSend(*(id *)(v3 + 8), "appendBytes:length:", __str, strlen(__str));
    }
  }
  return result;
}

- (id)writeKeywordsDocumentAttribute
{
  id *v1;
  id *v2;
  __CFString *v3;

  if (result)
  {
    v1 = result;
    result = (id *)objc_msgSend(result[21], "objectForKey:", CFSTR("NSKeywordsDocumentAttribute"));
    if (result)
    {
      v2 = result;
      result = (id *)objc_msgSend(result, "count");
      if (result)
      {
        v3 = (__CFString *)objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
        objc_msgSend(v1[1], "appendBytes:length:", "\n{\\keywords ", 12);
        writeCharacters((uint64_t)v1[1], v3, 0, -[__CFString length](v3, "length"), *((_DWORD *)v1 + 37));
        return (id *)objc_msgSend(v1[1], "appendBytes:length:", "}", 1);
      }
    }
  }
  return result;
}

- (uint64_t)writeInfo
{
  id *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (result)
  {
    v1 = (id *)result;
    v2 = objc_msgSend(*(id *)(result + 8), "length");
    objc_msgSend(v1[1], "appendBytes:length:", "{\\info", 6);
    v3 = objc_msgSend(v1[1], "length");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, (uint64_t)CFSTR("NSTitleDocumentAttribute"), "\\title");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, (uint64_t)CFSTR("NSSubjectDocumentAttribute"), "\\subject");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, (uint64_t)CFSTR("NSCommentDocumentAttribute"), "\\doccomm");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, (uint64_t)CFSTR("NSAuthorDocumentAttribute"), "\\author");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, (uint64_t)CFSTR("NSEditorDocumentAttribute"), "\\operator");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, (uint64_t)CFSTR("NSManagerDocumentAttribute"), "\\*\\manager");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, (uint64_t)CFSTR("NSCompanyDocumentAttribute"), "\\*\\company");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, (uint64_t)CFSTR("NSCopyrightDocumentAttribute"), "\\*\\copyright");
    -[NSRTFWriter writeStringDocumentAttribute:withRTFKeyword:]((uint64_t)v1, (uint64_t)CFSTR("NSCategoryDocumentAttribute"), "\\*\\category");
    -[NSRTFWriter writeDateDocumentAttribute:withRTFKeyword:]((uint64_t)v1, (uint64_t)CFSTR("NSCreationTimeDocumentAttribute"), "\\creatim");
    -[NSRTFWriter writeDateDocumentAttribute:withRTFKeyword:]((uint64_t)v1, (uint64_t)CFSTR("NSModificationTimeDocumentAttribute"), "\\revtim");
    -[NSRTFWriter writeKeywordsDocumentAttribute](v1);
    v4 = objc_msgSend(v1[1], "length");
    v5 = v1[1];
    if (v4 == v3)
      return objc_msgSend(v5, "setLength:", v2);
    else
      return objc_msgSend(v5, "appendBytes:length:", "}", 1);
  }
  return result;
}

- (const)writeColor:(uint64_t)a3 type:
{
  const char *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  char __str[100];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v4 = result;
  if (a2)
    v5 = (void *)objc_msgSend(*((id *)result + 7), "objectForKey:", a2);
  else
    v5 = 0;
  if (*((_QWORD *)v4 + 11))
  {
    v6 = (void *)objc_msgSend(*((id *)v4 + 7), "objectForKey:");
    if (v5)
      goto LABEL_7;
LABEL_10:
    v8 = 0;
    v7 = 1;
    if (v6)
      goto LABEL_8;
    goto LABEL_11;
  }
  v6 = 0;
  if (!v5)
    goto LABEL_10;
LABEL_7:
  v7 = objc_msgSend(v5, "unsignedIntegerValue");
  v8 = v7;
  if (v6)
  {
LABEL_8:
    v9 = objc_msgSend(v6, "unsignedIntegerValue");
    goto LABEL_12;
  }
LABEL_11:
  v9 = 0;
LABEL_12:
  result = "\\cf%ld ";
  switch(a3)
  {
    case 0:
      goto LABEL_28;
    case 1:
      result = "\\cb%ld ";
      goto LABEL_27;
    case 2:
      if (!v5)
        v8 = v9;
      result = "\\strokec%ld ";
      goto LABEL_28;
    case 3:
      if (!v5)
        v8 = v9;
      result = "\\ulc%ld ";
      goto LABEL_28;
    case 4:
      if (!v5)
        v8 = v9;
      result = "\\strikec%ld ";
      goto LABEL_28;
    case 5:
      result = "\\shadc%ld ";
      goto LABEL_28;
    case 6:
      result = "\\brdrcf%ld ";
      goto LABEL_28;
    case 7:
      result = "\\clcbpat%ld ";
      goto LABEL_27;
    case 8:
      result = "\\trcbpat%ld ";
LABEL_27:
      v8 = v7;
LABEL_28:
      v10 = fmtcheck(result, "%ld");
      snprintf(__str, 0x64uLL, v10, v8);
      result = (const char *)objc_msgSend(*((id *)v4 + 1), "appendBytes:length:", __str, strlen(__str));
      break;
    default:
      return result;
  }
  return result;
}

- (uint64_t)writeTableHeader:(uint64_t)a3 atIndex:(uint64_t)a4 nestingLevel:
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  const char *v44;
  double v45;
  const char *v46;
  double v47;
  const char *v48;
  double v49;
  const char *v50;
  double v51;
  const char *v52;
  double v53;
  const char *v54;
  double v55;
  const char *v56;
  double v57;
  const char *v58;
  double v59;
  const char *v60;
  double v61;
  const char *v62;
  double v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  double v68;
  const char *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  double v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  double v78;
  const char *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  double v83;
  const char *v84;
  double v85;
  const char *v86;
  double v87;
  const char *v88;
  double v89;
  const char *v90;
  unint64_t v91;
  void *v92;
  uint64_t v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  unint64_t v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  double v133;
  const char *v134;
  double v135;
  const char *v136;
  double v137;
  const char *v138;
  double v139;
  const char *v140;
  double v141;
  const char *v142;
  double v143;
  const char *v144;
  double v145;
  const char *v146;
  double v147;
  const char *v148;
  double v149;
  const char *v150;
  double v151;
  const char *v152;
  double v153;
  const char *v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  double v158;
  const char *v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  double v163;
  const char *v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  double v168;
  const char *v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  double v173;
  const char *v174;
  double v175;
  const char *v176;
  double v177;
  const char *v178;
  double v179;
  const char *v180;
  unint64_t i;
  uint64_t v182;
  void *v183;
  unint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  double v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  int v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  int v239;
  double v240;
  double v241;
  double v242;
  uint64_t v243;
  unint64_t v244;
  uint64_t v245;
  uint64_t v246;
  char __str[1000];
  uint64_t v248;

  v248 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v6 = result;
  v245 = 0;
  v246 = 0;
  v243 = 0;
  v244 = 0;
  v183 = (void *)objc_msgSend(a2, "_rowArrayForBlock:atIndex:text:layoutManager:containerWidth:withRepetitions:collapseBorders:rowCharRange:indexInRow:startingRow:startingColumn:previousRowBlockHelper:", 0, a3, *(_QWORD *)(result + 16), 0, 1, 0, 432.0, &v245, 0, &v243, &v244, 0);
  v7 = objc_msgSend(v183, "count");
  result = objc_msgSend(a2, "numberOfColumns");
  v184 = result;
  if (!result || !v7)
    return result;
  v8 = objc_msgSend(*(id *)(v6 + 16), "_atStartOfTextTable:atIndex:", a2, v245);
  v182 = a4;
  if (v246 + v245)
    v9 = objc_msgSend(*(id *)(v6 + 16), "_atEndOfTextTable:atIndex:", a2, v246 + v245 - 1);
  else
    v9 = 0;
  if (!a2)
    goto LABEL_118;
  v231 = v8;
  v239 = v9;
  v10 = objc_msgSend(a2, "_tableFlags");
  objc_msgSend(a2, "valueForDimension:", 0);
  v12 = v11;
  objc_msgSend(a2, "valueForDimension:", 1);
  v14 = v13;
  objc_msgSend(a2, "valueForDimension:", 2);
  v16 = v15;
  objc_msgSend(a2, "valueForDimension:", 4);
  v18 = v17;
  objc_msgSend(a2, "valueForDimension:", 5);
  v20 = v19;
  objc_msgSend(a2, "valueForDimension:", 6);
  v221 = v21;
  v22 = objc_msgSend(a2, "valueTypeForDimension:", 0);
  v23 = objc_msgSend(a2, "valueTypeForDimension:", 1);
  v24 = objc_msgSend(a2, "valueTypeForDimension:", 2);
  v25 = objc_msgSend(a2, "valueTypeForDimension:", 4);
  v26 = objc_msgSend(a2, "valueTypeForDimension:", 5);
  v195 = objc_msgSend(a2, "valueTypeForDimension:", 6);
  v27 = objc_msgSend(a2, "backgroundColor");
  objc_msgSend(a2, "widthForLayer:edge:", 1, 1);
  v29 = v28;
  objc_msgSend(a2, "widthForLayer:edge:", 1, 2);
  v227 = v30;
  objc_msgSend(a2, "widthForLayer:edge:", 1, 3);
  v225 = v31;
  objc_msgSend(a2, "widthForLayer:edge:", 1, 0);
  v223 = v32;
  v193 = objc_msgSend(a2, "widthValueTypeForLayer:edge:", 1, 1);
  v201 = objc_msgSend(a2, "widthValueTypeForLayer:edge:", 1, 2);
  v199 = objc_msgSend(a2, "widthValueTypeForLayer:edge:", 1, 3);
  v197 = objc_msgSend(a2, "widthValueTypeForLayer:edge:", 1, 0);
  objc_msgSend(a2, "widthForLayer:edge:", 0, 1);
  v203 = v33;
  objc_msgSend(a2, "widthForLayer:edge:", 0, 2);
  v35 = v34;
  objc_msgSend(a2, "widthForLayer:edge:", 0, 3);
  v229 = v36;
  objc_msgSend(a2, "widthForLayer:edge:", 0, 0);
  v38 = v37;
  v185 = objc_msgSend(a2, "widthValueTypeForLayer:edge:", 0, 1);
  v209 = objc_msgSend(a2, "widthValueTypeForLayer:edge:", 0, 2);
  v189 = objc_msgSend(a2, "widthValueTypeForLayer:edge:", 0, 3);
  v205 = objc_msgSend(a2, "widthValueTypeForLayer:edge:", 0, 0);
  v187 = objc_msgSend(a2, "borderColorForEdge:", 1);
  v213 = objc_msgSend(a2, "borderColorForEdge:", 2);
  v191 = objc_msgSend(a2, "borderColorForEdge:", 3);
  v207 = objc_msgSend(a2, "borderColorForEdge:", 0);
  objc_msgSend(a2, "widthForLayer:edge:", -1, 1);
  v233 = v39;
  objc_msgSend(a2, "widthForLayer:edge:", -1, 2);
  v241 = v40;
  objc_msgSend(a2, "widthForLayer:edge:", -1, 3);
  v237 = v41;
  objc_msgSend(a2, "widthForLayer:edge:", -1, 0);
  v235 = v42;
  v211 = objc_msgSend(a2, "widthValueTypeForLayer:edge:", -1, 1);
  v219 = objc_msgSend(a2, "widthValueTypeForLayer:edge:", -1, 2);
  v217 = objc_msgSend(a2, "widthValueTypeForLayer:edge:", -1, 3);
  v215 = objc_msgSend(a2, "widthValueTypeForLayer:edge:", -1, 0);
  snprintf(__str, 0x3E8uLL, "\n\\itap%ld\\trowd \\taflags%ld \\trgaph108\\trleft-108 ", v182 + 1, v10);
  objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  if (v27)
    -[NSRTFWriter writeColor:type:]((const char *)v6, v27, 8);
  if (v12 > 0.0)
  {
    v43 = v12 * 50.0 + 0.01;
    if (v22 == 1)
    {
      v44 = "\\trwWidth%ld\\trftsWidth2 ";
    }
    else
    {
      v43 = v12 * 20.0 + 0.01;
      v44 = "\\trwWidth%ld\\trftsWidth3 ";
    }
    snprintf(__str, 0x3E8uLL, v44, vcvtmd_s64_f64(v43));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  if (v14 > 0.0)
  {
    v45 = v14 * 50.0 + 0.01;
    if (v23 == 1)
    {
      v46 = "\\trminwp%ld ";
    }
    else
    {
      v45 = v14 * 20.0 + 0.01;
      v46 = "\\trminw%ld ";
    }
    snprintf(__str, 0x3E8uLL, v46, vcvtmd_s64_f64(v45));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  if (v16 > 0.0)
  {
    v47 = v16 * 50.0 + 0.01;
    if (v24 == 1)
    {
      v48 = "\\trmaxwp%ld ";
    }
    else
    {
      v47 = v16 * 20.0 + 0.01;
      v48 = "\\trmaxw%ld ";
    }
    snprintf(__str, 0x3E8uLL, v48, vcvtmd_s64_f64(v47));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  if (v18 > 0.0)
  {
    v49 = v18 * 50.0 + 0.01;
    if (v25 == 1)
    {
      v50 = "\\taheightp%ld ";
    }
    else
    {
      v49 = v18 * 20.0 + 0.01;
      v50 = "\\taheight%ld ";
    }
    snprintf(__str, 0x3E8uLL, v50, vcvtmd_s64_f64(v49));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  if (v20 > 0.0)
  {
    v51 = v20 * 50.0 + 0.01;
    if (v26 == 1)
    {
      v52 = "\\taminhp%ld ";
    }
    else
    {
      v51 = v20 * 20.0 + 0.01;
      v52 = "\\taminh%ld ";
    }
    snprintf(__str, 0x3E8uLL, v52, vcvtmd_s64_f64(v51));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  if (v221 > 0.0)
  {
    v53 = v221 * 50.0 + 0.01;
    if (v195 == 1)
    {
      v54 = "\\tamaxhp%ld ";
    }
    else
    {
      v53 = v221 * 20.0 + 0.01;
      v54 = "\\tamaxh%ld ";
    }
    snprintf(__str, 0x3E8uLL, v54, vcvtmd_s64_f64(v53));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  if (v29 > 0.0)
  {
    v55 = v29 * 50.0 + 0.01;
    if (v193 == 1)
    {
      v56 = "\\tamartp%ld ";
    }
    else
    {
      v55 = v29 * 20.0 + 0.01;
      v56 = "\\tamart%ld ";
    }
    snprintf(__str, 0x3E8uLL, v56, vcvtmd_s64_f64(v55));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  if (v223 > 0.0)
  {
    v57 = v223 * 50.0 + 0.01;
    if (v197 == 1)
    {
      v58 = "\\trmarlp%ld ";
    }
    else
    {
      v57 = v223 * 20.0 + 0.01;
      v58 = "\\trmarl%ld ";
    }
    snprintf(__str, 0x3E8uLL, v58, vcvtmd_s64_f64(v57));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  if (v225 > 0.0)
  {
    v59 = v225 * 50.0 + 0.01;
    if (v199 == 1)
    {
      v60 = "\\tamarbp%ld ";
    }
    else
    {
      v59 = v225 * 20.0 + 0.01;
      v60 = "\\tamarb%ld ";
    }
    snprintf(__str, 0x3E8uLL, v60, vcvtmd_s64_f64(v59));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  if (v227 > 0.0)
  {
    v61 = v227 * 50.0 + 0.01;
    if (v201 == 1)
    {
      v62 = "\\trmarrp%ld ";
    }
    else
    {
      v61 = v227 * 20.0 + 0.01;
      v62 = "\\trmarr%ld ";
    }
    snprintf(__str, 0x3E8uLL, v62, vcvtmd_s64_f64(v61));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  if (v231)
  {
    if (v203 <= 0.0)
    {
      v65 = *(void **)(v6 + 8);
      v66 = "\\trbrdrt\\brdrnil ";
      v67 = 17;
    }
    else
    {
      v63 = v203 * 50.0 + 0.01;
      if (v185 == 1)
      {
        v64 = "\\trbrdrt\\brdrs\\brdrw10\\brdrwp%ld";
      }
      else
      {
        v63 = v203 * 20.0 + 0.01;
        v64 = "\\trbrdrt\\brdrs\\brdrw%ld";
      }
      snprintf(__str, 0x3E8uLL, v64, vcvtmd_s64_f64(v63));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
      if (v187)
      {
        -[NSRTFWriter writeColor:type:]((const char *)v6, v187, 6);
        goto LABEL_70;
      }
      v65 = *(void **)(v6 + 8);
      v66 = "\\brdrcfnil ";
      v67 = 11;
    }
    objc_msgSend(v65, "appendBytes:length:", v66, v67);
  }
LABEL_70:
  if (v38 <= 0.0)
  {
    v70 = *(void **)(v6 + 8);
    v71 = "\\trbrdrl\\brdrnil ";
    v72 = 17;
  }
  else
  {
    v68 = v38 * 50.0 + 0.01;
    if (v205 == 1)
    {
      v69 = "\\trbrdrl\\brdrs\\brdrw10\\brdrwp%ld";
    }
    else
    {
      v68 = v38 * 20.0 + 0.01;
      v69 = "\\trbrdrl\\brdrs\\brdrw%ld";
    }
    snprintf(__str, 0x3E8uLL, v69, vcvtmd_s64_f64(v68));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    if (v207)
    {
      -[NSRTFWriter writeColor:type:]((const char *)v6, v207, 6);
      goto LABEL_79;
    }
    v70 = *(void **)(v6 + 8);
    v71 = "\\brdrcfnil ";
    v72 = 11;
  }
  objc_msgSend(v70, "appendBytes:length:", v71, v72);
LABEL_79:
  if (!v239)
    goto LABEL_89;
  if (v229 <= 0.0)
  {
    v75 = *(void **)(v6 + 8);
    v76 = "\\trbrdrt\\brdrnil ";
    v77 = 17;
  }
  else
  {
    v73 = v229 * 50.0 + 0.01;
    if (v189 == 1)
    {
      v74 = "\\trbrdrb\\brdrs\\brdrw10\\brdrwp%ld";
    }
    else
    {
      v73 = v229 * 20.0 + 0.01;
      v74 = "\\trbrdrb\\brdrs\\brdrw%ld";
    }
    snprintf(__str, 0x3E8uLL, v74, vcvtmd_s64_f64(v73));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    if (v191)
    {
      -[NSRTFWriter writeColor:type:]((const char *)v6, v191, 6);
      goto LABEL_89;
    }
    v75 = *(void **)(v6 + 8);
    v76 = "\\brdrcfnil ";
    v77 = 11;
  }
  objc_msgSend(v75, "appendBytes:length:", v76, v77);
LABEL_89:
  if (v35 <= 0.0)
  {
    v80 = *(void **)(v6 + 8);
    v81 = "\\trbrdrr\\brdrnil ";
    v82 = 17;
LABEL_97:
    objc_msgSend(v80, "appendBytes:length:", v81, v82);
    goto LABEL_98;
  }
  v78 = v35 * 50.0 + 0.01;
  if (v209 == 1)
  {
    v79 = "\\trbrdrr\\brdrs\\brdrw10\\brdrwp%ld";
  }
  else
  {
    v78 = v35 * 20.0 + 0.01;
    v79 = "\\trbrdrr\\brdrs\\brdrw%ld";
  }
  snprintf(__str, 0x3E8uLL, v79, vcvtmd_s64_f64(v78));
  objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  if (!v213)
  {
    v80 = *(void **)(v6 + 8);
    v81 = "\\brdrcfnil ";
    v82 = 11;
    goto LABEL_97;
  }
  -[NSRTFWriter writeColor:type:]((const char *)v6, v213, 6);
LABEL_98:
  if (v233 > 0.0)
  {
    v83 = v233 * 50.0 + 0.01;
    if (v211 == 1)
    {
      v84 = "\\tapadtp%ld ";
    }
    else
    {
      v83 = v233 * 20.0 + 0.01;
      v84 = "\\tapadt%ld ";
    }
    snprintf(__str, 0x3E8uLL, v84, vcvtmd_s64_f64(v83));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  if (v235 > 0.0)
  {
    v85 = v235 * 50.0 + 0.01;
    if (v215 == 1)
    {
      v86 = "\\trpadlp%ld ";
    }
    else
    {
      v85 = v235 * 20.0 + 0.01;
      v86 = "\\trpadl%ld ";
    }
    snprintf(__str, 0x3E8uLL, v86, vcvtmd_s64_f64(v85));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  if (v237 > 0.0)
  {
    v87 = v237 * 50.0 + 0.01;
    if (v217 == 1)
    {
      v88 = "\\tapadbp%ld ";
    }
    else
    {
      v87 = v237 * 20.0 + 0.01;
      v88 = "\\tapadb%ld ";
    }
    snprintf(__str, 0x3E8uLL, v88, vcvtmd_s64_f64(v87));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  if (v241 > 0.0)
  {
    v89 = v241 * 50.0 + 0.01;
    if (v219 == 1)
    {
      v90 = "\\trpadrp%ld ";
    }
    else
    {
      v89 = v241 * 20.0 + 0.01;
      v90 = "\\trpadr%ld ";
    }
    snprintf(__str, 0x3E8uLL, v90, vcvtmd_s64_f64(v89));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  }
LABEL_118:
  v91 = 0;
  do
  {
    v92 = *(void **)(objc_msgSend(v183, "objectAtIndex:", v91) + 8);
    v93 = objc_msgSend(v92, "verticalAlignment");
    objc_msgSend(v92, "valueForDimension:", 0);
    v95 = v94;
    objc_msgSend(v92, "valueForDimension:", 1);
    v97 = v96;
    objc_msgSend(v92, "valueForDimension:", 2);
    v99 = v98;
    objc_msgSend(v92, "valueForDimension:", 4);
    v101 = v100;
    objc_msgSend(v92, "valueForDimension:", 5);
    v103 = v102;
    objc_msgSend(v92, "valueForDimension:", 6);
    v222 = v104;
    v105 = objc_msgSend(v92, "valueTypeForDimension:", 0);
    v106 = objc_msgSend(v92, "valueTypeForDimension:", 1);
    v107 = objc_msgSend(v92, "valueTypeForDimension:", 2);
    v108 = objc_msgSend(v92, "valueTypeForDimension:", 4);
    v186 = objc_msgSend(v92, "valueTypeForDimension:", 5);
    v190 = objc_msgSend(v92, "valueTypeForDimension:", 6);
    v109 = objc_msgSend(v92, "backgroundColor");
    objc_msgSend(v92, "widthForLayer:edge:", 1, 1);
    v111 = v110;
    objc_msgSend(v92, "widthForLayer:edge:", 1, 2);
    v228 = v112;
    objc_msgSend(v92, "widthForLayer:edge:", 1, 3);
    v224 = v113;
    objc_msgSend(v92, "widthForLayer:edge:", 1, 0);
    v115 = v114;
    v188 = objc_msgSend(v92, "widthValueTypeForLayer:edge:", 1, 1);
    v200 = objc_msgSend(v92, "widthValueTypeForLayer:edge:", 1, 2);
    v194 = objc_msgSend(v92, "widthValueTypeForLayer:edge:", 1, 3);
    v192 = objc_msgSend(v92, "widthValueTypeForLayer:edge:", 1, 0);
    objc_msgSend(v92, "widthForLayer:edge:", 0, 1);
    v226 = v116;
    objc_msgSend(v92, "widthForLayer:edge:", 0, 2);
    v236 = v117;
    objc_msgSend(v92, "widthForLayer:edge:", 0, 3);
    v232 = v118;
    objc_msgSend(v92, "widthForLayer:edge:", 0, 0);
    v230 = v119;
    v196 = objc_msgSend(v92, "widthValueTypeForLayer:edge:", 0, 1);
    v212 = objc_msgSend(v92, "widthValueTypeForLayer:edge:", 0, 2);
    v206 = objc_msgSend(v92, "widthValueTypeForLayer:edge:", 0, 3);
    v202 = objc_msgSend(v92, "widthValueTypeForLayer:edge:", 0, 0);
    v198 = objc_msgSend(v92, "borderColorForEdge:", 1);
    v216 = objc_msgSend(v92, "borderColorForEdge:", 2);
    v208 = objc_msgSend(v92, "borderColorForEdge:", 3);
    v204 = objc_msgSend(v92, "borderColorForEdge:", 0);
    objc_msgSend(v92, "widthForLayer:edge:", -1, 1);
    v234 = v120;
    objc_msgSend(v92, "widthForLayer:edge:", -1, 2);
    v242 = v121;
    objc_msgSend(v92, "widthForLayer:edge:", -1, 3);
    v240 = v122;
    objc_msgSend(v92, "widthForLayer:edge:", -1, 0);
    v238 = v123;
    v210 = objc_msgSend(v92, "widthValueTypeForLayer:edge:", -1, 1);
    v220 = objc_msgSend(v92, "widthValueTypeForLayer:edge:", -1, 2);
    v218 = objc_msgSend(v92, "widthValueTypeForLayer:edge:", -1, 3);
    v214 = objc_msgSend(v92, "widthValueTypeForLayer:edge:", -1, 0);
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", "\n", 1);
    v124 = objc_msgSend(v92, "startingRow");
    v125 = "\\clvmrg ";
    if (v124 < v243 || (v126 = objc_msgSend(v92, "rowSpan", "\\clvmrg "), v125 = "\\clvmgf ", v126 >= 2))
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", v125, 8);
    v127 = objc_msgSend(v92, "startingColumn", v125);
    v128 = "\\clmrg ";
    if (v127 < v91 || (v129 = objc_msgSend(v92, "columnSpan", "\\clmrg "), v128 = "\\clmgf ", v129 >= 2))
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", v128, 7);
    if (v93 == 1)
    {
      v130 = *(void **)(v6 + 8);
      v131 = "\\clvertalc ";
    }
    else
    {
      if (v93 == 3)
      {
        v130 = *(void **)(v6 + 8);
        v131 = "\\clvertalt\\clvertalbase ";
        v132 = 24;
        goto LABEL_133;
      }
      v130 = *(void **)(v6 + 8);
      if (v93 == 2)
        v131 = "\\clvertalb ";
      else
        v131 = "\\clvertalt ";
    }
    v132 = 11;
LABEL_133:
    objc_msgSend(v130, "appendBytes:length:", v131, v132);
    if (v109)
      -[NSRTFWriter writeColor:type:]((const char *)v6, v109, 7);
    else
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", "\\clshdrawnil ", 13);
    if (v95 > 0.0)
    {
      v133 = v95 * 20.0 + 0.01;
      if (v105 == 1)
      {
        v133 = v95 * 50.0 + 0.01;
        v134 = "\\clwWidth%ld\\clftsWidth2 ";
      }
      else
      {
        v134 = "\\clwWidth%ld\\clftsWidth3 ";
      }
      snprintf(__str, 0x3E8uLL, v134, vcvtmd_s64_f64(v133));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    if (v97 > 0.0)
    {
      v135 = v97 * 20.0 + 0.01;
      if (v106 == 1)
      {
        v135 = v97 * 50.0 + 0.01;
        v136 = "\\clminwp%ld ";
      }
      else
      {
        v136 = "\\clminw%ld ";
      }
      snprintf(__str, 0x3E8uLL, v136, vcvtmd_s64_f64(v135));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    if (v99 > 0.0)
    {
      v137 = v99 * 20.0 + 0.01;
      if (v107 == 1)
      {
        v137 = v99 * 50.0 + 0.01;
        v138 = "\\clmaxwp%ld ";
      }
      else
      {
        v138 = "\\clmaxw%ld ";
      }
      snprintf(__str, 0x3E8uLL, v138, vcvtmd_s64_f64(v137));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    if (v101 > 0.0)
    {
      v139 = v101 * 20.0 + 0.01;
      if (v108 == 1)
      {
        v139 = v101 * 50.0 + 0.01;
        v140 = "\\clheightp%ld ";
      }
      else
      {
        v140 = "\\clheight%ld ";
      }
      snprintf(__str, 0x3E8uLL, v140, vcvtmd_s64_f64(v139));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    if (v103 > 0.0)
    {
      v141 = v103 * 20.0 + 0.01;
      if (v186 == 1)
      {
        v141 = v103 * 50.0 + 0.01;
        v142 = "\\clminhp%ld ";
      }
      else
      {
        v142 = "\\clminh%ld ";
      }
      snprintf(__str, 0x3E8uLL, v142, vcvtmd_s64_f64(v141));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    if (v222 > 0.0)
    {
      v143 = v222 * 20.0 + 0.01;
      if (v190 == 1)
      {
        v143 = v222 * 50.0 + 0.01;
        v144 = "\\clmaxhp%ld ";
      }
      else
      {
        v144 = "\\clmaxh%ld ";
      }
      snprintf(__str, 0x3E8uLL, v144, vcvtmd_s64_f64(v143));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    if (v111 > 0.0)
    {
      v145 = v111 * 20.0 + 0.01;
      if (v188 == 1)
      {
        v145 = v111 * 50.0 + 0.01;
        v146 = "\\clmartp%ld ";
      }
      else
      {
        v146 = "\\clmart%ld ";
      }
      snprintf(__str, 0x3E8uLL, v146, vcvtmd_s64_f64(v145));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    if (v115 > 0.0)
    {
      v147 = v115 * 20.0 + 0.01;
      if (v192 == 1)
      {
        v147 = v115 * 50.0 + 0.01;
        v148 = "\\clmarlp%ld ";
      }
      else
      {
        v148 = "\\clmarl%ld ";
      }
      snprintf(__str, 0x3E8uLL, v148, vcvtmd_s64_f64(v147));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    if (v224 > 0.0)
    {
      v149 = v224 * 20.0 + 0.01;
      if (v194 == 1)
      {
        v149 = v224 * 50.0 + 0.01;
        v150 = "\\clmarbp%ld ";
      }
      else
      {
        v150 = "\\clmarb%ld ";
      }
      snprintf(__str, 0x3E8uLL, v150, vcvtmd_s64_f64(v149));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    if (v228 > 0.0)
    {
      v151 = v228 * 20.0 + 0.01;
      if (v200 == 1)
      {
        v151 = v228 * 50.0 + 0.01;
        v152 = "\\clmarrp%ld ";
      }
      else
      {
        v152 = "\\clmarr%ld ";
      }
      snprintf(__str, 0x3E8uLL, v152, vcvtmd_s64_f64(v151));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    if (v226 <= 0.0)
    {
      v155 = *(void **)(v6 + 8);
      v156 = "\\clbrdrt\\brdrnil ";
      v157 = 17;
    }
    else
    {
      v153 = v226 * 20.0 + 0.01;
      if (v196 == 1)
      {
        v153 = v226 * 50.0 + 0.01;
        v154 = "\\clbrdrt\\brdrs\\brdrw10\\brdrwp%ld";
      }
      else
      {
        v154 = "\\clbrdrt\\brdrs\\brdrw%ld";
      }
      snprintf(__str, 0x3E8uLL, v154, vcvtmd_s64_f64(v153));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
      if (v198)
      {
        -[NSRTFWriter writeColor:type:]((const char *)v6, v198, 6);
        goto LABEL_195;
      }
      v155 = *(void **)(v6 + 8);
      v156 = "\\brdrcfnil ";
      v157 = 11;
    }
    objc_msgSend(v155, "appendBytes:length:", v156, v157);
LABEL_195:
    if (v230 <= 0.0)
    {
      v160 = *(void **)(v6 + 8);
      v161 = "\\clbrdrl\\brdrnil ";
      v162 = 17;
    }
    else
    {
      v158 = v230 * 20.0 + 0.01;
      if (v202 == 1)
      {
        v158 = v230 * 50.0 + 0.01;
        v159 = "\\clbrdrl\\brdrs\\brdrw10\\brdrwp%ld";
      }
      else
      {
        v159 = "\\clbrdrl\\brdrs\\brdrw%ld";
      }
      snprintf(__str, 0x3E8uLL, v159, vcvtmd_s64_f64(v158));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
      if (v204)
      {
        -[NSRTFWriter writeColor:type:]((const char *)v6, v204, 6);
        goto LABEL_204;
      }
      v160 = *(void **)(v6 + 8);
      v161 = "\\brdrcfnil ";
      v162 = 11;
    }
    objc_msgSend(v160, "appendBytes:length:", v161, v162);
LABEL_204:
    if (v232 <= 0.0)
    {
      v165 = *(void **)(v6 + 8);
      v166 = "\\clbrdrb\\brdrnil ";
      v167 = 17;
    }
    else
    {
      v163 = v232 * 20.0 + 0.01;
      if (v206 == 1)
      {
        v163 = v232 * 50.0 + 0.01;
        v164 = "\\clbrdrb\\brdrs\\brdrw10\\brdrwp%ld";
      }
      else
      {
        v164 = "\\clbrdrb\\brdrs\\brdrw%ld";
      }
      snprintf(__str, 0x3E8uLL, v164, vcvtmd_s64_f64(v163));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
      if (v208)
      {
        -[NSRTFWriter writeColor:type:]((const char *)v6, v208, 6);
        goto LABEL_213;
      }
      v165 = *(void **)(v6 + 8);
      v166 = "\\brdrcfnil ";
      v167 = 11;
    }
    objc_msgSend(v165, "appendBytes:length:", v166, v167);
LABEL_213:
    if (v236 <= 0.0)
    {
      v170 = *(void **)(v6 + 8);
      v171 = "\\clbrdrr\\brdrnil ";
      v172 = 17;
    }
    else
    {
      v168 = v236 * 20.0 + 0.01;
      if (v212 == 1)
      {
        v168 = v236 * 50.0 + 0.01;
        v169 = "\\clbrdrr\\brdrs\\brdrw10\\brdrwp%ld";
      }
      else
      {
        v169 = "\\clbrdrr\\brdrs\\brdrw%ld";
      }
      snprintf(__str, 0x3E8uLL, v169, vcvtmd_s64_f64(v168));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
      if (v216)
      {
        -[NSRTFWriter writeColor:type:]((const char *)v6, v216, 6);
        goto LABEL_222;
      }
      v170 = *(void **)(v6 + 8);
      v171 = "\\brdrcfnil ";
      v172 = 11;
    }
    objc_msgSend(v170, "appendBytes:length:", v171, v172);
LABEL_222:
    if (v234 > 0.0)
    {
      v173 = v234 * 20.0 + 0.01;
      if (v210 == 1)
      {
        v173 = v234 * 50.0 + 0.01;
        v174 = "\\clpadtp%ld ";
      }
      else
      {
        v174 = "\\clpadt%ld ";
      }
      snprintf(__str, 0x3E8uLL, v174, vcvtmd_s64_f64(v173));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    if (v238 >= 0.0)
    {
      v175 = v238 * 20.0 + 0.01;
      if (v214 == 1)
      {
        v175 = v238 * 50.0 + 0.01;
        v176 = "\\clpadlp%ld ";
      }
      else
      {
        v176 = "\\clpadl%ld ";
      }
      snprintf(__str, 0x3E8uLL, v176, vcvtmd_s64_f64(v175));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    if (v240 > 0.0)
    {
      v177 = v240 * 20.0 + 0.01;
      if (v218 == 1)
      {
        v177 = v240 * 50.0 + 0.01;
        v178 = "\\clpadbp%ld ";
      }
      else
      {
        v178 = "\\clpadb%ld ";
      }
      snprintf(__str, 0x3E8uLL, v178, vcvtmd_s64_f64(v177));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    if (v242 >= 0.0)
    {
      v179 = v242 * 20.0 + 0.01;
      if (v220 == 1)
      {
        v179 = v242 * 50.0 + 0.01;
        v180 = "\\clpadrp%ld ";
      }
      else
      {
        v180 = "\\clpadr%ld ";
      }
      snprintf(__str, 0x3E8uLL, v180, vcvtmd_s64_f64(v179));
      objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    snprintf(__str, 0x3E8uLL, "\\gaph\\cellx%ld", vcvtmd_s64_f64((double)++v91 * 432.0 / (double)v184 * 20.0 + 0.01));
    objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  while (v184 != v91);
  result = objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", "\n", 1);
  if (v244)
  {
    for (i = 0; i < v244; ++i)
    {
      snprintf(__str, 0x3E8uLL, "\\pard\\intbl\\itap%ld\\cell\n", v182 + 1);
      result = objc_msgSend(*(id *)(v6 + 8), "appendBytes:length:", __str, strlen(__str));
    }
  }
  return result;
}

- (uint64_t)writeCellTerminator:(uint64_t)a3 atIndex:(unint64_t)a4 nestingLevel:
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  int v26;
  char __str[1000];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v8 = (void *)objc_msgSend(a2, "table"),
          v9 = objc_msgSend(a2, "startingColumn"),
          v10 = objc_msgSend(a2, "columnSpan"),
          v8))
    {
      v11 = v10;
      v12 = objc_msgSend(v8, "numberOfColumns");
      v13 = objc_msgSend(*(id *)(v7 + 16), "_atEndOfTextTableRow:atIndex:", v8, a3);
      v14 = objc_msgSend(*(id *)(v7 + 16), "_atEndOfTextTable:atIndex:", v8, a3);
      v15 = v14;
      if (v13)
      {
        v26 = v14;
        if (v12 - v9 > (unint64_t)v11)
          v11 = v12 - v9;
        v16 = 1;
      }
      else
      {
        v17 = a3 + 1;
        if (v17 >= objc_msgSend(*(id *)(v7 + 16), "length"))
        {
          v16 = 1;
          v26 = 1;
        }
        else
        {
          v18 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v7 + 16), "attribute:atIndex:effectiveRange:", CFSTR("NSParagraphStyle"), v17, 0), "textBlocks");
          v26 = v15;
          if (v18
            && (v19 = v18, objc_msgSend(v18, "count") > a4)
            && (v20 = (void *)objc_msgSend(v19, "objectAtIndex:", a4), objc_msgSend(v20, "startingColumn") - v9 > v11))
          {
            v16 = 0;
            v11 = objc_msgSend(v20, "startingColumn") - v9;
          }
          else
          {
            v16 = 0;
          }
        }
      }
      if (v11 >= 1)
      {
        v21 = 0;
        if (a4)
          v22 = "\\nestcell ";
        else
          v22 = "\\cell ";
        if (a4)
          v23 = 10;
        else
          v23 = 6;
        do
        {
          if (v21)
          {
            snprintf(__str, 0x3E8uLL, "\n\\pard\\intbl\\itap%ld", a4 + 1);
            objc_msgSend(*(id *)(v7 + 8), "appendBytes:length:", __str, strlen(__str));
          }
          objc_msgSend(*(id *)(v7 + 8), "appendBytes:length:", v22, v23);
          ++v21;
        }
        while (v11 != v21);
      }
      if (v16)
      {
        if (v26)
          objc_msgSend(*(id *)(v7 + 8), "appendBytes:length:", "\\lastrow", 8);
        if (a4)
          v24 = "\\nestrow";
        else
          v24 = "\\row";
        if (a4)
          v25 = 8;
        else
          v25 = 4;
        objc_msgSend(*(id *)(v7 + 8), "appendBytes:length:", v24, v25);
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)writeParagraphStyle:(uint64_t)result
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  size_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  char *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _BOOL4 v31;
  char *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  NSWritingDirection v39;
  char *v40;
  uint64_t v41;
  const char *v42;
  float v43;
  float v44;
  float v45;
  float v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  void *v51;
  uint64_t v52;
  unsigned __int8 v53;
  uint64_t v54;
  char __s[1000];
  _QWORD v56[2];

  v56[0] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = a2;
    v3 = result;
    if (*(void **)(result + 104) != a2)
    {
      v4 = objc_msgSend((id)objc_msgSend(a2, "textBlocks"), "count");
      strcpy(__s, "\\pard");
      v5 = strlen(__s);
      v6 = &__s[v5];
      if (v4)
      {
        snprintf(&__s[v5], 1000 - v5, "\\intbl\\itap%ld", v4);
        v6 += strlen(v6);
      }
      if (!v2)
        goto LABEL_81;
      v51 = v2;
      v52 = v3;
      v7 = (void *)objc_msgSend(v2, "tabStops");
      v8 = objc_msgSend(v7, "count");
      if (v8)
      {
        v9 = v8;
        for (i = 0; i != v9; ++i)
        {
          v11 = (void *)objc_msgSend(v7, "objectAtIndex:", i);
          v12 = objc_msgSend(v11, "alignment");
          v13 = (void *)objc_msgSend(v11, "options");
          v14 = v13;
          if (v12 || objc_msgSend(v13, "count"))
          {
            if (!objc_msgSend(v14, "count") || (v15 = objc_msgSend(v11, "tabStopType"), v16 = "\\tqdec", v15 != 3))
            {
              v16 = "";
              if (v12 == 1)
                v16 = "\\tqc";
              if (v12 == 2)
                v16 = "\\tqr";
            }
            snprintf(v6, (char *)v56 - v6, "%s", v16);
            v6 += strlen(v6);
          }
          objc_msgSend(v11, "location");
          snprintf(v6, (char *)v56 - v6, "\\tx%ld", vcvtmd_s64_f64(v17 * 20.0 + 0.01));
          v6 += strlen(v6);
          if (v6 - __s >= 801)
          {
            snprintf(v6, 1000 - (v6 - __s), "\n");
            v6 = __s;
            objc_msgSend(*(id *)(v52 + 8), "appendBytes:length:", __s, strlen(__s));
          }
        }
      }
      v2 = v51;
      objc_msgSend(v51, "defaultTabInterval");
      if (v18 > 0.0)
      {
        snprintf(v6, __s - v6 + 1000, "\\pardeftab%ld", vcvtmd_s64_f64(v18 * 20.0 + 0.01));
        v6 += strlen(v6);
      }
      v3 = v52;
      objc_msgSend(v51, "headIndent");
      v20 = v19;
      if (v19 != 0.0)
      {
        snprintf(v6, __s - v6 + 1000, "\\li%ld", vcvtmd_s64_f64(v19 * 20.0 + 0.01));
        v6 += strlen(v6);
      }
      objc_msgSend(v51, "firstLineHeadIndent");
      if (v21 != v20)
      {
        objc_msgSend(v51, "firstLineHeadIndent");
        snprintf(v6, __s - v6 + 1000, "\\fi%ld", vcvtmd_s64_f64((v22 - v20) * 20.0 + 0.01));
        v6 += strlen(v6);
      }
      objc_msgSend(v51, "tailIndent");
      if (v23 <= 0.0)
      {
        if (v23 >= 0.0)
          goto LABEL_31;
        v24 = (char *)(__s - v6 + 1000);
        v25 = -v23;
      }
      else
      {
        v24 = (char *)(__s - v6 + 1000);
        v25 = *(double *)(v52 + 160) - v23;
      }
      snprintf(v6, (size_t)v24, "\\ri%ld", vcvtmd_s64_f64(v25 * 20.0 + 0.01));
      v6 += strlen(v6);
LABEL_31:
      objc_msgSend(v51, "minimumLineHeight");
      v27 = v26;
      objc_msgSend(v51, "maximumLineHeight");
      v29 = v28;
      objc_msgSend(v51, "lineHeightMultiple");
      v31 = v29 == 0.0;
      if (v29 >= 10000000.0)
        v31 = 1;
      if (v30 <= 0.0 || v30 == 1.0)
      {
        if (v31)
        {
          if (v27 > 0.0)
            snprintf(v6, __s - v6 + 1000, "\\sl%ld");
LABEL_48:
          v6 += strlen(v6);
          objc_msgSend(v51, "lineSpacing");
          if (v33 != 0.0)
          {
            snprintf(v6, __s - v6 + 1000, "\\slleading%ld", vcvtmd_s64_f64(v33 * 20.0 + 0.01));
            v6 += strlen(v6);
          }
          objc_msgSend(v51, "paragraphSpacingBefore");
          v35 = v34;
          objc_msgSend(v51, "paragraphSpacing");
          v37 = v36;
          if (v35 > 0.0)
          {
            snprintf(v6, __s - v6 + 1000, "\\sb%ld", vcvtmd_s64_f64(v35 * 20.0 + 0.01));
            v6 += strlen(v6);
          }
          if (v37 > 0.0)
          {
            snprintf(v6, __s - v6 + 1000, "\\sa%ld", vcvtmd_s64_f64(v37 * 20.0 + 0.01));
            v6 += strlen(v6);
          }
          v38 = objc_msgSend(v51, "baseWritingDirection");
          v39 = v38;
          if (v38)
          {
            v40 = (char *)(__s - v6 + 1000);
            if (v38 == 1)
              snprintf(v6, (size_t)v40, "\\rtlpar");
            else
              snprintf(v6, (size_t)v40, "\\pardirnatural");
            v6 += strlen(v6);
          }
          v41 = objc_msgSend(v51, "alignment");
          if ((*(_BYTE *)(v52 + 152) & 0x10) != 0 || v41 != 4)
          {
            if ((unint64_t)(v41 - 1) > 3)
              goto LABEL_68;
            v42 = (&off_1E260C180)[v41 - 1];
          }
          else
          {
            if (v39 == NSWritingDirectionNatural)
              v39 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", 0);
            if (v39 != NSWritingDirectionRightToLeft)
              goto LABEL_68;
            v42 = "\\qr";
          }
          snprintf(v6, __s - v6 + 1000, "%s", v42);
          v6 += strlen(v6);
LABEL_68:
          objc_msgSend(v51, "hyphenationFactor");
          if (v43 > 0.0)
          {
            v44 = v43;
            if (v43 <= 1.0)
            {
              if (!objc_msgSend(v51, "usesDefaultHyphenation")
                || (+[NSParagraphStyle _defaultHyphenationFactor](NSParagraphStyle, "_defaultHyphenationFactor"), v44 != v45))
              {
                snprintf(v6, __s - v6 + 1000, "\\parhyphenfactor%ld", vcvtmd_s64_f64(v44 * 20.0 + 0.01));
                v6 += strlen(v6);
              }
            }
          }
          objc_msgSend(v51, "tighteningFactorForTruncation");
          v47 = vcvtmd_s64_f64(v46 * 20.0 + 0.01);
          if (v47 != 1)
          {
            snprintf(v6, __s - v6 + 1000, "\\partightenfactor%ld", v47);
            v6 += strlen(v6);
          }
          if (objc_msgSend(v51, "spansAllLines"))
          {
            snprintf(v6, __s - v6 + 1000, "\\parspansalllines");
            v6 += strlen(v6);
          }
          v54 = 2;
          v53 = 0;
          v48 = NSTextAlignmentToCTTextAlignment((NSTextAlignment)objc_msgSend(v51, "alignment"));
          _NSCTTextAlignmentToHorizontalAlignment(v48, &v54, (char *)&v53);
          v49 = objc_msgSend(v51, "horizontalAlignment");
          if (v49 != v54)
          {
            snprintf(v6, __s - v6 + 1000, "\\parhorizalign%ld", v49);
            v6 += strlen(v6);
          }
          v50 = objc_msgSend(v51, "isFullyJustified");
          if (v53 != v50)
          {
            snprintf(v6, __s - v6 + 1000, "\\pfullyjustified");
            v6 += strlen(v6);
          }
LABEL_81:
          snprintf(v6, __s - v6 + 1000, "\n");
          objc_msgSend(*(id *)(v3 + 8), "appendBytes:length:", __s, strlen(__s));

          *(_QWORD *)(v3 + 104) = v2;
          result = objc_msgSend(*(id *)(v3 + 88), "isEqual:", -[objc_class blackColor](getNSColorClass_5(), "blackColor"));
          if ((result & 1) == 0)
            *(_DWORD *)(v3 + 152) |= 1u;
          return result;
        }
        v32 = (char *)(__s - v6 + 1000);
        if (v29 != v27)
        {
          snprintf(v6, (size_t)v32, "\\sl%ld\\slmaximum%ld");
          goto LABEL_48;
        }
      }
      else
      {
        v32 = (char *)(__s - v6 + 1000);
        if (v31)
        {
          if (v27 <= 0.0)
            snprintf(v6, (size_t)v32, "\\sl%ld\\slmult1");
          else
            snprintf(v6, (size_t)v32, "\\sl%ld\\slmult1\\slminimum%ld");
          goto LABEL_48;
        }
        if (v29 != v27)
        {
          snprintf(v6, (size_t)v32, "\\sl%ld\\slmult1\\slminimum%ld\\slmaximum%ld");
          goto LABEL_48;
        }
      }
      snprintf(v6, (size_t)v32, "\\sl-%ld");
      goto LABEL_48;
    }
  }
  return result;
}

- (uint64_t)writeFont:(char)a3 forceFontNumber:
{
  UIFont *v3;
  uint64_t v5;
  NSString *v6;
  UIFont *v7;
  __CFString *v8;
  const __CFString *v9;
  char *v10;
  int v11;
  int v12;
  const char *v13;
  const char *v14;
  double v15;
  double v16;
  unint64_t v17;
  void *v18;
  double v19;
  size_t v20;
  const __CFArray *v21;
  const __CFArray *v22;
  CFIndex Count;
  CFIndex v24;
  const void *v25;
  const void *v26;
  const __CFDictionary *ValueAtIndex;
  void *Value;
  void *v29;
  unsigned int v30;
  int v31;
  void *v32;
  const void *v33;
  unsigned int v34;
  CFTypeRef v35;
  CFTypeRef v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  unsigned __int16 v46;
  unsigned int v47;
  int v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  char v53[128];
  char __s[100];
  char __str[100];
  _QWORD v56[2];

  v56[0] = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = a2;
  if (!a2)
    return result;
  v5 = result;
  if (-[UIFont _isHiraginoFont](a2, "_isHiraginoFont"))
  {
    v6 = -[UIFont fontName](v3, "fontName");
    if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("AquaKana")))
    {
      -[UIFont pointSize](v3, "pointSize");
      v7 = +[UIFont systemFontOfSize:](NSFont, "systemFontOfSize:");
LABEL_8:
      v3 = v7;
      goto LABEL_9;
    }
    if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("AquaKana-Bold")))
    {
      -[UIFont pointSize](v3, "pointSize");
      v7 = +[UIFont boldSystemFontOfSize:](NSFont, "boldSystemFontOfSize:");
      goto LABEL_8;
    }
  }
LABEL_9:
  v8 = (__CFString *)-[NSRTFWriter _plainFontNameForFont:](v5, v3);
  v9 = -[NSRTFWriter _plainFontNameForFont:](v5, *(UIFont **)(v5 + 80));
  __str[0] = 0;
  if ((a3 & 1) != 0 || (-[__CFString isEqualToString:](v8, "isEqualToString:", v9) & 1) == 0)
  {
    snprintf(__str, 0x64uLL, "\\f%ld", objc_msgSend((id)objc_msgSend(*(id *)(v5 + 40), "objectForKey:", v8), "unsignedIntegerValue"));
    v10 = &__str[strlen(__str)];
  }
  else
  {
    v10 = __str;
  }
  v11 = -[UIFont traits](v3, "traits");
  v12 = *(_DWORD *)(v5 + 144);
  if ((v11 & 1) != (v12 & 1))
  {
    v13 = "";
    if ((v11 & 1) == 0)
      v13 = "0";
    snprintf(v10, __str - v10 + 100, "\\i%s", v13);
    v10 += strlen(v10);
    v12 = *(_DWORD *)(v5 + 144);
  }
  if ((v11 & 2) != (v12 & 2))
  {
    v14 = "";
    if ((v11 & 2) == 0)
      v14 = "0";
    snprintf(v10, __str - v10 + 100, "\\b%s", v14);
    v10 += strlen(v10);
  }
  *(_DWORD *)(v5 + 144) = v11;
  -[UIFont pointSize](v3, "pointSize");
  v16 = v15;
  if ((*(_BYTE *)(v5 + 152) & 0x20) != 0)
  {
    v17 = *(_QWORD *)(v5 + 200);
    if (v17 <= 1)
      v16 = _NSTextScalingConvertFontPointSize(*(_QWORD *)(v5 + 192), v17, v15);
  }
  v18 = *(void **)(v5 + 80);
  if (!v18 || (a3 & 1) != 0 || (objc_msgSend(v18, "pointSize"), v16 != v19))
  {
    snprintf(v10, (char *)v56 - v10, "\\fs%ld", (uint64_t)(v16 + v16));
    if ((double)(uint64_t)(v16 + v16) * 0.5 != v16)
    {
      v20 = strlen(v10);
      snprintf(&v10[v20], (char *)v56 - &v10[v20], "\\fsmilli%ld", (uint64_t)(v16 * 1000.0 + 0.5));
    }
  }
  if (__str[0])
  {
    objc_msgSend(*(id *)(v5 + 8), "appendBytes:length:", "\n", 1);
    objc_msgSend(*(id *)(v5 + 8), "appendBytes:length:", __str, strlen(__str));
    objc_msgSend(*(id *)(v5 + 8), "appendBytes:length:", " ", 1);
  }
  v21 = CTFontCopyFeatureSettings((CTFontRef)v3);
  if (v21)
  {
    v22 = v21;
    Count = CFArrayGetCount(v21);
    objc_msgSend(*(id *)(v5 + 8), "appendBytes:length:", "\\AppleTypeServices", 18);
    if (Count >= 1)
    {
      v24 = 0;
      v25 = (const void *)*MEMORY[0x1E0CA8328];
      v26 = (const void *)*MEMORY[0x1E0CA8318];
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v22, v24);
        Value = (void *)CFDictionaryGetValue(ValueAtIndex, v25);
        v29 = (void *)CFDictionaryGetValue(ValueAtIndex, v26);
        if (Value && v29)
        {
          snprintf(__s, 0x64uLL, "\\AppleTypeServicesF%ld", (unsigned __int16)objc_msgSend(v29, "integerValue") | (unint64_t)(objc_msgSend(Value, "integerValue") << 16));
          objc_msgSend(*(id *)(v5 + 8), "appendBytes:length:", __s, strlen(__s));
        }
        ++v24;
      }
      while (Count != v24);
    }
    objc_msgSend(*(id *)(v5 + 8), "appendBytes:length:", " ", 1);
    CFRelease(v22);
    v30 = *(_DWORD *)(v5 + 152) | 2;
  }
  else
  {
    v31 = *(_DWORD *)(v5 + 152);
    if ((v31 & 2) != 0)
    {
      objc_msgSend(*(id *)(v5 + 8), "appendBytes:length:", "\\AppleTypeServices ", 19);
      v31 = *(_DWORD *)(v5 + 152);
    }
    v30 = v31 & 0xFFFFFFFD;
  }
  *(_DWORD *)(v5 + 152) = v30;
  v32 = (void *)CTFontCopyAttribute((CTFontRef)v3, (CFStringRef)*MEMORY[0x1E0CA83A8]);
  if (v32)
  {
    v33 = v32;
    snprintf(__s, 0x64uLL, "\\AppleFontPalette%ld ", objc_msgSend(v32, "integerValue"));
    objc_msgSend(*(id *)(v5 + 8), "appendBytes:length:", __s, strlen(__s));
    CFRelease(v33);
    v34 = *(_DWORD *)(v5 + 152) | 4;
  }
  else
  {
    if ((*(_BYTE *)(v5 + 152) & 4) == 0)
      goto LABEL_47;
    objc_msgSend(*(id *)(v5 + 8), "appendBytes:length:", "\\AppleFontPalette0 ", 19);
    v34 = *(_DWORD *)(v5 + 152) & 0xFFFFFFFB;
  }
  *(_DWORD *)(v5 + 152) = v34;
LABEL_47:
  v35 = CTFontCopyAttribute((CTFontRef)v3, (CFStringRef)*MEMORY[0x1E0CA83B0]);
  v36 = (id)CFMakeCollectable(v35);
  if (v36)
  {
    v37 = (void *)v36;
    objc_msgSend(*(id *)(v5 + 8), "appendBytes:length:", "\\AppleFontPaletteColors", 23);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v50 != v40)
            objc_enumerationMutation(v37);
          v42 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          v43 = objc_msgSend(v37, "objectForKeyedSubscript:", v42);
          v44 = -[objc_class colorWithCGColor:](getNSColorClass_5(), "colorWithCGColor:", v43);
          if (v44 && (v45 = (void *)objc_msgSend(*(id *)(v5 + 56), "objectForKey:", v44)) != 0)
            v46 = objc_msgSend(v45, "unsignedIntegerValue");
          else
            v46 = 0;
          snprintf(__s, 0x64uLL, "\\AppleFontPaletteColorsMapping%ld", v46 | (unint64_t)(objc_msgSend(v42, "integerValue") << 16));
          objc_msgSend(*(id *)(v5 + 8), "appendBytes:length:", __s, strlen(__s));
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v39);
    }
    objc_msgSend(*(id *)(v5 + 8), "appendBytes:length:", " ", 1);
    v47 = *(_DWORD *)(v5 + 152) | 8;
  }
  else
  {
    if ((*(_BYTE *)(v5 + 152) & 8) == 0)
      goto LABEL_63;
    objc_msgSend(*(id *)(v5 + 8), "appendBytes:length:", "\\AppleFontPaletteColors ", 24);
    v47 = *(_DWORD *)(v5 + 152) & 0xFFFFFFF7;
  }
  *(_DWORD *)(v5 + 152) = v47;
LABEL_63:
  result = CFStringConvertNSStringEncodingToEncoding(-[UIFont mostCompatibleStringEncoding](v3, "mostCompatibleStringEncoding"));
  if (result <= 0xFE && generateOpenStepCompatible)
  {
    v48 = result;
    result = 1280;
    switch(v48)
    {
      case 0:
        break;
      case 1:
        result = 1056;
        break;
      case 2:
        result = 1059;
        break;
      case 3:
        result = 1058;
        break;
      case 4:
        result = 1286;
        break;
      case 5:
        result = 1285;
        break;
      case 6:
        result = 1283;
        break;
      case 7:
        result = 1282;
        break;
      default:
        result = 0;
        break;
    }
  }
  *(_DWORD *)(v5 + 148) = result;
  return result;
}

- (uint64_t)writeKern:(uint64_t)result
{
  uint64_t v2;
  double v3;
  char __str[104];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (a2)
    {
      objc_msgSend(a2, "doubleValue");
      if (v3 == 0.0)
        strcpy(__str, "\\expnd0\\expndtw0\\kerning0\n");
      else
        snprintf(__str, 0x64uLL, "\\kerning1\\expnd%ld\\expndtw%ld\n", vcvtmd_s64_f64(v3 * 4.0 + 0.01), vcvtmd_s64_f64(v3 * 20.0 + 0.01));
      return objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    else
    {
      return objc_msgSend(*(id *)(result + 8), "appendBytes:length:", "\\kerning1\\expnd0\\expndtw0 ", 26);
    }
  }
  return result;
}

- (uint64_t)writeUnderlineStyle:(uint64_t)result allowStrikethrough:(void *)a2
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  char __str[104];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v2 = result;
  if (!a2)
  {
    v5 = 0;
    v4 = 0;
    goto LABEL_7;
  }
  v3 = objc_msgSend(a2, "unsignedIntegerValue");
  v4 = v3;
  v5 = v3 & 0xF00;
  if ((v3 & 0xF) == 0)
  {
LABEL_7:
    strcpy(__str, "\\ulnone ");
    goto LABEL_17;
  }
  if ((v3 & 0x8F0F) == 0x8001)
  {
    strcpy(&__str[4], " ");
    v6 = 2003596636;
  }
  else
  {
    if ((v3 & 0xF0F) != 9)
    {
      switch((unint64_t)(v5 - 256) >> 8)
      {
        case 0uLL:
          snprintf(__str, 0x64uLL, "\\ul%sd ");
          break;
        case 1uLL:
          snprintf(__str, 0x64uLL, "\\ul%sdash ");
          break;
        case 2uLL:
          snprintf(__str, 0x64uLL, "\\ul%sdashd ");
          break;
        case 3uLL:
          snprintf(__str, 0x64uLL, "\\ul%sdashdd ");
          break;
        default:
          snprintf(__str, 0x64uLL, "\\ul%s ");
          break;
      }
      goto LABEL_17;
    }
    strcpy(&__str[3], "db ");
    v6 = 1684829532;
  }
  *(_DWORD *)__str = v6;
LABEL_17:
  result = objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __str, strlen(__str));
  if ((v4 > 9 || ((1 << v4) & 0x203) == 0) && v4 != 32769 && v4 != (v5 | 1) && v4 != (v5 | 2))
  {
    snprintf(__str, 0x64uLL, "\\ulstyle%ld ", v4);
    return objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  return result;
}

- (uint64_t)writeStrikethroughStyle:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  const char *v5;
  char __s[104];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v2 = result;
  if (a2)
  {
    v3 = objc_msgSend(a2, "unsignedIntegerValue");
    v4 = v3;
    if ((v3 & 0xF) == 9)
    {
      strcpy(&__s[7], "d1 ");
      v5 = "\\striked1 ";
LABEL_11:
      *(_QWORD *)__s = *(_QWORD *)v5;
      goto LABEL_12;
    }
    if ((v3 & 0xF) != 0)
    {
      if ((v3 & 0x8000) != 0)
      {
        strcpy(&__s[8], " ");
        v5 = "\\strikew ";
      }
      else
      {
        __s[8] = 0;
        v5 = "\\strike ";
      }
      goto LABEL_11;
    }
  }
  else
  {
    v4 = 0;
  }
  strcpy(__s, "\\strike0\\striked0 ");
LABEL_12:
  result = objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __s, strlen(__s));
  if ((v4 > 9 || ((1 << v4) & 0x203) == 0) && v4 != 32769)
  {
    snprintf(__s, 0x64uLL, "\\strikestyle%ld ", v4);
    return objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __s, strlen(__s));
  }
  return result;
}

- (uint64_t)writeSuperscript:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  char __str[104];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (a2)
    {
      v3 = objc_msgSend(a2, "integerValue");
      if (v3 == -1)
      {
        strcpy(__str, "\\sub ");
        return objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __str, strlen(__str));
      }
      if (v3 == 1)
      {
        strcpy(__str, "\\super ");
        return objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __str, strlen(__str));
      }
      if (v3)
      {
        if (v3 >= 0)
          v4 = "\\super%ld ";
        else
          v4 = "\\sub%ld ";
        if (v3 >= 0)
          v5 = v3;
        else
          v5 = -v3;
        snprintf(__str, 0x64uLL, v4, v5);
        return objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __str, strlen(__str));
      }
    }
    strcpy(__str, "\\nosupersub ");
    return objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  return result;
}

- (uint64_t)writeHighlightStyle:(uint64_t)result
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  char __str[100];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if (objc_msgSend(a2, "length"))
    {
      v4 = -[NSArray indexOfObject:](+[NSRTFReader defaultTextHighlightStyles](NSRTFReader, "defaultTextHighlightStyles"), "indexOfObject:", a2);
      if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v5 = objc_msgSend(*(id *)(v3 + 208), "indexOfObject:", a2);
        if (v5 == 0x7FFFFFFFFFFFFFFFLL)
          v6 = 0;
        else
          v6 = v5 + 1;
      }
      else
      {
        v6 = ~v4;
      }
    }
    else
    {
      v6 = 0;
    }
    snprintf(__str, 0x64uLL, "\\AppleHighlight%ld ", v6);
    return objc_msgSend(*(id *)(v3 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  return result;
}

- (uint64_t)writeHighlightColorScheme:(uint64_t)result
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  char __str[100];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if (objc_msgSend(a2, "length"))
    {
      v4 = -[NSArray indexOfObject:](+[NSRTFReader defaultTextHighlightColorSchemes](NSRTFReader, "defaultTextHighlightColorSchemes"), "indexOfObject:", a2);
      if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v5 = objc_msgSend(*(id *)(v3 + 216), "indexOfObject:", a2);
        if (v5 == 0x7FFFFFFFFFFFFFFFLL)
          v6 = 0;
        else
          v6 = v5 + 1;
      }
      else
      {
        v6 = ~v4;
      }
    }
    else
    {
      v6 = 0;
    }
    snprintf(__str, 0x64uLL, "\\AppleHilightClrSch%ld ", v6);
    return objc_msgSend(*(id *)(v3 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  return result;
}

- (uint64_t)writeBaselineOffset:(uint64_t)result
{
  uint64_t v2;
  double v3;
  char __str[100];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (a2 && (objc_msgSend(a2, "doubleValue"), (vcvtmd_s64_f64(v3 * 2.0 + 0.01) & 0x8000000000000000) != 0))
      snprintf(__str, 0x64uLL, "\\dn%ld ");
    else
      snprintf(__str, 0x64uLL, "\\up%ld ");
    return objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  return result;
}

- (uint64_t)writeLigature:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  char __str[32];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (a2)
      v3 = objc_msgSend(a2, "integerValue");
    else
      v3 = 1;
    snprintf(__str, 0x20uLL, "\\CocoaLigature%ld ", v3);
    return objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  return result;
}

- (uint64_t)writeCharacterShape:(uint64_t)result
{
  uint64_t v2;
  char __str[32];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    snprintf(__str, 0x20uLL, "\\AppleTypeServices%c%ld ", 85, objc_msgSend(a2, "integerValue"));
    return objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  return result;
}

- (uint64_t)writeStrokeWidth:(uint64_t)result
{
  uint64_t v2;
  double v3;
  const char *v4;
  char __str[32];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (a2)
    {
      objc_msgSend(a2, "doubleValue");
      if (v3 > 0.0)
      {
        v4 = "\\outl\\strokewidth%ld ";
LABEL_7:
        snprintf(__str, 0x20uLL, v4, vcvtmd_s64_f64(v3 * 20.0 + 0.01));
        return objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __str, strlen(__str));
      }
    }
    else
    {
      v3 = 0.0;
    }
    v4 = "\\outl0\\strokewidth%ld ";
    goto LABEL_7;
  }
  return result;
}

- (uint64_t)writeObliqueness:(uint64_t)result
{
  uint64_t v2;
  double v3;
  double v4;
  char __str[32];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (a2)
    {
      objc_msgSend(a2, "doubleValue");
      v4 = v3 * 100.0;
    }
    else
    {
      v4 = 0.0;
    }
    snprintf(__str, 0x20uLL, "\\obliqueness%ld ", vcvtmd_s64_f64(v4 * 20.0 + 0.01));
    return objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  return result;
}

- (uint64_t)writeExpansion:(uint64_t)result
{
  uint64_t v2;
  double v3;
  double v4;
  char __str[32];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (a2)
    {
      objc_msgSend(a2, "doubleValue");
      v4 = v3 * 100.0;
    }
    else
    {
      v4 = 0.0;
    }
    snprintf(__str, 0x20uLL, "\\expansion%ld ", vcvtmd_s64_f64(v4 * 20.0 + 0.01));
    return objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  return result;
}

- (const)writeShadow:(const char *)result
{
  const char *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char __s[200];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v14 = 0.0;
    v15 = 0.0;
    v12 = 0.333333333;
    v13 = 0.0;
    if (!a2
      || (objc_msgSend(a2, "shadowOffset"),
          v5 = v4,
          v7 = v6,
          objc_msgSend(a2, "shadowBlurRadius"),
          v9 = v8,
          (v10 = (void *)objc_msgSend(a2, "shadowColor")) == 0)
      || v5 == 0.0 && v7 == 0.0 && v9 == 0.0)
    {
      strcpy(__s, "\\shad0 ");
      return (const char *)objc_msgSend(*((id *)v3 + 1), "appendBytes:length:", __s, strlen(__s));
    }
    else
    {
      objc_msgSend((id)RGBColorForColor(v10), "getRed:green:blue:alpha:", &v15, &v14, &v13, &v12);
      snprintf(__s, 0xC8uLL, "\\shad\\shadx%ld\\shady%ld\\shadr%ld\\shado%ld ", vcvtmd_s64_f64(v5 * 20.0 + 0.01), vcvtmd_s64_f64(-v7 * 20.0 + 0.01), vcvtmd_s64_f64(v9 * 20.0 + 0.01), (uint64_t)(v12 * 255.0 + 0.5));
      objc_msgSend(*((id *)v3 + 1), "appendBytes:length:", __s, strlen(__s));
      v11 = -[objc_class colorWithCalibratedRed:green:blue:alpha:](getNSColorClass_5(), "colorWithCalibratedRed:green:blue:alpha:", v15, v14, v13, 1.0);
      return -[NSRTFWriter writeColor:type:](v3, v11, 5);
    }
  }
  return result;
}

- (void)restoreAttributes:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CFStringEncoding v15;
  CFStringEncoding v16;
  const __CFArray *v17;
  unsigned int v18;
  const __CFArray *v19;
  CFTypeRef v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  if (a1)
  {
    v4 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSFont"));
    if (!v4)
      v4 = (void *)NSDefaultFont();
    v5 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSColor"));
    v6 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSBackgroundColor"));
    v7 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSKern"));
    v8 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSBaselineOffset"));
    v9 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSSuperScript"));
    v10 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSUnderline"));
    v11 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSTextHighlightStyle"));
    v12 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSTextHighlightColorScheme"));
    v13 = *(void **)(a1 + 80);
    if (v4 != v13)
    {

      v14 = (void *)objc_msgSend(v4, "copyWithZone:", 0);
      *(_QWORD *)(a1 + 80) = v14;
      *(_DWORD *)(a1 + 144) = objc_msgSend(v14, "traits");
      v15 = CFStringConvertNSStringEncodingToEncoding(objc_msgSend(*(id *)(a1 + 80), "mostCompatibleStringEncoding"));
      if (v15 <= 0xFE && generateOpenStepCompatible)
      {
        v16 = v15;
        v15 = 1280;
        switch(v16)
        {
          case 0u:
            break;
          case 1u:
            v15 = 1056;
            break;
          case 2u:
            v15 = 1059;
            break;
          case 3u:
            v15 = 1058;
            break;
          case 4u:
            v15 = 1286;
            break;
          case 5u:
            v15 = 1285;
            break;
          case 6u:
            v15 = 1283;
            break;
          case 7u:
            v15 = 1282;
            break;
          default:
            v15 = 0;
            break;
        }
      }
      *(_DWORD *)(a1 + 148) = v15;
      v17 = CTFontCopyFeatureSettings(*(CTFontRef *)(a1 + 80));
      v18 = *(_DWORD *)(a1 + 152) & 0xFFFFFFFD;
      *(_DWORD *)(a1 + 152) = v18;
      if (v17)
      {
        v19 = v17;
        if (CFArrayGetCount(v17) >= 1)
          *(_DWORD *)(a1 + 152) |= 2u;
        CFRelease(v19);
        v18 = *(_DWORD *)(a1 + 152);
      }
      *(_DWORD *)(a1 + 152) = v18 & 0xFFFFFFFB;
      v20 = CTFontCopyAttribute(*(CTFontRef *)(a1 + 80), (CFStringRef)*MEMORY[0x1E0CA83A8]);
      if (v20)
      {
        *(_DWORD *)(a1 + 152) |= 4u;
        CFRelease(v20);
      }
    }
    v21 = *(void **)(a1 + 88);
    if (v5 != v21)
    {

      *(_QWORD *)(a1 + 88) = objc_msgSend(v5, "copyWithZone:", 0);
    }
    v22 = *(void **)(a1 + 96);
    if (v6 != v22)
    {

      *(_QWORD *)(a1 + 96) = objc_msgSend(v6, "copyWithZone:", 0);
    }
    v23 = *(void **)(a1 + 112);
    if (v7 != v23)
    {

      *(_QWORD *)(a1 + 112) = objc_msgSend(v7, "copyWithZone:", 0);
    }
    v24 = *(void **)(a1 + 120);
    if (v8 != v24)
    {

      *(_QWORD *)(a1 + 120) = objc_msgSend(v8, "copyWithZone:", 0);
    }
    v25 = *(void **)(a1 + 128);
    if (v9 != v25)
    {

      *(_QWORD *)(a1 + 128) = objc_msgSend(v9, "copyWithZone:", 0);
    }
    v26 = *(void **)(a1 + 136);
    if (v10 != v26)
    {

      *(_QWORD *)(a1 + 136) = objc_msgSend(v10, "copyWithZone:", 0);
    }
    v27 = *(void **)(a1 + 224);
    if (v11 != v27)
    {

      v11 = (void *)objc_msgSend(v11, "copy");
      *(_QWORD *)(a1 + 224) = v11;
    }
    if (!v11 || objc_msgSend(v12, "isEqualToString:", CFSTR("NSTextHighlightColorSchemeDefault")))
      v12 = 0;
    v28 = *(void **)(a1 + 232);
    if (v12 != v28)
    {

      *(_QWORD *)(a1 + 232) = objc_msgSend(v12, "copy");
    }
  }
}

- (unint64_t)writeCharacterAttributes:(void *)a3 previousAttributes:
{
  uint64_t v5;
  UIFont *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIFont *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  int v18;
  void *v19;
  char v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __int16 v58;
  __int16 v59[5];

  if (!result)
    return result;
  v5 = result;
  v6 = (UIFont *)objc_msgSend(a2, "objectForKey:", CFSTR("NSFont"));
  if (!v6)
    v6 = (UIFont *)NSDefaultFont();
  v7 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSColor"));
  v39 = objc_msgSend(a2, "objectForKey:", CFSTR("NSBackgroundColor"));
  v43 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSKern"));
  v41 = objc_msgSend(a2, "objectForKey:", CFSTR("NSBaselineOffset"));
  v44 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSSuperScript"));
  v45 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSUnderline"));
  v40 = (void *)objc_msgSend(a2, "objectForKey:", NSCharacterShapeAttributeName);
  v55 = (void *)objc_msgSend(a3, "objectForKey:", NSCharacterShapeAttributeName);
  v8 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSLigature"));
  v51 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSLigature"));
  v37 = objc_msgSend(a2, "objectForKey:", CFSTR("NSUnderlineColor"));
  v34 = objc_msgSend(a3, "objectForKey:", CFSTR("NSUnderlineColor"));
  v57 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSStrikethrough"));
  v56 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSStrikethrough"));
  v46 = objc_msgSend(a2, "objectForKey:", CFSTR("NSStrikethroughColor"));
  v35 = objc_msgSend(a3, "objectForKey:", CFSTR("NSStrikethroughColor"));
  v54 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSStrokeWidth"));
  v48 = objc_msgSend(a3, "objectForKey:", CFSTR("NSStrokeWidth"));
  v38 = objc_msgSend(a2, "objectForKey:", CFSTR("NSStrokeColor"));
  v36 = objc_msgSend(a3, "objectForKey:", CFSTR("NSStrokeColor"));
  v9 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSObliqueness"));
  v50 = objc_msgSend(a3, "objectForKey:", CFSTR("NSObliqueness"));
  v53 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSExpansion"));
  v49 = objc_msgSend(a3, "objectForKey:", CFSTR("NSExpansion"));
  v52 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSShadow"));
  v47 = objc_msgSend(a3, "objectForKey:", CFSTR("NSShadow"));
  v10 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("NSWritingDirection"));
  v11 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("NSWritingDirection"));
  v12 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSTextHighlightStyle"));
  v42 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSTextHighlightColorScheme"));
  if (a3)
  {
    v13 = *(UIFont **)(v5 + 80);
    v14 = (void *)v41;
  }
  else
  {
    v15 = NSDefaultFont();
    v13 = *(UIFont **)(v5 + 80);
    v14 = (void *)v41;
    if ((UIFont *)v15 == v13)
    {
      v17 = 1;
      v16 = (void *)v39;
      goto LABEL_10;
    }
  }
  v16 = (void *)v39;
  if (v6 != v13)
  {
    v17 = 0;
LABEL_10:
    -[NSRTFWriter writeFont:forceFontNumber:](v5, v6, v17);

    *(_QWORD *)(v5 + 80) = -[UIFont copyWithZone:](v6, "copyWithZone:", 0);
  }
  if (v7 != *(void **)(v5 + 88) || (*(_BYTE *)(v5 + 152) & 1) != 0)
  {
    -[NSRTFWriter writeColor:type:]((const char *)v5, (uint64_t)v7, 0);

    v18 = 0;
    *(_QWORD *)(v5 + 88) = objc_msgSend(v7, "copyWithZone:", 0);
    *(_DWORD *)(v5 + 152) &= ~1u;
  }
  else
  {
    v18 = 1;
  }
  if (v16 != *(void **)(v5 + 96))
  {
    -[NSRTFWriter writeColor:type:]((const char *)v5, (uint64_t)v16, 1);

    *(_QWORD *)(v5 + 96) = objc_msgSend(v16, "copyWithZone:", 0);
  }
  if (v43 != *(void **)(v5 + 112))
  {
    -[NSRTFWriter writeKern:](v5, v43);

    *(_QWORD *)(v5 + 112) = objc_msgSend(v43, "copyWithZone:", 0);
  }
  if (v14 != *(void **)(v5 + 120))
  {
    -[NSRTFWriter writeBaselineOffset:](v5, v14);

    *(_QWORD *)(v5 + 120) = objc_msgSend(v14, "copyWithZone:", 0);
  }
  if (v44 != *(void **)(v5 + 128))
  {
    -[NSRTFWriter writeSuperscript:](v5, v44);

    *(_QWORD *)(v5 + 128) = objc_msgSend(v44, "copyWithZone:", 0);
  }
  if (v12 != *(void **)(v5 + 224))
  {
    -[NSRTFWriter writeHighlightStyle:](v5, v12);

    v12 = (void *)objc_msgSend(v12, "copy");
    *(_QWORD *)(v5 + 224) = v12;
  }
  v19 = v42;
  if (!v12 || objc_msgSend(v42, "isEqualToString:", CFSTR("NSTextHighlightColorSchemeDefault")))
    v19 = 0;
  if (v19 != *(void **)(v5 + 232))
  {
    -[NSRTFWriter writeHighlightColorScheme:](v5, v19);

    *(_QWORD *)(v5 + 232) = objc_msgSend(v19, "copy");
  }
  if (v45 != *(void **)(v5 + 136))
  {
    -[NSRTFWriter writeUnderlineStyle:allowStrikethrough:](v5, v45);

    *(_QWORD *)(v5 + 136) = objc_msgSend(v45, "copyWithZone:", 0);
  }
  if (objc_msgSend(v45, "unsignedIntegerValue"))
  {
    v20 = v37 ? 1 : v18;
    if (v37 != v34 || (v20 & 1) == 0)
      -[NSRTFWriter writeColor:type:]((const char *)v5, v37, 3);
  }
  v21 = objc_msgSend(v57, "unsignedIntegerValue");
  if (v21 != objc_msgSend(v56, "unsignedIntegerValue"))
    -[NSRTFWriter writeStrikethroughStyle:](v5, v57);
  if (objc_msgSend(v57, "unsignedIntegerValue"))
  {
    v22 = v46 ? 1 : v18;
    if (v46 != v35
      || !v22
      || (v23 = objc_msgSend(v57, "unsignedIntegerValue"), v23 != objc_msgSend(v56, "unsignedIntegerValue")))
    {
      -[NSRTFWriter writeColor:type:]((const char *)v5, v46, 4);
    }
  }
  if (v8)
    v24 = objc_msgSend(v8, "integerValue");
  else
    v24 = 1;
  if (v51)
    v25 = objc_msgSend(v51, "integerValue");
  else
    v25 = 1;
  if (v24 != v25)
    -[NSRTFWriter writeLigature:](v5, v8);
  v26 = objc_msgSend(v40, "integerValue");
  result = objc_msgSend(v55, "integerValue");
  if (v26 != result)
    result = -[NSRTFWriter writeCharacterShape:](v5, v40);
  if (v54 != (void *)v48)
    result = -[NSRTFWriter writeStrokeWidth:](v5, v54);
  if (v54)
  {
    v27 = v38 ? 1 : v18;
    if (v38 != v36 || (v27 & 1) == 0)
      result = (unint64_t)-[NSRTFWriter writeColor:type:]((const char *)v5, v38, 2);
  }
  if (v9 != (void *)v50)
    result = -[NSRTFWriter writeObliqueness:](v5, v9);
  if (v53 != (void *)v49)
    result = -[NSRTFWriter writeExpansion:](v5, v53);
  if (v52 != (void *)v47)
    result = (unint64_t)-[NSRTFWriter writeShadow:]((const char *)v5, v52);
  if (v10 != v11)
  {
    result = objc_msgSend(v10, "isEqual:", v11);
    if ((result & 1) == 0)
    {
      v28 = objc_msgSend(v10, "count");
      result = objc_msgSend(v11, "count");
      v29 = result;
      v30 = 0;
      if (result >= v28)
        v31 = v28;
      else
        v31 = result;
      if (v31)
      {
        while (1)
        {
          result = objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v30), "isEqual:", objc_msgSend(v11, "objectAtIndex:", v30));
          if (!(_DWORD)result)
            break;
          if (v31 == ++v30)
          {
            v30 = v31;
            break;
          }
        }
      }
      v32 = v29 - v30;
      if (v29 > v30)
      {
        do
        {
          v59[0] = 8236;
          result = writeCharacters(*(_QWORD *)(v5 + 8), (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v59, 1), 0, 1, *(_DWORD *)(v5 + 148));
          --v32;
        }
        while (v32);
      }
      if (v30 < v28)
      {
        do
        {
          v58 = 8234;
          v33 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v30), "unsignedIntegerValue");
          if ((v33 & 1) != 0)
            ++v58;
          if ((v33 & 2) != 0)
            v58 += 3;
          result = writeCharacters(*(_QWORD *)(v5 + 8), (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v58, 1), 0, 1, *(_DWORD *)(v5 + 148));
          ++v30;
        }
        while (v28 != v30);
      }
    }
  }
  return result;
}

- (uint64_t)_attachmentData
{
  uint64_t v1;
  id v2;

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 184);
    if (!result)
    {
      v2 = (id)objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
      *(_QWORD *)(v1 + 184) = v2;
      objc_msgSend((id)objc_msgSend(v2, "keyPointerFunctions"), "setHashFunction:", thoroughDataHash);
      return *(_QWORD *)(v1 + 184);
    }
  }
  return result;
}

- (uint64_t)writeAttachment:(uint64_t)result editableData:(void *)a2 editableTypeIdentifier:
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  void *v21;
  void *v22;
  char __str[1032];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = *(void **)(result + 32);
    v5 = (void *)objc_msgSend(a2, "fileWrapper");
    result = objc_msgSend(v5, "isRegularFile");
    if ((_DWORD)result)
    {
      result = -[NSRTFWriter _attachmentData](v3);
      v6 = (void *)result;
      if (!a2)
        return result;
    }
    else
    {
      v6 = 0;
      if (!a2)
        return result;
    }
    if (v4 && v5)
    {
      if (v6)
      {
        v7 = objc_msgSend(v5, "regularFileContents");
        v8 = (void *)objc_msgSend(v6, "objectForKey:", v7);
        if (!v8)
        {
          v8 = (void *)objc_msgSend(v4, "addFileWrapper:", v5);
          objc_msgSend(v6, "setObject:forKey:", v8, v7);
        }
      }
      else
      {
        v8 = (void *)objc_msgSend(v4, "addFileWrapper:", v5);
      }
      if (objc_msgSend(a2, "attachmentCell"))
      {
        objc_msgSend((id)objc_msgSend(a2, "attachmentCell"), "cellSize");
      }
      else
      {
        v11 = (void *)objc_msgSend(a2, "image");
        if (!v11)
        {
          v12 = *MEMORY[0x1E0CB3440];
          v13 = *(double *)(MEMORY[0x1E0CB3440] + 8);
          goto LABEL_17;
        }
        objc_msgSend(v11, "size");
      }
      v12 = v9;
      v13 = v10;
LABEL_17:
      objc_msgSend(*(id *)(v3 + 8), "appendBytes:length:", "{{\\NeXTGraphic ", 15);
      -[NSRTFWriter writeEscapedUTF8String:](v3, v8);
      snprintf(__str, 0x400uLL, " \\width%ld \\height%ld", vcvtmd_s64_f64(v12 * 20.0 + 0.01), vcvtmd_s64_f64(v13 * 20.0 + 0.01));
      objc_msgSend(*(id *)(v3 + 8), "appendBytes:length:", __str, strlen(__str));
      objc_msgSend(a2, "lineLayoutPadding");
      v15 = vcvtmd_s64_f64(v14 * 20.0 + 0.01);
      v16 = objc_msgSend(a2, "embeddingType");
      v17 = objc_msgSend(a2, "standaloneAlignment") - 1;
      if (v17 > 2)
        v18 = 108;
      else
        v18 = dword_18D6CC6DC[v17];
      v19 = objc_msgSend(a2, "allowsTextAttachmentView");
      v20 = " \\applenoattachmentview";
      if (v19)
        v20 = "";
      snprintf(__str, 0x400uLL, " \\appleattachmentpadding%ld \\appleembedtype%ld \\appleaq%c%s", v15, v16, v18, v20);
      objc_msgSend(*(id *)(v3 + 8), "appendBytes:length:", __str, strlen(__str));
      v21 = (void *)objc_msgSend(a2, "adaptiveImageGlyph");
      if (v21)
      {
        v22 = (void *)objc_msgSend(v21, "contentIdentifier");
        if (objc_msgSend(v22, "length"))
        {
          strcpy(__str, " \\appleemojiimage ");
          objc_msgSend(*(id *)(v3 + 8), "appendBytes:length:", __str, strlen(__str));
          -[NSRTFWriter writeEscapedUTF8String:](v3, v22);
        }
      }
      snprintf(__str, 0x400uLL, "\n}%c}", 172);
      return objc_msgSend(*(id *)(v3 + 8), "appendBytes:length:", __str, strlen(__str));
    }
  }
  return result;
}

- (uint64_t)writeImageGlyph:(uint64_t)a3 attributes:
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  char __str[1032];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  if (!a2)
    return result;
  v4 = result;
  v5 = *(void **)(result + 32);
  if (!v5)
    return result;
  v6 = a3;
  if ((*(_DWORD *)(result + 152) & 0x80) != 0)
    a3 = 0;
  v7 = (void *)objc_msgSend(a2, "_configuredFileWrapperForAttributes:", a3);
  v8 = 0;
  v9 = 0;
  if (!objc_msgSend(v7, "isRegularFile"))
    goto LABEL_11;
  v9 = (void *)-[NSRTFWriter _attachmentData](v4);
  if (!v9)
  {
    v8 = 0;
LABEL_11:
    v10 = (void *)objc_msgSend(v5, "addFileWrapper:", v7);
    objc_msgSend(v9, "setObject:forKey:", v10, v8);
    goto LABEL_12;
  }
  v8 = objc_msgSend(v7, "regularFileContents");
  v10 = (void *)objc_msgSend(v9, "objectForKey:", v8);
  if (!v10)
    goto LABEL_11;
LABEL_12:
  objc_msgSend(*(id *)(v4 + 8), "appendBytes:length:", "{{\\NeXTGraphic ", 15);
  -[NSRTFWriter writeEscapedUTF8String:](v4, v10);
  objc_msgSend(a2, "_imageSizeForAttributes:", v6);
  snprintf(__str, 0x400uLL, " \\width%ld \\height%ld", vcvtmd_s64_f64(v11 * 20.0 + 0.01), vcvtmd_s64_f64(v12 * 20.0 + 0.01));
  objc_msgSend(*(id *)(v4 + 8), "appendBytes:length:", __str, strlen(__str));
  v13 = (void *)objc_msgSend(a2, "contentIdentifier");
  if (objc_msgSend(v13, "length"))
  {
    strcpy(__str, " \\appleemojiimage ");
    objc_msgSend(*(id *)(v4 + 8), "appendBytes:length:", __str, strlen(__str));
    -[NSRTFWriter writeEscapedUTF8String:](v4, v13);
  }
  snprintf(__str, 0x400uLL, "\n}%c}", 172);
  return objc_msgSend(*(id *)(v4 + 8), "appendBytes:length:", __str, strlen(__str));
}

- (uint64_t)writeGlyphInfo:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char __str[200];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(a2, "glyphName");
    if (v4)
    {
      strcpy(__str, "{}{\\*\\glid ");
    }
    else
    {
      if (objc_msgSend(a2, "characterCollection"))
        v5 = objc_msgSend(a2, "characterIdentifier");
      else
        v5 = objc_msgSend(a2, "_glyph");
      snprintf(__str, 0xC8uLL, "{}{\\*\\glid%ld ", v5);
    }
    objc_msgSend(*(id *)(v3 + 8), "appendBytes:length:", __str, strlen(__str));
    -[NSRTFWriter writeEscapedUTF8String:](v3, (void *)objc_msgSend(a2, "_baseString"));
    if (v4)
    {
      objc_msgSend(*(id *)(v3 + 8), "appendBytes:length:", "\\glnam ", 7);
      -[NSRTFWriter writeEscapedUTF8String:](v3, v4);
    }
    else if (objc_msgSend(a2, "characterCollection"))
    {
      snprintf(__str, 0xC8uLL, "\\glcol%ld", objc_msgSend(a2, "characterCollection"));
      objc_msgSend(*(id *)(v3 + 8), "appendBytes:length:", __str, strlen(__str));
    }
    return objc_msgSend(*(id *)(v3 + 8), "appendBytes:length:", "}", 1);
  }
  return result;
}

- (CFDataRef)writeLinkInfo:(CFDataRef)result
{
  CFDataRef v3;
  const __CFData *v4;
  void *v5;
  const UInt8 *BytePtr;
  CFIndex Length;
  CFIndex v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  BOOL v12;
  uint64_t v13;

  if (!result)
    return result;
  v3 = result;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    a2 = (const __CFURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a2);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
  }
  if (!a2)
    return 0;
  result = CFURLCreateData(0, a2, 0x8000100u, 1u);
  if (result)
  {
    v4 = result;
    objc_msgSend(*((id *)v3 + 1), "appendBytes:length:", "{\\field{\\*\\fldinst{HYPERLINK \", 30);
    v5 = (void *)*((_QWORD *)v3 + 1);
    BytePtr = CFDataGetBytePtr(v4);
    Length = CFDataGetLength(v4);
    if (Length >= 1)
    {
      v8 = Length;
      v9 = 0;
      v10 = 0;
      do
      {
        v11 = BytePtr[v9] - 92;
        v12 = v11 > 0x21;
        v13 = (1 << v11) & 0x280000001;
        if (!v12 && v13 != 0)
        {
          if (v10 < v9)
            objc_msgSend(v5, "appendBytes:length:", &BytePtr[v10], v9 - v10);
          objc_msgSend(v5, "appendBytes:length:", "\\", 1);
          v10 = v9;
        }
        ++v9;
      }
      while (v8 != v9);
      if (v8 > v10)
        objc_msgSend(v5, "appendBytes:length:", &BytePtr[v10], v8 - v10);
    }
    objc_msgSend(*((id *)v3 + 1), "appendBytes:length:", "\"}}{\\fldrslt ", 13);
    CFRelease(v4);
    return (CFDataRef)1;
  }
  return result;
}

- (uint64_t)textFlowWithAttributes:(NSUInteger *)a3 range:
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  NSRange v9;
  NSRange v10;
  NSUInteger length;
  NSRange v12;
  uint64_t v13;
  _BOOL8 v14;

  if (!a1)
    return 0;
  v5 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("CTVerticalForms"));
  v6 = *(_QWORD *)(a1 + 176);
  if (v6 && *(_QWORD *)(v6 + 8))
  {
    v7 = 0;
    v8 = (uint64_t *)(v6 + 16);
    do
    {
      v9.length = a3[1];
      v10.location = *(v8 - 2);
      if (v9.length + *a3 < v10.location)
        break;
      v10.length = *(v8 - 1);
      v9.location = *a3;
      v12 = NSIntersectionRange(v10, v9);
      length = v12.length;
      if (v12.length)
      {
        if (v12.location == *a3)
          v7 = *v8;
        else
          length = v12.location - *a3;
        a3[1] = length;
      }
      v13 = v8[2];
      v8 += 3;
    }
    while (v13);
  }
  else
  {
    v7 = 0;
  }
  v14 = v7 == 1;
  if (v5)
  {
    if (objc_msgSend(v5, "integerValue") == 1 && v7 != 1)
      return 4;
  }
  return v14;
}

- (uint64_t)writeTextFlow:(uint64_t)result
{
  uint64_t v2;
  char __str[50];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    snprintf(__str, 0x32uLL, "\\stextflow%ld ", a2);
    return objc_msgSend(*(id *)(v2 + 8), "appendBytes:length:", __str, strlen(__str));
  }
  return result;
}

- (uint64_t)_markerStringAtCharacterIndex:(uint64_t)a1
{
  uint64_t v2;
  void *v4;
  NSTextContentStorage *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v2 = a1;
  if (a1)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3052000000;
    v13 = __Block_byref_object_copy__16;
    v14 = __Block_byref_object_dispose__16;
    v15 = 0;
    v4 = *(void **)(a1 + 240);
    if (!v4)
    {
      v5 = objc_alloc_init(NSTextContentStorage);
      *(_QWORD *)(v2 + 240) = v5;
      -[NSTextContentStorage setAttributedString:](v5, "setAttributedString:", *(_QWORD *)(v2 + 16));
      v4 = *(void **)(v2 + 240);
    }
    v6 = objc_msgSend(v4, "locationFromLocation:withOffset:", objc_msgSend((id)objc_msgSend(v4, "documentRange"), "location"), a2);
    if (v6)
    {
      v7 = *(void **)(v2 + 240);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __45__NSRTFWriter__markerStringAtCharacterIndex___block_invoke;
      v9[3] = &unk_1E2603FB8;
      v9[4] = &v10;
      objc_msgSend(v7, "enumerateTextElementsFromLocation:options:usingBlock:", v6, 0, v9);
    }
    v2 = v11[5];
    _Block_object_dispose(&v10, 8);
  }
  return v2;
}

uint64_t __45__NSRTFWriter__markerStringAtCharacterIndex___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a2, "contentsOnly"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend((id)objc_msgSend(a2, "markerAttributedString"), "string");
  return 0;
}

@end
