unint64_t __udivti3(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  return __udivmodti4(a1, a2, a3, a4, 0);
}

unint64_t __udivmodti4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t *a5)
{
  unint64_t v5;
  unint64_t v6;
  int v7;
  int v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int128 v16;
  char v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;

  v5 = a2;
  if (__PAIR128__(a2, a1) >= __PAIR128__(a4, a3))
  {
    if (a4)
    {
      v7 = __clz(a4);
      v8 = __clz(a2);
      v6 = 0;
      v9 = v7 - v8;
      if (v7 - v8 >= 0)
      {
        v10 = a3 << v9;
        v11 = (v9 & 0x40) == 0;
        if ((((_BYTE)v7 - (_BYTE)v8) & 0x40) != 0)
          v12 = a3 << v9;
        else
          v12 = (a4 << v9) | (a3 >> 1 >> ~v9);
        if (v11)
          v13 = v10;
        else
          v13 = 0;
        v14 = ~v7 + v8;
        do
        {
          v15 = ~v5 + __CFADD__(v13, ~a1) + v12;
          *((_QWORD *)&v16 + 1) = v6;
          *(_QWORD *)&v16 = v15;
          v6 = v16 >> 63;
          v5 = (__PAIR128__(v5, a1) - __PAIR128__(v12 & (v15 >> 63), v13 & (unint64_t)(v15 >> 63))) >> 64;
          a1 -= v13 & (v15 >> 63);
          *((_QWORD *)&v16 + 1) = v12;
          *(_QWORD *)&v16 = v13;
          v13 = v16 >> 1;
          v12 >>= 1;
        }
        while (!__CFADD__(v14++, 1));
      }
      if (a5)
      {
        *a5 = a1;
        a5[1] = v5;
      }
    }
    else
    {
      if (a2 >= a3)
      {
        v19 = __clz(a3);
        v20 = a3 << v19;
        v31 = ((a2 % a3) << v19) | (a1 >> 1 >> ~v19);
        v32 = a3 << v19 >> 32;
        v33 = (a3 << v19);
        v34 = a1 << v19 >> 32;
        v25 = (a1 << v19);
        v26 = v31 / v32;
        v35 = v31 % v32;
        do
        {
          if (!HIDWORD(v26) && v26 * v33 <= (v34 | (v35 << 32)))
            break;
          --v26;
          v35 += v32;
        }
        while (!HIDWORD(v35));
        v28 = (v34 | (v31 << 32)) - v26 * v20;
        v29 = v28 / v32;
        v36 = v28 % v32;
        do
        {
          if (!HIDWORD(v29) && v29 * v33 <= (v25 | (v36 << 32)))
            break;
          --v29;
          v36 += v32;
        }
        while (!HIDWORD(v36));
      }
      else
      {
        v19 = __clz(a3);
        v20 = a3 << v19;
        v21 = (a2 << v19) | (a1 >> 1 >> ~v19);
        v22 = a3 << v19 >> 32;
        v23 = (a3 << v19);
        v24 = a1 << v19 >> 32;
        v25 = (a1 << v19);
        v26 = v21 / v22;
        v27 = v21 % v22;
        do
        {
          if (!HIDWORD(v26) && v26 * v23 <= (v24 | (v27 << 32)))
            break;
          --v26;
          v27 += v22;
        }
        while (!HIDWORD(v27));
        v28 = (v24 | (v21 << 32)) - v26 * v20;
        v29 = v28 / v22;
        v30 = v28 % v22;
        do
        {
          if (!HIDWORD(v29) && v29 * v23 <= (v25 | (v30 << 32)))
            break;
          --v29;
          v30 += v22;
        }
        while (!HIDWORD(v30));
      }
      v37 = ((v25 | (v28 << 32)) - v29 * v20) >> v19;
      v6 = v29 + (v26 << 32);
      if (a5)
      {
        *a5 = v37;
        a5[1] = 0;
      }
    }
  }
  else
  {
    v6 = 0;
    if (a5)
    {
      *a5 = a1;
      a5[1] = a2;
    }
  }
  return v6;
}

double __powidf2(int a1, double a2)
{
  double v2;
  int v3;
  int v4;
  double v5;
  double result;

  if ((a1 & 1) != 0)
    v2 = a2;
  else
    v2 = 1.0;
  if ((a1 + 1) >= 3)
  {
    v3 = a1;
    do
    {
      if (v3 >= 0)
        v4 = v3;
      else
        v4 = v3 + 1;
      v3 = v4 >> 1;
      a2 = a2 * a2;
      if (((v4 >> 1) & 1) != 0)
        v5 = a2;
      else
        v5 = 1.0;
      v2 = v2 * v5;
    }
    while ((v3 + 1) > 2);
  }
  result = 1.0 / v2;
  if (a1 >= 0)
    return v2;
  return result;
}

uint64_t __clzti2(uint64_t a1, uint64_t a2)
{
  if (a2)
    a1 = 0;
  return __clz(a1 | a2) + ((a2 == 0) << 6);
}

uint64_t __atomic_load(uint64_t result, unsigned __int8 *a2, unsigned __int8 *a3, int a4)
{
  int v6;
  unsigned __int8 v7;
  unsigned __int16 v8;
  unsigned int v9;
  unint64_t v10;

  v6 = result;
  switch((int)result)
  {
    case 1:
      if ((a4 - 1) < 2 || a4 == 5)
        v7 = atomic_load(a2);
      else
        v7 = *a2;
      *a3 = v7;
      break;
    case 2:
      if ((a2 & 1) != 0)
        goto LABEL_14;
      if ((a4 - 1) < 2 || a4 == 5)
        v8 = atomic_load((unsigned __int16 *)a2);
      else
        v8 = *(_WORD *)a2;
      *(_WORD *)a3 = v8;
      break;
    case 4:
      if ((a2 & 3) != 0)
        goto LABEL_14;
      if ((a4 - 1) < 2 || a4 == 5)
        v9 = atomic_load((unsigned int *)a2);
      else
        v9 = *(_DWORD *)a2;
      *(_DWORD *)a3 = v9;
      break;
    case 8:
      if ((a2 & 7) != 0)
        goto LABEL_14;
      if ((a4 - 1) < 2 || a4 == 5)
        v10 = atomic_load((unint64_t *)a2);
      else
        v10 = *(_QWORD *)a2;
      *(_QWORD *)a3 = v10;
      break;
    default:
LABEL_14:
      _os_nospin_lock_lock();
      memcpy(a3, a2, v6);
      result = _os_nospin_lock_unlock();
      break;
  }
  return result;
}

unint64_t __divti3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v4 = a1 ^ (a2 >> 63);
  v5 = a4 >> 63;
  v6 = v4 + ((unint64_t)a2 >> 63);
  if (__CFADD__(v4, (unint64_t)a2 >> 63))
    v7 = (a2 ^ (a2 >> 63)) + 1;
  else
    v7 = a2 ^ (a2 >> 63);
  v8 = a3 ^ (a4 >> 63);
  v9 = v8 + ((unint64_t)a4 >> 63);
  if (__CFADD__(v8, (unint64_t)a4 >> 63))
    v10 = (a4 ^ (a4 >> 63)) + 1;
  else
    v10 = a4 ^ (a4 >> 63);
  return (__udivmodti4(v6, v7, v9, v10, 0) ^ v5 ^ (a2 >> 63)) - (v5 ^ (a2 >> 63));
}

