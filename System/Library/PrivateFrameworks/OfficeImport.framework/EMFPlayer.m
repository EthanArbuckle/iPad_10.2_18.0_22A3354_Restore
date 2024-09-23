@implementation EMFPlayer

- (EMFPlayer)initWithGraphicsDevice:(id)a3
{
  id v5;
  EMFPlayer *v6;
  EMFPlayer *v7;
  EMFPlusPlayer *v8;
  uint64_t v9;
  EMFPlusPlayer *m_emfPlusPlayer;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EMFPlayer;
  v6 = -[EMFPlayer init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->m_gdi, a3);
    v7->m_headerDone = 0;
    v8 = [EMFPlusPlayer alloc];
    objc_msgSend(v5, "getCanvas");
    v9 = -[EMFPlusPlayer initWithOwner:canvas:](v8, "initWithOwner:canvas:", v7);
    m_emfPlusPlayer = v7->m_emfPlusPlayer;
    v7->m_emfPlusPlayer = (EMFPlusPlayer *)v9;

  }
  return v7;
}

- (void)setIgnoreEMFPlusRecords:(BOOL)a3
{
  self->m_ignoreEMFPlusRecords = a3;
}

- (void)setIgnoreEMFRecords:(BOOL)a3
{
  self->m_ignoreEMFRecords = a3;
}

- (void)done
{
  EMFPlusPlayer *m_emfPlusPlayer;

  -[MFGraphicsDevice done](self->m_gdi, "done");
  m_emfPlusPlayer = self->m_emfPlusPlayer;
  self->m_emfPlusPlayer = 0;

}

+ (CGRect)boundsInPoints:(id)a3
{
  id v3;
  int *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v3 = objc_retainAutorelease(a3);
  v4 = (int *)objc_msgSend(v3, "bytes");
  if ((unint64_t)objc_msgSend(v3, "length") > 0x4F)
  {
    v5 = (double)v4[6] * 0.0283464569;
    v6 = (double)v4[7] * 0.0283464569;
    v7 = (double)v4[8] * 0.0283464569 - v5;
    v8 = (double)v4[9] * 0.0283464569 - v6;
  }
  else
  {
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v9 = v5;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (id)getGdi
{
  return self->m_gdi;
}

- (int)play:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  int result;
  int v7;
  int v8;

  if (a3 < 4)
    return -7;
  v7 = *(_DWORD *)a4;
  if (self->m_headerDone)
  {
    if (!self->m_ignoreEMFPlusRecords && v7 == 70)
    {
      if (a3 < 0x10)
        return -7;
      if (*((_DWORD *)a4 + 3) == 726027589)
      {
        v8 = *((_DWORD *)a4 + 2);
        self->m_ignoreEMFRecords = 1;
        if (v8 - 4 <= a3 - 16)
          return -[EMFPlusPlayer play:in_size:](self->m_emfPlusPlayer, "play:in_size:", a4 + 16);
        return -7;
      }
    }
    if (self->m_ignoreEMFRecords)
      return 0;
    v4 = -2;
    switch(v7)
    {
      case 1:
      case 15:
      case 16:
      case 23:
      case 53:
      case 65:
      case 70:
      case 72:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
        result = -[EMFPlayer playUnsupported:in_recordName:in_pRecord:](self, "playUnsupported:in_recordName:in_pRecord:");
        break;
      case 2:
      case 85:
        result = -[EMFPlayer playPolyBezier:in_pRecord:in_is16bit:](self, "playPolyBezier:in_pRecord:in_is16bit:");
        break;
      case 3:
      case 86:
        result = -[EMFPlayer playPolygon:in_pRecord:in_is16bit:](self, "playPolygon:in_pRecord:in_is16bit:");
        break;
      case 4:
      case 87:
        result = -[EMFPlayer playPolyLine:in_pRecord:in_is16bit:](self, "playPolyLine:in_pRecord:in_is16bit:");
        break;
      case 5:
      case 88:
        result = -[EMFPlayer playPolyBezierTo:in_pRecord:in_is16bit:](self, "playPolyBezierTo:in_pRecord:in_is16bit:");
        break;
      case 6:
      case 89:
        result = -[EMFPlayer playPolyLineTo:in_pRecord:in_is16bit:](self, "playPolyLineTo:in_pRecord:in_is16bit:");
        break;
      case 7:
      case 90:
        result = -[EMFPlayer playPolyPolyLine:in_pRecord:in_is16bit:](self, "playPolyPolyLine:in_pRecord:in_is16bit:");
        break;
      case 8:
      case 91:
        result = -[EMFPlayer playPolyPolygon:in_pRecord:in_is16bit:](self, "playPolyPolygon:in_pRecord:in_is16bit:");
        break;
      case 9:
        result = -[EMFPlayer playSetWindowExt:in_pRecord:](self, "playSetWindowExt:in_pRecord:");
        break;
      case 10:
        result = -[EMFPlayer playSetWindowOrg:in_pRecord:](self, "playSetWindowOrg:in_pRecord:");
        break;
      case 11:
        result = -[EMFPlayer playSetViewportExt:in_pRecord:](self, "playSetViewportExt:in_pRecord:");
        break;
      case 12:
        result = -[EMFPlayer playSetViewportOrg:in_pRecord:](self, "playSetViewportOrg:in_pRecord:");
        break;
      case 13:
        result = -[EMFPlayer playSetBrushOrg:in_pRecord:](self, "playSetBrushOrg:in_pRecord:");
        break;
      case 14:
        return v4;
      case 17:
        result = -[EMFPlayer playSetMapMode:in_pRecord:](self, "playSetMapMode:in_pRecord:");
        break;
      case 18:
        result = -[EMFPlayer playSetBkMode:in_pRecord:](self, "playSetBkMode:in_pRecord:");
        break;
      case 19:
        result = -[EMFPlayer playSetPolyFillMode:in_pRecord:](self, "playSetPolyFillMode:in_pRecord:");
        break;
      case 20:
        result = -[EMFPlayer playSetRop2:in_pRecord:](self, "playSetRop2:in_pRecord:");
        break;
      case 21:
        result = -[EMFPlayer playSetStretchBltMode:in_pRecord:](self, "playSetStretchBltMode:in_pRecord:");
        break;
      case 22:
        result = -[EMFPlayer playSetTextAlign:in_pRecord:](self, "playSetTextAlign:in_pRecord:");
        break;
      case 24:
        result = -[EMFPlayer playSetTextColour:in_pRecord:](self, "playSetTextColour:in_pRecord:");
        break;
      case 25:
        result = -[EMFPlayer playSetBkColour:in_pRecord:](self, "playSetBkColour:in_pRecord:");
        break;
      case 26:
        result = -[EMFPlayer playOffsetClipRegion:in_pRecord:](self, "playOffsetClipRegion:in_pRecord:");
        break;
      case 27:
        result = -[EMFPlayer playMoveToEx:in_pRecord:](self, "playMoveToEx:in_pRecord:");
        break;
      case 28:
        result = -[EMFPlayer playSetMetaRgn:in_pRecord:](self, "playSetMetaRgn:in_pRecord:");
        break;
      case 29:
        result = -[EMFPlayer playExcludeClipRect:in_pRecord:](self, "playExcludeClipRect:in_pRecord:");
        break;
      case 30:
        result = -[EMFPlayer playIntersectClipRect:in_pRecord:](self, "playIntersectClipRect:in_pRecord:");
        break;
      case 31:
        result = -[EMFPlayer playScaleViewportExt:in_pRecord:](self, "playScaleViewportExt:in_pRecord:");
        break;
      case 32:
        result = -[EMFPlayer playScaleWindowExt:in_pRecord:](self, "playScaleWindowExt:in_pRecord:");
        break;
      case 33:
        result = -[EMFPlayer playSaveDC:in_pRecord:](self, "playSaveDC:in_pRecord:");
        break;
      case 34:
        result = -[EMFPlayer playRestoreDC:in_pRecord:](self, "playRestoreDC:in_pRecord:");
        break;
      case 35:
        result = -[EMFPlayer playSetWorldTransform:in_pRecord:](self, "playSetWorldTransform:in_pRecord:");
        break;
      case 36:
        result = -[EMFPlayer playModifyWorldTransform:in_pRecord:](self, "playModifyWorldTransform:in_pRecord:");
        break;
      case 37:
        result = -[EMFPlayer playSelectObject:in_pRecord:](self, "playSelectObject:in_pRecord:");
        break;
      case 38:
        result = -[EMFPlayer playCreatePen:in_pRecord:](self, "playCreatePen:in_pRecord:");
        break;
      case 39:
        result = -[EMFPlayer playCreateBrushIndirect:in_pRecord:](self, "playCreateBrushIndirect:in_pRecord:");
        break;
      case 40:
        result = -[EMFPlayer playDeleteObject:in_pRecord:](self, "playDeleteObject:in_pRecord:");
        break;
      case 41:
        result = -[EMFPlayer playAngleArc:in_pRecord:in_is16bit:](self, "playAngleArc:in_pRecord:in_is16bit:");
        break;
      case 42:
        result = -[EMFPlayer playEllipse:in_pRecord:](self, "playEllipse:in_pRecord:");
        break;
      case 43:
        result = -[EMFPlayer playRectangle:in_pRecord:](self, "playRectangle:in_pRecord:");
        break;
      case 44:
        result = -[EMFPlayer playRoundRect:in_pRecord:](self, "playRoundRect:in_pRecord:");
        break;
      case 45:
        result = -[EMFPlayer playArc:in_pRecord:](self, "playArc:in_pRecord:");
        break;
      case 46:
        result = -[EMFPlayer playChord:in_pRecord:](self, "playChord:in_pRecord:");
        break;
      case 47:
        result = -[EMFPlayer playPie:in_pRecord:](self, "playPie:in_pRecord:");
        break;
      case 48:
        result = -[EMFPlayer playSelectPalette:in_pRecord:](self, "playSelectPalette:in_pRecord:");
        break;
      case 49:
        result = -[EMFPlayer playCreatePalette:in_pRecord:](self, "playCreatePalette:in_pRecord:");
        break;
      case 50:
        result = -[EMFPlayer playSetPaletteEntries:in_pRecord:](self, "playSetPaletteEntries:in_pRecord:");
        break;
      case 51:
        result = -[EMFPlayer playResizePalette:in_pRecord:](self, "playResizePalette:in_pRecord:");
        break;
      case 52:
        result = -[EMFPlayer playRealizePalette:in_pRecord:](self, "playRealizePalette:in_pRecord:");
        break;
      case 54:
        result = -[EMFPlayer playLineTo:in_pRecord:](self, "playLineTo:in_pRecord:");
        break;
      case 55:
        result = -[EMFPlayer playArcTo:in_pRecord:](self, "playArcTo:in_pRecord:");
        break;
      case 56:
      case 92:
        result = -[EMFPlayer playPolyDraw:in_pRecord:in_is16bit:](self, "playPolyDraw:in_pRecord:in_is16bit:");
        break;
      case 57:
        result = -[EMFPlayer playSetArcDirection:in_pRecord:](self, "playSetArcDirection:in_pRecord:");
        break;
      case 58:
        result = -[EMFPlayer playSetMiterLimit:in_pRecord:](self, "playSetMiterLimit:in_pRecord:");
        break;
      case 59:
        result = -[EMFPlayer playBeginPath:in_pRecord:](self, "playBeginPath:in_pRecord:");
        break;
      case 60:
        result = -[EMFPlayer playEndPath:in_pRecord:](self, "playEndPath:in_pRecord:");
        break;
      case 61:
        result = -[EMFPlayer playCloseFigure:in_pRecord:](self, "playCloseFigure:in_pRecord:");
        break;
      case 62:
      case 63:
      case 64:
        result = -[EMFPlayer playStrokeAndFillPath:in_pRecord:in_stroke:in_fill:](self, "playStrokeAndFillPath:in_pRecord:in_stroke:in_fill:");
        break;
      case 66:
        result = -[EMFPlayer playWidenPath:in_pRecord:](self, "playWidenPath:in_pRecord:");
        break;
      case 67:
        result = -[EMFPlayer playSelectClipPath:in_pRecord:](self, "playSelectClipPath:in_pRecord:");
        break;
      case 68:
        result = -[EMFPlayer playAbortPath:in_pRecord:](self, "playAbortPath:in_pRecord:");
        break;
      case 71:
        result = -[EMFPlayer playFillRgn:in_pRecord:](self, "playFillRgn:in_pRecord:");
        break;
      case 73:
        result = -[EMFPlayer playInvertRgn:in_pRecord:](self, "playInvertRgn:in_pRecord:");
        break;
      case 74:
        result = -[EMFPlayer playPaintRgn:in_pRecord:](self, "playPaintRgn:in_pRecord:");
        break;
      case 75:
        result = -[EMFPlayer playSelectClipRegion:in_pRecord:](self, "playSelectClipRegion:in_pRecord:");
        break;
      case 76:
        result = -[EMFPlayer playBitBlt:in_pRecord:](self, "playBitBlt:in_pRecord:");
        break;
      case 77:
        result = -[EMFPlayer playStretchBlt:in_pRecord:](self, "playStretchBlt:in_pRecord:");
        break;
      case 78:
        result = -[EMFPlayer playMaskBlt:in_pRecord:](self, "playMaskBlt:in_pRecord:");
        break;
      case 79:
        result = -[EMFPlayer playPlgBlt:in_pRecord:](self, "playPlgBlt:in_pRecord:");
        break;
      case 80:
        result = -[EMFPlayer playSetDIBitsToDevice:in_pRecord:](self, "playSetDIBitsToDevice:in_pRecord:");
        break;
      case 81:
        result = -[EMFPlayer playStretchDIBits:in_pRecord:](self, "playStretchDIBits:in_pRecord:");
        break;
      case 82:
        result = -[EMFPlayer playExtCreateFontIndirectW:in_pRecord:](self, "playExtCreateFontIndirectW:in_pRecord:");
        break;
      case 83:
        result = -[EMFPlayer playExtTextOutA:in_pRecord:](self, "playExtTextOutA:in_pRecord:");
        break;
      case 84:
        result = -[EMFPlayer playExtTextOutW:in_pRecord:](self, "playExtTextOutW:in_pRecord:");
        break;
      case 93:
        result = -[EMFPlayer playCreateMonoBrush:in_pRecord:](self, "playCreateMonoBrush:in_pRecord:");
        break;
      case 94:
        result = -[EMFPlayer playCreateDibPatternBrushPT:in_pRecord:](self, "playCreateDibPatternBrushPT:in_pRecord:");
        break;
      case 95:
        result = -[EMFPlayer playExtCreatePen:in_pRecord:](self, "playExtCreatePen:in_pRecord:");
        break;
      case 114:
        result = -[EMFPlayer playAlphaBlend:in_pRecord:](self, "playAlphaBlend:in_pRecord:");
        break;
      case 120:
        result = -[EMFPlayer playSetTextJustification:in_pRecord:](self, "playSetTextJustification:in_pRecord:");
        break;
      default:
        result = -[EMFPlayer playUnknown:in_recordType:in_pRecord:](self, "playUnknown:in_recordType:in_pRecord:");
        break;
    }
  }
  else
  {
    if (v7 != 1)
      return -7;
    return -[EMFPlayer playHeader:in_pRecord:](self, "playHeader:in_pRecord:");
  }
  return result;
}

- (int)playHeader:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v5;
  int v6;
  int v8;
  uint64_t v11;
  uint64_t v12;
  int v13;
  double v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;

  if (a3 < 0x58)
    return -7;
  v6 = *((_DWORD *)a4 + 20);
  v5 = *((_DWORD *)a4 + 21);
  if (!v6 || v5 == 0)
    return -7;
  v11 = *((unsigned int *)a4 + 15);
  v12 = *((unsigned int *)a4 + 16);
  v13 = *((unsigned __int16 *)a4 + 28);
  v14 = (double)*((int *)a4 + 18) / ((double)v6 * 100.0);
  v15 = (double)*((int *)a4 + 19) / ((double)v5 * 100.0);
  -[MFGraphicsDevice setViewBox:top:width:height:](self->m_gdi, "setViewBox:top:width:height:", v14 * (double)*((int *)a4 + 6), v15 * (double)*((int *)a4 + 7), v14 * (double)(*((_DWORD *)a4 + 8) - *((_DWORD *)a4 + 6)), v15 * (double)(*((_DWORD *)a4 + 9) - *((_DWORD *)a4 + 7)));
  if (v13)
    v16 = (v13 + 1);
  else
    v16 = 0xFFFFLL;
  -[MFGraphicsDevice setMaximumObjectTableSize:](self->m_gdi, "setMaximumObjectTableSize:", v16);
  v8 = 0;
  if ((_DWORD)v11)
  {
    if ((_DWORD)v12)
    {
      v17 = v12 + v11;
      v8 = -7;
      if (!HIDWORD(v17) && v17 <= a3)
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", &a4[v12], v11, 10);
        v8 = -[MFGraphicsDevice description:](self->m_gdi, "description:", v18);

      }
    }
  }
  self->m_headerDone = 1;
  return v8;
}

