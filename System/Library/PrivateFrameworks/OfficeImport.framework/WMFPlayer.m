@implementation WMFPlayer

- (WMFPlayer)initWithGraphicsDevice:(id)a3
{
  id v5;
  WMFPlayer *v6;
  WMFPlayer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WMFPlayer;
  v6 = -[WMFPlayer init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->m_gdi, a3);
    *(_QWORD *)&v7->m_records = 0xFFFFFFFFLL;
  }

  return v7;
}

- (void)done
{
  -[MFGraphicsDevice done](self->m_gdi, "done");
}

+ (CGRect)placeableBounds:(const char *)a3
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  double v8;
  int v9;
  double v10;
  int v11;
  double v12;
  int v13;
  double v14;
  CGRect result;

  v3 = (__int16)(*((unsigned __int8 *)a3 + 7) << 8) | *((unsigned __int8 *)a3 + 6);
  v4 = (__int16)(*((unsigned __int8 *)a3 + 9) << 8) | *((unsigned __int8 *)a3 + 8);
  v5 = (__int16)(*((unsigned __int8 *)a3 + 11) << 8) | *((unsigned __int8 *)a3 + 10);
  v6 = (__int16)(*((unsigned __int8 *)a3 + 13) << 8) | *((unsigned __int8 *)a3 + 12);
  if (v3 >= v5)
    v7 = (__int16)(*((unsigned __int8 *)a3 + 11) << 8) | *((unsigned __int8 *)a3 + 10);
  else
    v7 = (__int16)(*((unsigned __int8 *)a3 + 7) << 8) | *((unsigned __int8 *)a3 + 6);
  v8 = (double)v7;
  if (v4 >= v6)
    v9 = (__int16)(*((unsigned __int8 *)a3 + 13) << 8) | *((unsigned __int8 *)a3 + 12);
  else
    v9 = (__int16)(*((unsigned __int8 *)a3 + 9) << 8) | *((unsigned __int8 *)a3 + 8);
  v10 = (double)v9;
  v11 = v5 - v3;
  if (v11 < 0)
    v11 = -v11;
  v12 = (double)v11;
  v13 = v6 - v4;
  if (v6 - v4 < 0)
    v13 = v4 - v6;
  v14 = (double)v13;
  result.size.height = v14;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v8;
  return result;
}

+ (CGRect)boundsInPoints:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  _DWORD *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _DWORD *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = objc_retainAutorelease(v4);
  v7 = (_DWORD *)objc_msgSend(v6, "bytes");
  if (v5 <= 0x11)
    goto LABEL_2;
  v12 = v7;
  if (*v7 != -1698247209)
    goto LABEL_8;
  if (v5 > 0x27)
  {
    +[WMFPlayer placeableBounds:](WMFPlayer, "placeableBounds:", v7);
    if (v15 != 0.0 && v16 != 0.0)
    {
      LOWORD(v17) = *((_WORD *)v12 + 7);
      v18 = (double)v17;
      v8 = v13 / v18 * 72.0;
      v9 = v14 / v18 * 72.0;
      v10 = v15 / v18 * 72.0;
      v19 = v16 / v18;
LABEL_9:
      v11 = v19 * 72.0;
      goto LABEL_10;
    }
LABEL_8:
    objc_msgSend(a1, "windowBounds:", v6);
    v8 = v20 / 101.599998 * 72.0;
    v9 = v21 / 108.373337 * 72.0;
    v10 = v22 / 101.599998 * 72.0;
    v19 = v23 / 108.373337;
    goto LABEL_9;
  }
LABEL_2:
  v8 = *MEMORY[0x24BDBF090];
  v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
LABEL_10:

  v24 = v8;
  v25 = v9;
  v26 = v10;
  v27 = v11;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

