@implementation MFBitmap

- (BOOL)isEmpty
{
  return self->m_bmpData == 0;
}

- (void)writeFileHeader
{
  int v3;
  int v4;
  _DWORD *v5;

  v3 = -[NSMutableData length](self->m_bmpData, "length");
  v4 = self->m_infoHeaderSize + self->m_paletteSize + 14;
  v5 = -[NSMutableData mutableBytes](self->m_bmpData, "mutableBytes");
  *v5 = 19778;
  MFWriteUInt32ToByteArray((uint64_t)v5, v3, 2u);
  MFWriteUInt32ToByteArray((uint64_t)v5, 0, 6u);
  MFWriteUInt32ToByteArray((uint64_t)v5, 0, 8u);
  MFWriteUInt32ToByteArray((uint64_t)v5, v4, 0xAu);
}

- (void)setMonoPalette:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (self->m_bitsPerPixel == 1)
  {
    v7 = v4;
    objc_msgSend(v4, "getTextColour");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFBitmap writePaletteEntry:in_index:](self, "writePaletteEntry:in_index:", v5, 0);

    objc_msgSend(v7, "getBkColour");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFBitmap writePaletteEntry:in_index:](self, "writePaletteEntry:in_index:", v6, 1);

    v4 = v7;
  }

}

- (void)setNull
{
  NSMutableData *m_bmpData;

  self->m_infoHeaderSize = 0;
  self->m_paletteSize = 0;
  self->m_bitsPerPixel = 0;
  self->m_isOS2 = 0;
  m_bmpData = self->m_bmpData;
  self->m_bmpData = 0;

}

- (BOOL)parseHeader:(const char *)a3 in_headerSize:(unsigned int)a4
{
  unsigned int v4;
  int v5;

  v4 = *(_DWORD *)a3;
  self->m_infoHeaderSize = *(_DWORD *)a3;
  self->m_isOS2 = v4 == 12;
  if (v4 != 12)
  {
    if (v4 >= 0x28 && v4 <= a4)
    {
      self->m_width = *((_DWORD *)a3 + 1);
      self->m_height = *((_DWORD *)a3 + 2);
      self->m_bitsPerPixel = *((unsigned __int16 *)a3 + 7);
      v5 = *((_DWORD *)a3 + 4);
      goto LABEL_10;
    }
    return 0;
  }
  if (a4 < 0xC)
    return 0;
  v5 = 0;
  self->m_width = (__int16)(*((unsigned __int8 *)a3 + 5) << 8) | *((unsigned __int8 *)a3 + 4);
  self->m_height = (__int16)(*((unsigned __int8 *)a3 + 7) << 8) | *((unsigned __int8 *)a3 + 6);
  self->m_bitsPerPixel = *((unsigned __int16 *)a3 + 5);
LABEL_10:
  self->m_compression = v5;
  return 1;
}

- (void)writePaletteEntry:(id)a3 in_index:(int)a4
{
  id v6;
  int v7;
  char *v8;
  uint64_t m_infoHeaderSize;
  char *v10;
  char v11;
  __int16 v12;

  v6 = a3;
  v12 = 0;
  v11 = 0;
  if (self->m_isOS2)
    v7 = 3;
  else
    v7 = 4;
  if (v7 + v7 * a4 <= self->m_paletteSize)
  {
    v8 = -[NSMutableData mutableBytes](self->m_bmpData, "mutableBytes");
    m_infoHeaderSize = self->m_infoHeaderSize;
    objc_msgSend(v6, "getRGBBytes:green:blue:", (char *)&v12 + 1, &v12, &v11);
    v10 = &v8[m_infoHeaderSize + (v7 * a4)];
    v10[14] = v11;
    *(_WORD *)(v10 + 15) = v12;
  }

}

- (void)writeInfoHeader
{
  void *v3;

  v3 = -[NSMutableData mutableBytes](self->m_bmpData, "mutableBytes") + 14;
  MFWriteUInt32ToByteArray((uint64_t)v3, 40, 0);
  MFWriteUInt32ToByteArray((uint64_t)v3, self->m_width, 4u);
  MFWriteUInt32ToByteArray((uint64_t)v3, self->m_height, 8u);
  MFWriteUInt16ToByteArray((uint64_t)v3, 1, 0xCu);
  MFWriteUInt16ToByteArray((uint64_t)v3, self->m_bitsPerPixel, 0xEu);
  MFWriteUInt32ToByteArray((uint64_t)v3, 0, 0x10u);
  MFWriteUInt32ToByteArray((uint64_t)v3, 0, 0x14u);
  MFWriteUInt32ToByteArray((uint64_t)v3, 0, 0x18u);
  MFWriteUInt32ToByteArray((uint64_t)v3, 0, 0x1Cu);
  MFWriteUInt32ToByteArray((uint64_t)v3, 0, 0x20u);
  MFWriteUInt32ToByteArray((uint64_t)v3, 0, 0x24u);
}