- (int)playUnknown:(unsigned int)a3 in_recordType:(unsigned int)a4 in_pRecord:(const char *)a5
{
  return 0;
}

- (int)playUnsupported:(unsigned int)a3 in_recordName:(const char *)a4 in_pRecord:(const char *)a5
{
  return 0;
}

- (int)playSetWindowExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10)
    return -[MFGraphicsDevice setWindowExt:in_y:](self->m_gdi, "setWindowExt:in_y:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3));
  else
    return -7;
}

- (int)playSetWindowOrg:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10)
    return -[MFGraphicsDevice setWindowOrg:in_y:](self->m_gdi, "setWindowOrg:in_y:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3));
  else
    return -7;
}

- (int)playScaleWindowExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x18)
    return -[MFGraphicsDevice scaleWindowExt:in_xDenom:in_yNum:in_yDenom:](self->m_gdi, "scaleWindowExt:in_xDenom:in_yNum:in_yDenom:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3), *((unsigned int *)a4 + 4), *((unsigned int *)a4 + 5));
  else
    return -7;
}

- (int)playSetWorldTransform:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v4;
  uint64_t v5;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  _QWORD v15[12];

  if (a3 < 0x20)
    return -7;
  v15[10] = v4;
  v15[11] = v5;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 8);
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 12, v9);
  *(double *)&v15[1] = v10;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 16);
  *(double *)&v15[2] = v11;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 20);
  *(double *)&v15[3] = v12;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 24);
  *(double *)&v15[4] = v13;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 28);
  *(double *)&v15[5] = v14;
  return -[MFGraphicsDevice setWorldTransform:](self->m_gdi, "setWorldTransform:", v15);
}

- (int)playModifyWorldTransform:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v4;
  uint64_t v5;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  _QWORD v15[12];

  if (a3 < 0x24)
    return -7;
  v15[10] = v4;
  v15[11] = v5;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 8);
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 12, v9);
  *(double *)&v15[1] = v10;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 16);
  *(double *)&v15[2] = v11;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 20);
  *(double *)&v15[3] = v12;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 24);
  *(double *)&v15[4] = v13;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 28);
  *(double *)&v15[5] = v14;
  return -[MFGraphicsDevice modifyWorldTransform:in_command:](self->m_gdi, "modifyWorldTransform:in_command:", v15, *((unsigned int *)a4 + 8));
}

- (int)playSetViewportExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10)
    return -[MFGraphicsDevice setViewportExt:in_y:](self->m_gdi, "setViewportExt:in_y:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3));
  else
    return -7;
}

- (int)playSetViewportOrg:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10)
    return -[MFGraphicsDevice setViewportOrg:in_y:](self->m_gdi, "setViewportOrg:in_y:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3));
  else
    return -7;
}

- (int)playScaleViewportExt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x18)
    return -[MFGraphicsDevice scaleViewportExt:in_xDenom:in_yNum:in_yDenom:](self->m_gdi, "scaleViewportExt:in_xDenom:in_yNum:in_yDenom:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3), *((unsigned int *)a4 + 4), *((unsigned int *)a4 + 5));
  else
    return -7;
}