+ (CGRect)windowBounds:(id)a3
{
  id v3;
  int v4;
  id v5;
  _DWORD *v6;
  unsigned int v7;
  unsigned int v8;
  char *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unsigned int v14;
  int v15;
  BOOL v16;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = (_DWORD *)objc_msgSend(v5, "bytes");
  if (*v6 == -1698247209)
    v7 = 40;
  else
    v7 = 18;
  if (v4 - v7 < 6)
  {
    v13 = 0.0;
    v12 = 1024.0;
    v11 = 1280.0;
    v10 = 0.0;
  }
  else
  {
    v8 = (v4 - v7) >> 1;
    v9 = (char *)v6 + v7;
    v10 = 0.0;
    v11 = 1280.0;
    v12 = 1024.0;
    v13 = 0.0;
    do
    {
      v14 = *(_DWORD *)v9;
      v15 = *((unsigned __int16 *)v9 + 2);
      if (*((_WORD *)v9 + 2))
        v16 = v14 >= 3;
      else
        v16 = 0;
      if (!v16 || v8 < v14)
        break;
      if (v15 == 524)
      {
        v12 = (double)*((__int16 *)v9 + 3);
        v11 = (double)*((__int16 *)v9 + 4);
      }
      else if (v15 == 523)
      {
        v10 = (double)*((__int16 *)v9 + 3);
        v13 = (double)*((__int16 *)v9 + 4);
      }
      v9 += 2 * v14;
      v8 -= v14;
    }
    while (v8 > 2);
  }
  v22.origin.x = v13;
  v22.origin.y = v10;
  v22.size.width = v11;
  v22.size.height = v12;
  if (CGRectGetWidth(v22) == 0.0
    || (v23.origin.x = v13, v23.origin.y = v10, v23.size.width = v11, v23.size.height = v12, CGRectGetHeight(v23) == 0.0))
  {
    v13 = 0.0;
    v12 = 1024.0;
    v11 = 1280.0;
    v10 = 0.0;
  }

  v18 = v13;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (int)records
{
  return self->m_records;
}

- (int)play:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v5;
  int result;
  const char *v7;

  v5 = *((unsigned __int16 *)a4 + 2);
  if (v5 > 551)
  {
    if (v5 > 1312)
    {
      if (v5 <= 2073)
      {
        if (v5 > 1564)
        {
          if (v5 > 1790)
          {
            if (v5 == 1791)
              return -[WMFPlayer playCreateRegion:in_pRecord:](self, "playCreateRegion:in_pRecord:", *(_QWORD *)&a3, a4);
            if (v5 == 2071)
              return -[WMFPlayer playArc:in_pRecord:](self, "playArc:in_pRecord:", *(_QWORD *)&a3, a4);
          }
          else
          {
            if (v5 == 1565)
              return -[WMFPlayer playPatBlt:in_pRecord:](self, "playPatBlt:in_pRecord:", *(_QWORD *)&a3, a4);
            if (v5 == 1574)
            {
              v7 = "META_ESCAPE";
              return -[WMFPlayer playUnsupported:in_recordName:in_pRecord:](self, "playUnsupported:in_recordName:in_pRecord:", *(_QWORD *)&a3, v7, a4);
            }
          }
        }
        else if (v5 > 1351)
        {
          if (v5 == 1352)
          {
            v7 = "META_EXTFLOODFILL";
            return -[WMFPlayer playUnsupported:in_recordName:in_pRecord:](self, "playUnsupported:in_recordName:in_pRecord:", *(_QWORD *)&a3, v7, a4);
          }
          if (v5 == 1564)
            return -[WMFPlayer playRoundRect:in_pRecord:](self, "playRoundRect:in_pRecord:", *(_QWORD *)&a3, a4);
        }
        else
        {
          if (v5 == 1313)
            return -[WMFPlayer playTextOut:in_pRecord:](self, "playTextOut:in_pRecord:", *(_QWORD *)&a3, a4);
          if (v5 == 1336)
            return -[WMFPlayer playPolyPolygon:in_pRecord:](self, "playPolyPolygon:in_pRecord:", *(_QWORD *)&a3, a4);
        }
      }
      else if (v5 <= 2609)
      {
        if (v5 > 2337)
        {
          if (v5 == 2338)
            return -[WMFPlayer playBitBlt:in_pRecord:](self, "playBitBlt:in_pRecord:", *(_QWORD *)&a3, a4);
          if (v5 == 2368)
            return -[WMFPlayer playDibBitBlt:in_pRecord:](self, "playDibBitBlt:in_pRecord:", *(_QWORD *)&a3, a4);
        }
        else
        {
          if (v5 == 2074)
            return -[WMFPlayer playPie:in_pRecord:](self, "playPie:in_pRecord:", *(_QWORD *)&a3, a4);
          if (v5 == 2096)
            return -[WMFPlayer playChord:in_pRecord:](self, "playChord:in_pRecord:", *(_QWORD *)&a3, a4);
        }
      }
      else if (v5 <= 2880)
      {
        if (v5 == 2610)
          return -[WMFPlayer playExtTextOut:in_pRecord:](self, "playExtTextOut:in_pRecord:", *(_QWORD *)&a3, a4);
        if (v5 == 2851)
        {
          v7 = "META_STRETCHBLT";
          return -[WMFPlayer playUnsupported:in_recordName:in_pRecord:](self, "playUnsupported:in_recordName:in_pRecord:", *(_QWORD *)&a3, v7, a4);
        }
      }
      else
      {
        switch(v5)
        {
          case 2881:
            return -[WMFPlayer playDibStretchBlt:in_pRecord:](self, "playDibStretchBlt:in_pRecord:", *(_QWORD *)&a3, a4);
          case 3379:
            v7 = "META_SETDIBTODEV";
            return -[WMFPlayer playUnsupported:in_recordName:in_pRecord:](self, "playUnsupported:in_recordName:in_pRecord:", *(_QWORD *)&a3, v7, a4);
          case 3907:
            return -[WMFPlayer playStretchDib:in_pRecord:](self, "playStretchDib:in_pRecord:", *(_QWORD *)&a3, a4);
        }
      }
    }
    else
    {
      if (v5 > 1039)
      {
        switch(v5)
        {
          case 1040:
            return -[WMFPlayer playScaleWindowExt:in_pRecord:](self, "playScaleWindowExt:in_pRecord:", *(_QWORD *)&a3, a4);
          case 1041:
          case 1043:
          case 1044:
          case 1047:
          case 1050:
          case 1052:
          case 1053:
          case 1054:
            return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(_QWORD *)&a3);
          case 1042:
            return -[WMFPlayer playScaleViewportExt:in_pRecord:](self, "playScaleViewportExt:in_pRecord:", *(_QWORD *)&a3, a4);
          case 1045:
            return -[WMFPlayer playExcludeClipRect:in_pRecord:](self, "playExcludeClipRect:in_pRecord:", *(_QWORD *)&a3, a4);
          case 1046:
            return -[WMFPlayer playIntersectClipRect:in_pRecord:](self, "playIntersectClipRect:in_pRecord:", *(_QWORD *)&a3, a4);
          case 1048:
            return -[WMFPlayer playEllipse:in_pRecord:](self, "playEllipse:in_pRecord:", *(_QWORD *)&a3, a4);
          case 1049:
            v7 = "META_FLOODFILL";
            return -[WMFPlayer playUnsupported:in_recordName:in_pRecord:](self, "playUnsupported:in_recordName:in_pRecord:", *(_QWORD *)&a3, v7, a4);
          case 1051:
            return -[WMFPlayer playRectangle:in_pRecord:](self, "playRectangle:in_pRecord:", *(_QWORD *)&a3, a4);
          case 1055:
            v7 = "META_SETPIXEL";
            return -[WMFPlayer playUnsupported:in_recordName:in_pRecord:](self, "playUnsupported:in_recordName:in_pRecord:", *(_QWORD *)&a3, v7, a4);
          default:
            if (v5 == 1065)
              return -[WMFPlayer playFrameRegion:in_pRecord:](self, "playFrameRegion:in_pRecord:", *(_QWORD *)&a3, a4);
            if (v5 != 1078)
              return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(_QWORD *)&a3);
            v7 = "META_ANIMATEPALETTE";
            break;
        }
        return -[WMFPlayer playUnsupported:in_recordName:in_pRecord:](self, "playUnsupported:in_recordName:in_pRecord:", *(_QWORD *)&a3, v7, a4);
      }
      if (v5 > 762)
      {
        if (v5 > 803)
        {
          if (v5 == 804)
            return -[WMFPlayer playPolygon:in_pRecord:](self, "playPolygon:in_pRecord:", *(_QWORD *)&a3, a4);
          if (v5 == 805)
            return -[WMFPlayer playPolyline:in_pRecord:](self, "playPolyline:in_pRecord:", *(_QWORD *)&a3, a4);
        }
        else
        {
          if (v5 == 763)
            return -[WMFPlayer playCreateFontIndirect:in_pRecord:](self, "playCreateFontIndirect:in_pRecord:", *(_QWORD *)&a3, a4);
          if (v5 == 764)
            return -[WMFPlayer playCreateBrushIndirect:in_pRecord:](self, "playCreateBrushIndirect:in_pRecord:", *(_QWORD *)&a3, a4);
        }
      }
      else if (v5 > 563)
      {
        if (v5 == 564)
          return -[WMFPlayer playSelectPalette:in_pRecord:](self, "playSelectPalette:in_pRecord:", *(_QWORD *)&a3, a4);
        if (v5 == 762)
          return -[WMFPlayer playCreatePenIndirect:in_pRecord:](self, "playCreatePenIndirect:in_pRecord:", *(_QWORD *)&a3, a4);
      }
      else
      {
        if (v5 == 552)
          return -[WMFPlayer playFillRegion:in_pRecord:](self, "playFillRegion:in_pRecord:", *(_QWORD *)&a3, a4);
        if (v5 == 561)
        {
          v7 = "META_SETMAPPERFLAGS";
          return -[WMFPlayer playUnsupported:in_recordName:in_pRecord:](self, "playUnsupported:in_recordName:in_pRecord:", *(_QWORD *)&a3, v7, a4);
        }
      }
    }
    return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(_QWORD *)&a3);
  }
  if (v5 > 312)
  {
    if (v5 <= 504)
    {
      switch(v5)
      {
        case 313:
          return -[WMFPlayer playResizePalette:in_pRecord:](self, "playResizePalette:in_pRecord:", *(_QWORD *)&a3, a4);
        case 322:
          return -[WMFPlayer playCreateDIBPatternBrush:in_pRecord:](self, "playCreateDIBPatternBrush:in_pRecord:", *(_QWORD *)&a3, a4);
        case 496:
          return -[WMFPlayer playDeleteObject:in_pRecord:](self, "playDeleteObject:in_pRecord:", *(_QWORD *)&a3, a4);
      }
      return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(_QWORD *)&a3);
    }
    switch(v5)
    {
      case 505:
        result = -[WMFPlayer playCreatePatternBrush:in_pRecord:](self, "playCreatePatternBrush:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 506:
      case 507:
      case 508:
      case 509:
      case 510:
      case 511:
      case 512:
      case 514:
      case 515:
      case 516:
      case 517:
      case 518:
      case 519:
      case 520:
      case 528:
      case 530:
        return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(_QWORD *)&a3);
      case 513:
        result = -[WMFPlayer playSetBkColour:in_pRecord:](self, "playSetBkColour:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 521:
        result = -[WMFPlayer playSetTextColour:in_pRecord:](self, "playSetTextColour:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 522:
        result = -[WMFPlayer playSetTextJustification:in_pRecord:](self, "playSetTextJustification:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 523:
        result = -[WMFPlayer playSetWindowOrg:in_pRecord:](self, "playSetWindowOrg:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 524:
        result = -[WMFPlayer playSetWindowExt:in_pRecord:](self, "playSetWindowExt:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 525:
        result = -[WMFPlayer playSetViewportOrg:in_pRecord:](self, "playSetViewportOrg:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 526:
        result = -[WMFPlayer playSetViewportExt:in_pRecord:](self, "playSetViewportExt:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 527:
        result = -[WMFPlayer playOffsetWindowOrg:in_pRecord:](self, "playOffsetWindowOrg:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 529:
        result = -[WMFPlayer playOffsetViewportOrg:in_pRecord:](self, "playOffsetViewportOrg:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 531:
        result = -[WMFPlayer playLineTo:in_pRecord:](self, "playLineTo:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 532:
        result = -[WMFPlayer playMoveTo:in_pRecord:](self, "playMoveTo:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      default:
        if (v5 != 544)
          return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(_QWORD *)&a3);
        result = -[WMFPlayer playOffsetClipRegion:in_pRecord:](self, "playOffsetClipRegion:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
    }
  }
  else
  {
    if (v5 <= 54)
    {
      switch(v5)
      {
        case 0:
          return -2;
        case 30:
          return -[WMFPlayer playSaveDC:in_pRecord:](self, "playSaveDC:in_pRecord:", *(_QWORD *)&a3, a4);
        case 53:
          return -[WMFPlayer playRealizePalette:in_pRecord:](self, "playRealizePalette:in_pRecord:", *(_QWORD *)&a3, a4);
      }
      return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(_QWORD *)&a3);
    }
    switch(v5)
    {
      case 247:
        result = -[WMFPlayer playCreatePalette:in_pRecord:](self, "playCreatePalette:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 248:
      case 249:
      case 250:
      case 251:
      case 252:
      case 253:
      case 254:
      case 255:
      case 256:
      case 257:
        return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(_QWORD *)&a3);
      case 258:
        result = -[WMFPlayer playSetBkMode:in_pRecord:](self, "playSetBkMode:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 259:
        result = -[WMFPlayer playSetMapMode:in_pRecord:](self, "playSetMapMode:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 260:
        result = -[WMFPlayer playSetROP2:in_pRecord:](self, "playSetROP2:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 261:
        v7 = "META_SETRELABS";
        return -[WMFPlayer playUnsupported:in_recordName:in_pRecord:](self, "playUnsupported:in_recordName:in_pRecord:", *(_QWORD *)&a3, v7, a4);
      case 262:
        result = -[WMFPlayer playSetPolyFillMode:in_pRecord:](self, "playSetPolyFillMode:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 263:
        result = -[WMFPlayer playSetStretchBltMode:in_pRecord:](self, "playSetStretchBltMode:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      case 264:
        result = -[WMFPlayer playSetTextCharExtra:in_pRecord:](self, "playSetTextCharExtra:in_pRecord:", *(_QWORD *)&a3, a4);
        break;
      default:
        switch(v5)
        {
          case 295:
            result = -[WMFPlayer playRestoreDC:in_pRecord:](self, "playRestoreDC:in_pRecord:", *(_QWORD *)&a3, a4);
            break;
          case 296:
          case 297:
            return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(_QWORD *)&a3);
          case 298:
            result = -[WMFPlayer playInvertRegion:in_pRecord:](self, "playInvertRegion:in_pRecord:", *(_QWORD *)&a3, a4);
            break;
          case 299:
            result = -[WMFPlayer playPaintRegion:in_pRecord:](self, "playPaintRegion:in_pRecord:", *(_QWORD *)&a3, a4);
            break;
          case 300:
            result = -[WMFPlayer playSelectClipRegion:in_pRecord:](self, "playSelectClipRegion:in_pRecord:", *(_QWORD *)&a3, a4);
            break;
          case 301:
            result = -[WMFPlayer playSelectObject:in_pRecord:](self, "playSelectObject:in_pRecord:", *(_QWORD *)&a3, a4);
            break;
          case 302:
            result = -[WMFPlayer playSetTextAlign:in_pRecord:](self, "playSetTextAlign:in_pRecord:", *(_QWORD *)&a3, a4);
            break;
          default:
            if (v5 != 55)
              return -[WMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:", *(_QWORD *)&a3);
            result = -[WMFPlayer playSetPaletteEntries:in_pRecord:](self, "playSetPaletteEntries:in_pRecord:", *(_QWORD *)&a3, a4);
            break;
        }
        break;
    }
  }
  return result;
}

- (int)playHeader:(unsigned int)a3 in_pRecord:(const char *)a4
{
  const char *v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  double v15;
  int result;
  int v17;

  v4 = a4;
  if (a3 == 18)
  {
    v13 = 0.0;
    v12 = 1280.0;
    v11 = 1024.0;
    v10 = 0.0;
  }
  else
  {
    if (a3 != 40)
      return -7;
    +[WMFPlayer placeableBounds:](WMFPlayer, "placeableBounds:", a4);
    v10 = 0.0;
    v11 = 1024.0;
    v12 = 1280.0;
    if (v8 == 0.0)
    {
      v13 = 0.0;
    }
    else
    {
      v13 = 0.0;
      if (v9 != 0.0)
      {
        v14 = 1000.0 / (double)(11 * *((unsigned __int16 *)v4 + 7));
        v15 = v14;
        v13 = v6 * v15;
        v10 = v7 * v15;
        v12 = v8 * v15;
        v11 = v9 * v15;
      }
    }
    v4 += 22;
  }
  v17 = *(_DWORD *)(v4 + 6);
  self->m_windowsVersion = *((_WORD *)v4 + 2);
  self->m_records = (v17 - 9) / 3u;
  result = -[MFGraphicsDevice setMapMode:](self->m_gdi, "setMapMode:", 8);
  if (!result)
  {
    result = -[MFGraphicsDevice setWindowOrg:in_y:](self->m_gdi, "setWindowOrg:in_y:", (int)v13, (int)v10);
    if (!result)
    {
      result = -[MFGraphicsDevice setWindowExt:in_y:](self->m_gdi, "setWindowExt:in_y:", (int)v12, (int)v11);
      if (!result)
      {
        result = -[MFGraphicsDevice setViewportOrg:in_y:](self->m_gdi, "setViewportOrg:in_y:", 0, 0);
        if (!result)
        {
          result = -[MFGraphicsDevice setViewportExt:in_y:](self->m_gdi, "setViewportExt:in_y:", (int)v12, (int)v11);
          if (!result)
            return -[MFGraphicsDevice setViewBox:top:width:height:](self->m_gdi, "setViewBox:top:width:height:", 0.0, 0.0, v12, v11);
        }
      }
    }
  }
  return result;
}

- (int)playUnknown:(unsigned int)a3 in_recordType:(unsigned int)a4 in_pRecord:(const char *)a5
{
  return 0;
}

- (int)playUnsupported:(unsigned int)a3 in_recordName:(const char *)a4 in_pRecord:(const char *)a5
{
  return 0;
}

- (int)playPatBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x12)
    return -[MFGraphicsDevice patBlt:in_y:in_width:in_height:in_rop:](self->m_gdi, "patBlt:in_y:in_width:in_height:in_rop:", (__int16)(*((unsigned __int8 *)a4 + 17) << 8) | *((unsigned __int8 *)a4 + 16), (__int16)(*((unsigned __int8 *)a4 + 15) << 8) | *((unsigned __int8 *)a4 + 14), (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12), (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10), *(unsigned int *)(a4 + 6));
  else
    return -7;
}

- (int)playBitBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v4;
  int v5;
  int v7;
  __int16 v8;
  unsigned int v9;
  __int16 v10;
  unsigned int v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unsigned int v20;

  if (a3 < 0x1E)
    return -7;
  v4 = *((unsigned __int16 *)a4 + 13);
  if (*((unsigned __int16 *)a4 + 14) * v4 + 32 > a3)
    return -7;
  v7 = *((unsigned __int8 *)a4 + 10);
  v8 = *((unsigned __int8 *)a4 + 11);
  v9 = *((unsigned __int8 *)a4 + 12);
  v10 = *((unsigned __int8 *)a4 + 13);
  v19 = *(_DWORD *)(a4 + 6);
  v20 = *((unsigned __int16 *)a4 + 7);
  HIDWORD(v18) = *((unsigned __int16 *)a4 + 8);
  v11 = *((unsigned __int8 *)a4 + 18);
  v12 = *((unsigned __int8 *)a4 + 19);
  v13 = *((unsigned __int8 *)a4 + 20);
  v14 = *((unsigned __int8 *)a4 + 21);
  -[MFGraphicsDevice createBitmap:in_height:in_planes:in_bitsPerPixel:in_bitmap:in_bitmapSize:](self->m_gdi, "createBitmap:in_height:in_planes:in_bitsPerPixel:in_bitmap:in_bitmapSize:", *((unsigned __int16 *)a4 + 12), v4, *((unsigned __int8 *)a4 + 30), *((unsigned __int8 *)a4 + 31), a4 + 32, a3 - 32);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    LODWORD(v18) = 0;
    LODWORD(v17) = (__int16)(v8 << 8) | v7;
    HIDWORD(v17) = v19;
    v5 = -[MFGraphicsDevice bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:](self->m_gdi, "bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:", (__int16)(v14 << 8) | v13, (__int16)(v12 << 8) | v11, HIDWORD(v18), v20, v15, (__int16)(v10 << 8) | v9, v17, 0, v18);
  }
  else
  {
    v5 = -7;
  }

  return v5;
}

- (int)playDibBitBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  unsigned __int16 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  if (a3 < 0x18)
    return -7;
  v6 = (unsigned __int16 *)&a4[2 * (a3 == 24)];
  v7 = v6[7];
  v8 = v6[8];
  v9 = v6[9];
  v10 = v6[10];
  if (a3 == 24)
  {
    -[MFGraphicsDevice fillRectangle:y1:x2:y2:](self->m_gdi, "fillRectangle:y1:x2:y2:", v6[10], v6[9], (v10 + v8), (v9 + v7));
    return 0;
  }
  else
  {
    v11 = *(_DWORD *)(a4 + 6);
    v12 = *((unsigned __int16 *)a4 + 5);
    v13 = *((unsigned __int16 *)a4 + 6);
    -[MFGraphicsDevice createDIBitmap:in_dibSize:in_usage:](self->m_gdi, "createDIBitmap:in_dibSize:in_usage:", a4 + 22, a3 - 22, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
    {
      LODWORD(v17) = 0;
      v4 = -[MFGraphicsDevice bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:](self->m_gdi, "bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:", v10, v9, v8, v7, v14, v13, __PAIR64__(v11, v12), 0, v17);
    }
    else
    {
      v4 = -7;
    }

  }
  return v4;
}

- (int)playStretchDib:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  unsigned int v6;
  __int16 v7;
  unsigned int v8;
  __int16 v9;
  unsigned int v10;
  __int16 v11;
  unsigned int v12;
  __int16 v13;
  void *v14;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;

  if (a3 < 0x28)
    return -7;
  v28 = *((unsigned __int8 *)a4 + 7);
  v29 = *((unsigned __int8 *)a4 + 6);
  v30 = *((unsigned __int8 *)a4 + 9);
  v26 = *((unsigned __int8 *)a4 + 12);
  v27 = *((unsigned __int8 *)a4 + 8);
  v24 = *((unsigned __int8 *)a4 + 14);
  v25 = *((unsigned __int8 *)a4 + 13);
  v22 = *((unsigned __int8 *)a4 + 16);
  v23 = *((unsigned __int8 *)a4 + 15);
  v20 = *((unsigned __int8 *)a4 + 18);
  v21 = *((unsigned __int8 *)a4 + 17);
  v19 = *((unsigned __int8 *)a4 + 19);
  v6 = *((unsigned __int8 *)a4 + 20);
  v7 = *((unsigned __int8 *)a4 + 21);
  v8 = *((unsigned __int8 *)a4 + 22);
  v9 = *((unsigned __int8 *)a4 + 23);
  v10 = *((unsigned __int8 *)a4 + 24);
  v11 = *((unsigned __int8 *)a4 + 25);
  v12 = *((unsigned __int8 *)a4 + 26);
  v13 = *((unsigned __int8 *)a4 + 27);
  -[MFGraphicsDevice createDIBitmap:in_dibSize:in_usage:](self->m_gdi, "createDIBitmap:in_dibSize:in_usage:", a4 + 28, a3 - 28, *((unsigned __int16 *)a4 + 5));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    LODWORD(v18) = 0;
    LODWORD(v17) = (__int16)(v25 << 8) | v26;
    *(_QWORD *)((char *)&v17 + 4) = v29 | (v28 << 8) | (v27 << 16) | (v30 << 24);
    LODWORD(v16) = (__int16)(v21 << 8) | v22;
    HIDWORD(v16) = (__int16)(v23 << 8) | v24;
    v4 = -[MFGraphicsDevice stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:](self->m_gdi, "stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:", (__int16)(v13 << 8) | v12, (__int16)(v11 << 8) | v10, (__int16)(v9 << 8) | v8, (__int16)(v7 << 8) | v6, v14, (__int16)(v19 << 8) | v20, v16, (_QWORD)v17, 0, v18);
  }
  else
  {
    v4 = -7;
  }

  return v4;
}

- (int)playDibStretchBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  __int16 v11;
  unsigned int v12;
  __int16 v13;
  void *v14;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;

  if (a3 < 0x26)
    return -7;
  v28 = *((unsigned __int8 *)a4 + 7);
  v29 = *((unsigned __int8 *)a4 + 6);
  v30 = *((unsigned __int8 *)a4 + 9);
  v26 = *((unsigned __int8 *)a4 + 10);
  v27 = *((unsigned __int8 *)a4 + 8);
  v24 = *((unsigned __int8 *)a4 + 12);
  v25 = *((unsigned __int8 *)a4 + 11);
  v22 = *((unsigned __int8 *)a4 + 14);
  v23 = *((unsigned __int8 *)a4 + 13);
  v20 = *((unsigned __int8 *)a4 + 16);
  v21 = *((unsigned __int8 *)a4 + 15);
  v19 = *((unsigned __int8 *)a4 + 17);
  v6 = *((unsigned __int8 *)a4 + 18);
  v7 = *((unsigned __int8 *)a4 + 19);
  v8 = *((unsigned __int8 *)a4 + 20);
  v9 = *((unsigned __int8 *)a4 + 21);
  v10 = *((unsigned __int8 *)a4 + 22);
  v11 = *((unsigned __int8 *)a4 + 23);
  v12 = *((unsigned __int8 *)a4 + 24);
  v13 = *((unsigned __int8 *)a4 + 25);
  -[MFGraphicsDevice createDIBitmap:in_dibSize:in_usage:](self->m_gdi, "createDIBitmap:in_dibSize:in_usage:", a4 + 26, a3 - 26, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    LODWORD(v18) = 0;
    LODWORD(v17) = v26 | (v25 << 8);
    *(_QWORD *)((char *)&v17 + 4) = v29 | (v28 << 8) | (v27 << 16) | (v30 << 24);
    LODWORD(v16) = v22 | (v21 << 8);
    HIDWORD(v16) = v24 | (v23 << 8);
    v4 = -[MFGraphicsDevice stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:](self->m_gdi, "stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:", (__int16)(v13 << 8) | v12, (__int16)(v11 << 8) | v10, v8 | (v9 << 8), v6 | (v7 << 8), v14, v20 | (v19 << 8), v16, (_QWORD)v17, 0, v18);
  }
  else
  {
    v4 = -7;
  }

  return v4;
}

- (int)playSetTextAlign:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8)
    return -[MFGraphicsDevice setTextAlign:textHorizontalAlign:textVerticalAlign:textDirection:](self->m_gdi, "setTextAlign:textHorizontalAlign:textVerticalAlign:textDirection:", a4[6] & 1, a4[6] & 6, a4[6] & 0x18, (a4[7] & 1) << 8);
  else
    return -7;
}

- (int)playSetBkColour:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  void *v6;

  if (a3 < 0xA)
    return -7;
  +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", *((unsigned __int8 *)a4 + 6), *((unsigned __int8 *)a4 + 7), *((unsigned __int8 *)a4 + 8));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFGraphicsDevice setBkColour:](self->m_gdi, "setBkColour:", v6);

  return v4;
}

- (int)playSetMapMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 8 || *((unsigned __int16 *)a4 + 3) - 1 > 7)
    return -7;
  else
    return -[MFGraphicsDevice setMapMode:](self->m_gdi, "setMapMode:");
}

- (int)playSetBkMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 8 || *((unsigned __int16 *)a4 + 3) - 1 > 1)
    return -7;
  else
    return -[MFGraphicsDevice setBkMode:](self->m_gdi, "setBkMode:");
}

