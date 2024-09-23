void SCRDAlva6SeriesAppendKeyEvent(int a1, unsigned __int8 a2, unsigned int a3, unsigned int a4, unsigned int a5, void *a6)
{
  id v11;
  id v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v11 = a6;
  switch(a2 & 0x7F)
  {
    case 'q':
      v21 = v11;
      v12 = v11;
      if (!a1)
      {
        if (a3 > 5)
          goto LABEL_33;
        v19 = 65537;
        if ((a2 & 0x80u) != 0)
          v19 = 1;
        v14 = v19 | ((unint64_t)a3 << 8);
        goto LABEL_32;
      }
      if ((a2 & 0x80u) != 0)
        v13 = 1;
      else
        v13 = 65537;
      if (a3 <= 4)
      {
        v14 = v13 | (_getFrontKeyEventForCode_frontKeyMap[a3] << 8);
        goto LABEL_32;
      }
      if (a3 <= 9)
      {
        v14 = ((_getFrontKeyEventForCode_frontKeyMap[a3] << 8) + 4608) | v13;
        goto LABEL_32;
      }
      goto LABEL_33;
    case 'r':
      if (a3 > 4)
        goto LABEL_34;
      v15 = 65537;
      if ((a2 & 0x80u) != 0)
        v15 = 1;
      v21 = v11;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (((unint64_t)a3 << 8) + 1280) | v15);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v12);
      goto LABEL_33;
    case 's':
      v21 = v11;
      v12 = v11;
      if (a1)
      {
        if (a3 > 0x11)
          goto LABEL_33;
        v16 = 5888;
      }
      else
      {
        if (a3 >= 9)
          goto LABEL_33;
        v16 = 2304;
      }
      v18 = 65537;
      if ((a2 & 0x80u) != 0)
        v18 = 1;
      v17 = v16 + ((unint64_t)a3 << 8);
LABEL_31:
      v14 = v17 | v18;
LABEL_32:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v20);

LABEL_33:
      v11 = v21;
LABEL_34:

      return;
    case 't':
      v21 = v11;
      v12 = v11;
      if ((a3 & 0x7F) < a4 || a5 <= ((a3 & 0x7F) - a4))
        goto LABEL_33;
      v14 = ((a3 >> 3) & 0x10 | ((((unint64_t)(a2 & 0x80) >> 7) & 1) << 16) | ((unint64_t)((a3 & 0x7F) - a4) << 8)) ^ 0x10000;
      goto LABEL_32;
    case 'x':
      v21 = v11;
      v12 = v11;
      if (a3 - 1 > 0xC)
        goto LABEL_33;
      v17 = qword_2282C9E68[(char)(a3 - 1)];
      if ((a2 & 0x80u) == 0)
        v18 = 65538;
      else
        v18 = 2;
      goto LABEL_31;
    default:
      goto LABEL_34;
  }
}

BOOL SCRDBaumSendRequest(void *a1, uint64_t a2, unint64_t a3)
{
  return objc_msgSend(a1, "writeData:withSize:toPipe:withTimeout:", a2, a3, 2, 0.1) >= a3;
}

_WORD *SCRDBaumCreateDisplayRequest(uint64_t a1, unint64_t a2, unint64_t a3, size_t *a4)
{
  unint64_t v5;
  unint64_t v8;
  uint64_t v9;
  unsigned int v10;
  size_t v11;
  _WORD *v12;
  _WORD *v13;
  uint64_t v14;
  _BYTE *v15;
  unsigned int v16;

  v5 = a3;
  if (a2)
  {
    v8 = 0;
    LODWORD(v9) = 0;
    v10 = 1;
    do
    {
      if (*(_BYTE *)(a1 + v8) == 27)
        v9 = (v9 + 1);
      else
        v9 = v9;
      v8 = v10++;
    }
    while (v8 < a2);
  }
  else
  {
    v9 = 0;
  }
  v11 = a3 + v9 + 2;
  v12 = malloc_type_malloc(v11, 0x100004077774924uLL);
  v13 = v12;
  if (v12)
  {
    if (v5 >= a2)
    {
      if (v5 > a2)
        bzero((char *)v12 + a2 + 2, v5 - a2);
      v5 = a2;
    }
    *v13 = 283;
    if (v5)
    {
      v14 = 0;
      v15 = v13 + 1;
      v16 = 1;
      do
      {
        *v15 = *(_BYTE *)(a1 + v14);
        if (*(_BYTE *)(a1 + v14) == 27)
        {
          v15[1] = 27;
          v15 += 2;
        }
        else
        {
          ++v15;
        }
        v14 = v16;
      }
      while (v5 > v16++);
    }
  }
  else
  {
    v11 = 0;
  }
  *a4 = v11;
  return v13;
}

BOOL SCRDBaumSetBaumProtocol(void *a1)
{
  __int16 v2;
  char v3;

  v3 = 1;
  v2 = 5403;
  return (unint64_t)objc_msgSend(a1, "writeData:withSize:toPipe:withTimeout:", &v2, 3, 2, 0.1) > 2;
}

BOOL SCRDBaumSendInitializationRequest(void *a1)
{
  __int16 v2;
  char v3;

  v3 = 0;
  v2 = 283;
  return (unint64_t)objc_msgSend(a1, "writeData:withSize:toPipe:withTimeout:", &v2, 3, 2, 0.1) > 2;
}

uint64_t SCRDBaumInitializeDisplay(void *a1, uint64_t a2)
{
  id v3;
  CFMutableDataRef Mutable;
  const __CFData *v5;
  unsigned int v6;
  char v7;
  __CFData *v8;
  __CFData *PacketFromBuffer;
  int v10;
  int v11;
  unsigned __int8 v12;
  unsigned __int8 v14;
  __int16 v15;
  char v16;
  __int16 v17;
  char v18;

  v3 = a1;
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (Mutable)
  {
    v5 = Mutable;
    v6 = 0;
    v7 = 0;
    v14 = 0;
    do
    {
      v16 = 1;
      v15 = 5403;
      if ((unint64_t)objc_msgSend(v3, "writeData:withSize:toPipe:withTimeout:", &v15, 3, 2, 0.1) < 3)
        break;
      v18 = 0;
      v17 = 283;
      if ((unint64_t)objc_msgSend(v3, "writeData:withSize:toPipe:withTimeout:", &v17, 3, 2, 0.1) < 3)
        break;
      objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.2);
      if (SCRDFillBuffer(v5, (uint64_t)v3, 1, a2, 2u) && (v8 = SCRDBaumCreatePacketFromBuffer(v5, 0)) != 0)
      {
        PacketFromBuffer = v8;
        v10 = 0;
        do
        {
          v11 = *CFDataGetBytePtr(PacketFromBuffer);
          if (v11 == 23)
          {
            v7 = 1;
          }
          else if (v11 == 1)
          {
            v10 |= SCRDBaumGetSizeFromDisplaySizePacket(PacketFromBuffer, &v14);
          }
          CFRelease(PacketFromBuffer);
          PacketFromBuffer = SCRDBaumCreatePacketFromBuffer(v5, 0);
        }
        while (PacketFromBuffer);
      }
      else
      {
        LOBYTE(v10) = 0;
      }
      if (v6 > 5)
        break;
      ++v6;
    }
    while ((v10 & 1) == 0);
    CFRelease(v5);
    if ((v7 & 1) != 0)
      v12 = 0;
    else
      v12 = v14;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

__CFData *SCRDBaumCreatePacketFromBuffer(const __CFData *a1, uint64_t a2)
{
  CFIndex Length;
  const UInt8 *BytePtr;
  const UInt8 *v6;
  CFIndex v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  CFIndex v16;
  int v17;
  CFRange v20;
  CFRange v21;

  Length = CFDataGetLength(a1);
  BytePtr = CFDataGetBytePtr(a1);
  if (Length < 1)
    return 0;
  v6 = BytePtr;
  v7 = 0;
  do
  {
    if (v6[v7] != 27)
    {
LABEL_24:
      ++v7;
      continue;
    }
    if (v7 >= 1)
    {
      v20.location = 0;
      v20.length = v7;
      CFDataDeleteBytes(a1, v20);
      v6 = CFDataGetBytePtr(a1);
      Length = CFDataGetLength(a1);
      v7 = 0;
    }
    if (Length < 3)
      return 0;
    v8 = v6[1];
    v9 = 2;
    if (v8 <= 0x3F)
    {
      v10 = 2;
      switch(v6[1])
      {
        case 0x11u:
        case 0x26u:
        case 0x2Cu:
        case 0x2Du:
        case 0x33u:
          v9 = 3;
          v10 = 3;
          goto LABEL_26;
        case 0x12u:
        case 0x13u:
        case 0x14u:
        case 0x15u:
        case 0x18u:
        case 0x19u:
        case 0x1Au:
        case 0x1Bu:
        case 0x1Cu:
        case 0x1Du:
        case 0x1Eu:
        case 0x1Fu:
        case 0x20u:
        case 0x2Au:
        case 0x2Eu:
        case 0x2Fu:
        case 0x30u:
        case 0x31u:
        case 0x32u:
          goto LABEL_24;
        case 0x16u:
        case 0x17u:
        case 0x23u:
        case 0x24u:
        case 0x25u:
        case 0x27u:
        case 0x28u:
        case 0x29u:
        case 0x2Bu:
        case 0x34u:
          goto LABEL_26;
        case 0x21u:
          goto LABEL_20;
        case 0x22u:
          v9 = ((unint64_t)(a2 + 7) >> 3) + 1;
          v10 = v9;
          if (a2 <= 0)
            goto LABEL_24;
          goto LABEL_26;
        default:
          v10 = 2;
          if (v8 != 1 && v8 != 5)
            goto LABEL_24;
          goto LABEL_26;
      }
    }
    if (v6[1] > 0x83u)
    {
      switch(v8)
      {
        case 0x84u:
          v9 = 19;
          v10 = 17;
          break;
        case 0x8Au:
LABEL_20:
          v9 = 9;
          v10 = 9;
          break;
        case 0x8Cu:
          v9 = 15;
          v10 = 15;
          break;
        default:
          goto LABEL_24;
      }
    }
    else if (v8 - 80 >= 3)
    {
      v10 = 2;
      if (v8 != 64)
        goto LABEL_24;
    }
    else
    {
      v9 = v6[2] + 2;
      v10 = v9;
    }
LABEL_26:
    if (v9 >= Length)
      return 0;
    Mutable = CFDataCreateMutable(0, v9);
    CFDataSetLength(Mutable, v9);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    v13 = 0;
    v14 = 0;
    v15 = v9 + v7;
    v16 = v7 + 1;
    while (1)
    {
      v17 = v6[v16];
      if (v13)
      {
        if (v17 != 27)
        {
          CFRelease(Mutable);
          v7 = v16 - 1;
          goto LABEL_40;
        }
        v13 = 0;
        goto LABEL_35;
      }
      if (v17 == 27)
        break;
LABEL_34:
      MutableBytePtr[v14++] = v17;
      v13 = v17 == 27;
LABEL_35:
      v7 = v16 + 1;
      if (v16++ >= v15)
      {
        if (!Mutable)
          goto LABEL_40;
        goto LABEL_42;
      }
    }
    if (v14 != v10)
    {
      if (++v15 >= Length)
      {
        CFRelease(Mutable);
        return 0;
      }
      goto LABEL_34;
    }
    v7 = v16 - 1;
    if (Mutable)
      goto LABEL_42;
LABEL_40:
    ;
  }
  while (v7 < Length);
  Mutable = 0;
LABEL_42:
  if (v7 >= 1)
  {
    v21.location = 0;
    v21.length = v7;
    CFDataDeleteBytes(a1, v21);
  }
  return Mutable;
}

uint64_t SCRDBaumGetSizeFromDisplaySizePacket(const __CFData *a1, _BYTE *a2)
{
  const UInt8 *BytePtr;

  BytePtr = CFDataGetBytePtr(a1);
  if (CFDataGetLength(a1) < 2 || *BytePtr != 1)
    return 0;
  if (a2)
    *a2 = BytePtr[1];
  return 1;
}

BOOL SCRDBaumAppendEventsFromTopPanelPacket(void *a1, const __CFData *a2, UInt8 *a3, unint64_t a4)
{
  id v7;
  unint64_t v8;
  const UInt8 *BytePtr;
  int v10;
  void *v11;
  UInt8 v12;
  unsigned __int8 v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  int v22;

  v7 = a1;
  v8 = objc_msgSend(v7, "count");
  BytePtr = CFDataGetBytePtr(a2);
  if (CFDataGetLength(a2) >= 2 && *BytePtr == 36)
  {
    v10 = 0;
    v11 = 0;
    v12 = BytePtr[1];
    v13 = (*a3 ^ v12) & v12;
    v14 = ((*a3 ^ v12) & *a3);
    *a3 = v12;
    v22 = v13;
    LODWORD(a3) = 1;
    v15 = 1;
    do
    {
      if (v10 == 4)
        v16 = 66;
      else
        v16 = v10;
      if (v10 == 1)
        v16 = 65;
      if (((1 << a4) & 0xC00400000) != 0)
        v17 = v16;
      else
        v17 = v10;
      if (a4 > 0x23)
        v17 = v10;
      if ((v15 & v14) != 0)
      {
        a3 = (UInt8 *)(a3 & 0xFFFE00FF | (v17 << 8));
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
        v18 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "insertObject:atIndex:", v18, v8);
        v11 = (void *)v18;
      }
      else if ((v15 & v22) != 0)
      {
        a3 = (UInt8 *)(a3 & 0xFFFE00FF | (v17 << 8) | 0x10000);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
        v19 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v19);
        v11 = (void *)v19;
      }
      v15 = 2 * v15;
      ++v10;
    }
    while (v10 != 6);

  }
  v20 = objc_msgSend(v7, "count") > v8;

  return v20;
}

BOOL SCRDBaumAppendEventsFromRoutingKeyPacket(void *a1, const __CFData *a2, _BYTE *a3)
{
  id v5;
  unint64_t v6;
  const UInt8 *BytePtr;
  int v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;

  v5 = a1;
  v6 = objc_msgSend(v5, "count");
  BytePtr = CFDataGetBytePtr(a2);
  if (CFDataGetLength(a2) == 2 && *BytePtr == 39)
  {
    v8 = BytePtr[1];
    v9 = *a3;
    if (BytePtr[1])
    {
      if (*a3)
      {
        if (v9 != v8)
        {
          v10 = (v9 << 8) - 256;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v10 & 0xFFFEFFFF);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v10 & 0xFFFE0000 | ((BytePtr[1] << 8) - 256) | 0x10000);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
          objc_msgSend(v5, "addObject:", v12);

        }
LABEL_12:
        *a3 = BytePtr[1];
        goto LABEL_13;
      }
      v14 = (void *)MEMORY[0x24BDD16E0];
      v13 = ((v8 << 8) - 256) & 0xFFFFFF00 | 0x10000;
    }
    else
    {
      if (!*a3)
        goto LABEL_12;
      v13 = ((v9 << 8) - 256) & 0xFFFEFF00;
      v14 = (void *)MEMORY[0x24BDD16E0];
    }
    objc_msgSend(v14, "numberWithUnsignedLong:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_13:
  v15 = objc_msgSend(v5, "count") > v6;

  return v15;
}

BOOL SCRDBaumAppendEventsFromRoutingKeyGroupPacket(void *a1, const __CFData *a2, uint64_t a3, unsigned int a4)
{
  id v7;
  unint64_t v8;
  const UInt8 *BytePtr;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const UInt8 *v14;
  int v15;
  char v16;
  UInt8 v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  _QWORD v26[2];
  uint64_t v27;
  const UInt8 *v28;
  uint64_t v29;
  uint64_t v30;

  v7 = a1;
  v8 = objc_msgSend(v7, "count");
  BytePtr = CFDataGetBytePtr(a2);
  if (CFDataGetLength(a2) >= (a4 + 1) && *BytePtr == 34 && a4)
  {
    v26[1] = v26;
    v10 = 0;
    v11 = 0;
    LODWORD(v12) = 0;
    v13 = 0;
    v14 = BytePtr + 1;
    v27 = a4;
    v28 = BytePtr + 1;
    v29 = a3;
    do
    {
      v15 = 0;
      v16 = *(_BYTE *)(a3 + v11);
      v30 = v11;
      v17 = v14[v11];
      v18 = (v16 & ~v17);
      v19 = (v17 & ~v16);
      v20 = 1;
      do
      {
        if ((v20 & v18) != 0)
        {
          v12 = v12 & 0xFFFE00FF | (v10 + v15) & 0xFFFEFF00;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v12);
          v21 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "insertObject:atIndex:", v21, v8);
          v13 = (void *)v21;
        }
        else if ((v20 & v19) != 0)
        {
          v12 = (v10 + v15) | v12 & 0xFFFE00FF | 0x10000;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v12);
          v22 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "addObject:", v22);
          v13 = (void *)v22;
        }
        v20 = 2 * v20;
        v15 += 256;
      }
      while (v15 != 2048);
      a3 = v29;
      v23 = v30;
      v14 = v28;
      *(_BYTE *)(v29 + v30) = v28[v30];
      v11 = v23 + 1;
      v10 += 2048;
    }
    while (v11 != v27);

  }
  v24 = objc_msgSend(v7, "count") > v8;

  return v24;
}

BOOL SCRDBaumAppendEventsFromDirectionalPadPacket(void *a1, const __CFData *a2, UInt8 *a3)
{
  id v5;
  unint64_t v6;
  const UInt8 *BytePtr;
  void *v8;
  UInt8 v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;

  v5 = a1;
  v6 = objc_msgSend(v5, "count");
  BytePtr = CFDataGetBytePtr(a2);
  if (CFDataGetLength(a2) >= 2 && *BytePtr == 52)
  {
    v8 = 0;
    v9 = BytePtr[1];
    v10 = ((*a3 ^ v9) & *a3);
    v11 = ((*a3 ^ v9) & v9);
    *a3 = v9;
    v12 = 1;
    v13 = 1536;
    v14 = 1;
    do
    {
      if ((v12 & v10) != 0)
      {
        v14 = v13 | v14 & 0xFFFE00FF;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "insertObject:atIndex:", v15, v6);
        v8 = (void *)v15;
      }
      else if ((v12 & v11) != 0)
      {
        v14 = v14 & 0xFFFE00FF | v13 | 0x10000;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v14);
        v16 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v16);
        v8 = (void *)v16;
      }
      v12 = 2 * v12;
      v13 += 256;
    }
    while (v13 != 2816);

  }
  v17 = objc_msgSend(v5, "count") > v6;

  return v17;
}

BOOL SCRDBaumAppendEventsFromBrailleAndFrontPanelPacket(void *a1, const __CFData *a2, _BYTE *a3, _BYTE *a4, unint64_t a5)
{
  id v9;
  unint64_t v10;
  const UInt8 *BytePtr;
  int v12;
  _BOOL4 v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  BOOL v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  unsigned int v39;
  int v40;
  int v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  _BOOL8 v46;
  const UInt8 *v48;
  _BYTE *v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = objc_msgSend(v9, "count");
  BytePtr = CFDataGetBytePtr(a2);
  if (CFDataGetLength(a2) >= 3 && *BytePtr == 51)
  {
    v12 = BytePtr[1];
    v14 = (v12 & 3) == 0 || a5 == 36;
    if (a5 <= 2)
      v15 = 7;
    else
      v15 = 3;
    if (a5 <= 2)
      v14 = (v12 & 7) == 0;
    if (v14)
      v16 = 0;
    else
      v16 = v15;
    v17 = v12 | v16;
    v18 = *a4;
    *a4 = v17;
    v19 = (v18 ^ v17);
    if (v18 != v17)
    {
      v48 = BytePtr;
      v49 = a3;
      if (a5 > 2)
      {
        if (a5 == 36)
        {
          v51 = 0x200000001;
          v52 = 8;
          v20 = 3;
        }
        else
        {
          v51 = 0x900000008;
          v20 = 2;
        }
      }
      else
      {
        LODWORD(v51) = 8;
        v20 = 1;
      }
      v23 = 0;
      v21 = 0;
      v24 = v19 & v18;
      v50 = v19 & v17;
      if (a5 == 36)
        v25 = 1;
      else
        v25 = 2;
      LODWORD(v22) = 2;
      do
      {
        if (v23 < 2)
          v26 = 1;
        else
          v26 = 2;
        if (a5 == 36)
          LODWORD(v22) = v26 | v22 & 0xFFFFFFF0;
        if ((v25 & v24) != 0)
        {
          v22 = v22 & 0xFFFE00FF | (*((_DWORD *)&v51 + v23) << 8);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v22);
          v27 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "insertObject:atIndex:", v27, v10);
          v21 = (void *)v27;
        }
        else if ((v25 & v50) != 0)
        {
          v22 = v22 & 0xFFFE00FF | (*((_DWORD *)&v51 + v23) << 8) | 0x10000;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v22);
          v28 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "addObject:", v28);
          v21 = (void *)v28;
        }
        v25 = 2 * v25;
        ++v23;
      }
      while (v20 != v23);
      v29 = 0;
      LODWORD(v22) = v22 & 0xFFFFFFF0 | 1;
      v30 = 16;
      v31 = 3;
      do
      {
        if (v31)
          v32 = 0;
        else
          v32 = a5 == 22;
        v33 = v29 + 11;
        if (v32)
          v33 = 67;
        if ((v30 & v24) != 0)
        {
          v22 = v22 & 0xFFFE00FF | (v33 << 8);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v22);
          v34 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "insertObject:atIndex:", v34, v10);
          v21 = (void *)v34;
        }
        else if ((v30 & v50) != 0)
        {
          v22 = v22 & 0xFFFE00FF | (v33 << 8) | 0x10000;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v22);
          v35 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "addObject:", v35);
          v21 = (void *)v35;
        }
        v30 = (2 * v30) & 0x1E0;
        ++v29;
        --v31;
      }
      while (v29 != 4);
      BytePtr = v48;
      a3 = v49;
    }
    else
    {
      v21 = 0;
      LODWORD(v22) = 0;
    }
    v36 = BytePtr[2];
    v37 = *a3;
    *a3 = v36;
    v38 = v37 ^ v36;
    if (v37 != v36)
    {
      v39 = 0;
      v40 = v38 & v37;
      v41 = v38 & v36;
      LODWORD(v42) = v22 & 0xFFFFFFF0 | 2;
      v43 = 1;
      do
      {
        if ((v43 & v40) != 0)
        {
          v42 = v39 | v42 & 0xFFFE00FF;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v42);
          v44 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "insertObject:atIndex:", v44, v10);
          v21 = (void *)v44;
        }
        else if ((v43 & v41) != 0)
        {
          v42 = v42 & 0xFFFE00FF | v39 | 0x10000;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v42);
          v45 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "addObject:", v45);
          v21 = (void *)v45;
        }
        v43 = 2 * v43;
        v39 += 256;
      }
      while (v39 != 2048);
    }

  }
  v46 = objc_msgSend(v9, "count", v48, v49) > v10;

  return v46;
}

BOOL SCRDBaum2SendDetectDevicesRequest(void *a1)
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x24BDAC8D0];
  v2[0] = 0x40000000005501BLL;
  return (unint64_t)objc_msgSend(a1, "writeData:withSize:toPipe:withTimeout:", v2, 8, 2, 0.1) > 7;
}

BOOL SCRDBaum2SendDeviceArrivalAck(void *a1, __int16 a2, __int16 a3)
{
  __int16 v4;
  char v5;
  __int16 v6;
  __int16 v7;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = 20507;
  v5 = 5;
  v6 = a2;
  v7 = a3;
  v8 = 1;
  return (unint64_t)objc_msgSend(a1, "writeData:withSize:toPipe:withTimeout:", &v4, 8, 2, 0.1) > 7;
}

BOOL SCRDBaum2SendDeviceResetRequest(void *a1, __int16 a2, __int16 a3)
{
  __int16 v4;
  char v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = 20763;
  v5 = 7;
  v6 = a2;
  v7 = a3;
  v8 = 128;
  v9 = 0;
  return (unint64_t)objc_msgSend(a1, "writeData:withSize:toPipe:withTimeout:", &v4, 10, 2, 0.1) > 9;
}