- (int)playSelectPalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v5;
  MFGraphicsDevice *m_gdi;

  if (a3 < 0xC)
    return -7;
  v5 = *((_DWORD *)a4 + 2);
  m_gdi = self->m_gdi;
  if (v5 < 0)
    return -[MFGraphicsDevice getStockObject:](m_gdi, "getStockObject:", v5 ^ 0x80000000);
  else
    return -[MFGraphicsDevice selectObject:](m_gdi, "selectObject:");
}

- (int)playSelectObject:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v5;
  MFGraphicsDevice *m_gdi;

  if (a3 < 0xC)
    return -7;
  v5 = *((_DWORD *)a4 + 2);
  m_gdi = self->m_gdi;
  if (v5 < 0)
    return -[MFGraphicsDevice getStockObject:](m_gdi, "getStockObject:", v5 ^ 0x80000000);
  else
    return -[MFGraphicsDevice selectObject:](m_gdi, "selectObject:");
}

- (int)playDeleteObject:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xC)
    return -[MFGraphicsDevice deleteObject:](self->m_gdi, "deleteObject:", *((unsigned int *)a4 + 2));
  else
    return -7;
}

- (int)playCreatePen:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (a3 < 0x1C)
    return -7;
  v7 = *((unsigned int *)a4 + 3);
  v6 = *((unsigned int *)a4 + 4);
  v8 = *((unsigned int *)a4 + 2);
  +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", *((unsigned __int8 *)a4 + 24), *((unsigned __int8 *)a4 + 25), *((unsigned __int8 *)a4 + 26));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFGraphicsDevice createPen:width:in_colour:in_userStyleArray:index:](self->m_gdi, "createPen:width:in_colour:in_userStyleArray:index:", v7, v6, v9, 0, v8);

  return v4;
}

- (int)playExtCreatePen:(unsigned int)a3 in_pRecord:(const char *)a4
{
  unsigned int v5;
  int v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  void *v14;
  uint64_t v15;
  double *v16;

  if (a3 < 0x34)
    return -7;
  v5 = *((_DWORD *)a4 + 12);
  if (4 * v5 > 0xFFFFFFCB)
    return -7;
  if (v5 >> 30 || 4 * v5 + 52 > a3)
    return -7;
  v10 = *((unsigned int *)a4 + 2);
  v12 = *((unsigned int *)a4 + 7);
  v11 = *((unsigned int *)a4 + 8);
  if (v5)
  {
    v13 = (double *)malloc_type_malloc(8 * *((unsigned int *)a4 + 12), 0xD809582AuLL);
    if (!v13)
      return -4;
  }
  else
  {
    v13 = 0;
  }
  +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", *((unsigned __int8 *)a4 + 40), *((unsigned __int8 *)a4 + 41), *((unsigned __int8 *)a4 + 42));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v15 = 0;
    v16 = v13;
    do
    {
      *v16++ = (double)(a4[(v15 + 52)] | ((unint64_t)a4[(v15 + 53)] << 8) | ((unint64_t)a4[(v15 + 54)] << 16) | ((unint64_t)a4[(v15 + 55)] << 24));
      v15 += 4;
    }
    while (4 * v5 != v15);
  }
  v7 = -[MFGraphicsDevice createPen:width:in_colour:in_userStyleArray:index:](self->m_gdi, "createPen:width:in_colour:in_userStyleArray:index:", v12, v11, v14, v13, v10);
  if (v13)
    free(v13);

  return v7;
}

- (int)playCreatePalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v5;
  int v6;
  uint64_t v8;
  void *v9;
  unsigned __int8 *v10;
  void *v11;

  if (a3 < 0xC)
    return -7;
  v5 = *((unsigned __int16 *)a4 + 7);
  if (4 * v5 + 16 > a3)
    return -7;
  v8 = *((unsigned int *)a4 + 2);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", *((unsigned __int16 *)a4 + 7));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10 = (unsigned __int8 *)(a4 + 18);
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
  v6 = -[MFGraphicsDevice createPalette:in_index:](self->m_gdi, "createPalette:in_index:", v9, v8);

  return v6;
}

- (int)playSetPaletteEntries:(unsigned int)a3 in_pRecord:(const char *)a4
{
  unsigned int v5;
  int v7;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;

  if (a3 < 0x14)
    return -7;
  v5 = *((_DWORD *)a4 + 4);
  if (4 * v5 > 0xFFFFFFEB)
    return -7;
  if (v5 >> 30 || 4 * v5 + 20 > a3)
    return -7;
  v10 = *((unsigned int *)a4 + 2);
  v11 = *((unsigned int *)a4 + 3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", *((unsigned int *)a4 + 4));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13 = 20;
    do
    {
      +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", a4[v13], a4[v13 + 1], a4[v13 + 2]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v14);

      v13 += 4;
      --v5;
    }
    while (v5);
  }
  v7 = -[MFGraphicsDevice setPaletteEntries:in_colours:in_index:](self->m_gdi, "setPaletteEntries:in_colours:in_index:", v11, v12, v10);

  return v7;
}

- (int)playResizePalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10)
    return -[MFGraphicsDevice resizePalette:in_index:](self->m_gdi, "resizePalette:in_index:", *((unsigned int *)a4 + 3), *((unsigned int *)a4 + 2));
  else
    return -7;
}

- (int)playRealizePalette:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8)
    return -[MFGraphicsDevice realizePalette](self->m_gdi, "realizePalette");
  else
    return -7;
}

- (int)playExtCreateFontIndirectW:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  uint64_t v6;
  const char *v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  int v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  char IsValidCharSet;
  char v28;
  unsigned int v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  int v35;
  int v36;
  int v37;
  char v38;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  int v47;
  _WORD v48[64];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0x149)
    return -7;
  v6 = 0;
  v44 = *((_DWORD *)a4 + 4);
  v45 = *((_DWORD *)a4 + 3);
  v42 = *((_DWORD *)a4 + 6);
  v43 = *((_DWORD *)a4 + 5);
  v40 = *((_DWORD *)a4 + 2);
  v41 = *((_DWORD *)a4 + 7);
  v35 = *((unsigned __int8 *)a4 + 32);
  v36 = *((unsigned __int8 *)a4 + 33);
  v37 = *((unsigned __int8 *)a4 + 34);
  v38 = a4[37];
  v34 = *((unsigned __int8 *)a4 + 38);
  v7 = a4 + 41;
  v8 = *((unsigned __int8 *)a4 + 39);
  v46 = *((unsigned __int8 *)a4 + 36);
  v47 = *((unsigned __int8 *)a4 + 35);
  do
  {
    v9 = *(unsigned __int16 *)(v7 - 1);
    v48[v6] = v9;
    if (!v9)
      break;
    v7 += 2;
    ++v6;
  }
  while (v6 != 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v48);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = (void *)v10;
  v13 = a4 + 105;
  do
  {
    v14 = *(unsigned __int16 *)(v13 - 1);
    v48[v11] = v14;
    if (!v14)
      break;
    v13 += 2;
    ++v11;
  }
  while (v11 != 64);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v48);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = (void *)v15;
  v18 = a4 + 233;
  do
  {
    v19 = *(unsigned __int16 *)(v18 - 1);
    v48[v16] = v19;
    if (!v19)
      break;
    v18 += 2;
    ++v16;
  }
  while (v16 != 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v48);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *((_DWORD *)a4 + 74);
  v22 = *((_DWORD *)a4 + 75);
  v23 = *((_DWORD *)a4 + 76);
  v24 = *((_DWORD *)a4 + 78);
  v25 = *((_DWORD *)a4 + 79);
  IsValidCharSet = ChValueIsValidCharSet(v47);
  if (v8 >= 0x60 || v46 >= 0xB)
    v28 = 0;
  else
    v28 = IsValidCharSet;
  if ((v28 & 1) != 0)
  {
    v29 = v34;
    if (v34 >= 5)
      v29 = 0;
    LODWORD(v33) = v8 & 0xF0;
    BYTE4(v32) = v38;
    HIDWORD(v31) = v47;
    LODWORD(v32) = v46;
    BYTE1(v31) = v37 != 0;
    LOBYTE(v31) = v36 != 0;
    v4 = -[MFGraphicsDevice createFontIndirectW:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:index:](self->m_gdi, "createFontIndirectW:lfWidth:lfEscapement:lfOrientation:lfWeight:lfItalic:lfUnderline:lfStrikeOut:lfCharSet:lfOutPrecision:lfClipPrecision:lfQuality:pitch:family:lfFaceName:elfFullName:elfStyle:elfVersion:elfStyleSize:elfMatch:elfVendorId:elfCulture:index:", v45, v44, v43, v42, v41, v35 != 0, v31, v32, __PAIR64__(v8 & 3, v29), v33, v12, v17, v20, __PAIR64__(v22, v21), __PAIR64__(v24, v23),
           __PAIR64__(v40, v25));
  }
  else
  {
    v4 = -7;
  }

  return v4;
}

- (int)playCreateBrushIndirect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  int v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;

  if (a3 < 0x18)
    return -7;
  v7 = *((unsigned __int8 *)a4 + 8);
  v8 = *((unsigned __int8 *)a4 + 9);
  v9 = *((unsigned __int8 *)a4 + 10);
  v10 = *((unsigned __int8 *)a4 + 11);
  v11 = *((_DWORD *)a4 + 3);
  +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", *((unsigned __int8 *)a4 + 16), *((unsigned __int8 *)a4 + 17), *((unsigned __int8 *)a4 + 18));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 > 9)
  {
    v4 = -7;
  }
  else
  {
    v13 = *((_DWORD *)a4 + 5);
    if (v13 >= 6)
      v14 = 0xFFFFFFLL;
    else
      v14 = v13;
    v4 = -[MFGraphicsDevice createBrush:in_colour:hatchstyle:index:](self->m_gdi, "createBrush:in_colour:hatchstyle:index:", dword_22A4C0828[v11], v12, v14, v7 | (v8 << 8) | (v9 << 16) | (v10 << 24));
  }

  return v4;
}