uint64_t __atomic_is_lock_free(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = a1 - 1;
  result = 1;
  switch(v2)
  {
    case 0:
      return result;
    case 1:
      if ((a2 & 1) != 0)
        goto LABEL_7;
      break;
    case 3:
      if ((a2 & 3) != 0)
        goto LABEL_7;
      break;
    case 7:
      if ((a2 & 7) != 0)
        goto LABEL_7;
      break;
    default:
LABEL_7:
      result = 0;
      break;
  }
  return result;
}

uint64_t __atomic_store(uint64_t result, unsigned __int8 *a2, unsigned __int8 *a3, int a4)
{
  int v6;
  unsigned __int8 v7;
  unsigned __int16 v8;
  unsigned int v9;
  unint64_t v10;

  v6 = result;
  switch((int)result)
  {
    case 1:
      v7 = *a3;
      if (a4 == 3 || a4 == 5)
        atomic_store(v7, a2);
      else
        *a2 = v7;
      break;
    case 2:
      if ((a2 & 1) != 0)
        goto LABEL_14;
      v8 = *(_WORD *)a3;
      if (a4 == 3 || a4 == 5)
        atomic_store(v8, (unsigned __int16 *)a2);
      else
        *(_WORD *)a2 = v8;
      break;
    case 4:
      if ((a2 & 3) != 0)
        goto LABEL_14;
      v9 = *(_DWORD *)a3;
      if (a4 == 3 || a4 == 5)
        atomic_store(v9, (unsigned int *)a2);
      else
        *(_DWORD *)a2 = v9;
      break;
    case 8:
      if ((a2 & 7) != 0)
        goto LABEL_14;
      v10 = *(_QWORD *)a3;
      if (a4 == 3 || a4 == 5)
        atomic_store(v10, (unint64_t *)a2);
      else
        *(_QWORD *)a2 = v10;
      break;
    default:
LABEL_14:
      _os_nospin_lock_lock();
      memcpy(a2, a3, v6);
      result = _os_nospin_lock_unlock();
      break;
  }
  return result;
}

uint64_t __atomic_compare_exchange(int a1, unsigned __int8 *a2, _BYTE *a3, unsigned __int8 *a4, int a5, int a6)
{
  unsigned __int8 v10;
  int v11;
  int v12;
  unsigned __int16 v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  uint64_t result;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  switch(a1)
  {
    case 1:
      v10 = *a4;
      switch(a5)
      {
        case 1:
        case 2:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v27 = *a3;
              do
              {
                v12 = __ldaxr(a2);
                if (v12 != v27)
                  goto LABEL_196;
              }
              while (__stlxr(v10, a2));
            }
            else
            {
              v37 = *a3;
              do
              {
                v12 = __ldaxr(a2);
                if (v12 != v37)
                  goto LABEL_196;
              }
              while (__stxr(v10, a2));
            }
          }
          else
          {
            v11 = *a3;
            do
            {
              v12 = __ldaxr(a2);
              if (v12 != v11)
                goto LABEL_196;
            }
            while (__stxr(v10, a2));
          }
          goto LABEL_296;
        case 3:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v34 = *a3;
              do
              {
                v12 = __ldaxr(a2);
                if (v12 != v34)
                  goto LABEL_196;
              }
              while (__stlxr(v10, a2));
            }
            else
            {
              v54 = *a3;
              do
              {
                v12 = __ldxr(a2);
                if (v12 != v54)
                  goto LABEL_196;
              }
              while (__stlxr(v10, a2));
            }
          }
          else
          {
            v24 = *a3;
            do
            {
              v12 = __ldaxr(a2);
              if (v12 != v24)
                goto LABEL_196;
            }
            while (__stlxr(v10, a2));
          }
          goto LABEL_296;
        case 4:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v35 = *a3;
              do
              {
                v12 = __ldaxr(a2);
                if (v12 != v35)
                  goto LABEL_196;
              }
              while (__stlxr(v10, a2));
            }
            else
            {
              v55 = *a3;
              do
              {
                v12 = __ldaxr(a2);
                if (v12 != v55)
                  goto LABEL_196;
              }
              while (__stlxr(v10, a2));
            }
          }
          else
          {
            v25 = *a3;
            do
            {
              v12 = __ldaxr(a2);
              if (v12 != v25)
                goto LABEL_196;
            }
            while (__stlxr(v10, a2));
          }
          goto LABEL_296;
        case 5:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v36 = *a3;
              do
              {
                v12 = __ldaxr(a2);
                if (v12 != v36)
                  goto LABEL_196;
              }
              while (__stlxr(v10, a2));
            }
            else
            {
              v56 = *a3;
              do
              {
                v12 = __ldaxr(a2);
                if (v12 != v56)
                  goto LABEL_196;
              }
              while (__stlxr(v10, a2));
            }
          }
          else
          {
            v26 = *a3;
            do
            {
              v12 = __ldaxr(a2);
              if (v12 != v26)
                goto LABEL_196;
            }
            while (__stlxr(v10, a2));
          }
          goto LABEL_296;
        default:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v33 = *a3;
              while (1)
              {
                v12 = __ldaxr(a2);
                if (v12 != v33)
                  break;
                if (!__stlxr(v10, a2))
                  goto LABEL_296;
              }
            }
            else
            {
              v53 = *a3;
              while (1)
              {
                v12 = __ldxr(a2);
                if (v12 != v53)
                  break;
                if (!__stxr(v10, a2))
                  goto LABEL_296;
              }
            }
          }
          else
          {
            v23 = *a3;
            while (1)
            {
              v12 = __ldaxr(a2);
              if (v12 != v23)
                break;
              if (!__stxr(v10, a2))
                goto LABEL_296;
            }
          }