id SCRDBrailleNoteExtractEventsFromBuffer(const __CFData *a1)
{
  CFIndex Length;
  unint64_t v3;
  id v4;
  const UInt8 *BytePtr;
  unsigned int v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  CFRange v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  id v23;
  uint64_t v24;
  int v25;
  int v26;
  unsigned int v27;
  uint64_t v28;
  CFIndex v29;
  CFRange v30;

  if (!a1 || (Length = CFDataGetLength(a1), Length < 1))
  {
LABEL_6:
    v4 = 0;
    return v4;
  }
  v3 = Length;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v3 == 1)
    goto LABEL_4;
  while (1)
  {
    BytePtr = CFDataGetBytePtr(a1);
    v7 = *BytePtr;
    if (v7 <= 0xBB)
      break;
    if (v7 == 188)
    {
      v14 = v3 > 3;
      if (v3 < 4)
      {
        v13.location = 0;
        goto LABEL_42;
      }
      v30.location = 0;
      v30.length = 2;
      CFDataDeleteBytes(a1, v30);
    }
    else if (v7 != 189)
    {
LABEL_16:
      v13.location = 0;
      v13.length = 1;
      v14 = 1;
      goto LABEL_43;
    }
LABEL_41:
    v13.location = 0;
    v14 = 1;
LABEL_42:
    v13.length = 2;
LABEL_43:
    CFDataDeleteBytes(a1, v13);
    v29 = CFDataGetLength(a1);
    if (v29 >= 2)
    {
      v3 = v29;
      if (v14)
        continue;
    }
    goto LABEL_4;
  }
  switch(*BytePtr)
  {
    case 0x80u:
    case 0x81u:
    case 0x82u:
      v8 = BytePtr[1];
      v9 = v4;
      v10 = objc_msgSend(v9, "count");
      v11 = v10;
      if (v7 == 129)
      {
        v12 = 2050;
      }
      else
      {
        if (v7 != 130 || (v8 & 0x40) == 0)
        {
          v12 = 2;
          goto LABEL_35;
        }
        v12 = 1538;
      }
      v24 = v10 + 1;
      SCRDAppendFullKeystrokeFromEvent(v9, v10, v12);
      v11 = v24;
LABEL_35:
      if ((v8 & 0x3F) != 0)
      {
        v25 = 0;
        v26 = 1;
        do
        {
          if ((v26 & v8) != 0)
          {
            v27 = v12 & 0xFFFF00FF;
            v12 = v12 & 0xFFFF00FF | v25;
            v28 = v11 + 1;
            SCRDAppendFullKeystrokeFromEvent(v9, v11, v27 | v25);
            v11 = v28;
          }
          v26 = 2 * v26;
          v25 += 256;
        }
        while (v25 != 1536);
      }
LABEL_40:

      goto LABEL_41;
    case 0x83u:
      if (BytePtr[1])
        goto LABEL_41;
      v9 = v4;
      SCRDAppendFullKeystrokeFromEvent(v9, objc_msgSend(v9, "count"), 1794);
      goto LABEL_40;
    case 0x84u:
      v15 = BytePtr[1];
      v9 = v4;
      v16 = objc_msgSend(v9, "count");
      v17 = 0;
      v18 = 1;
      v19 = 1;
      do
      {
        if ((v18 & v15) != 0)
        {
          v20 = v19 & 0xFFFF00FF;
          v19 = v19 & 0xFFFF00FF | v17;
          SCRDAppendFullKeystrokeFromEvent(v9, v16, v20 | v17);
        }
        v18 = 2 * v18;
        v17 += 256;
      }
      while (v17 != 1024);
      goto LABEL_40;
    case 0x85u:
      v21 = BytePtr[1] << 8;
      goto LABEL_29;
    case 0x86u:
      if (v3 > 2)
      {
        v13.location = 0;
        v14 = 1;
        v13.length = 3;
        goto LABEL_43;
      }
      CFDataGetLength(a1);
LABEL_4:
      if (!objc_msgSend(v4, "count"))
      {

        goto LABEL_6;
      }
      return v4;
    case 0x8Bu:
      v22 = BytePtr[1];
      if (v22 > 6)
        goto LABEL_41;
      v21 = (v22 << 8) + 1025;
LABEL_29:
      v23 = v4;
      SCRDAppendFullKeystrokeFromEvent(v23, objc_msgSend(v23, "count"), v21);

      goto LABEL_41;
    default:
      goto LABEL_16;
  }
}

UInt8 *SCRDBrailleNoteCreateDisplayRequest(_BYTE *a1, unint64_t a2, unsigned int a3, unsigned int a4)
{
  _BYTE *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  UInt8 *result;
  UInt8 *v14;
  _BYTE *v15;
  int v16;
  CFDataRef v17;

  v6 = a1;
  v7 = 0;
  if (a2)
  {
    v8 = a1;
    v9 = a2;
    do
    {
      v10 = *v8++;
      if (v10 == 27)
        ++v7;
      --v9;
    }
    while (v9);
  }
  v11 = a3;
  v12 = a3 + (unint64_t)a4 + v7 + 2;
  result = (UInt8 *)malloc_type_malloc(v12, 0x100004077774924uLL);
  if (result)
  {
    v14 = result;
    if (v11 >= a2)
    {
      if (v11 > a2)
        bzero(&result[a4 + 2 + a2], v11 - a2);
      v11 = a2;
    }
    *(_WORD *)v14 = 16923;
    v15 = v14 + 2;
    if (a4)
    {
      bzero(v14 + 2, a4);
      v15 += a4;
    }
    for (; v11; --v11)
    {
      *v15 = *v6;
      v16 = *v6++;
      if (v16 == 27)
      {
        v15[1] = 27;
        v15 += 2;
      }
      else
      {
        ++v15;
      }
    }
    v17 = CFDataCreate(0, v14, v12);
    free(v14);
    return (UInt8 *)v17;
  }
  return result;
}

CFDataRef SCRDBrailleNoteCreateDescriptionPacketFromBuffer(const __CFData *a1)
{
  CFIndex Length;
  unint64_t v3;
  const UInt8 *BytePtr;
  uint64_t v5;
  CFDataRef v6;
  CFRange v7;
  int v8;
  CFIndex v9;
  int v10;

  if (a1)
  {
    Length = CFDataGetLength(a1);
    if (Length >= 2)
    {
      v3 = Length;
      while (1)
      {
        BytePtr = CFDataGetBytePtr(a1);
        v5 = *BytePtr - 128;
        if (v5 > 0x3D)
        {
LABEL_15:
          v7.location = 0;
          v7.length = 1;
          v6 = 0;
          goto LABEL_7;
        }
        if (((1 << (*BytePtr + 0x80)) & 0x300000000000083FLL) != 0)
          break;
        if (v5 != 6)
          goto LABEL_15;
        if (v3 >= 3)
        {
          v10 = BytePtr[2];
          if (v10 == 18 || v10 == 32)
          {
            if (!BytePtr[1])
              goto LABEL_20;
          }
          else if (v10 == 30 && BytePtr[1] == 5)
          {
LABEL_20:
            v6 = CFDataCreate(0, BytePtr, 3);
            v7.location = 0;
            goto LABEL_23;
          }
          v7.location = 0;
          v6 = 0;
LABEL_23:
          v7.length = 3;
LABEL_7:
          CFDataDeleteBytes(a1, v7);
          v8 = 1;
          goto LABEL_8;
        }
        v8 = 0;
        v6 = 0;
LABEL_8:
        v9 = CFDataGetLength(a1);
        if (v9 >= 2)
        {
          if (v8)
          {
            v3 = v9;
            if (!v6)
              continue;
          }
        }
        return v6;
      }
      v7.location = 0;
      v6 = 0;
      v7.length = 2;
      goto LABEL_7;
    }
  }
  return 0;
}

uint64_t SCRDBrailleNoteGetDisplayInfoFromDescriptionPacket(CFDataRef theData, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  const UInt8 *BytePtr;
  int v8;

  result = 0;
  if (theData && a2 && a3)
  {
    if (CFDataGetLength(theData) == 3)
    {
      BytePtr = CFDataGetBytePtr(theData);
      if (*BytePtr == 134)
      {
        v8 = BytePtr[2];
        if (v8 == 32)
        {
          *a3 = 0;
LABEL_13:
          *a2 = 32;
          return 1;
        }
        if (v8 != 30)
        {
          if (v8 == 18)
          {
            *a2 = 18;
            *a3 = 0;
            return 1;
          }
          return 0;
        }
        if (BytePtr[1] == 5)
        {
          *a3 = 3;
          goto LABEL_13;
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t SCRDCygnalCP2102InitializeDevice(void *a1)
{
  uint64_t v2;

  LOBYTE(v2) = 0;
  return objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 17, 65, 0, 0, 0, 0, 0.1, 0, v2);
}

uint64_t SCRDCygnalCP2102EnableDevice(void *a1, uint64_t a2)
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 0, 65, a2, 0, 0, 0, 0.1, 0, v3);
}

uint64_t SCRDCygnalCP2102ConfigureDevice(void *a1)
{
  uint64_t result;
  uint64_t v2;
  unint64_t v3;
  int v4;
  __int16 v5;

  v5 = 0;
  v4 = 0;
  v3 = 0;
  LOBYTE(v2) = 0;
  LODWORD(result) = objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 25, 65, 0, 0, &v4, 6, 0.1, &v3, v2);
  if (v3 > 5)
    return result;
  else
    return 0;
}

uint64_t SCRDCygnalCP2102GetBaudRate(void *a1)
{
  int v1;
  uint64_t result;
  BOOL v3;
  uint64_t v4;
  unsigned __int16 v5;
  unint64_t v6;

  v6 = 0;
  v5 = 0;
  LOBYTE(v4) = 0;
  v1 = objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 2, 193, 0, 0, &v5, 2, 0.1, &v6, v4);
  result = 0;
  if (v1)
    v3 = v6 >= 2;
  else
    v3 = 0;
  if (v3)
  {
    if (v5)
      return 0x384000u / v5;
    else
      return 0;
  }
  return result;
}

uint64_t SCRDCygnalCP2102SetBaudRate(void *a1, unsigned int a2)
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 1, 65, (unsigned __int16)(0x384000 / a2), 0, 0, 0, 0.1, 0, v3);
}

uint64_t SCRDCygnalCP2102SetFlowControlOff(void *a1)
{
  uint64_t result;
  uint64_t v2;
  unint64_t v3;
  char v4;
  _BYTE v5[23];

  *(_QWORD *)&v5[15] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v5 = 0x40000000;
  *(_QWORD *)&v5[7] = 0;
  v4 = 1;
  v3 = 0;
  LOBYTE(v2) = 0;
  LODWORD(result) = objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 19, 65, 0, 0, &v4, 16, 0.1, &v3, v2);
  if (v3 > 0xF)
    return result;
  else
    return 0;
}

uint64_t SCRDCygnalCP2102GetPinState(void *a1)
{
  unsigned __int8 v1;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;

  v6 = 0;
  v5 = 0;
  LOBYTE(v4) = 0;
  v1 = objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 8, 193, 0, 0, &v5, 1, 0.1, &v6, v4);
  if ((v1 & (v6 != 0)) != 0)
    return v5;
  else
    return 0;
}

uint64_t SCRDCygnalCP2102SetDTR(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v4;

  LOBYTE(v4) = 0;
  if (a2)
    v2 = 257;
  else
    v2 = 256;
  return objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 7, 65, v2, 0, 0, 0, 0.1, 0, v4);
}

uint64_t SCRDCygnalCP2102SetRTS(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v4;

  LOBYTE(v4) = 0;
  if (a2)
    v2 = 514;
  else
    v2 = 512;
  return objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 7, 65, v2, 0, 0, 0, 0.1, 0, v4);
}

uint64_t SCRDCygnalCP2102SetDataFormat(void *a1, int a2, unsigned int a3, int a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  __int16 v10;
  __int16 v11;
  uint64_t v13;

  v7 = a1;
  v8 = v7;
  if (a3 > 4)
  {
LABEL_9:
    v9 = 0;
    goto LABEL_12;
  }
  if (!a4)
  {
    v10 = 0;
    goto LABEL_6;
  }
  v9 = 0;
  if (a4 == 1)
  {
    v10 = 2;
LABEL_6:
    if (a2 == 3)
    {
      v11 = 2048;
      goto LABEL_11;
    }
    if (a2 == 2)
    {
      v11 = 1792;
LABEL_11:
      LOBYTE(v13) = 0;
      v9 = objc_msgSend(v7, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 3, 65, (unsigned __int16)(v10 | (16 * a3) | v11), 0, 0, 0, 0.1, 0, v13);
      goto LABEL_12;
    }
    goto LABEL_9;
  }
LABEL_12:

  return v9;
}

BOOL SCRDCygnalCP2110EnableDevice(__IOHIDDevice *a1, uint8_t a2)
{
  IOReturn v2;
  _BOOL8 v3;
  NSObject *v4;
  uint8_t v6[14];
  uint8_t report[2];

  if (!a1)
    return 0;
  report[0] = 65;
  report[1] = a2;
  v2 = IOHIDDeviceSetReport(a1, kIOHIDReportTypeFeature, 65, report, 2);
  v3 = v2 == 0;
  if (v2)
  {
    _SCROD_LOG();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2282BD000, v4, OS_LOG_TYPE_DEFAULT, "Failed the Cygnal enableDeviceReport", v6, 2u);
    }

  }
  return v3;
}

BOOL SCRDCygnalCP2110GetPartNumber(IOHIDDeviceRef device, _BYTE *a2, _BYTE *a3)
{
  _BOOL8 result;
  BOOL v7;
  CFIndex v8;
  uint8_t report[3];

  result = 0;
  if (device && a2 && a3)
  {
    v8 = 3;
    if (IOHIDDeviceGetReport(device, kIOHIDReportTypeFeature, 70, report, &v8))
      v7 = 0;
    else
      v7 = v8 == 3;
    result = v7;
    if (v7)
    {
      *a2 = report[1];
      *a3 = report[2];
    }
  }
  return result;
}

uint64_t SCRDCygnalCP2110GetPinState(__IOHIDDevice *a1, _WORD *a2)
{
  uint64_t v2;
  BOOL v4;
  CFIndex v6;
  uint8_t report;
  unsigned __int16 v8;

  v2 = 0;
  if (a1 && a2)
  {
    v6 = 3;
    if (IOHIDDeviceGetReport(a1, kIOHIDReportTypeFeature, 68, &report, &v6))
      v4 = 0;
    else
      v4 = v6 == 3;
    v2 = v4;
    if (v4)
      *a2 = bswap32(v8) >> 16;
  }
  return v2;
}

BOOL SCRDCygnalCP2110SetPinState(__IOHIDDevice *a1, __int16 a2)
{
  IOReturn v2;
  _BOOL8 v3;
  NSObject *v4;
  uint8_t v6[13];
  uint8_t report[3];

  if (!a1)
    return 0;
  report[0] = 68;
  report[1] = HIBYTE(a2);
  report[2] = a2;
  v2 = IOHIDDeviceSetReport(a1, kIOHIDReportTypeFeature, 68, report, 3);
  v3 = v2 == 0;
  if (v2)
  {
    _SCROD_LOG();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2282BD000, v4, OS_LOG_TYPE_DEFAULT, "Failed the Cygnal pinReport", v6, 2u);
    }

  }
  return v3;
}

BOOL SCRDCygnalCP2110GetUARTSettings(IOHIDDeviceRef device, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6)
{
  _BOOL8 result;
  BOOL v13;
  CFIndex v14;
  uint8_t report;
  unsigned int v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  uint64_t v21;

  result = 0;
  v21 = *MEMORY[0x24BDAC8D0];
  if (device && a2 && a3 && a4 && a5 && a6)
  {
    v14 = 9;
    if (IOHIDDeviceGetReport(device, kIOHIDReportTypeFeature, 80, &report, &v14))
      v13 = 0;
    else
      v13 = v14 == 9;
    result = v13;
    if (v13)
    {
      *a2 = bswap32(v16);
      *a4 = v17;
      *a6 = v18;
      *a3 = v19;
      *a5 = v20;
    }
  }
  return result;
}

BOOL SCRDCygnalCP2110SetUARTSettings(__IOHIDDevice *a1, unsigned int a2, uint8_t a3, uint8_t a4, uint8_t a5, uint8_t a6)
{
  uint64_t v6;
  IOReturn v7;
  _BOOL8 v8;
  NSObject *v9;
  uint8_t v11[15];
  uint8_t report[9];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  report[0] = 80;
  v6 = 4;
  do
  {
    report[v6] = a2;
    a2 >>= 8;
    --v6;
  }
  while (v6);
  report[5] = a4;
  report[6] = a6;
  report[7] = a3;
  report[8] = a5;
  v7 = IOHIDDeviceSetReport(a1, kIOHIDReportTypeFeature, 80, report, 9);
  v8 = v7 == 0;
  if (v7)
  {
    _SCROD_LOG();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2282BD000, v9, OS_LOG_TYPE_DEFAULT, "Failed the Cygnal UARTReport", v11, 2u);
    }

  }
  return v8;
}

BOOL SCRDCygnalCP2110Write(__IOHIDDevice *a1, CFDataRef theData)
{
  _BOOL8 v2;
  CFIndex Length;
  size_t v6;
  CFIndex v7;
  uint8_t *v8;
  uint8_t *v9;
  void *v10;
  const UInt8 *BytePtr;

  v2 = 0;
  if (a1 && theData)
  {
    Length = CFDataGetLength(theData);
    if (Length
      && (v6 = Length, v7 = Length + 1, (v8 = (uint8_t *)malloc_type_malloc(Length + 1, 0x22F74B2FuLL)) != 0))
    {
      v9 = v8;
      *v8 = v6;
      v10 = v8 + 1;
      BytePtr = CFDataGetBytePtr(theData);
      memcpy(v10, BytePtr, v6);
      v2 = IOHIDDeviceSetReport(a1, kIOHIDReportTypeOutput, 0, v9, v7) == 0;
      free(v9);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

BOOL SCRDFillBuffer(__CFData *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v14 - v7;
  v11 = objc_msgSend(v9, "readData:withSize:fromPipe:withTimeout:", (char *)v14 - v7, v10);
  v12 = v11;
  if (v11 > a5)
    CFDataAppendBytes(a1, (const UInt8 *)&v8[a5], v11 - a5);
  return v12 > a5;
}

void SCRDAdvanceBufferToPacketStart(const __CFData *a1, int a2)
{
  uint64_t Length;
  const UInt8 *BytePtr;
  uint64_t v6;
  CFRange v7;

  Length = CFDataGetLength(a1);
  BytePtr = CFDataGetBytePtr(a1);
  if (Length >= 1)
  {
    v6 = 0;
    while (BytePtr[v6] != a2)
    {
      if (Length == ++v6)
        goto LABEL_8;
    }
    Length = v6;
LABEL_8:
    v7.location = 0;
    v7.length = Length;
    CFDataDeleteBytes(a1, v7);
  }
}

void SCRDAppendFullKeystrokeFromEvent(void *a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3 & 0xFFFEFFFF;
  v5 = a3 | 0x10000u;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a1;
  objc_msgSend(v6, "numberWithUnsignedLong:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertObject:atIndex:", v8, a2);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v9);
}

void SCRDPostSleepNotification(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a1)
  {
    v3 = (void *)MEMORY[0x24BDD16E0];
    v4 = a1;
    objc_msgSend(v3, "numberWithBool:", a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v7, CFSTR("SCROBrailleDriverProtocolSleepNotificationIsSleepingKey"), 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("SCROBrailleDriverProtocolSleepNotification"), v4, v5);

  }
}

__CFData *SCRDEasyLinkCreatePacketFromBuffer(const __CFData *a1)
{
  CFIndex Length;
  const UInt8 *BytePtr;
  const UInt8 *v4;
  CFIndex v5;
  unint64_t v6;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  BOOL v9;
  uint64_t v10;
  int64_t v11;
  CFIndex v12;
  int v13;
  CFRange v16;
  CFRange v17;

  if (a1)
  {
    Length = CFDataGetLength(a1);
    BytePtr = CFDataGetBytePtr(a1);
    if (Length >= 1)
    {
      v4 = BytePtr;
      v5 = 0;
      while (v4[v5] != 27)
      {
LABEL_11:
        ++v5;
LABEL_27:
        if (v5 >= Length)
        {
          Mutable = 0;
LABEL_29:
          if (v5 >= 1)
          {
            v17.location = 0;
            v17.length = v5;
            CFDataDeleteBytes(a1, v17);
          }
          return Mutable;
        }
      }
      if (v5 >= 1)
      {
        v16.location = 0;
        v16.length = v5;
        CFDataDeleteBytes(a1, v16);
        v4 = CFDataGetBytePtr(a1);
        Length = CFDataGetLength(a1);
        v5 = 0;
      }
      if (Length >= 3)
      {
        v6 = 2;
        switch(v4[1])
        {
          case 'F':
          case 'H':
            v6 = 5;
            break;
          case 'G':
            break;
          case 'I':
          case 'J':
          case 'M':
          case 'N':
          case 'O':
          case 'P':
          case 'Q':
          case 'R':
            goto LABEL_11;
          case 'K':
            v6 = 9;
            break;
          case 'L':
            v6 = 3;
            break;
          case 'S':
            v6 = 10;
            break;
          default:
            if (v4[1] != 2)
              goto LABEL_11;
            break;
        }
        if (v6 < Length)
        {
          Mutable = CFDataCreateMutable(0, v6);
          CFDataSetLength(Mutable, v6);
          MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
          v9 = 0;
          v10 = 0;
          v11 = v6 + v5;
          v12 = v5 + 1;
          do
          {
            v13 = v4[v12];
            if (v9)
            {
              if (v13 != 27)
              {
                CFRelease(Mutable);
                v5 = v12 - 1;
                goto LABEL_27;
              }
              v9 = 0;
            }
            else
            {
              if (v13 == 27 && ++v11 >= Length)
              {
                CFRelease(Mutable);
                return 0;
              }
              MutableBytePtr[v10++] = v13;
              v9 = v13 == 27;
            }
            v5 = v12 + 1;
          }
          while (v12++ < v11);
          if (!Mutable)
            goto LABEL_27;
          goto LABEL_29;
        }
      }
    }
  }
  return 0;
}

id SCRDEasyLinkExtractEventsFromBuffer(const __CFData *a1, unsigned __int8 *a2, _BYTE *a3)
{
  id v3;
  unsigned __int8 *v4;
  const __CFData *v5;
  __CFData *PacketFromBuffer;
  __CFData *v7;
  const UInt8 *BytePtr;
  int v9;
  int v10;
  id v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  _BYTE *v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  id v27;
  int v28;
  int v29;
  int v30;
  void *v31;
  unsigned int v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  id v37;
  const __CFData *v39;
  id v40;
  _BYTE *v41;
  const UInt8 *v43;

  v3 = 0;
  if (!a1)
    return v3;
  v4 = a2;
  if (!a2 || !a3)
    return v3;
  v5 = a1;
  if (CFDataGetLength(a1) < 3)
    goto LABEL_44;
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  PacketFromBuffer = SCRDEasyLinkCreatePacketFromBuffer(v5);
  if (!PacketFromBuffer)
    goto LABEL_41;
  v7 = PacketFromBuffer;
  v40 = v3;
  v41 = v4;
  v39 = v5;
  do
  {
    BytePtr = CFDataGetBytePtr(v7);
    if (*BytePtr != 75)
      goto LABEL_40;
    v43 = BytePtr;
    v9 = BytePtr[1];
    v10 = *v4;
    v11 = v3;
    v12 = 0;
    v13 = 0;
    v14 = v10 ^ v9;
    v15 = (v10 ^ v9) & v10;
    v16 = v14 & v9;
    LODWORD(v17) = 2;
    v18 = 1;
    do
    {
      if ((v18 & v15) != 0)
      {
        LODWORD(v17) = v17 & 0xFFFE00FF | v12;
      }
      else
      {
        if ((v18 & v16) == 0)
          goto LABEL_14;
        LODWORD(v17) = v12 | v17 & 0xFFFE00FF | 0x10000;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v17);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "addObject:", v19);
      v13 = (void *)v19;
LABEL_14:
      v18 = 2 * v18;
      v12 += 256;
    }
    while (v12 != 1536);
    if ((v15 & 0x40) != 0)
    {
      v20 = 1536;
LABEL_19:
      v17 = v17 & 0xFFFE00FF | v20;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v17);
      v21 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "addObject:", v21);
      v13 = (void *)v21;
      goto LABEL_20;
    }
    v20 = 67072;
    if ((v16 & 0x40) != 0)
      goto LABEL_19;
LABEL_20:
    if ((v15 & 0x80) != 0)
    {
      v23 = 1792;
    }
    else
    {
      if ((v16 & 0x80) == 0)
      {
        v22 = v41;
        goto LABEL_26;
      }
      v23 = 67328;
    }
    v22 = v41;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v23 | v17 & 0xFFFE00FF);
    v24 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObject:", v24);
    v13 = (void *)v24;
LABEL_26:

    *v22 = v43[1];
    v25 = v43[2];
    v26 = *a3;
    v27 = v11;
    v28 = v26 ^ v25;
    v29 = (v26 ^ v25) & v26;
    v30 = v28 & v25;
    if ((v29 & 0x40) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 2050);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v31);
      v29 &= ~0x40u;
      v32 = 2049;
    }
    else if ((v30 & 0x40) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 67586);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addObject:", v31);
      v30 &= ~0x40u;
      v32 = 67585;
    }
    else
    {
      v31 = 0;
      v32 = 1;
    }
    v33 = 0;
    v34 = 1;
    while (2)
    {
      if ((v34 & v29) != 0)
      {
        v32 = v32 & 0xFFFE00FF | v33;
        goto LABEL_36;
      }
      if ((v34 & v30) != 0)
      {
        v32 = v33 | v32 & 0xFFFE00FF | 0x10000;
LABEL_36:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v32);
        v35 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "addObject:", v35);
        v31 = (void *)v35;
      }
      v34 = 2 * v34;
      v33 += 256;
      if (v33 != 2048)
        continue;
      break;
    }

    *a3 = v43[2];
    v3 = v40;
    v4 = v41;
    v5 = v39;
    if (v43[3])
    {
      v36 = (v43[3] << 8) - 256;
      v37 = v27;
      SCRDAppendFullKeystrokeFromEvent(v37, objc_msgSend(v37, "count"), v36);

    }
LABEL_40:
    CFRelease(v7);
    v7 = SCRDEasyLinkCreatePacketFromBuffer(v5);
  }
  while (v7);
LABEL_41:
  if (v3 && !objc_msgSend(v3, "count"))
  {

LABEL_44:
    v3 = 0;
  }
  return v3;
}