- (int)playSetStretchBltMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 8 || *((unsigned __int16 *)a4 + 3) - 1 > 3)
    return -7;
  else
    return -[MFGraphicsDevice setStretchBltMode:](self->m_gdi, "setStretchBltMode:");
}

- (int)playSetTextColour:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  void *v6;

  if (a3 < 0xA)
    return -7;
  +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", *((unsigned __int8 *)a4 + 6), *((unsigned __int8 *)a4 + 7), *((unsigned __int8 *)a4 + 8));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFGraphicsDevice setTextColour:](self->m_gdi, "setTextColour:", v6);

  return v4;
}

- (int)playSetTextJustification:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA)
    return -[MFGraphicsDevice setTextJustification:in_breakCount:](self->m_gdi, "setTextJustification:in_breakCount:", *((unsigned __int16 *)a4 + 4), *((unsigned __int16 *)a4 + 3));
  else
    return -7;
}

- (int)playSetTextCharExtra:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8)
    return -[MFGraphicsDevice setTextCharExtra:](self->m_gdi, "setTextCharExtra:", *((unsigned __int16 *)a4 + 3));
  else
    return -7;
}

- (int)playOffsetClipRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA)
    return -[MFGraphicsDevice offsetClipRegionByX:y:](self->m_gdi, "offsetClipRegionByX:y:", (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6), (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8));
  else
    return -7;
}