LABEL_196:
          __clrex();
          result = 0;
          *a3 = v12;
          break;
      }
      break;
    case 2:
      if ((a2 & 1) != 0)
        goto LABEL_23;
      v13 = *(_WORD *)a4;
      switch(a5)
      {
        case 1:
        case 2:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v32 = *(unsigned __int16 *)a3;
              do
              {
                v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v32)
                  goto LABEL_261;
              }
              while (__stlxr(v13, (unsigned __int16 *)a2));
            }
            else
            {
              v52 = *(unsigned __int16 *)a3;
              do
              {
                v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v52)
                  goto LABEL_261;
              }
              while (__stxr(v13, (unsigned __int16 *)a2));
            }
          }
          else
          {
            v14 = *(unsigned __int16 *)a3;
            do
            {
              v15 = __ldaxr((unsigned __int16 *)a2);
              if (v15 != v14)
                goto LABEL_261;
            }
            while (__stxr(v13, (unsigned __int16 *)a2));
          }
          goto LABEL_296;
        case 3:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v49 = *(unsigned __int16 *)a3;
              do
              {
                v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v49)
                  goto LABEL_261;
              }
              while (__stlxr(v13, (unsigned __int16 *)a2));
            }
            else
            {
              v68 = *(unsigned __int16 *)a3;
              do
              {
                v15 = __ldxr((unsigned __int16 *)a2);
                if (v15 != v68)
                  goto LABEL_261;
              }
              while (__stlxr(v13, (unsigned __int16 *)a2));
            }
          }
          else
          {
            v29 = *(unsigned __int16 *)a3;
            do
            {
              v15 = __ldaxr((unsigned __int16 *)a2);
              if (v15 != v29)
                goto LABEL_261;
            }
            while (__stlxr(v13, (unsigned __int16 *)a2));
          }
          goto LABEL_296;
        case 4:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v50 = *(unsigned __int16 *)a3;
              do
              {
                v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v50)
                  goto LABEL_261;
              }
              while (__stlxr(v13, (unsigned __int16 *)a2));
            }
            else
            {
              v69 = *(unsigned __int16 *)a3;
              do
              {
                v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v69)
                  goto LABEL_261;
              }
              while (__stlxr(v13, (unsigned __int16 *)a2));
            }
          }
          else
          {
            v30 = *(unsigned __int16 *)a3;
            do
            {
              v15 = __ldaxr((unsigned __int16 *)a2);
              if (v15 != v30)
                goto LABEL_261;
            }
            while (__stlxr(v13, (unsigned __int16 *)a2));
          }
          goto LABEL_296;
        case 5:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v51 = *(unsigned __int16 *)a3;
              do
              {
                v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v51)
                  goto LABEL_261;
              }
              while (__stlxr(v13, (unsigned __int16 *)a2));
            }
            else
            {
              v70 = *(unsigned __int16 *)a3;
              do
              {
                v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v70)
                  goto LABEL_261;
              }
              while (__stlxr(v13, (unsigned __int16 *)a2));
            }
          }
          else
          {
            v31 = *(unsigned __int16 *)a3;
            do
            {
              v15 = __ldaxr((unsigned __int16 *)a2);
              if (v15 != v31)
                goto LABEL_261;
            }
            while (__stlxr(v13, (unsigned __int16 *)a2));
          }
          goto LABEL_296;
        default:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v48 = *(unsigned __int16 *)a3;
              while (1)
              {
                v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v48)
                  break;
                if (!__stlxr(v13, (unsigned __int16 *)a2))
                  goto LABEL_296;
              }
            }
            else
            {
              v67 = *(unsigned __int16 *)a3;
              while (1)
              {
                v15 = __ldxr((unsigned __int16 *)a2);
                if (v15 != v67)
                  break;
                if (!__stxr(v13, (unsigned __int16 *)a2))
                  goto LABEL_296;
              }
            }
          }
          else
          {
            v28 = *(unsigned __int16 *)a3;
            while (1)
            {
              v15 = __ldaxr((unsigned __int16 *)a2);
              if (v15 != v28)
                break;
              if (!__stxr(v13, (unsigned __int16 *)a2))
                goto LABEL_296;
            }
          }
LABEL_261:
          __clrex();
          result = 0;
          *(_WORD *)a3 = v15;
          break;
      }
      break;
    case 4:
      if ((a2 & 3) != 0)
        goto LABEL_23;
      v16 = *(_DWORD *)a4;
      switch(a5)
      {
        case 1:
        case 2:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v42 = *(_DWORD *)a3;
              do
              {
                v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v42)
                  goto LABEL_278;
              }
              while (__stlxr(v16, (unsigned int *)a2));
            }
            else
            {
              v61 = *(_DWORD *)a3;
              do
              {
                v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v61)
                  goto LABEL_278;
              }
              while (__stxr(v16, (unsigned int *)a2));
            }
          }
          else
          {
            v17 = *(_DWORD *)a3;
            do
            {
              v18 = __ldaxr((unsigned int *)a2);
              if (v18 != v17)
                goto LABEL_278;
            }
            while (__stxr(v16, (unsigned int *)a2));
          }
          goto LABEL_296;
        case 3:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v58 = *(_DWORD *)a3;
              do
              {
                v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v58)
                  goto LABEL_278;
              }
              while (__stlxr(v16, (unsigned int *)a2));
            }
            else
            {
              v72 = *(_DWORD *)a3;
              do
              {
                v18 = __ldxr((unsigned int *)a2);
                if (v18 != v72)
                  goto LABEL_278;
              }
              while (__stlxr(v16, (unsigned int *)a2));
            }
          }
          else
          {
            v39 = *(_DWORD *)a3;
            do
            {
              v18 = __ldaxr((unsigned int *)a2);
              if (v18 != v39)
                goto LABEL_278;
            }
            while (__stlxr(v16, (unsigned int *)a2));
          }
          goto LABEL_296;
        case 4:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v59 = *(_DWORD *)a3;
              do
              {
                v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v59)
                  goto LABEL_278;
              }
              while (__stlxr(v16, (unsigned int *)a2));
            }
            else
            {
              v73 = *(_DWORD *)a3;
              do
              {
                v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v73)
                  goto LABEL_278;
              }
              while (__stlxr(v16, (unsigned int *)a2));
            }
          }
          else
          {
            v40 = *(_DWORD *)a3;
            do
            {
              v18 = __ldaxr((unsigned int *)a2);
              if (v18 != v40)
                goto LABEL_278;
            }
            while (__stlxr(v16, (unsigned int *)a2));
          }
          goto LABEL_296;
        case 5:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v60 = *(_DWORD *)a3;
              do
              {
                v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v60)
                  goto LABEL_278;
              }
              while (__stlxr(v16, (unsigned int *)a2));
            }
            else
            {
              v74 = *(_DWORD *)a3;
              do
              {
                v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v74)
                  goto LABEL_278;
              }
              while (__stlxr(v16, (unsigned int *)a2));
            }
          }
          else
          {
            v41 = *(_DWORD *)a3;
            do
            {
              v18 = __ldaxr((unsigned int *)a2);
              if (v18 != v41)
                goto LABEL_278;
            }
            while (__stlxr(v16, (unsigned int *)a2));
          }
          goto LABEL_296;
        default:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v57 = *(_DWORD *)a3;
              while (1)
              {
                v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v57)
                  break;
                if (!__stlxr(v16, (unsigned int *)a2))
                  goto LABEL_296;
              }
            }
            else
            {
              v71 = *(_DWORD *)a3;
              while (1)
              {
                v18 = __ldxr((unsigned int *)a2);
                if (v18 != v71)
                  break;
                if (!__stxr(v16, (unsigned int *)a2))
                  goto LABEL_296;
              }
            }
          }
          else
          {
            v38 = *(_DWORD *)a3;
            while (1)
            {
              v18 = __ldaxr((unsigned int *)a2);
              if (v18 != v38)
                break;
              if (!__stxr(v16, (unsigned int *)a2))
                goto LABEL_296;
            }
          }