CFDataRef _createKeyboardPacketFromBuffer(const __CFData *a1)
{
  CFIndex Length;
  const UInt8 *BytePtr;
  const UInt8 *v4;
  CFIndex v5;
  CFDataRef v7;
  CFRange v8;
  CFRange v9;

  if (!a1)
    return 0;
  Length = CFDataGetLength(a1);
  BytePtr = CFDataGetBytePtr(a1);
  if (Length < 2)
    return 0;
  v4 = BytePtr;
  while (*v4 > 0x3Fu || v4[1] > 7u)
  {
    v8.location = 0;
    v8.length = 1;
    CFDataDeleteBytes(a1, v8);
    v5 = CFDataGetLength(a1);
    v4 = CFDataGetBytePtr(a1);
    if (v5 <= 1)
      return 0;
  }
  v7 = CFDataCreate(0, v4, 2);
  v9.location = 0;
  v9.length = 2;
  CFDataDeleteBytes(a1, v9);
  return v7;
}

id SCRDEasyLinkExtractKeyboardEventsFromBuffer(const __CFData *a1)
{
  id v2;
  CFDataRef KeyboardPacketFromBuffer;
  const __CFData *v4;
  uint64_t v5;
  const UInt8 *BytePtr;
  unsigned int v7;
  int v8;
  char v9;
  unsigned int v10;
  UInt8 v11;
  unsigned int v12;

  if (CFDataGetLength(a1) < 2)
    goto LABEL_19;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  KeyboardPacketFromBuffer = _createKeyboardPacketFromBuffer(a1);
  if (KeyboardPacketFromBuffer)
  {
    v4 = KeyboardPacketFromBuffer;
    v5 = 0;
    do
    {
      BytePtr = CFDataGetBytePtr(v4);
      if ((BytePtr[1] & 1) != 0)
      {
        v7 = 2050;
        SCRDAppendFullKeystrokeFromEvent(v2, v5++, 2050);
      }
      else
      {
        v7 = 2;
      }
      v8 = 0;
      v9 = 1;
      do
      {
        if ((v9 & *BytePtr) != 0)
        {
          v10 = v7 & 0xFFFF00FF;
          v7 = v8 | v7 & 0xFFFF00FF;
          SCRDAppendFullKeystrokeFromEvent(v2, v5++, v8 | v10);
        }
        v9 *= 2;
        v8 += 256;
      }
      while (v8 != 1536);
      v11 = BytePtr[1];
      if ((v11 & 2) != 0)
      {
        v12 = v7 & 0xFFFF00FF;
        v7 = v7 & 0xFFFF00FF | 0x600;
        SCRDAppendFullKeystrokeFromEvent(v2, v5, v12 | 0x600);
        v11 = BytePtr[1];
        ++v5;
      }
      if ((v11 & 4) != 0)
        SCRDAppendFullKeystrokeFromEvent(v2, v5, v7 & 0xFFFF00FF | 0x700);
      v5 = objc_msgSend(v2, "count");
      CFRelease(v4);
      v4 = _createKeyboardPacketFromBuffer(a1);
    }
    while (v4);
  }
  if (v2 && !objc_msgSend(v2, "count"))
  {

LABEL_19:
    v2 = 0;
  }
  return v2;
}

uint64_t SCRDEurobrailleGetModelInfoFromBuffer(const __CFData *a1, int *a2, uint64_t *a3, BOOL *a4)
{
  char v4;
  CFIndex Length;
  char v10;
  char v11;
  unint64_t v12;
  int v13;
  const UInt8 *BytePtr;
  unint64_t v15;
  unint64_t v16;
  const UInt8 *v18;
  int v19;
  int v20;
  BOOL v21;
  CFRange v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  int v26;
  CFIndex v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v4 = 0;
  v35 = *MEMORY[0x24BDAC8D0];
  if (!a1 || !a2 || !a3 || !a4)
    return v4 & 1;
  SCRDAdvanceBufferToPacketStart(a1, 2);
  Length = CFDataGetLength(a1);
  if (Length < 6)
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_64;
  }
  v12 = Length;
  v11 = 0;
  v32 = 0;
  v13 = 0;
  while (1)
  {
    BytePtr = CFDataGetBytePtr(a1);
    v15 = __rev16(*(unsigned __int16 *)(BytePtr + 1));
    v16 = v15 + 2;
    if (v15 <= 0xE && v12 < v16)
      break;
    if (v15 > 0xE || (v18 = BytePtr, BytePtr[v15 + 1] != 3))
    {
      v22.location = 0;
      v10 = 0;
      v16 = 1;
      goto LABEL_38;
    }
    v19 = BytePtr[3];
    if (v19 == 82)
    {
      if (v16 != 6)
        goto LABEL_36;
      v10 = 0;
      *a4 = BytePtr[4] != 80;
      v11 = 1;
    }
    else
    {
      if (v19 != 83)
        goto LABEL_36;
      v20 = BytePtr[4];
      if (v20 != 72 || v16 != 9)
      {
        if (v20 == 84 && v16 == 7)
        {
          _SCROD_LOG();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v18[5]);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v34 = v24;
            _os_log_impl(&dword_2282BD000, v23, OS_LOG_TYPE_DEFAULT, "Euro braille subcode identifier: %@", buf, 0xCu);

          }
          v10 = 0;
          switch(v18[5])
          {
            case 1u:
              v10 = 0;
              v28 = 7;
              goto LABEL_47;
            case 2u:
              v10 = 0;
              v28 = 8;
              goto LABEL_47;
            case 3u:
              v10 = 0;
              v28 = 9;
              goto LABEL_47;
            case 4u:
              v10 = 0;
              v28 = 10;
              goto LABEL_47;
            case 5u:
              v10 = 0;
              v28 = 11;
LABEL_47:
              *a2 = v28;
              goto LABEL_37;
            case 6u:
              v10 = 0;
              *a2 = 12;
              goto LABEL_37;
            case 7u:
              *a2 = 0;
              *a3 = 12;
              goto LABEL_50;
            case 8u:
              LODWORD(v32) = 1;
              *a2 = 1;
              *a3 = 40;
              goto LABEL_52;
            case 9u:
              *a2 = 2;
              v25 = 40;
              goto LABEL_57;
            case 0xAu:
              *a2 = 3;
              v25 = 24;
              goto LABEL_57;
            case 0xBu:
              *a2 = 4;
              v25 = 64;
              goto LABEL_57;
            case 0xCu:
              *a2 = 5;
              v25 = 80;
              goto LABEL_57;
            case 0xFu:
            case 0x10u:
            case 0x11u:
              *a2 = 6;
              v25 = 32;
LABEL_57:
              *a3 = v25;
              v10 = 1;
              break;
            default:
              goto LABEL_37;
          }
          goto LABEL_37;
        }
        if (v20 == 71)
        {
          v26 = BytePtr[5];
          if (v26 == 40)
          {
            LODWORD(v32) = 1;
LABEL_52:
            v10 = BYTE4(v32);
            goto LABEL_37;
          }
          if (v26 == 20)
          {
LABEL_50:
            v13 = 1;
            goto LABEL_52;
          }
        }
LABEL_36:
        v10 = 0;
        goto LABEL_37;
      }
      if (BytePtr[5] != 111 || BytePtr[6] != 115 || BytePtr[7] != 105 || BytePtr[8] != 3)
        goto LABEL_36;
      v21 = BytePtr[9] == 2;
      BYTE4(v32) |= v21;
      v10 = v21 & (v13 | v32);
    }
LABEL_37:
    v22.location = 0;
LABEL_38:
    v22.length = v16;
    CFDataDeleteBytes(a1, v22);
    SCRDAdvanceBufferToPacketStart(a1, 2);
    v27 = CFDataGetLength(a1);
    if ((v10 & 1) == 0)
    {
      v12 = v27;
      if (v27 > 5)
        continue;
    }
    goto LABEL_58;
  }
  v10 = 0;
LABEL_58:
  if ((v32 & 0x100000000) != 0 && ((v13 | v32) & 1) != 0)
  {
    v29 = 40;
    if ((v13 & 1) != 0)
    {
      v29 = 20;
      v30 = 13;
    }
    else
    {
      v30 = 14;
    }
    *a2 = v30;
    *a3 = v29;
  }
LABEL_64:
  v4 = v10 | v11;
  return v4 & 1;
}

id SCRDEurobrailleExtractEventsFromBuffer(const __CFData *a1, unsigned int a2, _BYTE *a3, _BYTE *a4, _BYTE *a5, _BYTE *a6, _BYTE *a7, BOOL *a8)
{
  id v8;
  CFIndex Length;
  CFIndex v18;
  const UInt8 *BytePtr;
  unint64_t v20;
  unint64_t v21;
  unsigned __int8 *v23;
  int v24;
  int v25;
  CFRange v26;
  _BYTE *v28;
  unsigned int v29;

  v8 = 0;
  if (!a8 || !a5 || !a1 || !a3 || !a4 || !a6 || !a7)
    return v8;
  SCRDAdvanceBufferToPacketStart(a1, 2);
  Length = CFDataGetLength(a1);
  if (Length < 6)
    goto LABEL_45;
  v18 = Length;
  v29 = a2;
  v28 = a7;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  do
  {
    BytePtr = CFDataGetBytePtr(a1);
    v20 = __rev16(*(unsigned __int16 *)(BytePtr + 1));
    v21 = v20 + 2;
    if (v20 <= 0xE && v18 < v21)
      break;
    if (v20 <= 0xE)
    {
      v23 = (unsigned __int8 *)BytePtr;
      if (BytePtr[v20 + 1] == 3)
      {
        v24 = BytePtr[3];
        if (v24 == 82)
        {
          if (v21 == 6)
            *a8 = BytePtr[4] != 80;
          goto LABEL_36;
        }
        if (v24 == 75)
        {
          v25 = BytePtr[4];
          if (v25 == 73)
          {
            if (v21 == 8)
              _appendInteractiveKeyboardEvent(BytePtr[5], BytePtr[6], v8);
            goto LABEL_36;
          }
          if (v25 != 67)
          {
            if (v25 == 66 && v21 == 8)
              _appendBrailleKeyboardEvent(BytePtr[5], BytePtr[6], v8);
            goto LABEL_36;
          }
          if (v29 <= 0xE)
          {
            if (((1 << v29) & 0x603F) != 0)
            {
              if (v21 == 10)
              {
                _appendSwitchKeyboardEvent(BytePtr[8], *a3, 0, v8);
                *a3 = v23[8];
                _appendSwitchKeyboardEvent(v23[7], *a4, 16, v8);
                *a4 = v23[7];
                goto LABEL_34;
              }
            }
            else if (v29 == 6 && v21 == 10)
            {
              _appendFunctionKeyboardEvent(BytePtr[8], *a5, v8);
              *a5 = v23[8];
LABEL_34:
              _appendJoystickCommandKeyboardEvent(v23[6], *a6, 6, v8);
              *a6 = v23[6];
              _appendJoystickCommandKeyboardEvent(v23[5], *v28, 11, v8);
              *v28 = v23[5];
            }
          }
        }
LABEL_36:
        v26.location = 0;
        goto LABEL_37;
      }
    }
    v26.location = 0;
    v21 = 1;
LABEL_37:
    v26.length = v21;
    CFDataDeleteBytes(a1, v26);
    SCRDAdvanceBufferToPacketStart(a1, 2);
    v18 = CFDataGetLength(a1);
  }
  while (v18 > 5);
  if (v8 && !objc_msgSend(v8, "count"))
  {

LABEL_45:
    v8 = 0;
  }
  return v8;
}

void _appendBrailleKeyboardEvent(char a1, int a2, void *a3)
{
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v5 = objc_msgSend(v14, "count");
  if ((a1 & 1) != 0)
  {
    v7 = v5 + 1;
    v6 = 2050;
    SCRDAppendFullKeystrokeFromEvent(v14, v5, 2050);
    v5 = v7;
    if ((a1 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v6 = 0;
  if ((a1 & 2) != 0)
  {
LABEL_5:
    v8 = v5 + 1;
    v6 = 2050;
    SCRDAppendFullKeystrokeFromEvent(v14, v5, 2050);
    v5 = v8;
  }
LABEL_6:
  if (a2)
  {
    v9 = 0;
    v10 = v6 & 0xFF0 | 2;
    v11 = 1;
    do
    {
      if ((v11 & a2) != 0)
      {
        v12 = v10 & 0xFFFF00FF;
        v10 = v9 | v10 & 0xFFFF00FF;
        v13 = v5 + 1;
        SCRDAppendFullKeystrokeFromEvent(v14, v5, v9 | v12);
        v5 = v13;
      }
      v11 = 2 * v11;
      v9 += 256;
    }
    while (v9 != 2048);
  }

}

void _appendInteractiveKeyboardEvent(int a1, int a2, void *a3)
{
  id v5;
  int v6;
  id v7;

  v5 = a3;
  v6 = (a2 << 8) - 256;
  v7 = v5;
  if ((a1 - 1) < 2)
    goto LABEL_4;
  if (a1 == 3)
  {
    SCRDAppendFullKeystrokeFromEvent(v5, objc_msgSend(v5, "count"), v6);
LABEL_4:
    SCRDAppendFullKeystrokeFromEvent(v7, objc_msgSend(v7, "count"), v6);
    v5 = v7;
  }

}

void _appendSwitchKeyboardEvent(int a1, int a2, int a3, void *a4)
{
  id v7;
  int v8;
  int v9;
  int v10;
  char v11;
  char v12;
  uint64_t v13;
  int v14;
  _BOOL4 v15;
  int v16;
  BOOL v17;
  _BOOL4 v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  id v26;

  v7 = a4;
  if (a1 == a2)
    goto LABEL_34;
  v26 = v7;
  v24 = objc_msgSend(v7, "count");
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v25 = a3 << 8;
  LODWORD(v13) = 1;
  do
  {
    v14 = a1 & 3;
    v15 = v14 == 3;
    if (v14 == 2)
    {
      v15 = 0;
      v16 = 1;
    }
    else
    {
      v16 = v9;
    }
    v17 = v14 == 1;
    if (v14 == 1)
    {
      v12 = 1;
      v18 = 0;
    }
    else
    {
      v18 = v15;
    }
    if (!v17)
      v9 = v16;
    v19 = a2 & 3;
    if (v19 == 3)
    {
      if (v18)
        goto LABEL_23;
      v13 = (v25 + v8) & 0x7FFEFF00 | v13 & 0xFFFE00FF;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "insertObject:atIndex:", v21, v24);
      goto LABEL_22;
    }
    if (v19 == 1)
      v20 = 1;
    else
      v20 = v10;
    if (v19 == 2)
      v11 = 1;
    else
      v10 = v20;
    if (v18)
    {
      v13 = (v25 + v8) | v13 & 0xFFFE00FF | 0x10000;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v21);
LABEL_22:

    }
LABEL_23:
    LOBYTE(a1) = a1 >> 2;
    LOBYTE(a2) = a2 >> 2;
    v8 += 256;
  }
  while (v8 != 1024);
  if (v11 & 1 | ((v9 & 1) == 0))
  {
    if (!(v9 & 1 | ((v11 & 1) == 0)))
    {
      v13 = v13 & 0xFFFE00FF | (v25 + 1024) & 0xFFFEFFFF;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "insertObject:atIndex:", v22, v24);
      goto LABEL_28;
    }
  }
  else
  {
    v13 = (v25 + 1024) | v13 & 0xFFFE00FF | 0x10000;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v22);
LABEL_28:

  }
  if (v10 & 1 | ((v12 & 1) == 0))
  {
    v7 = v26;
    if (!(v12 & 1 | ((v10 & 1) == 0)))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v13 & 0xFFFE00FF | (v25 + 1280) & 0xFFFEFFFF);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "insertObject:atIndex:", v23, v24);
      goto LABEL_33;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (v25 + 1280) | v13 & 0xFFFE00FF | 0x10000);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v23);
LABEL_33:

    v7 = v26;
  }
LABEL_34:

}

void _appendJoystickCommandKeyboardEvent(int a1, int a2, int a3, void *a4)
{
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  void *v15;
  id v16;

  v16 = a4;
  if (a1 != a2)
  {
    v7 = objc_msgSend(v16, "count");
    v8 = 0;
    v9 = a2 ^ a1;
    v10 = (a2 ^ a1) & a1;
    v11 = v9 & a2;
    v12 = a3 << 8;
    v13 = 1;
    v14 = 1;
    while ((v13 & v10) == 0)
    {
      if ((v13 & v11) != 0)
      {
        v14 = (v12 + v8) & 0x7FFEFF00 | v14 & 0xFFFE00FF;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "insertObject:atIndex:", v15, v7);
        goto LABEL_7;
      }
LABEL_8:
      v13 = 2 * v13;
      v8 += 256;
      if (v8 == 1280)
        goto LABEL_9;
    }
    v14 = v14 & 0xFFFE00FF | (v12 + v8) | 0x10000;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v15);
LABEL_7:

    goto LABEL_8;
  }
LABEL_9:

}

void _appendFunctionKeyboardEvent(int a1, int a2, void *a3)
{
  int v5;
  int v6;
  unsigned int v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a1 != a2)
  {
    v5 = 0;
    v6 = 1;
    v7 = 1;
    do
    {
      if ((v6 & a1) != (v6 & a2))
      {
        v7 = ((v5 + 5632) | v7 & 0xFFFE00FF) + (((v6 & a1) != 0) << 16);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v8);

      }
      v6 = 2 * v6;
      v5 += 256;
    }
    while (v5 != 2048);
  }

}

uint64_t SCRDFTDIConfigureSerialPort(void *a1, unsigned int a2, int a3, int a4, unsigned int a5, uint64_t a6, int a7, int a8, unsigned __int8 a9)
{
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v16 = a1;
  v17 = v16;
  if (a9 < 2u)
    goto LABEL_14;
  LOBYTE(v22) = 0;
  v18 = 0;
  if (!objc_msgSend(v16, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 9, 64, a9, 0, 0, 0, 0.1, 0, v22))goto LABEL_15;
  if (!SCRDFTDISetBaudRate(v17, a2))
  {
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  LOBYTE(v23) = 0;
  if (a8)
    v19 = 514;
  else
    v19 = 512;
  v18 = 0;
  if (objc_msgSend(v17, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 1, 64, v19, 0, 0, 0, 0.1, 0, v23))
  {
    LOBYTE(v24) = 0;
    if (a7)
      v20 = 257;
    else
      v20 = 256;
    v18 = 0;
    if (objc_msgSend(v17, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 1, 64, v20, 0, 0, 0, 0.1, 0, v24))
    {
      LOBYTE(v25) = 0;
      v18 = 0;
      if (objc_msgSend(v17, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 4, 64, a4 | a3 | a5, 0, 0, 0, 0.1, 0, v25))
      {
        LOBYTE(v26) = 0;
        v18 = objc_msgSend(v17, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 2, 64, a6, 0, 0, 0, 0.1, 0, v26);
      }
    }
  }
LABEL_15:

  return v18;
}

uint64_t SCRDFTDISetLatencyTimer(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  if (a2 < 2)
    return 0;
  LOBYTE(v5) = 0;
  return objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 9, 64, a2, 0, 0, 0, 0.1, 0, v5, v2, v3);
}

uint64_t SCRDFTDISetBaudRate(void *a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  if (a2 > 0x2DC6C0)
    return 0;
  v5 = (byte_2282C9F58[(0x16E3600 / a2) & 7] << 14) | ((0x16E3600 / a2) >> 3);
  if (v5 == 16385)
    v6 = 1;
  else
    v6 = (byte_2282C9F58[(0x16E3600 / a2) & 7] << 14) | ((0x16E3600 / a2) >> 3);
  if (v5 == 1)
    v7 = 0;
  else
    v7 = v6;
  LOBYTE(v8) = 0;
  return objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 3, 64, (unsigned __int16)v7, HIWORD(v7), 0, 0, 0.1, 0, v8, v2, v3);
}

uint64_t SCRDFTDISetRTS(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v4;

  LOBYTE(v4) = 0;
  if (a2)
    v2 = 514;
  else
    v2 = 512;
  return objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 1, 64, v2, 0, 0, 0, 0.1, 0, v4);
}

uint64_t SCRDFTDISetDTR(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v4;

  LOBYTE(v4) = 0;
  if (a2)
    v2 = 257;
  else
    v2 = 256;
  return objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 1, 64, v2, 0, 0, 0, 0.1, 0, v4);
}

uint64_t SCRDFTDISetDataFormat(void *a1, int a2, int a3, unsigned int a4)
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  return objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 4, 64, a3 | a2 | a4, 0, 0, 0, 0.1, 0, v5);
}

uint64_t SCRDFTDISetFlowControl(void *a1, uint64_t a2)
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  return objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 2, 64, a2, 0, 0, 0, 0.1, 0, v3);
}

uint64_t SCRDFTDIResetDevice(void *a1)
{
  uint64_t v2;

  LOBYTE(v2) = 0;
  return objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 0, 64, 0, 0, 0, 0, 0.1, 0, v2);
}

uint64_t SCRDFTDIReallyResetDevice(void *a1)
{
  unsigned int v2;
  uint64_t result;
  BOOL v4;
  uint64_t v5;

  v2 = 0;
  do
  {
    LOBYTE(v5) = 0;
    result = objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 0, 64, 0, 0, 0, 0, 0.1, 0, v5);
    if ((_DWORD)result)
      v4 = v2 >= 5;
    else
      v4 = 1;
    ++v2;
  }
  while (!v4);
  return result;
}

uint64_t SCRDFTDIPurgeBuffers(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  LOBYTE(v4) = 0;
  v2 = 0;
  if (objc_msgSend(v1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 0, 64, 1, 0, 0, 0, 0.1, 0, v4))
  {
    LOBYTE(v5) = 0;
    v2 = objc_msgSend(v1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 0, 64, 2, 0, 0, 0, 0.1, 0, v5);
  }

  return v2;
}

uint64_t SCRDFTDIGetLatencyTimer(void *a1)
{
  int v1;
  unsigned __int8 v2;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v6 = 0;
  v5 = 0;
  LOBYTE(v4) = 0;
  v1 = objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 10, 192, 0, 0, &v6, 1, 0.1, &v5, v4);
  v2 = v6;
  if (!v1)
    return 0;
  return v2;
}

