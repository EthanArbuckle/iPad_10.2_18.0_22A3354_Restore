@implementation PRDictionary

- (PRDictionary)initWithURL:(id)a3 fallbackURL:(id)a4
{
  void *v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t i;
  unsigned int v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  NLParameterBundle *v24;
  NLParameterBundle *v25;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 8, 0);
  v8 = (_BYTE *)objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  if (v9 >= 0x404 && *v8 == 104 && v8[1] == 177 && v8[2] == 77 && v8[3] == 28)
  {
    v10 = v9;
    v30.receiver = self;
    v30.super_class = (Class)PRDictionary;
    self = -[PRDictionary init](&v30, sel_init);
    if (self)
    {
      v29 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v28 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v27 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      for (i = 128; i != 64; --i)
      {
        v12 = *(_DWORD *)&v8[4 * i];
        v13 = bswap32(v12);
        if (v12)
          v14 = v10 > v13;
        else
          v14 = 0;
        if (v14)
        {
          v15 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v8[v13], v10 - v13);
          v16 = objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v15, 0, 0, 0);
          if (v16)
          {
            v17 = v16;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v27, "setObject:forKey:", v17, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i - 65));
          }
          v10 = v13;
        }
      }
      v18 = 64;
      do
      {
        v19 = *(_DWORD *)&v8[4 * v18];
        v20 = bswap32(v19);
        if (v19)
          v21 = v10 > v20;
        else
          v21 = 0;
        if (v21)
        {
          v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
          objc_msgSend(v29, "setObject:forKey:", v22, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18 - 1));
          v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (v10 - v20) >> 2);
          objc_msgSend(v28, "setObject:forKey:", v23, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18 - 1));
          v10 = v20;
        }
        --v18;
      }
      while (v18);
      v24 = (NLParameterBundle *)objc_msgSend(v27, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 5));
      if (v24)
        v24 = (NLParameterBundle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE160]), "initWithDictionaryRepresentation:error:", v24, 0);
      v25 = (NLParameterBundle *)objc_msgSend(v27, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 6));
      if (v25)
        v25 = (NLParameterBundle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE160]), "initWithDictionaryRepresentation:error:", v25, 0);
      self->_url = (NSURL *)objc_msgSend(a3, "copy");
      self->_data = (NSData *)v7;
      self->_offsetsDictionary = (NSDictionary *)v29;
      self->_numEntriesDictionary = (NSDictionary *)v28;
      self->_dictionariesDictionary = (NSDictionary *)v27;
      self->_parameterBundle = v24;
      self->_transformerParameterBundle = v25;
      if (a4 && (objc_msgSend(a3, "isEqual:", a4) & 1) == 0)
        self->_fallbackDictionary = -[PRDictionary initWithURL:fallbackURL:]([PRDictionary alloc], "initWithURL:fallbackURL:", a4, 0);
    }
  }
  return self;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRDictionary;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@<%@>"), -[PRDictionary description](&v3, sel_description), self->_url);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRDictionary;
  -[PRDictionary dealloc](&v3, sel_dealloc);
}