- (int)playCreateMonoBrush:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (a3 < 0x20)
    return -7;
  v5 = *((unsigned int *)a4 + 4);
  v4 = *((unsigned int *)a4 + 5);
  if ((int)v5 + (int)v4 > a3)
    return -7;
  v6 = *((unsigned int *)a4 + 6);
  v7 = v6 + *((unsigned int *)a4 + 7);
  if ((v7 | (unint64_t)(v5 + v4)) >> 32 || v7 > a3)
    return -7;
  v12 = *((unsigned int *)a4 + 2);
  -[MFGraphicsDevice createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_gdi, "createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", &a4[v5], *((unsigned int *)a4 + 5), &a4[v6]);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v9 = -[MFGraphicsDevice createPatternBrush:index:usePaletteForBilevel:](self->m_gdi, "createPatternBrush:index:usePaletteForBilevel:", v13, v12, 0);
  else
    v9 = -7;

  return v9;
}

- (int)playCreateDibPatternBrushPT:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (a3 < 0x20)
    return -7;
  v5 = *((unsigned int *)a4 + 4);
  v4 = *((unsigned int *)a4 + 5);
  if ((int)v5 + (int)v4 > a3)
    return -7;
  v6 = *((unsigned int *)a4 + 6);
  v7 = v6 + *((unsigned int *)a4 + 7);
  if ((v7 | (unint64_t)(v5 + v4)) >> 32 || v7 > a3)
    return -7;
  v12 = *((unsigned int *)a4 + 2);
  -[MFGraphicsDevice createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_gdi, "createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", &a4[v5], *((unsigned int *)a4 + 5), &a4[v6]);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v9 = -[MFGraphicsDevice createPatternBrush:index:usePaletteForBilevel:](self->m_gdi, "createPatternBrush:index:usePaletteForBilevel:", v13, v12, 1);
  else
    v9 = -7;

  return v9;
}

- (int)playExtTextOut:(unsigned int)a3 in_pRecord:(const char *)a4 wideChars:(BOOL)a5
{
  int v5;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  BOOL v18;
  unint64_t v19;
  BOOL v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  _WORD *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  char *v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  int v37;
  int v38;
  int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0x38)
    return -7;
  if (a5)
    v9 = 2;
  else
    v9 = 1;
  v10 = *((unsigned int *)a4 + 11);
  v11 = *((unsigned int *)a4 + 12);
  v12 = *((unsigned __int8 *)a4 + 52);
  if ((v12 & 6) != 0)
  {
    v14 = *((unsigned int *)a4 + 14);
    v13 = *((_DWORD *)a4 + 15);
    v15 = *((_DWORD *)a4 + 16);
    v16 = *((_DWORD *)a4 + 17);
  }
  else
  {
    v14 = 0;
    v13 = 0;
    v15 = 0;
    v16 = 0;
  }
  v17 = v10 * (unint64_t)v9;
  v18 = (v17 & 0xFFFFFFFF00000000) != 0;
  v19 = v11 + v17;
  v5 = -7;
  if (HIDWORD(v19))
    v20 = 1;
  else
    v20 = v19 > a3;
  if (!v20 && !v18)
  {
    v21 = *((unsigned __int8 *)a4 + 53);
    v38 = *((unsigned __int8 *)a4 + 54);
    v39 = v21;
    v37 = *((unsigned __int8 *)a4 + 55);
    v22 = *((_DWORD *)a4 + 9);
    v40 = *((_DWORD *)a4 + 10);
    v41 = v22;
    v23 = *((_DWORD *)a4 + 18);
    v43 = v15;
    v44 = v13;
    v42 = v16;
    if (a5)
    {
      MEMORY[0x24BDAC7A8](self);
      v25 = (char *)&v36 - v24;
      if ((_DWORD)v10)
      {
        v26 = v10;
        v27 = v25;
        do
        {
          *v27++ = a4[v11] | (a4[(v11 + 1)] << 8);
          LODWORD(v11) = v11 + 2;
          --v26;
        }
        while (v26);
      }
      if ((v12 & 0x10) != 0)
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
      else
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MFGraphicsDevice getCurrentFont](self->m_gdi, "getCurrentFont");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithBytes:length:", &a4[v11], v10);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v30 = 0;
    v31 = 0;
    if (v23 && a3 > v23)
    {
      if ((a3 - v23) >> 2 >= v10)
        v31 = v10;
      else
        v31 = (a3 - v23) >> 2;
      if (!v31 || (v32 = (char *)malloc_type_malloc(4 * v31, 0xD809582AuLL), (v30 = v32) == 0))
      {
        v5 = -4;
        goto LABEL_34;
      }
      v33 = 0;
      do
      {
        *(_DWORD *)&v32[v33] = a4[v23 + v33] | (a4[v23
                                                                                                 + 1
                                                                                                 + v33] << 8) | (a4[v23 + 2 + v33] << 16) | (a4[v23 + 3 + v33] << 24);
        v33 += 4;
      }
      while (4 * v31 != v33);
    }
    LODWORD(v35) = v31;
    v5 = -[MFGraphicsDevice extTextOut:y:in_text:options:left:top:right:bottom:spacingValues:numValues:](self->m_gdi, "extTextOut:y:in_text:options:left:top:right:bottom:spacingValues:numValues:", v41, v40, v29, (v38 << 16) | (v39 << 8) | (v37 << 24) | v12, v14, v44, __PAIR64__(v42, v43), v30, v35);
    free(v30);
LABEL_34:

  }
  return v5;
}

- (int)playExtTextOutA:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return -[EMFPlayer playExtTextOut:in_pRecord:wideChars:](self, "playExtTextOut:in_pRecord:wideChars:", *(_QWORD *)&a3, a4, 0);
}

- (int)playExtTextOutW:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return -[EMFPlayer playExtTextOut:in_pRecord:wideChars:](self, "playExtTextOut:in_pRecord:wideChars:", *(_QWORD *)&a3, a4, 1);
}

- (int)playSetTextAlign:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xC)
    return -[MFGraphicsDevice setTextAlign:textHorizontalAlign:textVerticalAlign:textDirection:](self->m_gdi, "setTextAlign:textHorizontalAlign:textVerticalAlign:textDirection:", a4[8] & 1, a4[8] & 6, a4[8] & 0x18, (a4[9] & 1) << 8);
  else
    return -7;
}

- (int)playSetTextColour:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  void *v6;

  if (a3 < 0xC)
    return -7;
  +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", *((unsigned __int8 *)a4 + 8), *((unsigned __int8 *)a4 + 9), *((unsigned __int8 *)a4 + 10));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFGraphicsDevice setTextColour:](self->m_gdi, "setTextColour:", v6);

  return v4;
}

- (int)playSetTextJustification:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10)
    return -[MFGraphicsDevice setTextJustification:in_breakCount:](self->m_gdi, "setTextJustification:in_breakCount:", *((unsigned int *)a4 + 3), *((unsigned int *)a4 + 2));
  else
    return -7;
}

- (int)playSetBkColour:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  void *v6;

  if (a3 < 0xC)
    return -7;
  +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", *((unsigned __int8 *)a4 + 8), *((unsigned __int8 *)a4 + 9), *((unsigned __int8 *)a4 + 10));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MFGraphicsDevice setBkColour:](self->m_gdi, "setBkColour:", v6);

  return v4;
}

- (int)playOffsetClipRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10)
    return -[MFGraphicsDevice offsetClipRegionByX:y:](self->m_gdi, "offsetClipRegionByX:y:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3));
  else
    return -7;
}

- (int)playSetBkMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xC || (*((_DWORD *)a4 + 2) - 1) > 1)
    return -7;
  else
    return -[MFGraphicsDevice setBkMode:](self->m_gdi, "setBkMode:");
}

- (int)playSetBrushOrg:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10)
    return -[MFGraphicsDevice setBrushOrg:y:](self->m_gdi, "setBrushOrg:y:", (double)*((int *)a4 + 2), (double)*((int *)a4 + 3));
  else
    return -7;
}

- (int)playSetMapMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xC || (*((_DWORD *)a4 + 2) - 1) > 7)
    return -7;
  else
    return -[MFGraphicsDevice setMapMode:](self->m_gdi, "setMapMode:");
}

- (int)playPolyDraw:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  int result;
  _BOOL4 v8;
  unsigned int v10;
  unsigned int v11;
  unint64_t v12;
  char v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  char v18;
  int v19;
  int v20[2];
  int v21[2];
  int v22[2];
  uint64_t v23;
  uint64_t v24;

  if (a3 < 0x1C)
    return -7;
  v23 = v5;
  v24 = v6;
  v8 = a5;
  v10 = *((_DWORD *)a4 + 6);
  if (a5)
    v11 = 5;
  else
    v11 = 9;
  v12 = v10 * (unint64_t)v11;
  if (v12 > 0xFFFFFFE3)
    return -7;
  result = -7;
  if ((int)v12 + 28 <= a3 && (v12 & 0xFFFFFFFF00000000) == 0)
  {
    if (a5)
      v14 = 2;
    else
      v14 = 3;
    if (v10)
    {
      v15 = 0;
      v16 = (v10 << v14) + 28;
      do
      {
        *(_QWORD *)v22 = 0;
        v17 = v15 + v16;
        v18 = a4[v15 + v16];
        parsePoint((uint64_t)(a4 + 28), v15, &v22[1], v22, v8);
        v19 = v18 & 0xFE;
        switch(v19)
        {
          case 6:
            result = -[MFGraphicsDevice moveTo:y:](self->m_gdi, "moveTo:y:", (double)v22[1], (double)v22[0]);
            break;
          case 4:
            *(_QWORD *)v20 = 0;
            *(_QWORD *)v21 = 0;
            if (v10 - v15 <= 2 && (a4[v17 + 1] & 0xFE) == 6 && (a4[v17 + 2] & 0xFE) == 6)
            {
              parsePoint((uint64_t)(a4 + 28), v15 + 1, &v21[1], v21, v8);
              v15 += 2;
              parsePoint((uint64_t)(a4 + 28), v15, &v20[1], v20, v8);
              result = -[MFGraphicsDevice bezierTo:y:x2:y2:x3:y3:](self->m_gdi, "bezierTo:y:x2:y2:x3:y3:", v22[1], v22[0], v21[1], v21[0], v20[1], v20[0]);
              v18 = a4[v15 + v16];
            }
            else
            {
              result = -7;
            }
            break;
          case 2:
            result = -[MFGraphicsDevice lineTo:y:](self->m_gdi, "lineTo:y:", (double)v22[1], (double)v22[0]);
            break;
          default:
            return -7;
        }
        if (result)
          break;
        if ((v18 & 1) != 0)
        {
          result = -[MFGraphicsDevice closeCurrentPath:](self->m_gdi, "closeCurrentPath:", 1);
          if (result)
            break;
        }
        result = 0;
        ++v15;
      }
      while (v15 < v10);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int)playPolyBezier:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  int result;
  _BOOL4 v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20[2];
  int v21[2];
  int v22[2];
  int v23[2];
  uint64_t v24;
  uint64_t v25;

  if (a3 < 0x1C)
    return -7;
  v24 = v5;
  v25 = v6;
  v8 = a5;
  if (a5)
    v9 = 4;
  else
    v9 = 8;
  v10 = *((_DWORD *)a4 + 6);
  v11 = v10 * (unint64_t)v9;
  if (v11 > 0xFFFFFFE3)
    return -7;
  result = -7;
  if (v10)
  {
    if ((int)v11 + 28 <= a3 && (v11 & 0xFFFFFFFF00000000) == 0 && -1431655765 * v10 + 1431655765 <= 0x55555555)
    {
      *(_QWORD *)v22 = 0;
      *(_QWORD *)v23 = 0;
      *(_QWORD *)v20 = 0;
      *(_QWORD *)v21 = 0;
      v13 = a4 + 28;
      parsePoint((uint64_t)(a4 + 28), 0, &v23[1], v23, a5);
      result = 0;
      if (v10 >= 2)
      {
        v14 = v23[0];
        v15 = v23[1];
        v16 = 1;
        while (1)
        {
          parsePoint((uint64_t)v13, v16, &v22[1], v22, v8);
          parsePoint((uint64_t)v13, v16 + 1, &v21[1], v21, v8);
          v17 = v16 + 2;
          parsePoint((uint64_t)v13, v17, &v20[1], v20, v8);
          v19 = v20[0];
          v18 = v20[1];
          result = -[MFGraphicsDevice bezier:y:x2:y2:x3:y3:x4:y4:](self->m_gdi, "bezier:y:x2:y2:x3:y3:x4:y4:", v15, v14, v22[1], v22[0], v21[1], v21[0], __PAIR64__(v20[0], v20[1]));
          if (result)
            break;
          v16 = v17 + 1;
          v15 = v18;
          v14 = v19;
          if (v16 >= v10)
            return 0;
        }
      }
    }
  }
  return result;
}