uint64_t SCRDFTDIGetModemStatus(void *a1)
{
  int v1;
  unsigned int v2;
  uint64_t v4;

  LOBYTE(v4) = 0;
  v1 = objc_msgSend(a1, "sendControlRequest:type:value:index:data:size:sizeTransferred:pipe:timeout:", 5, 192, 0, 0, (char *)&v4 + 6, 2, 0.1, 0, v4);
  v2 = bswap32(HIWORD(v4)) >> 16;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t SCRDFreedomScientificDoesDeviceUseStandardCellOrder(unsigned int a1)
{
  return (a1 < 0xC) & (0xFA6u >> a1);
}

const __CFData *SCRDFreedomScientificDoesBufferContainACKPacket(const __CFData *result)
{
  const __CFData *v1;
  const __CFData *v2;
  const UInt8 *BytePtr;
  int v4;

  if (result)
  {
    v1 = result;
    result = SCRDFreedomScientificCreatePacketFromBuffer(result);
    if (result)
    {
      v2 = result;
      do
      {
        BytePtr = CFDataGetBytePtr(v2);
        if (CFDataGetLength(v2) < 1)
        {
          CFRelease(v2);
        }
        else
        {
          v4 = *BytePtr;
          CFRelease(v2);
          if (v4 == 1)
            return (const __CFData *)1;
        }
        result = SCRDFreedomScientificCreatePacketFromBuffer(v1);
        v2 = result;
      }
      while (result);
    }
  }
  return result;
}

CFDataRef SCRDFreedomScientificCreatePacketFromBuffer(const __CFData *a1)
{
  CFIndex Length;
  const UInt8 *BytePtr;
  const UInt8 *v4;
  CFIndex v5;
  char v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  char *v11;
  char v12;
  CFDataRef v13;
  CFRange v15;
  CFRange v16;

  if (a1)
  {
    Length = CFDataGetLength(a1);
    BytePtr = CFDataGetBytePtr(a1);
    if (Length >= 1)
    {
      v4 = BytePtr;
      v5 = 0;
      v6 = 0;
      while (1)
      {
        if ((v6 & 1) != 0)
        {
          v15.location = 0;
          v15.length = v5;
          CFDataDeleteBytes(a1, v15);
          v4 = CFDataGetBytePtr(a1);
          Length = CFDataGetLength(a1);
        }
        if ((unint64_t)Length < 4)
          return 0;
        v7 = *v4;
        if (v7 == 128)
        {
          v8 = v4[1];
          if (v8 == 48)
            goto LABEL_14;
        }
        else if (v7 == 130)
        {
          v8 = v4[1];
          if (v8 == 4)
          {
LABEL_14:
            v5 = (v8 + 5);
            if (Length < v5)
              return 0;
            v9 = v4[1];
            v10 = -(v7 + v9 + v4[2] + v4[3]);
            if (v4[1])
            {
              v11 = (char *)(v4 + 4);
              do
              {
                v12 = *v11++;
                LOBYTE(v10) = v10 - v12;
                --v9;
              }
              while (v9);
            }
            if (v4[v5 - 1] == v10)
              goto LABEL_25;
          }
        }
        else if ((v7 - 1) < 5)
        {
          if (Length < 4)
            return 0;
          v5 = 4;
LABEL_25:
          v13 = CFDataCreate(0, v4, v5);
LABEL_26:
          v16.location = 0;
          v16.length = v5;
          CFDataDeleteBytes(a1, v16);
          return v13;
        }
        v5 = 1;
        v6 = 1;
        if (Length <= 1)
        {
          v13 = 0;
          goto LABEL_26;
        }
      }
    }
  }
  return 0;
}

uint64_t SCRDFreedomScientificDeviceIDForInfoEventPacket(const __CFData *a1)
{
  const UInt8 *BytePtr;
  void *v3;
  void *v4;
  float v5;
  float v6;
  uint64_t v7;
  float v9;
  unsigned int v10;
  __int128 v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  BytePtr = CFDataGetBytePtr(a1);
  if (CFDataGetLength(a1) != 53 || *BytePtr != 128)
    return 0;
  v11 = *(_OWORD *)(BytePtr + 28);
  v12 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v11);
  *(_QWORD *)&v11 = *(_QWORD *)(BytePtr + 44);
  BYTE8(v11) = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v11);
  objc_msgSend(v4, "floatValue");
  v6 = v5;
  if ((objc_msgSend(v3, "isEqualToString:", kSCRDFreedomScientificFocus14ModelName) & 1) != 0)
  {
    v7 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", kSCRDFreedomScientificFocus40ModelName))
  {
    v9 = floorf(v6);
    if (v9 == 5.0)
      v10 = 8;
    else
      v10 = 1;
    if (v9 == 4.0)
      v7 = 2;
    else
      v7 = v10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kSCRDFreedomScientificFocus44ModelName) & 1) != 0)
  {
    v7 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kSCRDFreedomScientificFocus70ModelName) & 1) != 0)
  {
    v7 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", kSCRDFreedomScientificFocus80ModelName))
  {
    if (floorf(v6) == 5.0)
      v7 = 9;
    else
      v7 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kSCRDFreedomScientificFocus84ModelName) & 1) != 0)
  {
    v7 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", kSCRDFreedomScientificPacMate20ModelName) & 1) != 0)
  {
    v7 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", kSCRDFreedomScientificPacMate40ModelName))
  {
    v7 = 11;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id SCRDFreedomScientificExtractEventsFromBuffer(const __CFData *a1, _BYTE *a2, _BYTE *a3, _BYTE *a4, _BYTE *a5)
{
  id v5;
  const __CFData *v10;
  CFDataRef PacketFromBuffer;
  const __CFData *v12;
  const UInt8 *BytePtr;
  unsigned int v14;
  id v15;
  const UInt8 *v16;
  id v17;
  const UInt8 *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const UInt8 *v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  unsigned int m;
  unsigned int v41;
  unsigned int j;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  int v52;
  unsigned int v53;
  unsigned int k;
  unsigned int v55;
  unsigned int i;
  uint64_t v57;
  char v58;
  int v59;
  int v60;
  char v61;
  int v62;
  uint64_t v63;
  int v64;
  int v65;
  char v66;
  char v67;
  int v68;
  uint64_t v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  unsigned int v75;
  char v76;
  int v77;
  int v78;
  char v79;
  uint64_t v80;
  _BYTE *v82;
  _BYTE *v83;
  _BYTE *v84;
  _BYTE *v85;
  const __CFData *v86;
  id v87;
  const UInt8 *v88;

  v5 = 0;
  if (a1 && a2 && a3 && a4 && a5)
  {
    v10 = a1;
    if ((unint64_t)CFDataGetLength(a1) < 4)
    {
LABEL_96:
      v5 = 0;
      return v5;
    }
    v82 = a2;
    v83 = a3;
    v84 = a4;
    v85 = a5;
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    PacketFromBuffer = SCRDFreedomScientificCreatePacketFromBuffer(v10);
    if (PacketFromBuffer)
    {
      v12 = PacketFromBuffer;
      v86 = v10;
      v87 = v5;
      while (1)
      {
        BytePtr = CFDataGetBytePtr(v12);
        if (CFDataGetLength(v12) < 1)
          goto LABEL_93;
        v14 = *BytePtr;
        if (v14 > 4)
        {
          if (v14 == 5)
          {
            v17 = v5;
            v38 = objc_msgSend(v17, "count");
            v39 = CFDataGetBytePtr(v12)[1];
            if ((v39 & 0x10) != 0)
            {
              if ((v39 & 8) != 0)
              {
                v55 = v39 ^ 0x18;
                if (v55)
                {
                  for (i = 0; i < v55; ++i)
                    SCRDAppendFullKeystrokeFromEvent(v17, v38++, 769);
                }
              }
              else
              {
                v41 = v39 ^ 0x10;
                if (v41)
                {
                  for (j = 0; j < v41; ++j)
                    SCRDAppendFullKeystrokeFromEvent(v17, v38++, 1025);
                }
              }
            }
            else if ((v39 & 8) != 0)
            {
              v53 = v39 ^ 8;
              if (v53)
              {
                for (k = 0; k < v53; ++k)
                  SCRDAppendFullKeystrokeFromEvent(v17, v38++, 257);
              }
            }
            else if (v39)
            {
              for (m = 0; m < v39; ++m)
                SCRDAppendFullKeystrokeFromEvent(v17, v38++, 1);
            }
            goto LABEL_92;
          }
          if (v14 == 130)
          {
            v17 = v5;
            v18 = CFDataGetBytePtr(v12);
            v19 = *v85;
            v20 = v18[4];
            *v85 = v20;
            v21 = v20 ^ v19;
            if (v20 == v19)
            {
LABEL_92:

              goto LABEL_93;
            }
            v15 = 0;
            v22 = v21 & v19;
            v23 = v21 & v20;
            v24 = 16;
            v25 = 2816;
            LODWORD(v26) = 1;
            while (2)
            {
              if ((v24 & v22) != 0)
              {
                v26 = v26 & 0xFFFE00FF | (unint64_t)v25;
                goto LABEL_22;
              }
              if ((v24 & v23) != 0)
              {
                v26 = v25 | v26 & 0xFFFE00FF | 0x10000;
LABEL_22:
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v26);
                v27 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v17, "addObject:", v27);
                v15 = (id)v27;
              }
              v24 = (2 * v24) & 0x1E0;
              v25 += 256;
              if (v25 == 3840)
                goto LABEL_90;
              continue;
            }
          }
          goto LABEL_93;
        }
        if (v14 == 3)
          break;
        if (v14 == 4)
        {
          v15 = v5;
          v16 = CFDataGetBytePtr(v12);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (16 * (v16[3] & 0xF)) | ((unint64_t)(v16[2] != 0) << 16) | ((unint64_t)v16[1] << 8));
          v17 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v17);
LABEL_91:

          goto LABEL_92;
        }
LABEL_93:
        CFRelease(v12);
        v12 = SCRDFreedomScientificCreatePacketFromBuffer(v10);
        if (!v12)
          goto LABEL_94;
      }
      v17 = v5;
      v28 = CFDataGetBytePtr(v12);
      v29 = *v82;
      v88 = v28;
      v30 = v28[1];
      *v82 = v30;
      v31 = v30 ^ v29;
      if (v30 != v29)
      {
        v32 = 0;
        v15 = 0;
        v33 = v31 & v29;
        v34 = v31 & v30;
        LODWORD(v35) = 2;
        v36 = 1;
        while ((v36 & v33) == 0)
        {
          if ((v36 & v34) != 0)
          {
            LODWORD(v35) = v32 | v35 & 0xFFFE00FF | 0x10000;
            goto LABEL_31;
          }
LABEL_32:
          v36 = 2 * v36;
          v32 += 256;
          if (v32 == 2048)
            goto LABEL_46;
        }
        LODWORD(v35) = v35 & 0xFFFE00FF | v32;
LABEL_31:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v35);
        v37 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "addObject:", v37);
        v15 = (id)v37;
        goto LABEL_32;
      }
      v15 = 0;
      LODWORD(v35) = 0;
LABEL_46:
      v43 = *v83;
      v44 = v88[2];
      *v83 = v44;
      v45 = v44 ^ v43;
      if (v44 != v43)
      {
        v46 = v45 & v43;
        v47 = v45 & v44;
        if ((v45 & v43 & 4) != 0)
        {
          v48 = 2306;
LABEL_51:
          v35 = v35 & 0xFFFE00F0 | v48;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v35);
          v49 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "addObject:", v49);
          v15 = (id)v49;
        }
        else if ((v47 & 4) != 0)
        {
          v48 = 67842;
          goto LABEL_51;
        }
        if ((v46 & 8) != 0)
        {
          v50 = 2306;
LABEL_56:
          v35 = v35 & 0xFFFE00F0 | v50;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v35);
          v51 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "addObject:", v51);
          v15 = (id)v51;
        }
        else if ((v47 & 8) != 0)
        {
          v50 = 67842;
          goto LABEL_56;
        }
        if ((v46 & 0x80) != 0)
        {
          v52 = 2050;
LABEL_69:
          v35 = v35 & 0xFFFE00F0 | v52;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v35);
          v57 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "addObject:", v57);
          v15 = (id)v57;
        }
        else if ((v47 & 0x80) != 0)
        {
          v52 = 67586;
          goto LABEL_69;
        }
        v58 = 1;
        v59 = 1280;
        v60 = 1;
        while (2)
        {
          v61 = v58;
          if ((v60 & v46) != 0)
          {
            v62 = 1;
            goto LABEL_74;
          }
          v62 = 65537;
          if ((v60 & v47) != 0)
          {
LABEL_74:
            v35 = v59 | v62 | v35 & 0xFFFE00F0;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v35);
            v63 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "addObject:", v63);
            v15 = (id)v63;
          }
          v58 = 0;
          v60 = 2 * v60;
          v59 = 1536;
          if ((v61 & 1) != 0)
            continue;
          break;
        }
        v64 = 16;
        v65 = 1792;
        v66 = 1;
        while (2)
        {
          v67 = v66;
          if ((v64 & v46) != 0)
          {
            v68 = 1;
            goto LABEL_80;
          }
          v68 = 65537;
          if ((v64 & v47) != 0)
          {
LABEL_80:
            v35 = v65 | v68 | v35 & 0xFFFE00F0;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v35);
            v69 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "addObject:", v69);
            v15 = (id)v69;
          }
          v66 = 0;
          v64 = (2 * v64) & 0x1E0;
          v65 = 2048;
          if ((v67 & 1) == 0)
            break;
          continue;
        }
      }
      v70 = *v84;
      v71 = v88[3];
      *v84 = v71;
      v72 = v71 ^ v70;
      if (v71 == v70)
      {
LABEL_90:
        v10 = v86;
        v5 = v87;
        goto LABEL_91;
      }
      v73 = v72 & v70;
      v74 = v72 & v71;
      v75 = v35 & 0xFFFFFFF0 | 1;
      v76 = 1;
      v77 = 2304;
      v78 = 1;
      while (1)
      {
        v79 = v76;
        if ((v78 & v73) != 0)
          break;
        if ((v78 & v74) != 0)
        {
          v75 = v77 | v75 & 0xFFFE00FF | 0x10000;
          goto LABEL_88;
        }
LABEL_89:
        v76 = 0;
        v78 = 2 * v78;
        v77 = 2560;
        if ((v79 & 1) == 0)
          goto LABEL_90;
      }
      v75 = v75 & 0xFFFE00FF | v77;
LABEL_88:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v75);
      v80 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "addObject:", v80);
      v15 = (id)v80;
      goto LABEL_89;
    }
LABEL_94:
    if (!objc_msgSend(v5, "count"))
    {

      goto LABEL_96;
    }
  }
  return v5;
}

__CFData *SCRDFreedomScientificCreateWriteRequestPacket(const void *a1, int64_t a2, char a3)
{
  CFIndex v6;
  UInt8 *v7;
  UInt8 *v8;
  _BYTE *v9;
  _BYTE *v10;
  int64_t v11;
  char v12;
  uint64_t v13;
  char *v14;
  char v15;
  __CFData *v16;
  __CFData *Mutable;

  v6 = a2 + 5;
  v7 = (UInt8 *)malloc_type_calloc(1uLL, a2 + 5, 0x1BBADA17uLL);
  if (!v7)
    return 0;
  v8 = v7;
  *v7 = -127;
  v7[1] = a2;
  *((_WORD *)v7 + 1) = 0;
  v9 = v7 + 4;
  if (a2 >= 1)
  {
    memcpy(v7 + 4, a1, a2);
    if ((a3 & 1) == 0)
    {
      v10 = v9;
      v11 = a2;
      do
      {
        *v10 = (*v10 >> 3) & 8 | *v10 & 0x87 | (2 * *v10) & 0x70;
        ++v10;
        --v11;
      }
      while (v11);
    }
  }
  if ((_BYTE)a2)
  {
    v12 = a2 ^ 0x7F;
    v13 = a2;
    v14 = v9;
    do
    {
      v15 = *v14++;
      v12 -= v15;
      --v13;
    }
    while (v13);
  }
  else
  {
    v12 = 127;
  }
  v9[a2] = v12;
  Mutable = CFDataCreateMutable(0, v6);
  v16 = Mutable;
  if (Mutable)
    CFDataAppendBytes(Mutable, v8, v6);
  free(v8);
  return v16;
}

BOOL SCRDHIMSIsPacketValid(uint64_t a1, __int16 a2)
{
  uint64_t v2;

  v2 = 0;
  if (a1 == 250 && (a2 & 0xFF00) == 0xFB00 && (a1 & 0xFF0000) != 0)
    return (BYTE1(a1) + BYTE2(a1) + BYTE3(a1) + BYTE4(a1) + BYTE5(a1) + BYTE6(a1) + HIBYTE(a1) - 11) == a2;
  return v2;
}

_BYTE *SCRDHIMSCreateRequest(char a1, char a2, unsigned int a3, char *a4, uint64_t a5, unsigned int *a6)
{
  unsigned int v12;
  _BYTE *v13;
  _BYTE *v14;
  char v15;
  uint64_t v16;
  _BYTE *v17;
  char v18;
  _BYTE *v19;

  v12 = a3 + 19;
  v13 = malloc_type_malloc(a3 + 19, 0x4EAF5021uLL);
  v14 = v13;
  if (!v13)
  {
    v12 = 0;
    if (!a6)
      return v14;
    goto LABEL_11;
  }
  *v13 = a1;
  v13[1] = a1;
  v13[2] = a2;
  v13[3] = -16;
  v13[4] = a3;
  v15 = a2 + 2 * a1 + a3 - 16;
  v13[5] = 0;
  if (a3 >= a5)
    v16 = a5;
  else
    v16 = a3;
  if (v16 >= 1)
  {
    v17 = v13 + 6;
    do
    {
      v18 = *a4++;
      *v17++ = v18;
      v15 += v18;
      --v16;
    }
    while (v16);
  }
  if (a3 > a5)
    bzero(&v13[a5 + 6], a3 - a5);
  v19 = &v14[a3];
  *(_QWORD *)(v19 + 6) = 0xF3000000F2F1;
  *((_WORD *)v19 + 7) = 0;
  v19[16] = v15 - 48;
  *(_WORD *)(v19 + 17) = -515;
  if (a6)
LABEL_11:
    *a6 = v12;
  return v14;
}

uint64_t SCRDHIMSFillPacket(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = *(_BYTE *)a2;
  *(_BYTE *)(result + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(result + 2) = *(_BYTE *)(a2 + 2);
  *(_BYTE *)(result + 3) = *(_BYTE *)(a2 + 3);
  *(_DWORD *)(result + 4) = *(_DWORD *)(a2 + 4);
  *(_BYTE *)(result + 8) = *(_BYTE *)(a2 + 8);
  *(_BYTE *)(result + 9) = *(_BYTE *)(a2 + 9);
  return result;
}

id SCRDHIMSBrailleSenseExtractEventsFromBuffer(const __CFData *a1, uint64_t a2)
{
  return _SCRDHIMSExtractEventsFromBuffer(a1, (void (*)(void *, unint64_t, unint64_t, uint64_t))_SCRDHIMSBrailleSenseAppendEventsFromKeyPacket, a2);
}

id _SCRDHIMSExtractEventsFromBuffer(const __CFData *a1, void (*a2)(void *, unint64_t, unint64_t, uint64_t), uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  void *v8;
  const UInt8 *BytePtr;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  CFRange v15;
  void *v16;
  id v17;

  if (a1 && CFDataGetLength(a1) && (SCRDAdvanceBufferToPacketStart(a1, 250), CFDataGetLength(a1) >= 10))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      BytePtr = CFDataGetBytePtr(a1);
      v10 = BytePtr[1];
      v11 = BytePtr[3];
      v12 = *((unsigned __int16 *)BytePtr + 4);
      v13 = *BytePtr | (unint64_t)(v10 << 8) | ((unint64_t)BytePtr[2] << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)*((unsigned int *)BytePtr + 1) << 32) | ((unint64_t)BytePtr[3] << 24);
      v4 = v4 & 0xFFFFFFFFFFFF0000 | v12;
      if (SCRDHIMSIsPacketValid(v13, v4))
      {
        if ((_DWORD)v10 == 1)
        {
          v3 = v3 & 0xFFFFFFFFFFFF0000 | v12;
          a2(v8, v13, v3, a3);
        }
        else if (!(_DWORD)v10)
        {
          v14 = v8;
          SCRDAppendFullKeystrokeFromEvent(v14, objc_msgSend(v14, "count"), (unsigned __int16)(v11 << 8));

        }
        v15.location = 0;
        v15.length = 10;
      }
      else
      {
        v15.location = 0;
        v15.length = 1;
      }
      CFDataDeleteBytes(a1, v15);
      SCRDAdvanceBufferToPacketStart(a1, 250);
    }
    while (CFDataGetLength(a1) > 9);
    if (objc_msgSend(v8, "count"))
      v16 = v8;
    else
      v16 = 0;
    v17 = v16;

  }
  else
  {
    v17 = 0;
  }
  return v17;
}

void _SCRDHIMSBrailleSenseAppendEventsFromKeyPacket(void *a1, unint64_t a2, uint64_t a3, int a4)
{
  unint64_t v5;
  uint64_t v6;
  int v7;
  char v8;
  unsigned int v9;
  char v10;
  char v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;
  unsigned __int8 v19;
  int v20;
  void *v21;
  int v22;
  id v23;

  v22 = HIDWORD(a2);
  v5 = a2 >> 40;
  v23 = a1;
  v6 = objc_msgSend(v23, "count");
  v7 = 0;
  v8 = 0;
  v9 = 1;
  v10 = 1;
  do
  {
    v11 = v10;
    if ((v10 & v5) != 0)
    {
      v12 = v9 & 0xFFFF00F0;
      v13 = v7 - 1;
      if (v7 == 4)
        v14 = 1;
      else
        v14 = v7 - 1;
      if (v7 == 2)
        v14 = 3;
      if (a4 == 1)
        v13 = v14;
      v15 = v12 | (v13 << 8) | 1;
      v16 = v12 | 0x802;
      if (v7)
      {
        v9 = v15;
      }
      else
      {
        v8 = 1;
        v9 = v16;
      }
      SCRDAppendFullKeystrokeFromEvent(v23, v6++, v9);
    }
    v10 = 2 * v11;
    ++v7;
  }
  while (v7 != 7);
  v17 = 0;
  v18 = 0;
  v19 = 1;
  do
  {
    v20 = v19;
    while ((v20 & v22) != 0)
    {
      if (v17 != 6 || (v8 & 1) == 0)
      {
        v9 = v9 & 0xFFFF00F0 | (v17 << 8) | 2;
        SCRDAppendFullKeystrokeFromEvent(v23, v6++, v9);
        break;
      }
      objc_msgSend(v23, "indexesOfObjectsPassingTest:", &__block_literal_global);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeObjectsAtIndexes:", v21);

      v8 = 0;
      v20 = 2 * (v20 & 0x7F);
      v18 = 1;
      v17 = 7;
    }
    v19 = 2 * v20;
    ++v17;
  }
  while (v17 != 8);
  if ((v18 & 1) != 0)
    SCRDAppendFullKeystrokeFromEvent(v23, 0, 2306);

}

id SCRDHIMSSyncBrailleExtractEventsFromBuffer(const __CFData *a1, uint64_t a2)
{
  return _SCRDHIMSExtractEventsFromBuffer(a1, (void (*)(void *, unint64_t, unint64_t, uint64_t))_SCRDHIMSSyncBrailleAppendEventsFromKeyPacket, a2);
}

void _SCRDHIMSSyncBrailleAppendEventsFromKeyPacket(void *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  char v6;
  char v7;
  unsigned int v8;
  id v9;

  v2 = a2 >> 40;
  v9 = a1;
  v3 = objc_msgSend(v9, "count");
  v4 = 0;
  v5 = 1;
  v6 = 16;
  do
  {
    v7 = v6 & 0xFE;
    if ((v6 & 0xFE & v2) != 0)
    {
      v8 = v5 & 0xFFFF00FF;
      v5 = v4 | v5 & 0xFFFF00FF;
      SCRDAppendFullKeystrokeFromEvent(v9, v3, v4 | v8);
    }
    v6 = 2 * v7;
    v4 += 256;
  }
  while (v4 != 1024);

}

id SCRDHIMSBrailleEDGEExtractEventsFromBuffer(const __CFData *a1, uint64_t a2)
{
  return _SCRDHIMSExtractEventsFromBuffer(a1, (void (*)(void *, unint64_t, unint64_t, uint64_t))_SCRDHIMSBrailleEDGEAppendEventsFromKeyPacket, a2);
}

void _SCRDHIMSBrailleEDGEAppendEventsFromKeyPacket(void *a1, unint64_t a2, uint64_t a3, int a4)
{
  unint64_t v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v6 = a2 >> 40;
  v26 = a1;
  v7 = objc_msgSend(v26, "count");
  v8 = 1;
  v9 = -2;
  v10 = 1;
  do
  {
    v11 = v8;
    if ((v8 & v6) != 0)
    {
      v12 = v10 & 0xFFFF00F0;
      v13 = v9 + 1;
      if (v9 == 2)
        v13 = 1;
      if (!v9)
        v13 = 3;
      if (a4 != 1)
        v13 = v9 + 1;
      v14 = v12 | (v13 << 8) | 1;
      v15 = v12 | 0x802;
      if (v9 == -2)
        v10 = v15;
      else
        v10 = v14;
      v16 = v7 + 1;
      SCRDAppendFullKeystrokeFromEvent(v26, v7, v10);
      v7 = v16;
    }
    v8 = 2 * v11;
    ++v9;
  }
  while (v9 != 3);
  v17 = 0;
  v18 = HIBYTE(a2);
  v19 = HIWORD(a2);
  v20 = 1;
  v21 = HIDWORD(a2);
  do
  {
    v22 = v20;
    if ((v20 & v21) != 0)
    {
      v10 = v17 | v10 & 0xFFFF00F0 | 2;
      v23 = v7 + 1;
      SCRDAppendFullKeystrokeFromEvent(v26, v7, v10);
      v7 = v23;
    }
    if ((v20 & v19) != 0)
    {
      v10 = v17 + (v10 & 0xFFFF00F0) + 1793;
      v24 = v7 + 1;
      SCRDAppendFullKeystrokeFromEvent(v26, v7, v10);
      v7 = v24;
    }
    if ((v20 & v18) != 0)
    {
      v10 = v17 + (v10 & 0xFFFF00F0) + 3841;
      v25 = v7 + 1;
      SCRDAppendFullKeystrokeFromEvent(v26, v7, v10);
      v7 = v25;
    }
    v20 = 2 * v22;
    v17 += 256;
  }
  while (v17 != 2048);

}

uint64_t SCRDHandyTechDisplayUsesExtendedProtocol(int a1)
{
  uint64_t result;
  unsigned int v3;

  if ((a1 - 84) <= 0x36 && ((1 << (a1 - 84)) & 0x4DE00000012001) != 0)
    return 1;
  result = 0;
  v3 = a1 - 164;
  if (v3 <= 4 && ((1 << v3) & 0x15) != 0)
    return 1;
  return result;
}

uint64_t SCRDHandyTechDisplaySizeForDeviceID(int a1)
{
  uint64_t result;

  result = 16;
  if (a1 <= 113)
  {
    if (a1 > 67)
    {
      if (a1 > 96)
      {
        if (a1 == 97)
          return result;
        if (a1 == 100)
          return 40;
      }
      else if (a1 == 68 || a1 == 84)
      {
        return 40;
      }
      return 0;
    }
    if (a1 != 5)
    {
      if (a1 != 54)
      {
        if (a1 == 56)
          return 88;
        return 0;
      }
      return 64;
    }
    return 40;
  }
  if (a1 > 163)
  {
    if (a1 != 164)
    {
      if (a1 != 166)
      {
        if (a1 == 168)
          return 80;
        return 0;
      }
      return 64;
    }
    return 40;
  }
  switch(a1)
  {
    case 114:
    case 130:
      result = 20;
      break;
    case 116:
    case 132:
      return 40;
    case 120:
    case 135:
      return 80;
    case 129:
      return result;
    case 131:
      result = 32;
      break;
    case 134:
      return 64;
    case 138:
      result = 48;
      break;
    default:
      return 0;
  }
  return result;
}