- (int)playTextOut:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v5;
  int v6;
  void *v8;

  if (a3 < 7)
    return -7;
  v5 = (*((_WORD *)a4 + 3) & 1) + *((unsigned __int16 *)a4 + 3);
  if (v5 + 12 > a3)
    return -7;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a4 + 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MFGraphicsDevice textOutEncoded:y:in_data:](self->m_gdi, "textOutEncoded:y:in_data:", (__int16)(a4[v5 + 11] << 8) | a4[v5 + 10], (__int16)(a4[v5 + 9] << 8) | a4[v5 + 8], v8);

  return v6;
}

- (int)playExtTextOut:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v5;
  uint64_t v6;
  int v7;
  __int16 v9;
  __int16 v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  unsigned int v21;
  void *v22;
  char *v23;
  uint64_t v24;
  unsigned int v25;
  const char *v26;
  uint64_t v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;

  if (a3 < 0xE)
    return -7;
  v5 = *((unsigned __int8 *)a4 + 10);
  v6 = v5 | (*((unsigned __int8 *)a4 + 11) << 8);
  v7 = (v5 & 1) + v6;
  if (v7 + 14 > a3)
    return -7;
  v9 = *((unsigned __int8 *)a4 + 7);
  v10 = *((unsigned __int8 *)a4 + 9);
  v11 = *((unsigned __int8 *)a4 + 12);
  if ((v11 & 6) == 0)
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v16 = 0;
    v15 = 14;
