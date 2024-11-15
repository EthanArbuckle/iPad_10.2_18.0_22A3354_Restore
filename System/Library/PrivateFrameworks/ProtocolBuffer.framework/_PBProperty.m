@implementation _PBProperty

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PBProperty;
  -[_PBProperty dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v3;
  void *v4;
  int subType;
  const __CFString *structName;
  const __CFString *v7;
  int type;
  Class subObjectType;
  NSString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v15;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = v3;
  subType = self->_subType;
  if (self->_subType)
  {
    if (subType == 123)
    {
      structName = (const __CFString *)self->_structName;
      if (!structName)
        structName = CFSTR("?");
      objc_msgSend(v3, "appendFormat:", CFSTR("{%@="), structName);
      objc_msgSend(v4, "appendString:", -[NSArray componentsJoinedByString:](self->_structFields, "componentsJoinedByString:", &stru_1E4FACDB8));
      v7 = CFSTR("}");
    }
    else if ((char)subType > 82)
    {
      switch((char)subType)
      {
        case 'c':
          v7 = CFSTR("char");
          break;
        case 'd':
          v7 = CFSTR("double");
          break;
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          goto LABEL_52;
        case 'f':
          v7 = CFSTR("float");
          break;
        case 'i':
          v7 = CFSTR("int");
          break;
        case 'l':
          v7 = CFSTR("long");
          break;
        case 'q':
          v7 = CFSTR("long long");
          break;
        case 's':
          v7 = CFSTR("short");
          break;
        default:
          if ((char)subType == 83)
          {
            v7 = CFSTR("unsigned short");
          }
          else if ((char)subType == 94)
          {
            v7 = CFSTR("*");
          }
          else
          {
LABEL_52:
            v7 = CFSTR("?");
          }
          break;
      }
    }
    else
    {
      switch((char)subType)
      {
        case '@':
          v7 = CFSTR("id");
          break;
        case 'A':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
          goto LABEL_52;
        case 'B':
          v7 = CFSTR("BOOL");
          break;
        case 'C':
          v7 = CFSTR("unsigned char");
          break;
        case 'I':
          v7 = CFSTR("unsigned int");
          break;
        default:
          if ((char)subType == 76)
          {
            v7 = CFSTR("unsigned long");
          }
          else
          {
            if ((char)subType != 81)
              goto LABEL_52;
            v7 = CFSTR("unsigned long long");
          }
          break;
      }
    }
    objc_msgSend(v4, "appendString:", v7);
  }
  type = self->_type;
  if (type == 123)
  {
    v11 = (const __CFString *)self->_structName;
    if (!v11)
      v11 = CFSTR("?");
    objc_msgSend(v4, "appendFormat:", CFSTR("{%@="), v11);
    objc_msgSend(v4, "appendString:", -[NSArray componentsJoinedByString:](self->_structFields, "componentsJoinedByString:", &stru_1E4FACDB8));
    v12 = CFSTR("}");
  }
  else
  {
    if (type == 64)
    {
      subObjectType = self->_subObjectType;
      v10 = NSStringFromClass(self->_objectType);
      if (subObjectType)
        objc_msgSend(v4, "appendFormat:", CFSTR("%@<%@*>*"), v10, NSStringFromClass(self->_subObjectType));
      else
        objc_msgSend(v4, "appendFormat:", CFSTR("%@*"), v10, v15);
      goto LABEL_26;
    }
    if ((char)type > 82)
    {
      switch((char)type)
      {
        case 'c':
          v12 = CFSTR("char");
          break;
        case 'd':
          v12 = CFSTR("double");
          break;
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          goto LABEL_53;
        case 'f':
          v12 = CFSTR("float");
          break;
        case 'i':
          v12 = CFSTR("int");
          break;
        case 'l':
          v12 = CFSTR("long");
          break;
        case 'q':
          v12 = CFSTR("long long");
          break;
        case 's':
          v12 = CFSTR("short");
          break;
        default:
          if ((char)type == 83)
          {
            v12 = CFSTR("unsigned short");
          }
          else if ((char)type == 94)
          {
            v12 = CFSTR("*");
          }
          else
          {
LABEL_53:
            v12 = CFSTR("?");
          }
          break;
      }
    }
    else
    {
      switch((char)type)
      {
        case '@':
          v12 = CFSTR("id");
          break;
        case 'A':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
          goto LABEL_53;
        case 'B':
          v12 = CFSTR("BOOL");
          break;
        case 'C':
          v12 = CFSTR("unsigned char");
          break;
        case 'I':
          v12 = CFSTR("unsigned int");
          break;
        default:
          if ((char)type == 76)
          {
            v12 = CFSTR("unsigned long");
          }
          else
          {
            if ((char)type != 81)
              goto LABEL_53;
            v12 = CFSTR("unsigned long long");
          }
          break;
      }
    }
  }
  objc_msgSend(v4, "appendString:", v12);
LABEL_26:
  objc_msgSend(v4, "appendFormat:", CFSTR(" %@;"), self->_name);
  if (self->_has)
  {
    v13 = CFSTR(" (optional)");
  }
  else if (self->_count)
  {
    v13 = CFSTR(" (repeated)");
  }
  else
  {
    v13 = CFSTR(" (required)");
  }
  objc_msgSend(v4, "appendFormat:", v13);
  return v4;
}