id SCRDHandyTechExtractEventsFromBuffer(const __CFData *a1, int a2, char *a3, BOOL *a4)
{
  id v4;
  CFIndex Length;
  unint64_t v10;
  id v11;
  CFIndex v12;
  unint64_t v13;
  const UInt8 *BytePtr;
  char v15;
  uint64_t v16;
  unsigned __int8 v17;
  CFIndex v18;
  char *v19;
  uint64_t v20;
  char v21;
  __CFData *v22;
  CFRange v23;
  CFIndex v24;
  UInt8 v26;
  UInt8 buffer;
  CFRange v28;
  CFRange v29;
  CFRange v30;
  CFRange v31;

  v4 = 0;
  if (!a1 || !a3 || !a4)
    return v4;
  buffer = 0;
  Length = CFDataGetLength(a1);
  if (Length < 1)
    goto LABEL_36;
  v10 = Length;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  do
  {
    v28.location = 0;
    v28.length = 1;
    CFDataGetBytes(a1, v28, &buffer);
    if (buffer == 254)
    {
      if (v10 < 2)
      {
        v15 = 1;
        *a4 = 1;
LABEL_29:
        v22 = a1;
        v23.location = 0;
        v23.length = 1;
      }
      else
      {
        v26 = 0;
        v15 = 1;
        v30.location = 1;
        v30.length = 1;
        CFDataGetBytes(a1, v30, &v26);
        *a4 = v26 != a2;
        v22 = a1;
        v23.location = 0;
        v23.length = 2;
      }
      CFDataDeleteBytes(v22, v23);
      goto LABEL_31;
    }
    if (buffer == 126)
    {
      v15 = 1;
      v31.location = 0;
      v31.length = 1;
      CFDataDeleteBytes(a1, v31);
      goto LABEL_31;
    }
    if (buffer != 121)
    {
      _appendEventForKeyCode(v4, buffer, a2, a3);
      v15 = 1;
      goto LABEL_29;
    }
    v11 = v4;
    v12 = CFDataGetLength(a1);
    if (v12 >= 5 && (v13 = v12, BytePtr = CFDataGetBytePtr(a1), *BytePtr == 121) && BytePtr[1] == a2)
    {
      v15 = 0;
      v16 = BytePtr[2];
      v17 = v16 - 1;
      if (!BytePtr[2])
        v17 = 0;
      v18 = v16 + 4;
      if (v13 >= v16 + 4)
      {
        if (v16 >= 2 && BytePtr[3] == 4)
        {
          v19 = (char *)(BytePtr + 4);
          if ((v17 & 0xFE) != 0)
            v20 = v17;
          else
            v20 = 1;
          do
          {
            v21 = *v19++;
            _appendEventForKeyCode(v11, v21, a2, a3);
            --v20;
          }
          while (v20);
        }
        v29.location = 0;
        v29.length = v18;
        CFDataDeleteBytes(a1, v29);
        v15 = 1;
      }
    }
    else
    {
      v15 = 0;
    }

LABEL_31:
    v24 = CFDataGetLength(a1);
    if (v24 < 1)
      break;
    v10 = v24;
  }
  while ((v15 & 1) != 0);
  if (v4 && !objc_msgSend(v4, "count"))
  {

LABEL_36:
    v4 = 0;
  }
  return v4;
}

void _appendEventForKeyCode(void *a1, char a2, int a3, char *a4)
{
  id v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  int v14;
  char v15;
  void *v16;
  int v17;
  int v18;
  char v19;
  id v20;

  v7 = a1;
  v8 = a2 & 0x7F;
  if (v8 <= 0x73)
  {
    v9 = 1538;
    switch(a2 & 0x7F)
    {
      case 1:
      case 2:
      case 5:
      case 6:
      case 9:
      case 0xA:
      case 0xD:
      case 0xE:
      case 0x11:
      case 0x12:
      case 0x15:
      case 0x16:
      case 0x19:
      case 0x1A:
      case 0x1D:
      case 0x1E:
        goto LABEL_10;
      case 3:
        goto LABEL_46;
      case 4:
        v10 = (a3 - 54);
        if (v10 > 0x3E)
          goto LABEL_6;
        if (((1 << (a3 - 54)) & 0x5000480040000005) != 0)
          goto LABEL_8;
        if (v10 == 14)
          goto LABEL_70;
LABEL_6:
        if ((a3 - 120) <= 0x30 && ((1 << (a3 - 120)) & 0x1500000000001) != 0)
        {
LABEL_8:
          v9 = 2817;
          goto LABEL_46;
        }
        if (a3 != 5)
          goto LABEL_47;
        v9 = 10753;
        goto LABEL_46;
      case 7:
        v12 = (a3 + 127) >= 0xAu;
        v9 = 514;
        v13 = 7425;
        goto LABEL_44;
      case 8:
        v11 = (a3 - 54);
        if (v11 > 0x3E)
          goto LABEL_19;
        if (((1 << (a3 - 54)) & 0x5000480040000005) != 0)
          goto LABEL_21;
        if (v11 == 14)
          goto LABEL_70;
LABEL_19:
        if ((a3 - 120) <= 0x30 && ((1 << (a3 - 120)) & 0x1500000000001) != 0)
        {
LABEL_21:
          v9 = 3841;
          goto LABEL_46;
        }
        if (a3 != 5)
          goto LABEL_47;
        v9 = 11009;
        goto LABEL_46;
      case 0xB:
        v12 = (a3 + 127) >= 0xAu;
        v9 = 258;
        v13 = 6401;
        goto LABEL_44;
      case 0xC:
        v9 = 769;
        goto LABEL_34;
      case 0xF:
        v12 = (a3 + 127) >= 0xAu;
        v9 = 2;
        v13 = 5377;
        goto LABEL_44;
      case 0x10:
        if (((a3 - 120) > 0x30 || ((1 << (a3 - 120)) & 0x150000004DE01) == 0)
          && ((a3 - 54) > 0x3E || ((1 << (a3 - 54)) & 0x5000480040000005) == 0))
        {
          if (a3 != 5)
            goto LABEL_47;
          goto LABEL_70;
        }
        v14 = *a4;
        if ((a2 & 0x80) == 0)
        {
          if (*a4)
          {
            v15 = v14 | 1;
            goto LABEL_72;
          }
          v19 = 1;
          goto LABEL_69;
        }
        if (v14 == 1)
          goto LABEL_66;
        v15 = v14 & 0xFE;
        goto LABEL_72;
      case 0x13:
        v12 = (a3 + 127) >= 0xAu;
        v9 = 770;
        v13 = 1537;
        goto LABEL_44;
      case 0x14:
        v9 = 1793;
LABEL_34:
        if ((a3 - 54) <= 0x3E && ((1 << (a3 - 54)) & 0x5000480040000005) != 0
          || (a3 - 120) <= 0x30 && ((1 << (a3 - 120)) & 0x1500000000001) != 0)
        {
          goto LABEL_46;
        }
        if (a3 != 5)
          goto LABEL_47;
        v9 = 2306;
        goto LABEL_46;
      case 0x17:
        v12 = (a3 + 127) >= 0xAu;
        v9 = 1026;
        v13 = 2561;
        goto LABEL_44;
      case 0x18:
        if (((a3 - 120) > 0x30 || ((1 << (a3 - 120)) & 0x150000004DE01) == 0)
          && ((a3 - 54) > 0x3E || ((1 << (a3 - 54)) & 0x5000480040000005) == 0))
        {
          goto LABEL_47;
        }
        v17 = *a4;
        if (a2 < 0)
        {
          if (v17 != 2)
          {
            v15 = v17 & 0xFD;
            goto LABEL_72;
          }
LABEL_66:
          *a4 = 0;
        }
        else
        {
          if (*a4)
          {
            v15 = v17 | 2;
LABEL_72:
            *a4 = v15;
            goto LABEL_47;
          }
          v19 = 2;
LABEL_69:
          *a4 = v19;
        }
LABEL_70:
        v9 = 2050;
        goto LABEL_46;
      case 0x1B:
        v12 = (a3 + 127) >= 0xAu;
        v9 = 1282;
        v13 = 3585;
LABEL_44:
        if (!v12)
          v9 = v13;
        goto LABEL_46;
      case 0x1F:
        v9 = 1794;
        goto LABEL_46;
      default:
        goto LABEL_58;
    }
  }
  if (v8 - 116 < 5)
  {
LABEL_10:
    v9 = (v8 << 8) | 1;
LABEL_46:
    v20 = v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (v9 & 0xFFFEFFFF | ((((a2 & 0x80) >> 7) & 1) << 16)) ^ 0x10000);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v16);

    v7 = v20;
    goto LABEL_47;
  }
  if (v8 == 122)
  {
    if ((a3 - 164) <= 4 && ((1 << (a3 + 92)) & 0x15) != 0)
    {
      v9 = 31233;
      goto LABEL_46;
    }
  }
  else
  {
    if (v8 != 123)
    {
LABEL_58:
      if ((a2 & 0x7C) == 0x70)
      {
        v18 = -28669;
      }
      else
      {
        if (v8 - 32 > 0x5C)
          goto LABEL_47;
        v18 = -8192;
      }
      v9 = v18 + (v8 << 8);
      goto LABEL_46;
    }
    if ((a3 - 164) <= 4 && ((1 << (a3 + 92)) & 0x15) != 0)
    {
      v9 = 31489;
      goto LABEL_46;
    }
  }
LABEL_47:

}

CFDataRef SCRDHandyTechCreateExtendedProtocolRequestPacket(int a1, int a2, const void *a3, unsigned int a4)
{
  unsigned int v8;
  uint64_t v9;
  UInt8 *v10;
  unsigned int v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (!SCRDHandyTechDisplayUsesExtendedProtocol(a1))
    return 0;
  v8 = a4;
  if (a2 == 1)
  {
    v8 = SCRDHandyTechDisplaySizeForDeviceID(a1);
    if (!v8)
      return 0;
  }
  MEMORY[0x24BDAC7A8]();
  v10 = (UInt8 *)v13 - v9;
  v11 = v8;
  if (v8 >= a4)
  {
    if (v8 > a4)
      bzero(&v10[a4 + 3], (int)(v8 - a4));
    v11 = a4;
  }
  *v10 = 121;
  v10[1] = a1;
  v10[2] = v8 + 1;
  v10[3] = a2;
  memcpy(v10 + 4, a3, v11);
  v10[v8 + 4] = 22;
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, v8 + 5);
}

CFDataRef _SCRDHumanwareCreatePacketFromBuffer(const __CFData *a1)
{
  CFIndex Length;
  unint64_t v3;
  const UInt8 *BytePtr;
  uint64_t v5;
  CFDataRef v6;
  CFRange v8;

  if (!a1)
    return 0;
  SCRDAdvanceBufferToPacketStart(a1, 27);
  Length = CFDataGetLength(a1);
  if (Length < 3)
    return 0;
  v3 = Length;
  BytePtr = CFDataGetBytePtr(a1);
  v5 = BytePtr[2];
  if (v3 <= v5 + 2)
    return 0;
  v6 = CFDataCreate(0, BytePtr + 1, v5 + 2);
  v8.length = v5 + 3;
  v8.location = 0;
  CFDataDeleteBytes(a1, v8);
  return v6;
}

id SCRDHumanwareExtractEventsFromBuffer(const __CFData *a1, int a2, BOOL *a3)
{
  CFIndex Length;
  id v7;
  CFDataRef PacketFromBuffer;
  const __CFData *v9;
  CFIndex v10;
  const UInt8 *BytePtr;
  int v12;
  BOOL v13;
  int v14;
  uint64_t v16;
  void *v17;

  if (a1)
  {
    Length = CFDataGetLength(a1);
    v7 = 0;
    if ((a2 - 1) <= 7 && Length >= 4)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      PacketFromBuffer = _SCRDHumanwareCreatePacketFromBuffer(a1);
      if (PacketFromBuffer)
      {
        v9 = PacketFromBuffer;
        do
        {
          v10 = CFDataGetLength(v9);
          BytePtr = CFDataGetBytePtr(v9);
          v12 = *BytePtr;
          v13 = v12 == 6;
          v14 = v10 == 3 && v12 == 5;
          if (v10 != 3)
            v13 = 0;
          if ((v14 & 1) != 0 || v13)
          {
            _SCRDEventForKeyID(BytePtr[2], a2, v14);
            v16 = objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v17 = (void *)v16;
              objc_msgSend(v7, "addObject:", v16);

            }
          }
          else if (a3)
          {
            if (v12 == 1 && v10 == 5)
              *a3 = BytePtr[2] != 0;
          }
          CFRelease(v9);
          v9 = _SCRDHumanwareCreatePacketFromBuffer(a1);
        }
        while (v9);
      }
    }
  }
  else
  {
    v7 = 0;
  }
  if (!objc_msgSend(v7, "count"))
  {

    v7 = 0;
  }
  return v7;
}

BOOL SCRDHumanwareIsDeviceIDValid(int a1)
{
  return (a1 - 1) < 8;
}