LABEL_278:
          __clrex();
          result = 0;
          *(_DWORD *)a3 = v18;
          break;
      }
      break;
    case 8:
      if ((a2 & 7) != 0)
        goto LABEL_23;
      v20 = *(_QWORD *)a4;
      switch(a5)
      {
        case 1:
        case 2:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v47 = *(_QWORD *)a3;
              do
              {
                v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v47)
                  goto LABEL_295;
              }
              while (__stlxr(v20, (unint64_t *)a2));
            }
            else
            {
              v66 = *(_QWORD *)a3;
              do
              {
                v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v66)
                  goto LABEL_295;
              }
              while (__stxr(v20, (unint64_t *)a2));
            }
          }
          else
          {
            v21 = *(_QWORD *)a3;
            do
            {
              v22 = __ldaxr((unint64_t *)a2);
              if (v22 != v21)
                goto LABEL_295;
            }
            while (__stxr(v20, (unint64_t *)a2));
          }
          goto LABEL_296;
        case 3:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v63 = *(_QWORD *)a3;
              do
              {
                v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v63)
                  goto LABEL_295;
              }
              while (__stlxr(v20, (unint64_t *)a2));
            }
            else
            {
              v76 = *(_QWORD *)a3;
              do
              {
                v22 = __ldxr((unint64_t *)a2);
                if (v22 != v76)
                  goto LABEL_295;
              }
              while (__stlxr(v20, (unint64_t *)a2));
            }
          }
          else
          {
            v44 = *(_QWORD *)a3;
            do
            {
              v22 = __ldaxr((unint64_t *)a2);
              if (v22 != v44)
                goto LABEL_295;
            }
            while (__stlxr(v20, (unint64_t *)a2));
          }
          goto LABEL_296;
        case 4:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v64 = *(_QWORD *)a3;
              do
              {
                v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v64)
                  goto LABEL_295;
              }
              while (__stlxr(v20, (unint64_t *)a2));
            }
            else
            {
              v77 = *(_QWORD *)a3;
              do
              {
                v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v77)
                  goto LABEL_295;
              }
              while (__stlxr(v20, (unint64_t *)a2));
            }
          }
          else
          {
            v45 = *(_QWORD *)a3;
            do
            {
              v22 = __ldaxr((unint64_t *)a2);
              if (v22 != v45)
                goto LABEL_295;
            }
            while (__stlxr(v20, (unint64_t *)a2));
          }
          goto LABEL_296;
        case 5:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v65 = *(_QWORD *)a3;
              do
              {
                v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v65)
                  goto LABEL_295;
              }
              while (__stlxr(v20, (unint64_t *)a2));
            }
            else
            {
              v78 = *(_QWORD *)a3;
              do
              {
                v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v78)
                  goto LABEL_295;
              }
              while (__stlxr(v20, (unint64_t *)a2));
            }
          }
          else
          {
            v46 = *(_QWORD *)a3;
            do
            {
              v22 = __ldaxr((unint64_t *)a2);
              if (v22 != v46)
                goto LABEL_295;
            }
            while (__stlxr(v20, (unint64_t *)a2));
          }
          goto LABEL_296;
        default:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              v62 = *(_QWORD *)a3;
              while (1)
              {
                v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v62)
                  break;
                if (!__stlxr(v20, (unint64_t *)a2))
                  goto LABEL_296;
              }
            }
            else
            {
              v75 = *(_QWORD *)a3;
              while (1)
              {
                v22 = __ldxr((unint64_t *)a2);
                if (v22 != v75)
                  break;
                if (!__stxr(v20, (unint64_t *)a2))
                  goto LABEL_296;
              }
            }
          }
          else
          {
            v43 = *(_QWORD *)a3;
            while (1)
            {
              v22 = __ldaxr((unint64_t *)a2);
              if (v22 != v43)
                break;
              if (!__stxr(v20, (unint64_t *)a2))
                goto LABEL_296;
            }
          }
LABEL_295:
          __clrex();
          result = 0;
          *(_QWORD *)a3 = v22;
          break;
      }
      break;
    default:
LABEL_23:
      _os_nospin_lock_lock();
      if (!memcmp(a2, a3, a1))
      {
        memcpy(a2, a4, a1);
        _os_nospin_lock_unlock();
LABEL_296:
        result = 1;
      }
      else
      {
        memcpy(a3, a2, a1);
        _os_nospin_lock_unlock();
        result = 0;
      }
      break;
  }
  return result;
}

uint64_t __atomic_exchange(uint64_t result, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, int a5)
{
  int v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;

  v8 = result;
  switch((int)result)
  {
    case 1:
      v9 = *a3;
      switch(a5)
      {
        case 1:
        case 2:
          do
            v10 = __ldaxr(a2);
          while (__stxr(v9, a2));
          break;
        case 3:
          do
            v10 = __ldxr(a2);
          while (__stlxr(v9, a2));
          break;
        case 4:
          do
            v10 = __ldaxr(a2);
          while (__stlxr(v9, a2));
          break;
        case 5:
          do
            v10 = __ldaxr(a2);
          while (__stlxr(v9, a2));
          break;
        default:
          do
            v10 = __ldxr(a2);
          while (__stxr(v9, a2));
          break;
      }
      *a4 = v10;
      break;
    case 2:
      if ((a2 & 1) != 0)
        goto LABEL_38;
      v11 = *(_WORD *)a3;
      switch(a5)
      {
        case 1:
        case 2:
          do
            v12 = __ldaxr((unsigned __int16 *)a2);
          while (__stxr(v11, (unsigned __int16 *)a2));
          break;
        case 3:
          do
            v12 = __ldxr((unsigned __int16 *)a2);
          while (__stlxr(v11, (unsigned __int16 *)a2));
          break;
        case 4:
          do
            v12 = __ldaxr((unsigned __int16 *)a2);
          while (__stlxr(v11, (unsigned __int16 *)a2));
          break;
        case 5:
          do
            v12 = __ldaxr((unsigned __int16 *)a2);
          while (__stlxr(v11, (unsigned __int16 *)a2));
          break;
        default:
          do
            v12 = __ldxr((unsigned __int16 *)a2);
          while (__stxr(v11, (unsigned __int16 *)a2));
          break;
      }
      *(_WORD *)a4 = v12;
      break;
    case 4:
      if ((a2 & 3) != 0)
        goto LABEL_38;
      v13 = *(_DWORD *)a3;
      switch(a5)
      {
        case 1:
        case 2:
          do
            v14 = __ldaxr((unsigned int *)a2);
          while (__stxr(v13, (unsigned int *)a2));
          break;
        case 3:
          do
            v14 = __ldxr((unsigned int *)a2);
          while (__stlxr(v13, (unsigned int *)a2));
          break;
        case 4:
          do
            v14 = __ldaxr((unsigned int *)a2);
          while (__stlxr(v13, (unsigned int *)a2));
          break;
        case 5:
          do
            v14 = __ldaxr((unsigned int *)a2);
          while (__stlxr(v13, (unsigned int *)a2));
          break;
        default:
          do
            v14 = __ldxr((unsigned int *)a2);
          while (__stxr(v13, (unsigned int *)a2));
          break;
      }
      *(_DWORD *)a4 = v14;
      break;
    case 8:
      if ((a2 & 7) != 0)
        goto LABEL_38;
      v15 = *(_QWORD *)a3;
      switch(a5)
      {
        case 1:
        case 2:
          do
            v16 = __ldaxr((unint64_t *)a2);
          while (__stxr(v15, (unint64_t *)a2));
          break;
        case 3:
          do
            v16 = __ldxr((unint64_t *)a2);
          while (__stlxr(v15, (unint64_t *)a2));
          break;
        case 4:
          do
            v16 = __ldaxr((unint64_t *)a2);
          while (__stlxr(v15, (unint64_t *)a2));
          break;
        case 5:
          do
            v16 = __ldaxr((unint64_t *)a2);
          while (__stlxr(v15, (unint64_t *)a2));
          break;
        default:
          do
            v16 = __ldxr((unint64_t *)a2);
          while (__stxr(v15, (unint64_t *)a2));
          break;
      }
      *(_QWORD *)a4 = v16;
      break;
    default:
LABEL_38:
      _os_nospin_lock_lock();
      memcpy(a4, a2, v8);
      memcpy(a2, a3, v8);
      result = _os_nospin_lock_unlock();
      break;
  }
  return result;
}