- (unsigned)coloursUsed:(const char *)a3 in_headerSize:(unsigned int)a4 in_usage:(int)a5
{
  unsigned int m_bitsPerPixel;
  unsigned int result;

  m_bitsPerPixel = self->m_bitsPerPixel;
  if (m_bitsPerPixel > 8)
    return 0;
  if (self->m_isOS2)
    return 1 << m_bitsPerPixel;
  result = *((_DWORD *)a3 + 8);
  if (!result)
    return 1 << m_bitsPerPixel;
  return result;
}

- (unsigned)pixelDataOffset:(const char *)a3 in_headerSize:(unsigned int)a4 in_usage:(int)a5
{
  unsigned int m_paletteSize;

  m_paletteSize = self->m_paletteSize;
  if (a5 && self->m_bitsPerPixel <= 8)
    m_paletteSize = 2
                  * -[MFBitmap coloursUsed:in_headerSize:in_usage:](self, "coloursUsed:in_headerSize:in_usage:", a3, *(_QWORD *)&a4);
  return self->m_infoHeaderSize + m_paletteSize;
}

- (void)appendDIBPalette:(id)a3 in_header:(const char *)a4 in_headerSize:(unsigned int)a5 in_usage:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  unsigned int v18;
  void *v19;
  BOOL v20;
  uint64_t m_infoHeaderSize;
  uint64_t v22;
  uint64_t v23;
  unsigned int m_paletteSize;
  id v25;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v25 = a3;
  if (self->m_bitsPerPixel > 8)
  {
    if (self->m_compression == 3
      && (self->m_paletteSize = 12,
          m_infoHeaderSize = self->m_infoHeaderSize,
          (int)m_infoHeaderSize + 12 <= v7))
    {
      -[NSMutableData appendBytes:length:](self->m_bmpData, "appendBytes:length:", &a4[m_infoHeaderSize], 12);
    }
    else
    {
      self->m_paletteSize = 0;
    }
  }
  else
  {
    v10 = -[MFBitmap coloursUsed:in_headerSize:in_usage:](self, "coloursUsed:in_headerSize:in_usage:", a4, v7, v6);
    v11 = v10;
    if (self->m_isOS2)
      v12 = 3;
    else
      v12 = 4;
    v13 = v12 * v10;
    self->m_paletteSize = v13;
    if ((_DWORD)v6)
    {
      objc_msgSend(v25, "getSelectedPalette");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableData increaseLengthBy:](self->m_bmpData, "increaseLengthBy:", self->m_paletteSize);
      if (v11)
      {
        v15 = self->m_infoHeaderSize;
        v16 = &a4[v7];
        if (&a4[v15 + 2] <= v16)
        {
          v17 = &a4[v15 + 4];
          v18 = 1;
          do
          {
            objc_msgSend(v14, "getColour:", *((unsigned __int16 *)v17 - 2));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFBitmap writePaletteEntry:in_index:](self, "writePaletteEntry:in_index:", v19, v18 - 1);

            if (v18 >= v11)
              break;
            ++v18;
            v20 = v17 > v16;
            v17 += 2;
          }
          while (!v20);
        }
      }

    }
    else
    {
      v22 = self->m_infoHeaderSize;
      if (v13 >= (int)v7 - (int)v22)
        v23 = (v7 - v22);
      else
        v23 = v13;
      -[NSMutableData appendBytes:length:](self->m_bmpData, "appendBytes:length:", &a4[v22], v23);
      m_paletteSize = self->m_paletteSize;
      if (m_paletteSize > v23)
        -[NSMutableData increaseLengthBy:](self->m_bmpData, "increaseLengthBy:", m_paletteSize - v23);
    }
  }

}