- (id)_parseStructDefinition:(uint64_t)a1
{
  id v4;
  unint64_t v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  id v11;
  unint64_t i;
  uint64_t v13;
  unint64_t v14;
  BOOL v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  NSUInteger v25;
  uint64_t v27;
  NSUInteger sizep;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a2, "length"));
  if (objc_msgSend(a2, "length"))
  {
    v5 = 0;
    v27 = 0;
    v6 = CFSTR("ignoring struct field: %c in %@");
    while (1)
    {
      v7 = (char)objc_msgSend(a2, "characterAtIndex:", v5);
      v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), v7);
      if ((int)v7 <= 93)
        break;
      if ((v7 - 99) > 0x1A)
        goto LABEL_23;
      if (((1 << (v7 - 99)) & 0x1424B) != 0)
        goto LABEL_11;
      if ((_DWORD)v7 == 123)
      {
        v14 = v5 + 1;
        if (v5 + 1 >= objc_msgSend(a2, "length"))
        {
          ++v5;
        }
        else
        {
          ++v5;
          do
          {
            if (objc_msgSend(a2, "characterAtIndex:", v5) == 61)
              break;
            ++v5;
          }
          while (v5 < objc_msgSend(a2, "length"));
          if (*(_QWORD *)(a1 + 104))
            v15 = 1;
          else
            v15 = v5 == v14;
          if (!v15)
            *(_QWORD *)(a1 + 104) = (id)objc_msgSend(a2, "substringWithRange:", v14, v5 - v14);
        }
        goto LABEL_12;
      }
      if ((_DWORD)v7 != 125)
      {
LABEL_23:
        if ((_DWORD)v7 != 94)
        {
          if ((_DWORD)v7 != 98)
            goto LABEL_29;
          v9 = v6;
          v10 = a1;
          v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
          for (i = v5 + 1; i < objc_msgSend(a2, "length"); ++i)
          {
            v13 = objc_msgSend(a2, "characterAtIndex:", i);
            if ((v13 - 48) > 9)
              break;
            v5 = i;
            objc_msgSend(v11, "appendFormat:", CFSTR("%C"), v13);
          }
          v16 = objc_msgSend(v11, "intValue");
          v27 += v16;
          a1 = v10;
          v6 = v9;
          if (!v16)
            goto LABEL_12;
        }
LABEL_11:
        objc_msgSend(v4, "addObject:", v8);
      }
LABEL_12:
      if (++v5 >= objc_msgSend(a2, "length"))
        goto LABEL_43;
    }
    if ((int)v7 > 72)
    {
      if ((int)v7 > 80)
      {
        if ((_DWORD)v7 != 81 && (_DWORD)v7 != 83)
          goto LABEL_29;
      }
      else if ((_DWORD)v7 != 73 && (_DWORD)v7 != 76)
      {
        goto LABEL_29;
      }
    }
    else if ((v7 - 66) >= 2)
    {
      if ((_DWORD)v7 == 61 || (_DWORD)v7 == 63)
        goto LABEL_12;
LABEL_29:
      NSLog(&v6->isa, v7, a2);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v27 = 0;
LABEL_43:
  if (!objc_msgSend(v4, "count"))
    return 0;
  v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", objc_msgSend(a2, "length"));
  objc_msgSend(v17, "appendString:", CFSTR("{?="));
  v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c"), 98);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v4);
        v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        if ((objc_msgSend(v23, "isEqualToString:", v18) & 1) == 0)
          objc_msgSend(v17, "appendString:", v23);
      }
      v20 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v20);
  }
  if (v27)
    objc_msgSend(v17, "appendFormat:", CFSTR("%c"), 105);
  objc_msgSend(v17, "appendString:", CFSTR("}"));
  sizep = 0;
  NSGetSizeAndAlignment((const char *)objc_msgSend(v17, "UTF8String"), &sizep, 0);
  v24 = objc_msgSend(v4, "copy");
  v25 = sizep;
  *(_QWORD *)(a1 + 112) = v24;
  *(_QWORD *)(a1 + 120) = v25;
  if (*(_BYTE *)(a1 + 32) == 94)
    objc_msgSend(v17, "insertString:atIndex:", CFSTR("^"), 0);
  return v17;
}