uint64_t __atomic_load_1(unsigned __int8 *a1, int a2)
{
  if ((a2 - 1) < 2 || a2 == 5)
    return atomic_load(a1);
  else
    return *a1;
}

uint64_t __atomic_load_2(unsigned __int16 *a1, int a2)
{
  if ((a2 - 1) < 2 || a2 == 5)
    return atomic_load(a1);
  else
    return *a1;
}

uint64_t __atomic_load_4(unsigned int *a1, int a2)
{
  if ((a2 - 1) < 2 || a2 == 5)
    return atomic_load(a1);
  else
    return *a1;
}

unint64_t __atomic_load_8(unint64_t *a1, int a2)
{
  if ((a2 - 1) < 2 || a2 == 5)
    return atomic_load(a1);
  else
    return *a1;
}

unsigned __int8 *__atomic_store_1(unsigned __int8 *result, unsigned __int8 a2, int a3)
{
  if (a3 == 3 || a3 == 5)
    atomic_store(a2, result);
  else
    *result = a2;
  return result;
}

unsigned __int16 *__atomic_store_2(unsigned __int16 *result, unsigned __int16 a2, int a3)
{
  if (a3 == 3 || a3 == 5)
    atomic_store(a2, result);
  else
    *result = a2;
  return result;
}

unsigned int *__atomic_store_4(unsigned int *result, unsigned int a2, int a3)
{
  if (a3 == 3 || a3 == 5)
    atomic_store(a2, result);
  else
    *result = a2;
  return result;
}

unint64_t *__atomic_store_8(unint64_t *result, unint64_t a2, int a3)
{
  if (a3 == 3 || a3 == 5)
    atomic_store(a2, result);
  else
    *result = a2;
  return result;
}

uint64_t __atomic_exchange_1(unsigned __int8 *a1, unsigned __int8 a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(a2, a1));
      goto LABEL_11;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(a2, a1));
      goto LABEL_11;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
      goto LABEL_11;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
LABEL_11:
      v4 = v3;
      break;
    default:
      do
        v4 = __ldxr(a1);
      while (__stxr(a2, a1));
      break;
  }
  return v4;
}

uint64_t __atomic_exchange_2(unsigned __int16 *a1, unsigned __int16 a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(a2, a1));
      goto LABEL_11;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(a2, a1));
      goto LABEL_11;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
      goto LABEL_11;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
LABEL_11:
      v4 = v3;
      break;
    default:
      do
        v4 = __ldxr(a1);
      while (__stxr(a2, a1));
      break;
  }
  return v4;
}

uint64_t __atomic_exchange_4(unsigned int *a1, unsigned int a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(a2, a1));
      break;
  }
  return v3;
}

unint64_t __atomic_exchange_8(unint64_t *a1, unint64_t a2, int a3)
{
  unint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(a2, a1));
      break;
  }
  return v3;
}

uint64_t __atomic_compare_exchange_1(unsigned __int8 *a1, _BYTE *a2, unsigned __int8 a3, int a4, int a5)
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t result;

  switch(a4)
  {
    case 1:
    case 2:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v11 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v11)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v16 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v16)
              goto LABEL_74;
          }
          while (__stxr(a3, a1));
        }
      }
      else
      {
        v5 = *a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v5)
            goto LABEL_74;
        }
        while (__stxr(a3, a1));
      }
      return 1;
    case 3:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v13 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v13)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v18 = *a2;
          do
          {
            v6 = __ldxr(a1);
            if (v6 != v18)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
      }
      else
      {
        v8 = *a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v8)
            goto LABEL_74;
        }
        while (__stlxr(a3, a1));
      }
      return 1;
    case 4:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v14 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v14)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v19 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v19)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
      }
      else
      {
        v9 = *a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v9)
            goto LABEL_74;
        }
        while (__stlxr(a3, a1));
      }
      return 1;
    case 5:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v15 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v15)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v20 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v20)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
      }
      else
      {
        v10 = *a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v10)
            goto LABEL_74;
        }
        while (__stlxr(a3, a1));
      }
      return 1;
    default:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v12 = *a2;
          while (1)
          {
            v6 = __ldaxr(a1);
            if (v6 != v12)
              break;
            if (!__stlxr(a3, a1))
              return 1;
          }
        }
        else
        {
          v17 = *a2;
          while (1)
          {
            v6 = __ldxr(a1);
            if (v6 != v17)
              break;
            if (!__stxr(a3, a1))
              return 1;
          }
        }
      }
      else
      {
        v7 = *a2;
        while (1)
        {
          v6 = __ldaxr(a1);
          if (v6 != v7)
            break;
          if (!__stxr(a3, a1))
            return 1;
        }
      }
LABEL_74:
      __clrex();
      result = 0;
      *a2 = v6;
      return result;
  }
}

uint64_t __atomic_compare_exchange_2(unsigned __int16 *a1, _WORD *a2, unsigned __int16 a3, int a4, int a5)
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t result;

  switch(a4)
  {
    case 1:
    case 2:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v11 = (unsigned __int16)*a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v11)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v16 = (unsigned __int16)*a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v16)
              goto LABEL_74;
          }
          while (__stxr(a3, a1));
        }
      }
      else
      {
        v5 = (unsigned __int16)*a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v5)
            goto LABEL_74;
        }
        while (__stxr(a3, a1));
      }
      return 1;
    case 3:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v13 = (unsigned __int16)*a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v13)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v18 = (unsigned __int16)*a2;
          do
          {
            v6 = __ldxr(a1);
            if (v6 != v18)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
      }
      else
      {
        v8 = (unsigned __int16)*a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v8)
            goto LABEL_74;
        }
        while (__stlxr(a3, a1));
      }
      return 1;
    case 4:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v14 = (unsigned __int16)*a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v14)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v19 = (unsigned __int16)*a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v19)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
      }
      else
      {
        v9 = (unsigned __int16)*a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v9)
            goto LABEL_74;
        }
        while (__stlxr(a3, a1));
      }
      return 1;
    case 5:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v15 = (unsigned __int16)*a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v15)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v20 = (unsigned __int16)*a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v20)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
      }
      else
      {
        v10 = (unsigned __int16)*a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v10)
            goto LABEL_74;
        }
        while (__stlxr(a3, a1));
      }
      return 1;
    default:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v12 = (unsigned __int16)*a2;
          while (1)
          {
            v6 = __ldaxr(a1);
            if (v6 != v12)
              break;
            if (!__stlxr(a3, a1))
              return 1;
          }
        }
        else
        {
          v17 = (unsigned __int16)*a2;
          while (1)
          {
            v6 = __ldxr(a1);
            if (v6 != v17)
              break;
            if (!__stxr(a3, a1))
              return 1;
          }
        }
      }
      else
      {
        v7 = (unsigned __int16)*a2;
        while (1)
        {
          v6 = __ldaxr(a1);
          if (v6 != v7)
            break;
          if (!__stxr(a3, a1))
            return 1;
        }
      }
LABEL_74:
      __clrex();
      result = 0;
      *a2 = v6;
      return result;
  }
}