- (int)playPolyBezierTo:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  int result;
  _BOOL4 v8;
  unsigned int v10;
  unsigned int v11;
  unint64_t v12;
  BOOL v14;
  unsigned int v15;
  const char *v16;
  int v17[2];
  int v18[2];
  int v19[2];
  uint64_t v20;
  uint64_t v21;

  if (a3 < 0x1C)
    return -7;
  v20 = v5;
  v21 = v6;
  v8 = a5;
  if (a5)
    v10 = 4;
  else
    v10 = 8;
  v11 = *((_DWORD *)a4 + 6);
  v12 = v11 * (unint64_t)v10;
  result = -7;
  v14 = -1431655765 * v11 > 0x55555555 || v11 == 0 || (int)v12 + 28 > a3;
  if (!v14 && (v12 & 0xFFFFFFFF00000000) == 0 && v12 <= 0xFFFFFFE3)
  {
    v15 = 0;
    *(_QWORD *)v18 = 0;
    *(_QWORD *)v19 = 0;
    *(_QWORD *)v17 = 0;
    v16 = a4 + 28;
    while (v15 < v11)
    {
      parsePoint((uint64_t)v16, v15, &v19[1], v19, v8);
      parsePoint((uint64_t)v16, v15 + 1, &v18[1], v18, v8);
      parsePoint((uint64_t)v16, v15 + 2, &v17[1], v17, v8);
      result = -[MFGraphicsDevice bezierTo:y:x2:y2:x3:y3:](self->m_gdi, "bezierTo:y:x2:y2:x3:y3:", v19[1], v19[0], v18[1], v18[0], v17[1], v17[0]);
      v15 += 3;
      if (result)
        return result;
    }
    return 0;
  }
  return result;
}

- (int)playPolygon:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  int result;
  _BOOL4 v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  double *v12;
  double *v13;
  uint64_t v14;
  const char *v15;
  double *v16;
  double v17;
  int v18;
  int v19[2];

  result = -7;
  if (a3 >= 0x1C && a4)
  {
    v8 = a5;
    if (a5)
      v9 = 4;
    else
      v9 = 8;
    v10 = *((unsigned int *)a4 + 6);
    v11 = v10 * (unint64_t)v9;
    if (v11 <= 0xFFFFFFE3 && (int)v11 + 28 <= a3 && (v11 & 0xFFFFFFFF00000000) == 0)
    {
      if (v10 < 2)
      {
        return 0;
      }
      else
      {
        v12 = (double *)malloc_type_malloc(16 * *((unsigned int *)a4 + 6), 0xD809582AuLL);
        if (v12)
        {
          v13 = v12;
          v14 = 0;
          *(_QWORD *)v19 = 0;
          v15 = a4 + 28;
          v16 = v12 + 1;
          do
          {
            parsePoint((uint64_t)v15, v14, &v19[1], v19, v8);
            v17 = (double)v19[0];
            *(v16 - 1) = (double)v19[1];
            *v16 = v17;
            ++v14;
            v16 += 2;
          }
          while (v10 != v14);
          v18 = -[MFGraphicsDevice polygon:in_count:](self->m_gdi, "polygon:in_count:", v13, v10);
          free(v13);
          return v18;
        }
        else
        {
          return -4;
        }
      }
    }
  }
  return result;
}

- (int)playPolyLine:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  unsigned int v6;
  int result;
  uint64_t v9;
  unint64_t v10;
  _BOOL4 v11;
  double *v12;
  double *v13;
  uint64_t v14;
  const char *v15;
  double *v16;
  double v17;
  int v18;
  int v19[2];

  if (a5)
    v6 = 4;
  else
    v6 = 8;
  result = -7;
  if (a3 >= 0x1C)
  {
    if (a4)
    {
      v9 = *((unsigned int *)a4 + 6);
      if (v9 >= 2)
      {
        v10 = v9 * (unint64_t)v6;
        if (v10 <= 0xFFFFFFE3 && (v10 & 0xFFFFFFFF00000000) == 0 && (int)v10 + 28 <= a3)
        {
          v11 = a5;
          v12 = (double *)malloc_type_malloc(16 * *((unsigned int *)a4 + 6), 0xD809582AuLL);
          if (v12)
          {
            v13 = v12;
            v14 = 0;
            *(_QWORD *)v19 = 0;
            v15 = a4 + 28;
            v16 = v12 + 1;
            do
            {
              parsePoint((uint64_t)v15, v14, &v19[1], v19, v11);
              v17 = (double)v19[0];
              *(v16 - 1) = (double)v19[1];
              *v16 = v17;
              ++v14;
              v16 += 2;
            }
            while (v9 != v14);
            v18 = -[MFGraphicsDevice polyline:in_count:](self->m_gdi, "polyline:in_count:", v13, v9);
            free(v13);
            return v18;
          }
          else
          {
            return -4;
          }
        }
      }
    }
  }
  return result;
}

- (int)playPolyLineTo:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  int result;
  _BOOL4 v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  int v13;
  const char *v14;
  int v15[2];
  uint64_t v16;
  uint64_t v17;

  if (a3 < 2)
    return -7;
  v16 = v5;
  v17 = v6;
  v8 = a5;
  if (a5)
    v9 = 4;
  else
    v9 = 8;
  v10 = *((_DWORD *)a4 + 6);
  v11 = v10 * (unint64_t)v9;
  if (v11 > 0xFFFFFFE3)
    return -7;
  result = -7;
  if ((int)v11 + 28 <= a3 && (v11 & 0xFFFFFFFF00000000) == 0)
  {
    if (v10)
    {
      v13 = 0;
      v14 = a4 + 28;
      *(_QWORD *)v15 = 0;
      while (1)
      {
        parsePoint((uint64_t)v14, v13, &v15[1], v15, v8);
        result = -[MFGraphicsDevice lineTo:y:](self->m_gdi, "lineTo:y:", (double)v15[1], (double)v15[0]);
        if (result)
          break;
        if (v10 == ++v13)
          return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int)playRoundRect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x20)
    return -[MFGraphicsDevice roundRect:top:right:bottom:rx:ry:](self->m_gdi, "roundRect:top:right:bottom:rx:ry:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3), *((unsigned int *)a4 + 4), *((unsigned int *)a4 + 5), (double)*((int *)a4 + 6) * 0.5, (double)*((int *)a4 + 7) * 0.5);
  else
    return -7;
}

- (int)playSetStretchBltMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 < 0xC || (*((_DWORD *)a4 + 2) - 1) > 3)
    return -7;
  else
    return -[MFGraphicsDevice setStretchBltMode:](self->m_gdi, "setStretchBltMode:");
}

- (int)playSaveDC:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 8)
    return -[MFGraphicsDevice saveDC](self->m_gdi, "saveDC");
  else
    return -7;
}

- (int)playRestoreDC:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xC)
    return -[MFGraphicsDevice restoreDC:](self->m_gdi, "restoreDC:", *((unsigned int *)a4 + 2));
  else
    return -7;
}

- (int)playLineTo:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10)
    return -[MFGraphicsDevice lineTo:y:](self->m_gdi, "lineTo:y:", (double)*((int *)a4 + 2), (double)*((int *)a4 + 3));
  else
    return -7;
}

- (int)playMoveToEx:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x10)
    return -[MFGraphicsDevice moveTo:y:](self->m_gdi, "moveTo:y:", (double)*((int *)a4 + 2), (double)*((int *)a4 + 3));
  else
    return -7;
}

- (int)playSetArcDirection:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xC)
    return -[MFGraphicsDevice setArcDirection:](self->m_gdi, "setArcDirection:", *((unsigned int *)a4 + 2));
  else
    return -7;
}

- (int)playArc:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x28)
    return -[MFGraphicsDevice arc:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_gdi, "arc:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3), *((unsigned int *)a4 + 4), *((unsigned int *)a4 + 5), *((unsigned int *)a4 + 6), *((unsigned int *)a4 + 7), *((_QWORD *)a4 + 4));
  else
    return -7;
}