- (BOOL)processDIBHeader:(id)a3 in_header:(const char *)a4 in_headerSize:(unsigned int)a5 in_usage:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  NSMutableData *v11;
  NSMutableData *m_bmpData;
  void *v13;
  int v14;
  BOOL v15;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v10 = a3;
  if (!a4 || !(_DWORD)v7)
    goto LABEL_12;
  if (-[MFBitmap parseHeader:in_headerSize:](self, "parseHeader:in_headerSize:", a4, v7))
  {
    if (self->m_width && self->m_height && self->m_bitsPerPixel)
    {
      v11 = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 14);
      m_bmpData = self->m_bmpData;
      self->m_bmpData = v11;

      -[NSMutableData appendBytes:length:](self->m_bmpData, "appendBytes:length:", a4, self->m_infoHeaderSize);
      if (self->m_infoHeaderSize == 40)
      {
        v13 = -[NSMutableData mutableBytes](self->m_bmpData, "mutableBytes");
        v14 = llround(2834.64567);
        MFWriteUInt32ToByteArray((uint64_t)v13, v14, 0x26u);
        MFWriteUInt32ToByteArray((uint64_t)v13, v14, 0x2Au);
      }
      -[MFBitmap appendDIBPalette:in_header:in_headerSize:in_usage:](self, "appendDIBPalette:in_header:in_headerSize:in_usage:", v10, a4, v7, v6);
      goto LABEL_13;
    }
LABEL_12:
    -[MFBitmap setNull](self, "setNull");
LABEL_13:
    v15 = 1;
    goto LABEL_14;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (MFBitmap)init
{
  MFBitmap *v2;
  MFBitmap *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFBitmap;
  v2 = -[MFBitmap init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MFBitmap setNull](v2, "setNull");
  return v3;
}