LABEL_7:
    v17 = v15 + v7;
    v18 = a3 - v17;
    if (a3 < v17)
      return -7;
    v32 = v16;
    v33 = v14;
    v34 = *((unsigned __int8 *)a4 + 6);
    v35 = *((unsigned __int8 *)a4 + 13);
    v36 = *((unsigned __int8 *)a4 + 8);
    v37 = v13;
    v38 = v12;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &a4[v15], v6);
    v39 = objc_claimAutoreleasedReturnValue();
    v21 = v18 >> 1;
    if (v18 >= 2)
    {
      v23 = (char *)malloc_type_malloc(4 * (v18 >> 1), 0xD809582AuLL);
      v22 = v23;
      if (!v23)
      {
        v19 = -4;
        v30 = (void *)v39;
        goto LABEL_19;
      }
      v24 = 0;
      if (v21 <= 1)
        v25 = 1;
      else
        v25 = v21;
      v26 = &a4[(v5 & 1) + 1 + v15 + (unint64_t)v6];
      v27 = 4 * v25;
      do
      {
        v28 = *((unsigned __int8 *)v26 - 1);
        v29 = *(unsigned __int8 *)v26;
        v26 += 2;
        *(_DWORD *)&v23[v24] = (__int16)(v29 << 8) | v28;
        v24 += 4;
      }
      while (v27 != v24);
    }
    else
    {
      v22 = 0;
    }
    v30 = (void *)v39;
    LODWORD(v31) = v21;
    v19 = -[MFGraphicsDevice extTextOutEncoded:y:in_data:options:left:top:right:bottom:spacingValues:numValues:](self->m_gdi, "extTextOutEncoded:y:in_data:options:left:top:right:bottom:spacingValues:numValues:", (__int16)(v10 << 8) | v36, (__int16)(v9 << 8) | v34, v39, v11 | (v35 << 8), v38, v37, __PAIR64__(v32, v33), v22, v31);
    free(v22);
LABEL_19:

    return v19;
  }
  if (a3 >= 0x16)
  {
    v12 = *((unsigned __int16 *)a4 + 7);
    v13 = *((unsigned __int16 *)a4 + 8);
    v14 = *((unsigned __int16 *)a4 + 9);
    v15 = 22;
    v16 = *((unsigned __int16 *)a4 + 10);
    goto LABEL_7;
  }
  return -7;
}

- (int)playRectangle:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xE)
    return -[MFGraphicsDevice rectangle:y1:x2:y2:](self->m_gdi, "rectangle:y1:x2:y2:", (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12), (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10), (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8), (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6));
  else
    return -7;
}

- (int)playEllipse:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xE)
    return -[MFGraphicsDevice ellipse:y1:x2:y2:](self->m_gdi, "ellipse:y1:x2:y2:", (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12), (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10), (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8), (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6));
  else
    return -7;
}

- (int)playSaveDC:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 6)
    return -[MFGraphicsDevice saveDC](self->m_gdi, "saveDC");
  else
    return -7;
}

- (int)playRestoreDC:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8)
    return -[MFGraphicsDevice restoreDC:](self->m_gdi, "restoreDC:", (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6));
  else
    return -7;
}

- (int)playMoveTo:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA)
    return -[MFGraphicsDevice moveTo:y:](self->m_gdi, "moveTo:y:", (double)*((__int16 *)a4 + 4), (double)*((__int16 *)a4 + 3));
  else
    return -7;
}

- (int)playLineTo:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA)
    return -[MFGraphicsDevice lineTo:y:](self->m_gdi, "lineTo:y:", (double)*((__int16 *)a4 + 4), (double)*((__int16 *)a4 + 3));
  else
    return -7;
}

- (int)playPolygon:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v5;
  char *v8;
  char *v9;
  uint64_t v10;
  const char *v11;
  double *v12;
  int v13;

  if (a3 < 8)
    return -7;
  v5 = *((unsigned __int16 *)a4 + 3);
  if (4 * (int)v5 + 8 > a3)
    return -7;
  if (!*((_WORD *)a4 + 3))
    return -4;
  v8 = (char *)malloc_type_malloc((16 * v5), 0xD809582AuLL);
  if (!v8)
    return -4;
  v9 = v8;
  v10 = 0;
  v11 = a4 + 11;
  do
  {
    v12 = (double *)&v8[v10];
    *v12 = (double)*(__int16 *)(v11 - 3);
    v12[1] = (double)*(__int16 *)(v11 - 1);
    v10 += 16;
    v11 += 4;
  }
  while (16 * v5 != v10);
  v13 = -[MFGraphicsDevice polygon:in_count:](self->m_gdi, "polygon:in_count:", v8, v5);
  free(v9);
  return v13;
}