- (int)playArcTo:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x28)
    return -[MFGraphicsDevice arcTo:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_gdi, "arcTo:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3), *((unsigned int *)a4 + 4), *((unsigned int *)a4 + 5), *((unsigned int *)a4 + 6), *((unsigned int *)a4 + 7), *((_QWORD *)a4 + 4));
  else
    return -7;
}

- (int)playChord:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x28)
    return -[MFGraphicsDevice chord:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_gdi, "chord:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3), *((unsigned int *)a4 + 4), *((unsigned int *)a4 + 5), *((unsigned int *)a4 + 6), *((unsigned int *)a4 + 7), *((_QWORD *)a4 + 4));
  else
    return -7;
}

- (int)playPie:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x28)
    return -[MFGraphicsDevice pie:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:](self->m_gdi, "pie:nTopRect:nRightRect:nBottomRect:nXStartArc:nYStartArc:nXEndArc:nYEndArc:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3), *((unsigned int *)a4 + 4), *((unsigned int *)a4 + 5), *((unsigned int *)a4 + 6), *((unsigned int *)a4 + 7), *((_QWORD *)a4 + 4));
  else
    return -7;
}

- (int)playEllipse:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x18)
    return -[MFGraphicsDevice ellipse:y1:x2:y2:](self->m_gdi, "ellipse:y1:x2:y2:", *((unsigned int *)a4 + 4), *((unsigned int *)a4 + 5), *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3));
  else
    return -7;
}

- (int)playRectangle:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x18)
    return -[MFGraphicsDevice rectangle:y1:x2:y2:](self->m_gdi, "rectangle:y1:x2:y2:", *((unsigned int *)a4 + 2), *((unsigned int *)a4 + 3), *((unsigned int *)a4 + 4), *((unsigned int *)a4 + 5));
  else
    return -7;
}

- (int)playPolyPolygon:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  _BOOL4 v5;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  int v14;
  double *v16;
  char *v17;
  void *v18;
  uint64_t v19;
  unsigned int v20;
  int v21;
  int v22;
  uint64_t v24;
  const char *v25;
  double *v26;
  double v27;
  int v28[2];

  if (a3 < 0x20)
    return -7;
  v5 = a5;
  v7 = a5 ? 4 : 8;
  v8 = *((unsigned int *)a4 + 6);
  v9 = *((_DWORD *)a4 + 7);
  v10 = 4 * v8;
  v11 = v9 * (unint64_t)v7;
  v12 = (v11 & 0xFFFFFFFF00000000) != 0;
  v13 = (v11 & 0xFFFFFFFC) + (unint64_t)(4 * v8 + 32);
  if (HIDWORD(v13))
    return -7;
  v14 = -7;
  if (!(v8 >> 30) && v10 <= 0xFFFFFFDF && !v12 && v13 <= a3)
  {
    if (v9)
    {
      v16 = (double *)malloc_type_malloc(16 * *((unsigned int *)a4 + 7), 0xD809582AuLL);
      if ((_DWORD)v8)
      {
LABEL_12:
        v17 = (char *)malloc_type_malloc(4 * v8, 0xD809582AuLL);
        v18 = v17;
        if (v16 && v17)
        {
          v19 = 0;
          v20 = 0;
          while (1)
          {
            v21 = a4[(v19 + 32)] | (a4[(v19 + 33)] << 8) | (a4[(v19 + 34)] << 16) | (a4[(v19 + 35)] << 24);
            *(_DWORD *)&v17[v19] = v21;
            v20 += v21;
            if (v21 <= 1)
              break;
            v19 += 4;
            if (4 * v8 == v19)
            {
              v22 = 0;
              goto LABEL_28;
            }
          }
          v22 = -7;
LABEL_28:
          if (v20 <= v9)
            v14 = v22;
          else
            v14 = -7;
          if (!v14)
          {
            if (v9)
            {
              v24 = 0;
              v25 = &a4[v10 + 32];
              v26 = v16 + 1;
              do
              {
                *(_QWORD *)v28 = 0;
                parsePoint((uint64_t)v25, v24, &v28[1], v28, v5);
                v27 = (double)v28[0];
                *(v26 - 1) = (double)v28[1];
                *v26 = v27;
                ++v24;
                v26 += 2;
              }
              while (v9 != v24);
            }
            v14 = -[MFGraphicsDevice polyPolygon:in_polyCounts:in_count:](self->m_gdi, "polyPolygon:in_polyCounts:in_count:", v16, v18, v8);
          }
          free(v16);
          free(v18);
          return v14;
        }
LABEL_22:
        if (v16)
          free(v16);
        if (v18)
          free(v18);
        return -4;
      }
    }
    else
    {
      v16 = 0;
      if ((_DWORD)v8)
        goto LABEL_12;
    }
    v18 = 0;
    goto LABEL_22;
  }
  return v14;
}

- (int)playPolyPolyLine:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  _BOOL4 v5;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  int v14;
  uint64_t v16;
  double *v17;
  char *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  int v23;
  uint64_t v25;
  const char *v26;
  double *v27;
  double v28;
  int v29[2];

  if (a3 < 0x20)
    return -7;
  v5 = a5;
  v7 = a5 ? 4 : 8;
  v8 = *((unsigned int *)a4 + 6);
  v9 = *((_DWORD *)a4 + 7);
  v10 = 4 * v8;
  v11 = v9 * (unint64_t)v7;
  v12 = (v11 & 0xFFFFFFFF00000000) != 0;
  v13 = (v11 & 0xFFFFFFFC) + (unint64_t)(4 * v8 + 32);
  if (HIDWORD(v13))
    return -7;
  v14 = -7;
  if (!(v8 >> 30) && v10 <= 0xFFFFFFDF && !v12 && v13 <= a3)
  {
    v16 = v9;
    if (v9)
    {
      v17 = (double *)malloc_type_malloc(16 * v9, 0xD809582AuLL);
      if ((_DWORD)v8)
      {
LABEL_12:
        v18 = (char *)malloc_type_malloc(4 * v8, 0xD809582AuLL);
        v19 = v18;
        if (v17 && v18)
        {
          v20 = 0;
          v21 = 0;
          while (1)
          {
            v22 = a4[(v20 + 32)] | (a4[(v20 + 33)] << 8) | (a4[(v20 + 34)] << 16) | (a4[(v20 + 35)] << 24);
            *(_DWORD *)&v18[v20] = v22;
            v21 += v22;
            if (v22 <= 1)
              break;
            v20 += 4;
            if (4 * v8 == v20)
            {
              v23 = 0;
              goto LABEL_28;
            }
          }
          v23 = -7;
LABEL_28:
          if (v21 <= v9)
            v14 = v23;
          else
            v14 = -7;
          if (!v14)
          {
            if (v9)
            {
              v25 = 0;
              v26 = &a4[v10 + 32];
              v27 = v17 + 1;
              do
              {
                *(_QWORD *)v29 = 0;
                parsePoint((uint64_t)v26, v25, &v29[1], v29, v5);
                v28 = (double)v29[0];
                *(v27 - 1) = (double)v29[1];
                *v27 = v28;
                ++v25;
                v27 += 2;
              }
              while (v16 != v25);
            }
            v14 = -[MFGraphicsDevice polyPolyline:in_polyCounts:in_count:](self->m_gdi, "polyPolyline:in_polyCounts:in_count:", v17, v19, v8);
          }
          free(v17);
          free(v19);
          return v14;
        }
LABEL_22:
        if (v17)
          free(v17);
        if (v19)
          free(v19);
        return -4;
      }
    }
    else
    {
      v17 = 0;
      if ((_DWORD)v8)
        goto LABEL_12;
    }
    v19 = 0;
    goto LABEL_22;
  }
  return v14;
}

- (int)playAngleArc:(unsigned int)a3 in_pRecord:(const char *)a4 in_is16bit:(BOOL)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  double v12;
  float v13;

  if (a3 < 0x1C)
    return -7;
  v8 = *((unsigned int *)a4 + 2);
  v9 = *((unsigned int *)a4 + 3);
  v10 = *((unsigned int *)a4 + 4);
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 20, a5);
  v12 = v11;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 24);
  return -[MFGraphicsDevice angleArc:y:radius:startAngle:sweepAngle:](self->m_gdi, "angleArc:y:radius:startAngle:sweepAngle:", v8, v9, v10, v12, v13);
}

- (int)playBitBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v11;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  const char *v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  double v33[6];

  if (a3 < 0x64)
    return -7;
  v5 = *((unsigned int *)a4 + 21);
  v6 = *((unsigned int *)a4 + 22);
  if ((int)v5 + (int)v6 > a3)
    return -7;
  v8 = *((unsigned int *)a4 + 23);
  v7 = *((unsigned int *)a4 + 24);
  v9 = v8 + v7;
  if ((v9 | (unint64_t)(v5 + v6)) >> 32 || v9 > a3)
    return -7;
  v32 = *((_DWORD *)a4 + 20);
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 52);
  v33[0] = v14;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 56);
  v33[1] = v15;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 60);
  v33[2] = v16;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 64);
  v33[3] = v17;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 68);
  v33[4] = v18;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 72);
  v33[5] = v19;
  v30 = *((_DWORD *)a4 + 7);
  v31 = *((_DWORD *)a4 + 6);
  v20 = *((_DWORD *)a4 + 10);
  v28 = *((_DWORD *)a4 + 9);
  v29 = *((_DWORD *)a4 + 8);
  v22 = *((unsigned int *)a4 + 11);
  v21 = *((_DWORD *)a4 + 12);
  v23 = &a4[v5];
  v24 = *((_DWORD *)a4 + 19);
  -[MFGraphicsDevice createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_gdi, "createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", v23, v6, &a4[v8], v7, v32);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
  {
    LODWORD(v27) = v24;
    v11 = -[MFGraphicsDevice bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:](self->m_gdi, "bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:", v31, v30, v29, v28, v25, v22, __PAIR64__(v20, v21), v33, v27);
  }
  else
  {
    v11 = -7;
  }

  return v11;
}

