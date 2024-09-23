uint64_t sub_22D254B80(uint64_t a1)
{
  void *v2;
  uint64_t result;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;

  v2 = malloc_type_malloc((2 * *(_DWORD *)(a1 + 44)), 0x7A14FE65uLL);
  *(_QWORD *)(a1 + 48) = v2;
  if (!v2)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 64))
  {
    result = 0;
    *(_DWORD *)(a1 + 40) = *(_DWORD *)(a1 + 44);
    return result;
  }
  v4 = malloc_type_malloc(*(unsigned int *)(a1 + 44), 0x4E80A05AuLL);
  *(_QWORD *)(a1 + 56) = v4;
  if (!v4)
  {
LABEL_7:
    free(*(void **)(a1 + 48));
LABEL_8:
    sub_22D25BE5C(a1, -4, "out of memory");
    return 0xFFFFFFFFLL;
  }
  *(_QWORD *)(a1 + 192) = 0;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  if (deflateInit2_((z_streamp)(a1 + 128), *(_DWORD *)(a1 + 88), 8, 31, 8, *(_DWORD *)(a1 + 92), "1.2.12", 112))
  {
    free(*(void **)(a1 + 56));
    goto LABEL_7;
  }
  *(_QWORD *)(a1 + 128) = 0;
  v5 = *(_DWORD *)(a1 + 64);
  v6 = *(_DWORD *)(a1 + 44);
  *(_DWORD *)(a1 + 40) = v6;
  result = 0;
  if (!v5)
  {
    *(_DWORD *)(a1 + 160) = v6;
    v7 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)(a1 + 152) = v7;
    *(_QWORD *)(a1 + 8) = v7;
  }
  return result;
}

uint64_t sub_22D254C6C(const char *a1, int a2, _BYTE *a3)
{
  _QWORD *v6;
  uint64_t v7;
  char v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unsigned __int8 *v13;
  int v14;
  size_t v15;
  char *v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  off_t v23;
  off_t v24;

  if (!a1)
    return 0;
  v6 = malloc_type_malloc(0xF0uLL, 0x10B00408B6D6075uLL);
  v7 = (uint64_t)v6;
  if (!v6)
    return v7;
  v6[5] = 0x200000000000;
  v6[15] = 0;
  *((_DWORD *)v6 + 6) = 0;
  v6[11] = 0xFFFFFFFFLL;
  *((_DWORD *)v6 + 16) = 0;
  v8 = *a3;
  if (!*a3)
    goto LABEL_60;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = a3 + 1;
  do
  {
    if ((v8 - 48) <= 9u)
    {
      *((_DWORD *)v6 + 22) = v8 - 48;
      goto LABEL_28;
    }
    if (v8 <= 96)
    {
      if (v8 <= 81)
      {
        if (v8 == 70)
        {
          *((_DWORD *)v6 + 23) = 4;
        }
        else if (v8 == 43)
        {
          goto LABEL_60;
        }
      }
      else if (v8 == 82)
      {
        *((_DWORD *)v6 + 23) = 3;
      }
      else if (v8 == 84)
      {
        v9 = 1;
        *((_DWORD *)v6 + 16) = 1;
      }
    }
    else if (v8 > 113)
    {
      if (v8 == 120)
      {
        v11 = 1;
      }
      else
      {
        if (v8 == 119)
        {
          v10 = 31153;
        }
        else
        {
          if (v8 != 114)
            goto LABEL_28;
          v10 = 7247;
        }
LABEL_27:
        *((_DWORD *)v6 + 6) = v10;
      }
    }
    else
    {
      switch(v8)
      {
        case 'a':
          v10 = 1;
          goto LABEL_27;
        case 'e':
          v12 = 1;
          break;
        case 'f':
          *((_DWORD *)v6 + 23) = 1;
          break;
        case 'h':
          *((_DWORD *)v6 + 23) = 2;
          break;
        default:
          break;
      }
    }
LABEL_28:
    v14 = *v13++;
    v8 = v14;
  }
  while (v14);
  if (v10 == 7247)
  {
    if (!v9)
    {
      *((_DWORD *)v6 + 16) = 1;
      goto LABEL_37;
    }
    goto LABEL_60;
  }
  if (!v10)
  {
LABEL_60:
    free((void *)v7);
    return 0;
  }
LABEL_37:
  v15 = strlen(a1) + 1;
  v16 = (char *)malloc_type_malloc(v15, 0x1C007A9FuLL);
  *(_QWORD *)(v7 + 32) = v16;
  if (!v16)
    goto LABEL_60;
  snprintf(v16, v15, "%s", a1);
  v17 = *(_DWORD *)(v7 + 24);
  if (v11)
    v18 = 2561;
  else
    v18 = 513;
  if (v17 == 31153)
    v19 = 1024;
  else
    v19 = 8;
  v20 = v19 | v18;
  if (v17 == 7247)
    v21 = 0;
  else
    v21 = v20;
  if ((a2 & 0x80000000) == 0)
  {
    *(_DWORD *)(v7 + 28) = a2;
    goto LABEL_51;
  }
  v22 = open(a1, v21 | ((v12 != 0) << 24), 438);
  *(_DWORD *)(v7 + 28) = v22;
  if (v22 == -1)
  {
    free(*(void **)(v7 + 32));
    goto LABEL_60;
  }
  a2 = v22;
  v17 = *(_DWORD *)(v7 + 24);
LABEL_51:
  if (v17 == 7247)
  {
    v23 = lseek(a2, 0, 1);
    if (v23 == -1)
      v24 = 0;
    else
      v24 = v23;
    *(_QWORD *)(v7 + 72) = v24;
  }
  else if (v17 == 1)
  {
    lseek(a2, 0, 2);
    *(_DWORD *)(v7 + 24) = 31153;
  }
  sub_22D25BDF0(v7);
  return v7;
}

uint64_t gzoffset_0(gzFile a1)
{
  unsigned int have;
  uint64_t result;

  if (!a1)
    return -1;
  have = a1[1].have;
  if (have != 31153 && have != 7247)
    return -1;
  result = lseek(*(&a1[1].have + 1), 0, 1);
  if (result != -1 && a1[1].have == 7247)
    result -= LODWORD(a1[5].pos);
  return result;
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  if (file)
  {
    if (file[1].have != 31153 || HIDWORD(file[4].pos))
      goto LABEL_4;
    if ((len & 0x80000000) != 0)
    {
      sub_22D25BE5C((uint64_t)file, -3, "requested length does not fit in int");
LABEL_4:
      LODWORD(file) = 0;
      return (int)file;
    }
    LODWORD(file) = sub_22D25501C((uint64_t)file, (char *)buf, len);
  }
  return (int)file;
}

unint64_t sub_22D25501C(uint64_t a1, char *__src, unint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  uint64_t v14;

  v3 = a3;
  if (!a3)
    return v3;
  if (!*(_DWORD *)(a1 + 40) && sub_22D254B80(a1) == -1)
    return 0;
  if (*(_DWORD *)(a1 + 112))
  {
    *(_DWORD *)(a1 + 112) = 0;
    if (sub_22D25FDE8(a1, *(_QWORD *)(a1 + 104)) == -1)
      return 0;
  }
  if (*(unsigned int *)(a1 + 40) <= v3)
  {
    if (!*(_DWORD *)(a1 + 136) || sub_22D255188(a1, 0) != -1)
    {
      *(_QWORD *)(a1 + 128) = __src;
      v13 = v3;
      while (1)
      {
        v14 = v13 >= 0xFFFFFFFF ? 0xFFFFFFFFLL : v13;
        *(_DWORD *)(a1 + 136) = v14;
        *(_QWORD *)(a1 + 16) += v14;
        if (sub_22D255188(a1, 0) == -1)
          break;
        v13 -= v14;
        if (!v13)
          return v3;
      }
    }
    return 0;
  }
  v6 = v3;
  while (1)
  {
    v7 = *(_DWORD *)(a1 + 136);
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 128);
      v9 = *(_QWORD *)(a1 + 48);
    }
    else
    {
      v9 = *(_QWORD *)(a1 + 48);
      *(_QWORD *)(a1 + 128) = v9;
      LODWORD(v8) = v9;
    }
    v10 = v8 + v7 - v9;
    v11 = *(_DWORD *)(a1 + 40) - v10;
    v12 = v6 >= v11 ? v11 : v6;
    memcpy((void *)(v9 + v10), __src, v12);
    *(_DWORD *)(a1 + 136) += v12;
    *(_QWORD *)(a1 + 16) += v12;
    v6 -= v12;
    if (!v6)
      break;
    __src += v12;
    if (sub_22D255188(a1, 0) == -1)
      return 0;
  }
  return v3;
}

uint64_t sub_22D255188(uint64_t a1, int flush)
{
  unsigned int v4;
  const void *v5;
  size_t v6;
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  BOOL v11;
  int v12;
  unint64_t v13;
  const void *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  char *v20;

  if (!*(_DWORD *)(a1 + 40) && sub_22D254B80(a1) == -1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)(a1 + 64))
  {
    v4 = *(_DWORD *)(a1 + 136);
    if (v4)
    {
      v5 = *(const void **)(a1 + 128);
      while (1)
      {
        v6 = v4 >= 0x40000000 ? 0x40000000 : v4;
        v7 = write(*(_DWORD *)(a1 + 28), v5, v6);
        if ((v7 & 0x80000000) != 0)
          break;
        v8 = *(_DWORD *)(a1 + 136);
        v5 = (const void *)(*(_QWORD *)(a1 + 128) + v7);
        *(_QWORD *)(a1 + 128) = v5;
        v4 = v8 - v7;
        *(_DWORD *)(a1 + 136) = v4;
        if (!v4)
          return 0;
      }
LABEL_39:
      v19 = __error();
      v20 = strerror(*v19);
      v18 = 0xFFFFFFFFLL;
      sub_22D25BE5C(a1, -1, v20);
      return v18;
    }
    return 0;
  }
  if (*(_DWORD *)(a1 + 96))
  {
    if (!*(_DWORD *)(a1 + 136))
      return 0;
    deflateReset((z_streamp)(a1 + 128));
    *(_DWORD *)(a1 + 96) = 0;
  }
  v9 = 0;
  v10 = *(_DWORD *)(a1 + 160);
  do
  {
    if (!v10 || (flush == 4 ? (v11 = v9 == 1) : (v11 = 1), !v11 ? (v12 = 0) : (v12 = 1), flush && v12))
    {
      v13 = *(_QWORD *)(a1 + 152);
      v14 = *(const void **)(a1 + 8);
      if (v13 > (unint64_t)v14)
      {
        while (1)
        {
          v15 = v13 - (_QWORD)v14;
          if (v15 >= 0x40000000)
            LODWORD(v15) = 0x40000000;
          v16 = write(*(_DWORD *)(a1 + 28), v14, v15);
          if ((v16 & 0x80000000) != 0)
            goto LABEL_39;
          v14 = (const void *)(*(_QWORD *)(a1 + 8) + v16);
          *(_QWORD *)(a1 + 8) = v14;
          v13 = *(_QWORD *)(a1 + 152);
          if (v13 <= (unint64_t)v14)
          {
            v10 = *(_DWORD *)(a1 + 160);
            break;
          }
        }
      }
      if (!v10)
      {
        v10 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)(a1 + 160) = v10;
        v17 = *(_QWORD *)(a1 + 56);
        *(_QWORD *)(a1 + 152) = v17;
        *(_QWORD *)(a1 + 8) = v17;
      }
    }
    v9 = deflate((z_streamp)(a1 + 128), flush);
    if (v9 == -2)
    {
      sub_22D25BE5C(a1, -2, "internal error: deflate stream corrupt");
      return 0xFFFFFFFFLL;
    }
    v11 = v10 == *(_DWORD *)(a1 + 160);
    v10 = *(_DWORD *)(a1 + 160);
  }
  while (!v11);
  if (flush != 4)
    return 0;
  v18 = 0;
  *(_DWORD *)(a1 + 96) = 1;
  return v18;
}

int uncompress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  uLong sourceLena;

  sourceLena = sourceLen;
  return uncompress2(dest, destLen, source, &sourceLena);
}

int gzclose_w(gzFile file)
{
  int pos_high;

  if (!file || file[1].have != 31153)
    return -2;
  if (LODWORD(file[4].pos))
  {
    LODWORD(file[4].pos) = 0;
    pos_high = 0;
    if (sub_22D25FDE8((uint64_t)file, (uint64_t)file[4].next) == -1)
      pos_high = HIDWORD(file[4].pos);
  }
  else
  {
    pos_high = 0;
  }
  if (sub_22D255188((uint64_t)file, 4) == -1)
    pos_high = HIDWORD(file[4].pos);
  if (LODWORD(file[1].pos))
  {
    if (!LODWORD(file[2].pos))
    {
      deflateEnd((z_streamp)&file[5].next);
      free(file[2].next);
    }
    free(*(void **)&file[2].have);
  }
  sub_22D25BE5C((uint64_t)file, 0, 0);
  free(file[1].next);
  if (close(*(&file[1].have + 1)) == -1)
    pos_high = -1;
  free(file);
  return pos_high;
}

int deflateEnd(z_streamp strm)
{
  internal_state *state;
  int v4;

  if (sub_22D259910(strm))
    return -2;
  state = strm->state;
  v4 = *((_DWORD *)state + 2);
  if (*((_QWORD *)state + 2))
  {
    ((void (*)(voidpf, _QWORD))strm->zfree)(strm->opaque, *((_QWORD *)state + 2));
    state = strm->state;
  }
  if (*((_QWORD *)state + 15))
  {
    ((void (*)(voidpf, _QWORD))strm->zfree)(strm->opaque, *((_QWORD *)state + 15));
    state = strm->state;
  }
  if (*((_QWORD *)state + 14))
  {
    ((void (*)(voidpf, _QWORD))strm->zfree)(strm->opaque, *((_QWORD *)state + 14));
    state = strm->state;
  }
  if (*((_QWORD *)state + 12))
  {
    ((void (*)(voidpf, _QWORD))strm->zfree)(strm->opaque, *((_QWORD *)state + 12));
    state = strm->state;
  }
  ((void (*)(voidpf, internal_state *))strm->zfree)(strm->opaque, state);
  strm->state = 0;
  if (v4 == 113)
    return -3;
  else
    return 0;
}

uint64_t sub_22D2554F0(uint64_t a1, int a2)
{
  unsigned int v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned __int8 v12;
  int v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int16 v22;
  uint64_t v23;
  unsigned __int16 v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  const void *v53;
  uint64_t v54;
  const void *v55;

  while (*(_DWORD *)(a1 + 180) >= 0x106u)
  {
    v5 = *(_DWORD *)(a1 + 160);
    v6 = *(_DWORD *)(a1 + 176);
LABEL_8:
    v8 = *(_DWORD *)(a1 + 172);
    v9 = ((*(_DWORD *)(a1 + 128) << *(_DWORD *)(a1 + 144)) ^ *(unsigned __int8 *)(*(_QWORD *)(a1 + 96) + v8 + 2)) & *(_DWORD *)(a1 + 140);
    *(_DWORD *)(a1 + 128) = v9;
    v10 = *(_QWORD *)(a1 + 120);
    v11 = *(unsigned __int16 *)(v10 + 2 * v9);
    *(_WORD *)(*(_QWORD *)(a1 + 112) + 2 * (*(_DWORD *)(a1 + 88) & v8)) = v11;
    *(_WORD *)(v10 + 2 * v9) = v8;
    *(_DWORD *)(a1 + 184) = v5;
    v7 = 2;
    *(_DWORD *)(a1 + 160) = 2;
    *(_DWORD *)(a1 + 164) = v6;
    if (!v11)
      goto LABEL_17;
    if (v5 < *(_DWORD *)(a1 + 192) && v8 - v11 <= *(_DWORD *)(a1 + 80) - 262)
    {
      v7 = sub_22D2559E4(a1, v11);
      *(_DWORD *)(a1 + 160) = v7;
      if (v7 <= 5)
      {
        if (*(_DWORD *)(a1 + 200) == 1)
          goto LABEL_15;
        if (v7 == 3)
        {
          if ((*(_DWORD *)(a1 + 172) - *(_DWORD *)(a1 + 176)) <= 0x1000)
          {
            v7 = 3;
            goto LABEL_16;
          }
LABEL_15:
          v7 = 2;
          *(_DWORD *)(a1 + 160) = 2;
        }
      }
    }
LABEL_16:
    v5 = *(_DWORD *)(a1 + 184);
LABEL_17:
    v12 = v5 - 3;
    if (v5 < 3 || v7 > v5)
    {
      if (*(_DWORD *)(a1 + 168))
      {
        v33 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 96) + (*(_DWORD *)(a1 + 172) - 1));
        v34 = *(_QWORD *)(a1 + 5888);
        v35 = *(unsigned int *)(a1 + 5900);
        *(_DWORD *)(a1 + 5900) = v35 + 1;
        *(_BYTE *)(v34 + v35) = 0;
        v36 = *(_QWORD *)(a1 + 5888);
        v37 = *(unsigned int *)(a1 + 5900);
        *(_DWORD *)(a1 + 5900) = v37 + 1;
        *(_BYTE *)(v36 + v37) = 0;
        v38 = *(_QWORD *)(a1 + 5888);
        v39 = *(unsigned int *)(a1 + 5900);
        *(_DWORD *)(a1 + 5900) = v39 + 1;
        *(_BYTE *)(v38 + v39) = v33;
        ++*(_WORD *)(a1 + 4 * v33 + 212);
        if (*(_DWORD *)(a1 + 5900) == *(_DWORD *)(a1 + 5904))
        {
          v40 = *(_QWORD *)(a1 + 152);
          if (v40 < 0)
            v41 = 0;
          else
            v41 = (const void *)(*(_QWORD *)(a1 + 96) + v40);
          sub_22D25A4F4((int *)a1, v41, *(unsigned int *)(a1 + 172) - v40, 0);
          *(_QWORD *)(a1 + 152) = *(unsigned int *)(a1 + 172);
          sub_22D25A000(*(_QWORD *)a1);
        }
        ++*(_DWORD *)(a1 + 172);
        --*(_DWORD *)(a1 + 180);
        goto LABEL_38;
      }
      v42 = *(_DWORD *)(a1 + 172) + 1;
      *(_DWORD *)(a1 + 168) = 1;
      *(_DWORD *)(a1 + 172) = v42;
      --*(_DWORD *)(a1 + 180);
    }
    else
    {
      v13 = *(_DWORD *)(a1 + 172);
      v14 = v13 + *(_DWORD *)(a1 + 180) - 3;
      v15 = v13 + ~*(_DWORD *)(a1 + 164);
      v16 = *(_QWORD *)(a1 + 5888);
      v17 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v17 + 1;
      *(_BYTE *)(v16 + v17) = v15;
      v18 = *(_QWORD *)(a1 + 5888);
      v19 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v19 + 1;
      *(_BYTE *)(v18 + v19) = BYTE1(v15);
      v20 = *(_QWORD *)(a1 + 5888);
      v21 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v21 + 1;
      *(_BYTE *)(v20 + v21) = v12;
      v22 = v15 - 1;
      v23 = a1 + 4 * byte_22D262168[v12];
      ++*(_WORD *)(v23 + 1240);
      v24 = (v22 >> 7) + 256;
      if ((v22 & 0xFF00) == 0)
        v24 = v22;
      v28 = a1 + 4 * byte_22D261F68[v24];
      ++*(_WORD *)(v28 + 2504);
      v25 = *(_DWORD *)(a1 + 5900);
      v26 = *(_DWORD *)(a1 + 5904);
      LODWORD(v28) = *(_DWORD *)(a1 + 184);
      *(_DWORD *)(a1 + 180) = *(_DWORD *)(a1 + 180) - v28 + 1;
      *(_DWORD *)(a1 + 184) = v28 - 2;
      v27 = v28 - 3;
      LODWORD(v28) = *(_DWORD *)(a1 + 172) + 1;
      do
      {
        *(_DWORD *)(a1 + 172) = v28;
        if (v28 <= v14)
        {
          v29 = ((*(_DWORD *)(a1 + 128) << *(_DWORD *)(a1 + 144)) ^ *(unsigned __int8 *)(*(_QWORD *)(a1 + 96)
                                                                                       + (v28 + 2))) & *(_DWORD *)(a1 + 140);
          *(_DWORD *)(a1 + 128) = v29;
          v30 = *(_QWORD *)(a1 + 120);
          *(_WORD *)(*(_QWORD *)(a1 + 112) + 2 * (*(_DWORD *)(a1 + 88) & v28)) = *(_WORD *)(v30 + 2 * v29);
          *(_WORD *)(v30 + 2 * v29) = v28;
        }
        *(_DWORD *)(a1 + 184) = v27--;
        v28 = (v28 + 1);
      }
      while (v27 != -1);
      *(_DWORD *)(a1 + 160) = 2;
      *(_DWORD *)(a1 + 168) = 0;
      *(_DWORD *)(a1 + 172) = v28;
      if (v25 == v26)
      {
        v31 = *(_QWORD *)(a1 + 152);
        if (v31 < 0)
          v32 = 0;
        else
          v32 = (const void *)(*(_QWORD *)(a1 + 96) + v31);
        sub_22D25A4F4((int *)a1, v32, v28 - v31, 0);
        *(_QWORD *)(a1 + 152) = *(unsigned int *)(a1 + 172);
        sub_22D25A000(*(_QWORD *)a1);
LABEL_38:
        if (!*(_DWORD *)(*(_QWORD *)a1 + 32))
          return 0;
      }
    }
  }
  sub_22D255BE0(a1);
  v4 = *(_DWORD *)(a1 + 180);
  if (!a2 && v4 < 0x106)
    return 0;
  if (v4)
  {
    v5 = *(_DWORD *)(a1 + 160);
    v6 = *(_DWORD *)(a1 + 176);
    if (v4 <= 2)
    {
      *(_DWORD *)(a1 + 184) = v5;
      v7 = 2;
      *(_DWORD *)(a1 + 160) = 2;
      *(_DWORD *)(a1 + 164) = v6;
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 168))
  {
    v43 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 96) + (*(_DWORD *)(a1 + 172) - 1));
    v44 = *(_QWORD *)(a1 + 5888);
    v45 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v45 + 1;
    *(_BYTE *)(v44 + v45) = 0;
    v46 = *(_QWORD *)(a1 + 5888);
    v47 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v47 + 1;
    *(_BYTE *)(v46 + v47) = 0;
    v48 = *(_QWORD *)(a1 + 5888);
    v49 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v49 + 1;
    *(_BYTE *)(v48 + v49) = v43;
    ++*(_WORD *)(a1 + 4 * v43 + 212);
    *(_DWORD *)(a1 + 168) = 0;
  }
  v50 = *(unsigned int *)(a1 + 172);
  if (v50 >= 2)
    v51 = 2;
  else
    v51 = *(_DWORD *)(a1 + 172);
  *(_DWORD *)(a1 + 5932) = v51;
  if (a2 != 4)
  {
    if (!*(_DWORD *)(a1 + 5900))
      return 1;
    v54 = *(_QWORD *)(a1 + 152);
    v55 = v54 < 0 ? 0 : (const void *)(*(_QWORD *)(a1 + 96) + v54);
    sub_22D25A4F4((int *)a1, v55, v50 - v54, 0);
    *(_QWORD *)(a1 + 152) = *(unsigned int *)(a1 + 172);
    sub_22D25A000(*(_QWORD *)a1);
    return *(_DWORD *)(*(_QWORD *)a1 + 32) != 0;
  }
  v52 = *(_QWORD *)(a1 + 152);
  if (v52 < 0)
    v53 = 0;
  else
    v53 = (const void *)(*(_QWORD *)(a1 + 96) + v52);
  sub_22D25A4F4((int *)a1, v53, v50 - v52, 1);
  *(_QWORD *)(a1 + 152) = *(unsigned int *)(a1 + 172);
  sub_22D25A000(*(_QWORD *)a1);
  if (*(_DWORD *)(*(_QWORD *)a1 + 32))
    return 3;
  else
    return 2;
}

uint64_t sub_22D2559E4(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned int v7;
  BOOL v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  unsigned int v15;
  unsigned __int8 *v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  unint64_t v23;
  int v24;
  int v25;
  int v26;

  v2 = *(_DWORD *)(a1 + 188);
  v3 = *(int *)(a1 + 184);
  v4 = *(_QWORD *)(a1 + 96);
  v5 = *(unsigned int *)(a1 + 172);
  v6 = (unsigned __int8 *)(v4 + v5);
  v7 = *(_DWORD *)(a1 + 80) - 262;
  v8 = v5 >= v7;
  v9 = v5 - v7;
  if (!v8)
    v9 = 0;
  v10 = *(_QWORD *)(a1 + 112);
  v11 = *(_DWORD *)(a1 + 88);
  v12 = *(_DWORD *)(a1 + 180);
  v13 = v6[v3 - 1];
  v14 = v6[v3];
  v15 = *(_DWORD *)(a1 + 208);
  if (v3 >= *(_DWORD *)(a1 + 204))
    v2 >>= 2;
  if (v15 >= v12)
    v15 = *(_DWORD *)(a1 + 180);
  while (1)
  {
    v16 = (unsigned __int8 *)(v4 + a2);
    if (v16[(int)v3] != v14 || v16[(int)v3 - 1] != v13 || *v16 != *v6 || v16[1] != v6[1])
      goto LABEL_32;
    v17 = 0;
    while (1)
    {
      v18 = &v6[v17];
      if (v6[v17 + 3] != v16[v17 + 3])
      {
        v24 = (_DWORD)v18 + 3;
        goto LABEL_29;
      }
      if (v18[4] != v16[v17 + 4])
      {
        v24 = (_DWORD)v6 + v17 + 4;
        goto LABEL_29;
      }
      v19 = &v6[v17];
      if (v6[v17 + 5] != v16[v17 + 5])
      {
        v24 = (_DWORD)v19 + 5;
        goto LABEL_29;
      }
      if (v19[6] != v16[v17 + 6])
      {
        v24 = (_DWORD)v6 + v17 + 6;
        goto LABEL_29;
      }
      v20 = &v6[v17];
      if (v6[v17 + 7] != v16[v17 + 7])
      {
        v24 = (_DWORD)v20 + 7;
        goto LABEL_29;
      }
      if (v20[8] != v16[v17 + 8])
      {
        v24 = (_DWORD)v6 + v17 + 8;
        goto LABEL_29;
      }
      v21 = &v6[v17];
      v22 = &v16[v17];
      if (v6[v17 + 9] != v16[v17 + 9])
        break;
      v23 = v17 + 2;
      v17 += 8;
      if (v23 > 0xF9 || v21[10] != v22[10])
      {
        v24 = (_DWORD)v6 + v17 + 2;
        goto LABEL_29;
      }
    }
    v24 = (_DWORD)v21 + 9;
LABEL_29:
    v25 = v24 - ((_DWORD)v6 + 258);
    v26 = v24 - (_DWORD)v6;
    if (v26 <= (int)v3)
      goto LABEL_32;
    *(_DWORD *)(a1 + 176) = a2;
    if (v26 >= (int)v15)
      break;
    v13 = v6[v25 + 257];
    v14 = v6[v26];
    LODWORD(v3) = v26;
LABEL_32:
    a2 = *(unsigned __int16 *)(v10 + 2 * (a2 & v11));
    --v2;
    if (v9 >= a2 || v2 == 0)
      goto LABEL_37;
  }
  LODWORD(v3) = v26;
LABEL_37:
  if (v3 >= v12)
    return v12;
  else
    return v3;
}

void sub_22D255BE0(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  int32x2_t v4;
  unsigned int v5;
  unsigned int v6;
  int32x2_t v7;
  uint64_t v8;
  uint64_t v9;
  _WORD *v10;
  unsigned int v11;
  BOOL v12;
  __int16 v13;
  _WORD *v14;
  int v15;
  unsigned int v16;
  __int16 v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  size_t v29;
  size_t v30;
  unint64_t v31;

  v2 = *(unsigned int *)(a1 + 80);
  v3 = *(_DWORD *)(a1 + 180);
  v4 = vdup_n_s32(v2);
  do
  {
    v5 = *(_DWORD *)(a1 + 172);
    v6 = *(_DWORD *)(a1 + 104) - (v3 + v5);
    if (v5 >= (int)v2 - 262 + *(_DWORD *)(a1 + 80))
    {
      memcpy(*(void **)(a1 + 96), (const void *)(*(_QWORD *)(a1 + 96) + v2), v2 - v6);
      v7 = vsub_s32(*(int32x2_t *)(a1 + 172), v4);
      *(int32x2_t *)(a1 + 172) = v7;
      *(_QWORD *)(a1 + 152) -= v2;
      v5 = v7.i32[0];
      if (*(_DWORD *)(a1 + 5932) > v7.i32[0])
        *(_DWORD *)(a1 + 5932) = v7.i32[0];
      v8 = *(unsigned int *)(a1 + 80);
      v9 = *(unsigned int *)(a1 + 132);
      v10 = (_WORD *)(*(_QWORD *)(a1 + 120) + 2 * v9 - 2);
      do
      {
        v11 = (unsigned __int16)*v10;
        v12 = v11 >= v8;
        v13 = v11 - v8;
        if (!v12)
          v13 = 0;
        *v10-- = v13;
        LODWORD(v9) = v9 - 1;
      }
      while ((_DWORD)v9);
      v14 = (_WORD *)(*(_QWORD *)(a1 + 112) + 2 * v8 - 2);
      v15 = v8;
      do
      {
        v16 = (unsigned __int16)*v14;
        v12 = v16 >= v8;
        v17 = v16 - v8;
        if (!v12)
          v17 = 0;
        *v14-- = v17;
        --v15;
      }
      while (v15);
      v6 += v2;
    }
    if (!*(_DWORD *)(*(_QWORD *)a1 + 8))
      break;
    v3 = *(_DWORD *)(a1 + 180)
       + sub_22D255E1C(*(_QWORD *)a1, (void *)(*(_QWORD *)(a1 + 96) + v5 + *(unsigned int *)(a1 + 180)), v6);
    *(_DWORD *)(a1 + 180) = v3;
    v18 = *(_DWORD *)(a1 + 5932);
    if (v18 + v3 >= 3)
    {
      v19 = *(_DWORD *)(a1 + 172) - v18;
      v20 = *(_QWORD *)(a1 + 96);
      v21 = *(unsigned __int8 *)(v20 + v19);
      *(_DWORD *)(a1 + 128) = v21;
      v23 = *(_DWORD *)(a1 + 140);
      v22 = *(_DWORD *)(a1 + 144);
      v24 = ((v21 << v22) ^ *(unsigned __int8 *)(v20 + v19 + 1)) & v23;
      *(_DWORD *)(a1 + 128) = v24;
      do
      {
        if (!v18)
          break;
        v24 = ((v24 << v22) ^ *(unsigned __int8 *)(v20 + v19 + 2)) & v23;
        v25 = *(_QWORD *)(a1 + 120);
        *(_WORD *)(*(_QWORD *)(a1 + 112) + 2 * (*(_DWORD *)(a1 + 88) & v19)) = *(_WORD *)(v25 + 2 * v24);
        *(_WORD *)(v25 + 2 * v24) = v19;
        *(_DWORD *)(a1 + 128) = v24;
        ++v19;
        *(_DWORD *)(a1 + 5932) = --v18;
      }
      while (v3 + v18 > 2);
    }
  }
  while (v3 <= 0x105 && *(_DWORD *)(*(_QWORD *)a1 + 8));
  v26 = *(_QWORD *)(a1 + 5944);
  v27 = *(_QWORD *)(a1 + 104);
  if (v27 > v26)
  {
    v28 = *(unsigned int *)(a1 + 180) + (unint64_t)*(unsigned int *)(a1 + 172);
    if (v26 >= v28)
    {
      if (v28 + 258 <= v26)
        return;
      if (v28 + 258 - v26 >= v27 - v26)
        v31 = v27 - v26;
      else
        v31 = v28 + 258 - v26;
      bzero((void *)(*(_QWORD *)(a1 + 96) + v26), v31);
      v30 = *(_QWORD *)(a1 + 5944) + v31;
    }
    else
    {
      if (v27 - v28 >= 0x102)
        v29 = 258;
      else
        v29 = v27 - v28;
      bzero((void *)(*(_QWORD *)(a1 + 96) + v28), v29);
      v30 = v29 + v28;
    }
    *(_QWORD *)(a1 + 5944) = v30;
  }
}

size_t sub_22D255E1C(uint64_t a1, void *__dst, unsigned int a3)
{
  unsigned int v3;
  size_t v4;
  int v7;
  uLong v8;

  v3 = *(_DWORD *)(a1 + 8);
  if (v3 >= a3)
    v4 = a3;
  else
    v4 = v3;
  if ((_DWORD)v4)
  {
    *(_DWORD *)(a1 + 8) = v3 - v4;
    memcpy(__dst, *(const void **)a1, v4);
    v7 = *(_DWORD *)(*(_QWORD *)(a1 + 56) + 48);
    if (v7 == 2)
    {
      v8 = crc32(*(_QWORD *)(a1 + 96), (const Bytef *)__dst, v4);
    }
    else
    {
      if (v7 != 1)
      {
LABEL_10:
        *(_QWORD *)a1 += v4;
        *(_QWORD *)(a1 + 16) += v4;
        return v4;
      }
      v8 = adler32(*(_QWORD *)(a1 + 96), (const Bytef *)__dst, v4);
    }
    *(_QWORD *)(a1 + 96) = v8;
    goto LABEL_10;
  }
  return v4;
}

int uncompress2(Bytef *dest, uLongf *destLen, const Bytef *source, uLong *sourceLen)
{
  uLong v6;
  uLongf v7;
  int v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  char v15;
  z_stream strm;

  v6 = *sourceLen;
  v7 = *destLen;
  if (*destLen)
  {
    *destLen = 0;
  }
  else
  {
    dest = (Bytef *)&v15;
    v7 = 1;
  }
  memset(&strm.avail_in, 0, 104);
  strm.next_in = (Bytef *)source;
  strm.avail_in = 0;
  v9 = inflateInit_(&strm, "1.2.12", 112);
  if (!v9)
  {
    strm.next_out = dest;
    strm.avail_out = 0;
LABEL_7:
    if (v7 >= 0xFFFFFFFF)
      v11 = 0xFFFFFFFFLL;
    else
      v11 = v7;
    strm.avail_out = v11;
    v7 -= v11;
    while (1)
    {
      if (!strm.avail_in)
      {
        if (v6 >= 0xFFFFFFFF)
          v12 = 0xFFFFFFFFLL;
        else
          v12 = v6;
        strm.avail_in = v12;
        v6 -= v12;
      }
      v13 = inflate(&strm, 0);
      if (v13)
        break;
      if (!strm.avail_out)
        goto LABEL_7;
    }
    v9 = v13;
    *sourceLen -= v6 + strm.avail_in;
    if (dest == (Bytef *)&v15)
    {
      if (strm.total_out)
        v14 = v13 == -5;
      else
        v14 = 0;
      if (v14)
        v7 = 1;
    }
    else
    {
      *destLen = strm.total_out;
    }
    inflateEnd(&strm);
    switch(v9)
    {
      case 2:
        return -3;
      case 1:
        return 0;
      case -5:
        if (v7 + strm.avail_out)
          return -3;
        else
          return -5;
    }
  }
  return v9;
}

int inflateEnd(z_streamp strm)
{
  int result;
  internal_state *state;

  if (sub_22D2585CC(strm))
    return -2;
  state = strm->state;
  if (*((_QWORD *)state + 9))
  {
    ((void (*)(voidpf, _QWORD))strm->zfree)(strm->opaque, *((_QWORD *)state + 9));
    state = strm->state;
  }
  ((void (*)(voidpf, internal_state *))strm->zfree)(strm->opaque, state);
  result = 0;
  strm->state = 0;
  return result;
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  int v4;
  uint64_t (*zalloc)(voidpf, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v4 = -6;
  if (version && stream_size == 112 && *version == 49)
  {
    if (strm)
    {
      strm->msg = 0;
      zalloc = (uint64_t (*)(voidpf, uint64_t, uint64_t))strm->zalloc;
      if (!zalloc)
      {
        zalloc = (uint64_t (*)(voidpf, uint64_t, uint64_t))sub_22D259FF0;
        strm->zalloc = (alloc_func)sub_22D259FF0;
        strm->opaque = 0;
      }
      if (!strm->zfree)
        strm->zfree = (free_func)sub_22D259FE8;
      v8 = zalloc(strm->opaque, 1, 7160);
      if (v8)
      {
        v9 = v8;
        strm->state = (internal_state *)v8;
        *(_QWORD *)v8 = strm;
        *(_QWORD *)(v8 + 72) = 0;
        *(_DWORD *)(v8 + 8) = 16180;
        v4 = inflateReset2(strm, windowBits);
        if (v4)
        {
          ((void (*)(voidpf, uint64_t))strm->zfree)(strm->opaque, v9);
          strm->state = 0;
        }
      }
      else
      {
        return -4;
      }
    }
    else
    {
      return -2;
    }
  }
  return v4;
}

int inflateResetKeep(z_streamp a1)
{
  int result;
  internal_state *state;
  int v4;

  if (sub_22D2585CC(a1))
    return -2;
  state = a1->state;
  *((_QWORD *)state + 5) = 0;
  a1->total_in = 0;
  a1->total_out = 0;
  a1->msg = 0;
  v4 = *((_DWORD *)state + 4);
  if (v4)
    a1->adler = v4 & 1;
  result = 0;
  *((_QWORD *)state + 1) = 16180;
  *(_QWORD *)((char *)state + 20) = 0xFFFFFFFF00000000;
  *((_DWORD *)state + 7) = 0x8000;
  *((_QWORD *)state + 18) = (char *)state + 1368;
  *((_QWORD *)state + 13) = (char *)state + 1368;
  *((_QWORD *)state + 14) = (char *)state + 1368;
  *((_QWORD *)state + 6) = 0;
  *((_QWORD *)state + 10) = 0;
  *((_DWORD *)state + 22) = 0;
  *((_QWORD *)state + 893) = 0xFFFFFFFF00000001;
  return result;
}

int inflateReset2(z_streamp strm, int windowBits)
{
  internal_state *state;
  unsigned int v6;
  int v7;
  BOOL v8;
  int v9;
  unsigned int v10;

  if (sub_22D2585CC(strm))
    return -2;
  state = strm->state;
  v6 = (windowBits >> 4) + 5;
  v7 = windowBits & 0xF;
  if (windowBits >= 0x30)
    v7 = windowBits;
  v8 = windowBits >= 0;
  v9 = windowBits < 0 ? -windowBits : v7;
  v10 = v8 ? v6 : 0;
  if ((v9 - 8) >= 8 && v9)
    return -2;
  if (*((_QWORD *)state + 9))
  {
    if (*((_DWORD *)state + 14) != v9)
    {
      ((void (*)(voidpf))strm->zfree)(strm->opaque);
      *((_QWORD *)state + 9) = 0;
    }
  }
  *((_DWORD *)state + 4) = v10;
  *((_DWORD *)state + 14) = v9;
  return inflateReset(strm);
}

int inflateReset(z_streamp strm)
{
  internal_state *state;

  if (sub_22D2585CC(strm))
    return -2;
  state = strm->state;
  *((_QWORD *)state + 8) = 0;
  *((_DWORD *)state + 15) = 0;
  return inflateResetKeep(strm);
}

uint64_t sub_22D256300(int a1, uint64_t a2, unsigned int a3, char **a4, unsigned int *a5, _WORD *a6, unsigned int a7)
{
  int16x8_t v7;
  uint64_t v8;
  int16x8_t v9;
  unsigned __int16 *v10;
  unint64_t v11;
  __int8 *v12;
  uint64_t v13;
  unsigned int v14;
  char *v15;
  char *v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  uint64_t i;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  _WORD *v33;
  int v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  char *v38;
  int v39;
  unsigned int v40;
  unint64_t v41;
  unint64_t v42;
  unsigned int v43;
  char v44;
  BOOL v45;
  char v46;
  int v47;
  char *v48;
  unsigned int v49;
  unsigned int v50;
  __int16 v51;
  unsigned int v52;
  int v53;
  unsigned int v54;
  unsigned int v55;
  char v56;
  unsigned int v57;
  int v58;
  unsigned int v59;
  char v60;
  char *v61;
  uint64_t v62;
  char *v63;
  unsigned int *v64;
  char v65;
  unsigned int v68;
  int v69;
  unsigned int v70;
  unsigned int v71;
  uint64_t v72;
  _WORD *v73;
  int v74;
  _WORD *v75;
  _WORD *v76;
  int16x8_t v77;
  int16x8_t v78;
  int16x8_t v79;
  int16x8_t v80;
  _OWORD v81[2];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v7 = 0uLL;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  if (a3 >= 2)
  {
    v8 = 0;
    do
    {
      v10 = (unsigned __int16 *)(a2 + 2 * v8);
      v11 = v8 + 4;
      v8 += 2;
      ++v77.i16[*v10];
      v12 = &v77.i8[2 * v10[1]];
      ++*((_WORD *)v12 + 16);
    }
    while (v11 <= a3);
    v7 = vaddq_s16(v79, v77);
    v9 = vaddq_s16(v80, v78);
  }
  else
  {
    LODWORD(v8) = 0;
    v9 = 0uLL;
  }
  v81[0] = v7;
  v81[1] = v9;
  if (v8 < a3)
  {
    v13 = *(unsigned __int16 *)(a2 + 2 * v8);
    ++*((_WORD *)v81 + v13);
  }
  v14 = 15;
  while (!*((_WORD *)v81 + v14))
  {
    if (!--v14)
    {
      v15 = *a4;
      *a4 += 4;
      *(_WORD *)v15 = 16385;
      *((_WORD *)v15 + 1) = 0;
      v16 = *a4;
      *a4 += 4;
      *(_WORD *)v16 = 16385;
      *((_WORD *)v16 + 1) = 0;
      v17 = 1;
LABEL_12:
      v18 = 0;
      *a5 = v17;
      return v18;
    }
  }
  if (*a5 >= v14)
    v19 = v14;
  else
    v19 = *a5;
  if (v14 < 2)
  {
    LODWORD(v20) = 1;
  }
  else
  {
    v20 = 1;
    while (!*((_WORD *)v81 + v20))
    {
      if (v14 == ++v20)
      {
        LODWORD(v20) = v14;
        break;
      }
    }
  }
  if (v19 <= v20)
    v17 = v20;
  else
    v17 = v19;
  v21 = 1;
  for (i = 2; i != 32; i += 2)
  {
    v21 = 2 * v21 - *(unsigned __int16 *)((char *)v81 + i);
    if (v21 < 0)
      return 0xFFFFFFFFLL;
  }
  if (!v21 || (v18 = 0xFFFFFFFFLL, a1) && v14 == 1)
  {
    v23 = 0;
    v24 = 0;
    v77.i16[1] = 0;
    do
    {
      v24 += *(unsigned __int16 *)((char *)v81 + v23 * 2 + 2);
      v77.i16[v23 + 2] = v24;
      ++v23;
    }
    while (v23 != 14);
    if (a3 >= 2)
    {
      v25 = 0;
      do
      {
        v27 = *(unsigned __int16 *)(a2 + 2 * v25);
        if (*(_WORD *)(a2 + 2 * v25))
        {
          v28 = v77.u16[v27];
          v77.i16[v27] = v28 + 1;
          a6[v28] = v25;
        }
        v29 = *(unsigned __int16 *)(a2 + 2 * v25 + 2);
        if (*(_WORD *)(a2 + 2 * v25 + 2))
        {
          v30 = v77.u16[v29];
          v77.i16[v29] = v30 + 1;
          a6[v30] = v25 | 1;
        }
        v25 += 2;
      }
      while (v25 + 2 <= (unint64_t)a3);
    }
    else
    {
      LODWORD(v25) = 0;
    }
    if (v25 < a3 && *(_WORD *)(a2 + 2 * v25))
      a6[v77.u16[*(unsigned __int16 *)(a2 + 2 * v25)]] = v25;
    if (a1 == 1)
    {
      v32 = 257;
      v76 = &unk_22D261EA2;
      v33 = &unk_22D261E64;
    }
    else
    {
      if (!a1)
      {
        v64 = a5;
        LOBYTE(v18) = 0;
        v31 = 1 << v17;
        v32 = 20;
        v75 = a6;
        v76 = a6;
LABEL_53:
        v65 = v18;
        v34 = 0;
        v35 = 0;
        v36 = 0;
        v68 = v31;
        v37 = v31 - 1;
        v38 = *a4;
        v39 = -1;
        v40 = v17;
        v72 = a2;
        v73 = a6;
        v70 = v32;
        v71 = v17;
        v69 = v37;
LABEL_54:
        v41 = v40;
        v74 = v39;
        while (1)
        {
          v42 = v20 - v35;
          v43 = (unsigned __int16)a6[v34];
          if (v43 + 1 < v32)
            break;
          v45 = v43 >= v32;
          v43 -= v32;
          if (!v45)
          {
            LOWORD(v43) = 0;
            v44 = 96;
            goto LABEL_59;
          }
          v47 = (unsigned __int16)v76[v43];
          v44 = v76[v43];
          LOWORD(v43) = v75[v43];
          v46 = (v47 & (v47 << 27 >> 31) & 0xF) + v20 - v35;
LABEL_61:
          v48 = &v38[4 * (v36 >> v35)];
          *v48 = v46;
          v48[1] = v44;
          *((_WORD *)v48 + 1) = v43;
          v49 = 1 << (v20 - 1);
          do
          {
            v50 = v49;
            v49 >>= 1;
          }
          while ((v50 & v36) != 0);
          if (v50)
            v36 = ((v50 - 1) & v36) + v50;
          else
            v36 = 0;
          ++v34;
          v51 = *((_WORD *)v81 + v20) - 1;
          *((_WORD *)v81 + v20) = v51;
          if (!v51)
          {
            if ((_DWORD)v20 == v14)
            {
              if (v36)
              {
                v63 = &v38[4 * v36];
                *v63 = v42;
                v63[1] = 64;
                *((_WORD *)v63 + 1) = 0;
              }
              *a4 += 4 * v68;
              a5 = v64;
              goto LABEL_12;
            }
            v52 = *(unsigned __int16 *)(a2 + 2 * (unsigned __int16)a6[v34]);
            if (v20 < v52)
            {
              do
              {
                if (v42 >= v41)
                  break;
                memcpy(&v38[4 * (1 << v42)], v38, 4 << v42);
                ++v42;
              }
              while (v52 - v35 != v42);
              LODWORD(v20) = v52;
              a2 = v72;
              a6 = v73;
              v32 = v70;
              v17 = v71;
              v37 = v69;
              v39 = v74;
            }
          }
          if (v20 > v17 && (v36 & v37) != v39)
          {
            if (!v35)
              v35 = v17;
            v40 = v20 - v35;
            v53 = 1 << (v20 - v35);
            if (v20 >= v14)
            {
              v56 = v65;
              v55 = a7;
              v57 = v68;
            }
            else
            {
              v40 = v14 - v35;
              v54 = v20;
              v56 = v65;
              v55 = a7;
              v57 = v68;
              while (1)
              {
                v58 = v53 - *((unsigned __int16 *)v81 + v54);
                if (v58 < 1)
                  break;
                v53 = 2 * v58;
                if (++v54 >= v14)
                  goto LABEL_83;
              }
              v40 = v54 - v35;
LABEL_83:
              v53 = 1 << v40;
            }
            v59 = v53 + v57;
            if (v59 > v55)
              v60 = v56;
            else
              v60 = 0;
            if ((v60 & 1) == 0)
            {
              v68 = v59;
              v38 += 4 * (1 << v41);
              v61 = *a4;
              v62 = (uint64_t)&(*a4)[4 * (v36 & v37)];
              *(_BYTE *)(v62 + 1) = v40;
              *(_BYTE *)v62 = v17;
              *(_WORD *)(v62 + 2) = ((_DWORD)v38 - (_DWORD)v61) >> 2;
              v39 = v36 & v37;
              goto LABEL_54;
            }
            return 1;
          }
        }
        v44 = 0;
LABEL_59:
        v46 = v20 - v35;
        goto LABEL_61;
      }
      v32 = 0;
      v76 = &unk_22D261F20;
      v33 = &unk_22D261EE0;
    }
    v75 = v33;
    v18 = 1;
    v31 = 1 << v17;
    if (1 << v17 > a7)
      return v18;
    v64 = a5;
    goto LABEL_53;
  }
  return v18;
}

uint64_t sub_22D25684C(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  size_t v12;
  size_t v13;
  int v14;
  int v15;
  unsigned int v16;
  unsigned int v17;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(char **)(v6 + 72);
  if (v7
    || (v8 = 1,
        v7 = (char *)(*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(a1 + 64))(*(_QWORD *)(a1 + 80), (1 << *(_DWORD *)(v6 + 56)), 1), (*(_QWORD *)(v6 + 72) = v7) != 0))
  {
    v9 = *(_DWORD *)(v6 + 60);
    if (!v9)
    {
      v9 = 1 << *(_DWORD *)(v6 + 56);
      *(_QWORD *)(v6 + 64) = 0;
      *(_DWORD *)(v6 + 60) = v9;
    }
    if (v9 <= a3)
    {
      memcpy(v7, (const void *)(a2 - v9), v9);
      v8 = 0;
      v14 = *(_DWORD *)(v6 + 60);
      *(_DWORD *)(v6 + 68) = 0;
      goto LABEL_16;
    }
    v10 = *(unsigned int *)(v6 + 68);
    v11 = v9 - v10;
    if (v9 - v10 >= a3)
      v12 = a3;
    else
      v12 = v11;
    memcpy(&v7[v10], (const void *)(a2 - a3), v12);
    if (v11 < a3)
    {
      v13 = a3 - v12;
      memcpy(*(void **)(v6 + 72), (const void *)(a2 - v13), v13);
      v8 = 0;
      v14 = *(_DWORD *)(v6 + 60);
      *(_DWORD *)(v6 + 68) = v13;
LABEL_16:
      *(_DWORD *)(v6 + 64) = v14;
      return v8;
    }
    v8 = 0;
    v15 = *(_DWORD *)(v6 + 68) + v12;
    v17 = *(_DWORD *)(v6 + 60);
    v16 = *(_DWORD *)(v6 + 64);
    if (v15 == v17)
      v15 = 0;
    *(_DWORD *)(v6 + 68) = v15;
    if (v16 < v17)
    {
      v8 = 0;
      v14 = v16 + v12;
      goto LABEL_16;
    }
  }
  return v8;
}

int inflate(z_streamp strm, int flush)
{
  unint64_t v2;
  z_streamp v3;
  int result;
  Bytef *next_out;
  Bytef *next_in;
  internal_state *state;
  int v8;
  unint64_t avail_out;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  uLong v19;
  uLong v20;
  uint64_t v21;
  unsigned int v22;
  const char *v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  unsigned int v27;
  uLong v28;
  unint64_t v29;
  int v30;
  uLong v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unsigned int v41;
  uint64_t v42;
  unint64_t v43;
  int v44;
  unsigned int v45;
  unsigned int v46;
  Bytef *v47;
  unint64_t v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  int v52;
  unsigned int v53;
  uint64_t v54;
  int v55;
  unint64_t v56;
  uLong v57;
  const Bytef *v58;
  uLong v59;
  unsigned int v60;
  size_t v61;
  int v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unsigned int v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  unsigned __int8 v70;
  uint64_t v71;
  Bytef *v72;
  unint64_t v73;
  unsigned int v74;
  int v75;
  unsigned int v76;
  char *v77;
  unint64_t v78;
  uint64_t v79;
  unsigned int v80;
  __int16 v81;
  unint64_t v82;
  int v83;
  unint64_t v84;
  unsigned int v85;
  unint64_t v86;
  unsigned int v87;
  unint64_t v88;
  char *v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  char *v93;
  char v94;
  int v95;
  unsigned __int8 v96;
  uint64_t v97;
  int v98;
  Bytef *v99;
  unint64_t v100;
  unsigned int v101;
  char *v102;
  char v103;
  unsigned __int8 v104;
  int v105;
  int v106;
  int v107;
  uint64_t v108;
  char *v109;
  char v110;
  unsigned __int8 v111;
  uint64_t v112;
  int v113;
  Bytef *v114;
  unint64_t v115;
  unsigned int v116;
  char *v117;
  char v118;
  int v119;
  uint64_t v120;
  int v121;
  uint64_t v122;
  char v123;
  uint64_t v124;
  unsigned __int8 v125;
  uint64_t v126;
  int v127;
  Bytef *v128;
  unint64_t v129;
  unsigned int v130;
  char v131;
  unsigned __int8 v132;
  int v133;
  int v134;
  int v135;
  uint64_t v136;
  char v137;
  unsigned __int8 v138;
  uint64_t v139;
  int v140;
  Bytef *v141;
  unint64_t v142;
  unsigned int v143;
  char v144;
  int v145;
  Bytef *v146;
  unint64_t v147;
  unsigned int v148;
  unsigned int v149;
  uint64_t v150;
  unsigned int v151;
  Bytef *v152;
  unsigned int v153;
  unsigned int v154;
  unsigned int v155;
  unsigned int v156;
  unsigned int v157;
  Bytef v158;
  uint64_t v159;
  unsigned int *v160;
  unsigned int v161;
  uint64_t v162;
  unsigned int v163;
  uint64_t v164;
  uint64_t v165;
  unint64_t v166;
  unsigned int v167;
  uint64_t v168;
  uLong v169;
  int v170;
  unsigned int v171;
  uInt v172;
  uint64_t v173;
  uint64_t v174;
  unsigned int v175;
  int v176;
  unsigned int v177;
  size_t v178;
  unint64_t v179;
  unint64_t v180;
  uLong v181;
  uint64_t v182;
  int v183;
  unint64_t v184;
  int v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  BOOL v189;
  uLong v190;
  uint64_t v191;
  int v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  BOOL v196;
  uLong v197;
  unsigned int v198;
  unsigned int v199;
  uint64_t v200;
  uLong v201;
  unint64_t v202;
  uint64_t v203;
  unsigned int v204;
  unsigned int v205;
  unsigned int v206;
  unsigned int v207;
  uLong v208;
  int v209;
  unsigned int v210;
  uint64_t v211;
  uLong v212;
  const Bytef *v213;
  uLong v214;
  int v215;
  int v217;
  unint64_t v221;
  unint64_t v222;
  unsigned int v223;
  char *v224;
  unsigned int v225;
  z_stream *v226;
  unsigned int v227;
  unsigned int v228;
  unsigned int v229;
  unsigned int v230;
  uInt avail_in;
  int v232;
  Bytef buf[4];

  v2 = *(_QWORD *)&flush;
  v3 = strm;
  if (sub_22D2585CC(strm))
    return -2;
  next_out = v3->next_out;
  if (!next_out)
    return -2;
  next_in = v3->next_in;
  if (!v3->next_in)
  {
    if (v3->avail_in)
      return -2;
  }
  state = v3->state;
  v8 = *((_DWORD *)state + 2);
  if (v8 == 16191)
  {
    v8 = 16192;
    *((_DWORD *)state + 2) = 16192;
  }
  v232 = 0;
  avail_out = v3->avail_out;
  v10 = *((_QWORD *)state + 10);
  v224 = (char *)state + 1368;
  v11 = *((unsigned int *)state + 22);
  v230 = v2 - 5;
  avail_in = v3->avail_in;
  v12 = avail_out;
  v13 = avail_in;
  while (2)
  {
    v14 = -3;
    v15 = 1;
    switch(v8)
    {
      case 16180:
        v16 = *((_DWORD *)state + 4);
        if (!v16)
        {
          v32 = 16192;
          goto LABEL_375;
        }
        if (v11 <= 0xF)
        {
          v17 = 0;
          do
          {
            if (!(_DWORD)v13)
              goto LABEL_382;
            v13 = (v13 - 1);
            v18 = *next_in++;
            v10 += (unint64_t)v18 << (v11 + v17);
            v17 += 8;
          }
          while ((unint64_t)v11 + v17 - 8 < 8);
          v11 = (v11 + v17);
        }
        if ((v16 & 2) != 0 && v10 == 35615)
        {
          if (!*((_DWORD *)state + 14))
            *((_DWORD *)state + 14) = 15;
          v19 = crc32(0, 0, 0);
          *((_QWORD *)state + 4) = v19;
          *(_WORD *)buf = -29921;
          v20 = crc32(v19, buf, 2u);
          v10 = 0;
          v11 = 0;
          *((_QWORD *)state + 4) = v20;
          *((_DWORD *)state + 2) = 16181;
          goto LABEL_376;
        }
        v159 = *((_QWORD *)state + 6);
        if (v159)
          *(_DWORD *)(v159 + 72) = -1;
        if ((v16 & 1) == 0
          || 0xEF7BDEF7BDEF7BDFLL * (((unint64_t)v10 << 8) + (v10 >> 8)) >= 0x842108421084211)
        {
          v23 = "incorrect header check";
          goto LABEL_374;
        }
        if ((v10 & 0xF) != 8)
          goto LABEL_373;
        v205 = v10 >> 4;
        v206 = v205 + 8;
        v207 = *((_DWORD *)state + 14);
        if (!v207)
        {
          *((_DWORD *)state + 14) = v206;
          v207 = v205 + 8;
        }
        if (v205 > 7 || v206 > v207)
        {
          v10 >>= 4;
          v11 = (v11 - 4);
          v23 = "invalid window size";
          goto LABEL_374;
        }
        *((_DWORD *)state + 6) = 0;
        *((_DWORD *)state + 7) = 256 << v205;
        v208 = adler32(0, 0, 0);
        v11 = 0;
        *((_QWORD *)state + 4) = v208;
        v3->adler = v208;
        if ((v10 & 0x2000) != 0)
          v209 = 16189;
        else
          v209 = 16191;
        *((_DWORD *)state + 2) = v209;
        v10 = 0;
        goto LABEL_376;
      case 16181:
        if (v11 > 0xF)
          goto LABEL_25;
        v21 = 0;
        do
        {
          if (!(_DWORD)v13)
          {
            LODWORD(v11) = v11 + v21;
            goto LABEL_383;
          }
          v13 = (v13 - 1);
          v22 = *next_in++;
          v10 += (unint64_t)v22 << (v11 + v21);
          v21 += 8;
        }
        while ((unint64_t)v11 + v21 - 8 < 8);
        v11 = (v11 + v21);
LABEL_25:
        *((_DWORD *)state + 6) = v10;
        if (v10 != 8)
        {
LABEL_373:
          v23 = "unknown compression method";
          goto LABEL_374;
        }
        if ((v10 & 0xE000) != 0)
        {
          v23 = "unknown header flags set";
          goto LABEL_374;
        }
        v225 = v2;
        v2 = v12;
        v160 = (unsigned int *)*((_QWORD *)state + 6);
        if (v160)
          *v160 = (v10 >> 8) & 1;
        v12 = avail_out;
        if ((v10 & 0x200) != 0 && (*((_BYTE *)state + 16) & 4) != 0)
        {
          *(_WORD *)buf = v10;
          *((_QWORD *)state + 4) = crc32(*((_QWORD *)state + 4), buf, 2u);
        }
        LODWORD(v11) = 0;
        v10 = 0;
        *((_DWORD *)state + 2) = 16182;
LABEL_237:
        avail_out = v11;
        do
        {
          if (!(_DWORD)v13)
            goto LABEL_384;
          v161 = *next_in++;
          LODWORD(v13) = v13 - 1;
          v10 += (unint64_t)v161 << avail_out;
          v189 = avail_out >= 0x18;
          avail_out += 8;
        }
        while (!v189);
LABEL_241:
        v162 = *((_QWORD *)state + 6);
        if (v162)
          *(_QWORD *)(v162 + 8) = v10;
        if ((*((_BYTE *)state + 25) & 2) != 0 && (*((_BYTE *)state + 16) & 4) != 0)
        {
          *(_DWORD *)buf = v10;
          *((_QWORD *)state + 4) = crc32(*((_QWORD *)state + 4), buf, 4u);
        }
        LODWORD(v11) = 0;
        v10 = 0;
        *((_DWORD *)state + 2) = 16183;
LABEL_247:
        avail_out = v11;
        do
        {
          if (!(_DWORD)v13)
            goto LABEL_384;
          v163 = *next_in++;
          v13 = (v13 - 1);
          v10 += (unint64_t)v163 << avail_out;
          v189 = avail_out >= 8;
          avail_out += 8;
        }
        while (!v189);
LABEL_251:
        v164 = *((_QWORD *)state + 6);
        if (v164)
        {
          *(_DWORD *)(v164 + 16) = v10;
          *(_DWORD *)(v164 + 20) = v10 >> 8;
        }
        if ((*((_BYTE *)state + 25) & 2) != 0 && (*((_BYTE *)state + 16) & 4) != 0)
        {
          *(_WORD *)buf = v10;
          *((_QWORD *)state + 4) = crc32(*((_QWORD *)state + 4), buf, 2u);
        }
        v10 = 0;
        LODWORD(v11) = 0;
        v25 = 0;
        *((_DWORD *)state + 2) = 16184;
        v24 = *((_DWORD *)state + 6);
        avail_out = v12;
        v12 = v2;
        v2 = v225;
        if ((v24 & 0x400) != 0)
        {
LABEL_259:
          v166 = avail_out;
          avail_out = v11;
          while ((_DWORD)v13)
          {
            v167 = *next_in++;
            v13 = (v13 - 1);
            v10 += (unint64_t)v167 << avail_out;
            v189 = avail_out >= 8;
            avail_out += 8;
            if (v189)
            {
              avail_out = v166;
              goto LABEL_264;
            }
          }
          LODWORD(v11) = avail_out;
          v15 = v232;
          LODWORD(avail_out) = v166;
          goto LABEL_396;
        }
LABEL_257:
        v165 = *((_QWORD *)state + 6);
        if (v165)
          *(_QWORD *)(v165 + 24) = 0;
LABEL_270:
        *((_DWORD *)state + 2) = 16185;
        v11 = v25;
LABEL_271:
        v170 = *((_DWORD *)state + 6);
        if ((v170 & 0x400) != 0)
        {
          v171 = *((_DWORD *)state + 23);
          if (v171 >= v13)
            v172 = v13;
          else
            v172 = *((_DWORD *)state + 23);
          if (v172)
          {
            v173 = *((_QWORD *)state + 6);
            if (v173)
            {
              v174 = *(_QWORD *)(v173 + 24);
              if (v174)
              {
                v176 = *(_DWORD *)(v173 + 32);
                v175 = *(_DWORD *)(v173 + 36);
                v177 = v176 - v171;
                if (v175 > v177)
                {
                  if (v177 + v172 <= v175)
                    v178 = v172;
                  else
                    v178 = v175 - v177;
                  v227 = v12;
                  v179 = v11;
                  memcpy((void *)(v174 + v177), next_in, v178);
                  v11 = v179;
                  v12 = v227;
                  v170 = *((_DWORD *)state + 6);
                }
              }
            }
            if ((v170 & 0x200) != 0 && (*((_BYTE *)state + 16) & 4) != 0)
            {
              v228 = v12;
              v180 = v11;
              v181 = crc32(*((_QWORD *)state + 4), next_in, v172);
              v11 = v180;
              v12 = v228;
              *((_QWORD *)state + 4) = v181;
            }
            v13 = v13 - v172;
            next_in += v172;
            v171 = *((_DWORD *)state + 23) - v172;
            *((_DWORD *)state + 23) = v171;
          }
          if (v171)
            goto LABEL_383;
        }
        *((_DWORD *)state + 23) = 0;
        *((_DWORD *)state + 2) = 16186;
LABEL_289:
        if ((*((_BYTE *)state + 25) & 8) == 0)
        {
          v182 = *((_QWORD *)state + 6);
          if (v182)
            *(_QWORD *)(v182 + 40) = 0;
          goto LABEL_308;
        }
        if (!(_DWORD)v13)
          goto LABEL_383;
        v229 = v12;
        v223 = avail_out;
        v183 = v2;
        v184 = 0;
        do
        {
          v185 = next_in[v184];
          v186 = *((_QWORD *)state + 6);
          if (v186)
          {
            v187 = *(_QWORD *)(v186 + 40);
            if (v187)
            {
              v188 = *((unsigned int *)state + 23);
              if (v188 < *(_DWORD *)(v186 + 48))
              {
                *((_DWORD *)state + 23) = v188 + 1;
                *(_BYTE *)(v187 + v188) = v185;
              }
            }
          }
          ++v184;
          if (v185)
            v189 = v184 >= v13;
          else
            v189 = 1;
        }
        while (!v189);
        if ((*((_BYTE *)state + 25) & 2) != 0 && (*((_BYTE *)state + 16) & 4) != 0)
        {
          v221 = v11;
          v190 = crc32(*((_QWORD *)state + 4), next_in, v184);
          v11 = v221;
          *((_QWORD *)state + 4) = v190;
        }
        next_in += v184;
        if (v185)
          goto LABEL_390;
        v13 = v13 - v184;
        avail_out = v223;
        v12 = v229;
LABEL_308:
        *((_DWORD *)state + 23) = 0;
        *((_DWORD *)state + 2) = 16187;
LABEL_309:
        if ((*((_BYTE *)state + 25) & 0x10) == 0)
        {
          v191 = *((_QWORD *)state + 6);
          if (v191)
            *(_QWORD *)(v191 + 56) = 0;
          goto LABEL_328;
        }
        if (!(_DWORD)v13)
          goto LABEL_383;
        v229 = v12;
        v223 = avail_out;
        v183 = v2;
        v184 = 0;
        do
        {
          v192 = next_in[v184];
          v193 = *((_QWORD *)state + 6);
          if (v193)
          {
            v194 = *(_QWORD *)(v193 + 56);
            if (v194)
            {
              v195 = *((unsigned int *)state + 23);
              if (v195 < *(_DWORD *)(v193 + 64))
              {
                *((_DWORD *)state + 23) = v195 + 1;
                *(_BYTE *)(v194 + v195) = v192;
              }
            }
          }
          ++v184;
          if (v192)
            v196 = v184 >= v13;
          else
            v196 = 1;
        }
        while (!v196);
        if ((*((_BYTE *)state + 25) & 2) != 0 && (*((_BYTE *)state + 16) & 4) != 0)
        {
          v222 = v11;
          v197 = crc32(*((_QWORD *)state + 4), next_in, v184);
          v11 = v222;
          *((_QWORD *)state + 4) = v197;
        }
        next_in += v184;
        if (v192)
        {
LABEL_390:
          LODWORD(v13) = v13 - v184;
          v15 = v232;
          LODWORD(v2) = v183;
          LODWORD(avail_out) = v223;
          LODWORD(v12) = v229;
          goto LABEL_396;
        }
        v13 = v13 - v184;
        avail_out = v223;
        v12 = v229;
LABEL_328:
        *((_DWORD *)state + 2) = 16188;
LABEL_329:
        v198 = *((_DWORD *)state + 6);
        if ((v198 & 0x200) == 0)
        {
LABEL_338:
          v43 = v11;
          v200 = *((_QWORD *)state + 6);
          if (v200)
          {
            *(_DWORD *)(v200 + 68) = (v198 >> 9) & 1;
            *(_DWORD *)(v200 + 72) = 1;
          }
          v201 = crc32(0, 0, 0);
          *((_QWORD *)state + 4) = v201;
          v3->adler = v201;
          *((_DWORD *)state + 2) = 16191;
          goto LABEL_341;
        }
        if (v11 <= 0xF)
        {
          v17 = 0;
          do
          {
            if (!(_DWORD)v13)
              goto LABEL_382;
            v13 = (v13 - 1);
            v199 = *next_in++;
            v10 += (unint64_t)v199 << (v11 + v17);
            v17 += 8;
          }
          while ((unint64_t)v11 + v17 - 8 < 8);
          v11 = (v11 + v17);
        }
        if ((*((_BYTE *)state + 16) & 4) == 0 || v10 == *((unsigned __int16 *)state + 16))
        {
          v10 = 0;
          v11 = 0;
          goto LABEL_338;
        }
        v23 = "header crc mismatch";
LABEL_374:
        v3->msg = (char *)v23;
        v32 = 16209;
LABEL_375:
        *((_DWORD *)state + 2) = v32;
LABEL_376:
        v8 = *((_DWORD *)state + 2);
        continue;
      case 16182:
        v225 = v2;
        v2 = v12;
        v12 = avail_out;
        if (v11 > 0x1F)
          goto LABEL_241;
        goto LABEL_237;
      case 16183:
        v225 = v2;
        v2 = v12;
        v12 = avail_out;
        if (v11 > 0xF)
          goto LABEL_251;
        goto LABEL_247;
      case 16184:
        v24 = *((_DWORD *)state + 6);
        if ((v24 & 0x400) == 0)
        {
          v25 = v11;
          goto LABEL_257;
        }
        if (v11 <= 0xF)
          goto LABEL_259;
LABEL_264:
        *((_DWORD *)state + 23) = v10;
        v168 = *((_QWORD *)state + 6);
        if (v168)
          *(_DWORD *)(v168 + 32) = v10;
        if ((v24 & 0x200) != 0 && (*((_BYTE *)state + 16) & 4) != 0)
        {
          *(_WORD *)buf = v10;
          v169 = crc32(*((_QWORD *)state + 4), buf, 2u);
          v10 = 0;
          v25 = 0;
          *((_QWORD *)state + 4) = v169;
        }
        else
        {
          v10 = 0;
          v25 = 0;
        }
        goto LABEL_270;
      case 16185:
        goto LABEL_271;
      case 16186:
        goto LABEL_289;
      case 16187:
        goto LABEL_309;
      case 16188:
        goto LABEL_329;
      case 16189:
        v26 = avail_out;
        if (v11 > 0x1F)
          goto LABEL_39;
        avail_out = v11;
        do
        {
          if (!(_DWORD)v13)
          {
            LODWORD(v11) = avail_out;
            v15 = v232;
            LODWORD(avail_out) = v26;
            goto LABEL_396;
          }
          v27 = *next_in++;
          v13 = (v13 - 1);
          v10 += (unint64_t)v27 << avail_out;
          v189 = avail_out >= 0x18;
          avail_out += 8;
        }
        while (!v189);
LABEL_39:
        LODWORD(v11) = 0;
        v28 = bswap32(v10);
        *((_QWORD *)state + 4) = v28;
        v3->adler = v28;
        *((_DWORD *)state + 2) = 16190;
        v10 = 0;
        avail_out = v26;
LABEL_40:
        if (!*((_DWORD *)state + 5))
        {
          v3->next_out = next_out;
          v3->avail_out = avail_out;
          v3->next_in = next_in;
          v3->avail_in = v13;
          *((_QWORD *)state + 10) = v10;
          result = 2;
          *((_DWORD *)state + 22) = v11;
          return result;
        }
        v29 = v12;
        v30 = v11;
        v31 = adler32(0, 0, 0);
        LODWORD(v11) = v30;
        v12 = v29;
        *((_QWORD *)state + 4) = v31;
        v3->adler = v31;
        *((_DWORD *)state + 2) = 16191;
LABEL_42:
        if (v230 < 2)
          goto LABEL_383;
LABEL_43:
        if (*((_DWORD *)state + 3))
        {
          v10 >>= v11 & 7;
          v11 = v11 & 0xFFFFFFF8;
          v32 = 16206;
          goto LABEL_375;
        }
        if (v11 >= 3)
        {
LABEL_48:
          *((_DWORD *)state + 3) = v10 & 1;
          __asm { BR              X11 }
        }
        if ((_DWORD)v13)
        {
          v10 += (unint64_t)*next_in << v11;
          goto LABEL_48;
        }
        v14 = v232;
LABEL_395:
        v15 = v14;
        goto LABEL_396;
      case 16190:
        goto LABEL_40;
      case 16191:
        goto LABEL_42;
      case 16192:
        goto LABEL_43;
      case 16193:
        v10 >>= v11 & 7;
        v33 = v11 & 0xFFFFFFF8;
        if (v33 <= 0x1F)
        {
          v34 = 0;
          while ((_DWORD)v13)
          {
            v13 = (v13 - 1);
            v35 = *next_in++;
            v10 += (unint64_t)v35 << ((v11 & 0xF8u) + v34);
            v34 += 8;
            if ((unint64_t)(v33 + v34 - 8) >= 0x18)
            {
              v11 = (v33 + v34);
              goto LABEL_99;
            }
          }
          LODWORD(v11) = (v11 & 0xFFFFFFF8) + v34;
          goto LABEL_383;
        }
        v11 = v11 & 0xFFFFFFF8;
LABEL_99:
        if (((v10 >> 16) ^ 0xFFFF) != (unsigned __int16)v10)
        {
          v23 = "invalid stored block lengths";
          goto LABEL_374;
        }
        v11 = 0;
        *((_DWORD *)state + 23) = (unsigned __int16)v10;
        *((_DWORD *)state + 2) = 16194;
        v10 = 0;
        if ((_DWORD)v2 == 6)
          goto LABEL_383;
LABEL_101:
        *((_DWORD *)state + 2) = 16195;
LABEL_102:
        v60 = *((_DWORD *)state + 23);
        if (v60)
        {
          if (v60 >= v13)
            v60 = v13;
          if (v60 >= avail_out)
            v61 = avail_out;
          else
            v61 = v60;
          if ((_DWORD)v61)
          {
            v226 = v3;
            v62 = avail_out;
            v63 = v2;
            v64 = v12;
            v65 = v11;
            memcpy(next_out, next_in, v61);
            v11 = v65;
            v12 = v64;
            v2 = v63;
            LODWORD(v63) = v62;
            v3 = v226;
            v13 = (v13 - v61);
            next_in += v61;
            avail_out = (v63 - v61);
            next_out += v61;
            *((_DWORD *)state + 23) -= v61;
            goto LABEL_376;
          }
          goto LABEL_383;
        }
        goto LABEL_230;
      case 16194:
        goto LABEL_101;
      case 16195:
        goto LABEL_102;
      case 16196:
        if (v11 > 0xD)
          goto LABEL_59;
        v17 = 0;
        do
        {
          if (!(_DWORD)v13)
            goto LABEL_382;
          v13 = (v13 - 1);
          v36 = *next_in++;
          v10 += (unint64_t)v36 << (v11 + v17);
          v17 += 8;
        }
        while ((unint64_t)v11 + v17 - 8 < 6);
        LODWORD(v11) = v11 + v17;
LABEL_59:
        v37 = v10 & 0x1F;
        v38 = (v10 >> 5) & 0x1F;
        *((_DWORD *)state + 33) = (v10 & 0x1F) + 257;
        *((_DWORD *)state + 34) = v38 + 1;
        v39 = ((v10 >> 10) & 0xF) + 4;
        *((_DWORD *)state + 32) = v39;
        v10 >>= 14;
        v11 = (v11 - 14);
        if (v37 > 0x1D || v38 >= 0x1E)
        {
          v23 = "too many length or distance symbols";
          goto LABEL_374;
        }
        v225 = v2;
        v2 = v12;
        v12 = avail_out;
        v40 = 0;
        *((_DWORD *)state + 35) = 0;
        *((_DWORD *)state + 2) = 16197;
LABEL_63:
        LODWORD(avail_out) = v11;
        do
        {
          if (avail_out <= 2)
          {
            if (!(_DWORD)v13)
            {
LABEL_384:
              LODWORD(v11) = avail_out;
              v15 = v232;
              LODWORD(avail_out) = v12;
              LODWORD(v12) = v2;
              LODWORD(v2) = v225;
              goto LABEL_396;
            }
            v13 = (v13 - 1);
            v41 = *next_in++;
            v10 += (unint64_t)v41 << avail_out;
            LODWORD(avail_out) = avail_out + 8;
          }
          v42 = word_22D2615BE[v40];
          *((_DWORD *)state + 35) = v40 + 1;
          *((_WORD *)state + v42 + 76) = v10 & 7;
          v10 >>= 3;
          avail_out = (avail_out - 3);
          ++v40;
        }
        while (v39 != v40);
        v11 = avail_out;
        v40 = v39;
LABEL_69:
        v43 = v11;
        if (v40 <= 0x12)
        {
          do
            *((_WORD *)state + word_22D2615BE[v40++] + 76) = 0;
          while ((_DWORD)v40 != 19);
          *((_DWORD *)state + 35) = 19;
        }
        *((_QWORD *)state + 18) = v224;
        *((_QWORD *)state + 13) = v224;
        *((_DWORD *)state + 30) = 7;
        v44 = sub_22D256300(0, (uint64_t)state + 152, 0x13u, (char **)state + 18, (unsigned int *)state + 30, (_WORD *)state + 396, 0);
        avail_out = v12;
        if (v44)
        {
          v232 = v44;
          v3->msg = "invalid code lengths set";
          *((_DWORD *)state + 2) = 16209;
          v12 = v2;
          v2 = v225;
LABEL_341:
          v11 = v43;
          goto LABEL_376;
        }
        v45 = 0;
        v232 = 0;
        *((_DWORD *)state + 35) = 0;
        *((_DWORD *)state + 2) = 16198;
        v12 = v2;
        v2 = v225;
        v11 = v43;
LABEL_111:
        v66 = *((_DWORD *)state + 34) + *((_DWORD *)state + 33);
        if (v45 >= v66)
        {
LABEL_146:
          if (!*((_WORD *)state + 332))
          {
            v3->msg = "invalid code -- missing end-of-block";
            *((_DWORD *)state + 2) = 16209;
            goto LABEL_376;
          }
          v43 = v11;
          if (sub_22D259EA8((uint64_t)v3))
            goto LABEL_341;
          *((_DWORD *)state + 2) = 16199;
          LODWORD(v11) = v43;
          if ((_DWORD)v2 == 6)
            goto LABEL_383;
LABEL_149:
          *((_DWORD *)state + 2) = 16200;
LABEL_150:
          if (v13 >= 0x19 && avail_out >= 0x143)
          {
            v3->next_out = next_out;
            v3->avail_out = avail_out;
            v3->next_in = next_in;
            v3->avail_in = v13;
            *((_QWORD *)state + 10) = v10;
            *((_DWORD *)state + 22) = v11;
            sub_22D258614((uint64_t)v3, v12);
            next_out = v3->next_out;
            avail_out = v3->avail_out;
            next_in = v3->next_in;
            v13 = v3->avail_in;
            v10 = *((_QWORD *)state + 10);
            v11 = *((unsigned int *)state + 22);
            if (*((_DWORD *)state + 2) == 16191)
              *((_DWORD *)state + 1787) = -1;
            goto LABEL_376;
          }
          *((_DWORD *)state + 1787) = 0;
          v90 = *((_QWORD *)state + 13);
          v91 = -1 << *((_DWORD *)state + 30);
          v92 = v10 & ~v91;
          v93 = (char *)(v90 + 4 * v92);
          v94 = *v93;
          v95 = v93[1];
          v96 = v94 - (v95 & (v95 << 27 >> 31) & 0xF);
          if (v11 >= v96)
          {
            v105 = v96;
          }
          else
          {
            v97 = 0;
            v98 = ~v91;
            v99 = next_in;
            LODWORD(v100) = v13;
            do
            {
              if (!(_DWORD)v100)
                goto LABEL_381;
              v100 = (v100 - 1);
              v101 = *v99++;
              v10 += (unint64_t)v101 << (v11 + v97);
              v92 = v98 & v10;
              v102 = (char *)(v90 + 4 * v92);
              v103 = *v102;
              v95 = v102[1];
              v104 = v103 - (v95 & (v95 << 27 >> 31) & 0xF);
              v97 += 8;
            }
            while ((unint64_t)v11 + v97 < v104);
            v105 = v104;
            LODWORD(v11) = v11 + v97;
            v13 = v100;
            next_in = v99;
            v96 = v104;
          }
          v106 = *(unsigned __int16 *)(v90 + 4 * v92 + 2);
          if ((v95 - 1) > 0xE)
          {
            v105 = 0;
          }
          else
          {
            v107 = -1 << (v105 + v95);
            v108 = ((v10 & ~v107) >> v105) + v106;
            v109 = (char *)(v90 + 4 * v108);
            v110 = *v109;
            v95 = v109[1];
            v111 = v110 - (v95 & ((char)(8 * v95) >> 7) & 0xF);
            if (v105 + v111 > v11)
            {
              v112 = 0;
              v113 = ~v107;
              v114 = next_in;
              LODWORD(v115) = v13;
              do
              {
                if (!(_DWORD)v115)
                  goto LABEL_381;
                v116 = *v114++;
                v115 = (v115 - 1);
                v10 += (unint64_t)v116 << (v11 + v112);
                v108 = ((v10 & v113) >> v105) + v106;
                v117 = (char *)(v90 + 4 * v108);
                v118 = *v117;
                v95 = v117[1];
                v111 = v118 - (v95 & ((char)(8 * v95) >> 7) & 0xF);
                v112 += 8;
              }
              while ((unint64_t)v11 + v112 < v105 + v111);
              LODWORD(v11) = v11 + v112;
              v13 = v115;
              next_in = v114;
            }
            v106 = *(unsigned __int16 *)(v90 + 4 * v108 + 2);
            v10 >>= v96;
            LODWORD(v11) = v11 - v105;
            v96 = v111;
          }
          v10 >>= v96;
          v11 = v11 - v96;
          *((_DWORD *)state + 1787) = v105 + v96;
          *((_DWORD *)state + 23) = v106;
          if (!v95)
          {
            v32 = 16205;
            goto LABEL_375;
          }
          if ((v95 & 0x20) != 0)
          {
            *((_DWORD *)state + 1787) = -1;
LABEL_230:
            v32 = 16191;
            goto LABEL_375;
          }
          if ((v95 & 0x40) != 0)
          {
            v23 = "invalid literal/length code";
            goto LABEL_374;
          }
          v46 = v95 & 0xF;
          *((_DWORD *)state + 25) = v46;
          *((_DWORD *)state + 2) = 16201;
          if ((v95 & 0xF) != 0)
          {
LABEL_76:
            if (v11 < v46)
            {
              v47 = next_in;
              LODWORD(v48) = v13;
              v49 = v11;
              while ((_DWORD)v48)
              {
                v48 = (v48 - 1);
                v50 = *v47++;
                v10 += (unint64_t)v50 << v49;
                v49 += 8;
                if (v49 >= v46)
                  goto LABEL_178;
              }
              goto LABEL_381;
            }
            v49 = v11;
            v48 = v13;
            v47 = next_in;
LABEL_178:
            v119 = *((_DWORD *)state + 23) + (v10 & ~(-1 << v46));
            *((_DWORD *)state + 23) = v119;
            v10 >>= v46;
            LODWORD(v11) = v49 - v46;
            *((_DWORD *)state + 1787) += v46;
            v13 = v48;
            next_in = v47;
          }
          else
          {
LABEL_173:
            v119 = *((_DWORD *)state + 23);
          }
          *((_DWORD *)state + 1788) = v119;
          *((_DWORD *)state + 2) = 16202;
LABEL_180:
          v120 = *((_QWORD *)state + 14);
          v121 = -1 << *((_DWORD *)state + 31);
          v122 = v10 & ~v121;
          v124 = v120 + 4 * v122;
          v123 = *(_BYTE *)v124;
          LODWORD(v124) = *(unsigned __int8 *)(v124 + 1);
          v125 = v123 - (v124 & ((int)((_DWORD)v124 << 27) >> 31) & 0xF);
          if (v11 < v125)
          {
            v126 = 0;
            v127 = ~v121;
            v128 = next_in;
            LODWORD(v129) = v13;
            while ((_DWORD)v129)
            {
              v129 = (v129 - 1);
              v130 = *v128++;
              v10 += (unint64_t)v130 << (v11 + v126);
              v122 = v127 & v10;
              v124 = v120 + 4 * v122;
              v131 = *(_BYTE *)v124;
              LODWORD(v124) = *(unsigned __int8 *)(v124 + 1);
              v132 = v131 - (v124 & ((int)((_DWORD)v124 << 27) >> 31) & 0xF);
              v126 += 8;
              if ((unint64_t)v11 + v126 >= v132)
              {
                v133 = v132;
                LODWORD(v11) = v11 + v126;
                v13 = v129;
                next_in = v128;
                v125 = v132;
                goto LABEL_186;
              }
            }
            goto LABEL_381;
          }
          v133 = v125;
LABEL_186:
          v134 = *(unsigned __int16 *)(v120 + 4 * v122 + 2);
          if (v124 >= 0x10)
          {
            v145 = *((_DWORD *)state + 1787);
          }
          else
          {
            v135 = -1 << (v133 + v124);
            v136 = ((v10 & ~v135) >> v133) + v134;
            v124 = v120 + 4 * v136;
            v137 = *(_BYTE *)v124;
            LOBYTE(v124) = *(_BYTE *)(v124 + 1);
            v138 = v137 - (v124 & ((char)(8 * v124) >> 7) & 0xF);
            if (v133 + v138 > v11)
            {
              v139 = 0;
              v140 = ~v135;
              v141 = next_in;
              LODWORD(v142) = v13;
              while ((_DWORD)v142)
              {
                v143 = *v141++;
                v142 = (v142 - 1);
                v10 += (unint64_t)v143 << (v11 + v139);
                v136 = ((v10 & v140) >> v133) + v134;
                v124 = v120 + 4 * v136;
                v144 = *(_BYTE *)v124;
                LOBYTE(v124) = *(_BYTE *)(v124 + 1);
                v138 = v144 - (v124 & ((char)(8 * v124) >> 7) & 0xF);
                v139 += 8;
                if ((unint64_t)v11 + v139 >= v133 + v138)
                {
                  LODWORD(v11) = v11 + v139;
                  v13 = v142;
                  next_in = v141;
                  goto LABEL_192;
                }
              }
              goto LABEL_381;
            }
LABEL_192:
            v134 = *(unsigned __int16 *)(v120 + 4 * v136 + 2);
            v10 >>= v125;
            LODWORD(v11) = v11 - v133;
            v145 = *((_DWORD *)state + 1787) + v133;
            v125 = v138;
          }
          v10 >>= v125;
          v11 = v11 - v125;
          *((_DWORD *)state + 1787) = v145 + v125;
          if ((v124 & 0x40) != 0)
          {
            v23 = "invalid distance code";
            goto LABEL_374;
          }
          v51 = v124 & 0xF;
          *((_DWORD *)state + 24) = v134;
          *((_DWORD *)state + 25) = v51;
          *((_DWORD *)state + 2) = 16203;
          if ((v124 & 0xF) != 0)
          {
LABEL_196:
            if (v11 < v51)
            {
              v146 = next_in;
              LODWORD(v147) = v13;
              v148 = v11;
              while ((_DWORD)v147)
              {
                v147 = (v147 - 1);
                v149 = *v146++;
                v10 += (unint64_t)v149 << v148;
                v148 += 8;
                if (v148 >= v51)
                  goto LABEL_203;
              }
LABEL_381:
              next_in += v13;
              v15 = v232;
              LODWORD(v11) = v11 + 8 * v13;
              LODWORD(v13) = 0;
              goto LABEL_396;
            }
            v148 = v11;
            v147 = v13;
            v146 = next_in;
LABEL_203:
            *((_DWORD *)state + 24) += v10 & ~(-1 << v51);
            v10 >>= v51;
            v11 = v148 - v51;
            *((_DWORD *)state + 1787) += v51;
            v13 = v147;
            next_in = v146;
          }
LABEL_204:
          *((_DWORD *)state + 2) = 16204;
LABEL_205:
          if ((_DWORD)avail_out)
          {
            v150 = *((unsigned int *)state + 24);
            if (v150 <= (int)v12 - (int)avail_out)
            {
              v152 = &next_out[-v150];
              v153 = *((_DWORD *)state + 23);
              v154 = v153;
            }
            else
            {
              v151 = v150 - (v12 - avail_out);
              if (v151 > *((_DWORD *)state + 16) && *((_DWORD *)state + 1786))
              {
                v23 = "invalid distance too far back";
                goto LABEL_374;
              }
              v155 = *((_DWORD *)state + 17);
              v154 = v151 - v155;
              if (v151 <= v155)
              {
                v156 = v155 - v151;
                v154 = v151;
              }
              else
              {
                v156 = *((_DWORD *)state + 15) - v154;
              }
              v152 = (Bytef *)(*((_QWORD *)state + 9) + v156);
              v153 = *((_DWORD *)state + 23);
              if (v154 >= v153)
                v154 = *((_DWORD *)state + 23);
            }
            if (v154 >= avail_out)
              v154 = avail_out;
            *((_DWORD *)state + 23) = v153 - v154;
            v157 = v154;
            do
            {
              v158 = *v152++;
              *next_out++ = v158;
              --v157;
            }
            while (v157);
            avail_out = avail_out - v154;
            if (!*((_DWORD *)state + 23))
            {
LABEL_221:
              v32 = 16200;
              goto LABEL_375;
            }
            goto LABEL_376;
          }
          goto LABEL_383;
        }
        v67 = *((_QWORD *)state + 13);
        v68 = ~(-1 << *((_DWORD *)state + 30));
        while (1)
        {
          v69 = v68 & v10;
          v70 = *(_BYTE *)(v67 + 4 * v69)
              - (*(_BYTE *)(v67 + 4 * v69 + 1) & ((char)(8
                                                                                     * *(_BYTE *)(v67
                                                                                                + 4
                                                                                                * v69
                                                                                                + 1)) >> 7) & 0xF);
          if (v11 >= v70)
          {
            v75 = (*(_BYTE *)(v67 + 4 * v69)
                                  - (*(_BYTE *)(v67 + 4 * v69 + 1) & ((char)(8 * *(_BYTE *)(v67 + 4 * v69 + 1)) >> 7) & 0xF));
          }
          else
          {
            v71 = 0;
            v72 = next_in;
            LODWORD(v73) = v13;
            do
            {
              if (!(_DWORD)v73)
                goto LABEL_381;
              v73 = (v73 - 1);
              v74 = *v72++;
              v10 += (unint64_t)v74 << (v11 + v71);
              v69 = v68 & v10;
              v71 += 8;
            }
            while ((unint64_t)v11 + v71 < (*(_BYTE *)(v67
                                                                                           + 4 * v69)
                                                                                - (*(_BYTE *)(v67
                                                                                            + 4 * v69
                                                                                            + 1) & ((char)(8 * *(_BYTE *)(v67 + 4 * v69 + 1)) >> 7) & 0xF)));
            v75 = (*(_BYTE *)(v67 + 4 * v69)
                                  - (*(_BYTE *)(v67 + 4 * v69 + 1) & ((char)(8 * *(_BYTE *)(v67 + 4 * v69 + 1)) >> 7) & 0xF));
            LODWORD(v11) = v11 + v71;
            v13 = v73;
            next_in = v72;
            v70 = *(_BYTE *)(v67 + 4 * v69)
                - (*(_BYTE *)(v67 + 4 * v69 + 1) & ((char)(8
                                                                                       * *(_BYTE *)(v67
                                                                                                  + 4 * v69
                                                                                                  + 1)) >> 7) & 0xF);
          }
          v76 = *(unsigned __int16 *)(v67 + 4 * v69 + 2);
          if (v76 > 0xF)
            break;
          v10 >>= v70;
          v11 = (v11 - v75);
          v77 = (char *)state + 2 * v45++;
          *((_DWORD *)state + 35) = v45;
          *((_WORD *)v77 + 76) = v76;
LABEL_145:
          if (v45 >= v66)
            goto LABEL_146;
        }
        if (v76 != 16)
        {
          if (v76 == 17)
          {
            v78 = (v75 + 3);
            if (v11 < v78)
            {
              v79 = 0;
              do
              {
                if (!(_DWORD)v13)
                  goto LABEL_389;
                v80 = *next_in++;
                v13 = (v13 - 1);
                v10 += (unint64_t)v80 << (v11 + v79);
                v79 += 8;
              }
              while ((unint64_t)v11 + v79 < v78);
              LODWORD(v11) = v11 + v79;
            }
            v81 = 0;
            v82 = v10 >> v70;
            v83 = ((v10 >> v70) & 7) + 3;
            v10 = v82 >> 3;
            v11 = (v11 - v75 - 3);
          }
          else
          {
            v86 = (v75 + 7);
            if (v11 < v86)
            {
              v79 = 0;
              do
              {
                if (!(_DWORD)v13)
                  goto LABEL_389;
                v87 = *next_in++;
                v13 = (v13 - 1);
                v10 += (unint64_t)v87 << (v11 + v79);
                v79 += 8;
              }
              while ((unint64_t)v11 + v79 < v86);
              LODWORD(v11) = v11 + v79;
            }
            v81 = 0;
            v88 = v10 >> v70;
            v83 = ((v10 >> v70) & 0x7F) + 11;
            v10 = v88 >> 7;
            v11 = (v11 - v75 - 7);
          }
LABEL_142:
          if (v83 + v45 > v66)
            goto LABEL_377;
          do
          {
            v89 = (char *)state + 2 * v45++;
            *((_WORD *)v89 + 76) = v81;
            --v83;
          }
          while (v83);
          *((_DWORD *)state + 35) = v45;
          goto LABEL_145;
        }
        v84 = (v75 + 2);
        if (v11 >= v84)
          goto LABEL_134;
        v79 = 0;
        while ((_DWORD)v13)
        {
          v85 = *next_in++;
          v13 = (v13 - 1);
          v10 += (unint64_t)v85 << (v11 + v79);
          v79 += 8;
          if ((unint64_t)v11 + v79 >= v84)
          {
            LODWORD(v11) = v11 + v79;
LABEL_134:
            v10 >>= v70;
            v11 = (v11 - v75);
            if (v45)
            {
              v81 = *((_WORD *)state + v45 + 75);
              v83 = (v10 & 3) + 3;
              v10 >>= 2;
              v11 = (v11 - 2);
              goto LABEL_142;
            }
LABEL_377:
            v23 = "invalid bit length repeat";
            goto LABEL_374;
          }
        }
LABEL_389:
        LODWORD(v11) = v11 + v79;
LABEL_383:
        v15 = v232;
LABEL_396:
        v3->next_out = next_out;
        v3->avail_out = avail_out;
        v3->next_in = next_in;
        v3->avail_in = v13;
        *((_QWORD *)state + 10) = v10;
        *((_DWORD *)state + 22) = v11;
        if (!*((_DWORD *)state + 15))
        {
          if ((_DWORD)v12 == (_DWORD)avail_out
            || (v210 = *((_DWORD *)state + 2), v210 > 0x3F50)
            || (_DWORD)v2 == 4 && v210 > 0x3F4D)
          {
LABEL_406:
            v211 = (v12 - avail_out);
            v3->total_in += avail_in - v13;
            v3->total_out += v211;
            *((_QWORD *)state + 5) += v211;
            if ((*((_BYTE *)state + 16) & 4) != 0 && (_DWORD)v12 != (_DWORD)avail_out)
            {
              v212 = *((_QWORD *)state + 4);
              v213 = &v3->next_out[-v211];
              if (*((_DWORD *)state + 6))
                v214 = crc32(v212, v213, v211);
              else
                v214 = adler32(v212, v213, v211);
              *((_QWORD *)state + 4) = v214;
              v3->adler = v214;
            }
            v215 = *((_DWORD *)state + 2);
            if (v215 == 16194 || v215 == 16199)
              v217 = 256;
            else
              v217 = 0;
            v3->data_type = *((_DWORD *)state + 22)
                          + ((*((_DWORD *)state + 3) != 0) << 6)
                          + ((v215 == 16191) << 7)
                          + v217;
            if (((_DWORD)v12 == (_DWORD)avail_out && avail_in == (_DWORD)v13 || (_DWORD)v2 == 4) && v15 == 0)
              return -5;
            else
              return v15;
          }
        }
        if (!sub_22D25684C((uint64_t)v3, (uint64_t)next_out, (int)v12 - (int)avail_out))
        {
          LODWORD(v13) = v3->avail_in;
          LODWORD(avail_out) = v3->avail_out;
          goto LABEL_406;
        }
        *((_DWORD *)state + 2) = 16210;
        return -4;
      case 16197:
        v225 = v2;
        v2 = v12;
        v12 = avail_out;
        v39 = *((unsigned int *)state + 32);
        v40 = *((unsigned int *)state + 35);
        if (v40 < v39)
          goto LABEL_63;
        goto LABEL_69;
      case 16198:
        v45 = *((_DWORD *)state + 35);
        goto LABEL_111;
      case 16199:
        goto LABEL_149;
      case 16200:
        goto LABEL_150;
      case 16201:
        v46 = *((_DWORD *)state + 25);
        if (v46)
          goto LABEL_76;
        goto LABEL_173;
      case 16202:
        goto LABEL_180;
      case 16203:
        v51 = *((_DWORD *)state + 25);
        if (!v51)
          goto LABEL_204;
        goto LABEL_196;
      case 16204:
        goto LABEL_205;
      case 16205:
        if (!(_DWORD)avail_out)
          goto LABEL_383;
        *next_out++ = *((_DWORD *)state + 23);
        avail_out = (avail_out - 1);
        goto LABEL_221;
      case 16206:
        v52 = *((_DWORD *)state + 4);
        if (!v52)
          goto LABEL_352;
        if (v11 > 0x1F)
          goto LABEL_91;
        v17 = 0;
        while ((_DWORD)v13)
        {
          v13 = (v13 - 1);
          v53 = *next_in++;
          v10 += (unint64_t)v53 << (v11 + v17);
          v17 += 8;
          if ((unint64_t)v11 + v17 - 8 >= 0x18)
          {
            v11 = (v11 + v17);
LABEL_91:
            v54 = (v12 - avail_out);
            v3->total_out += v54;
            *((_QWORD *)state + 5) += v54;
            v55 = v52 & 4;
            if ((v52 & 4) != 0 && (_DWORD)v12 != (_DWORD)avail_out)
            {
              v56 = v11;
              v57 = *((_QWORD *)state + 4);
              v58 = &next_out[-v54];
              if (*((_DWORD *)state + 6))
                v59 = crc32(v57, v58, v54);
              else
                v59 = adler32(v57, v58, v54);
              *((_QWORD *)state + 4) = v59;
              v3->adler = v59;
              v52 = *((_DWORD *)state + 4);
              v55 = v52 & 4;
              v11 = v56;
            }
            if (v55)
            {
              v202 = bswap32(v10);
              v203 = *((_DWORD *)state + 6) ? v10 : v202;
              if (v203 != *((_QWORD *)state + 4))
              {
                v3->msg = "incorrect data check";
                *((_DWORD *)state + 2) = 16209;
                v12 = avail_out;
                goto LABEL_376;
              }
            }
            v10 = 0;
            v11 = 0;
            v12 = avail_out;
LABEL_352:
            *((_DWORD *)state + 2) = 16207;
LABEL_353:
            if (v52 && *((_DWORD *)state + 6))
            {
              if (v11 <= 0x1F)
              {
                v17 = 0;
                do
                {
                  if (!(_DWORD)v13)
                    goto LABEL_382;
                  v13 = (v13 - 1);
                  v204 = *next_in++;
                  v10 += (unint64_t)v204 << (v11 + v17);
                  v17 += 8;
                }
                while ((unint64_t)v11 + v17 - 8 < 0x18);
                v11 = (v11 + v17);
              }
              if ((v52 & 4) != 0 && v10 != *((_DWORD *)state + 10))
              {
                v23 = "incorrect length check";
                goto LABEL_374;
              }
              v10 = 0;
              LODWORD(v11) = 0;
            }
            *((_DWORD *)state + 2) = 16208;
            v15 = 1;
            goto LABEL_396;
          }
        }
LABEL_382:
        LODWORD(v11) = v11 + v17;
        goto LABEL_383;
      case 16207:
        v52 = *((_DWORD *)state + 4);
        goto LABEL_353;
      case 16208:
        goto LABEL_396;
      case 16209:
        goto LABEL_395;
      case 16210:
        return -4;
      default:
        return -2;
    }
  }
}

uLong crc32_z(uLong crc, const Bytef *buf, z_size_t len)
{
  int8x16_t v3;
  double v4;
  int8x16_t v5;
  int8x16_t v6;
  z_size_t v7;
  int8x16_t *v8;
  unint64_t v9;
  const Bytef *v10;
  __int8 v11;
  int v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int8x16_t *v21;
  __int8 v22;

  if (!buf)
    return 0;
  v7 = len;
  v8 = (int8x16_t *)buf;
  v9 = ~(_DWORD)crc;
  if (len && (buf & 0xF) != 0)
  {
    v10 = buf + 1;
    do
    {
      v11 = v8->i8[0];
      v8 = (int8x16_t *)((char *)v8 + 1);
      v9 = qword_22D260390[(v11 ^ v9)] ^ (v9 >> 8);
      if (!--v7)
        break;
    }
    while ((unint64_t)(v10++ & 0xF));
  }
  if (v7 >= 0x20)
  {
    do
    {
      if (v7 >= 0x40000000)
        v13 = 0x40000000;
      else
        v13 = v7;
      v9 = sub_22D259990(v9, v8, v13 & 0x7FFFFFF0, v3, v4, v5, v6);
      v8 = (int8x16_t *)((char *)v8 + (v13 & 0x7FFFFFF0));
      v7 -= v13 & 0x7FFFFFF0;
    }
    while (v7 > 0x1F);
  }
  if (v7 >= 8)
  {
    do
    {
      v7 -= 8;
      v14 = qword_22D260390[(v8->i8[0] ^ v9)] ^ (v9 >> 8);
      v15 = qword_22D260390[(v8->i8[1] ^ v14)] ^ (v14 >> 8);
      v16 = qword_22D260390[(v8->i8[2] ^ v15)] ^ (v15 >> 8);
      v17 = qword_22D260390[(v8->i8[3] ^ v16)] ^ (v16 >> 8);
      v18 = qword_22D260390[(v8->i8[4] ^ v17)] ^ (v17 >> 8);
      v19 = qword_22D260390[(v8->i8[5] ^ v18)] ^ (v18 >> 8);
      v20 = qword_22D260390[(v8->i8[6] ^ v19)] ^ (v19 >> 8);
      v21 = (int8x16_t *)&v8->u64[1];
      v9 = qword_22D260390[(v8->i8[7] ^ v20)] ^ (v20 >> 8);
      v8 = (int8x16_t *)((char *)v8 + 8);
    }
    while (v7 > 7);
    v8 = v21;
  }
  for (; v7; --v7)
  {
    v22 = v8->i8[0];
    v8 = (int8x16_t *)((char *)v8 + 1);
    v9 = qword_22D260390[(v22 ^ v9)] ^ (v9 >> 8);
  }
  return v9 ^ 0xFFFFFFFF;
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return crc32_z(crc, buf, len);
}

uLong adler32_z(uLong adler, const Bytef *buf, z_size_t len)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v9;
  uLong v10;
  const Bytef *v11;
  unsigned int v12;
  uLong v13;
  BOOL v14;

  v5 = WORD1(adler);
  adler = (unsigned __int16)adler;
  if (len == 1)
  {
    v6 = (unsigned __int16)adler + (unint64_t)*buf;
    if (v6 > 0xFFF0)
      v6 -= 65521;
    if (v6 + v5 <= 0xFFF0)
      v7 = (v6 + v5) << 16;
    else
      v7 = ((v6 + v5) << 16) - 4293984256u;
    return v7 | v6;
  }
  else if (buf)
  {
    if (len >= 0x10)
    {
      if ((buf & 0xF) != 0 || len >> 31)
      {
        v11 = buf + 1;
        do
        {
          --len;
          v12 = *buf++;
          v13 = adler + v12;
          if (v13 <= 0xFFF0)
            adler = v13;
          else
            adler = v13 - 65521;
          v5 = (v13 + v5) % 0xFFF1;
          v14 = (v11++ & 0xF) == 0;
        }
        while (!v14 || len >> 31);
      }
      return sub_22D258BF0(adler, v5, (uint8x16_t *)buf, len);
    }
    else
    {
      for (; len; --len)
      {
        v9 = *buf++;
        adler += v9;
        v5 += adler;
      }
      v10 = adler - 65521;
      if (adler <= 0xFFF0)
        v10 = adler;
      return v10 | ((v5 % 0xFFF1) << 16);
    }
  }
  else
  {
    return 1;
  }
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return adler32_z(adler, buf, len);
}

BOOL sub_22D2585CC(_QWORD *a1)
{
  uint64_t v1;

  return !a1
      || !a1[8]
      || !a1[9]
      || (v1 = a1[7]) == 0
      || *(_QWORD **)v1 != a1
      || (*(_DWORD *)(v1 + 8) - 16212) < 0xFFFFFFE0;
}

uint64_t sub_22D258614(uint64_t result, int a2)
{
  uint64_t v2;
  _QWORD *v3;
  __int8 *v4;
  __int8 *v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unint64_t v21;
  unsigned int v22;
  unint64_t v23;
  unsigned int v24;
  unint64_t v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unint64_t v30;
  int v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  unsigned int v35;
  BOOL v36;
  uint64_t v37;
  __int128 v38;
  __int8 *v39;
  __int128 *v40;
  unsigned int i;
  __int128 v42;
  __int8 *v43;
  uint64_t v44;
  __int128 v45;
  __int8 *v46;
  int8x16_t v47;
  int8x16_t *v48;
  __int16 v49;
  __int32 v50;
  __int32 v51;
  __int8 v52;
  __int16 v53;
  uint64_t v54;
  char *v55;
  BOOL v56;
  int v57;
  _QWORD *v58;
  uint64_t v59;
  int8x16_t v60;

  v2 = *(_QWORD *)(result + 56);
  v3 = *(_QWORD **)result;
  v4 = *(__int8 **)(result + 24);
  v5 = &v4[*(unsigned int *)(result + 32)];
  v59 = *(_QWORD *)result + *(unsigned int *)(result + 8);
  v6 = v59 - 25;
  v7 = (unint64_t)(v5 - 323);
  v8 = (_DWORD)v5 - a2;
  v9 = *(_DWORD *)(v2 + 60);
  v10 = *(_DWORD *)(v2 + 68);
  if (v10)
    v11 = 0;
  else
    v11 = *(_DWORD *)(v2 + 64) >= v9;
  if (v11)
    v10 = *(_DWORD *)(v2 + 60);
  v12 = ~(-1 << *(_DWORD *)(v2 + 120));
  v13 = ~(-1 << *(_DWORD *)(v2 + 124));
  v14 = *(_QWORD *)(v2 + 72);
  v15 = *(_QWORD *)(v2 + 80) & ~(-1 << *(_DWORD *)(v2 + 88)) | (*v3 << *(_DWORD *)(v2 + 88));
  v16 = (_QWORD *)((char *)v3 + (((*(_DWORD *)(v2 + 88) & 0x3Fu) >> 3) ^ 7));
  v17 = *(_DWORD *)(v2 + 88) & 7 | 0x38;
  v18 = *(_QWORD *)(v2 + 104);
  v19 = *(_QWORD *)(v2 + 112);
  do
  {
    v20 = *(_DWORD *)(v18 + 4 * (v15 & v12));
    v21 = (*v16 << v17) | v15;
    v16 = (_QWORD *)((char *)v16 + ((63 - v17) >> 3));
    v15 = v21 >> v20;
    v17 = (v17 | 0x38) - v20;
LABEL_8:
    v22 = HIWORD(v20);
    if ((v20 & 0xFF00) == 0)
    {
      *v4 = BYTE2(v20);
      v20 = *(_DWORD *)(v18 + 4 * (v15 & v12));
      v22 = HIWORD(v20);
      v23 = v15 >> v20;
      v17 -= v20;
      if ((v20 & 0xFF00) == 0)
      {
        v4[1] = BYTE2(v20);
        v4 += 2;
        v20 = *(_DWORD *)(v18 + 4 * (v23 & v12));
        v15 = v23 >> v20;
        v17 -= v20;
        LODWORD(v21) = v23;
        goto LABEL_11;
      }
      LODWORD(v21) = v15;
      ++v4;
      v15 >>= v20;
    }
    do
    {
      if ((v20 & 0x1000) != 0)
      {
        v24 = *(_DWORD *)(v19 + 4 * (v15 & v13));
        if (v17 <= 0x1B)
        {
          v15 |= *v16 << v17;
          v16 = (_QWORD *)((char *)v16 + ((63 - v17) >> 3));
          v17 |= 0x38u;
        }
        v25 = v15 >> v24;
        v26 = HIWORD(v24);
        v27 = v24 >> 8;
        LOWORD(v28) = v24;
        v17 -= v24;
        if ((v24 & 0x1000) == 0)
        {
          while ((v28 & 0x4000) == 0)
          {
            LODWORD(v15) = v25;
            v28 = *(_DWORD *)(v19 + 4 * ((v25 & ~(-1 << v27)) + v26));
            v25 >>= v28;
            v17 -= v28;
            v26 = HIWORD(v28);
            v27 = v28 >> 8;
            if ((v28 & 0x1000) != 0)
              goto LABEL_18;
          }
          LODWORD(v15) = v25;
          goto LABEL_94;
        }
LABEL_18:
        if (v17 <= 9)
        {
          v25 |= *v16 << v17;
          v16 = (_QWORD *)((char *)v16 + ((63 - v17) >> 3));
          v17 |= 0x38u;
        }
        v29 = ((_DWORD)v21 << -(char)v20 >> 1 >> (BYTE1(v20) & 0xF ^ 0x1F)) + v22;
        v30 = ((_DWORD)v15 << -(char)v28 >> 1 >> (v27 & 0xF ^ 0x1F)) + (unint64_t)v26;
        v21 = (*v16 << v17) | v25;
        v16 = (_QWORD *)((char *)v16 + ((63 - v17) >> 3));
        v20 = *(_DWORD *)(v18 + 4 * (v25 & v12));
        v31 = v17 | 0x38;
        v15 = v21 >> v20;
        v17 = (v17 | 0x38) - v20;
        v32 = (_DWORD)v4 - v8;
        v33 = (_DWORD)v4 - v8 - v30;
        if ((int)v4 - v8 < v30)
        {
          v34 = v33 + v10;
          if ((int)(v33 + v10) < 0)
          {
            v34 += v9;
            if ((int)v34 < (int)v10)
            {
              *(_QWORD *)(result + 48) = "invalid distance too far back";
              *(_DWORD *)(v2 + 8) = 16209;
              goto LABEL_83;
            }
            v35 = v34 + v29;
          }
          else
          {
            v35 = v34 + v29;
            if (v34 + v29 > v10)
              goto LABEL_38;
          }
          if (v32 < 0x10 || (v34 >= 0xF ? (v36 = v35 > v9) : (v36 = 1), v36))
          {
LABEL_38:
            while (1)
            {
              *v4++ = *(_BYTE *)(v14 + v34);
              if (!--v29)
                break;
              if (v34 + 1 == v10)
                goto LABEL_40;
              if (v34 + 1 == v9)
                v34 = 0;
              else
                ++v34;
            }
          }
          else
          {
            v37 = -v29 & 0xF;
            v38 = *((_OWORD *)v4 - 1);
            *(_OWORD *)&v4[-v37] = *(_OWORD *)(v14 + v34 - v37);
            if (v29 >= 0x11)
            {
              v39 = &v4[-v37 + 16];
              v40 = (__int128 *)(v14 + 16 + v34 - v37);
              for (i = v29; i > 0x10; i -= 16)
              {
                v42 = *v40++;
                *(_OWORD *)v39 = v42;
                v39 += 16;
              }
            }
            *((_OWORD *)v4 - 1) = v38;
            v4 += v29;
          }
          goto LABEL_47;
        }
LABEL_40:
        if ((int)v30 + 16 > v32)
        {
          for (; v29; --v29)
          {
            *v4 = v4[-v30];
            ++v4;
          }
LABEL_47:
          if ((unint64_t)v16 > v6 || (unint64_t)v4 > v7)
          {
            LODWORD(v15) = v21;
            v17 = v31;
            goto LABEL_83;
          }
          goto LABEL_8;
        }
        v43 = &v4[v29];
        if (v30 >= v29 + 15)
        {
          v44 = -v29 & 0xF;
          v45 = *((_OWORD *)v4 - 1);
          *(_OWORD *)&v4[-v44] = *(_OWORD *)&v4[-v44 - v30];
          if (v29 >= 0x11)
          {
            v46 = &v4[-v44 + 16];
            do
            {
              *(_OWORD *)v46 = *(_OWORD *)&v46[-v30];
              v46 += 16;
              v29 -= 16;
            }
            while (v29 > 0x10);
          }
          *((_OWORD *)v4 - 1) = v45;
          goto LABEL_46;
        }
        if (v30 <= 0xF)
        {
          v60 = 0uLL;
          v47 = vqtbl1q_s8(*((int8x16_t *)v4 - 1), xmmword_22D260280[v30]);
          v60 = v47;
          if (v29 <= 0xF)
          {
            if ((v29 & 1) != 0)
            {
              *v4++ = v47.i8[0];
              v48 = (int8x16_t *)&v60.i8[1];
            }
            else
            {
              v48 = &v60;
            }
            if ((v29 & 2) != 0)
            {
              v49 = v48->i16[0];
              v48 = (int8x16_t *)((char *)v48 + 2);
              *(_WORD *)v4 = v49;
              v4 += 2;
            }
            if ((v29 & 4) != 0)
            {
              v50 = v48->i32[0];
              v48 = (int8x16_t *)((char *)v48 + 4);
              *(_DWORD *)v4 = v50;
              v4 += 4;
            }
            if ((v29 & 8) == 0)
              goto LABEL_46;
            goto LABEL_77;
          }
          *(int8x16_t *)v4 = v47;
          v4 += 16;
          v29 -= 16;
          LODWORD(v30) = byte_22D260380[v30];
        }
        if (v29 >= 0x10)
        {
          do
          {
            *(_OWORD *)v4 = *(_OWORD *)&v4[-v30];
            v4 += 16;
            v29 -= 16;
          }
          while (v29 > 0xF);
        }
        v48 = (int8x16_t *)&v4[-v30];
        if ((v29 & 1) != 0)
        {
          v52 = v48->i8[0];
          v48 = (int8x16_t *)((char *)v48 + 1);
          *v4++ = v52;
          if ((v29 & 2) == 0)
          {
LABEL_74:
            if ((v29 & 4) == 0)
              goto LABEL_76;
            goto LABEL_75;
          }
        }
        else if ((v29 & 2) == 0)
        {
          goto LABEL_74;
        }
        v53 = v48->i16[0];
        v48 = (int8x16_t *)((char *)v48 + 2);
        *(_WORD *)v4 = v53;
        v4 += 2;
        if ((v29 & 4) == 0)
        {
LABEL_76:
          if (v29 < 8)
          {
LABEL_46:
            v4 = v43;
            goto LABEL_47;
          }
LABEL_77:
          *(_QWORD *)v4 = v48->i64[0];
          goto LABEL_46;
        }
LABEL_75:
        v51 = v48->i32[0];
        v48 = (int8x16_t *)((char *)v48 + 4);
        *(_DWORD *)v4 = v51;
        v4 += 4;
        goto LABEL_76;
      }
      if ((v20 & 0x4000) != 0)
      {
        if ((v20 & 0x2000) != 0)
        {
          *(_DWORD *)(v2 + 8) = 16191;
          goto LABEL_83;
        }
LABEL_94:
        *(_QWORD *)(result + 48) = "invalid literal/length/distance code";
        *(_DWORD *)(v2 + 8) = 16209;
        goto LABEL_83;
      }
      LODWORD(v21) = v15;
      v20 = *(_DWORD *)(v18 + 4 * ((v15 & ~(-1 << SBYTE1(v20))) + v22));
      v15 >>= v20;
      v17 -= v20;
LABEL_11:
      v22 = HIWORD(v20);
    }
    while ((v20 & 0xFF00) != 0);
    *v4++ = BYTE2(v20);
  }
  while ((unint64_t)v16 <= v6 && (unint64_t)v4 <= v7);
LABEL_83:
  v54 = v17 >> 3;
  v55 = (char *)v16 - v54;
  v56 = v3 > (_QWORD *)((char *)v16 - v54);
  v57 = (v17 & 7 | (8 * ((_DWORD)v3 + ~(_DWORD)v16 + v54))) + 8;
  if (!v56)
    v57 = v17 & 7;
  *(_DWORD *)(v2 + 88) = v57;
  *(_QWORD *)(v2 + 80) = v15 & ~(-1 << v57);
  if (v56)
    v58 = v3;
  else
    v58 = v55;
  *(_QWORD *)result = v58;
  *(_QWORD *)(result + 24) = v4;
  *(_DWORD *)(result + 8) = v59 - (_DWORD)v58;
  *(_DWORD *)(result + 32) = (_DWORD)v5 - (_DWORD)v4;
  return result;
}

uint64_t sub_22D258BF0(uint64_t a1, uint64_t a2, uint8x16_t *a3, int a4)
{
  uint64_t v4;
  int v5;
  uint8x16_t v6;
  uint16x8_t v7;
  uint64_t v8;
  int v9;
  uint8x16_t v10;
  uint8x16_t v11;
  uint16x4_t v12;
  int32x2_t v13;
  uint16x8_t v14;
  BOOL v15;
  uint64x2_t v16;
  int i;
  uint8x16_t v18;
  uint8x16_t v19;
  uint16x4_t v20;
  int32x2_t v21;
  uint16x8_t v22;
  uint8x16_t v23;
  uint16x8_t v24;
  int j;
  unsigned int v26;
  uint64x2_t v27;
  int32x2_t v28;

  v4 = a1 + (a2 << 32);
  if (a4 >= 5552)
  {
    v5 = a4 - 5552;
    do
    {
      v6 = *a3;
      v7 = vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)0x90A0B0C0D0E0F10), *a3, *(uint8x16_t *)&qword_22D258D60[2]);
      v6.i16[0] = vaddlvq_u8(*a3);
      v7.i32[0] = vaddlvq_u16(v7);
      ++a3;
      v8 = (uint64_t)vadd_s32((int32x2_t)(v4 + vshld_n_s64(v4, 0x24uLL)), vzip1_s32(*(int32x2_t *)v6.i8, *(int32x2_t *)v7.i8));
      v9 = 173;
      do
      {
        v10 = *a3;
        v11 = a3[1];
        v12 = (uint16x4_t)vshld_n_s64(v8, 0x25uLL);
        v13 = (int32x2_t)(v8 + *(_QWORD *)&v12);
        v10.i16[0] = vaddlvq_u8(*a3);
        v12.i16[0] = vaddlvq_u8(v11);
        v14 = vmlal_high_u8(vmlal_u8(vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)0x191A1B1C1D1E1F20), *a3, *(uint8x16_t *)qword_22D258D60), *(uint8x8_t *)v11.i8, (uint8x8_t)0x90A0B0C0D0E0F10), v11, *(uint8x16_t *)&qword_22D258D60[2]);
        v14.i32[0] = vaddlvq_u16(v14);
        a3 += 2;
        v8 = (uint64_t)vadd_s32(v13, vzip1_s32((int32x2_t)*(_OWORD *)&vaddl_u16(*(uint16x4_t *)v10.i8, v12), *(int32x2_t *)v14.i8));
        v15 = __OFSUB__(v9--, 1);
      }
      while (!((v9 < 0) ^ v15 | (v9 == 0)));
      v16 = vshrq_n_u64(vmull_lane_u32((uint32x2_t)v8, (uint32x2_t)0x800780710000FFF1, 1), 0x2FuLL);
      v16.i32[1] = v16.i32[2];
      v4 = (uint64_t)vmls_lane_s32((int32x2_t)v8, *(int32x2_t *)v16.i8, (int32x2_t)0x800780710000FFF1, 0);
      v15 = __OFSUB__(v5, 5552);
      v5 -= 5552;
    }
    while (v5 < 0 == v15);
    a4 = v5 + 5552;
  }
  v15 = __OFSUB__(a4, 32);
  for (i = a4 - 32; i < 0 == v15; i -= 32)
  {
    v18 = *a3;
    v19 = a3[1];
    v20 = (uint16x4_t)vshld_n_s64(v4, 0x25uLL);
    v21 = (int32x2_t)(v4 + *(_QWORD *)&v20);
    v18.i16[0] = vaddlvq_u8(*a3);
    v20.i16[0] = vaddlvq_u8(v19);
    v22 = vmlal_high_u8(vmlal_u8(vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)0x191A1B1C1D1E1F20), *a3, *(uint8x16_t *)qword_22D258D60), *(uint8x8_t *)v19.i8, (uint8x8_t)0x90A0B0C0D0E0F10), v19, *(uint8x16_t *)&qword_22D258D60[2]);
    v22.i32[0] = vaddlvq_u16(v22);
    a3 += 2;
    v4 = (uint64_t)vadd_s32(v21, vzip1_s32((int32x2_t)*(_OWORD *)&vaddl_u16(*(uint16x4_t *)v18.i8, v20), *(int32x2_t *)v22.i8));
    v15 = __OFSUB__(i, 32);
  }
  if ((i & 0x10) != 0)
  {
    v23 = *a3;
    v24 = vmlal_high_u8(vmull_u8(*(uint8x8_t *)a3->i8, (uint8x8_t)0x90A0B0C0D0E0F10), *a3, *(uint8x16_t *)&qword_22D258D60[2]);
    v23.i16[0] = vaddlvq_u8(*a3);
    v24.i32[0] = vaddlvq_u16(v24);
    ++a3;
    v4 = (uint64_t)vadd_s32((int32x2_t)(v4 + vshld_n_s64(v4, 0x24uLL)), vzip1_s32(*(int32x2_t *)v23.i8, *(int32x2_t *)v24.i8));
  }
  for (j = i & 0xF; j; v4 += v26 + vshld_n_s64(v4 + v26, 0x20uLL))
  {
    v26 = a3->u8[0];
    a3 = (uint8x16_t *)((char *)a3 + 1);
    --j;
  }
  v27 = vshrq_n_u64(vmull_lane_u32((uint32x2_t)v4, (uint32x2_t)0x800780710000FFF1, 1), 0x2FuLL);
  v27.i32[1] = v27.i32[2];
  v28 = vmls_lane_s32((int32x2_t)v4, *(int32x2_t *)v27.i8, (int32x2_t)0x800780710000FFF1, 0);
  return (v28.i32[0] + (v28.i32[1] << 16));
}

int deflate(z_streamp strm, int flush)
{
  uint64_t v2;
  _BOOL4 v4;
  int result;
  internal_state *state;
  uInt avail_in;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uLong adler;
  uLong v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uLong v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
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
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  char v67;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  int v89;
  uint64_t v90;
  size_t v91;
  size_t v92;
  int v93;
  size_t v94;
  unint64_t v95;
  BOOL v96;
  size_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  BOOL v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t v108;
  BOOL v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uLong v115;
  uint64_t v116;
  uLong v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int v121;
  int v122;
  char *v123;
  size_t v124;
  int v125;
  uLong v126;
  uint64_t v127;
  uint64_t v128;
  uLong v129;
  uint64_t v130;
  uint64_t v131;
  uLong v132;
  uint64_t v133;
  uint64_t v134;
  uLong v135;
  uint64_t v136;
  uint64_t v137;
  uLong total_in;
  uint64_t v139;
  uint64_t v140;
  uLong v141;
  uint64_t v142;
  uint64_t v143;
  uLong v144;
  uint64_t v145;
  uint64_t v146;
  uLong v147;
  uLong v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  int v157;

  v2 = *(_QWORD *)&flush;
  v4 = sub_22D259910(strm);
  result = -2;
  if (v2 > 5 || v4)
    return result;
  if (!strm->next_out
    || (state = strm->state, (avail_in = strm->avail_in) != 0) && !strm->next_in
    || (v8 = *((_DWORD *)state + 2), (_DWORD)v2 != 4) && v8 == 666)
  {
    strm->msg = "stream error";
    return result;
  }
  if (!strm->avail_out)
    goto LABEL_30;
  v9 = *((_DWORD *)state + 19);
  *((_DWORD *)state + 19) = v2;
  if (*((_QWORD *)state + 5))
  {
    sub_22D25A000((uint64_t)strm);
    if (!strm->avail_out)
      goto LABEL_160;
    v8 = *((_DWORD *)state + 2);
  }
  else if (!avail_in)
  {
    v11 = v9 <= 4 ? 0 : -9;
    v12 = v2 <= 4 ? 0 : -9;
    if ((_DWORD)v2 != 4 && v12 + 2 * (int)v2 <= v11 + 2 * v9)
      goto LABEL_30;
  }
  switch(v8)
  {
    case 42:
      if (!*((_DWORD *)state + 12))
      {
        *((_DWORD *)state + 2) = 113;
        goto LABEL_133;
      }
      if (*((int *)state + 50) <= 1)
      {
        v13 = *((_DWORD *)state + 49);
        if (v13 == 6)
          v14 = 128;
        else
          v14 = 192;
        if (v13 >= 6)
          v15 = v14;
        else
          v15 = 64;
        if (v13 >= 2)
          v10 = v15;
        else
          v10 = 0;
      }
      else
      {
        v10 = 0;
      }
      v16 = v10 | ((*((_DWORD *)state + 21) << 12) - 30720);
      if (*((_DWORD *)state + 43))
        v16 |= 0x20u;
      v17 = *((_QWORD *)state + 2);
      v18 = *((_QWORD *)state + 5);
      *((_QWORD *)state + 5) = v18 + 1;
      *(_BYTE *)(v17 + v18) = BYTE1(v16);
      v19 = *((_QWORD *)state + 2);
      v20 = *((_QWORD *)state + 5);
      *((_QWORD *)state + 5) = v20 + 1;
      *(_BYTE *)(v19 + v20) = ((v16 % 0x1F) | v16) ^ 0x1F;
      if (*((_DWORD *)state + 43))
      {
        adler = strm->adler;
        v22 = adler >> 16;
        v23 = *((_QWORD *)state + 2);
        v24 = *((_QWORD *)state + 5);
        *((_QWORD *)state + 5) = v24 + 1;
        *(_BYTE *)(v23 + v24) = BYTE3(adler);
        v25 = *((_QWORD *)state + 2);
        v26 = *((_QWORD *)state + 5);
        *((_QWORD *)state + 5) = v26 + 1;
        *(_BYTE *)(v25 + v26) = v22;
        v27 = strm->adler;
        v28 = *((_QWORD *)state + 2);
        v29 = *((_QWORD *)state + 5);
        *((_QWORD *)state + 5) = v29 + 1;
        *(_BYTE *)(v28 + v29) = BYTE1(v27);
        v30 = *((_QWORD *)state + 2);
        v31 = *((_QWORD *)state + 5);
        *((_QWORD *)state + 5) = v31 + 1;
        *(_BYTE *)(v30 + v31) = v27;
      }
      strm->adler = adler32(0, 0, 0);
      *((_DWORD *)state + 2) = 113;
      sub_22D25A000((uint64_t)strm);
      if (*((_QWORD *)state + 5))
        goto LABEL_160;
      v8 = *((_DWORD *)state + 2);
      break;
    case 666:
      if (!strm->avail_in)
        goto LABEL_134;
LABEL_30:
      strm->msg = "buffer error";
      return -5;
    case 57:
      strm->adler = crc32(0, 0, 0);
      v32 = *((_QWORD *)state + 2);
      v33 = *((_QWORD *)state + 5);
      *((_QWORD *)state + 5) = v33 + 1;
      *(_BYTE *)(v32 + v33) = 31;
      v34 = *((_QWORD *)state + 2);
      v35 = *((_QWORD *)state + 5);
      *((_QWORD *)state + 5) = v35 + 1;
      *(_BYTE *)(v34 + v35) = -117;
      v36 = *((_QWORD *)state + 2);
      v37 = *((_QWORD *)state + 5);
      *((_QWORD *)state + 5) = v37 + 1;
      *(_BYTE *)(v36 + v37) = 8;
      v38 = *((_QWORD *)state + 7);
      if (v38)
      {
        v39 = (*(_DWORD *)v38 != 0) | (2 * (*(_DWORD *)(v38 + 68) != 0)) | (4 * (*(_QWORD *)(v38 + 24) != 0)) | (8 * (*(_QWORD *)(v38 + 40) != 0)) | (16 * (*(_QWORD *)(v38 + 56) != 0));
        v40 = *((_QWORD *)state + 2);
        v41 = *((_QWORD *)state + 5);
        *((_QWORD *)state + 5) = v41 + 1;
        *(_BYTE *)(v40 + v41) = v39;
        v42 = *(_QWORD *)(*((_QWORD *)state + 7) + 8);
        v43 = *((_QWORD *)state + 2);
        v44 = *((_QWORD *)state + 5);
        *((_QWORD *)state + 5) = v44 + 1;
        *(_BYTE *)(v43 + v44) = v42;
        v45 = *(_QWORD *)(*((_QWORD *)state + 7) + 8) >> 8;
        v46 = *((_QWORD *)state + 2);
        v47 = *((_QWORD *)state + 5);
        *((_QWORD *)state + 5) = v47 + 1;
        *(_BYTE *)(v46 + v47) = v45;
        v48 = *(_QWORD *)(*((_QWORD *)state + 7) + 8) >> 16;
        v49 = *((_QWORD *)state + 2);
        v50 = *((_QWORD *)state + 5);
        *((_QWORD *)state + 5) = v50 + 1;
        *(_BYTE *)(v49 + v50) = v48;
        v51 = *(_QWORD *)(*((_QWORD *)state + 7) + 8) >> 24;
        v52 = *((_QWORD *)state + 2);
        v53 = *((_QWORD *)state + 5);
        *((_QWORD *)state + 5) = v53 + 1;
        *(_BYTE *)(v52 + v53) = v51;
        v54 = *((_DWORD *)state + 49);
        if (v54 == 9)
        {
          v55 = 2;
        }
        else if (*((int *)state + 50) > 1 || v54 < 2)
        {
          v55 = 4;
        }
        else
        {
          v55 = 0;
        }
        v69 = *((_QWORD *)state + 2);
        v70 = *((_QWORD *)state + 5);
        *((_QWORD *)state + 5) = v70 + 1;
        *(_BYTE *)(v69 + v70) = v55;
        v71 = *(_DWORD *)(*((_QWORD *)state + 7) + 20);
        v72 = *((_QWORD *)state + 2);
        v73 = *((_QWORD *)state + 5);
        *((_QWORD *)state + 5) = v73 + 1;
        *(_BYTE *)(v72 + v73) = v71;
        v74 = *((_QWORD *)state + 7);
        if (*(_QWORD *)(v74 + 24))
        {
          v75 = *(_DWORD *)(v74 + 32);
          v76 = *((_QWORD *)state + 2);
          v77 = *((_QWORD *)state + 5);
          *((_QWORD *)state + 5) = v77 + 1;
          *(_BYTE *)(v76 + v77) = v75;
          v78 = *(_DWORD *)(*((_QWORD *)state + 7) + 32) >> 8;
          v79 = *((_QWORD *)state + 2);
          v80 = *((_QWORD *)state + 5);
          *((_QWORD *)state + 5) = v80 + 1;
          *(_BYTE *)(v79 + v80) = v78;
          v74 = *((_QWORD *)state + 7);
        }
        if (*(_DWORD *)(v74 + 68))
          strm->adler = crc32(strm->adler, *((const Bytef **)state + 2), *((_DWORD *)state + 10));
        *((_QWORD *)state + 8) = 0;
        *((_DWORD *)state + 2) = 69;
        goto LABEL_76;
      }
      v56 = *((_QWORD *)state + 2);
      v57 = *((_QWORD *)state + 5);
      *((_QWORD *)state + 5) = v57 + 1;
      *(_BYTE *)(v56 + v57) = 0;
      v58 = *((_QWORD *)state + 2);
      v59 = *((_QWORD *)state + 5);
      *((_QWORD *)state + 5) = v59 + 1;
      *(_BYTE *)(v58 + v59) = 0;
      v60 = *((_QWORD *)state + 2);
      v61 = *((_QWORD *)state + 5);
      *((_QWORD *)state + 5) = v61 + 1;
      *(_BYTE *)(v60 + v61) = 0;
      v62 = *((_QWORD *)state + 2);
      v63 = *((_QWORD *)state + 5);
      *((_QWORD *)state + 5) = v63 + 1;
      *(_BYTE *)(v62 + v63) = 0;
      v64 = *((_QWORD *)state + 2);
      v65 = *((_QWORD *)state + 5);
      *((_QWORD *)state + 5) = v65 + 1;
      *(_BYTE *)(v64 + v65) = 0;
      v66 = *((_DWORD *)state + 49);
      if (v66 == 9)
      {
        v67 = 2;
      }
      else if (*((int *)state + 50) > 1 || v66 < 2)
      {
        v67 = 4;
      }
      else
      {
        v67 = 0;
      }
      v82 = *((_QWORD *)state + 2);
      v83 = *((_QWORD *)state + 5);
      *((_QWORD *)state + 5) = v83 + 1;
      *(_BYTE *)(v82 + v83) = v67;
      v84 = *((_QWORD *)state + 2);
      v85 = *((_QWORD *)state + 5);
      *((_QWORD *)state + 5) = v85 + 1;
      *(_BYTE *)(v84 + v85) = 19;
      *((_DWORD *)state + 2) = 113;
      sub_22D25A000((uint64_t)strm);
      if (*((_QWORD *)state + 5))
        goto LABEL_160;
      v8 = *((_DWORD *)state + 2);
      break;
  }
  if (v8 <= 90)
  {
    if (v8 != 69)
    {
      if (v8 != 73)
        goto LABEL_133;
      goto LABEL_92;
    }
LABEL_76:
    v86 = *((_QWORD *)state + 7);
    v87 = *(_QWORD *)(v86 + 24);
    if (v87)
    {
      v88 = *((_QWORD *)state + 5);
      v89 = *(unsigned __int16 *)(v86 + 32);
      v90 = *((_QWORD *)state + 8);
      v91 = (v89 - v90);
      v92 = *((_QWORD *)state + 3);
      if (v88 + v91 > v92)
      {
        while (1)
        {
          v93 = v92 - v88;
          v94 = (v92 - v88);
          memcpy((void *)(*((_QWORD *)state + 2) + v88), (const void *)(*(_QWORD *)(*((_QWORD *)state + 7) + 24) + *((_QWORD *)state + 8)), v94);
          v95 = *((_QWORD *)state + 3);
          *((_QWORD *)state + 5) = v95;
          if (*(_DWORD *)(*((_QWORD *)state + 7) + 68))
            v96 = v95 > v88;
          else
            v96 = 0;
          if (v96)
            strm->adler = crc32(strm->adler, (const Bytef *)(*((_QWORD *)state + 2) + v88), (int)v95 - (int)v88);
          *((_QWORD *)state + 8) += v94;
          sub_22D25A000((uint64_t)strm);
          if (*((_QWORD *)state + 5))
            goto LABEL_160;
          v88 = 0;
          v91 = (v91 - v93);
          v92 = *((_QWORD *)state + 3);
          if (v92 >= v91)
          {
            v88 = 0;
            v90 = *((_QWORD *)state + 8);
            v87 = *(_QWORD *)(*((_QWORD *)state + 7) + 24);
            break;
          }
        }
      }
      memcpy((void *)(*((_QWORD *)state + 2) + v88), (const void *)(v87 + v90), v91);
      v97 = *((_QWORD *)state + 5) + v91;
      *((_QWORD *)state + 5) = v97;
      if (*(_DWORD *)(*((_QWORD *)state + 7) + 68) && v97 > v88)
        strm->adler = crc32(strm->adler, (const Bytef *)(*((_QWORD *)state + 2) + v88), (int)v97 - (int)v88);
      *((_QWORD *)state + 8) = 0;
    }
    *((_DWORD *)state + 2) = 73;
LABEL_92:
    if (*(_QWORD *)(*((_QWORD *)state + 7) + 40))
    {
      v98 = *((_QWORD *)state + 5);
      do
      {
        v99 = *((_QWORD *)state + 5);
        v100 = *((_QWORD *)state + 7);
        if (v99 == *((_QWORD *)state + 3))
        {
          if (*(_DWORD *)(v100 + 68))
            v101 = v99 > v98;
          else
            v101 = 0;
          if (v101)
            strm->adler = crc32(strm->adler, (const Bytef *)(*((_QWORD *)state + 2) + v98), (int)v99 - (int)v98);
          sub_22D25A000((uint64_t)strm);
          v98 = *((_QWORD *)state + 5);
          if (v98)
            goto LABEL_160;
          v99 = 0;
          v100 = *((_QWORD *)state + 7);
        }
        v102 = *(_QWORD *)(v100 + 40);
        v103 = *((_QWORD *)state + 8);
        *((_QWORD *)state + 8) = v103 + 1;
        LODWORD(v102) = *(unsigned __int8 *)(v102 + v103);
        v104 = *((_QWORD *)state + 2);
        *((_QWORD *)state + 5) = v99 + 1;
        *(_BYTE *)(v104 + v99) = v102;
      }
      while ((_DWORD)v102);
      if (*(_DWORD *)(*((_QWORD *)state + 7) + 68))
      {
        v105 = *((_QWORD *)state + 5);
        if (v105 > v98)
          strm->adler = crc32(strm->adler, (const Bytef *)(*((_QWORD *)state + 2) + v98), (int)v105 - (int)v98);
      }
      *((_QWORD *)state + 8) = 0;
    }
    *((_DWORD *)state + 2) = 91;
    goto LABEL_112;
  }
  if (v8 != 91)
  {
    if (v8 != 103)
      goto LABEL_133;
    goto LABEL_128;
  }
LABEL_112:
  if (*(_QWORD *)(*((_QWORD *)state + 7) + 56))
  {
    v106 = *((_QWORD *)state + 5);
    do
    {
      v107 = *((_QWORD *)state + 5);
      v108 = *((_QWORD *)state + 7);
      if (v107 == *((_QWORD *)state + 3))
      {
        if (*(_DWORD *)(v108 + 68))
          v109 = v107 > v106;
        else
          v109 = 0;
        if (v109)
          strm->adler = crc32(strm->adler, (const Bytef *)(*((_QWORD *)state + 2) + v106), (int)v107 - (int)v106);
        sub_22D25A000((uint64_t)strm);
        v106 = *((_QWORD *)state + 5);
        if (v106)
          goto LABEL_160;
        v107 = 0;
        v108 = *((_QWORD *)state + 7);
      }
      v110 = *(_QWORD *)(v108 + 56);
      v111 = *((_QWORD *)state + 8);
      *((_QWORD *)state + 8) = v111 + 1;
      LODWORD(v110) = *(unsigned __int8 *)(v110 + v111);
      v112 = *((_QWORD *)state + 2);
      *((_QWORD *)state + 5) = v107 + 1;
      *(_BYTE *)(v112 + v107) = v110;
    }
    while ((_DWORD)v110);
    if (*(_DWORD *)(*((_QWORD *)state + 7) + 68))
    {
      v113 = *((_QWORD *)state + 5);
      if (v113 > v106)
        strm->adler = crc32(strm->adler, (const Bytef *)(*((_QWORD *)state + 2) + v106), (int)v113 - (int)v106);
    }
  }
  *((_DWORD *)state + 2) = 103;
LABEL_128:
  if (*(_DWORD *)(*((_QWORD *)state + 7) + 68))
  {
    v114 = *((_QWORD *)state + 5);
    if ((unint64_t)(v114 + 2) > *((_QWORD *)state + 3))
    {
      sub_22D25A000((uint64_t)strm);
      v114 = *((_QWORD *)state + 5);
      if (v114)
        goto LABEL_160;
    }
    v115 = strm->adler;
    v116 = *((_QWORD *)state + 2);
    *((_QWORD *)state + 5) = v114 + 1;
    *(_BYTE *)(v116 + v114) = v115;
    v117 = strm->adler >> 8;
    v118 = *((_QWORD *)state + 2);
    v119 = *((_QWORD *)state + 5);
    *((_QWORD *)state + 5) = v119 + 1;
    *(_BYTE *)(v118 + v119) = v117;
    strm->adler = crc32(0, 0, 0);
  }
  *((_DWORD *)state + 2) = 113;
  sub_22D25A000((uint64_t)strm);
  if (*((_QWORD *)state + 5))
  {
LABEL_160:
    result = 0;
    *((_DWORD *)state + 19) = -1;
    return result;
  }
LABEL_133:
  if (strm->avail_in)
    goto LABEL_135;
LABEL_134:
  if (*((_DWORD *)state + 45))
    goto LABEL_135;
  if (!(_DWORD)v2)
    return 0;
  if (*((_DWORD *)state + 2) != 666)
  {
LABEL_135:
    v120 = *((int *)state + 49);
    if ((_DWORD)v120)
    {
      v121 = *((_DWORD *)state + 50);
      if (v121 == 3)
      {
        v122 = sub_22D25CED8((uint64_t)state, v2);
      }
      else if (v121 == 2)
      {
        v122 = sub_22D25CD14((uint64_t)state, v2);
      }
      else
      {
        v122 = qword_24F86F108[2 * v120 + 1](state, v2);
      }
    }
    else
    {
      v122 = sub_22D25C84C((uint64_t)state, v2);
    }
    if ((v122 & 0xFFFFFFFE) == 2)
      *((_DWORD *)state + 2) = 666;
    if ((v122 & 0xFFFFFFFD) != 0)
    {
      if (v122 != 1)
        goto LABEL_158;
      if ((_DWORD)v2 != 5)
      {
        if ((_DWORD)v2 == 1)
        {
          sub_22D25EBFC((uint64_t)state);
        }
        else
        {
          sub_22D25BA50((uint64_t)state, 0, 0, 0);
          if ((_DWORD)v2 == 3)
          {
            v123 = (char *)*((_QWORD *)state + 15);
            v124 = 2 * (*((_DWORD *)state + 33) - 1);
            *(_WORD *)&v123[v124] = 0;
            bzero(v123, v124);
            if (!*((_DWORD *)state + 45))
            {
              *((_DWORD *)state + 43) = 0;
              *((_QWORD *)state + 19) = 0;
              *((_DWORD *)state + 1483) = 0;
            }
          }
        }
      }
      sub_22D25A000((uint64_t)strm);
      if (strm->avail_out)
        goto LABEL_158;
      goto LABEL_160;
    }
    if (!strm->avail_out)
      goto LABEL_160;
    return 0;
  }
LABEL_158:
  if ((_DWORD)v2 != 4)
    return 0;
  v125 = *((_DWORD *)state + 12);
  if (v125 < 1)
    return 1;
  v126 = strm->adler;
  if (v125 == 2)
  {
    v127 = *((_QWORD *)state + 2);
    v128 = *((_QWORD *)state + 5);
    *((_QWORD *)state + 5) = v128 + 1;
    *(_BYTE *)(v127 + v128) = v126;
    v129 = strm->adler >> 8;
    v130 = *((_QWORD *)state + 2);
    v131 = *((_QWORD *)state + 5);
    *((_QWORD *)state + 5) = v131 + 1;
    *(_BYTE *)(v130 + v131) = v129;
    v132 = strm->adler >> 16;
    v133 = *((_QWORD *)state + 2);
    v134 = *((_QWORD *)state + 5);
    *((_QWORD *)state + 5) = v134 + 1;
    *(_BYTE *)(v133 + v134) = v132;
    v135 = strm->adler >> 24;
    v136 = *((_QWORD *)state + 2);
    v137 = *((_QWORD *)state + 5);
    *((_QWORD *)state + 5) = v137 + 1;
    *(_BYTE *)(v136 + v137) = v135;
    total_in = strm->total_in;
    v139 = *((_QWORD *)state + 2);
    v140 = *((_QWORD *)state + 5);
    *((_QWORD *)state + 5) = v140 + 1;
    *(_BYTE *)(v139 + v140) = total_in;
    v141 = strm->total_in >> 8;
    v142 = *((_QWORD *)state + 2);
    v143 = *((_QWORD *)state + 5);
    *((_QWORD *)state + 5) = v143 + 1;
    *(_BYTE *)(v142 + v143) = v141;
    v144 = strm->total_in >> 16;
    v145 = *((_QWORD *)state + 2);
    v146 = *((_QWORD *)state + 5);
    *((_QWORD *)state + 5) = v146 + 1;
    *(_BYTE *)(v145 + v146) = v144;
    v147 = strm->total_in >> 24;
  }
  else
  {
    v148 = v126 >> 16;
    v149 = *((_QWORD *)state + 2);
    v150 = *((_QWORD *)state + 5);
    *((_QWORD *)state + 5) = v150 + 1;
    *(_BYTE *)(v149 + v150) = BYTE3(v126);
    v151 = *((_QWORD *)state + 2);
    v152 = *((_QWORD *)state + 5);
    *((_QWORD *)state + 5) = v152 + 1;
    *(_BYTE *)(v151 + v152) = v148;
    v147 = strm->adler;
    v153 = *((_QWORD *)state + 2);
    v154 = *((_QWORD *)state + 5);
    *((_QWORD *)state + 5) = v154 + 1;
    *(_BYTE *)(v153 + v154) = BYTE1(v147);
  }
  v155 = *((_QWORD *)state + 2);
  v156 = *((_QWORD *)state + 5);
  *((_QWORD *)state + 5) = v156 + 1;
  *(_BYTE *)(v155 + v156) = v147;
  sub_22D25A000((uint64_t)strm);
  v157 = *((_DWORD *)state + 12);
  if (v157 >= 1)
    *((_DWORD *)state + 12) = -v157;
  return *((_QWORD *)state + 5) == 0;
}

BOOL sub_22D259910(_QWORD *a1)
{
  uint64_t v1;
  _BOOL8 result;
  int v3;
  BOOL v4;

  result = 1;
  if (a1)
  {
    if (a1[8])
    {
      if (a1[9])
      {
        v1 = a1[7];
        if (v1)
        {
          if (*(_QWORD **)v1 == a1)
          {
            v3 = *(_DWORD *)(v1 + 8);
            v4 = (v3 - 57) > 0x38 || ((1 << (v3 - 57)) & 0x100400400011001) == 0;
            if (!v4 || v3 == 666 || v3 == 42)
              return 0;
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_22D259990(__int32 a1, int8x16_t *a2, int a3, int8x16_t a4, double a5, int8x16_t a6, int8x16_t a7)
{
  int8x16_t v7;
  int8x16_t *v8;
  int8x16_t v9;
  uint64x2_t v10;
  BOOL v11;
  int v12;
  int8x16_t v13;
  int v14;
  int8x16_t *v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  uint64x2_t v20;
  uint64x2_t v21;
  int i;
  int8x16_t v23;
  int8x16_t v24;
  uint64x2_t v25;
  int8x16_t v26;
  int8x16_t v27;

  v7 = veorq_s8(a4, a4);
  v9 = *a2;
  v8 = a2 + 1;
  v7.i32[0] = a1;
  v10 = (uint64x2_t)veorq_s8(v7, v9);
  v11 = __OFSUB__(a3, 16);
  v12 = a3 - 16;
  if (!((v12 < 0) ^ v11 | (v12 == 0)))
  {
    if (v12 >= 48)
    {
      v13 = *v8;
      a6 = v8[1];
      a7 = v8[2];
      v8 += 3;
      v11 = __OFSUB__(v12, 112);
      v14 = v12 - 112;
      if (v14 < 0 == v11)
      {
        do
        {
          v16 = *v8;
          v17 = v8[1];
          v15 = v8 + 2;
          v10 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v10, qword_22D2629A0), veorq_s8((int8x16_t)vmull_p64(v10.u64[0], 0x154442BD4uLL), v16));
          v13 = veorq_s8((int8x16_t)vmull_high_p64((uint64x2_t)v13, qword_22D2629A0), veorq_s8((int8x16_t)vmull_p64(v13.u64[0], 0x154442BD4uLL), v17));
          v18 = *v15;
          v19 = v15[1];
          v8 = v15 + 2;
          a6 = veorq_s8((int8x16_t)vmull_high_p64((uint64x2_t)a6, qword_22D2629A0), veorq_s8((int8x16_t)vmull_p64(a6.u64[0], 0x154442BD4uLL), v18));
          a7 = veorq_s8((int8x16_t)vmull_high_p64((uint64x2_t)a7, qword_22D2629A0), veorq_s8((int8x16_t)vmull_p64(a7.u64[0], 0x154442BD4uLL), v19));
          v11 = __OFSUB__(v14, 64);
          v14 -= 64;
        }
        while (!((v14 < 0) ^ v11 | (v14 == 0)));
      }
      v20 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v10, qword_22D2629B0), veorq_s8((int8x16_t)vmull_p64(v10.u64[0], 0x1751997D0uLL), v13));
      v21 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v20, qword_22D2629B0), veorq_s8((int8x16_t)vmull_p64(v20.u64[0], 0x1751997D0uLL), a6));
      v10 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v21, qword_22D2629B0), veorq_s8((int8x16_t)vmull_p64(v21.u64[0], 0x1751997D0uLL), a7));
      v12 = v14 + 64;
    }
    v11 = __OFSUB__(v12, 16);
    for (i = v12 - 16; i < 0 == v11; i -= 16)
    {
      v23 = *v8++;
      v10 = (uint64x2_t)veorq_s8((int8x16_t)vmull_high_p64(v10, qword_22D2629B0), veorq_s8((int8x16_t)vmull_p64(v10.u64[0], 0x1751997D0uLL), v23));
      v11 = __OFSUB__(i, 16);
    }
  }
  v24 = veorq_s8(a6, a6);
  v25 = (uint64x2_t)veorq_s8(a7, a7);
  v24.i64[0] = v10.i64[1];
  v26 = veorq_s8(v24, (int8x16_t)vmull_p64(v10.u64[0], 0xCCAA009EuLL));
  v25.i32[2] = v26.i32[0];
  v26.i64[0] = *(uint64_t *)((char *)v26.i64 + 4);
  v27 = veorq_s8((int8x16_t)vmull_high_p64(v25, qword_22D2629C0), v26);
  v25.i32[0] = v27.i32[0];
  v25.i32[2] = vmull_p64(v25.u64[0], 0x1F7011641uLL).u32[0];
  return HIDWORD(veorq_s8((int8x16_t)vmull_high_p64(v25, qword_22D2629D0), v27).u64[0]);
}

uint64_t sub_22D259AD0(uint64_t a1, int a2)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int16 v17;
  uint64_t v18;
  unsigned __int16 v19;
  uint64_t v20;
  int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  const void *v44;
  uint64_t v46;
  int v47;
  uint64_t v48;
  const void *v49;
  uint64_t v50;
  const void *v51;

  while (1)
  {
    if (*(_DWORD *)(a1 + 180) > 0x105u)
      goto LABEL_6;
    sub_22D255BE0(a1);
    v4 = *(_DWORD *)(a1 + 180);
    if (!a2 && v4 < 0x106)
      return 0;
    if (!v4)
      break;
    if (v4 < 3)
      goto LABEL_8;
LABEL_6:
    v5 = *(_DWORD *)(a1 + 172);
    v6 = ((*(_DWORD *)(a1 + 128) << *(_DWORD *)(a1 + 144)) ^ *(unsigned __int8 *)(*(_QWORD *)(a1 + 96) + v5 + 2)) & *(_DWORD *)(a1 + 140);
    *(_DWORD *)(a1 + 128) = v6;
    v7 = *(_QWORD *)(a1 + 120);
    v8 = *(unsigned __int16 *)(v7 + 2 * v6);
    *(_WORD *)(*(_QWORD *)(a1 + 112) + 2 * (*(_DWORD *)(a1 + 88) & v5)) = v8;
    *(_WORD *)(v7 + 2 * v6) = v5;
    if (!v8 || v5 - v8 > *(_DWORD *)(a1 + 80) - 262)
    {
LABEL_8:
      v9 = *(_DWORD *)(a1 + 160);
      goto LABEL_10;
    }
    v9 = sub_22D2559E4(a1, v8);
    *(_DWORD *)(a1 + 160) = v9;
LABEL_10:
    if (v9 < 3)
    {
      v34 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 96) + *(unsigned int *)(a1 + 172));
      v35 = *(_QWORD *)(a1 + 5888);
      v36 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v36 + 1;
      *(_BYTE *)(v35 + v36) = 0;
      v37 = *(_QWORD *)(a1 + 5888);
      v38 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v38 + 1;
      *(_BYTE *)(v37 + v38) = 0;
      v39 = *(_QWORD *)(a1 + 5888);
      v40 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v40 + 1;
      *(_BYTE *)(v39 + v40) = v34;
      ++*(_WORD *)(a1 + 4 * v34 + 212);
      v21 = *(_DWORD *)(a1 + 5900);
      v22 = *(_DWORD *)(a1 + 5904);
      --*(_DWORD *)(a1 + 180);
      v33 = *(_DWORD *)(a1 + 172) + 1;
LABEL_19:
      *(_DWORD *)(a1 + 172) = v33;
      goto LABEL_21;
    }
    v10 = *(_DWORD *)(a1 + 172) - *(_DWORD *)(a1 + 176);
    v11 = *(_QWORD *)(a1 + 5888);
    v12 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v12 + 1;
    *(_BYTE *)(v11 + v12) = v10;
    v13 = *(_QWORD *)(a1 + 5888);
    v14 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v14 + 1;
    *(_BYTE *)(v13 + v14) = BYTE1(v10);
    v15 = *(_QWORD *)(a1 + 5888);
    v16 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v16 + 1;
    *(_BYTE *)(v15 + v16) = v9 - 3;
    v17 = v10 - 1;
    v18 = a1 + 4 * byte_22D262168[(v9 - 3)];
    ++*(_WORD *)(v18 + 1240);
    v19 = (v17 >> 7) + 256;
    if ((v17 & 0xFF00) == 0)
      v19 = v17;
    v20 = a1 + 4 * byte_22D261F68[v19];
    ++*(_WORD *)(v20 + 2504);
    v21 = *(_DWORD *)(a1 + 5900);
    v22 = *(_DWORD *)(a1 + 5904);
    v23 = *(_DWORD *)(a1 + 160);
    v24 = *(_DWORD *)(a1 + 180) - v23;
    *(_DWORD *)(a1 + 180) = v24;
    if (v23 <= *(_DWORD *)(a1 + 192) && v24 >= 3)
    {
      *(_DWORD *)(a1 + 160) = v23 - 1;
      v25 = *(_QWORD *)(a1 + 96);
      v27 = *(_DWORD *)(a1 + 140);
      v26 = *(_DWORD *)(a1 + 144);
      v29 = *(_QWORD *)(a1 + 112);
      v28 = *(_QWORD *)(a1 + 120);
      v30 = *(_DWORD *)(a1 + 88);
      v31 = *(_DWORD *)(a1 + 128);
      v32 = v23 - 2;
      v33 = *(_DWORD *)(a1 + 172) + 1;
      do
      {
        *(_DWORD *)(a1 + 172) = v33;
        v31 = ((v31 << v26) ^ *(unsigned __int8 *)(v25 + v33 + 2)) & v27;
        *(_DWORD *)(a1 + 128) = v31;
        *(_WORD *)(v29 + 2 * (v30 & v33)) = *(_WORD *)(v28 + 2 * v31);
        *(_WORD *)(v28 + 2 * v31) = v33;
        *(_DWORD *)(a1 + 160) = v32--;
        ++v33;
      }
      while (v32 != -1);
      goto LABEL_19;
    }
    v33 = *(_DWORD *)(a1 + 172) + v23;
    *(_DWORD *)(a1 + 172) = v33;
    *(_DWORD *)(a1 + 160) = 0;
    v41 = *(_QWORD *)(a1 + 96);
    v42 = *(unsigned __int8 *)(v41 + v33);
    *(_DWORD *)(a1 + 128) = v42;
    *(_DWORD *)(a1 + 128) = ((v42 << *(_DWORD *)(a1 + 144)) ^ *(unsigned __int8 *)(v41 + v33 + 1)) & *(_DWORD *)(a1 + 140);
LABEL_21:
    if (v21 == v22)
    {
      v43 = *(_QWORD *)(a1 + 152);
      v44 = v43 < 0 ? 0 : (const void *)(*(_QWORD *)(a1 + 96) + v43);
      sub_22D25A4F4((int *)a1, v44, v33 - v43, 0);
      *(_QWORD *)(a1 + 152) = *(unsigned int *)(a1 + 172);
      sub_22D25A000(*(_QWORD *)a1);
      if (!*(_DWORD *)(*(_QWORD *)a1 + 32))
        return 0;
    }
  }
  v46 = *(unsigned int *)(a1 + 172);
  if (v46 >= 2)
    v47 = 2;
  else
    v47 = *(_DWORD *)(a1 + 172);
  *(_DWORD *)(a1 + 5932) = v47;
  if (a2 == 4)
  {
    v48 = *(_QWORD *)(a1 + 152);
    if (v48 < 0)
      v49 = 0;
    else
      v49 = (const void *)(*(_QWORD *)(a1 + 96) + v48);
    sub_22D25A4F4((int *)a1, v49, v46 - v48, 1);
    *(_QWORD *)(a1 + 152) = *(unsigned int *)(a1 + 172);
    sub_22D25A000(*(_QWORD *)a1);
    if (*(_DWORD *)(*(_QWORD *)a1 + 32))
      return 3;
    else
      return 2;
  }
  else
  {
    if (*(_DWORD *)(a1 + 5900))
    {
      v50 = *(_QWORD *)(a1 + 152);
      v51 = v50 < 0 ? 0 : (const void *)(*(_QWORD *)(a1 + 96) + v50);
      sub_22D25A4F4((int *)a1, v51, v46 - v50, 0);
      *(_QWORD *)(a1 + 152) = *(unsigned int *)(a1 + 172);
      sub_22D25A000(*(_QWORD *)a1);
      if (!*(_DWORD *)(*(_QWORD *)a1 + 32))
        return 0;
    }
    return 1;
  }
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return inflateInit2_(strm, 15, version, stream_size);
}

uint64_t sub_22D259EA8(uint64_t a1)
{
  uint64_t v2;
  unsigned int *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(v2 + 120) = 0x70000000ALL;
  v3 = (unsigned int *)(v2 + 120);
  v4 = v2 + 1368;
  *(_QWORD *)(v2 + 144) = v2 + 1368;
  *(_QWORD *)(v2 + 104) = v2 + 1368;
  if (sub_22D256300(1, v2 + 152, *(_DWORD *)(v2 + 132), (char **)(v2 + 144), (unsigned int *)(v2 + 120), (_WORD *)(v2 + 792), 0x5A4u))
  {
LABEL_7:
    v5 = "invalid literal/lengths set";
LABEL_8:
    *(_QWORD *)(a1 + 48) = v5;
    *(_DWORD *)(v2 + 8) = 16209;
    return 1;
  }
  else
  {
    v5 = "invalid distances set";
    while (1)
    {
      v6 = *(_QWORD *)(v2 + 144);
      *(_QWORD *)(v2 + 112) = v6;
      result = sub_22D256300(2, v2 + 152 + 2 * *(unsigned int *)(v2 + 132), *(_DWORD *)(v2 + 136), (char **)(v2 + 144), (unsigned int *)(v2 + 124), (_WORD *)(v2 + 792), (unint64_t)(v2 + 7144 - v6) >> 2);
      if (!(_DWORD)result)
        break;
      if (*v3 <= 9 && *(_DWORD *)(v2 + 124) < 7u)
        goto LABEL_8;
      *(_QWORD *)(v2 + 120) = 0x600000009;
      *(_QWORD *)(v2 + 144) = v4;
      *(_QWORD *)(v2 + 104) = v4;
      if (sub_22D256300(1, v2 + 152, *(_DWORD *)(v2 + 132), (char **)(v2 + 144), v3, (_WORD *)(v2 + 792), 0x5A4u))goto LABEL_7;
    }
  }
  return result;
}

void sub_22D259FE8(int a1, void *a2)
{
  free(a2);
}

void *sub_22D259FF0(uint64_t a1, int a2, int a3)
{
  return malloc_type_malloc((a3 * a2), 0xC28A752BuLL);
}

uint64_t sub_22D25A000(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  unsigned int v4;
  unsigned int v5;
  size_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 56);
  result = sub_22D25A124(v2);
  v4 = *(_DWORD *)(v2 + 40);
  v5 = *(_DWORD *)(a1 + 32);
  if (v5 >= v4)
    v6 = v4;
  else
    v6 = v5;
  if ((_DWORD)v6)
  {
    result = (uint64_t)memcpy(*(void **)(a1 + 24), *(const void **)(v2 + 32), v6);
    *(_QWORD *)(a1 + 24) += v6;
    *(_QWORD *)(a1 + 40) += v6;
    *(_DWORD *)(a1 + 32) -= v6;
    v7 = *(_QWORD *)(v2 + 40) - v6;
    *(_QWORD *)(v2 + 32) += v6;
    *(_QWORD *)(v2 + 40) = v7;
    if (!v7)
      *(_QWORD *)(v2 + 32) = *(_QWORD *)(v2 + 16);
  }
  return result;
}

uint64_t sub_22D25A094(uint64_t result)
{
  int v1;
  int v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_DWORD *)(result + 5940);
  if (v1 == 16)
  {
    v2 = 0;
    v3 = *(_BYTE *)(result + 5936);
    v4 = *(_QWORD *)(result + 40);
    *(_QWORD *)(result + 40) = v4 + 1;
    *(_BYTE *)(*(_QWORD *)(result + 16) + v4) = v3;
    v5 = *(_BYTE *)(result + 5937);
    v6 = *(_QWORD *)(result + 16);
    v7 = *(_QWORD *)(result + 40);
    *(_QWORD *)(result + 40) = v7 + 1;
    *(_BYTE *)(v6 + v7) = v5;
    *(_WORD *)(result + 5936) = 0;
  }
  else
  {
    if (v1 < 8)
      return result;
    v8 = *(_BYTE *)(result + 5936);
    v9 = *(_QWORD *)(result + 16);
    v10 = *(_QWORD *)(result + 40);
    *(_QWORD *)(result + 40) = v10 + 1;
    *(_BYTE *)(v9 + v10) = v8;
    *(_WORD *)(result + 5936) = *(unsigned __int8 *)(result + 5937);
    v2 = *(_DWORD *)(result + 5940) - 8;
  }
  *(_DWORD *)(result + 5940) = v2;
  return result;
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  int result;
  unsigned int v12;
  uint64_t (*zalloc)(voidpf, uint64_t, uint64_t);
  unsigned int v14;
  int v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  if (!version)
    return -6;
  result = -6;
  if (stream_size == 112 && *version == 49)
  {
    if (!strm)
      return -2;
    v12 = windowBits;
    strm->msg = 0;
    zalloc = (uint64_t (*)(voidpf, uint64_t, uint64_t))strm->zalloc;
    if (!zalloc)
    {
      zalloc = (uint64_t (*)(voidpf, uint64_t, uint64_t))sub_22D259FF0;
      strm->zalloc = (alloc_func)sub_22D259FF0;
      strm->opaque = 0;
    }
    if (!strm->zfree)
      strm->zfree = (free_func)sub_22D259FE8;
    v14 = level == -1 ? 6 : level;
    if (windowBits < 0)
    {
      v15 = 0;
      v12 = -windowBits;
      v16 = 1;
    }
    else if (windowBits < 0x10)
    {
      v16 = 0;
      v15 = 1;
    }
    else
    {
      v15 = 2;
      v16 = 1;
      v12 = windowBits - 16;
    }
    result = -2;
    if (strategy <= 4
      && v14 <= 9
      && method == 8
      && (memLevel - 10) >= 0xFFFFFFF7
      && v12 >= 8
      && v12 <= 0xF)
    {
      if (v12 != 8)
        v16 = 0;
      if ((v16 & 1) == 0)
      {
        v17 = zalloc(strm->opaque, 1, 5952);
        if (v17)
        {
          v18 = v17;
          if (v12 == 8)
            v19 = 9;
          else
            v19 = v12;
          strm->state = (internal_state *)v17;
          *(_QWORD *)v17 = strm;
          *(_DWORD *)(v17 + 8) = 42;
          *(_DWORD *)(v17 + 48) = v15;
          *(_QWORD *)(v17 + 56) = 0;
          *(_DWORD *)(v17 + 80) = 1 << v19;
          *(_DWORD *)(v17 + 84) = v19;
          *(_DWORD *)(v17 + 88) = (1 << v19) - 1;
          *(_DWORD *)(v17 + 132) = 128 << memLevel;
          *(_DWORD *)(v17 + 136) = memLevel + 7;
          *(_DWORD *)(v17 + 140) = (128 << memLevel) - 1;
          *(_DWORD *)(v17 + 144) = (memLevel + 9) / 3u;
          *(_QWORD *)(v17 + 96) = ((uint64_t (*)(voidpf))strm->zalloc)(strm->opaque);
          *(_QWORD *)(v18 + 112) = ((uint64_t (*)(voidpf, _QWORD, uint64_t))strm->zalloc)(strm->opaque, *(unsigned int *)(v18 + 80), 2);
          *(_QWORD *)(v18 + 120) = ((uint64_t (*)(voidpf, _QWORD, uint64_t))strm->zalloc)(strm->opaque, *(unsigned int *)(v18 + 132), 2);
          *(_QWORD *)(v18 + 5944) = 0;
          *(_DWORD *)(v18 + 5896) = 64 << memLevel;
          v20 = ((uint64_t (*)(voidpf))strm->zalloc)(strm->opaque);
          v21 = *(unsigned int *)(v18 + 5896);
          *(_QWORD *)(v18 + 16) = v20;
          *(_QWORD *)(v18 + 24) = 4 * v21;
          if (*(_QWORD *)(v18 + 96) && *(_QWORD *)(v18 + 112) && *(_QWORD *)(v18 + 120) && v20)
          {
            *(_QWORD *)(v18 + 5888) = v20 + v21;
            *(_DWORD *)(v18 + 5904) = 3 * v21 - 3;
            *(_DWORD *)(v18 + 196) = v14;
            *(_DWORD *)(v18 + 200) = strategy;
            *(_BYTE *)(v18 + 72) = 8;
            return deflateReset(strm);
          }
          *(_DWORD *)(v18 + 8) = 666;
          strm->msg = "insufficient memory";
          deflateEnd(strm);
        }
        return -4;
      }
    }
  }
  return result;
}

int deflateReset(z_streamp strm)
{
  int v2;
  internal_state *state;
  char *v4;
  size_t v5;
  unsigned __int16 *v6;
  int v7;
  int v8;

  v2 = deflateResetKeep(strm);
  if (!v2)
  {
    state = strm->state;
    *((_QWORD *)state + 13) = 2 * *((unsigned int *)state + 20);
    v4 = (char *)*((_QWORD *)state + 15);
    v5 = 2 * (*((_DWORD *)state + 33) - 1);
    *(_WORD *)&v4[v5] = 0;
    bzero(v4, v5);
    v6 = (unsigned __int16 *)((char *)&unk_24F86F108 + 16 * *((int *)state + 49));
    v7 = v6[2];
    *((_DWORD *)state + 51) = *v6;
    *((_DWORD *)state + 52) = v7;
    v8 = v6[1];
    *((_DWORD *)state + 47) = v6[3];
    *((_DWORD *)state + 48) = v8;
    *((_QWORD *)state + 19) = 0;
    *((_DWORD *)state + 1483) = 0;
    *(_QWORD *)((char *)state + 180) = 0x200000000;
    *((_DWORD *)state + 40) = 2;
    *((_QWORD *)state + 21) = 0;
    *((_DWORD *)state + 32) = 0;
  }
  return v2;
}

int deflateResetKeep(z_streamp a1)
{
  internal_state *state;
  int v4;
  BOOL v5;
  int v6;
  uLong v7;

  if (sub_22D259910(a1))
    return -2;
  a1->total_in = 0;
  a1->total_out = 0;
  a1->msg = 0;
  a1->data_type = 2;
  state = a1->state;
  *((_QWORD *)state + 4) = *((_QWORD *)state + 2);
  *((_QWORD *)state + 5) = 0;
  v4 = *((_DWORD *)state + 12);
  if (v4 < 0)
  {
    v4 = -v4;
    *((_DWORD *)state + 12) = v4;
  }
  v5 = v4 == 2;
  if (v4 == 2)
    v6 = 57;
  else
    v6 = 42;
  *((_DWORD *)state + 2) = v6;
  if (v5)
    v7 = crc32(0, 0, 0);
  else
    v7 = adler32(0, 0, 0);
  a1->adler = v7;
  *((_DWORD *)state + 19) = -2;
  sub_22D25BA08((uint64_t)state);
  return 0;
}

void sub_22D25A4F4(int *a1, const void *a2, size_t a3, int a4)
{
  uint64_t v8;
  unint64_t v9;
  int v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  int v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  void *v44;
  void *v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  unsigned int v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  uint64_t v62;
  char *v63;
  int v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _WORD *v72;

  if (a1[49] < 1)
  {
    v11 = 0;
    v12 = a3 + 5;
    v13 = a3 + 5;
    if (!a2)
      goto LABEL_24;
  }
  else
  {
    if (*(_DWORD *)(*(_QWORD *)a1 + 88) == 2)
    {
      v8 = 0;
      v9 = 4093624447;
      do
      {
        if ((v9 & 1) != 0 && LOWORD(a1[v8 + 53]))
        {
          v10 = 0;
          goto LABEL_14;
        }
        v9 >>= 1;
        ++v8;
      }
      while (v8 != 32);
      if (!*((_WORD *)a1 + 124) && !*((_WORD *)a1 + 126) && !*((_WORD *)a1 + 132))
      {
        v71 = 0;
        v72 = a1 + 85;
        while (1)
        {
          v10 = (unsigned __int16)v72[v71];
          if (v72[v71])
            break;
          v71 += 2;
          if (v71 == 448)
            goto LABEL_14;
        }
      }
      v10 = 1;
LABEL_14:
      *(_DWORD *)(*(_QWORD *)a1 + 88) = v10;
    }
    sub_22D25AA3C((uint64_t)a1, (uint64_t)(a1 + 726));
    sub_22D25AA3C((uint64_t)a1, (uint64_t)(a1 + 732));
    sub_22D25AFE8(a1, (uint64_t)(a1 + 53), a1[728]);
    sub_22D25AFE8(a1, (uint64_t)(a1 + 626), a1[734]);
    sub_22D25AA3C((uint64_t)a1, (uint64_t)(a1 + 738));
    v11 = 0x12u;
    while (!HIWORD(a1[byte_22D262898[v11] + 687]))
    {
      if (v11-- <= 3)
      {
        v11 = 2;
        break;
      }
    }
    v15 = *((_QWORD *)a1 + 739) + 3 * (int)v11;
    *((_QWORD *)a1 + 739) = v15 + 17;
    v13 = (unint64_t)(v15 + 27) >> 3;
    v12 = (unint64_t)(*((_QWORD *)a1 + 740) + 10) >> 3;
    if (v12 < v13)
      v13 = (unint64_t)(*((_QWORD *)a1 + 740) + 10) >> 3;
    if (!a2)
      goto LABEL_24;
  }
  if (a3 + 4 <= v13)
  {
    sub_22D25BA50((uint64_t)a1, a2, a3, a4);
    goto LABEL_50;
  }
LABEL_24:
  v16 = a1[1485];
  if (v12 == v13 || a1[50] == 4)
  {
    v25 = a4 + 2;
    if (v16 < 14)
    {
      *((_WORD *)a1 + 2968) |= v25 << v16;
      v32 = v16 + 3;
    }
    else
    {
      v26 = *((_WORD *)a1 + 2968) | (v25 << v16);
      *((_WORD *)a1 + 2968) = v26;
      v27 = *((_QWORD *)a1 + 2);
      v28 = *((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v28 + 1;
      *(_BYTE *)(v27 + v28) = v26;
      LOBYTE(v26) = *((_BYTE *)a1 + 5937);
      v29 = *((_QWORD *)a1 + 2);
      v30 = *((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v30 + 1;
      *(_BYTE *)(v29 + v30) = v26;
      v31 = a1[1485];
      *((_WORD *)a1 + 2968) = (unsigned __int16)(a4 + 2) >> (16 - v31);
      v32 = v31 - 13;
    }
    a1[1485] = v32;
    v44 = &unk_22D262268;
    v45 = &unk_22D2626E8;
    v46 = (uint64_t)a1;
  }
  else
  {
    v17 = a4 + 4;
    if (v16 < 14)
    {
      v23 = *((unsigned __int16 *)a1 + 2968) | (v17 << v16);
      v24 = v16 + 3;
    }
    else
    {
      v18 = *((_WORD *)a1 + 2968) | (v17 << v16);
      *((_WORD *)a1 + 2968) = v18;
      v19 = *((_QWORD *)a1 + 2);
      v20 = *((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v20 + 1;
      *(_BYTE *)(v19 + v20) = v18;
      LOBYTE(v18) = *((_BYTE *)a1 + 5937);
      v21 = *((_QWORD *)a1 + 2);
      v22 = *((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v22 + 1;
      *(_BYTE *)(v21 + v22) = v18;
      LODWORD(v21) = a1[1485];
      v23 = (unsigned __int16)(a4 + 4) >> (16 - v21);
      v24 = v21 - 13;
    }
    a1[1485] = v24;
    v33 = a1[728];
    v34 = a1[734];
    v35 = v33 + 65280;
    if (v24 < 12)
    {
      v42 = v23 | (v35 << v24);
      v43 = v24 + 5;
    }
    else
    {
      v36 = v23 | (v35 << v24);
      *((_WORD *)a1 + 2968) = v36;
      v37 = *((_QWORD *)a1 + 2);
      v38 = *((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v38 + 1;
      *(_BYTE *)(v37 + v38) = v36;
      LOBYTE(v36) = *((_BYTE *)a1 + 5937);
      v39 = *((_QWORD *)a1 + 2);
      v40 = *((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v40 + 1;
      *(_BYTE *)(v39 + v40) = v36;
      v41 = a1[1485];
      v42 = (unsigned __int16)(v33 - 256) >> (16 - v41);
      v43 = v41 - 11;
    }
    a1[1485] = v43;
    if (v43 < 12)
    {
      v52 = v42 | (v34 << v43);
      v53 = v43 + 5;
    }
    else
    {
      v47 = v42 | (v34 << v43);
      *((_WORD *)a1 + 2968) = v47;
      v48 = *((_QWORD *)a1 + 2);
      v49 = *((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v49 + 1;
      *(_BYTE *)(v48 + v49) = v47;
      LOBYTE(v47) = *((_BYTE *)a1 + 5937);
      v50 = *((_QWORD *)a1 + 2);
      v51 = *((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v51 + 1;
      *(_BYTE *)(v50 + v51) = v47;
      LODWORD(v50) = a1[1485];
      v52 = (unsigned __int16)v34 >> (16 - v50);
      v53 = v50 - 11;
    }
    a1[1485] = v53;
    v54 = v11 + 65533;
    if (v53 < 13)
    {
      v60 = v52 | (v54 << v53);
      *((_WORD *)a1 + 2968) = v60;
      v61 = v53 + 4;
    }
    else
    {
      v55 = v52 | (v54 << v53);
      *((_WORD *)a1 + 2968) = v55;
      v56 = *((_QWORD *)a1 + 2);
      v57 = *((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v57 + 1;
      *(_BYTE *)(v56 + v57) = v55;
      LOBYTE(v55) = *((_BYTE *)a1 + 5937);
      v58 = *((_QWORD *)a1 + 2);
      v59 = *((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v59 + 1;
      *(_BYTE *)(v58 + v59) = v55;
      LODWORD(v58) = a1[1485];
      v60 = (unsigned __int16)(v11 - 3) >> (16 - v58);
      *((_WORD *)a1 + 2968) = v60;
      v61 = v58 - 12;
    }
    a1[1485] = v61;
    if ((v11 & 0x80000000) == 0)
    {
      v62 = v11 + 1;
      v63 = byte_22D262898;
      do
      {
        v64 = *v63++;
        v65 = HIWORD(a1[v64 + 687]);
        v60 |= v65 << v61;
        *((_WORD *)a1 + 2968) = v60;
        if (v61 < 14)
        {
          v61 += 3;
        }
        else
        {
          v66 = *((_QWORD *)a1 + 2);
          v67 = *((_QWORD *)a1 + 5);
          *((_QWORD *)a1 + 5) = v67 + 1;
          *(_BYTE *)(v66 + v67) = v60;
          v68 = *((_BYTE *)a1 + 5937);
          v69 = *((_QWORD *)a1 + 2);
          v70 = *((_QWORD *)a1 + 5);
          *((_QWORD *)a1 + 5) = v70 + 1;
          *(_BYTE *)(v69 + v70) = v68;
          LODWORD(v69) = a1[1485];
          v60 = v65 >> (16 - v69);
          *((_WORD *)a1 + 2968) = v60;
          v61 = v69 - 13;
        }
        a1[1485] = v61;
        --v62;
      }
      while (v62);
    }
    sub_22D25B0DC((uint64_t)a1, (uint64_t)(a1 + 53), v33);
    sub_22D25B0DC((uint64_t)a1, (uint64_t)(a1 + 626), v34);
    v46 = (uint64_t)a1;
    v44 = a1 + 53;
    v45 = a1 + 626;
  }
  sub_22D25B5E0(v46, (uint64_t)v44, (uint64_t)v45);
LABEL_50:
  sub_22D25B57C((uint64_t)a1);
  if (a4)
    sub_22D25B9A4((uint64_t)a1);
}

uint64_t sub_22D25AA3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  _WORD *v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _WORD *v27;
  _WORD *v28;
  unsigned int v29;
  uint64_t result;
  int v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  BOOL v44;
  int v45;
  int v46;
  _WORD *v48;
  uint64_t v49;
  __int16 v50;
  int v51;
  BOOL v52;
  int v53;
  int v54;
  int *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _WORD *v59;
  uint64_t v60;
  unsigned int v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  int v67;
  unsigned int v68;
  unsigned int v69;
  int v70;
  unsigned __int16 v71[16];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)a2;
  v5 = *(uint64_t **)(a2 + 16);
  v6 = *v5;
  v7 = *((unsigned int *)v5 + 5);
  v8 = (int *)(a1 + 5300);
  *(_QWORD *)(a1 + 5300) = 0x23D00000000;
  if ((int)v7 < 1)
  {
    v13 = 0;
    v11 = -1;
  }
  else
  {
    v9 = 0;
    v10 = (_WORD *)(v4 + 2);
    v11 = -1;
    do
    {
      if (*(v10 - 1))
      {
        v12 = *(int *)(a1 + 5300) + 1;
        *(_DWORD *)(a1 + 5300) = v12;
        *(_DWORD *)(a1 + 4 * v12 + 3008) = v9;
        *(_BYTE *)(a1 + 5308 + v9) = 0;
        v11 = v9;
      }
      else
      {
        *v10 = 0;
      }
      v10 += 2;
      ++v9;
    }
    while (v7 != v9);
    v13 = *v8;
    if (*v8 > 1)
      goto LABEL_20;
  }
  v14 = v11;
  do
  {
    if (v14 >= 2)
      v11 = v14;
    else
      v11 = v14 + 1;
    if (v14 < 2)
      v15 = v14 + 1;
    else
      v15 = 0;
    v16 = v13 + 1;
    *(_DWORD *)(a1 + 5300) = v16;
    *(_DWORD *)(a1 + 4 * v16 + 3008) = v15;
    *(_WORD *)(v4 + 4 * v15) = 1;
    *(_BYTE *)(a1 + v15 + 5308) = 0;
    --*(_QWORD *)(a1 + 5912);
    if (v6)
      *(_QWORD *)(a1 + 5920) -= *(unsigned __int16 *)(v6 + 4 * v15 + 2);
    v13 = *v8;
    v14 = v11;
  }
  while (*v8 < 2);
LABEL_20:
  *(_DWORD *)(a2 + 8) = v11;
  v17 = v13 >> 1;
  do
  {
    sub_22D25AEE0(a1, v4, v17);
    v18 = v17-- != 0;
  }
  while (v17 != 0 && v18);
  v19 = *(_DWORD *)(a1 + 5300);
  v20 = (int)v7;
  v21 = 4 * (int)v7;
  do
  {
    v22 = *(int *)(a1 + 3012);
    *(_DWORD *)(a1 + 5300) = v19 - 1;
    v23 = a1 + 3008;
    *(_DWORD *)(a1 + 3012) = *(_DWORD *)(a1 + 3008 + 4 * v19);
    sub_22D25AEE0(a1, v4, 1);
    v24 = *(int *)(a1 + 3012);
    v25 = *(int *)(a1 + 5304) - 1;
    *(_DWORD *)(a1 + 5304) = v25;
    *(_DWORD *)(v23 + 4 * v25) = v22;
    v26 = *(int *)(a1 + 5304) - 1;
    *(_DWORD *)(a1 + 5304) = v26;
    *(_DWORD *)(v23 + 4 * v26) = v24;
    v27 = (_WORD *)(v4 + 4 * v22);
    v28 = (_WORD *)(v4 + 4 * v24);
    *(_WORD *)(v4 + v21) = *v28 + *v27;
    v29 = *(unsigned __int8 *)(a1 + 5308 + v24);
    if (*(unsigned __int8 *)(a1 + 5308 + v22) > v29)
      LOBYTE(v29) = *(_BYTE *)(a1 + 5308 + v22);
    *(_BYTE *)(a1 + 5308 + v20) = v29 + 1;
    v28[1] = v20;
    v27[1] = v20;
    *(_DWORD *)(a1 + 3012) = v20;
    result = sub_22D25AEE0(a1, v4, 1);
    v19 = *(_DWORD *)(a1 + 5300);
    v21 += 4;
    ++v20;
  }
  while (v19 > 1);
  v31 = *(_DWORD *)(a1 + 3012);
  v32 = *(int *)(a1 + 5304) - 1;
  *(_DWORD *)(a1 + 5304) = v32;
  *(_DWORD *)(v23 + 4 * v32) = v31;
  v33 = *(_QWORD *)a2;
  v34 = *(_DWORD *)(a2 + 8);
  v35 = *(uint64_t **)(a2 + 16);
  v36 = *v35;
  v37 = v35[1];
  v38 = *((_DWORD *)v35 + 4);
  v39 = *((int *)v35 + 6);
  *(_OWORD *)(a1 + 2992) = 0u;
  *(_OWORD *)(a1 + 2976) = 0u;
  *(_WORD *)(v33 + 4 * *(int *)(v23 + 4 * *(int *)(a1 + 5304)) + 2) = 0;
  v40 = *(int *)(a1 + 5304);
  if ((int)v40 <= 571)
  {
    v41 = 0;
    do
    {
      v42 = *(int *)(a1 + 3012 + 4 * v40);
      result = v33 + 4 * v42;
      v43 = *(unsigned __int16 *)(v33 + 4 * *(unsigned __int16 *)(result + 2) + 2);
      v44 = (int)v39 <= v43;
      if ((int)v39 > v43)
        v45 = v43 + 1;
      else
        v45 = v39;
      if (v44)
        ++v41;
      *(_WORD *)(result + 2) = v45;
      if ((int)v42 <= v34)
      {
        ++*(_WORD *)(a1 + 2 * v45 + 2976);
        v46 = (int)v42 >= v38 ? *(_DWORD *)(v37 + 4 * ((int)v42 - v38)) : 0;
        result = *(unsigned __int16 *)result;
        *(_QWORD *)(a1 + 5912) += result * (unint64_t)(v46 + v45);
        if (v36)
          *(_QWORD *)(a1 + 5920) += result
                                  * (unint64_t)(v46 + *(unsigned __int16 *)(v36 + 4 * v42 + 2));
      }
    }
    while ((_DWORD)v40++ != 571);
    if (v41)
    {
      do
      {
        v48 = (_WORD *)(a1 + 2 * v39 + 2976);
        v49 = (v39 << 32) + 0x100000000;
        do
        {
          v51 = (unsigned __int16)*--v48;
          v50 = v51;
          v49 -= 0x100000000;
        }
        while (!v51);
        *v48 = v50 - 1;
        *(_WORD *)(a1 + (v49 >> 31) + 2976) += 2;
        --*(_WORD *)(a1 + 2 * v39 + 2976);
        v52 = __OFSUB__(v41, 2);
        v41 -= 2;
      }
      while (!((v41 < 0) ^ v52 | (v41 == 0)));
      if ((_DWORD)v39)
      {
        v53 = 573;
        do
        {
          v54 = *(unsigned __int16 *)(a1 + 2 * v39 + 2976);
          if (*(_WORD *)(a1 + 2 * v39 + 2976))
          {
            do
            {
              v55 = (int *)(a1 + 3004 + 4 * v53);
              do
              {
                v57 = *v55--;
                v56 = v57;
                --v53;
              }
              while ((int)v57 > v34);
              v58 = v33 + 4 * v56;
              v61 = *(unsigned __int16 *)(v58 + 2);
              v59 = (_WORD *)(v58 + 2);
              v60 = v61;
              if ((_DWORD)v39 != v61)
              {
                *(_QWORD *)(a1 + 5912) += (v39 - v60) * *(unsigned __int16 *)(v33 + 4 * v56);
                *v59 = v39;
              }
              --v54;
            }
            while (v54);
          }
          --v39;
        }
        while ((_DWORD)v39);
      }
    }
  }
  v62 = 0;
  v63 = 0;
  do
  {
    v63 = 2 * (v63 + *(unsigned __int16 *)(a1 + 2976 + v62 * 2));
    v71[++v62] = v63;
  }
  while (v62 != 15);
  if ((v11 & 0x80000000) == 0)
  {
    v64 = 0;
    do
    {
      v65 = v4 + 4 * v64;
      v66 = *(unsigned __int16 *)(v65 + 2);
      if (*(_WORD *)(v65 + 2))
      {
        v67 = 0;
        v68 = v71[*(unsigned __int16 *)(v65 + 2)];
        v71[v66] = v68 + 1;
        v69 = v66 + 1;
        do
        {
          v70 = v67 | v68 & 1;
          v68 >>= 1;
          v67 = 2 * v70;
          --v69;
        }
        while (v69 > 1);
        *(_WORD *)(v4 + 4 * v64) = v70;
      }
      ++v64;
    }
    while (v64 != v11 + 1);
  }
  return result;
}

uint64_t sub_22D25AEE0(uint64_t result, uint64_t a2, int a3)
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;

  v3 = *(_DWORD *)(result + 4 * a3 + 3008);
  v4 = 2 * a3;
  v5 = *(_DWORD *)(result + 5300);
  if (2 * a3 <= v5)
  {
    v7 = result + 5308;
    while (1)
    {
      if (v4 >= v5)
      {
        v6 = v4;
        v8 = v4;
      }
      else
      {
        v8 = v4;
        v9 = *(int *)(result + 3008 + 4 * (v4 | 1));
        v10 = *(unsigned __int16 *)(a2 + 4 * v9);
        v11 = *(int *)(result + 3008 + 4 * v4);
        v12 = *(unsigned __int16 *)(a2 + 4 * v11);
        if (v10 >= v12)
        {
          if (v10 != v12)
          {
            v6 = v4;
            goto LABEL_11;
          }
          v13 = *(unsigned __int8 *)(v7 + v9);
          v6 = v4;
          if (v13 > *(unsigned __int8 *)(v7 + v11))
            goto LABEL_11;
        }
        v8 = v4 | 1;
        v6 = v4 | 1;
      }
LABEL_11:
      v14 = *(unsigned __int16 *)(a2 + 4 * v3);
      v15 = *(_DWORD *)(result + 4 * v8 + 3008);
      v16 = *(unsigned __int16 *)(a2 + 4 * v15);
      if (v14 < v16
        || v14 == v16
        && *(unsigned __int8 *)(result + v3 + 5308) <= *(unsigned __int8 *)(result + v15 + 5308))
      {
        break;
      }
      *(_DWORD *)(result + 4 * a3 + 3008) = v15;
      v4 = 2 * v6;
      v5 = *(_DWORD *)(result + 5300);
      a3 = v6;
      if (2 * v6 > v5)
        goto LABEL_15;
    }
  }
  v6 = a3;
LABEL_15:
  *(_DWORD *)(result + 4 * v6 + 3008) = v3;
  return result;
}

_WORD *sub_22D25AFE8(_WORD *result, uint64_t a2, int a3)
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  unsigned __int16 *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v14;
  int v15;

  v3 = *(unsigned __int16 *)(a2 + 2);
  v4 = (a3 + 1);
  *(_WORD *)(a2 + 4 * (int)v4 + 2) = -1;
  if ((a3 & 0x80000000) == 0)
  {
    v5 = 0;
    if (v3)
      v6 = 4;
    else
      v6 = 3;
    if (v3)
      v7 = 7;
    else
      v7 = 138;
    v8 = (unsigned __int16 *)(a2 + 6);
    v9 = -1;
    do
    {
      v11 = *v8;
      v8 += 2;
      v10 = v11;
      v12 = v5 + 1;
      if (v5 + 1 >= v7 || v3 != v10)
      {
        if (v12 >= v6)
        {
          if (v3)
          {
            if (v3 != v9)
              ++result[2 * v3 + 1374];
            ++result[1406];
          }
          else if (v5 > 9)
          {
            ++result[1410];
          }
          else
          {
            ++result[1408];
          }
        }
        else
        {
          result[2 * v3 + 1374] += v12;
        }
        if (v3 == v10)
          v14 = 6;
        else
          v14 = 7;
        if (v3 == v10)
          v15 = 3;
        else
          v15 = 4;
        v12 = 0;
        if (v10)
          v7 = v14;
        else
          v7 = 138;
        if (v10)
          v6 = v15;
        else
          v6 = 3;
        v9 = v3;
      }
      v5 = v12;
      v3 = v10;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t sub_22D25B0DC(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  unsigned int v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unsigned __int16 *v12;
  unsigned __int16 *v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  unsigned int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  unsigned int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  unsigned int v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  int v78;
  int v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  int v86;
  int v87;

  if ((a3 & 0x80000000) == 0)
  {
    v3 = 0;
    v4 = 0;
    v5 = *(unsigned __int16 *)(a2 + 2);
    if (*(_WORD *)(a2 + 2))
      v6 = 7;
    else
      v6 = 138;
    if (*(_WORD *)(a2 + 2))
      v7 = 4;
    else
      v7 = 3;
    v8 = -1;
    do
    {
      ++v3;
      v9 = *(unsigned __int16 *)(a2 + 4 * v3 + 2);
      v10 = v4 + 1;
      if (v4 + 1 >= v6 || v5 != v9)
      {
        if (v10 >= v7)
        {
          v23 = *(_DWORD *)(result + 5940);
          if (v5)
          {
            if (v5 != v8)
            {
              v24 = result + 4 * v5;
              v25 = *(unsigned __int16 *)(v24 + 2750);
              v26 = *(unsigned __int16 *)(v24 + 2748);
              v27 = *(unsigned __int16 *)(result + 5936);
              v28 = v27 | (v26 << v23);
              *(_WORD *)(result + 5936) = v27 | ((_WORD)v26 << v23);
              if (v23 <= 16 - v25)
              {
                v23 += v25;
              }
              else
              {
                v29 = *(_QWORD *)(result + 16);
                v30 = *(_QWORD *)(result + 40);
                *(_QWORD *)(result + 40) = v30 + 1;
                *(_BYTE *)(v29 + v30) = v28;
                LOBYTE(v29) = *(_BYTE *)(result + 5937);
                v31 = *(_QWORD *)(result + 16);
                v32 = *(_QWORD *)(result + 40);
                *(_QWORD *)(result + 40) = v32 + 1;
                *(_BYTE *)(v31 + v32) = v29;
                LODWORD(v29) = *(_DWORD *)(result + 5940);
                *(_WORD *)(result + 5936) = v26 >> (16 - v29);
                v23 = v25 + v29 - 16;
              }
              *(_DWORD *)(result + 5940) = v23;
              v10 = v4;
            }
            v52 = *(unsigned __int16 *)(result + 2814);
            v53 = *(unsigned __int16 *)(result + 2812);
            v54 = *(unsigned __int16 *)(result + 5936) | (v53 << v23);
            if (v23 <= 16 - v52)
            {
              v60 = v23 + v52;
            }
            else
            {
              *(_WORD *)(result + 5936) = v54;
              v55 = *(_QWORD *)(result + 16);
              v56 = *(_QWORD *)(result + 40);
              *(_QWORD *)(result + 40) = v56 + 1;
              *(_BYTE *)(v55 + v56) = v54;
              v57 = *(_BYTE *)(result + 5937);
              v58 = *(_QWORD *)(result + 16);
              v59 = *(_QWORD *)(result + 40);
              *(_QWORD *)(result + 40) = v59 + 1;
              *(_BYTE *)(v58 + v59) = v57;
              LODWORD(v58) = *(_DWORD *)(result + 5940);
              v54 = v53 >> (16 - v58);
              v60 = v52 + v58 - 16;
            }
            *(_DWORD *)(result + 5940) = v60;
            v61 = v10 + 65533;
            if (v60 < 15)
            {
              *(_WORD *)(result + 5936) = v54 | (v61 << v60);
              v69 = v60 + 2;
            }
            else
            {
              v62 = v54 | (v61 << v60);
              *(_WORD *)(result + 5936) = v62;
              v63 = *(_QWORD *)(result + 16);
              v64 = *(_QWORD *)(result + 40);
              *(_QWORD *)(result + 40) = v64 + 1;
              *(_BYTE *)(v63 + v64) = v62;
              LOBYTE(v62) = *(_BYTE *)(result + 5937);
              v65 = *(_QWORD *)(result + 16);
              v66 = *(_QWORD *)(result + 40);
              *(_QWORD *)(result + 40) = v66 + 1;
              *(_BYTE *)(v65 + v66) = v62;
              v67 = (unsigned __int16)v61;
              v68 = *(_DWORD *)(result + 5940);
              *(_WORD *)(result + 5936) = v67 >> (16 - v68);
              v69 = v68 - 14;
            }
          }
          else
          {
            v33 = *(unsigned __int16 *)(result + 5936);
            if (v4 > 9)
            {
              v43 = *(unsigned __int16 *)(result + 2822);
              v44 = *(unsigned __int16 *)(result + 2820);
              v45 = v33 | (v44 << v23);
              if (v23 <= 16 - v43)
              {
                v51 = v23 + v43;
              }
              else
              {
                *(_WORD *)(result + 5936) = v45;
                v46 = *(_QWORD *)(result + 16);
                v47 = *(_QWORD *)(result + 40);
                *(_QWORD *)(result + 40) = v47 + 1;
                *(_BYTE *)(v46 + v47) = v45;
                v48 = *(_BYTE *)(result + 5937);
                v49 = *(_QWORD *)(result + 16);
                v50 = *(_QWORD *)(result + 40);
                *(_QWORD *)(result + 40) = v50 + 1;
                *(_BYTE *)(v49 + v50) = v48;
                LODWORD(v49) = *(_DWORD *)(result + 5940);
                v45 = v44 >> (16 - v49);
                v51 = v43 + v49 - 16;
              }
              *(_DWORD *)(result + 5940) = v51;
              v78 = v4 + 65526;
              v79 = v78 << v51;
              if (v51 < 10)
              {
                *(_WORD *)(result + 5936) = v45 | v79;
                v69 = v51 + 7;
              }
              else
              {
                v80 = v45 | v79;
                *(_WORD *)(result + 5936) = v80;
                v81 = *(_QWORD *)(result + 16);
                v82 = *(_QWORD *)(result + 40);
                *(_QWORD *)(result + 40) = v82 + 1;
                *(_BYTE *)(v81 + v82) = v80;
                LOBYTE(v80) = *(_BYTE *)(result + 5937);
                v83 = *(_QWORD *)(result + 16);
                v84 = *(_QWORD *)(result + 40);
                *(_QWORD *)(result + 40) = v84 + 1;
                *(_BYTE *)(v83 + v84) = v80;
                v85 = *(_DWORD *)(result + 5940);
                *(_WORD *)(result + 5936) = (unsigned __int16)v78 >> (16 - v85);
                v69 = v85 - 9;
              }
            }
            else
            {
              v34 = *(unsigned __int16 *)(result + 2818);
              v35 = *(unsigned __int16 *)(result + 2816);
              v36 = v33 | (v35 << v23);
              if (v23 <= 16 - v34)
              {
                v42 = v23 + v34;
              }
              else
              {
                *(_WORD *)(result + 5936) = v36;
                v37 = *(_QWORD *)(result + 16);
                v38 = *(_QWORD *)(result + 40);
                *(_QWORD *)(result + 40) = v38 + 1;
                *(_BYTE *)(v37 + v38) = v36;
                v39 = *(_BYTE *)(result + 5937);
                v40 = *(_QWORD *)(result + 16);
                v41 = *(_QWORD *)(result + 40);
                *(_QWORD *)(result + 40) = v41 + 1;
                *(_BYTE *)(v40 + v41) = v39;
                LODWORD(v40) = *(_DWORD *)(result + 5940);
                v36 = v35 >> (16 - v40);
                v42 = v34 + v40 - 16;
              }
              *(_DWORD *)(result + 5940) = v42;
              v70 = v4 + 65534;
              v71 = v70 << v42;
              if (v42 < 14)
              {
                *(_WORD *)(result + 5936) = v36 | v71;
                v69 = v42 + 3;
              }
              else
              {
                v72 = v36 | v71;
                *(_WORD *)(result + 5936) = v72;
                v73 = *(_QWORD *)(result + 16);
                v74 = *(_QWORD *)(result + 40);
                *(_QWORD *)(result + 40) = v74 + 1;
                *(_BYTE *)(v73 + v74) = v72;
                LOBYTE(v72) = *(_BYTE *)(result + 5937);
                v75 = *(_QWORD *)(result + 16);
                v76 = *(_QWORD *)(result + 40);
                *(_QWORD *)(result + 40) = v76 + 1;
                *(_BYTE *)(v75 + v76) = v72;
                v77 = *(_DWORD *)(result + 5940);
                *(_WORD *)(result + 5936) = (unsigned __int16)v70 >> (16 - v77);
                v69 = v77 - 13;
              }
            }
          }
          *(_DWORD *)(result + 5940) = v69;
        }
        else
        {
          v11 = result + 4 * v5;
          v12 = (unsigned __int16 *)(v11 + 2748);
          v13 = (unsigned __int16 *)(v11 + 2750);
          v14 = *(_DWORD *)(result + 5940);
          do
          {
            v15 = *v13;
            v16 = *v12;
            v17 = *(unsigned __int16 *)(result + 5936);
            v18 = v17 | (v16 << v14);
            *(_WORD *)(result + 5936) = v17 | ((_WORD)v16 << v14);
            if (v14 <= 16 - v15)
            {
              v14 += v15;
            }
            else
            {
              v19 = *(_QWORD *)(result + 16);
              v20 = *(_QWORD *)(result + 40);
              *(_QWORD *)(result + 40) = v20 + 1;
              *(_BYTE *)(v19 + v20) = v18;
              LOBYTE(v19) = *(_BYTE *)(result + 5937);
              v21 = *(_QWORD *)(result + 16);
              v22 = *(_QWORD *)(result + 40);
              *(_QWORD *)(result + 40) = v22 + 1;
              *(_BYTE *)(v21 + v22) = v19;
              LODWORD(v19) = *(_DWORD *)(result + 5940);
              *(_WORD *)(result + 5936) = v16 >> (16 - v19);
              v14 = v15 + v19 - 16;
            }
            *(_DWORD *)(result + 5940) = v14;
            --v10;
          }
          while (v10);
        }
        if (v5 == v9)
          v86 = 3;
        else
          v86 = 4;
        if (v5 == v9)
          v87 = 6;
        else
          v87 = 7;
        if (v9)
          v7 = v86;
        else
          v7 = 3;
        if (v9)
          v6 = v87;
        else
          v6 = 138;
        v10 = 0;
        v8 = v5;
      }
      v5 = v9;
      v4 = v10;
    }
    while (v3 != a3 + 1);
  }
  return result;
}

double sub_22D25B57C(uint64_t a1)
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  double result;

  for (i = 212; i != 1356; i += 4)
    *(_WORD *)(a1 + i) = 0;
  for (j = 0; j != 120; j += 4)
    *(_WORD *)(a1 + 2504 + j) = 0;
  for (k = 0; k != 76; k += 4)
    *(_WORD *)(a1 + 2748 + k) = 0;
  *(_WORD *)(a1 + 1236) = 1;
  *(_DWORD *)(a1 + 5900) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 5912) = 0u;
  *(_DWORD *)(a1 + 5928) = 0;
  return result;
}

uint64_t sub_22D25B5E0(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unsigned __int16 *v20;
  int v21;
  int v22;
  unsigned int v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  unsigned int v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  unsigned __int16 *v43;
  int v44;
  unsigned int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  unsigned int v53;
  unsigned int v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  unsigned int v62;
  int v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  int v71;

  if (*(_DWORD *)(result + 5900))
  {
    v3 = 0;
    while (1)
    {
      v4 = *(_QWORD *)(result + 5888);
      v5 = *(unsigned __int8 *)(v4 + v3) | (*(unsigned __int8 *)(v4 + v3 + 1) << 8);
      v6 = *(unsigned __int8 *)(v4 + v3 + 2);
      if (v5)
        break;
      v20 = (unsigned __int16 *)(a2 + 4 * v6);
      v21 = v20[1];
      v22 = *(_DWORD *)(result + 5940);
      v23 = *v20;
      v24 = *(unsigned __int16 *)(result + 5936);
      v25 = v24 | (v23 << v22);
      *(_WORD *)(result + 5936) = v24 | ((_WORD)v23 << v22);
      if (v22 > 16 - v21)
      {
        v26 = *(_QWORD *)(result + 16);
        v27 = *(_QWORD *)(result + 40);
        *(_QWORD *)(result + 40) = v27 + 1;
        *(_BYTE *)(v26 + v27) = v25;
        LOBYTE(v26) = *(_BYTE *)(result + 5937);
        v28 = *(_QWORD *)(result + 16);
        v29 = *(_QWORD *)(result + 40);
        *(_QWORD *)(result + 40) = v29 + 1;
        *(_BYTE *)(v28 + v29) = v26;
        LODWORD(v26) = *(_DWORD *)(result + 5940);
        *(_WORD *)(result + 5936) = v23 >> (16 - v26);
        v30 = v21 + v26;
LABEL_24:
        v39 = v30 - 16;
        goto LABEL_26;
      }
      v39 = v22 + v21;
LABEL_26:
      *(_DWORD *)(result + 5940) = v39;
LABEL_27:
      v3 += 3;
      if (v3 >= *(_DWORD *)(result + 5900))
        goto LABEL_30;
    }
    v7 = byte_22D262168[v6];
    v8 = a2 + 4 * v7;
    v9 = *(unsigned __int16 *)(v8 + 1030);
    v10 = *(_DWORD *)(result + 5940);
    v11 = *(unsigned __int16 *)(v8 + 1028);
    v12 = *(unsigned __int16 *)(result + 5936);
    v13 = v12 | (v11 << v10);
    *(_WORD *)(result + 5936) = v12 | ((_WORD)v11 << v10);
    if (v10 <= 16 - v9)
    {
      v19 = v10 + v9;
    }
    else
    {
      v14 = *(_QWORD *)(result + 16);
      v15 = *(_QWORD *)(result + 40);
      *(_QWORD *)(result + 40) = v15 + 1;
      *(_BYTE *)(v14 + v15) = v13;
      v16 = *(_BYTE *)(result + 5937);
      v17 = *(_QWORD *)(result + 16);
      v18 = *(_QWORD *)(result + 40);
      *(_QWORD *)(result + 40) = v18 + 1;
      *(_BYTE *)(v17 + v18) = v16;
      LODWORD(v17) = *(_DWORD *)(result + 5940);
      v13 = v11 >> (16 - v17);
      *(_WORD *)(result + 5936) = v13;
      v19 = v9 + v17 - 16;
    }
    *(_DWORD *)(result + 5940) = v19;
    if ((unint64_t)(v7 - 28) >= 0xFFFFFFFFFFFFFFECLL)
    {
      v31 = dword_22D262760[v7];
      v32 = v6 - dword_22D2628AC[v7];
      if (v19 <= 16 - v31)
      {
        v13 |= v32 << v19;
        *(_WORD *)(result + 5936) = v13;
        v19 += v31;
      }
      else
      {
        v33 = (unsigned __int16)v32;
        v34 = v13 | (v32 << v19);
        *(_WORD *)(result + 5936) = v34;
        v35 = *(_QWORD *)(result + 16);
        v36 = *(_QWORD *)(result + 40);
        *(_QWORD *)(result + 40) = v36 + 1;
        *(_BYTE *)(v35 + v36) = v34;
        LOBYTE(v34) = *(_BYTE *)(result + 5937);
        v37 = *(_QWORD *)(result + 16);
        v38 = *(_QWORD *)(result + 40);
        *(_QWORD *)(result + 40) = v38 + 1;
        *(_BYTE *)(v37 + v38) = v34;
        LODWORD(v37) = *(_DWORD *)(result + 5940);
        v13 = v33 >> (16 - v37);
        *(_WORD *)(result + 5936) = v13;
        v19 = v31 + v37 - 16;
      }
      *(_DWORD *)(result + 5940) = v19;
    }
    v40 = v5 - 1;
    if (v5 >= 0x101)
      v41 = ((v5 - 1) >> 7) + 256;
    else
      v41 = v5 - 1;
    v42 = byte_22D261F68[v41];
    v43 = (unsigned __int16 *)(a3 + 4 * v42);
    v44 = v43[1];
    v45 = *v43;
    v46 = v13 | (v45 << v19);
    *(_WORD *)(result + 5936) = v46;
    if (v19 <= 16 - v44)
    {
      v39 = v19 + v44;
    }
    else
    {
      v47 = *(_QWORD *)(result + 16);
      v48 = *(_QWORD *)(result + 40);
      *(_QWORD *)(result + 40) = v48 + 1;
      *(_BYTE *)(v47 + v48) = v46;
      v49 = *(_BYTE *)(result + 5937);
      v50 = *(_QWORD *)(result + 16);
      v51 = *(_QWORD *)(result + 40);
      *(_QWORD *)(result + 40) = v51 + 1;
      *(_BYTE *)(v50 + v51) = v49;
      LODWORD(v50) = *(_DWORD *)(result + 5940);
      v46 = v45 >> (16 - v50);
      *(_WORD *)(result + 5936) = v46;
      v39 = v44 + v50 - 16;
    }
    *(_DWORD *)(result + 5940) = v39;
    if (v42 < 4)
      goto LABEL_27;
    v52 = dword_22D2627D4[v42];
    v53 = v40 - dword_22D262920[v42];
    if (v39 <= 16 - v52)
    {
      *(_WORD *)(result + 5936) = v46 | ((_WORD)v53 << v39);
      v39 += v52;
      goto LABEL_26;
    }
    v54 = (unsigned __int16)v53;
    v55 = v46 | (v53 << v39);
    *(_WORD *)(result + 5936) = v55;
    v56 = *(_QWORD *)(result + 16);
    v57 = *(_QWORD *)(result + 40);
    *(_QWORD *)(result + 40) = v57 + 1;
    *(_BYTE *)(v56 + v57) = v55;
    LOBYTE(v55) = *(_BYTE *)(result + 5937);
    v58 = *(_QWORD *)(result + 16);
    v59 = *(_QWORD *)(result + 40);
    *(_QWORD *)(result + 40) = v59 + 1;
    *(_BYTE *)(v58 + v59) = v55;
    v60 = *(_DWORD *)(result + 5940);
    *(_WORD *)(result + 5936) = v54 >> (16 - v60);
    v30 = v52 + v60;
    goto LABEL_24;
  }
  v39 = *(_DWORD *)(result + 5940);
LABEL_30:
  v61 = *(unsigned __int16 *)(a2 + 1026);
  v62 = *(unsigned __int16 *)(a2 + 1024);
  v63 = *(unsigned __int16 *)(result + 5936);
  v64 = v63 | (v62 << v39);
  *(_WORD *)(result + 5936) = v63 | ((_WORD)v62 << v39);
  if (v39 <= 16 - v61)
  {
    v71 = v39 + v61;
  }
  else
  {
    v65 = *(_QWORD *)(result + 16);
    v66 = *(_QWORD *)(result + 40);
    *(_QWORD *)(result + 40) = v66 + 1;
    *(_BYTE *)(v65 + v66) = v64;
    v67 = *(_BYTE *)(result + 5937);
    v68 = *(_QWORD *)(result + 16);
    v69 = *(_QWORD *)(result + 40);
    *(_QWORD *)(result + 40) = v69 + 1;
    *(_BYTE *)(v68 + v69) = v67;
    v70 = *(_DWORD *)(result + 5940);
    *(_WORD *)(result + 5936) = v62 >> (16 - v70);
    v71 = v61 + v70 - 16;
  }
  *(_DWORD *)(result + 5940) = v71;
  return result;
}

uint64_t sub_22D25B9A4(uint64_t result)
{
  int v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_DWORD *)(result + 5940);
  if (v1 >= 9)
  {
    v2 = *(_BYTE *)(result + 5936);
    v3 = *(_QWORD *)(result + 16);
    v4 = *(_QWORD *)(result + 40);
    *(_QWORD *)(result + 40) = v4 + 1;
    *(_BYTE *)(v3 + v4) = v2;
    v5 = *(_BYTE *)(result + 5937);
LABEL_5:
    v6 = *(_QWORD *)(result + 16);
    v7 = *(_QWORD *)(result + 40);
    *(_QWORD *)(result + 40) = v7 + 1;
    *(_BYTE *)(v6 + v7) = v5;
    goto LABEL_6;
  }
  if (v1 >= 1)
  {
    v5 = *(_BYTE *)(result + 5936);
    goto LABEL_5;
  }
LABEL_6:
  *(_WORD *)(result + 5936) = 0;
  *(_DWORD *)(result + 5940) = 0;
  return result;
}

double sub_22D25BA08(uint64_t a1)
{
  *(_QWORD *)(a1 + 2904) = a1 + 212;
  *(_QWORD *)(a1 + 2920) = &off_24F86F1A8;
  *(_QWORD *)(a1 + 2928) = a1 + 2504;
  *(_QWORD *)(a1 + 2944) = &off_24F86F1C8;
  *(_QWORD *)(a1 + 2952) = a1 + 2748;
  *(_QWORD *)(a1 + 2968) = &unk_24F86F1E8;
  *(_WORD *)(a1 + 5936) = 0;
  *(_DWORD *)(a1 + 5940) = 0;
  return sub_22D25B57C(a1);
}

uint64_t sub_22D25BA50(uint64_t a1, const void *a2, size_t a3, int a4)
{
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v7 = *(_DWORD *)(a1 + 5940);
  if (v7 < 14)
  {
    *(_WORD *)(a1 + 5936) |= (_WORD)a4 << v7;
    v14 = v7 + 3;
  }
  else
  {
    v8 = *(_WORD *)(a1 + 5936) | (a4 << v7);
    *(_WORD *)(a1 + 5936) = v8;
    v9 = *(_QWORD *)(a1 + 16);
    v10 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v10 + 1;
    *(_BYTE *)(v9 + v10) = v8;
    LOBYTE(v8) = *(_BYTE *)(a1 + 5937);
    v11 = *(_QWORD *)(a1 + 16);
    v12 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v12 + 1;
    *(_BYTE *)(v11 + v12) = v8;
    v13 = *(_DWORD *)(a1 + 5940);
    *(_WORD *)(a1 + 5936) = (unsigned __int16)a4 >> (16 - v13);
    v14 = v13 - 13;
  }
  *(_DWORD *)(a1 + 5940) = v14;
  result = sub_22D25B9A4(a1);
  v16 = *(_QWORD *)(a1 + 16);
  v17 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v17 + 1;
  *(_BYTE *)(v16 + v17) = a3;
  v18 = *(_QWORD *)(a1 + 16);
  v19 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v19 + 1;
  *(_BYTE *)(v18 + v19) = BYTE1(a3);
  v20 = *(_QWORD *)(a1 + 16);
  v21 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v21 + 1;
  *(_BYTE *)(v20 + v21) = ~(_BYTE)a3;
  v22 = *(_QWORD *)(a1 + 16);
  v23 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v23 + 1;
  *(_BYTE *)(v22 + v23) = (unsigned __int16)~(_WORD)a3 >> 8;
  if (a3)
    result = (uint64_t)memcpy((void *)(*(_QWORD *)(a1 + 16) + *(_QWORD *)(a1 + 40)), a2, a3);
  *(_QWORD *)(a1 + 40) += a3;
  return result;
}

int gzclose(gzFile file)
{
  if (!file)
    return -2;
  if (file[1].have == 7247)
    return gzclose_r(file);
  return gzclose_w(file);
}

uLong deflateBound(z_streamp strm, uLong sourceLen)
{
  uLong v4;
  uLong v5;
  internal_state *state;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned __int8 *v13;
  uLong v15;

  v4 = sourceLen + 7;
  v5 = sourceLen + ((sourceLen + 7) >> 3) + ((sourceLen + 63) >> 6);
  if (sub_22D259910(strm))
    return v5 + 11;
  state = strm->state;
  v8 = *((unsigned int *)state + 12);
  if ((_DWORD)v8)
  {
    if ((_DWORD)v8 == 2)
    {
      v9 = *((_QWORD *)state + 7);
      if (v9)
      {
        if (*(_QWORD *)(v9 + 24))
          v10 = (*(_DWORD *)(v9 + 32) + 2) + 18;
        else
          v10 = 18;
        v11 = *(unsigned __int8 **)(v9 + 40);
        if (v11)
        {
          do
            ++v10;
          while (*v11++);
        }
        v13 = *(unsigned __int8 **)(v9 + 56);
        if (v13)
        {
          do
            ++v10;
          while (*v13++);
        }
        if (*(_DWORD *)(v9 + 68))
          v8 = v10 + 2;
        else
          v8 = v10;
      }
      else
      {
        v8 = 18;
      }
    }
    else if ((_DWORD)v8 == 1)
    {
      v8 = 10;
      if (!*((_DWORD *)state + 43))
        v8 = 6;
    }
    else
    {
      v8 = 6;
    }
  }
  if (*((_DWORD *)state + 21) == 15 && *((_DWORD *)state + 34) == 15)
    v15 = v4 + (sourceLen >> 12) + (sourceLen >> 14) + (sourceLen >> 25);
  else
    v15 = v5 + 5;
  return v15 + v8;
}

gzFile gzopen(const char *a1, const char *a2)
{
  return (gzFile)sub_22D254C6C(a1, -1, a2);
}

int gzflush(gzFile file, int flush)
{
  int result;

  if (!file)
    return -2;
  if (file[1].have != 31153)
    return -2;
  result = -2;
  if (flush <= 4 && !HIDWORD(file[4].pos))
  {
    if (!LODWORD(file[4].pos)
      || (LODWORD(file[4].pos) = 0, sub_22D25FDE8((uint64_t)file, (uint64_t)file[4].next) != -1))
    {
      sub_22D255188((uint64_t)file, flush);
    }
    return HIDWORD(file[4].pos);
  }
  return result;
}

gzFile gzdopen(int fd, const char *mode)
{
  char *v4;
  char *v5;
  gzFile_s *v6;

  if (fd == -1)
    return 0;
  v4 = (char *)malloc_type_malloc(0x13uLL, 0xC5832E8AuLL);
  if (!v4)
    return 0;
  v5 = v4;
  snprintf(v4, 0x13uLL, "<fd:%d>", fd);
  v6 = (gzFile_s *)sub_22D254C6C(v5, fd, mode);
  free(v5);
  return v6;
}

void sub_22D25BDF0(uint64_t a1)
{
  void *v2;

  *(_DWORD *)a1 = 0;
  if (*(_DWORD *)(a1 + 24) == 7247)
  {
    *(_QWORD *)(a1 + 80) = 0;
    *(_DWORD *)(a1 + 68) = 0;
  }
  else
  {
    *(_DWORD *)(a1 + 96) = 0;
  }
  *(_DWORD *)(a1 + 112) = 0;
  v2 = *(void **)(a1 + 120);
  if (v2)
  {
    if (*(_DWORD *)(a1 + 116) != -4)
      free(v2);
    *(_QWORD *)(a1 + 120) = 0;
  }
  *(_DWORD *)(a1 + 116) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 136) = 0;
}

void sub_22D25BE5C(uint64_t a1, int a2, const char *a3)
{
  void *v6;
  size_t v7;
  size_t v8;
  char *v9;
  char *v10;
  const char *v11;
  size_t v12;
  size_t v13;

  v6 = *(void **)(a1 + 120);
  if (v6)
  {
    if (*(_DWORD *)(a1 + 116) != -4)
      free(v6);
    *(_QWORD *)(a1 + 120) = 0;
  }
  if (a2 != -5 && a2)
    *(_DWORD *)a1 = 0;
  *(_DWORD *)(a1 + 116) = a2;
  if (a2 != -4 && a3)
  {
    v7 = strlen(*(const char **)(a1 + 32));
    v8 = strlen(a3);
    v9 = (char *)malloc_type_malloc(v7 + v8 + 3, 0x86B2D61DuLL);
    *(_QWORD *)(a1 + 120) = v9;
    if (v9)
    {
      v10 = v9;
      v11 = *(const char **)(a1 + 32);
      v12 = strlen(v11);
      v13 = strlen(a3);
      snprintf(v10, v12 + v13 + 3, "%s%s%s", v11, ": ", a3);
    }
    else
    {
      *(_DWORD *)(a1 + 116) = -4;
    }
  }
}

uint64_t sub_22D25BF50(int a1, int a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if ((a3 & 0x8000000000000000) != 0)
    return 0xFFFFFFFFLL;
  v3 = (unsigned __int16)a1 + (unint64_t)(unsigned __int16)a2;
  v4 = v3 + 65520;
  v5 = HIWORD(a1) + (unint64_t)HIWORD(a2) - a3 % 0xFFF1 + a3 % 0xFFF1 * (unsigned __int16)a1 % 0xFFF1;
  v6 = v5 + 65521;
  v7 = v3 - 1;
  if (v4 <= 0xFFF0)
    v7 = 65520;
  if (v7 > 0xFFF0)
    v7 -= 65521;
  v8 = v5 - 65521;
  if (v6 <= 0x1FFE1)
    v8 = v6;
  if (v8 <= 0xFFF0)
    v9 = v8 << 16;
  else
    v9 = (v8 << 16) - 4293984256u;
  return v9 | v7;
}

int compress2(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen, int level)
{
  uLongf v9;
  int result;
  uint64_t v11;
  uLong v12;
  int v13;
  int v14;
  z_stream v15;

  memset(&v15, 0, sizeof(v15));
  v9 = *destLen;
  *destLen = 0;
  memset(&v15.zalloc, 0, 24);
  result = deflateInit_(&v15, level, "1.2.12", 112);
  if (!result)
  {
    v15.next_out = dest;
    v15.avail_out = 0;
    v15.next_in = (Bytef *)source;
    v15.avail_in = 0;
LABEL_3:
    if (v9 >= 0xFFFFFFFF)
      v11 = 0xFFFFFFFFLL;
    else
      v11 = v9;
    v15.avail_out = v11;
    v9 -= v11;
    while (1)
    {
      if (!v15.avail_in)
      {
        if (sourceLen >= 0xFFFFFFFF)
          v12 = 0xFFFFFFFFLL;
        else
          v12 = sourceLen;
        v15.avail_in = v12;
        sourceLen -= v12;
      }
      v13 = deflate(&v15, 4 * (sourceLen == 0));
      if (v13)
        break;
      if (!v15.avail_out)
        goto LABEL_3;
    }
    v14 = v13;
    *destLen = v15.total_out;
    deflateEnd(&v15);
    if (v14 == 1)
      return 0;
    else
      return v14;
  }
  return result;
}

int compress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return compress2(dest, destLen, source, sourceLen, -1);
}

uLong compressBound(uLong sourceLen)
{
  return sourceLen + (sourceLen >> 12) + (sourceLen >> 14) + (sourceLen >> 25) + 13;
}

const z_crc_t *get_crc_table(void)
{
  return (const z_crc_t *)&unk_22D260390;
}

uLong crc32_combine_0(uLong a1, uLong a2, uint64_t a3)
{
  uLong v5;
  uint64_t v6;
  unint64_t i;

  v5 = crc32_combine_gen_0(a3);
  v6 = 0;
  for (i = 0x80000000; ; i >>= 1)
  {
    if ((i & v5) != 0)
    {
      v6 ^= a1;
      if (((i - 1) & v5) == 0)
        break;
    }
    if ((a1 & 1) != 0)
      a1 = (a1 >> 1) ^ 0xEDB88320;
    else
      a1 >>= 1;
  }
  return v6 ^ a2;
}

uLong crc32_combine_gen_0(uint64_t a1)
{
  char v1;
  unint64_t v2;
  uLong v3;
  BOOL v4;
  uint64_t v5;
  unint64_t i;

  if (!a1)
    return 0x80000000;
  v1 = 3;
  v2 = 0x80000000;
  do
  {
    if ((a1 & 1) != 0)
    {
      v3 = 0;
      v5 = qword_22D260B90[v1 & 0x1F];
      for (i = 0x80000000; ; i >>= 1)
      {
        if ((i & v5) != 0)
        {
          v3 ^= v2;
          if (((i - 1) & v5) == 0)
            break;
        }
        if ((v2 & 1) != 0)
          v2 = (v2 >> 1) ^ 0xEDB88320;
        else
          v2 >>= 1;
      }
    }
    else
    {
      v3 = v2;
    }
    ++v1;
    v2 = v3;
    v4 = (unint64_t)a1 > 1;
    a1 >>= 1;
  }
  while (v4);
  return v3;
}

uLong crc32_combine_op(uLong crc1, uLong crc2, uLong op)
{
  uint64_t v3;
  unint64_t i;

  v3 = 0;
  for (i = 0x80000000; ; i >>= 1)
  {
    if ((i & op) != 0)
    {
      v3 ^= crc1;
      if (((i - 1) & op) == 0)
        break;
    }
    if ((crc1 & 1) != 0)
      crc1 = (crc1 >> 1) ^ 0xEDB88320;
    else
      crc1 >>= 1;
  }
  return v3 ^ crc2;
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return deflateInit2_(strm, level, 8, 15, 8, 0, version, stream_size);
}

int deflateSetDictionary(z_streamp strm, const Bytef *dictionary, uInt dictLength)
{
  _BOOL4 v6;
  int result;
  internal_state *state;
  int v9;
  uInt v10;
  char *v11;
  size_t v12;
  uInt avail_in;
  Bytef *next_in;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  unsigned int v24;
  uint64_t v25;

  v6 = sub_22D259910(strm);
  result = -2;
  if (!dictionary)
    return result;
  if (v6)
    return result;
  state = strm->state;
  v9 = *((_DWORD *)state + 12);
  if (v9 == 2)
    return result;
  if (v9 == 1)
  {
    if (*((_DWORD *)state + 2) != 42 || *((_DWORD *)state + 45))
      return result;
    strm->adler = adler32(strm->adler, dictionary, dictLength);
    *((_DWORD *)state + 12) = 0;
    v10 = *((_DWORD *)state + 20);
    if (v10 > dictLength)
      goto LABEL_14;
  }
  else
  {
    if (*((_DWORD *)state + 45))
      return result;
    *((_DWORD *)state + 12) = 0;
    v10 = *((_DWORD *)state + 20);
    if (v10 > dictLength)
      goto LABEL_14;
    if (!v9)
    {
      v11 = (char *)*((_QWORD *)state + 15);
      v12 = 2 * (*((_DWORD *)state + 33) - 1);
      *(_WORD *)&v11[v12] = 0;
      bzero(v11, v12);
      *((_DWORD *)state + 43) = 0;
      *((_QWORD *)state + 19) = 0;
      *((_DWORD *)state + 1483) = 0;
      v10 = *((_DWORD *)state + 20);
    }
  }
  dictionary += dictLength - v10;
  dictLength = v10;
LABEL_14:
  avail_in = strm->avail_in;
  next_in = strm->next_in;
  strm->avail_in = dictLength;
  strm->next_in = (Bytef *)dictionary;
  sub_22D255BE0((uint64_t)state);
  v15 = *((_DWORD *)state + 45);
  if (v15 >= 3)
  {
    do
    {
      v16 = *((_DWORD *)state + 43);
      v17 = v15 - 2;
      v18 = *((_QWORD *)state + 12);
      v20 = *((_DWORD *)state + 35);
      v19 = *((_DWORD *)state + 36);
      v22 = *((_QWORD *)state + 14);
      v21 = *((_QWORD *)state + 15);
      v23 = *((_DWORD *)state + 22);
      v24 = *((_DWORD *)state + 32);
      do
      {
        v24 = ((v24 << v19) ^ *(unsigned __int8 *)(v18 + v16 + 2)) & v20;
        *((_DWORD *)state + 32) = v24;
        *(_WORD *)(v22 + 2 * (v23 & v16)) = *(_WORD *)(v21 + 2 * v24);
        *(_WORD *)(v21 + 2 * v24) = v16++;
        --v17;
      }
      while (v17);
      *((_DWORD *)state + 43) = v16;
      *((_DWORD *)state + 45) = 2;
      sub_22D255BE0((uint64_t)state);
      v15 = *((_DWORD *)state + 45);
    }
    while (v15 > 2);
  }
  result = 0;
  v25 = *((_DWORD *)state + 43) + v15;
  *((_QWORD *)state + 19) = v25;
  *((_DWORD *)state + 1483) = v15;
  *(_QWORD *)((char *)state + 180) = 0x200000000;
  *((_DWORD *)state + 40) = 2;
  *((_DWORD *)state + 42) = 0;
  *((_DWORD *)state + 43) = v25;
  strm->next_in = next_in;
  strm->avail_in = avail_in;
  *((_DWORD *)state + 12) = v9;
  return result;
}

int deflateGetDictionary(z_streamp strm, Bytef *dictionary, uInt *dictLength)
{
  int result;
  internal_state *state;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  size_t v11;

  if (sub_22D259910(strm))
    return -2;
  state = strm->state;
  v8 = *((unsigned int *)state + 43);
  v9 = *((unsigned int *)state + 45);
  v10 = *((_DWORD *)state + 20);
  if ((int)v9 + (int)v8 >= v10)
    v11 = v10;
  else
    v11 = (v9 + v8);
  if (dictionary && (_DWORD)v11)
    memcpy(dictionary, (const void *)(*((_QWORD *)state + 12) + v8 + v9 - v11), v11);
  result = 0;
  if (dictLength)
    *dictLength = v11;
  return result;
}

int deflateSetHeader(z_streamp strm, gz_headerp head)
{
  internal_state *state;
  int result;

  if (sub_22D259910(strm))
    return -2;
  state = strm->state;
  if (*((_DWORD *)state + 12) != 2)
    return -2;
  result = 0;
  *((_QWORD *)state + 7) = head;
  return result;
}

int deflatePending(z_streamp strm, unsigned int *pending, int *bits)
{
  int result;

  if (sub_22D259910(strm))
    return -2;
  if (pending)
    *pending = *((_QWORD *)strm->state + 5);
  result = 0;
  if (bits)
    *bits = *((_DWORD *)strm->state + 1485);
  return result;
}

int deflatePrime(z_streamp strm, int bits, int value)
{
  internal_state *state;
  int v8;
  int v9;

  if (sub_22D259910(strm))
    return -2;
  if (bits > 0x10)
    return -5;
  state = strm->state;
  if (*((_QWORD *)state + 736) < (unint64_t)(*((_QWORD *)state + 4) + 2))
    return -5;
  do
  {
    v8 = *((_DWORD *)state + 1485);
    if (16 - v8 >= bits)
      v9 = bits;
    else
      v9 = 16 - v8;
    *((_WORD *)state + 2968) |= ((unsigned __int16)value & (unsigned __int16)~(-1 << v9)) << v8;
    *((_DWORD *)state + 1485) = v9 + v8;
    sub_22D25A124((uint64_t)state);
    value >>= v9;
    bits -= v9;
  }
  while (bits);
  return 0;
}

int deflateParams(z_streamp strm, int level, int strategy)
{
  int result;
  unsigned int v7;
  internal_state *state;
  int v9;
  int v10;
  char *v11;
  size_t v12;
  unsigned __int16 *v13;
  int v14;
  int v15;

  if (sub_22D259910(strm))
    return -2;
  if (level == -1)
    v7 = 6;
  else
    v7 = level;
  result = -2;
  if (strategy <= 4 && v7 <= 9)
  {
    state = strm->state;
    if ((*((_DWORD *)state + 50) != strategy
       || qword_24F86F108[2 * *((int *)state + 49) + 1] != qword_24F86F108[2 * v7 + 1])
      && *((_DWORD *)state + 19) != -2)
    {
      result = deflate(strm, 5);
      if (result == -2)
        return result;
      if (strm->avail_in || *((unsigned int *)state + 43) - *((_QWORD *)state + 19) + *((unsigned int *)state + 45))
        return -5;
    }
    v9 = *((_DWORD *)state + 49);
    if (v9 != v7)
    {
      if (!v9)
      {
        v10 = *((_DWORD *)state + 1482);
        if (v10)
        {
          if (v10 == 1)
          {
            sub_22D25C79C((uint64_t)state);
          }
          else
          {
            v11 = (char *)*((_QWORD *)state + 15);
            v12 = 2 * (*((_DWORD *)state + 33) - 1);
            *(_WORD *)&v11[v12] = 0;
            bzero(v11, v12);
          }
          *((_DWORD *)state + 1482) = 0;
        }
      }
      *((_DWORD *)state + 49) = v7;
      v13 = (unsigned __int16 *)&qword_24F86F108[2 * v7];
      v14 = v13[1];
      v15 = v13[2];
      *((_DWORD *)state + 51) = *v13;
      *((_DWORD *)state + 52) = v15;
      *((_DWORD *)state + 47) = v13[3];
      *((_DWORD *)state + 48) = v14;
    }
    result = 0;
    *((_DWORD *)state + 50) = strategy;
  }
  return result;
}

uint64_t sub_22D25C79C(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  _WORD *v4;
  unsigned int v5;
  BOOL v6;
  __int16 v7;
  _WORD *v8;
  unsigned int v9;
  __int16 v10;

  v1 = *(unsigned int *)(result + 80);
  v2 = *(_DWORD *)(result + 80);
  v3 = *(unsigned int *)(result + 132);
  v4 = (_WORD *)(*(_QWORD *)(result + 120) + 2 * v3 - 2);
  do
  {
    v5 = (unsigned __int16)*v4;
    v6 = v5 >= v1;
    v7 = v5 - v1;
    if (!v6)
      v7 = 0;
    *v4-- = v7;
    LODWORD(v3) = v3 - 1;
  }
  while ((_DWORD)v3);
  v8 = (_WORD *)(*(_QWORD *)(result + 112) + 2 * v1 - 2);
  do
  {
    v9 = (unsigned __int16)*v8;
    v6 = v9 >= v1;
    v10 = v9 - v1;
    if (!v6)
      v10 = 0;
    *v8-- = v10;
    --v2;
  }
  while (v2);
  return result;
}

int deflateTune(z_streamp strm, int good_length, int max_lazy, int nice_length, int max_chain)
{
  int result;
  internal_state *state;

  result = sub_22D259910(strm);
  if (result)
    return -2;
  state = strm->state;
  *((_DWORD *)state + 51) = good_length;
  *((_DWORD *)state + 52) = nice_length;
  *((_DWORD *)state + 47) = max_chain;
  *((_DWORD *)state + 48) = max_lazy;
  return result;
}

uint64_t sub_22D25C84C(uint64_t a1, int a2)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  size_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  BOOL v18;
  BOOL v19;
  int v20;
  BOOL v21;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  size_t v27;
  unint64_t v28;
  unsigned int v29;
  size_t v30;
  uint64_t v31;
  size_t v32;
  unsigned int v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  size_t v41;
  unsigned int v42;
  int v43;
  unsigned int v44;
  unsigned int v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  unsigned int v49;
  _BOOL4 v51;
  size_t v52;
  BOOL v53;
  char v54;

  if (*(_QWORD *)(a1 + 24) - 5 >= (unint64_t)*(unsigned int *)(a1 + 80))
    LODWORD(v4) = *(_DWORD *)(a1 + 80);
  else
    v4 = *(_QWORD *)(a1 + 24) - 5;
  v5 = *(_DWORD *)(*(_QWORD *)a1 + 8);
  while (1)
  {
    v6 = *(_DWORD *)(a1 + 5940) + 42;
    v7 = *(_QWORD *)a1;
    v8 = *(_DWORD *)(*(_QWORD *)a1 + 32);
    if (v8 < v6 >> 3)
      break;
    v9 = v8 - (v6 >> 3);
    v10 = *(_DWORD *)(a1 + 172);
    v11 = *(_DWORD *)(a1 + 152);
    v12 = (v10 - v11);
    v13 = *(unsigned int *)(v7 + 8);
    v14 = v12 + v13;
    v15 = v12 + v13;
    if (v14 >= 0xFFFF)
      v16 = 0xFFFF;
    else
      v16 = v15;
    if (v16 >= v9)
      v17 = v9;
    else
      v17 = v16;
    if (v17 < v4)
    {
      v18 = a2 != 4 && v17 == 0;
      v19 = v18;
      v20 = 1;
      v21 = v17 != v15 || a2 == 0;
      if (v21 || v19)
        goto LABEL_40;
    }
    v23 = a2 == 4 && v17 == v15;
    sub_22D25BA50(a1, 0, 0, v23);
    *(_WORD *)(*(_QWORD *)(a1 + 40) + *(_QWORD *)(a1 + 16) - 4) = v17;
    *(_WORD *)(*(_QWORD *)(a1 + 40) + *(_QWORD *)(a1 + 16) - 2) = ~(_WORD)v17;
    sub_22D25A000(*(_QWORD *)a1);
    if (v10 != v11)
    {
      if (v12 >= v17)
        v12 = v17;
      else
        v12 = v12;
      memcpy(*(void **)(*(_QWORD *)a1 + 24), (const void *)(*(_QWORD *)(a1 + 96) + *(_QWORD *)(a1 + 152)), v12);
      v24 = *(_QWORD *)a1;
      *(_QWORD *)(v24 + 24) = *(_QWORD *)(*(_QWORD *)a1 + 24) + v12;
      *(_DWORD *)(v24 + 32) -= v12;
      *(_QWORD *)(v24 + 40) += v12;
      *(_QWORD *)(a1 + 152) += v12;
      v17 -= v12;
    }
    if (v17)
    {
      sub_22D255E1C(*(_QWORD *)a1, *(void **)(*(_QWORD *)a1 + 24), v17);
      v25 = *(_QWORD *)a1;
      *(_QWORD *)(v25 + 24) = *(_QWORD *)(*(_QWORD *)a1 + 24) + v17;
      *(_DWORD *)(v25 + 32) -= v17;
      *(_QWORD *)(v25 + 40) += v17;
    }
    if (v23)
    {
      v20 = 0;
      v7 = *(_QWORD *)a1;
      goto LABEL_40;
    }
  }
  v20 = 1;
LABEL_40:
  v26 = *(_DWORD *)(v7 + 8);
  v27 = (v5 - v26);
  if (v5 == v26)
  {
    v28 = *(unsigned int *)(a1 + 172);
    v29 = *(_DWORD *)(a1 + 172);
  }
  else
  {
    v30 = *(unsigned int *)(a1 + 80);
    if (v27 >= v30)
    {
      *(_DWORD *)(a1 + 5928) = 2;
      memcpy(*(void **)(a1 + 96), (const void *)(*(_QWORD *)v7 - v30), v30);
      v29 = *(_DWORD *)(a1 + 80);
      *(_DWORD *)(a1 + 172) = v29;
      *(_DWORD *)(a1 + 5932) = v29;
    }
    else
    {
      v31 = *(unsigned int *)(a1 + 172);
      if (*(_QWORD *)(a1 + 104) - v31 <= (unint64_t)v27)
      {
        v32 = (v31 - v30);
        *(_DWORD *)(a1 + 172) = v32;
        memcpy(*(void **)(a1 + 96), (const void *)(*(_QWORD *)(a1 + 96) + v30), v32);
        v33 = *(_DWORD *)(a1 + 5928);
        if (v33 <= 1)
          *(_DWORD *)(a1 + 5928) = v33 + 1;
        LODWORD(v31) = *(_DWORD *)(a1 + 172);
        if (*(_DWORD *)(a1 + 5932) > v31)
          *(_DWORD *)(a1 + 5932) = v31;
      }
      memcpy((void *)(*(_QWORD *)(a1 + 96) + v31), (const void *)(**(_QWORD **)a1 - v27), v27);
      v29 = *(_DWORD *)(a1 + 172) + v27;
      *(_DWORD *)(a1 + 172) = v29;
      v34 = *(_DWORD *)(a1 + 5932);
      v35 = *(_DWORD *)(a1 + 80) - v34;
      if (v27 < v35)
        v35 = v27;
      *(_DWORD *)(a1 + 5932) = v35 + v34;
    }
    v28 = v29;
    *(_QWORD *)(a1 + 152) = v29;
  }
  if (*(_QWORD *)(a1 + 5944) < v28)
    *(_QWORD *)(a1 + 5944) = v28;
  if (!v20)
    return 3;
  if ((a2 | 4) != 4 && !*(_DWORD *)(*(_QWORD *)a1 + 8) && *(_QWORD *)(a1 + 152) == v28)
    return 1;
  v37 = *(_DWORD *)(a1 + 104) - v29;
  if (*(_DWORD *)(*(_QWORD *)a1 + 8) > v37)
  {
    v38 = *(_QWORD *)(a1 + 152);
    v39 = *(unsigned int *)(a1 + 80);
    v53 = v38 < v39;
    v40 = v38 - v39;
    if (!v53)
    {
      *(_QWORD *)(a1 + 152) = v40;
      v41 = v29 - v39;
      *(_DWORD *)(a1 + 172) = v41;
      memcpy(*(void **)(a1 + 96), (const void *)(*(_QWORD *)(a1 + 96) + v39), v41);
      v42 = *(_DWORD *)(a1 + 5928);
      if (v42 <= 1)
        *(_DWORD *)(a1 + 5928) = v42 + 1;
      v37 += *(_DWORD *)(a1 + 80);
      v29 = *(_DWORD *)(a1 + 172);
      if (*(_DWORD *)(a1 + 5932) > v29)
        *(_DWORD *)(a1 + 5932) = v29;
    }
  }
  if (v37 >= *(_DWORD *)(*(_QWORD *)a1 + 8))
    v37 = *(_DWORD *)(*(_QWORD *)a1 + 8);
  if (v37)
  {
    sub_22D255E1C(*(_QWORD *)a1, (void *)(*(_QWORD *)(a1 + 96) + v29), v37);
    v29 = *(_DWORD *)(a1 + 172) + v37;
    *(_DWORD *)(a1 + 172) = v29;
    v43 = *(_DWORD *)(a1 + 5932);
    v44 = *(_DWORD *)(a1 + 80) - v43;
    if (v37 < v44)
      v44 = v37;
    *(_DWORD *)(a1 + 5932) = v44 + v43;
  }
  v45 = v29;
  if (*(_QWORD *)(a1 + 5944) < (unint64_t)v29)
    *(_QWORD *)(a1 + 5944) = v29;
  LODWORD(v46) = 0xFFFF;
  if (*(_QWORD *)(a1 + 24) - (unint64_t)((*(_DWORD *)(a1 + 5940) + 42) >> 3) < 0xFFFF)
    v46 = *(_QWORD *)(a1 + 24) - ((*(_DWORD *)(a1 + 5940) + 42) >> 3);
  if (*(_DWORD *)(a1 + 80) >= v46)
    v47 = v46;
  else
    v47 = *(_DWORD *)(a1 + 80);
  v48 = *(_QWORD *)(a1 + 152);
  v49 = v45 - v48;
  if (v45 - v48 >= v47)
    goto LABEL_91;
  v36 = 0;
  v51 = a2 == 4 || v45 != (_DWORD)v48;
  if (a2 && v51)
  {
    if (*(_DWORD *)(*(_QWORD *)a1 + 8))
      return 0;
LABEL_91:
    if (v49 >= v46)
      v52 = v46;
    else
      v52 = v49;
    if (a2 == 4)
    {
      if (*(_DWORD *)(*(_QWORD *)a1 + 8))
        v53 = 1;
      else
        v53 = v49 > v46;
      v54 = !v53;
    }
    else
    {
      v54 = 0;
    }
    if ((v54 & 1) != 0)
      v36 = 2;
    else
      v36 = 0;
    sub_22D25BA50(a1, (const void *)(*(_QWORD *)(a1 + 96) + v48), v52, v54 & 1);
    *(_QWORD *)(a1 + 152) += v52;
    sub_22D25A000(*(_QWORD *)a1);
  }
  return v36;
}

uint64_t sub_22D25CD14(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  const void *v17;

  while (1)
  {
    if (!*(_DWORD *)(a1 + 180))
    {
      sub_22D255BE0(a1);
      if (!*(_DWORD *)(a1 + 180))
        break;
    }
    *(_DWORD *)(a1 + 160) = 0;
    v4 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 96) + *(unsigned int *)(a1 + 172));
    v5 = *(_QWORD *)(a1 + 5888);
    v6 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v6 + 1;
    *(_BYTE *)(v5 + v6) = 0;
    v7 = *(_QWORD *)(a1 + 5888);
    v8 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v8 + 1;
    *(_BYTE *)(v7 + v8) = 0;
    v9 = *(_QWORD *)(a1 + 5888);
    v10 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v10 + 1;
    *(_BYTE *)(v9 + v10) = v4;
    ++*(_WORD *)(a1 + 4 * v4 + 212);
    LODWORD(v9) = *(_DWORD *)(a1 + 5900);
    LODWORD(v10) = *(_DWORD *)(a1 + 5904);
    --*(_DWORD *)(a1 + 180);
    v11 = (*(_DWORD *)(a1 + 172) + 1);
    *(_DWORD *)(a1 + 172) = v11;
    if ((_DWORD)v9 == (_DWORD)v10)
    {
      v12 = *(_QWORD *)(a1 + 152);
      v13 = v12 < 0 ? 0 : (const void *)(*(_QWORD *)(a1 + 96) + v12);
      sub_22D25A4F4((int *)a1, v13, v11 - v12, 0);
      *(_QWORD *)(a1 + 152) = *(unsigned int *)(a1 + 172);
      sub_22D25A000(*(_QWORD *)a1);
      if (!*(_DWORD *)(*(_QWORD *)a1 + 32))
        return 0;
    }
  }
  if (!a2)
    return 0;
  *(_DWORD *)(a1 + 5932) = 0;
  if (a2 != 4)
  {
    if (!*(_DWORD *)(a1 + 5900))
      return 1;
    v16 = *(_QWORD *)(a1 + 152);
    v17 = v16 < 0 ? 0 : (const void *)(*(_QWORD *)(a1 + 96) + v16);
    sub_22D25A4F4((int *)a1, v17, *(unsigned int *)(a1 + 172) - v16, 0);
    *(_QWORD *)(a1 + 152) = *(unsigned int *)(a1 + 172);
    sub_22D25A000(*(_QWORD *)a1);
    return *(_DWORD *)(*(_QWORD *)a1 + 32) != 0;
  }
  v14 = *(_QWORD *)(a1 + 152);
  if (v14 < 0)
    v15 = 0;
  else
    v15 = (const void *)(*(_QWORD *)(a1 + 96) + v14);
  sub_22D25A4F4((int *)a1, v15, *(unsigned int *)(a1 + 172) - v14, 1);
  *(_QWORD *)(a1 + 152) = *(unsigned int *)(a1 + 172);
  sub_22D25A000(*(_QWORD *)a1);
  if (*(_DWORD *)(*(_QWORD *)a1 + 32))
    return 3;
  else
    return 2;
}

uint64_t sub_22D25CED8(uint64_t a1, int a2)
{
  unsigned int v4;
  uint64_t v5;
  unsigned __int8 *v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  const void *v27;
  unsigned int v28;
  BOOL v29;
  unsigned __int8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const void *v38;
  uint64_t v39;
  const void *v40;

  while (1)
  {
    v4 = *(_DWORD *)(a1 + 180);
    if (v4 >= 0x103)
    {
      *(_DWORD *)(a1 + 160) = 0;
      v5 = *(unsigned int *)(a1 + 172);
      if (!*(_DWORD *)(a1 + 172))
        goto LABEL_23;
      goto LABEL_9;
    }
    sub_22D255BE0(a1);
    v4 = *(_DWORD *)(a1 + 180);
    if (!a2 && v4 < 0x103)
      return 0;
    if (!v4)
      break;
    *(_DWORD *)(a1 + 160) = 0;
    v5 = *(unsigned int *)(a1 + 172);
    if (v4 < 3 || !*(_DWORD *)(a1 + 172))
    {
LABEL_23:
      LODWORD(v16) = *(_DWORD *)(a1 + 5900);
LABEL_24:
      v17 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 96) + v5);
      v18 = *(_QWORD *)(a1 + 5888);
      *(_DWORD *)(a1 + 5900) = v16 + 1;
      *(_BYTE *)(v18 + v16) = 0;
      v19 = *(_QWORD *)(a1 + 5888);
      v20 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v20 + 1;
      *(_BYTE *)(v19 + v20) = 0;
      v21 = *(_QWORD *)(a1 + 5888);
      v22 = *(unsigned int *)(a1 + 5900);
      *(_DWORD *)(a1 + 5900) = v22 + 1;
      *(_BYTE *)(v21 + v22) = v17;
      ++*(_WORD *)(a1 + 4 * v17 + 212);
      v23 = *(_DWORD *)(a1 + 5900);
      v24 = *(_DWORD *)(a1 + 5904);
      --*(_DWORD *)(a1 + 180);
      v25 = *(_DWORD *)(a1 + 172) + 1;
      *(_DWORD *)(a1 + 172) = v25;
      goto LABEL_25;
    }
LABEL_9:
    v6 = (unsigned __int8 *)(*(_QWORD *)(a1 + 96) + v5);
    v7 = *(v6 - 1);
    if (v7 != *v6 || v7 != v6[1] || v7 != v6[2])
      goto LABEL_23;
    v8 = 0;
    v9 = (_DWORD)v6 + 258;
    while (1)
    {
      v10 = &v6[v8];
      if (v7 != v6[v8 + 3])
      {
        v15 = (_DWORD)v10 + 3;
        goto LABEL_38;
      }
      if (v7 != v10[4])
      {
        v15 = (_DWORD)v6 + v8 + 4;
        goto LABEL_38;
      }
      v11 = &v6[v8];
      if (v7 != v6[v8 + 5])
      {
        v15 = (_DWORD)v11 + 5;
        goto LABEL_38;
      }
      if (v7 != v11[6])
      {
        v15 = (_DWORD)v6 + v8 + 6;
        goto LABEL_38;
      }
      v12 = &v6[v8];
      if (v7 != v6[v8 + 7])
      {
        v15 = (_DWORD)v12 + 7;
        goto LABEL_38;
      }
      if (v7 != v12[8])
      {
        v15 = (_DWORD)v6 + v8 + 8;
        goto LABEL_38;
      }
      v13 = &v6[v8];
      if (v7 != v6[v8 + 9])
        break;
      v14 = v8 + 2;
      v8 += 8;
      if (v14 > 0xF9 || v7 != v13[10])
      {
        v15 = (_DWORD)v6 + v8 + 2;
        goto LABEL_38;
      }
    }
    v15 = (_DWORD)v13 + 9;
LABEL_38:
    v28 = v15 - v9 + 258;
    if (v28 < v4)
      v4 = v28;
    *(_DWORD *)(a1 + 160) = v4;
    v16 = *(unsigned int *)(a1 + 5900);
    v29 = v4 >= 3;
    v30 = v4 - 3;
    if (!v29)
      goto LABEL_24;
    v31 = *(_QWORD *)(a1 + 5888);
    *(_DWORD *)(a1 + 5900) = v16 + 1;
    *(_BYTE *)(v31 + v16) = 1;
    v32 = *(_QWORD *)(a1 + 5888);
    v33 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v33 + 1;
    *(_BYTE *)(v32 + v33) = 0;
    v34 = *(_QWORD *)(a1 + 5888);
    v35 = *(unsigned int *)(a1 + 5900);
    *(_DWORD *)(a1 + 5900) = v35 + 1;
    *(_BYTE *)(v34 + v35) = v30;
    v36 = a1 + 4 * byte_22D262168[v30];
    ++*(_WORD *)(v36 + 1240);
    ++*(_WORD *)(a1 + 2504);
    v23 = *(_DWORD *)(a1 + 5900);
    v24 = *(_DWORD *)(a1 + 5904);
    LODWORD(v36) = *(_DWORD *)(a1 + 160);
    *(_DWORD *)(a1 + 180) -= v36;
    v25 = *(_DWORD *)(a1 + 172) + v36;
    *(_DWORD *)(a1 + 172) = v25;
    *(_DWORD *)(a1 + 160) = 0;
LABEL_25:
    if (v23 == v24)
    {
      v26 = *(_QWORD *)(a1 + 152);
      v27 = v26 < 0 ? 0 : (const void *)(*(_QWORD *)(a1 + 96) + v26);
      sub_22D25A4F4((int *)a1, v27, v25 - v26, 0);
      *(_QWORD *)(a1 + 152) = *(unsigned int *)(a1 + 172);
      sub_22D25A000(*(_QWORD *)a1);
      if (!*(_DWORD *)(*(_QWORD *)a1 + 32))
        return 0;
    }
  }
  *(_DWORD *)(a1 + 5932) = 0;
  if (a2 != 4)
  {
    if (!*(_DWORD *)(a1 + 5900))
      return 1;
    v39 = *(_QWORD *)(a1 + 152);
    v40 = v39 < 0 ? 0 : (const void *)(*(_QWORD *)(a1 + 96) + v39);
    sub_22D25A4F4((int *)a1, v40, *(unsigned int *)(a1 + 172) - v39, 0);
    *(_QWORD *)(a1 + 152) = *(unsigned int *)(a1 + 172);
    sub_22D25A000(*(_QWORD *)a1);
    return *(_DWORD *)(*(_QWORD *)a1 + 32) != 0;
  }
  v37 = *(_QWORD *)(a1 + 152);
  if (v37 < 0)
    v38 = 0;
  else
    v38 = (const void *)(*(_QWORD *)(a1 + 96) + v37);
  sub_22D25A4F4((int *)a1, v38, *(unsigned int *)(a1 + 172) - v37, 1);
  *(_QWORD *)(a1 + 152) = *(unsigned int *)(a1 + 172);
  sub_22D25A000(*(_QWORD *)a1);
  if (*(_DWORD *)(*(_QWORD *)a1 + 32))
    return 3;
  else
    return 2;
}

int deflateCopy(z_streamp dest, z_streamp source)
{
  _BOOL4 v4;
  int result;
  internal_state *state;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  internal_state *v12;
  internal_state *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v4 = sub_22D259910(source);
  result = -2;
  if (dest && !v4)
  {
    state = source->state;
    v7 = *(_OWORD *)&source->msg;
    v9 = *(_OWORD *)&source->opaque;
    v8 = *(_OWORD *)&source->adler;
    *(_OWORD *)&dest->zalloc = *(_OWORD *)&source->zalloc;
    *(_OWORD *)&dest->opaque = v9;
    v10 = *(_OWORD *)&source->total_in;
    v11 = *(_OWORD *)&source->avail_out;
    *(_OWORD *)&dest->next_in = *(_OWORD *)&source->next_in;
    *(_OWORD *)&dest->total_in = v10;
    *(_OWORD *)&dest->adler = v8;
    *(_OWORD *)&dest->avail_out = v11;
    *(_OWORD *)&dest->msg = v7;
    v12 = (internal_state *)((uint64_t (*)(voidpf, uint64_t, uint64_t))dest->zalloc)(dest->opaque, 1, 5952);
    if (v12)
    {
      v13 = v12;
      dest->state = v12;
      memcpy(v12, state, 0x1740uLL);
      *(_QWORD *)v13 = dest;
      *((_QWORD *)v13 + 12) = ((uint64_t (*)(voidpf, _QWORD, uint64_t))dest->zalloc)(dest->opaque, *((unsigned int *)v13 + 20), 2);
      *((_QWORD *)v13 + 14) = ((uint64_t (*)(voidpf, _QWORD, uint64_t))dest->zalloc)(dest->opaque, *((unsigned int *)v13 + 20), 2);
      *((_QWORD *)v13 + 15) = ((uint64_t (*)(voidpf, _QWORD, uint64_t))dest->zalloc)(dest->opaque, *((unsigned int *)v13 + 33), 2);
      v14 = ((uint64_t (*)(voidpf, _QWORD, uint64_t))dest->zalloc)(dest->opaque, *((unsigned int *)v13 + 1474), 4);
      *((_QWORD *)v13 + 2) = v14;
      v15 = (void *)*((_QWORD *)v13 + 12);
      if (v15 && *((_QWORD *)v13 + 14) && *((_QWORD *)v13 + 15) && v14)
      {
        memcpy(v15, *((const void **)state + 12), (2 * *((_DWORD *)v13 + 20)));
        memcpy(*((void **)v13 + 14), *((const void **)state + 14), 2 * *((unsigned int *)v13 + 20));
        memcpy(*((void **)v13 + 15), *((const void **)state + 15), 2 * *((unsigned int *)v13 + 33));
        memcpy(*((void **)v13 + 2), *((const void **)state + 2), *((unsigned int *)v13 + 6));
        result = 0;
        v16 = *((_QWORD *)v13 + 2);
        *((_QWORD *)v13 + 4) = v16 + *((_QWORD *)state + 4) - *((_QWORD *)state + 2);
        *((_QWORD *)v13 + 736) = v16 + *((unsigned int *)v13 + 1474);
        *((_QWORD *)v13 + 363) = (char *)v13 + 212;
        *((_QWORD *)v13 + 366) = (char *)v13 + 2504;
        *((_QWORD *)v13 + 369) = (char *)v13 + 2748;
        return result;
      }
      deflateEnd(dest);
    }
    return -4;
  }
  return result;
}

int inflateBackInit_(z_streamp strm, int windowBits, unsigned __int8 *window, const char *version, int stream_size)
{
  int result;
  uint64_t (*zalloc)(voidpf, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;

  if (!version)
    return -6;
  result = -6;
  if (stream_size == 112 && *version == 49)
  {
    result = -2;
    if ((windowBits - 16) >= 0xFFFFFFF8 && strm && window)
    {
      strm->msg = 0;
      zalloc = (uint64_t (*)(voidpf, uint64_t, uint64_t))strm->zalloc;
      if (!zalloc)
      {
        zalloc = (uint64_t (*)(voidpf, uint64_t, uint64_t))sub_22D259FF0;
        strm->zalloc = (alloc_func)sub_22D259FF0;
        strm->opaque = 0;
      }
      if (!strm->zfree)
        strm->zfree = (free_func)sub_22D259FE8;
      v10 = zalloc(strm->opaque, 1, 7160);
      if (v10)
      {
        v11 = v10;
        result = 0;
        strm->state = (internal_state *)v11;
        *(_DWORD *)(v11 + 28) = 0x8000;
        *(_DWORD *)(v11 + 56) = windowBits;
        *(_DWORD *)(v11 + 60) = 1 << windowBits;
        *(_QWORD *)(v11 + 64) = 0;
        *(_QWORD *)(v11 + 72) = window;
      }
      else
      {
        return -4;
      }
    }
  }
  return result;
}

int inflateBack(z_streamp strm, in_func in, void *in_desc, out_func out, void *out_desc)
{
  z_streamp v5;
  internal_state *state;
  void *v8;
  uInt avail_in;
  int result;
  unint64_t v11;
  uint64_t v12;
  Bytef *next_out;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  unsigned __int8 *v18;
  uint64_t v19;
  unsigned __int8 *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  unsigned __int8 *v25;
  uint64_t v26;
  char *v27;
  const char *v28;
  uInt v29;
  unsigned int v30;
  size_t v31;
  int v32;
  BOOL v33;
  const char *v34;
  unsigned __int8 *v35;
  unsigned int v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  unsigned __int8 v41;
  uint64_t v42;
  unsigned __int8 *v43;
  int v44;
  int v45;
  int v46;
  uint64_t v47;
  unsigned __int8 v48;
  uint64_t v49;
  int v50;
  unsigned __int8 *v51;
  unsigned int v52;
  unsigned __int8 *v53;
  int v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  unsigned __int8 v58;
  uint64_t v59;
  unsigned __int8 *v60;
  int v61;
  unsigned int v62;
  uint64_t v63;
  unsigned int v64;
  unsigned int v65;
  unint64_t v66;
  uint64_t v67;
  unsigned __int8 *v68;
  __int16 v69;
  int v70;
  unint64_t v71;
  uint64_t v72;
  unsigned __int8 *v73;
  int v74;
  unint64_t v75;
  uint64_t v76;
  unsigned __int8 *v77;
  char *v78;
  const char *v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  unsigned int v83;
  unsigned __int8 v84;
  uint64_t v85;
  unsigned __int8 *v86;
  int v87;
  unsigned int v88;
  int v89;
  uint64_t v90;
  unsigned __int8 v91;
  uint64_t v92;
  int v93;
  unsigned __int8 *v94;
  unsigned int v95;
  unsigned __int8 *v96;
  unsigned int v97;
  int v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  unsigned int v102;
  uint64_t v103;
  int v104;
  int v105;
  int v106;
  unsigned int v107;
  z_stream *v108;
  unsigned __int8 v109;
  int v110;
  int v111;
  unsigned __int8 v112;
  int (__cdecl *v113)(void *, unsigned __int8 *, unsigned int);
  int (__cdecl *v114)(void *, unsigned __int8 *, unsigned int);
  char *v115;
  void *__src;

  if (!strm)
    return -2;
  v5 = strm;
  state = strm->state;
  if (!state)
    return -2;
  v8 = in_desc;
  strm->msg = 0;
  *((_QWORD *)state + 1) = 16191;
  *((_DWORD *)state + 16) = 0;
  __src = strm->next_in;
  if (__src)
    avail_in = strm->avail_in;
  else
    avail_in = 0;
  v11 = 0;
  LODWORD(v12) = 0;
  next_out = (Bytef *)*((_QWORD *)state + 9);
  v115 = (char *)state + 1368;
  LODWORD(v14) = *((_DWORD *)state + 15);
  v15 = 16191;
  while (2)
  {
    switch(v15)
    {
      case 16191:
        if (*((_DWORD *)state + 3))
        {
          v11 >>= v12 & 7;
          LODWORD(v12) = v12 & 0xFFFFFFF8;
          v16 = 16208;
          goto LABEL_56;
        }
        if (v12 >= 3)
          goto LABEL_61;
        if (avail_in || (avail_in = ((uint64_t (*)(void *, void **))in)(v8, &__src)) != 0)
        {
          v35 = (unsigned __int8 *)__src;
          __src = (char *)__src + 1;
          v11 += (unint64_t)*v35 << v12;
LABEL_61:
          *((_DWORD *)state + 3) = v11 & 1;
          __asm { BR              X10 }
        }
LABEL_203:
        __src = 0;
        goto LABEL_204;
      case 16192:
      case 16194:
      case 16195:
      case 16197:
      case 16198:
      case 16199:
        goto LABEL_209;
      case 16193:
        v11 >>= v12 & 7;
        v12 = v12 & 0xFFFFFFF8;
        if (v12 > 0x1F)
          goto LABEL_38;
        v17 = 0;
        do
        {
          if (!avail_in)
          {
            avail_in = ((uint64_t (*)(void *, void **))in)(v8, &__src);
            if (!avail_in)
              goto LABEL_203;
          }
          --avail_in;
          v18 = (unsigned __int8 *)__src;
          __src = (char *)__src + 1;
          v11 += (unint64_t)*v18 << (v12 + v17);
          v17 += 8;
        }
        while ((unint64_t)(v12 + v17 - 8) < 0x18);
        LODWORD(v12) = v12 + v17;
LABEL_38:
        if (((v11 >> 16) ^ 0xFFFF) != (unsigned __int16)v11)
        {
          v34 = "invalid stored block lengths";
LABEL_55:
          v5->msg = (char *)v34;
          v16 = 16209;
LABEL_56:
          *((_DWORD *)state + 2) = v16;
          goto LABEL_185;
        }
        v29 = (unsigned __int16)v11;
        *((_DWORD *)state + 23) = (unsigned __int16)v11;
        if (!(_WORD)v11)
        {
LABEL_52:
          v11 = 0;
          LODWORD(v12) = 0;
          *((_DWORD *)state + 2) = 16191;
          goto LABEL_185;
        }
        while (1)
        {
          if (!avail_in)
          {
            avail_in = ((uint64_t (*)(void *, void **))in)(v8, &__src);
            if (!avail_in)
              goto LABEL_203;
          }
          if (!(_DWORD)v14)
          {
            next_out = (Bytef *)*((_QWORD *)state + 9);
            v14 = *((unsigned int *)state + 15);
            *((_DWORD *)state + 16) = v14;
            if (((unsigned int (*)(void *, Bytef *, uint64_t))out)(out_desc, next_out, v14))
              goto LABEL_204;
          }
          if (v29 >= avail_in)
            v30 = avail_in;
          else
            v30 = v29;
          if (v30 >= v14)
            v31 = v14;
          else
            v31 = v30;
          memcpy(next_out, __src, v31);
          avail_in -= v31;
          __src = (char *)__src + v31;
          LODWORD(v14) = v14 - v31;
          next_out += v31;
          v32 = *((_DWORD *)state + 23);
          v29 = v32 - v31;
          v33 = v32 == (_DWORD)v31;
          v8 = in_desc;
          *((_DWORD *)state + 23) = v29;
          if (v33)
            goto LABEL_52;
        }
      case 16196:
        if (v12 > 0xD)
          goto LABEL_23;
        v19 = 0;
        do
        {
          if (!avail_in)
          {
            avail_in = ((uint64_t (*)(void *, void **))in)(v8, &__src);
            if (!avail_in)
              goto LABEL_203;
          }
          --avail_in;
          v20 = (unsigned __int8 *)__src;
          __src = (char *)__src + 1;
          v11 += (unint64_t)*v20 << (v12 + v19);
          v19 += 8;
        }
        while ((unint64_t)v12 + v19 - 8 < 6);
        LODWORD(v12) = v12 + v19;
LABEL_23:
        v21 = v11 & 0x1F;
        v22 = (v11 >> 5) & 0x1F;
        *((_DWORD *)state + 33) = v21 + 257;
        *((_DWORD *)state + 34) = v22 + 1;
        v23 = ((v11 >> 10) & 0xF) + 4;
        *((_DWORD *)state + 32) = v23;
        v11 >>= 14;
        LODWORD(v12) = v12 - 14;
        if (v21 > 0x1D || v22 >= 0x1E)
        {
          v34 = "too many length or distance symbols";
          goto LABEL_55;
        }
        v24 = 0;
        *((_DWORD *)state + 35) = 0;
        do
        {
          if (v12 <= 2)
          {
            if (!avail_in)
            {
              avail_in = ((uint64_t (*)(void *, void **))in)(v8, &__src);
              if (!avail_in)
                goto LABEL_203;
              v24 = *((_DWORD *)state + 35);
              v23 = *((_DWORD *)state + 32);
            }
            --avail_in;
            v25 = (unsigned __int8 *)__src;
            __src = (char *)__src + 1;
            v11 += (unint64_t)*v25 << v12;
            LODWORD(v12) = v12 + 8;
          }
          v26 = (v24 + 1);
          v27 = (char *)state + 2 * word_22D260CC0[v24];
          *((_DWORD *)state + 35) = v26;
          *((_WORD *)v27 + 76) = v11 & 7;
          v11 >>= 3;
          LODWORD(v12) = v12 - 3;
          v24 = v26;
        }
        while (v26 < v23);
        if (v26 <= 0x12)
        {
          do
            *((_WORD *)state + word_22D260CC0[v26++] + 76) = 0;
          while ((_DWORD)v26 != 19);
          *((_DWORD *)state + 35) = 19;
        }
        *((_QWORD *)state + 18) = v115;
        *((_QWORD *)state + 13) = v115;
        *((_DWORD *)state + 30) = 7;
        if (sub_22D256300(0, (uint64_t)state + 152, 0x13u, (char **)state + 18, (unsigned int *)state + 30, (_WORD *)state + 396, 0))
        {
          v28 = "invalid code lengths set";
LABEL_37:
          v5->msg = (char *)v28;
          *((_DWORD *)state + 2) = 16209;
          goto LABEL_185;
        }
        *((_DWORD *)state + 35) = 0;
        if (*((_DWORD *)state + 34) + *((_DWORD *)state + 33))
        {
          v114 = out;
          do
          {
            v55 = *((_QWORD *)state + 13);
            v56 = *((_DWORD *)state + 30);
            v57 = v55 + 4 * (v11 & ~(-1 << v56));
            v58 = *(_BYTE *)v57 - (*(_BYTE *)(v57 + 1) & ((char)(8 * *(_BYTE *)(v57 + 1)) >> 7) & 0xF);
            if (v12 >= v58)
            {
              v61 = (*(_BYTE *)v57
                                    - (*(_BYTE *)(v57 + 1) & ((char)(8 * *(_BYTE *)(v57 + 1)) >> 7) & 0xF));
            }
            else
            {
              v59 = 0;
              do
              {
                if (!avail_in)
                {
                  avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
                  if (!avail_in)
                    goto LABEL_203;
                  v55 = *((_QWORD *)state + 13);
                  v56 = *((_DWORD *)state + 30);
                }
                --avail_in;
                v60 = (unsigned __int8 *)__src;
                __src = (char *)__src + 1;
                v11 += (unint64_t)*v60 << (v12 + v59);
                v57 = v55 + 4 * (v11 & ~(-1 << v56));
                v58 = *(_BYTE *)v57 - (*(_BYTE *)(v57 + 1) & ((char)(8 * *(_BYTE *)(v57 + 1)) >> 7) & 0xF);
                v59 += 8;
              }
              while ((unint64_t)v12 + v59 < v58);
              v61 = (*(_BYTE *)v57
                                    - (*(_BYTE *)(v57 + 1) & ((char)(8 * *(_BYTE *)(v57 + 1)) >> 7) & 0xF));
              LODWORD(v12) = v12 + v59;
            }
            v62 = *(unsigned __int16 *)(v57 + 2);
            if (v62 > 0xF)
            {
              if (v62 == 16)
              {
                v71 = (v61 + 2);
                if (v12 < v71)
                {
                  v111 = v61;
                  v72 = 0;
                  do
                  {
                    if (!avail_in)
                    {
                      avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
                      if (!avail_in)
                        goto LABEL_203;
                    }
                    --avail_in;
                    v73 = (unsigned __int8 *)__src;
                    __src = (char *)__src + 1;
                    v11 += (unint64_t)*v73 << (v12 + v72);
                    v72 += 8;
                  }
                  while ((unint64_t)v12 + v72 < v71);
                  LODWORD(v12) = v12 + v72;
                  out = v114;
                  v61 = v111;
                }
                v11 >>= v58;
                LODWORD(v12) = v12 - v61;
                v74 = *((_DWORD *)state + 35);
                if (!v74)
                {
                  v5->msg = "invalid bit length repeat";
                  *((_DWORD *)state + 2) = 16209;
                  v8 = in_desc;
                  goto LABEL_185;
                }
                v69 = *((_WORD *)state + (v74 - 1) + 76);
                v70 = (v11 & 3) + 3;
                v11 >>= 2;
                LODWORD(v12) = v12 - 2;
                v8 = in_desc;
              }
              else
              {
                v110 = v61;
                if (v62 == 17)
                {
                  v66 = (v61 + 3);
                  if (v12 < v66)
                  {
                    v67 = 0;
                    do
                    {
                      if (!avail_in)
                      {
                        avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
                        if (!avail_in)
                          goto LABEL_203;
                      }
                      --avail_in;
                      v68 = (unsigned __int8 *)__src;
                      __src = (char *)__src + 1;
                      v11 += (unint64_t)*v68 << (v12 + v67);
                      v67 += 8;
                    }
                    while ((unint64_t)v12 + v67 < v66);
                    LODWORD(v12) = v12 + v67;
                    out = v114;
                  }
                  v69 = 0;
                  v70 = ((v11 >> v58) & 7) + 3;
                  v11 = v11 >> v58 >> 3;
                  LODWORD(v12) = v12 - v110 - 3;
                }
                else
                {
                  v75 = (v61 + 7);
                  if (v12 < v75)
                  {
                    v76 = 0;
                    do
                    {
                      if (!avail_in)
                      {
                        avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
                        if (!avail_in)
                          goto LABEL_203;
                      }
                      --avail_in;
                      v77 = (unsigned __int8 *)__src;
                      __src = (char *)__src + 1;
                      v11 += (unint64_t)*v77 << (v12 + v76);
                      v76 += 8;
                    }
                    while ((unint64_t)v12 + v76 < v75);
                    LODWORD(v12) = v12 + v76;
                    out = v114;
                  }
                  v69 = 0;
                  v70 = ((v11 >> v58) & 0x7F) + 11;
                  v11 = v11 >> v58 >> 7;
                  LODWORD(v12) = v12 - v110 - 7;
                }
                v8 = in_desc;
              }
              v64 = *((_DWORD *)state + 35);
              v65 = *((_DWORD *)state + 34) + *((_DWORD *)state + 33);
              if (v64 + v70 > v65)
              {
                v28 = "invalid bit length repeat";
                goto LABEL_37;
              }
              do
              {
                v78 = (char *)state + 2 * v64++;
                *((_WORD *)v78 + 76) = v69;
                --v70;
              }
              while (v70);
              *((_DWORD *)state + 35) = v64;
            }
            else
            {
              v11 >>= v58;
              LODWORD(v12) = v12 - v61;
              v63 = *((unsigned int *)state + 35);
              v64 = v63 + 1;
              *((_DWORD *)state + 35) = v63 + 1;
              *((_WORD *)state + v63 + 76) = v62;
              v65 = *((_DWORD *)state + 34) + *((_DWORD *)state + 33);
              v8 = in_desc;
            }
          }
          while (v64 < v65);
        }
        if (*((_DWORD *)state + 2) == 16209)
          goto LABEL_185;
        if (!*((_WORD *)state + 332))
        {
          v28 = "invalid code -- missing end-of-block";
          goto LABEL_37;
        }
        if (sub_22D259EA8((uint64_t)v5))
          goto LABEL_185;
        *((_DWORD *)state + 2) = 16200;
LABEL_67:
        if (avail_in >= 0x19 && v14 > 0x142)
        {
          v5->next_out = next_out;
          v5->avail_out = v14;
          v5->next_in = (Bytef *)__src;
          v5->avail_in = avail_in;
          *((_QWORD *)state + 10) = v11;
          *((_DWORD *)state + 22) = v12;
          v36 = *((_DWORD *)state + 15);
          if (*((_DWORD *)state + 16) < v36)
            *((_DWORD *)state + 16) = v36 - v14;
          sub_22D258614((uint64_t)v5, v36);
          next_out = v5->next_out;
          LODWORD(v14) = v5->avail_out;
          __src = v5->next_in;
          avail_in = v5->avail_in;
          v11 = *((_QWORD *)state + 10);
          LODWORD(v12) = *((_DWORD *)state + 22);
          goto LABEL_185;
        }
        v37 = *((_QWORD *)state + 13);
        v38 = *((_DWORD *)state + 30);
        v39 = v37 + 4 * (v11 & ~(-1 << v38));
        v40 = *(unsigned __int8 *)(v39 + 1);
        v41 = *(_BYTE *)v39 - (v40 & (v40 << 27 >> 31) & 0xF);
        v113 = out;
        if (v12 >= v41)
        {
          v44 = (*(_BYTE *)v39 - (v40 & (v40 << 27 >> 31) & 0xF));
        }
        else
        {
          v42 = 0;
          do
          {
            if (!avail_in)
            {
              avail_in = ((uint64_t (*)(void *, void **))in)(v8, &__src);
              if (!avail_in)
                goto LABEL_203;
              v37 = *((_QWORD *)state + 13);
              v38 = *((_DWORD *)state + 30);
            }
            --avail_in;
            v43 = (unsigned __int8 *)__src;
            __src = (char *)__src + 1;
            v11 += (unint64_t)*v43 << (v12 + v42);
            v39 = v37 + 4 * (v11 & ~(-1 << v38));
            v40 = *(unsigned __int8 *)(v39 + 1);
            v41 = *(_BYTE *)v39 - (v40 & (v40 << 27 >> 31) & 0xF);
            v42 += 8;
          }
          while ((unint64_t)v12 + v42 < v41);
          v44 = (*(_BYTE *)v39 - (v40 & (v40 << 27 >> 31) & 0xF));
          LODWORD(v12) = v12 + v42;
        }
        v45 = *(unsigned __int16 *)(v39 + 2);
        if ((v40 - 1) > 0xE)
          goto LABEL_90;
        v109 = v41;
        v46 = -1 << (v44 + v40);
        v47 = v37 + 4 * (((v11 & ~v46) >> v44) + v45);
        v40 = *(unsigned __int8 *)(v47 + 1);
        v48 = *(_BYTE *)v47 - (v40 & ((char)(8 * v40) >> 7) & 0xF);
        if (v44 + v48 <= v12)
          goto LABEL_89;
        v108 = v5;
        v49 = 0;
        v50 = ~v46;
        do
        {
          if (!avail_in)
          {
            avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
            if (!avail_in)
            {
LABEL_210:
              __src = 0;
              result = -5;
              v5 = v108;
              goto LABEL_205;
            }
            v37 = *((_QWORD *)state + 13);
          }
          --avail_in;
          v51 = (unsigned __int8 *)__src;
          __src = (char *)__src + 1;
          v11 += (unint64_t)*v51 << (v12 + v49);
          v47 = v37 + 4 * (((v11 & v50) >> v44) + v45);
          v40 = *(unsigned __int8 *)(v47 + 1);
          v48 = *(_BYTE *)v47 - (v40 & ((char)(8 * v40) >> 7) & 0xF);
          v49 += 8;
        }
        while ((unint64_t)v12 + v49 < v44 + v48);
        LODWORD(v12) = v12 + v49;
        v5 = v108;
LABEL_89:
        v45 = *(unsigned __int16 *)(v47 + 2);
        v11 >>= v109;
        LODWORD(v12) = v12 - v44;
        v41 = v48;
LABEL_90:
        v11 >>= v41;
        *((_DWORD *)state + 23) = v45;
        LODWORD(v12) = v12 - v41;
        out = v113;
        if (v40)
        {
          if ((v40 & 0x20) != 0)
          {
            v54 = 16191;
            goto LABEL_183;
          }
          if ((v40 & 0x40) != 0)
          {
            v79 = "invalid literal/length code";
            goto LABEL_182;
          }
          v52 = v40 & 0xF;
          *((_DWORD *)state + 25) = v52;
          if ((v40 & 0xF) != 0)
          {
            if (v12 < v52)
            {
              do
              {
                if (!avail_in)
                {
                  avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
                  if (!avail_in)
                    goto LABEL_203;
                  v52 = *((_DWORD *)state + 25);
                }
                --avail_in;
                v53 = (unsigned __int8 *)__src;
                __src = (char *)__src + 1;
                v11 += (unint64_t)*v53 << v12;
                LODWORD(v12) = v12 + 8;
              }
              while (v12 < v52);
              v45 = *((_DWORD *)state + 23);
            }
            *((_DWORD *)state + 23) = v45 + (v11 & ~(-1 << v52));
            v11 >>= v52;
            LODWORD(v12) = v12 - v52;
          }
          v80 = *((_QWORD *)state + 14);
          v81 = *((_DWORD *)state + 31);
          v82 = v80 + 4 * (v11 & ~(-1 << v81));
          v83 = *(unsigned __int8 *)(v82 + 1);
          v84 = *(_BYTE *)v82 - (v83 & ((int)(v83 << 27) >> 31) & 0xF);
          if (v12 >= v84)
          {
            v87 = (*(_BYTE *)v82 - (v83 & ((int)(v83 << 27) >> 31) & 0xF));
          }
          else
          {
            v85 = 0;
            do
            {
              if (!avail_in)
              {
                avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
                if (!avail_in)
                  goto LABEL_203;
                v80 = *((_QWORD *)state + 14);
                v81 = *((_DWORD *)state + 31);
              }
              --avail_in;
              v86 = (unsigned __int8 *)__src;
              __src = (char *)__src + 1;
              v11 += (unint64_t)*v86 << (v12 + v85);
              v82 = v80 + 4 * (v11 & ~(-1 << v81));
              v83 = *(unsigned __int8 *)(v82 + 1);
              v84 = *(_BYTE *)v82 - (v83 & ((int)(v83 << 27) >> 31) & 0xF);
              v85 += 8;
            }
            while ((unint64_t)v12 + v85 < v84);
            v87 = (*(_BYTE *)v82 - (v83 & ((int)(v83 << 27) >> 31) & 0xF));
            LODWORD(v12) = v12 + v85;
          }
          v88 = *(unsigned __int16 *)(v82 + 2);
          if (v83 <= 0xF)
          {
            v112 = v84;
            v89 = -1 << (v87 + v83);
            v90 = v80 + 4 * (((v11 & ~v89) >> v87) + v88);
            LOBYTE(v83) = *(_BYTE *)(v90 + 1);
            v91 = *(_BYTE *)v90 - (v83 & ((char)(8 * v83) >> 7) & 0xF);
            if (v87 + v91 > v12)
            {
              v108 = v5;
              v92 = 0;
              v93 = ~v89;
              do
              {
                if (!avail_in)
                {
                  avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
                  if (!avail_in)
                    goto LABEL_210;
                  v80 = *((_QWORD *)state + 14);
                }
                --avail_in;
                v94 = (unsigned __int8 *)__src;
                __src = (char *)__src + 1;
                v11 += (unint64_t)*v94 << (v12 + v92);
                v90 = v80 + 4 * (((v11 & v93) >> v87) + v88);
                LOBYTE(v83) = *(_BYTE *)(v90 + 1);
                v91 = *(_BYTE *)v90 - (v83 & ((char)(8 * v83) >> 7) & 0xF);
                v92 += 8;
              }
              while ((unint64_t)v12 + v92 < v87 + v91);
              LODWORD(v12) = v12 + v92;
              v5 = v108;
            }
            v88 = *(unsigned __int16 *)(v90 + 2);
            v11 >>= v112;
            LODWORD(v12) = v12 - v87;
            v84 = v91;
          }
          v11 >>= v84;
          LODWORD(v12) = v12 - v84;
          out = v113;
          if ((v83 & 0x40) != 0)
          {
            v79 = "invalid distance code";
            goto LABEL_182;
          }
          v95 = v83 & 0xF;
          *((_DWORD *)state + 24) = v88;
          *((_DWORD *)state + 25) = v95;
          if ((v83 & 0xF) != 0)
          {
            if (v12 < v95)
            {
              do
              {
                if (!avail_in)
                {
                  avail_in = ((uint64_t (*)(void *, void **))in)(in_desc, &__src);
                  if (!avail_in)
                    goto LABEL_203;
                  v95 = *((_DWORD *)state + 25);
                }
                --avail_in;
                v96 = (unsigned __int8 *)__src;
                __src = (char *)__src + 1;
                v11 += (unint64_t)*v96 << v12;
                LODWORD(v12) = v12 + 8;
              }
              while (v12 < v95);
              v88 = *((_DWORD *)state + 24);
            }
            v88 += v11 & ~(-1 << v95);
            *((_DWORD *)state + 24) = v88;
            v11 >>= v95;
            LODWORD(v12) = v12 - v95;
          }
          v97 = *((_DWORD *)state + 15);
          if (*((_DWORD *)state + 16) >= v97)
            v98 = 0;
          else
            v98 = v14;
          if (v88 <= v97 - v98)
          {
            do
            {
              v99 = *((unsigned int *)state + 15);
              if ((_DWORD)v14)
              {
                v100 = *((_DWORD *)state + 15);
                LODWORD(v99) = v14;
              }
              else
              {
                next_out = (Bytef *)*((_QWORD *)state + 9);
                *((_DWORD *)state + 16) = v99;
                if (((unsigned int (*)(void *, Bytef *, uint64_t))v113)(out_desc, next_out, v99))
                  goto LABEL_204;
                v100 = *((_DWORD *)state + 15);
              }
              v102 = *((_DWORD *)state + 23);
              v101 = *((unsigned int *)state + 24);
              v103 = (v100 - v101);
              if (v103 >= v99)
                v104 = 0;
              else
                v104 = v103;
              if (v103 >= v99)
                v103 = -v101;
              v105 = v99 - v104;
              if ((int)v99 - v104 >= v102)
                v105 = *((_DWORD *)state + 23);
              *((_DWORD *)state + 23) = v102 - v105;
              v106 = v105;
              do
              {
                *next_out = next_out[v103];
                ++next_out;
                --v106;
              }
              while (v106);
              LODWORD(v14) = v99 - v105;
            }
            while (*((_DWORD *)state + 23));
          }
          else
          {
            v79 = "invalid distance too far back";
LABEL_182:
            v5->msg = (char *)v79;
            v54 = 16209;
LABEL_183:
            *((_DWORD *)state + 2) = v54;
          }
          v8 = in_desc;
LABEL_185:
          v15 = *((_DWORD *)state + 2);
          continue;
        }
        if ((_DWORD)v14)
        {
LABEL_103:
          *next_out++ = v45;
          LODWORD(v14) = v14 - 1;
          v54 = 16200;
          goto LABEL_183;
        }
        next_out = (Bytef *)*((_QWORD *)state + 9);
        v14 = *((unsigned int *)state + 15);
        *((_DWORD *)state + 16) = v14;
        if (!((unsigned int (*)(void *, Bytef *, uint64_t))v113)(out_desc, next_out, v14))
        {
          v45 = *((_DWORD *)state + 23);
          goto LABEL_103;
        }
LABEL_204:
        result = -5;
LABEL_205:
        v5->next_in = (Bytef *)__src;
        v5->avail_in = avail_in;
        return result;
      case 16200:
        goto LABEL_67;
      default:
        if (v15 == 16208)
        {
          v107 = *((_DWORD *)state + 15);
          if (v107 <= v14)
          {
            result = 1;
          }
          else if (((unsigned int (*)(void *, _QWORD, _QWORD))out)(out_desc, *((_QWORD *)state + 9), v107 - v14))
          {
            result = -5;
          }
          else
          {
            result = 1;
          }
        }
        else if (v15 == 16209)
        {
          result = -3;
        }
        else
        {
LABEL_209:
          result = -2;
        }
        goto LABEL_205;
    }
  }
}

int inflateBackEnd(z_streamp strm)
{
  free_func zfree;
  int result;

  if (!strm)
    return -2;
  if (!strm->state)
    return -2;
  zfree = strm->zfree;
  if (!zfree)
    return -2;
  ((void (*)(voidpf))zfree)(strm->opaque);
  result = 0;
  strm->state = 0;
  return result;
}

int inflatePrime(z_streamp strm, int bits, int value)
{
  int result;
  internal_state *state;
  int v8;

  if (sub_22D2585CC(strm))
    return -2;
  state = strm->state;
  if (bits < 0)
  {
    result = 0;
    *((_QWORD *)state + 10) = 0;
    *((_DWORD *)state + 22) = 0;
  }
  else
  {
    if (bits > 0x10)
      return -2;
    v8 = *((_DWORD *)state + 22);
    if ((v8 + bits) > 0x20)
      return -2;
    result = 0;
    *((_QWORD *)state + 10) += (value & ~(-1 << bits)) << v8;
    *((_DWORD *)state + 22) = v8 + bits;
  }
  return result;
}

int inflateGetDictionary(z_streamp strm, Bytef *dictionary, uInt *dictLength)
{
  int result;
  internal_state *state;
  int v8;

  if (sub_22D2585CC(strm))
    return -2;
  state = strm->state;
  if (dictionary)
  {
    v8 = *((_DWORD *)state + 16);
    if (v8)
    {
      memcpy(dictionary, (const void *)(*((_QWORD *)state + 9) + *((unsigned int *)state + 17)), (v8 - *((_DWORD *)state + 17)));
      memcpy(&dictionary[*((unsigned int *)state + 16) - *((unsigned int *)state + 17)], *((const void **)state + 9), *((unsigned int *)state + 17));
    }
  }
  result = 0;
  if (dictLength)
    *dictLength = *((_DWORD *)state + 16);
  return result;
}

int inflateSetDictionary(z_streamp strm, const Bytef *dictionary, uInt dictLength)
{
  int result;
  internal_state *state;
  int v8;
  uLong v9;

  if (sub_22D2585CC(strm))
    return -2;
  state = strm->state;
  v8 = *((_DWORD *)state + 2);
  if (*((_DWORD *)state + 4))
  {
    if (v8 != 16190)
      return -2;
  }
  else if (v8 != 16190)
  {
    goto LABEL_8;
  }
  v9 = adler32(0, 0, 0);
  if (adler32(v9, dictionary, dictLength) != *((_QWORD *)state + 4))
    return -3;
LABEL_8:
  result = sub_22D25684C((uint64_t)strm, (uint64_t)&dictionary[dictLength], dictLength);
  if (result)
  {
    *((_DWORD *)state + 2) = 16210;
    return -4;
  }
  else
  {
    *((_DWORD *)state + 5) = 1;
  }
  return result;
}

int inflateGetHeader(z_streamp strm, gz_headerp head)
{
  internal_state *state;
  int result;

  if (sub_22D2585CC(strm))
    return -2;
  state = strm->state;
  if ((*((_BYTE *)state + 16) & 2) == 0)
    return -2;
  result = 0;
  *((_QWORD *)state + 6) = head;
  head->done = 0;
  return result;
}

int inflateSync(z_streamp strm)
{
  int result;
  internal_state *state;
  uInt avail_in;
  int v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uLong v10;
  int v11;
  unsigned int v12;
  uLong total_out;
  _BYTE v14[4];

  if (sub_22D2585CC(strm))
    return -2;
  state = strm->state;
  avail_in = strm->avail_in;
  if (!avail_in && *((_DWORD *)state + 22) < 8u)
    return -5;
  if (*((_DWORD *)state + 2) != 16211)
  {
    *((_DWORD *)state + 2) = 16211;
    v5 = *((_DWORD *)state + 22);
    v6 = *((_QWORD *)state + 10) << (v5 & 7);
    *((_QWORD *)state + 10) = v6;
    if ((v5 & 0xFFFFFFF8) != 0)
    {
      v7 = 0;
      v8 = -(v5 & 0xFFFFFFF8);
      do
      {
        v14[v7++] = v6;
        v6 >>= 8;
        v8 += 8;
      }
      while (v8);
      *((_QWORD *)state + 10) = v6;
    }
    else
    {
      LODWORD(v7) = 0;
    }
    *((_DWORD *)state + 35) = 0;
    *((_DWORD *)state + 22) = 0;
    sub_22D25E8B0((unsigned int *)state + 35, (uint64_t)v14, v7);
    avail_in = strm->avail_in;
  }
  v9 = sub_22D25E8B0((unsigned int *)state + 35, (uint64_t)strm->next_in, avail_in);
  strm->avail_in -= v9;
  strm->next_in += v9;
  v10 = strm->total_in + v9;
  strm->total_in = v10;
  if (*((_DWORD *)state + 35) != 4)
    return -3;
  v11 = *((_DWORD *)state + 6);
  if (v11 == -1)
    v12 = 0;
  else
    v12 = *((_DWORD *)state + 4) & 0xFFFFFFFB;
  *((_DWORD *)state + 4) = v12;
  total_out = strm->total_out;
  inflateReset(strm);
  result = 0;
  strm->total_in = v10;
  strm->total_out = total_out;
  *((_DWORD *)state + 6) = v11;
  *((_DWORD *)state + 2) = 16191;
  return result;
}

unint64_t sub_22D25E8B0(unsigned int *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v3;
  unsigned int v4;
  int v5;
  unsigned int v6;

  v3 = 0;
  v4 = *a1;
  if (a3 && v4 <= 3)
  {
    v3 = 0;
    do
    {
      if (v4 >= 2)
        v5 = 255;
      else
        v5 = 0;
      v6 = 4 - v4;
      if (*(_BYTE *)(a2 + v3))
        v6 = 0;
      if (v5 == *(unsigned __int8 *)(a2 + v3))
        ++v4;
      else
        v4 = v6;
      ++v3;
    }
    while (v3 < a3 && v4 < 4);
  }
  *a1 = v4;
  return v3;
}

int inflateSyncPoint(z_streamp a1)
{
  internal_state *state;

  if (sub_22D2585CC(a1))
    return -2;
  state = a1->state;
  return *((_DWORD *)state + 2) == 16193 && *((_DWORD *)state + 22) == 0;
}

int inflateCopy(z_streamp dest, z_streamp source)
{
  _BOOL4 v4;
  int result;
  internal_state *state;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  unint64_t v15;
  char *v16;
  char *v17;

  v4 = sub_22D2585CC(source);
  result = -2;
  if (dest && !v4)
  {
    state = source->state;
    v7 = ((uint64_t (*)(voidpf, uint64_t, uint64_t))source->zalloc)(source->opaque, 1, 7160);
    if (!v7)
      return -4;
    v8 = (_QWORD *)v7;
    if (*((_QWORD *)state + 9))
    {
      v9 = (void *)((uint64_t (*)(voidpf, _QWORD, uint64_t))source->zalloc)(source->opaque, (1 << *((_DWORD *)state + 14)), 1);
      if (!v9)
      {
        ((void (*)(voidpf, _QWORD *))source->zfree)(source->opaque, v8);
        return -4;
      }
    }
    else
    {
      v9 = 0;
    }
    v10 = *(_OWORD *)&source->next_in;
    v11 = *(_OWORD *)&source->avail_out;
    *(_OWORD *)&dest->total_in = *(_OWORD *)&source->total_in;
    *(_OWORD *)&dest->avail_out = v11;
    *(_OWORD *)&dest->next_in = v10;
    v12 = *(_OWORD *)&source->msg;
    v13 = *(_OWORD *)&source->zalloc;
    v14 = *(_OWORD *)&source->adler;
    *(_OWORD *)&dest->opaque = *(_OWORD *)&source->opaque;
    *(_OWORD *)&dest->adler = v14;
    *(_OWORD *)&dest->msg = v12;
    *(_OWORD *)&dest->zalloc = v13;
    memcpy(v8, state, 0x1BF8uLL);
    *v8 = dest;
    v15 = *((_QWORD *)state + 13);
    if (v15 >= (unint64_t)state + 1368 && v15 <= (unint64_t)state + 7140)
    {
      v16 = (char *)v8 + v15 - (_QWORD)state;
      v17 = (char *)v8 + *((_QWORD *)state + 14) - (_QWORD)state;
      v8[13] = v16;
      v8[14] = v17;
    }
    v8[18] = (char *)v8 + *((_QWORD *)state + 18) - (_QWORD)state;
    if (v9)
      memcpy(v9, *((const void **)state + 9), 1 << *((_DWORD *)state + 14));
    result = 0;
    v8[9] = v9;
    dest->state = (internal_state *)v8;
  }
  return result;
}

int inflateUndermine(z_streamp a1, int a2)
{
  if (sub_22D2585CC(a1))
    return -2;
  *((_DWORD *)a1->state + 1786) = 1;
  return -3;
}

int inflateValidate(z_streamp a1, int a2)
{
  int result;
  internal_state *state;
  int v6;
  unsigned int v7;
  int v8;

  result = sub_22D2585CC(a1);
  if (result)
    return -2;
  state = a1->state;
  v6 = *((_DWORD *)state + 4);
  v7 = v6 & 0xFFFFFFFB;
  if (v6)
    v8 = v6 | 4;
  else
    v8 = 0;
  if (!a2)
    v8 = v7;
  *((_DWORD *)state + 4) = v8;
  return result;
}

uint64_t inflateMark(z_streamp strm)
{
  internal_state *state;
  uint64_t v4;
  int v5;
  unsigned int v6;

  if (sub_22D2585CC(strm))
    return -65536;
  state = strm->state;
  v4 = (uint64_t)*((int *)state + 1787) << 16;
  v5 = *((_DWORD *)state + 2);
  if (v5 == 16204)
  {
    v6 = *((_DWORD *)state + 1788) - *((_DWORD *)state + 23);
  }
  else if (v5 == 16195)
  {
    v6 = *((_DWORD *)state + 23);
  }
  else
  {
    v6 = 0;
  }
  return v4 + v6;
}

unint64_t inflateCodesUsed(z_streamp a1)
{
  if (sub_22D2585CC(a1))
    return -1;
  else
    return (int64_t)(*((_QWORD *)a1->state + 18) - (unint64_t)a1->state - 1368) >> 2;
}

uint64_t sub_22D25EBFC(uint64_t result)
{
  int v1;
  int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  int v15;

  v1 = *(_DWORD *)(result + 5940);
  v2 = *(unsigned __int16 *)(result + 5936);
  v3 = v2 | (2 << v1);
  *(_WORD *)(result + 5936) = v2 | (2 << v1);
  if (v1 < 14)
  {
    v9 = v1 + 3;
  }
  else
  {
    v4 = *(_QWORD *)(result + 16);
    v5 = *(_QWORD *)(result + 40);
    *(_QWORD *)(result + 40) = v5 + 1;
    *(_BYTE *)(v4 + v5) = v3;
    v6 = *(_BYTE *)(result + 5937);
    v7 = *(_QWORD *)(result + 16);
    v8 = *(_QWORD *)(result + 40);
    *(_QWORD *)(result + 40) = v8 + 1;
    *(_BYTE *)(v7 + v8) = v6;
    LODWORD(v7) = *(_DWORD *)(result + 5940);
    v3 = 2u >> (16 - v7);
    *(_WORD *)(result + 5936) = v3;
    v9 = v7 - 13;
  }
  *(_DWORD *)(result + 5940) = v9;
  if (v9 < 10)
  {
    v15 = v9 + 7;
  }
  else
  {
    v10 = *(_QWORD *)(result + 16);
    v11 = *(_QWORD *)(result + 40);
    *(_QWORD *)(result + 40) = v11 + 1;
    *(_BYTE *)(v10 + v11) = v3;
    v12 = *(_BYTE *)(result + 5937);
    v13 = *(_QWORD *)(result + 16);
    v14 = *(_QWORD *)(result + 40);
    *(_QWORD *)(result + 40) = v14 + 1;
    *(_BYTE *)(v13 + v14) = v12;
    *(_WORD *)(result + 5936) = 0;
    v15 = *(_DWORD *)(result + 5940) - 9;
  }
  *(_DWORD *)(result + 5940) = v15;
  return sub_22D25A094(result);
}

const char *zlibVersion(void)
{
  return "1.2.12";
}

uLong zlibCompileFlags(void)
{
  return 681;
}

const char *__cdecl zError(int a1)
{
  return off_24F86F208[2 - a1];
}

int gzbuffer(gzFile file, unsigned int size)
{
  unsigned int have;
  int result;
  BOOL v5;
  unsigned int v6;

  if (!file)
    return -1;
  have = file[1].have;
  result = -1;
  v5 = have == 31153 || have == 7247;
  if (v5 && (size & 0x80000000) == 0 && !LODWORD(file[1].pos))
  {
    result = 0;
    if (size <= 2)
      v6 = 2;
    else
      v6 = size;
    HIDWORD(file[1].pos) = v6;
  }
  return result;
}

int gzrewind(gzFile file)
{
  int pos_high;
  BOOL v3;

  if (!file)
    return -1;
  if (file[1].have != 7247)
    return -1;
  pos_high = HIDWORD(file[4].pos);
  v3 = !pos_high || pos_high == -5;
  if (!v3 || lseek(*(&file[1].have + 1), *(_QWORD *)&file[3].have, 0) == -1)
    return -1;
  sub_22D25BDF0((uint64_t)file);
  return 0;
}

uint64_t gzseek_0(gzFile a1, uint64_t a2, int a3)
{
  unsigned int have;
  int pos_high;
  BOOL v7;
  uint64_t result;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  off_t v13;

  if (!a1)
    return -1;
  have = a1[1].have;
  if (have != 31153 && have != 7247)
    return -1;
  pos_high = HIDWORD(a1[4].pos);
  v7 = !pos_high || pos_high == -5;
  if (!v7 || a3 > 1)
    return -1;
  v9 = a2;
  if (a3)
  {
    if (LODWORD(a1[4].pos))
      v9 = (uint64_t)&a1[4].next[a2];
  }
  else
  {
    v9 = a2 - a1->pos;
  }
  LODWORD(a1[4].pos) = 0;
  if (have != 7247)
  {
    if ((v9 & 0x8000000000000000) == 0)
      goto LABEL_36;
    return -1;
  }
  if (HIDWORD(a1[2].pos) == 1 && a1->pos + v9 >= 0)
  {
    result = lseek(*(&a1[1].have + 1), v9 - a1->have, 1);
    if (result != -1)
    {
      a1->have = 0;
      a1[3].next = 0;
      LODWORD(a1[4].pos) = 0;
      v10 = *(void **)&a1[5].have;
      if (v10)
      {
        if (HIDWORD(a1[4].pos) != -4)
          free(v10);
        *(_QWORD *)&a1[5].have = 0;
      }
      HIDWORD(a1[4].pos) = 0;
      LODWORD(a1[5].pos) = 0;
      result = a1->pos + v9;
      a1->pos = result;
    }
    return result;
  }
  if ((v9 & 0x8000000000000000) == 0)
    goto LABEL_32;
  v9 += a1->pos;
  if (v9 < 0 || gzrewind(a1) == -1)
    return -1;
  if (a1[1].have == 7247)
  {
LABEL_32:
    v11 = a1->have;
    if (v9 >= v11)
      v12 = v11;
    else
      v12 = v9;
    a1->have = v11 - v12;
    v13 = a1->pos + v12;
    a1->next += v12;
    a1->pos = v13;
    v9 -= v12;
  }
LABEL_36:
  if (v9)
  {
    LODWORD(a1[4].pos) = 1;
    a1[4].next = (unsigned __int8 *)v9;
  }
  return a1->pos + v9;
}

uint64_t gztell(gzFile a1)
{
  unsigned int have;
  unsigned __int8 *next;

  if (!a1)
    return -1;
  have = a1[1].have;
  if (have != 31153 && have != 7247)
    return -1;
  if (LODWORD(a1[4].pos))
    next = a1[4].next;
  else
    next = 0;
  return (uint64_t)&next[a1->pos];
}

int gzeof(gzFile file)
{
  if (file)
  {
    if (file[1].have == 7247)
      LODWORD(file) = HIDWORD(file[3].next);
    else
      LODWORD(file) = 0;
  }
  return (int)file;
}

const char *__cdecl gzerror(const char *file, int *errnum)
{
  int v2;

  if (file)
  {
    v2 = *((_DWORD *)file + 6);
    if (v2 == 31153 || v2 == 7247)
    {
      if (errnum)
        *errnum = *((_DWORD *)file + 29);
      if (*((_DWORD *)file + 29) == -4)
      {
        return "out of memory";
      }
      else if (*((_QWORD *)file + 15))
      {
        return (const char *)*((_QWORD *)file + 15);
      }
      else
      {
        return (const char *)&unk_22D262C0B;
      }
    }
    else
    {
      return 0;
    }
  }
  return file;
}

void gzclearerr(gzFile file)
{
  unsigned int have;
  void *v3;

  if (file)
  {
    have = file[1].have;
    if (have != 31153)
    {
      if (have != 7247)
        return;
      file[3].next = 0;
    }
    v3 = *(void **)&file[5].have;
    if (v3)
    {
      if (HIDWORD(file[4].pos) != -4)
        free(v3);
      *(_QWORD *)&file[5].have = 0;
    }
    HIDWORD(file[4].pos) = 0;
  }
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  int pos_high;
  int result;
  int v7;

  if (!file)
    return -1;
  if (file[1].have != 7247)
    return -1;
  pos_high = HIDWORD(file[4].pos);
  if (pos_high && pos_high != -5)
    return -1;
  if ((len & 0x80000000) != 0)
  {
    sub_22D25BE5C((uint64_t)file, -2, "request does not fit in an int");
    return -1;
  }
  result = sub_22D25F0F4((uint64_t)file, (char *)buf, len);
  if (!result)
  {
    v7 = HIDWORD(file[4].pos);
    if (v7)
    {
      if (v7 != -5)
        return -1;
    }
  }
  return result;
}

uint64_t sub_22D25F0F4(uint64_t a1, char *__dst, unint64_t a3)
{
  unint64_t v3;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unsigned int v11;

  if (a3)
  {
    v3 = a3;
    if (!*(_DWORD *)(a1 + 112)
      || (*(_DWORD *)(a1 + 112) = 0, sub_22D25F4B4((unsigned int *)a1, *(_QWORD *)(a1 + 104)) != -1))
    {
      v6 = 0;
      while (1)
      {
        if (v3 >= 0xFFFFFFFF)
          v7 = -1;
        else
          v7 = v3;
        v11 = v7;
        v8 = *(_DWORD *)a1;
        if (*(_DWORD *)a1)
        {
          if (v8 < v7)
          {
            v11 = *(_DWORD *)a1;
            v7 = v8;
          }
          memcpy(__dst, *(const void **)(a1 + 8), v7);
          *(_QWORD *)(a1 + 8) += v7;
          *(_DWORD *)a1 -= v7;
        }
        else
        {
          if (*(_DWORD *)(a1 + 80) && !*(_DWORD *)(a1 + 136))
          {
            *(_DWORD *)(a1 + 84) = 1;
            return v6;
          }
          v9 = *(_DWORD *)(a1 + 68);
          if (!v9 || v7 < 2 * *(_DWORD *)(a1 + 40))
          {
            if (sub_22D25F68C(a1) == -1)
              return 0;
            goto LABEL_18;
          }
          if (v9 == 1)
          {
            if (sub_22D25F9CC(a1, (uint64_t)__dst, v7, &v11) == -1)
              return 0;
            v7 = v11;
          }
          else
          {
            *(_DWORD *)(a1 + 160) = v7;
            *(_QWORD *)(a1 + 152) = __dst;
            if (sub_22D25FA84(a1) == -1)
              return 0;
            v7 = *(_DWORD *)a1;
            v11 = *(_DWORD *)a1;
            *(_DWORD *)a1 = 0;
          }
        }
        v3 -= v7;
        __dst += v7;
        v6 += v7;
        *(_QWORD *)(a1 + 16) += v7;
LABEL_18:
        if (!v3)
          return v6;
      }
    }
  }
  return 0;
}

z_size_t gzfread(voidp buf, z_size_t size, z_size_t nitems, gzFile file)
{
  int pos_high;
  _BOOL4 v6;
  unint64_t v8;

  if (!file)
    return 0;
  if (file[1].have == 7247)
  {
    pos_high = HIDWORD(file[4].pos);
    if (!pos_high || pos_high == -5)
    {
      v6 = !is_mul_ok(size, nitems);
      if (size && v6)
      {
        sub_22D25BE5C((uint64_t)file, -2, "request does not fit in a size_t");
      }
      else
      {
        v8 = size * nitems;
        if (v8)
          return sub_22D25F0F4((uint64_t)file, (char *)buf, v8) / size;
      }
    }
  }
  return 0;
}

int gzgetc(gzFile file)
{
  int pos_high;
  unsigned __int8 *next;
  off_t v4;
  unsigned __int8 __dst;

  if (!file)
    return -1;
  if (file[1].have != 7247)
    return -1;
  pos_high = HIDWORD(file[4].pos);
  if (pos_high && pos_high != -5)
    return -1;
  if (file->have)
  {
    --file->have;
    next = file->next;
    v4 = file->pos + 1;
    file->next = next + 1;
    file->pos = v4;
    return *next;
  }
  else if (sub_22D25F0F4((uint64_t)file, (char *)&__dst, 1uLL))
  {
    return __dst;
  }
  else
  {
    return -1;
  }
}

int gzungetc(int c, gzFile file)
{
  int pos_high;
  int v6;
  int result;
  uint64_t have;
  int pos;
  unsigned __int8 *next;
  unsigned __int8 *v11;
  unsigned __int8 v12;

  if (!file)
    return -1;
  if (file[1].have != 7247)
    return -1;
  pos_high = HIDWORD(file[4].pos);
  if (pos_high && pos_high != -5)
    return -1;
  if (!LODWORD(file[4].pos))
  {
    if (c < 0)
      return -1;
LABEL_14:
    have = file->have;
    if ((_DWORD)have)
    {
      pos = file[1].pos;
      if ((_DWORD)have == 2 * pos)
      {
        sub_22D25BE5C((uint64_t)file, -3, "out of room to push characters");
        return -1;
      }
      next = file->next;
      if (next == file[2].next)
      {
        v11 = &next[have];
        next += (2 * pos);
        do
        {
          v12 = *--v11;
          *--next = v12;
        }
        while (v11 > file[2].next);
        LODWORD(have) = file->have;
      }
      file->have = have + 1;
    }
    else
    {
      file->have = 1;
      next = &file[2].next[2 * LODWORD(file[1].pos)];
    }
    file->next = next - 1;
    *(next - 1) = c;
    --file->pos;
    HIDWORD(file[3].next) = 0;
    return c;
  }
  LODWORD(file[4].pos) = 0;
  v6 = sub_22D25F4B4(&file->have, (uint64_t)file[4].next);
  result = -1;
  if ((c & 0x80000000) == 0 && v6 != -1)
    goto LABEL_14;
  return result;
}

uint64_t sub_22D25F4B4(unsigned int *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  if (!a2)
    return 0;
  v2 = a2;
  while (1)
  {
    v4 = *a1;
    if (!(_DWORD)v4)
      break;
    if (v2 >= v4)
      v5 = v4;
    else
      v5 = v2;
    *a1 = v4 - v5;
    v6 = *((_QWORD *)a1 + 2) + v5;
    *((_QWORD *)a1 + 1) += v5;
    *((_QWORD *)a1 + 2) = v6;
    v2 -= v5;
LABEL_11:
    if (!v2)
      return 0;
  }
  if (!a1[20] || a1[34])
  {
    result = sub_22D25F68C((uint64_t)a1);
    if ((_DWORD)result == -1)
      return result;
    goto LABEL_11;
  }
  return 0;
}

char *__cdecl gzgets(gzFile file, char *buf, int len)
{
  char *result;
  unsigned int v6;
  int pos_high;
  int v8;
  unsigned int have;
  char *v10;
  size_t v11;
  unsigned __int8 *next;
  void *v13;
  off_t v14;

  result = 0;
  if (file)
  {
    if (buf)
    {
      v6 = len - 1;
      if (len >= 1)
      {
        if (file[1].have == 7247)
        {
          pos_high = HIDWORD(file[4].pos);
          if (!pos_high || pos_high == -5)
          {
            if (LODWORD(file[4].pos))
            {
              LODWORD(file[4].pos) = 0;
              v8 = sub_22D25F4B4(&file->have, (uint64_t)file[4].next);
              result = 0;
              if (v8 == -1 || !v6)
                return result;
              goto LABEL_12;
            }
            v6 = len - 1;
            if (len != 1)
            {
LABEL_12:
              have = file->have;
              v10 = buf;
              while (1)
              {
                if (!have)
                {
                  if (sub_22D25F68C((uint64_t)file) == -1)
                    return 0;
                  have = file->have;
                  if (!file->have)
                    break;
                }
                if (have >= v6)
                  v11 = v6;
                else
                  v11 = have;
                next = file->next;
                v13 = memchr(next, 10, v11);
                if (v13)
                  v11 = ((_DWORD)v13 - (_DWORD)next + 1);
                else
                  v11 = v11;
                memcpy(v10, next, v11);
                have = file->have - v11;
                file->have = have;
                v14 = file->pos + v11;
                file->next += v11;
                file->pos = v14;
                v10 += v11;
                if (!v13)
                {
                  v6 -= v11;
                  if (v6)
                    continue;
                }
                goto LABEL_26;
              }
              HIDWORD(file[3].next) = 1;
LABEL_26:
              if (v10 != buf)
              {
                *v10 = 0;
                return buf;
              }
            }
          }
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_22D25F68C(uint64_t a1)
{
  int v2;
  uint64_t result;

  while (1)
  {
    v2 = *(_DWORD *)(a1 + 68);
    if (!v2)
    {
      result = sub_22D25F79C(a1);
      if ((_DWORD)result == -1)
        return result;
      if (!*(_DWORD *)(a1 + 68))
        return 0;
      goto LABEL_9;
    }
    if (v2 == 2)
    {
      *(_DWORD *)(a1 + 160) = 2 * *(_DWORD *)(a1 + 40);
      *(_QWORD *)(a1 + 152) = *(_QWORD *)(a1 + 56);
      result = sub_22D25FA84(a1);
      if ((_DWORD)result == -1)
        return result;
      goto LABEL_9;
    }
    if (v2 == 1)
      break;
LABEL_9:
    if (*(_DWORD *)a1 || *(_DWORD *)(a1 + 80) && !*(_DWORD *)(a1 + 136))
      return 0;
  }
  result = sub_22D25F9CC(a1, *(_QWORD *)(a1 + 56), 2 * *(_DWORD *)(a1 + 40), (unsigned int *)a1);
  if ((_DWORD)result != -1)
  {
    result = 0;
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a1 + 56);
  }
  return result;
}

int gzdirect(gzFile file)
{
  gzFile v1;

  if (file)
  {
    v1 = file;
    if (file[1].have == 7247 && !HIDWORD(file[2].pos) && !file->have)
      sub_22D25F79C((uint64_t)file);
    LODWORD(file) = v1[2].pos;
  }
  return (int)file;
}

uint64_t sub_22D25F79C(uint64_t a1)
{
  z_stream *v2;
  uint64_t result;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;

  v2 = (z_stream *)(a1 + 128);
  if (*(_DWORD *)(a1 + 40))
    goto LABEL_2;
  *(_QWORD *)(a1 + 48) = malloc_type_malloc(*(unsigned int *)(a1 + 44), 0xD3B4543EuLL);
  v6 = malloc_type_malloc((2 * *(_DWORD *)(a1 + 44)), 0xF80DA7CCuLL);
  *(_QWORD *)(a1 + 56) = v6;
  if (*(_QWORD *)(a1 + 48))
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    free(v6);
    free(*(void **)(a1 + 48));
LABEL_20:
    sub_22D25BE5C(a1, -4, "out of memory");
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a1 + 44);
  *(_DWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 192) = 0;
  if (inflateInit2_(v2, 31, "1.2.12", 112))
  {
    free(*(void **)(a1 + 56));
    free(*(void **)(a1 + 48));
    *(_DWORD *)(a1 + 40) = 0;
    goto LABEL_20;
  }
LABEL_2:
  LODWORD(result) = *(_DWORD *)(a1 + 136);
  if (result > 1)
    goto LABEL_7;
  result = sub_22D25FBB8(a1);
  if ((_DWORD)result == -1)
    return result;
  result = *(unsigned int *)(a1 + 136);
  if (!(_DWORD)result)
    return result;
  if ((_DWORD)result != 1)
  {
LABEL_7:
    if (*v2->next_in == 31 && v2->next_in[1] == 139)
    {
      inflateReset(v2);
      result = 0;
      v4 = 0x200000000;
LABEL_11:
      *(_QWORD *)(a1 + 64) = v4;
      return result;
    }
  }
  if (*(_DWORD *)(a1 + 64))
  {
    v5 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 8) = v5;
    memcpy(v5, *(const void **)(a1 + 128), result);
    result = 0;
    *(_DWORD *)a1 = *(_DWORD *)(a1 + 136);
    *(_DWORD *)(a1 + 136) = 0;
    v4 = 0x100000001;
    goto LABEL_11;
  }
  result = 0;
  *(_DWORD *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 80) = 1;
  *(_DWORD *)a1 = 0;
  return result;
}

int gzclose_r(gzFile file)
{
  int v2;
  int v3;

  if (!file)
    return -2;
  if (file[1].have != 7247)
    return -2;
  if (LODWORD(file[1].pos))
  {
    inflateEnd((z_streamp)&file[5].next);
    free(file[2].next);
    free(*(void **)&file[2].have);
  }
  if (HIDWORD(file[4].pos) == -5)
    v2 = -5;
  else
    v2 = 0;
  sub_22D25BE5C((uint64_t)file, 0, 0);
  free(file[1].next);
  v3 = close(*(&file[1].have + 1));
  free(file);
  if (v3)
    return -1;
  else
    return v2;
}

uint64_t sub_22D25F9CC(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int *a4)
{
  unsigned int v8;
  size_t v9;
  int v10;
  uint64_t v11;
  int *v12;
  char *v13;

  v8 = 0;
  *a4 = 0;
  while (1)
  {
    v9 = a3 - v8 >= 0x40000000 ? 0x40000000 : a3 - v8;
    v10 = read(*(_DWORD *)(a1 + 28), (void *)(a2 + v8), v9);
    if (v10 < 1)
      break;
    v8 = *a4 + v10;
    *a4 = v8;
    if (v8 >= a3)
      return 0;
  }
  if (v10 < 0)
  {
    v12 = __error();
    v13 = strerror(*v12);
    v11 = 0xFFFFFFFFLL;
    sub_22D25BE5C(a1, -1, v13);
  }
  else
  {
    v11 = 0;
    *(_DWORD *)(a1 + 80) = 1;
  }
  return v11;
}

uint64_t sub_22D25FA84(uint64_t a1)
{
  int v2;
  z_stream *v3;
  int v4;
  uint64_t result;
  int v6;
  int v7;
  const char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v2 = 0;
  v3 = (z_stream *)(a1 + 128);
  v4 = *(_DWORD *)(a1 + 160);
  while (2)
  {
    if (*(_DWORD *)(a1 + 136))
      goto LABEL_22;
    result = sub_22D25FBB8(a1);
    if ((_DWORD)result == -1)
      return result;
    if (*(_DWORD *)(a1 + 136))
    {
LABEL_22:
      v6 = inflate(v3, 0);
      v2 = v6;
      switch(v6)
      {
        case -4:
          v8 = "out of memory";
          v9 = a1;
          v10 = -4;
          break;
        case -3:
          if (*(_QWORD *)(a1 + 176))
            v8 = *(const char **)(a1 + 176);
          else
            v8 = "compressed data error";
          v9 = a1;
          v10 = -3;
          break;
        case -2:
        case 2:
          v8 = "internal error: inflate stream corrupt";
          v9 = a1;
          v10 = -2;
          break;
        default:
          v7 = *(_DWORD *)(a1 + 160);
          if (v6 == 1 || !v7)
            goto LABEL_18;
          continue;
      }
      sub_22D25BE5C(v9, v10, v8);
      return 0xFFFFFFFFLL;
    }
    else
    {
      sub_22D25BE5C(a1, -5, "unexpected end of file");
      v7 = *(_DWORD *)(a1 + 160);
LABEL_18:
      v11 = (v4 - v7);
      *(_DWORD *)a1 = v11;
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a1 + 152) - v11;
      result = 0;
      if (v2 == 1)
        *(_DWORD *)(a1 + 68) = 0;
    }
    return result;
  }
}

uint64_t sub_22D25FBB8(uint64_t a1)
{
  int v1;
  BOOL v2;
  uint64_t result;
  unsigned int v5;
  _BYTE *v6;
  char *v7;
  char v8;
  unsigned int v9;

  v1 = *(_DWORD *)(a1 + 116);
  if (v1)
    v2 = v1 == -5;
  else
    v2 = 1;
  if (!v2)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)(a1 + 80))
    return 0;
  v5 = *(_DWORD *)(a1 + 136);
  if (v5)
  {
    v6 = *(_BYTE **)(a1 + 48);
    v7 = *(char **)(a1 + 128);
    do
    {
      v8 = *v7++;
      *v6++ = v8;
      --v5;
    }
    while (v5);
    v5 = *(_DWORD *)(a1 + 136);
  }
  v9 = 0;
  result = sub_22D25F9CC(a1, *(_QWORD *)(a1 + 48) + v5, *(_DWORD *)(a1 + 40) - v5, &v9);
  if ((_DWORD)result != -1)
  {
    result = 0;
    *(_DWORD *)(a1 + 136) += v9;
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(a1 + 48);
  }
  return result;
}

z_size_t gzfwrite(voidpc buf, z_size_t size, z_size_t nitems, gzFile file)
{
  _BOOL4 v5;
  unint64_t v6;

  if (!file)
    return 0;
  if (file[1].have != 31153 || HIDWORD(file[4].pos))
    return 0;
  v5 = !is_mul_ok(size, nitems);
  if (size && v5)
  {
    sub_22D25BE5C((uint64_t)file, -2, "request does not fit in a size_t");
    return 0;
  }
  v6 = size * nitems;
  if (!v6)
    return 0;
  return sub_22D25501C((uint64_t)file, (char *)buf, v6) / size;
}

int gzputc(gzFile file, int c)
{
  int result;
  unsigned __int8 v4;
  unsigned int pos;
  int v6;
  unsigned __int8 *next;
  unsigned __int8 *v8;
  unsigned int v9;
  unsigned __int8 __src;

  if (!file)
    return -1;
  if (file[1].have != 31153 || HIDWORD(file[4].pos))
    return -1;
  v4 = c;
  if (!LODWORD(file[4].pos)
    || (LODWORD(file[4].pos) = 0, result = sub_22D25FDE8((uint64_t)file, (uint64_t)file[4].next), result != -1))
  {
    pos = file[1].pos;
    if (pos
      && ((v6 = file[5].pos) == 0
        ? (unsigned __int8 *)(v8 = *(unsigned __int8 **)&file[2].have, file[5].next = v8, LODWORD(next) = (_DWORD)v8)
        : (next = file[5].next, v8 = *(unsigned __int8 **)&file[2].have),
          v9 = (_DWORD)next + v6 - (_DWORD)v8,
          pos > v9))
    {
      v8[v9] = v4;
      ++LODWORD(file[5].pos);
      ++file->pos;
      return v4;
    }
    else
    {
      __src = v4;
      if (sub_22D25501C((uint64_t)file, (char *)&__src, 1uLL) == 1)
        return v4;
      else
        return -1;
    }
  }
  return result;
}

uint64_t sub_22D25FDE8(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char i;
  uint64_t v6;
  size_t v7;

  if (!*(_DWORD *)(a1 + 136) || (result = sub_22D255188(a1, 0), (_DWORD)result != -1))
  {
    if (a2)
    {
      for (i = 0; ; i = 1)
      {
        v6 = *(unsigned int *)(a1 + 40);
        v7 = a2 >= v6 ? v6 : a2;
        if ((i & 1) == 0)
          bzero(*(void **)(a1 + 48), v7);
        *(_DWORD *)(a1 + 136) = v7;
        *(_QWORD *)(a1 + 128) = *(_QWORD *)(a1 + 48);
        *(_QWORD *)(a1 + 16) += v7;
        result = sub_22D255188(a1, 0);
        if ((_DWORD)result == -1)
          break;
        a2 -= v7;
        if (!a2)
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

int gzputs(gzFile file, const char *s)
{
  size_t v4;
  int v5;

  if (!file)
    return -1;
  if (file[1].have != 31153 || HIDWORD(file[4].pos))
    return -1;
  v4 = strlen(s);
  if (v4 >> 31)
  {
    sub_22D25BE5C((uint64_t)file, -2, "string length does not fit in int");
    return -1;
  }
  v5 = v4;
  if (sub_22D25501C((uint64_t)file, (char *)s, v4) < v4)
    return -1;
  else
    return v5;
}

int gzvprintf(gzFile file, const char *format, va_list va)
{
  int v4;
  uint64_t pos_low;
  unsigned __int8 *next;
  unsigned __int8 *v10;
  int v11;
  unsigned int pos;
  unsigned int v13;
  size_t v14;

  if (!file || file[1].have != 31153 || HIDWORD(file[4].pos))
    return -2;
  if (!LODWORD(file[1].pos) && sub_22D254B80((uint64_t)file) == -1)
    return HIDWORD(file[4].pos);
  if (LODWORD(file[4].pos))
  {
    LODWORD(file[4].pos) = 0;
    if (sub_22D25FDE8((uint64_t)file, (uint64_t)file[4].next) == -1)
      return HIDWORD(file[4].pos);
  }
  pos_low = LODWORD(file[5].pos);
  if ((_DWORD)pos_low)
  {
    next = file[5].next;
  }
  else
  {
    next = *(unsigned __int8 **)&file[2].have;
    file[5].next = next;
  }
  v10 = &next[pos_low];
  next[pos_low + (LODWORD(file[1].pos) - 1)] = 0;
  v11 = vsnprintf((char *)&next[pos_low], LODWORD(file[1].pos), format, va);
  v4 = v11;
  if (v11)
  {
    pos = file[1].pos;
    if (v11 >= pos || v10[pos - 1])
      return 0;
    v13 = LODWORD(file[5].pos) + v11;
    LODWORD(file[5].pos) = v13;
    file->pos += v11;
    v14 = v13 - pos;
    if (v13 < pos)
      return v4;
    LODWORD(file[5].pos) = pos;
    if (sub_22D255188((uint64_t)file, 0) != -1)
    {
      memmove(*(void **)&file[2].have, (const void *)(*(_QWORD *)&file[2].have + LODWORD(file[1].pos)), v14);
      file[5].next = *(unsigned __int8 **)&file[2].have;
      LODWORD(file[5].pos) = v14;
      return v4;
    }
    return HIDWORD(file[4].pos);
  }
  return v4;
}

int gzprintf(gzFile file, const char *format, ...)
{
  va_list va;

  va_start(va, format);
  return gzvprintf(file, format, va);
}

int gzsetparams(gzFile file, int level, int strategy)
{
  int result;

  if (!file)
    return -2;
  if (file[1].have != 31153 || HIDWORD(file[4].pos))
    return -2;
  if (LODWORD(file[3].pos) == level && HIDWORD(file[3].pos) == strategy)
    return 0;
  if (!LODWORD(file[4].pos)
    || (LODWORD(file[4].pos) = 0, sub_22D25FDE8((uint64_t)file, (uint64_t)file[4].next) != -1))
  {
    if (!LODWORD(file[1].pos))
    {
LABEL_15:
      result = 0;
      LODWORD(file[3].pos) = level;
      HIDWORD(file[3].pos) = strategy;
      return result;
    }
    if (!LODWORD(file[5].pos) || sub_22D255188((uint64_t)file, 5) != -1)
    {
      deflateParams((z_streamp)&file[5].next, level, strategy);
      goto LABEL_15;
    }
  }
  return HIDWORD(file[4].pos);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