id _SCRDEventForKeyID(unsigned int a1, int a2, int a3)
{
  int v3;
  int v4;
  unsigned int v6;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  if (a1 - 2 > 8)
  {
    if (a1 - 11 <= 5 || a1 - 17 <= 3)
      goto LABEL_8;
    if (a1 < 0x50)
    {
      if (a1 - 21 <= 4)
      {
LABEL_8:
        v4 = v3;
        v3 = (a1 << 8) - 2815;
        goto LABEL_9;
      }
    }
    else
    {
      if ((a2 - 1) > 7)
        v6 = 80;
      else
        v6 = dword_2282C9FAC[a2 - 1];
      if (v6 >= a1)
      {
        v4 = (a1 << 8) - 20480;
        goto LABEL_9;
      }
    }
    return 0;
  }
  v4 = v3;
  v3 = (a1 << 8) - 510;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v3 | v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

const __CFData *SCRDHumanwareCreateInitializationPacketFromBuffer(const __CFData *a1)
{
  const __CFData *i;
  const __CFData *PacketFromBuffer;
  const __CFData *v3;

  for (i = a1; ; a1 = i)
  {
    PacketFromBuffer = _SCRDHumanwareCreatePacketFromBuffer(a1);
    v3 = PacketFromBuffer;
    if (!PacketFromBuffer || CFDataGetLength(PacketFromBuffer) == 5 && *CFDataGetBytePtr(v3) == 1)
      break;
    CFRelease(v3);
  }
  return v3;
}

uint64_t SCRDHumanwareDisplaySizeForDeviceID(int a1)
{
  char v1;

  if ((a1 - 1) >= 8)
    v1 = 0;
  else
    v1 = 0xE20125028202820uLL >> (8 * (a1 - 1));
  return v1 & 0x7E;
}

CFDataRef SCRDHumanwareCreateWriteRequestPacket(const void *a1, unint64_t a2, int a3)
{
  unsigned int v4;
  char v6;
  size_t v7;
  UInt8 *v8;
  UInt8 *v9;
  CFDataRef v10;

  if (!a1)
    return 0;
  if (!a2)
    return 0;
  v4 = a3 - 1;
  if ((a3 - 1) > 7)
    return 0;
  v6 = v4 >= 8 ? 0 : 0xE20125028202820uLL >> (8 * v4);
  v7 = v6 & 0x7E;
  v8 = (UInt8 *)malloc_type_malloc(v7 + 3, 0x100004077774924uLL);
  if (!v8)
    return 0;
  v9 = v8;
  if (v7 >= a2)
  {
    if (v7 > a2)
      bzero(&v8[a2 + 3], v7 - a2);
    v7 = a2;
  }
  *(_WORD *)v9 = 539;
  v9[2] = v6;
  memcpy(v9 + 3, a1, v7);
  v10 = CFDataCreate(0, v9, (v6 & 0x7E) + 3);
  free(v9);
  return v10;
}

CFDataRef SCRDHumanwareCreateInitializationRequestPacket()
{
  UInt8 bytes[2];
  char v2;

  v2 = 0;
  strcpy((char *)bytes, "\x1B");
  return CFDataCreate(0, bytes, 3);
}

unint64_t SCRDHumanwareDeviceIDForInitializationPacket(unint64_t result)
{
  const __CFData *v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  BOOL v5;

  if (result)
  {
    v1 = (const __CFData *)result;
    if (CFDataGetLength((CFDataRef)result) != 5 || *CFDataGetBytePtr(v1) != 1)
      return 0;
    v2 = CFDataGetBytePtr(v1)[4];
    if (v2 <= 0x1F)
    {
      v3 = 8;
      if (v2 == 18)
        v4 = 6;
      else
        v4 = 0;
      v5 = v2 == 14;
    }
    else
    {
      if (v2 == 32)
        return 1;
      v3 = 2;
      if (v2 == 80)
        v4 = 5;
      else
        v4 = 0;
      v5 = v2 == 40;
    }
    if (v5)
      return v3;
    else
      return v4;
  }
  return result;
}

const __CFData *SCRDHumanwareDeviceNeedsResetStatusForInitializationPacket(const __CFData *result)
{
  const __CFData *v1;

  if (result)
  {
    v1 = result;
    if (CFDataGetLength(result) == 5 && *CFDataGetBytePtr(v1) == 1)
      return (const __CFData *)(CFDataGetBytePtr(v1)[2] != 0);
    else
      return 0;
  }
  return result;
}

uint64_t SCRDMDVConvertStandardCellToMDVCell(unsigned int a1)
{
  return a1 & 0x20 | ((a1 & 0x40) != 0) | (a1 >> 1) & 2 | (4 * ((a1 & 2) != 0)) & 0xB7 | (8 * (a1 & 1)) & 0xBF | (a1 >> 3) & 0x10 | (((a1 & 0x10) != 0) << 6) | (16 * (_BYTE)a1) & 0x80;
}

void SCRDMDVAppendKeyPressEvent(int a1, _BYTE *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;

  v5 = a3;
  if (a2)
  {
    v9 = v5;
    switch(a1)
    {
      case 1:
      case 33:
        goto LABEL_5;
      case 2:
      case 34:
        goto LABEL_8;
      case 3:
      case 35:
        goto LABEL_11;
      case 4:
      case 36:
        goto LABEL_14;
      case 5:
      case 37:
        goto LABEL_17;
      case 6:
      case 38:
        goto LABEL_20;
      case 7:
      case 39:
        goto LABEL_23;
      case 8:
      case 40:
        goto LABEL_26;
      case 9:
      case 41:
        goto LABEL_29;
      case 10:
        goto LABEL_44;
      case 11:
        goto LABEL_32;
      case 12:
        goto LABEL_35;
      case 13:
        goto LABEL_38;
      case 14:
        goto LABEL_41;
      case 17:
      case 49:
        if (!*a2)
        {
          _appendShiftKeyEvent(v5, 1);
          *a2 = 1;
        }
LABEL_5:
        v6 = objc_msgSend(v9, "count");
        v7 = v9;
        v8 = 257;
        goto LABEL_45;
      case 18:
      case 50:
        if (!*a2)
        {
          _appendShiftKeyEvent(v5, 1);
          *a2 = 1;
        }
LABEL_8:
        v6 = objc_msgSend(v9, "count");
        v7 = v9;
        v8 = 513;
        goto LABEL_45;
      case 19:
      case 51:
        if (!*a2)
        {
          _appendShiftKeyEvent(v5, 1);
          *a2 = 1;
        }
LABEL_11:
        v6 = objc_msgSend(v9, "count");
        v7 = v9;
        v8 = 769;
        goto LABEL_45;
      case 20:
      case 52:
        if (!*a2)
        {
          _appendShiftKeyEvent(v5, 1);
          *a2 = 1;
        }
LABEL_14:
        v6 = objc_msgSend(v9, "count");
        v7 = v9;
        v8 = 1025;
        goto LABEL_45;
      case 21:
      case 53:
        if (!*a2)
        {
          _appendShiftKeyEvent(v5, 1);
          *a2 = 1;
        }
LABEL_17:
        v6 = objc_msgSend(v9, "count");
        v7 = v9;
        v8 = 1281;
        goto LABEL_45;
      case 22:
      case 54:
        if (!*a2)
        {
          _appendShiftKeyEvent(v5, 1);
          *a2 = 1;
        }
LABEL_20:
        v6 = objc_msgSend(v9, "count");
        v7 = v9;
        v8 = 1537;
        goto LABEL_45;
      case 23:
      case 55:
        if (!*a2)
        {
          _appendShiftKeyEvent(v5, 1);
          *a2 = 1;
        }
LABEL_23:
        v6 = objc_msgSend(v9, "count");
        v7 = v9;
        v8 = 1793;
        goto LABEL_45;
      case 24:
      case 56:
        if (!*a2)
        {
          _appendShiftKeyEvent(v5, 1);
          *a2 = 1;
        }
LABEL_26:
        v6 = objc_msgSend(v9, "count");
        v7 = v9;
        v8 = 2049;
        goto LABEL_45;
      case 25:
      case 57:
        if (!*a2)
        {
          _appendShiftKeyEvent(v5, 1);
          *a2 = 1;
        }
LABEL_29:
        v6 = objc_msgSend(v9, "count");
        v7 = v9;
        v8 = 2305;
        goto LABEL_45;
      case 26:
        if (!*a2)
        {
          _appendShiftKeyEvent(v5, 1);
          *a2 = 1;
        }
LABEL_44:
        v6 = objc_msgSend(v9, "count");
        v7 = v9;
        v8 = 2561;
        goto LABEL_45;
      case 27:
      case 59:
        if (!*a2)
        {
          _appendShiftKeyEvent(v5, 1);
          *a2 = 1;
        }
LABEL_32:
        v6 = objc_msgSend(v9, "count");
        v7 = v9;
        v8 = 2817;
        goto LABEL_45;
      case 28:
      case 60:
        if (!*a2)
        {
          _appendShiftKeyEvent(v5, 1);
          *a2 = 1;
        }
LABEL_35:
        v6 = objc_msgSend(v9, "count");
        v7 = v9;
        v8 = 3073;
        goto LABEL_45;
      case 29:
      case 61:
        if (!*a2)
        {
          _appendShiftKeyEvent(v5, 1);
          *a2 = 1;
        }
LABEL_38:
        v6 = objc_msgSend(v9, "count");
        v7 = v9;
        v8 = 3329;
        goto LABEL_45;
      case 30:
      case 62:
        if (!*a2)
        {
          _appendShiftKeyEvent(v5, 1);
          *a2 = 1;
        }
LABEL_41:
        v6 = objc_msgSend(v9, "count");
        v7 = v9;
        v8 = 3585;
LABEL_45:
        SCRDAppendFullKeystrokeFromEvent(v7, v6, v8);
        v5 = v9;
        break;
      case 63:
        if (!*a2)
        {
          _appendShiftKeyEvent(v5, 1);
          v5 = v9;
          *a2 = 1;
        }
        break;
      case 64:
        if (*a2)
        {
          _appendShiftKeyEvent(v5, 0);
          v5 = v9;
          *a2 = 0;
        }
        break;
      default:
        break;
    }
  }

}

void _appendShiftKeyEvent(void *a1, int a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  if (a2)
    v3 = 81665;
  else
    v3 = 16129;
  v4 = a1;
  objc_msgSend(v2, "numberWithUnsignedLong:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

char *SCRDMDVSerialCreateRequest(char a1, const void *a2, unsigned int a3, size_t *a4)
{
  BOOL v4;
  char *v6;
  char v8;
  size_t v11;
  size_t v12;
  char *v13;
  uint64_t v14;
  __int16 v15;

  if (a3)
    v4 = a2 == 0;
  else
    v4 = 0;
  if (v4 || a4 == 0)
    return 0;
  v8 = a3;
  v11 = a3;
  v12 = a3 + 7;
  v13 = (char *)malloc_type_malloc(v12, 0xFC95B465uLL);
  v6 = v13;
  if (v13)
  {
    *(_WORD *)v13 = 513;
    v13[2] = a1;
    v13[3] = v8;
    v13[4] = 3;
    memcpy(v13 + 5, a2, v11);
    v14 = 0;
    v15 = 0;
    do
      v15 += v6[++v14];
    while (v11 + 4 != v14);
    *(_WORD *)&v6[v11 + 5] = v15 ^ 0xAA55;
    *a4 = v12;
  }
  return v6;
}

id SCRDMDVSerialCreatePacketsFromBuffer(const __CFData *a1)
{
  id v2;
  const __CFAllocator *v3;
  CFIndex Length;
  unint64_t v5;
  const UInt8 *BytePtr;
  uint64_t v7;
  CFIndex v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  __int16 v12;
  const UInt8 *v13;
  CFDataRef v14;
  CFRange v16;
  CFRange v17;

  if (a1 && CFDataGetLength(a1) >= 7)
  {
    v2 = 0;
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    do
    {
      SCRDAdvanceBufferToPacketStart(a1, 1);
      Length = CFDataGetLength(a1);
      if (Length < 7)
        break;
      v5 = Length;
      BytePtr = CFDataGetBytePtr(a1);
      if (*BytePtr != 1 || BytePtr[1] != 2 || BytePtr[4] != 3)
        goto LABEL_16;
      v7 = BytePtr[3];
      v8 = v7 + 7;
      v9 = v5 - (v7 + 7);
      if (v5 < v7 + 7)
        return v2;
      v10 = 0;
      v11 = 0;
      do
        v11 += BytePtr[++v10];
      while (v7 + 4 != v10);
      v12 = v11 ^ 0xAA55;
      v13 = &BytePtr[v7];
      if (v13[5] == v12 && v13[6] == (unsigned __int16)(v12 & 0xFF00) >> 8)
      {
        v14 = CFDataCreate(v3, BytePtr, v8);
        if (!v2)
          v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v2, "addObject:", v14);
        CFRelease(v14);
        v16.location = 0;
        v16.length = v8;
        CFDataDeleteBytes(a1, v16);
      }
      else
      {
LABEL_16:
        v17.location = 0;
        v17.length = 1;
        CFDataDeleteBytes(a1, v17);
        v9 = v5 - 1;
      }
    }
    while (v9 > 6);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id SCRDMDVSerialExtractEventsFromBuffer(const __CFData *a1, _BYTE *a2, uint64_t a3)
{
  id v3;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const UInt8 *BytePtr;
  unsigned __int8 v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = 0;
  v21 = *MEMORY[0x24BDAC8D0];
  if (a1 && a2)
  {
    SCRDMDVSerialCreatePacketsFromBuffer(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    else
      v3 = 0;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*((_QWORD *)&v16 + 1) + 8 * v11));
          switch(BytePtr[2])
          {
            case 0x10u:
              if (BytePtr[3] == 1)
                SCRDMDVAppendKeyPressEvent(BytePtr[5], a2, v3);
              break;
            case 0x11u:
              if (BytePtr[3] == 1)
              {
                v13 = BytePtr[5];
                v14 = 1;
                goto LABEL_18;
              }
              break;
            case 0x12u:
              if (BytePtr[3] == 1)
              {
                v13 = BytePtr[5];
                v14 = 0;
LABEL_18:
                SCRDMDVSerialAppendRouterPressEvent(v13, v14, a2, v3, a3);
              }
              break;
            case 0x15u:
              if (BytePtr[3] == 3)
                SCRDMDVSerialAppendBrailleKeyPressEvent(BytePtr[5], BytePtr[6], v3);
              break;
            default:
              break;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    if (!objc_msgSend(v3, "count", (_QWORD)v16))
    {

      v3 = 0;
    }

  }
  return v3;
}

void SCRDMDVSerialAppendRouterPressEvent(unsigned __int8 a1, int a2, _BYTE *a3, void *a4, uint64_t a5)
{
  id v9;
  int v10;
  void *v11;
  unsigned __int8 v12;
  int v13;
  void *v14;
  id v15;

  v9 = a4;
  if (a3)
  {
    v15 = v9;
    if (a2)
      v10 = 0x10000;
    else
      v10 = 0;
    if ((a1 & 0x80) != 0)
    {
      if (!*a3)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 81665);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v11);

        *a3 = 1;
      }
      a1 ^= 0x80u;
    }
    v12 = a1 - 2;
    if (a1 <= 2u)
      v13 = v10 | 3;
    else
      v13 = v10;
    if (a1 <= 2u)
      v12 = a1;
    if (a5 != 1)
    {
      v13 = v10;
      v12 = a1;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", ((v12 << 8) - 256) | v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v14);

    v9 = v15;
  }

}

void SCRDMDVSerialAppendBrailleKeyPressEvent(int a1, unsigned int a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  BOOL v12;
  id v13;

  v13 = a3;
  v5 = objc_msgSend(v13, "count");
  if (a1)
  {
    v6 = v5 + 1;
    v7 = 2050;
    SCRDAppendFullKeystrokeFromEvent(v13, v5, 2050);
    v5 = v6;
  }
  else
  {
    v7 = 2;
  }
  v8 = v13;
  if (a2)
  {
    v9 = 0;
    do
    {
      if ((a2 & 1) != 0)
      {
        v10 = v7 & 0xFFFF00FF;
        v7 = v9 | v7 & 0xFFFF00FF;
        v11 = v5 + 1;
        SCRDAppendFullKeystrokeFromEvent(v13, v5, v9 | v10);
        v8 = v13;
        v5 = v11;
      }
      v9 += 256;
      v12 = a2 >= 2;
      a2 >>= 1;
    }
    while (v12);
  }

}

void SCRDMDVHIDAppendRouterPressEvent(unsigned __int8 a1, void *a2)
{
  void *v2;
  unint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = (((a1 & 0x7F) << 8) - 256) | ((unint64_t)(a1 & 0x80) << 9) ^ 0x10000;
  v4 = a2;
  objc_msgSend(v2, "numberWithUnsignedLong:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

uint64_t SCRDNinepointSystemsCebraDisplaySizeForDeviceID(int a1)
{
  unsigned int v1;
  unint64_t v2;

  HIDWORD(v2) = a1;
  LODWORD(v2) = a1 - 104;
  v1 = v2 >> 1;
  if (v1 > 0xB)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return qword_2282CA030[v1];
}

CFDataRef SCRDNinepointSystemsCebraExtractNewPacketFromBuffer(const __CFData *a1)
{
  CFIndex Length;
  const UInt8 *BytePtr;
  CFDataRef v4;
  CFIndex v5;
  char v6;
  const UInt8 *v7;
  int v8;
  CFIndex v9;
  CFIndex v10;
  int v11;
  int v12;
  int v13;
  BOOL v14;
  CFIndex v15;
  char v16;
  CFRange v18;

  if (a1)
  {
    Length = CFDataGetLength(a1);
    BytePtr = CFDataGetBytePtr(a1);
    if (Length >= 1)
    {
      v4 = 0;
      v5 = 0;
      v6 = 1;
      while (1)
      {
        v7 = &BytePtr[v5];
        v8 = BytePtr[v5];
        if (v8 != 121)
          break;
        v9 = v5 + 6;
        if (v5 + 6 > Length)
          return v4;
        v12 = BytePtr[v5 + 2];
        if (v12 != 3)
        {
          if (v12 != 2)
            goto LABEL_26;
          v13 = BytePtr[v5 + 3];
          v14 = v13 == 9 || v13 == 4;
          if (!v14 || BytePtr[v5 + 5] != 22)
            goto LABEL_26;
          v10 = 6;
          goto LABEL_8;
        }
        v15 = v5 + 7;
        if (v5 + 7 > Length)
          return v4;
        if (BytePtr[v5 + 3] != 9 || BytePtr[v5 + 4] != 240 || BytePtr[v9] != 22)
        {
LABEL_26:
          v11 = 0;
          v16 = 0;
          v9 = ++v5;
          if ((v6 & 1) == 0)
            goto LABEL_28;
          goto LABEL_27;
        }
        v4 = CFDataCreate(0, v7, 7);
        if ((v6 & 1) == 0)
          return v4;
        v11 = 1;
        v9 = v15;
LABEL_27:
        v18.location = 0;
        v18.length = v9;
        CFDataDeleteBytes(a1, v18);
        Length = CFDataGetLength(a1);
        BytePtr = CFDataGetBytePtr(a1);
        v5 = 0;
        v16 = 1;
LABEL_28:
        if (v5 < Length)
        {
          v6 = v16;
          if (!v11)
            continue;
        }
        return v4;
      }
      if (v8 != 254)
        goto LABEL_26;
      v9 = v5 + 2;
      if (v5 + 2 > Length)
        return v4;
      v10 = 2;
LABEL_8:
      v4 = CFDataCreate(0, v7, v10);
      if ((v6 & 1) == 0)
        return v4;
      v11 = 1;
      goto LABEL_27;
    }
  }
  return 0;
}

id SCRDNinepointSystemsCebraExtractKeyboardEventsFromBuffer(const __CFData *a1, _DWORD *a2)
{
  id v4;
  CFDataRef NewPacketFromBuffer;
  const __CFData *v6;
  const UInt8 *BytePtr;
  const UInt8 *v8;
  unsigned int v9;
  _BOOL4 v10;
  int v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;

  if (!a1 || CFDataGetLength(a1) < 6)
    goto LABEL_37;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  NewPacketFromBuffer = SCRDNinepointSystemsCebraExtractNewPacketFromBuffer(a1);
  if (NewPacketFromBuffer)
  {
    v6 = NewPacketFromBuffer;
    do
    {
      BytePtr = CFDataGetBytePtr(v6);
      v8 = BytePtr;
      if (*BytePtr != 121 || BytePtr[3] != 4)
        goto LABEL_13;
      v9 = BytePtr[4];
      v10 = v9 < 0x81;
      if (v9 <= 0x80)
        v11 = BytePtr[4];
      else
        v11 = v9 & 0x7F;
      if ((v11 - 32) > 0x4Fu)
      {
        if (BytePtr[1] == 104)
        {
          if (v11 > 14)
          {
            switch(v11)
            {
              case 15:
                v12 = 2;
                goto LABEL_12;
              case 16:
              case 24:
                v12 = 2050;
                goto LABEL_12;
              case 19:
                v12 = 770;
                goto LABEL_12;
              case 23:
                v12 = 1026;
                goto LABEL_12;
              case 27:
                v12 = 1282;
                goto LABEL_12;
              case 31:
                v12 = 1794;
                goto LABEL_12;
              default:
                goto LABEL_13;
            }
            goto LABEL_13;
          }
          switch(v11)
          {
            case 3:
              v12 = 1538;
              break;
            case 7:
              v12 = 514;
              break;
            case 11:
              v12 = 258;
              break;
            default:
              goto LABEL_13;
          }
        }
        else
        {
          v14 = v11 - 3;
          if (v14 > 0x1C || ((0x1DDFBFBBu >> v14) & 1) == 0)
            goto LABEL_13;
          v12 = dword_2282CA090[2 * (char)v14];
        }
      }
      else
      {
        v12 = (v11 << 8) - 0x2000;
      }
LABEL_12:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v12 | ((unint64_t)v10 << 16));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v13);

LABEL_13:
      if (a2)
        *a2 = v8[1];
      CFRelease(v6);
      v6 = SCRDNinepointSystemsCebraExtractNewPacketFromBuffer(a1);
    }
    while (v6);
  }
  if (!objc_msgSend(v4, "count"))
  {

LABEL_37:
    v4 = 0;
  }
  return v4;
}

CFDataRef SCRDNinepointSystemsCebraCreateWriteBuffer(int a1, const void *a2, unint64_t a3)
{
  UInt8 v5;
  uint64_t v6;
  size_t v7;
  CFIndex v8;
  UInt8 *v9;
  UInt8 *v10;
  CFDataRef v11;

  v5 = a1;
  v6 = SCRDNinepointSystemsCebraDisplaySizeForDeviceID(a1);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v7 = v6;
  v8 = v6 + 5;
  v9 = (UInt8 *)malloc_type_malloc(v6 + 5, 0x100004077774924uLL);
  if (!v9)
    return 0;
  v10 = v9;
  *v9 = 121;
  v9[1] = v5;
  v9[2] = v7;
  v9[3] = 1;
  v9[v7 + 4] = 22;
  if (v7 >= a3)
  {
    if (v7 > a3)
      bzero(&v9[a3 + 4], v7 - a3);
    v7 = a3;
  }
  memcpy(v10 + 4, a2, v7);
  v11 = CFDataCreate(0, v10, v8);
  free(v10);
  return v11;
}

CFDataRef SCRDNinepointSystemsNinepointExtractNewPacketFromBuffer(const __CFData *a1)
{
  CFIndex Length;
  const UInt8 *BytePtr;
  CFDataRef v4;
  CFIndex v5;
  char v6;
  const UInt8 *v7;
  int v8;
  int v9;
  char v10;
  CFRange v12;

  if (a1)
  {
    Length = CFDataGetLength(a1);
    BytePtr = CFDataGetBytePtr(a1);
    if (Length >= 1)
    {
      v4 = 0;
      v5 = 0;
      v6 = 1;
      while (1)
      {
        v7 = &BytePtr[v5];
        v8 = BytePtr[v5];
        if (v8 != 253)
          break;
        if (v5 + 3 > Length)
          return v4;
        if (BytePtr[v5 + 1] == 47)
        {
          v4 = CFDataCreate(0, v7, 3);
          if ((v6 & 1) == 0)
            return v4;
          v9 = 1;
          v5 += 3;
LABEL_14:
          v12.location = 0;
          v12.length = v5;
          CFDataDeleteBytes(a1, v12);
          Length = CFDataGetLength(a1);
          BytePtr = CFDataGetBytePtr(a1);
          v5 = 0;
          v10 = 1;
          goto LABEL_15;
        }
        v9 = 0;
        v10 = 0;
        if ((v6 & 1) != 0)
          goto LABEL_14;
LABEL_15:
        if (v5 < Length)
        {
          v6 = v10;
          if (!v9)
            continue;
        }
        return v4;
      }
      if (v8 == 252)
      {
        v5 += 2;
        if (v5 > Length)
          return v4;
        v4 = CFDataCreate(0, v7, 2);
        if ((v6 & 1) == 0)
          return v4;
        v9 = 1;
      }
      else
      {
        v9 = 0;
        v10 = 0;
        ++v5;
        if ((v6 & 1) == 0)
          goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  return 0;
}

id SCRDNinepointSystemsNinepointExtractKeyboardEventsFromBuffer(const __CFData *a1)
{
  id v2;
  CFDataRef NewPacketFromBuffer;
  const __CFData *v4;
  const UInt8 *BytePtr;
  unsigned int v6;
  _BOOL4 v7;
  unsigned __int8 v8;
  void *v9;

  if (!a1 || CFDataGetLength(a1) < 2)
    goto LABEL_17;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  NewPacketFromBuffer = SCRDNinepointSystemsNinepointExtractNewPacketFromBuffer(a1);
  if (NewPacketFromBuffer)
  {
    v4 = NewPacketFromBuffer;
    do
    {
      BytePtr = CFDataGetBytePtr(v4);
      if (*BytePtr == 252)
      {
        v6 = BytePtr[1];
        if ((char)BytePtr[1] < 0)
        {
          if (v6 <= 0x87)
            SCRDAppendFullKeystrokeFromEvent(v2, objc_msgSend(v2, "count"), (v6 << 8) - 0x8000);
        }
        else
        {
          v7 = v6 > 0x60;
          if (v6 < 0x61)
            LOBYTE(v6) = v6 + 32;
          v8 = v6 - 97;
          if (v8 <= 0x14u && ((0x171FFFu >> v8) & 1) != 0)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", ((unint64_t)v7 << 16) | qword_2282CA178[(char)v8]);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addObject:", v9);

          }
        }
      }
      CFRelease(v4);
      v4 = SCRDNinepointSystemsNinepointExtractNewPacketFromBuffer(a1);
    }
    while (v4);
  }
  if (!objc_msgSend(v2, "count"))
  {

LABEL_17:
    v2 = 0;
  }
  return v2;
}

CFDataRef SCRDNinepointSystemsNinepointCreateWriteBuffer(uint64_t a1, unint64_t a2)
{
  CFDataRef result;
  CFDataRef v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unsigned int v10;
  _BYTE *v12;
  _BYTE *v13;
  BOOL v14;
  CFDataRef v15;

  result = (CFDataRef)malloc_type_malloc(0x12uLL, 0x100004077774924uLL);
  if (result)
  {
    v5 = result;
    if (a2 >= 8)
      v6 = 8;
    else
      v6 = a2;
    if (v6)
    {
      v7 = 0;
      v8 = v6;
      do
      {
        v9 = (char *)result + v7;
        *v9 = -4;
        v10 = *(unsigned __int8 *)(a1 - 1 + v8);
        v7 += 2;
        v9[1] = (2 * v10) & 4 | v10 & 0xE1 | (4 * v10) & 0x10 | (v10 >> 2) & 2 | (v10 >> 1) & 8;
      }
      while (v8-- > 1);
      LODWORD(v6) = v6;
      if (v6 > 7u)
        goto LABEL_14;
    }
    else
    {
      v7 = 0;
    }
    v12 = (char *)result + (v7 & 0xFFFFFFFFFFFFFFFELL) + 1;
    v13 = (char *)result + v7;
    do
    {
      *v13 = -4;
      v13 += 2;
      *v12 = 0;
      v12 += 2;
      v14 = v6 >= 7;
      LODWORD(v6) = v6 + 1;
    }
    while (!v14);
LABEL_14:
    *((_WORD *)result + 8) = 4349;
    v15 = CFDataCreate(0, (const UInt8 *)result, 18);
    free(v5);
    return v15;
  }
  return result;
}

void SCRDPapenmeierReleasePacket(_QWORD *a1)
{
  void *v2;

  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2)
      free(v2);
    free(a1);
  }
}

void *SCRDPapenmeierCreateKeyBuffer(int a1)
{
  char v3;
  unsigned int v4;
  char v5;

  if ((a1 - 101) < 0xFFFFFFF0)
    return 0;
  if ((a1 - 89) >= 5)
    v3 = 8;
  else
    v3 = 0xA0A08080AuLL >> (8 * (a1 - 89));
  v4 = SCRDPapenmeierHorizontalCellsForDevice(a1);
  if (a1 == 91)
    v5 = 10;
  else
    v5 = 0;
  return malloc_type_calloc((v3 + v5 + (v4 >> 1)) >> 1, 1uLL, 0x100004077774924uLL);
}

char *SCRDPapenmeierCreateBrailleBufferA(unsigned __int8 *a1, unsigned int a2, int a3, unsigned __int8 *a4, unsigned int a5, int a6, unsigned int a7, unsigned int a8, size_t *a9)
{
  size_t v16;
  size_t v17;
  char *v18;
  char *v19;
  _BYTE *v20;
  size_t v21;
  size_t i;
  unsigned int v23;
  unsigned int v24;
  size_t v25;
  char v26;
  char v27;
  char *v28;
  size_t v29;
  size_t j;
  unsigned int v31;
  unsigned int v32;
  size_t v35;

  v16 = (2 * a3);
  v17 = (2 * a6);
  v35 = v16 + v17 + 4 * a7 + 4 * a8 + 5;
  v18 = (char *)malloc_type_malloc(v35, 0x6D4F2D2uLL);
  v19 = v18;
  if (!v18)
    return v19;
  *(_WORD *)v18 = 17154;
  v18[2] = ((a6 + a3 + 2 * (a8 + a7)) >> 4) | 0x50;
  v18[3] = (a6 + a3 + 2 * (a8 + a7)) & 0xF | 0x50;
  v20 = v18 + 4;
  if (a4)
  {
    v21 = a5;
    if (v17 >> 1 < a5)
      v21 = v17 >> 1;
    for (i = v17 - 2 * v21; v21; --v21)
    {
      v23 = *a4++;
      v24 = __rbit32(v23);
      *v20 = (v24 >> 28) | 0x30;
      v20[1] = HIBYTE(v24) & 0xF | 0x30;
      v20 += 2;
    }
  }
  else
  {
    i = v17;
  }
  if (i)
    memset(v20, 48, i);
  v25 = 4 * a8;
  v26 = v17 + 4;
  memset(&v19[v26 & 0xFE], 48, 4 * a7);
  v27 = v26 + 4 * a7;
  v28 = &v19[v27 & 0xFE];
  if (a1)
  {
    v29 = a2;
    if (v16 >> 1 < a2)
      v29 = v16 >> 1;
    for (j = v16 - 2 * v29; v29; --v29)
    {
      v31 = *a1++;
      v32 = __rbit32(v31);
      *v28 = (v32 >> 28) | 0x30;
      v28[1] = HIBYTE(v32) & 0xF | 0x30;
      v28 += 2;
    }
    if (!j)
      goto LABEL_18;
    goto LABEL_17;
  }
  j = v16;
  if (v16)
LABEL_17:
    memset(v28, 48, j);
LABEL_18:
  memset(&v19[(v27 + v16) & 0xFE], 48, v25);
  v19[(v27 + v16 + v25) & 0xFE] = 3;
  if (a9)
    *a9 = v35;
  return v19;
}

char *SCRDPapenmeierCreateBrailleBufferB(unsigned __int8 *a1, unsigned int a2, int a3, unsigned __int8 *a4, unsigned int a5, int a6, size_t *a7)
{
  return SCRDPapenmeierCreateBrailleBufferA(a1, a2, a3, a4, a5, a6, 0, 0, a7);
}

_BYTE *_SCRDPapenmeierCreateWriteBuffer(char a1, unsigned int a2, char *a3, unsigned int a4, size_t *a5)
{
  BOOL v5;
  char *v9;
  size_t v12;
  _BYTE *result;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  if (a4)
    v5 = a3 == 0;
  else
    v5 = 0;
  if (v5 || a5 == 0)
    return 0;
  v9 = a3;
  v12 = 2 * a2 + 5;
  result = malloc_type_calloc(v12, 1uLL, 0x100004077774924uLL);
  if (result)
  {
    *result = 2;
    result[1] = a1 | 0x40;
    result[2] = (a2 >> 4) | 0x50;
    result[3] = a2 & 0xF | 0x50;
    v14 = a2 >> 1;
    if (a2 >> 1 >= a4)
      v14 = a4;
    v15 = 4;
    if (v9 && v14)
    {
      LOBYTE(v15) = 4;
      do
      {
        --v14;
        v16 = v15 | 1;
        result[v15] = (*v9 >> 4) | 0x30;
        v17 = *v9++;
        LOBYTE(v15) = v15 + 2;
        result[v16] = v17 & 0xF | 0x30;
      }
      while ((_BYTE)v14);
      v15 = v15;
    }
    result[v15] = 3;
  }
  else
  {
    v12 = 0;
  }
  *a5 = v12;
  return result;
}

uint64_t *SCRDPapenmeierCreateIdentityRequestBuffer(uint64_t *result)
{
  uint64_t *v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    result = (uint64_t *)malloc_type_calloc(5uLL, 1uLL, 0x100004077774924uLL);
    if (result)
    {
      *(_DWORD *)result = 1347437058;
      *((_BYTE *)result + 4) = 3;
      v2 = 5;
    }
    else
    {
      v2 = 0;
    }
    *v1 = v2;
  }
  return result;
}

uint64_t SCRDPapenmeierProtocolForDevice(int a1)
{
  if ((a1 - 89) > 4)
    return 0;
  else
    return dword_2282CA230[a1 - 89];
}

uint64_t SCRDPapenmeierVerticalCellsForDevice(int a1)
{
  if (a1 == 91)
    return 20;
  else
    return 0;
}

uint64_t SCRDPapenmeierHorizontalCellsForDevice(int a1)
{
  if ((a1 - 85) > 0xF)
    return 0;
  else
    return byte_2282CA250[a1 - 85];
}

uint64_t SCRDPapenmeierStatusCellsForDevice(int a1)
{
  return 2 * (a1 == 86);
}

unsigned __int16 *SCRDPapenmeierCreatePacketFromBuffer(const __CFData *a1)
{
  unsigned __int16 *v2;
  CFIndex Length;
  const UInt8 *BytePtr;
  const UInt8 *v5;
  uint64_t v6;
  int v7;
  UInt8 v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  UInt8 v12;
  _BYTE *v13;
  char v14;
  uint64_t v15;
  UInt8 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  UInt8 v23;
  _BYTE *v24;
  CFRange v26;
  CFRange v27;

  if (!a1)
    return 0;
  v2 = (unsigned __int16 *)malloc_type_calloc(1uLL, 0x10uLL, 0x10100404AEDDF2AuLL);
  if (v2)
  {
    Length = CFDataGetLength(a1);
    BytePtr = CFDataGetBytePtr(a1);
    if (Length >= 1)
    {
      v5 = BytePtr;
      v6 = 0;
      v7 = 0;
      while (1)
      {
        switch(v7)
        {
          case 0:
            if (v6 >= 1)
            {
              v26.length = v6 + 1;
              v26.location = 0;
              CFDataDeleteBytes(a1, v26);
            }
            SCRDAdvanceBufferToPacketStart(a1, 2);
            Length = CFDataGetLength(a1);
            v5 = CFDataGetBytePtr(a1);
            v7 = Length > 0;
            v6 = Length > 0;
            goto LABEL_49;
          case 1:
            v16 = v5[v6];
            if ((v16 & 0xF0) != 0x40)
              goto LABEL_48;
            *(_BYTE *)v2 = v16 & 0xF;
            ++v6;
            v7 = 2;
            goto LABEL_49;
          case 2:
            v8 = v5[v6];
            if ((v8 & 0xF0) != 0x50)
              goto LABEL_48;
            v2[1] = 16 * (v8 & 0xF);
            ++v6;
            v7 = 3;
            goto LABEL_49;
          case 3:
            if ((v5[v6] & 0xF0) != 0x50)
              goto LABEL_48;
            v17 = v2[1];
            v18 = v5[v6] & 0xF;
            v2[1] = v17 | v18;
            v19 = malloc_type_malloc(v17 | v18, 0x71DE1BC5uLL);
            *((_QWORD *)v2 + 1) = v19;
            if (!v19)
              goto LABEL_54;
            if (*(_BYTE *)v2 == 10)
              v7 = 5;
            else
              v7 = 4;
            ++v6;
            goto LABEL_49;
          case 4:
            if (!v2[1])
              goto LABEL_40;
            v9 = 0;
            if (Length <= v6)
              v10 = v6;
            else
              v10 = Length;
            v11 = 1;
            while (2)
            {
              if (v10 == v6)
              {
                v13 = (_BYTE *)*((_QWORD *)v2 + 1);
                if (!v13)
                  goto LABEL_45;
              }
              else
              {
                v12 = v5[v6];
                v13 = (_BYTE *)*((_QWORD *)v2 + 1);
                if ((v12 & 0xF0) == 0x30)
                {
                  if ((v11 & 1) != 0)
                  {
                    v14 = 16 * v12;
                    v15 = v9;
                  }
                  else
                  {
                    v14 = v13[v9] | v12 & 0xF;
                    v15 = v9 + 1;
                  }
                  v13[v9] = v14;
                  v11 ^= 1u;
                  ++v6;
                  v7 = 6;
                  v9 = v15;
                  if (v15 >= v2[1])
                    goto LABEL_49;
                  continue;
                }
                v10 = v6;
                if (!v13)
                {
LABEL_45:
                  v7 = 0;
                  goto LABEL_53;
                }
              }
              break;
            }
            free(v13);
            v7 = 0;
            *((_QWORD *)v2 + 1) = 0;
            v2[1] = 0;
LABEL_53:
            v6 = v10;
            goto LABEL_49;
          case 5:
            if (!v2[1])
              goto LABEL_40;
            v20 = 0;
            if (Length <= v6)
              v21 = v6;
            else
              v21 = Length;
            v22 = v6 - v21;
            while (2)
            {
              if (v22 + v20)
              {
                v23 = v5[v6 + v20];
                v24 = (_BYTE *)*((_QWORD *)v2 + 1);
                if ((v23 & 0xF0) == 0x30)
                {
                  v24[v20++] = v23 & 0xF;
                  if (v20 >= v2[1])
                  {
                    v6 += v20;
LABEL_40:
                    v7 = 6;
                    goto LABEL_49;
                  }
                  continue;
                }
              }
              else
              {
                v24 = (_BYTE *)*((_QWORD *)v2 + 1);
              }
              break;
            }
            v6 += v20;
            if (v24)
              goto LABEL_43;
            goto LABEL_48;
          case 6:
            if (v5[v6] == 3)
            {
              v27.length = v6 + 1;
              v27.location = 0;
              CFDataDeleteBytes(a1, v27);
              return v2;
            }
            v24 = (_BYTE *)*((_QWORD *)v2 + 1);
            if (v24)
            {
LABEL_43:
              free(v24);
              v7 = 0;
              *((_QWORD *)v2 + 1) = 0;
              v2[1] = 0;
            }
            else
            {
LABEL_48:
              v7 = 0;
            }
LABEL_49:
            if (v6 >= Length)
              goto LABEL_54;
            break;
          default:
            goto LABEL_49;
        }
      }
    }
LABEL_54:
    SCRDPapenmeierReleasePacket(v2);
    return 0;
  }
  return v2;
}