- (int)playPolyline:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v5;
  char *v8;
  char *v9;
  uint64_t v10;
  const char *v11;
  double *v12;
  int v13;

  if (a3 < 0xC)
    return -7;
  v5 = *((unsigned __int16 *)a4 + 3);
  if (4 * (int)v5 + 8 > a3)
    return -7;
  if (!*((_WORD *)a4 + 3))
    return -4;
  v8 = (char *)malloc_type_malloc((16 * v5), 0xD809582AuLL);
  if (!v8)
    return -4;
  v9 = v8;
  v10 = 0;
  v11 = a4 + 11;
  do
  {
    v12 = (double *)&v8[v10];
    *v12 = (double)*(__int16 *)(v11 - 3);
    v12[1] = (double)*(__int16 *)(v11 - 1);
    v10 += 16;
    v11 += 4;
  }
  while (16 * v5 != v10);
  v13 = -[MFGraphicsDevice polyline:in_count:](self->m_gdi, "polyline:in_count:", v8, v5);
  free(v9);
  return v13;
}

- (int)playArc:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v5;

  if (a3 < 0x16)
    return -7;
  LODWORD(v5) = (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8);
  HIDWORD(v5) = (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6);
  return -[MFGraphicsDevice arc:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_gdi, "arc:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", (__int16)(*((unsigned __int8 *)a4 + 21) << 8) | *((unsigned __int8 *)a4 + 20), (__int16)(*((unsigned __int8 *)a4 + 19) << 8) | *((unsigned __int8 *)a4 + 18), (__int16)(*((unsigned __int8 *)a4 + 17) << 8) | *((unsigned __int8 *)a4 + 16), (__int16)(*((unsigned __int8 *)a4 + 15) << 8) | *((unsigned __int8 *)a4 + 14), (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12), (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10), v5);
}

- (int)playPie:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v5;

  if (a3 < 0x16)
    return -7;
  LODWORD(v5) = (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8);
  HIDWORD(v5) = (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6);
  return -[MFGraphicsDevice pie:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_gdi, "pie:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", (__int16)(*((unsigned __int8 *)a4 + 21) << 8) | *((unsigned __int8 *)a4 + 20), (__int16)(*((unsigned __int8 *)a4 + 19) << 8) | *((unsigned __int8 *)a4 + 18), (__int16)(*((unsigned __int8 *)a4 + 17) << 8) | *((unsigned __int8 *)a4 + 16), (__int16)(*((unsigned __int8 *)a4 + 15) << 8) | *((unsigned __int8 *)a4 + 14), (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12), (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10), v5);
}

- (int)playChord:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v5;

  if (a3 != 22)
    return -7;
  LODWORD(v5) = (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8);
  HIDWORD(v5) = (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6);
  return -[MFGraphicsDevice chord:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_gdi, "chord:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", (__int16)(*((unsigned __int8 *)a4 + 21) << 8) | *((unsigned __int8 *)a4 + 20), (__int16)(*((unsigned __int8 *)a4 + 19) << 8) | *((unsigned __int8 *)a4 + 18), (__int16)(*((unsigned __int8 *)a4 + 17) << 8) | *((unsigned __int8 *)a4 + 16), (__int16)(*((unsigned __int8 *)a4 + 15) << 8) | *((unsigned __int8 *)a4 + 14), (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12), (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10), v5);
}

- (int)playRoundRect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 == 18)
    return -[MFGraphicsDevice roundRect:top:right:bottom:rx:ry:](self->m_gdi, "roundRect:top:right:bottom:rx:ry:", (__int16)(*((unsigned __int8 *)a4 + 17) << 8) | *((unsigned __int8 *)a4 + 16), (__int16)(*((unsigned __int8 *)a4 + 15) << 8) | *((unsigned __int8 *)a4 + 14), (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12), (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10), (double)*((__int16 *)a4 + 4) * 0.5, (double)*((__int16 *)a4 + 3) * 0.5);
  else
    return -7;
}

- (int)playPolyPolygon:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v6;
  unsigned int v7;
  int v8;
  char *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  int v16;
  double *v17;
  double *v18;
  unint64_t v19;
  const char *v20;
  double *v21;
  int v22;

  if (a3 < 8)
    return -7;
  v6 = *((unsigned __int16 *)a4 + 3);
  v7 = 2 * v6 + 8;
  if (v7 > a3)
    return -7;
  if (!*((_WORD *)a4 + 3))
    return -4;
  v11 = (char *)malloc_type_malloc(4 * *((unsigned __int16 *)a4 + 3), 0xD809582AuLL);
  if (!v11)
    return -4;
  v12 = v11;
  v13 = 0;
  LODWORD(v14) = 0;
  v15 = a4 + 9;
  do
  {
    v16 = *(unsigned __int16 *)(v15 - 1);
    v14 = (v16 + v14);
    *(_DWORD *)&v11[v13] = v16;
    v13 += 4;
    v15 += 2;
  }
  while (4 * v6 != v13);
  if (v7 + 4 * (_DWORD)v14 <= a3)
  {
    if ((_DWORD)v14 && (v17 = (double *)malloc_type_malloc(16 * v14, 0xD809582AuLL)) != 0)
    {
      v18 = v17;
      v19 = 0;
      v20 = &a4[(2 * v6) + 8];
      v21 = v17 + 1;
      do
      {
        *(v21 - 1) = (double)*(__int16 *)v20;
        v22 = *((__int16 *)v20 + 1);
        v20 += 4;
        *v21 = (double)v22;
        v21 += 2;
        ++v19;
      }
      while (v19 < v14);
      v8 = -[MFGraphicsDevice polyPolygon:in_polyCounts:in_count:](self->m_gdi, "polyPolygon:in_polyCounts:in_count:", v17, v12, v6);
      free(v18);
    }
    else
    {
      v8 = -4;
    }
  }
  else
  {
    v8 = -7;
  }
  free(v12);
  return v8;
}

- (int)playSetWindowExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int result;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  int v10;
  __int16 v12;

  if (a3 < 0xA)
    return -7;
  v6 = (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8);
  v7 = (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6);
  if ((_DWORD)v6)
    v8 = (_DWORD)v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    result = 0;
    self->m_ignoreSetWindowOrg = 1;
  }
  else if (self->m_boundsSet)
  {
    return -[MFGraphicsDevice setWindowExt:in_y:](self->m_gdi, "setWindowExt:in_y:", (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8), (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6));
  }
  else
  {
    if ((int)v6 >= 0)
      v9 = (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8);
    else
      v9 = -(int)v6;
    if ((int)v7 >= 0)
      v10 = (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6);
    else
      v10 = -(int)v7;
    result = -[MFGraphicsDevice setMapMode:](self->m_gdi, "setMapMode:", 8);
    if (!result)
    {
      result = -[MFGraphicsDevice setWindowExt:in_y:](self->m_gdi, "setWindowExt:in_y:", v6, v7);
      if (!result)
      {
        if ((int)v7 >= 0 || (int)v6 <= -1)
          v12 = v7;
        else
          v12 = v10;
        result = -[MFGraphicsDevice setViewportExt:in_y:](self->m_gdi, "setViewportExt:in_y:", v6, v12);
        if (!result)
          result = -[MFGraphicsDevice setViewBox:top:width:height:](self->m_gdi, "setViewBox:top:width:height:", 0.0, 0.0, (double)v9, (double)v10);
      }
    }
    self->m_boundsSet = 1;
  }
  return result;
}

- (int)playSetWindowOrg:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xA)
    return -7;
  if (self->m_ignoreSetWindowOrg)
    return 0;
  return -[MFGraphicsDevice setWindowOrg:in_y:](self->m_gdi, "setWindowOrg:in_y:", (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8), (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6));
}

- (int)playScaleWindowExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xE)
    return -[MFGraphicsDevice scaleWindowExt:in_xDenom:in_yNum:in_yDenom:](self->m_gdi, "scaleWindowExt:in_xDenom:in_yNum:in_yDenom:", (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12), (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10), (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8), (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6));
  else
    return -7;
}

- (int)playOffsetWindowOrg:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA)
    return -[MFGraphicsDevice offsetWindowOrg:in_y:](self->m_gdi, "offsetWindowOrg:in_y:", (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8), (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6));
  else
    return -7;
}

- (int)playOffsetViewportOrg:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA)
    return -[MFGraphicsDevice offsetViewportOrg:in_y:](self->m_gdi, "offsetViewportOrg:in_y:", (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8), (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6));
  else
    return -7;
}

