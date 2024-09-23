@implementation PLPhotoDCFObject

- (PLPhotoDCFObject)initWithName:(id)a3 number:(int)a4
{
  id v7;
  PLPhotoDCFObject *v8;
  PLPhotoDCFObject *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLPhotoDCFObject;
  v8 = -[PLPhotoDCFObject init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_number = a4;
  }

  return v9;
}

- (id)name
{
  return self->_name;
}

- (int)number
{
  return self->_number;
}

- (int64_t)compare:(id)a3
{
  int v4;
  int number;
  BOOL v6;
  int64_t v7;

  v4 = objc_msgSend(a3, "number");
  number = self->_number;
  v6 = v4 < number;
  v7 = v4 > number;
  if (v6)
    return -1;
  else
    return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p: %@ (%d)>"), objc_opt_class(), self, self->_name, self->_number);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)validDCFNameForName:(id)a3 requiredLength:(int)a4 nameLength:(int)a5 number:(int *)a6 numberRange:(_NSRange)a7 suffix:(id)a8
{
  NSUInteger length;
  int64_t location;
  id v12;
  id v13;
  uint64_t v14;
  __CFString *v15;
  const char *v16;
  int64_t v17;
  const char *CStringPtr;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  int64_t v24;
  unint64_t v25;
  UniChar *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  UniChar v30;
  unsigned int v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  UniChar *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSUInteger v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  UniChar v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int *v56;
  BOOL v57;
  void *v58;
  int v59;
  id v60;
  uint64_t v62;
  __CFString *v63;
  int *v64;
  uint64_t *v65;
  id v66;
  NSUInteger v67;
  UniChar buffer[8];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __CFString *v76;
  const UniChar *CharactersPtr;
  const char *v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  CFRange v83;
  CFRange v84;

  length = a7.length;
  location = a7.location;
  v82 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a8;
  v14 = objc_msgSend(v12, "length");
  v15 = (__CFString *)v12;
  MEMORY[0x1E0C80A78]();
  v16 = (char *)&v62 - ((length + 16) & 0xFFFFFFFFFFFFFFF0);
  if (v14 != a4)
  {
    v19 = 0;
    v20 = v15;
    goto LABEL_85;
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v69 = 0u;
  *(_OWORD *)buffer = 0u;
  v17 = location + length;
  v76 = v15;
  v79 = xmmword_199EB0330;
  CharactersPtr = CFStringGetCharactersPtr(v15);
  if (CharactersPtr)
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(v15, 0x600u);
  v67 = length;
  v64 = a6;
  v65 = &v62;
  v63 = v15;
  v66 = v13;
  v80 = 0;
  v81 = 0;
  v78 = CStringPtr;
  if (location >= v17)
  {
    v21 = 0;
    v32 = 1;
  }
  else
  {
    v21 = 0;
    v22 = 0;
    v23 = -location;
    v24 = location + 64;
    v25 = location;
    v26 = &buffer[location];
    do
    {
      v27 = location + v22;
      if (v25 >= 4)
        v28 = 4;
      else
        v28 = v25;
      if (v27 < 0 || (v29 = *((_QWORD *)&v79 + 1), *((uint64_t *)&v79 + 1) <= v27))
      {
        LOBYTE(v30) = 0;
      }
      else if (CharactersPtr)
      {
        v30 = CharactersPtr[location + v22 + (_QWORD)v79];
      }
      else if (v78)
      {
        LOBYTE(v30) = v78[(_QWORD)v79 + location + v22];
      }
      else
      {
        if (v81 <= v27 || v21 > v27)
        {
          v33 = v28 + v23;
          v34 = v24 - v28;
          v35 = -v28;
          v36 = v26;
          v37 = 64 - v28;
          v38 = v22 + location - v28;
          v39 = location + v22 + v37;
          if (v39 >= *((uint64_t *)&v79 + 1))
            v39 = *((_QWORD *)&v79 + 1);
          v80 = v38;
          v81 = v39;
          if (*((uint64_t *)&v79 + 1) >= v34)
            v29 = v34;
          v83.length = v29 + v33;
          v83.location = location + v22 + v35 + v79;
          CFStringGetCharacters(v76, v83, buffer);
          v26 = v36;
          v21 = v80;
        }
        v30 = v26[v22 - v21];
      }
      v16[v22] = v30;
      v31 = (char)v30 - 48;
      v32 = v31 < 0xA;
      if (v31 > 9)
        break;
      ++v25;
      ++v22;
      --v23;
      ++v24;
    }
    while (v22 + location < v17);
  }
  v40 = v67;
  if (location)
    v41 = 0;
  else
    v41 = v67;
  if (location)
    v42 = location;
  else
    v42 = 8;
  if (!v32 || v41 >= v42 || v41 >= v14)
  {
    v15 = v63;
    v20 = v63;
    goto LABEL_74;
  }
  v43 = 0;
  v44 = -v41;
  v45 = v41 + 64;
  do
  {
    if ((unint64_t)v41 >= 4)
      v46 = 4;
    else
      v46 = v41;
    if (v41 < 0 || (v47 = *((_QWORD *)&v79 + 1), *((uint64_t *)&v79 + 1) <= v41))
    {
      v48 = 0;
    }
    else
    {
      if (CharactersPtr)
      {
        v48 = CharactersPtr[v41 + (_QWORD)v79];
      }
      else if (v78)
      {
        v48 = v78[(_QWORD)v79 + v41];
      }
      else
      {
        if (v81 <= v41 || v21 > v41)
        {
          v50 = v46 + v44;
          v51 = v45 - v46;
          v52 = v41 - v46;
          v53 = v52 + 64;
          if (v52 + 64 >= *((uint64_t *)&v79 + 1))
            v53 = *((_QWORD *)&v79 + 1);
          v80 = v52;
          v81 = v53;
          if (*((uint64_t *)&v79 + 1) >= v51)
            v47 = v51;
          v84.length = v47 + v50;
          v84.location = v52 + v79;
          CFStringGetCharacters(v76, v84, buffer);
          v21 = v80;
        }
        v48 = buffer[v41 - v21];
      }
      if (v48 == 95 || (unsigned __int16)(v48 - 65) < 0x1Au || (unsigned __int16)(v48 - 48) < 0xAu)
      {
        v32 = 1;
        goto LABEL_50;
      }
    }
    v49 = (unsigned __int16)(v48 - 97);
    v32 = v49 < 0x1A;
    if (v49 >= 0x1A)
      break;
    v43 = 1;
LABEL_50:
    if (++v41 >= v42)
      break;
    --v44;
    ++v45;
  }
  while (v41 < v14);
  v15 = v63;
  v20 = v63;
  v40 = v67;
  if ((v32 & v43) == 1)
  {
    -[__CFString uppercaseString](v63, "uppercaseString");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v32 = 1;
  }
LABEL_74:
  v13 = v66;
  v56 = v64;
  if (v64 && v32)
  {
    v16[v40] = 0;
    *v56 = atoi(v16);
  }
  if (v13)
    v57 = v32;
  else
    v57 = 0;
  if (v57)
  {
    objc_msgSend(v20, "uppercaseString");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "hasSuffix:", v13);

    if (!v59)
      goto LABEL_82;
LABEL_84:
    v19 = v20;
  }
  else
  {
    if (v32)
      goto LABEL_84;
LABEL_82:
    v19 = 0;
  }
LABEL_85:
  v60 = v19;

  return v60;
}

@end