- (BOOL)checkWordBuffer:(char *)a3 length:(unint64_t)a4 encoding:(unsigned int)a5 index:(unint64_t)a6 caseInsensitive:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v9;
  uint64_t v13;
  char *v14;
  char *v15;
  unsigned int v16;
  unsigned int v17;
  BOOL v18;
  PRDictionary *fallbackDictionary;
  int v20;
  _BYTE *v22;
  unint64_t v23;
  char *v24;
  char v25;
  int v26;
  char v27;
  _BYTE *v28;
  unint64_t v29;
  char *v30;
  char v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  BOOL v36;
  char v37;
  char v38;
  int v40;
  unsigned __int8 *v41;
  unsigned int v42;
  int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  int v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  int v54;
  unsigned int v55;
  unsigned int v56;
  int v57;
  unsigned int v58;
  unsigned int v59;
  int v60;
  unsigned int v61;
  unint64_t v62;
  unsigned int v63;
  int v64;
  unsigned int v65;
  _BOOL4 v66;
  const char *v67;
  char *v68;
  size_t v69;
  const char *v70;
  char *v71;
  size_t v72;
  _BYTE *v73;
  unint64_t v74;
  char *v75;
  int v76;
  int v77;
  unsigned int v78;
  _BYTE *v82;
  unint64_t v83;
  char *v84;
  int v85;
  int v86;
  unsigned int v87;
  _BYTE *v91;
  unint64_t v92;
  char *v93;
  int v94;
  int v95;
  unsigned int v96;
  BOOL v97;
  BOOL v98;
  char v99;
  _BYTE v100[72];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  if (a4 - 1 > 0x47)
    return 0;
  v7 = a7;
  v9 = *(_QWORD *)&a5;
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v14 = -[NSData bytes](self->_data, "bytes");
  v15 = &v14[objc_msgSend(-[NSDictionary objectForKey:](self->_offsetsDictionary, "objectForKey:", v13), "unsignedIntegerValue")];
  v16 = objc_msgSend(-[NSDictionary objectForKey:](self->_numEntriesDictionary, "objectForKey:", v13), "unsignedIntegerValue");
  v17 = v16;
  if (v15)
    v18 = v16 == 0;
  else
    v18 = 1;
  if (!v18)
  {
    if (!v7)
      goto LABEL_36;
    if ((int)v9 <= 1279)
    {
      if ((_DWORD)v9 == 514)
      {
        v91 = v100;
        v92 = a4;
        v93 = a3;
        do
        {
          v95 = *v93++;
          v94 = v95;
          v96 = v95 - 192;
          v97 = (v95 - 65) >= 0x1A && v96 >= 0x17;
          if (!v97
            || ((v94 - 161) <= 0x3D
              ? (v98 = ((1 << (v94 + 95)) & 0x3F80000000006F35) == 0)
              : (v98 = 1),
                !v98))
          {
            v99 = v94 + 95;
            if ((v94 + 95) < 0xFu && ((0x6F35u >> v99) & 1) != 0)
              LOBYTE(v94) = byte_1DE2EC5EB[v99];
            else
              LOBYTE(v94) = v94 + 32;
          }
          *v91++ = v94;
          --v92;
        }
        while (v92);
        goto LABEL_37;
      }
      if ((_DWORD)v9 == 517)
      {
        v28 = v100;
        v29 = a4;
        v30 = a3;
        do
        {
          v32 = *v30++;
          v31 = v32;
          v33 = v32 - 65;
          v34 = v32 - 176;
          v35 = v32 - 161;
          v36 = (v32 & 0xFE) != 0xAE && v35 >= 0xC;
          v37 = v31 + 80;
          if (v36)
            v37 = v31;
          v38 = v31 + 32;
          if (v33 >= 0x1A && v34 > 0x1F)
            v38 = v37;
          *v28++ = v38;
          --v29;
        }
        while (v29);
        goto LABEL_37;
      }
      goto LABEL_36;
    }
    if ((_DWORD)v9 != 1280)
    {
      if ((_DWORD)v9 != 1284)
      {
        if ((_DWORD)v9 == 134217984)
        {
          v22 = v100;
          v23 = a4;
          v24 = a3;
          do
          {
            v26 = *v24++;
            v25 = v26;
            v27 = v26 + 32;
            if ((v26 - 65) < 0x1A)
              v25 = v27;
            *v22++ = v25;
            --v23;
          }
          while (v23);
          goto LABEL_37;
        }
LABEL_36:
        memcpy(v100, a3, a4);
LABEL_37:
        if (a4 <= 0x47)
          memset(&v100[a4], a4, (71 - a4) + 1);
        v40 = -1640531527;
        v41 = v100;
        if (a4 < 0xC)
        {
          v44 = -1640531527;
          v43 = -1640531527;
          v42 = a4;
        }
        else
        {
          v42 = a4;
          v43 = -1640531527;
          v44 = -1640531527;
          do
          {
            v45 = *((_DWORD *)v41 + 1) + v44;
            v46 = *((_DWORD *)v41 + 2) + v43;
            v47 = (*(_DWORD *)v41 + v40 - (v45 + v46)) ^ (v46 >> 13);
            v48 = (v45 - v46 - v47) ^ (v47 << 8);
            v49 = (v46 - v47 - v48) ^ (v48 >> 13);
            v50 = (v47 - v48 - v49) ^ (v49 >> 12);
            v51 = (v48 - v49 - v50) ^ (v50 << 16);
            v52 = (v49 - v50 - v51) ^ (v51 >> 5);
            v40 = (v50 - v51 - v52) ^ (v52 >> 3);
            v44 = (v51 - v52 - v40) ^ (v40 << 10);
            v43 = (v52 - v40 - v44) ^ (v44 >> 15);
            v41 += 12;
            v42 -= 12;
          }
          while (v42 > 0xB);
        }
        v53 = v43 + a4;
        switch(v42)
        {
          case 1u:
            goto LABEL_55;
          case 2u:
            goto LABEL_54;
          case 3u:
            goto LABEL_53;
          case 4u:
            goto LABEL_52;
          case 5u:
            goto LABEL_51;
          case 6u:
            goto LABEL_50;
          case 7u:
            goto LABEL_49;
          case 8u:
            goto LABEL_48;
          case 9u:
            goto LABEL_47;
          case 0xAu:
            goto LABEL_46;
          case 0xBu:
            v53 += v41[10] << 24;
LABEL_46:
            v53 += v41[9] << 16;
LABEL_47:
            v53 += v41[8] << 8;
LABEL_48:
            v44 += v41[7] << 24;
LABEL_49:
            v44 += v41[6] << 16;
LABEL_50:
            v44 += v41[5] << 8;
LABEL_51:
            v44 += v41[4];
LABEL_52:
            v40 += v41[3] << 24;
LABEL_53:
            v40 += v41[2] << 16;
LABEL_54:
            v40 += v41[1] << 8;
LABEL_55:
            v40 += *v41;
            break;
          default:
            break;
        }
        v54 = (v40 - v44 - v53) ^ (v53 >> 13);
        v55 = (v44 - v53 - v54) ^ (v54 << 8);
        v56 = (v53 - v54 - v55) ^ (v55 >> 13);
        v57 = (v54 - v55 - v56) ^ (v56 >> 12);
        v58 = (v55 - v56 - v57) ^ (v57 << 16);
        v59 = (v56 - v57 - v58) ^ (v58 >> 5);
        v60 = (v57 - v58 - v59) ^ (v59 >> 3);
        v61 = (v59 - v60 - ((v58 - v59 - v60) ^ (v60 << 10))) ^ (((v58 - v59 - v60) ^ (v60 << 10)) >> 15);
        v62 = ((double)(v61 - 1) / 4294967300.0 * (double)v17);
        if (bswap32(*(_DWORD *)&v15[4 * v62]) <= v61)
        {
          do
          {
            v64 = v62 + 1;
            if (v62 >= v17 - 1)
              break;
            v65 = bswap32(*(_DWORD *)&v15[4 * v62++]);
          }
          while (v65 < v61);
          v63 = bswap32(*(_DWORD *)&v15[4 * (v64 - 1)]);
        }
        else
        {
          do
          {
            v63 = bswap32(*(_DWORD *)&v15[4 * v62]);
            v36 = (_DWORD)v62 != 0;
            LODWORD(v62) = v62 - 1;
          }
          while (v36 && v63 > v61);
        }
        v20 = v63 == v61;
        v66 = v63 != v61;
        if ((_DWORD)v9 == 1280 && a6 == 7 && a4 == 4 && v66)
        {
          v67 = "AT&T";
          v68 = a3;
          v69 = 4;
          goto LABEL_69;
        }
        if (a6 != 1)
          v66 = 0;
        if ((_DWORD)v9 != 1280 || !v66)
          return v20 != 0;
        switch(a4)
        {
          case 0xDuLL:
            v67 = "vulernabipity";
            v68 = a3;
            v69 = 13;
LABEL_69:
            if (!strncmp(v68, v67, v69))
              v20 = 1;
            return v20 != 0;
          case 0xCuLL:
            if (!strncmp(a3, "uandercommit", 0xCuLL))
            {
              v20 = 1;
              return v20 != 0;
            }
            v70 = "knswledgable";
            v71 = a3;
            v72 = 12;
            goto LABEL_150;
          case 0xAuLL:
            v70 = "deconfusep";
            v71 = a3;
            v72 = 10;
LABEL_150:
            v20 = strncmp(v71, v70, v72) == 0;
            return v20 != 0;
        }
        goto LABEL_79;
      }
      v82 = v100;
      v83 = a4;
      v84 = a3;
      while (1)
      {
        v86 = *v84++;
        v85 = v86;
        v87 = v86 - 192;
        if ((v86 - 65) >= 0x1A && v87 >= 0x17)
          break;
        if ((v85 - 138) <= 0x15 && ((1 << (v85 + 118)) & 0x200015) != 0)
          goto LABEL_122;
        if (v85 != 73)
          goto LABEL_117;
        LOBYTE(v85) = -3;
LABEL_125:
        *v82++ = v85;
        if (!--v83)
          goto LABEL_37;
      }
      if (v85 <= 215)
      {
        if ((v85 - 138) > 0x15 || ((1 << (v85 + 118)) & 0x200015) == 0)
          goto LABEL_125;
LABEL_122:
        if (v85 == 159)
          LOBYTE(v85) = -1;
        else
          LOBYTE(v85) = v85 + 16;
        goto LABEL_125;
      }
      if ((v85 - 216) >= 5)
      {
        if (v85 == 221)
        {
          LOBYTE(v85) = 105;
          goto LABEL_125;
        }
        if (v85 != 222)
          goto LABEL_125;
      }
LABEL_117:
      LOBYTE(v85) = v85 + 32;
      goto LABEL_125;
    }
    v73 = v100;
    v74 = a4;
    v75 = a3;
    while (1)
    {
      v77 = *v75++;
      v76 = v77;
      v78 = v77 - 192;
      if ((v77 - 65) >= 0x1A && v78 >= 0x17)
      {
        if ((v76 - 216) >= 7)
        {
          if ((v76 - 138) > 0x15 || ((1 << (v76 + 118)) & 0x200015) == 0)
            goto LABEL_101;
LABEL_98:
          if (v76 == 159)
            LOBYTE(v76) = -1;
          else
            LOBYTE(v76) = v76 + 16;
          goto LABEL_101;
        }
      }
      else if ((v76 - 138) <= 0x15 && ((1 << (v76 + 118)) & 0x200015) != 0)
      {
        goto LABEL_98;
      }
      LOBYTE(v76) = v76 + 32;
LABEL_101:
      *v73++ = v76;
      if (!--v74)
        goto LABEL_37;
    }
  }
  fallbackDictionary = self->_fallbackDictionary;
  if (!fallbackDictionary)
  {
LABEL_79:
    v20 = 0;
    return v20 != 0;
  }
  v20 = -[PRDictionary checkWordBuffer:length:encoding:index:caseInsensitive:](fallbackDictionary, "checkWordBuffer:length:encoding:index:caseInsensitive:", a3, a4, v9, a6, v7);
  return v20 != 0;
}

- (id)dictionaryAtIndex:(unint64_t)a3
{
  id result;

  result = -[NSDictionary objectForKey:](self->_dictionariesDictionary, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:"));
  if (!result)
    return -[PRDictionary dictionaryAtIndex:](self->_fallbackDictionary, "dictionaryAtIndex:", a3);
  return result;
}

- (id)fallbackDictionary
{
  return self->_fallbackDictionary;
}

- (id)parameterBundle
{
  if (self->_parameterBundle)
    return self->_parameterBundle;
  else
    return -[PRDictionary parameterBundle](self->_fallbackDictionary, "parameterBundle");
}

- (id)transformerParameterBundle
{
  if (self->_transformerParameterBundle)
    return self->_transformerParameterBundle;
  else
    return -[PRDictionary transformerParameterBundle](self->_fallbackDictionary, "transformerParameterBundle");
}

@end