- (int)playSetViewportExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA)
    return -[MFGraphicsDevice setViewportExt:in_y:](self->m_gdi, "setViewportExt:in_y:", (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8), (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6));
  else
    return -7;
}

- (int)playSetViewportOrg:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA)
    return -[MFGraphicsDevice setViewportOrg:in_y:](self->m_gdi, "setViewportOrg:in_y:", (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8), (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6));
  else
    return -7;
}

- (int)playScaleViewportExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xE)
    return -[MFGraphicsDevice scaleViewportExt:in_xDenom:in_yNum:in_yDenom:](self->m_gdi, "scaleViewportExt:in_xDenom:in_yNum:in_yDenom:", (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12), (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10), (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8), (__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6));
  else
    return -7;
}

- (int)playSelectObject:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8)
    return -[MFGraphicsDevice selectObject:](self->m_gdi, "selectObject:", *((unsigned __int16 *)a4 + 3));
  else
    return -7;
}

- (int)playSelectPalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8)
    return -[MFGraphicsDevice selectObject:](self->m_gdi, "selectObject:", *((unsigned __int16 *)a4 + 3));
  else
    return -7;
}

- (int)playDeleteObject:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8)
    return -[MFGraphicsDevice deleteObject:](self->m_gdi, "deleteObject:", *((unsigned __int16 *)a4 + 3));
  else
    return -7;
}

- (int)playCreateDIBPatternBrush:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  void *v6;

  if (a3 < 0x16)
    return -7;
  -[MFGraphicsDevice createDIBitmap:in_dibSize:in_usage:](self->m_gdi, "createDIBitmap:in_dibSize:in_usage:", a4 + 10, a3 - 10, *((unsigned __int16 *)a4 + 4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v4 = -[MFGraphicsDevice createPatternBrush:index:usePaletteForBilevel:](self->m_gdi, "createPatternBrush:index:usePaletteForBilevel:", v6, 0xFFFFFFFFLL, 0);
  else
    v4 = -7;

  return v4;
}

- (int)playRealizePalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 6)
    return -[MFGraphicsDevice realizePalette](self->m_gdi, "realizePalette");
  else
    return -7;
}

- (int)playCreatePalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v5;
  int v6;
  void *v8;
  unsigned __int8 *v9;
  void *v10;

  if (a3 < 0xA)
    return -7;
  v5 = *((unsigned __int16 *)a4 + 4);
  if (4 * v5 + 10 > a3)
    return -7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", *((unsigned __int16 *)a4 + 4));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = (unsigned __int8 *)(a4 + 12);
    do
    {
      +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", *(v9 - 2), *(v9 - 1), *v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);
      v9 += 4;

      --v5;
    }
    while (v5);
  }
  v6 = -[MFGraphicsDevice createPalette:in_index:](self->m_gdi, "createPalette:in_index:", v8, 0xFFFFFFFFLL);

  return v6;
}

- (int)playSetPaletteEntries:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v5;
  int v6;
  uint64_t v8;
  void *v9;
  unsigned __int8 *v10;
  void *v11;

  if (a3 < 0xA)
    return -7;
  v5 = *((unsigned __int16 *)a4 + 4);
  if (4 * v5 + 10 > a3)
    return -7;
  v8 = *((unsigned __int16 *)a4 + 3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", *((unsigned __int16 *)a4 + 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10 = (unsigned __int8 *)(a4 + 12);
    do
    {
      +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", *(v10 - 2), *(v10 - 1), *v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);
      v10 += 4;

      --v5;
    }
    while (v5);
  }
  v6 = -[MFGraphicsDevice setPaletteEntries:in_colours:in_index:](self->m_gdi, "setPaletteEntries:in_colours:in_index:", v8, v9, 0xFFFFFFFFLL);

  return v6;
}

- (int)playResizePalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8)
    return -[MFGraphicsDevice resizePalette:in_index:](self->m_gdi, "resizePalette:in_index:", *((unsigned __int16 *)a4 + 3), 0xFFFFFFFFLL);
  else
    return -7;
}

- (int)playCreatePatternBrush:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  void *v6;

  if (a3 < 0x12
    || *((unsigned __int16 *)a4 + 6)
     * ((__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10))
     + 38 > a3)
  {
    return -7;
  }
  -[MFGraphicsDevice createBitmap:in_height:in_planes:in_bitsPerPixel:in_bitmap:in_bitmapSize:](self->m_gdi, "createBitmap:in_height:in_planes:in_bitsPerPixel:in_bitmap:in_bitmapSize:", (__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8), (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10), *((unsigned __int8 *)a4 + 14), *((unsigned __int8 *)a4 + 15), a4 + 38, a3 - 38);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v4 = -[MFGraphicsDevice createPatternBrush:index:usePaletteForBilevel:](self->m_gdi, "createPatternBrush:index:usePaletteForBilevel:", v6, 0xFFFFFFFFLL, 0);
  else
    v4 = -7;

  return v4;
}

- (int)playCreatePenIndirect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a3 < 0x10)
    return -7;
  if (*((unsigned __int16 *)a4 + 3) <= 6u)
    v6 = *((unsigned __int16 *)a4 + 3);
  else
    v6 = 0;
  v7 = *((unsigned __int16 *)a4 + 4);
  +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", *((unsigned __int8 *)a4 + 12), *((unsigned __int8 *)a4 + 13), *((unsigned __int8 *)a4 + 14));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFGraphicsDevice createPen:width:in_colour:in_userStyleArray:index:](self->m_gdi, "createPen:width:in_colour:in_userStyleArray:index:", v6, v7, v8, 0, 0xFFFFFFFFLL);

  return v4;
}

- (int)playCreateFontIndirect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int IsValidCharSet;
  int v13;
  unint64_t v14;
  void *v15;
  const char *v16;
  int v18;
  int v19;
  unsigned int v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;
  __int16 v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  int v36;
  int v37;
  char v38;

  if (a3 < 0x18)
    return -7;
  v33 = *((unsigned __int8 *)a4 + 8);
  v34 = *((unsigned __int8 *)a4 + 6);
  v28 = *((unsigned __int8 *)a4 + 9);
  v29 = *((unsigned __int8 *)a4 + 7);
  v31 = *((unsigned __int8 *)a4 + 12);
  v32 = *((unsigned __int8 *)a4 + 10);
  v26 = *((unsigned __int8 *)a4 + 13);
  v27 = *((unsigned __int8 *)a4 + 11);
  v30 = *((unsigned __int8 *)a4 + 14);
  v25 = *((unsigned __int8 *)a4 + 15);
  v35 = *((unsigned __int8 *)a4 + 16);
  v36 = *((unsigned __int8 *)a4 + 17);
  v37 = *((unsigned __int8 *)a4 + 18);
  v8 = *((unsigned __int8 *)a4 + 19);
  v9 = *((unsigned __int8 *)a4 + 20);
  v38 = a4[21];
  v10 = *((unsigned __int8 *)a4 + 22);
  v11 = *((unsigned __int8 *)a4 + 23);
  IsValidCharSet = ChValueIsValidCharSet(v8);
  if (IsValidCharSet)
    v13 = 0;
  else
    v13 = -7;
  if (!IsValidCharSet)
    v8 = 0;
  if (a3 <= 0x18)
  {
    v15 = 0;
  }
  else
  {
    if (v8 == 128)
      v14 = OCNsStringEncodingForWindowsCharSet(128);
    else
      v14 = 5;
    v16 = a4 + 24;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v16, 32, v14);
    if (!v15)
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v16, 32, 5);
    if (!v15)
      v13 = -7;
  }
  if (v9 >= 0xB || v11 >= 0x60)
    v4 = -7;
  else
    v4 = v13;
  if (!v4)
  {
    v18 = v11 & 0xF0;
    if (v11 >= 0x60)
      v18 = 0;
    v19 = v10 & 3;
    if (v10 < 5)
      v19 = v10;
    if (v9 >= 0xB)
      v20 = 0;
    else
      v20 = v9;
    LODWORD(v24) = v18;
    BYTE4(v23) = v38;
    HIDWORD(v22) = v8;
    LODWORD(v23) = v20;
    BYTE1(v22) = v37 != 0;
    LOBYTE(v22) = v36 != 0;
    v4 = -[MFGraphicsDevice createFontIndirect:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:](self->m_gdi, "createFontIndirect:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:", (__int16)(v29 << 8) | v34, (__int16)(v28 << 8) | v33, (__int16)(v27 << 8) | v32, (__int16)(v26 << 8) | v31, (__int16)(v25 << 8) | v30, v35 != 0, v22, v23, __PAIR64__(v11 & 3, v19), v24, v15);
  }

  return v4;
}