- (int)playStretchBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v11;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  const char *v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  double v35[6];

  if (a3 < 0x6C)
    return -7;
  v5 = *((unsigned int *)a4 + 21);
  v6 = *((unsigned int *)a4 + 22);
  if ((int)v5 + (int)v6 > a3)
    return -7;
  v8 = *((unsigned int *)a4 + 23);
  v7 = *((unsigned int *)a4 + 24);
  v9 = v8 + v7;
  if ((v9 | (unint64_t)(v5 + v6)) >> 32 || v9 > a3)
    return -7;
  v34 = *((_DWORD *)a4 + 20);
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 52);
  v35[0] = v14;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 56);
  v35[1] = v15;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 60);
  v35[2] = v16;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 64);
  v35[3] = v17;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 68);
  v35[4] = v18;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 72);
  v35[5] = v19;
  v32 = *((_DWORD *)a4 + 7);
  v33 = *((_DWORD *)a4 + 6);
  v20 = *((_DWORD *)a4 + 10);
  v30 = *((_DWORD *)a4 + 9);
  v31 = *((_DWORD *)a4 + 8);
  v21 = *((_DWORD *)a4 + 25);
  v22 = *((_DWORD *)a4 + 26);
  v28 = *((_DWORD *)a4 + 12);
  v29 = *((_DWORD *)a4 + 11);
  v23 = &a4[v5];
  v24 = *((_DWORD *)a4 + 19);
  -[MFGraphicsDevice createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_gdi, "createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", v23, v6, &a4[v8], v7, v34);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
  {
    LODWORD(v27) = v24;
    v11 = -[MFGraphicsDevice stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:](self->m_gdi, "stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:", v33, v32, v31, v30, v25, v29, __PAIR64__(v21, v28), __PAIR64__(v20, v22), v35, v27);
  }
  else
  {
    v11 = -7;
  }

  return v11;
}

- (int)playAlphaBlend:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v11;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  unsigned int v20;
  int v21;
  char v22;
  int v23;
  const char *v24;
  const char *v25;
  int v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  double v38[6];

  if (a3 < 0x6C)
    return -7;
  v6 = *((unsigned int *)a4 + 21);
  v5 = *((unsigned int *)a4 + 22);
  if ((int)v6 + (int)v5 > a3)
    return -7;
  v8 = *((unsigned int *)a4 + 23);
  v7 = *((unsigned int *)a4 + 24);
  v9 = v8 + v7;
  if ((v9 | (unint64_t)(v6 + v5)) >> 32 || v9 > a3)
    return -7;
  v37 = *((_DWORD *)a4 + 20);
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 52);
  v38[0] = v14;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 56);
  v38[1] = v15;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 60);
  v38[2] = v16;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 64);
  v38[3] = v17;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 68);
  v38[4] = v18;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 72);
  v38[5] = v19;
  v35 = *((_DWORD *)a4 + 7);
  v36 = *((_DWORD *)a4 + 6);
  v33 = *((_DWORD *)a4 + 9);
  v34 = *((_DWORD *)a4 + 8);
  v31 = *((_DWORD *)a4 + 12);
  v32 = *((_DWORD *)a4 + 11);
  v20 = *((_DWORD *)a4 + 25);
  v21 = *((_DWORD *)a4 + 26);
  v22 = a4[42];
  v23 = *((unsigned __int8 *)a4 + 43);
  v24 = &a4[v6];
  v25 = &a4[v8];
  v26 = *((_DWORD *)a4 + 19);
  -[MFGraphicsDevice createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_gdi, "createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", v24, v5, v25, v7, v37);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
  {
    LODWORD(v30) = v26;
    BYTE5(v29) = v23 == 1;
    BYTE4(v29) = v22;
    LODWORD(v29) = v21;
    v11 = -[MFGraphicsDevice alphaBlend:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_sourceConstantOpacity:in_useSourceAlphaChannel:in_xform:in_colour:](self->m_gdi, "alphaBlend:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_sourceConstantOpacity:in_useSourceAlphaChannel:in_xform:in_colour:", v36, v35, v34, v33, v27, v32, __PAIR64__(v20, v31), v29, v38, v30);
  }
  else
  {
    v11 = -7;
  }

  return v11;
}

- (int)playMaskBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unint64_t v14;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  const char *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int v42;
  double v43[7];

  if (a3 < 0x80)
    return -7;
  v6 = *((unsigned int *)a4 + 21);
  v5 = *((unsigned int *)a4 + 22);
  if ((int)v6 + (int)v5 > a3)
    return -7;
  v7 = *((unsigned int *)a4 + 23);
  v8 = *((unsigned int *)a4 + 24);
  v9 = v7 + v8;
  if (v9 > a3)
    return -7;
  v10 = *((unsigned int *)a4 + 28);
  v11 = v10 + *((unsigned int *)a4 + 29);
  if (v11 > a3)
    return -7;
  v14 = *((unsigned int *)a4 + 30) + (unint64_t)*((unsigned int *)a4 + 31);
  v12 = -7;
  if (v14 <= a3 && !((v14 | v11 | (v6 + v5) | v9) >> 32))
  {
    v40 = *((unsigned int *)a4 + 30);
    v41 = *((_DWORD *)a4 + 31);
    v42 = *((_DWORD *)a4 + 29);
    v39 = *((_DWORD *)a4 + 20);
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 52);
    v43[0] = v16;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 56);
    v43[1] = v17;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 60);
    v43[2] = v18;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 64);
    v43[3] = v19;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 68);
    v43[4] = v20;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 72);
    v43[5] = v21;
    v37 = *((_DWORD *)a4 + 7);
    v38 = *((_DWORD *)a4 + 6);
    v35 = *((_DWORD *)a4 + 9);
    v36 = *((_DWORD *)a4 + 8);
    v32 = *((_DWORD *)a4 + 25);
    v33 = *((_DWORD *)a4 + 12);
    v34 = *((_DWORD *)a4 + 11);
    v30 = *((_DWORD *)a4 + 10);
    v31 = *((_DWORD *)a4 + 26);
    v22 = &a4[v7];
    v23 = *((_DWORD *)a4 + 19);
    -[MFGraphicsDevice createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_gdi, "createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", &a4[v6], v5, v22, v8, v39);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFGraphicsDevice createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_gdi, "createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", &a4[v10], v42, &a4[v40], v41, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    v12 = -7;
    if (v24 && v25)
    {
      LODWORD(v29) = v23;
      LODWORD(v28) = v30;
      LODWORD(v27) = v33;
      v12 = -[MFGraphicsDevice maskBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_maskImage:in_xMask:in_yMask:in_rop:in_xform:in_colour:](self->m_gdi, "maskBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_maskImage:in_xMask:in_yMask:in_rop:in_xform:in_colour:", v38, v37, v36, v35, v24, v34, v27, v25, __PAIR64__(v31, v32), v28, v43, v29);
    }

  }
  return v12;
}

- (int)playPlgBlt:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unint64_t v14;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  uint64_t v21;
  float v22;
  double *v23;
  double v24;
  const char *v25;
  const char *v26;
  int v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  uint64_t v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  double v41[6];
  int v42[2];
  _BYTE v43[8];
  _QWORD v44[7];

  v44[5] = *MEMORY[0x24BDAC8D0];
  if (a3 < 0x8C)
    return -7;
  v6 = *((unsigned int *)a4 + 24);
  v5 = *((unsigned int *)a4 + 25);
  if ((int)v6 + (int)v5 > a3)
    return -7;
  v8 = *((unsigned int *)a4 + 26);
  v7 = *((unsigned int *)a4 + 27);
  v9 = v8 + v7;
  if (v9 > a3)
    return -7;
  v10 = *((unsigned int *)a4 + 31);
  v11 = v10 + *((unsigned int *)a4 + 32);
  if (v11 > a3)
    return -7;
  v14 = *((unsigned int *)a4 + 33) + (unint64_t)*((unsigned int *)a4 + 34);
  v12 = -7;
  if (v14 <= a3 && !((v14 | v11 | (v6 + v5) | v9) >> 32))
  {
    v37 = *((unsigned int *)a4 + 33);
    v38 = *((_DWORD *)a4 + 34);
    v39 = *((_DWORD *)a4 + 32);
    v40 = *((_DWORD *)a4 + 23);
    *(_QWORD *)v42 = 0;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 64);
    v41[0] = v16;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 68);
    v41[1] = v17;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 72);
    v41[2] = v18;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 76);
    v41[3] = v19;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 80);
    v41[4] = v20;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 82);
    v21 = 0;
    v41[5] = v22;
    v23 = (double *)v44;
    do
    {
      parsePoint32((uint64_t)(a4 + 24), v21, &v42[1], v42);
      v24 = (double)v42[0];
      *(v23 - 1) = (double)v42[1];
      *v23 = v24;
      ++v21;
      v23 += 2;
    }
    while (v21 != 3);
    HIDWORD(v32) = *((_DWORD *)a4 + 29);
    v33 = *((_DWORD *)a4 + 28);
    v25 = &a4[v6];
    v26 = &a4[v8];
    v27 = *((_DWORD *)a4 + 22);
    v35 = *((_DWORD *)a4 + 13);
    v36 = *((_DWORD *)a4 + 12);
    v28 = *((unsigned int *)a4 + 15);
    v34 = *((_DWORD *)a4 + 14);
    -[MFGraphicsDevice createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_gdi, "createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", v25, v5, v26, v7, v40);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFGraphicsDevice createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_gdi, "createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", &a4[v10], v39, &a4[v37], v38, 0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    v12 = -7;
    if (v29 && v30)
    {
      LODWORD(v32) = v27;
      v12 = -[MFGraphicsDevice plgBlt:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_maskImage:in_xMask:in_yMask:in_xform:in_colour:](self->m_gdi, "plgBlt:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_maskImage:in_xMask:in_yMask:in_xform:in_colour:", v43, v29, v36, v35, v34, v28, v30, __PAIR64__(HIDWORD(v32), v33), v41, v32);
    }

  }
  return v12;
}