- (uint64_t)getCountOfRepeatedValuesFromInstance:(uint64_t)a1
{
  void *v2;
  char *v4;
  void *v5;
  int v6;
  double v8;
  double v9;

  v2 = *(void **)(a1 + 64);
  if (v2)
  {
    v4 = (char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "methodSignature"), "methodReturnType");
    v5 = 0;
    v6 = *v4;
    if (v6 <= 80)
    {
      if (v6 > 72)
      {
        if (v6 == 73)
        {
          LODWORD(v9) = 0;
          objc_msgSend(v2, "invokeWithTarget:", a2);
          objc_msgSend(v2, "getReturnValue:", &v9);
          v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(v9));
        }
        else if (v6 == 76)
        {
          v9 = 0.0;
          objc_msgSend(v2, "invokeWithTarget:", a2);
          objc_msgSend(v2, "getReturnValue:", &v9);
          v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)&v9);
        }
      }
      else if (v6 == 66)
      {
        LOBYTE(v9) = 0;
        objc_msgSend(v2, "invokeWithTarget:", a2);
        objc_msgSend(v2, "getReturnValue:", &v9);
        v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", LOBYTE(v9));
      }
      else if (v6 == 67)
      {
        LOBYTE(v9) = 0;
        objc_msgSend(v2, "invokeWithTarget:", a2);
        objc_msgSend(v2, "getReturnValue:", &v9);
        v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", LOBYTE(v9));
      }
    }
    else
    {
      switch(v6)
      {
        case 'c':
          LOBYTE(v9) = 0;
          objc_msgSend(v2, "invokeWithTarget:", a2);
          objc_msgSend(v2, "getReturnValue:", &v9);
          v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", SLOBYTE(v9));
          break;
        case 'd':
          v9 = 0.0;
          objc_msgSend(v2, "invokeWithTarget:", a2);
          objc_msgSend(v2, "getReturnValue:", &v9);
          v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
          break;
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          return objc_msgSend(v5, "unsignedIntegerValue");
        case 'f':
          LODWORD(v9) = 0;
          objc_msgSend(v2, "invokeWithTarget:", a2);
          objc_msgSend(v2, "getReturnValue:", &v9);
          LODWORD(v8) = LODWORD(v9);
          v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
          break;
        case 'i':
          LODWORD(v9) = 0;
          objc_msgSend(v2, "invokeWithTarget:", a2);
          objc_msgSend(v2, "getReturnValue:", &v9);
          v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(v9));
          break;
        case 'l':
          v9 = 0.0;
          objc_msgSend(v2, "invokeWithTarget:", a2);
          objc_msgSend(v2, "getReturnValue:", &v9);
          v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)&v9);
          break;
        case 'q':
          v9 = 0.0;
          objc_msgSend(v2, "invokeWithTarget:", a2);
          objc_msgSend(v2, "getReturnValue:", &v9);
          v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)&v9);
          break;
        case 's':
          LOWORD(v9) = 0;
          objc_msgSend(v2, "invokeWithTarget:", a2);
          objc_msgSend(v2, "getReturnValue:", &v9);
          v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", SLOWORD(v9));
          break;
        default:
          if (v6 == 81)
          {
            v9 = 0.0;
            objc_msgSend(v2, "invokeWithTarget:", a2);
            objc_msgSend(v2, "getReturnValue:", &v9);
            v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&v9);
          }
          else if (v6 == 83)
          {
            LOWORD(v9) = 0;
            objc_msgSend(v2, "invokeWithTarget:", a2);
            objc_msgSend(v2, "getReturnValue:", &v9);
            v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", LOWORD(v9));
          }
          break;
      }
    }
  }
  else
  {
    v5 = 0;
  }
  return objc_msgSend(v5, "unsignedIntegerValue");
}