uint64_t __atomic_compare_exchange_4(unsigned int *a1, unsigned int *a2, unsigned int a3, int a4, int a5)
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t result;

  switch(a4)
  {
    case 1:
    case 2:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v11 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v11)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v16 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v16)
              goto LABEL_74;
          }
          while (__stxr(a3, a1));
        }
      }
      else
      {
        v5 = *a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v5)
            goto LABEL_74;
        }
        while (__stxr(a3, a1));
      }
      return 1;
    case 3:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v13 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v13)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v18 = *a2;
          do
          {
            v6 = __ldxr(a1);
            if (v6 != v18)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
      }
      else
      {
        v8 = *a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v8)
            goto LABEL_74;
        }
        while (__stlxr(a3, a1));
      }
      return 1;
    case 4:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v14 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v14)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v19 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v19)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
      }
      else
      {
        v9 = *a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v9)
            goto LABEL_74;
        }
        while (__stlxr(a3, a1));
      }
      return 1;
    case 5:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v15 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v15)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v20 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v20)
              goto LABEL_74;
          }
          while (__stlxr(a3, a1));
        }
      }
      else
      {
        v10 = *a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v10)
            goto LABEL_74;
        }
        while (__stlxr(a3, a1));
      }
      return 1;
    default:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v12 = *a2;
          while (1)
          {
            v6 = __ldaxr(a1);
            if (v6 != v12)
              break;
            if (!__stlxr(a3, a1))
              return 1;
          }
        }
        else
        {
          v17 = *a2;
          while (1)
          {
            v6 = __ldxr(a1);
            if (v6 != v17)
              break;
            if (!__stxr(a3, a1))
              return 1;
          }
        }
      }
      else
      {
        v7 = *a2;
        while (1)
        {
          v6 = __ldaxr(a1);
          if (v6 != v7)
            break;
          if (!__stxr(a3, a1))
            return 1;
        }
      }
LABEL_74:
      __clrex();
      result = 0;
      *a2 = v6;
      return result;
  }
}

uint64_t __atomic_compare_exchange_8(unint64_t *a1, unint64_t *a2, unint64_t a3, int a4, int a5)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t result;

  switch(a4)
  {
    case 1:
    case 2:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v10 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v10)
              goto LABEL_72;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v15 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v15)
              goto LABEL_72;
          }
          while (__stxr(a3, a1));
        }
      }
      else
      {
        v5 = *a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v5)
            goto LABEL_72;
        }
        while (__stxr(a3, a1));
      }
      return 1;
    case 3:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v12 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v12)
              goto LABEL_72;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v17 = *a2;
          do
          {
            v6 = __ldxr(a1);
            if (v6 != v17)
              goto LABEL_72;
          }
          while (__stlxr(a3, a1));
        }
      }
      else
      {
        v7 = *a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v7)
            goto LABEL_72;
        }
        while (__stlxr(a3, a1));
      }
      return 1;
    case 4:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v13 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v13)
              goto LABEL_72;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v18 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v18)
              goto LABEL_72;
          }
          while (__stlxr(a3, a1));
        }
      }
      else
      {
        v8 = *a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v8)
            goto LABEL_72;
        }
        while (__stlxr(a3, a1));
      }
      return 1;
    case 5:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v14 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v14)
              goto LABEL_72;
          }
          while (__stlxr(a3, a1));
        }
        else
        {
          v19 = *a2;
          do
          {
            v6 = __ldaxr(a1);
            if (v6 != v19)
              goto LABEL_72;
          }
          while (__stlxr(a3, a1));
        }
      }
      else
      {
        v9 = *a2;
        do
        {
          v6 = __ldaxr(a1);
          if (v6 != v9)
            goto LABEL_72;
        }
        while (__stlxr(a3, a1));
      }
      return 1;
    default:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          v16 = *a2;
          while (1)
          {
            v6 = __ldaxr(a1);
            if (v6 != v16)
              break;
            if (!__stlxr(a3, a1))
              return 1;
          }
        }
        else
        {
          v20 = *a2;
          while (1)
          {
            v6 = __ldxr(a1);
            if (v6 != v20)
              break;
            if (!__stxr(a3, a1))
              return 1;
          }
        }
      }
      else
      {
        v11 = *a2;
        while (1)
        {
          v6 = __ldaxr(a1);
          if (v6 != v11)
            break;
          if (!__stxr(a3, a1))
            return 1;
        }
      }
LABEL_72:
      __clrex();
      result = 0;
      *a2 = v6;
      return result;
  }
}

uint64_t __atomic_fetch_add_1(unsigned __int8 *a1, char a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
  }
  return v3;
}

uint64_t __atomic_fetch_add_2(unsigned __int16 *a1, __int16 a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
  }
  return v3;
}

uint64_t __atomic_fetch_add_4(unsigned int *a1, int a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
  }
  return v3;
}

unint64_t __atomic_fetch_add_8(unint64_t *a1, uint64_t a2, int a3)
{
  unint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
  }
  return v3;
}

uint64_t __atomic_fetch_sub_1(unsigned __int8 *a1, char a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
  }
  return v3;
}

uint64_t __atomic_fetch_sub_2(unsigned __int16 *a1, __int16 a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
  }
  return v3;
}

uint64_t __atomic_fetch_sub_4(unsigned int *a1, int a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
  }
  return v3;
}

unint64_t __atomic_fetch_sub_8(unint64_t *a1, uint64_t a2, int a3)
{
  unint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
  }
  return v3;
}

uint64_t __atomic_fetch_and_1(unsigned __int8 *a1, char a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
  }
  return v3;
}

uint64_t __atomic_fetch_and_2(unsigned __int16 *a1, __int16 a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
  }
  return v3;
}

uint64_t __atomic_fetch_and_4(unsigned int *a1, int a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
  }
  return v3;
}

unint64_t __atomic_fetch_and_8(unint64_t *a1, uint64_t a2, int a3)
{
  unint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
  }
  return v3;
}

uint64_t __atomic_fetch_or_1(unsigned __int8 *a1, char a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
  }
  return v3;
}

uint64_t __atomic_fetch_or_2(unsigned __int16 *a1, __int16 a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
  }
  return v3;
}

uint64_t __atomic_fetch_or_4(unsigned int *a1, int a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
  }
  return v3;
}

unint64_t __atomic_fetch_or_8(unint64_t *a1, uint64_t a2, int a3)
{
  unint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
  }
  return v3;
}

uint64_t __atomic_fetch_xor_1(unsigned __int8 *a1, char a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
  }
  return v3;
}

uint64_t __atomic_fetch_xor_2(unsigned __int16 *a1, __int16 a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
  }
  return v3;
}

uint64_t __atomic_fetch_xor_4(unsigned int *a1, int a2, int a3)
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
  }
  return v3;
}

unint64_t __atomic_fetch_xor_8(unint64_t *a1, uint64_t a2, int a3)
{
  unint64_t v3;

  switch(a3)
  {
    case 1:
    case 2:
      do
        v3 = __ldaxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
    case 3:
      do
        v3 = __ldxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 4:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 5:
      do
        v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    default:
      do
        v3 = __ldxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
  }
  return v3;
}

void atomic_flag_clear(atomic_flag *a1)
{
  atomic_store(0, (unsigned __int8 *)a1);
}

void atomic_flag_clear_explicit(atomic_flag *a1, memory_order a2)
{
  if (a2 == memory_order_release || a2 == memory_order_seq_cst)
    atomic_store(0, (unsigned __int8 *)a1);
  else
    a1->_Value = 0;
}