- (int)playSetDIBitsToDevice:(unsigned int)a3 in_pRecord:(const char *)a4
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  BOOL v18;
  int v19;
  uint64_t v20;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;

  if (a3 < 0x4C)
    return -7;
  v6 = *((unsigned int *)a4 + 12);
  v5 = *((unsigned int *)a4 + 13);
  if ((int)v6 + (int)v5 > a3)
    return -1;
  v7 = *((unsigned int *)a4 + 14);
  v8 = v7 + *((unsigned int *)a4 + 15);
  if ((v8 | (unint64_t)(v6 + v5)) >> 32 || v8 > a3)
    return -1;
  v11 = *((_DWORD *)a4 + 9);
  v12 = *((_DWORD *)a4 + 11);
  v13 = *((_DWORD *)a4 + 17);
  if (v11 >= v13)
    v14 = 0;
  else
    v14 = v11 - v13;
  v15 = v12 - v14;
  v16 = *((_DWORD *)a4 + 18) + v13;
  v17 = v12 + v11;
  v18 = __OFSUB__(v16, v17);
  v19 = v16 - v17;
  if (v19 < 0 == v18)
    v19 = 0;
  v20 = (v19 + v15);
  if ((int)v20 < 1)
    return 0;
  v22 = *((unsigned int *)a4 + 6);
  v23 = *((_DWORD *)a4 + 7);
  v24 = *((unsigned int *)a4 + 8);
  v25 = *((unsigned int *)a4 + 10);
  -[MFGraphicsDevice createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_gdi, "createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", &a4[v6], *((unsigned int *)a4 + 13), &a4[v7]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    LODWORD(v28) = 0;
    LODWORD(v27) = v14 + v11;
    HIDWORD(v27) = 13369344;
    v4 = -[MFGraphicsDevice bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:](self->m_gdi, "bitBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_rop:in_xform:in_colour:", v22, (v14 + v23), v25, v20, v26, v24, v27, 0, v28);
  }
  else
  {
    v4 = -7;
  }

  return v4;
}

- (int)playStretchDIBits:(unsigned int)a3 in_pRecord:(const char *)a4
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;

  if (a3 < 0x50)
    return -7;
  v6 = *((unsigned int *)a4 + 12);
  v5 = *((unsigned int *)a4 + 13);
  if ((int)v6 + (int)v5 > a3)
    return -7;
  v7 = *((unsigned int *)a4 + 14) + (unint64_t)*((unsigned int *)a4 + 15);
  if ((v7 | (v6 + v5)) >> 32 || v7 > a3)
    return -7;
  v23 = *((_DWORD *)a4 + 6);
  v12 = *((unsigned int *)a4 + 8);
  v22 = *((_DWORD *)a4 + 7);
  v13 = *((unsigned int *)a4 + 18);
  v14 = *((unsigned int *)a4 + 19);
  v15 = *((_DWORD *)a4 + 9);
  v16 = *((_DWORD *)a4 + 10);
  v17 = *((_DWORD *)a4 + 11);
  v18 = *((_DWORD *)a4 + 17);
  -[MFGraphicsDevice createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:](self->m_gdi, "createDIBitmap:in_headerSize:in_bitmap:in_bitmapSize:in_usage:", &a4[v6]);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
  {
    BYTE4(v21) = 1;
    LODWORD(v21) = 0;
    v9 = -[MFGraphicsDevice stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:usePaletteForBilevel:](self->m_gdi, "stretchBlt:in_yDest:in_widthDest:in_heightDest:in_sourceImage:in_xSrc:in_ySrc:in_widthSrc:in_heightSrc:in_rop:in_xform:in_colour:usePaletteForBilevel:", v23, v22, v13, v14, v19, v12, __PAIR64__(v16, v15), __PAIR64__(v18, v17), 0, v21);
  }
  else
  {
    v9 = -7;
  }

  return v9;
}

- (int)playSetPolyFillMode:(unsigned int)a3 in_pRecord:(const char *)a4
{
  MFGraphicsDevice *m_gdi;
  uint64_t v6;

  if (a3 < 0xC)
    return -7;
  m_gdi = self->m_gdi;
  if (*((_DWORD *)a4 + 2) == 1)
    v6 = 1;
  else
    v6 = 2;
  return -[MFGraphicsDevice setPolyFillMode:](m_gdi, "setPolyFillMode:", v6);
}

- (int)playSetMiterLimit:(unsigned int)a3 in_pRecord:(const char *)a4
{
  float v6;

  if (a3 < 0xC)
    return -7;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a4, 8);
  return -[MFGraphicsDevice setMiterLimit:](self->m_gdi, "setMiterLimit:", v6);
}

- (int)playSetRop2:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xC)
    return -[MFGraphicsDevice setRop2:](self->m_gdi, "setRop2:", *((unsigned int *)a4 + 2));
  else
    return -7;
}

- (int)playBeginPath:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return -[MFGraphicsDevice beginPath](self->m_gdi, "beginPath", *(_QWORD *)&a3, a4);
}

- (int)playAbortPath:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return -[MFGraphicsDevice abortPath](self->m_gdi, "abortPath", *(_QWORD *)&a3, a4);
}

- (int)playEndPath:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return -[MFGraphicsDevice endPath](self->m_gdi, "endPath", *(_QWORD *)&a3, a4);
}

- (int)playWidenPath:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return -[MFGraphicsDevice widenPath](self->m_gdi, "widenPath", *(_QWORD *)&a3, a4);
}

- (int)playCloseFigure:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return -[MFGraphicsDevice closeCurrentPath:](self->m_gdi, "closeCurrentPath:", 0, a4);
}

- (int)playStrokeAndFillPath:(unsigned int)a3 in_pRecord:(const char *)a4 in_stroke:(BOOL)a5 in_fill:(BOOL)a6
{
  return -[MFGraphicsDevice strokeAndFillPath:in_fill:](self->m_gdi, "strokeAndFillPath:in_fill:", a5, a6);
}

- (int)playSelectClipPath:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0xC)
    return -[MFGraphicsDevice selectClipPath:](self->m_gdi, "selectClipPath:", *((unsigned int *)a4 + 2));
  else
    return -7;
}

- (int)playSelectClipRegion:(unsigned int)a3 in_pRecord:(const char *)a4
{
  unsigned int v5;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (a3 < 0x10)
    return -7;
  v5 = *((_DWORD *)a4 + 2);
  if (v5 > 0xFFFFFFEF || v5 + 16 > a3)
    return -7;
  v8 = *((unsigned int *)a4 + 3);
  parseRegion(v5, (const unsigned __int8 *)a4 + 16);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v7 = -[MFGraphicsDevice selectClipRegionWithRects:in_mode:](self->m_gdi, "selectClipRegionWithRects:in_mode:", v9, v8);
  else
    v7 = -7;

  return v7;
}

- (int)playFillRgn:(unsigned int)a3 in_pRecord:(const char *)a4
{
  unsigned int v5;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (a3 < 0x20)
    return -7;
  v5 = *((_DWORD *)a4 + 6);
  if (v5 > 0xFFFFFFDF || v5 + 32 > a3)
    return -7;
  v8 = *((unsigned int *)a4 + 7);
  parseRegion(v5, (const unsigned __int8 *)a4 + 32);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v7 = -[MFGraphicsDevice fillRgnWithRects:in_brushID:](self->m_gdi, "fillRgnWithRects:in_brushID:", v9, v8);
  else
    v7 = -7;

  return v7;
}

- (int)playPaintRgn:(unsigned int)a3 in_pRecord:(const char *)a4
{
  unsigned int v5;
  int v7;
  uint64_t v8;
  void *v9;

  if (a3 < 0x1C)
    return -7;
  v5 = *((_DWORD *)a4 + 6);
  if (v5 > 0xFFFFFFE3 || v5 + 28 > a3)
    return -7;
  parseRegion(v5, (const unsigned __int8 *)a4 + 28);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v7 = -[MFGraphicsDevice paintRgnWithRects:](self->m_gdi, "paintRgnWithRects:", v8);
  else
    v7 = -7;

  return v7;
}

- (int)playInvertRgn:(unsigned int)a3 in_pRecord:(const char *)a4
{
  unsigned int v5;
  int v7;
  uint64_t v8;
  void *v9;

  if (a3 < 0x1C)
    return -7;
  v5 = *((_DWORD *)a4 + 6);
  if (v5 > 0xFFFFFFE3 || v5 + 28 > a3)
    return -7;
  parseRegion(v5, (const unsigned __int8 *)a4 + 28);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v7 = -[MFGraphicsDevice invertRgnWithRects:](self->m_gdi, "invertRgnWithRects:", v8);
  else
    v7 = -7;

  return v7;
}

- (int)playExcludeClipRect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x18)
    return -[MFGraphicsDevice excludeClipRect:](self->m_gdi, "excludeClipRect:", (double)*((int *)a4 + 2), (double)*((int *)a4 + 3), (double)*((int *)a4 + 4), (double)*((int *)a4 + 5));
  else
    return -7;
}

- (int)playIntersectClipRect:(unsigned int)a3 in_pRecord:(const char *)a4
{
  if (a3 >= 0x18)
    return -[MFGraphicsDevice intersectClipRect:](self->m_gdi, "intersectClipRect:", (double)*((int *)a4 + 2), (double)*((int *)a4 + 3), (double)(*((_DWORD *)a4 + 4) - *((_DWORD *)a4 + 2)), (double)(*((_DWORD *)a4 + 5) - *((_DWORD *)a4 + 3)));
  else
    return -7;
}

- (int)playSetMetaRgn:(unsigned int)a3 in_pRecord:(const char *)a4
{
  return -[MFGraphicsDevice setMetaRgn](self->m_gdi, "setMetaRgn", *(_QWORD *)&a3, a4);
}

+ (CGRect)boundsInLogicalUnits:(id)a3
{
  id v3;
  int *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v3 = objc_retainAutorelease(a3);
  v4 = (int *)objc_msgSend(v3, "bytes");
  if ((unint64_t)objc_msgSend(v3, "length") > 0x4F)
  {
    v9 = (double)v4[18] / ((double)v4[20] * 100.0);
    v10 = (double)v4[19] / ((double)v4[21] * 100.0);
    v5 = v9 * (double)v4[6];
    v6 = v10 * (double)v4[7];
    v7 = v9 * (double)v4[8] - v5;
    v8 = v10 * (double)v4[9] - v6;
  }
  else
  {
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v11 = v5;
  v12 = v6;
  v13 = v7;
  v14 = v8;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_emfPlusPlayer, 0);
  objc_storeStrong((id *)&self->m_gdi, 0);
}

@end