- (void)setNumberValue:(uint64_t)a3 onInstance:
{
  int v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int16 v11;
  void *v12;
  int v13;
  uint64_t v14;
  int v15;
  _WORD *v16;
  uint64_t v17;
  void *v18;

  v18 = a2;
  if (a1)
  {
    v5 = *(unsigned __int8 *)(a1 + 32);
    if (v5 == 94)
      LOBYTE(v5) = *(_BYTE *)(a1 + 33);
    if ((char)v5 > 80)
    {
      switch((char)v5)
      {
        case 'c':
          LOBYTE(v17) = 0;
          v6 = *(void **)(a1 + 80);
          if (v6)
            goto LABEL_22;
          v7 = objc_msgSend(a2, "charValue", v17, v18);
          goto LABEL_40;
        case 'd':
          v17 = 0;
          v8 = *(void **)(a1 + 80);
          if (v8)
            goto LABEL_38;
          objc_msgSend(a2, "doubleValue", v17, v18);
          v17 = v14;
          goto LABEL_50;
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          return;
        case 'f':
          LODWORD(v17) = 0;
          v12 = *(void **)(a1 + 80);
          if (v12)
            goto LABEL_30;
          objc_msgSend(a2, "floatValue", v17, v18);
          LODWORD(v17) = v15;
          goto LABEL_44;
        case 'i':
          LODWORD(v17) = 0;
          v12 = *(void **)(a1 + 80);
          if (v12)
            goto LABEL_30;
          v13 = objc_msgSend(a2, "intValue");
          goto LABEL_43;
        case 'l':
          v17 = 0;
          v8 = *(void **)(a1 + 80);
          if (v8)
            goto LABEL_38;
          v9 = objc_msgSend(a2, "longValue");
          goto LABEL_49;
        case 'q':
          v17 = 0;
          v8 = *(void **)(a1 + 80);
          if (v8)
            goto LABEL_38;
          v9 = objc_msgSend(a2, "longLongValue");
          goto LABEL_49;
        case 's':
          LOWORD(v17) = 0;
          v10 = *(void **)(a1 + 80);
          if (v10)
            goto LABEL_36;
          v11 = objc_msgSend(a2, "shortValue");
          goto LABEL_46;
        default:
          if ((char)v5 != 81)
          {
            if ((char)v5 != 83)
              return;
            LOWORD(v17) = 0;
            v10 = *(void **)(a1 + 80);
            if (v10)
            {
LABEL_36:
              objc_msgSend(v10, "setArgument:atIndex:", &v18, 2, v17);
              objc_msgSend(*(id *)(a1 + 80), "invokeWithTarget:", a3);
              objc_msgSend(*(id *)(a1 + 80), "getReturnValue:", &v17);
            }
            else
            {
              v11 = objc_msgSend(a2, "unsignedShortValue");
LABEL_46:
              LOWORD(v17) = v11;
            }
            v16 = malloc_type_calloc(1uLL, 2uLL, 0x1000040BDFB0063uLL);
            *v16 = v17;
            goto LABEL_51;
          }
          v17 = 0;
          v8 = *(void **)(a1 + 80);
          if (v8)
            goto LABEL_38;
          v9 = objc_msgSend(a2, "unsignedLongLongValue");
          break;
      }
      goto LABEL_49;
    }
    if ((char)v5 > 72)
    {
      if ((char)v5 == 73)
      {
        LODWORD(v17) = 0;
        v12 = *(void **)(a1 + 80);
        if (v12)
        {
LABEL_30:
          objc_msgSend(v12, "setArgument:atIndex:", &v18, 2, v17);
          objc_msgSend(*(id *)(a1 + 80), "invokeWithTarget:", a3);
          objc_msgSend(*(id *)(a1 + 80), "getReturnValue:", &v17);
        }
        else
        {
          v13 = objc_msgSend(a2, "unsignedIntValue");
LABEL_43:
          LODWORD(v17) = v13;
        }
LABEL_44:
        v16 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
        *(_DWORD *)v16 = v17;
        goto LABEL_51;
      }
      if ((char)v5 != 76)
        return;
      v17 = 0;
      v8 = *(void **)(a1 + 80);
      if (v8)
      {
LABEL_38:
        objc_msgSend(v8, "setArgument:atIndex:", &v18, 2, v17);
        objc_msgSend(*(id *)(a1 + 80), "invokeWithTarget:", a3);
        objc_msgSend(*(id *)(a1 + 80), "getReturnValue:", &v17);
LABEL_50:
        v16 = malloc_type_calloc(1uLL, 8uLL, 0x100004000313F17uLL);
        *(_QWORD *)v16 = v17;
        goto LABEL_51;
      }
      v9 = objc_msgSend(a2, "unsignedLongValue");
LABEL_49:
      v17 = v9;
      goto LABEL_50;
    }
    if ((char)v5 == 66)
    {
      LOBYTE(v17) = 0;
      v6 = *(void **)(a1 + 80);
      if (!v6)
      {
        v7 = objc_msgSend(a2, "BOOLValue");
        goto LABEL_40;
      }
    }
    else
    {
      if ((char)v5 != 67)
        return;
      LOBYTE(v17) = 0;
      v6 = *(void **)(a1 + 80);
      if (!v6)
      {
        v7 = objc_msgSend(a2, "unsignedCharValue");
LABEL_40:
        LOBYTE(v17) = v7;
        goto LABEL_41;
      }
    }
LABEL_22:
    objc_msgSend(v6, "setArgument:atIndex:", &v18, 2, v17);
    objc_msgSend(*(id *)(a1 + 80), "invokeWithTarget:", a3);
    objc_msgSend(*(id *)(a1 + 80), "getReturnValue:", &v17);
LABEL_41:
    v16 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
    *(_BYTE *)v16 = v17;
LABEL_51:
    objc_msgSend(*(id *)(a1 + 40), "setArgument:atIndex:", v16, 2, v17);
    objc_msgSend(*(id *)(a1 + 40), "invokeWithTarget:", a3);
    free(v16);
  }
}