- (MFBitmap)initWithDIBitmap:(id)a3 in_dib:(const char *)a4 in_dibSize:(unsigned int)a5 in_usage:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  MFBitmap *v11;
  id *p_isa;
  unsigned int v13;
  MFBitmap *v14;
  objc_super v16;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MFBitmap;
  v11 = -[MFBitmap init](&v16, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (!v11)
  {
LABEL_8:
    v14 = p_isa;
    goto LABEL_9;
  }
  if (-[MFBitmap processDIBHeader:in_header:in_headerSize:in_usage:](v11, "processDIBHeader:in_header:in_headerSize:in_usage:", v10, a4, v7, v6))
  {
    if ((objc_msgSend(p_isa, "isEmpty") & 1) == 0)
    {
      v13 = objc_msgSend(p_isa, "pixelDataOffset:in_headerSize:in_usage:", a4, v7, v6);
      if (v7 <= v13)
      {
        objc_msgSend(p_isa, "setNull");
      }
      else
      {
        objc_msgSend(p_isa[5], "appendBytes:length:", &a4[v13], v7 - v13);
        objc_msgSend(p_isa, "writeFileHeader");
      }
    }
    goto LABEL_8;
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (MFBitmap)initWithDIBitmap:(id)a3 in_header:(const char *)a4 in_headerSize:(unsigned int)a5 in_bitmap:(const char *)a6 in_bitmapSize:(unsigned int)a7 in_usage:(int)a8
{
  uint64_t v8;
  uint64_t v11;
  id v14;
  MFBitmap *v15;
  id *p_isa;
  MFBitmap *v17;
  objc_super v19;

  v8 = *(_QWORD *)&a8;
  v11 = *(_QWORD *)&a5;
  v14 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MFBitmap;
  v15 = -[MFBitmap init](&v19, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    if (a6 && a7)
    {
      if (!-[MFBitmap processDIBHeader:in_header:in_headerSize:in_usage:](v15, "processDIBHeader:in_header:in_headerSize:in_usage:", v14, a4, v11, v8))
      {
        v17 = 0;
        goto LABEL_9;
      }
      if ((objc_msgSend(p_isa, "isEmpty") & 1) == 0)
      {
        objc_msgSend(p_isa[5], "appendBytes:length:", a6, a7);
        objc_msgSend(p_isa, "writeFileHeader");
      }
    }
    else
    {
      -[MFBitmap setNull](v15, "setNull");
    }
  }
  v17 = p_isa;
LABEL_9:

  return v17;
}

- (MFBitmap)initWithBitmap:(id)a3 in_width:(int)a4 in_height:(int)a5 in_planes:(int)a6 in_bitsPerPixel:(int)a7 in_bitmap:(const char *)a8 in_bitmapSize:(unsigned int)a9
{
  id v15;
  MFBitmap *v16;
  MFBitmap *v17;
  uint64_t v18;
  NSMutableData *m_bmpData;
  unsigned int m_bitsPerPixel;
  void *v21;
  void *v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  void *v26;
  unsigned int m_width;
  uint64_t m_height;
  unint64_t v30;
  unsigned int v31;
  unint64_t v32;
  _BOOL4 v33;
  _BOOL4 v34;
  unint64_t v35;
  unsigned int v36;
  unint64_t v37;
  _BOOL4 v39;
  size_t v40;
  char *v41;
  int v42;
  int v43;
  MFBitmap *v44;
  objc_super v46;

  v15 = a3;
  v46.receiver = self;
  v46.super_class = (Class)MFBitmap;
  v16 = -[MFBitmap init](&v46, sel_init);
  v17 = v16;
  if (v16)
  {
    if (a6 > 1 || !a4 || !a5 || !a7 || !a8 || !a9)
    {
      -[MFBitmap setNull](v16, "setNull");
LABEL_31:
      v44 = v17;
      goto LABEL_32;
    }
    v16->m_width = a4;
    v16->m_height = a5;
    v16->m_infoHeaderSize = 40;
    v16->m_bitsPerPixel = a7;
    v16->m_compression = 0;
    v16->m_isOS2 = 0;
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v16->m_infoHeaderSize + 14);
    m_bmpData = v17->m_bmpData;
    v17->m_bmpData = (NSMutableData *)v18;

    -[MFBitmap writeInfoHeader](v17, "writeInfoHeader");
    m_bitsPerPixel = v17->m_bitsPerPixel;
    if (m_bitsPerPixel == 8 || m_bitsPerPixel == 4)
    {
      objc_msgSend(v15, "getSelectedPalette");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v17->m_bitsPerPixel;
      v17->m_paletteSize = 4 << v24;
      -[NSMutableData increaseLengthBy:](v17->m_bmpData, "increaseLengthBy:");
      v25 = 1;
      do
      {
        objc_msgSend(v22, "getColour:", v25 - 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFBitmap writePaletteEntry:in_index:](v17, "writePaletteEntry:in_index:", v26, v25 - 1);

      }
      while (!(v25++ >> v24));
      v23 = a9;
    }
    else
    {
      if (m_bitsPerPixel != 1)
      {
        v23 = a9;
        v17->m_paletteSize = 0;
        goto LABEL_18;
      }
      v17->m_paletteSize = 8;
      -[NSMutableData increaseLengthBy:](v17->m_bmpData, "increaseLengthBy:", 8);
      +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", 0, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFBitmap writePaletteEntry:in_index:](v17, "writePaletteEntry:in_index:", v21, 0);

      +[OITSUColor colorWithRGBBytes:green:blue:](OITSUColor, "colorWithRGBBytes:green:blue:", 255, 255, 255);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = a9;
      -[MFBitmap writePaletteEntry:in_index:](v17, "writePaletteEntry:in_index:", v22, 1);
    }

LABEL_18:
    m_width = v17->m_width;
    m_height = v17->m_height;
    v30 = m_width * (unint64_t)v17->m_bitsPerPixel;
    v31 = ((v30 + 15) >> 3) & 0x1FFFFFFE;
    v32 = m_height * (unint64_t)v31;
    v33 = (v32 & 0xFFFFFFFF00000000) != 0;
    TCVerifyInputMeetsCondition(v32 <= v23);
    v34 = v30 > 0xFFFFFFF0 || (v30 & 0xFFFFFFFF00000000) != 0;
    v35 = v17->m_bitsPerPixel * (unint64_t)m_width;
    v36 = ((v35 + 31) >> 3) & 0x1FFFFFFC;
    v37 = m_height * (unint64_t)v36;
    v39 = (v35 & 0xFFFFFFFF00000000) != 0 || v35 > 0xFFFFFFE0 || (v37 & 0xFFFFFFFF00000000) != 0;
    TCVerifyInputMeetsCondition(!v39 && !v33 && !v34);
    v40 = v37;
    -[NSMutableData increaseLengthBy:](v17->m_bmpData, "increaseLengthBy:", v37);
    v41 = (char *)(-[NSMutableData mutableBytes](v17->m_bmpData, "mutableBytes")
                 + v17->m_infoHeaderSize
                 + (unint64_t)v17->m_paletteSize
                 + 14);
    bzero(v41, v40);
    if ((_DWORD)m_height)
    {
      v42 = 0;
      v43 = 2 * ((v30 + 15) >> 4) * (m_height - 1);
      do
      {
        memcpy(&v41[v42], &a8[v43], ((v30 + 15) >> 3) & 0x1FFFFFFE);
        v42 += v36;
        v43 -= v31;
        --m_height;
      }
      while (m_height);
    }
    -[MFBitmap writeFileHeader](v17, "writeFileHeader");
    goto LABEL_31;
  }
LABEL_32:

  return v17;
}

- (const)pixelData
{
  uint64_t v2;

  v2 = -[NSMutableData bytes](self->m_bmpData, "bytes");
  return (const char *)(v2 + *(unsigned int *)(v2 + 10));
}

- (BOOL)isFlipped
{
  return *(_DWORD *)(-[NSMutableData bytes](self->m_bmpData, "bytes") + 22) >> 31;
}

- (unint64_t)pixelDataLength
{
  return -[NSMutableData length](self->m_bmpData, "length") - 10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_bmpData, 0);
}

@end