id SCRDPapenmeierExtractEventsFromBuffer(const __CFData *a1, int a2, unsigned __int8 *a3)
{
  BOOL v3;
  unsigned __int8 *v5;
  int v6;
  const __CFData *v7;
  id v8;
  unsigned __int16 *PacketFromBuffer;
  unsigned __int16 *v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  id v16;
  unsigned int v17;
  char v18;
  uint64_t v19;
  char v20;
  unsigned __int8 v21;
  id v22;
  int v23;
  void *v24;
  unsigned __int8 v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  unsigned __int8 *v37;
  unsigned __int8 *v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  unsigned int v44;
  int v45;
  uint64_t v46;
  BOOL v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  unsigned __int8 *v52;
  int v53;
  int v54;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  unsigned __int16 *v58;
  int v59;
  int v60;
  unsigned int v61;
  uint64_t v62;
  unsigned int v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  id v67;
  void *v68;
  unsigned __int8 v69;
  uint64_t v70;
  _BYTE *v71;
  int v72;
  unsigned __int8 *v73;
  int v74;
  char v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  uint64_t v81;
  unsigned __int8 *v83;
  unint64_t v84;
  unint64_t v85;
  unsigned __int8 *v86;
  unsigned int v87;
  int v88;
  id v89;
  id v90;
  const __CFData *v91;
  unsigned __int8 *__dst;
  int v93;
  unsigned __int16 *v94;
  unsigned __int8 *v95;
  unsigned __int8 *v96;
  unsigned __int8 *v97;
  int v98;
  _BYTE *v99;
  unsigned int v100;

  v3 = (a2 - 94) < 0xFFFFFFF7 || a1 == 0;
  if (v3 || a3 == 0)
    goto LABEL_81;
  v5 = a3;
  v6 = a2;
  v7 = a1;
  SCRDAdvanceBufferToPacketStart(a1, 2);
  if (CFDataGetLength(v7) < 5)
    goto LABEL_81;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  PacketFromBuffer = SCRDPapenmeierCreatePacketFromBuffer(v7);
  if (PacketFromBuffer)
  {
    v10 = PacketFromBuffer;
    v11 = 10;
    if (v6 == 91)
      v12 = 10;
    else
      v12 = 0;
    if (v6 != 91)
      v11 = 0;
    v84 = (unint64_t)(v11 + 6) >> 1;
    v13 = v11 + 7;
    v85 = v13 >> 1;
    v86 = v5 + 4;
    v14 = 0xA0A08080AuLL >> (8 * (v6 - 89));
    v87 = v6 - 89;
    if ((v6 - 89) >= 5)
      LODWORD(v14) = 8;
    v93 = v14 + v12;
    v83 = &v5[v13 >> 1];
    v90 = v8;
    v91 = v7;
    __dst = v5;
    v88 = v6;
    while (1)
    {
      v15 = *(unsigned __int8 *)v10;
      if (v15 == 12)
      {
        v48 = v8;
        if (v10[1] == 2)
        {
          v49 = v48;
          v50 = objc_msgSend(v48, "count");
          v51 = v50;
          v52 = (unsigned __int8 *)*((_QWORD *)v10 + 1);
          v53 = v52[1];
          v54 = *v52;
          if ((~v54 & 0x12) != 0)
          {
            v56 = 0;
          }
          else
          {
            v55 = v50 + 1;
            v56 = 2050;
            SCRDAppendFullKeystrokeFromEvent(v49, v50, 2050);
            v51 = v55;
          }
          if ((~v54 & 0xA) == 0)
          {
            v57 = v51 + 1;
            v56 = 2050;
            SCRDAppendFullKeystrokeFromEvent(v49, v51, 2050);
            v51 = v57;
          }
          v58 = v10;
          if (v53)
          {
            v59 = 0;
            v56 = v56 & 0xFF0 | 2;
            v60 = 1;
            do
            {
              if ((v60 & v53) != 0)
              {
                v61 = v56 & 0xFFFF00FF;
                v56 = v56 & 0xFFFF00FF | v59;
                v62 = v51 + 1;
                SCRDAppendFullKeystrokeFromEvent(v49, v51, v61 | v59);
                v51 = v62;
              }
              v60 = 2 * v60;
              v59 += 256;
            }
            while (v59 != 2048);
          }
          if ((v54 & 4) != 0)
          {
            v63 = v56 & 0xFFFF00F0;
            v56 = v56 & 0xFFFF00F0 | 0xC01;
            v64 = v51 + 1;
            SCRDAppendFullKeystrokeFromEvent(v49, v51, v63 | 0xC01);
            v51 = v64;
          }
          v8 = v90;
          v7 = v91;
          v10 = v58;
          if ((v54 & 1) != 0)
            SCRDAppendFullKeystrokeFromEvent(v49, v51, v56 & 0xFFFF00F0 | 0xD01);
        }
        goto LABEL_77;
      }
      if (v15 == 11)
        break;
LABEL_78:
      SCRDPapenmeierReleasePacket(v10);
      v10 = SCRDPapenmeierCreatePacketFromBuffer(v7);
      if (!v10)
        goto LABEL_79;
    }
    v16 = v8;
    v17 = SCRDPapenmeierHorizontalCellsForDevice(v6);
    v100 = v17;
    if (v10[1] != ((v93 + (v17 >> 1)) & 0xFE) >> 1)
      goto LABEL_77;
    v18 = (v93 + (v17 >> 1)) >> 1;
    v19 = objc_msgSend(v16, "count");
    v94 = v10;
    v20 = *(_BYTE *)(*((_QWORD *)v10 + 1) + 2);
    v21 = v5[2];
    v22 = v16;
    v23 = 0;
    v24 = 0;
    v25 = (v21 ^ v20) & v21;
    v26 = ((v21 ^ v20) & v20);
    v27 = v25;
    v28 = 1;
    LODWORD(v5) = 1;
    while ((v28 & v26) == 0)
    {
      if ((v28 & v27) != 0)
      {
        v29 = 0;
        goto LABEL_26;
      }
LABEL_27:
      v28 = 2 * v28;
      v23 += 256;
      if (v23 == 2048)
      {

        if (v87 <= 4 && ((1 << v87) & 0x19) != 0)
        {
          v10 = v94;
          _appendProtocolBFrontAndRearEvents(v22, v19, *(unsigned __int8 *)(*((_QWORD *)v94 + 1) + 3), *(unsigned __int8 *)(*((_QWORD *)v94 + 1) + (v18 - 1)), __dst[3], __dst[(v18 - 1)]);
          v31 = *((_QWORD *)v94 + 1);
          v32 = v22;
          if (!v100)
            goto LABEL_76;
          v33 = v32;
          v89 = v22;
          v34 = 0;
          LODWORD(v35) = 0;
          v36 = 0;
          v37 = (unsigned __int8 *)(v31 + 4);
          v38 = v86;
          while (1)
          {
            v95 = v38;
            v96 = v37;
            v39 = *v37;
            v40 = *v38;
            v98 = v34;
            if (v39 != v40)
              break;
LABEL_42:
            v34 = v98 + 4;
            v38 = v95 + 1;
            v37 = v96 + 1;
            if (v100 <= (v98 + 4))
              goto LABEL_75;
          }
          v41 = 0;
          v42 = (v40 ^ v39) & v39;
          v43 = (v40 ^ v39) & v40;
          v44 = 128;
          while (2)
          {
            if ((v44 & v42) != 0)
            {
              v45 = 0x10000;
              goto LABEL_38;
            }
            if ((v44 & v43) != 0)
            {
              v45 = 0;
LABEL_38:
              v35 = v35 & 0xFFFE000F | v45 | (v34 << 8) | (16 * v41);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v35, v83);
              v46 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v33, "insertObject:atIndex:", v46, v19);
              v36 = (void *)v46;
            }
            v3 = v41 == 0;
            v41 ^= 1u;
            if (!v3)
              LOBYTE(v34) = v34 + 1;
            v47 = v44 > 1;
            v44 >>= 1;
            if (!v47)
              goto LABEL_42;
            continue;
          }
        }
        v10 = v94;
        v65 = v85 + ((unint64_t)v100 >> 2);
        if ((v100 & 3) != 0)
          ++v65;
        _appendProtocolBFrontAndRearEvents(v22, v19, *(_BYTE *)(*((_QWORD *)v94 + 1) + v84) & 0xF, *(unsigned __int8 *)(*((_QWORD *)v94 + 1) + v65) >> 4, __dst[v84] & 0xF, __dst[v65] >> 4);
        v66 = *((_QWORD *)v94 + 1);
        v67 = v22;
        if (v100)
        {
          v68 = v67;
          v89 = v22;
          v69 = 0;
          LODWORD(v70) = 0;
          v36 = 0;
          v71 = (_BYTE *)(v66 + v85);
          v72 = 16;
          v73 = v83;
          while (1)
          {
            v74 = 0;
            v97 = v73;
            v99 = v71;
            v75 = *v71;
            v76 = ((v75 ^ *v73) & v75);
            v77 = ((v75 ^ *v73) & *v73);
            v78 = v72;
            do
            {
              v79 = v69;
              if ((v78 & v76) != 0)
              {
                v80 = 0x10000;
              }
              else
              {
                if ((v78 & v77) == 0)
                  goto LABEL_69;
                v80 = 0;
              }
              v70 = v70 & 0xFFFE000F | v80 | (v79 << 8) | (16 * v74);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v70, v83);
              v81 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v68, "insertObject:atIndex:", v81, v19);
              v36 = (void *)v81;
LABEL_69:
              if (v74)
                v69 = v79 + 1;
              else
                v69 = v79;
              v78 = 2 * v72;
              v72 = (2 * v72);
              if ((v78 & 0xFE) == 0)
                break;
              v74 ^= 1u;
            }
            while (v100 > v69);
            v73 = v97 + 1;
            v71 = v99 + 1;
            v72 = 1;
            if (v100 <= v69)
            {
LABEL_75:

              v10 = v94;
              v22 = v89;
              break;
            }
          }
        }
LABEL_76:

        v5 = __dst;
        memcpy(__dst, *((const void **)v10 + 1), v10[1]);
        v6 = v88;
        v8 = v90;
        v7 = v91;
LABEL_77:

        goto LABEL_78;
      }
    }
    v29 = 0x10000;
LABEL_26:
    v5 = (unsigned __int8 *)(v5 & 0xFFFE00FF | v23 | v29);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v5, v83);
    v30 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "insertObject:atIndex:", v30, v19);
    v24 = (void *)v30;
    goto LABEL_27;
  }
LABEL_79:
  if (!objc_msgSend(v8, "count", v83))
  {

LABEL_81:
    v8 = 0;
  }
  return v8;
}

void _appendProtocolBFrontAndRearEvents(void *a1, uint64_t a2, int a3, int a4, int a5, int a6)
{
  int v11;
  void *v12;
  int v13;
  int v14;
  char v15;
  int v16;
  uint64_t v17;
  char v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v24 = a1;
  v11 = 0;
  v12 = 0;
  HIDWORD(v23) = (a5 ^ a3) & a5;
  v13 = (a5 ^ a3) & a3;
  LODWORD(v23) = (a6 ^ a4) & a6;
  v14 = (a6 ^ a4) & a4;
  v15 = 1;
  v16 = 1;
  LODWORD(v17) = 1;
  do
  {
    v18 = v15;
    if ((v16 & v13) != 0)
    {
      v19 = 0x10000;
    }
    else
    {
      if ((v16 & HIDWORD(v23)) == 0)
        goto LABEL_7;
      v19 = 0;
    }
    LODWORD(v17) = v11 | v19 | v17 & 0xFFFE00FF | 0x800;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v17, v23);
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "insertObject:atIndex:", v20, a2);
    v12 = (void *)v20;
LABEL_7:
    if ((v16 & v14) != 0)
    {
      v21 = 0x10000;
    }
    else
    {
      if ((v16 & v23) == 0)
        goto LABEL_12;
      v21 = 0;
    }
    v17 = v11 | v21 | v17 & 0xFFFE00FF | 0xA00;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v17, v23);
    v22 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "insertObject:atIndex:", v22, a2);
    v12 = (void *)v22;
LABEL_12:
    v15 = 0;
    v16 = 2 * v16;
    v11 = 256;
  }
  while ((v18 & 1) != 0);

}

CFDataRef SCRDSeikaCreateIdentityPacketFromBuffer(const __CFData *a1)
{
  const UInt8 *BytePtr;
  CFDataRef v4;
  CFRange v5;
  CFRange v6;

  if (!a1)
    return 0;
  SCRDAdvanceBufferToPacketStart(a1, 0);
  if ((unint64_t)CFDataGetLength(a1) < 0xC)
    return 0;
  while (1)
  {
    BytePtr = CFDataGetBytePtr(a1);
    if (*(_QWORD *)(BytePtr + 4) == 0x1010101302E3576 || *(_QWORD *)(BytePtr + 4) == 0x616B696573)
      break;
    v5.location = 0;
    v5.length = 1;
    CFDataDeleteBytes(a1, v5);
    SCRDAdvanceBufferToPacketStart(a1, 0);
    if ((unint64_t)CFDataGetLength(a1) <= 0xB)
      return 0;
  }
  v4 = CFDataCreate(0, BytePtr, 12);
  v6.location = 0;
  v6.length = 12;
  CFDataDeleteBytes(a1, v6);
  return v4;
}

CFDataRef SCRDSeikaCreateWriteRequestPacket(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  unint64_t v5;
  CFIndex v6;
  size_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  _QWORD v14[12];

  v3 = a2;
  v14[11] = *MEMORY[0x24BDAC8D0];
  if (a3 == 2)
  {
    v14[0] = 0x303873FFFFLL;
    if (a2 <= 79)
      bzero((char *)&v14[1] + a2, 80 - a2);
    __memcpy_chk();
    goto LABEL_20;
  }
  if (a3 == 1)
  {
    v14[0] = 0x5000630004FFFFLL;
    if (a2 > 39)
    {
      v3 = 40;
      goto LABEL_14;
    }
    bzero((char *)&v14[1] + 2 * a2, 80 - 2 * a2);
    if (v3 >= 1)
    {
LABEL_14:
      v8 = 0;
      v9 = 8;
      v10 = 1;
      v6 = 88;
      do
      {
        v11 = v9 + 1;
        *((_BYTE *)v14 + v9) = 0;
        v9 += 2;
        *((_BYTE *)v14 + v11) = *(_BYTE *)(a1 + v8);
        v8 = v10;
      }
      while (v3 > v10++);
      return CFDataCreate(0, (const UInt8 *)v14, v6);
    }
LABEL_20:
    v6 = 88;
    return CFDataCreate(0, (const UInt8 *)v14, v6);
  }
  if (a3 - 3 <= 3)
  {
    v5 = 0x181008282828uLL >> (8 * a3);
    if (a3 >= 6)
      LOBYTE(v5) = 40;
    v6 = v5 & 0x38 | 4;
    LOWORD(v14[0]) = -1;
    BYTE2(v14[0]) = -93;
    BYTE3(v14[0]) = v5;
    v7 = (v5 & 0x38) - a2;
    if ((int64_t)(v5 & 0x38) > v3)
      bzero((char *)v14 + v3 + 4, v7);
    __memcpy_chk();
    return CFDataCreate(0, (const UInt8 *)v14, v6);
  }
  return 0;
}

id SCRDSeikaExtractEventsFromBuffer(CFDataRef theData, int a2)
{
  id v5;
  int v6;
  id v7;
  CFIndex v8;
  unint64_t v9;
  const UInt8 *BytePtr;
  size_t Length;
  size_t v12;
  int v13;
  CFRange v14;
  __CFData *v16;
  const UInt8 *v17;
  const UInt8 *v18;
  uint64_t v19;
  UInt8 v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  const UInt8 *v26;
  uint64_t v27;
  int v28;
  char v29;
  UInt8 v30;
  CFIndex v31;
  int __s2;
  unsigned __int16 v33;
  CFRange v34;

  if ((a2 - 3) <= 3)
  {
    _SCRDSeikaNotetakerExtractEventsFromBuffer(theData);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (!theData || CFDataGetLength(theData) < 2)
  {
LABEL_67:
    v5 = 0;
    return v5;
  }
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  do
  {
    v6 = *CFDataGetBytePtr(theData);
    if (v6 == 8)
    {
      v7 = v5;
      v33 = 0;
      __s2 = 2312;
      if (a2 == 1)
      {
        v9 = 5;
      }
      else
      {
        LODWORD(v8) = 0;
        if (a2 != 2)
          goto LABEL_58;
        BYTE1(__s2) = 15;
        v9 = 10;
      }
      BytePtr = CFDataGetBytePtr(theData);
      Length = CFDataGetLength(theData);
      v12 = Length - 6;
      if (Length > 6)
      {
        if (*(_DWORD *)BytePtr != __s2 || *((unsigned __int16 *)BytePtr + 2) != v33)
          goto LABEL_22;
        v22 = 0;
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v26 = BytePtr + 6;
        if (v9 < v12)
          v12 = v9;
        do
        {
          if (v26[v25])
          {
            v27 = 0;
            v28 = 1;
            v29 = 1;
            do
            {
              if ((v29 & v26[v25]) != 0)
              {
                v23 = v22 + v27;
                ++v24;
              }
              ++v27;
              v29 = 2 * v28;
              v28 = (2 * v28) & 0xFE;
            }
            while (v27 != 8);
          }
          ++v25;
          v22 += 8;
        }
        while (v25 != v12);
        v8 = v9 + 6;
        if (Length < v9 + 6)
        {
          v8 = 1;
          if (v24 <= 1)
            goto LABEL_58;
          goto LABEL_17;
        }
        if (v24 != 1)
        {
LABEL_22:
          v14.location = 0;
          v8 = 1;
          goto LABEL_23;
        }
        SCRDAppendFullKeystrokeFromEvent(v7, objc_msgSend(v7, "count", Length), v23 << 8);
LABEL_17:
        v14.location = 0;
LABEL_23:
        v16 = theData;
        v14.length = v8;
LABEL_57:
        CFDataDeleteBytes(v16, v14);
        LODWORD(v8) = 0;
        goto LABEL_58;
      }
      v13 = memcmp(BytePtr, &__s2, Length);
      v8 = 1;
      if (v13)
        goto LABEL_17;
LABEL_58:

      goto LABEL_59;
    }
    if ((~v6 & 0x60) == 0)
    {
      v7 = v5;
      if (CFDataGetLength(theData) < 2)
      {
        LODWORD(v8) = 1;
        goto LABEL_58;
      }
      v17 = CFDataGetBytePtr(theData);
      if ((~*v17 & 0x60) != 0 || (v18 = v17, v17[1] < 0xE0u))
      {
        v14.location = 0;
        v14.length = 1;
LABEL_56:
        v16 = theData;
        goto LABEL_57;
      }
      v19 = objc_msgSend(v7, "count");
      if ((*v18 & 1) != 0)
        SCRDAppendFullKeystrokeFromEvent(v7, v19, 1);
      v20 = v18[1];
      if ((v20 & 2) != 0)
      {
        v21 = 257;
        SCRDAppendFullKeystrokeFromEvent(v7, v19, 257);
        v20 = v18[1];
        if ((v20 & 8) == 0)
          goto LABEL_47;
      }
      else
      {
        v21 = 1;
        if ((v18[1] & 8) == 0)
        {
LABEL_47:
          if ((v20 & 0x10) != 0)
          {
            v21 = 769;
            SCRDAppendFullKeystrokeFromEvent(v7, v19, 769);
          }
          v30 = *v18;
          if ((*v18 & 0x10) != 0)
          {
            v21 = 1025;
            SCRDAppendFullKeystrokeFromEvent(v7, v19, 1025);
            v30 = *v18;
            if ((*v18 & 8) == 0)
            {
LABEL_51:
              if ((v30 & 2) == 0)
              {
LABEL_53:
                if ((v30 & 4) != 0)
                  SCRDAppendFullKeystrokeFromEvent(v7, v19, v21 | 0x700);
                v14.location = 0;
                v14.length = 2;
                goto LABEL_56;
              }
LABEL_52:
              SCRDAppendFullKeystrokeFromEvent(v7, v19, v21 | 0x600);
              v30 = *v18;
              v21 = v21 | 0x600;
              goto LABEL_53;
            }
          }
          else if ((*v18 & 8) == 0)
          {
            goto LABEL_51;
          }
          SCRDAppendFullKeystrokeFromEvent(v7, v19, v21 | 0x500);
          v30 = *v18;
          v21 = v21 | 0x500;
          if ((*v18 & 2) == 0)
            goto LABEL_53;
          goto LABEL_52;
        }
      }
      v21 = 513;
      SCRDAppendFullKeystrokeFromEvent(v7, v19, 513);
      v20 = v18[1];
      goto LABEL_47;
    }
    v34.location = 0;
    v34.length = 1;
    CFDataDeleteBytes(theData, v34);
    LODWORD(v8) = 0;
LABEL_59:
    v31 = CFDataGetLength(theData);
  }
  while (!(_DWORD)v8 && v31 > 1);
  if (!objc_msgSend(v5, "count"))
  {

    goto LABEL_67;
  }
  return v5;
}

id _SCRDSeikaNotetakerExtractEventsFromBuffer(const __CFData *a1)
{
  const __CFData *v1;
  id v2;
  CFDataRef PacketFromBuffer;
  const __CFData *v4;
  int v5;
  id v6;
  const UInt8 *v7;
  id v8;
  const UInt8 *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unsigned __int8 v14;
  unsigned int v15;
  const UInt8 *v16;
  char v17;
  char v18;
  id v19;
  const UInt8 *BytePtr;
  unint64_t v21;
  const UInt8 *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 v26;
  unsigned int v27;
  const UInt8 *v28;
  char v29;
  char v30;
  const __CFData *v32;

  if (!a1)
    goto LABEL_30;
  v1 = a1;
  if (CFDataGetLength(a1) < 4)
    goto LABEL_30;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  PacketFromBuffer = SCRDSeikaNotetakerCreatePacketFromBuffer(v1);
  if (PacketFromBuffer)
  {
    v4 = PacketFromBuffer;
    v32 = v1;
    while (1)
    {
      v5 = CFDataGetBytePtr(v4)[2];
      if (v5 == 164)
        break;
      if (v5 == 168)
      {
        v19 = v2;
        BytePtr = CFDataGetBytePtr(v4);
        v21 = BytePtr[3];
        if (v21 < 3)
          goto LABEL_26;
        v22 = BytePtr;
        v23 = objc_msgSend(v19, "count");
        _notetakerAppendButtonEventFromBuffer((_BYTE *)v22 + 4, 3, v19, v23);
        v24 = (v21 - 3);
        v12 = v19;
        if ((_DWORD)v21 != 3)
        {
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v28 = v22 + 7;
          do
          {
            v29 = 1;
            v30 = 1;
            do
            {
              if ((v30 & v28[v25]) != 0)
              {
                v27 = v27 & 0xFFFF00FF | (v26 << 8);
                SCRDAppendFullKeystrokeFromEvent(v12, v23, v27);
              }
              ++v26;
              v29 *= 2;
              v30 = v29;
            }
            while ((v29 & 0xFE) != 0);
            ++v25;
          }
          while (v25 != v24);
        }
LABEL_25:

        v1 = v32;
        goto LABEL_26;
      }
      if (v5 == 166)
      {
        v6 = v2;
        v7 = CFDataGetBytePtr(v4);
        _notetakerAppendButtonEventFromBuffer((_BYTE *)v7 + 4, v7[3], v6, objc_msgSend(v6, "count"));
LABEL_26:

      }
      CFRelease(v4);
      v4 = SCRDSeikaNotetakerCreatePacketFromBuffer(v1);
      if (!v4)
        goto LABEL_28;
    }
    v8 = v2;
    v9 = CFDataGetBytePtr(v4);
    v10 = v9[3];
    v11 = objc_msgSend(v8, "count");
    v12 = v8;
    if (v10)
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = v9 + 4;
      do
      {
        v17 = 1;
        v18 = 1;
        do
        {
          if ((v18 & v16[v13]) != 0)
          {
            v15 = v15 & 0xFFFF00FF | (v14 << 8);
            SCRDAppendFullKeystrokeFromEvent(v12, v11, v15);
          }
          ++v14;
          v17 *= 2;
          v18 = v17;
        }
        while ((v17 & 0xFE) != 0);
        ++v13;
      }
      while (v13 != v10);
    }
    goto LABEL_25;
  }
LABEL_28:
  if (!objc_msgSend(v2, "count"))
  {

LABEL_30:
    v2 = 0;
  }
  return v2;
}