BOOL atomic_flag_test_and_set(atomic_flag *a1)
{
  unsigned __int8 v1;

  do
    v1 = __ldaxr((unsigned __int8 *)a1);
  while (__stlxr(1u, (unsigned __int8 *)a1));
  return v1 & 1;
}

BOOL atomic_flag_test_and_set_explicit(atomic_flag *a1, memory_order a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;

  switch(a2)
  {
    case memory_order_consume:
    case memory_order_acquire:
      do
        v2 = __ldaxr((unsigned __int8 *)a1);
      while (__stxr(1u, (unsigned __int8 *)a1));
      goto LABEL_11;
    case memory_order_release:
      do
        v2 = __ldxr((unsigned __int8 *)a1);
      while (__stlxr(1u, (unsigned __int8 *)a1));
      goto LABEL_11;
    case memory_order_acq_rel:
      do
        v2 = __ldaxr((unsigned __int8 *)a1);
      while (__stlxr(1u, (unsigned __int8 *)a1));
      goto LABEL_11;
    case memory_order_seq_cst:
      do
        v2 = __ldaxr((unsigned __int8 *)a1);
      while (__stlxr(1u, (unsigned __int8 *)a1));
LABEL_11:
      v3 = v2;
      break;
    default:
      do
        v3 = __ldxr((unsigned __int8 *)a1);
      while (__stxr(1u, (unsigned __int8 *)a1));
      break;
  }
  return v3 & 1;
}

void atomic_thread_fence(memory_order a1)
{
  switch(a1)
  {
    case memory_order_consume:
    case memory_order_acquire:
      __dmb(9u);
      break;
    case memory_order_release:
    case memory_order_acq_rel:
    case memory_order_seq_cst:
      __dmb(0xBu);
      break;
    default:
      return;
  }
}

float __extendhfsf2(__int16 a1)
{
  unsigned int v1;
  unsigned int v2;
  int v3;
  int v4;
  int v5;
  float result;

  v1 = a1 & 0x7FFF;
  v2 = __clz(v1);
  v3 = (v1 << (v2 - 8)) ^ 0x800000 | (1124073472 - (v2 << 23));
  if ((a1 & 0x7FFF) == 0)
    v3 = 0;
  if ((unsigned __int16)(a1 & 0x7FFF) >> 10 >= 0x1Fu)
    v4 = (v1 << 13) | 0x7F800000;
  else
    v4 = v3;
  v5 = (v1 << 13) + 939524096;
  if (((a1 & 0x7FFFu) - 1024) >> 11 > 0xE)
    v5 = v4;
  LODWORD(result) = v5 | ((a1 & 0x8000) << 16);
  return result;
}

uint64_t __gcc_personality_v0(int a1, char a2, int a3, uintptr_t a4, _Unwind_Context *context)
{
  uintptr_t LanguageSpecificData;
  unsigned __int8 *v8;
  uintptr_t IP;
  uintptr_t RegionStart;
  unsigned int v11;
  unsigned __int16 *v12;
  unsigned int v13;
  unsigned __int16 *v14;
  int v15;
  int v16;
  unsigned int v17;
  int v18;
  unint64_t v19;
  unsigned __int16 *v20;
  unsigned int v21;
  char v22;
  unsigned __int16 *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unsigned __int16 *v28;
  int v29;
  unsigned __int16 *v31;
  unsigned __int16 *v32;

  if ((a2 & 1) != 0)
    return 8;
  LanguageSpecificData = _Unwind_GetLanguageSpecificData(context);
  if (!LanguageSpecificData)
    return 8;
  v8 = (unsigned __int8 *)LanguageSpecificData;
  IP = _Unwind_GetIP(context);
  RegionStart = _Unwind_GetRegionStart(context);
  v13 = *v8;
  v12 = (unsigned __int16 *)(v8 + 1);
  v11 = v13;
  v32 = v12;
  if (v13 != 255)
  {
    readEncodedPointer(&v32, v11);
    v12 = v32;
  }
  v15 = *(unsigned __int8 *)v12;
  v14 = (unsigned __int16 *)((char *)v12 + 1);
  v32 = v14;
  if (v15 != 255)
  {
    do
    {
      v16 = *(char *)v14;
      v14 = (unsigned __int16 *)((char *)v14 + 1);
    }
    while (v16 < 0);
  }
  v17 = 0;
  v18 = 0;
  v19 = IP + ~RegionStart;
  v20 = (unsigned __int16 *)((char *)v14 + 1);
  v32 = (unsigned __int16 *)((char *)v14 + 1);
  v21 = *(unsigned __int8 *)v14;
  do
  {
    v22 = *(_BYTE *)v20;
    v20 = (unsigned __int16 *)((char *)v20 + 1);
    v17 |= (v22 & 0x7F) << v18;
    v18 += 7;
  }
  while (v22 < 0);
  v31 = v20;
  if (!v17)
    return 8;
  v23 = (unsigned __int16 *)((char *)v20 + v17);
  while (1)
  {
    v24 = readEncodedPointer(&v31, v21);
    v25 = readEncodedPointer(&v31, v21);
    v26 = readEncodedPointer(&v31, v21);
    v27 = v26;
    v28 = v31;
    do
    {
      v29 = *(char *)v28;
      v28 = (unsigned __int16 *)((char *)v28 + 1);
    }
    while (v29 < 0);
    v31 = v28;
    if (v26)
    {
      if (v24 <= v19 && v19 < v25 + v24)
        break;
    }
    if (v28 >= v23)
      return 8;
  }
  _Unwind_SetGR(context, 0, a4);
  _Unwind_SetGR(context, 1, 0);
  _Unwind_SetIP(context, v27 + RegionStart);
  return 7;
}

unint64_t readEncodedPointer(unsigned __int16 **a1, unsigned int a2)
{
  unsigned __int16 *v2;
  unint64_t v3;
  unsigned __int16 *v4;
  int v5;
  char v6;
  int v7;

  if (a2 == 255)
    return 0;
  v2 = *a1;
  switch(a2 & 0xF)
  {
    case 0u:
    case 4u:
    case 0xCu:
      v4 = v2 + 4;
      v3 = *(_QWORD *)v2;
      break;
    case 1u:
      v3 = 0;
      v5 = 0;
      v4 = *a1;
      do
      {
        v6 = *(_BYTE *)v4;
        v4 = (unsigned __int16 *)((char *)v4 + 1);
        v3 |= (v6 & 0x7F) << v5;
        v5 += 7;
      }
      while (v6 < 0);
      break;
    case 2u:
      v4 = v2 + 1;
      v3 = *v2;
      break;
    case 3u:
      v4 = v2 + 2;
      v3 = *(unsigned int *)v2;
      break;
    case 0xAu:
      v4 = v2 + 1;
      v3 = (__int16)*v2;
      break;
    case 0xBu:
      v4 = v2 + 2;
      v3 = *(int *)v2;
      break;
    default:
      __compilerrt_abort_impl("/Library/Caches/com.apple.xbs/Sources/Libcompiler_rt/lib/builtins/gcc_personality_v0.c", 121, "readEncodedPointer");
  }
  v7 = (a2 >> 4) & 7;
  if (v7)
  {
    if (v7 != 1)
      __compilerrt_abort_impl("/Library/Caches/com.apple.xbs/Sources/Libcompiler_rt/lib/builtins/gcc_personality_v0.c", 139, "readEncodedPointer");
    v3 += (unint64_t)v2;
  }
  if ((a2 & 0x80) != 0)
    v3 = *(_QWORD *)v3;
  *a1 = v4;
  return v3;
}