+ (id)getValidPropertiesForType:(void *)a3 withCache:
{
  NSString *v5;
  id v6;
  id v7;
  Protocol **v8;
  unint64_t i;
  objc_property_t *v10;
  unint64_t v11;
  objc_property_t *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  char **v16;
  objc_property *v17;
  id v18;
  objc_class *v19;
  id *v20;
  const char *Name;
  id v22;
  objc_property_attribute_t *v23;
  uint64_t v24;
  objc_property_attribute_t *v25;
  objc_property_attribute_t *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  char j;
  SEL v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  const char *value;
  objc_property_attribute_t *v47;
  void *v48;
  SEL v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  objc_property_attribute_t *v54;
  int v55;
  SEL v56;
  void *v57;
  uint64_t v58;
  const __CFString *v59;
  char v60;
  void *v61;
  SEL v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  SEL v69;
  void *v70;
  uint64_t v71;
  void *v72;
  SEL v73;
  void *v74;
  uint64_t v75;
  void *v76;
  SEL v77;
  void *v78;
  uint64_t v79;
  void *v80;
  id *v81;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t v104;
  void *v106;
  NSString *v107;
  void *v108;
  objc_property_t *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  const char *v113;
  objc_property_attribute_t *v114;
  id obj;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  unsigned int v124;
  unsigned int outCount;
  unsigned int v126;
  objc_super v127;
  _BYTE v128[128];
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = NSStringFromClass(a2);
  v6 = (id)objc_msgSend(a3, "objectForKeyedSubscript:", v5);
  if (v6)
    return v6;
  v107 = v5;
  v108 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  outCount = 0;
  v8 = class_copyProtocolList(a2, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      LODWORD(v127.receiver) = 0;
      v10 = protocol_copyPropertyList(v8[i], (unsigned int *)&v127);
      if (LODWORD(v127.receiver))
      {
        v11 = 0;
        do
          objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(v10[v11++])));
        while (v11 < LODWORD(v127.receiver));
      }
      free(v10);
    }
  }
  v106 = v7;
  free(v8);
  v124 = 0;
  v12 = class_copyPropertyList(a2, &v124);
  v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
  obj = (id)objc_msgSend(v13, "initWithCapacity:", v124);
  if (v124)
  {
    v14 = 0;
    v15 = 0x1EE809000uLL;
    v16 = &selRef_dealloc;
    v109 = v12;
    while (1)
    {
      v17 = v12[v14];
      objc_opt_self();
      v18 = objc_alloc((Class)(v15 + 1864));
      if (!v18)
        goto LABEL_13;
      v19 = (objc_class *)v16[9];
      v127.receiver = v18;
      v127.super_class = v19;
      v20 = (id *)objc_msgSendSuper2(&v127, sel_init);
      if (v20)
        break;
LABEL_112:
      v81 = v20;
      if (v81)
        objc_msgSend(obj, "addObject:", v81);
      if (++v14 >= (unint64_t)v124)
        goto LABEL_119;
    }
    Name = property_getName(v17);
    v22 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
    v20[1] = v22;
    if ((objc_msgSend(v22, "hasSuffix:", CFSTR("Count")) & 1) == 0)
    {
      v126 = 0;
      v23 = property_copyAttributeList(v17, &v126);
      if (v126)
      {
        v24 = 0;
        v25 = v23;
        while (*v25->name != 84)
        {
          ++v24;
          ++v25;
          if (v126 == v24)
            goto LABEL_18;
        }
      }
      else
      {
LABEL_18:
        v24 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v114 = v23;
      v26 = &v23[v24];
      v27 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v26->value);
      v28 = v27;
      v29 = 0;
      v30 = *v26->value;
      *((_BYTE *)v20 + 32) = *v26->value;
      if (v30 <= 63)
      {
        if ((v30 - 40) >= 3 && v30 != 63)
        {
LABEL_40:
          v111 = v28;
          v113 = Name;
          v112 = objc_msgSend(v20[1], "stringByReplacingCharactersInRange:withString:", 0, 1, objc_msgSend((id)objc_msgSend(v20[1], "substringToIndex:", 1), "uppercaseString"));
          if (objc_msgSend(v20[2], "isSubclassOfClass:", objc_opt_class()))
          {
            v38 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
            for (j = 1; ; j = 0)
            {
              v40 = sel_registerName((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v38, CFSTR("Type")), "UTF8String"));
              if ((objc_opt_respondsToSelector() & 1) != 0)
                break;
              if ((j & 1) == 0)
                goto LABEL_49;
              if (objc_msgSend(v38, "hasSuffix:", CFSTR("s")))
                v41 = objc_msgSend(v38, "substringToIndex:", objc_msgSend(v38, "length") - 1);
              else
                v41 = objc_msgSend(v38, "stringByAppendingString:", CFSTR("s"));
              v38 = (void *)v41;
            }
            v42 = -[objc_class methodSignatureForSelector:](a2, "methodSignatureForSelector:", v40);
            v43 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v42);
            objc_msgSend(v43, "setSelector:", v40);
            objc_msgSend(v43, "invokeWithTarget:", a2);
            objc_msgSend(v43, "getReturnValue:", v20 + 3);
            v44 = v20[3];
          }
LABEL_49:
          if (v126)
          {
            v45 = 0;
            value = v113;
            v47 = v114;
            while (*v47->name != 71)
            {
              ++v45;
              ++v47;
              if (v126 == v45)
              {
                v45 = 0x7FFFFFFFFFFFFFFFLL;
                goto LABEL_56;
              }
            }
            value = v114[v45].value;
          }
          else
          {
            v45 = 0x7FFFFFFFFFFFFFFFLL;
            value = v113;
          }
LABEL_56:
          v48 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", value);
          if (!v29)
            v29 = v111;
          v49 = sel_registerName((const char *)objc_msgSend(v48, "UTF8String"));
          if (-[objc_class instancesRespondToSelector:](a2, "instancesRespondToSelector:", v49))
          {
            if (objc_msgSend(v29, "length"))
            {
              v50 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@:"), v29);
              v51 = objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", objc_msgSend(v50, "UTF8String"));
            }
            else
            {
              v51 = -[objc_class instanceMethodSignatureForSelector:](a2, "instanceMethodSignatureForSelector:", v49);
            }
            v52 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v51);
            objc_msgSend(v52, "setSelector:", v49);
          }
          else
          {
            v52 = 0;
          }
          v20[6] = v52;
          v53 = v126;
          v54 = v114;
          if (v126)
          {
            while (*v54->name != 83)
            {
              ++v54;
              if (!--v53)
                goto LABEL_67;
            }
            v56 = sel_registerName((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v114[v45].value), "UTF8String"));
            if (-[objc_class instancesRespondToSelector:](a2, "instancesRespondToSelector:", v56))
            {
              if (objc_msgSend(v111, "length"))
              {
                v57 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("v@:%@"), v111);
                v58 = objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", objc_msgSend(v57, "UTF8String"));
              }
              else
              {
                v58 = -[objc_class instanceMethodSignatureForSelector:](a2, "instanceMethodSignatureForSelector:", v56);
              }
              v68 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v58);
              objc_msgSend(v68, "setSelector:", v56);
            }
            else
            {
              v68 = 0;
            }
            v20[5] = v68;