- (int)playCreateBrushIndirect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if (a3 >= 0xE)
  {
    v7 = *((unsigned __int16 *)a4 + 3);
    -[MFGraphicsDevice createColorWithRGBBytes:green:blue:flags:](self->m_gdi, "createColorWithRGBBytes:green:blue:flags:", *((unsigned __int8 *)a4 + 8), *((unsigned __int8 *)a4 + 9), *((unsigned __int8 *)a4 + 10), *((unsigned __int8 *)a4 + 11));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v7 - 3) >= 7)
    {
      if (v7 >= 3)
      {
        v4 = -7;
LABEL_10:

        return v4;
      }
    }
    else
    {
      v7 = 1;
    }
    if (*((unsigned __int16 *)a4 + 6) >= 6u)
      v9 = 0xFFFFFFLL;
    else
      v9 = *((unsigned __int16 *)a4 + 6);
    v4 = -[MFGraphicsDevice createBrush:in_colour:hatchstyle:index:](self->m_gdi, "createBrush:in_colour:hatchstyle:index:", v7, v8, v9, 0xFFFFFFFFLL);
    goto LABEL_10;
  }
  return -7;
}

- (int)playCreateRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  BOOL v4;
  uint64_t v5;
  int v6;
  void *v8;

  v4 = a3 >= 6;
  v5 = a3 - 6;
  if (!v4)
    return -7;
  -[WMFPlayer parseRegion:in_pData:](self, "parseRegion:in_pData:", v5, a4 + 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v6 = -[MFGraphicsDevice createRegion:](self->m_gdi, "createRegion:", v8);
  else
    v6 = -7;

  return v6;
}

- (int)playSetPolyFillMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  MFGraphicsDevice *m_gdi;
  uint64_t v6;

  if (a3 < 8)
    return -7;
  m_gdi = self->m_gdi;
  if (*((_WORD *)a4 + 3) == 1)
    v6 = 1;
  else
    v6 = 2;
  return -[MFGraphicsDevice setPolyFillMode:](m_gdi, "setPolyFillMode:", v6);
}

- (int)playSetROP2:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8)
    return -[MFGraphicsDevice setRop2:](self->m_gdi, "setRop2:", *((unsigned __int16 *)a4 + 3));
  else
    return -1;
}

- (int)playFillRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xA)
    return -[MFGraphicsDevice fillRgn:in_brushID:](self->m_gdi, "fillRgn:in_brushID:", *((unsigned __int16 *)a4 + 4), *((unsigned __int16 *)a4 + 3));
  else
    return -7;
}

- (int)playFrameRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xE)
    return -[MFGraphicsDevice frameRegion:in_brushID:in_width:in_height:](self->m_gdi, "frameRegion:in_brushID:in_width:in_height:", *((unsigned __int16 *)a4 + 6), *((unsigned __int16 *)a4 + 5), *((unsigned __int16 *)a4 + 4), *((unsigned __int16 *)a4 + 3));
  else
    return -7;
}

- (int)playInvertRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8)
    return -[MFGraphicsDevice invertRgn:](self->m_gdi, "invertRgn:", *((unsigned __int16 *)a4 + 3));
  else
    return -7;
}

- (int)playPaintRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8)
    return -[MFGraphicsDevice paintRgn:](self->m_gdi, "paintRgn:", *((unsigned __int16 *)a4 + 3));
  else
    return -7;
}

- (int)playSelectClipRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8)
    return -[MFGraphicsDevice setClipRegion:](self->m_gdi, "setClipRegion:", *((unsigned __int16 *)a4 + 3));
  else
    return -7;
}

- (int)playExcludeClipRect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v5;
  int v6;

  if (a3 < 0xE)
    return -1;
  v5 = (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10);
  v6 = (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12);
  return -[MFGraphicsDevice excludeClipRect:](self->m_gdi, "excludeClipRect:", (double)v6, (double)v5, (double)(((__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8)) - v6), (double)(((__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6)) - v5));
}

- (int)playIntersectClipRect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v5;
  int v6;

  if (a3 < 0xE)
    return -1;
  v5 = (__int16)(*((unsigned __int8 *)a4 + 11) << 8) | *((unsigned __int8 *)a4 + 10);
  v6 = (__int16)(*((unsigned __int8 *)a4 + 13) << 8) | *((unsigned __int8 *)a4 + 12);
  return -[MFGraphicsDevice intersectClipRect:](self->m_gdi, "intersectClipRect:", (double)v6, (double)v5, (double)(((__int16)(*((unsigned __int8 *)a4 + 9) << 8) | *((unsigned __int8 *)a4 + 8)) - v6), (double)(((__int16)(*((unsigned __int8 *)a4 + 7) << 8) | *((unsigned __int8 *)a4 + 6)) - v5));
}

- (id)parseRegion:(unsigned int)a3 in_pData:(const char *)a4
{
  int v6;
  void *v7;
  int v8;
  unsigned __int8 *v9;
  const char *v10;
  unsigned __int8 *v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  double v16;
  double v17;
  int v18;
  void *v19;

  if (a3 < 0x16)
  {
    if (a3)
    {
LABEL_15:
      v7 = 0;
      return v7;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array", *(_QWORD *)&a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = *((unsigned __int16 *)a4 + 5);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", *((unsigned __int16 *)a4 + 5));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = 0;
      v9 = (unsigned __int8 *)(a4 + 22);
      v10 = &a4[a3];
      while (1)
      {
        v11 = v9 + 6;
        if (v9 + 6 > (unsigned __int8 *)v10)
          break;
        v12 = *v9;
        if ((v12 & 1) != 0)
          break;
        v13 = (2 * v12) | (v9[1] << 9);
        if (&v11[v13] > (unsigned __int8 *)v10)
          break;
        if ((_DWORD)v13)
        {
          v14 = 0;
          v15 = (__int16)(v9[3] << 8) | v9[2];
          v16 = (double)v15;
          v17 = (double)(((__int16)(v9[5] << 8) | v9[4]) - v15);
          do
          {
            v18 = (__int16)(v9[v14 + 7] << 8) | v9[v14 + 6];
            objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", (double)v18, v16, (double)(((__int16)(v9[v14 + 9] << 8) | v9[v14 + 8]) - v18), v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v19);

            v14 += 4;
          }
          while (v14 < v13);
        }
        v9 = &v11[(v13 + 2)];
        if (++v8 == v6)
          return v7;
      }

      goto LABEL_15;
    }
  }
  return v7;
}

+ (CGRect)boundsInLogicalUnits:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  _DWORD *v7;
  double v8;
  double v9;
  double v10;
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
  double v22;
  double v23;
  CGRect result;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = objc_retainAutorelease(v4);
  v7 = (_DWORD *)objc_msgSend(v6, "bytes");
  if (v5 <= 0x11)
    goto LABEL_4;
  if (*v7 != -1698247209)
  {
LABEL_8:
    objc_msgSend(a1, "windowBounds:", v6);
    v8 = v16;
    v9 = v17;
    v10 = v18;
    v11 = v19;
    goto LABEL_9;
  }
  if (v5 > 0x27)
  {
    +[WMFPlayer placeableBounds:](WMFPlayer, "placeableBounds:", v7);
    v10 = v15;
    if (v15 != 0.0)
    {
      v11 = v14;
      if (v14 != 0.0)
      {
        v8 = v12;
        v9 = v13;
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
LABEL_4:
  v8 = *MEMORY[0x24BDBF090];
  v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
LABEL_9:

  v20 = v8;
  v21 = v9;
  v22 = v10;
  v23 = v11;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_gdi, 0);
}

@end