void __compilerrt_abort_impl(char *a1, int a2, char *a3)
{
  __assert_rtn(a3, a1, a2, "libcompiler_rt abort");
}

unint64_t __modti3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v12[2];

  v5 = a3 ^ (a4 >> 63);
  v6 = v5 + ((unint64_t)a4 >> 63);
  if (__CFADD__(v5, (unint64_t)a4 >> 63))
    v7 = (a4 ^ (a4 >> 63)) + 1;
  else
    v7 = a4 ^ (a4 >> 63);
  v8 = a1 ^ (a2 >> 63);
  v9 = v8 + ((unint64_t)a2 >> 63);
  if (__CFADD__(v8, (unint64_t)a2 >> 63))
    v10 = (a2 ^ (a2 >> 63)) + 1;
  else
    v10 = a2 ^ (a2 >> 63);
  v12[0] = 0;
  v12[1] = 0;
  __udivmodti4(v9, v10, v6, v7, v12);
  return (v12[0] ^ (a2 >> 63)) + ((unint64_t)a2 >> 63);
}

double __muldc3(double a1, double a2, double a3, double a4)
{
  return a1 * a3 - a2 * a4;
}

float __mulsc3(float a1, float a2, float a3, float a4)
{
  return (float)(a1 * a3) - (float)(a2 * a4);
}

float __powisf2(int a1, float a2)
{
  float v2;
  int v3;
  int v4;
  float v5;
  float result;

  if ((a1 & 1) != 0)
    v2 = a2;
  else
    v2 = 1.0;
  if ((a1 + 1) >= 3)
  {
    v3 = a1;
    do
    {
      if (v3 >= 0)
        v4 = v3;
      else
        v4 = v3 + 1;
      v3 = v4 >> 1;
      a2 = a2 * a2;
      if (((v4 >> 1) & 1) != 0)
        v5 = a2;
      else
        v5 = 1.0;
      v2 = v2 * v5;
    }
    while ((v3 + 1) > 2);
  }
  result = 1.0 / v2;
  if (a1 >= 0)
    return v2;
  return result;
}

uint64_t __truncdfhf2(double a1)
{
  unint64_t v1;
  uint64_t v2;
  int v3;
  unint64_t v4;
  char v5;
  unint64_t v6;
  _BOOL8 v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;

  v1 = *(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFLL;
  if ((*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) - 0x3F10000000000000 >= (*(_QWORD *)&a1 & 0x7FFFFFFFFFFFFFFFuLL)
                                                                        - 0x40F0000000000000)
  {
    if (v1 < 0x7FF0000000000001)
    {
      v4 = v1 >> 52;
      if (v4 <= 0x40E)
      {
        if (v4 >= 0x3BD)
        {
          v5 = -15 - v4;
          v6 = *(_QWORD *)&a1 & 0xFFFFFFFFFFFFFLL | 0x10000000000000;
          v7 = v6 << (v4 + 79) != 0;
          v8 = v6 >> v5;
          v9 = v8 >> 42;
          v10 = v8 & 0x3FFFFFFFFFFLL | v7;
          v11 = ((v8 >> 42) & 1) + (v8 >> 42);
          if (v10 != 0x20000000000)
            LOWORD(v11) = v9;
          if (v10 >= 0x20000000001)
            LOWORD(v2) = v9 + 1;
          else
            LOWORD(v2) = v11;
        }
        else
        {
          LOWORD(v2) = 0;
        }
      }
      else
      {
        LOWORD(v2) = 31744;
      }
    }
    else
    {
      LODWORD(v2) = (*(_QWORD *)&a1 >> 42) & 0x1FF | 0x7E00;
    }
  }
  else
  {
    v2 = *(_QWORD *)&a1 >> 42;
    v3 = (*(_QWORD *)&a1 >> 42) + 0x4000;
    if ((*(_QWORD *)&a1 & 0x3FFFFFFFFFFLL) == 0x20000000000)
      v3 += (*(_QWORD *)&a1 >> 42) & 1;
    LOWORD(v2) = v2 + 16385;
    if ((*(_QWORD *)&a1 & 0x3FFFFFFFFFFuLL) < 0x20000000001)
      LOWORD(v2) = v3;
  }
  return (unsigned __int16)(v2 | HIWORD(a1) & 0x8000);
}

uint64_t __truncsfhf2(float a1)
{
  unsigned int v1;
  __int16 v2;
  __int16 v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  _BOOL4 v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;

  v1 = LODWORD(a1) & 0x7FFFFFFF;
  if ((LODWORD(a1) & 0x7FFFFFFFu) - 947912704 >= (LODWORD(a1) & 0x7FFFFFFFu) - 1199570944)
  {
    if (v1 < 0x7F800001)
    {
      v5 = v1 >> 23;
      v6 = HIBYTE(v1);
      v7 = LODWORD(a1) & 0x7FFFFF | 0x800000;
      v8 = v7 << ((v1 >> 23) - 81) != 0;
      v9 = v7 >> (113 - (v1 >> 23));
      v10 = v9 >> 13;
      v11 = v9 & 0x1FFF | v8;
      v4 = ((v9 >> 13) & 1) + (v9 >> 13);
      if (v11 != 4096)
        LOWORD(v4) = v10;
      if (v11 > 0x1000)
        LOWORD(v4) = v10 + 1;
      if (v6 < 0x2D)
        LOWORD(v4) = 0;
      if (v5 > 0x8E)
        LOWORD(v4) = 31744;
    }
    else
    {
      v4 = (LODWORD(a1) >> 13) & 0x1FF | 0x7E00;
    }
  }
  else
  {
    v2 = LODWORD(a1) >> 13;
    v3 = v2 + 0x4000;
    if ((LOWORD(a1) & 0x1FFF) == 0x1000)
      v3 = ((LODWORD(a1) >> 13) & 1) + v2 + 0x4000;
    if ((LOWORD(a1) & 0x1FFFu) > 0x1000)
      LOWORD(v4) = v2 + 16385;
    else
      LOWORD(v4) = v3;
  }
  return (unsigned __int16)(v4 | (LODWORD(a1) >> 31 << 15));
}

unint64_t __umodti3(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5[2];

  v5[0] = 0;
  v5[1] = 0;
  __udivmodti4(a1, a2, a3, a4, v5);
  return v5[0];
}

uintptr_t _Unwind_GetIP(_Unwind_Context *context)
{
  return MEMORY[0x1E0C88F48](context);
}

uintptr_t _Unwind_GetLanguageSpecificData(_Unwind_Context *context)
{
  return MEMORY[0x1E0C88F50](context);
}

uintptr_t _Unwind_GetRegionStart(_Unwind_Context *context)
{
  return MEMORY[0x1E0C88F58](context);
}

void _Unwind_SetGR(_Unwind_Context *context, int index, uintptr_t new_value)
{
  MEMORY[0x1E0C88F68](context, *(_QWORD *)&index, new_value);
}

void _Unwind_SetIP(_Unwind_Context *a1, uintptr_t new_value)
{
  MEMORY[0x1E0C88F70](a1, new_value);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C87488](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_nospin_lock_lock()
{
  return MEMORY[0x1E0C88A90]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x1E0C88A98]();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C87828](__s1, __s2, __n);
}