LABEL_92:
            v69 = sel_registerName((const char *)objc_msgSend((id)objc_msgSend(v20[1], "stringByAppendingString:", CFSTR("Count")), "UTF8String"));
            if (-[objc_class instancesRespondToSelector:](a2, "instancesRespondToSelector:", v69))
            {
              v12 = v109;
              v15 = 0x1EE809000;
              v16 = &selRef_dealloc;
              if (objc_msgSend(0, "length"))
              {
                v70 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@:"), 0);
                v71 = objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", objc_msgSend(v70, "UTF8String"));
              }
              else
              {
                v71 = -[objc_class instanceMethodSignatureForSelector:](a2, "instanceMethodSignatureForSelector:", v69);
              }
              v72 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v71);
              objc_msgSend(v72, "setSelector:", v69);
            }
            else
            {
              v72 = 0;
              v12 = v109;
              v15 = 0x1EE809000;
              v16 = &selRef_dealloc;
            }
            v20[8] = v72;
            v73 = sel_registerName((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%sAsString:"), v113), "UTF8String"));
            if (-[objc_class instancesRespondToSelector:](a2, "instancesRespondToSelector:", v73))
            {
              if (objc_msgSend(0, "length"))
              {
                v74 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@:"), 0);
                v75 = objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", objc_msgSend(v74, "UTF8String"));
              }
              else
              {
                v75 = -[objc_class instanceMethodSignatureForSelector:](a2, "instanceMethodSignatureForSelector:", v73);
              }
              v76 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v75);
              objc_msgSend(v76, "setSelector:", v73);
            }
            else
            {
              v76 = 0;
            }
            v20[9] = v76;
            v77 = sel_registerName((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("StringAs%@:"), v112), "UTF8String"));
            if (-[objc_class instancesRespondToSelector:](a2, "instancesRespondToSelector:", v77))
            {
              if (objc_msgSend(0, "length"))
              {
                v78 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@@:"), 0);
                v79 = objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", objc_msgSend(v78, "UTF8String"));
              }
              else
              {
                v79 = -[objc_class instanceMethodSignatureForSelector:](a2, "instanceMethodSignatureForSelector:", v77);
              }
              v80 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v79);
              objc_msgSend(v80, "setSelector:", v77);
            }
            else
            {
              v80 = 0;
            }
            v20[10] = v80;
