@implementation VKCBaseDataDetectorElement

- (VKCBaseDataDetectorElement)init
{
  VKCBaseDataDetectorElement *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKCBaseDataDetectorElement;
  result = -[VKCBaseDataDetectorElement init](&v3, sel_init);
  if (result)
    result->_area = -1.0;
  return result;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  VKMUIStringForDDTypes(-[VKCBaseDataDetectorElement dataDetectorTypes](self, "dataDetectorTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> : %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int64_t)elementType
{
  return 2;
}

- (DDScannerResult)scannerResult
{
  return 0;
}

- (NSArray)boundingQuads
{
  return 0;
}

- (unint64_t)dataDetectorTypes
{
  return 0;
}

- (BOOL)isTextDataDetector
{
  return 0;
}

- (BOOL)isMRCDataDetector
{
  return 0;
}

- (BOOL)isUnitConversionDataDetector
{
  return 0;
}

- (BOOL)isInspectableCellSelectable
{
  return 1;
}

- (BOOL)wantsMacOSHandCursor
{
  return (-[VKCBaseDataDetectorElement dataDetectorTypes](self, "dataDetectorTypes") & 0x140) != 0;
}

- (double)area
{
  double result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = self->_area;
  if (result <= 0.0)
  {
    self->_area = 0.0;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[VKCBaseDataDetectorElement boundingQuads](self, "boundingQuads", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "area");
          self->_area = v9 + self->_area;
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    return self->_area;
  }
  return result;
}

- (double)maxLineHeight
{
  double result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  double maxLineHeight;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  result = self->_maxLineHeight;
  if (result <= 0.0)
  {
    self->_maxLineHeight = 0.0;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[VKCBaseDataDetectorElement boundingQuads](self, "boundingQuads", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "sideLength");
          if (maxLineHeight < v10)
            maxLineHeight = v10;
          if (self->_maxLineHeight >= maxLineHeight)
            maxLineHeight = self->_maxLineHeight;
          self->_maxLineHeight = maxLineHeight;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    return self->_maxLineHeight;
  }
  return result;
}

- (UIMenu)debugMenu
{
  return 0;
}

- (NSUUID)uuid
{
  NSUUID *uuid;
  NSUUID *v4;
  NSUUID *v5;

  uuid = self->_uuid;
  if (!uuid)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_uuid;
    self->_uuid = v4;

    uuid = self->_uuid;
  }
  return uuid;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v5;
  char v6;
  _QWORD v8[6];

  y = a3.y;
  x = a3.x;
  -[VKCBaseDataDetectorElement boundingQuads](self, "boundingQuads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__VKCBaseDataDetectorElement_containsPoint___block_invoke;
  v8[3] = &__block_descriptor_48_e23_B32__0__VKQuad_8Q16_B24l;
  *(CGFloat *)&v8[4] = x;
  *(CGFloat *)&v8[5] = y;
  v6 = objc_msgSend(v5, "vk_containsObjectPassingTest:", v8);

  return v6;
}

uint64_t __44__VKCBaseDataDetectorElement_containsPoint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

+ (unint64_t)dataDetectorTypesForScannerResult:(id)a3
{
  id v3;
  int v4;
  __CFString *v5;
  unint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "category");
  if (v3)
  {
    switch(v4)
    {
      case 0:
      case 1:
      case 5:
      case 6:
        objc_msgSend(v3, "type");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CAB8], v5, 0) == kCFCompareEqualTo)
        {
          v6 = 16;
          break;
        }
        if (CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CBA0], v5, 0) == kCFCompareEqualTo)
        {
          v6 = 8;
          break;
        }
        if (CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CB38], v5, 0) == kCFCompareEqualTo)
        {
          v6 = 32;
          break;
        }
        if (CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CB20], v5, 0) == kCFCompareEqualTo)
          goto LABEL_23;
        if (CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CAE0], v5, 0)
          && CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CBC0], v5, 0))
        {
          if (CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CB18], v5, 0))
          {
            if (CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CAD8], v5, 0))
            {
              if (CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CAB0], v5, 0))
              {
                if (CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CB48], v5, 0))
                  v6 = (unint64_t)(CFStringCompare((CFStringRef)*MEMORY[0x1E0D1CB28], v5, 0) == kCFCompareEqualTo) << 11;
                else
                  v6 = 1024;
              }
              else
              {
                v6 = 512;
              }
            }
            else
            {
LABEL_23:
              v6 = 256;
            }
          }
          else
          {
            v6 = 128;
          }
        }
        else
        {
          v6 = 64;
        }
        break;
      case 2:
        v6 = 1;
        break;
      case 3:
        v6 = 2;
        break;
      case 4:
        v6 = 4;
        break;
      case 7:
        v6 = 0x800000;
        break;
      default:
        goto LABEL_14;
    }
  }
  else
  {
LABEL_14:
    v6 = 0;
  }

  return v6;
}

- (NSString)stringValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[VKCBaseDataDetectorElement scannerResult](self, "scannerResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Type"), &stru_1E94661A8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)VKCBaseDataDetectorElement;
  -[VKCBaseElement stringValue](&v10, sel_stringValue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (id)stringArrayForVKDataDetectorTypes:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if ((a3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C9AA60], "vk_arrayByAddingNonNilObject:", CFSTR("Phone Number"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a3 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v4 = (void *)MEMORY[0x1E0C9AA60];
  if ((a3 & 2) != 0)
  {
LABEL_5:
    objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", CFSTR("Address"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
LABEL_6:
  if ((a3 & 4) != 0)
  {
    objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", CFSTR("Calendar Event"));
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
    if ((a3 & 8) == 0)
    {
LABEL_8:
      if ((a3 & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_21;
    }
  }
  else if ((a3 & 8) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", CFSTR("Tracking Number"));
  v9 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v9;
  if ((a3 & 0x10) == 0)
  {
LABEL_9:
    if ((a3 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", CFSTR("Flight Number"));
  v10 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v10;
  if ((a3 & 0x20) == 0)
  {
LABEL_10:
    if ((a3 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", CFSTR("Lookup Suggestion"));
  v11 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v11;
  if ((a3 & 0x40) == 0)
  {
LABEL_11:
    if ((a3 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", CFSTR("Web URL"));
  v12 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v12;
  if ((a3 & 0x80) == 0)
  {
LABEL_12:
    if ((a3 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", CFSTR("Mail URL"));
  v13 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v13;
  if ((a3 & 0x100) == 0)
  {
LABEL_13:
    if ((a3 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_25:
  objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", CFSTR("Generic URL"));
  v14 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v14;
  if ((a3 & 0x200) != 0)
  {
LABEL_14:
    objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", CFSTR("Email"));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
LABEL_15:
  switch(a3)
  {
    case 0x800000uLL:
      v7 = CFSTR("Proper Name");
      goto LABEL_29;
    case 0uLL:
      v7 = CFSTR("None");
      goto LABEL_29;
    case 0xFFFFFFFFFFFFFFFFLL:
      v7 = CFSTR("All");
LABEL_29:
      objc_msgSend(v4, "vk_arrayByAddingNonNilObject:", v7);
      v15 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v15;
      break;
  }
  return v4;
}

- (NSDictionary)groupedElementData
{
  return self->_groupedElementData;
}

- (void)setGroupedElementData:(id)a3
{
  objc_storeStrong((id *)&self->_groupedElementData, a3);
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_groupedElementData, 0);
}

@end