CFDataRef SCRDSeikaNotetakerCreatePacketFromBuffer(const __CFData *a1)
{
  CFIndex Length;
  CFIndex v3;
  const UInt8 *BytePtr;
  int v5;
  uint64_t v7;
  CFIndex v8;
  CFDataRef v10;
  CFRange v12;
  CFRange v13;

  if (!a1)
    return 0;
  SCRDAdvanceBufferToPacketStart(a1, 255);
  Length = CFDataGetLength(a1);
  if (Length < 4)
    return 0;
  v3 = Length;
  while (1)
  {
    BytePtr = CFDataGetBytePtr(a1);
    if (BytePtr[1] == 255)
    {
      v5 = BytePtr[2];
      if ((v5 - 162) <= 6 && ((1 << (v5 + 94)) & 0x55) != 0)
      {
        v7 = BytePtr[3];
        v8 = v7 + 4;
        if (v3 < (unint64_t)(v7 + 4))
          return 0;
        if (v5 != 162 || v7 >= 3)
          break;
      }
    }
    v12.location = 0;
    v12.length = 1;
    CFDataDeleteBytes(a1, v12);
    SCRDAdvanceBufferToPacketStart(a1, 255);
    v3 = CFDataGetLength(a1);
    if (v3 <= 3)
      return 0;
  }
  v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], BytePtr, v7 + 4);
  if (v10)
  {
    v13.location = 0;
    v13.length = v8;
    CFDataDeleteBytes(a1, v13);
  }
  return v10;
}

void _notetakerAppendButtonEventFromBuffer(_BYTE *a1, uint64_t a2, void *a3, uint64_t a4)
{
  unsigned int v7;
  int v8;
  int v9;
  char v10;
  unsigned int v11;
  unsigned int v12;
  char v13;
  unsigned __int8 v14;
  uint64_t i;
  char v16;
  id v17;

  v17 = a3;
  if (a2 == 3)
  {
    if ((a1[1] & 3) != 0)
    {
      v7 = 2050;
      SCRDAppendFullKeystrokeFromEvent(v17, a4++, 2050);
    }
    else
    {
      v7 = 0;
    }
    if (*a1)
    {
      v8 = 0;
      v7 |= 2u;
      v9 = 1;
      v10 = 1;
      do
      {
        if ((v10 & *a1) != 0)
        {
          v11 = v7 & 0xFFFF00FF;
          v7 = v8 | v7 & 0xFFFF00FF;
          SCRDAppendFullKeystrokeFromEvent(v17, a4++, v8 | v11);
        }
        v10 = 2 * v9;
        v9 = (2 * v9) & 0xFE;
        v8 += 256;
      }
      while (v8 != 2048);
    }
    if (a1[1] & 0xFC | a1[2])
    {
      v12 = v7 & 0xFFFFFFF0 | 1;
      v13 = 4;
      v14 = 11;
      for (i = 1; i != 3; ++i)
      {
        v16 = v13;
        do
        {
          if ((v16 & a1[i]) != 0)
          {
            v12 = v12 & 0xFFFF00FF | (v14 << 8);
            SCRDAppendFullKeystrokeFromEvent(v17, a4++, v12);
          }
          ++v14;
          v13 *= 2;
          v16 = v13;
        }
        while ((v13 & 0xFE) != 0);
        v13 = 1;
      }
    }
  }

}

id SCRDSerialDeviceCalloutDevicePath(io_registry_entry_t a1)
{
  void *CFProperty;

  if (!a1)
    goto LABEL_5;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a1, CFSTR("IOCalloutDevice"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_5:
      CFProperty = 0;
    }
  }
  return CFProperty;
}

uint64_t SCRDClearExclusiveAccessForFileDescriptor(uint64_t result)
{
  if ((_DWORD)result != -1)
    return ioctl(result, 0x2000740EuLL);
  return result;
}

uint64_t SCRDSerialDeviceOpenSerialPortForPath(void *a1)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "cStringUsingEncoding:", 4);
  if (!v1)
    return 0xFFFFFFFFLL;
  v2 = open(v1, 131078);
  v3 = v2;
  if ((_DWORD)v2 != -1)
  {
    if (ioctl(v2, 0x2000740DuLL) == -1)
    {
LABEL_6:
      close(v3);
      return 0xFFFFFFFFLL;
    }
    if (fcntl(v3, 4, 0) == -1)
    {
      ioctl(v3, 0x2000740EuLL);
      goto LABEL_6;
    }
  }
  return v3;
}

uint64_t _getSerialDeviceForUSBDevice(int a1, int a2, int a3)
{
  io_iterator_t ModemIteratorForDevicePropertyKey;
  io_iterator_t v4;
  unint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const __CFNumber *v10;
  NSObject *v11;
  const char *v12;
  const __CFNumber *v13;
  NSObject *v14;
  const __CFNumber *v15;
  NSObject *v16;
  int Value;
  io_registry_entry_t v18;
  char v19;
  kern_return_t ParentEntry;
  io_registry_entry_t v21;
  int v24;
  unint64_t v26;
  const __CFAllocator *allocator;
  int v29;
  int valuePtr;
  io_registry_entry_t parent;
  uint8_t buf[4];
  const __CFNumber *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  ModemIteratorForDevicePropertyKey = _retrieveModemIteratorForDevicePropertyKey();
  if (!ModemIteratorForDevicePropertyKey)
    return 0;
  v4 = ModemIteratorForDevicePropertyKey;
  v5 = 0;
  allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = "Modem: got iterator service: %d";
  do
  {
    v26 = v5;
    while (1)
    {
      v7 = IOIteratorNext(v4);
      v8 = v7;
      if (!(_DWORD)v7)
        break;
      parent = 0;
      if (IORegistryEntryGetParentEntry(v7, "IOService", &parent))
      {
        parent = 0;
      }
      else
      {
        v18 = parent;
        if (parent)
        {
          v19 = 1;
          do
          {
            *(_DWORD *)buf = 0;
            ParentEntry = IORegistryEntryGetParentEntry(v18, "IOService", (io_registry_entry_t *)buf);
            IOObjectRelease(parent);
            v18 = *(_DWORD *)buf;
            if (ParentEntry)
              v21 = 0;
            else
              v21 = *(_DWORD *)buf;
            parent = v21;
            if ((v19 & 1) == 0)
              break;
            v19 = 0;
          }
          while (v21);
        }
      }
      _SCROD_LOG();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v33) = parent;
        _os_log_impl(&dword_2282BD000, v9, OS_LOG_TYPE_DEFAULT, v6, buf, 8u);
      }

      if (parent)
      {
        valuePtr = 0;
        v10 = (const __CFNumber *)IORegistryEntrySearchCFProperty(parent, "IOService", CFSTR("idVendor"), allocator, 0);
        _SCROD_LOG();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v33 = v10;
          _os_log_impl(&dword_2282BD000, v11, OS_LOG_TYPE_DEFAULT, "Modem: got vid ref %{public}@", buf, 0xCu);
        }

        if (v10)
        {
          if (!CFNumberGetValue(v10, kCFNumberSInt32Type, &valuePtr) || valuePtr != a1)
          {
            CFRelease(v10);
            goto LABEL_37;
          }
          v12 = v6;
          v29 = 0;
          v13 = (const __CFNumber *)IORegistryEntrySearchCFProperty(parent, "IOService", CFSTR("idProduct"), allocator, 0);
          _SCROD_LOG();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v33 = v13;
            _os_log_impl(&dword_2282BD000, v14, OS_LOG_TYPE_DEFAULT, "Modem: got pid ref %{public}@", buf, 0xCu);
          }

          if (!v13)
            goto LABEL_36;
          if (!CFNumberGetValue(v13, kCFNumberSInt32Type, &v29) || v29 != a2)
            goto LABEL_35;
          v15 = (const __CFNumber *)IORegistryEntrySearchCFProperty(parent, "IOService", CFSTR("locationID"), allocator, 0);
          _SCROD_LOG();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v33 = v15;
            _os_log_impl(&dword_2282BD000, v16, OS_LOG_TYPE_DEFAULT, "Modem: got loc ref %{public}@", buf, 0xCu);
          }

          if (!v15)
          {
LABEL_35:
            CFRelease(v13);
LABEL_36:
            CFRelease(v10);
            v6 = v12;
            goto LABEL_37;
          }
          *(_DWORD *)buf = 0;
          Value = CFNumberGetValue(v15, kCFNumberSInt32Type, buf);
          v24 = *(_DWORD *)buf;
          CFRelease(v15);
          CFRelease(v13);
          CFRelease(v10);
          v6 = v12;
          if (Value && v24 == a3)
            goto LABEL_40;
        }
      }
LABEL_37:
      IOObjectRelease(v8);
    }
    IOObjectRelease(v4);
    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.5);
    v4 = _retrieveModemIteratorForDevicePropertyKey();
    if (!v4)
      break;
    v5 = v26 + 1;
  }
  while (v26 <= 3);
LABEL_40:
  IOObjectRelease(v4);
  return v8;
}

uint64_t _retrieveModemIteratorForDevicePropertyKey()
{
  __CFDictionary *v0;
  NSObject *v1;
  unsigned int v2;
  kern_return_t MatchingServices;
  NSObject *v4;
  NSObject *v6;
  io_iterator_t existing[2];
  uint8_t buf[4];
  _DWORD v10[7];

  *(_QWORD *)&v10[5] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)existing = 0;
  MEMORY[0x22E2AEBE4](0, existing);
  v0 = IOServiceMatching("IOSerialBSDClient");
  _SCROD_LOG();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v10 = v0;
    _os_log_impl(&dword_2282BD000, v1, OS_LOG_TYPE_DEFAULT, "Matching classes: %{public}@", buf, 0xCu);
  }

  if (!v0)
    return 0;
  CFDictionarySetValue(v0, CFSTR("IOSerialBSDClientType"), CFSTR("IOSerialStream"));
  v2 = 0;
  do
  {
    MatchingServices = IOServiceGetMatchingServices(existing[0], v0, &existing[1]);
    if (existing[1])
      break;
    _SCROD_LOG();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v10[0] = v2;
      _os_log_impl(&dword_2282BD000, v4, OS_LOG_TYPE_DEFAULT, "Did not get iterator, waiting %d", buf, 8u);
    }

    v0 = IOServiceMatching("IOSerialBSDClient");
    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.5);
    if (existing[1])
      break;
  }
  while (v2++ < 9);
  _SCROD_LOG();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v10[0] = existing[1];
    LOWORD(v10[1]) = 1024;
    *(_DWORD *)((char *)&v10[1] + 2) = MatchingServices;
    _os_log_impl(&dword_2282BD000, v6, OS_LOG_TYPE_DEFAULT, "Got iterator: %d result: %d", buf, 0xEu);
  }

  if (MatchingServices)
    return 0;
  else
    return existing[1];
}

void _readWriteAsyncCallback(uint64_t a1, int a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;

  +[SCRDUSBDeviceCallbackManager sharedManager](SCRDUSBDeviceCallbackManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "completionWithReference:", a1);

  if (v7)
  {
    *(_DWORD *)(v7 + 8) = a2;
    *(_QWORD *)v7 = a3;
  }
}

void _notificationHandler(uint64_t a1, uint64_t a2, int a3)
{
  id v4;

  if (a3 == -536870896)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", kSCRDUSBDeviceDisconnectNotification, a1);

  }
}

void sub_2282C8A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

CFDataRef SCRDKGSCreateCommandPacket(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  CFIndex v5;
  char v6;
  const void *v7;
  size_t v8;
  uint64_t v9;
  char *v10;
  char v11;
  int v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (!a3 && a4)
    return 0;
  v5 = a4 + 6;
  v6 = MEMORY[0x24BDAC7A8]();
  v10 = (char *)v13 - v9;
  *(_WORD *)v10 = -1;
  v10[2] = v6;
  v10[3] = v11;
  *((_WORD *)v10 + 2) = v12;
  if (v12)
    memcpy(v10 + 6, v7, v8);
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v10, v5);
}

id SCRDKGSExtractEventsFromBuffer(const __CFData *a1)
{
  CFIndex Length;
  const UInt8 *BytePtr;
  unsigned __int8 *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  SCRDKGSPacket *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  id v22;
  unsigned __int8 *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  int v55;
  uint64_t v56;
  int v57;
  NSObject *v58;
  void *v59;
  unsigned int v60;
  int v61;
  uint64_t v62;
  NSObject *v63;
  void *v64;
  id v65;
  uint64_t v66;
  NSObject *v67;
  void *v68;
  int v69;
  int v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  void *v74;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  unsigned int v81;
  id v82;
  id v83;
  id v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  uint64_t v91;
  CFRange v92;
  CFRange v93;

  v91 = *MEMORY[0x24BDAC8D0];
  if (!a1 || (Length = CFDataGetLength(a1), SCRDAdvanceBufferToPacketStart(a1, 255), Length < 6))
  {
LABEL_100:
    v74 = 0;
    return v74;
  }
  v84 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  do
  {
    BytePtr = CFDataGetBytePtr(a1);
    v4 = (unsigned __int8 *)BytePtr;
    if (*BytePtr == 255 && BytePtr[1] == 255)
    {
      v10 = *((unsigned __int16 *)BytePtr + 2);
      if (Length >= (unint64_t)(v10 + 6))
      {
        v9 = objc_alloc_init(SCRDKGSPacket);
        -[SCRDKGSPacket setCommand:](v9, "setCommand:", v4[2]);
        -[SCRDKGSPacket setSubCommand:](v9, "setSubCommand:", v4[3]);
        _SCROD_LOG();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[SCRDKGSPacket command](v9, "command"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[SCRDKGSPacket subCommand](v9, "subCommand"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v86 = v15;
          v87 = 2112;
          v88 = v16;
          _os_log_impl(&dword_2282BD000, v14, OS_LOG_TYPE_DEFAULT, "KGS Driver: packet created with command %@, subcommand %@", buf, 0x16u);

        }
        if ((_DWORD)v10)
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v4 + 6, v10);
          -[SCRDKGSPacket setData:](v9, "setData:", v17);

        }
        v93.location = 0;
        v93.length = v10 + 6;
        CFDataDeleteBytes(a1, v93);
        if (!v9)
          goto LABEL_96;
        v18 = -[SCRDKGSPacket command](v9, "command");
        if ((v18 - 242) >= 2)
        {
          if (v18 == 240)
          {
            -[SCRDKGSPacket data](v9, "data");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "length");

            if (v21 >= 3)
            {
              -[SCRDKGSPacket data](v9, "data");
              v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v23 = (unsigned __int8 *)objc_msgSend(v22, "bytes");

              v24 = *v23;
              v25 = v23[1];
              v81 = v23[2];
              v26 = v84;
              v27 = v26;
              v80 = v26;
              if ((_DWORD)v24 == 1)
              {
                v28 = v26;
                if ((_DWORD)v25)
                {
                  v29 = v28;
                  v30 = objc_msgSend(v28, "count");
                  v31 = v30;
                  if ((v25 & 0x10) != 0)
                  {
                    v44 = v30 + 1;
                    SCRDAppendFullKeystrokeFromEvent(v29, v30, 1794);
                    v31 = v44;
                  }
                  if ((v25 & 1) == 0)
                  {
                    if ((v25 & 0x80) == 0)
                      goto LABEL_46;
LABEL_60:
                    v49 = v31 + 1;
                    SCRDAppendFullKeystrokeFromEvent(v29, v31, 2);
                    v31 = v49;
                    if ((v25 & 0x40) != 0)
                      goto LABEL_61;
LABEL_47:
                    if ((v25 & 0x20) == 0)
                      goto LABEL_48;
LABEL_62:
                    v51 = v31 + 1;
                    SCRDAppendFullKeystrokeFromEvent(v29, v31, 514);
                    v31 = v51;
                    if ((v25 & 8) != 0)
                      goto LABEL_63;
LABEL_49:
                    if ((v25 & 4) == 0)
                      goto LABEL_50;
LABEL_64:
                    v53 = v31 + 1;
                    SCRDAppendFullKeystrokeFromEvent(v29, v31, 1026);
                    v31 = v53;
                    if ((v25 & 2) == 0)
                      goto LABEL_52;
LABEL_51:
                    v45 = v31 + 1;
                    SCRDAppendFullKeystrokeFromEvent(v29, v31, 1282);
                    v31 = v45;
                    goto LABEL_52;
                  }
                  v48 = v31 + 1;
                  SCRDAppendFullKeystrokeFromEvent(v29, v31, 2050);
                  v31 = v48;
                  if ((v25 & 0x80) != 0)
                    goto LABEL_60;
LABEL_46:
                  if ((v25 & 0x40) == 0)
                    goto LABEL_47;
LABEL_61:
                  v50 = v31 + 1;
                  SCRDAppendFullKeystrokeFromEvent(v29, v31, 258);
                  v31 = v50;
                  if ((v25 & 0x20) != 0)
                    goto LABEL_62;
LABEL_48:
                  if ((v25 & 8) == 0)
                    goto LABEL_49;
LABEL_63:
                  v52 = v31 + 1;
                  SCRDAppendFullKeystrokeFromEvent(v29, v31, 770);
                  v31 = v52;
                  if ((v25 & 4) != 0)
                    goto LABEL_64;
LABEL_50:
                  if ((v25 & 2) != 0)
                    goto LABEL_51;
LABEL_52:
                  if (v81)
                  {
                    if ((v81 & 4) != 0)
                    {
                      v46 = v31 + 1;
                      SCRDAppendFullKeystrokeFromEvent(v29, v31, 2818);
                      v31 = v46;
                    }
                    if ((v81 & 8) != 0)
                    {
                      v47 = v31 + 1;
                      SCRDAppendFullKeystrokeFromEvent(v29, v31, 3074);
                      v31 = v47;
                    }
                    if ((v81 & 0x33333333) != 0)
                    {
                      v43 = 2306;
                      v42 = v29;
                      goto LABEL_87;
                    }
                  }
                }
              }
              else
              {
                _SCROD_LOG();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v24);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v25);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v81);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v86 = v33;
                  v87 = 2112;
                  v88 = v34;
                  v89 = 2112;
                  v90 = v35;
                  _os_log_impl(&dword_2282BD000, v32, OS_LOG_TYPE_DEFAULT, "KGS Driver: append event for control key %@, %@, %@", buf, 0x20u);

                  v27 = v80;
                }

                switch((int)v24)
                {
                  case 0:
                    v36 = v27;
                    v37 = objc_msgSend(v36, "count");
                    if ((v81 & 1) != 0)
                    {
                      _SCROD_LOG();
                      v38 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 513);
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412290;
                        v86 = v39;
                        _os_log_impl(&dword_2282BD000, v38, OS_LOG_TYPE_DEFAULT, "KGS Driver: append full key stroke from event: %@", buf, 0xCu);

                      }
                      SCRDAppendFullKeystrokeFromEvent(v36, v37++, 513);
                    }
                    if ((v81 & 2) == 0)
                      goto LABEL_94;
                    _SCROD_LOG();
                    v40 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 769);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v86 = v41;
                      _os_log_impl(&dword_2282BD000, v40, OS_LOG_TYPE_DEFAULT, "KGS Driver: append full key stroke from event: %@", buf, 0xCu);

                    }
                    v42 = v36;
                    v31 = v37;
                    v43 = 769;
                    break;
                  case 2:
                    v77 = v27;
                    v76 = objc_msgSend(v77, "count");
                    v54 = 1;
                    v55 = 4096;
                    LODWORD(v56) = 1;
                    do
                    {
                      if ((v54 & v25) != 0)
                      {
                        if ((v81 & 0x10) != 0)
                          v57 = 2304;
                        else
                          v57 = v55;
                        v56 = v57 | v56 & 0xFFFF00FF;
                        _SCROD_LOG();
                        v58 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                        {
                          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v56);
                          v59 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412290;
                          v86 = v59;
                          _os_log_impl(&dword_2282BD000, v58, OS_LOG_TYPE_DEFAULT, "KGS Driver: append full key stroke from event: %@", buf, 0xCu);

                        }
                        SCRDAppendFullKeystrokeFromEvent(v77, v76, v56);
                      }
                      v54 = 2 * v54;
                      v55 += 256;
                    }
                    while (v55 != 5632);
                    goto LABEL_94;
                  case 3:
                    v82 = v27;
                    v78 = objc_msgSend(v82, "count");
                    v60 = 0;
                    v61 = 1;
                    LODWORD(v62) = 1;
                    do
                    {
                      if ((v61 & v25) != 0)
                      {
                        v62 = v62 & 0xFFFF00FF | v60;
                        _SCROD_LOG();
                        v63 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                        {
                          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v62);
                          v64 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412290;
                          v86 = v64;
                          _os_log_impl(&dword_2282BD000, v63, OS_LOG_TYPE_DEFAULT, "KGS Driver: append full key stroke from event: %@", buf, 0xCu);

                        }
                        SCRDAppendFullKeystrokeFromEvent(v82, v78, v62);
                      }
                      v61 = 2 * v61;
                      v60 += 256;
                    }
                    while (v60 != 1024);
                    goto LABEL_94;
                  case 4:
                    if (!(_DWORD)v25)
                      goto LABEL_95;
                    v65 = v27;
                    v66 = objc_msgSend(v65, "count");
                    _SCROD_LOG();
                    v67 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", (((_DWORD)v25 << 8) - 256));
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v86 = v68;
                      _os_log_impl(&dword_2282BD000, v67, OS_LOG_TYPE_DEFAULT, "KGS Driver: append full key stroke from event: %@", buf, 0xCu);

                    }
                    v42 = v65;
                    v31 = v66;
                    v43 = ((_DWORD)v25 << 8) - 256;
                    break;
                  case 6:
                    v83 = v27;
                    v79 = objc_msgSend(v83, "count");
                    v69 = 1;
                    v70 = 2048;
                    LODWORD(v71) = 1;
                    do
                    {
                      if ((v69 & v25) != 0)
                      {
                        v71 = v70 + (v71 & 0xFFFF00FF);
                        _SCROD_LOG();
                        v72 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                        {
                          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v71);
                          v73 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412290;
                          v86 = v73;
                          _os_log_impl(&dword_2282BD000, v72, OS_LOG_TYPE_DEFAULT, "KGS Driver: append full key stroke from event: %@", buf, 0xCu);

                        }
                        SCRDAppendFullKeystrokeFromEvent(v83, v79, v71);
                      }
                      v69 = 2 * v69;
                      v70 += 256;
                    }
                    while (v70 != 3072);
                    goto LABEL_94;
                  default:
                    goto LABEL_95;
                }
LABEL_87:
                SCRDAppendFullKeystrokeFromEvent(v42, v31, v43);
              }
LABEL_94:
              v27 = v80;

LABEL_95:
LABEL_96:
              v8 = 1;
              goto LABEL_9;
            }
          }
        }
        else
        {
          _SCROD_LOG();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2282BD000, v19, OS_LOG_TYPE_DEFAULT, "KGS Driver: ignoring shift key", buf, 2u);
          }

        }
        v8 = 1;
      }
      else
      {
        _SCROD_LOG();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", Length);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v86 = v12;
          v87 = 2112;
          v88 = v13;
          _os_log_impl(&dword_2282BD000, v11, OS_LOG_TYPE_DEFAULT, "KGS Driver: not enough room in the buffer for the packet: 6 + packetSize (%@) > bufferLength (%@)", buf, 0x16u);

        }
        v8 = 0;
        v9 = 0;
      }
    }
    else
    {
      _SCROD_LOG();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v4[1]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v86 = v6;
        v87 = 2112;
        v88 = v7;
        _os_log_impl(&dword_2282BD000, v5, OS_LOG_TYPE_DEFAULT, "KGS Driver: failed to extract packet because bufferPtr[0] (%@) != 0xFF || bufferPtr[1] (%@) != 0xFF", buf, 0x16u);

      }
      v8 = 1;
      v92.location = 0;
      v92.length = 1;
      CFDataDeleteBytes(a1, v92);
      v9 = 0;
    }
LABEL_9:
    SCRDAdvanceBufferToPacketStart(a1, 255);
    Length = CFDataGetLength(a1);

  }
  while (Length >= 6 && (v8 & 1) != 0);
  v74 = v84;
  if (v84 && !objc_msgSend(v84, "count"))
  {

    goto LABEL_100;
  }
  return v74;
}

unsigned __int8 *SCRDKGSConvertBrailleCellsToKGSOrder(unsigned __int8 *result, unsigned int a2)
{
  uint64_t v2;
  unsigned int v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = *result;
      *result++ = v3 & 8 | (v3 >> 7) | (32 * (__rbit32(v3) >> 29)) | (v3 >> 2) & 4 | (v3 >> 4) & 2 | (v3 >> 2) & 0x10;
      --v2;
    }
    while (v2);
  }
  return result;
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
  MEMORY[0x24BDBBCC8](theData, range.location, range.length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x24BDBBD20](theData, length);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC378](source);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x24BDBC908](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x24BDD7F90](*(_QWORD *)&service, pluginType, interfaceType, theInterface, theScore);
}

IOReturn IOHIDDeviceGetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength)
{
  return MEMORY[0x24BDD8048](device, *(_QWORD *)&reportType, reportID, report, pReportLength);
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x24BDD80A8](device, *(_QWORD *)&reportType, reportID, report, reportLength);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8680](*(_QWORD *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _SCROD_LOG()
{
  return MEMORY[0x24BE843D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x24BDAC7B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x24BDAFC70](*(_QWORD *)&a1, a2, a3, a4, a5);
}