LABEL_111:
            free(v114);
            goto LABEL_112;
          }
LABEL_67:
          v55 = *((unsigned __int8 *)v20 + 32);
          if (v55 == 64)
          {
            if ((objc_msgSend(v20[2], "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
              goto LABEL_75;
LABEL_74:
            v59 = CFSTR("add");
          }
          else
          {
            if (v55 == 94)
            {
              v29 = (void *)objc_msgSend(v29, "substringFromIndex:", 1);
              goto LABEL_74;
            }
LABEL_75:
            v59 = CFSTR("set");
          }
          v60 = 1;
          v61 = (void *)v112;
          while (1)
          {
            v62 = sel_registerName((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@:"), v59, v61), "UTF8String"));
            if (-[objc_class instancesRespondToSelector:](a2, "instancesRespondToSelector:", v62))
            {
              if (objc_msgSend(v29, "length"))
              {
                v63 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("v@:%@"), v29);
                v64 = objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", objc_msgSend(v63, "UTF8String"));
              }
              else
              {
                v64 = -[objc_class instanceMethodSignatureForSelector:](a2, "instanceMethodSignatureForSelector:", v62);
              }
              v65 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v64);
              objc_msgSend(v65, "setSelector:", v62);
            }
            else
            {
              v65 = 0;
            }
            v66 = v65;
            v20[5] = v66;
            if (v66 != 0 || (v60 & 1) == 0)
              break;
            if (objc_msgSend(v61, "hasSuffix:", CFSTR("s")))
              v67 = objc_msgSend(v61, "substringToIndex:", objc_msgSend(v61, "length") - 1);
            else
              v67 = objc_msgSend(v61, "stringByAppendingString:", CFSTR("s"));
            v61 = (void *)v67;
            v60 = 0;
          }
          goto LABEL_92;
        }
LABEL_33:
        NSLog(CFSTR("ignoring property %s: %@"), Name, v27);
LABEL_34:
        v20 = 0;
        v16 = &selRef_dealloc;
        goto LABEL_111;
      }
      if (v30 > 122)
      {
        if (v30 == 125)
          goto LABEL_33;
        if (v30 != 123)
          goto LABEL_40;
        v34 = (uint64_t)v20;
        v31 = v28;
        v35 = v28;
      }
      else
      {
        if (v30 == 64)
        {
          v110 = v27;
          v37 = (void *)objc_msgSend(v27, "substringFromIndex:", 1);
          if ((unint64_t)objc_msgSend(v37, "length") >= 3
            && objc_msgSend(v37, "characterAtIndex:", 0) == 34)
          {
            v37 = (void *)objc_msgSend(v37, "substringWithRange:", 1, objc_msgSend(v37, "length") - 2);
          }
          if ((objc_msgSend(v37, "hasPrefix:", CFSTR("<")) & 1) == 0)
          {
            v29 = 0;
            v20[2] = NSClassFromString((NSString *)v37);
            v28 = v110;
            goto LABEL_40;
          }
          goto LABEL_34;
        }
        if (v30 != 94)
          goto LABEL_40;
        v31 = v27;
        v32 = objc_msgSend(v27, "characterAtIndex:", 1);
        *((_BYTE *)v20 + 33) = v32;
        v33 = (v32 - 66);
        v16 = &selRef_dealloc;
        if (v33 > 0x39)
          goto LABEL_118;
        if (((1 << (v32 - 66)) & 0x849600008481) != 0)
        {
          v29 = 0;
          v28 = v31;
          goto LABEL_40;
        }
        if (v33 != 57)
        {
LABEL_118:
          NSLog(CFSTR("ignoring property %s: %@"), Name, v31);
          v20 = 0;
          goto LABEL_111;
        }
        v35 = (void *)objc_msgSend(v31, "substringFromIndex:", 1);
        v34 = (uint64_t)v20;
      }
      v36 = -[_PBProperty _parseStructDefinition:](v34, v35);
      v28 = v31;
      v29 = v36;
      goto LABEL_40;
    }
LABEL_13:
    v20 = 0;
    goto LABEL_112;
  }
LABEL_119:
  free(v12);
  objc_msgSend(obj, "sortUsingComparator:", &__block_literal_global_345);
  v82 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(obj, "count"));
  v83 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
  if (!v84)
    goto LABEL_140;
  v85 = v84;
  v86 = *(_QWORD *)v121;
  do
  {
    v87 = 0;
    do
    {
      if (*(_QWORD *)v121 != v86)
        objc_enumerationMutation(obj);
      v88 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * v87);
      if (v88)
        v89 = *(void **)(v88 + 8);
      else
        v89 = 0;
      v90 = (void *)objc_msgSend(v89, "lowercaseString");
      if (objc_msgSend(v90, "hasPrefix:", CFSTR("has")))
      {
        v91 = objc_msgSend(v90, "substringFromIndex:", 3);
        v92 = objc_msgSend(v82, "objectForKeyedSubscript:", v91);
        if (v92)
        {
          v93 = v92;
          *(_QWORD *)(v92 + 56) = *(id *)(v88 + 48);
          objc_msgSend(v83, "addObject:", v93);
          v94 = v82;
          v95 = (void *)v91;
LABEL_133:
          objc_msgSend(v94, "removeObjectForKey:", v95);
          goto LABEL_135;
        }
      }
      else
      {
        if (v88)
          v96 = *(void **)(v88 + 16);
        else
          v96 = 0;
        if (objc_msgSend(v96, "isSubclassOfClass:", objc_opt_class()))
        {
          objc_msgSend(v83, "addObject:", v88);
          v94 = v82;
          v95 = v90;
          goto LABEL_133;
        }
      }
      objc_msgSend(v82, "setObject:forKeyedSubscript:", v88, v90);
LABEL_135:
      ++v87;
    }
    while (v85 != v87);
    v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v129, 16);
    v85 = v97;
  }
  while (v97);
LABEL_140:
  objc_msgSend(v83, "addObjectsFromArray:", objc_msgSend(v82, "allValues"));
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v83, "count"));
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v98 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
  if (v98)
  {
    v99 = v98;
    v100 = *(_QWORD *)v117;
    do
    {
      v101 = 0;
      do
      {
        if (*(_QWORD *)v117 != v100)
          objc_enumerationMutation(v83);
        v102 = *(_QWORD **)(*((_QWORD *)&v116 + 1) + 8 * v101);
        if (v102)
          v103 = v102[1];
        else
          v103 = 0;
        if (!objc_msgSend(v106, "containsObject:", v103) || v102[7] || v102[8])
          objc_msgSend(v6, "addObject:", v102);
        ++v101;
      }
      while (v99 != v101);
      v104 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
      v99 = v104;
    }
    while (v104);
  }
  objc_msgSend(v108, "setObject:forKeyedSubscript:", v6, v107);
  return v6;
}

@end
