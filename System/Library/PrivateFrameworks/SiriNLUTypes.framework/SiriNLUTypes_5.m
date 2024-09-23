uint64_t sirinluexternal::UserParse::UserParse(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_OWORD *)(a1 + 56) = 0u;
  v4 = (uint64_t *)(a1 + 56);
  *(_QWORD *)a1 = &off_1E7BB18F0;
  v5 = (_QWORD *)(a1 + 64);
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(_DWORD *)(a2 + 88) = 0;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 24) = 0;
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v6;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(v5);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v8;
  if (v9)
    std::default_delete<std::string>::operator()[abi:ne180100](v9);
  v10 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 56) = 0;
  v11 = *v4;
  *v4 = v10;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  v12 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a2 + 32) = 0;
  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v12;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v14 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v15 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v14;
  if (v15)
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
  return a1;
}

uint64_t sirinluexternal::UserParse::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  int v19;

  if (a1 != a2)
  {
    sirinluexternal::UserParse::UserParse((uint64_t)&v12, a2);
    v3 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)(a1 + 72) = v18;
    v18 = v3;
    v4 = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v16;
    v16 = v4;
    v5 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)(a1 + 56) = v17;
    v17 = v5;
    v6 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v13;
    v13 = v6;
    v7 = v15;
    v9 = *(_OWORD *)(a1 + 16);
    v8 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(a1 + 16) = v14;
    *(_OWORD *)(a1 + 32) = v7;
    v10 = *(_DWORD *)(a1 + 88);
    *(_DWORD *)(a1 + 88) = v19;
    v19 = v10;
    v14 = v9;
    v15 = v8;
    sirinluexternal::UserParse::~UserParse((sirinluexternal::UserParse *)&v12);
  }
  return a1;
}

BOOL sirinluexternal::UserParse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;
  char v7;
  char v8;
  unsigned __int8 *v9;
  unsigned __int8 **v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  int v14;
  unsigned __int8 *v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    if (!v5 || !sirinluexternal::UUID::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  result = PB::PtrVector<sirinluexternal::UserDialogAct>::operator==((uint64_t *)(a1 + 64), *(_QWORD ***)(a2 + 64), *(_QWORD *)(a2 + 72));
  if (!result)
    return result;
  v7 = *(_BYTE *)(a1 + 88);
  v8 = *(_BYTE *)(a2 + 88);
  if ((v7 & 2) != 0)
  {
    if ((*(_BYTE *)(a2 + 88) & 2) == 0 || *(double *)(a1 + 48) != *(double *)(a2 + 48))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 88) & 2) != 0)
  {
    return 0;
  }
  v9 = *(unsigned __int8 **)(a1 + 40);
  v10 = *(unsigned __int8 ***)(a2 + 40);
  if (v9)
  {
    if (!v10)
      return 0;
    v11 = v9[23];
    if ((v11 & 0x80u) == 0)
      v12 = (unsigned __int8 *)v9[23];
    else
      v12 = (unsigned __int8 *)*((_QWORD *)v9 + 1);
    v13 = (unsigned __int8 *)*((unsigned __int8 *)v10 + 23);
    v14 = (char)v13;
    if ((char)v13 < 0)
      v13 = v10[1];
    if (v12 != v13)
      return 0;
    if (v14 >= 0)
      v15 = *(unsigned __int8 **)(a2 + 40);
    else
      v15 = *v10;
    if ((v11 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v9, v15, *((_QWORD *)v9 + 1)))
        return 0;
    }
    else if (v9[23])
    {
      v16 = v11 - 1;
      do
      {
        v18 = *v9++;
        v17 = v18;
        v20 = *v15++;
        v19 = v20;
        v22 = v16-- != 0;
      }
      while (v17 == v19 && v22);
      if (v17 != v19)
        return 0;
    }
  }
  else if (v10)
  {
    return 0;
  }
  v23 = *(_QWORD *)(a1 + 56);
  v24 = *(_QWORD *)(a2 + 56);
  if (v23)
  {
    if (!v24 || !sirinluexternal::RepetitionResult::operator==(v23, v24))
      return 0;
  }
  else if (v24)
  {
    return 0;
  }
  v25 = *(_QWORD *)(a1 + 32);
  v26 = *(_QWORD *)(a2 + 32);
  if (v25)
  {
    if (!v26 || !sirinluexternal::Parser::operator==(v25, v26))
      return 0;
  }
  else if (v26)
  {
    return 0;
  }
  if ((v7 & 1) == 0)
  {
    if ((v8 & 1) == 0)
      goto LABEL_53;
    return 0;
  }
  if ((v8 & 1) == 0 || *(double *)(a1 + 8) != *(double *)(a2 + 8))
    return 0;
LABEL_53:
  v27 = *(_QWORD *)(a1 + 16);
  v28 = *(_QWORD *)(a2 + 16);
  result = (v27 | v28) == 0;
  if (v27 && v28)
  {
    if ((*(_BYTE *)(v27 + 12) & 1) != 0)
    {
      if ((*(_BYTE *)(v28 + 12) & 1) != 0 && *(_DWORD *)(v27 + 8) == *(_DWORD *)(v28 + 8))
        return 1;
    }
    else if ((*(_BYTE *)(v28 + 12) & 1) == 0)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t sirinluexternal::UserParse::hash_value(sirinluexternal::UserParse *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  sirinluexternal::UserDialogAct **v7;
  sirinluexternal::UserDialogAct **v8;
  uint64_t v9;
  sirinluexternal::UserDialogAct *v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;

  v2 = *((_QWORD *)this + 3);
  if (!v2)
  {
    v6 = 0;
    goto LABEL_11;
  }
  if ((*(_BYTE *)(v2 + 28) & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)(v2 + 28) & 2) != 0)
      goto LABEL_4;
LABEL_8:
    v4 = 0;
    if ((*(_BYTE *)(v2 + 28) & 4) != 0)
      goto LABEL_5;
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v3 = *(_QWORD *)(v2 + 8);
  if ((*(_BYTE *)(v2 + 28) & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)(v2 + 16);
  if ((*(_BYTE *)(v2 + 28) & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = *(int *)(v2 + 24);
LABEL_10:
  v6 = v4 ^ v3 ^ v5;
LABEL_11:
  v7 = (sirinluexternal::UserDialogAct **)*((_QWORD *)this + 8);
  v8 = (sirinluexternal::UserDialogAct **)*((_QWORD *)this + 9);
  if (v7 == v8)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    do
    {
      v10 = *v7++;
      v9 ^= sirinluexternal::UserDialogAct::hash_value(v10);
    }
    while (v7 != v8);
  }
  v11 = *((_BYTE *)this + 88);
  if ((v11 & 2) != 0)
  {
    if (*((double *)this + 6) == 0.0)
      v12 = 0;
    else
      v12 = *((_QWORD *)this + 6);
  }
  else
  {
    v12 = 0;
  }
  v13 = *((_QWORD *)this + 5);
  if (v13)
    v13 = std::__string_hash<char>::operator()[abi:ne180100](v13);
  v14 = *((_QWORD *)this + 7);
  if (v14)
  {
    if ((*(_BYTE *)(v14 + 16) & 1) != 0)
    {
      v15 = *(unsigned int *)(v14 + 8);
      if ((*(_BYTE *)(v14 + 16) & 2) != 0)
        goto LABEL_26;
    }
    else
    {
      v15 = 0;
      if ((*(_BYTE *)(v14 + 16) & 2) != 0)
      {
LABEL_26:
        v16 = *(int *)(v14 + 12);
LABEL_29:
        v14 = v16 ^ v15;
        goto LABEL_30;
      }
    }
    v16 = 0;
    goto LABEL_29;
  }
LABEL_30:
  v17 = *((_QWORD *)this + 4);
  if (!v17)
    goto LABEL_37;
  if ((*(_BYTE *)(v17 + 16) & 1) != 0)
  {
    v18 = *(int *)(v17 + 8);
    if ((*(_BYTE *)(v17 + 16) & 2) != 0)
      goto LABEL_33;
LABEL_35:
    v19 = 0;
    goto LABEL_36;
  }
  v18 = 0;
  if ((*(_BYTE *)(v17 + 16) & 2) == 0)
    goto LABEL_35;
LABEL_33:
  v19 = *(int *)(v17 + 12);
LABEL_36:
  v17 = v19 ^ v18;
LABEL_37:
  if ((v11 & 1) != 0)
  {
    v20 = *((double *)this + 1);
    if (v20 == 0.0)
      v20 = 0.0;
  }
  else
  {
    v20 = 0.0;
  }
  v21 = *((_QWORD *)this + 2);
  if (v21)
  {
    if ((*(_BYTE *)(v21 + 12) & 1) != 0)
      v21 = *(int *)(v21 + 8);
    else
      v21 = 0;
  }
  return v9 ^ v6 ^ v12 ^ v13 ^ v14 ^ v17 ^ *(_QWORD *)&v20 ^ v21;
}

_QWORD *sirinluexternal::UserParse::makeIdA(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[3])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    *v2 = &off_1E7BB0CB8;
    v2[3] = 0;
    this = (_QWORD *)v1[3];
    v1[3] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluexternal::UserParse::makeRepetitionResult(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[7])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BB21B8;
    *(_DWORD *)(v2 + 12) = 0;
    *(_DWORD *)(v2 + 16) = 0;
    this = (_QWORD *)v1[7];
    v1[7] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluexternal::UserParse::makeParser(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[4])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BAF268;
    *(_QWORD *)(v2 + 8) = 0;
    *(_DWORD *)(v2 + 16) = 0;
    this = (_QWORD *)v1[4];
    v1[4] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluexternal::UserParse::makeCorrectionOutcome(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[2])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    *v2 = &off_1E7BB0FA0;
    v2[1] = 0;
    this = (_QWORD *)v1[2];
    v1[2] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void sirinluinternal::RewriteUtterance::~RewriteUtterance(sirinluinternal::RewriteUtterance *this)
{
  sirinluinternal::RewriteUtterance::~RewriteUtterance(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void **v9;

  *(_QWORD *)this = &off_1E7BB1940;
  v2 = *((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = 0;
  if (v2)
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  v9 = (void **)((char *)this + 48);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v9);
  v3 = (_QWORD *)*((_QWORD *)this + 2);
  if (v3)
  {
    v4 = (_QWORD *)*((_QWORD *)this + 3);
    v5 = (void *)*((_QWORD *)this + 2);
    if (v4 != v3)
    {
      do
      {
        v7 = *--v4;
        v6 = v7;
        *v4 = 0;
        if (v7)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
      }
      while (v4 != v3);
      v5 = (void *)*((_QWORD *)this + 2);
    }
    *((_QWORD *)this + 3) = v3;
    operator delete(v5);
  }
  v8 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  PB::Base::~Base(this);
}

uint64_t sirinluinternal::RewriteUtterance::readFrom(int64x2_t *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t **v8;
  int64x2_t *v9;
  uint64_t v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  char v17;
  unsigned int v18;
  unint64_t v19;
  char v20;
  uint64_t result;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  unint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  int64x2_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64x2_t v47;
  unint64_t v48;
  int64x2_t *v49;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  v8 = (uint64_t **)&this[3];
  v9 = this + 2;
  while (1)
  {
    v10 = *(_QWORD *)a2;
    if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3)
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v15 = *(_BYTE *)(v10 + v2);
        v13 |= (unint64_t)(v15 & 0x7F) << v11;
        if ((v15 & 0x80) == 0)
          break;
        v11 += 7;
        v2 = v14;
        v16 = v12++ > 8;
        if (v16)
          goto LABEL_20;
      }
LABEL_22:
      if ((v13 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v13 >> 3))
      {
        case 1u:
          v22 = (_QWORD *)operator new();
          *v22 = &off_1E7BB0CB8;
          v22[3] = 0;
          v23 = this->i64[1];
          this->i64[1] = (uint64_t)v22;
          if (v23)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
            v22 = (_QWORD *)this->i64[1];
          }
          goto LABEL_35;
        case 2u:
          v29 = (_QWORD *)operator new();
          v29[1] = 0;
          v29[2] = 0;
          *v29 = 0;
          v30 = this[4].i64[1];
          this[4].i64[1] = (uint64_t)v29;
          if (v30)
            std::default_delete<std::string>::operator()[abi:ne180100](v30);
          PB::Reader::read();
          goto LABEL_56;
        case 4u:
          v24 = operator new();
          v25 = v24;
          *(_QWORD *)v24 = &off_1E7BB2168;
          *(_DWORD *)(v24 + 44) = 0;
          *(_QWORD *)(v24 + 16) = 0;
          *(_QWORD *)(v24 + 24) = 0;
          v27 = (uint64_t *)this[1].i64[1];
          v26 = this[2].u64[0];
          if ((unint64_t)v27 >= v26)
          {
            v32 = this[1].i64[0];
            v33 = ((uint64_t)v27 - v32) >> 3;
            if ((unint64_t)(v33 + 1) >> 61)
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            v34 = v26 - v32;
            v35 = v34 >> 2;
            if (v34 >> 2 <= (unint64_t)(v33 + 1))
              v35 = v33 + 1;
            if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8)
              v36 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v36 = v35;
            v49 = v9;
            if (v36)
              v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v36);
            else
              v37 = 0;
            v38 = (uint64_t *)(v36 + 8 * v33);
            v39 = v36 + 8 * v37;
            v48 = v39;
            *v38 = v25;
            v28 = v38 + 1;
            v47.i64[1] = (uint64_t)(v38 + 1);
            v41 = (_QWORD *)this[1].i64[0];
            v40 = (_QWORD *)this[1].i64[1];
            if (v40 == v41)
            {
              v43 = vdupq_n_s64((unint64_t)v40);
            }
            else
            {
              do
              {
                v42 = *--v40;
                *v40 = 0;
                *--v38 = v42;
              }
              while (v40 != v41);
              v43 = this[1];
              v28 = (_QWORD *)v47.i64[1];
              v39 = v48;
            }
            this[1].i64[0] = (uint64_t)v38;
            this[1].i64[1] = (uint64_t)v28;
            v47 = v43;
            v44 = this[2].i64[0];
            this[2].i64[0] = v39;
            v48 = v44;
            v46 = v43.i64[0];
            std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v46);
          }
          else
          {
            *v27 = v24;
            v28 = v27 + 1;
          }
          this[1].i64[1] = (uint64_t)v28;
          v45 = *(v28 - 1);
          if (PB::Reader::placeMark()
            && ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v45 + 16))(v45, a2) & 1) != 0)
          {
            goto LABEL_55;
          }
          return 0;
        case 5u:
          this[5].i8[0] |= 1u;
          v31 = *((_QWORD *)a2 + 1);
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *((_QWORD *)a2 + 2))
          {
            this[2].i64[1] = *(_QWORD *)(*(_QWORD *)a2 + v31);
            *((_QWORD *)a2 + 1) += 8;
          }
          else
          {
            *((_BYTE *)a2 + 24) = 1;
          }
          goto LABEL_56;
        case 6u:
          PB::PtrVector<sirinluinternal::Token>::emplace_back<>(v8);
          v22 = *(_QWORD **)(this[3].i64[1] - 8);
LABEL_35:
          if (!PB::Reader::placeMark()
            || ((*(uint64_t (**)(_QWORD *, PB::Reader *))(*v22 + 16))(v22, a2) & 1) == 0)
          {
            return 0;
          }
LABEL_55:
          PB::Reader::recallMark();
          break;
        default:
          goto LABEL_20;
      }
      goto LABEL_56;
    }
    v17 = 0;
    v18 = 0;
    v13 = 0;
    if (v2 > v3)
      v3 = v2;
    do
    {
      if (v3 == v2)
      {
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v19 = v2 + 1;
      v20 = *(_BYTE *)(v10 + v2);
      *((_QWORD *)a2 + 1) = v19;
      v13 |= (unint64_t)(v20 & 0x7F) << v17;
      if ((v20 & 0x80) == 0)
        goto LABEL_22;
      v17 += 7;
      v2 = v19;
      v16 = v18++ > 8;
    }
    while (!v16);
LABEL_20:
    result = PB::Reader::skip(a2);
    if (!(_DWORD)result)
      return result;
LABEL_56:
    v2 = *((_QWORD *)a2 + 1);
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || *((_BYTE *)a2 + 24))
      return v4 == 0;
  }
}

void sub_1C1FEAAA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t sirinluinternal::RewriteUtterance::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  const PB::Base **v5;
  const PB::Base **v6;
  const PB::Base *v7;
  const PB::Base **v8;
  const PB::Base **v9;
  const PB::Base *v10;

  v3 = this;
  v4 = *(const PB::Base **)(this + 8);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  if (*(_QWORD *)(v3 + 72))
    this = PB::Writer::write();
  v5 = *(const PB::Base ***)(v3 + 16);
  v6 = *(const PB::Base ***)(v3 + 24);
  while (v5 != v6)
  {
    v7 = *v5++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  if ((*(_BYTE *)(v3 + 80) & 1) != 0)
    this = PB::Writer::write(a2, *(double *)(v3 + 40));
  v9 = *(const PB::Base ***)(v3 + 48);
  v8 = *(const PB::Base ***)(v3 + 56);
  while (v9 != v8)
  {
    v10 = *v9++;
    this = PB::Writer::writeSubmessage(a2, v10);
  }
  return this;
}

uint64_t sirinluinternal::RewriteUtterance::formatText(sirinluinternal::RewriteUtterance *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "asr_id");
  v6 = (uint64_t *)*((_QWORD *)this + 2);
  v7 = (uint64_t *)*((_QWORD *)this + 3);
  while (v6 != v7)
  {
    v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v8 + 32))(v8, a2, "asr_utterance_tokens");
  }
  if ((*((_BYTE *)this + 80) & 1) != 0)
    PB::TextFormatter::format(a2, "confidence", *((double *)this + 5));
  v9 = (uint64_t *)*((_QWORD *)this + 6);
  v10 = (uint64_t *)*((_QWORD *)this + 7);
  while (v9 != v10)
  {
    v11 = *v9++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v11 + 32))(v11, a2, "nlu_internal_tokens");
  }
  if (*((_QWORD *)this + 9))
    PB::TextFormatter::format();
  return PB::TextFormatter::endObject(a2);
}

double sirinluinternal::RewriteUtterance::RewriteUtterance(sirinluinternal::RewriteUtterance *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB1940;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 20) = 0;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB1940;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 20) = 0;
  return result;
}

sirinluinternal::RewriteUtterance *sirinluinternal::RewriteUtterance::RewriteUtterance(sirinluinternal::RewriteUtterance *this, const sirinluexternal::UUID **a2)
{
  uint64_t *v4;
  sirinluinternal::Token ***v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  std::string *v9;
  std::string *v10;
  const sirinluexternal::UUID *v11;
  __int128 v12;
  uint64_t v13;
  const sirinluinternal::RewriteToken **v14;
  const sirinluinternal::RewriteToken **i;
  const sirinluinternal::RewriteToken *v16;
  sirinluinternal::RewriteToken *v17;
  unint64_t v18;
  sirinluinternal::RewriteToken **v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  sirinluinternal::RewriteToken **v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  sirinluinternal::RewriteToken *v31;
  int64x2_t v32;
  unint64_t v33;
  const sirinluexternal::UUID *v34;
  const sirinluinternal::Token **v35;
  const sirinluinternal::Token **v36;
  uint64_t v38;
  int64x2_t v39;
  unint64_t v40;
  char *v41;

  *(_QWORD *)this = &off_1E7BB1940;
  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (uint64_t *)((char *)this + 8);
  *((_OWORD *)this + 3) = 0u;
  v5 = (sirinluinternal::Token ***)((char *)this + 48);
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 20) = 0;
  if (a2[1])
  {
    v6 = operator new();
    v7 = sirinluexternal::UUID::UUID(v6, a2[1]);
    v8 = *v4;
    *v4 = v7;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  }
  if (a2[9])
  {
    v9 = (std::string *)operator new();
    v10 = v9;
    v11 = a2[9];
    if (*((char *)v11 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v11, *((_QWORD *)v11 + 1));
    }
    else
    {
      v12 = *(_OWORD *)v11;
      v9->__r_.__value_.__r.__words[2] = *((_QWORD *)v11 + 2);
      *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v12;
    }
    v13 = *((_QWORD *)this + 9);
    *((_QWORD *)this + 9) = v10;
    if (v13)
      std::default_delete<std::string>::operator()[abi:ne180100](v13);
  }
  v14 = (const sirinluinternal::RewriteToken **)a2[2];
  for (i = (const sirinluinternal::RewriteToken **)a2[3]; v14 != i; ++v14)
  {
    v16 = *v14;
    v17 = (sirinluinternal::RewriteToken *)operator new();
    sirinluinternal::RewriteToken::RewriteToken(v17, v16);
    v19 = (sirinluinternal::RewriteToken **)*((_QWORD *)this + 3);
    v18 = *((_QWORD *)this + 4);
    if ((unint64_t)v19 >= v18)
    {
      v21 = *((_QWORD *)this + 2);
      v22 = ((uint64_t)v19 - v21) >> 3;
      if ((unint64_t)(v22 + 1) >> 61)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v23 = v18 - v21;
      v24 = v23 >> 2;
      if (v23 >> 2 <= (unint64_t)(v22 + 1))
        v24 = v22 + 1;
      if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8)
        v25 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v25 = v24;
      v41 = (char *)this + 32;
      if (v25)
        v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v25);
      else
        v26 = 0;
      v27 = (sirinluinternal::RewriteToken **)(v25 + 8 * v22);
      v28 = v25 + 8 * v26;
      v40 = v28;
      *v27 = v17;
      v20 = v27 + 1;
      v39.i64[1] = (uint64_t)(v27 + 1);
      v30 = (_QWORD *)*((_QWORD *)this + 2);
      v29 = (_QWORD *)*((_QWORD *)this + 3);
      if (v29 == v30)
      {
        v32 = vdupq_n_s64((unint64_t)v29);
      }
      else
      {
        do
        {
          v31 = (sirinluinternal::RewriteToken *)*--v29;
          *v29 = 0;
          *--v27 = v31;
        }
        while (v29 != v30);
        v32 = *((int64x2_t *)this + 1);
        v20 = (_QWORD *)v39.i64[1];
        v28 = v40;
      }
      *((_QWORD *)this + 2) = v27;
      *((_QWORD *)this + 3) = v20;
      v39 = v32;
      v33 = *((_QWORD *)this + 4);
      *((_QWORD *)this + 4) = v28;
      v40 = v33;
      v38 = v32.i64[0];
      std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v38);
    }
    else
    {
      *v19 = v17;
      v20 = v19 + 1;
    }
    *((_QWORD *)this + 3) = v20;
  }
  if (((_BYTE)a2[10] & 1) != 0)
  {
    v34 = a2[5];
    *((_BYTE *)this + 80) |= 1u;
    *((_QWORD *)this + 5) = v34;
  }
  v36 = (const sirinluinternal::Token **)a2[6];
  v35 = (const sirinluinternal::Token **)a2[7];
  while (v36 != v35)
    PB::PtrVector<sirinluinternal::Token>::emplace_back<sirinluinternal::Token const&>(v5, *v36++);
  return this;
}

void sub_1C1FEAFD4(void *a1)
{
  __clang_call_terminate(a1);
}

uint64_t sirinluinternal::RewriteUtterance::operator=(uint64_t a1, const sirinluexternal::UUID **a2)
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  int v9;
  _BYTE v11[8];
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  int v17;

  if ((const sirinluexternal::UUID **)a1 != a2)
  {
    sirinluinternal::RewriteUtterance::RewriteUtterance((sirinluinternal::RewriteUtterance *)v11, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v12;
    v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v13;
    v12 = v3;
    v13 = v4;
    v5 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v14;
    v14 = v5;
    v6 = v16;
    v7 = *(_OWORD *)(a1 + 48);
    v8 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(a1 + 48) = v15;
    *(_OWORD *)(a1 + 64) = v6;
    v9 = *(_DWORD *)(a1 + 80);
    *(_DWORD *)(a1 + 80) = v17;
    v17 = v9;
    v15 = v7;
    v16 = v8;
    sirinluinternal::RewriteUtterance::~RewriteUtterance((sirinluinternal::RewriteUtterance *)v11);
  }
  return a1;
}

double sirinluinternal::swap(sirinluinternal *this, sirinluinternal::RewriteUtterance *a2, sirinluinternal::RewriteUtterance *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = *((_DWORD *)this + 20);
  *((_DWORD *)this + 20) = *((_DWORD *)a2 + 20);
  *((_DWORD *)a2 + 20) = v3;
  v4 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  v5 = *((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = *((_QWORD *)a2 + 9);
  *((_QWORD *)a2 + 9) = v5;
  v6 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v6;
  v7 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v7;
  v8 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v8;
  result = *((double *)this + 5);
  *((_QWORD *)this + 5) = *((_QWORD *)a2 + 5);
  *((double *)a2 + 5) = result;
  v10 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = *((_QWORD *)a2 + 6);
  *((_QWORD *)a2 + 6) = v10;
  v11 = *((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v11;
  v12 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = *((_QWORD *)a2 + 8);
  *((_QWORD *)a2 + 8) = v12;
  return result;
}

uint64_t sirinluinternal::RewriteUtterance::RewriteUtterance(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void **v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)a1 = &off_1E7BB1940;
  *(_OWORD *)(a1 + 48) = 0u;
  v4 = (_QWORD *)(a1 + 48);
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(_DWORD *)(a2 + 80) = 0;
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v6 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 72) = 0;
  v8 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v7;
  if (v8)
    std::default_delete<std::string>::operator()[abi:ne180100](v8);
  v9 = (void **)(a1 + 16);
  v10 = *(_QWORD **)(a1 + 16);
  if (v10)
  {
    v11 = *(_QWORD **)(a1 + 24);
    v12 = *(void **)(a1 + 16);
    if (v11 != v10)
    {
      do
      {
        v14 = *--v11;
        v13 = v14;
        *v11 = 0;
        if (v14)
          (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
      }
      while (v11 != v10);
      v12 = *v9;
    }
    *(_QWORD *)(a1 + 24) = v10;
    operator delete(v12);
    *v9 = 0;
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(v4);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  return a1;
}

uint64_t sirinluinternal::RewriteUtterance::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  int v9;
  _BYTE v11[8];
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  int v17;

  if (a1 != a2)
  {
    sirinluinternal::RewriteUtterance::RewriteUtterance((uint64_t)v11, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v12;
    v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v13;
    v12 = v3;
    v13 = v4;
    v5 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v14;
    v14 = v5;
    v6 = v16;
    v7 = *(_OWORD *)(a1 + 48);
    v8 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(a1 + 48) = v15;
    *(_OWORD *)(a1 + 64) = v6;
    v9 = *(_DWORD *)(a1 + 80);
    *(_DWORD *)(a1 + 80) = v17;
    v17 = v9;
    v15 = v7;
    v16 = v8;
    sirinluinternal::RewriteUtterance::~RewriteUtterance((sirinluinternal::RewriteUtterance *)v11);
  }
  return a1;
}

BOOL sirinluinternal::RewriteUtterance::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned __int8 **v7;
  uint64_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  int v11;
  unsigned __int8 *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !sirinluexternal::UUID::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v6 = *(unsigned __int8 **)(a1 + 72);
  v7 = *(unsigned __int8 ***)(a2 + 72);
  if (v6)
  {
    if (!v7)
      return 0;
    v8 = v6[23];
    if ((v8 & 0x80u) == 0)
      v9 = (unsigned __int8 *)v6[23];
    else
      v9 = (unsigned __int8 *)*((_QWORD *)v6 + 1);
    v10 = (unsigned __int8 *)*((unsigned __int8 *)v7 + 23);
    v11 = (char)v10;
    if ((char)v10 < 0)
      v10 = v7[1];
    if (v9 != v10)
      return 0;
    if (v11 >= 0)
      v12 = *(unsigned __int8 **)(a2 + 72);
    else
      v12 = *v7;
    if ((v8 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v6, v12, *((_QWORD *)v6 + 1)))
        return 0;
    }
    else if (v6[23])
    {
      while (*v6 == *v12)
      {
        ++v6;
        ++v12;
        if (!--v8)
          goto LABEL_23;
      }
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
LABEL_23:
  v14 = *(uint64_t **)(a1 + 16);
  v13 = *(uint64_t **)(a1 + 24);
  v15 = *(uint64_t **)(a2 + 16);
  if ((char *)v13 - (char *)v14 == *(_QWORD *)(a2 + 24) - (_QWORD)v15)
  {
    while (v14 != v13)
    {
      if (!sirinluinternal::RewriteToken::operator==(*v14, *v15))
        return 0;
      ++v14;
      ++v15;
    }
    if ((*(_BYTE *)(a1 + 80) & 1) != 0)
    {
      if ((*(_BYTE *)(a2 + 80) & 1) == 0 || *(double *)(a1 + 40) != *(double *)(a2 + 40))
        return 0;
    }
    else if ((*(_BYTE *)(a2 + 80) & 1) != 0)
    {
      return 0;
    }
    return PB::PtrVector<sirinluinternal::Token>::operator==(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(uint64_t **)(a2 + 48), *(_QWORD *)(a2 + 56));
  }
  return 0;
}

unint64_t sirinluinternal::RewriteUtterance::hash_value(sirinluinternal::RewriteUtterance *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  sirinluinternal::RewriteToken **v9;
  sirinluinternal::RewriteToken **v10;
  uint64_t v11;
  sirinluinternal::RewriteToken *v12;
  uint64_t v13;
  sirinluinternal::Token **v14;
  sirinluinternal::Token **v15;
  uint64_t v16;
  sirinluinternal::Token *v17;

  v2 = *((_QWORD *)this + 1);
  if (!v2)
  {
    v6 = 0;
    goto LABEL_11;
  }
  if ((*(_BYTE *)(v2 + 28) & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)(v2 + 28) & 2) != 0)
      goto LABEL_4;
LABEL_8:
    v4 = 0;
    if ((*(_BYTE *)(v2 + 28) & 4) != 0)
      goto LABEL_5;
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v3 = *(_QWORD *)(v2 + 8);
  if ((*(_BYTE *)(v2 + 28) & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)(v2 + 16);
  if ((*(_BYTE *)(v2 + 28) & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = *(int *)(v2 + 24);
LABEL_10:
  v6 = v4 ^ v3 ^ v5;
LABEL_11:
  v7 = *((_QWORD *)this + 9);
  if (v7)
    v8 = std::__string_hash<char>::operator()[abi:ne180100](v7);
  else
    v8 = 0;
  v9 = (sirinluinternal::RewriteToken **)*((_QWORD *)this + 2);
  v10 = (sirinluinternal::RewriteToken **)*((_QWORD *)this + 3);
  if (v9 == v10)
  {
    v11 = 0;
  }
  else
  {
    v11 = 0;
    do
    {
      v12 = *v9++;
      v11 ^= sirinluinternal::RewriteToken::hash_value(v12);
    }
    while (v9 != v10);
  }
  if ((*((_BYTE *)this + 80) & 1) != 0)
  {
    if (*((double *)this + 5) == 0.0)
      v13 = 0;
    else
      v13 = *((_QWORD *)this + 5);
  }
  else
  {
    v13 = 0;
  }
  v15 = (sirinluinternal::Token **)*((_QWORD *)this + 6);
  v14 = (sirinluinternal::Token **)*((_QWORD *)this + 7);
  if (v15 == v14)
  {
    v16 = 0;
  }
  else
  {
    v16 = 0;
    do
    {
      v17 = *v15++;
      v16 ^= sirinluinternal::Token::hash_value(v17);
    }
    while (v15 != v14);
  }
  return v8 ^ v6 ^ v11 ^ v13 ^ v16;
}

_QWORD *sirinluinternal::RewriteUtterance::makeAsrId(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[1])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    *v2 = &off_1E7BB0CB8;
    v2[3] = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void sirinluinternal::PLUMSpanData::~PLUMSpanData(sirinluinternal::PLUMSpanData *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x1C3BB720CLL);
}

uint64_t sirinluinternal::PLUMSpanData::readFrom(sirinluinternal::PLUMSpanData *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_25;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        *((_BYTE *)this + 16) |= 1u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((_QWORD *)a2 + 2))
        {
          *((_QWORD *)this + 1) = *(_QWORD *)(*(_QWORD *)a2 + v2);
          v2 = *((_QWORD *)a2 + 1) + 8;
          *((_QWORD *)a2 + 1) = v2;
        }
        else
        {
          *((_BYTE *)a2 + 24) = 1;
        }
      }
      else
      {
LABEL_25:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
        v2 = *((_QWORD *)a2 + 1);
      }
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_25;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sirinluinternal::PLUMSpanData::writeTo(uint64_t this, PB::Writer *a2)
{
  if ((*(_BYTE *)(this + 16) & 1) != 0)
    return PB::Writer::write(a2, *(double *)(this + 8));
  return this;
}

uint64_t sirinluinternal::PLUMSpanData::formatText(sirinluinternal::PLUMSpanData *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if ((*((_BYTE *)this + 16) & 1) != 0)
    PB::TextFormatter::format(a2, "score", *((double *)this + 1));
  return PB::TextFormatter::endObject(a2);
}

uint64_t sirinluinternal::PLUMSpanData::PLUMSpanData(uint64_t this)
{
  *(_QWORD *)this = &off_1E7BB1990;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

{
  *(_QWORD *)this = &off_1E7BB1990;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

double sirinluinternal::PLUMSpanData::PLUMSpanData(sirinluinternal::PLUMSpanData *this, const sirinluinternal::PLUMSpanData *a2)
{
  double result;

  *(_QWORD *)this = &off_1E7BB1990;
  *((_DWORD *)this + 4) = 0;
  if ((*((_BYTE *)a2 + 16) & 1) != 0)
  {
    result = *((double *)a2 + 1);
    *((_BYTE *)this + 16) = 1;
    *((double *)this + 1) = result;
  }
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB1990;
  *((_DWORD *)this + 4) = 0;
  if ((*((_BYTE *)a2 + 16) & 1) != 0)
  {
    result = *((double *)a2 + 1);
    *((_BYTE *)this + 16) = 1;
    *((double *)this + 1) = result;
  }
  return result;
}

uint64_t sirinluinternal::PLUMSpanData::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  _QWORD v7[2];
  int v8;

  if (a1 != a2)
  {
    v7[0] = &off_1E7BB1990;
    v3 = *(_QWORD *)(a2 + 8);
    v4 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)(a1 + 16) = *(_BYTE *)(a2 + 16) & 1;
    v8 = v4;
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v3;
    v7[1] = v5;
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  _QWORD v8[2];
  int v9;

  if (a1 != a2)
  {
    v8[0] = &off_1E7BB1990;
    v3 = *(_DWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 16) = 0;
    v4 = *(_QWORD *)(a2 + 8);
    v5 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)(a1 + 16) = v3;
    v9 = v5;
    v6 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v4;
    v8[1] = v6;
    PB::Base::~Base((PB::Base *)v8);
  }
  return a1;
}

double sirinluinternal::swap(sirinluinternal *this, sirinluinternal::PLUMSpanData *a2, sirinluinternal::PLUMSpanData *a3)
{
  int v3;
  double result;

  v3 = *((_DWORD *)this + 4);
  *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v3;
  result = *((double *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((double *)a2 + 1) = result;
  return result;
}

double sirinluinternal::PLUMSpanData::PLUMSpanData(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a1 = &off_1E7BB1990;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a2 + 16) = 0;
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

{
  double result;

  *(_QWORD *)a1 = &off_1E7BB1990;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a2 + 16) = 0;
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

BOOL sirinluinternal::PLUMSpanData::operator==(uint64_t a1, uint64_t a2)
{
  char v3;
  _BOOL8 result;

  v3 = *(_BYTE *)(a1 + 16);
  result = (*(_BYTE *)(a2 + 16) & 1) == 0;
  if ((v3 & 1) != 0)
    return (*(_BYTE *)(a2 + 16) & 1) != 0 && *(double *)(a1 + 8) == *(double *)(a2 + 8);
  return result;
}

uint64_t sirinluinternal::PLUMSpanData::hash_value(sirinluinternal::PLUMSpanData *this)
{
  if ((*((_BYTE *)this + 16) & 1) == 0)
    return 0;
  if (*((double *)this + 1) == 0.0)
    return 0;
  return *((_QWORD *)this + 1);
}

void sirinluexternal::RewriteMessage::~RewriteMessage(sirinluexternal::RewriteMessage *this)
{
  sirinluexternal::RewriteMessage::~RewriteMessage(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E7BB19E0;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  PB::Base::~Base(this);
}

uint64_t sirinluexternal::RewriteMessage::readFrom(sirinluexternal::RewriteMessage *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t result;
  _QWORD *v28;
  uint64_t v29;
  char v30;
  unsigned int v31;
  unint64_t v32;
  char v33;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_30;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        v28 = (_QWORD *)operator new();
        v28[1] = 0;
        v28[2] = 0;
        *v28 = 0;
        v29 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v28;
        if (v29)
          std::default_delete<std::string>::operator()[abi:ne180100](v29);
        PB::Reader::read();
      }
      else if ((v11 >> 3) == 1)
      {
        *((_BYTE *)this + 20) |= 1u;
        v19 = *((_QWORD *)a2 + 1);
        v20 = *((_QWORD *)a2 + 2);
        v21 = *(_QWORD *)a2;
        if (v19 > 0xFFFFFFFFFFFFFFF5 || v19 + 10 > v20)
        {
          v30 = 0;
          v31 = 0;
          v24 = 0;
          if (v20 <= v19)
            v20 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v20 == v19)
            {
              LODWORD(v24) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_45;
            }
            v32 = v19 + 1;
            v33 = *(_BYTE *)(v21 + v19);
            *((_QWORD *)a2 + 1) = v32;
            v24 |= (unint64_t)(v33 & 0x7F) << v30;
            if ((v33 & 0x80) == 0)
              break;
            v30 += 7;
            v19 = v32;
            v14 = v31++ > 8;
            if (v14)
            {
LABEL_41:
              LODWORD(v24) = 0;
              goto LABEL_45;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v24) = 0;
        }
        else
        {
          v22 = 0;
          v23 = 0;
          v24 = 0;
          while (1)
          {
            v25 = v19 + 1;
            *((_QWORD *)a2 + 1) = v19 + 1;
            v26 = *(_BYTE *)(v21 + v19);
            v24 |= (unint64_t)(v26 & 0x7F) << v22;
            if ((v26 & 0x80) == 0)
              break;
            v22 += 7;
            v19 = v25;
            v14 = v23++ > 8;
            if (v14)
              goto LABEL_41;
          }
        }
LABEL_45:
        *((_DWORD *)this + 4) = v24;
      }
      else
      {
LABEL_30:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0)
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_30;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sirinluexternal::RewriteMessage::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v2;

  v2 = this;
  if ((*(_BYTE *)(this + 20) & 1) != 0)
    this = PB::Writer::writeVarInt(a2);
  if (*(_QWORD *)(v2 + 8))
    return PB::Writer::write();
  return this;
}

uint64_t sirinluexternal::RewriteMessage::formatText(sirinluexternal::RewriteMessage *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if ((*((_BYTE *)this + 20) & 1) != 0)
    PB::TextFormatter::format(a2, "rewrite_type");
  if (*((_QWORD *)this + 1))
    PB::TextFormatter::format();
  return PB::TextFormatter::endObject(a2);
}

_QWORD *sirinluexternal::RewriteMessage::RewriteMessage(_QWORD *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &off_1E7BB19E0;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = &off_1E7BB19E0;
  return this;
}

sirinluexternal::RewriteMessage *sirinluexternal::RewriteMessage::RewriteMessage(sirinluexternal::RewriteMessage *this, const sirinluexternal::RewriteMessage *a2)
{
  uint64_t *v4;
  int v5;
  std::string *v6;
  std::string *v7;
  __int128 *v8;
  __int128 v9;
  uint64_t v10;

  *(_QWORD *)this = &off_1E7BB19E0;
  *((_QWORD *)this + 1) = 0;
  v4 = (uint64_t *)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  if ((*((_BYTE *)a2 + 20) & 1) != 0)
  {
    v5 = *((_DWORD *)a2 + 4);
    *((_BYTE *)this + 20) = 1;
    *((_DWORD *)this + 4) = v5;
  }
  if (*((_QWORD *)a2 + 1))
  {
    v6 = (std::string *)operator new();
    v7 = v6;
    v8 = (__int128 *)*((_QWORD *)a2 + 1);
    if (*((char *)v8 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)v8, *((_QWORD *)v8 + 1));
    }
    else
    {
      v9 = *v8;
      v6->__r_.__value_.__r.__words[2] = *((_QWORD *)v8 + 2);
      *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v9;
    }
    v10 = *v4;
    *v4 = (uint64_t)v7;
    if (v10)
      std::default_delete<std::string>::operator()[abi:ne180100](v10);
  }
  return this;
}

const sirinluexternal::RewriteMessage *sirinluexternal::RewriteMessage::operator=(const sirinluexternal::RewriteMessage *a1, const sirinluexternal::RewriteMessage *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v6[8];
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sirinluexternal::RewriteMessage::RewriteMessage((sirinluexternal::RewriteMessage *)v6, a2);
    v3 = *((_QWORD *)a1 + 2);
    *((_QWORD *)a1 + 2) = v8;
    v8 = v3;
    v4 = *((_QWORD *)a1 + 1);
    *((_QWORD *)a1 + 1) = v7;
    v7 = v4;
    sirinluexternal::RewriteMessage::~RewriteMessage((sirinluexternal::RewriteMessage *)v6);
  }
  return a1;
}

uint64_t sirinluexternal::swap(uint64_t this, sirinluexternal::RewriteMessage *a2, sirinluexternal::RewriteMessage *a3)
{
  int v3;
  int v4;
  uint64_t v5;

  v3 = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v3;
  v4 = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  v5 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v5;
  return this;
}

uint64_t sirinluexternal::RewriteMessage::RewriteMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a1 = &off_1E7BB19E0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = 0;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  if (v4)
    std::default_delete<std::string>::operator()[abi:ne180100](v4);
  return a1;
}

uint64_t sirinluexternal::RewriteMessage::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[3];

  if (a1 != a2)
  {
    v3 = *(_QWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 20) = 0;
    v4 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v5 = *(_QWORD *)(a1 + 16);
    v6 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 16) = v3;
    v8[2] = v5;
    *(_QWORD *)(a1 + 8) = v4;
    v8[0] = &off_1E7BB19E0;
    v8[1] = v6;
    sirinluexternal::RewriteMessage::~RewriteMessage((sirinluexternal::RewriteMessage *)v8);
  }
  return a1;
}

uint64_t sirinluexternal::RewriteMessage::operator==(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 **v3;
  uint64_t result;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int v8;
  unsigned __int8 *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  BOOL v16;

  if ((*(_BYTE *)(a1 + 20) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 20) & 1) == 0 || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 20) & 1) != 0)
  {
    return 0;
  }
  v2 = *(unsigned __int8 **)(a1 + 8);
  v3 = *(unsigned __int8 ***)(a2 + 8);
  result = v3 == 0;
  if (!v2)
    return result;
  if (!v3)
    return 0;
  v5 = v2[23];
  if ((v5 & 0x80u) == 0)
    v6 = (unsigned __int8 *)v2[23];
  else
    v6 = (unsigned __int8 *)*((_QWORD *)v2 + 1);
  v7 = (unsigned __int8 *)*((unsigned __int8 *)v3 + 23);
  v8 = (char)v7;
  if ((char)v7 < 0)
    v7 = v3[1];
  if (v6 != v7)
    return 0;
  if (v8 >= 0)
    v9 = *(unsigned __int8 **)(a2 + 8);
  else
    v9 = *v3;
  if ((v5 & 0x80) != 0)
    return !memcmp(*(const void **)v2, v9, *((_QWORD *)v2 + 1));
  if (!v2[23])
    return 1;
  v10 = v5 - 1;
  do
  {
    v12 = *v2++;
    v11 = v12;
    v14 = *v9++;
    v13 = v14;
    v16 = v10-- != 0;
    result = v11 == v13;
  }
  while (v11 == v13 && v16);
  return result;
}

unint64_t sirinluexternal::RewriteMessage::hash_value(sirinluexternal::RewriteMessage *this)
{
  uint64_t v1;
  unint64_t v2;

  if ((*((_BYTE *)this + 20) & 1) != 0)
    v1 = *((int *)this + 4);
  else
    v1 = 0;
  v2 = *((_QWORD *)this + 1);
  if (v2)
    v2 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  return v2 ^ v1;
}

void sirinluexternal::RRMetadata::~RRMetadata(sirinluexternal::RRMetadata *this)
{
  sirinluexternal::RRMetadata::~RRMetadata(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)this = &off_1E7BB1A30;
  v2 = (_QWORD *)*((_QWORD *)this + 2);
  if (v2)
  {
    v3 = (_QWORD *)*((_QWORD *)this + 3);
    v4 = (void *)*((_QWORD *)this + 2);
    if (v3 != v2)
    {
      do
      {
        v6 = *--v3;
        v5 = v6;
        *v3 = 0;
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
      }
      while (v3 != v2);
      v4 = (void *)*((_QWORD *)this + 2);
    }
    *((_QWORD *)this + 3) = v2;
    operator delete(v4);
  }
  v7 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  PB::Base::~Base(this);
}

uint64_t sirinluexternal::RRMetadata::readFrom(int64x2_t *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  int64x2_t *v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  uint64_t result;
  unint64_t v21;
  _DWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  unint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char v43;
  unsigned int v44;
  unint64_t v45;
  char v46;
  _QWORD *v47;
  unint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  int64x2_t v52;
  uint64_t v53;
  uint64_t v55;
  int64x2_t v56;
  unint64_t v57;
  int64x2_t *v58;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = this + 2;
    do
    {
      v9 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        v16 = 0;
        v17 = 0;
        v12 = 0;
        if (v2 > v3)
          v3 = v2;
        while (v3 != v2)
        {
          v18 = v2 + 1;
          v19 = *(_BYTE *)(v9 + v2);
          *((_QWORD *)a2 + 1) = v18;
          v12 |= (unint64_t)(v19 & 0x7F) << v16;
          if ((v19 & 0x80) == 0)
            goto LABEL_22;
          v16 += 7;
          v2 = v18;
          v15 = v17++ > 8;
          if (v15)
            goto LABEL_20;
        }
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_20;
      }
LABEL_22:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v21 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        this[2].i8[12] |= 1u;
        v29 = *((_QWORD *)a2 + 1);
        v30 = *((_QWORD *)a2 + 2);
        v31 = *(_QWORD *)a2;
        if (v29 > 0xFFFFFFFFFFFFFFF5 || v29 + 10 > v30)
        {
          v43 = 0;
          v44 = 0;
          v34 = 0;
          if (v30 <= v29)
            v30 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v30 == v29)
            {
              LODWORD(v34) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_65;
            }
            v45 = v29 + 1;
            v46 = *(_BYTE *)(v31 + v29);
            *((_QWORD *)a2 + 1) = v45;
            v34 |= (unint64_t)(v46 & 0x7F) << v43;
            if ((v46 & 0x80) == 0)
              break;
            v43 += 7;
            v29 = v45;
            v15 = v44++ > 8;
            if (v15)
            {
LABEL_51:
              LODWORD(v34) = 0;
              goto LABEL_65;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v34) = 0;
        }
        else
        {
          v32 = 0;
          v33 = 0;
          v34 = 0;
          while (1)
          {
            v35 = v29 + 1;
            *((_QWORD *)a2 + 1) = v29 + 1;
            v36 = *(_BYTE *)(v31 + v29);
            v34 |= (unint64_t)(v36 & 0x7F) << v32;
            if ((v36 & 0x80) == 0)
              break;
            v32 += 7;
            v29 = v35;
            v15 = v33++ > 8;
            if (v15)
              goto LABEL_51;
          }
        }
LABEL_65:
        this[2].i32[2] = v34;
      }
      else
      {
        if ((_DWORD)v21 == 2)
        {
          v24 = (_QWORD *)operator new();
          v25 = v24;
          v24[1] = 0;
          v24[2] = 0;
          *v24 = &off_1E7BB1150;
          v27 = (_QWORD *)this[1].i64[1];
          v26 = this[2].u64[0];
          if ((unint64_t)v27 >= v26)
          {
            v37 = this[1].i64[0];
            v38 = ((uint64_t)v27 - v37) >> 3;
            if ((unint64_t)(v38 + 1) >> 61)
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            v39 = v26 - v37;
            v40 = v39 >> 2;
            if (v39 >> 2 <= (unint64_t)(v38 + 1))
              v40 = v38 + 1;
            if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8)
              v41 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v41 = v40;
            v58 = v8;
            if (v41)
              v41 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v41);
            else
              v42 = 0;
            v47 = (_QWORD *)(v41 + 8 * v38);
            v48 = v41 + 8 * v42;
            v57 = v48;
            *v47 = v25;
            v28 = v47 + 1;
            v56.i64[1] = (uint64_t)(v47 + 1);
            v50 = (_QWORD *)this[1].i64[0];
            v49 = (_QWORD *)this[1].i64[1];
            if (v49 == v50)
            {
              v52 = vdupq_n_s64((unint64_t)v49);
            }
            else
            {
              do
              {
                v51 = *--v49;
                *v49 = 0;
                *--v47 = v51;
              }
              while (v49 != v50);
              v52 = this[1];
              v28 = (_QWORD *)v56.i64[1];
              v48 = v57;
            }
            this[1].i64[0] = (uint64_t)v47;
            this[1].i64[1] = (uint64_t)v28;
            v56 = v52;
            v53 = this[2].i64[0];
            this[2].i64[0] = v48;
            v57 = v53;
            v55 = v52.i64[0];
            std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v55);
          }
          else
          {
            *v27 = v24;
            v28 = v27 + 1;
          }
          this[1].i64[1] = (uint64_t)v28;
          v22 = (_DWORD *)*(v28 - 1);
        }
        else
        {
          if ((_DWORD)v21 != 1)
          {
LABEL_20:
            result = PB::Reader::skip(a2);
            if (!(_DWORD)result)
              return result;
            goto LABEL_66;
          }
          v22 = (_DWORD *)operator new();
          *(_QWORD *)v22 = &off_1E7BAF3F8;
          v22[10] = 0;
          v23 = this->i64[1];
          this->i64[1] = (uint64_t)v22;
          if (v23)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
            v22 = (_DWORD *)this->i64[1];
          }
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v22 + 16))(v22, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
LABEL_66:
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
    }
    while (v2 < v3 && v4 == 0);
  }
  return v4 == 0;
}

void sub_1C1FED4F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t sirinluexternal::RRMetadata::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  const PB::Base **v5;
  const PB::Base **v6;
  const PB::Base *v7;

  v3 = this;
  v4 = *(const PB::Base **)(this + 8);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = *(const PB::Base ***)(v3 + 16);
  v6 = *(const PB::Base ***)(v3 + 24);
  while (v5 != v6)
  {
    v7 = *v5++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  if ((*(_BYTE *)(v3 + 44) & 1) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

uint64_t sirinluexternal::RRMetadata::formatText(sirinluexternal::RRMetadata *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "bounding_box");
  if ((*((_BYTE *)this + 44) & 1) != 0)
    PB::TextFormatter::format(a2, "data_source");
  v6 = (uint64_t *)*((_QWORD *)this + 2);
  v7 = (uint64_t *)*((_QWORD *)this + 3);
  while (v6 != v7)
  {
    v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v8 + 32))(v8, a2, "surrounding_texts");
  }
  return PB::TextFormatter::endObject(a2);
}

double sirinluexternal::RRMetadata::RRMetadata(sirinluexternal::RRMetadata *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB1A30;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_QWORD *)this + 5) = 0;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB1A30;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_QWORD *)this + 5) = 0;
  return result;
}

sirinluexternal::RRMetadata *sirinluexternal::RRMetadata::RRMetadata(sirinluexternal::RRMetadata *this, const sirinluexternal::RRBoundingBox **a2)
{
  uint64_t *v4;
  sirinluexternal::RRBoundingBox *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  const sirinluexternal::RRSurroundingText **v9;
  const sirinluexternal::RRSurroundingText **i;
  const sirinluexternal::RRSurroundingText *v11;
  sirinluexternal::RRSurroundingText *v12;
  unint64_t v13;
  sirinluexternal::RRSurroundingText **v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  sirinluexternal::RRSurroundingText **v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  sirinluexternal::RRSurroundingText *v26;
  int64x2_t v27;
  unint64_t v28;
  int v29;
  uint64_t v31;
  int64x2_t v32;
  unint64_t v33;
  char *v34;

  *(_QWORD *)this = &off_1E7BB1A30;
  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (uint64_t *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_QWORD *)this + 5) = 0;
  if (a2[1])
  {
    v5 = (sirinluexternal::RRBoundingBox *)operator new();
    v6 = sirinluexternal::RRBoundingBox::RRBoundingBox(v5, a2[1]);
    v7 = *v4;
    *v4 = v8;
    if (v7)
      (*(void (**)(uint64_t, double))(*(_QWORD *)v7 + 8))(v7, v6);
  }
  v9 = (const sirinluexternal::RRSurroundingText **)a2[2];
  for (i = (const sirinluexternal::RRSurroundingText **)a2[3]; v9 != i; ++v9)
  {
    v11 = *v9;
    v12 = (sirinluexternal::RRSurroundingText *)operator new();
    sirinluexternal::RRSurroundingText::RRSurroundingText(v12, v11);
    v14 = (sirinluexternal::RRSurroundingText **)*((_QWORD *)this + 3);
    v13 = *((_QWORD *)this + 4);
    if ((unint64_t)v14 >= v13)
    {
      v16 = *((_QWORD *)this + 2);
      v17 = ((uint64_t)v14 - v16) >> 3;
      if ((unint64_t)(v17 + 1) >> 61)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v18 = v13 - v16;
      v19 = v18 >> 2;
      if (v18 >> 2 <= (unint64_t)(v17 + 1))
        v19 = v17 + 1;
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
        v20 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v20 = v19;
      v34 = (char *)this + 32;
      if (v20)
        v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v20);
      else
        v21 = 0;
      v22 = (sirinluexternal::RRSurroundingText **)(v20 + 8 * v17);
      v23 = v20 + 8 * v21;
      v33 = v23;
      *v22 = v12;
      v15 = v22 + 1;
      v32.i64[1] = (uint64_t)(v22 + 1);
      v25 = (_QWORD *)*((_QWORD *)this + 2);
      v24 = (_QWORD *)*((_QWORD *)this + 3);
      if (v24 == v25)
      {
        v27 = vdupq_n_s64((unint64_t)v24);
      }
      else
      {
        do
        {
          v26 = (sirinluexternal::RRSurroundingText *)*--v24;
          *v24 = 0;
          *--v22 = v26;
        }
        while (v24 != v25);
        v27 = *((int64x2_t *)this + 1);
        v15 = (_QWORD *)v32.i64[1];
        v23 = v33;
      }
      *((_QWORD *)this + 2) = v22;
      *((_QWORD *)this + 3) = v15;
      v32 = v27;
      v28 = *((_QWORD *)this + 4);
      *((_QWORD *)this + 4) = v23;
      v33 = v28;
      v31 = v27.i64[0];
      std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v31);
    }
    else
    {
      *v14 = v12;
      v15 = v14 + 1;
    }
    *((_QWORD *)this + 3) = v15;
  }
  if ((*((_BYTE *)a2 + 44) & 1) != 0)
  {
    v29 = *((_DWORD *)a2 + 10);
    *((_BYTE *)this + 44) |= 1u;
    *((_DWORD *)this + 10) = v29;
  }
  return this;
}

void sub_1C1FED8F4(void *a1)
{
  __clang_call_terminate(a1);
}

uint64_t sirinluexternal::RRMetadata::operator=(uint64_t a1, const sirinluexternal::RRBoundingBox **a2)
{
  __int128 v3;
  __int128 v4;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  if ((const sirinluexternal::RRBoundingBox **)a1 != a2)
  {
    sirinluexternal::RRMetadata::RRMetadata((sirinluexternal::RRMetadata *)&v6, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    v7 = v3;
    v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v8;
    v8 = v4;
    *(_QWORD *)&v4 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v9;
    v9 = v4;
    sirinluexternal::RRMetadata::~RRMetadata((sirinluexternal::RRMetadata *)&v6);
  }
  return a1;
}

uint64_t sirinluexternal::swap(uint64_t this, sirinluexternal::RRMetadata *a2, sirinluexternal::RRMetadata *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_DWORD *)(this + 44);
  *(_DWORD *)(this + 44) = *((_DWORD *)a2 + 11);
  *((_DWORD *)a2 + 11) = v3;
  v4 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  v5 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v5;
  v6 = *(_QWORD *)(this + 24);
  *(_QWORD *)(this + 24) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v6;
  v7 = *(_QWORD *)(this + 32);
  *(_QWORD *)(this + 32) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v7;
  LODWORD(v7) = *(_DWORD *)(this + 40);
  *(_DWORD *)(this + 40) = *((_DWORD *)a2 + 10);
  *((_DWORD *)a2 + 10) = v7;
  return this;
}

uint64_t sirinluexternal::RRMetadata::RRMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void **v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)a1 = &off_1E7BB1A30;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a2 + 44) = 0;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  v6 = (void **)(a1 + 16);
  v7 = *(_QWORD **)(a1 + 16);
  if (v7)
  {
    v8 = *(_QWORD **)(a1 + 24);
    v9 = *(void **)(a1 + 16);
    if (v8 != v7)
    {
      do
      {
        v11 = *--v8;
        v10 = v11;
        *v8 = 0;
        if (v11)
          (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
      }
      while (v8 != v7);
      v9 = *v6;
    }
    *(_QWORD *)(a1 + 24) = v7;
    operator delete(v9);
    *v6 = 0;
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

uint64_t sirinluexternal::RRMetadata::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sirinluexternal::RRMetadata::RRMetadata((uint64_t)&v6, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    v7 = v3;
    v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v8;
    v8 = v4;
    *(_QWORD *)&v4 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v9;
    v9 = v4;
    sirinluexternal::RRMetadata::~RRMetadata((sirinluexternal::RRMetadata *)&v6);
  }
  return a1;
}

BOOL sirinluexternal::RRMetadata::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  _BOOL8 result;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !sirinluexternal::RRBoundingBox::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v7 = *(uint64_t **)(a1 + 16);
  v6 = *(uint64_t **)(a1 + 24);
  v8 = *(uint64_t **)(a2 + 16);
  if ((char *)v6 - (char *)v7 != *(_QWORD *)(a2 + 24) - (_QWORD)v8)
    return 0;
  while (v7 != v6)
  {
    result = sirinluexternal::RRSurroundingText::operator==(*v7, *v8);
    if (!result)
      return result;
    ++v7;
    ++v8;
  }
  result = (*(_BYTE *)(a2 + 44) & 1) == 0;
  if ((*(_BYTE *)(a1 + 44) & 1) != 0)
    return (*(_BYTE *)(a2 + 44) & 1) != 0 && *(_DWORD *)(a1 + 40) == *(_DWORD *)(a2 + 40);
  return result;
}

uint64_t sirinluexternal::RRMetadata::hash_value(sirinluexternal::RRMetadata *this)
{
  sirinluexternal::RRBoundingBox *v2;
  uint64_t v3;
  sirinluexternal::RRSurroundingText **v4;
  sirinluexternal::RRSurroundingText **v5;
  uint64_t v6;
  sirinluexternal::RRSurroundingText *v7;
  uint64_t v8;

  v2 = (sirinluexternal::RRBoundingBox *)*((_QWORD *)this + 1);
  if (v2)
    v3 = sirinluexternal::RRBoundingBox::hash_value(v2);
  else
    v3 = 0;
  v4 = (sirinluexternal::RRSurroundingText **)*((_QWORD *)this + 2);
  v5 = (sirinluexternal::RRSurroundingText **)*((_QWORD *)this + 3);
  if (v4 == v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    do
    {
      v7 = *v4++;
      v6 ^= sirinluexternal::RRSurroundingText::hash_value(v7);
    }
    while (v4 != v5);
  }
  if ((*((_BYTE *)this + 44) & 1) != 0)
    v8 = *((int *)this + 10);
  else
    v8 = 0;
  return v6 ^ v3 ^ v8;
}

_QWORD *sirinluexternal::RRMetadata::makeBoundingBox(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BAF3F8;
    *(_DWORD *)(v2 + 40) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void sirinluinternaluaap_parser::UaaPParserRequest::~UaaPParserRequest(sirinluinternaluaap_parser::UaaPParserRequest *this)
{
  sirinluinternaluaap_parser::UaaPParserRequest::~UaaPParserRequest(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;

  *(_QWORD *)this = &off_1E7BB1A80;
  v2 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v6 = (void **)((char *)this + 16);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v6);
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  PB::Base::~Base(this);
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::readFrom(sirinluinternaluaap_parser::UaaPParserRequest *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t **v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  unint64_t v37;
  char v38;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  v8 = (uint64_t **)((char *)this + 16);
  while (1)
  {
    v9 = *(_QWORD *)a2;
    if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3)
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_20;
      }
LABEL_22:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v12 >> 3))
      {
        case 1u:
          v21 = operator new();
          *(_QWORD *)v21 = &off_1E7BB0CB8;
          *(_QWORD *)(v21 + 24) = 0;
          v22 = *((_QWORD *)this + 6);
          *((_QWORD *)this + 6) = v21;
          if (v22)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
            v21 = *((_QWORD *)this + 6);
          }
          goto LABEL_33;
        case 2u:
          v21 = operator new();
          *(_QWORD *)v21 = &off_1E7BB0140;
          *(_OWORD *)(v21 + 8) = 0u;
          *(_OWORD *)(v21 + 24) = 0u;
          *(_QWORD *)(v21 + 40) = 0;
          v23 = *((_QWORD *)this + 7);
          *((_QWORD *)this + 7) = v21;
          if (v23)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
            v21 = *((_QWORD *)this + 7);
          }
          goto LABEL_33;
        case 3u:
          v21 = operator new();
          *(_QWORD *)v21 = &off_1E7BB1DD0;
          *(_DWORD *)(v21 + 64) = 0;
          *(_OWORD *)(v21 + 8) = 0u;
          *(_OWORD *)(v21 + 24) = 0u;
          v24 = *((_QWORD *)this + 1);
          *((_QWORD *)this + 1) = v21;
          if (v24)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
            v21 = *((_QWORD *)this + 1);
          }
          goto LABEL_33;
        case 4u:
          PB::PtrVector<sirinluinternal::MatchingSpan>::emplace_back<>(v8);
          v21 = *(_QWORD *)(*((_QWORD *)this + 3) - 8);
          goto LABEL_33;
        case 5u:
          v21 = operator new();
          *(_QWORD *)v21 = &off_1E7BB16E8;
          *(_DWORD *)(v21 + 148) = 0;
          *(_OWORD *)(v21 + 8) = 0u;
          *(_OWORD *)(v21 + 24) = 0u;
          *(_OWORD *)(v21 + 40) = 0u;
          *(_OWORD *)(v21 + 56) = 0u;
          *(_OWORD *)(v21 + 72) = 0u;
          *(_OWORD *)(v21 + 88) = 0u;
          *(_OWORD *)(v21 + 104) = 0u;
          *(_QWORD *)(v21 + 128) = 0;
          *(_QWORD *)(v21 + 136) = 0;
          v25 = *((_QWORD *)this + 8);
          *((_QWORD *)this + 8) = v21;
          if (v25)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
            v21 = *((_QWORD *)this + 8);
          }
LABEL_33:
          if (!PB::Reader::placeMark()
            || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v21 + 16))(v21, a2) & 1) == 0)
          {
            return 0;
          }
          PB::Reader::recallMark();
          break;
        case 6u:
          *((_BYTE *)this + 72) |= 1u;
          v27 = *((_QWORD *)a2 + 1);
          v28 = *((_QWORD *)a2 + 2);
          v29 = *(_QWORD *)a2;
          if (v27 <= 0xFFFFFFFFFFFFFFF5 && v27 + 10 <= v28)
          {
            v30 = 0;
            v31 = 0;
            v32 = 0;
            do
            {
              v33 = v27 + 1;
              *((_QWORD *)a2 + 1) = v27 + 1;
              v34 = *(_BYTE *)(v29 + v27);
              v32 |= (unint64_t)(v34 & 0x7F) << v30;
              if ((v34 & 0x80) == 0)
                goto LABEL_58;
              v30 += 7;
              v27 = v33;
              v15 = v31++ > 8;
            }
            while (!v15);
LABEL_54:
            v32 = 0;
            goto LABEL_58;
          }
          v35 = 0;
          v36 = 0;
          v32 = 0;
          if (v28 <= v27)
            v28 = *((_QWORD *)a2 + 1);
          while (2)
          {
            if (v28 == v27)
            {
              v32 = 0;
              *((_BYTE *)a2 + 24) = 1;
            }
            else
            {
              v37 = v27 + 1;
              v38 = *(_BYTE *)(v29 + v27);
              *((_QWORD *)a2 + 1) = v37;
              v32 |= (unint64_t)(v38 & 0x7F) << v35;
              if (v38 < 0)
              {
                v35 += 7;
                v27 = v37;
                v15 = v36++ > 8;
                if (v15)
                  goto LABEL_54;
                continue;
              }
              if (*((_BYTE *)a2 + 24))
                v32 = 0;
            }
            break;
          }
LABEL_58:
          *((_QWORD *)this + 5) = v32;
          goto LABEL_36;
        default:
          goto LABEL_20;
      }
      goto LABEL_36;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    do
    {
      if (v3 == v2)
      {
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_22;
      v16 += 7;
      v2 = v18;
      v15 = v17++ > 8;
    }
    while (!v15);
LABEL_20:
    result = PB::Reader::skip(a2);
    if (!(_DWORD)result)
      return result;
LABEL_36:
    v2 = *((_QWORD *)a2 + 1);
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0)
      return v4 == 0;
  }
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  const PB::Base *v5;
  const PB::Base *v6;
  const PB::Base **v7;
  const PB::Base **v8;
  const PB::Base *v9;
  const PB::Base *v10;

  v3 = this;
  v4 = *(const PB::Base **)(this + 48);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = *(const PB::Base **)(v3 + 56);
  if (v5)
    this = PB::Writer::writeSubmessage(a2, v5);
  v6 = *(const PB::Base **)(v3 + 8);
  if (v6)
    this = PB::Writer::writeSubmessage(a2, v6);
  v7 = *(const PB::Base ***)(v3 + 16);
  v8 = *(const PB::Base ***)(v3 + 24);
  while (v7 != v8)
  {
    v9 = *v7++;
    this = PB::Writer::writeSubmessage(a2, v9);
  }
  v10 = *(const PB::Base **)(v3 + 64);
  if (v10)
    this = PB::Writer::writeSubmessage(a2, v10);
  if ((*(_BYTE *)(v3 + 72) & 1) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::formatText(sirinluinternaluaap_parser::UaaPParserRequest *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "embeddings");
  v6 = (uint64_t *)*((_QWORD *)this + 2);
  v7 = (uint64_t *)*((_QWORD *)this + 3);
  while (v6 != v7)
  {
    v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v8 + 32))(v8, a2, "matching_spans");
  }
  if ((*((_BYTE *)this + 72) & 1) != 0)
    PB::TextFormatter::format(a2, "max_num_parses");
  v9 = *((_QWORD *)this + 6);
  if (v9)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v9 + 32))(v9, a2, "request_id");
  v10 = *((_QWORD *)this + 7);
  if (v10)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v10 + 32))(v10, a2, "token_chain");
  v11 = *((_QWORD *)this + 8);
  if (v11)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v11 + 32))(v11, a2, "turn_input");
  return PB::TextFormatter::endObject(a2);
}

double sirinluinternaluaap_parser::UaaPParserRequest::UaaPParserRequest(sirinluinternaluaap_parser::UaaPParserRequest *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB1A80;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_DWORD *)this + 18) = 0;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB1A80;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_DWORD *)this + 18) = 0;
  return result;
}

sirinluinternaluaap_parser::UaaPParserRequest *sirinluinternaluaap_parser::UaaPParserRequest::UaaPParserRequest(sirinluinternaluaap_parser::UaaPParserRequest *this, const sirinluinternaluaap_parser::UaaPParserRequest *a2)
{
  sirinluinternal::NLv4EmbeddingTensor **v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  sirinluinternal::TokenChain *v9;
  sirinluinternal::TokenChain *v10;
  uint64_t v11;
  char **v12;
  sirinluinternal::NLv4EmbeddingTensor *v13;
  sirinluinternal::NLv4EmbeddingTensor *v14;
  const sirinluinternal::MatchingSpan **v15;
  const sirinluinternal::MatchingSpan **i;
  sirinluexternal::TurnInput *v17;
  sirinluexternal::TurnInput *v18;
  uint64_t v19;
  uint64_t v20;

  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (sirinluinternal::NLv4EmbeddingTensor **)((char *)this + 8);
  *((_QWORD *)this + 6) = 0;
  v5 = (uint64_t *)((char *)this + 48);
  *(_QWORD *)this = &off_1E7BB1A80;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_DWORD *)this + 18) = 0;
  if (*((_QWORD *)a2 + 6))
  {
    v6 = operator new();
    v7 = sirinluexternal::UUID::UUID(v6, *((const sirinluexternal::UUID **)a2 + 6));
    v8 = *v5;
    *v5 = v7;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  }
  if (*((_QWORD *)a2 + 7))
  {
    v9 = (sirinluinternal::TokenChain *)operator new();
    v10 = sirinluinternal::TokenChain::TokenChain(v9, *((const sirinluinternal::TokenChain **)a2 + 7));
    v11 = *((_QWORD *)this + 7);
    *((_QWORD *)this + 7) = v10;
    if (v11)
      (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  }
  if (*((_QWORD *)a2 + 1))
  {
    v12 = (char **)operator new();
    v13 = sirinluinternal::NLv4EmbeddingTensor::NLv4EmbeddingTensor(v12, *((char ***)a2 + 1));
    v14 = *v4;
    *v4 = v13;
    if (v14)
      (*(void (**)(sirinluinternal::NLv4EmbeddingTensor *))(*(_QWORD *)v14 + 8))(v14);
  }
  v15 = (const sirinluinternal::MatchingSpan **)*((_QWORD *)a2 + 2);
  for (i = (const sirinluinternal::MatchingSpan **)*((_QWORD *)a2 + 3); v15 != i; ++v15)
    PB::PtrVector<sirinluinternal::MatchingSpan>::emplace_back<sirinluinternal::MatchingSpan const&>((sirinluinternal::MatchingSpan ***)this + 2, *v15);
  if (*((_QWORD *)a2 + 8))
  {
    v17 = (sirinluexternal::TurnInput *)operator new();
    v18 = sirinluexternal::TurnInput::TurnInput(v17, *((const sirinluexternal::TurnInput **)a2 + 8));
    v19 = *((_QWORD *)this + 8);
    *((_QWORD *)this + 8) = v18;
    if (v19)
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
  }
  if ((*((_BYTE *)a2 + 72) & 1) != 0)
  {
    v20 = *((_QWORD *)a2 + 5);
    *((_BYTE *)this + 72) |= 1u;
    *((_QWORD *)this + 5) = v20;
  }
  return this;
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::operator=(uint64_t a1, const sirinluinternaluaap_parser::UaaPParserRequest *a2)
{
  int v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  int v16;

  if ((const sirinluinternaluaap_parser::UaaPParserRequest *)a1 != a2)
  {
    sirinluinternaluaap_parser::UaaPParserRequest::UaaPParserRequest((sirinluinternaluaap_parser::UaaPParserRequest *)&v10, a2);
    v3 = *(_DWORD *)(a1 + 72);
    *(_DWORD *)(a1 + 72) = v16;
    v16 = v3;
    v4 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(a1 + 48) = v14;
    v14 = v4;
    v5 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v11;
    v11 = v5;
    v6 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v12;
    v12 = v6;
    v7 = *(_QWORD *)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v15;
    v15 = v7;
    v8 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v13;
    v13 = v8;
    sirinluinternaluaap_parser::UaaPParserRequest::~UaaPParserRequest((sirinluinternaluaap_parser::UaaPParserRequest *)&v10);
  }
  return a1;
}

uint64_t sirinluinternaluaap_parser::swap(uint64_t this, sirinluinternaluaap_parser::UaaPParserRequest *a2, sirinluinternaluaap_parser::UaaPParserRequest *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = *(_DWORD *)(this + 72);
  *(_DWORD *)(this + 72) = *((_DWORD *)a2 + 18);
  *((_DWORD *)a2 + 18) = v3;
  v4 = *(_QWORD *)(this + 48);
  *(_QWORD *)(this + 48) = *((_QWORD *)a2 + 6);
  *((_QWORD *)a2 + 6) = v4;
  v5 = *(_QWORD *)(this + 56);
  *(_QWORD *)(this + 56) = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v5;
  v6 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v6;
  v7 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v7;
  v8 = *(_QWORD *)(this + 24);
  *(_QWORD *)(this + 24) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v8;
  v9 = *(_QWORD *)(this + 32);
  v10 = *(_QWORD *)(this + 40);
  v11 = *((_QWORD *)a2 + 5);
  *(_QWORD *)(this + 32) = *((_QWORD *)a2 + 4);
  *(_QWORD *)(this + 40) = v11;
  *((_QWORD *)a2 + 4) = v9;
  v12 = *(_QWORD *)(this + 64);
  *(_QWORD *)(this + 64) = *((_QWORD *)a2 + 8);
  *((_QWORD *)a2 + 8) = v12;
  *((_QWORD *)a2 + 5) = v10;
  return this;
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::UaaPParserRequest(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_OWORD *)(a1 + 8) = 0u;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)a1 = &off_1E7BB1A80;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_DWORD *)(a2 + 72) = 0;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 48) = 0;
  v6 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 56) = 0;
  v8 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v7;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  v9 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v10 = *v4;
  *v4 = v9;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate((_QWORD *)(a1 + 16));
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  v11 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a2 + 64) = 0;
  v12 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v11;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t sirinluinternaluaap_parser::UaaPParserRequest::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  int v16;

  if (a1 != a2)
  {
    sirinluinternaluaap_parser::UaaPParserRequest::UaaPParserRequest((uint64_t)&v10, a2);
    v3 = *(_DWORD *)(a1 + 72);
    *(_DWORD *)(a1 + 72) = v16;
    v16 = v3;
    v4 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(a1 + 48) = v14;
    v14 = v4;
    v5 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v11;
    v11 = v5;
    v6 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v12;
    v12 = v6;
    v7 = *(_QWORD *)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v15;
    v15 = v7;
    v8 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v13;
    v13 = v8;
    sirinluinternaluaap_parser::UaaPParserRequest::~UaaPParserRequest((sirinluinternaluaap_parser::UaaPParserRequest *)&v10);
  }
  return a1;
}

BOOL sirinluinternaluaap_parser::UaaPParserRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 result;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a2 + 48);
  if (v4)
  {
    if (!v5 || !sirinluexternal::UUID::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v6 = *(_QWORD **)(a1 + 56);
  v7 = *(_QWORD *)(a2 + 56);
  if (v6)
  {
    if (!v7 || !sirinluinternal::TokenChain::operator==(v6, v7))
      return 0;
  }
  else if (v7)
  {
    return 0;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a2 + 8);
  if (v8)
  {
    if (!v9 || !sirinluinternal::NLv4EmbeddingTensor::operator==(v8, v9))
      return 0;
  }
  else if (v9)
  {
    return 0;
  }
  result = PB::PtrVector<sirinluinternal::MatchingSpan>::operator==((uint64_t *)(a1 + 16), *(uint64_t **)(a2 + 16), *(_QWORD *)(a2 + 24));
  if (!result)
    return result;
  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(_QWORD *)(a2 + 64);
  if (!v11)
  {
    if (!v12)
      goto LABEL_24;
    return 0;
  }
  if (!v12 || (sirinluexternal::TurnInput::operator==(v11, v12) & 1) == 0)
    return 0;
LABEL_24:
  result = (*(_BYTE *)(a2 + 72) & 1) == 0;
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
    return (*(_BYTE *)(a2 + 72) & 1) != 0 && *(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40);
  return result;
}

unint64_t sirinluinternaluaap_parser::UaaPParserRequest::hash_value(sirinluinternaluaap_parser::UaaPParserRequest *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  sirinluinternal::TokenChain *v7;
  unint64_t v8;
  sirinluinternal::NLv4EmbeddingTensor *v9;
  unint64_t v10;
  sirinluinternal::MatchingSpan **v11;
  sirinluinternal::MatchingSpan **v12;
  uint64_t v13;
  sirinluinternal::MatchingSpan *v14;
  unint64_t v15;
  uint64_t v16;

  v2 = *((_QWORD *)this + 6);
  if (!v2)
  {
    v6 = 0;
    goto LABEL_11;
  }
  if ((*(_BYTE *)(v2 + 28) & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)(v2 + 28) & 2) != 0)
      goto LABEL_4;
LABEL_8:
    v4 = 0;
    if ((*(_BYTE *)(v2 + 28) & 4) != 0)
      goto LABEL_5;
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v3 = *(_QWORD *)(v2 + 8);
  if ((*(_BYTE *)(v2 + 28) & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)(v2 + 16);
  if ((*(_BYTE *)(v2 + 28) & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = *(int *)(v2 + 24);
LABEL_10:
  v6 = v4 ^ v3 ^ v5;
LABEL_11:
  v7 = (sirinluinternal::TokenChain *)*((_QWORD *)this + 7);
  if (v7)
    v8 = sirinluinternal::TokenChain::hash_value(v7);
  else
    v8 = 0;
  v9 = (sirinluinternal::NLv4EmbeddingTensor *)*((_QWORD *)this + 1);
  if (v9)
    v10 = sirinluinternal::NLv4EmbeddingTensor::hash_value(v9);
  else
    v10 = 0;
  v11 = (sirinluinternal::MatchingSpan **)*((_QWORD *)this + 2);
  v12 = (sirinluinternal::MatchingSpan **)*((_QWORD *)this + 3);
  if (v11 == v12)
  {
    v13 = 0;
  }
  else
  {
    v13 = 0;
    do
    {
      v14 = *v11++;
      v13 ^= sirinluinternal::MatchingSpan::hash_value(v14);
    }
    while (v11 != v12);
  }
  v15 = *((_QWORD *)this + 8);
  if (v15)
    v15 = sirinluexternal::TurnInput::hash_value((sirinluexternal::TurnInput *)v15);
  if ((*((_BYTE *)this + 72) & 1) != 0)
    v16 = *((_QWORD *)this + 5);
  else
    v16 = 0;
  return v8 ^ v6 ^ v15 ^ v16 ^ v10 ^ v13;
}

_QWORD *sirinluinternaluaap_parser::UaaPParserRequest::makeRequestId(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[6])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    *v2 = &off_1E7BB0CB8;
    v2[3] = 0;
    this = (_QWORD *)v1[6];
    v1[6] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluinternaluaap_parser::UaaPParserRequest::makeTokenChain(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[7])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BB0140;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_QWORD *)(v2 + 40) = 0;
    this = (_QWORD *)v1[7];
    v1[7] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluinternaluaap_parser::UaaPParserRequest::makeEmbeddings(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BB1DD0;
    *(_DWORD *)(v2 + 64) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluinternaluaap_parser::UaaPParserRequest::makeTurnInput(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[8])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BB16E8;
    *(_DWORD *)(v2 + 148) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_QWORD *)(v2 + 128) = 0;
    *(_QWORD *)(v2 + 136) = 0;
    this = (_QWORD *)v1[8];
    v1[8] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

BOOL SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutputReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  SIRINLUEXTERNALNLU_ROUTERRetrievedContext *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 3u:
          v17 = objc_alloc_init(SIRINLUEXTERNALNLU_ROUTERRetrievedContext);
          objc_msgSend(a1, "addRequiredContext:", v17);
          if (PBReaderPlaceMark()
            && (SIRINLUEXTERNALNLU_ROUTERRetrievedContextReadFrom((uint64_t)v17, a2) & 1) != 0)
          {
            PBReaderRecallMark();
            goto LABEL_32;
          }

          return 0;
        case 5u:
          PBReaderReadString();
          v17 = (SIRINLUEXTERNALNLU_ROUTERRetrievedContext *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(a1, "addOriginalRankedTools:", v17);
          goto LABEL_32;
        case 6u:
          PBReaderReadString();
          v17 = (SIRINLUEXTERNALNLU_ROUTERRetrievedContext *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(a1, "addAdjustedRankedTools:", v17);
          goto LABEL_32;
        case 7u:
          PBReaderReadString();
          v17 = (SIRINLUEXTERNALNLU_ROUTERRetrievedContext *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(a1, "addOriginalRankedSpans:", v17);
          goto LABEL_32;
        case 8u:
          PBReaderReadString();
          v17 = (SIRINLUEXTERNALNLU_ROUTERRetrievedContext *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(a1, "addAdjustedRankedSpans:", v17);
LABEL_32:

          goto LABEL_33;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_33:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SIRINLUEXTERNALNLU_ROUTERNLParseResponseReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  SIRINLUEXTERNALUserParse *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(SIRINLUEXTERNALUserParse);
        objc_msgSend(a1, "addUserParses:", v17);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALUserParseReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SIRINLUEXTERNALNLU_ROUTERAppReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL SIRINLUEXTERNALNLU_ROUTERNLRouterTurnProbingResultReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  SIRINLUEXTERNALNLU_ROUTERNLParseResponse *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(SIRINLUEXTERNALNLU_ROUTERNLParseResponse);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALNLU_ROUTERNLParseResponseReadFrom(v17, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(SIRINLUEXTERNALNLU_ROUTERPommesResponse);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark()
      || (SIRINLUEXTERNALNLU_ROUTERPommesResponseReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SIRINLUEXTERNALNLU_ROUTERRetrievedContextReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  SIRINLUEXTERNALNLU_ROUTERTypedValue *v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 5)
      {
        v23 = objc_alloc_init(SIRINLUEXTERNALNLU_ROUTERTypedValue);
        objc_storeStrong((id *)(a1 + 16), v23);
        if (!PBReaderPlaceMark()
          || (SIRINLUEXTERNALNLU_ROUTERTypedValueReadFrom((uint64_t)v23, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((v10 >> 3) == 3)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_33;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SIRINLUEXTERNALNLU_ROUTERTypedValueReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  SIRINLUEXTERNALNLU_ROUTERPrimitiveValue *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(SIRINLUEXTERNALNLU_ROUTERPrimitiveValue);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark()
          || (SIRINLUEXTERNALNLU_ROUTERPrimitiveValueReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SIRINLUEXTERNALNLU_ROUTERPommesResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 4)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C1FF2B90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1C1FF2D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C1FF2ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1FF2FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  MEMORY[0x1C3BB720C](v7, 0x1030C40E9F947FBLL);
  apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)va);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 48) = *(_DWORD *)(a2 + 48);
  return result;
}

void siricommon::FloatValue::~FloatValue(siricommon::FloatValue *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x1C3BB720CLL);
}

uint64_t siricommon::FloatValue::readFrom(siricommon::FloatValue *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_25;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        *((_BYTE *)this + 12) |= 1u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 <= 0xFFFFFFFFFFFFFFFBLL && v2 + 4 <= *((_QWORD *)a2 + 2))
        {
          *((_DWORD *)this + 2) = *(_DWORD *)(*(_QWORD *)a2 + v2);
          v2 = *((_QWORD *)a2 + 1) + 4;
          *((_QWORD *)a2 + 1) = v2;
        }
        else
        {
          *((_BYTE *)a2 + 24) = 1;
        }
      }
      else
      {
LABEL_25:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
        v2 = *((_QWORD *)a2 + 1);
      }
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_25;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t siricommon::FloatValue::writeTo(uint64_t this, PB::Writer *a2)
{
  if ((*(_BYTE *)(this + 12) & 1) != 0)
    return PB::Writer::write(a2, *(float *)(this + 8));
  return this;
}

uint64_t siricommon::FloatValue::formatText(siricommon::FloatValue *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if ((*((_BYTE *)this + 12) & 1) != 0)
    PB::TextFormatter::format(a2, "value", *((float *)this + 2));
  return PB::TextFormatter::endObject(a2);
}

uint64_t siricommon::FloatValue::FloatValue(uint64_t this)
{
  *(_QWORD *)this = &off_1E7BB1B78;
  *(_DWORD *)(this + 12) = 0;
  return this;
}

{
  *(_QWORD *)this = &off_1E7BB1B78;
  *(_DWORD *)(this + 12) = 0;
  return this;
}

float siricommon::FloatValue::FloatValue(siricommon::FloatValue *this, const siricommon::FloatValue *a2)
{
  float result;

  *(_QWORD *)this = &off_1E7BB1B78;
  *((_DWORD *)this + 3) = 0;
  if ((*((_BYTE *)a2 + 12) & 1) != 0)
  {
    result = *((float *)a2 + 2);
    *((_BYTE *)this + 12) = 1;
    *((float *)this + 2) = result;
  }
  return result;
}

{
  float result;

  *(_QWORD *)this = &off_1E7BB1B78;
  *((_DWORD *)this + 3) = 0;
  if ((*((_BYTE *)a2 + 12) & 1) != 0)
  {
    result = *((float *)a2 + 2);
    *((_BYTE *)this + 12) = 1;
    *((float *)this + 2) = result;
  }
  return result;
}

uint64_t siricommon::FloatValue::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  int v5;
  void (**v7)(siricommon::FloatValue *__hidden);
  int v8;
  int v9;

  if (a1 != a2)
  {
    v7 = &off_1E7BB1B78;
    v3 = *(_DWORD *)(a2 + 8);
    v4 = *(_DWORD *)(a1 + 12);
    *(_DWORD *)(a1 + 12) = *(_BYTE *)(a2 + 12) & 1;
    v9 = v4;
    v5 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)(a1 + 8) = v3;
    v8 = v5;
    PB::Base::~Base((PB::Base *)&v7);
  }
  return a1;
}

{
  int v3;
  int v4;
  int v5;
  int v6;
  void (**v8)(siricommon::FloatValue *__hidden);
  int v9;
  int v10;

  if (a1 != a2)
  {
    v8 = &off_1E7BB1B78;
    v3 = *(_DWORD *)(a2 + 12);
    *(_DWORD *)(a2 + 12) = 0;
    v4 = *(_DWORD *)(a2 + 8);
    v5 = *(_DWORD *)(a1 + 12);
    *(_DWORD *)(a1 + 12) = v3;
    v10 = v5;
    v6 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)(a1 + 8) = v4;
    v9 = v6;
    PB::Base::~Base((PB::Base *)&v8);
  }
  return a1;
}

float siricommon::swap(siricommon *this, siricommon::FloatValue *a2, siricommon::FloatValue *a3)
{
  int v3;
  float result;

  v3 = *((_DWORD *)this + 3);
  *((_DWORD *)this + 3) = *((_DWORD *)a2 + 3);
  *((_DWORD *)a2 + 3) = v3;
  result = *((float *)this + 2);
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  *((float *)a2 + 2) = result;
  return result;
}

float siricommon::FloatValue::FloatValue(uint64_t a1, uint64_t a2)
{
  float result;

  *(_QWORD *)a1 = &off_1E7BB1B78;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a2 + 12) = 0;
  result = *(float *)(a2 + 8);
  *(float *)(a1 + 8) = result;
  return result;
}

{
  float result;

  *(_QWORD *)a1 = &off_1E7BB1B78;
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a2 + 12) = 0;
  result = *(float *)(a2 + 8);
  *(float *)(a1 + 8) = result;
  return result;
}

BOOL siricommon::FloatValue::operator==(uint64_t a1, uint64_t a2)
{
  char v3;
  _BOOL8 result;

  v3 = *(_BYTE *)(a1 + 12);
  result = (*(_BYTE *)(a2 + 12) & 1) == 0;
  if ((v3 & 1) != 0)
    return (*(_BYTE *)(a2 + 12) & 1) != 0 && *(float *)(a1 + 8) == *(float *)(a2 + 8);
  return result;
}

float siricommon::FloatValue::hash_value(siricommon::FloatValue *this)
{
  float result;

  if ((*((_BYTE *)this + 12) & 1) != 0)
    return *((float *)this + 2);
  return result;
}

void sirinluinternal::NluRequestRule::~NluRequestRule(sirinluinternal::NluRequestRule *this)
{
  sirinluinternal::NluRequestRule::~NluRequestRule(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)this = &off_1E7BB1BC8;
  v2 = *((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = 0;
  if (v2)
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  v3 = (_QWORD *)*((_QWORD *)this + 4);
  if (v3)
  {
    v4 = (_QWORD *)*((_QWORD *)this + 5);
    v5 = (void *)*((_QWORD *)this + 4);
    if (v4 != v3)
    {
      do
      {
        v7 = *--v4;
        v6 = v7;
        *v4 = 0;
        if (v7)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
      }
      while (v4 != v3);
      v5 = (void *)*((_QWORD *)this + 4);
    }
    *((_QWORD *)this + 5) = v3;
    operator delete(v5);
  }
  v8 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v8)
    std::default_delete<std::string>::operator()[abi:ne180100](v8);
  v9 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v9)
    std::default_delete<std::string>::operator()[abi:ne180100](v9);
  v10 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v10)
    std::default_delete<std::string>::operator()[abi:ne180100](v10);
  PB::Base::~Base(this);
}

uint64_t sirinluinternal::NluRequestRule::readFrom(int64x2_t *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  int64x2_t *v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  uint64_t result;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  unint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  int64x2_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int64x2_t v46;
  unint64_t v47;
  int64x2_t *v48;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  v8 = this + 3;
  while (1)
  {
    v9 = *(_QWORD *)a2;
    if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3)
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_20;
      }
LABEL_22:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v12 >> 3))
      {
        case 1u:
          v21 = (_QWORD *)operator new();
          v21[1] = 0;
          v21[2] = 0;
          *v21 = 0;
          v22 = this[1].i64[0];
          this[1].i64[0] = (uint64_t)v21;
          if (v22)
            goto LABEL_33;
          goto LABEL_34;
        case 2u:
          v30 = (_QWORD *)operator new();
          v30[1] = 0;
          v30[2] = 0;
          *v30 = 0;
          v22 = this[1].i64[1];
          this[1].i64[1] = (uint64_t)v30;
          if (v22)
            goto LABEL_33;
          goto LABEL_34;
        case 3u:
          v28 = (_QWORD *)operator new();
          v28[1] = 0;
          v28[2] = 0;
          *v28 = 0;
          v22 = this->i64[1];
          this->i64[1] = (uint64_t)v28;
          if (v22)
            goto LABEL_33;
          goto LABEL_34;
        case 4u:
          v29 = (_QWORD *)operator new();
          v29[1] = 0;
          v29[2] = 0;
          *v29 = 0;
          v22 = this[3].i64[1];
          this[3].i64[1] = (uint64_t)v29;
          if (v22)
LABEL_33:
            std::default_delete<std::string>::operator()[abi:ne180100](v22);
LABEL_34:
          PB::Reader::read();
          goto LABEL_35;
        case 5u:
          v23 = operator new();
          v24 = v23;
          *(_QWORD *)v23 = &off_1E7BB23E8;
          *(_OWORD *)(v23 + 8) = 0u;
          *(_OWORD *)(v23 + 24) = 0u;
          *(_OWORD *)(v23 + 40) = 0u;
          *(_QWORD *)(v23 + 56) = 0;
          v26 = (uint64_t *)this[2].i64[1];
          v25 = this[3].u64[0];
          if ((unint64_t)v26 >= v25)
          {
            v31 = this[2].i64[0];
            v32 = ((uint64_t)v26 - v31) >> 3;
            if ((unint64_t)(v32 + 1) >> 61)
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            v33 = v25 - v31;
            v34 = v33 >> 2;
            if (v33 >> 2 <= (unint64_t)(v32 + 1))
              v34 = v32 + 1;
            if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8)
              v35 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v35 = v34;
            v48 = v8;
            if (v35)
              v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v35);
            else
              v36 = 0;
            v37 = (uint64_t *)(v35 + 8 * v32);
            v38 = v35 + 8 * v36;
            v47 = v38;
            *v37 = v24;
            v27 = v37 + 1;
            v46.i64[1] = (uint64_t)(v37 + 1);
            v40 = (_QWORD *)this[2].i64[0];
            v39 = (_QWORD *)this[2].i64[1];
            if (v39 == v40)
            {
              v42 = vdupq_n_s64((unint64_t)v39);
            }
            else
            {
              do
              {
                v41 = *--v39;
                *v39 = 0;
                *--v37 = v41;
              }
              while (v39 != v40);
              v42 = this[2];
              v27 = (_QWORD *)v46.i64[1];
              v38 = v47;
            }
            this[2].i64[0] = (uint64_t)v37;
            this[2].i64[1] = (uint64_t)v27;
            v46 = v42;
            v43 = this[3].i64[0];
            this[3].i64[0] = v38;
            v47 = v43;
            v45 = v42.i64[0];
            std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v45);
          }
          else
          {
            *v26 = v23;
            v27 = v26 + 1;
          }
          this[2].i64[1] = (uint64_t)v27;
          v44 = *(v27 - 1);
          if (!PB::Reader::placeMark()
            || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v44 + 16))(v44, a2) & 1) == 0)
          {
            return 0;
          }
          PB::Reader::recallMark();
          break;
        default:
          goto LABEL_20;
      }
      goto LABEL_35;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    do
    {
      if (v3 == v2)
      {
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_22;
      v16 += 7;
      v2 = v18;
      v15 = v17++ > 8;
    }
    while (!v15);
LABEL_20:
    result = PB::Reader::skip(a2);
    if (!(_DWORD)result)
      return result;
LABEL_35:
    v2 = *((_QWORD *)a2 + 1);
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || *((_BYTE *)a2 + 24))
      return v4 == 0;
  }
}

void sub_1C1FF395C(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

_QWORD *sirinluinternal::NluRequestRule::writeTo(_QWORD *this, PB::Writer *a2)
{
  _QWORD *v3;
  const PB::Base **v4;
  const PB::Base **v5;
  const PB::Base *v6;

  v3 = this;
  if (this[2])
    this = (_QWORD *)PB::Writer::write();
  if (v3[3])
    this = (_QWORD *)PB::Writer::write();
  if (v3[1])
    this = (_QWORD *)PB::Writer::write();
  if (v3[7])
    this = (_QWORD *)PB::Writer::write();
  v5 = (const PB::Base **)v3[4];
  v4 = (const PB::Base **)v3[5];
  while (v5 != v4)
  {
    v6 = *v5++;
    this = (_QWORD *)PB::Writer::writeSubmessage(a2, v6);
  }
  return this;
}

uint64_t sirinluinternal::NluRequestRule::formatText(sirinluinternal::NluRequestRule *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;

  PB::TextFormatter::beginObject(a2, a3);
  if (*((_QWORD *)this + 1))
    PB::TextFormatter::format();
  if (*((_QWORD *)this + 2))
    PB::TextFormatter::format();
  if (*((_QWORD *)this + 3))
    PB::TextFormatter::format();
  v5 = (uint64_t *)*((_QWORD *)this + 4);
  v6 = (uint64_t *)*((_QWORD *)this + 5);
  while (v5 != v6)
  {
    v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v7 + 32))(v7, a2, "turn_input_rules");
  }
  if (*((_QWORD *)this + 7))
    PB::TextFormatter::format();
  return PB::TextFormatter::endObject(a2);
}

double sirinluinternal::NluRequestRule::NluRequestRule(sirinluinternal::NluRequestRule *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB1BC8;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_QWORD *)this + 7) = 0;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB1BC8;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_QWORD *)this + 7) = 0;
  return result;
}

sirinluinternal::NluRequestRule *sirinluinternal::NluRequestRule::NluRequestRule(sirinluinternal::NluRequestRule *this, const sirinluinternal::NluRequestRule *a2)
{
  uint64_t *v4;
  std::string *v5;
  std::string *v6;
  __int128 *v7;
  __int128 v8;
  uint64_t v9;
  std::string *v10;
  std::string *v11;
  __int128 *v12;
  __int128 v13;
  uint64_t v14;
  std::string *v15;
  std::string *v16;
  __int128 *v17;
  __int128 v18;
  uint64_t v19;
  std::string *v20;
  std::string *v21;
  __int128 *v22;
  __int128 v23;
  uint64_t v24;
  const sirinluinternal::UtteranceRule ***v25;
  const sirinluinternal::UtteranceRule ***i;
  const sirinluinternal::UtteranceRule **v27;
  sirinluinternal::TurnInputRule *v28;
  unint64_t v29;
  sirinluinternal::TurnInputRule **v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  sirinluinternal::TurnInputRule **v38;
  unint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  sirinluinternal::TurnInputRule *v42;
  int64x2_t v43;
  unint64_t v44;
  uint64_t v46;
  int64x2_t v47;
  unint64_t v48;
  char *v49;

  *(_QWORD *)this = &off_1E7BB1BC8;
  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (uint64_t *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_QWORD *)this + 7) = 0;
  if (*((_QWORD *)a2 + 2))
  {
    v5 = (std::string *)operator new();
    v6 = v5;
    v7 = (__int128 *)*((_QWORD *)a2 + 2);
    if (*((char *)v7 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)v7, *((_QWORD *)v7 + 1));
    }
    else
    {
      v8 = *v7;
      v5->__r_.__value_.__r.__words[2] = *((_QWORD *)v7 + 2);
      *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v8;
    }
    v9 = *((_QWORD *)this + 2);
    *((_QWORD *)this + 2) = v6;
    if (v9)
      std::default_delete<std::string>::operator()[abi:ne180100](v9);
  }
  if (*((_QWORD *)a2 + 3))
  {
    v10 = (std::string *)operator new();
    v11 = v10;
    v12 = (__int128 *)*((_QWORD *)a2 + 3);
    if (*((char *)v12 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)v12, *((_QWORD *)v12 + 1));
    }
    else
    {
      v13 = *v12;
      v10->__r_.__value_.__r.__words[2] = *((_QWORD *)v12 + 2);
      *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v13;
    }
    v14 = *((_QWORD *)this + 3);
    *((_QWORD *)this + 3) = v11;
    if (v14)
      std::default_delete<std::string>::operator()[abi:ne180100](v14);
  }
  if (*((_QWORD *)a2 + 1))
  {
    v15 = (std::string *)operator new();
    v16 = v15;
    v17 = (__int128 *)*((_QWORD *)a2 + 1);
    if (*((char *)v17 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v15, *(const std::string::value_type **)v17, *((_QWORD *)v17 + 1));
    }
    else
    {
      v18 = *v17;
      v15->__r_.__value_.__r.__words[2] = *((_QWORD *)v17 + 2);
      *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v18;
    }
    v19 = *v4;
    *v4 = (uint64_t)v16;
    if (v19)
      std::default_delete<std::string>::operator()[abi:ne180100](v19);
  }
  if (*((_QWORD *)a2 + 7))
  {
    v20 = (std::string *)operator new();
    v21 = v20;
    v22 = (__int128 *)*((_QWORD *)a2 + 7);
    if (*((char *)v22 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v20, *(const std::string::value_type **)v22, *((_QWORD *)v22 + 1));
    }
    else
    {
      v23 = *v22;
      v20->__r_.__value_.__r.__words[2] = *((_QWORD *)v22 + 2);
      *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v23;
    }
    v24 = *((_QWORD *)this + 7);
    *((_QWORD *)this + 7) = v21;
    if (v24)
      std::default_delete<std::string>::operator()[abi:ne180100](v24);
  }
  v25 = (const sirinluinternal::UtteranceRule ***)*((_QWORD *)a2 + 4);
  for (i = (const sirinluinternal::UtteranceRule ***)*((_QWORD *)a2 + 5); v25 != i; ++v25)
  {
    v27 = *v25;
    v28 = (sirinluinternal::TurnInputRule *)operator new();
    sirinluinternal::TurnInputRule::TurnInputRule(v28, v27);
    v30 = (sirinluinternal::TurnInputRule **)*((_QWORD *)this + 5);
    v29 = *((_QWORD *)this + 6);
    if ((unint64_t)v30 >= v29)
    {
      v32 = *((_QWORD *)this + 4);
      v33 = ((uint64_t)v30 - v32) >> 3;
      if ((unint64_t)(v33 + 1) >> 61)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v34 = v29 - v32;
      v35 = v34 >> 2;
      if (v34 >> 2 <= (unint64_t)(v33 + 1))
        v35 = v33 + 1;
      if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8)
        v36 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v36 = v35;
      v49 = (char *)this + 48;
      if (v36)
        v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v36);
      else
        v37 = 0;
      v38 = (sirinluinternal::TurnInputRule **)(v36 + 8 * v33);
      v39 = v36 + 8 * v37;
      v48 = v39;
      *v38 = v28;
      v31 = v38 + 1;
      v47.i64[1] = (uint64_t)(v38 + 1);
      v41 = (_QWORD *)*((_QWORD *)this + 4);
      v40 = (_QWORD *)*((_QWORD *)this + 5);
      if (v40 == v41)
      {
        v43 = vdupq_n_s64((unint64_t)v40);
      }
      else
      {
        do
        {
          v42 = (sirinluinternal::TurnInputRule *)*--v40;
          *v40 = 0;
          *--v38 = v42;
        }
        while (v40 != v41);
        v43 = *((int64x2_t *)this + 2);
        v31 = (_QWORD *)v47.i64[1];
        v39 = v48;
      }
      *((_QWORD *)this + 4) = v38;
      *((_QWORD *)this + 5) = v31;
      v47 = v43;
      v44 = *((_QWORD *)this + 6);
      *((_QWORD *)this + 6) = v39;
      v48 = v44;
      v46 = v43.i64[0];
      std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v46);
    }
    else
    {
      *v30 = v28;
      v31 = v30 + 1;
    }
    *((_QWORD *)this + 5) = v31;
  }
  return this;
}

void sub_1C1FF3EE8(void *a1)
{
  __clang_call_terminate(a1);
}

uint64_t sirinluinternal::NluRequestRule::operator=(uint64_t a1, const sirinluinternal::NluRequestRule *a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  if ((const sirinluinternal::NluRequestRule *)a1 != a2)
  {
    sirinluinternal::NluRequestRule::NluRequestRule((sirinluinternal::NluRequestRule *)&v8, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    v9 = v3;
    v4 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v12;
    v12 = v4;
    v5 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    v10 = v5;
    v6 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v11;
    v11 = v6;
    sirinluinternal::NluRequestRule::~NluRequestRule((sirinluinternal::NluRequestRule *)&v8);
  }
  return a1;
}

_QWORD *sirinluinternal::swap(_QWORD *this, sirinluinternal::NluRequestRule *a2, sirinluinternal::NluRequestRule *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = this[2];
  this[2] = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v3;
  v4 = this[3];
  this[3] = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v4;
  v5 = this[1];
  this[1] = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v5;
  v6 = this[7];
  this[7] = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v6;
  v7 = this[4];
  this[4] = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v7;
  v8 = this[5];
  this[5] = *((_QWORD *)a2 + 5);
  *((_QWORD *)a2 + 5) = v8;
  v9 = this[6];
  this[6] = *((_QWORD *)a2 + 6);
  *((_QWORD *)a2 + 6) = v9;
  return this;
}

uint64_t sirinluinternal::NluRequestRule::NluRequestRule(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  *(_QWORD *)a1 = &off_1E7BB1BC8;
  *(_OWORD *)(a1 + 8) = 0u;
  v4 = (uint64_t *)(a1 + 8);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  if (v6)
    std::default_delete<std::string>::operator()[abi:ne180100](v6);
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 24) = 0;
  v8 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  if (v8)
    std::default_delete<std::string>::operator()[abi:ne180100](v8);
  v9 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v10 = *v4;
  *v4 = v9;
  if (v10)
    std::default_delete<std::string>::operator()[abi:ne180100](v10);
  v11 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 56) = 0;
  v12 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v11;
  if (v12)
    std::default_delete<std::string>::operator()[abi:ne180100](v12);
  v13 = (void **)(a1 + 32);
  v14 = *(_QWORD **)(a1 + 32);
  if (v14)
  {
    v15 = *(_QWORD **)(a1 + 40);
    v16 = *(void **)(a1 + 32);
    if (v15 != v14)
    {
      do
      {
        v18 = *--v15;
        v17 = v18;
        *v15 = 0;
        if (v18)
          (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
      }
      while (v15 != v14);
      v16 = *v13;
    }
    *(_QWORD *)(a1 + 40) = v14;
    operator delete(v16);
    *v13 = 0;
    *(_QWORD *)(a1 + 40) = 0;
    *(_QWORD *)(a1 + 48) = 0;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  return a1;
}

uint64_t sirinluinternal::NluRequestRule::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sirinluinternal::NluRequestRule::NluRequestRule((uint64_t)&v8, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    v9 = v3;
    v4 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v12;
    v12 = v4;
    v5 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    v10 = v5;
    v6 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v11;
    v11 = v6;
    sirinluinternal::NluRequestRule::~NluRequestRule((sirinluinternal::NluRequestRule *)&v8);
  }
  return a1;
}

BOOL sirinluinternal::NluRequestRule::operator==(_QWORD *a1, uint64_t a2)
{
  unsigned __int8 *v4;
  unsigned __int8 **v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  unsigned __int8 *v10;
  unsigned __int8 *v12;
  unsigned __int8 **v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  int v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  unsigned __int8 **v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  int v24;
  unsigned __int8 *v25;
  unsigned __int8 *v26;
  unsigned __int8 *v27;

  v4 = (unsigned __int8 *)a1[2];
  v5 = *(unsigned __int8 ***)(a2 + 16);
  if (v4)
  {
    if (!v5)
      return 0;
    v6 = v4[23];
    if ((v6 & 0x80u) == 0)
      v7 = (unsigned __int8 *)v4[23];
    else
      v7 = (unsigned __int8 *)*((_QWORD *)v4 + 1);
    v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
    v9 = (char)v8;
    if ((char)v8 < 0)
      v8 = v5[1];
    if (v7 != v8)
      return 0;
    if (v9 >= 0)
      v10 = *(unsigned __int8 **)(a2 + 16);
    else
      v10 = *v5;
    if ((v6 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v4, v10, *((_QWORD *)v4 + 1)))
        return 0;
    }
    else if (v4[23])
    {
      while (*v4 == *v10)
      {
        ++v4;
        ++v10;
        if (!--v6)
          goto LABEL_20;
      }
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
LABEL_20:
  v12 = (unsigned __int8 *)a1[3];
  v13 = *(unsigned __int8 ***)(a2 + 24);
  if (v12)
  {
    if (!v13)
      return 0;
    v14 = v12[23];
    if ((v14 & 0x80u) == 0)
      v15 = (unsigned __int8 *)v12[23];
    else
      v15 = (unsigned __int8 *)*((_QWORD *)v12 + 1);
    v16 = (unsigned __int8 *)*((unsigned __int8 *)v13 + 23);
    v17 = (char)v16;
    if ((char)v16 < 0)
      v16 = v13[1];
    if (v15 != v16)
      return 0;
    if (v17 >= 0)
      v18 = *(unsigned __int8 **)(a2 + 24);
    else
      v18 = *v13;
    if ((v14 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v12, v18, *((_QWORD *)v12 + 1)))
        return 0;
    }
    else if (v12[23])
    {
      while (*v12 == *v18)
      {
        ++v12;
        ++v18;
        if (!--v14)
          goto LABEL_37;
      }
      return 0;
    }
  }
  else if (v13)
  {
    return 0;
  }
LABEL_37:
  v19 = (unsigned __int8 *)a1[1];
  v20 = *(unsigned __int8 ***)(a2 + 8);
  if (v19)
  {
    if (!v20)
      return 0;
    v21 = v19[23];
    if ((v21 & 0x80u) == 0)
      v22 = (unsigned __int8 *)v19[23];
    else
      v22 = (unsigned __int8 *)*((_QWORD *)v19 + 1);
    v23 = (unsigned __int8 *)*((unsigned __int8 *)v20 + 23);
    v24 = (char)v23;
    if ((char)v23 < 0)
      v23 = v20[1];
    if (v22 != v23)
      return 0;
    if (v24 >= 0)
      v25 = *(unsigned __int8 **)(a2 + 8);
    else
      v25 = *v20;
    if ((v21 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v19, v25, *((_QWORD *)v19 + 1)))
        return 0;
    }
    else if (v19[23])
    {
      while (*v19 == *v25)
      {
        ++v19;
        ++v25;
        if (!--v21)
          goto LABEL_54;
      }
      return 0;
    }
  }
  else if (v20)
  {
    return 0;
  }
LABEL_54:
  v26 = (unsigned __int8 *)a1[7];
  v27 = *(unsigned __int8 **)(a2 + 56);
  if (v26)
  {
    if (v27 && std::__equal_to::operator()[abi:ne180100]<std::string,std::string>(v26, v27))
      return PB::PtrVector<sirinluinternal::TurnInputRule>::operator==(a1 + 4, *(uint64_t **)(a2 + 32), *(_QWORD *)(a2 + 40));
    return 0;
  }
  if (v27)
    return 0;
  return PB::PtrVector<sirinluinternal::TurnInputRule>::operator==(a1 + 4, *(uint64_t **)(a2 + 32), *(_QWORD *)(a2 + 40));
}

BOOL PB::PtrVector<sirinluinternal::TurnInputRule>::operator==(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 result;
  BOOL v9;

  v3 = *a1;
  v4 = a1[1];
  if (v4 - *a1 != a3 - (_QWORD)a2)
    return 0;
  if (v3 == v4)
    return 1;
  v5 = a2;
  v6 = v3 + 8;
  do
  {
    v7 = *v5++;
    result = sirinluinternal::TurnInputRule::operator==(*(uint64_t **)(v6 - 8), v7);
    v9 = !result || v6 == v4;
    v6 += 8;
  }
  while (!v9);
  return result;
}

unint64_t sirinluinternal::NluRequestRule::hash_value(sirinluinternal::NluRequestRule *this)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  sirinluinternal::TurnInputRule **v10;
  sirinluinternal::TurnInputRule **v11;
  uint64_t v12;
  sirinluinternal::TurnInputRule *v13;

  v2 = *((_QWORD *)this + 2);
  if (v2)
    v3 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  else
    v3 = 0;
  v4 = *((_QWORD *)this + 3);
  if (v4)
    v5 = std::__string_hash<char>::operator()[abi:ne180100](v4);
  else
    v5 = 0;
  v6 = *((_QWORD *)this + 1);
  if (v6)
    v7 = std::__string_hash<char>::operator()[abi:ne180100](v6);
  else
    v7 = 0;
  v8 = *((_QWORD *)this + 7);
  if (v8)
    v9 = std::__string_hash<char>::operator()[abi:ne180100](v8);
  else
    v9 = 0;
  v11 = (sirinluinternal::TurnInputRule **)*((_QWORD *)this + 4);
  v10 = (sirinluinternal::TurnInputRule **)*((_QWORD *)this + 5);
  if (v11 == v10)
  {
    v12 = 0;
  }
  else
  {
    v12 = 0;
    do
    {
      v13 = *v11++;
      v12 ^= sirinluinternal::TurnInputRule::hash_value(v13);
    }
    while (v11 != v10);
  }
  return v5 ^ v3 ^ v7 ^ v9 ^ v12;
}

uint64_t SIRINLUEXTERNALUsoEntitySpanReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  SIRICOMMONStringValue *v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 96) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_61;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_63;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_61:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_63:
        v32 = 40;
        goto LABEL_68;
      case 2u:
        v24 = objc_alloc_init(SIRICOMMONStringValue);
        v25 = 48;
        goto LABEL_52;
      case 3u:
        v26 = 0;
        v27 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 96) |= 2u;
        while (2)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 1;
            v19 |= (unint64_t)(v30 & 0x7F) << v26;
            if (v30 < 0)
            {
              v26 += 7;
              v14 = v27++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_67:
        v32 = 80;
LABEL_68:
        *(_DWORD *)(a1 + v32) = v19;
        goto LABEL_58;
      case 4u:
        v24 = objc_alloc_init(SIRICOMMONStringValue);
        v25 = 24;
        goto LABEL_52;
      case 5u:
        v24 = objc_alloc_init(SIRINLUEXTERNALMatchInfo);
        objc_storeStrong((id *)(a1 + 32), v24);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALMatchInfoReadFrom((uint64_t)v24, a2) & 1) == 0)
          goto LABEL_70;
        goto LABEL_57;
      case 6u:
        v24 = objc_alloc_init(SIRINLUEXTERNALSpanProperty);
        objc_msgSend((id)a1, "addProperties:", v24);
        if (!PBReaderPlaceMark() || !SIRINLUEXTERNALSpanPropertyReadFrom((uint64_t)v24, a2))
          goto LABEL_70;
        goto LABEL_57;
      case 7u:
        v24 = objc_alloc_init(SIRICOMMONUInt32Value);
        v31 = 88;
        goto LABEL_45;
      case 8u:
        v24 = objc_alloc_init(SIRICOMMONUInt32Value);
        v31 = 16;
LABEL_45:
        objc_storeStrong((id *)(a1 + v31), v24);
        if (!PBReaderPlaceMark() || (SIRICOMMONUInt32ValueReadFrom((uint64_t)v24, a2) & 1) == 0)
          goto LABEL_70;
        goto LABEL_57;
      case 9u:
        v24 = objc_alloc_init(SIRINLUEXTERNALAsrAlternative);
        objc_msgSend((id)a1, "addAlternatives:", v24);
        if (!PBReaderPlaceMark() || !SIRINLUEXTERNALAsrAlternativeReadFrom((uint64_t)v24, a2))
          goto LABEL_70;
        goto LABEL_57;
      case 0xAu:
        v24 = objc_alloc_init(SIRICOMMONStringValue);
        v25 = 56;
LABEL_52:
        objc_storeStrong((id *)(a1 + v25), v24);
        if (!PBReaderPlaceMark() || (SIRICOMMONStringValueReadFrom((uint64_t)v24, a2) & 1) == 0)
          goto LABEL_70;
        goto LABEL_57;
      case 0xBu:
        v24 = objc_alloc_init(SIRINLUEXTERNALPayloadAttachmentInfo);
        objc_storeStrong((id *)(a1 + 64), v24);
        if (PBReaderPlaceMark()
          && (SIRINLUEXTERNALPayloadAttachmentInfoReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
LABEL_57:
          PBReaderRecallMark();

LABEL_58:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_70:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_58;
    }
  }
}

void sirinluinternaltokenizer::TokenizerRequest::~TokenizerRequest(sirinluinternaltokenizer::TokenizerRequest *this)
{
  sirinluinternaltokenizer::TokenizerRequest::~TokenizerRequest(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)this = &off_1E7BB1C50;
  v2 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v2)
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  v3 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    std::default_delete<std::string>::operator()[abi:ne180100](v3);
  v4 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  PB::Base::~Base(this);
}

uint64_t sirinluinternaltokenizer::TokenizerRequest::readFrom(sirinluinternaltokenizer::TokenizerRequest *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        v15 = 0;
        v16 = 0;
        v11 = 0;
        if (v2 > v3)
          v3 = v2;
        while (v3 != v2)
        {
          v17 = v2 + 1;
          v18 = *(_BYTE *)(v8 + v2);
          *((_QWORD *)a2 + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0)
            goto LABEL_21;
          v15 += 7;
          v2 = v17;
          v14 = v16++ > 8;
          if (v14)
            goto LABEL_19;
        }
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_19;
      }
LABEL_21:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v20 = v11 >> 3;
      if ((v11 >> 3) != 3)
        break;
      v23 = (_QWORD *)operator new();
      *v23 = &off_1E7BB0CB8;
      v23[3] = 0;
      v24 = *((_QWORD *)this + 1);
      *((_QWORD *)this + 1) = v23;
      if (v24)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
        v23 = (_QWORD *)*((_QWORD *)this + 1);
      }
      if (!PB::Reader::placeMark()
        || ((*(uint64_t (**)(_QWORD *, PB::Reader *))(*v23 + 16))(v23, a2) & 1) == 0)
      {
        return 0;
      }
      PB::Reader::recallMark();
LABEL_35:
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    if ((_DWORD)v20 == 2)
    {
      v25 = (_QWORD *)operator new();
      v25[1] = 0;
      v25[2] = 0;
      *v25 = 0;
      v22 = *((_QWORD *)this + 2);
      *((_QWORD *)this + 2) = v25;
      if (!v22)
      {
LABEL_34:
        PB::Reader::read();
        goto LABEL_35;
      }
    }
    else
    {
      if ((_DWORD)v20 != 1)
      {
LABEL_19:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
        goto LABEL_35;
      }
      v21 = (_QWORD *)operator new();
      v21[1] = 0;
      v21[2] = 0;
      *v21 = 0;
      v22 = *((_QWORD *)this + 3);
      *((_QWORD *)this + 3) = v21;
      if (!v22)
        goto LABEL_34;
    }
    std::default_delete<std::string>::operator()[abi:ne180100](v22);
    goto LABEL_34;
  }
  return v4 == 0;
}

uint64_t sirinluinternaltokenizer::TokenizerRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;

  v3 = this;
  if (*(_QWORD *)(this + 24))
    this = PB::Writer::write();
  if (*(_QWORD *)(v3 + 16))
    this = PB::Writer::write();
  v4 = *(const PB::Base **)(v3 + 8);
  if (v4)
    return PB::Writer::writeSubmessage(a2, v4);
  return this;
}

uint64_t sirinluinternaltokenizer::TokenizerRequest::formatText(sirinluinternaltokenizer::TokenizerRequest *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "asrId");
  if (*((_QWORD *)this + 2))
    PB::TextFormatter::format();
  if (*((_QWORD *)this + 3))
    PB::TextFormatter::format();
  return PB::TextFormatter::endObject(a2);
}

_QWORD *sirinluinternaltokenizer::TokenizerRequest::TokenizerRequest(_QWORD *this)
{
  *this = &off_1E7BB1C50;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

{
  *this = &off_1E7BB1C50;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

sirinluinternaltokenizer::TokenizerRequest *sirinluinternaltokenizer::TokenizerRequest::TokenizerRequest(sirinluinternaltokenizer::TokenizerRequest *this, const sirinluinternaltokenizer::TokenizerRequest *a2)
{
  uint64_t *v4;
  std::string *v5;
  std::string *v6;
  __int128 *v7;
  __int128 v8;
  uint64_t v9;
  std::string *v10;
  std::string *v11;
  __int128 *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *(_QWORD *)this = &off_1E7BB1C50;
  *((_QWORD *)this + 1) = 0;
  v4 = (uint64_t *)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  if (*((_QWORD *)a2 + 3))
  {
    v5 = (std::string *)operator new();
    v6 = v5;
    v7 = (__int128 *)*((_QWORD *)a2 + 3);
    if (*((char *)v7 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)v7, *((_QWORD *)v7 + 1));
    }
    else
    {
      v8 = *v7;
      v5->__r_.__value_.__r.__words[2] = *((_QWORD *)v7 + 2);
      *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v8;
    }
    v9 = *((_QWORD *)this + 3);
    *((_QWORD *)this + 3) = v6;
    if (v9)
      std::default_delete<std::string>::operator()[abi:ne180100](v9);
  }
  if (*((_QWORD *)a2 + 2))
  {
    v10 = (std::string *)operator new();
    v11 = v10;
    v12 = (__int128 *)*((_QWORD *)a2 + 2);
    if (*((char *)v12 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)v12, *((_QWORD *)v12 + 1));
    }
    else
    {
      v13 = *v12;
      v10->__r_.__value_.__r.__words[2] = *((_QWORD *)v12 + 2);
      *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v13;
    }
    v14 = *((_QWORD *)this + 2);
    *((_QWORD *)this + 2) = v11;
    if (v14)
      std::default_delete<std::string>::operator()[abi:ne180100](v14);
  }
  if (*((_QWORD *)a2 + 1))
  {
    v15 = operator new();
    v16 = sirinluexternal::UUID::UUID(v15, *((const sirinluexternal::UUID **)a2 + 1));
    v17 = *v4;
    *v4 = v16;
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  }
  return this;
}

uint64_t sirinluinternaltokenizer::TokenizerRequest::operator=(uint64_t a1, const sirinluinternaltokenizer::TokenizerRequest *a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  if ((const sirinluinternaltokenizer::TokenizerRequest *)a1 != a2)
  {
    sirinluinternaltokenizer::TokenizerRequest::TokenizerRequest((sirinluinternaltokenizer::TokenizerRequest *)&v6, a2);
    v3 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v8;
    v8 = v3;
    v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    v7 = v4;
    sirinluinternaltokenizer::TokenizerRequest::~TokenizerRequest((sirinluinternaltokenizer::TokenizerRequest *)&v6);
  }
  return a1;
}

_QWORD *sirinluinternaltokenizer::swap(_QWORD *this, sirinluinternaltokenizer::TokenizerRequest *a2, sirinluinternaltokenizer::TokenizerRequest *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = this[3];
  this[3] = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v3;
  v4 = this[2];
  this[2] = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v4;
  v5 = this[1];
  this[1] = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v5;
  return this;
}

_QWORD *sirinluinternaltokenizer::TokenizerRequest::TokenizerRequest(_QWORD *a1, _QWORD *a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = &off_1E7BB1C50;
  a1[1] = 0;
  v4 = a1 + 1;
  a1[2] = 0;
  a1[3] = 0;
  v5 = a2[3];
  a2[3] = 0;
  v6 = a1[3];
  a1[3] = v5;
  if (v6)
    std::default_delete<std::string>::operator()[abi:ne180100](v6);
  v7 = a2[2];
  a2[2] = 0;
  v8 = a1[2];
  a1[2] = v7;
  if (v8)
    std::default_delete<std::string>::operator()[abi:ne180100](v8);
  v9 = a2[1];
  a2[1] = 0;
  v10 = *v4;
  *v4 = v9;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  return a1;
}

uint64_t sirinluinternaltokenizer::TokenizerRequest::operator=(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  if ((_QWORD *)a1 != a2)
  {
    sirinluinternaltokenizer::TokenizerRequest::TokenizerRequest(&v6, a2);
    v3 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v8;
    v8 = v3;
    v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    v7 = v4;
    sirinluinternaltokenizer::TokenizerRequest::~TokenizerRequest((sirinluinternaltokenizer::TokenizerRequest *)&v6);
  }
  return a1;
}

BOOL sirinluinternaltokenizer::TokenizerRequest::operator==(uint64_t *a1, _QWORD *a2)
{
  unsigned __int8 *v4;
  unsigned __int8 **v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  unsigned __int8 *v10;
  _BOOL8 result;
  unsigned __int8 *v12;
  unsigned __int8 **v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  int v17;
  unsigned __int8 *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;

  v4 = (unsigned __int8 *)a1[3];
  v5 = (unsigned __int8 **)a2[3];
  if (v4)
  {
    if (!v5)
      return 0;
    v6 = v4[23];
    if ((v6 & 0x80u) == 0)
      v7 = (unsigned __int8 *)v4[23];
    else
      v7 = (unsigned __int8 *)*((_QWORD *)v4 + 1);
    v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
    v9 = (char)v8;
    if ((char)v8 < 0)
      v8 = v5[1];
    if (v7 != v8)
      return 0;
    if (v9 >= 0)
      v10 = (unsigned __int8 *)a2[3];
    else
      v10 = *v5;
    if ((v6 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v4, v10, *((_QWORD *)v4 + 1)))
        return 0;
    }
    else if (v4[23])
    {
      while (*v4 == *v10)
      {
        ++v4;
        ++v10;
        if (!--v6)
          goto LABEL_21;
      }
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
LABEL_21:
  v12 = (unsigned __int8 *)a1[2];
  v13 = (unsigned __int8 **)a2[2];
  if (!v12)
  {
    if (!v13)
      goto LABEL_38;
    return 0;
  }
  if (!v13)
    return 0;
  v14 = v12[23];
  if ((v14 & 0x80u) == 0)
    v15 = (unsigned __int8 *)v12[23];
  else
    v15 = (unsigned __int8 *)*((_QWORD *)v12 + 1);
  v16 = (unsigned __int8 *)*((unsigned __int8 *)v13 + 23);
  v17 = (char)v16;
  if ((char)v16 < 0)
    v16 = v13[1];
  if (v15 != v16)
    return 0;
  if (v17 >= 0)
    v18 = (unsigned __int8 *)a2[2];
  else
    v18 = *v13;
  if ((v14 & 0x80) != 0)
  {
    if (!memcmp(*(const void **)v12, v18, *((_QWORD *)v12 + 1)))
      goto LABEL_38;
    return 0;
  }
  if (v12[23])
  {
    while (*v12 == *v18)
    {
      ++v12;
      ++v18;
      if (!--v14)
        goto LABEL_38;
    }
    return 0;
  }
LABEL_38:
  v19 = a1[1];
  v20 = a2[1];
  result = (v19 | v20) == 0;
  if (v19)
    v21 = v20 == 0;
  else
    v21 = 1;
  if (!v21)
    return sirinluexternal::UUID::operator==(a1[1], v20);
  return result;
}

unint64_t sirinluinternaltokenizer::TokenizerRequest::hash_value(sirinluinternaltokenizer::TokenizerRequest *this)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *((_QWORD *)this + 3);
  if (v2)
    v3 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  else
    v3 = 0;
  v4 = *((_QWORD *)this + 2);
  if (v4)
    v4 = std::__string_hash<char>::operator()[abi:ne180100](v4);
  v5 = *((_QWORD *)this + 1);
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 28) & 1) != 0)
    {
      v6 = *(_QWORD *)(v5 + 8);
      if ((*(_BYTE *)(v5 + 28) & 2) != 0)
      {
LABEL_9:
        v7 = *(_QWORD *)(v5 + 16);
        if ((*(_BYTE *)(v5 + 28) & 4) != 0)
        {
LABEL_10:
          v8 = *(int *)(v5 + 24);
LABEL_14:
          v5 = v7 ^ v6 ^ v8;
          return v4 ^ v3 ^ v5;
        }
LABEL_13:
        v8 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      v6 = 0;
      if ((*(_BYTE *)(v5 + 28) & 2) != 0)
        goto LABEL_9;
    }
    v7 = 0;
    if ((*(_BYTE *)(v5 + 28) & 4) != 0)
      goto LABEL_10;
    goto LABEL_13;
  }
  return v4 ^ v3 ^ v5;
}

_QWORD *sirinluinternaltokenizer::TokenizerRequest::makeAsrId(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[1])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    *v2 = &off_1E7BB0CB8;
    v2[3] = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

BOOL SIRINLUEXTERNALCDMNluRequestReadFrom(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  SIRINLUEXTERNALTurnInput *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        v18 = objc_alloc_init(SIRINLUEXTERNALTurnInput);
        objc_storeStrong(a1 + 1, v18);
        goto LABEL_26;
      }
      if ((_DWORD)v17 == 1)
      {
        v18 = objc_alloc_init(SIRINLUEXTERNALRequestID);
        objc_storeStrong(a1 + 3, v18);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALRequestIDReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_33;
LABEL_28:
        PBReaderRecallMark();

        goto LABEL_30;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_30:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(SIRINLUEXTERNALTurnInput);
    objc_msgSend(a1, "addPreviousTurnInputs:", v18);
LABEL_26:
    if (!PBReaderPlaceMark() || (SIRINLUEXTERNALTurnInputReadFrom((uint64_t)v18, a2) & 1) == 0)
    {
LABEL_33:

      return 0;
    }
    goto LABEL_28;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sirinluexternalcdm_planner::CdmPlannerRequest::~CdmPlannerRequest(sirinluexternalcdm_planner::CdmPlannerRequest *this)
{
  sirinluexternalcdm_planner::CdmPlannerRequest::~CdmPlannerRequest(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = &off_1E7BB1CA0;
  v2 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v2)
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  v3 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  PB::Base::~Base(this);
}

uint64_t sirinluexternalcdm_planner::CdmPlannerRequest::readFrom(sirinluexternalcdm_planner::CdmPlannerRequest *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t result;
  _QWORD *v22;
  uint64_t v23;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_26;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        v22 = (_QWORD *)operator new();
        *v22 = &off_1E7BAFC20;
        v22[1] = 0;
        v22[2] = 0;
        v22[3] = 0;
        v23 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v22;
        if (v23)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
          v22 = (_QWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_QWORD *, PB::Reader *))(*v22 + 16))(v22, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else if ((v11 >> 3) == 1)
      {
        v19 = (_QWORD *)operator new();
        v19[1] = 0;
        v19[2] = 0;
        *v19 = 0;
        v20 = *((_QWORD *)this + 2);
        *((_QWORD *)this + 2) = v19;
        if (v20)
          std::default_delete<std::string>::operator()[abi:ne180100](v20);
        PB::Reader::read();
      }
      else
      {
LABEL_26:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_26;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sirinluexternalcdm_planner::CdmPlannerRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;

  v3 = this;
  if (*(_QWORD *)(this + 16))
    this = PB::Writer::write();
  v4 = *(const PB::Base **)(v3 + 8);
  if (v4)
    return PB::Writer::writeSubmessage(a2, v4);
  return this;
}

uint64_t sirinluexternalcdm_planner::CdmPlannerRequest::formatText(sirinluexternalcdm_planner::CdmPlannerRequest *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "cdm_planner_request_identifier");
  if (*((_QWORD *)this + 2))
    PB::TextFormatter::format();
  return PB::TextFormatter::endObject(a2);
}

_QWORD *sirinluexternalcdm_planner::CdmPlannerRequest::CdmPlannerRequest(_QWORD *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &off_1E7BB1CA0;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = &off_1E7BB1CA0;
  return this;
}

sirinluexternalcdm_planner::CdmPlannerRequest *sirinluexternalcdm_planner::CdmPlannerRequest::CdmPlannerRequest(sirinluexternalcdm_planner::CdmPlannerRequest *this, const sirinluexternalcdm_planner::CdmPlannerRequest *a2)
{
  sirinluexternalcdm_planner::CDMPlannerRequestIdentifier **v4;
  std::string *v5;
  std::string *v6;
  __int128 *v7;
  __int128 v8;
  uint64_t v9;
  sirinluexternalcdm_planner::CDMPlannerRequestIdentifier *v10;
  sirinluexternalcdm_planner::CDMPlannerRequestIdentifier *v11;
  sirinluexternalcdm_planner::CDMPlannerRequestIdentifier *v12;

  *(_QWORD *)this = &off_1E7BB1CA0;
  *((_QWORD *)this + 1) = 0;
  v4 = (sirinluexternalcdm_planner::CDMPlannerRequestIdentifier **)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  if (*((_QWORD *)a2 + 2))
  {
    v5 = (std::string *)operator new();
    v6 = v5;
    v7 = (__int128 *)*((_QWORD *)a2 + 2);
    if (*((char *)v7 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)v7, *((_QWORD *)v7 + 1));
    }
    else
    {
      v8 = *v7;
      v5->__r_.__value_.__r.__words[2] = *((_QWORD *)v7 + 2);
      *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v8;
    }
    v9 = *((_QWORD *)this + 2);
    *((_QWORD *)this + 2) = v6;
    if (v9)
      std::default_delete<std::string>::operator()[abi:ne180100](v9);
  }
  if (*((_QWORD *)a2 + 1))
  {
    v10 = (sirinluexternalcdm_planner::CDMPlannerRequestIdentifier *)operator new();
    v11 = sirinluexternalcdm_planner::CDMPlannerRequestIdentifier::CDMPlannerRequestIdentifier(v10, *((const sirinluexternalcdm_planner::CDMPlannerRequestIdentifier **)a2 + 1));
    v12 = *v4;
    *v4 = v11;
    if (v12)
      (*(void (**)(sirinluexternalcdm_planner::CDMPlannerRequestIdentifier *))(*(_QWORD *)v12 + 8))(v12);
  }
  return this;
}

uint64_t sirinluexternalcdm_planner::CdmPlannerRequest::operator=(uint64_t a1, const sirinluexternalcdm_planner::CdmPlannerRequest *a2)
{
  __int128 v3;
  _BYTE v5[8];
  __int128 v6;

  if ((const sirinluexternalcdm_planner::CdmPlannerRequest *)a1 != a2)
  {
    sirinluexternalcdm_planner::CdmPlannerRequest::CdmPlannerRequest((sirinluexternalcdm_planner::CdmPlannerRequest *)v5, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    v6 = v3;
    sirinluexternalcdm_planner::CdmPlannerRequest::~CdmPlannerRequest((sirinluexternalcdm_planner::CdmPlannerRequest *)v5);
  }
  return a1;
}

uint64_t sirinluexternalcdm_planner::swap(uint64_t this, sirinluexternalcdm_planner::CdmPlannerRequest *a2, sirinluexternalcdm_planner::CdmPlannerRequest *a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v3;
  v4 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  return this;
}

_QWORD *sirinluexternalcdm_planner::CdmPlannerRequest::CdmPlannerRequest(_QWORD *a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  a1[1] = 0;
  v4 = a1 + 1;
  *a1 = &off_1E7BB1CA0;
  a1[2] = 0;
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v6 = a1[2];
  a1[2] = v5;
  if (v6)
    std::default_delete<std::string>::operator()[abi:ne180100](v6);
  v7 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v8 = *v4;
  *v4 = v7;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  return a1;
}

uint64_t sirinluexternalcdm_planner::CdmPlannerRequest::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v5;
  __int128 v6;

  if (a1 != a2)
  {
    sirinluexternalcdm_planner::CdmPlannerRequest::CdmPlannerRequest(&v5, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    v6 = v3;
    sirinluexternalcdm_planner::CdmPlannerRequest::~CdmPlannerRequest((sirinluexternalcdm_planner::CdmPlannerRequest *)&v5);
  }
  return a1;
}

uint64_t sirinluexternalcdm_planner::CdmPlannerRequest::operator==(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v4;
  unsigned __int8 **v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  unsigned __int8 *v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;

  v4 = *(unsigned __int8 **)(a1 + 16);
  v5 = *(unsigned __int8 ***)(a2 + 16);
  if (!v4)
  {
    if (!v5)
      goto LABEL_21;
    return 0;
  }
  if (!v5)
    return 0;
  v6 = v4[23];
  if ((v6 & 0x80u) == 0)
    v7 = (unsigned __int8 *)v4[23];
  else
    v7 = (unsigned __int8 *)*((_QWORD *)v4 + 1);
  v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
  v9 = (char)v8;
  if ((char)v8 < 0)
    v8 = v5[1];
  if (v7 != v8)
    return 0;
  if (v9 >= 0)
    v10 = *(unsigned __int8 **)(a2 + 16);
  else
    v10 = *v5;
  if ((v6 & 0x80) != 0)
  {
    if (!memcmp(*(const void **)v4, v10, *((_QWORD *)v4 + 1)))
      goto LABEL_21;
    return 0;
  }
  if (v4[23])
  {
    while (*v4 == *v10)
    {
      ++v4;
      ++v10;
      if (!--v6)
        goto LABEL_21;
    }
    return 0;
  }
LABEL_21:
  v12 = *(_QWORD *)(a1 + 8);
  v13 = *(_QWORD *)(a2 + 8);
  result = (v12 | v13) == 0;
  if (v12)
    v14 = v13 == 0;
  else
    v14 = 1;
  if (!v14)
    return sirinluexternalcdm_planner::CDMPlannerRequestIdentifier::operator==(*(_QWORD **)(a1 + 8), (_QWORD *)v13);
  return result;
}

unint64_t sirinluexternalcdm_planner::CdmPlannerRequest::hash_value(sirinluexternalcdm_planner::CdmPlannerRequest *this)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *((_QWORD *)this + 2);
  if (v2)
    v3 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  else
    v3 = 0;
  v4 = *((_QWORD *)this + 1);
  if (v4)
    v4 = sirinluexternalcdm_planner::CDMPlannerRequestIdentifier::hash_value((sirinluexternalcdm_planner::CDMPlannerRequestIdentifier *)v4);
  return v4 ^ v3;
}

_QWORD *sirinluexternalcdm_planner::CdmPlannerRequest::makeCdmPlannerRequestIdentifier(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[1])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    *v2 = &off_1E7BAFC20;
    v2[1] = 0;
    v2[2] = 0;
    v2[3] = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

uint64_t SIRINLUINTERNALSSUSSUEncodingResultReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (!*(_BYTE *)(a2 + *v5))
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *v5;
          v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *v5;
      v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(_BYTE *)(a2 + v16))
        v10 = 0;
LABEL_14:
      v18 = v10 & 7;
      if (v17 || v18 == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 32;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
          goto LABEL_24;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
LABEL_24:
          v22 = *(void **)(a1 + v21);
          *(_QWORD *)(a1 + v21) = v20;

          goto LABEL_25;
        case 4u:
          if (v18 == 2)
          {
            result = PBReaderPlaceMark();
            if (!(_DWORD)result)
              return result;
            while (1)
            {
              v23 = (unint64_t *)(a2 + *v3);
              v24 = *v23;
              v25 = *(_QWORD *)(a2 + *v4);
              if (*v23 >= v25)
                break;
              v26 = *v5;
              if (*(_BYTE *)(a2 + v26))
                break;
              if (v24 > 0xFFFFFFFFFFFFFFFBLL || v24 + 4 > v25)
                *(_BYTE *)(a2 + v26) = 1;
              else
                *v23 = v24 + 4;
              PBRepeatedFloatAdd();
            }
            PBReaderRecallMark();
          }
          else
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(_QWORD *)(a2 + *v4))
              *(_QWORD *)(a2 + v27) = v28 + 4;
            else
              *(_BYTE *)(a2 + v16) = 1;
            PBRepeatedFloatAdd();
          }
LABEL_25:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) != 0)
            goto LABEL_25;
          return 0;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SIRINLUINTERNALQUERYREWRITEQRInteractionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  SIRINLUINTERNALQUERYREWRITEQRUtterance *v17;
  uint64_t result;
  uint64_t v19;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(SIRINLUINTERNALQUERYREWRITEQRUtterance);
        objc_msgSend((id)a1, "addOriginalUtterances:", v17);
        if (PBReaderPlaceMark()
          && (SIRINLUINTERNALQUERYREWRITEQRUtteranceReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
          goto LABEL_26;
        }
        goto LABEL_52;
      case 2u:
        v17 = objc_alloc_init(SIRINLUINTERNALToken);
        objc_msgSend((id)a1, "addSiriResponse:", v17);
        if (PBReaderPlaceMark() && (SIRINLUINTERNALTokenReadFrom(v17, a2) & 1) != 0)
        {
LABEL_26:
          PBReaderRecallMark();

LABEL_50:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_52:

        return 0;
      case 3u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v19;

        goto LABEL_50;
      case 4u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 44) |= 2u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if (v26 < 0)
            {
              v21 += 7;
              v14 = v22++ >= 9;
              if (v14)
              {
                v23 = 0;
                goto LABEL_45;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_45:
        *(_BYTE *)(a1 + 40) = v23 != 0;
        goto LABEL_50;
      case 5u:
        v27 = 0;
        v28 = 0;
        v29 = 0;
        *(_BYTE *)(a1 + 44) |= 1u;
        while (2)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              v14 = v28++ >= 9;
              if (v14)
              {
                v29 = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v29 = 0;
LABEL_49:
        *(_QWORD *)(a1 + 8) = v29;
        goto LABEL_50;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_50;
    }
  }
}

void sirinluinternal::RewriteHypothesis::~RewriteHypothesis(sirinluinternal::RewriteHypothesis *this)
{
  sirinluinternal::RewriteHypothesis::~RewriteHypothesis(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = &off_1E7BB1D30;
  v2 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v2)
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  v3 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  PB::Base::~Base(this);
}

uint64_t sirinluinternal::RewriteHypothesis::readFrom(sirinluinternal::RewriteHypothesis *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  unint64_t v36;
  char v37;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (1)
  {
    v8 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      break;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
      v13 = *(_BYTE *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0)
        break;
      v9 += 7;
      v2 = v12;
      v14 = v10++ > 8;
      if (v14)
        goto LABEL_19;
    }
LABEL_25:
    if ((v11 & 7) == 4)
    {
      v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        v21 = (_QWORD *)operator new();
        *v21 = &off_1E7BB0CB8;
        v21[3] = 0;
        v22 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v21;
        if (v22)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
          v21 = (_QWORD *)*((_QWORD *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_QWORD *, PB::Reader *))(*v21 + 16))(v21, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
LABEL_20:
        v2 = *((_QWORD *)a2 + 1);
        v3 = *((_QWORD *)a2 + 2);
        v4 = *((unsigned __int8 *)a2 + 24);
        if (v2 >= v3 || v4 != 0)
          return v4 == 0;
        break;
      case 2u:
        v23 = (_QWORD *)operator new();
        v23[1] = 0;
        v23[2] = 0;
        *v23 = 0;
        v24 = *((_QWORD *)this + 3);
        *((_QWORD *)this + 3) = v23;
        if (v24)
          std::default_delete<std::string>::operator()[abi:ne180100](v24);
        PB::Reader::read();
        goto LABEL_20;
      case 3u:
        *((_BYTE *)this + 36) |= 1u;
        v25 = *((_QWORD *)a2 + 1);
        if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *((_QWORD *)a2 + 2))
        {
          *((_QWORD *)this + 2) = *(_QWORD *)(*(_QWORD *)a2 + v25);
          *((_QWORD *)a2 + 1) += 8;
        }
        else
        {
          *((_BYTE *)a2 + 24) = 1;
        }
        goto LABEL_20;
      case 4u:
        *((_BYTE *)this + 36) |= 2u;
        v26 = *((_QWORD *)a2 + 1);
        v27 = *((_QWORD *)a2 + 2);
        v28 = *(_QWORD *)a2;
        if (v26 <= 0xFFFFFFFFFFFFFFF5 && v26 + 10 <= v27)
        {
          v29 = 0;
          v30 = 0;
          v31 = 0;
          do
          {
            v32 = v26 + 1;
            *((_QWORD *)a2 + 1) = v26 + 1;
            v33 = *(_BYTE *)(v28 + v26);
            v31 |= (unint64_t)(v33 & 0x7F) << v29;
            if ((v33 & 0x80) == 0)
              goto LABEL_56;
            v29 += 7;
            v26 = v32;
            v14 = v30++ > 8;
          }
          while (!v14);
LABEL_51:
          LODWORD(v31) = 0;
          goto LABEL_56;
        }
        v34 = 0;
        v35 = 0;
        v31 = 0;
        if (v27 <= v26)
          v27 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v27 == v26)
          {
            LODWORD(v31) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v36 = v26 + 1;
            v37 = *(_BYTE *)(v28 + v26);
            *((_QWORD *)a2 + 1) = v36;
            v31 |= (unint64_t)(v37 & 0x7F) << v34;
            if (v37 < 0)
            {
              v34 += 7;
              v26 = v36;
              v14 = v35++ > 8;
              if (v14)
                goto LABEL_51;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v31) = 0;
          }
          break;
        }
LABEL_56:
        *((_DWORD *)this + 8) = v31;
        goto LABEL_20;
      default:
        goto LABEL_19;
    }
  }
  v15 = 0;
  v16 = 0;
  v11 = 0;
  if (v2 > v3)
    v3 = v2;
  do
  {
    if (v3 == v2)
    {
      v4 = 1;
      *((_BYTE *)a2 + 24) = 1;
      return v4 == 0;
    }
    v17 = v2 + 1;
    v18 = *(_BYTE *)(v8 + v2);
    *((_QWORD *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0)
      goto LABEL_25;
    v15 += 7;
    v2 = v17;
    v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  result = PB::Reader::skip(a2);
  if ((_DWORD)result)
    goto LABEL_20;
  return result;
}

uint64_t sirinluinternal::RewriteHypothesis::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  char v5;

  v3 = this;
  v4 = *(const PB::Base **)(this + 8);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  if (*(_QWORD *)(v3 + 24))
    this = PB::Writer::write();
  v5 = *(_BYTE *)(v3 + 36);
  if ((v5 & 1) != 0)
  {
    this = PB::Writer::write(a2, *(double *)(v3 + 16));
    v5 = *(_BYTE *)(v3 + 36);
  }
  if ((v5 & 2) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

uint64_t sirinluinternal::RewriteHypothesis::formatText(sirinluinternal::RewriteHypothesis *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;
  char v6;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "asr_id");
  v6 = *((_BYTE *)this + 36);
  if ((v6 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "confidence", *((double *)this + 2));
    v6 = *((_BYTE *)this + 36);
  }
  if ((v6 & 2) != 0)
    PB::TextFormatter::format(a2, "rewrite_type");
  if (*((_QWORD *)this + 3))
    PB::TextFormatter::format();
  return PB::TextFormatter::endObject(a2);
}

_QWORD *sirinluinternal::RewriteHypothesis::RewriteHypothesis(_QWORD *this)
{
  *this = &off_1E7BB1D30;
  this[1] = 0;
  this[3] = 0;
  this[4] = 0;
  return this;
}

{
  *this = &off_1E7BB1D30;
  this[1] = 0;
  this[3] = 0;
  this[4] = 0;
  return this;
}

sirinluinternal::RewriteHypothesis *sirinluinternal::RewriteHypothesis::RewriteHypothesis(sirinluinternal::RewriteHypothesis *this, const sirinluexternal::UUID **a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  std::string *v8;
  std::string *v9;
  const sirinluexternal::UUID *v10;
  __int128 v11;
  uint64_t v12;
  char v13;
  const sirinluexternal::UUID *v14;
  int v15;

  *(_QWORD *)this = &off_1E7BB1D30;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 3) = 0;
  v4 = (uint64_t *)((char *)this + 24);
  *((_QWORD *)this + 4) = 0;
  if (a2[1])
  {
    v5 = operator new();
    v6 = sirinluexternal::UUID::UUID(v5, a2[1]);
    v7 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v6;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
  if (a2[3])
  {
    v8 = (std::string *)operator new();
    v9 = v8;
    v10 = a2[3];
    if (*((char *)v10 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v8, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
    }
    else
    {
      v11 = *(_OWORD *)v10;
      v8->__r_.__value_.__r.__words[2] = *((_QWORD *)v10 + 2);
      *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v11;
    }
    v12 = *v4;
    *v4 = (uint64_t)v9;
    if (v12)
      std::default_delete<std::string>::operator()[abi:ne180100](v12);
  }
  v13 = *((_BYTE *)a2 + 36);
  if ((v13 & 1) != 0)
  {
    v14 = a2[2];
    *((_BYTE *)this + 36) |= 1u;
    *((_QWORD *)this + 2) = v14;
    v13 = *((_BYTE *)a2 + 36);
  }
  if ((v13 & 2) != 0)
  {
    v15 = *((_DWORD *)a2 + 8);
    *((_BYTE *)this + 36) |= 2u;
    *((_DWORD *)this + 8) = v15;
  }
  return this;
}

const sirinluexternal::UUID **sirinluinternal::RewriteHypothesis::operator=(const sirinluexternal::UUID **a1, const sirinluexternal::UUID **a2)
{
  const sirinluexternal::UUID *v3;
  const sirinluexternal::UUID *v4;
  const sirinluexternal::UUID *v5;
  const sirinluexternal::UUID *v6;
  char v8[8];
  const sirinluexternal::UUID *v9;
  const sirinluexternal::UUID *v10;
  const sirinluexternal::UUID *v11;
  const sirinluexternal::UUID *v12;

  if (a1 != a2)
  {
    sirinluinternal::RewriteHypothesis::RewriteHypothesis((sirinluinternal::RewriteHypothesis *)v8, a2);
    v3 = a1[1];
    a1[1] = v9;
    v9 = v3;
    v4 = a1[3];
    a1[3] = v11;
    v11 = v4;
    v5 = a1[2];
    a1[2] = v10;
    v10 = v5;
    v6 = a1[4];
    a1[4] = v12;
    v12 = v6;
    sirinluinternal::RewriteHypothesis::~RewriteHypothesis((sirinluinternal::RewriteHypothesis *)v8);
  }
  return a1;
}

double sirinluinternal::swap(sirinluinternal *this, sirinluinternal::RewriteHypothesis *a2, sirinluinternal::RewriteHypothesis *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  double result;

  v3 = *((_DWORD *)this + 9);
  *((_DWORD *)this + 9) = *((_DWORD *)a2 + 9);
  *((_DWORD *)a2 + 9) = v3;
  v4 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  v5 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v5;
  result = *((double *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((double *)a2 + 2) = result;
  LODWORD(v5) = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v5;
  return result;
}

uint64_t sirinluinternal::RewriteHypothesis::RewriteHypothesis(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = &off_1E7BB1D30;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a2 + 36) = 0;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 24) = 0;
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v6;
  if (v7)
    std::default_delete<std::string>::operator()[abi:ne180100](v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  return a1;
}

_QWORD *sirinluinternal::RewriteHypothesis::operator=(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[8];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != (_QWORD *)a2)
  {
    sirinluinternal::RewriteHypothesis::RewriteHypothesis((uint64_t)v8, a2);
    v3 = a1[1];
    a1[1] = v9;
    v9 = v3;
    v4 = a1[3];
    a1[3] = v11;
    v11 = v4;
    v5 = a1[2];
    a1[2] = v10;
    v10 = v5;
    v6 = a1[4];
    a1[4] = v12;
    v12 = v6;
    sirinluinternal::RewriteHypothesis::~RewriteHypothesis((sirinluinternal::RewriteHypothesis *)v8);
  }
  return a1;
}

BOOL sirinluinternal::RewriteHypothesis::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned __int8 **v7;
  uint64_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  int v11;
  unsigned __int8 *v12;
  _BOOL8 result;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !sirinluexternal::UUID::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v6 = *(unsigned __int8 **)(a1 + 24);
  v7 = *(unsigned __int8 ***)(a2 + 24);
  if (v6)
  {
    if (!v7)
      return 0;
    v8 = v6[23];
    if ((v8 & 0x80u) == 0)
      v9 = (unsigned __int8 *)v6[23];
    else
      v9 = (unsigned __int8 *)*((_QWORD *)v6 + 1);
    v10 = (unsigned __int8 *)*((unsigned __int8 *)v7 + 23);
    v11 = (char)v10;
    if ((char)v10 < 0)
      v10 = v7[1];
    if (v9 != v10)
      return 0;
    if (v11 >= 0)
      v12 = *(unsigned __int8 **)(a2 + 24);
    else
      v12 = *v7;
    if ((v8 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v6, v12, *((_QWORD *)v6 + 1)))
        return 0;
    }
    else if (v6[23])
    {
      while (*v6 == *v12)
      {
        ++v6;
        ++v12;
        if (!--v8)
          goto LABEL_23;
      }
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
LABEL_23:
  if ((*(_BYTE *)(a1 + 36) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 36) & 1) == 0 || *(double *)(a1 + 16) != *(double *)(a2 + 16))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 36) & 1) != 0)
  {
    return 0;
  }
  result = (*(_BYTE *)(a2 + 36) & 2) == 0;
  if ((*(_BYTE *)(a1 + 36) & 2) == 0)
    return result;
  return (*(_BYTE *)(a2 + 36) & 2) != 0 && *(_DWORD *)(a1 + 32) == *(_DWORD *)(a2 + 32);
}

unint64_t sirinluinternal::RewriteHypothesis::hash_value(sirinluinternal::RewriteHypothesis *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  uint64_t v9;

  v2 = *((_QWORD *)this + 1);
  if (!v2)
  {
    v6 = 0;
    goto LABEL_11;
  }
  if ((*(_BYTE *)(v2 + 28) & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)(v2 + 28) & 2) != 0)
      goto LABEL_4;
LABEL_8:
    v4 = 0;
    if ((*(_BYTE *)(v2 + 28) & 4) != 0)
      goto LABEL_5;
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v3 = *(_QWORD *)(v2 + 8);
  if ((*(_BYTE *)(v2 + 28) & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)(v2 + 16);
  if ((*(_BYTE *)(v2 + 28) & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = *(int *)(v2 + 24);
LABEL_10:
  v6 = v4 ^ v3 ^ v5;
LABEL_11:
  v7 = *((_QWORD *)this + 3);
  if (v7)
    v7 = std::__string_hash<char>::operator()[abi:ne180100](v7);
  if ((*((_BYTE *)this + 36) & 1) != 0)
  {
    v8 = *((double *)this + 2);
    if (v8 == 0.0)
      v8 = 0.0;
    if ((*((_BYTE *)this + 36) & 2) != 0)
      goto LABEL_15;
LABEL_19:
    v9 = 0;
    return v7 ^ v6 ^ *(_QWORD *)&v8 ^ v9;
  }
  v8 = 0.0;
  if ((*((_BYTE *)this + 36) & 2) == 0)
    goto LABEL_19;
LABEL_15:
  v9 = *((int *)this + 8);
  return v7 ^ v6 ^ *(_QWORD *)&v8 ^ v9;
}

_QWORD *sirinluinternal::RewriteHypothesis::makeAsrId(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[1])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    *v2 = &off_1E7BB0CB8;
    v2[3] = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void sirinluinternal::SpanDataForNamedCaptureGroup::~SpanDataForNamedCaptureGroup(sirinluinternal::SpanDataForNamedCaptureGroup *this)
{
  sirinluinternal::SpanDataForNamedCaptureGroup::~SpanDataForNamedCaptureGroup(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E7BB1D80;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  PB::Base::~Base(this);
}

uint64_t sirinluinternal::SpanDataForNamedCaptureGroup::readFrom(sirinluinternal::SpanDataForNamedCaptureGroup *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  unint64_t v46;
  char v47;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_27;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v19 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        *((_BYTE *)this + 24) |= 2u;
        v24 = *((_QWORD *)a2 + 1);
        v25 = *((_QWORD *)a2 + 2);
        v26 = *(_QWORD *)a2;
        if (v24 > 0xFFFFFFFFFFFFFFF5 || v24 + 10 > v25)
        {
          v40 = 0;
          v41 = 0;
          v29 = 0;
          if (v25 <= v24)
            v25 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v25 == v24)
            {
              LODWORD(v29) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_64;
            }
            v42 = v24 + 1;
            v43 = *(_BYTE *)(v26 + v24);
            *((_QWORD *)a2 + 1) = v42;
            v29 |= (unint64_t)(v43 & 0x7F) << v40;
            if ((v43 & 0x80) == 0)
              break;
            v40 += 7;
            v24 = v42;
            v14 = v41++ > 8;
            if (v14)
            {
LABEL_53:
              LODWORD(v29) = 0;
              goto LABEL_64;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v29) = 0;
        }
        else
        {
          v27 = 0;
          v28 = 0;
          v29 = 0;
          while (1)
          {
            v30 = v24 + 1;
            *((_QWORD *)a2 + 1) = v24 + 1;
            v31 = *(_BYTE *)(v26 + v24);
            v29 |= (unint64_t)(v31 & 0x7F) << v27;
            if ((v31 & 0x80) == 0)
              break;
            v27 += 7;
            v24 = v30;
            v14 = v28++ > 8;
            if (v14)
              goto LABEL_53;
          }
        }
LABEL_64:
        *((_DWORD *)this + 5) = v29;
      }
      else if ((_DWORD)v19 == 2)
      {
        *((_BYTE *)this + 24) |= 1u;
        v32 = *((_QWORD *)a2 + 1);
        v33 = *((_QWORD *)a2 + 2);
        v34 = *(_QWORD *)a2;
        if (v32 > 0xFFFFFFFFFFFFFFF5 || v32 + 10 > v33)
        {
          v44 = 0;
          v45 = 0;
          v37 = 0;
          if (v33 <= v32)
            v33 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v33 == v32)
            {
              LODWORD(v37) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_68;
            }
            v46 = v32 + 1;
            v47 = *(_BYTE *)(v34 + v32);
            *((_QWORD *)a2 + 1) = v46;
            v37 |= (unint64_t)(v47 & 0x7F) << v44;
            if ((v47 & 0x80) == 0)
              break;
            v44 += 7;
            v32 = v46;
            v14 = v45++ > 8;
            if (v14)
            {
LABEL_60:
              LODWORD(v37) = 0;
              goto LABEL_68;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v37) = 0;
        }
        else
        {
          v35 = 0;
          v36 = 0;
          v37 = 0;
          while (1)
          {
            v38 = v32 + 1;
            *((_QWORD *)a2 + 1) = v32 + 1;
            v39 = *(_BYTE *)(v34 + v32);
            v37 |= (unint64_t)(v39 & 0x7F) << v35;
            if ((v39 & 0x80) == 0)
              break;
            v35 += 7;
            v32 = v38;
            v14 = v36++ > 8;
            if (v14)
              goto LABEL_60;
          }
        }
LABEL_68:
        *((_DWORD *)this + 4) = v37;
      }
      else if ((_DWORD)v19 == 1)
      {
        v20 = (_QWORD *)operator new();
        v20[1] = 0;
        v20[2] = 0;
        *v20 = 0;
        v21 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v20;
        if (v21)
          std::default_delete<std::string>::operator()[abi:ne180100](v21);
        PB::Reader::read();
      }
      else
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0)
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v17 = v2 + 1;
      v18 = *(_BYTE *)(v8 + v2);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v2 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_27;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sirinluinternal::SpanDataForNamedCaptureGroup::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  if (*(_QWORD *)(this + 8))
    this = PB::Writer::write();
  v4 = *(_BYTE *)(v3 + 24);
  if ((v4 & 1) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v4 = *(_BYTE *)(v3 + 24);
  }
  if ((v4 & 2) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

uint64_t sirinluinternal::SpanDataForNamedCaptureGroup::formatText(sirinluinternal::SpanDataForNamedCaptureGroup *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(a2, a3);
  if (*((_QWORD *)this + 1))
    PB::TextFormatter::format();
  v5 = *((_BYTE *)this + 24);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "target_node_idx");
    v5 = *((_BYTE *)this + 24);
  }
  if ((v5 & 2) != 0)
    PB::TextFormatter::format(a2, "target_uda_idx");
  return PB::TextFormatter::endObject(a2);
}

uint64_t sirinluinternal::SpanDataForNamedCaptureGroup::SpanDataForNamedCaptureGroup(uint64_t this)
{
  *(_QWORD *)this = &off_1E7BB1D80;
  *(_QWORD *)(this + 8) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

{
  *(_QWORD *)this = &off_1E7BB1D80;
  *(_QWORD *)(this + 8) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

sirinluinternal::SpanDataForNamedCaptureGroup *sirinluinternal::SpanDataForNamedCaptureGroup::SpanDataForNamedCaptureGroup(sirinluinternal::SpanDataForNamedCaptureGroup *this, const sirinluinternal::SpanDataForNamedCaptureGroup *a2)
{
  std::string *v4;
  std::string *v5;
  __int128 *v6;
  __int128 v7;
  uint64_t v8;
  char v9;
  int v10;
  int v11;

  *(_QWORD *)this = &off_1E7BB1D80;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 6) = 0;
  if (*((_QWORD *)a2 + 1))
  {
    v4 = (std::string *)operator new();
    v5 = v4;
    v6 = (__int128 *)*((_QWORD *)a2 + 1);
    if (*((char *)v6 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
    }
    else
    {
      v7 = *v6;
      v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
      *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
    }
    v8 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v5;
    if (v8)
      std::default_delete<std::string>::operator()[abi:ne180100](v8);
  }
  v9 = *((_BYTE *)a2 + 24);
  if ((v9 & 1) != 0)
  {
    v10 = *((_DWORD *)a2 + 4);
    *((_BYTE *)this + 24) |= 1u;
    *((_DWORD *)this + 4) = v10;
    v9 = *((_BYTE *)a2 + 24);
  }
  if ((v9 & 2) != 0)
  {
    v11 = *((_DWORD *)a2 + 5);
    *((_BYTE *)this + 24) |= 2u;
    *((_DWORD *)this + 5) = v11;
  }
  return this;
}

uint64_t sirinluinternal::SpanDataForNamedCaptureGroup::operator=(uint64_t a1, const sirinluinternal::SpanDataForNamedCaptureGroup *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;

  if ((const sirinluinternal::SpanDataForNamedCaptureGroup *)a1 != a2)
  {
    sirinluinternal::SpanDataForNamedCaptureGroup::SpanDataForNamedCaptureGroup((sirinluinternal::SpanDataForNamedCaptureGroup *)&v7, a2);
    v3 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = v10;
    v10 = v3;
    v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v8;
    v8 = v4;
    v5 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v9;
    v9 = v5;
    sirinluinternal::SpanDataForNamedCaptureGroup::~SpanDataForNamedCaptureGroup((sirinluinternal::SpanDataForNamedCaptureGroup *)&v7);
  }
  return a1;
}

uint64_t sirinluinternal::swap(uint64_t this, sirinluinternal::SpanDataForNamedCaptureGroup *a2, sirinluinternal::SpanDataForNamedCaptureGroup *a3)
{
  int v3;
  uint64_t v4;

  v3 = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v3;
  v4 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v4;
  return this;
}

uint64_t sirinluinternal::SpanDataForNamedCaptureGroup::SpanDataForNamedCaptureGroup(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = &off_1E7BB1D80;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  if (v5)
    std::default_delete<std::string>::operator()[abi:ne180100](v5);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  return a1;
}

uint64_t sirinluinternal::SpanDataForNamedCaptureGroup::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[3];
  int v11;

  if (a1 != a2)
  {
    v3 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    v4 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    v5 = *(_DWORD *)(a1 + 24);
    v6 = *(_QWORD *)(a2 + 16);
    v7 = *(_QWORD *)(a1 + 8);
    v8 = *(_QWORD *)(a1 + 16);
    *(_DWORD *)(a1 + 24) = v3;
    v11 = v5;
    *(_QWORD *)(a1 + 8) = v4;
    v10[0] = &off_1E7BB1D80;
    v10[1] = v7;
    *(_QWORD *)(a1 + 16) = v6;
    v10[2] = v8;
    sirinluinternal::SpanDataForNamedCaptureGroup::~SpanDataForNamedCaptureGroup((sirinluinternal::SpanDataForNamedCaptureGroup *)v10);
  }
  return a1;
}

BOOL sirinluinternal::SpanDataForNamedCaptureGroup::operator==(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v4;
  unsigned __int8 **v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  unsigned __int8 *v10;
  _BOOL8 result;

  v4 = *(unsigned __int8 **)(a1 + 8);
  v5 = *(unsigned __int8 ***)(a2 + 8);
  if (v4)
  {
    if (!v5)
      return 0;
    v6 = v4[23];
    if ((v6 & 0x80u) == 0)
      v7 = (unsigned __int8 *)v4[23];
    else
      v7 = (unsigned __int8 *)*((_QWORD *)v4 + 1);
    v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
    v9 = (char)v8;
    if ((char)v8 < 0)
      v8 = v5[1];
    if (v7 != v8)
      return 0;
    if (v9 >= 0)
      v10 = *(unsigned __int8 **)(a2 + 8);
    else
      v10 = *v5;
    if ((v6 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v4, v10, *((_QWORD *)v4 + 1)))
        return 0;
    }
    else if (v4[23])
    {
      while (*v4 == *v10)
      {
        ++v4;
        ++v10;
        if (!--v6)
          goto LABEL_18;
      }
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
LABEL_18:
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 24) & 1) == 0 || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 24) & 1) != 0)
  {
    return 0;
  }
  result = (*(_BYTE *)(a2 + 24) & 2) == 0;
  if ((*(_BYTE *)(a1 + 24) & 2) == 0)
    return result;
  return (*(_BYTE *)(a2 + 24) & 2) != 0 && *(_DWORD *)(a1 + 20) == *(_DWORD *)(a2 + 20);
}

unint64_t sirinluinternal::SpanDataForNamedCaptureGroup::hash_value(sirinluinternal::SpanDataForNamedCaptureGroup *this)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *((_QWORD *)this + 1);
  if (v2)
    v2 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  if ((*((_BYTE *)this + 24) & 1) != 0)
  {
    v3 = *((int *)this + 4);
    if ((*((_BYTE *)this + 24) & 2) != 0)
      goto LABEL_5;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v3 = 0;
  if ((*((_BYTE *)this + 24) & 2) == 0)
    goto LABEL_7;
LABEL_5:
  v4 = *((int *)this + 5);
  return v3 ^ v2 ^ v4;
}

void sirinluinternal::NLv4EmbeddingTensor::~NLv4EmbeddingTensor(sirinluinternal::NLv4EmbeddingTensor *this)
{
  sirinluinternal::NLv4EmbeddingTensor::~NLv4EmbeddingTensor(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  void *v3;

  *(_QWORD *)this = &off_1E7BB1DD0;
  v2 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v2)
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  v3 = (void *)*((_QWORD *)this + 1);
  if (v3)
  {
    *((_QWORD *)this + 2) = v3;
    operator delete(v3);
  }
  PB::Base::~Base(this);
}

BOOL sirinluinternal::NLv4EmbeddingTensor::readFrom(sirinluinternal::NLv4EmbeddingTensor *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  _DWORD *v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _DWORD *v31;
  int v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  _QWORD *v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  _DWORD *v62;
  char v63;
  unsigned int v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  unint64_t v69;
  char v70;
  char v71;
  unsigned int v72;
  unint64_t v73;
  char v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  _DWORD *v81;
  int v82;
  unint64_t v83;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (2)
  {
    v8 = *(_QWORD *)a2;
    if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3)
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_19;
      }
LABEL_25:
      if ((v11 & 7) != 4)
      {
        switch((v11 >> 3))
        {
          case 1u:
            if ((v11 & 7) == 2)
            {
              if ((PB::Reader::placeMark() & 1) != 0)
                return 0;
              v20 = *((_QWORD *)a2 + 1);
              v21 = *((_QWORD *)a2 + 2);
              while (v20 < v21 && !*((_BYTE *)a2 + 24))
              {
                v23 = (char *)*((_QWORD *)this + 2);
                v22 = *((_QWORD *)this + 3);
                if ((unint64_t)v23 >= v22)
                {
                  v25 = (char *)*((_QWORD *)this + 1);
                  v26 = (v23 - v25) >> 2;
                  v27 = v26 + 1;
                  if ((unint64_t)(v26 + 1) >> 62)
                    goto LABEL_134;
                  v28 = v22 - (_QWORD)v25;
                  if (v28 >> 1 > v27)
                    v27 = v28 >> 1;
                  if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL)
                    v29 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v29 = v27;
                  if (v29)
                  {
                    v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v29);
                    v25 = (char *)*((_QWORD *)this + 1);
                    v23 = (char *)*((_QWORD *)this + 2);
                  }
                  else
                  {
                    v30 = 0;
                  }
                  v31 = (_DWORD *)(v29 + 4 * v26);
                  *v31 = 0;
                  v24 = v31 + 1;
                  while (v23 != v25)
                  {
                    v32 = *((_DWORD *)v23 - 1);
                    v23 -= 4;
                    *--v31 = v32;
                  }
                  *((_QWORD *)this + 1) = v31;
                  *((_QWORD *)this + 2) = v24;
                  *((_QWORD *)this + 3) = v29 + 4 * v30;
                  if (v25)
                    operator delete(v25);
                }
                else
                {
                  *(_DWORD *)v23 = 0;
                  v24 = v23 + 4;
                }
                *((_QWORD *)this + 2) = v24;
                v33 = *((_QWORD *)a2 + 1);
                if (v33 > 0xFFFFFFFFFFFFFFFBLL || v33 + 4 > *((_QWORD *)a2 + 2))
                {
                  *((_BYTE *)a2 + 24) = 1;
                  break;
                }
                *(v24 - 1) = *(_DWORD *)(*(_QWORD *)a2 + v33);
                v21 = *((_QWORD *)a2 + 2);
                v20 = *((_QWORD *)a2 + 1) + 4;
                *((_QWORD *)a2 + 1) = v20;
              }
              PB::Reader::recallMark();
            }
            else
            {
              v61 = (char *)*((_QWORD *)this + 2);
              v60 = *((_QWORD *)this + 3);
              if ((unint64_t)v61 >= v60)
              {
                v75 = (char *)*((_QWORD *)this + 1);
                v76 = (v61 - v75) >> 2;
                v77 = v76 + 1;
                if ((unint64_t)(v76 + 1) >> 62)
LABEL_134:
                  std::vector<std::string>::__throw_length_error[abi:ne180100]();
                v78 = v60 - (_QWORD)v75;
                if (v78 >> 1 > v77)
                  v77 = v78 >> 1;
                if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFFCLL)
                  v79 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v79 = v77;
                if (v79)
                {
                  v79 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v79);
                  v75 = (char *)*((_QWORD *)this + 1);
                  v61 = (char *)*((_QWORD *)this + 2);
                }
                else
                {
                  v80 = 0;
                }
                v81 = (_DWORD *)(v79 + 4 * v76);
                *v81 = 0;
                v62 = v81 + 1;
                while (v61 != v75)
                {
                  v82 = *((_DWORD *)v61 - 1);
                  v61 -= 4;
                  *--v81 = v82;
                }
                *((_QWORD *)this + 1) = v81;
                *((_QWORD *)this + 2) = v62;
                *((_QWORD *)this + 3) = v79 + 4 * v80;
                if (v75)
                  operator delete(v75);
              }
              else
              {
                *(_DWORD *)v61 = 0;
                v62 = v61 + 4;
              }
              *((_QWORD *)this + 2) = v62;
              v83 = *((_QWORD *)a2 + 1);
              if (v83 <= 0xFFFFFFFFFFFFFFFBLL && v83 + 4 <= *((_QWORD *)a2 + 2))
              {
                *(v62 - 1) = *(_DWORD *)(*(_QWORD *)a2 + v83);
                *((_QWORD *)a2 + 1) += 4;
              }
              else
              {
                *((_BYTE *)a2 + 24) = 1;
              }
            }
LABEL_20:
            v2 = *((_QWORD *)a2 + 1);
            v3 = *((_QWORD *)a2 + 2);
            v4 = *((unsigned __int8 *)a2 + 24);
            if (v2 >= v3 || v4 != 0)
              return v4 == 0;
            continue;
          case 2u:
            *((_BYTE *)this + 64) |= 4u;
            v34 = *((_QWORD *)a2 + 1);
            v35 = *((_QWORD *)a2 + 2);
            v36 = *(_QWORD *)a2;
            if (v34 <= 0xFFFFFFFFFFFFFFF5 && v34 + 10 <= v35)
            {
              v37 = 0;
              v38 = 0;
              v39 = 0;
              do
              {
                v40 = v34 + 1;
                *((_QWORD *)a2 + 1) = v34 + 1;
                v41 = *(_BYTE *)(v36 + v34);
                v39 |= (unint64_t)(v41 & 0x7F) << v37;
                if ((v41 & 0x80) == 0)
                  goto LABEL_111;
                v37 += 7;
                v34 = v40;
                v14 = v38++ > 8;
              }
              while (!v14);
LABEL_83:
              v39 = 0;
              goto LABEL_111;
            }
            v63 = 0;
            v64 = 0;
            v39 = 0;
            if (v35 <= v34)
              v35 = *((_QWORD *)a2 + 1);
            while (2)
            {
              if (v35 == v34)
              {
                v39 = 0;
                *((_BYTE *)a2 + 24) = 1;
              }
              else
              {
                v65 = v34 + 1;
                v66 = *(_BYTE *)(v36 + v34);
                *((_QWORD *)a2 + 1) = v65;
                v39 |= (unint64_t)(v66 & 0x7F) << v63;
                if (v66 < 0)
                {
                  v63 += 7;
                  v34 = v65;
                  v14 = v64++ > 8;
                  if (v14)
                    goto LABEL_83;
                  continue;
                }
                if (*((_BYTE *)a2 + 24))
                  v39 = 0;
              }
              break;
            }
LABEL_111:
            *((_QWORD *)this + 7) = v39;
            goto LABEL_20;
          case 3u:
            *((_BYTE *)this + 64) |= 2u;
            v42 = *((_QWORD *)a2 + 1);
            v43 = *((_QWORD *)a2 + 2);
            v44 = *(_QWORD *)a2;
            if (v42 <= 0xFFFFFFFFFFFFFFF5 && v42 + 10 <= v43)
            {
              v45 = 0;
              v46 = 0;
              v47 = 0;
              do
              {
                v48 = v42 + 1;
                *((_QWORD *)a2 + 1) = v42 + 1;
                v49 = *(_BYTE *)(v44 + v42);
                v47 |= (unint64_t)(v49 & 0x7F) << v45;
                if ((v49 & 0x80) == 0)
                  goto LABEL_114;
                v45 += 7;
                v42 = v48;
                v14 = v46++ > 8;
              }
              while (!v14);
LABEL_90:
              v47 = 0;
              goto LABEL_114;
            }
            v67 = 0;
            v68 = 0;
            v47 = 0;
            if (v43 <= v42)
              v43 = *((_QWORD *)a2 + 1);
            while (2)
            {
              if (v43 == v42)
              {
                v47 = 0;
                *((_BYTE *)a2 + 24) = 1;
              }
              else
              {
                v69 = v42 + 1;
                v70 = *(_BYTE *)(v44 + v42);
                *((_QWORD *)a2 + 1) = v69;
                v47 |= (unint64_t)(v70 & 0x7F) << v67;
                if (v70 < 0)
                {
                  v67 += 7;
                  v42 = v69;
                  v14 = v68++ > 8;
                  if (v14)
                    goto LABEL_90;
                  continue;
                }
                if (*((_BYTE *)a2 + 24))
                  v47 = 0;
              }
              break;
            }
LABEL_114:
            *((_QWORD *)this + 6) = v47;
            goto LABEL_20;
          case 4u:
            *((_BYTE *)this + 64) |= 1u;
            v50 = *((_QWORD *)a2 + 1);
            v51 = *((_QWORD *)a2 + 2);
            v52 = *(_QWORD *)a2;
            if (v50 <= 0xFFFFFFFFFFFFFFF5 && v50 + 10 <= v51)
            {
              v53 = 0;
              v54 = 0;
              v55 = 0;
              do
              {
                v56 = v50 + 1;
                *((_QWORD *)a2 + 1) = v50 + 1;
                v57 = *(_BYTE *)(v52 + v50);
                v55 |= (unint64_t)(v57 & 0x7F) << v53;
                if ((v57 & 0x80) == 0)
                  goto LABEL_117;
                v53 += 7;
                v50 = v56;
                v14 = v54++ > 8;
              }
              while (!v14);
LABEL_97:
              v55 = 0;
              goto LABEL_117;
            }
            v71 = 0;
            v72 = 0;
            v55 = 0;
            if (v51 <= v50)
              v51 = *((_QWORD *)a2 + 1);
            while (2)
            {
              if (v51 == v50)
              {
                v55 = 0;
                *((_BYTE *)a2 + 24) = 1;
              }
              else
              {
                v73 = v50 + 1;
                v74 = *(_BYTE *)(v52 + v50);
                *((_QWORD *)a2 + 1) = v73;
                v55 |= (unint64_t)(v74 & 0x7F) << v71;
                if (v74 < 0)
                {
                  v71 += 7;
                  v50 = v73;
                  v14 = v72++ > 8;
                  if (v14)
                    goto LABEL_97;
                  continue;
                }
                if (*((_BYTE *)a2 + 24))
                  v55 = 0;
              }
              break;
            }
LABEL_117:
            *((_QWORD *)this + 5) = v55;
            goto LABEL_20;
          case 5u:
            v58 = (_QWORD *)operator new();
            v58[1] = 0;
            v58[2] = 0;
            *v58 = 0;
            v59 = *((_QWORD *)this + 4);
            *((_QWORD *)this + 4) = v58;
            if (v59)
              std::default_delete<std::string>::operator()[abi:ne180100](v59);
            PB::Reader::read();
            goto LABEL_20;
          default:
            goto LABEL_19;
        }
      }
      v4 = 0;
      return v4 == 0;
    }
    break;
  }
  v15 = 0;
  v16 = 0;
  v11 = 0;
  if (v2 > v3)
    v3 = v2;
  do
  {
    if (v3 == v2)
    {
      v4 = 1;
      *((_BYTE *)a2 + 24) = 1;
      return v4 == 0;
    }
    v17 = v2 + 1;
    v18 = *(_BYTE *)(v8 + v2);
    *((_QWORD *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0)
      goto LABEL_25;
    v15 += 7;
    v2 = v17;
    v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  if ((PB::Reader::skip(a2) & 1) != 0)
    goto LABEL_20;
  return 0;
}

uint64_t sirinluinternal::NLv4EmbeddingTensor::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  float *v4;
  float *v5;
  float v6;
  char v7;

  v3 = this;
  v4 = *(float **)(this + 8);
  v5 = *(float **)(this + 16);
  while (v4 != v5)
  {
    v6 = *v4++;
    this = PB::Writer::write(a2, v6);
  }
  v7 = *(_BYTE *)(v3 + 64);
  if ((v7 & 4) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v7 = *(_BYTE *)(v3 + 64);
    if ((v7 & 2) == 0)
    {
LABEL_6:
      if ((v7 & 1) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)(v3 + 64) & 2) == 0)
  {
    goto LABEL_6;
  }
  this = PB::Writer::writeVarInt(a2);
  if ((*(_BYTE *)(v3 + 64) & 1) != 0)
LABEL_7:
    this = PB::Writer::writeVarInt(a2);
LABEL_8:
  if (*(_QWORD *)(v3 + 32))
    return PB::Writer::write();
  return this;
}

uint64_t sirinluinternal::NLv4EmbeddingTensor::formatText(sirinluinternal::NLv4EmbeddingTensor *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;
  float *v6;
  float *v7;
  float v8;

  PB::TextFormatter::beginObject(a2, a3);
  if (*((_QWORD *)this + 4))
    PB::TextFormatter::format();
  v5 = *((_BYTE *)this + 64);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "embedding_dim");
    v5 = *((_BYTE *)this + 64);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)this + 64) & 2) == 0)
  {
    goto LABEL_5;
  }
  PB::TextFormatter::format(a2, "num_layer");
  if ((*((_BYTE *)this + 64) & 4) != 0)
LABEL_6:
    PB::TextFormatter::format(a2, "num_token");
LABEL_7:
  v6 = (float *)*((_QWORD *)this + 1);
  v7 = (float *)*((_QWORD *)this + 2);
  while (v6 != v7)
  {
    v8 = *v6++;
    PB::TextFormatter::format(a2, "values", v8);
  }
  return PB::TextFormatter::endObject(a2);
}

double sirinluinternal::NLv4EmbeddingTensor::NLv4EmbeddingTensor(sirinluinternal::NLv4EmbeddingTensor *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB1DD0;
  *((_DWORD *)this + 16) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB1DD0;
  *((_DWORD *)this + 16) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

sirinluinternal::NLv4EmbeddingTensor *sirinluinternal::NLv4EmbeddingTensor::NLv4EmbeddingTensor(char **this, char **a2)
{
  _QWORD *v4;
  char v5;
  char *v6;
  std::string *v7;
  std::string *v8;
  char *v9;
  __int128 v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *this = (char *)&off_1E7BB1DD0;
  *(_OWORD *)(this + 1) = 0u;
  v4 = this + 1;
  *((_DWORD *)this + 16) = 0;
  *(_OWORD *)(this + 3) = 0u;
  if (this != a2)
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(v4, a2[1], a2[2], (a2[2] - a2[1]) >> 2);
  v5 = *((_BYTE *)a2 + 64);
  if ((v5 & 4) != 0)
  {
    v11 = a2[7];
    *((_BYTE *)this + 64) |= 4u;
    this[7] = v11;
    v5 = *((_BYTE *)a2 + 64);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if (((_BYTE)a2[8] & 2) == 0)
  {
    goto LABEL_5;
  }
  v12 = a2[6];
  *((_BYTE *)this + 64) |= 2u;
  this[6] = v12;
  if (((_BYTE)a2[8] & 1) != 0)
  {
LABEL_6:
    v6 = a2[5];
    *((_BYTE *)this + 64) |= 1u;
    this[5] = v6;
  }
LABEL_7:
  if (a2[4])
  {
    v7 = (std::string *)operator new();
    v8 = v7;
    v9 = a2[4];
    if (v9[23] < 0)
    {
      std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)v9, *((_QWORD *)v9 + 1));
    }
    else
    {
      v10 = *(_OWORD *)v9;
      v7->__r_.__value_.__r.__words[2] = *((_QWORD *)v9 + 2);
      *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v10;
    }
    v13 = (uint64_t)this[4];
    this[4] = (char *)v8;
    if (v13)
      std::default_delete<std::string>::operator()[abi:ne180100](v13);
  }
  return (sirinluinternal::NLv4EmbeddingTensor *)this;
}

uint64_t sirinluinternal::NLv4EmbeddingTensor::operator=(uint64_t a1, char **a2)
{
  int v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  int v14;

  if ((char **)a1 != a2)
  {
    sirinluinternal::NLv4EmbeddingTensor::NLv4EmbeddingTensor(&v9, a2);
    v3 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)(a1 + 64) = v14;
    v14 = v3;
    v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v10;
    v5 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v13;
    v13 = v5;
    v6 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v12;
    v12 = v6;
    v7 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v11;
    v10 = v4;
    v11 = v7;
    sirinluinternal::NLv4EmbeddingTensor::~NLv4EmbeddingTensor((sirinluinternal::NLv4EmbeddingTensor *)&v9);
  }
  return a1;
}

uint64_t sirinluinternal::swap(uint64_t this, sirinluinternal::NLv4EmbeddingTensor *a2, sirinluinternal::NLv4EmbeddingTensor *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_DWORD *)(this + 64);
  *(_DWORD *)(this + 64) = *((_DWORD *)a2 + 16);
  *((_DWORD *)a2 + 16) = v3;
  v4 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  v5 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v5;
  v6 = *(_QWORD *)(this + 24);
  *(_QWORD *)(this + 24) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v6;
  v7 = *(_QWORD *)(this + 56);
  *(_QWORD *)(this + 56) = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v7;
  v8 = *(_QWORD *)(this + 48);
  *(_QWORD *)(this + 48) = *((_QWORD *)a2 + 6);
  *((_QWORD *)a2 + 6) = v8;
  v10 = *(_QWORD *)(this + 32);
  v9 = *(_QWORD *)(this + 40);
  v11 = *((_QWORD *)a2 + 5);
  *(_QWORD *)(this + 32) = *((_QWORD *)a2 + 4);
  *(_QWORD *)(this + 40) = v11;
  *((_QWORD *)a2 + 4) = v10;
  *((_QWORD *)a2 + 5) = v9;
  return this;
}

uint64_t sirinluinternal::NLv4EmbeddingTensor::NLv4EmbeddingTensor(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = &off_1E7BB1DD0;
  *(_OWORD *)(a1 + 8) = 0u;
  v4 = (_QWORD *)(a1 + 8);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_DWORD *)(a2 + 64) = 0;
  v5 = (_QWORD *)(a2 + 8);
  v6 = *(void **)(a1 + 8);
  if (v6)
  {
    *(_QWORD *)(a1 + 16) = v6;
    operator delete(v6);
    *v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v5[1] = 0;
  v5[2] = 0;
  *v5 = 0;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 32) = 0;
  v9 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v7;
  if (v9)
    std::default_delete<std::string>::operator()[abi:ne180100](v9);
  return a1;
}

uint64_t sirinluinternal::NLv4EmbeddingTensor::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  _BYTE v9[8];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  int v14;

  if (a1 != a2)
  {
    sirinluinternal::NLv4EmbeddingTensor::NLv4EmbeddingTensor((uint64_t)v9, a2);
    v3 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)(a1 + 64) = v14;
    v14 = v3;
    v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v10;
    v5 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v13;
    v13 = v5;
    v6 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v12;
    v12 = v6;
    v7 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v11;
    v10 = v4;
    v11 = v7;
    sirinluinternal::NLv4EmbeddingTensor::~NLv4EmbeddingTensor((sirinluinternal::NLv4EmbeddingTensor *)v9);
  }
  return a1;
}

BOOL sirinluinternal::NLv4EmbeddingTensor::operator==(uint64_t a1, uint64_t a2)
{
  float *v2;
  float *v3;
  float *v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  _BOOL8 result;

  v3 = *(float **)(a1 + 8);
  v2 = *(float **)(a1 + 16);
  v4 = *(float **)(a2 + 8);
  if ((char *)v2 - (char *)v3 != *(_QWORD *)(a2 + 16) - (_QWORD)v4)
    return 0;
  while (v3 != v2)
  {
    if (*v3 != *v4)
      return 0;
    ++v3;
    ++v4;
  }
  if ((*(_BYTE *)(a1 + 64) & 4) != 0)
  {
    if ((*(_BYTE *)(a2 + 64) & 4) == 0 || *(_QWORD *)(a1 + 56) != *(_QWORD *)(a2 + 56))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 64) & 4) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 64) & 2) != 0)
  {
    if ((*(_BYTE *)(a2 + 64) & 2) == 0 || *(_QWORD *)(a1 + 48) != *(_QWORD *)(a2 + 48))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 64) & 2) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 64) & 1) == 0)
  {
    if ((*(_BYTE *)(a2 + 64) & 1) == 0)
      goto LABEL_20;
    return 0;
  }
  if ((*(_BYTE *)(a2 + 64) & 1) == 0 || *(_QWORD *)(a1 + 40) != *(_QWORD *)(a2 + 40))
    return 0;
LABEL_20:
  v5 = *(unsigned __int8 **)(a1 + 32);
  v6 = *(unsigned __int8 **)(a2 + 32);
  result = ((unint64_t)v5 | (unint64_t)v6) == 0;
  if (v5)
  {
    if (v6)
      return std::__equal_to::operator()[abi:ne180100]<std::string,std::string>(v5, v6);
  }
  return result;
}

unint64_t sirinluinternal::NLv4EmbeddingTensor::hash_value(sirinluinternal::NLv4EmbeddingTensor *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = PBHashBytes();
  if ((*((_BYTE *)this + 64) & 4) == 0)
  {
    v3 = 0;
    if ((*((_BYTE *)this + 64) & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*((_BYTE *)this + 64) & 1) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = *((_QWORD *)this + 7);
  if ((*((_BYTE *)this + 64) & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = *((_QWORD *)this + 6);
  if ((*((_BYTE *)this + 64) & 1) != 0)
  {
LABEL_4:
    v5 = *((_QWORD *)this + 5);
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = *((_QWORD *)this + 4);
  if (v6)
    v6 = std::__string_hash<char>::operator()[abi:ne180100](v6);
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

BOOL SIRINLUEXTERNALUserWantedToPauseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  SIRINLUEXTERNALUUID *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(SIRINLUEXTERNALUUID);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALUUIDReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(SIRINLUEXTERNALUsoGraph);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || !SIRINLUEXTERNALUsoGraphReadFrom((id *)&v17->super.super.isa, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sirinluexternal::MatchInfo::~MatchInfo(sirinluexternal::MatchInfo *this)
{
  sirinluexternal::MatchInfo::~MatchInfo(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  *(_QWORD *)this = &off_1E7BB1E20;
  v2 = *((_QWORD *)this + 11);
  *((_QWORD *)this + 11) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  v6 = *((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  v8 = *((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  v9 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  v10 = (void *)*((_QWORD *)this + 1);
  if (v10)
  {
    *((_QWORD *)this + 2) = v10;
    operator delete(v10);
  }
  PB::Base::~Base(this);
}

BOOL sirinluexternal::MatchInfo::readFrom(sirinluexternal::MatchInfo *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _DWORD *v37;
  char *v38;
  int v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unint64_t v51;
  char *v52;
  _DWORD *v53;
  char *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  _DWORD *v60;
  int v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  char v65;
  unsigned int v66;
  unint64_t v68;
  char v69;
  uint64_t v70;
  unint64_t v71;
  char v72;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (1)
  {
    v8 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      break;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
      v13 = *(_BYTE *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0)
        break;
      v9 += 7;
      v2 = v12;
      v46 = v10++ > 8;
      if (v46)
        goto LABEL_19;
    }
LABEL_21:
    if ((v11 & 7) == 4)
    {
      v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        *((_BYTE *)this + 100) |= 1u;
        v18 = *((_QWORD *)a2 + 1);
        if (v18 <= 0xFFFFFFFFFFFFFFFBLL && v18 + 4 <= *((_QWORD *)a2 + 2))
        {
          *((_DWORD *)this + 24) = *(_DWORD *)(*(_QWORD *)a2 + v18);
          *((_QWORD *)a2 + 1) += 4;
        }
        else
        {
          *((_BYTE *)a2 + 24) = 1;
        }
        break;
      case 2u:
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_1E7BB1B78;
        v19[3] = 0;
        v20 = *((_QWORD *)this + 5);
        *((_QWORD *)this + 5) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = (_DWORD *)*((_QWORD *)this + 5);
        }
        goto LABEL_42;
      case 3u:
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_1E7BAF448;
        v19[3] = 0;
        v21 = *((_QWORD *)this + 11);
        *((_QWORD *)this + 11) = v19;
        if (v21)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
          v19 = (_DWORD *)*((_QWORD *)this + 11);
        }
        goto LABEL_42;
      case 4u:
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_1E7BAF448;
        v19[3] = 0;
        v22 = *((_QWORD *)this + 8);
        *((_QWORD *)this + 8) = v19;
        if (v22)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
          v19 = (_DWORD *)*((_QWORD *)this + 8);
        }
        goto LABEL_42;
      case 5u:
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_1E7BAF448;
        v19[3] = 0;
        v23 = *((_QWORD *)this + 10);
        *((_QWORD *)this + 10) = v19;
        if (v23)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
          v19 = (_DWORD *)*((_QWORD *)this + 10);
        }
        goto LABEL_42;
      case 6u:
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_1E7BAF448;
        v19[3] = 0;
        v24 = *((_QWORD *)this + 7);
        *((_QWORD *)this + 7) = v19;
        if (v24)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
          v19 = (_DWORD *)*((_QWORD *)this + 7);
        }
        goto LABEL_42;
      case 7u:
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_1E7BAF448;
        v19[3] = 0;
        v25 = *((_QWORD *)this + 4);
        *((_QWORD *)this + 4) = v19;
        if (v25)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
          v19 = (_DWORD *)*((_QWORD *)this + 4);
        }
        goto LABEL_42;
      case 8u:
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_1E7BAF448;
        v19[3] = 0;
        v26 = *((_QWORD *)this + 9);
        *((_QWORD *)this + 9) = v19;
        if (v26)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
          v19 = (_DWORD *)*((_QWORD *)this + 9);
        }
        goto LABEL_42;
      case 9u:
        v19 = (_DWORD *)operator new();
        *(_QWORD *)v19 = &off_1E7BAF448;
        v19[3] = 0;
        v27 = *((_QWORD *)this + 6);
        *((_QWORD *)this + 6) = v19;
        if (v27)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v27 + 8))(v27);
          v19 = (_DWORD *)*((_QWORD *)this + 6);
        }
LABEL_42:
        if (PB::Reader::placeMark()
          && ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) != 0)
        {
          goto LABEL_44;
        }
        return 0;
      case 0xAu:
        if ((v11 & 7) == 2)
        {
          if ((PB::Reader::placeMark() & 1) != 0)
            return 0;
          if (*((_QWORD *)a2 + 1) < *((_QWORD *)a2 + 2) && !*((_BYTE *)a2 + 24))
          {
            v29 = (char *)*((_QWORD *)this + 2);
            while (1)
            {
              v30 = *((_QWORD *)this + 3);
              if ((unint64_t)v29 >= v30)
              {
                v31 = (char *)*((_QWORD *)this + 1);
                v32 = (v29 - v31) >> 2;
                v33 = v32 + 1;
                if ((unint64_t)(v32 + 1) >> 62)
                  goto LABEL_136;
                v34 = v30 - (_QWORD)v31;
                if (v34 >> 1 > v33)
                  v33 = v34 >> 1;
                if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFFCLL)
                  v35 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v35 = v33;
                if (v35)
                {
                  v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v35);
                  v31 = (char *)*((_QWORD *)this + 1);
                  v29 = (char *)*((_QWORD *)this + 2);
                }
                else
                {
                  v36 = 0;
                }
                v37 = (_DWORD *)(v35 + 4 * v32);
                *v37 = 0;
                v38 = (char *)(v37 + 1);
                while (v29 != v31)
                {
                  v39 = *((_DWORD *)v29 - 1);
                  v29 -= 4;
                  *--v37 = v39;
                }
                *((_QWORD *)this + 1) = v37;
                *((_QWORD *)this + 2) = v38;
                *((_QWORD *)this + 3) = v35 + 4 * v36;
                if (v31)
                  operator delete(v31);
                v29 = v38;
              }
              else
              {
                *(_DWORD *)v29 = 0;
                v29 += 4;
              }
              *((_QWORD *)this + 2) = v29;
              v41 = *((_QWORD *)a2 + 1);
              v40 = *((_QWORD *)a2 + 2);
              v42 = *(_QWORD *)a2;
              v43 = 0;
              v44 = 0;
              v45 = 0;
              v46 = v41 > 0xFFFFFFFFFFFFFFF5 || v41 + 10 > v40;
              if (v46)
                break;
              while (1)
              {
                v48 = v41 + 1;
                *((_QWORD *)a2 + 1) = v41 + 1;
                v50 = *(_BYTE *)(v42 + v41);
                v45 |= (unint64_t)(v50 & 0x7F) << v43;
                if ((v50 & 0x80) == 0)
                  break;
                v43 += 7;
                v41 = v48;
                v46 = v44++ > 8;
                if (v46)
                  goto LABEL_88;
              }
LABEL_91:
              *((_DWORD *)v29 - 1) = v45;
              if (v48 >= v40 || *((_BYTE *)a2 + 24))
                goto LABEL_44;
            }
            if (v40 <= v41)
              v47 = *((_QWORD *)a2 + 1);
            else
              v47 = *((_QWORD *)a2 + 2);
            while (v47 != v41)
            {
              v48 = v41 + 1;
              v49 = *(_BYTE *)(v42 + v41);
              *((_QWORD *)a2 + 1) = v48;
              v45 |= (unint64_t)(v49 & 0x7F) << v43;
              if ((v49 & 0x80) == 0)
              {
                if (*((_BYTE *)a2 + 24))
                  LODWORD(v45) = 0;
                goto LABEL_91;
              }
              v43 += 7;
              v41 = v48;
              v46 = v44++ > 8;
              if (v46)
              {
LABEL_88:
                LODWORD(v45) = 0;
                goto LABEL_91;
              }
            }
            *((_BYTE *)a2 + 24) = 1;
            *((_DWORD *)v29 - 1) = 0;
          }
LABEL_44:
          PB::Reader::recallMark();
        }
        else
        {
          v52 = (char *)*((_QWORD *)this + 2);
          v51 = *((_QWORD *)this + 3);
          if ((unint64_t)v52 >= v51)
          {
            v54 = (char *)*((_QWORD *)this + 1);
            v55 = (v52 - v54) >> 2;
            v56 = v55 + 1;
            if ((unint64_t)(v55 + 1) >> 62)
LABEL_136:
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            v57 = v51 - (_QWORD)v54;
            if (v57 >> 1 > v56)
              v56 = v57 >> 1;
            if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFFCLL)
              v58 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v58 = v56;
            if (v58)
            {
              v58 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v58);
              v54 = (char *)*((_QWORD *)this + 1);
              v52 = (char *)*((_QWORD *)this + 2);
            }
            else
            {
              v59 = 0;
            }
            v60 = (_DWORD *)(v58 + 4 * v55);
            *v60 = 0;
            v53 = v60 + 1;
            while (v52 != v54)
            {
              v61 = *((_DWORD *)v52 - 1);
              v52 -= 4;
              *--v60 = v61;
            }
            *((_QWORD *)this + 1) = v60;
            *((_QWORD *)this + 2) = v53;
            *((_QWORD *)this + 3) = v58 + 4 * v59;
            if (v54)
              operator delete(v54);
          }
          else
          {
            *(_DWORD *)v52 = 0;
            v53 = v52 + 4;
          }
          *((_QWORD *)this + 2) = v53;
          v62 = *((_QWORD *)a2 + 1);
          v63 = *((_QWORD *)a2 + 2);
          v64 = *(_QWORD *)a2;
          v65 = 0;
          v66 = 0;
          if (v62 > 0xFFFFFFFFFFFFFFF5 || v62 + 10 > v63)
          {
            v70 = 0;
            if (v63 <= v62)
              v63 = *((_QWORD *)a2 + 1);
            while (1)
            {
              if (v63 == v62)
              {
                LODWORD(v70) = 0;
                *((_BYTE *)a2 + 24) = 1;
                goto LABEL_131;
              }
              v68 = v62 + 1;
              v69 = *(_BYTE *)(v64 + v62);
              *((_QWORD *)a2 + 1) = v68;
              v70 |= (unint64_t)(v69 & 0x7F) << v65;
              if ((v69 & 0x80) == 0)
                break;
              v65 += 7;
              v62 = v68;
              v46 = v66++ > 8;
              if (v46)
              {
LABEL_127:
                LODWORD(v70) = 0;
                goto LABEL_131;
              }
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v70) = 0;
          }
          else
          {
            v70 = 0;
            while (1)
            {
              v71 = v62 + 1;
              *((_QWORD *)a2 + 1) = v62 + 1;
              v72 = *(_BYTE *)(v64 + v62);
              v70 |= (unint64_t)(v72 & 0x7F) << v65;
              if ((v72 & 0x80) == 0)
                break;
              v65 += 7;
              v62 = v71;
              v46 = v66++ > 8;
              if (v46)
                goto LABEL_127;
            }
          }
LABEL_131:
          *(v53 - 1) = v70;
        }
        break;
      default:
        goto LABEL_19;
    }
LABEL_45:
    v2 = *((_QWORD *)a2 + 1);
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0)
      return v4 == 0;
  }
  v14 = 0;
  v15 = 0;
  v11 = 0;
  if (v2 > v3)
    v3 = v2;
  do
  {
    if (v3 == v2)
    {
      v4 = 1;
      *((_BYTE *)a2 + 24) = 1;
      return v4 == 0;
    }
    v16 = v2 + 1;
    v17 = *(_BYTE *)(v8 + v2);
    *((_QWORD *)a2 + 1) = v16;
    v11 |= (unint64_t)(v17 & 0x7F) << v14;
    if ((v17 & 0x80) == 0)
      goto LABEL_21;
    v14 += 7;
    v2 = v16;
    v46 = v15++ > 8;
  }
  while (!v46);
LABEL_19:
  if ((PB::Reader::skip(a2) & 1) != 0)
    goto LABEL_45;
  return 0;
}

uint64_t sirinluexternal::MatchInfo::writeTo(uint64_t this, PB::Writer *a2)
{
  _QWORD *v3;
  const PB::Base *v4;
  const PB::Base *v5;
  const PB::Base *v6;
  const PB::Base *v7;
  const PB::Base *v8;
  const PB::Base *v9;
  const PB::Base *v10;
  const PB::Base *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (_QWORD *)this;
  if ((*(_BYTE *)(this + 100) & 1) != 0)
    this = PB::Writer::writeFixed(a2);
  v4 = (const PB::Base *)v3[5];
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = (const PB::Base *)v3[11];
  if (v5)
    this = PB::Writer::writeSubmessage(a2, v5);
  v6 = (const PB::Base *)v3[8];
  if (v6)
    this = PB::Writer::writeSubmessage(a2, v6);
  v7 = (const PB::Base *)v3[10];
  if (v7)
    this = PB::Writer::writeSubmessage(a2, v7);
  v8 = (const PB::Base *)v3[7];
  if (v8)
    this = PB::Writer::writeSubmessage(a2, v8);
  v9 = (const PB::Base *)v3[4];
  if (v9)
    this = PB::Writer::writeSubmessage(a2, v9);
  v10 = (const PB::Base *)v3[9];
  if (v10)
    this = PB::Writer::writeSubmessage(a2, v10);
  v11 = (const PB::Base *)v3[6];
  if (v11)
    this = PB::Writer::writeSubmessage(a2, v11);
  v13 = v3[1];
  v12 = v3[2];
  while (v13 != v12)
  {
    v13 += 4;
    this = PB::Writer::writeVarInt(a2);
  }
  return this;
}

uint64_t sirinluexternal::MatchInfo::formatText(sirinluexternal::MatchInfo *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 4);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "edit_distance");
  v6 = *((_QWORD *)this + 5);
  if (v6)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v6 + 32))(v6, a2, "match_score");
  if ((*((_BYTE *)this + 100) & 1) != 0)
    PB::TextFormatter::format(a2, "match_signal_bitset");
  v7 = *((_QWORD *)this + 6);
  if (v7)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v7 + 32))(v7, a2, "matched_alias_count");
  v8 = *((_QWORD *)this + 1);
  v9 = *((_QWORD *)this + 2);
  while (v8 != v9)
  {
    v8 += 4;
    PB::TextFormatter::format(a2, "matched_alias_types");
  }
  v10 = *((_QWORD *)this + 7);
  if (v10)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v10 + 32))(v10, a2, "matched_stop_word_count");
  v11 = *((_QWORD *)this + 8);
  if (v11)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v11 + 32))(v11, a2, "matched_token_count");
  v12 = *((_QWORD *)this + 9);
  if (v12)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v12 + 32))(v12, a2, "max_alias_count");
  v13 = *((_QWORD *)this + 10);
  if (v13)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v13 + 32))(v13, a2, "max_stop_word_count");
  v14 = *((_QWORD *)this + 11);
  if (v14)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v14 + 32))(v14, a2, "max_token_count");
  return PB::TextFormatter::endObject(a2);
}

double sirinluexternal::MatchInfo::MatchInfo(sirinluexternal::MatchInfo *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB1E20;
  *((_DWORD *)this + 25) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_QWORD *)this + 11) = 0;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB1E20;
  *((_DWORD *)this + 25) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_QWORD *)this + 11) = 0;
  return result;
}

sirinluexternal::MatchInfo *sirinluexternal::MatchInfo::MatchInfo(sirinluexternal::MatchInfo *this, const sirinluexternal::MatchInfo *a2)
{
  _QWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  char *v38;
  _BYTE *v39;
  size_t v40;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  void **v46;
  uint64_t v47;
  _BYTE *v48;
  unint64_t v49;
  char *v50;
  void *v51;
  char *v52;

  *(_QWORD *)this = &off_1E7BB1E20;
  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (_QWORD *)((char *)this + 8);
  *((_DWORD *)this + 25) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *((_QWORD *)this + 11) = 0;
  if ((*((_BYTE *)a2 + 100) & 1) != 0)
  {
    v5 = *((_DWORD *)a2 + 24);
    *((_BYTE *)this + 100) = 1;
    *((_DWORD *)this + 24) = v5;
  }
  if (*((_QWORD *)a2 + 5))
  {
    v6 = operator new();
    v7 = *((_QWORD *)a2 + 5);
    *(_QWORD *)v6 = &off_1E7BB1B78;
    *(_DWORD *)(v6 + 12) = 0;
    if ((*(_BYTE *)(v7 + 12) & 1) != 0)
    {
      v8 = *(_DWORD *)(v7 + 8);
      *(_BYTE *)(v6 + 12) = 1;
      *(_DWORD *)(v6 + 8) = v8;
    }
    v9 = *((_QWORD *)this + 5);
    *((_QWORD *)this + 5) = v6;
    if (v9)
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  }
  if (*((_QWORD *)a2 + 11))
  {
    v10 = operator new();
    v11 = *((_QWORD *)a2 + 11);
    *(_QWORD *)v10 = &off_1E7BAF448;
    *(_DWORD *)(v10 + 12) = 0;
    if ((*(_BYTE *)(v11 + 12) & 1) != 0)
    {
      v12 = *(_DWORD *)(v11 + 8);
      *(_BYTE *)(v10 + 12) = 1;
      *(_DWORD *)(v10 + 8) = v12;
    }
    v13 = *((_QWORD *)this + 11);
    *((_QWORD *)this + 11) = v10;
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  }
  if (*((_QWORD *)a2 + 8))
  {
    v14 = operator new();
    v15 = *((_QWORD *)a2 + 8);
    *(_QWORD *)v14 = &off_1E7BAF448;
    *(_DWORD *)(v14 + 12) = 0;
    if ((*(_BYTE *)(v15 + 12) & 1) != 0)
    {
      v16 = *(_DWORD *)(v15 + 8);
      *(_BYTE *)(v14 + 12) = 1;
      *(_DWORD *)(v14 + 8) = v16;
    }
    v17 = *((_QWORD *)this + 8);
    *((_QWORD *)this + 8) = v14;
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  }
  if (*((_QWORD *)a2 + 10))
  {
    v18 = operator new();
    v19 = *((_QWORD *)a2 + 10);
    *(_QWORD *)v18 = &off_1E7BAF448;
    *(_DWORD *)(v18 + 12) = 0;
    if ((*(_BYTE *)(v19 + 12) & 1) != 0)
    {
      v20 = *(_DWORD *)(v19 + 8);
      *(_BYTE *)(v18 + 12) = 1;
      *(_DWORD *)(v18 + 8) = v20;
    }
    v21 = *((_QWORD *)this + 10);
    *((_QWORD *)this + 10) = v18;
    if (v21)
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
  }
  if (*((_QWORD *)a2 + 7))
  {
    v22 = operator new();
    v23 = *((_QWORD *)a2 + 7);
    *(_QWORD *)v22 = &off_1E7BAF448;
    *(_DWORD *)(v22 + 12) = 0;
    if ((*(_BYTE *)(v23 + 12) & 1) != 0)
    {
      v24 = *(_DWORD *)(v23 + 8);
      *(_BYTE *)(v22 + 12) = 1;
      *(_DWORD *)(v22 + 8) = v24;
    }
    v25 = *((_QWORD *)this + 7);
    *((_QWORD *)this + 7) = v22;
    if (v25)
      (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
  }
  if (*((_QWORD *)a2 + 4))
  {
    v26 = operator new();
    v27 = *((_QWORD *)a2 + 4);
    *(_QWORD *)v26 = &off_1E7BAF448;
    *(_DWORD *)(v26 + 12) = 0;
    if ((*(_BYTE *)(v27 + 12) & 1) != 0)
    {
      v28 = *(_DWORD *)(v27 + 8);
      *(_BYTE *)(v26 + 12) = 1;
      *(_DWORD *)(v26 + 8) = v28;
    }
    v29 = *((_QWORD *)this + 4);
    *((_QWORD *)this + 4) = v26;
    if (v29)
      (*(void (**)(uint64_t))(*(_QWORD *)v29 + 8))(v29);
  }
  if (*((_QWORD *)a2 + 9))
  {
    v30 = operator new();
    v31 = *((_QWORD *)a2 + 9);
    *(_QWORD *)v30 = &off_1E7BAF448;
    *(_DWORD *)(v30 + 12) = 0;
    if ((*(_BYTE *)(v31 + 12) & 1) != 0)
    {
      v32 = *(_DWORD *)(v31 + 8);
      *(_BYTE *)(v30 + 12) = 1;
      *(_DWORD *)(v30 + 8) = v32;
    }
    v33 = *((_QWORD *)this + 9);
    *((_QWORD *)this + 9) = v30;
    if (v33)
      (*(void (**)(uint64_t))(*(_QWORD *)v33 + 8))(v33);
  }
  if (*((_QWORD *)a2 + 6))
  {
    v34 = operator new();
    v35 = *((_QWORD *)a2 + 6);
    *(_QWORD *)v34 = &off_1E7BAF448;
    *(_DWORD *)(v34 + 12) = 0;
    if ((*(_BYTE *)(v35 + 12) & 1) != 0)
    {
      v36 = *(_DWORD *)(v35 + 8);
      *(_BYTE *)(v34 + 12) = 1;
      *(_DWORD *)(v34 + 8) = v36;
    }
    v37 = *((_QWORD *)this + 6);
    *((_QWORD *)this + 6) = v34;
    if (v37)
      (*(void (**)(uint64_t))(*(_QWORD *)v37 + 8))(v37);
  }
  if (this != a2)
  {
    v38 = (char *)*((_QWORD *)a2 + 1);
    v39 = (_BYTE *)*((_QWORD *)a2 + 2);
    v40 = v39 - v38;
    v41 = (v39 - v38) >> 2;
    v42 = *((_QWORD *)this + 3);
    v43 = (char *)*((_QWORD *)this + 1);
    if (v41 <= (v42 - (uint64_t)v43) >> 2)
    {
      v46 = (void **)((char *)this + 16);
      v48 = (_BYTE *)*((_QWORD *)this + 2);
      v49 = (v48 - v43) >> 2;
      if (v49 < v41)
      {
        v50 = &v38[4 * v49];
        if (v48 != v43)
        {
          memmove(*((void **)this + 1), v38, v48 - v43);
          v43 = (char *)*v46;
        }
        v40 = v39 - v50;
        if (v39 == v50)
          goto LABEL_63;
        v51 = v43;
        v52 = v50;
        goto LABEL_62;
      }
    }
    else
    {
      if (v43)
      {
        *((_QWORD *)this + 2) = v43;
        operator delete(v43);
        v42 = 0;
        *v4 = 0;
        v4[1] = 0;
        v4[2] = 0;
      }
      if ((v40 & 0x8000000000000000) != 0)
        goto LABEL_65;
      v44 = v42 >> 1;
      if (v42 >> 1 <= v41)
        v44 = (v39 - v38) >> 2;
      v45 = (unint64_t)v42 >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v44;
      if (v45 >> 62)
LABEL_65:
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v45);
      *((_QWORD *)this + 2) = v43;
      v46 = (void **)((char *)this + 16);
      *((_QWORD *)this + 1) = v43;
      *((_QWORD *)this + 3) = &v43[4 * v47];
    }
    if (v39 == v38)
    {
LABEL_63:
      *v46 = &v43[v40];
      return this;
    }
    v51 = v43;
    v52 = v38;
LABEL_62:
    memmove(v51, v52, v40);
    goto LABEL_63;
  }
  return this;
}

uint64_t sirinluexternal::MatchInfo::operator=(uint64_t a1, const sirinluexternal::MatchInfo *a2)
{
  sirinluexternal::MatchInfo *v3;
  _BYTE v5[104];

  if ((const sirinluexternal::MatchInfo *)a1 != a2)
  {
    sirinluexternal::MatchInfo::MatchInfo((sirinluexternal::MatchInfo *)v5, a2);
    sirinluexternal::swap(a1, (sirinluexternal::MatchInfo *)v5, v3);
    sirinluexternal::MatchInfo::~MatchInfo((sirinluexternal::MatchInfo *)v5);
  }
  return a1;
}

uint64_t sirinluexternal::swap(uint64_t this, sirinluexternal::MatchInfo *a2, sirinluexternal::MatchInfo *a3)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *(_DWORD *)(this + 100);
  *(_DWORD *)(this + 100) = *((_DWORD *)a2 + 25);
  *((_DWORD *)a2 + 25) = v3;
  v4 = *(_DWORD *)(this + 96);
  *(_DWORD *)(this + 96) = *((_DWORD *)a2 + 24);
  *((_DWORD *)a2 + 24) = v4;
  v5 = *(_QWORD *)(this + 40);
  *(_QWORD *)(this + 40) = *((_QWORD *)a2 + 5);
  *((_QWORD *)a2 + 5) = v5;
  v6 = *(_QWORD *)(this + 88);
  *(_QWORD *)(this + 88) = *((_QWORD *)a2 + 11);
  *((_QWORD *)a2 + 11) = v6;
  v7 = *(_QWORD *)(this + 64);
  *(_QWORD *)(this + 64) = *((_QWORD *)a2 + 8);
  *((_QWORD *)a2 + 8) = v7;
  v8 = *(_QWORD *)(this + 80);
  *(_QWORD *)(this + 80) = *((_QWORD *)a2 + 10);
  *((_QWORD *)a2 + 10) = v8;
  v9 = *(_QWORD *)(this + 56);
  *(_QWORD *)(this + 56) = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v9;
  v10 = *(_QWORD *)(this + 32);
  *(_QWORD *)(this + 32) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v10;
  v11 = *(_QWORD *)(this + 72);
  *(_QWORD *)(this + 72) = *((_QWORD *)a2 + 9);
  *((_QWORD *)a2 + 9) = v11;
  v12 = *(_QWORD *)(this + 48);
  *(_QWORD *)(this + 48) = *((_QWORD *)a2 + 6);
  *((_QWORD *)a2 + 6) = v12;
  v13 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v13;
  v14 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v14;
  v15 = *(_QWORD *)(this + 24);
  *(_QWORD *)(this + 24) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v15;
  return this;
}

uint64_t sirinluexternal::MatchInfo::MatchInfo(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  *(_QWORD *)a1 = &off_1E7BB1E20;
  *(_OWORD *)(a1 + 8) = 0u;
  v4 = a1 + 8;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_QWORD *)(a1 + 88) = 0;
  *(_DWORD *)(a1 + 100) = *(_DWORD *)(a2 + 100);
  *(_DWORD *)(a2 + 100) = 0;
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  v6 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a2 + 88) = 0;
  v8 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v7;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  v9 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a2 + 64) = 0;
  v10 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v9;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  v11 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a2 + 80) = 0;
  v12 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 80) = v11;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  v13 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 56) = 0;
  v14 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v13;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  v15 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a2 + 32) = 0;
  v16 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v15;
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  v17 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 72) = 0;
  v18 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v17;
  if (v18)
    (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
  v19 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 48) = 0;
  v20 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v19;
  if (v20)
    (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
  v21 = *(void **)v4;
  if (*(_QWORD *)v4)
  {
    *(_QWORD *)(a1 + 16) = v21;
    operator delete(v21);
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(v4 + 8) = 0;
    *(_QWORD *)(v4 + 16) = 0;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return a1;
}

uint64_t sirinluexternal::MatchInfo::operator=(uint64_t a1, uint64_t a2)
{
  sirinluexternal::MatchInfo *v3;
  _BYTE v5[104];

  if (a1 != a2)
  {
    sirinluexternal::MatchInfo::MatchInfo((uint64_t)v5, a2);
    sirinluexternal::swap(a1, (sirinluexternal::MatchInfo *)v5, v3);
    sirinluexternal::MatchInfo::~MatchInfo((sirinluexternal::MatchInfo *)v5);
  }
  return a1;
}

BOOL sirinluexternal::MatchInfo::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  int v22;
  _BOOL8 result;
  BOOL v24;

  if ((*(_BYTE *)(a1 + 100) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 100) & 1) == 0 || *(_DWORD *)(a1 + 96) != *(_DWORD *)(a2 + 96))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 100) & 1) != 0)
  {
    return 0;
  }
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a2 + 40);
  if (v2)
  {
    if (!v3)
      return 0;
    if ((*(_BYTE *)(v2 + 12) & 1) != 0)
    {
      if ((*(_BYTE *)(v3 + 12) & 1) == 0 || *(float *)(v2 + 8) != *(float *)(v3 + 8))
        return 0;
    }
    else if ((*(_BYTE *)(v3 + 12) & 1) != 0)
    {
      return 0;
    }
  }
  else if (v3)
  {
    return 0;
  }
  v4 = *(_QWORD *)(a1 + 88);
  v5 = *(_QWORD *)(a2 + 88);
  if (v4)
  {
    if (!v5)
      return 0;
    if ((*(_BYTE *)(v4 + 12) & 1) != 0)
    {
      if ((*(_BYTE *)(v5 + 12) & 1) == 0 || *(_DWORD *)(v4 + 8) != *(_DWORD *)(v5 + 8))
        return 0;
    }
    else if ((*(_BYTE *)(v5 + 12) & 1) != 0)
    {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a2 + 64);
  if (v6)
  {
    if (!v7)
      return 0;
    if ((*(_BYTE *)(v6 + 12) & 1) != 0)
    {
      if ((*(_BYTE *)(v7 + 12) & 1) == 0 || *(_DWORD *)(v6 + 8) != *(_DWORD *)(v7 + 8))
        return 0;
    }
    else if ((*(_BYTE *)(v7 + 12) & 1) != 0)
    {
      return 0;
    }
  }
  else if (v7)
  {
    return 0;
  }
  v8 = *(_QWORD *)(a1 + 80);
  v9 = *(_QWORD *)(a2 + 80);
  if (v8)
  {
    if (!v9)
      return 0;
    if ((*(_BYTE *)(v8 + 12) & 1) != 0)
    {
      if ((*(_BYTE *)(v9 + 12) & 1) == 0 || *(_DWORD *)(v8 + 8) != *(_DWORD *)(v9 + 8))
        return 0;
    }
    else if ((*(_BYTE *)(v9 + 12) & 1) != 0)
    {
      return 0;
    }
  }
  else if (v9)
  {
    return 0;
  }
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a2 + 56);
  if (v10)
  {
    if (!v11)
      return 0;
    if ((*(_BYTE *)(v10 + 12) & 1) != 0)
    {
      if ((*(_BYTE *)(v11 + 12) & 1) == 0 || *(_DWORD *)(v10 + 8) != *(_DWORD *)(v11 + 8))
        return 0;
    }
    else if ((*(_BYTE *)(v11 + 12) & 1) != 0)
    {
      return 0;
    }
  }
  else if (v11)
  {
    return 0;
  }
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(a2 + 32);
  if (v12)
  {
    if (!v13)
      return 0;
    if ((*(_BYTE *)(v12 + 12) & 1) != 0)
    {
      if ((*(_BYTE *)(v13 + 12) & 1) == 0 || *(_DWORD *)(v12 + 8) != *(_DWORD *)(v13 + 8))
        return 0;
    }
    else if ((*(_BYTE *)(v13 + 12) & 1) != 0)
    {
      return 0;
    }
  }
  else if (v13)
  {
    return 0;
  }
  v14 = *(_QWORD *)(a1 + 72);
  v15 = *(_QWORD *)(a2 + 72);
  if (v14)
  {
    if (!v15)
      return 0;
    if ((*(_BYTE *)(v14 + 12) & 1) != 0)
    {
      if ((*(_BYTE *)(v15 + 12) & 1) == 0 || *(_DWORD *)(v14 + 8) != *(_DWORD *)(v15 + 8))
        return 0;
    }
    else if ((*(_BYTE *)(v15 + 12) & 1) != 0)
    {
      return 0;
    }
  }
  else if (v15)
  {
    return 0;
  }
  v16 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(a2 + 48);
  if (!v16)
  {
    if (!v17)
      goto LABEL_78;
    return 0;
  }
  if (!v17)
    return 0;
  if ((*(_BYTE *)(v16 + 12) & 1) != 0)
  {
    if ((*(_BYTE *)(v17 + 12) & 1) == 0 || *(_DWORD *)(v16 + 8) != *(_DWORD *)(v17 + 8))
      return 0;
  }
  else if ((*(_BYTE *)(v17 + 12) & 1) != 0)
  {
    return 0;
  }
LABEL_78:
  v19 = *(_QWORD *)(a1 + 8);
  v18 = *(_QWORD *)(a1 + 16);
  v20 = *(int **)(a2 + 8);
  if (v18 - v19 != *(_QWORD *)(a2 + 16) - (_QWORD)v20)
    return 0;
  if (v19 == v18)
    return 1;
  v21 = v19 + 4;
  do
  {
    v22 = *v20++;
    result = *(_DWORD *)(v21 - 4) == v22;
    v24 = *(_DWORD *)(v21 - 4) != v22 || v21 == v18;
    v21 += 4;
  }
  while (!v24);
  return result;
}

uint64_t sirinluexternal::MatchInfo::hash_value(sirinluexternal::MatchInfo *this)
{
  uint64_t v1;
  uint64_t v2;
  float v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*((_BYTE *)this + 100) & 1) != 0)
    v1 = *((unsigned int *)this + 24);
  else
    v1 = 0;
  v2 = *((_QWORD *)this + 5);
  if (v2)
  {
    if ((*(_BYTE *)(v2 + 12) & 1) != 0)
    {
      v3 = *(float *)(v2 + 8);
      v2 = LODWORD(v3);
      if (v3 == 0.0)
        v2 = 0;
    }
    else
    {
      v2 = 0;
    }
  }
  v4 = *((_QWORD *)this + 11);
  if (v4)
  {
    if ((*(_BYTE *)(v4 + 12) & 1) != 0)
      v4 = *(unsigned int *)(v4 + 8);
    else
      v4 = 0;
  }
  v5 = *((_QWORD *)this + 8);
  if (v5)
  {
    if ((*(_BYTE *)(v5 + 12) & 1) != 0)
      v5 = *(unsigned int *)(v5 + 8);
    else
      v5 = 0;
  }
  v6 = *((_QWORD *)this + 10);
  if (v6)
  {
    if ((*(_BYTE *)(v6 + 12) & 1) != 0)
      v6 = *(unsigned int *)(v6 + 8);
    else
      v6 = 0;
  }
  v7 = *((_QWORD *)this + 7);
  if (v7)
  {
    if ((*(_BYTE *)(v7 + 12) & 1) != 0)
      v7 = *(unsigned int *)(v7 + 8);
    else
      v7 = 0;
  }
  v8 = *((_QWORD *)this + 4);
  if (v8)
  {
    if ((*(_BYTE *)(v8 + 12) & 1) != 0)
      v8 = *(unsigned int *)(v8 + 8);
    else
      v8 = 0;
  }
  v9 = *((_QWORD *)this + 9);
  if (v9)
  {
    if ((*(_BYTE *)(v9 + 12) & 1) != 0)
      v9 = *(unsigned int *)(v9 + 8);
    else
      v9 = 0;
  }
  v10 = *((_QWORD *)this + 6);
  if (v10)
  {
    if ((*(_BYTE *)(v10 + 12) & 1) != 0)
      v10 = *(unsigned int *)(v10 + 8);
    else
      v10 = 0;
  }
  return v2 ^ v1 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ PBHashBytes();
}

_QWORD *sirinluexternal::MatchInfo::makeMatchScore(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[5])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BB1B78;
    *(_DWORD *)(v2 + 12) = 0;
    this = (_QWORD *)v1[5];
    v1[5] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluexternal::MatchInfo::makeMaxTokenCount(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[11])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BAF448;
    *(_DWORD *)(v2 + 12) = 0;
    this = (_QWORD *)v1[11];
    v1[11] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluexternal::MatchInfo::makeMatchedTokenCount(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[8])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BAF448;
    *(_DWORD *)(v2 + 12) = 0;
    this = (_QWORD *)v1[8];
    v1[8] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluexternal::MatchInfo::makeMaxStopWordCount(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[10])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BAF448;
    *(_DWORD *)(v2 + 12) = 0;
    this = (_QWORD *)v1[10];
    v1[10] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluexternal::MatchInfo::makeMatchedStopWordCount(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[7])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BAF448;
    *(_DWORD *)(v2 + 12) = 0;
    this = (_QWORD *)v1[7];
    v1[7] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluexternal::MatchInfo::makeEditDistance(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[4])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BAF448;
    *(_DWORD *)(v2 + 12) = 0;
    this = (_QWORD *)v1[4];
    v1[4] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluexternal::MatchInfo::makeMaxAliasCount(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[9])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BAF448;
    *(_DWORD *)(v2 + 12) = 0;
    this = (_QWORD *)v1[9];
    v1[9] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluexternal::MatchInfo::makeMatchedAliasCount(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[6])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BAF448;
    *(_DWORD *)(v2 + 12) = 0;
    this = (_QWORD *)v1[6];
    v1[6] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void sirinluinternalitfm::ITFMParserResponse::~ITFMParserResponse(sirinluinternalitfm::ITFMParserResponse *this)
{
  sirinluinternalitfm::ITFMParserResponse::~ITFMParserResponse(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)this = &off_1E7BB1E70;
  v2 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = (_QWORD *)*((_QWORD *)this + 1);
  if (v3)
  {
    v4 = (_QWORD *)*((_QWORD *)this + 2);
    v5 = (void *)*((_QWORD *)this + 1);
    if (v4 != v3)
    {
      do
      {
        v7 = *--v4;
        v6 = v7;
        *v4 = 0;
        if (v7)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
      }
      while (v4 != v3);
      v5 = (void *)*((_QWORD *)this + 1);
    }
    *((_QWORD *)this + 2) = v3;
    operator delete(v5);
  }
  PB::Base::~Base(this);
}

uint64_t sirinluinternalitfm::ITFMParserResponse::readFrom(sirinluinternalitfm::ITFMParserResponse *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  char *v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  uint64_t result;
  unint64_t v21;
  unint64_t v22;
  int v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  _QWORD *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  unint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  int64x2_t v44;
  unint64_t v45;
  uint64_t v46;
  int64x2_t v47;
  unint64_t v48;
  char *v49;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  v8 = (char *)this + 24;
  while (1)
  {
    v9 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      break;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
      v14 = *(_BYTE *)(v9 + v2);
      v12 |= (unint64_t)(v14 & 0x7F) << v10;
      if ((v14 & 0x80) == 0)
        break;
      v10 += 7;
      v2 = v13;
      v15 = v11++ > 8;
      if (v15)
        goto LABEL_20;
    }
LABEL_22:
    if ((v12 & 7) == 4)
    {
      v4 = 0;
      return v4 == 0;
    }
    switch((v12 >> 3))
    {
      case 1u:
        *((_BYTE *)this + 48) |= 2u;
        v21 = *((_QWORD *)a2 + 1);
        if (v21 >= *((_QWORD *)a2 + 2))
        {
          v24 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v22 = v21 + 1;
          v23 = *(unsigned __int8 *)(*(_QWORD *)a2 + v21);
          *((_QWORD *)a2 + 1) = v22;
          v24 = v23 != 0;
        }
        *((_BYTE *)this + 44) = v24;
        goto LABEL_54;
      case 2u:
        *((_BYTE *)this + 48) |= 1u;
        v32 = *((_QWORD *)a2 + 1);
        if (v32 <= 0xFFFFFFFFFFFFFFFBLL && v32 + 4 <= *((_QWORD *)a2 + 2))
        {
          *((_DWORD *)this + 10) = *(_DWORD *)(*(_QWORD *)a2 + v32);
          *((_QWORD *)a2 + 1) += 4;
        }
        else
        {
          *((_BYTE *)a2 + 24) = 1;
        }
        goto LABEL_54;
      case 3u:
        v25 = operator new();
        *(_QWORD *)v25 = &off_1E7BAF268;
        *(_QWORD *)(v25 + 8) = 0;
        *(_DWORD *)(v25 + 16) = 0;
        v26 = *((_QWORD *)this + 4);
        *((_QWORD *)this + 4) = v25;
        if (v26)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
          v25 = *((_QWORD *)this + 4);
        }
        break;
      case 4u:
        v27 = operator new();
        v28 = v27;
        *(_QWORD *)v27 = &off_1E7BAF730;
        *(_QWORD *)(v27 + 8) = 0;
        *(_DWORD *)(v27 + 24) = 0;
        v30 = (uint64_t *)*((_QWORD *)this + 2);
        v29 = *((_QWORD *)this + 3);
        if ((unint64_t)v30 >= v29)
        {
          v33 = *((_QWORD *)this + 1);
          v34 = ((uint64_t)v30 - v33) >> 3;
          if ((unint64_t)(v34 + 1) >> 61)
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          v35 = v29 - v33;
          v36 = v35 >> 2;
          if (v35 >> 2 <= (unint64_t)(v34 + 1))
            v36 = v34 + 1;
          if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8)
            v37 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v37 = v36;
          v49 = v8;
          if (v37)
            v37 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v37);
          else
            v38 = 0;
          v39 = (uint64_t *)(v37 + 8 * v34);
          v40 = v37 + 8 * v38;
          v48 = v40;
          *v39 = v28;
          v31 = v39 + 1;
          v47.i64[1] = (uint64_t)(v39 + 1);
          v42 = (_QWORD *)*((_QWORD *)this + 1);
          v41 = (_QWORD *)*((_QWORD *)this + 2);
          if (v41 == v42)
          {
            v44 = vdupq_n_s64((unint64_t)v41);
          }
          else
          {
            do
            {
              v43 = *--v41;
              *v41 = 0;
              *--v39 = v43;
            }
            while (v41 != v42);
            v44 = *(int64x2_t *)((char *)this + 8);
            v31 = (_QWORD *)v47.i64[1];
            v40 = v48;
          }
          *((_QWORD *)this + 1) = v39;
          *((_QWORD *)this + 2) = v31;
          v47 = v44;
          v45 = *((_QWORD *)this + 3);
          *((_QWORD *)this + 3) = v40;
          v48 = v45;
          v46 = v44.i64[0];
          std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v46);
        }
        else
        {
          *v30 = v27;
          v31 = v30 + 1;
        }
        *((_QWORD *)this + 2) = v31;
        v25 = *(v31 - 1);
        break;
      default:
        goto LABEL_20;
    }
    if (!PB::Reader::placeMark()
      || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v25 + 16))(v25, a2) & 1) == 0)
    {
      return 0;
    }
    PB::Reader::recallMark();
LABEL_54:
    v2 = *((_QWORD *)a2 + 1);
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || *((_BYTE *)a2 + 24))
      return v4 == 0;
  }
  v16 = 0;
  v17 = 0;
  v12 = 0;
  if (v2 > v3)
    v3 = v2;
  do
  {
    if (v3 == v2)
    {
      v4 = 1;
      *((_BYTE *)a2 + 24) = 1;
      return v4 == 0;
    }
    v18 = v2 + 1;
    v19 = *(_BYTE *)(v9 + v2);
    *((_QWORD *)a2 + 1) = v18;
    v12 |= (unint64_t)(v19 & 0x7F) << v16;
    if ((v19 & 0x80) == 0)
      goto LABEL_22;
    v16 += 7;
    v2 = v18;
    v15 = v17++ > 8;
  }
  while (!v15);
LABEL_20:
  result = PB::Reader::skip(a2);
  if ((_DWORD)result)
    goto LABEL_54;
  return result;
}

void sub_1C1FFE4D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t sirinluinternalitfm::ITFMParserResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;
  const PB::Base *v5;
  const PB::Base **v6;
  const PB::Base **v7;
  const PB::Base *v8;

  v3 = this;
  v4 = *(_BYTE *)(this + 48);
  if ((v4 & 2) != 0)
  {
    this = PB::Writer::write(a2);
    v4 = *(_BYTE *)(v3 + 48);
  }
  if ((v4 & 1) != 0)
    this = PB::Writer::write(a2, *(float *)(v3 + 40));
  v5 = *(const PB::Base **)(v3 + 32);
  if (v5)
    this = PB::Writer::writeSubmessage(a2, v5);
  v7 = *(const PB::Base ***)(v3 + 8);
  v6 = *(const PB::Base ***)(v3 + 16);
  while (v7 != v6)
  {
    v8 = *v7++;
    this = PB::Writer::writeSubmessage(a2, v8);
  }
  return this;
}

uint64_t sirinluinternalitfm::ITFMParserResponse::formatText(sirinluinternalitfm::ITFMParserResponse *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 48);
  if ((v5 & 2) != 0)
  {
    PB::TextFormatter::format(a2, "classification_label");
    v5 = *((_BYTE *)this + 48);
  }
  if ((v5 & 1) != 0)
    PB::TextFormatter::format(a2, "classification_probability", *((float *)this + 10));
  v6 = (uint64_t *)*((_QWORD *)this + 1);
  v7 = (uint64_t *)*((_QWORD *)this + 2);
  while (v6 != v7)
  {
    v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v8 + 32))(v8, a2, "hypotheses");
  }
  v9 = *((_QWORD *)this + 4);
  if (v9)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v9 + 32))(v9, a2, "parser");
  return PB::TextFormatter::endObject(a2);
}

double sirinluinternalitfm::ITFMParserResponse::ITFMParserResponse(sirinluinternalitfm::ITFMParserResponse *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB1E70;
  *((_DWORD *)this + 12) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB1E70;
  *((_DWORD *)this + 12) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

sirinluinternalitfm::ITFMParserResponse *sirinluinternalitfm::ITFMParserResponse::ITFMParserResponse(sirinluinternalitfm::ITFMParserResponse *this, const sirinluinternalitfm::ITFMParserResponse *a2)
{
  int64x2_t *v4;
  char v5;
  char v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  int v12;
  int v13;
  uint64_t v14;
  const sirinluinternalitfm::ITFMHypothesis **v15;
  const sirinluinternalitfm::ITFMHypothesis **i;
  const sirinluinternalitfm::ITFMHypothesis *v17;
  sirinluinternalitfm::ITFMHypothesis *v18;
  unint64_t v19;
  sirinluinternalitfm::ITFMHypothesis **v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  sirinluinternalitfm::ITFMHypothesis **v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  sirinluinternalitfm::ITFMHypothesis *v31;
  int64x2_t v32;
  unint64_t v33;
  uint64_t v35;
  int64x2_t v36;
  unint64_t v37;
  char *v38;

  *(_QWORD *)this = &off_1E7BB1E70;
  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (int64x2_t *)((char *)this + 8);
  *((_DWORD *)this + 12) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  if ((*((_BYTE *)a2 + 48) & 2) != 0)
  {
    v6 = *((_BYTE *)a2 + 44);
    *((_BYTE *)this + 48) = 2;
    *((_BYTE *)this + 44) = v6;
    v5 = 3;
    if ((*((_BYTE *)a2 + 48) & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v5 = 1;
  if ((*((_BYTE *)a2 + 48) & 1) != 0)
  {
LABEL_5:
    v7 = *((_DWORD *)a2 + 10);
    *((_BYTE *)this + 48) = v5;
    *((_DWORD *)this + 10) = v7;
  }
LABEL_6:
  if (!*((_QWORD *)a2 + 4))
    goto LABEL_14;
  v8 = operator new();
  v9 = *((_QWORD *)a2 + 4);
  *(_QWORD *)v8 = &off_1E7BAF268;
  *(_QWORD *)(v8 + 8) = 0;
  *(_DWORD *)(v8 + 16) = 0;
  v10 = *(_BYTE *)(v9 + 16);
  if ((v10 & 1) != 0)
  {
    v12 = *(_DWORD *)(v9 + 8);
    *(_BYTE *)(v8 + 16) = 1;
    *(_DWORD *)(v8 + 8) = v12;
    v11 = 3;
    if ((v10 & 2) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  v11 = 2;
  if ((*(_BYTE *)(v9 + 16) & 2) != 0)
  {
LABEL_11:
    v13 = *(_DWORD *)(v9 + 12);
    *(_BYTE *)(v8 + 16) = v11;
    *(_DWORD *)(v8 + 12) = v13;
  }
LABEL_12:
  v14 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = v8;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
LABEL_14:
  v15 = (const sirinluinternalitfm::ITFMHypothesis **)*((_QWORD *)a2 + 1);
  for (i = (const sirinluinternalitfm::ITFMHypothesis **)*((_QWORD *)a2 + 2); v15 != i; ++v15)
  {
    v17 = *v15;
    v18 = (sirinluinternalitfm::ITFMHypothesis *)operator new();
    sirinluinternalitfm::ITFMHypothesis::ITFMHypothesis(v18, v17);
    v20 = (sirinluinternalitfm::ITFMHypothesis **)*((_QWORD *)this + 2);
    v19 = *((_QWORD *)this + 3);
    if ((unint64_t)v20 >= v19)
    {
      v22 = ((uint64_t)v20 - v4->i64[0]) >> 3;
      if ((unint64_t)(v22 + 1) >> 61)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v23 = v19 - v4->i64[0];
      v24 = v23 >> 2;
      if (v23 >> 2 <= (unint64_t)(v22 + 1))
        v24 = v22 + 1;
      if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8)
        v25 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v25 = v24;
      v38 = (char *)this + 24;
      if (v25)
        v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v25);
      else
        v26 = 0;
      v27 = (sirinluinternalitfm::ITFMHypothesis **)(v25 + 8 * v22);
      v28 = v25 + 8 * v26;
      v37 = v28;
      *v27 = v18;
      v21 = v27 + 1;
      v36.i64[1] = (uint64_t)(v27 + 1);
      v30 = (_QWORD *)*((_QWORD *)this + 1);
      v29 = (_QWORD *)*((_QWORD *)this + 2);
      if (v29 == v30)
      {
        v32 = vdupq_n_s64((unint64_t)v29);
      }
      else
      {
        do
        {
          v31 = (sirinluinternalitfm::ITFMHypothesis *)*--v29;
          *v29 = 0;
          *--v27 = v31;
        }
        while (v29 != v30);
        v32 = *v4;
        v21 = (_QWORD *)v36.i64[1];
        v28 = v37;
      }
      *((_QWORD *)this + 1) = v27;
      *((_QWORD *)this + 2) = v21;
      v36 = v32;
      v33 = *((_QWORD *)this + 3);
      *((_QWORD *)this + 3) = v28;
      v37 = v33;
      v35 = v32.i64[0];
      std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v35);
    }
    else
    {
      *v20 = v18;
      v21 = v20 + 1;
    }
    *((_QWORD *)this + 2) = v21;
  }
  return this;
}

void sub_1C1FFE968(void *a1)
{
  __clang_call_terminate(a1);
}

uint64_t sirinluinternalitfm::ITFMParserResponse::operator=(uint64_t a1, const sirinluinternalitfm::ITFMParserResponse *a2)
{
  int v3;
  int v4;
  __int128 v5;
  __int128 v6;
  _BYTE v8[8];
  __int128 v9;
  __int128 v10;
  int v11;
  char v12;
  int v13;

  if ((const sirinluinternalitfm::ITFMParserResponse *)a1 != a2)
  {
    sirinluinternalitfm::ITFMParserResponse::ITFMParserResponse((sirinluinternalitfm::ITFMParserResponse *)v8, a2);
    v3 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)(a1 + 48) = v13;
    v13 = v3;
    LOBYTE(v3) = *(_BYTE *)(a1 + 44);
    *(_BYTE *)(a1 + 44) = v12;
    v12 = v3;
    v4 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)(a1 + 40) = v11;
    v11 = v4;
    v5 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    v6 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    v9 = v5;
    v10 = v6;
    sirinluinternalitfm::ITFMParserResponse::~ITFMParserResponse((sirinluinternalitfm::ITFMParserResponse *)v8);
  }
  return a1;
}

float sirinluinternalitfm::swap(sirinluinternalitfm *this, sirinluinternalitfm::ITFMParserResponse *a2, sirinluinternalitfm::ITFMParserResponse *a3)
{
  int v3;
  float result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *((_DWORD *)this + 12);
  *((_DWORD *)this + 12) = *((_DWORD *)a2 + 12);
  *((_DWORD *)a2 + 12) = v3;
  LOBYTE(v3) = *((_BYTE *)this + 44);
  *((_BYTE *)this + 44) = *((_BYTE *)a2 + 44);
  *((_BYTE *)a2 + 44) = v3;
  result = *((float *)this + 10);
  *((_DWORD *)this + 10) = *((_DWORD *)a2 + 10);
  *((float *)a2 + 10) = result;
  v5 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v5;
  v6 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v6;
  v7 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v7;
  v8 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v8;
  return result;
}

uint64_t sirinluinternalitfm::ITFMParserResponse::ITFMParserResponse(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)a1 = &off_1E7BB1E70;
  *(_OWORD *)(a1 + 8) = 0u;
  v4 = (_QWORD *)(a1 + 8);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a2 + 48) = 0;
  *(_BYTE *)(a1 + 44) = *(_BYTE *)(a2 + 44);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a2 + 32) = 0;
  v6 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = (_QWORD *)*v4;
  if (*v4)
  {
    v8 = *(_QWORD **)(a1 + 16);
    v9 = (_QWORD *)*v4;
    if (v8 != v7)
    {
      do
      {
        v11 = *--v8;
        v10 = v11;
        *v8 = 0;
        if (v11)
          (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
      }
      while (v8 != v7);
      v9 = (_QWORD *)*v4;
    }
    *(_QWORD *)(a1 + 16) = v7;
    operator delete(v9);
    *v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return a1;
}

uint64_t sirinluinternalitfm::ITFMParserResponse::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  __int128 v5;
  __int128 v6;
  _BYTE v8[8];
  __int128 v9;
  __int128 v10;
  int v11;
  char v12;
  int v13;

  if (a1 != a2)
  {
    sirinluinternalitfm::ITFMParserResponse::ITFMParserResponse((uint64_t)v8, a2);
    v3 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)(a1 + 48) = v13;
    v13 = v3;
    LOBYTE(v3) = *(_BYTE *)(a1 + 44);
    *(_BYTE *)(a1 + 44) = v12;
    v12 = v3;
    v4 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)(a1 + 40) = v11;
    v11 = v4;
    v5 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    v6 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    v9 = v5;
    v10 = v6;
    sirinluinternalitfm::ITFMParserResponse::~ITFMParserResponse((sirinluinternalitfm::ITFMParserResponse *)v8);
  }
  return a1;
}

uint64_t sirinluinternalitfm::ITFMParserResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  BOOL v13;

  if ((*(_BYTE *)(a1 + 48) & 2) != 0)
  {
    if ((*(_BYTE *)(a2 + 48) & 2) == 0 || *(unsigned __int8 *)(a1 + 44) != *(unsigned __int8 *)(a2 + 44))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 48) & 2) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 48) & 1) == 0 || *(float *)(a1 + 40) != *(float *)(a2 + 40))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 48) & 1) != 0)
  {
    return 0;
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a2 + 32);
  if (v4)
  {
    if (!v5 || !sirinluexternal::Parser::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  v9 = a2 + 8;
  v8 = *(uint64_t **)(a2 + 8);
  if (v7 - v6 != *(_QWORD *)(v9 + 8) - (_QWORD)v8)
    return 0;
  if (v6 == v7)
    return 1;
  v10 = v6 + 8;
  do
  {
    v11 = *v8++;
    result = sirinluinternalitfm::ITFMHypothesis::operator==(*(_QWORD *)(v10 - 8), v11);
    if ((_DWORD)result)
      v13 = v10 == v7;
    else
      v13 = 1;
    v10 += 8;
  }
  while (!v13);
  return result;
}

uint64_t sirinluinternalitfm::ITFMParserResponse::hash_value(sirinluinternalitfm::ITFMParserResponse *this)
{
  uint64_t v1;
  float v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  sirinluinternalitfm::ITFMHypothesis **v8;
  sirinluinternalitfm::ITFMHypothesis **v9;
  uint64_t v10;
  sirinluinternalitfm::ITFMHypothesis *v11;

  if ((*((_BYTE *)this + 48) & 2) == 0)
  {
    v1 = 0;
    if ((*((_BYTE *)this + 48) & 1) != 0)
      goto LABEL_3;
LABEL_7:
    v3 = 0;
    goto LABEL_8;
  }
  v1 = *((unsigned __int8 *)this + 44);
  if ((*((_BYTE *)this + 48) & 1) == 0)
    goto LABEL_7;
LABEL_3:
  v2 = *((float *)this + 10);
  if (v2 == 0.0)
    v3 = 0;
  else
    v3 = LODWORD(v2);
LABEL_8:
  v4 = *((_QWORD *)this + 4);
  if (!v4)
  {
    v7 = 0;
    goto LABEL_16;
  }
  if ((*(_BYTE *)(v4 + 16) & 1) != 0)
  {
    v5 = *(int *)(v4 + 8);
    if ((*(_BYTE *)(v4 + 16) & 2) != 0)
      goto LABEL_11;
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  v5 = 0;
  if ((*(_BYTE *)(v4 + 16) & 2) == 0)
    goto LABEL_14;
LABEL_11:
  v6 = *(int *)(v4 + 12);
LABEL_15:
  v7 = v6 ^ v5;
LABEL_16:
  v8 = (sirinluinternalitfm::ITFMHypothesis **)*((_QWORD *)this + 1);
  v9 = (sirinluinternalitfm::ITFMHypothesis **)*((_QWORD *)this + 2);
  if (v8 == v9)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    do
    {
      v11 = *v8++;
      v10 ^= sirinluinternalitfm::ITFMHypothesis::hash_value(v11);
    }
    while (v8 != v9);
  }
  return v3 ^ v1 ^ v7 ^ v10;
}

_QWORD *sirinluinternalitfm::ITFMParserResponse::makeParser(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[4])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BAF268;
    *(_QWORD *)(v2 + 8) = 0;
    *(_DWORD *)(v2 + 16) = 0;
    this = (_QWORD *)v1[4];
    v1[4] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

uint64_t SIRINLUEXTERNALNLU_ROUTERTurnSummaryReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 32) |= 1u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_34;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_36;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_36:
        *(_DWORD *)(a1 + 16) = v22;
      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 24;
        }
        else
        {
          if ((_DWORD)v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 8;
        }
        v26 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sirinluexternal::UserWantedToRepeat::~UserWantedToRepeat(sirinluexternal::UserWantedToRepeat *this)
{
  sirinluexternal::UserWantedToRepeat::~UserWantedToRepeat(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = &off_1E7BB1ED8;
  v2 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  PB::Base::~Base(this);
}

uint64_t sirinluexternal::UserWantedToRepeat::readFrom(sirinluexternal::UserWantedToRepeat *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    do
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        v15 = 0;
        v16 = 0;
        v11 = 0;
        if (v2 > v3)
          v3 = v2;
        while (v3 != v2)
        {
          v17 = v2 + 1;
          v18 = *(_BYTE *)(v8 + v2);
          *((_QWORD *)a2 + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0)
            goto LABEL_20;
          v15 += 7;
          v2 = v17;
          v14 = v16++ > 8;
          if (v14)
            goto LABEL_25;
        }
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_25;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        v19 = operator new();
        *(_QWORD *)v19 = &off_1E7BB2398;
        *(_OWORD *)(v19 + 8) = 0u;
        *(_OWORD *)(v19 + 24) = 0u;
        *(_OWORD *)(v19 + 40) = 0u;
        *(_OWORD *)(v19 + 56) = 0u;
        *(_OWORD *)(v19 + 72) = 0u;
        *(_OWORD *)(v19 + 88) = 0u;
        *(_OWORD *)(v19 + 104) = 0u;
        *(_OWORD *)(v19 + 120) = 0u;
        v22 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v22)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
          v19 = *((_QWORD *)this + 1);
        }
      }
      else
      {
        if ((v11 >> 3) != 1)
        {
LABEL_25:
          result = PB::Reader::skip(a2);
          if (!(_DWORD)result)
            return result;
          goto LABEL_32;
        }
        v19 = operator new();
        *(_QWORD *)v19 = &off_1E7BB0CB8;
        *(_QWORD *)(v19 + 24) = 0;
        v20 = *((_QWORD *)this + 2);
        *((_QWORD *)this + 2) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = *((_QWORD *)this + 2);
        }
      }
      if (!PB::Reader::placeMark()
        || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
      {
        return 0;
      }
      PB::Reader::recallMark();
LABEL_32:
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
    }
    while (v2 < v3 && !*((_BYTE *)a2 + 24));
  }
  return v4 == 0;
}

uint64_t sirinluexternal::UserWantedToRepeat::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  const PB::Base *v5;

  v3 = this;
  v4 = *(const PB::Base **)(this + 16);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = *(const PB::Base **)(v3 + 8);
  if (v5)
    return PB::Writer::writeSubmessage(a2, v5);
  return this;
}

uint64_t sirinluexternal::UserWantedToRepeat::formatText(sirinluexternal::UserWantedToRepeat *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;
  uint64_t v6;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "reference");
  v6 = *((_QWORD *)this + 2);
  if (v6)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v6 + 32))(v6, a2, "system_dialog_act_id");
  return PB::TextFormatter::endObject(a2);
}

_QWORD *sirinluexternal::UserWantedToRepeat::UserWantedToRepeat(_QWORD *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &off_1E7BB1ED8;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = &off_1E7BB1ED8;
  return this;
}

sirinluexternal::UserWantedToRepeat *sirinluexternal::UserWantedToRepeat::UserWantedToRepeat(sirinluexternal::UserWantedToRepeat *this, const sirinluexternal::UserWantedToRepeat *a2)
{
  sirinluexternal::UsoGraph **v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  sirinluexternal::UsoGraph *v8;
  sirinluexternal::UsoGraph *v9;
  sirinluexternal::UsoGraph *v10;

  *(_QWORD *)this = &off_1E7BB1ED8;
  *((_QWORD *)this + 1) = 0;
  v4 = (sirinluexternal::UsoGraph **)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  if (*((_QWORD *)a2 + 2))
  {
    v5 = operator new();
    v6 = sirinluexternal::UUID::UUID(v5, *((const sirinluexternal::UUID **)a2 + 2));
    v7 = *((_QWORD *)this + 2);
    *((_QWORD *)this + 2) = v6;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
  if (*((_QWORD *)a2 + 1))
  {
    v8 = (sirinluexternal::UsoGraph *)operator new();
    v9 = sirinluexternal::UsoGraph::UsoGraph(v8, *((const sirinluexternal::SemVer ***)a2 + 1));
    v10 = *v4;
    *v4 = v9;
    if (v10)
      (*(void (**)(sirinluexternal::UsoGraph *))(*(_QWORD *)v10 + 8))(v10);
  }
  return this;
}

uint64_t sirinluexternal::UserWantedToRepeat::operator=(uint64_t a1, const sirinluexternal::UserWantedToRepeat *a2)
{
  __int128 v3;
  _BYTE v5[8];
  __int128 v6;

  if ((const sirinluexternal::UserWantedToRepeat *)a1 != a2)
  {
    sirinluexternal::UserWantedToRepeat::UserWantedToRepeat((sirinluexternal::UserWantedToRepeat *)v5, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    v6 = v3;
    sirinluexternal::UserWantedToRepeat::~UserWantedToRepeat((sirinluexternal::UserWantedToRepeat *)v5);
  }
  return a1;
}

uint64_t sirinluexternal::swap(uint64_t this, sirinluexternal::UserWantedToRepeat *a2, sirinluexternal::UserWantedToRepeat *a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v3;
  v4 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  return this;
}

_QWORD *sirinluexternal::UserWantedToRepeat::UserWantedToRepeat(_QWORD *a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  a1[1] = 0;
  v4 = a1 + 1;
  *a1 = &off_1E7BB1ED8;
  a1[2] = 0;
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v6 = a1[2];
  a1[2] = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v8 = *v4;
  *v4 = v7;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  return a1;
}

uint64_t sirinluexternal::UserWantedToRepeat::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  void (**v6)(sirinluexternal::UserWantedToRepeat *__hidden);
  __int128 v7;

  if (a1 != a2)
  {
    v6 = &off_1E7BB1ED8;
    v3 = *(_OWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v3;
    v7 = v4;
    sirinluexternal::UserWantedToRepeat::~UserWantedToRepeat((sirinluexternal::UserWantedToRepeat *)&v6);
  }
  return a1;
}

uint64_t sirinluexternal::UserWantedToRepeat::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  BOOL v9;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  if (!v4)
  {
    if (!v5)
      goto LABEL_4;
    return 0;
  }
  if (!v5 || !sirinluexternal::UUID::operator==(v4, v5))
    return 0;
LABEL_4:
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a2 + 8);
  result = (v6 | v7) == 0;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
    return sirinluexternal::UsoGraph::operator==(*(_QWORD **)(a1 + 8), (_QWORD *)v7);
  return result;
}

unint64_t sirinluexternal::UserWantedToRepeat::hash_value(sirinluexternal::UserWantedToRepeat *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = *((_QWORD *)this + 2);
  if (!v1)
  {
    v5 = 0;
    goto LABEL_11;
  }
  if ((*(_BYTE *)(v1 + 28) & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)(v1 + 28) & 2) != 0)
      goto LABEL_4;
LABEL_8:
    v3 = 0;
    if ((*(_BYTE *)(v1 + 28) & 4) != 0)
      goto LABEL_5;
LABEL_9:
    v4 = 0;
    goto LABEL_10;
  }
  v2 = *(_QWORD *)(v1 + 8);
  if ((*(_BYTE *)(v1 + 28) & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v3 = *(_QWORD *)(v1 + 16);
  if ((*(_BYTE *)(v1 + 28) & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v4 = *(int *)(v1 + 24);
LABEL_10:
  v5 = v3 ^ v2 ^ v4;
LABEL_11:
  v6 = *((_QWORD *)this + 1);
  if (v6)
    v6 = sirinluexternal::UsoGraph::hash_value((sirinluexternal::UsoGraph *)v6);
  return v6 ^ v5;
}

_QWORD *sirinluexternal::UserWantedToRepeat::makeSystemDialogActId(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[2])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    *v2 = &off_1E7BB0CB8;
    v2[3] = 0;
    this = (_QWORD *)v1[2];
    v1[2] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluexternal::UserWantedToRepeat::makeReference(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BB2398;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_OWORD *)(v2 + 120) = 0u;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

BOOL SIRINLUEXTERNALNLUSupplementaryOutputReadFrom(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  SIRINLUEXTERNALCorrectionOutcome *v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v18 = objc_alloc_init(SIRINLUEXTERNALCorrectionOutcome);
        objc_storeStrong(a1 + 1, v18);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALCorrectionOutcomeReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
LABEL_34:

          return 0;
        }
        goto LABEL_29;
      }
      if ((_DWORD)v17 == 2)
        break;
      if ((_DWORD)v17 == 1)
      {
        v18 = objc_alloc_init(SIRINLUEXTERNALSpan);
        objc_msgSend(a1, "addMatchingSpans:", v18);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALSpanReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_34;
LABEL_29:
        PBReaderRecallMark();

        goto LABEL_31;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_31:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(SIRINLUEXTERNALRewriteMessage);
    objc_storeStrong(a1 + 3, v18);
    if (!PBReaderPlaceMark() || (SIRINLUEXTERNALRewriteMessageReadFrom((uint64_t)v18, a2) & 1) == 0)
      goto LABEL_34;
    goto LABEL_29;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sirinluinternal::Token::~Token(sirinluinternal::Token *this)
{
  sirinluinternal::Token::~Token(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  uint64_t v3;
  void **v4;

  *(_QWORD *)this = &off_1E7BB1F28;
  v2 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;
  if (v2)
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  v4 = (void **)((char *)this + 40);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v4);
  v4 = (void **)((char *)this + 16);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v4);
  v3 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v3)
    std::default_delete<std::string>::operator()[abi:ne180100](v3);
  PB::Base::~Base(this);
}

uint64_t sirinluinternal::Token::readFrom(sirinluinternal::Token *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  std::vector<std::string> *v8;
  std::allocator<std::string> *v9;
  std::vector<std::string> *v10;
  std::allocator<std::string> *v11;
  uint64_t v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  char v19;
  unsigned int v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  BOOL v46;
  unint64_t v47;
  unint64_t v48;
  int v49;
  BOOL v50;
  unint64_t v51;
  char *v52;
  _QWORD *v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char v57;
  unsigned int v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  _QWORD *v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  _QWORD *v74;
  char v75;
  unsigned int v76;
  unint64_t v77;
  char v78;
  char v79;
  unsigned int v80;
  unint64_t v81;
  char v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  char v88;
  unsigned int v89;
  unint64_t v90;
  char v91;
  char v92;
  unsigned int v93;
  unint64_t v94;
  char v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  std::string *v101;
  std::string *v102;
  std::__split_buffer<std::string> __v;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  v8 = (std::vector<std::string> *)((char *)this + 40);
  v9 = (std::allocator<std::string> *)((char *)this + 56);
  v10 = (std::vector<std::string> *)((char *)this + 16);
  v11 = (std::allocator<std::string> *)((char *)this + 32);
  while (1)
  {
    v12 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      break;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
      v17 = *(_BYTE *)(v12 + v2);
      v15 |= (unint64_t)(v17 & 0x7F) << v13;
      if ((v17 & 0x80) == 0)
        break;
      v13 += 7;
      v2 = v16;
      v18 = v14++ > 8;
      if (v18)
        goto LABEL_20;
    }
LABEL_26:
    if ((v15 & 7) == 4)
    {
      v4 = 0;
      return v4 == 0;
    }
    switch((v15 >> 3))
    {
      case 1u:
        v25 = (_QWORD *)operator new();
        v25[1] = 0;
        v25[2] = 0;
        *v25 = 0;
        v26 = *((_QWORD *)this + 8);
        *((_QWORD *)this + 8) = v25;
        if (v26)
          std::default_delete<std::string>::operator()[abi:ne180100](v26);
        break;
      case 2u:
        *((_BYTE *)this + 92) |= 1u;
        v27 = *((_QWORD *)a2 + 1);
        v28 = *((_QWORD *)a2 + 2);
        v29 = *(_QWORD *)a2;
        if (v27 <= 0xFFFFFFFFFFFFFFF5 && v27 + 10 <= v28)
        {
          v30 = 0;
          v31 = 0;
          v32 = 0;
          do
          {
            v33 = v27 + 1;
            *((_QWORD *)a2 + 1) = v27 + 1;
            v34 = *(_BYTE *)(v29 + v27);
            v32 |= (unint64_t)(v34 & 0x7F) << v30;
            if ((v34 & 0x80) == 0)
              goto LABEL_130;
            v30 += 7;
            v27 = v33;
            v18 = v31++ > 8;
          }
          while (!v18);
LABEL_75:
          LODWORD(v32) = 0;
          goto LABEL_130;
        }
        v75 = 0;
        v76 = 0;
        v32 = 0;
        if (v28 <= v27)
          v28 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v28 == v27)
          {
            LODWORD(v32) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v77 = v27 + 1;
            v78 = *(_BYTE *)(v29 + v27);
            *((_QWORD *)a2 + 1) = v77;
            v32 |= (unint64_t)(v78 & 0x7F) << v75;
            if (v78 < 0)
            {
              v75 += 7;
              v27 = v77;
              v18 = v76++ > 8;
              if (v18)
                goto LABEL_75;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v32) = 0;
          }
          break;
        }
LABEL_130:
        *((_DWORD *)this + 18) = v32;
        goto LABEL_21;
      case 3u:
        *((_BYTE *)this + 92) |= 2u;
        v35 = *((_QWORD *)a2 + 1);
        v36 = *((_QWORD *)a2 + 2);
        v37 = *(_QWORD *)a2;
        if (v35 <= 0xFFFFFFFFFFFFFFF5 && v35 + 10 <= v36)
        {
          v38 = 0;
          v39 = 0;
          v40 = 0;
          do
          {
            v41 = v35 + 1;
            *((_QWORD *)a2 + 1) = v35 + 1;
            v42 = *(_BYTE *)(v37 + v35);
            v40 |= (unint64_t)(v42 & 0x7F) << v38;
            if ((v42 & 0x80) == 0)
              goto LABEL_133;
            v38 += 7;
            v35 = v41;
            v18 = v39++ > 8;
          }
          while (!v18);
LABEL_82:
          LODWORD(v40) = 0;
          goto LABEL_133;
        }
        v79 = 0;
        v80 = 0;
        v40 = 0;
        if (v36 <= v35)
          v36 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v36 == v35)
          {
            LODWORD(v40) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v81 = v35 + 1;
            v82 = *(_BYTE *)(v37 + v35);
            *((_QWORD *)a2 + 1) = v81;
            v40 |= (unint64_t)(v82 & 0x7F) << v79;
            if (v82 < 0)
            {
              v79 += 7;
              v35 = v81;
              v18 = v80++ > 8;
              if (v18)
                goto LABEL_82;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v40) = 0;
          }
          break;
        }
LABEL_133:
        *((_DWORD *)this + 19) = v40;
        goto LABEL_21;
      case 4u:
        *((_BYTE *)this + 92) |= 0x10u;
        v43 = *((_QWORD *)a2 + 1);
        if (v43 >= *((_QWORD *)a2 + 2))
        {
          v46 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v44 = v43 + 1;
          v45 = *(unsigned __int8 *)(*(_QWORD *)a2 + v43);
          *((_QWORD *)a2 + 1) = v44;
          v46 = v45 != 0;
        }
        *((_BYTE *)this + 88) = v46;
        goto LABEL_21;
      case 5u:
        *((_BYTE *)this + 92) |= 0x20u;
        v47 = *((_QWORD *)a2 + 1);
        if (v47 >= *((_QWORD *)a2 + 2))
        {
          v50 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v48 = v47 + 1;
          v49 = *(unsigned __int8 *)(*(_QWORD *)a2 + v47);
          *((_QWORD *)a2 + 1) = v48;
          v50 = v49 != 0;
        }
        *((_BYTE *)this + 89) = v50;
        goto LABEL_21;
      case 6u:
        v52 = (char *)*((_QWORD *)this + 3);
        v51 = *((_QWORD *)this + 4);
        if ((unint64_t)v52 >= v51)
        {
          v83 = 0xAAAAAAAAAAAAAAABLL * ((v52 - (char *)v10->__begin_) >> 3);
          v84 = v83 + 1;
          if (v83 + 1 > 0xAAAAAAAAAAAAAAALL)
            goto LABEL_144;
          v85 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v51 - (unint64_t)v10->__begin_) >> 3);
          if (2 * v85 > v84)
            v84 = 2 * v85;
          if (v85 >= 0x555555555555555)
            v86 = 0xAAAAAAAAAAAAAAALL;
          else
            v86 = v84;
          __v.__end_cap_.__value_ = v11;
          if (v86)
            v86 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v86);
          else
            v87 = 0;
          v101 = (std::string *)(v86 + 24 * v83);
          __v.__first_ = (std::__split_buffer<std::string>::pointer)v86;
          __v.__begin_ = v101;
          __v.__end_cap_.__value_ = (std::string *)(v86 + 24 * v87);
          v101->__r_.__value_.__r.__words[0] = 0;
          v101->__r_.__value_.__l.__size_ = 0;
          v101->__r_.__value_.__r.__words[2] = 0;
          __v.__end_ = v101 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(v10, &__v);
          v53 = (_QWORD *)*((_QWORD *)this + 3);
          std::__split_buffer<std::string>::~__split_buffer(&__v);
        }
        else
        {
          *(_QWORD *)v52 = 0;
          *((_QWORD *)v52 + 1) = 0;
          v53 = v52 + 24;
          *((_QWORD *)v52 + 2) = 0;
        }
        *((_QWORD *)this + 3) = v53;
        break;
      case 7u:
        *((_BYTE *)this + 92) |= 8u;
        v54 = *((_QWORD *)a2 + 1);
        v55 = *((_QWORD *)a2 + 2);
        v56 = *(_QWORD *)a2;
        if (v54 <= 0xFFFFFFFFFFFFFFF5 && v54 + 10 <= v55)
        {
          v57 = 0;
          v58 = 0;
          v59 = 0;
          do
          {
            v60 = v54 + 1;
            *((_QWORD *)a2 + 1) = v54 + 1;
            v61 = *(_BYTE *)(v56 + v54);
            v59 |= (unint64_t)(v61 & 0x7F) << v57;
            if ((v61 & 0x80) == 0)
              goto LABEL_136;
            v57 += 7;
            v54 = v60;
            v18 = v58++ > 8;
          }
          while (!v18);
LABEL_101:
          LODWORD(v59) = 0;
          goto LABEL_136;
        }
        v88 = 0;
        v89 = 0;
        v59 = 0;
        if (v55 <= v54)
          v55 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v55 == v54)
          {
            LODWORD(v59) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v90 = v54 + 1;
            v91 = *(_BYTE *)(v56 + v54);
            *((_QWORD *)a2 + 1) = v90;
            v59 |= (unint64_t)(v91 & 0x7F) << v88;
            if (v91 < 0)
            {
              v88 += 7;
              v54 = v90;
              v18 = v89++ > 8;
              if (v18)
                goto LABEL_101;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v59) = 0;
          }
          break;
        }
LABEL_136:
        *((_DWORD *)this + 21) = v59;
        goto LABEL_21;
      case 8u:
        *((_BYTE *)this + 92) |= 4u;
        v62 = *((_QWORD *)a2 + 1);
        v63 = *((_QWORD *)a2 + 2);
        v64 = *(_QWORD *)a2;
        if (v62 <= 0xFFFFFFFFFFFFFFF5 && v62 + 10 <= v63)
        {
          v65 = 0;
          v66 = 0;
          v67 = 0;
          do
          {
            v68 = v62 + 1;
            *((_QWORD *)a2 + 1) = v62 + 1;
            v69 = *(_BYTE *)(v64 + v62);
            v67 |= (unint64_t)(v69 & 0x7F) << v65;
            if ((v69 & 0x80) == 0)
              goto LABEL_139;
            v65 += 7;
            v62 = v68;
            v18 = v66++ > 8;
          }
          while (!v18);
LABEL_108:
          LODWORD(v67) = 0;
          goto LABEL_139;
        }
        v92 = 0;
        v93 = 0;
        v67 = 0;
        if (v63 <= v62)
          v63 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v63 == v62)
          {
            LODWORD(v67) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v94 = v62 + 1;
            v95 = *(_BYTE *)(v64 + v62);
            *((_QWORD *)a2 + 1) = v94;
            v67 |= (unint64_t)(v95 & 0x7F) << v92;
            if (v95 < 0)
            {
              v92 += 7;
              v62 = v94;
              v18 = v93++ > 8;
              if (v18)
                goto LABEL_108;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v67) = 0;
          }
          break;
        }
LABEL_139:
        *((_DWORD *)this + 20) = v67;
        goto LABEL_21;
      case 9u:
        v70 = (_QWORD *)operator new();
        v70[1] = 0;
        v70[2] = 0;
        *v70 = 0;
        v71 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v70;
        if (v71)
          std::default_delete<std::string>::operator()[abi:ne180100](v71);
        break;
      case 0xAu:
        v73 = (char *)*((_QWORD *)this + 6);
        v72 = *((_QWORD *)this + 7);
        if ((unint64_t)v73 >= v72)
        {
          v96 = 0xAAAAAAAAAAAAAAABLL * ((v73 - (char *)v8->__begin_) >> 3);
          v97 = v96 + 1;
          if (v96 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_144:
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          v98 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v72 - (unint64_t)v8->__begin_) >> 3);
          if (2 * v98 > v97)
            v97 = 2 * v98;
          if (v98 >= 0x555555555555555)
            v99 = 0xAAAAAAAAAAAAAAALL;
          else
            v99 = v97;
          __v.__end_cap_.__value_ = v9;
          if (v99)
            v99 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v99);
          else
            v100 = 0;
          v102 = (std::string *)(v99 + 24 * v96);
          __v.__first_ = (std::__split_buffer<std::string>::pointer)v99;
          __v.__begin_ = v102;
          __v.__end_cap_.__value_ = (std::string *)(v99 + 24 * v100);
          v102->__r_.__value_.__r.__words[0] = 0;
          v102->__r_.__value_.__l.__size_ = 0;
          v102->__r_.__value_.__r.__words[2] = 0;
          __v.__end_ = v102 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(v8, &__v);
          v74 = (_QWORD *)*((_QWORD *)this + 6);
          std::__split_buffer<std::string>::~__split_buffer(&__v);
        }
        else
        {
          *(_QWORD *)v73 = 0;
          *((_QWORD *)v73 + 1) = 0;
          v74 = v73 + 24;
          *((_QWORD *)v73 + 2) = 0;
        }
        *((_QWORD *)this + 6) = v74;
        break;
      default:
        goto LABEL_20;
    }
    PB::Reader::read();
LABEL_21:
    v2 = *((_QWORD *)a2 + 1);
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0)
      return v4 == 0;
  }
  v19 = 0;
  v20 = 0;
  v15 = 0;
  if (v2 > v3)
    v3 = v2;
  do
  {
    if (v3 == v2)
    {
      v4 = 1;
      *((_BYTE *)a2 + 24) = 1;
      return v4 == 0;
    }
    v21 = v2 + 1;
    v22 = *(_BYTE *)(v12 + v2);
    *((_QWORD *)a2 + 1) = v21;
    v15 |= (unint64_t)(v22 & 0x7F) << v19;
    if ((v22 & 0x80) == 0)
      goto LABEL_26;
    v19 += 7;
    v2 = v21;
    v18 = v20++ > 8;
  }
  while (!v18);
LABEL_20:
  result = PB::Reader::skip(a2);
  if ((_DWORD)result)
    goto LABEL_21;
  return result;
}

uint64_t sirinluinternal::Token::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  v3 = this;
  if (*(_QWORD *)(this + 64))
    this = PB::Writer::write();
  v4 = *(_BYTE *)(v3 + 92);
  if ((v4 & 1) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v4 = *(_BYTE *)(v3 + 92);
    if ((v4 & 2) == 0)
    {
LABEL_5:
      if ((v4 & 0x10) == 0)
        goto LABEL_6;
LABEL_23:
      this = PB::Writer::write(a2);
      if ((*(_BYTE *)(v3 + 92) & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)(v3 + 92) & 2) == 0)
  {
    goto LABEL_5;
  }
  this = PB::Writer::writeVarInt(a2);
  v4 = *(_BYTE *)(v3 + 92);
  if ((v4 & 0x10) != 0)
    goto LABEL_23;
LABEL_6:
  if ((v4 & 0x20) != 0)
LABEL_7:
    this = PB::Writer::write(a2);
LABEL_8:
  v5 = *(_QWORD *)(v3 + 16);
  v6 = *(_QWORD *)(v3 + 24);
  while (v5 != v6)
  {
    this = PB::Writer::write();
    v5 += 24;
  }
  v7 = *(_BYTE *)(v3 + 92);
  if ((v7 & 8) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v7 = *(_BYTE *)(v3 + 92);
  }
  if ((v7 & 4) != 0)
    this = PB::Writer::writeVarInt(a2);
  if (*(_QWORD *)(v3 + 8))
    this = PB::Writer::write();
  v9 = *(_QWORD *)(v3 + 40);
  v8 = *(_QWORD *)(v3 + 48);
  while (v9 != v8)
  {
    this = PB::Writer::write();
    v9 += 24;
  }
  return this;
}

uint64_t sirinluinternal::Token::formatText(sirinluinternal::Token *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;
  uint64_t i;
  char v7;
  uint64_t v8;
  uint64_t j;

  PB::TextFormatter::beginObject(a2, a3);
  if ((*((_BYTE *)this + 92) & 1) != 0)
    PB::TextFormatter::format(a2, "begin");
  if (*((_QWORD *)this + 1))
    PB::TextFormatter::format();
  v5 = *((_QWORD *)this + 2);
  for (i = *((_QWORD *)this + 3); v5 != i; v5 += 24)
    PB::TextFormatter::format();
  v7 = *((_BYTE *)this + 92);
  if ((v7 & 2) != 0)
  {
    PB::TextFormatter::format(a2, "end");
    v7 = *((_BYTE *)this + 92);
    if ((v7 & 0x10) == 0)
    {
LABEL_9:
      if ((v7 & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)this + 92) & 0x10) == 0)
  {
    goto LABEL_9;
  }
  PB::TextFormatter::format(a2, "is_significant");
  v7 = *((_BYTE *)this + 92);
  if ((v7 & 0x20) == 0)
  {
LABEL_10:
    if ((v7 & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_21:
  PB::TextFormatter::format(a2, "is_whitespace");
  if ((*((_BYTE *)this + 92) & 4) != 0)
LABEL_11:
    PB::TextFormatter::format(a2, "non_whitespace_token_index");
LABEL_12:
  v8 = *((_QWORD *)this + 5);
  for (j = *((_QWORD *)this + 6); v8 != j; v8 += 24)
    PB::TextFormatter::format();
  if ((*((_BYTE *)this + 92) & 8) != 0)
    PB::TextFormatter::format(a2, "token_index");
  if (*((_QWORD *)this + 8))
    PB::TextFormatter::format();
  return PB::TextFormatter::endObject(a2);
}

double sirinluinternal::Token::Token(sirinluinternal::Token *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB1F28;
  *((_DWORD *)this + 23) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB1F28;
  *((_DWORD *)this + 23) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  return result;
}

sirinluinternal::Token *sirinluinternal::Token::Token(sirinluinternal::Token *this, const sirinluinternal::Token *a2)
{
  uint64_t *v4;
  std::vector<std::string> *v5;
  std::string *v6;
  std::string *v7;
  __int128 *v8;
  __int128 v9;
  uint64_t v10;
  char v11;
  char v12;
  char v13;
  int v14;
  int v15;
  std::string *v16;
  std::string *v17;
  __int128 *v18;
  __int128 v19;
  int v20;
  int v21;
  char v22;
  uint64_t v23;

  *(_QWORD *)this = &off_1E7BB1F28;
  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (uint64_t *)((char *)this + 8);
  *(_OWORD *)((char *)this + 40) = 0u;
  v5 = (std::vector<std::string> *)((char *)this + 40);
  *((_DWORD *)this + 23) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  if (*((_QWORD *)a2 + 8))
  {
    v6 = (std::string *)operator new();
    v7 = v6;
    v8 = (__int128 *)*((_QWORD *)a2 + 8);
    if (*((char *)v8 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)v8, *((_QWORD *)v8 + 1));
    }
    else
    {
      v9 = *v8;
      v6->__r_.__value_.__r.__words[2] = *((_QWORD *)v8 + 2);
      *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v9;
    }
    v10 = *((_QWORD *)this + 8);
    *((_QWORD *)this + 8) = v7;
    if (v10)
      std::default_delete<std::string>::operator()[abi:ne180100](v10);
  }
  v11 = *((_BYTE *)a2 + 92);
  if ((v11 & 1) != 0)
  {
    v20 = *((_DWORD *)a2 + 18);
    *((_BYTE *)this + 92) |= 1u;
    *((_DWORD *)this + 18) = v20;
    v11 = *((_BYTE *)a2 + 92);
    if ((v11 & 2) == 0)
    {
LABEL_9:
      if ((v11 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_23;
    }
  }
  else if ((*((_BYTE *)a2 + 92) & 2) == 0)
  {
    goto LABEL_9;
  }
  v21 = *((_DWORD *)a2 + 19);
  *((_BYTE *)this + 92) |= 2u;
  *((_DWORD *)this + 19) = v21;
  v11 = *((_BYTE *)a2 + 92);
  if ((v11 & 0x10) == 0)
  {
LABEL_10:
    if ((v11 & 0x20) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_23:
  v22 = *((_BYTE *)a2 + 88);
  *((_BYTE *)this + 92) |= 0x10u;
  *((_BYTE *)this + 88) = v22;
  if ((*((_BYTE *)a2 + 92) & 0x20) != 0)
  {
LABEL_11:
    v12 = *((_BYTE *)a2 + 89);
    *((_BYTE *)this + 92) |= 0x20u;
    *((_BYTE *)this + 89) = v12;
  }
LABEL_12:
  if (this != a2)
    std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>((std::vector<std::string> *)((char *)this + 16), *((std::string **)a2 + 2), *((__int128 **)a2 + 3), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 3) - *((_QWORD *)a2 + 2)) >> 3));
  v13 = *((_BYTE *)a2 + 92);
  if ((v13 & 8) != 0)
  {
    v14 = *((_DWORD *)a2 + 21);
    *((_BYTE *)this + 92) |= 8u;
    *((_DWORD *)this + 21) = v14;
    v13 = *((_BYTE *)a2 + 92);
  }
  if ((v13 & 4) != 0)
  {
    v15 = *((_DWORD *)a2 + 20);
    *((_BYTE *)this + 92) |= 4u;
    *((_DWORD *)this + 20) = v15;
  }
  if (*((_QWORD *)a2 + 1))
  {
    v16 = (std::string *)operator new();
    v17 = v16;
    v18 = (__int128 *)*((_QWORD *)a2 + 1);
    if (*((char *)v18 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v16, *(const std::string::value_type **)v18, *((_QWORD *)v18 + 1));
    }
    else
    {
      v19 = *v18;
      v16->__r_.__value_.__r.__words[2] = *((_QWORD *)v18 + 2);
      *(_OWORD *)&v16->__r_.__value_.__l.__data_ = v19;
    }
    v23 = *v4;
    *v4 = (uint64_t)v17;
    if (v23)
      std::default_delete<std::string>::operator()[abi:ne180100](v23);
  }
  if (this != a2)
    std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>(v5, *((std::string **)a2 + 5), *((__int128 **)a2 + 6), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 6) - *((_QWORD *)a2 + 5)) >> 3));
  return this;
}

uint64_t sirinluinternal::Token::operator=(uint64_t a1, const sirinluinternal::Token *a2)
{
  sirinluinternal::Token *v3;
  _BYTE v5[96];

  if ((const sirinluinternal::Token *)a1 != a2)
  {
    sirinluinternal::Token::Token((sirinluinternal::Token *)v5, a2);
    sirinluinternal::swap(a1, (sirinluinternal::Token *)v5, v3);
    sirinluinternal::Token::~Token((sirinluinternal::Token *)v5);
  }
  return a1;
}

uint64_t sirinluinternal::swap(uint64_t this, sirinluinternal::Token *a2, sirinluinternal::Token *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_DWORD *)(this + 92);
  *(_DWORD *)(this + 92) = *((_DWORD *)a2 + 23);
  *((_DWORD *)a2 + 23) = v3;
  v4 = *(_QWORD *)(this + 64);
  *(_QWORD *)(this + 64) = *((_QWORD *)a2 + 8);
  *((_QWORD *)a2 + 8) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 72);
  *(_DWORD *)(this + 72) = *((_DWORD *)a2 + 18);
  *((_DWORD *)a2 + 18) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 76);
  *(_DWORD *)(this + 76) = *((_DWORD *)a2 + 19);
  *((_DWORD *)a2 + 19) = v4;
  LOBYTE(v4) = *(_BYTE *)(this + 88);
  *(_BYTE *)(this + 88) = *((_BYTE *)a2 + 88);
  *((_BYTE *)a2 + 88) = v4;
  LOBYTE(v4) = *(_BYTE *)(this + 89);
  *(_BYTE *)(this + 89) = *((_BYTE *)a2 + 89);
  *((_BYTE *)a2 + 89) = v4;
  v5 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v5;
  v6 = *(_QWORD *)(this + 24);
  *(_QWORD *)(this + 24) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v6;
  v7 = *(_QWORD *)(this + 32);
  *(_QWORD *)(this + 32) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v7;
  LODWORD(v7) = *(_DWORD *)(this + 84);
  *(_DWORD *)(this + 84) = *((_DWORD *)a2 + 21);
  *((_DWORD *)a2 + 21) = v7;
  LODWORD(v7) = *(_DWORD *)(this + 80);
  *(_DWORD *)(this + 80) = *((_DWORD *)a2 + 20);
  *((_DWORD *)a2 + 20) = v7;
  v8 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v8;
  v9 = *(_QWORD *)(this + 40);
  *(_QWORD *)(this + 40) = *((_QWORD *)a2 + 5);
  *((_QWORD *)a2 + 5) = v9;
  v10 = *(_QWORD *)(this + 48);
  *(_QWORD *)(this + 48) = *((_QWORD *)a2 + 6);
  *((_QWORD *)a2 + 6) = v10;
  v11 = *(_QWORD *)(this + 56);
  *(_QWORD *)(this + 56) = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v11;
  return this;
}

uint64_t sirinluinternal::Token::Token(uint64_t a1, uint64_t a2)
{
  std::vector<std::string> *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = &off_1E7BB1F28;
  v4 = (std::vector<std::string> *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_DWORD *)(a2 + 92) = 0;
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a2 + 64) = 0;
  v6 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v5;
  if (v6)
    std::default_delete<std::string>::operator()[abi:ne180100](v6);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a2 + 76);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_BYTE *)(a1 + 89) = *(_BYTE *)(a2 + 89);
  std::vector<std::string>::__vdeallocate(v4);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a2 + 24) = 0u;
  v7 = *(_DWORD *)(a2 + 84);
  v8 = *(_QWORD *)(a2 + 8);
  *(_OWORD *)(a2 + 8) = 0u;
  *(_DWORD *)(a1 + 84) = v7;
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  v9 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  if (v9)
    std::default_delete<std::string>::operator()[abi:ne180100](v9);
  std::vector<std::string>::__vdeallocate((std::vector<std::string> *)(a1 + 40));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  return a1;
}

uint64_t sirinluinternal::Token::operator=(uint64_t a1, uint64_t a2)
{
  sirinluinternal::Token *v3;
  _BYTE v5[96];

  if (a1 != a2)
  {
    sirinluinternal::Token::Token((uint64_t)v5, a2);
    sirinluinternal::swap(a1, (sirinluinternal::Token *)v5, v3);
    sirinluinternal::Token::~Token((sirinluinternal::Token *)v5);
  }
  return a1;
}

BOOL sirinluinternal::Token::operator==(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v4;
  unsigned __int8 **v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  unsigned __int8 *v10;
  char v11;
  char v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;

  v4 = *(unsigned __int8 **)(a1 + 64);
  v5 = *(unsigned __int8 ***)(a2 + 64);
  if (v4)
  {
    if (!v5)
      return 0;
    v6 = v4[23];
    if ((v6 & 0x80u) == 0)
      v7 = (unsigned __int8 *)v4[23];
    else
      v7 = (unsigned __int8 *)*((_QWORD *)v4 + 1);
    v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
    v9 = (char)v8;
    if ((char)v8 < 0)
      v8 = v5[1];
    if (v7 != v8)
      return 0;
    if (v9 >= 0)
      v10 = *(unsigned __int8 **)(a2 + 64);
    else
      v10 = *v5;
    if ((v6 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v4, v10, *((_QWORD *)v4 + 1)))
        return 0;
    }
    else if (v4[23])
    {
      while (*v4 == *v10)
      {
        ++v4;
        ++v10;
        if (!--v6)
          goto LABEL_18;
      }
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
LABEL_18:
  v11 = *(_BYTE *)(a1 + 92);
  v12 = *(_BYTE *)(a2 + 92);
  if ((v11 & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 92) & 1) == 0 || *(_DWORD *)(a1 + 72) != *(_DWORD *)(a2 + 72))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 92) & 1) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 92) & 2) != 0)
  {
    if ((*(_BYTE *)(a2 + 92) & 2) == 0 || *(_DWORD *)(a1 + 76) != *(_DWORD *)(a2 + 76))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 92) & 2) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 92) & 0x10) != 0)
  {
    if ((*(_BYTE *)(a2 + 92) & 0x10) == 0 || *(unsigned __int8 *)(a1 + 88) != *(unsigned __int8 *)(a2 + 88))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 92) & 0x10) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 92) & 0x20) != 0)
  {
    if ((*(_BYTE *)(a2 + 92) & 0x20) == 0 || *(unsigned __int8 *)(a1 + 89) != *(unsigned __int8 *)(a2 + 89))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 92) & 0x20) != 0)
  {
    return 0;
  }
  if (std::operator==[abi:ne180100]<std::string,std::allocator<std::string>>(*(unsigned __int8 **)(a1 + 16), *(unsigned __int8 **)(a1 + 24), *(unsigned __int8 **)(a2 + 16), *(_QWORD *)(a2 + 24)))
  {
    if ((v11 & 8) != 0)
    {
      if ((v12 & 8) == 0 || *(_DWORD *)(a1 + 84) != *(_DWORD *)(a2 + 84))
        return 0;
    }
    else if ((v12 & 8) != 0)
    {
      return 0;
    }
    if ((v11 & 4) != 0)
    {
      if ((v12 & 4) == 0 || *(_DWORD *)(a1 + 80) != *(_DWORD *)(a2 + 80))
        return 0;
    }
    else if ((v12 & 4) != 0)
    {
      return 0;
    }
    v13 = *(unsigned __int8 **)(a1 + 8);
    v14 = *(unsigned __int8 **)(a2 + 8);
    if (v13)
    {
      if (!v14 || !std::__equal_to::operator()[abi:ne180100]<std::string,std::string>(v13, v14))
        return 0;
      return std::operator==[abi:ne180100]<std::string,std::allocator<std::string>>(*(unsigned __int8 **)(a1 + 40), *(unsigned __int8 **)(a1 + 48), *(unsigned __int8 **)(a2 + 40), *(_QWORD *)(a2 + 48));
    }
    if (!v14)
      return std::operator==[abi:ne180100]<std::string,std::allocator<std::string>>(*(unsigned __int8 **)(a1 + 40), *(unsigned __int8 **)(a1 + 48), *(unsigned __int8 **)(a2 + 40), *(_QWORD *)(a2 + 48));
  }
  return 0;
}

unint64_t sirinluinternal::Token::hash_value(sirinluinternal::Token *this)
{
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v2 = *((_QWORD *)this + 8);
  if (v2)
    v3 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  else
    v3 = 0;
  v4 = *((_BYTE *)this + 92);
  if ((v4 & 1) != 0)
  {
    v19 = *((int *)this + 18);
    if ((*((_BYTE *)this + 92) & 2) != 0)
    {
LABEL_6:
      v18 = *((int *)this + 19);
      if ((*((_BYTE *)this + 92) & 0x10) != 0)
        goto LABEL_7;
LABEL_11:
      v5 = 0;
      if ((*((_BYTE *)this + 92) & 0x20) != 0)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
  else
  {
    v19 = 0;
    if ((*((_BYTE *)this + 92) & 2) != 0)
      goto LABEL_6;
  }
  v18 = 0;
  if ((*((_BYTE *)this + 92) & 0x10) == 0)
    goto LABEL_11;
LABEL_7:
  v5 = *((unsigned __int8 *)this + 88);
  if ((*((_BYTE *)this + 92) & 0x20) != 0)
  {
LABEL_8:
    v6 = *((unsigned __int8 *)this + 89);
    goto LABEL_13;
  }
LABEL_12:
  v6 = 0;
LABEL_13:
  v8 = *((_QWORD *)this + 2);
  v7 = *((_QWORD *)this + 3);
  if (v8 == v7)
  {
    v9 = 0;
    if ((*((_BYTE *)this + 92) & 8) == 0)
      goto LABEL_17;
LABEL_20:
    v10 = *((int *)this + 21);
    if ((v4 & 4) != 0)
      goto LABEL_18;
    goto LABEL_21;
  }
  v9 = 0;
  do
  {
    v9 ^= std::__string_hash<char>::operator()[abi:ne180100](v8);
    v8 += 24;
  }
  while (v8 != v7);
  if ((v4 & 8) != 0)
    goto LABEL_20;
LABEL_17:
  v10 = 0;
  if ((v4 & 4) != 0)
  {
LABEL_18:
    v11 = *((int *)this + 20);
    goto LABEL_22;
  }
LABEL_21:
  v11 = 0;
LABEL_22:
  v12 = *((_QWORD *)this + 1);
  if (v12)
    v13 = std::__string_hash<char>::operator()[abi:ne180100](v12);
  else
    v13 = 0;
  v14 = *((_QWORD *)this + 5);
  v15 = *((_QWORD *)this + 6);
  if (v14 == v15)
  {
    v16 = 0;
  }
  else
  {
    v16 = 0;
    do
    {
      v16 ^= std::__string_hash<char>::operator()[abi:ne180100](v14);
      v14 += 24;
    }
    while (v14 != v15);
  }
  return v19 ^ v3 ^ v18 ^ v5 ^ v6 ^ v9 ^ v10 ^ v11 ^ v13 ^ v16;
}

void sirinluinternalcontextupdate::ReformedTurnInputBundle::~ReformedTurnInputBundle(sirinluinternalcontextupdate::ReformedTurnInputBundle *this)
{
  sirinluinternalcontextupdate::ReformedTurnInputBundle::~ReformedTurnInputBundle(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  void **v3;

  *(_QWORD *)this = &off_1E7BB1F78;
  v3 = (void **)((char *)this + 16);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v2 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::readFrom(sirinluinternalcontextupdate::ReformedTurnInputBundle *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t **v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  char v32;
  unsigned int v33;
  unint64_t v34;
  char v35;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (uint64_t **)((char *)this + 16);
    do
    {
      v9 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        v16 = 0;
        v17 = 0;
        v12 = 0;
        if (v2 > v3)
          v3 = v2;
        while (v3 != v2)
        {
          v18 = v2 + 1;
          v19 = *(_BYTE *)(v9 + v2);
          *((_QWORD *)a2 + 1) = v18;
          v12 |= (unint64_t)(v19 & 0x7F) << v16;
          if ((v19 & 0x80) == 0)
            goto LABEL_21;
          v16 += 7;
          v2 = v18;
          v15 = v17++ > 8;
          if (v15)
            goto LABEL_32;
        }
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_32;
      }
LABEL_21:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        PB::PtrVector<sirinluexternal::TurnInput>::emplace_back<>(v8);
        v30 = *(_QWORD *)(*((_QWORD *)this + 3) - 8);
      }
      else
      {
        if ((_DWORD)v20 != 2)
        {
          if ((_DWORD)v20 == 1)
          {
            *((_BYTE *)this + 44) |= 1u;
            v21 = *((_QWORD *)a2 + 1);
            v22 = *((_QWORD *)a2 + 2);
            v23 = *(_QWORD *)a2;
            if (v21 > 0xFFFFFFFFFFFFFFF5 || v21 + 10 > v22)
            {
              v32 = 0;
              v33 = 0;
              v26 = 0;
              if (v22 <= v21)
                v22 = *((_QWORD *)a2 + 1);
              while (1)
              {
                if (v22 == v21)
                {
                  LODWORD(v26) = 0;
                  *((_BYTE *)a2 + 24) = 1;
                  goto LABEL_50;
                }
                v34 = v21 + 1;
                v35 = *(_BYTE *)(v23 + v21);
                *((_QWORD *)a2 + 1) = v34;
                v26 |= (unint64_t)(v35 & 0x7F) << v32;
                if ((v35 & 0x80) == 0)
                  break;
                v32 += 7;
                v21 = v34;
                v15 = v33++ > 8;
                if (v15)
                {
LABEL_46:
                  LODWORD(v26) = 0;
                  goto LABEL_50;
                }
              }
              if (*((_BYTE *)a2 + 24))
                LODWORD(v26) = 0;
            }
            else
            {
              v24 = 0;
              v25 = 0;
              v26 = 0;
              while (1)
              {
                v27 = v21 + 1;
                *((_QWORD *)a2 + 1) = v21 + 1;
                v28 = *(_BYTE *)(v23 + v21);
                v26 |= (unint64_t)(v28 & 0x7F) << v24;
                if ((v28 & 0x80) == 0)
                  break;
                v24 += 7;
                v21 = v27;
                v15 = v25++ > 8;
                if (v15)
                  goto LABEL_46;
              }
            }
LABEL_50:
            *((_DWORD *)this + 10) = v26;
          }
          else
          {
LABEL_32:
            result = PB::Reader::skip(a2);
            if (!(_DWORD)result)
              return result;
          }
          goto LABEL_51;
        }
        v30 = operator new();
        *(_QWORD *)v30 = &off_1E7BB16E8;
        *(_DWORD *)(v30 + 148) = 0;
        *(_OWORD *)(v30 + 8) = 0u;
        *(_OWORD *)(v30 + 24) = 0u;
        *(_OWORD *)(v30 + 40) = 0u;
        *(_OWORD *)(v30 + 56) = 0u;
        *(_OWORD *)(v30 + 72) = 0u;
        *(_OWORD *)(v30 + 88) = 0u;
        *(_OWORD *)(v30 + 104) = 0u;
        *(_QWORD *)(v30 + 128) = 0;
        *(_QWORD *)(v30 + 136) = 0;
        v31 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v30;
        if (v31)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
          v30 = *((_QWORD *)this + 1);
        }
      }
      if (!PB::Reader::placeMark()
        || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v30 + 16))(v30, a2) & 1) == 0)
      {
        return 0;
      }
      PB::Reader::recallMark();
LABEL_51:
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
    }
    while (v2 < v3 && v4 == 0);
  }
  return v4 == 0;
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::writeTo(uint64_t this, PB::Writer *a2)
{
  _QWORD *v3;
  const PB::Base *v4;
  const PB::Base **v5;
  const PB::Base **v6;
  const PB::Base *v7;

  v3 = (_QWORD *)this;
  if ((*(_BYTE *)(this + 44) & 1) != 0)
    this = PB::Writer::writeVarInt(a2);
  v4 = (const PB::Base *)v3[1];
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v6 = (const PB::Base **)v3[2];
  v5 = (const PB::Base **)v3[3];
  while (v6 != v5)
  {
    v7 = *v6++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  return this;
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::formatText(sirinluinternalcontextupdate::ReformedTurnInputBundle *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "current_turn");
  v6 = (uint64_t *)*((_QWORD *)this + 2);
  v7 = (uint64_t *)*((_QWORD *)this + 3);
  while (v6 != v7)
  {
    v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v8 + 32))(v8, a2, "previous_turns");
  }
  if ((*((_BYTE *)this + 44) & 1) != 0)
    PB::TextFormatter::format(a2, "type");
  return PB::TextFormatter::endObject(a2);
}

double sirinluinternalcontextupdate::ReformedTurnInputBundle::ReformedTurnInputBundle(sirinluinternalcontextupdate::ReformedTurnInputBundle *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB1F78;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_QWORD *)this + 5) = 0;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB1F78;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_QWORD *)this + 5) = 0;
  return result;
}

sirinluinternalcontextupdate::ReformedTurnInputBundle *sirinluinternalcontextupdate::ReformedTurnInputBundle::ReformedTurnInputBundle(sirinluinternalcontextupdate::ReformedTurnInputBundle *this, const sirinluinternalcontextupdate::ReformedTurnInputBundle *a2)
{
  sirinluexternal::TurnInput **v4;
  int v5;
  sirinluexternal::TurnInput *v6;
  sirinluexternal::TurnInput *v7;
  sirinluexternal::TurnInput *v8;
  const sirinluexternal::TurnInput **v9;
  const sirinluexternal::TurnInput **i;

  *(_QWORD *)this = &off_1E7BB1F78;
  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (sirinluexternal::TurnInput **)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_QWORD *)this + 5) = 0;
  if ((*((_BYTE *)a2 + 44) & 1) != 0)
  {
    v5 = *((_DWORD *)a2 + 10);
    *((_BYTE *)this + 44) = 1;
    *((_DWORD *)this + 10) = v5;
  }
  if (*((_QWORD *)a2 + 1))
  {
    v6 = (sirinluexternal::TurnInput *)operator new();
    v7 = sirinluexternal::TurnInput::TurnInput(v6, *((const sirinluexternal::TurnInput **)a2 + 1));
    v8 = *v4;
    *v4 = v7;
    if (v8)
      (*(void (**)(sirinluexternal::TurnInput *))(*(_QWORD *)v8 + 8))(v8);
  }
  v9 = (const sirinluexternal::TurnInput **)*((_QWORD *)a2 + 2);
  for (i = (const sirinluexternal::TurnInput **)*((_QWORD *)a2 + 3); v9 != i; ++v9)
    PB::PtrVector<sirinluexternal::TurnInput>::emplace_back<sirinluexternal::TurnInput const&>((sirinluexternal::TurnInput ***)this + 2, *v9);
  return this;
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::operator=(uint64_t a1, const sirinluinternalcontextupdate::ReformedTurnInputBundle *a2)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  if ((const sirinluinternalcontextupdate::ReformedTurnInputBundle *)a1 != a2)
  {
    sirinluinternalcontextupdate::ReformedTurnInputBundle::ReformedTurnInputBundle((sirinluinternalcontextupdate::ReformedTurnInputBundle *)&v7, a2);
    v3 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v10;
    v10 = v3;
    v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v8;
    v8 = v4;
    v5 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v9;
    v9 = v5;
    sirinluinternalcontextupdate::ReformedTurnInputBundle::~ReformedTurnInputBundle((sirinluinternalcontextupdate::ReformedTurnInputBundle *)&v7);
  }
  return a1;
}

uint64_t sirinluinternalcontextupdate::swap(uint64_t this, sirinluinternalcontextupdate::ReformedTurnInputBundle *a2, sirinluinternalcontextupdate::ReformedTurnInputBundle *a3)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_DWORD *)(this + 44);
  *(_DWORD *)(this + 44) = *((_DWORD *)a2 + 11);
  *((_DWORD *)a2 + 11) = v3;
  v4 = *(_DWORD *)(this + 40);
  *(_DWORD *)(this + 40) = *((_DWORD *)a2 + 10);
  *((_DWORD *)a2 + 10) = v4;
  v5 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v5;
  v6 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v6;
  v7 = *(_QWORD *)(this + 24);
  *(_QWORD *)(this + 24) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v7;
  v8 = *(_QWORD *)(this + 32);
  *(_QWORD *)(this + 32) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v8;
  return this;
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::ReformedTurnInputBundle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = &off_1E7BB1F78;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a2 + 44) = 0;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate((_QWORD *)(a1 + 16));
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  return a1;
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sirinluinternalcontextupdate::ReformedTurnInputBundle::ReformedTurnInputBundle((uint64_t)&v7, a2);
    v3 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v10;
    v10 = v3;
    v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v8;
    v8 = v4;
    v5 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v9;
    v9 = v5;
    sirinluinternalcontextupdate::ReformedTurnInputBundle::~ReformedTurnInputBundle((sirinluinternalcontextupdate::ReformedTurnInputBundle *)&v7);
  }
  return a1;
}

uint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)(a1 + 44) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 44) & 1) == 0 || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a2 + 40))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 44) & 1) != 0)
  {
    return 0;
  }
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5 || (sirinluexternal::TurnInput::operator==(v4, v5) & 1) == 0)
      return 0;
    return PB::PtrVector<sirinluexternal::TurnInput>::operator==((uint64_t *)(a1 + 16), *(uint64_t **)(a2 + 16), *(_QWORD *)(a2 + 24));
  }
  if (!v5)
    return PB::PtrVector<sirinluexternal::TurnInput>::operator==((uint64_t *)(a1 + 16), *(uint64_t **)(a2 + 16), *(_QWORD *)(a2 + 24));
  return 0;
}

unint64_t sirinluinternalcontextupdate::ReformedTurnInputBundle::hash_value(sirinluinternalcontextupdate::ReformedTurnInputBundle *this)
{
  uint64_t v2;
  sirinluexternal::TurnInput *v3;
  unint64_t v4;
  sirinluexternal::TurnInput **v5;
  sirinluexternal::TurnInput **v6;
  uint64_t v7;
  sirinluexternal::TurnInput *v8;

  if ((*((_BYTE *)this + 44) & 1) != 0)
    v2 = *((int *)this + 10);
  else
    v2 = 0;
  v3 = (sirinluexternal::TurnInput *)*((_QWORD *)this + 1);
  if (v3)
    v4 = sirinluexternal::TurnInput::hash_value(v3);
  else
    v4 = 0;
  v6 = (sirinluexternal::TurnInput **)*((_QWORD *)this + 2);
  v5 = (sirinluexternal::TurnInput **)*((_QWORD *)this + 3);
  if (v6 == v5)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    do
    {
      v8 = *v6++;
      v7 ^= sirinluexternal::TurnInput::hash_value(v8);
    }
    while (v6 != v5);
  }
  return v4 ^ v2 ^ v7;
}

_QWORD *sirinluinternalcontextupdate::ReformedTurnInputBundle::makeCurrentTurn(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BB16E8;
    *(_DWORD *)(v2 + 148) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_QWORD *)(v2 + 128) = 0;
    *(_QWORD *)(v2 + 136) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void sirinluexternal::AsrTokenInformation::~AsrTokenInformation(sirinluexternal::AsrTokenInformation *this)
{
  sirinluexternal::AsrTokenInformation::~AsrTokenInformation(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)this = &off_1E7BB1FC8;
  v2 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v2)
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  v3 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    std::default_delete<std::string>::operator()[abi:ne180100](v3);
  v4 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    std::default_delete<std::string>::operator()[abi:ne180100](v4);
  PB::Base::~Base(this);
}

uint64_t sirinluexternal::AsrTokenInformation::readFrom(sirinluexternal::AsrTokenInformation *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  BOOL v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  BOOL v32;
  unint64_t v33;
  unint64_t v34;
  int v35;
  BOOL v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char v57;
  unsigned int v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  char v65;
  unsigned int v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  char v70;
  unsigned int v71;
  unint64_t v72;
  char v73;
  char v74;
  unsigned int v75;
  unint64_t v76;
  char v77;
  char v78;
  unsigned int v79;
  unint64_t v80;
  char v81;
  char v82;
  unsigned int v83;
  unint64_t v84;
  char v85;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (1)
  {
    v8 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
    {
      v15 = 0;
      v16 = 0;
      v11 = 0;
      if (v2 > v3)
        v3 = v2;
      do
      {
        if (v3 == v2)
        {
          v4 = 1;
          *((_BYTE *)a2 + 24) = 1;
          return v4 == 0;
        }
        v17 = v2 + 1;
        v18 = *(_BYTE *)(v8 + v2);
        *((_QWORD *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0)
          goto LABEL_25;
        v15 += 7;
        v2 = v17;
        v14 = v16++ > 8;
      }
      while (!v14);
LABEL_19:
      result = PB::Reader::skip(a2);
      if (!(_DWORD)result)
        return result;
      goto LABEL_20;
    }
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
      v13 = *(_BYTE *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0)
        break;
      v9 += 7;
      v2 = v12;
      v14 = v10++ > 8;
      if (v14)
        goto LABEL_19;
    }
LABEL_25:
    if ((v11 & 7) == 4)
      break;
    switch((v11 >> 3))
    {
      case 1u:
        v21 = (_QWORD *)operator new();
        v21[1] = 0;
        v21[2] = 0;
        *v21 = 0;
        v22 = *((_QWORD *)this + 4);
        *((_QWORD *)this + 4) = v21;
        if (v22)
          goto LABEL_32;
        goto LABEL_33;
      case 2u:
        v23 = (_QWORD *)operator new();
        v23[1] = 0;
        v23[2] = 0;
        *v23 = 0;
        v22 = *((_QWORD *)this + 3);
        *((_QWORD *)this + 3) = v23;
        if (v22)
          goto LABEL_32;
        goto LABEL_33;
      case 3u:
        v24 = (_QWORD *)operator new();
        v24[1] = 0;
        v24[2] = 0;
        *v24 = 0;
        v22 = *((_QWORD *)this + 2);
        *((_QWORD *)this + 2) = v24;
        if (v22)
LABEL_32:
          std::default_delete<std::string>::operator()[abi:ne180100](v22);
LABEL_33:
        PB::Reader::read();
        goto LABEL_20;
      case 4u:
        *((_BYTE *)this + 60) |= 0x20u;
        v25 = *((_QWORD *)a2 + 1);
        if (v25 >= *((_QWORD *)a2 + 2))
        {
          v28 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v26 = v25 + 1;
          v27 = *(unsigned __int8 *)(*(_QWORD *)a2 + v25);
          *((_QWORD *)a2 + 1) = v26;
          v28 = v27 != 0;
        }
        *((_BYTE *)this + 56) = v28;
        goto LABEL_20;
      case 5u:
        *((_BYTE *)this + 60) |= 0x40u;
        v29 = *((_QWORD *)a2 + 1);
        if (v29 >= *((_QWORD *)a2 + 2))
        {
          v32 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v30 = v29 + 1;
          v31 = *(unsigned __int8 *)(*(_QWORD *)a2 + v29);
          *((_QWORD *)a2 + 1) = v30;
          v32 = v31 != 0;
        }
        *((_BYTE *)this + 57) = v32;
        goto LABEL_20;
      case 6u:
        *((_BYTE *)this + 60) |= 0x80u;
        v33 = *((_QWORD *)a2 + 1);
        if (v33 >= *((_QWORD *)a2 + 2))
        {
          v36 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v34 = v33 + 1;
          v35 = *(unsigned __int8 *)(*(_QWORD *)a2 + v33);
          *((_QWORD *)a2 + 1) = v34;
          v36 = v35 != 0;
        }
        *((_BYTE *)this + 58) = v36;
        goto LABEL_20;
      case 7u:
        *((_BYTE *)this + 60) |= 1u;
        v37 = *((_QWORD *)a2 + 1);
        if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *((_QWORD *)a2 + 2))
        {
          *((_QWORD *)this + 1) = *(_QWORD *)(*(_QWORD *)a2 + v37);
          *((_QWORD *)a2 + 1) += 8;
        }
        else
        {
          *((_BYTE *)a2 + 24) = 1;
        }
        goto LABEL_20;
      case 8u:
        *((_BYTE *)this + 60) |= 2u;
        v38 = *((_QWORD *)a2 + 1);
        v39 = *((_QWORD *)a2 + 2);
        v40 = *(_QWORD *)a2;
        if (v38 <= 0xFFFFFFFFFFFFFFF5 && v38 + 10 <= v39)
        {
          v41 = 0;
          v42 = 0;
          v43 = 0;
          do
          {
            v44 = v38 + 1;
            *((_QWORD *)a2 + 1) = v38 + 1;
            v45 = *(_BYTE *)(v40 + v38);
            v43 |= (unint64_t)(v45 & 0x7F) << v41;
            if ((v45 & 0x80) == 0)
              goto LABEL_109;
            v41 += 7;
            v38 = v44;
            v14 = v42++ > 8;
          }
          while (!v14);
LABEL_83:
          LODWORD(v43) = 0;
          goto LABEL_109;
        }
        v70 = 0;
        v71 = 0;
        v43 = 0;
        if (v39 <= v38)
          v39 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v39 == v38)
          {
            LODWORD(v43) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v72 = v38 + 1;
            v73 = *(_BYTE *)(v40 + v38);
            *((_QWORD *)a2 + 1) = v72;
            v43 |= (unint64_t)(v73 & 0x7F) << v70;
            if (v73 < 0)
            {
              v70 += 7;
              v38 = v72;
              v14 = v71++ > 8;
              if (v14)
                goto LABEL_83;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v43) = 0;
          }
          break;
        }
LABEL_109:
        *((_DWORD *)this + 10) = v43;
        goto LABEL_20;
      case 9u:
        *((_BYTE *)this + 60) |= 4u;
        v46 = *((_QWORD *)a2 + 1);
        v47 = *((_QWORD *)a2 + 2);
        v48 = *(_QWORD *)a2;
        if (v46 <= 0xFFFFFFFFFFFFFFF5 && v46 + 10 <= v47)
        {
          v49 = 0;
          v50 = 0;
          v51 = 0;
          do
          {
            v52 = v46 + 1;
            *((_QWORD *)a2 + 1) = v46 + 1;
            v53 = *(_BYTE *)(v48 + v46);
            v51 |= (unint64_t)(v53 & 0x7F) << v49;
            if ((v53 & 0x80) == 0)
              goto LABEL_113;
            v49 += 7;
            v46 = v52;
            v14 = v50++ > 8;
          }
          while (!v14);
LABEL_90:
          LODWORD(v51) = 0;
          goto LABEL_113;
        }
        v74 = 0;
        v75 = 0;
        v51 = 0;
        if (v47 <= v46)
          v47 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v47 == v46)
          {
            LODWORD(v51) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v76 = v46 + 1;
            v77 = *(_BYTE *)(v48 + v46);
            *((_QWORD *)a2 + 1) = v76;
            v51 |= (unint64_t)(v77 & 0x7F) << v74;
            if (v77 < 0)
            {
              v74 += 7;
              v46 = v76;
              v14 = v75++ > 8;
              if (v14)
                goto LABEL_90;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v51) = 0;
          }
          break;
        }
LABEL_113:
        *((_DWORD *)this + 11) = v51;
        goto LABEL_20;
      case 0xAu:
        *((_BYTE *)this + 60) |= 0x10u;
        v54 = *((_QWORD *)a2 + 1);
        v55 = *((_QWORD *)a2 + 2);
        v56 = *(_QWORD *)a2;
        if (v54 <= 0xFFFFFFFFFFFFFFF5 && v54 + 10 <= v55)
        {
          v57 = 0;
          v58 = 0;
          v59 = 0;
          do
          {
            v60 = v54 + 1;
            *((_QWORD *)a2 + 1) = v54 + 1;
            v61 = *(_BYTE *)(v56 + v54);
            v59 |= (unint64_t)(v61 & 0x7F) << v57;
            if ((v61 & 0x80) == 0)
              goto LABEL_117;
            v57 += 7;
            v54 = v60;
            v14 = v58++ > 8;
          }
          while (!v14);
LABEL_97:
          LODWORD(v59) = 0;
          goto LABEL_117;
        }
        v78 = 0;
        v79 = 0;
        v59 = 0;
        if (v55 <= v54)
          v55 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v55 == v54)
          {
            LODWORD(v59) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v80 = v54 + 1;
            v81 = *(_BYTE *)(v56 + v54);
            *((_QWORD *)a2 + 1) = v80;
            v59 |= (unint64_t)(v81 & 0x7F) << v78;
            if (v81 < 0)
            {
              v78 += 7;
              v54 = v80;
              v14 = v79++ > 8;
              if (v14)
                goto LABEL_97;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v59) = 0;
          }
          break;
        }
LABEL_117:
        *((_DWORD *)this + 13) = v59;
        goto LABEL_20;
      case 0xBu:
        *((_BYTE *)this + 60) |= 8u;
        v62 = *((_QWORD *)a2 + 1);
        v63 = *((_QWORD *)a2 + 2);
        v64 = *(_QWORD *)a2;
        if (v62 <= 0xFFFFFFFFFFFFFFF5 && v62 + 10 <= v63)
        {
          v65 = 0;
          v66 = 0;
          v67 = 0;
          do
          {
            v68 = v62 + 1;
            *((_QWORD *)a2 + 1) = v62 + 1;
            v69 = *(_BYTE *)(v64 + v62);
            v67 |= (unint64_t)(v69 & 0x7F) << v65;
            if ((v69 & 0x80) == 0)
              goto LABEL_121;
            v65 += 7;
            v62 = v68;
            v14 = v66++ > 8;
          }
          while (!v14);
LABEL_104:
          LODWORD(v67) = 0;
          goto LABEL_121;
        }
        v82 = 0;
        v83 = 0;
        v67 = 0;
        if (v63 <= v62)
          v63 = *((_QWORD *)a2 + 1);
        break;
      default:
        goto LABEL_19;
    }
    while (1)
    {
      if (v63 == v62)
      {
        LODWORD(v67) = 0;
        *((_BYTE *)a2 + 24) = 1;
        goto LABEL_121;
      }
      v84 = v62 + 1;
      v85 = *(_BYTE *)(v64 + v62);
      *((_QWORD *)a2 + 1) = v84;
      v67 |= (unint64_t)(v85 & 0x7F) << v82;
      if ((v85 & 0x80) == 0)
        break;
      v82 += 7;
      v62 = v84;
      v14 = v83++ > 8;
      if (v14)
        goto LABEL_104;
    }
    if (*((_BYTE *)a2 + 24))
      LODWORD(v67) = 0;
LABEL_121:
    *((_DWORD *)this + 12) = v67;
LABEL_20:
    v2 = *((_QWORD *)a2 + 1);
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0)
      return v4 == 0;
  }
  v4 = 0;
  return v4 == 0;
}

uint64_t sirinluexternal::AsrTokenInformation::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  if (*(_QWORD *)(this + 32))
    this = PB::Writer::write();
  if (*(_QWORD *)(v3 + 24))
    this = PB::Writer::write();
  if (*(_QWORD *)(v3 + 16))
    this = PB::Writer::write();
  v4 = *(_BYTE *)(v3 + 60);
  if ((v4 & 0x20) != 0)
  {
    this = PB::Writer::write(a2);
    v4 = *(_BYTE *)(v3 + 60);
    if ((v4 & 0x40) == 0)
    {
LABEL_9:
      if ((v4 & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)(v3 + 60) & 0x40) == 0)
  {
    goto LABEL_9;
  }
  this = PB::Writer::write(a2);
  v4 = *(_BYTE *)(v3 + 60);
  if ((v4 & 0x80) == 0)
  {
LABEL_10:
    if ((v4 & 1) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  this = PB::Writer::write(a2);
  v4 = *(_BYTE *)(v3 + 60);
  if ((v4 & 1) == 0)
  {
LABEL_11:
    if ((v4 & 2) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  this = PB::Writer::write(a2, *(double *)(v3 + 8));
  v4 = *(_BYTE *)(v3 + 60);
  if ((v4 & 2) == 0)
  {
LABEL_12:
    if ((v4 & 4) == 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  this = PB::Writer::writeVarInt(a2);
  v4 = *(_BYTE *)(v3 + 60);
  if ((v4 & 4) == 0)
  {
LABEL_13:
    if ((v4 & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_22;
  }
LABEL_21:
  this = PB::Writer::writeVarInt(a2);
  v4 = *(_BYTE *)(v3 + 60);
  if ((v4 & 0x10) == 0)
  {
LABEL_14:
    if ((v4 & 8) == 0)
      return this;
    return PB::Writer::writeVarInt(a2);
  }
LABEL_22:
  this = PB::Writer::writeVarInt(a2);
  if ((*(_BYTE *)(v3 + 60) & 8) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

uint64_t sirinluexternal::AsrTokenInformation::formatText(sirinluexternal::AsrTokenInformation *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;
  char v6;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 60);
  if ((v5 & 0x20) != 0)
  {
    PB::TextFormatter::format(a2, "add_space_after");
    v5 = *((_BYTE *)this + 60);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*((_BYTE *)this + 60) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "begin_index");
  v5 = *((_BYTE *)this + 60);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_21;
  }
LABEL_20:
  PB::TextFormatter::format(a2, "confidence_score", *((double *)this + 1));
  v5 = *((_BYTE *)this + 60);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_21:
  PB::TextFormatter::format(a2, "end_index");
  if ((*((_BYTE *)this + 60) & 8) != 0)
LABEL_6:
    PB::TextFormatter::format(a2, "end_milli_seconds");
LABEL_7:
  if (*((_QWORD *)this + 2))
    PB::TextFormatter::format();
  if (*((_QWORD *)this + 3))
    PB::TextFormatter::format();
  if (*((_QWORD *)this + 4))
    PB::TextFormatter::format();
  v6 = *((_BYTE *)this + 60);
  if ((v6 & 0x40) == 0)
  {
    if ((*((_BYTE *)this + 60) & 0x80) == 0)
      goto LABEL_15;
LABEL_24:
    PB::TextFormatter::format(a2, "remove_space_before");
    if ((*((_BYTE *)this + 60) & 0x10) == 0)
      return PB::TextFormatter::endObject(a2);
    goto LABEL_16;
  }
  PB::TextFormatter::format(a2, "remove_space_after");
  v6 = *((_BYTE *)this + 60);
  if (v6 < 0)
    goto LABEL_24;
LABEL_15:
  if ((v6 & 0x10) != 0)
LABEL_16:
    PB::TextFormatter::format(a2, "start_milli_seconds");
  return PB::TextFormatter::endObject(a2);
}

uint64_t sirinluexternal::AsrTokenInformation::AsrTokenInformation(uint64_t this)
{
  *(_QWORD *)this = &off_1E7BB1FC8;
  *(_DWORD *)(this + 60) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 32) = 0;
  *(_QWORD *)(this + 16) = 0;
  return this;
}

{
  *(_QWORD *)this = &off_1E7BB1FC8;
  *(_DWORD *)(this + 60) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 32) = 0;
  *(_QWORD *)(this + 16) = 0;
  return this;
}

sirinluexternal::AsrTokenInformation *sirinluexternal::AsrTokenInformation::AsrTokenInformation(sirinluexternal::AsrTokenInformation *this, const sirinluexternal::AsrTokenInformation *a2)
{
  uint64_t *v4;
  std::string *v5;
  std::string *v6;
  __int128 *v7;
  __int128 v8;
  uint64_t v9;
  std::string *v10;
  std::string *v11;
  __int128 *v12;
  __int128 v13;
  uint64_t v14;
  std::string *v15;
  std::string *v16;
  __int128 *v17;
  __int128 v18;
  uint64_t v19;
  char v20;
  int v21;
  char v23;
  char v24;
  char v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;

  *(_QWORD *)this = &off_1E7BB1FC8;
  *((_QWORD *)this + 2) = 0;
  v4 = (uint64_t *)((char *)this + 16);
  *((_DWORD *)this + 15) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  if (*((_QWORD *)a2 + 4))
  {
    v5 = (std::string *)operator new();
    v6 = v5;
    v7 = (__int128 *)*((_QWORD *)a2 + 4);
    if (*((char *)v7 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)v7, *((_QWORD *)v7 + 1));
    }
    else
    {
      v8 = *v7;
      v5->__r_.__value_.__r.__words[2] = *((_QWORD *)v7 + 2);
      *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v8;
    }
    v9 = *((_QWORD *)this + 4);
    *((_QWORD *)this + 4) = v6;
    if (v9)
      std::default_delete<std::string>::operator()[abi:ne180100](v9);
  }
  if (*((_QWORD *)a2 + 3))
  {
    v10 = (std::string *)operator new();
    v11 = v10;
    v12 = (__int128 *)*((_QWORD *)a2 + 3);
    if (*((char *)v12 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)v12, *((_QWORD *)v12 + 1));
    }
    else
    {
      v13 = *v12;
      v10->__r_.__value_.__r.__words[2] = *((_QWORD *)v12 + 2);
      *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v13;
    }
    v14 = *((_QWORD *)this + 3);
    *((_QWORD *)this + 3) = v11;
    if (v14)
      std::default_delete<std::string>::operator()[abi:ne180100](v14);
  }
  if (*((_QWORD *)a2 + 2))
  {
    v15 = (std::string *)operator new();
    v16 = v15;
    v17 = (__int128 *)*((_QWORD *)a2 + 2);
    if (*((char *)v17 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v15, *(const std::string::value_type **)v17, *((_QWORD *)v17 + 1));
    }
    else
    {
      v18 = *v17;
      v15->__r_.__value_.__r.__words[2] = *((_QWORD *)v17 + 2);
      *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v18;
    }
    v19 = *v4;
    *v4 = (uint64_t)v16;
    if (v19)
      std::default_delete<std::string>::operator()[abi:ne180100](v19);
  }
  v20 = *((_BYTE *)a2 + 60);
  if ((v20 & 0x20) != 0)
  {
    v23 = *((_BYTE *)a2 + 56);
    *((_BYTE *)this + 60) |= 0x20u;
    *((_BYTE *)this + 56) = v23;
    v20 = *((_BYTE *)a2 + 60);
    if ((v20 & 0x40) == 0)
    {
LABEL_21:
      if ((v20 & 0x80) == 0)
        goto LABEL_22;
      goto LABEL_31;
    }
  }
  else if ((*((_BYTE *)a2 + 60) & 0x40) == 0)
  {
    goto LABEL_21;
  }
  v24 = *((_BYTE *)a2 + 57);
  *((_BYTE *)this + 60) |= 0x40u;
  *((_BYTE *)this + 57) = v24;
  v20 = *((_BYTE *)a2 + 60);
  if ((v20 & 0x80) == 0)
  {
LABEL_22:
    if ((v20 & 1) == 0)
      goto LABEL_23;
    goto LABEL_32;
  }
LABEL_31:
  v25 = *((_BYTE *)a2 + 58);
  *((_BYTE *)this + 60) |= 0x80u;
  *((_BYTE *)this + 58) = v25;
  v20 = *((_BYTE *)a2 + 60);
  if ((v20 & 1) == 0)
  {
LABEL_23:
    if ((v20 & 2) == 0)
      goto LABEL_24;
    goto LABEL_33;
  }
LABEL_32:
  v26 = *((_QWORD *)a2 + 1);
  *((_BYTE *)this + 60) |= 1u;
  *((_QWORD *)this + 1) = v26;
  v20 = *((_BYTE *)a2 + 60);
  if ((v20 & 2) == 0)
  {
LABEL_24:
    if ((v20 & 4) == 0)
      goto LABEL_25;
    goto LABEL_34;
  }
LABEL_33:
  v27 = *((_DWORD *)a2 + 10);
  *((_BYTE *)this + 60) |= 2u;
  *((_DWORD *)this + 10) = v27;
  v20 = *((_BYTE *)a2 + 60);
  if ((v20 & 4) == 0)
  {
LABEL_25:
    if ((v20 & 0x10) == 0)
      goto LABEL_26;
LABEL_35:
    v29 = *((_DWORD *)a2 + 13);
    *((_BYTE *)this + 60) |= 0x10u;
    *((_DWORD *)this + 13) = v29;
    if ((*((_BYTE *)a2 + 60) & 8) == 0)
      return this;
    goto LABEL_27;
  }
LABEL_34:
  v28 = *((_DWORD *)a2 + 11);
  *((_BYTE *)this + 60) |= 4u;
  *((_DWORD *)this + 11) = v28;
  v20 = *((_BYTE *)a2 + 60);
  if ((v20 & 0x10) != 0)
    goto LABEL_35;
LABEL_26:
  if ((v20 & 8) != 0)
  {
LABEL_27:
    v21 = *((_DWORD *)a2 + 12);
    *((_BYTE *)this + 60) |= 8u;
    *((_DWORD *)this + 12) = v21;
  }
  return this;
}

sirinluexternal *sirinluexternal::AsrTokenInformation::operator=(sirinluexternal *a1, const sirinluexternal::AsrTokenInformation *a2)
{
  sirinluexternal::AsrTokenInformation *v3;
  _BYTE v5[64];

  if (a1 != a2)
  {
    sirinluexternal::AsrTokenInformation::AsrTokenInformation((sirinluexternal::AsrTokenInformation *)v5, a2);
    sirinluexternal::swap(a1, (sirinluexternal::AsrTokenInformation *)v5, v3);
    sirinluexternal::AsrTokenInformation::~AsrTokenInformation((sirinluexternal::AsrTokenInformation *)v5);
  }
  return a1;
}

double sirinluexternal::swap(sirinluexternal *this, sirinluexternal::AsrTokenInformation *a2, sirinluexternal::AsrTokenInformation *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double result;

  v3 = *((_DWORD *)this + 15);
  *((_DWORD *)this + 15) = *((_DWORD *)a2 + 15);
  *((_DWORD *)a2 + 15) = v3;
  v4 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v4;
  v5 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v5;
  v6 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v6;
  LOBYTE(v6) = *((_BYTE *)this + 56);
  *((_BYTE *)this + 56) = *((_BYTE *)a2 + 56);
  *((_BYTE *)a2 + 56) = v6;
  LOBYTE(v6) = *((_BYTE *)this + 57);
  *((_BYTE *)this + 57) = *((_BYTE *)a2 + 57);
  *((_BYTE *)a2 + 57) = v6;
  LOBYTE(v6) = *((_BYTE *)this + 58);
  *((_BYTE *)this + 58) = *((_BYTE *)a2 + 58);
  *((_BYTE *)a2 + 58) = v6;
  result = *((double *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((double *)a2 + 1) = result;
  LODWORD(v6) = *((_DWORD *)this + 10);
  *((_DWORD *)this + 10) = *((_DWORD *)a2 + 10);
  *((_DWORD *)a2 + 10) = v6;
  LODWORD(v6) = *((_DWORD *)this + 11);
  *((_DWORD *)this + 11) = *((_DWORD *)a2 + 11);
  *((_DWORD *)a2 + 11) = v6;
  LODWORD(v6) = *((_DWORD *)this + 13);
  *((_DWORD *)this + 13) = *((_DWORD *)a2 + 13);
  *((_DWORD *)a2 + 13) = v6;
  LODWORD(v6) = *((_DWORD *)this + 12);
  *((_DWORD *)this + 12) = *((_DWORD *)a2 + 12);
  *((_DWORD *)a2 + 12) = v6;
  return result;
}

uint64_t sirinluexternal::AsrTokenInformation::AsrTokenInformation(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = &off_1E7BB1FC8;
  *(_QWORD *)(a1 + 16) = 0;
  v4 = (uint64_t *)(a1 + 16);
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 60) = *(_DWORD *)(a2 + 60);
  *(_DWORD *)(a2 + 60) = 0;
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a2 + 32) = 0;
  v6 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v5;
  if (v6)
    std::default_delete<std::string>::operator()[abi:ne180100](v6);
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 24) = 0;
  v8 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  if (v8)
    std::default_delete<std::string>::operator()[abi:ne180100](v8);
  v9 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v10 = *v4;
  *v4 = v9;
  if (v10)
    std::default_delete<std::string>::operator()[abi:ne180100](v10);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  return a1;
}

sirinluexternal *sirinluexternal::AsrTokenInformation::operator=(sirinluexternal *a1, uint64_t a2)
{
  sirinluexternal::AsrTokenInformation *v3;
  _BYTE v5[64];

  if (a1 != (sirinluexternal *)a2)
  {
    sirinluexternal::AsrTokenInformation::AsrTokenInformation((uint64_t)v5, a2);
    sirinluexternal::swap(a1, (sirinluexternal::AsrTokenInformation *)v5, v3);
    sirinluexternal::AsrTokenInformation::~AsrTokenInformation((sirinluexternal::AsrTokenInformation *)v5);
  }
  return a1;
}

BOOL sirinluexternal::AsrTokenInformation::operator==(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v4;
  unsigned __int8 **v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  unsigned __int8 **v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  int v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  unsigned __int8 **v19;
  uint64_t v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  int v23;
  unsigned __int8 *v24;
  int v25;
  int v26;
  _BOOL8 result;

  v4 = *(unsigned __int8 **)(a1 + 32);
  v5 = *(unsigned __int8 ***)(a2 + 32);
  if (v4)
  {
    if (!v5)
      return 0;
    v6 = v4[23];
    if ((v6 & 0x80u) == 0)
      v7 = (unsigned __int8 *)v4[23];
    else
      v7 = (unsigned __int8 *)*((_QWORD *)v4 + 1);
    v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
    v9 = (char)v8;
    if ((char)v8 < 0)
      v8 = v5[1];
    if (v7 != v8)
      return 0;
    if (v9 >= 0)
      v10 = *(unsigned __int8 **)(a2 + 32);
    else
      v10 = *v5;
    if ((v6 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v4, v10, *((_QWORD *)v4 + 1)))
        return 0;
    }
    else if (v4[23])
    {
      while (*v4 == *v10)
      {
        ++v4;
        ++v10;
        if (!--v6)
          goto LABEL_18;
      }
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
LABEL_18:
  v11 = *(unsigned __int8 **)(a1 + 24);
  v12 = *(unsigned __int8 ***)(a2 + 24);
  if (v11)
  {
    if (!v12)
      return 0;
    v13 = v11[23];
    if ((v13 & 0x80u) == 0)
      v14 = (unsigned __int8 *)v11[23];
    else
      v14 = (unsigned __int8 *)*((_QWORD *)v11 + 1);
    v15 = (unsigned __int8 *)*((unsigned __int8 *)v12 + 23);
    v16 = (char)v15;
    if ((char)v15 < 0)
      v15 = v12[1];
    if (v14 != v15)
      return 0;
    if (v16 >= 0)
      v17 = *(unsigned __int8 **)(a2 + 24);
    else
      v17 = *v12;
    if ((v13 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v11, v17, *((_QWORD *)v11 + 1)))
        return 0;
    }
    else if (v11[23])
    {
      while (*v11 == *v17)
      {
        ++v11;
        ++v17;
        if (!--v13)
          goto LABEL_35;
      }
      return 0;
    }
  }
  else if (v12)
  {
    return 0;
  }
LABEL_35:
  v18 = *(unsigned __int8 **)(a1 + 16);
  v19 = *(unsigned __int8 ***)(a2 + 16);
  if (v18)
  {
    if (!v19)
      return 0;
    v20 = v18[23];
    if ((v20 & 0x80u) == 0)
      v21 = (unsigned __int8 *)v18[23];
    else
      v21 = (unsigned __int8 *)*((_QWORD *)v18 + 1);
    v22 = (unsigned __int8 *)*((unsigned __int8 *)v19 + 23);
    v23 = (char)v22;
    if ((char)v22 < 0)
      v22 = v19[1];
    if (v21 != v22)
      return 0;
    if (v23 >= 0)
      v24 = *(unsigned __int8 **)(a2 + 16);
    else
      v24 = *v19;
    if ((v20 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v18, v24, *((_QWORD *)v18 + 1)))
        return 0;
    }
    else if (v18[23])
    {
      while (*v18 == *v24)
      {
        ++v18;
        ++v24;
        if (!--v20)
          goto LABEL_54;
      }
      return 0;
    }
  }
  else if (v19)
  {
    return 0;
  }
LABEL_54:
  v25 = *(unsigned __int8 *)(a1 + 60);
  v26 = *(unsigned __int8 *)(a2 + 60);
  if ((v25 & 0x20) != 0)
  {
    if ((v26 & 0x20) == 0 || *(unsigned __int8 *)(a1 + 56) != *(unsigned __int8 *)(a2 + 56))
      return 0;
  }
  else if ((v26 & 0x20) != 0)
  {
    return 0;
  }
  if ((v25 & 0x40) != 0)
  {
    if ((v26 & 0x40) == 0 || *(unsigned __int8 *)(a1 + 57) != *(unsigned __int8 *)(a2 + 57))
      return 0;
  }
  else if ((v26 & 0x40) != 0)
  {
    return 0;
  }
  if ((v25 & v26 & 0x80) != 0)
  {
    if (*(unsigned __int8 *)(a1 + 58) != *(unsigned __int8 *)(a2 + 58))
      return 0;
  }
  else if (((v25 | v26) & 0x80) != 0)
  {
    return 0;
  }
  if ((v25 & 1) != 0)
  {
    if ((v26 & 1) == 0 || *(double *)(a1 + 8) != *(double *)(a2 + 8))
      return 0;
  }
  else if ((v26 & 1) != 0)
  {
    return 0;
  }
  if ((v25 & 2) != 0)
  {
    if ((v26 & 2) == 0 || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a2 + 40))
      return 0;
  }
  else if ((v26 & 2) != 0)
  {
    return 0;
  }
  if ((v25 & 4) != 0)
  {
    if ((v26 & 4) == 0 || *(_DWORD *)(a1 + 44) != *(_DWORD *)(a2 + 44))
      return 0;
  }
  else if ((v26 & 4) != 0)
  {
    return 0;
  }
  if ((v25 & 0x10) != 0)
  {
    if ((v26 & 0x10) == 0 || *(_DWORD *)(a1 + 52) != *(_DWORD *)(a2 + 52))
      return 0;
  }
  else if ((v26 & 0x10) != 0)
  {
    return 0;
  }
  result = (v26 & 8) == 0;
  if ((v25 & 8) == 0)
    return result;
  return (v26 & 8) != 0 && *(_DWORD *)(a1 + 48) == *(_DWORD *)(a2 + 48);
}

unint64_t sirinluexternal::AsrTokenInformation::hash_value(sirinluexternal::AsrTokenInformation *this)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *((_QWORD *)this + 4);
  if (v2)
    v3 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  else
    v3 = 0;
  v4 = *((_QWORD *)this + 3);
  if (v4)
    v5 = std::__string_hash<char>::operator()[abi:ne180100](v4);
  else
    v5 = 0;
  v6 = *((_QWORD *)this + 2);
  if (v6)
    v6 = std::__string_hash<char>::operator()[abi:ne180100](v6);
  if ((*((_BYTE *)this + 60) & 0x20) != 0)
  {
    v7 = *((unsigned __int8 *)this + 56);
    if ((*((_BYTE *)this + 60) & 0x40) != 0)
    {
LABEL_11:
      v8 = *((unsigned __int8 *)this + 57);
      if ((*((_BYTE *)this + 60) & 0x80) != 0)
        goto LABEL_12;
      goto LABEL_22;
    }
  }
  else
  {
    v7 = 0;
    if ((*((_BYTE *)this + 60) & 0x40) != 0)
      goto LABEL_11;
  }
  v8 = 0;
  if ((*((_BYTE *)this + 60) & 0x80) != 0)
  {
LABEL_12:
    v9 = *((unsigned __int8 *)this + 58);
    if ((*((_BYTE *)this + 60) & 1) != 0)
      goto LABEL_13;
LABEL_23:
    v10 = 0.0;
    if ((*((_BYTE *)this + 60) & 2) != 0)
      goto LABEL_16;
    goto LABEL_24;
  }
LABEL_22:
  v9 = 0;
  if ((*((_BYTE *)this + 60) & 1) == 0)
    goto LABEL_23;
LABEL_13:
  v10 = *((double *)this + 1);
  if (v10 == 0.0)
    v10 = 0.0;
  if ((*((_BYTE *)this + 60) & 2) != 0)
  {
LABEL_16:
    v11 = *((unsigned int *)this + 10);
    if ((*((_BYTE *)this + 60) & 4) != 0)
      goto LABEL_17;
    goto LABEL_25;
  }
LABEL_24:
  v11 = 0;
  if ((*((_BYTE *)this + 60) & 4) != 0)
  {
LABEL_17:
    v12 = *((unsigned int *)this + 11);
    if ((*((_BYTE *)this + 60) & 0x10) != 0)
      goto LABEL_18;
LABEL_26:
    v13 = 0;
    if ((*((_BYTE *)this + 60) & 8) != 0)
      goto LABEL_19;
LABEL_27:
    v14 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ *(_QWORD *)&v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_25:
  v12 = 0;
  if ((*((_BYTE *)this + 60) & 0x10) == 0)
    goto LABEL_26;
LABEL_18:
  v13 = *((int *)this + 13);
  if ((*((_BYTE *)this + 60) & 8) == 0)
    goto LABEL_27;
LABEL_19:
  v14 = *((int *)this + 12);
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ *(_QWORD *)&v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

void sirinluinternalnlv4_parser::NLv4ParserRequest::~NLv4ParserRequest(sirinluinternalnlv4_parser::NLv4ParserRequest *this)
{
  sirinluinternalnlv4_parser::NLv4ParserRequest::~NLv4ParserRequest(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;

  *(_QWORD *)this = &off_1E7BB2018;
  v2 = *((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  v7 = (void **)((char *)this + 16);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v7);
  v6 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  PB::Base::~Base(this);
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::readFrom(sirinluinternalnlv4_parser::NLv4ParserRequest *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t **v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  char v36;
  unsigned int v37;
  unint64_t v38;
  char v39;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  v8 = (uint64_t **)((char *)this + 16);
  while (1)
  {
    v9 = *(_QWORD *)a2;
    if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3)
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_20;
      }
LABEL_22:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v12 >> 3))
      {
        case 1u:
          v21 = operator new();
          *(_QWORD *)v21 = &off_1E7BB0CB8;
          *(_QWORD *)(v21 + 24) = 0;
          v22 = *((_QWORD *)this + 7);
          *((_QWORD *)this + 7) = v21;
          if (v22)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
            v21 = *((_QWORD *)this + 7);
          }
          goto LABEL_42;
        case 2u:
          v21 = operator new();
          *(_QWORD *)v21 = &off_1E7BAE788;
          *(_QWORD *)(v21 + 8) = 0;
          *(_QWORD *)(v21 + 16) = 0;
          *(_QWORD *)(v21 + 24) = 0;
          v23 = *((_QWORD *)this + 8);
          *((_QWORD *)this + 8) = v21;
          if (v23)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
            v21 = *((_QWORD *)this + 8);
          }
          goto LABEL_42;
        case 3u:
          v21 = operator new();
          *(_QWORD *)v21 = &off_1E7BB1DD0;
          *(_DWORD *)(v21 + 64) = 0;
          *(_OWORD *)(v21 + 8) = 0u;
          *(_OWORD *)(v21 + 24) = 0u;
          v24 = *((_QWORD *)this + 1);
          *((_QWORD *)this + 1) = v21;
          if (v24)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
            v21 = *((_QWORD *)this + 1);
          }
          goto LABEL_42;
        case 4u:
          PB::PtrVector<sirinluinternal::MatchingSpan>::emplace_back<>(v8);
          v21 = *(_QWORD *)(*((_QWORD *)this + 3) - 8);
          goto LABEL_42;
        case 5u:
          v21 = operator new();
          *(_QWORD *)v21 = &off_1E7BB16E8;
          *(_DWORD *)(v21 + 148) = 0;
          *(_OWORD *)(v21 + 8) = 0u;
          *(_OWORD *)(v21 + 24) = 0u;
          *(_OWORD *)(v21 + 40) = 0u;
          *(_OWORD *)(v21 + 56) = 0u;
          *(_OWORD *)(v21 + 72) = 0u;
          *(_OWORD *)(v21 + 88) = 0u;
          *(_OWORD *)(v21 + 104) = 0u;
          *(_QWORD *)(v21 + 128) = 0;
          *(_QWORD *)(v21 + 136) = 0;
          v25 = *((_QWORD *)this + 9);
          *((_QWORD *)this + 9) = v21;
          if (v25)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
            v21 = *((_QWORD *)this + 9);
          }
          goto LABEL_42;
        case 6u:
          *((_BYTE *)this + 80) |= 1u;
          v26 = *((_QWORD *)a2 + 1);
          v27 = *((_QWORD *)a2 + 2);
          v28 = *(_QWORD *)a2;
          if (v26 <= 0xFFFFFFFFFFFFFFF5 && v26 + 10 <= v27)
          {
            v29 = 0;
            v30 = 0;
            v31 = 0;
            do
            {
              v32 = v26 + 1;
              *((_QWORD *)a2 + 1) = v26 + 1;
              v33 = *(_BYTE *)(v28 + v26);
              v31 |= (unint64_t)(v33 & 0x7F) << v29;
              if ((v33 & 0x80) == 0)
                goto LABEL_60;
              v29 += 7;
              v26 = v32;
              v15 = v30++ > 8;
            }
            while (!v15);
LABEL_56:
            v31 = 0;
            goto LABEL_60;
          }
          v36 = 0;
          v37 = 0;
          v31 = 0;
          if (v27 <= v26)
            v27 = *((_QWORD *)a2 + 1);
          while (2)
          {
            if (v27 == v26)
            {
              v31 = 0;
              *((_BYTE *)a2 + 24) = 1;
            }
            else
            {
              v38 = v26 + 1;
              v39 = *(_BYTE *)(v28 + v26);
              *((_QWORD *)a2 + 1) = v38;
              v31 |= (unint64_t)(v39 & 0x7F) << v36;
              if (v39 < 0)
              {
                v36 += 7;
                v26 = v38;
                v15 = v37++ > 8;
                if (v15)
                  goto LABEL_56;
                continue;
              }
              if (*((_BYTE *)a2 + 24))
                v31 = 0;
            }
            break;
          }
LABEL_60:
          *((_QWORD *)this + 5) = v31;
          goto LABEL_45;
        case 7u:
          v21 = operator new();
          *(_QWORD *)v21 = &off_1E7BAE468;
          *(_OWORD *)(v21 + 8) = 0u;
          *(_OWORD *)(v21 + 24) = 0u;
          *(_OWORD *)(v21 + 40) = 0u;
          *(_QWORD *)(v21 + 56) = 0;
          v34 = *((_QWORD *)this + 6);
          *((_QWORD *)this + 6) = v21;
          if (v34)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v34 + 8))(v34);
            v21 = *((_QWORD *)this + 6);
          }
LABEL_42:
          if (!PB::Reader::placeMark()
            || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v21 + 16))(v21, a2) & 1) == 0)
          {
            return 0;
          }
          PB::Reader::recallMark();
          break;
        default:
          goto LABEL_20;
      }
      goto LABEL_45;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    do
    {
      if (v3 == v2)
      {
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_22;
      v16 += 7;
      v2 = v18;
      v15 = v17++ > 8;
    }
    while (!v15);
LABEL_20:
    result = PB::Reader::skip(a2);
    if (!(_DWORD)result)
      return result;
LABEL_45:
    v2 = *((_QWORD *)a2 + 1);
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0)
      return v4 == 0;
  }
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  const PB::Base *v5;
  const PB::Base *v6;
  const PB::Base **v7;
  const PB::Base **v8;
  const PB::Base *v9;
  const PB::Base *v10;
  const PB::Base *v11;

  v3 = this;
  v4 = *(const PB::Base **)(this + 56);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = *(const PB::Base **)(v3 + 64);
  if (v5)
    this = PB::Writer::writeSubmessage(a2, v5);
  v6 = *(const PB::Base **)(v3 + 8);
  if (v6)
    this = PB::Writer::writeSubmessage(a2, v6);
  v7 = *(const PB::Base ***)(v3 + 16);
  v8 = *(const PB::Base ***)(v3 + 24);
  while (v7 != v8)
  {
    v9 = *v7++;
    this = PB::Writer::writeSubmessage(a2, v9);
  }
  v10 = *(const PB::Base **)(v3 + 72);
  if (v10)
    this = PB::Writer::writeSubmessage(a2, v10);
  if ((*(_BYTE *)(v3 + 80) & 1) != 0)
    this = PB::Writer::writeVarInt(a2);
  v11 = *(const PB::Base **)(v3 + 48);
  if (v11)
    return PB::Writer::writeSubmessage(a2, v11);
  return this;
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::formatText(sirinluinternalnlv4_parser::NLv4ParserRequest *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "embeddings");
  v6 = (uint64_t *)*((_QWORD *)this + 2);
  v7 = (uint64_t *)*((_QWORD *)this + 3);
  while (v6 != v7)
  {
    v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v8 + 32))(v8, a2, "matching_spans");
  }
  if ((*((_BYTE *)this + 80) & 1) != 0)
    PB::TextFormatter::format(a2, "max_num_parses");
  v9 = *((_QWORD *)this + 6);
  if (v9)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v9 + 32))(v9, a2, "nlu_request_id");
  v10 = *((_QWORD *)this + 7);
  if (v10)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v10 + 32))(v10, a2, "request_id");
  v11 = *((_QWORD *)this + 8);
  if (v11)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v11 + 32))(v11, a2, "tokenised_utterance");
  v12 = *((_QWORD *)this + 9);
  if (v12)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v12 + 32))(v12, a2, "turn_input");
  return PB::TextFormatter::endObject(a2);
}

double sirinluinternalnlv4_parser::NLv4ParserRequest::NLv4ParserRequest(sirinluinternalnlv4_parser::NLv4ParserRequest *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB2018;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 20) = 0;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB2018;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 20) = 0;
  return result;
}

sirinluinternalnlv4_parser::NLv4ParserRequest *sirinluinternalnlv4_parser::NLv4ParserRequest::NLv4ParserRequest(sirinluinternalnlv4_parser::NLv4ParserRequest *this, const sirinluinternalnlv4_parser::NLv4ParserRequest *a2)
{
  sirinluinternal::NLv4EmbeddingTensor **v4;
  sirinluexternal::RequestID **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  sirinluinternalnlv4_parser::Tokenisation *v9;
  sirinluinternalnlv4_parser::Tokenisation *v10;
  uint64_t v11;
  char **v12;
  sirinluinternal::NLv4EmbeddingTensor *v13;
  sirinluinternal::NLv4EmbeddingTensor *v14;
  const sirinluinternal::MatchingSpan **v15;
  const sirinluinternal::MatchingSpan **i;
  sirinluexternal::TurnInput *v17;
  sirinluexternal::TurnInput *v18;
  uint64_t v19;
  uint64_t v20;
  sirinluexternal::RequestID *v21;
  sirinluexternal::RequestID *v22;
  sirinluexternal::RequestID *v23;

  *(_QWORD *)this = &off_1E7BB2018;
  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (sirinluinternal::NLv4EmbeddingTensor **)((char *)this + 8);
  *((_OWORD *)this + 3) = 0u;
  v5 = (sirinluexternal::RequestID **)((char *)this + 48);
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 20) = 0;
  if (*((_QWORD *)a2 + 7))
  {
    v6 = operator new();
    v7 = sirinluexternal::UUID::UUID(v6, *((const sirinluexternal::UUID **)a2 + 7));
    v8 = *((_QWORD *)this + 7);
    *((_QWORD *)this + 7) = v7;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  }
  if (*((_QWORD *)a2 + 8))
  {
    v9 = (sirinluinternalnlv4_parser::Tokenisation *)operator new();
    v10 = sirinluinternalnlv4_parser::Tokenisation::Tokenisation(v9, *((const sirinluinternalnlv4_parser::Tokenisation **)a2 + 8));
    v11 = *((_QWORD *)this + 8);
    *((_QWORD *)this + 8) = v10;
    if (v11)
      (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  }
  if (*((_QWORD *)a2 + 1))
  {
    v12 = (char **)operator new();
    v13 = sirinluinternal::NLv4EmbeddingTensor::NLv4EmbeddingTensor(v12, *((char ***)a2 + 1));
    v14 = *v4;
    *v4 = v13;
    if (v14)
      (*(void (**)(sirinluinternal::NLv4EmbeddingTensor *))(*(_QWORD *)v14 + 8))(v14);
  }
  v15 = (const sirinluinternal::MatchingSpan **)*((_QWORD *)a2 + 2);
  for (i = (const sirinluinternal::MatchingSpan **)*((_QWORD *)a2 + 3); v15 != i; ++v15)
    PB::PtrVector<sirinluinternal::MatchingSpan>::emplace_back<sirinluinternal::MatchingSpan const&>((sirinluinternal::MatchingSpan ***)this + 2, *v15);
  if (*((_QWORD *)a2 + 9))
  {
    v17 = (sirinluexternal::TurnInput *)operator new();
    v18 = sirinluexternal::TurnInput::TurnInput(v17, *((const sirinluexternal::TurnInput **)a2 + 9));
    v19 = *((_QWORD *)this + 9);
    *((_QWORD *)this + 9) = v18;
    if (v19)
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
  }
  if ((*((_BYTE *)a2 + 80) & 1) != 0)
  {
    v20 = *((_QWORD *)a2 + 5);
    *((_BYTE *)this + 80) |= 1u;
    *((_QWORD *)this + 5) = v20;
  }
  if (*((_QWORD *)a2 + 6))
  {
    v21 = (sirinluexternal::RequestID *)operator new();
    v22 = sirinluexternal::RequestID::RequestID(v21, *((const sirinluexternal::RequestID **)a2 + 6));
    v23 = *v5;
    *v5 = v22;
    if (v23)
      (*(void (**)(sirinluexternal::RequestID *))(*(_QWORD *)v23 + 8))(v23);
  }
  return this;
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::operator=(uint64_t a1, const sirinluinternalnlv4_parser::NLv4ParserRequest *a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  int v8;
  uint64_t v9;
  _BYTE v11[8];
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  int v17;

  if ((const sirinluinternalnlv4_parser::NLv4ParserRequest *)a1 != a2)
  {
    sirinluinternalnlv4_parser::NLv4ParserRequest::NLv4ParserRequest((sirinluinternalnlv4_parser::NLv4ParserRequest *)v11, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v12;
    v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v13;
    v12 = v3;
    v13 = v4;
    v5 = v16;
    v7 = *(_OWORD *)(a1 + 48);
    v6 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(a1 + 48) = v15;
    *(_OWORD *)(a1 + 64) = v5;
    v8 = *(_DWORD *)(a1 + 80);
    *(_DWORD *)(a1 + 80) = v17;
    v17 = v8;
    v9 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v14;
    v14 = v9;
    v16 = v6;
    v15 = v7;
    sirinluinternalnlv4_parser::NLv4ParserRequest::~NLv4ParserRequest((sirinluinternalnlv4_parser::NLv4ParserRequest *)v11);
  }
  return a1;
}

uint64_t sirinluinternalnlv4_parser::swap(uint64_t this, sirinluinternalnlv4_parser::NLv4ParserRequest *a2, sirinluinternalnlv4_parser::NLv4ParserRequest *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = *(_DWORD *)(this + 80);
  *(_DWORD *)(this + 80) = *((_DWORD *)a2 + 20);
  *((_DWORD *)a2 + 20) = v3;
  v4 = *(_QWORD *)(this + 56);
  *(_QWORD *)(this + 56) = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v4;
  v5 = *(_QWORD *)(this + 64);
  *(_QWORD *)(this + 64) = *((_QWORD *)a2 + 8);
  *((_QWORD *)a2 + 8) = v5;
  v6 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v6;
  v7 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v7;
  v8 = *(_QWORD *)(this + 24);
  *(_QWORD *)(this + 24) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v8;
  v9 = *(_QWORD *)(this + 32);
  v10 = *(_QWORD *)(this + 40);
  v11 = *((_QWORD *)a2 + 5);
  *(_QWORD *)(this + 32) = *((_QWORD *)a2 + 4);
  *(_QWORD *)(this + 40) = v11;
  *((_QWORD *)a2 + 4) = v9;
  v12 = *(_QWORD *)(this + 72);
  *(_QWORD *)(this + 72) = *((_QWORD *)a2 + 9);
  *((_QWORD *)a2 + 9) = v12;
  *((_QWORD *)a2 + 5) = v10;
  v13 = *(_QWORD *)(this + 48);
  *(_QWORD *)(this + 48) = *((_QWORD *)a2 + 6);
  *((_QWORD *)a2 + 6) = v13;
  return this;
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::NLv4ParserRequest(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)a1 = &off_1E7BB2018;
  *(_OWORD *)(a1 + 8) = 0u;
  v4 = (uint64_t *)(a1 + 8);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(_DWORD *)(a2 + 80) = 0;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 56) = 0;
  v6 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a2 + 64) = 0;
  v8 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v7;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  v9 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v10 = *v4;
  *v4 = v9;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate((_QWORD *)(a1 + 16));
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  v11 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 72) = 0;
  v12 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v11;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  v13 = *(_QWORD *)(a2 + 40);
  v14 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 48) = 0;
  v15 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v13;
  *(_QWORD *)(a1 + 48) = v14;
  if (v15)
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
  return a1;
}

uint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  int v8;
  uint64_t v9;
  _BYTE v11[8];
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  int v17;

  if (a1 != a2)
  {
    sirinluinternalnlv4_parser::NLv4ParserRequest::NLv4ParserRequest((uint64_t)v11, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v12;
    v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v13;
    v12 = v3;
    v13 = v4;
    v5 = v16;
    v7 = *(_OWORD *)(a1 + 48);
    v6 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(a1 + 48) = v15;
    *(_OWORD *)(a1 + 64) = v5;
    v8 = *(_DWORD *)(a1 + 80);
    *(_DWORD *)(a1 + 80) = v17;
    v17 = v8;
    v9 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v14;
    v14 = v9;
    v16 = v6;
    v15 = v7;
    sirinluinternalnlv4_parser::NLv4ParserRequest::~NLv4ParserRequest((sirinluinternalnlv4_parser::NLv4ParserRequest *)v11);
  }
  return a1;
}

BOOL sirinluinternalnlv4_parser::NLv4ParserRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a2 + 56);
  if (v4)
  {
    if (!v5 || !sirinluexternal::UUID::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v6 = *(_QWORD **)(a1 + 64);
  v7 = *(_QWORD **)(a2 + 64);
  if (v6)
  {
    if (!v7 || !sirinluinternalnlv4_parser::Tokenisation::operator==(v6, v7))
      return 0;
  }
  else if (v7)
  {
    return 0;
  }
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a2 + 8);
  if (v8)
  {
    if (!v9 || !sirinluinternal::NLv4EmbeddingTensor::operator==(v8, v9))
      return 0;
  }
  else if (v9)
  {
    return 0;
  }
  result = PB::PtrVector<sirinluinternal::MatchingSpan>::operator==((uint64_t *)(a1 + 16), *(uint64_t **)(a2 + 16), *(_QWORD *)(a2 + 24));
  if (!result)
    return result;
  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(_QWORD *)(a2 + 72);
  if (v11)
  {
    if (!v12 || (sirinluexternal::TurnInput::operator==(v11, v12) & 1) == 0)
      return 0;
  }
  else if (v12)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 80) & 1) == 0)
  {
    if ((*(_BYTE *)(a2 + 80) & 1) == 0)
      goto LABEL_29;
    return 0;
  }
  if ((*(_BYTE *)(a2 + 80) & 1) == 0 || *(_QWORD *)(a1 + 40) != *(_QWORD *)(a2 + 40))
    return 0;
LABEL_29:
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a2 + 48);
  result = (v13 | v14) == 0;
  if (v13)
  {
    if (v14)
      return sirinluexternal::RequestID::operator==(*(_QWORD *)(a1 + 48), v14);
  }
  return result;
}

unint64_t sirinluinternalnlv4_parser::NLv4ParserRequest::hash_value(sirinluinternalnlv4_parser::NLv4ParserRequest *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  sirinluinternalnlv4_parser::Tokenisation *v7;
  unint64_t v8;
  sirinluinternal::NLv4EmbeddingTensor *v9;
  unint64_t v10;
  sirinluinternal::MatchingSpan **v11;
  sirinluinternal::MatchingSpan **v12;
  uint64_t v13;
  sirinluinternal::MatchingSpan *v14;
  sirinluexternal::TurnInput *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v2 = *((_QWORD *)this + 7);
  if (!v2)
  {
    v6 = 0;
    goto LABEL_11;
  }
  if ((*(_BYTE *)(v2 + 28) & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)(v2 + 28) & 2) != 0)
      goto LABEL_4;
LABEL_8:
    v4 = 0;
    if ((*(_BYTE *)(v2 + 28) & 4) != 0)
      goto LABEL_5;
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v3 = *(_QWORD *)(v2 + 8);
  if ((*(_BYTE *)(v2 + 28) & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)(v2 + 16);
  if ((*(_BYTE *)(v2 + 28) & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = *(int *)(v2 + 24);
LABEL_10:
  v6 = v4 ^ v3 ^ v5;
LABEL_11:
  v7 = (sirinluinternalnlv4_parser::Tokenisation *)*((_QWORD *)this + 8);
  if (v7)
    v8 = sirinluinternalnlv4_parser::Tokenisation::hash_value(v7);
  else
    v8 = 0;
  v9 = (sirinluinternal::NLv4EmbeddingTensor *)*((_QWORD *)this + 1);
  if (v9)
    v10 = sirinluinternal::NLv4EmbeddingTensor::hash_value(v9);
  else
    v10 = 0;
  v11 = (sirinluinternal::MatchingSpan **)*((_QWORD *)this + 2);
  v12 = (sirinluinternal::MatchingSpan **)*((_QWORD *)this + 3);
  if (v11 == v12)
  {
    v13 = 0;
  }
  else
  {
    v13 = 0;
    do
    {
      v14 = *v11++;
      v13 ^= sirinluinternal::MatchingSpan::hash_value(v14);
    }
    while (v11 != v12);
  }
  v15 = (sirinluexternal::TurnInput *)*((_QWORD *)this + 9);
  if (v15)
    v16 = sirinluexternal::TurnInput::hash_value(v15);
  else
    v16 = 0;
  if ((*((_BYTE *)this + 80) & 1) != 0)
    v17 = *((_QWORD *)this + 5);
  else
    v17 = 0;
  v18 = *((_QWORD *)this + 6);
  if (v18)
    v18 = sirinluexternal::RequestID::hash_value((sirinluexternal::RequestID *)v18);
  return v8 ^ v6 ^ v16 ^ v17 ^ v18 ^ v10 ^ v13;
}

_QWORD *sirinluinternalnlv4_parser::NLv4ParserRequest::makeRequestId(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[7])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    *v2 = &off_1E7BB0CB8;
    v2[3] = 0;
    this = (_QWORD *)v1[7];
    v1[7] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluinternalnlv4_parser::NLv4ParserRequest::makeTokenisedUtterance(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[8])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    *v2 = &off_1E7BAE788;
    v2[1] = 0;
    v2[2] = 0;
    v2[3] = 0;
    this = (_QWORD *)v1[8];
    v1[8] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluinternalnlv4_parser::NLv4ParserRequest::makeEmbeddings(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BB1DD0;
    *(_DWORD *)(v2 + 64) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluinternalnlv4_parser::NLv4ParserRequest::makeTurnInput(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[9])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BB16E8;
    *(_DWORD *)(v2 + 148) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_QWORD *)(v2 + 128) = 0;
    *(_QWORD *)(v2 + 136) = 0;
    this = (_QWORD *)v1[9];
    v1[9] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluinternalnlv4_parser::NLv4ParserRequest::makeNluRequestId(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[6])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BAE468;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_QWORD *)(v2 + 56) = 0;
    this = (_QWORD *)v1[6];
    v1[6] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

uint64_t SIRINLUEXTERNALMatchInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  int v17;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  SIRICOMMONFloatValue *v23;
  uint64_t v24;
  uint64_t result;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    v17 = v10 & 7;
    if (v16 || v17 == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        *(_BYTE *)(a1 + 104) |= 1u;
        v19 = *v3;
        v20 = *(_QWORD *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFFBLL && (v21 = v20 + 4, v20 + 4 <= *(_QWORD *)(a2 + *v4)))
        {
          v22 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v21;
        }
        else
        {
          v22 = 0;
          *(_BYTE *)(a2 + *v5) = 1;
        }
        *(_DWORD *)(a1 + 48) = v22;
        goto LABEL_37;
      case 2u:
        v23 = objc_alloc_init(SIRICOMMONFloatValue);
        objc_storeStrong((id *)(a1 + 40), v23);
        if (!PBReaderPlaceMark() || (SIRICOMMONFloatValueReadFrom((uint64_t)v23, a2) & 1) == 0)
          goto LABEL_66;
        goto LABEL_36;
      case 3u:
        v23 = objc_alloc_init(SIRICOMMONUInt32Value);
        v24 = 96;
        goto LABEL_34;
      case 4u:
        v23 = objc_alloc_init(SIRICOMMONUInt32Value);
        v24 = 72;
        goto LABEL_34;
      case 5u:
        v23 = objc_alloc_init(SIRICOMMONUInt32Value);
        v24 = 88;
        goto LABEL_34;
      case 6u:
        v23 = objc_alloc_init(SIRICOMMONUInt32Value);
        v24 = 64;
        goto LABEL_34;
      case 7u:
        v23 = objc_alloc_init(SIRICOMMONUInt32Value);
        v24 = 32;
        goto LABEL_34;
      case 8u:
        v23 = objc_alloc_init(SIRICOMMONUInt32Value);
        v24 = 80;
        goto LABEL_34;
      case 9u:
        v23 = objc_alloc_init(SIRICOMMONUInt32Value);
        v24 = 56;
LABEL_34:
        objc_storeStrong((id *)(a1 + v24), v23);
        if (PBReaderPlaceMark() && (SIRICOMMONUInt32ValueReadFrom((uint64_t)v23, a2) & 1) != 0)
        {
LABEL_36:
          PBReaderRecallMark();

LABEL_37:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_66:

        return 0;
      case 0xAu:
        if (v17 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v26 = 0;
            v27 = 0;
            v28 = 0;
            while (1)
            {
              v29 = *v3;
              v30 = *(_QWORD *)(a2 + v29);
              v31 = v30 + 1;
              if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
                break;
              v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                v15 = v27++ >= 9;
                if (!v15)
                  continue;
              }
              goto LABEL_51;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_51:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          while (1)
          {
            v36 = *v3;
            v37 = *(_QWORD *)(a2 + v36);
            v38 = v37 + 1;
            if (v37 == -1 || v38 > *(_QWORD *)(a2 + *v4))
              break;
            v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
            *(_QWORD *)(a2 + v36) = v38;
            v35 |= (unint64_t)(v39 & 0x7F) << v33;
            if (v39 < 0)
            {
              v33 += 7;
              v15 = v34++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_61;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_61:
          PBRepeatedInt32Add();
        }
        goto LABEL_37;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_37;
    }
  }
}

uint64_t SIRINLUEXTERNALUsoEdgeReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  SIRINLUEXTERNALUsoEdgeLabel *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t result;
  uint64_t v31;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = objc_alloc_init(SIRINLUEXTERNALUsoEdgeLabel);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALUsoEdgeLabelReadFrom((uint64_t)v24, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          v25 = 0;
          v26 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 2u;
          while (1)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
              break;
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v20 |= (unint64_t)(v29 & 0x7F) << v25;
            if ((v29 & 0x80) == 0)
              goto LABEL_45;
            v25 += 7;
            v14 = v26++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_47;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_47:
          v31 = 24;
        }
        else
        {
          if ((_DWORD)v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 28) |= 1u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_41;
            v18 += 7;
            v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_43;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_43:
          v31 = 8;
        }
        *(_DWORD *)(a1 + v31) = v20;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sirinluinternalcontextupdate::ContextUpdateRequest::~ContextUpdateRequest(sirinluinternalcontextupdate::ContextUpdateRequest *this)
{
  sirinluinternalcontextupdate::ContextUpdateRequest::~ContextUpdateRequest(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;

  *(_QWORD *)this = &off_1E7BB20C8;
  v2 = *((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = 0;
  if (v2)
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  v3 = *((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v6 = (void **)((char *)this + 48);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v6);
  v6 = (void **)((char *)this + 24);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v6);
  v4 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  PB::Base::~Base(this);
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::readFrom(sirinluinternalcontextupdate::ContextUpdateRequest *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  _QWORD *v8;
  uint64_t **v9;
  uint64_t v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  char v17;
  unsigned int v18;
  unint64_t v19;
  char v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  v8 = (_QWORD *)((char *)this + 48);
  v9 = (uint64_t **)((char *)this + 24);
  while (1)
  {
    v10 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      break;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
      v15 = *(_BYTE *)(v10 + v2);
      v13 |= (unint64_t)(v15 & 0x7F) << v11;
      if ((v15 & 0x80) == 0)
        break;
      v11 += 7;
      v2 = v14;
      v16 = v12++ > 8;
      if (v16)
        goto LABEL_20;
    }
LABEL_22:
    if ((v13 & 7) == 4)
    {
      v4 = 0;
      return v4 == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        v22 = operator new();
        *(_QWORD *)v22 = &off_1E7BB16E8;
        *(_DWORD *)(v22 + 148) = 0;
        *(_OWORD *)(v22 + 8) = 0u;
        *(_OWORD *)(v22 + 24) = 0u;
        *(_OWORD *)(v22 + 40) = 0u;
        *(_OWORD *)(v22 + 56) = 0u;
        *(_OWORD *)(v22 + 72) = 0u;
        *(_OWORD *)(v22 + 88) = 0u;
        *(_OWORD *)(v22 + 104) = 0u;
        *(_QWORD *)(v22 + 128) = 0;
        *(_QWORD *)(v22 + 136) = 0;
        v23 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v22;
        if (v23)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
          v22 = *((_QWORD *)this + 1);
        }
        break;
      case 2u:
        PB::PtrVector<sirinluexternal::TurnInput>::emplace_back<>(v9);
        v24 = *((_QWORD *)this + 4);
        goto LABEL_28;
      case 3u:
        PB::PtrVector<sirinluinternal::RewriteHypothesis>::emplace_back<>(v8);
        v24 = *((_QWORD *)this + 7);
LABEL_28:
        v22 = *(_QWORD *)(v24 - 8);
        break;
      case 4u:
        v22 = operator new();
        *(_QWORD *)v22 = &off_1E7BB0CB8;
        *(_QWORD *)(v22 + 24) = 0;
        v25 = *((_QWORD *)this + 9);
        *((_QWORD *)this + 9) = v22;
        if (v25)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
          v22 = *((_QWORD *)this + 9);
        }
        break;
      case 5u:
        v26 = (_QWORD *)operator new();
        v26[1] = 0;
        v26[2] = 0;
        *v26 = 0;
        v27 = *((_QWORD *)this + 10);
        *((_QWORD *)this + 10) = v26;
        if (v27)
          std::default_delete<std::string>::operator()[abi:ne180100](v27);
        PB::Reader::read();
        goto LABEL_39;
      case 6u:
        v22 = operator new();
        *(_QWORD *)v22 = &off_1E7BB0CB8;
        *(_QWORD *)(v22 + 24) = 0;
        v28 = *((_QWORD *)this + 2);
        *((_QWORD *)this + 2) = v22;
        if (v28)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v28 + 8))(v28);
          v22 = *((_QWORD *)this + 2);
        }
        break;
      default:
        goto LABEL_20;
    }
    if (!PB::Reader::placeMark()
      || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v22 + 16))(v22, a2) & 1) == 0)
    {
      return 0;
    }
    PB::Reader::recallMark();
LABEL_39:
    v2 = *((_QWORD *)a2 + 1);
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || *((_BYTE *)a2 + 24))
      return v4 == 0;
  }
  v17 = 0;
  v18 = 0;
  v13 = 0;
  if (v2 > v3)
    v3 = v2;
  do
  {
    if (v3 == v2)
    {
      v4 = 1;
      *((_BYTE *)a2 + 24) = 1;
      return v4 == 0;
    }
    v19 = v2 + 1;
    v20 = *(_BYTE *)(v10 + v2);
    *((_QWORD *)a2 + 1) = v19;
    v13 |= (unint64_t)(v20 & 0x7F) << v17;
    if ((v20 & 0x80) == 0)
      goto LABEL_22;
    v17 += 7;
    v2 = v19;
    v16 = v18++ > 8;
  }
  while (!v16);
LABEL_20:
  result = PB::Reader::skip(a2);
  if ((_DWORD)result)
    goto LABEL_39;
  return result;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  _QWORD *v3;
  const PB::Base *v4;
  const PB::Base **v5;
  const PB::Base **v6;
  const PB::Base *v7;
  const PB::Base **v8;
  const PB::Base **v9;
  const PB::Base *v10;
  const PB::Base *v11;
  const PB::Base *v12;

  v3 = (_QWORD *)this;
  v4 = *(const PB::Base **)(this + 8);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = (const PB::Base **)v3[3];
  v6 = (const PB::Base **)v3[4];
  while (v5 != v6)
  {
    v7 = *v5++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  v8 = (const PB::Base **)v3[6];
  v9 = (const PB::Base **)v3[7];
  while (v8 != v9)
  {
    v10 = *v8++;
    this = PB::Writer::writeSubmessage(a2, v10);
  }
  v11 = (const PB::Base *)v3[9];
  if (v11)
    this = PB::Writer::writeSubmessage(a2, v11);
  if (v3[10])
    this = PB::Writer::write();
  v12 = (const PB::Base *)v3[2];
  if (v12)
    return PB::Writer::writeSubmessage(a2, v12);
  return this;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::formatText(sirinluinternalcontextupdate::ContextUpdateRequest *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "current_turn");
  v6 = *((_QWORD *)this + 2);
  if (v6)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v6 + 32))(v6, a2, "nlu_request_id");
  v7 = (uint64_t *)*((_QWORD *)this + 3);
  v8 = (uint64_t *)*((_QWORD *)this + 4);
  while (v7 != v8)
  {
    v9 = *v7++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v9 + 32))(v9, a2, "previous_turns");
  }
  v10 = (uint64_t *)*((_QWORD *)this + 6);
  v11 = (uint64_t *)*((_QWORD *)this + 7);
  while (v10 != v11)
  {
    v12 = *v10++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v12 + 32))(v12, a2, "qr_hypotheses");
  }
  v13 = *((_QWORD *)this + 9);
  if (v13)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v13 + 32))(v13, a2, "request_id");
  if (*((_QWORD *)this + 10))
    PB::TextFormatter::format();
  return PB::TextFormatter::endObject(a2);
}

double sirinluinternalcontextupdate::ContextUpdateRequest::ContextUpdateRequest(sirinluinternalcontextupdate::ContextUpdateRequest *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB20C8;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB20C8;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  return result;
}

sirinluinternalcontextupdate::ContextUpdateRequest *sirinluinternalcontextupdate::ContextUpdateRequest::ContextUpdateRequest(sirinluinternalcontextupdate::ContextUpdateRequest *this, const sirinluexternal::TurnInput **a2)
{
  sirinluexternal::TurnInput **v4;
  sirinluexternal::TurnInput ***v5;
  sirinluexternal::TurnInput *v6;
  sirinluexternal::TurnInput *v7;
  sirinluexternal::TurnInput *v8;
  const sirinluexternal::TurnInput **v9;
  const sirinluexternal::TurnInput **v10;
  const sirinluexternal::UUID ***v11;
  const sirinluexternal::UUID ***i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  std::string *v16;
  std::string *v17;
  const sirinluexternal::TurnInput *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  *(_QWORD *)this = &off_1E7BB20C8;
  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (sirinluexternal::TurnInput **)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  v5 = (sirinluexternal::TurnInput ***)((char *)this + 24);
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  if (a2[1])
  {
    v6 = (sirinluexternal::TurnInput *)operator new();
    v7 = sirinluexternal::TurnInput::TurnInput(v6, a2[1]);
    v8 = *v4;
    *v4 = v7;
    if (v8)
      (*(void (**)(sirinluexternal::TurnInput *))(*(_QWORD *)v8 + 8))(v8);
  }
  v9 = (const sirinluexternal::TurnInput **)a2[3];
  v10 = (const sirinluexternal::TurnInput **)a2[4];
  while (v9 != v10)
    PB::PtrVector<sirinluexternal::TurnInput>::emplace_back<sirinluexternal::TurnInput const&>(v5, *v9++);
  v11 = (const sirinluexternal::UUID ***)a2[6];
  for (i = (const sirinluexternal::UUID ***)a2[7]; v11 != i; ++v11)
    PB::PtrVector<sirinluinternal::RewriteHypothesis>::emplace_back<sirinluinternal::RewriteHypothesis const&>((sirinluinternal::RewriteHypothesis ***)this + 6, *v11);
  if (a2[9])
  {
    v13 = operator new();
    v14 = sirinluexternal::UUID::UUID(v13, a2[9]);
    v15 = *((_QWORD *)this + 9);
    *((_QWORD *)this + 9) = v14;
    if (v15)
      (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
  }
  if (a2[10])
  {
    v16 = (std::string *)operator new();
    v17 = v16;
    v18 = a2[10];
    if (*((char *)v18 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v16, *(const std::string::value_type **)v18, *((_QWORD *)v18 + 1));
    }
    else
    {
      v19 = *(_OWORD *)v18;
      v16->__r_.__value_.__r.__words[2] = *((_QWORD *)v18 + 2);
      *(_OWORD *)&v16->__r_.__value_.__l.__data_ = v19;
    }
    v20 = *((_QWORD *)this + 10);
    *((_QWORD *)this + 10) = v17;
    if (v20)
      std::default_delete<std::string>::operator()[abi:ne180100](v20);
  }
  if (a2[2])
  {
    v21 = operator new();
    v22 = sirinluexternal::UUID::UUID(v21, a2[2]);
    v23 = *((_QWORD *)this + 2);
    *((_QWORD *)this + 2) = v22;
    if (v23)
      (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
  }
  return this;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::operator=(uint64_t a1, const sirinluexternal::TurnInput **a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _BYTE v9[8];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  if ((const sirinluexternal::TurnInput **)a1 != a2)
  {
    sirinluinternalcontextupdate::ContextUpdateRequest::ContextUpdateRequest((sirinluinternalcontextupdate::ContextUpdateRequest *)v9, a2);
    v3 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v11;
    v4 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v12;
    v11 = v3;
    v12 = v4;
    v5 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)(a1 + 56) = v13;
    v6 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)(a1 + 72) = v14;
    v13 = v5;
    v14 = v6;
    v7 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v10;
    v10 = v7;
    sirinluinternalcontextupdate::ContextUpdateRequest::~ContextUpdateRequest((sirinluinternalcontextupdate::ContextUpdateRequest *)v9);
  }
  return a1;
}

_QWORD *sirinluinternalcontextupdate::swap(_QWORD *this, sirinluinternalcontextupdate::ContextUpdateRequest *a2, sirinluinternalcontextupdate::ContextUpdateRequest *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = this[1];
  this[1] = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  v4 = this[3];
  this[3] = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v4;
  v5 = this[4];
  this[4] = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v5;
  v6 = this[5];
  this[5] = *((_QWORD *)a2 + 5);
  *((_QWORD *)a2 + 5) = v6;
  v7 = this[6];
  this[6] = *((_QWORD *)a2 + 6);
  *((_QWORD *)a2 + 6) = v7;
  v8 = this[7];
  this[7] = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v8;
  v9 = this[8];
  this[8] = *((_QWORD *)a2 + 8);
  *((_QWORD *)a2 + 8) = v9;
  v10 = this[9];
  this[9] = *((_QWORD *)a2 + 9);
  *((_QWORD *)a2 + 9) = v10;
  v11 = this[10];
  this[10] = *((_QWORD *)a2 + 10);
  *((_QWORD *)a2 + 10) = v11;
  v12 = this[2];
  this[2] = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v12;
  return this;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::ContextUpdateRequest(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = &off_1E7BB20C8;
  *(_OWORD *)(a1 + 24) = 0u;
  v4 = (_QWORD *)(a1 + 24);
  v5 = (_QWORD *)(a1 + 48);
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(v4);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  *(_OWORD *)(a2 + 24) = 0u;
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(v5);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v8 = *(_QWORD *)(a2 + 72);
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  v9 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v8;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  v10 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a2 + 80) = 0;
  v11 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 80) = v10;
  if (v11)
    std::default_delete<std::string>::operator()[abi:ne180100](v11);
  v12 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v13 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v12;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  return a1;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _BYTE v9[8];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  if (a1 != a2)
  {
    sirinluinternalcontextupdate::ContextUpdateRequest::ContextUpdateRequest((uint64_t)v9, a2);
    v3 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v11;
    v4 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v12;
    v11 = v3;
    v12 = v4;
    v5 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)(a1 + 56) = v13;
    v6 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)(a1 + 72) = v14;
    v13 = v5;
    v14 = v6;
    v7 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v10;
    v10 = v7;
    sirinluinternalcontextupdate::ContextUpdateRequest::~ContextUpdateRequest((sirinluinternalcontextupdate::ContextUpdateRequest *)v9);
  }
  return a1;
}

uint64_t sirinluinternalcontextupdate::ContextUpdateRequest::operator==(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a1[1];
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5 || (sirinluexternal::TurnInput::operator==(v4, v5) & 1) == 0)
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  result = PB::PtrVector<sirinluexternal::TurnInput>::operator==(a1 + 3, *(uint64_t **)(a2 + 24), *(_QWORD *)(a2 + 32));
  if (!(_DWORD)result)
    return result;
  result = PB::PtrVector<sirinluinternal::RewriteHypothesis>::operator==(a1[6], a1[7], *(uint64_t **)(a2 + 48), *(_QWORD *)(a2 + 56));
  if (!(_DWORD)result)
    return result;
  v7 = a1[9];
  v8 = *(_QWORD *)(a2 + 72);
  if (v7)
  {
    if (!v8 || !sirinluexternal::UUID::operator==(v7, v8))
      return 0;
  }
  else if (v8)
  {
    return 0;
  }
  v9 = (unsigned __int8 *)a1[10];
  v10 = *(unsigned __int8 **)(a2 + 80);
  if (!v9)
  {
    if (!v10)
      goto LABEL_20;
    return 0;
  }
  if (!v10 || !std::__equal_to::operator()[abi:ne180100]<std::string,std::string>(v9, v10))
    return 0;
LABEL_20:
  v11 = a1[2];
  v12 = *(_QWORD *)(a2 + 16);
  result = (v11 | v12) == 0;
  if (v11)
  {
    if (v12)
      return sirinluexternal::UUID::operator==(a1[2], v12);
  }
  return result;
}

unint64_t sirinluinternalcontextupdate::ContextUpdateRequest::hash_value(sirinluinternalcontextupdate::ContextUpdateRequest *this)
{
  sirinluexternal::TurnInput *v2;
  unint64_t v3;
  sirinluexternal::TurnInput **v4;
  sirinluexternal::TurnInput **v5;
  uint64_t v6;
  sirinluexternal::TurnInput *v7;
  sirinluinternal::RewriteHypothesis **v8;
  sirinluinternal::RewriteHypothesis **v9;
  uint64_t v10;
  sirinluinternal::RewriteHypothesis *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = (sirinluexternal::TurnInput *)*((_QWORD *)this + 1);
  if (v2)
    v3 = sirinluexternal::TurnInput::hash_value(v2);
  else
    v3 = 0;
  v4 = (sirinluexternal::TurnInput **)*((_QWORD *)this + 3);
  v5 = (sirinluexternal::TurnInput **)*((_QWORD *)this + 4);
  if (v4 == v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    do
    {
      v7 = *v4++;
      v6 ^= sirinluexternal::TurnInput::hash_value(v7);
    }
    while (v4 != v5);
  }
  v8 = (sirinluinternal::RewriteHypothesis **)*((_QWORD *)this + 6);
  v9 = (sirinluinternal::RewriteHypothesis **)*((_QWORD *)this + 7);
  if (v8 == v9)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    do
    {
      v11 = *v8++;
      v10 ^= sirinluinternal::RewriteHypothesis::hash_value(v11);
    }
    while (v8 != v9);
  }
  v12 = *((_QWORD *)this + 9);
  if (!v12)
  {
    v16 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)(v12 + 28) & 1) == 0)
  {
    v13 = 0;
    if ((*(_BYTE *)(v12 + 28) & 2) != 0)
      goto LABEL_17;
LABEL_21:
    v14 = 0;
    if ((*(_BYTE *)(v12 + 28) & 4) != 0)
      goto LABEL_18;
LABEL_22:
    v15 = 0;
    goto LABEL_23;
  }
  v13 = *(_QWORD *)(v12 + 8);
  if ((*(_BYTE *)(v12 + 28) & 2) == 0)
    goto LABEL_21;
LABEL_17:
  v14 = *(_QWORD *)(v12 + 16);
  if ((*(_BYTE *)(v12 + 28) & 4) == 0)
    goto LABEL_22;
LABEL_18:
  v15 = *(int *)(v12 + 24);
LABEL_23:
  v16 = v14 ^ v13 ^ v15;
LABEL_24:
  v17 = *((_QWORD *)this + 10);
  if (v17)
    v17 = std::__string_hash<char>::operator()[abi:ne180100](v17);
  v18 = *((_QWORD *)this + 2);
  if (v18)
  {
    if ((*(_BYTE *)(v18 + 28) & 1) != 0)
    {
      v19 = *(_QWORD *)(v18 + 8);
      if ((*(_BYTE *)(v18 + 28) & 2) != 0)
      {
LABEL_29:
        v20 = *(_QWORD *)(v18 + 16);
        if ((*(_BYTE *)(v18 + 28) & 4) != 0)
        {
LABEL_30:
          v21 = *(int *)(v18 + 24);
LABEL_34:
          v18 = v20 ^ v19 ^ v21;
          return v6 ^ v3 ^ v17 ^ v18 ^ v10 ^ v16;
        }
LABEL_33:
        v21 = 0;
        goto LABEL_34;
      }
    }
    else
    {
      v19 = 0;
      if ((*(_BYTE *)(v18 + 28) & 2) != 0)
        goto LABEL_29;
    }
    v20 = 0;
    if ((*(_BYTE *)(v18 + 28) & 4) != 0)
      goto LABEL_30;
    goto LABEL_33;
  }
  return v6 ^ v3 ^ v17 ^ v18 ^ v10 ^ v16;
}

_QWORD *sirinluinternalcontextupdate::ContextUpdateRequest::makeCurrentTurn(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BB16E8;
    *(_DWORD *)(v2 + 148) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *(_QWORD *)(v2 + 128) = 0;
    *(_QWORD *)(v2 + 136) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluinternalcontextupdate::ContextUpdateRequest::makeRequestId(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[9])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    *v2 = &off_1E7BB0CB8;
    v2[3] = 0;
    this = (_QWORD *)v1[9];
    v1[9] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluinternalcontextupdate::ContextUpdateRequest::makeNluRequestId(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[2])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    *v2 = &off_1E7BB0CB8;
    v2[3] = 0;
    this = (_QWORD *)v1[2];
    v1[2] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void sirinluexternal::TurnContext::~TurnContext(sirinluexternal::TurnContext *this)
{
  sirinluexternal::TurnContext::~TurnContext(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = &off_1E7BB2118;
  v2 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  PB::Base::~Base(this);
}

uint64_t sirinluexternal::TurnContext::readFrom(sirinluexternal::TurnContext *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    do
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        v15 = 0;
        v16 = 0;
        v11 = 0;
        if (v2 > v3)
          v3 = v2;
        while (v3 != v2)
        {
          v17 = v2 + 1;
          v18 = *(_BYTE *)(v8 + v2);
          *((_QWORD *)a2 + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0)
            goto LABEL_20;
          v15 += 7;
          v2 = v17;
          v14 = v16++ > 8;
          if (v14)
            goto LABEL_25;
        }
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_25;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        v19 = operator new();
        *(_QWORD *)v19 = &off_1E7BAE238;
        *(_DWORD *)(v19 + 72) = 0;
        *(_OWORD *)(v19 + 8) = 0u;
        *(_OWORD *)(v19 + 24) = 0u;
        *(_OWORD *)(v19 + 40) = 0u;
        *(_OWORD *)(v19 + 52) = 0u;
        v22 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v19;
        if (v22)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
          v19 = *((_QWORD *)this + 1);
        }
      }
      else
      {
        if ((v11 >> 3) != 1)
        {
LABEL_25:
          result = PB::Reader::skip(a2);
          if (!(_DWORD)result)
            return result;
          goto LABEL_32;
        }
        v19 = operator new();
        *(_QWORD *)v19 = &off_1E7BB13B0;
        *(_OWORD *)(v19 + 8) = 0u;
        *(_OWORD *)(v19 + 24) = 0u;
        *(_OWORD *)(v19 + 40) = 0u;
        *(_OWORD *)(v19 + 56) = 0u;
        *(_OWORD *)(v19 + 72) = 0u;
        *(_OWORD *)(v19 + 88) = 0u;
        *(_QWORD *)(v19 + 104) = 0;
        v20 = *((_QWORD *)this + 2);
        *((_QWORD *)this + 2) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
          v19 = *((_QWORD *)this + 2);
        }
      }
      if (!PB::Reader::placeMark()
        || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v19 + 16))(v19, a2) & 1) == 0)
      {
        return 0;
      }
      PB::Reader::recallMark();
LABEL_32:
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
    }
    while (v2 < v3 && !*((_BYTE *)a2 + 24));
  }
  return v4 == 0;
}

uint64_t sirinluexternal::TurnContext::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  const PB::Base *v5;

  v3 = this;
  v4 = *(const PB::Base **)(this + 16);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = *(const PB::Base **)(v3 + 8);
  if (v5)
    return PB::Writer::writeSubmessage(a2, v5);
  return this;
}

uint64_t sirinluexternal::TurnContext::formatText(sirinluexternal::TurnContext *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;
  uint64_t v6;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "legacy_nl_context");
  v6 = *((_QWORD *)this + 2);
  if (v6)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v6 + 32))(v6, a2, "nl_context");
  return PB::TextFormatter::endObject(a2);
}

_QWORD *sirinluexternal::TurnContext::TurnContext(_QWORD *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &off_1E7BB2118;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = &off_1E7BB2118;
  return this;
}

sirinluexternal::TurnContext *sirinluexternal::TurnContext::TurnContext(sirinluexternal::TurnContext *this, const sirinluexternal::TurnContext *a2)
{
  sirinluexternal::LegacyNLContext **v4;
  sirinluexternal::NLContext *v5;
  sirinluexternal::NLContext *v6;
  uint64_t v7;
  sirinluexternal::LegacyNLContext *v8;
  sirinluexternal::LegacyNLContext *v9;
  sirinluexternal::LegacyNLContext *v10;

  *(_QWORD *)this = &off_1E7BB2118;
  *((_QWORD *)this + 1) = 0;
  v4 = (sirinluexternal::LegacyNLContext **)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  if (*((_QWORD *)a2 + 2))
  {
    v5 = (sirinluexternal::NLContext *)operator new();
    v6 = sirinluexternal::NLContext::NLContext(v5, *((const sirinluexternal::SystemDialogAct ****)a2 + 2));
    v7 = *((_QWORD *)this + 2);
    *((_QWORD *)this + 2) = v6;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
  if (*((_QWORD *)a2 + 1))
  {
    v8 = (sirinluexternal::LegacyNLContext *)operator new();
    v9 = sirinluexternal::LegacyNLContext::LegacyNLContext(v8, *((const sirinluexternal::LegacyNLContext **)a2 + 1));
    v10 = *v4;
    *v4 = v9;
    if (v10)
      (*(void (**)(sirinluexternal::LegacyNLContext *))(*(_QWORD *)v10 + 8))(v10);
  }
  return this;
}

uint64_t sirinluexternal::TurnContext::operator=(uint64_t a1, const sirinluexternal::TurnContext *a2)
{
  __int128 v3;
  _BYTE v5[8];
  __int128 v6;

  if ((const sirinluexternal::TurnContext *)a1 != a2)
  {
    sirinluexternal::TurnContext::TurnContext((sirinluexternal::TurnContext *)v5, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v6;
    v6 = v3;
    sirinluexternal::TurnContext::~TurnContext((sirinluexternal::TurnContext *)v5);
  }
  return a1;
}

uint64_t sirinluexternal::swap(uint64_t this, sirinluexternal::TurnContext *a2, sirinluexternal::TurnContext *a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v3;
  v4 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  return this;
}

_QWORD *sirinluexternal::TurnContext::TurnContext(_QWORD *a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  a1[1] = 0;
  v4 = a1 + 1;
  *a1 = &off_1E7BB2118;
  a1[2] = 0;
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v6 = a1[2];
  a1[2] = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v8 = *v4;
  *v4 = v7;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  return a1;
}

uint64_t sirinluexternal::TurnContext::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  void (**v6)(sirinluexternal::TurnContext *__hidden);
  __int128 v7;

  if (a1 != a2)
  {
    v6 = &off_1E7BB2118;
    v3 = *(_OWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v3;
    v7 = v4;
    sirinluexternal::TurnContext::~TurnContext((sirinluexternal::TurnContext *)&v6);
  }
  return a1;
}

BOOL sirinluexternal::TurnContext::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 result;
  BOOL v9;

  v4 = *(uint64_t **)(a1 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  if (!v4)
  {
    if (!v5)
      goto LABEL_4;
    return 0;
  }
  if (!v5 || (sirinluexternal::NLContext::operator==(v4, v5) & 1) == 0)
    return 0;
LABEL_4:
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a2 + 8);
  result = (v6 | v7) == 0;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
    return sirinluexternal::LegacyNLContext::operator==(*(_QWORD *)(a1 + 8), v7);
  return result;
}

unint64_t sirinluexternal::TurnContext::hash_value(sirinluexternal::TurnContext *this)
{
  sirinluexternal::NLContext *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (sirinluexternal::NLContext *)*((_QWORD *)this + 2);
  if (v2)
    v3 = sirinluexternal::NLContext::hash_value(v2);
  else
    v3 = 0;
  v4 = *((_QWORD *)this + 1);
  if (v4)
    v4 = sirinluexternal::LegacyNLContext::hash_value((sirinluexternal::LegacyNLContext *)v4);
  return v4 ^ v3;
}

_QWORD *sirinluexternal::TurnContext::makeNlContext(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[2])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BB13B0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *(_QWORD *)(v2 + 104) = 0;
    this = (_QWORD *)v1[2];
    v1[2] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluexternal::TurnContext::makeLegacyNlContext(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BAE238;
    *(_DWORD *)(v2 + 72) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_OWORD *)(v2 + 52) = 0u;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void sirinluinternal::RewriteToken::~RewriteToken(sirinluinternal::RewriteToken *this)
{
  sirinluinternal::RewriteToken::~RewriteToken(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = &off_1E7BB2168;
  v2 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v2)
    std::default_delete<std::string>::operator()[abi:ne180100](v2);
  v3 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    std::default_delete<std::string>::operator()[abi:ne180100](v3);
  PB::Base::~Base(this);
}

uint64_t sirinluinternal::RewriteToken::readFrom(sirinluinternal::RewriteToken *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  unint64_t v41;
  int v42;
  BOOL v43;
  char v44;
  unsigned int v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  unint64_t v50;
  char v51;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (1)
  {
    v8 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      break;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
      v13 = *(_BYTE *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0)
        break;
      v9 += 7;
      v2 = v12;
      v14 = v10++ > 8;
      if (v14)
        goto LABEL_19;
    }
LABEL_21:
    if ((v11 & 7) == 4)
    {
      v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        v20 = (_QWORD *)operator new();
        v20[1] = 0;
        v20[2] = 0;
        *v20 = 0;
        v21 = *((_QWORD *)this + 3);
        *((_QWORD *)this + 3) = v20;
        if (v21)
          goto LABEL_43;
        goto LABEL_44;
      case 2u:
        *((_BYTE *)this + 44) |= 4u;
        v22 = *((_QWORD *)a2 + 1);
        v23 = *((_QWORD *)a2 + 2);
        v24 = *(_QWORD *)a2;
        if (v22 <= 0xFFFFFFFFFFFFFFF5 && v22 + 10 <= v23)
        {
          v25 = 0;
          v26 = 0;
          v27 = 0;
          do
          {
            v28 = v22 + 1;
            *((_QWORD *)a2 + 1) = v22 + 1;
            v29 = *(_BYTE *)(v24 + v22);
            v27 |= (unint64_t)(v29 & 0x7F) << v25;
            if ((v29 & 0x80) == 0)
              goto LABEL_67;
            v25 += 7;
            v22 = v28;
            v14 = v26++ > 8;
          }
          while (!v14);
LABEL_53:
          LODWORD(v27) = 0;
          goto LABEL_67;
        }
        v44 = 0;
        v45 = 0;
        v27 = 0;
        if (v23 <= v22)
          v23 = *((_QWORD *)a2 + 1);
        while (2)
        {
          if (v23 == v22)
          {
            LODWORD(v27) = 0;
            *((_BYTE *)a2 + 24) = 1;
          }
          else
          {
            v46 = v22 + 1;
            v47 = *(_BYTE *)(v24 + v22);
            *((_QWORD *)a2 + 1) = v46;
            v27 |= (unint64_t)(v47 & 0x7F) << v44;
            if (v47 < 0)
            {
              v44 += 7;
              v22 = v46;
              v14 = v45++ > 8;
              if (v14)
                goto LABEL_53;
              continue;
            }
            if (*((_BYTE *)a2 + 24))
              LODWORD(v27) = 0;
          }
          break;
        }
LABEL_67:
        *((_DWORD *)this + 9) = v27;
        goto LABEL_72;
      case 3u:
        *((_BYTE *)this + 44) |= 2u;
        v30 = *((_QWORD *)a2 + 1);
        v31 = *((_QWORD *)a2 + 2);
        v32 = *(_QWORD *)a2;
        if (v30 <= 0xFFFFFFFFFFFFFFF5 && v30 + 10 <= v31)
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          do
          {
            v36 = v30 + 1;
            *((_QWORD *)a2 + 1) = v30 + 1;
            v37 = *(_BYTE *)(v32 + v30);
            v35 |= (unint64_t)(v37 & 0x7F) << v33;
            if ((v37 & 0x80) == 0)
              goto LABEL_71;
            v33 += 7;
            v30 = v36;
            v14 = v34++ > 8;
          }
          while (!v14);
LABEL_60:
          LODWORD(v35) = 0;
          goto LABEL_71;
        }
        v48 = 0;
        v49 = 0;
        v35 = 0;
        if (v31 <= v30)
          v31 = *((_QWORD *)a2 + 1);
        break;
      case 4u:
        *((_BYTE *)this + 44) |= 1u;
        v38 = *((_QWORD *)a2 + 1);
        if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *((_QWORD *)a2 + 2))
        {
          *((_QWORD *)this + 1) = *(_QWORD *)(*(_QWORD *)a2 + v38);
          *((_QWORD *)a2 + 1) += 8;
        }
        else
        {
          *((_BYTE *)a2 + 24) = 1;
        }
        goto LABEL_72;
      case 5u:
        v39 = (_QWORD *)operator new();
        v39[1] = 0;
        v39[2] = 0;
        *v39 = 0;
        v21 = *((_QWORD *)this + 2);
        *((_QWORD *)this + 2) = v39;
        if (v21)
LABEL_43:
          std::default_delete<std::string>::operator()[abi:ne180100](v21);
LABEL_44:
        PB::Reader::read();
        goto LABEL_72;
      case 6u:
        *((_BYTE *)this + 44) |= 8u;
        v40 = *((_QWORD *)a2 + 1);
        if (v40 >= *((_QWORD *)a2 + 2))
        {
          v43 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v41 = v40 + 1;
          v42 = *(unsigned __int8 *)(*(_QWORD *)a2 + v40);
          *((_QWORD *)a2 + 1) = v41;
          v43 = v42 != 0;
        }
        *((_BYTE *)this + 40) = v43;
        goto LABEL_72;
      default:
        goto LABEL_19;
    }
    while (1)
    {
      if (v31 == v30)
      {
        LODWORD(v35) = 0;
        *((_BYTE *)a2 + 24) = 1;
        goto LABEL_71;
      }
      v50 = v30 + 1;
      v51 = *(_BYTE *)(v32 + v30);
      *((_QWORD *)a2 + 1) = v50;
      v35 |= (unint64_t)(v51 & 0x7F) << v48;
      if ((v51 & 0x80) == 0)
        break;
      v48 += 7;
      v30 = v50;
      v14 = v49++ > 8;
      if (v14)
        goto LABEL_60;
    }
    if (*((_BYTE *)a2 + 24))
      LODWORD(v35) = 0;
LABEL_71:
    *((_DWORD *)this + 8) = v35;
LABEL_72:
    v2 = *((_QWORD *)a2 + 1);
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0)
      return v4 == 0;
  }
  v15 = 0;
  v16 = 0;
  v11 = 0;
  if (v2 > v3)
    v3 = v2;
  do
  {
    if (v3 == v2)
    {
      v4 = 1;
      *((_BYTE *)a2 + 24) = 1;
      return v4 == 0;
    }
    v17 = v2 + 1;
    v18 = *(_BYTE *)(v8 + v2);
    *((_QWORD *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0)
      goto LABEL_21;
    v15 += 7;
    v2 = v17;
    v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  result = PB::Reader::skip(a2);
  if ((_DWORD)result)
    goto LABEL_72;
  return result;
}

uint64_t sirinluinternal::RewriteToken::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  if (*(_QWORD *)(this + 24))
    this = PB::Writer::write();
  v4 = *(_BYTE *)(v3 + 44);
  if ((v4 & 4) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v4 = *(_BYTE *)(v3 + 44);
    if ((v4 & 2) == 0)
    {
LABEL_5:
      if ((v4 & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)(v3 + 44) & 2) == 0)
  {
    goto LABEL_5;
  }
  this = PB::Writer::writeVarInt(a2);
  if ((*(_BYTE *)(v3 + 44) & 1) != 0)
LABEL_6:
    this = PB::Writer::write(a2, *(double *)(v3 + 8));
LABEL_7:
  if (*(_QWORD *)(v3 + 16))
    this = PB::Writer::write();
  if ((*(_BYTE *)(v3 + 44) & 8) != 0)
    return PB::Writer::write(a2);
  return this;
}

uint64_t sirinluinternal::RewriteToken::formatText(sirinluinternal::RewriteToken *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;
  char v6;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 44);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "asr_confidence", *((double *)this + 1));
    v5 = *((_BYTE *)this + 44);
  }
  if ((v5 & 2) != 0)
    PB::TextFormatter::format(a2, "end_index");
  if (*((_QWORD *)this + 2))
    PB::TextFormatter::format();
  v6 = *((_BYTE *)this + 44);
  if ((v6 & 8) != 0)
  {
    PB::TextFormatter::format(a2, "remove_space_after");
    v6 = *((_BYTE *)this + 44);
  }
  if ((v6 & 4) != 0)
    PB::TextFormatter::format(a2, "start_index");
  if (*((_QWORD *)this + 3))
    PB::TextFormatter::format();
  return PB::TextFormatter::endObject(a2);
}

uint64_t sirinluinternal::RewriteToken::RewriteToken(uint64_t this)
{
  *(_QWORD *)this = &off_1E7BB2168;
  *(_DWORD *)(this + 44) = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = 0;
  return this;
}

{
  *(_QWORD *)this = &off_1E7BB2168;
  *(_DWORD *)(this + 44) = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = 0;
  return this;
}

sirinluinternal::RewriteToken *sirinluinternal::RewriteToken::RewriteToken(sirinluinternal::RewriteToken *this, const sirinluinternal::RewriteToken *a2)
{
  uint64_t *v4;
  std::string *v5;
  std::string *v6;
  __int128 *v7;
  __int128 v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  std::string *v12;
  std::string *v13;
  __int128 *v14;
  __int128 v15;
  int v16;
  int v17;
  uint64_t v18;
  char v19;

  *(_QWORD *)this = &off_1E7BB2168;
  *((_QWORD *)this + 2) = 0;
  v4 = (uint64_t *)((char *)this + 16);
  *((_DWORD *)this + 11) = 0;
  *((_QWORD *)this + 3) = 0;
  if (*((_QWORD *)a2 + 3))
  {
    v5 = (std::string *)operator new();
    v6 = v5;
    v7 = (__int128 *)*((_QWORD *)a2 + 3);
    if (*((char *)v7 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)v7, *((_QWORD *)v7 + 1));
    }
    else
    {
      v8 = *v7;
      v5->__r_.__value_.__r.__words[2] = *((_QWORD *)v7 + 2);
      *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v8;
    }
    v9 = *((_QWORD *)this + 3);
    *((_QWORD *)this + 3) = v6;
    if (v9)
      std::default_delete<std::string>::operator()[abi:ne180100](v9);
  }
  v10 = *((_BYTE *)a2 + 44);
  if ((v10 & 4) == 0)
  {
    if ((*((_BYTE *)a2 + 44) & 2) == 0)
      goto LABEL_9;
LABEL_15:
    v17 = *((_DWORD *)a2 + 8);
    *((_BYTE *)this + 44) |= 2u;
    *((_DWORD *)this + 8) = v17;
    if ((*((_BYTE *)a2 + 44) & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v16 = *((_DWORD *)a2 + 9);
  *((_BYTE *)this + 44) |= 4u;
  *((_DWORD *)this + 9) = v16;
  v10 = *((_BYTE *)a2 + 44);
  if ((v10 & 2) != 0)
    goto LABEL_15;
LABEL_9:
  if ((v10 & 1) != 0)
  {
LABEL_10:
    v11 = *((_QWORD *)a2 + 1);
    *((_BYTE *)this + 44) |= 1u;
    *((_QWORD *)this + 1) = v11;
  }
LABEL_11:
  if (*((_QWORD *)a2 + 2))
  {
    v12 = (std::string *)operator new();
    v13 = v12;
    v14 = (__int128 *)*((_QWORD *)a2 + 2);
    if (*((char *)v14 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v12, *(const std::string::value_type **)v14, *((_QWORD *)v14 + 1));
    }
    else
    {
      v15 = *v14;
      v12->__r_.__value_.__r.__words[2] = *((_QWORD *)v14 + 2);
      *(_OWORD *)&v12->__r_.__value_.__l.__data_ = v15;
    }
    v18 = *v4;
    *v4 = (uint64_t)v13;
    if (v18)
      std::default_delete<std::string>::operator()[abi:ne180100](v18);
  }
  if ((*((_BYTE *)a2 + 44) & 8) != 0)
  {
    v19 = *((_BYTE *)a2 + 40);
    *((_BYTE *)this + 44) |= 8u;
    *((_BYTE *)this + 40) = v19;
  }
  return this;
}

uint64_t sirinluinternal::RewriteToken::operator=(uint64_t a1, const sirinluinternal::RewriteToken *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  char v12;
  int v13;

  if ((const sirinluinternal::RewriteToken *)a1 != a2)
  {
    sirinluinternal::RewriteToken::RewriteToken((sirinluinternal::RewriteToken *)&v8, a2);
    v3 = *(_DWORD *)(a1 + 44);
    *(_DWORD *)(a1 + 44) = v13;
    v13 = v3;
    v4 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v11;
    v11 = v4;
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v9;
    v9 = v5;
    v6 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v10;
    v10 = v6;
    LOBYTE(v3) = *(_BYTE *)(a1 + 40);
    *(_BYTE *)(a1 + 40) = v12;
    v12 = v3;
    sirinluinternal::RewriteToken::~RewriteToken((sirinluinternal::RewriteToken *)&v8);
  }
  return a1;
}

double sirinluinternal::swap(sirinluinternal *this, sirinluinternal::RewriteToken *a2, sirinluinternal::RewriteToken *a3)
{
  int v3;
  uint64_t v4;
  double result;
  uint64_t v6;

  v3 = *((_DWORD *)this + 11);
  *((_DWORD *)this + 11) = *((_DWORD *)a2 + 11);
  *((_DWORD *)a2 + 11) = v3;
  v4 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v4;
  LODWORD(v4) = *((_DWORD *)this + 9);
  *((_DWORD *)this + 9) = *((_DWORD *)a2 + 9);
  *((_DWORD *)a2 + 9) = v4;
  LODWORD(v4) = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v4;
  result = *((double *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((double *)a2 + 1) = result;
  v6 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v6;
  LOBYTE(v6) = *((_BYTE *)this + 40);
  *((_BYTE *)this + 40) = *((_BYTE *)a2 + 40);
  *((_BYTE *)a2 + 40) = v6;
  return result;
}

uint64_t sirinluinternal::RewriteToken::RewriteToken(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = &off_1E7BB2168;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a2 + 44) = 0;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 24) = 0;
  v5 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v4;
  if (v5)
    std::default_delete<std::string>::operator()[abi:ne180100](v5);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v7 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v6;
  if (v7)
    std::default_delete<std::string>::operator()[abi:ne180100](v7);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t sirinluinternal::RewriteToken::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  char v12;
  int v13;

  if (a1 != a2)
  {
    sirinluinternal::RewriteToken::RewriteToken((uint64_t)&v8, a2);
    v3 = *(_DWORD *)(a1 + 44);
    *(_DWORD *)(a1 + 44) = v13;
    v13 = v3;
    v4 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v11;
    v11 = v4;
    v5 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v9;
    v9 = v5;
    v6 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v10;
    v10 = v6;
    LOBYTE(v3) = *(_BYTE *)(a1 + 40);
    *(_BYTE *)(a1 + 40) = v12;
    v12 = v3;
    sirinluinternal::RewriteToken::~RewriteToken((sirinluinternal::RewriteToken *)&v8);
  }
  return a1;
}

BOOL sirinluinternal::RewriteToken::operator==(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v4;
  unsigned __int8 **v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  unsigned __int8 *v10;
  char v11;
  char v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  _BOOL8 result;

  v4 = *(unsigned __int8 **)(a1 + 24);
  v5 = *(unsigned __int8 ***)(a2 + 24);
  if (v4)
  {
    if (!v5)
      return 0;
    v6 = v4[23];
    if ((v6 & 0x80u) == 0)
      v7 = (unsigned __int8 *)v4[23];
    else
      v7 = (unsigned __int8 *)*((_QWORD *)v4 + 1);
    v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
    v9 = (char)v8;
    if ((char)v8 < 0)
      v8 = v5[1];
    if (v7 != v8)
      return 0;
    if (v9 >= 0)
      v10 = *(unsigned __int8 **)(a2 + 24);
    else
      v10 = *v5;
    if ((v6 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v4, v10, *((_QWORD *)v4 + 1)))
        return 0;
    }
    else if (v4[23])
    {
      while (*v4 == *v10)
      {
        ++v4;
        ++v10;
        if (!--v6)
          goto LABEL_18;
      }
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
LABEL_18:
  v11 = *(_BYTE *)(a1 + 44);
  v12 = *(_BYTE *)(a2 + 44);
  if ((v11 & 4) != 0)
  {
    if ((*(_BYTE *)(a2 + 44) & 4) == 0 || *(_DWORD *)(a1 + 36) != *(_DWORD *)(a2 + 36))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 44) & 4) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 44) & 2) != 0)
  {
    if ((*(_BYTE *)(a2 + 44) & 2) == 0 || *(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 44) & 2) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 44) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 44) & 1) == 0 || *(double *)(a1 + 8) != *(double *)(a2 + 8))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 44) & 1) != 0)
  {
    return 0;
  }
  v13 = *(unsigned __int8 **)(a1 + 16);
  v14 = *(unsigned __int8 **)(a2 + 16);
  if (v13)
  {
    if (!v14 || !std::__equal_to::operator()[abi:ne180100]<std::string,std::string>(v13, v14))
      return 0;
  }
  else if (v14)
  {
    return 0;
  }
  result = (v12 & 8) == 0;
  if ((v11 & 8) == 0)
    return result;
  return (v12 & 8) != 0 && *(unsigned __int8 *)(a1 + 40) == *(unsigned __int8 *)(a2 + 40);
}

unint64_t sirinluinternal::RewriteToken::hash_value(sirinluinternal::RewriteToken *this)
{
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v2 = *((_QWORD *)this + 3);
  if (v2)
    v3 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  else
    v3 = 0;
  v4 = *((_BYTE *)this + 44);
  if ((v4 & 4) != 0)
  {
    v5 = *((unsigned int *)this + 9);
    if ((*((_BYTE *)this + 44) & 2) != 0)
    {
LABEL_6:
      v6 = *((unsigned int *)this + 8);
      if ((*((_BYTE *)this + 44) & 1) != 0)
        goto LABEL_7;
LABEL_12:
      v7 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v5 = 0;
    if ((*((_BYTE *)this + 44) & 2) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*((_BYTE *)this + 44) & 1) == 0)
    goto LABEL_12;
LABEL_7:
  if (*((double *)this + 1) == 0.0)
    v7 = 0;
  else
    v7 = *((_QWORD *)this + 1);
LABEL_13:
  v8 = *((_QWORD *)this + 2);
  if (v8)
    v8 = std::__string_hash<char>::operator()[abi:ne180100](v8);
  if ((v4 & 8) != 0)
    v9 = *((unsigned __int8 *)this + 40);
  else
    v9 = 0;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9;
}

void sirinluexternal::RepetitionResult::~RepetitionResult(sirinluexternal::RepetitionResult *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x1C3BB720CLL);
}

uint64_t sirinluexternal::RepetitionResult::readFrom(sirinluexternal::RepetitionResult *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  char v24;
  uint64_t result;
  unint64_t v26;
  uint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  unint64_t v38;
  char v39;

  v3 = *((_QWORD *)a2 + 1);
  v2 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v3 < v2 && v4 == 0)
  {
    while (1)
    {
      v8 = *(_QWORD *)a2;
      if (v3 > 0xFFFFFFFFFFFFFFF5 || v3 + 10 > v2)
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v3 + 1;
        *((_QWORD *)a2 + 1) = v3 + 1;
        v13 = *(_BYTE *)(v8 + v3);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v3 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_30;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((_BYTE *)this + 16) |= 2u;
        v26 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v27 = *(_QWORD *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v2)
        {
          v36 = 0;
          v37 = 0;
          v30 = 0;
          if (v2 <= v26)
            v3 = *((_QWORD *)a2 + 1);
          else
            v3 = *((_QWORD *)a2 + 2);
          while (1)
          {
            if (v3 == v26)
            {
              LODWORD(v30) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_64;
            }
            v38 = v26 + 1;
            v39 = *(_BYTE *)(v27 + v26);
            *((_QWORD *)a2 + 1) = v38;
            v30 |= (unint64_t)(v39 & 0x7F) << v36;
            if ((v39 & 0x80) == 0)
              break;
            v36 += 7;
            v26 = v38;
            v14 = v37++ > 8;
            if (v14)
            {
              LODWORD(v30) = 0;
              goto LABEL_63;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v30) = 0;
LABEL_63:
          v3 = v38;
        }
        else
        {
          v28 = 0;
          v29 = 0;
          v30 = 0;
          while (1)
          {
            v3 = v26 + 1;
            *((_QWORD *)a2 + 1) = v26 + 1;
            v31 = *(_BYTE *)(v27 + v26);
            v30 |= (unint64_t)(v31 & 0x7F) << v28;
            if ((v31 & 0x80) == 0)
              break;
            v28 += 7;
            v26 = v3;
            v14 = v29++ > 8;
            if (v14)
            {
              LODWORD(v30) = 0;
              break;
            }
          }
        }
LABEL_64:
        *((_DWORD *)this + 3) = v30;
      }
      else if ((v11 >> 3) == 1)
      {
        *((_BYTE *)this + 16) |= 1u;
        v19 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v20 = *(_QWORD *)a2;
        if (v19 > 0xFFFFFFFFFFFFFFF5 || v19 + 10 > v2)
        {
          v32 = 0;
          v33 = 0;
          v23 = 0;
          if (v2 <= v19)
            v3 = *((_QWORD *)a2 + 1);
          else
            v3 = *((_QWORD *)a2 + 2);
          while (1)
          {
            if (v3 == v19)
            {
              LODWORD(v23) = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_60;
            }
            v34 = v19 + 1;
            v35 = *(_BYTE *)(v20 + v19);
            *((_QWORD *)a2 + 1) = v34;
            v23 |= (unint64_t)(v35 & 0x7F) << v32;
            if ((v35 & 0x80) == 0)
              break;
            v32 += 7;
            v19 = v34;
            v14 = v33++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              goto LABEL_59;
            }
          }
          if (*((_BYTE *)a2 + 24))
            LODWORD(v23) = 0;
LABEL_59:
          v3 = v34;
        }
        else
        {
          v21 = 0;
          v22 = 0;
          v23 = 0;
          while (1)
          {
            v3 = v19 + 1;
            *((_QWORD *)a2 + 1) = v19 + 1;
            v24 = *(_BYTE *)(v20 + v19);
            v23 |= (unint64_t)(v24 & 0x7F) << v21;
            if ((v24 & 0x80) == 0)
              break;
            v21 += 7;
            v19 = v3;
            v14 = v22++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              break;
            }
          }
        }
LABEL_60:
        *((_DWORD *)this + 2) = v23;
      }
      else
      {
LABEL_30:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
        v3 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
      }
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v3 >= v2 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    v15 = 0;
    v16 = 0;
    v11 = 0;
    if (v3 > v2)
      v2 = v3;
    while (v2 != v3)
    {
      v17 = v3 + 1;
      v18 = *(_BYTE *)(v8 + v3);
      *((_QWORD *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0)
        goto LABEL_20;
      v15 += 7;
      v3 = v17;
      v14 = v16++ > 8;
      if (v14)
        goto LABEL_30;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sirinluexternal::RepetitionResult::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  v4 = *(_BYTE *)(this + 16);
  if ((v4 & 1) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    v4 = *(_BYTE *)(v3 + 16);
  }
  if ((v4 & 2) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

uint64_t sirinluexternal::RepetitionResult::formatText(sirinluexternal::RepetitionResult *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 16);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "asr_hypothesis_index");
    v5 = *((_BYTE *)this + 16);
  }
  if ((v5 & 2) != 0)
    PB::TextFormatter::format(a2, "repetition_type");
  return PB::TextFormatter::endObject(a2);
}

uint64_t sirinluexternal::RepetitionResult::RepetitionResult(uint64_t this)
{
  *(_QWORD *)this = &off_1E7BB21B8;
  *(_DWORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

{
  *(_QWORD *)this = &off_1E7BB21B8;
  *(_DWORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

uint64_t sirinluexternal::RepetitionResult::RepetitionResult(uint64_t this, const sirinluexternal::RepetitionResult *a2)
{
  char v2;
  int v3;
  int v4;

  *(_QWORD *)this = &off_1E7BB21B8;
  *(_DWORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  if ((*((_BYTE *)a2 + 16) & 1) != 0)
  {
    v3 = *((_DWORD *)a2 + 2);
    *(_BYTE *)(this + 16) = 1;
    *(_DWORD *)(this + 8) = v3;
    v2 = 3;
    if ((*((_BYTE *)a2 + 16) & 2) == 0)
      return this;
    goto LABEL_5;
  }
  v2 = 2;
  if ((*((_BYTE *)a2 + 16) & 2) != 0)
  {
LABEL_5:
    v4 = *((_DWORD *)a2 + 3);
    *(_BYTE *)(this + 16) = v2;
    *(_DWORD *)(this + 12) = v4;
  }
  return this;
}

{
  char v2;
  int v3;
  int v4;

  *(_QWORD *)this = &off_1E7BB21B8;
  *(_DWORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  if ((*((_BYTE *)a2 + 16) & 1) != 0)
  {
    v3 = *((_DWORD *)a2 + 2);
    *(_BYTE *)(this + 16) = 1;
    *(_DWORD *)(this + 8) = v3;
    v2 = 3;
    if ((*((_BYTE *)a2 + 16) & 2) == 0)
      return this;
    goto LABEL_5;
  }
  v2 = 2;
  if ((*((_BYTE *)a2 + 16) & 2) != 0)
  {
LABEL_5:
    v4 = *((_DWORD *)a2 + 3);
    *(_BYTE *)(this + 16) = v2;
    *(_DWORD *)(this + 12) = v4;
  }
  return this;
}

uint64_t sirinluexternal::RepetitionResult::operator=(uint64_t a1, uint64_t a2)
{
  void (**v3)(sirinluexternal::RepetitionResult *__hidden);
  char v4;
  char v5;
  int v6;
  int v7;
  uint64_t v8;
  _QWORD v10[2];
  int v11;

  if (a1 != a2)
  {
    v3 = &off_1E7BB21B8;
    v10[0] = &off_1E7BB21B8;
    v11 = 0;
    v4 = *(_BYTE *)(a2 + 16);
    if ((v4 & 1) != 0)
    {
      LODWORD(v3) = *(_DWORD *)(a2 + 8);
      LOBYTE(v11) = 1;
      v5 = 3;
      if ((v4 & 2) != 0)
        goto LABEL_4;
    }
    else
    {
      v5 = 2;
      if ((*(_BYTE *)(a2 + 16) & 2) != 0)
      {
LABEL_4:
        v6 = *(_DWORD *)(a2 + 12);
        LOBYTE(v11) = v5;
LABEL_7:
        v7 = v11;
        v11 = *(_DWORD *)(a1 + 16);
        v8 = *(_QWORD *)(a1 + 8);
        *(_DWORD *)(a1 + 8) = (_DWORD)v3;
        *(_DWORD *)(a1 + 12) = v6;
        *(_DWORD *)(a1 + 16) = v7;
        v10[1] = v8;
        PB::Base::~Base((PB::Base *)v10);
        return a1;
      }
    }
    v6 = 0;
    goto LABEL_7;
  }
  return a1;
}

{
  int v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];
  int v8;

  if (a1 != a2)
  {
    v7[0] = &off_1E7BB21B8;
    v3 = *(_DWORD *)(a2 + 16);
    *(_DWORD *)(a2 + 16) = 0;
    v8 = *(_DWORD *)(a1 + 16);
    v4 = *(_QWORD *)(a1 + 8);
    v5 = *(_QWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 16) = v3;
    *(_QWORD *)(a1 + 8) = v5;
    v7[1] = v4;
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

double sirinluexternal::swap(sirinluexternal *this, sirinluexternal::RepetitionResult *a2, sirinluexternal::RepetitionResult *a3)
{
  int v3;
  double result;
  uint64_t v5;

  v3 = *((_DWORD *)this + 4);
  *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v3;
  result = *((double *)a2 + 1);
  v5 = *((_QWORD *)this + 1);
  *((double *)this + 1) = result;
  *((_QWORD *)a2 + 1) = v5;
  return result;
}

double sirinluexternal::RepetitionResult::RepetitionResult(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a1 = &off_1E7BB21B8;
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a2 + 16) = 0;
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

{
  double result;

  *(_QWORD *)a1 = &off_1E7BB21B8;
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a2 + 16) = 0;
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

BOOL sirinluexternal::RepetitionResult::operator==(uint64_t a1, uint64_t a2)
{
  _BOOL8 v2;

  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 16) & 1) == 0 || *(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 16) & 1) != 0)
  {
    return 0;
  }
  v2 = (*(_BYTE *)(a2 + 16) & 2) == 0;
  if ((*(_BYTE *)(a1 + 16) & 2) != 0)
    return (*(_BYTE *)(a2 + 16) & 2) != 0 && *(_DWORD *)(a1 + 12) == *(_DWORD *)(a2 + 12);
  return v2;
}

uint64_t sirinluexternal::RepetitionResult::hash_value(sirinluexternal::RepetitionResult *this)
{
  uint64_t v1;
  uint64_t v2;

  if ((*((_BYTE *)this + 16) & 1) != 0)
  {
    v1 = *((unsigned int *)this + 2);
    if ((*((_BYTE *)this + 16) & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v2 = 0;
    return v2 ^ v1;
  }
  v1 = 0;
  if ((*((_BYTE *)this + 16) & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v2 = *((int *)this + 3);
  return v2 ^ v1;
}

BOOL SIRINLUEXTERNALSystemReportedFailureReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  SIRINLUEXTERNALUsoGraph *v18;
  uint64_t v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        v18 = objc_alloc_init(SIRINLUEXTERNALUsoGraph);
        v19 = 8;
        goto LABEL_26;
      }
      if ((_DWORD)v17 == 1)
      {
        v18 = objc_alloc_init(SIRINLUEXTERNALUUID);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALUUIDReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_33;
LABEL_28:
        PBReaderRecallMark();

        goto LABEL_30;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_30:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(SIRINLUEXTERNALUsoGraph);
    v19 = 16;
LABEL_26:
    objc_storeStrong((id *)(a1 + v19), v18);
    if (!PBReaderPlaceMark() || !SIRINLUEXTERNALUsoGraphReadFrom((id *)&v18->super.super.isa, a2))
    {
LABEL_33:

      return 0;
    }
    goto LABEL_28;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sirinluexternal::LanguageVariantResult::~LanguageVariantResult(sirinluexternal::LanguageVariantResult *this)
{
  sirinluexternal::LanguageVariantResult::~LanguageVariantResult(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)this = &off_1E7BB2208;
  v2 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = (_QWORD *)*((_QWORD *)this + 1);
  if (v3)
  {
    v4 = (_QWORD *)*((_QWORD *)this + 2);
    v5 = (void *)*((_QWORD *)this + 1);
    if (v4 != v3)
    {
      do
      {
        v7 = *--v4;
        v6 = v7;
        *v4 = 0;
        if (v7)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
      }
      while (v4 != v3);
      v5 = (void *)*((_QWORD *)this + 1);
    }
    *((_QWORD *)this + 2) = v3;
    operator delete(v5);
  }
  PB::Base::~Base(this);
}

uint64_t sirinluexternal::LanguageVariantResult::readFrom(sirinluexternal::LanguageVariantResult *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  char *v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  unint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  int64x2_t v39;
  unint64_t v40;
  uint64_t v41;
  int64x2_t v42;
  unint64_t v43;
  char *v44;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (char *)this + 24;
    do
    {
      v9 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        v16 = 0;
        v17 = 0;
        v12 = 0;
        if (v2 > v3)
          v3 = v2;
        while (v3 != v2)
        {
          v18 = v2 + 1;
          v19 = *(_BYTE *)(v9 + v2);
          *((_QWORD *)a2 + 1) = v18;
          v12 |= (unint64_t)(v19 & 0x7F) << v16;
          if ((v19 & 0x80) == 0)
            goto LABEL_21;
          v16 += 7;
          v2 = v18;
          v15 = v17++ > 8;
          if (v15)
            goto LABEL_26;
        }
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_26;
      }
LABEL_21:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v12 >> 3) == 2)
      {
        v26 = operator new();
        *(_QWORD *)v26 = &off_1E7BAF268;
        *(_QWORD *)(v26 + 8) = 0;
        *(_DWORD *)(v26 + 16) = 0;
        v27 = *((_QWORD *)this + 4);
        *((_QWORD *)this + 4) = v26;
        if (v27)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v27 + 8))(v27);
          v26 = *((_QWORD *)this + 4);
        }
      }
      else
      {
        if ((v12 >> 3) != 1)
        {
LABEL_26:
          result = PB::Reader::skip(a2);
          if (!(_DWORD)result)
            return result;
          goto LABEL_48;
        }
        v20 = operator new();
        v21 = v20;
        *(_QWORD *)v20 = &off_1E7BB1290;
        *(_QWORD *)(v20 + 8) = 0;
        *(_DWORD *)(v20 + 24) = 0;
        v23 = (uint64_t *)*((_QWORD *)this + 2);
        v22 = *((_QWORD *)this + 3);
        if ((unint64_t)v23 >= v22)
        {
          v28 = *((_QWORD *)this + 1);
          v29 = ((uint64_t)v23 - v28) >> 3;
          if ((unint64_t)(v29 + 1) >> 61)
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          v30 = v22 - v28;
          v31 = v30 >> 2;
          if (v30 >> 2 <= (unint64_t)(v29 + 1))
            v31 = v29 + 1;
          if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
            v32 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v32 = v31;
          v44 = v8;
          if (v32)
            v32 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v32);
          else
            v33 = 0;
          v34 = (uint64_t *)(v32 + 8 * v29);
          v35 = v32 + 8 * v33;
          v43 = v35;
          *v34 = v21;
          v24 = v34 + 1;
          v42.i64[1] = (uint64_t)(v34 + 1);
          v37 = (_QWORD *)*((_QWORD *)this + 1);
          v36 = (_QWORD *)*((_QWORD *)this + 2);
          if (v36 == v37)
          {
            v39 = vdupq_n_s64((unint64_t)v36);
          }
          else
          {
            do
            {
              v38 = *--v36;
              *v36 = 0;
              *--v34 = v38;
            }
            while (v36 != v37);
            v39 = *(int64x2_t *)((char *)this + 8);
            v24 = (_QWORD *)v42.i64[1];
            v35 = v43;
          }
          *((_QWORD *)this + 1) = v34;
          *((_QWORD *)this + 2) = v24;
          v42 = v39;
          v40 = *((_QWORD *)this + 3);
          *((_QWORD *)this + 3) = v35;
          v43 = v40;
          v41 = v39.i64[0];
          std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v41);
        }
        else
        {
          *v23 = v20;
          v24 = v23 + 1;
        }
        *((_QWORD *)this + 2) = v24;
        v26 = *(v24 - 1);
      }
      if (!PB::Reader::placeMark()
        || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v26 + 16))(v26, a2) & 1) == 0)
      {
        return 0;
      }
      PB::Reader::recallMark();
LABEL_48:
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
    }
    while (v2 < v3 && !*((_BYTE *)a2 + 24));
  }
  return v4 == 0;
}

void sub_1C200A334(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t sirinluexternal::LanguageVariantResult::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base **v4;
  const PB::Base **v5;
  const PB::Base *v6;
  const PB::Base *v7;

  v3 = this;
  v4 = *(const PB::Base ***)(this + 8);
  v5 = *(const PB::Base ***)(this + 16);
  while (v4 != v5)
  {
    v6 = *v4++;
    this = PB::Writer::writeSubmessage(a2, v6);
  }
  v7 = *(const PB::Base **)(v3 + 32);
  if (v7)
    return PB::Writer::writeSubmessage(a2, v7);
  return this;
}

uint64_t sirinluexternal::LanguageVariantResult::formatText(sirinluexternal::LanguageVariantResult *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = (uint64_t *)*((_QWORD *)this + 1);
  v6 = (uint64_t *)*((_QWORD *)this + 2);
  while (v5 != v6)
  {
    v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v7 + 32))(v7, a2, "multilingual_variant");
  }
  v8 = *((_QWORD *)this + 4);
  if (v8)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v8 + 32))(v8, a2, "parser");
  return PB::TextFormatter::endObject(a2);
}

double sirinluexternal::LanguageVariantResult::LanguageVariantResult(sirinluexternal::LanguageVariantResult *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB2208;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB2208;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

sirinluexternal::LanguageVariantResult *sirinluexternal::LanguageVariantResult::LanguageVariantResult(sirinluexternal::LanguageVariantResult *this, const sirinluexternal::LanguageVariantResult *a2)
{
  int64x2_t *v4;
  const sirinluexternal::MultilingualVariant **v5;
  const sirinluexternal::MultilingualVariant **i;
  const sirinluexternal::MultilingualVariant *v7;
  sirinluexternal::MultilingualVariant *v8;
  unint64_t v9;
  sirinluexternal::MultilingualVariant **v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  sirinluexternal::MultilingualVariant **v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  sirinluexternal::MultilingualVariant *v21;
  int64x2_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v32;
  int64x2_t v33;
  unint64_t v34;
  char *v35;

  *(_QWORD *)this = &off_1E7BB2208;
  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (int64x2_t *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  v5 = (const sirinluexternal::MultilingualVariant **)*((_QWORD *)a2 + 1);
  for (i = (const sirinluexternal::MultilingualVariant **)*((_QWORD *)a2 + 2); v5 != i; ++v5)
  {
    v7 = *v5;
    v8 = (sirinluexternal::MultilingualVariant *)operator new();
    sirinluexternal::MultilingualVariant::MultilingualVariant(v8, v7);
    v10 = (sirinluexternal::MultilingualVariant **)*((_QWORD *)this + 2);
    v9 = *((_QWORD *)this + 3);
    if ((unint64_t)v10 >= v9)
    {
      v12 = ((uint64_t)v10 - v4->i64[0]) >> 3;
      if ((unint64_t)(v12 + 1) >> 61)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v13 = v9 - v4->i64[0];
      v14 = v13 >> 2;
      if (v13 >> 2 <= (unint64_t)(v12 + 1))
        v14 = v12 + 1;
      if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
        v15 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v15 = v14;
      v35 = (char *)this + 24;
      if (v15)
        v15 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v15);
      else
        v16 = 0;
      v17 = (sirinluexternal::MultilingualVariant **)(v15 + 8 * v12);
      v18 = v15 + 8 * v16;
      v34 = v18;
      *v17 = v8;
      v11 = v17 + 1;
      v33.i64[1] = (uint64_t)(v17 + 1);
      v20 = (_QWORD *)*((_QWORD *)this + 1);
      v19 = (_QWORD *)*((_QWORD *)this + 2);
      if (v19 == v20)
      {
        v22 = vdupq_n_s64((unint64_t)v19);
      }
      else
      {
        do
        {
          v21 = (sirinluexternal::MultilingualVariant *)*--v19;
          *v19 = 0;
          *--v17 = v21;
        }
        while (v19 != v20);
        v22 = *v4;
        v11 = (_QWORD *)v33.i64[1];
        v18 = v34;
      }
      *((_QWORD *)this + 1) = v17;
      *((_QWORD *)this + 2) = v11;
      v33 = v22;
      v23 = *((_QWORD *)this + 3);
      *((_QWORD *)this + 3) = v18;
      v34 = v23;
      v32 = v22.i64[0];
      std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v32);
    }
    else
    {
      *v10 = v8;
      v11 = v10 + 1;
    }
    *((_QWORD *)this + 2) = v11;
  }
  if (*((_QWORD *)a2 + 4))
  {
    v24 = operator new();
    v25 = *((_QWORD *)a2 + 4);
    *(_QWORD *)v24 = &off_1E7BAF268;
    *(_QWORD *)(v24 + 8) = 0;
    *(_DWORD *)(v24 + 16) = 0;
    v26 = *(_BYTE *)(v25 + 16);
    if ((v26 & 1) != 0)
    {
      v28 = *(_DWORD *)(v25 + 8);
      *(_BYTE *)(v24 + 16) = 1;
      *(_DWORD *)(v24 + 8) = v28;
      v27 = 3;
      if ((v26 & 2) == 0)
        goto LABEL_25;
    }
    else
    {
      v27 = 2;
      if ((*(_BYTE *)(v25 + 16) & 2) == 0)
      {
LABEL_25:
        v30 = *((_QWORD *)this + 4);
        *((_QWORD *)this + 4) = v24;
        if (v30)
          (*(void (**)(uint64_t))(*(_QWORD *)v30 + 8))(v30);
        return this;
      }
    }
    v29 = *(_DWORD *)(v25 + 12);
    *(_BYTE *)(v24 + 16) = v27;
    *(_DWORD *)(v24 + 12) = v29;
    goto LABEL_25;
  }
  return this;
}

void sub_1C200A720(void *a1)
{
  __clang_call_terminate(a1);
}

uint64_t sirinluexternal::LanguageVariantResult::operator=(uint64_t a1, const sirinluexternal::LanguageVariantResult *a2)
{
  __int128 v3;
  __int128 v4;
  _BYTE v6[8];
  __int128 v7;
  __int128 v8;

  if ((const sirinluexternal::LanguageVariantResult *)a1 != a2)
  {
    sirinluexternal::LanguageVariantResult::LanguageVariantResult((sirinluexternal::LanguageVariantResult *)v6, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v8;
    v7 = v3;
    v8 = v4;
    sirinluexternal::LanguageVariantResult::~LanguageVariantResult((sirinluexternal::LanguageVariantResult *)v6);
  }
  return a1;
}

_QWORD *sirinluexternal::swap(_QWORD *this, sirinluexternal::LanguageVariantResult *a2, sirinluexternal::LanguageVariantResult *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = this[1];
  this[1] = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  v4 = this[2];
  this[2] = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v4;
  v5 = this[3];
  this[3] = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v5;
  v6 = this[4];
  this[4] = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v6;
  return this;
}

uint64_t sirinluexternal::LanguageVariantResult::LanguageVariantResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a1 = &off_1E7BB2208;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a2 + 8) = 0u;
  v3 = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a2 + 24) = 0u;
  v4 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v3;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  return a1;
}

uint64_t sirinluexternal::LanguageVariantResult::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  _BYTE v6[8];
  __int128 v7;
  __int128 v8;

  if (a1 != a2)
  {
    sirinluexternal::LanguageVariantResult::LanguageVariantResult((uint64_t)v6, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v8;
    v7 = v3;
    v8 = v4;
    sirinluexternal::LanguageVariantResult::~LanguageVariantResult((sirinluexternal::LanguageVariantResult *)v6);
  }
  return a1;
}

BOOL sirinluexternal::LanguageVariantResult::operator==(_QWORD *a1, _QWORD *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BOOL8 result;
  uint64_t v8;
  uint64_t v9;

  v3 = (uint64_t *)a1[1];
  v2 = (uint64_t *)a1[2];
  v4 = (uint64_t *)a2[1];
  if ((char *)v2 - (char *)v3 != a2[2] - (_QWORD)v4)
    return 0;
  while (v3 != v2)
  {
    result = sirinluexternal::MultilingualVariant::operator==(*v3, *v4);
    if (!result)
      return result;
    ++v3;
    ++v4;
  }
  v8 = a1[4];
  v9 = a2[4];
  result = (v8 | v9) == 0;
  if (v8)
  {
    if (v9)
      return sirinluexternal::Parser::operator==(a1[4], v9);
  }
  return result;
}

uint64_t sirinluexternal::LanguageVariantResult::hash_value(sirinluexternal::LanguageVariantResult *this)
{
  sirinluexternal::MultilingualVariant **v2;
  sirinluexternal::MultilingualVariant **v3;
  uint64_t v4;
  sirinluexternal::MultilingualVariant *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (sirinluexternal::MultilingualVariant **)*((_QWORD *)this + 1);
  v3 = (sirinluexternal::MultilingualVariant **)*((_QWORD *)this + 2);
  if (v2 == v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = 0;
    do
    {
      v5 = *v2++;
      v4 ^= sirinluexternal::MultilingualVariant::hash_value(v5);
    }
    while (v2 != v3);
  }
  v6 = *((_QWORD *)this + 4);
  if (v6)
  {
    if ((*(_BYTE *)(v6 + 16) & 1) != 0)
    {
      v7 = *(int *)(v6 + 8);
      if ((*(_BYTE *)(v6 + 16) & 2) != 0)
        goto LABEL_9;
    }
    else
    {
      v7 = 0;
      if ((*(_BYTE *)(v6 + 16) & 2) != 0)
      {
LABEL_9:
        v8 = *(int *)(v6 + 12);
LABEL_12:
        v6 = v8 ^ v7;
        return v6 ^ v4;
      }
    }
    v8 = 0;
    goto LABEL_12;
  }
  return v6 ^ v4;
}

_QWORD *sirinluexternal::LanguageVariantResult::makeParser(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[4])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BAF268;
    *(_QWORD *)(v2 + 8) = 0;
    *(_DWORD *)(v2 + 16) = 0;
    this = (_QWORD *)v1[4];
    v1[4] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

uint64_t SIRINLUINTERNALEMBEDDINGEmbeddingResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  SIRINLUINTERNALNLv4EmbeddingTensor *v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(SIRINLUINTERNALNLv4EmbeddingTensor);
        v18 = 40;
        goto LABEL_47;
      case 2u:
        v17 = objc_alloc_init(SIRINLUINTERNALTokenChain);
        objc_storeStrong((id *)(a1 + 80), v17);
        if (!PBReaderPlaceMark() || !SIRINLUINTERNALTokenChainReadFrom((char *)v17, a2))
          goto LABEL_84;
        goto LABEL_64;
      case 3u:
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 88) |= 8u;
        while (2)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if (v25 < 0)
            {
              v20 += 7;
              v14 = v21++ >= 9;
              if (v14)
              {
                v22 = 0;
                goto LABEL_68;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_68:
        v41 = 32;
        goto LABEL_81;
      case 4u:
        v26 = 0;
        v27 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 88) |= 2u;
        while (2)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 1;
            v22 |= (unint64_t)(v30 & 0x7F) << v26;
            if (v30 < 0)
            {
              v26 += 7;
              v14 = v27++ >= 9;
              if (v14)
              {
                v22 = 0;
                goto LABEL_72;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_72:
        v41 = 16;
        goto LABEL_81;
      case 5u:
        v31 = 0;
        v32 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 88) |= 1u;
        while (2)
        {
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 1;
            v22 |= (unint64_t)(v35 & 0x7F) << v31;
            if (v35 < 0)
            {
              v31 += 7;
              v14 = v32++ >= 9;
              if (v14)
              {
                v22 = 0;
                goto LABEL_76;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_76:
        v41 = 8;
        goto LABEL_81;
      case 6u:
        v17 = objc_alloc_init(SIRINLUINTERNALNLv4EmbeddingTensor);
        v18 = 56;
LABEL_47:
        objc_storeStrong((id *)(a1 + v18), v17);
        if (!PBReaderPlaceMark()
          || (SIRINLUINTERNALNLv4EmbeddingTensorReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_84;
        }
        goto LABEL_64;
      case 7u:
        v17 = objc_alloc_init(SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput);
        objc_msgSend((id)a1, "addEmbeddingTensorOutputs:", v17);
        goto LABEL_62;
      case 8u:
        v17 = objc_alloc_init(SIRINLUINTERNALSubwordTokenChain);
        objc_storeStrong((id *)(a1 + 72), v17);
        if (!PBReaderPlaceMark() || !SIRINLUINTERNALSubwordTokenChainReadFrom(v17, a2))
          goto LABEL_84;
        goto LABEL_64;
      case 9u:
        v36 = 0;
        v37 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 88) |= 4u;
        while (2)
        {
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 1;
            v22 |= (unint64_t)(v40 & 0x7F) << v36;
            if (v40 < 0)
            {
              v36 += 7;
              v14 = v37++ >= 9;
              if (v14)
              {
                v22 = 0;
                goto LABEL_80;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_80:
        v41 = 24;
LABEL_81:
        *(_QWORD *)(a1 + v41) = v22;
        goto LABEL_82;
      case 0xAu:
        v17 = objc_alloc_init(SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutput);
        objc_msgSend((id)a1, "addSubwordEmbeddingTensorOutputs:", v17);
LABEL_62:
        if (PBReaderPlaceMark()
          && (SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutputReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_64:
          PBReaderRecallMark();

LABEL_82:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_84:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_82;
    }
  }
}

BOOL SIRINLUEXTERNALSystemPromptedReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  SIRINLUEXTERNALUUID *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(SIRINLUEXTERNALUUID);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALUUIDReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(SIRINLUEXTERNALUsoGraph);
    objc_storeStrong((id *)(a1 + 8), v17);
    if (!PBReaderPlaceMark() || !SIRINLUEXTERNALUsoGraphReadFrom((id *)&v17->super.super.isa, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL SIRINLUINTERNALSNLP_INTERMEDIATEITFMAssetVersionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark()
          || (SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersionReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = *(SIRINLUINTERNALSNLP_INTERMEDIATESNLPAssetVersion **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SIRICOMMONBytesValueReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sirinluexternalcdm::NluResponse::~NluResponse(sirinluexternalcdm::NluResponse *this)
{
  sirinluexternalcdm::NluResponse::~NluResponse(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void **v11;

  *(_QWORD *)this = &off_1E7BB2258;
  v2 = *((_QWORD *)this + 10);
  *((_QWORD *)this + 10) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = *((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = *((_QWORD *)this + 8);
  *((_QWORD *)this + 8) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = (_QWORD *)*((_QWORD *)this + 5);
  if (v5)
  {
    v6 = (_QWORD *)*((_QWORD *)this + 6);
    v7 = (void *)*((_QWORD *)this + 5);
    if (v6 != v5)
    {
      do
      {
        v9 = *--v6;
        v8 = v9;
        *v6 = 0;
        if (v9)
          (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
      }
      while (v6 != v5);
      v7 = (void *)*((_QWORD *)this + 5);
    }
    *((_QWORD *)this + 6) = v5;
    operator delete(v7);
  }
  v11 = (void **)((char *)this + 16);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v11);
  v10 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  PB::Base::~Base(this);
}

uint64_t sirinluexternalcdm::NluResponse::readFrom(sirinluexternalcdm::NluResponse *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t **v8;
  void (**v9)(sirinluexternal::RequestID *__hidden);
  char *v10;
  uint64_t v11;
  char v12;
  unsigned int v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  char v18;
  unsigned int v19;
  unint64_t v20;
  char v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (**v27)(sirinluexternal::RequestID *__hidden);
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  unint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  int64x2_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int64x2_t v49;
  unint64_t v50;
  char *v51;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  v8 = (uint64_t **)((char *)this + 16);
  v9 = &off_1E7BAE468;
  v10 = (char *)this + 56;
  while (1)
  {
    v11 = *(_QWORD *)a2;
    if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      while (1)
      {
        v15 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v16 = *(_BYTE *)(v11 + v2);
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0)
          break;
        v12 += 7;
        v2 = v15;
        v17 = v13++ > 8;
        if (v17)
          goto LABEL_20;
      }
LABEL_22:
      if ((v14 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v14 >> 3))
      {
        case 1u:
          v23 = operator new();
          *(_QWORD *)v23 = v9;
          *(_OWORD *)(v23 + 8) = 0u;
          *(_OWORD *)(v23 + 24) = 0u;
          *(_OWORD *)(v23 + 40) = 0u;
          *(_QWORD *)(v23 + 56) = 0;
          v24 = *((_QWORD *)this + 8);
          *((_QWORD *)this + 8) = v23;
          if (v24)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
            v23 = *((_QWORD *)this + 8);
          }
          goto LABEL_35;
        case 2u:
          PB::PtrVector<sirinluexternal::UserParse>::emplace_back<>(v8);
          v23 = *(_QWORD *)(*((_QWORD *)this + 3) - 8);
          goto LABEL_35;
        case 3u:
          v23 = operator new();
          *(_QWORD *)(v23 + 8) = 0;
          *(_QWORD *)(v23 + 16) = 0;
          *(_QWORD *)v23 = &off_1E7BB0498;
          v26 = *((_QWORD *)this + 9);
          *((_QWORD *)this + 9) = v23;
          if (v26)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
            v23 = *((_QWORD *)this + 9);
          }
          goto LABEL_35;
        case 4u:
          v27 = v9;
          v28 = operator new();
          v29 = v28;
          *(_QWORD *)v28 = &off_1E7BB21B8;
          *(_DWORD *)(v28 + 12) = 0;
          *(_DWORD *)(v28 + 16) = 0;
          v31 = (uint64_t *)*((_QWORD *)this + 6);
          v30 = *((_QWORD *)this + 7);
          if ((unint64_t)v31 >= v30)
          {
            v34 = *((_QWORD *)this + 5);
            v35 = ((uint64_t)v31 - v34) >> 3;
            if ((unint64_t)(v35 + 1) >> 61)
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            v36 = v30 - v34;
            v37 = v36 >> 2;
            if (v36 >> 2 <= (unint64_t)(v35 + 1))
              v37 = v35 + 1;
            if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8)
              v38 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v38 = v37;
            v51 = v10;
            if (v38)
              v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v38);
            else
              v39 = 0;
            v40 = (uint64_t *)(v38 + 8 * v35);
            v41 = v38 + 8 * v39;
            v50 = v41;
            *v40 = v29;
            v32 = v40 + 1;
            v49.i64[1] = (uint64_t)(v40 + 1);
            v43 = (_QWORD *)*((_QWORD *)this + 5);
            v42 = (_QWORD *)*((_QWORD *)this + 6);
            if (v42 == v43)
            {
              v45 = vdupq_n_s64((unint64_t)v42);
            }
            else
            {
              do
              {
                v44 = *--v42;
                *v42 = 0;
                *--v40 = v44;
              }
              while (v42 != v43);
              v45 = *(int64x2_t *)((char *)this + 40);
              v32 = (_QWORD *)v49.i64[1];
              v41 = v50;
            }
            *((_QWORD *)this + 5) = v40;
            *((_QWORD *)this + 6) = v32;
            v49 = v45;
            v46 = *((_QWORD *)this + 7);
            *((_QWORD *)this + 7) = v41;
            v50 = v46;
            v48 = v45.i64[0];
            std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v48);
          }
          else
          {
            *v31 = v28;
            v32 = v31 + 1;
          }
          *((_QWORD *)this + 6) = v32;
          v47 = *(v32 - 1);
          if (!PB::Reader::placeMark()
            || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v47 + 16))(v47, a2) & 1) == 0)
          {
            return 0;
          }
          PB::Reader::recallMark();
          v9 = v27;
          goto LABEL_38;
        case 5u:
          v23 = operator new();
          *(_QWORD *)v23 = &off_1E7BB2208;
          *(_OWORD *)(v23 + 8) = 0u;
          *(_OWORD *)(v23 + 24) = 0u;
          v25 = *((_QWORD *)this + 1);
          *((_QWORD *)this + 1) = v23;
          if (v25)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
            v23 = *((_QWORD *)this + 1);
          }
          goto LABEL_35;
        case 6u:
          v23 = operator new();
          *(_QWORD *)v23 = &off_1E7BAFD10;
          *(_OWORD *)(v23 + 8) = 0u;
          *(_OWORD *)(v23 + 24) = 0u;
          *(_QWORD *)(v23 + 40) = 0;
          v33 = *((_QWORD *)this + 10);
          *((_QWORD *)this + 10) = v23;
          if (v33)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v33 + 8))(v33);
            v23 = *((_QWORD *)this + 10);
          }
LABEL_35:
          if (!PB::Reader::placeMark()
            || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v23 + 16))(v23, a2) & 1) == 0)
          {
            return 0;
          }
          PB::Reader::recallMark();
          break;
        default:
          goto LABEL_20;
      }
      goto LABEL_38;
    }
    v18 = 0;
    v19 = 0;
    v14 = 0;
    if (v2 > v3)
      v3 = v2;
    do
    {
      if (v3 == v2)
      {
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v20 = v2 + 1;
      v21 = *(_BYTE *)(v11 + v2);
      *((_QWORD *)a2 + 1) = v20;
      v14 |= (unint64_t)(v21 & 0x7F) << v18;
      if ((v21 & 0x80) == 0)
        goto LABEL_22;
      v18 += 7;
      v2 = v20;
      v17 = v19++ > 8;
    }
    while (!v17);
LABEL_20:
    result = PB::Reader::skip(a2);
    if (!(_DWORD)result)
      return result;
LABEL_38:
    v2 = *((_QWORD *)a2 + 1);
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || *((_BYTE *)a2 + 24))
      return v4 == 0;
  }
}

void sub_1C200DD98(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t sirinluexternalcdm::NluResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  _QWORD *v3;
  const PB::Base *v4;
  const PB::Base **v5;
  const PB::Base **v6;
  const PB::Base *v7;
  const PB::Base *v8;
  const PB::Base **v9;
  const PB::Base **v10;
  const PB::Base *v11;
  const PB::Base *v12;
  const PB::Base *v13;

  v3 = (_QWORD *)this;
  v4 = *(const PB::Base **)(this + 64);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = (const PB::Base **)v3[2];
  v6 = (const PB::Base **)v3[3];
  while (v5 != v6)
  {
    v7 = *v5++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  v8 = (const PB::Base *)v3[9];
  if (v8)
    this = PB::Writer::writeSubmessage(a2, v8);
  v9 = (const PB::Base **)v3[5];
  v10 = (const PB::Base **)v3[6];
  while (v9 != v10)
  {
    v11 = *v9++;
    this = PB::Writer::writeSubmessage(a2, v11);
  }
  v12 = (const PB::Base *)v3[1];
  if (v12)
    this = PB::Writer::writeSubmessage(a2, v12);
  v13 = (const PB::Base *)v3[10];
  if (v13)
    return PB::Writer::writeSubmessage(a2, v13);
  return this;
}

uint64_t sirinluexternalcdm::NluResponse::formatText(sirinluexternalcdm::NluResponse *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "language_variant_result");
  v6 = (uint64_t *)*((_QWORD *)this + 2);
  v7 = (uint64_t *)*((_QWORD *)this + 3);
  while (v6 != v7)
  {
    v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v8 + 32))(v8, a2, "parses");
  }
  v9 = (uint64_t *)*((_QWORD *)this + 5);
  v10 = (uint64_t *)*((_QWORD *)this + 6);
  while (v9 != v10)
  {
    v11 = *v9++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v11 + 32))(v11, a2, "repetition_results");
  }
  v12 = *((_QWORD *)this + 8);
  if (v12)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v12 + 32))(v12, a2, "request_id");
  v13 = *((_QWORD *)this + 9);
  if (v13)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v13 + 32))(v13, a2, "response_status");
  v14 = *((_QWORD *)this + 10);
  if (v14)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v14 + 32))(v14, a2, "supplementary_output");
  return PB::TextFormatter::endObject(a2);
}

double sirinluexternalcdm::NluResponse::NluResponse(sirinluexternalcdm::NluResponse *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB2258;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB2258;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  return result;
}

sirinluexternalcdm::NluResponse *sirinluexternalcdm::NluResponse::NluResponse(sirinluexternalcdm::NluResponse *this, const sirinluexternal::RequestID **a2)
{
  sirinluexternal::LanguageVariantResult **v4;
  sirinluexternal::RequestID *v5;
  sirinluexternal::RequestID *v6;
  uint64_t v7;
  const sirinluexternal::UUID ***v8;
  const sirinluexternal::UUID ***i;
  sirinluexternal::ResponseStatus *v10;
  sirinluexternal::ResponseStatus *v11;
  uint64_t v12;
  const sirinluexternal::RequestID *v13;
  const sirinluexternal::RequestID *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  int v19;
  int v20;
  unint64_t v21;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  unint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  int64x2_t v35;
  unint64_t v36;
  sirinluexternal::LanguageVariantResult *v37;
  sirinluexternal::LanguageVariantResult *v38;
  sirinluexternal::LanguageVariantResult *v39;
  sirinluexternal::NLUSupplementaryOutput *v40;
  sirinluexternal::NLUSupplementaryOutput *v41;
  uint64_t v42;
  sirinluexternal::LanguageVariantResult **v44;
  uint64_t v45;
  int64x2_t v46;
  unint64_t v47;
  char *v48;

  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (sirinluexternal::LanguageVariantResult **)((char *)this + 8);
  *(_QWORD *)this = &off_1E7BB2258;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  if (a2[8])
  {
    v5 = (sirinluexternal::RequestID *)operator new();
    v6 = sirinluexternal::RequestID::RequestID(v5, a2[8]);
    v7 = *((_QWORD *)this + 8);
    *((_QWORD *)this + 8) = v6;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
  v8 = (const sirinluexternal::UUID ***)a2[2];
  for (i = (const sirinluexternal::UUID ***)a2[3]; v8 != i; ++v8)
    PB::PtrVector<sirinluexternal::UserParse>::emplace_back<sirinluexternal::UserParse const&>((sirinluexternal::UserParse ***)this + 2, *v8);
  if (a2[9])
  {
    v10 = (sirinluexternal::ResponseStatus *)operator new();
    v11 = sirinluexternal::ResponseStatus::ResponseStatus(v10, a2[9]);
    v12 = *((_QWORD *)this + 9);
    *((_QWORD *)this + 9) = v11;
    if (v12)
      (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  }
  v44 = v4;
  v13 = a2[5];
  v14 = a2[6];
  if (v13 != v14)
  {
    while (1)
    {
      v15 = *(_QWORD *)v13;
      v16 = operator new();
      v17 = v16;
      *(_QWORD *)v16 = &off_1E7BB21B8;
      *(_DWORD *)(v16 + 12) = 0;
      *(_DWORD *)(v16 + 16) = 0;
      if ((*(_BYTE *)(v15 + 16) & 1) == 0)
        break;
      v19 = *(_DWORD *)(v15 + 8);
      *(_BYTE *)(v16 + 16) = 1;
      *(_DWORD *)(v16 + 8) = v19;
      v18 = 3;
      if ((*(_BYTE *)(v15 + 16) & 2) != 0)
        goto LABEL_14;
LABEL_15:
      v22 = (uint64_t *)*((_QWORD *)this + 6);
      v21 = *((_QWORD *)this + 7);
      if ((unint64_t)v22 >= v21)
      {
        v24 = *((_QWORD *)this + 5);
        v25 = ((uint64_t)v22 - v24) >> 3;
        if ((unint64_t)(v25 + 1) >> 61)
          std::vector<std::string>::__throw_length_error[abi:ne180100]();
        v26 = v21 - v24;
        v27 = v26 >> 2;
        if (v26 >> 2 <= (unint64_t)(v25 + 1))
          v27 = v25 + 1;
        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8)
          v28 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v28 = v27;
        v48 = (char *)this + 56;
        if (v28)
          v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v28);
        else
          v29 = 0;
        v30 = (uint64_t *)(v28 + 8 * v25);
        v31 = v28 + 8 * v29;
        v47 = v31;
        *v30 = v17;
        v23 = v30 + 1;
        v46.i64[1] = (uint64_t)(v30 + 1);
        v33 = (_QWORD *)*((_QWORD *)this + 5);
        v32 = (_QWORD *)*((_QWORD *)this + 6);
        if (v32 == v33)
        {
          v35 = vdupq_n_s64((unint64_t)v32);
        }
        else
        {
          do
          {
            v34 = *--v32;
            *v32 = 0;
            *--v30 = v34;
          }
          while (v32 != v33);
          v35 = *(int64x2_t *)((char *)this + 40);
          v23 = (_QWORD *)v46.i64[1];
          v31 = v47;
        }
        *((_QWORD *)this + 5) = v30;
        *((_QWORD *)this + 6) = v23;
        v46 = v35;
        v36 = *((_QWORD *)this + 7);
        *((_QWORD *)this + 7) = v31;
        v47 = v36;
        v45 = v35.i64[0];
        std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v45);
      }
      else
      {
        *v22 = v16;
        v23 = v22 + 1;
      }
      *((_QWORD *)this + 6) = v23;
      v13 = (const sirinluexternal::RequestID *)((char *)v13 + 8);
      if (v13 == v14)
        goto LABEL_32;
    }
    v18 = 2;
    if ((*(_BYTE *)(v15 + 16) & 2) == 0)
      goto LABEL_15;
LABEL_14:
    v20 = *(_DWORD *)(v15 + 12);
    *(_BYTE *)(v16 + 16) = v18;
    *(_DWORD *)(v16 + 12) = v20;
    goto LABEL_15;
  }
LABEL_32:
  if (a2[1])
  {
    v37 = (sirinluexternal::LanguageVariantResult *)operator new();
    v38 = sirinluexternal::LanguageVariantResult::LanguageVariantResult(v37, a2[1]);
    v39 = *v44;
    *v44 = v38;
    if (v39)
      (*(void (**)(sirinluexternal::LanguageVariantResult *))(*(_QWORD *)v39 + 8))(v39);
  }
  if (a2[10])
  {
    v40 = (sirinluexternal::NLUSupplementaryOutput *)operator new();
    v41 = sirinluexternal::NLUSupplementaryOutput::NLUSupplementaryOutput(v40, a2[10]);
    v42 = *((_QWORD *)this + 10);
    *((_QWORD *)this + 10) = v41;
    if (v42)
      (*(void (**)(uint64_t))(*(_QWORD *)v42 + 8))(v42);
  }
  return this;
}

void sub_1C200E3F4(void *a1)
{
  __clang_call_terminate(a1);
}

uint64_t sirinluexternalcdm::NluResponse::operator=(uint64_t a1, const sirinluexternal::RequestID **a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _BYTE v9[8];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  if ((const sirinluexternal::RequestID **)a1 != a2)
  {
    sirinluexternalcdm::NluResponse::NluResponse((sirinluexternalcdm::NluResponse *)v9, a2);
    v3 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v11;
    v4 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v12;
    v11 = v3;
    v12 = v4;
    v5 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)(a1 + 56) = v13;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v10;
    v10 = v6;
    v7 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)(a1 + 72) = v14;
    v13 = v5;
    v14 = v7;
    sirinluexternalcdm::NluResponse::~NluResponse((sirinluexternalcdm::NluResponse *)v9);
  }
  return a1;
}

_QWORD *sirinluexternalcdm::swap(_QWORD *this, sirinluexternalcdm::NluResponse *a2, sirinluexternalcdm::NluResponse *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = this[8];
  this[8] = *((_QWORD *)a2 + 8);
  *((_QWORD *)a2 + 8) = v3;
  v4 = this[2];
  this[2] = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v4;
  v5 = this[3];
  this[3] = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v5;
  v6 = this[4];
  this[4] = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v6;
  v7 = this[9];
  this[9] = *((_QWORD *)a2 + 9);
  *((_QWORD *)a2 + 9) = v7;
  v8 = this[5];
  this[5] = *((_QWORD *)a2 + 5);
  *((_QWORD *)a2 + 5) = v8;
  v9 = this[6];
  this[6] = *((_QWORD *)a2 + 6);
  *((_QWORD *)a2 + 6) = v9;
  v10 = this[7];
  this[7] = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v10;
  v11 = this[1];
  this[1] = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v11;
  v12 = this[10];
  this[10] = *((_QWORD *)a2 + 10);
  *((_QWORD *)a2 + 10) = v12;
  return this;
}

uint64_t sirinluexternalcdm::NluResponse::NluResponse(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_QWORD *)a1 = &off_1E7BB2258;
  v4 = (_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 40) = 0u;
  v5 = (_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a2 + 64) = 0;
  v7 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v6;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(v4);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 72) = 0;
  v9 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v8;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  v10 = (_QWORD *)*v5;
  if (*v5)
  {
    v11 = *(_QWORD **)(a1 + 48);
    v12 = (_QWORD *)*v5;
    if (v11 != v10)
    {
      do
      {
        v14 = *--v11;
        v13 = v14;
        *v11 = 0;
        if (v14)
          (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
      }
      while (v11 != v10);
      v12 = (_QWORD *)*v5;
    }
    *(_QWORD *)(a1 + 48) = v10;
    operator delete(v12);
    *v5 = 0;
    v5[1] = 0;
    v5[2] = 0;
  }
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  v15 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v16 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v15;
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  v17 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a2 + 80) = 0;
  v18 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 80) = v17;
  if (v18)
    (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
  return a1;
}

uint64_t sirinluexternalcdm::NluResponse::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _BYTE v9[8];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  if (a1 != a2)
  {
    sirinluexternalcdm::NluResponse::NluResponse((uint64_t)v9, a2);
    v3 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v11;
    v4 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v12;
    v11 = v3;
    v12 = v4;
    v5 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)(a1 + 56) = v13;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v10;
    v10 = v6;
    v7 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)(a1 + 72) = v14;
    v13 = v5;
    v14 = v7;
    sirinluexternalcdm::NluResponse::~NluResponse((sirinluexternalcdm::NluResponse *)v9);
  }
  return a1;
}

BOOL sirinluexternalcdm::NluResponse::operator==(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a1[8];
  v5 = *(_QWORD *)(a2 + 64);
  if (v4)
  {
    if (!v5 || !sirinluexternal::RequestID::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  result = PB::PtrVector<sirinluexternal::UserParse>::operator==(a1 + 2, *(uint64_t **)(a2 + 16), *(_QWORD *)(a2 + 24));
  if (!result)
    return result;
  v7 = a1[9];
  v8 = *(_QWORD *)(a2 + 72);
  if (v7)
  {
    if (!v8 || (sirinluexternal::ResponseStatus::operator==(v7, v8) & 1) == 0)
      return 0;
  }
  else if (v8)
  {
    return 0;
  }
  v10 = (uint64_t *)a1[5];
  v9 = (uint64_t *)a1[6];
  v11 = *(uint64_t **)(a2 + 40);
  if ((char *)v9 - (char *)v10 != *(_QWORD *)(a2 + 48) - (_QWORD)v11)
    return 0;
  while (v10 != v9)
  {
    result = sirinluexternal::RepetitionResult::operator==(*v10, *v11);
    if (!result)
      return result;
    ++v10;
    ++v11;
  }
  v12 = (_QWORD *)a1[1];
  v13 = *(_QWORD **)(a2 + 8);
  if (!v12)
  {
    if (!v13)
      goto LABEL_23;
    return 0;
  }
  if (!v13 || !sirinluexternal::LanguageVariantResult::operator==(v12, v13))
    return 0;
LABEL_23:
  v14 = a1[10];
  v15 = *(_QWORD *)(a2 + 80);
  result = (v14 | v15) == 0;
  if (v14)
  {
    if (v15)
      return sirinluexternal::NLUSupplementaryOutput::operator==((_QWORD *)a1[10], v15);
  }
  return result;
}

unint64_t sirinluexternalcdm::NluResponse::hash_value(sirinluexternalcdm::NluResponse *this)
{
  sirinluexternal::RequestID *v2;
  unint64_t v3;
  sirinluexternal::UserParse **v4;
  sirinluexternal::UserParse **v5;
  uint64_t v6;
  sirinluexternal::UserParse *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  sirinluexternal::LanguageVariantResult *v18;
  uint64_t v19;
  unint64_t v20;

  v2 = (sirinluexternal::RequestID *)*((_QWORD *)this + 8);
  if (v2)
    v3 = sirinluexternal::RequestID::hash_value(v2);
  else
    v3 = 0;
  v4 = (sirinluexternal::UserParse **)*((_QWORD *)this + 2);
  v5 = (sirinluexternal::UserParse **)*((_QWORD *)this + 3);
  if (v4 == v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    do
    {
      v7 = *v4++;
      v6 ^= sirinluexternal::UserParse::hash_value(v7);
    }
    while (v4 != v5);
  }
  v8 = *((_QWORD *)this + 9);
  if (v8)
  {
    if ((*(_BYTE *)(v8 + 20) & 1) != 0)
      v9 = *(int *)(v8 + 16);
    else
      v9 = 0;
    v11 = *(_QWORD *)(v8 + 8);
    if (v11)
      v11 = std::__string_hash<char>::operator()[abi:ne180100](v11);
    v10 = v11 ^ v9;
  }
  else
  {
    v10 = 0;
  }
  v12 = (uint64_t *)*((_QWORD *)this + 5);
  v13 = (uint64_t *)*((_QWORD *)this + 6);
  if (v12 != v13)
  {
    v14 = 0;
    while (1)
    {
      v15 = *v12;
      if ((*(_BYTE *)(*v12 + 16) & 1) != 0)
      {
        v16 = *(unsigned int *)(v15 + 8);
        if ((*(_BYTE *)(*v12 + 16) & 2) == 0)
        {
LABEL_23:
          v17 = 0;
          goto LABEL_24;
        }
      }
      else
      {
        v16 = 0;
        if ((*(_BYTE *)(*v12 + 16) & 2) == 0)
          goto LABEL_23;
      }
      v17 = *(int *)(v15 + 12);
LABEL_24:
      v14 ^= v17 ^ v16;
      if (++v12 == v13)
        goto LABEL_27;
    }
  }
  v14 = 0;
LABEL_27:
  v18 = (sirinluexternal::LanguageVariantResult *)*((_QWORD *)this + 1);
  if (v18)
    v19 = sirinluexternal::LanguageVariantResult::hash_value(v18);
  else
    v19 = 0;
  v20 = *((_QWORD *)this + 10);
  if (v20)
    v20 = sirinluexternal::NLUSupplementaryOutput::hash_value((sirinluexternal::NLUSupplementaryOutput *)v20);
  return v6 ^ v3 ^ v19 ^ v20 ^ v10 ^ v14;
}

_QWORD *sirinluexternalcdm::NluResponse::makeRequestId(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[8])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BAE468;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *(_QWORD *)(v2 + 56) = 0;
    this = (_QWORD *)v1[8];
    v1[8] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluexternalcdm::NluResponse::makeResponseStatus(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[9])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    v2[1] = 0;
    v2[2] = 0;
    *v2 = &off_1E7BB0498;
    this = (_QWORD *)v1[9];
    v1[9] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluexternalcdm::NluResponse::makeLanguageVariantResult(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BB2208;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

_QWORD *sirinluexternalcdm::NluResponse::makeSupplementaryOutput(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[10])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BAFD10;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_QWORD *)(v2 + 40) = 0;
    this = (_QWORD *)v1[10];
    v1[10] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void sirinluexternal::SystemInformed::~SystemInformed(sirinluexternal::SystemInformed *this)
{
  sirinluexternal::SystemInformed::~SystemInformed(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)this = &off_1E7BB22A8;
  v2 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = (_QWORD *)*((_QWORD *)this + 1);
  if (v3)
  {
    v4 = (_QWORD *)*((_QWORD *)this + 2);
    v5 = (void *)*((_QWORD *)this + 1);
    if (v4 != v3)
    {
      do
      {
        v7 = *--v4;
        v6 = v7;
        *v4 = 0;
        if (v7)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
      }
      while (v4 != v3);
      v5 = (void *)*((_QWORD *)this + 1);
    }
    *((_QWORD *)this + 2) = v3;
    operator delete(v5);
  }
  PB::Base::~Base(this);
}

uint64_t sirinluexternal::SystemInformed::readFrom(sirinluexternal::SystemInformed *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  char *v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  unint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  int64x2_t v39;
  unint64_t v40;
  uint64_t v41;
  int64x2_t v42;
  unint64_t v43;
  char *v44;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (char *)this + 24;
    do
    {
      v9 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        v16 = 0;
        v17 = 0;
        v12 = 0;
        if (v2 > v3)
          v3 = v2;
        while (v3 != v2)
        {
          v18 = v2 + 1;
          v19 = *(_BYTE *)(v9 + v2);
          *((_QWORD *)a2 + 1) = v18;
          v12 |= (unint64_t)(v19 & 0x7F) << v16;
          if ((v19 & 0x80) == 0)
            goto LABEL_21;
          v16 += 7;
          v2 = v18;
          v15 = v17++ > 8;
          if (v15)
            goto LABEL_26;
        }
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_26;
      }
LABEL_21:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v12 >> 3) == 2)
      {
        v23 = operator new();
        v24 = v23;
        *(_QWORD *)v23 = &off_1E7BB2398;
        *(_OWORD *)(v23 + 8) = 0u;
        *(_OWORD *)(v23 + 24) = 0u;
        *(_OWORD *)(v23 + 40) = 0u;
        *(_OWORD *)(v23 + 56) = 0u;
        *(_OWORD *)(v23 + 72) = 0u;
        *(_OWORD *)(v23 + 88) = 0u;
        *(_OWORD *)(v23 + 104) = 0u;
        *(_OWORD *)(v23 + 120) = 0u;
        v26 = (uint64_t *)*((_QWORD *)this + 2);
        v25 = *((_QWORD *)this + 3);
        if ((unint64_t)v26 >= v25)
        {
          v28 = *((_QWORD *)this + 1);
          v29 = ((uint64_t)v26 - v28) >> 3;
          if ((unint64_t)(v29 + 1) >> 61)
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          v30 = v25 - v28;
          v31 = v30 >> 2;
          if (v30 >> 2 <= (unint64_t)(v29 + 1))
            v31 = v29 + 1;
          if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
            v32 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v32 = v31;
          v44 = v8;
          if (v32)
            v32 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v32);
          else
            v33 = 0;
          v34 = (uint64_t *)(v32 + 8 * v29);
          v35 = v32 + 8 * v33;
          v43 = v35;
          *v34 = v24;
          v27 = v34 + 1;
          v42.i64[1] = (uint64_t)(v34 + 1);
          v37 = (_QWORD *)*((_QWORD *)this + 1);
          v36 = (_QWORD *)*((_QWORD *)this + 2);
          if (v36 == v37)
          {
            v39 = vdupq_n_s64((unint64_t)v36);
          }
          else
          {
            do
            {
              v38 = *--v36;
              *v36 = 0;
              *--v34 = v38;
            }
            while (v36 != v37);
            v39 = *(int64x2_t *)((char *)this + 8);
            v27 = (_QWORD *)v42.i64[1];
            v35 = v43;
          }
          *((_QWORD *)this + 1) = v34;
          *((_QWORD *)this + 2) = v27;
          v42 = v39;
          v40 = *((_QWORD *)this + 3);
          *((_QWORD *)this + 3) = v35;
          v43 = v40;
          v41 = v39.i64[0];
          std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v41);
        }
        else
        {
          *v26 = v23;
          v27 = v26 + 1;
        }
        *((_QWORD *)this + 2) = v27;
        v20 = (_QWORD *)*(v27 - 1);
      }
      else
      {
        if ((v12 >> 3) != 1)
        {
LABEL_26:
          result = PB::Reader::skip(a2);
          if (!(_DWORD)result)
            return result;
          goto LABEL_48;
        }
        v20 = (_QWORD *)operator new();
        *v20 = &off_1E7BB0CB8;
        v20[3] = 0;
        v21 = *((_QWORD *)this + 4);
        *((_QWORD *)this + 4) = v20;
        if (v21)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
          v20 = (_QWORD *)*((_QWORD *)this + 4);
        }
      }
      if (!PB::Reader::placeMark()
        || ((*(uint64_t (**)(_QWORD *, PB::Reader *))(*v20 + 16))(v20, a2) & 1) == 0)
      {
        return 0;
      }
      PB::Reader::recallMark();
LABEL_48:
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
    }
    while (v2 < v3 && !*((_BYTE *)a2 + 24));
  }
  return v4 == 0;
}

void sub_1C200EEC0(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t sirinluexternal::SystemInformed::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  const PB::Base **v5;
  const PB::Base **v6;
  const PB::Base *v7;

  v3 = this;
  v4 = *(const PB::Base **)(this + 32);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v6 = *(const PB::Base ***)(v3 + 8);
  v5 = *(const PB::Base ***)(v3 + 16);
  while (v6 != v5)
  {
    v7 = *v6++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  return this;
}

uint64_t sirinluexternal::SystemInformed::formatText(sirinluexternal::SystemInformed *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = (uint64_t *)*((_QWORD *)this + 1);
  v6 = (uint64_t *)*((_QWORD *)this + 2);
  while (v5 != v6)
  {
    v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v7 + 32))(v7, a2, "entities");
  }
  v8 = *((_QWORD *)this + 4);
  if (v8)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v8 + 32))(v8, a2, "task_id");
  return PB::TextFormatter::endObject(a2);
}

double sirinluexternal::SystemInformed::SystemInformed(sirinluexternal::SystemInformed *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB22A8;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB22A8;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  return result;
}

sirinluexternal::SystemInformed *sirinluexternal::SystemInformed::SystemInformed(sirinluexternal::SystemInformed *this, const sirinluexternal::UUID **a2)
{
  int64x2_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const sirinluexternal::SemVer ***v8;
  const sirinluexternal::SemVer ***i;
  const sirinluexternal::SemVer **v10;
  sirinluexternal::UsoGraph *v11;
  unint64_t v12;
  sirinluexternal::UsoGraph **v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  sirinluexternal::UsoGraph **v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  sirinluexternal::UsoGraph *v24;
  int64x2_t v25;
  unint64_t v26;
  uint64_t v28;
  int64x2_t v29;
  unint64_t v30;
  char *v31;

  *(_QWORD *)this = &off_1E7BB22A8;
  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (int64x2_t *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  if (a2[4])
  {
    v5 = operator new();
    v6 = sirinluexternal::UUID::UUID(v5, a2[4]);
    v7 = *((_QWORD *)this + 4);
    *((_QWORD *)this + 4) = v6;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
  v8 = (const sirinluexternal::SemVer ***)a2[1];
  for (i = (const sirinluexternal::SemVer ***)a2[2]; v8 != i; ++v8)
  {
    v10 = *v8;
    v11 = (sirinluexternal::UsoGraph *)operator new();
    sirinluexternal::UsoGraph::UsoGraph(v11, v10);
    v13 = (sirinluexternal::UsoGraph **)*((_QWORD *)this + 2);
    v12 = *((_QWORD *)this + 3);
    if ((unint64_t)v13 >= v12)
    {
      v15 = ((uint64_t)v13 - v4->i64[0]) >> 3;
      if ((unint64_t)(v15 + 1) >> 61)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v16 = v12 - v4->i64[0];
      v17 = v16 >> 2;
      if (v16 >> 2 <= (unint64_t)(v15 + 1))
        v17 = v15 + 1;
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
        v18 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v18 = v17;
      v31 = (char *)this + 24;
      if (v18)
        v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v18);
      else
        v19 = 0;
      v20 = (sirinluexternal::UsoGraph **)(v18 + 8 * v15);
      v21 = v18 + 8 * v19;
      v30 = v21;
      *v20 = v11;
      v14 = v20 + 1;
      v29.i64[1] = (uint64_t)(v20 + 1);
      v23 = (_QWORD *)*((_QWORD *)this + 1);
      v22 = (_QWORD *)*((_QWORD *)this + 2);
      if (v22 == v23)
      {
        v25 = vdupq_n_s64((unint64_t)v22);
      }
      else
      {
        do
        {
          v24 = (sirinluexternal::UsoGraph *)*--v22;
          *v22 = 0;
          *--v20 = v24;
        }
        while (v22 != v23);
        v25 = *v4;
        v14 = (_QWORD *)v29.i64[1];
        v21 = v30;
      }
      *((_QWORD *)this + 1) = v20;
      *((_QWORD *)this + 2) = v14;
      v29 = v25;
      v26 = *((_QWORD *)this + 3);
      *((_QWORD *)this + 3) = v21;
      v30 = v26;
      v28 = v25.i64[0];
      std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v28);
    }
    else
    {
      *v13 = v11;
      v14 = v13 + 1;
    }
    *((_QWORD *)this + 2) = v14;
  }
  return this;
}

void sub_1C200F25C(void *a1)
{
  __clang_call_terminate(a1);
}

uint64_t sirinluexternal::SystemInformed::operator=(uint64_t a1, const sirinluexternal::UUID **a2)
{
  __int128 v3;
  __int128 v4;
  _BYTE v6[8];
  __int128 v7;
  __int128 v8;

  if ((const sirinluexternal::UUID **)a1 != a2)
  {
    sirinluexternal::SystemInformed::SystemInformed((sirinluexternal::SystemInformed *)v6, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v8;
    v7 = v3;
    v8 = v4;
    sirinluexternal::SystemInformed::~SystemInformed((sirinluexternal::SystemInformed *)v6);
  }
  return a1;
}

_QWORD *sirinluexternal::swap(_QWORD *this, sirinluexternal::SystemInformed *a2, sirinluexternal::SystemInformed *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = this[4];
  this[4] = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v3;
  v4 = this[1];
  this[1] = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  v5 = this[2];
  this[2] = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v5;
  v6 = this[3];
  this[3] = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v6;
  return this;
}

uint64_t sirinluexternal::SystemInformed::SystemInformed(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  *(_OWORD *)(a1 + 8) = 0u;
  v4 = (_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = &off_1E7BB22A8;
  *(_OWORD *)(a1 + 24) = 0u;
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a2 + 32) = 0;
  v6 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = (_QWORD *)*v4;
  if (*v4)
  {
    v8 = *(_QWORD **)(a1 + 16);
    v9 = (_QWORD *)*v4;
    if (v8 != v7)
    {
      do
      {
        v11 = *--v8;
        v10 = v11;
        *v8 = 0;
        if (v11)
          (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
      }
      while (v8 != v7);
      v9 = (_QWORD *)*v4;
    }
    *(_QWORD *)(a1 + 16) = v7;
    operator delete(v9);
    *v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return a1;
}

uint64_t sirinluexternal::SystemInformed::operator=(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  _BYTE v6[8];
  __int128 v7;
  __int128 v8;

  if (a1 != a2)
  {
    sirinluexternal::SystemInformed::SystemInformed((uint64_t)v6, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    v4 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v8;
    v7 = v3;
    v8 = v4;
    sirinluexternal::SystemInformed::~SystemInformed((sirinluexternal::SystemInformed *)v6);
  }
  return a1;
}

uint64_t sirinluexternal::SystemInformed::operator==(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD **v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t result;
  BOOL v13;

  v4 = a1[4];
  v5 = *(_QWORD *)(a2 + 32);
  if (v4)
  {
    if (!v5 || !sirinluexternal::UUID::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v6 = a1[1];
  v7 = a1[2];
  v9 = a2 + 8;
  v8 = *(_QWORD ***)(a2 + 8);
  if (v7 - v6 != *(_QWORD *)(v9 + 8) - (_QWORD)v8)
    return 0;
  if (v6 == v7)
    return 1;
  v10 = v6 + 8;
  do
  {
    v11 = *v8++;
    result = sirinluexternal::UsoGraph::operator==(*(_QWORD **)(v10 - 8), v11);
    if ((_DWORD)result)
      v13 = v10 == v7;
    else
      v13 = 1;
    v10 += 8;
  }
  while (!v13);
  return result;
}

uint64_t sirinluexternal::SystemInformed::hash_value(sirinluexternal::SystemInformed *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  sirinluexternal::UsoGraph **v6;
  sirinluexternal::UsoGraph **v7;
  uint64_t v8;
  sirinluexternal::UsoGraph *v9;

  v1 = *((_QWORD *)this + 4);
  if (!v1)
  {
    v5 = 0;
    goto LABEL_11;
  }
  if ((*(_BYTE *)(v1 + 28) & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)(v1 + 28) & 2) != 0)
      goto LABEL_4;
LABEL_8:
    v3 = 0;
    if ((*(_BYTE *)(v1 + 28) & 4) != 0)
      goto LABEL_5;
LABEL_9:
    v4 = 0;
    goto LABEL_10;
  }
  v2 = *(_QWORD *)(v1 + 8);
  if ((*(_BYTE *)(v1 + 28) & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v3 = *(_QWORD *)(v1 + 16);
  if ((*(_BYTE *)(v1 + 28) & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v4 = *(int *)(v1 + 24);
LABEL_10:
  v5 = v3 ^ v2 ^ v4;
LABEL_11:
  v6 = (sirinluexternal::UsoGraph **)*((_QWORD *)this + 1);
  v7 = (sirinluexternal::UsoGraph **)*((_QWORD *)this + 2);
  if (v6 == v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    do
    {
      v9 = *v6++;
      v8 ^= sirinluexternal::UsoGraph::hash_value(v9);
    }
    while (v6 != v7);
  }
  return v8 ^ v5;
}

_QWORD *sirinluexternal::SystemInformed::makeTaskId(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;

  if (!this[4])
  {
    v1 = this;
    v2 = (_QWORD *)operator new();
    *v2 = &off_1E7BB0CB8;
    v2[3] = 0;
    this = (_QWORD *)v1[4];
    v1[4] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

BOOL SIRINLUINTERNALMentionResolverSpanDataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int *v23;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        *(_BYTE *)(a1 + 24) |= 1u;
        v18 = *v3;
        v19 = *(_QWORD *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v23 = &OBJC_IVAR___SIRINLUINTERNALMentionResolverSpanData__jointScore;
LABEL_32:
        *(_QWORD *)(a1 + *v23) = v20;
        goto LABEL_33;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_33:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    *(_BYTE *)(a1 + 24) |= 2u;
    v21 = *v3;
    v22 = *(_QWORD *)(a2 + v21);
    if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
      *(_QWORD *)(a2 + v21) = v22 + 8;
    }
    else
    {
      *(_BYTE *)(a2 + *v5) = 1;
      v20 = 0;
    }
    v23 = &OBJC_IVAR___SIRINLUINTERNALMentionResolverSpanData__modelScore;
    goto LABEL_32;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SIRINLUEXTERNALResponseStatusReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v23;

      }
      else if ((v10 >> 3) == 2)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_31;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::~ContextualSpanMatcherResponse(sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *this)
{
  void **v2;

  *(_QWORD *)this = &off_1E7BB22F8;
  v2 = (void **)((char *)this + 8);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v2);
  PB::Base::~Base(this);
}

{
  void **v2;

  *(_QWORD *)this = &off_1E7BB22F8;
  v2 = (void **)((char *)this + 8);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v2);
  PB::Base::~Base(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  void **v2;

  *(_QWORD *)this = &off_1E7BB22F8;
  v2 = (void **)((char *)this + 8);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v2);
  PB::Base::~Base(this);
}

uint64_t sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::readFrom(sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t **v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (uint64_t **)((char *)this + 8);
    while (1)
    {
      v9 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_26;
      }
LABEL_21:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v12 >> 3) == 1)
      {
        PB::PtrVector<sirinluinternal::MatchingSpan>::emplace_back<>(v8);
        v20 = *(_QWORD *)(*((_QWORD *)this + 2) - 8);
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v20 + 16))(v20, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_26:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
      }
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    while (v3 != v2)
    {
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_21;
      v16 += 7;
      v2 = v18;
      v15 = v17++ > 8;
      if (v15)
        goto LABEL_26;
    }
    v4 = 1;
    *((_BYTE *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  const PB::Base **v2;
  const PB::Base **i;
  const PB::Base *v5;

  v2 = *(const PB::Base ***)(this + 8);
  for (i = *(const PB::Base ***)(this + 16); v2 != i; this = PB::Writer::writeSubmessage(a2, v5))
    v5 = *v2++;
  return this;
}

uint64_t sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::formatText(sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = (uint64_t *)*((_QWORD *)this + 1);
  v6 = (uint64_t *)*((_QWORD *)this + 2);
  while (v5 != v6)
  {
    v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v7 + 32))(v7, a2, "contextual_spans");
  }
  return PB::TextFormatter::endObject(a2);
}

_QWORD *sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::ContextualSpanMatcherResponse(_QWORD *this)
{
  *this = &off_1E7BB22F8;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

{
  *this = &off_1E7BB22F8;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::ContextualSpanMatcherResponse(sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *this, const sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *a2)
{
  sirinluinternal::MatchingSpan ***v3;
  const sirinluinternal::MatchingSpan **v4;
  const sirinluinternal::MatchingSpan **v5;

  *((_QWORD *)this + 1) = 0;
  v3 = (sirinluinternal::MatchingSpan ***)((char *)this + 8);
  *(_QWORD *)this = &off_1E7BB22F8;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  v4 = (const sirinluinternal::MatchingSpan **)*((_QWORD *)a2 + 1);
  v5 = (const sirinluinternal::MatchingSpan **)*((_QWORD *)a2 + 2);
  while (v4 != v5)
    PB::PtrVector<sirinluinternal::MatchingSpan>::emplace_back<sirinluinternal::MatchingSpan const&>(v3, *v4++);
  return this;
}

uint64_t sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::operator=(uint64_t a1, const sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *a2)
{
  __int128 v3;
  uint64_t v4;
  void (**v6)(sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *__hidden);
  __int128 v7;
  uint64_t v8;
  void **v9;

  if ((const sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *)a1 != a2)
  {
    sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::ContextualSpanMatcherResponse((sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *)&v6, a2);
    v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v7;
    v7 = v3;
    v4 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v8;
    v8 = v4;
    v6 = &off_1E7BB22F8;
    v9 = (void **)&v7;
    std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v9);
    PB::Base::~Base((PB::Base *)&v6);
  }
  return a1;
}

_QWORD *sirinluinternalcontextual_span_matcher::swap(_QWORD *this, sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *a2, sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = this[1];
  this[1] = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  v4 = this[2];
  this[2] = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v4;
  v5 = this[3];
  this[3] = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v5;
  return this;
}

_QWORD *sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::ContextualSpanMatcherResponse(_QWORD *a1, uint64_t a2)
{
  _OWORD *v4;

  *a1 = &off_1E7BB22F8;
  a1[2] = 0;
  a1[3] = 0;
  a1[1] = 0;
  v4 = a1 + 1;
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(a1 + 1);
  *v4 = *(_OWORD *)(a2 + 8);
  a1[3] = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return a1;
}

{
  _OWORD *v4;

  *a1 = &off_1E7BB22F8;
  a1[2] = 0;
  a1[3] = 0;
  a1[1] = 0;
  v4 = a1 + 1;
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(a1 + 1);
  *v4 = *(_OWORD *)(a2 + 8);
  a1[3] = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return a1;
}

uint64_t sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  void (**v9)(sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *__hidden);
  __int128 v10;
  uint64_t v11;
  void **v12;

  if (a1 != a2)
  {
    v9 = &off_1E7BB22F8;
    v10 = 0uLL;
    v11 = 0;
    std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(&v10);
    v4 = *(_QWORD *)(a2 + 24);
    v5 = *(_OWORD *)(a2 + 8);
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)(a2 + 24) = 0;
    *(_QWORD *)(a2 + 8) = 0;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v5;
    v10 = v6;
    v7 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v4;
    v11 = v7;
    v12 = (void **)&v10;
    v9 = &off_1E7BB22F8;
    std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v12);
    PB::Base::~Base((PB::Base *)&v9);
  }
  return a1;
}

BOOL sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::operator==(uint64_t a1, uint64_t a2)
{
  return PB::PtrVector<sirinluinternal::MatchingSpan>::operator==((uint64_t *)(a1 + 8), *(uint64_t **)(a2 + 8), *(_QWORD *)(a2 + 16));
}

uint64_t sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse::hash_value(sirinluinternalcontextual_span_matcher::ContextualSpanMatcherResponse *this)
{
  sirinluinternal::MatchingSpan **v1;
  sirinluinternal::MatchingSpan **v2;
  uint64_t v3;
  sirinluinternal::MatchingSpan *v4;

  v1 = (sirinluinternal::MatchingSpan **)*((_QWORD *)this + 1);
  v2 = (sirinluinternal::MatchingSpan **)*((_QWORD *)this + 2);
  if (v1 == v2)
    return 0;
  v3 = 0;
  do
  {
    v4 = *v1++;
    v3 ^= sirinluinternal::MatchingSpan::hash_value(v4);
  }
  while (v1 != v2);
  return v3;
}

BOOL SIRINLUEXTERNALReferenceContextReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  BOOL v23;
  int *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
          {
            v24 = &OBJC_IVAR___SIRINLUEXTERNALReferenceContext__contextualReference;
            goto LABEL_38;
          }
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            break;
          v17 += 7;
          v23 = v18++ > 8;
          if (v23)
          {
            v19 = 0;
            v24 = &OBJC_IVAR___SIRINLUEXTERNALReferenceContext__contextualReference;
            goto LABEL_41;
          }
        }
        v24 = &OBJC_IVAR___SIRINLUEXTERNALReferenceContext__contextualReference;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_41:
        *(_BYTE *)(a1 + *v24) = v19 != 0;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_42:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v25 = 0;
    v26 = 0;
    v19 = 0;
    *(_BYTE *)(a1 + 12) |= 2u;
    while (1)
    {
      v27 = *v3;
      v28 = *(_QWORD *)(a2 + v27);
      if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
        break;
      v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
      *(_QWORD *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        v24 = &OBJC_IVAR___SIRINLUEXTERNALReferenceContext__disambiguationNeeded;
        goto LABEL_39;
      }
      v25 += 7;
      v23 = v26++ > 8;
      if (v23)
      {
        v19 = 0;
        v24 = &OBJC_IVAR___SIRINLUEXTERNALReferenceContext__disambiguationNeeded;
        goto LABEL_41;
      }
    }
    v24 = &OBJC_IVAR___SIRINLUEXTERNALReferenceContext__disambiguationNeeded;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  SIRINLUEXTERNALRequestID *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(SIRINLUEXTERNALRequestID);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (SIRINLUEXTERNALRequestIDReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = *(SIRINLUEXTERNALRequestID **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL SIRINLUEXTERNALRRAnnotationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  SIRICOMMONStringValue *v17;
  uint64_t v18;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
      {
        v17 = objc_alloc_init(SIRICOMMONStringValue);
        v18 = 16;
      }
      else
      {
        if ((v10 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
          continue;
        }
        v17 = objc_alloc_init(SIRICOMMONStringValue);
        v18 = 8;
      }
      objc_storeStrong((id *)(a1 + v18), v17);
      if (!PBReaderPlaceMark() || (SIRICOMMONStringValueReadFrom((uint64_t)v17, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SIRINLUINTERNALEMBEDDINGEmbeddingTensorOutputReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;
  SIRINLUINTERNALNLv4EmbeddingTensor *v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v17;

        goto LABEL_49;
      case 2u:
        v20 = objc_alloc_init(SIRINLUINTERNALNLv4EmbeddingTensor);
        v21 = 16;
        goto LABEL_24;
      case 3u:
        v20 = objc_alloc_init(SIRINLUINTERNALNLv4EmbeddingTensor);
        v21 = 32;
LABEL_24:
        objc_storeStrong((id *)(a1 + v21), v20);
        if (PBReaderPlaceMark()
          && (SIRINLUINTERNALNLv4EmbeddingTensorReadFrom((uint64_t)v20, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_49:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 4u:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 44) |= 1u;
        while (2)
        {
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          if (v26 == -1 || v26 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 1;
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if (v27 < 0)
            {
              v22 += 7;
              v14 = v23++ >= 9;
              if (v14)
              {
                v24 = 0;
                goto LABEL_44;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v24 = 0;
LABEL_44:
        *(_QWORD *)(a1 + 8) = v24;
        goto LABEL_49;
      case 5u:
        v28 = 0;
        v29 = 0;
        v30 = 0;
        *(_BYTE *)(a1 + 44) |= 2u;
        while (2)
        {
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 1;
            v30 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              v14 = v29++ >= 9;
              if (v14)
              {
                v30 = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v30 = 0;
LABEL_48:
        *(_BYTE *)(a1 + 40) = v30 != 0;
        goto LABEL_49;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_49;
    }
  }
}

void sirinluinternal::UtteranceRule::~UtteranceRule(sirinluinternal::UtteranceRule *this)
{
  sirinluinternal::UtteranceRule::~UtteranceRule(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)this = &off_1E7BB2348;
  v2 = (_QWORD *)*((_QWORD *)this + 3);
  if (v2)
  {
    v3 = (_QWORD *)*((_QWORD *)this + 4);
    v4 = (void *)*((_QWORD *)this + 3);
    if (v3 != v2)
    {
      do
      {
        v6 = *--v3;
        v5 = v6;
        *v3 = 0;
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
      }
      while (v3 != v2);
      v4 = (void *)*((_QWORD *)this + 3);
    }
    *((_QWORD *)this + 4) = v2;
    operator delete(v4);
  }
  v7 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v7)
    std::default_delete<std::string>::operator()[abi:ne180100](v7);
  v8 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  PB::Base::~Base(this);
}

uint64_t sirinluinternal::UtteranceRule::readFrom(sirinluinternal::UtteranceRule *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  char *v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  uint64_t result;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t *v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char v44;
  unsigned int v45;
  unint64_t v46;
  char v47;
  uint64_t *v48;
  unint64_t v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  int64x2_t v53;
  unint64_t v54;
  uint64_t v56;
  int64x2_t v57;
  unint64_t v58;
  char *v59;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  v8 = (char *)this + 40;
  while (1)
  {
    v9 = *(_QWORD *)a2;
    if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3)
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_20;
      }
LABEL_22:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v12 >> 3))
      {
        case 1u:
          v21 = (_QWORD *)operator new();
          v21[1] = 0;
          v21[2] = 0;
          *v21 = 0;
          v22 = *((_QWORD *)this + 2);
          *((_QWORD *)this + 2) = v21;
          if (v22)
            std::default_delete<std::string>::operator()[abi:ne180100](v22);
          PB::Reader::read();
          goto LABEL_67;
        case 2u:
          *((_BYTE *)this + 52) |= 1u;
          v30 = *((_QWORD *)a2 + 1);
          v31 = *((_QWORD *)a2 + 2);
          v32 = *(_QWORD *)a2;
          if (v30 <= 0xFFFFFFFFFFFFFFF5 && v30 + 10 <= v31)
          {
            v33 = 0;
            v34 = 0;
            v35 = 0;
            do
            {
              v36 = v30 + 1;
              *((_QWORD *)a2 + 1) = v30 + 1;
              v37 = *(_BYTE *)(v32 + v30);
              v35 |= (unint64_t)(v37 & 0x7F) << v33;
              if ((v37 & 0x80) == 0)
                goto LABEL_66;
              v33 += 7;
              v30 = v36;
              v15 = v34++ > 8;
            }
            while (!v15);
LABEL_52:
            LODWORD(v35) = 0;
            goto LABEL_66;
          }
          v44 = 0;
          v45 = 0;
          v35 = 0;
          if (v31 <= v30)
            v31 = *((_QWORD *)a2 + 1);
          while (2)
          {
            if (v31 == v30)
            {
              LODWORD(v35) = 0;
              *((_BYTE *)a2 + 24) = 1;
            }
            else
            {
              v46 = v30 + 1;
              v47 = *(_BYTE *)(v32 + v30);
              *((_QWORD *)a2 + 1) = v46;
              v35 |= (unint64_t)(v47 & 0x7F) << v44;
              if (v47 < 0)
              {
                v44 += 7;
                v30 = v46;
                v15 = v45++ > 8;
                if (v15)
                  goto LABEL_52;
                continue;
              }
              if (*((_BYTE *)a2 + 24))
                LODWORD(v35) = 0;
            }
            break;
          }
LABEL_66:
          *((_DWORD *)this + 12) = v35;
          goto LABEL_67;
        case 3u:
          v23 = operator new();
          *(_QWORD *)v23 = &off_1E7BB0AD8;
          *(_WORD *)(v23 + 8) = 1;
          *(_BYTE *)(v23 + 10) = 0;
          *(_DWORD *)(v23 + 12) = 0;
          v24 = *((_QWORD *)this + 1);
          *((_QWORD *)this + 1) = v23;
          if (v24)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
            v23 = *((_QWORD *)this + 1);
          }
          goto LABEL_60;
        case 4u:
          v25 = operator new();
          v26 = v25;
          *(_QWORD *)v25 = &off_1E7BB1100;
          *(_OWORD *)(v25 + 8) = 0u;
          *(_OWORD *)(v25 + 24) = 0u;
          v28 = (uint64_t *)*((_QWORD *)this + 4);
          v27 = *((_QWORD *)this + 5);
          if ((unint64_t)v28 >= v27)
          {
            v38 = *((_QWORD *)this + 3);
            v39 = ((uint64_t)v28 - v38) >> 3;
            if ((unint64_t)(v39 + 1) >> 61)
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            v40 = v27 - v38;
            v41 = v40 >> 2;
            if (v40 >> 2 <= (unint64_t)(v39 + 1))
              v41 = v39 + 1;
            if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8)
              v42 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v42 = v41;
            v59 = v8;
            if (v42)
              v42 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v42);
            else
              v43 = 0;
            v48 = (uint64_t *)(v42 + 8 * v39);
            v49 = v42 + 8 * v43;
            v58 = v49;
            *v48 = v26;
            v29 = v48 + 1;
            v57.i64[1] = (uint64_t)(v48 + 1);
            v51 = (_QWORD *)*((_QWORD *)this + 3);
            v50 = (_QWORD *)*((_QWORD *)this + 4);
            if (v50 == v51)
            {
              v53 = vdupq_n_s64((unint64_t)v50);
            }
            else
            {
              do
              {
                v52 = *--v50;
                *v50 = 0;
                *--v48 = v52;
              }
              while (v50 != v51);
              v53 = *(int64x2_t *)((char *)this + 24);
              v29 = (_QWORD *)v57.i64[1];
              v49 = v58;
            }
            *((_QWORD *)this + 3) = v48;
            *((_QWORD *)this + 4) = v29;
            v57 = v53;
            v54 = *((_QWORD *)this + 5);
            *((_QWORD *)this + 5) = v49;
            v58 = v54;
            v56 = v53.i64[0];
            std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v56);
          }
          else
          {
            *v28 = v25;
            v29 = v28 + 1;
          }
          *((_QWORD *)this + 4) = v29;
          v23 = *(v29 - 1);
LABEL_60:
          if (!PB::Reader::placeMark()
            || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v23 + 16))(v23, a2) & 1) == 0)
          {
            return 0;
          }
          PB::Reader::recallMark();
          break;
        default:
          goto LABEL_20;
      }
      goto LABEL_67;
    }
    v16 = 0;
    v17 = 0;
    v12 = 0;
    if (v2 > v3)
      v3 = v2;
    do
    {
      if (v3 == v2)
      {
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v18 = v2 + 1;
      v19 = *(_BYTE *)(v9 + v2);
      *((_QWORD *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0)
        goto LABEL_22;
      v16 += 7;
      v2 = v18;
      v15 = v17++ > 8;
    }
    while (!v15);
LABEL_20:
    result = PB::Reader::skip(a2);
    if (!(_DWORD)result)
      return result;
LABEL_67:
    v2 = *((_QWORD *)a2 + 1);
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0)
      return v4 == 0;
  }
}

void sub_1C20134CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t sirinluinternal::UtteranceRule::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  const PB::Base *v4;
  const PB::Base **v5;
  const PB::Base **v6;
  const PB::Base *v7;

  v3 = this;
  if (*(_QWORD *)(this + 16))
    this = PB::Writer::write();
  if ((*(_BYTE *)(v3 + 52) & 1) != 0)
    this = PB::Writer::writeVarInt(a2);
  v4 = *(const PB::Base **)(v3 + 8);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v6 = *(const PB::Base ***)(v3 + 24);
  v5 = *(const PB::Base ***)(v3 + 32);
  while (v6 != v5)
  {
    v7 = *v6++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  return this;
}

uint64_t sirinluinternal::UtteranceRule::formatText(sirinluinternal::UtteranceRule *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "compare_options");
  if (*((_QWORD *)this + 2))
    PB::TextFormatter::format();
  v6 = (uint64_t *)*((_QWORD *)this + 3);
  v7 = (uint64_t *)*((_QWORD *)this + 4);
  while (v6 != v7)
  {
    v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v8 + 32))(v8, a2, "spans_for_named_capture_groups");
  }
  if ((*((_BYTE *)this + 52) & 1) != 0)
    PB::TextFormatter::format(a2, "type");
  return PB::TextFormatter::endObject(a2);
}

double sirinluinternal::UtteranceRule::UtteranceRule(sirinluinternal::UtteranceRule *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB2348;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB2348;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  return result;
}

sirinluinternal::UtteranceRule *sirinluinternal::UtteranceRule::UtteranceRule(sirinluinternal::UtteranceRule *this, const sirinluinternal::UtteranceRule *a2)
{
  uint64_t *v4;
  std::string *v5;
  std::string *v6;
  __int128 *v7;
  __int128 v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const sirinluinternal::AdjacentSpans **v14;
  const sirinluinternal::AdjacentSpans **i;
  const sirinluinternal::AdjacentSpans *v16;
  sirinluinternal::AdjacentSpans *v17;
  unint64_t v18;
  sirinluinternal::AdjacentSpans **v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  sirinluinternal::AdjacentSpans **v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  sirinluinternal::AdjacentSpans *v31;
  int64x2_t v32;
  unint64_t v33;
  uint64_t v35;
  int64x2_t v36;
  unint64_t v37;
  char *v38;

  *(_QWORD *)this = &off_1E7BB2348;
  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (uint64_t *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  if (*((_QWORD *)a2 + 2))
  {
    v5 = (std::string *)operator new();
    v6 = v5;
    v7 = (__int128 *)*((_QWORD *)a2 + 2);
    if (*((char *)v7 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)v7, *((_QWORD *)v7 + 1));
    }
    else
    {
      v8 = *v7;
      v5->__r_.__value_.__r.__words[2] = *((_QWORD *)v7 + 2);
      *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v8;
    }
    v9 = *((_QWORD *)this + 2);
    *((_QWORD *)this + 2) = v6;
    if (v9)
      std::default_delete<std::string>::operator()[abi:ne180100](v9);
  }
  if ((*((_BYTE *)a2 + 52) & 1) != 0)
  {
    v10 = *((_DWORD *)a2 + 12);
    *((_BYTE *)this + 52) |= 1u;
    *((_DWORD *)this + 12) = v10;
  }
  if (*((_QWORD *)a2 + 1))
  {
    v11 = operator new();
    v12 = sirinluinternal::CompareOptions::CompareOptions(v11, *((const sirinluinternal::CompareOptions **)a2 + 1));
    v13 = *v4;
    *v4 = v12;
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  }
  v14 = (const sirinluinternal::AdjacentSpans **)*((_QWORD *)a2 + 3);
  for (i = (const sirinluinternal::AdjacentSpans **)*((_QWORD *)a2 + 4); v14 != i; ++v14)
  {
    v16 = *v14;
    v17 = (sirinluinternal::AdjacentSpans *)operator new();
    sirinluinternal::AdjacentSpans::AdjacentSpans(v17, v16);
    v19 = (sirinluinternal::AdjacentSpans **)*((_QWORD *)this + 4);
    v18 = *((_QWORD *)this + 5);
    if ((unint64_t)v19 >= v18)
    {
      v21 = *((_QWORD *)this + 3);
      v22 = ((uint64_t)v19 - v21) >> 3;
      if ((unint64_t)(v22 + 1) >> 61)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v23 = v18 - v21;
      v24 = v23 >> 2;
      if (v23 >> 2 <= (unint64_t)(v22 + 1))
        v24 = v22 + 1;
      if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8)
        v25 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v25 = v24;
      v38 = (char *)this + 40;
      if (v25)
        v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v25);
      else
        v26 = 0;
      v27 = (sirinluinternal::AdjacentSpans **)(v25 + 8 * v22);
      v28 = v25 + 8 * v26;
      v37 = v28;
      *v27 = v17;
      v20 = v27 + 1;
      v36.i64[1] = (uint64_t)(v27 + 1);
      v30 = (_QWORD *)*((_QWORD *)this + 3);
      v29 = (_QWORD *)*((_QWORD *)this + 4);
      if (v29 == v30)
      {
        v32 = vdupq_n_s64((unint64_t)v29);
      }
      else
      {
        do
        {
          v31 = (sirinluinternal::AdjacentSpans *)*--v29;
          *v29 = 0;
          *--v27 = v31;
        }
        while (v29 != v30);
        v32 = *(int64x2_t *)((char *)this + 24);
        v20 = (_QWORD *)v36.i64[1];
        v28 = v37;
      }
      *((_QWORD *)this + 3) = v27;
      *((_QWORD *)this + 4) = v20;
      v36 = v32;
      v33 = *((_QWORD *)this + 5);
      *((_QWORD *)this + 5) = v28;
      v37 = v33;
      v35 = v32.i64[0];
      std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v35);
    }
    else
    {
      *v19 = v17;
      v20 = v19 + 1;
    }
    *((_QWORD *)this + 4) = v20;
  }
  return this;
}

void sub_1C2013958(void *a1)
{
  __clang_call_terminate(a1);
}

uint64_t sirinluinternal::UtteranceRule::operator=(uint64_t a1, const sirinluinternal::UtteranceRule *a2)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  _BYTE v8[8];
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  if ((const sirinluinternal::UtteranceRule *)a1 != a2)
  {
    sirinluinternal::UtteranceRule::UtteranceRule((sirinluinternal::UtteranceRule *)v8, a2);
    v3 = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v12;
    v12 = v3;
    v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    v5 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    v9 = v4;
    v10 = v5;
    v6 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v11;
    v11 = v6;
    sirinluinternal::UtteranceRule::~UtteranceRule((sirinluinternal::UtteranceRule *)v8);
  }
  return a1;
}

uint64_t sirinluinternal::swap(uint64_t this, sirinluinternal::UtteranceRule *a2, sirinluinternal::UtteranceRule *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_DWORD *)(this + 52);
  *(_DWORD *)(this + 52) = *((_DWORD *)a2 + 13);
  *((_DWORD *)a2 + 13) = v3;
  v4 = *(_QWORD *)(this + 16);
  *(_QWORD *)(this + 16) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 48);
  *(_DWORD *)(this + 48) = *((_DWORD *)a2 + 12);
  *((_DWORD *)a2 + 12) = v4;
  v5 = *(_QWORD *)(this + 8);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v5;
  v6 = *(_QWORD *)(this + 24);
  *(_QWORD *)(this + 24) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v6;
  v7 = *(_QWORD *)(this + 32);
  *(_QWORD *)(this + 32) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v7;
  v8 = *(_QWORD *)(this + 40);
  *(_QWORD *)(this + 40) = *((_QWORD *)a2 + 5);
  *((_QWORD *)a2 + 5) = v8;
  return this;
}

uint64_t sirinluinternal::UtteranceRule::UtteranceRule(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = &off_1E7BB2348;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 36) = 0u;
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  *(_DWORD *)(a2 + 52) = 0;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  if (v5)
    std::default_delete<std::string>::operator()[abi:ne180100](v5);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  v8 = (void **)(a1 + 24);
  v9 = *(_QWORD **)(a1 + 24);
  if (v9)
  {
    v10 = *(_QWORD **)(a1 + 32);
    v11 = *(void **)(a1 + 24);
    if (v10 != v9)
    {
      do
      {
        v13 = *--v10;
        v12 = v13;
        *v10 = 0;
        if (v13)
          (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
      }
      while (v10 != v9);
      v11 = *v8;
    }
    *(_QWORD *)(a1 + 32) = v9;
    operator delete(v11);
    *v8 = 0;
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 40) = 0;
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  return a1;
}

uint64_t sirinluinternal::UtteranceRule::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  _BYTE v8[8];
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sirinluinternal::UtteranceRule::UtteranceRule((uint64_t)v8, a2);
    v3 = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v12;
    v12 = v3;
    v4 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    v5 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    v9 = v4;
    v10 = v5;
    v6 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v11;
    v11 = v6;
    sirinluinternal::UtteranceRule::~UtteranceRule((sirinluinternal::UtteranceRule *)v8);
  }
  return a1;
}

BOOL sirinluinternal::UtteranceRule::operator==(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v4;
  unsigned __int8 **v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 result;
  BOOL v20;

  v4 = *(unsigned __int8 **)(a1 + 16);
  v5 = *(unsigned __int8 ***)(a2 + 16);
  if (v4)
  {
    if (!v5)
      return 0;
    v6 = v4[23];
    if ((v6 & 0x80u) == 0)
      v7 = (unsigned __int8 *)v4[23];
    else
      v7 = (unsigned __int8 *)*((_QWORD *)v4 + 1);
    v8 = (unsigned __int8 *)*((unsigned __int8 *)v5 + 23);
    v9 = (char)v8;
    if ((char)v8 < 0)
      v8 = v5[1];
    if (v7 != v8)
      return 0;
    if (v9 >= 0)
      v10 = *(unsigned __int8 **)(a2 + 16);
    else
      v10 = *v5;
    if ((v6 & 0x80) != 0)
    {
      if (memcmp(*(const void **)v4, v10, *((_QWORD *)v4 + 1)))
        return 0;
    }
    else if (v4[23])
    {
      while (*v4 == *v10)
      {
        ++v4;
        ++v10;
        if (!--v6)
          goto LABEL_18;
      }
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
LABEL_18:
  if ((*(_BYTE *)(a1 + 52) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 52) & 1) == 0 || *(_DWORD *)(a1 + 48) != *(_DWORD *)(a2 + 48))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 52) & 1) != 0)
  {
    return 0;
  }
  v11 = *(unsigned __int8 **)(a1 + 8);
  v12 = *(unsigned __int8 **)(a2 + 8);
  if (!v11)
  {
    if (!v12)
      goto LABEL_30;
    return 0;
  }
  if (!v12 || !sirinluinternal::CompareOptions::operator==(v11, v12))
    return 0;
LABEL_30:
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  v16 = a2 + 24;
  v15 = *(uint64_t **)(a2 + 24);
  if (v14 - v13 != *(_QWORD *)(v16 + 8) - (_QWORD)v15)
    return 0;
  if (v13 == v14)
    return 1;
  v17 = v13 + 8;
  do
  {
    v18 = *v15++;
    result = sirinluinternal::AdjacentSpans::operator==(*(_QWORD **)(v17 - 8), v18);
    v20 = !result || v17 == v14;
    v17 += 8;
  }
  while (!v20);
  return result;
}

unint64_t sirinluinternal::UtteranceRule::hash_value(sirinluinternal::UtteranceRule *this)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  sirinluinternal::AdjacentSpans **v10;
  sirinluinternal::AdjacentSpans **v11;
  uint64_t v12;
  sirinluinternal::AdjacentSpans *v13;

  v2 = *((_QWORD *)this + 2);
  if (v2)
    v3 = std::__string_hash<char>::operator()[abi:ne180100](v2);
  else
    v3 = 0;
  if ((*((_BYTE *)this + 52) & 1) != 0)
    v4 = *((int *)this + 12);
  else
    v4 = 0;
  v5 = (unsigned __int8 *)*((_QWORD *)this + 1);
  if (!v5)
  {
    v9 = 0;
    goto LABEL_17;
  }
  if ((v5[12] & 1) == 0)
  {
    v6 = 0;
    if ((v5[12] & 2) != 0)
      goto LABEL_10;
LABEL_14:
    v7 = 0;
    if ((v5[12] & 4) != 0)
      goto LABEL_11;
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  v6 = v5[8];
  if ((v5[12] & 2) == 0)
    goto LABEL_14;
LABEL_10:
  v7 = v5[9];
  if ((v5[12] & 4) == 0)
    goto LABEL_15;
LABEL_11:
  v8 = v5[10];
LABEL_16:
  v9 = v7 ^ v6 ^ v8;
LABEL_17:
  v11 = (sirinluinternal::AdjacentSpans **)*((_QWORD *)this + 3);
  v10 = (sirinluinternal::AdjacentSpans **)*((_QWORD *)this + 4);
  if (v11 == v10)
  {
    v12 = 0;
  }
  else
  {
    v12 = 0;
    do
    {
      v13 = *v11++;
      v12 ^= sirinluinternal::AdjacentSpans::hash_value(v13);
    }
    while (v11 != v10);
  }
  return v4 ^ v3 ^ v9 ^ v12;
}

_QWORD *sirinluinternal::UtteranceRule::makeCompareOptions(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BB0AD8;
    *(_WORD *)(v2 + 8) = 1;
    *(_BYTE *)(v2 + 10) = 0;
    *(_DWORD *)(v2 + 12) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

BOOL SIRINLUINTERNALTokenChainReadFrom(char *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  SIRINLUINTERNALToken *v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
LABEL_26:
        v20 = *(SIRINLUINTERNALToken **)&a1[v19];
        *(_QWORD *)&a1[v19] = v18;
LABEL_27:

        goto LABEL_29;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_29:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v20 = objc_alloc_init(SIRINLUINTERNALToken);
    objc_msgSend(a1, "addTokens:", v20);
    if (!PBReaderPlaceMark() || (SIRINLUINTERNALTokenReadFrom(v20, a2) & 1) == 0)
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_27;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t SIRINLUINTERNALSpanDataForNamedCaptureGroupReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  uint64_t v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 24) |= 2u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_39;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_41:
        v32 = 20;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            PBReaderReadString();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = *(void **)(a1 + 8);
            *(_QWORD *)(a1 + 8) = v18;

          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v26 = 0;
        v27 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
            goto LABEL_43;
          v26 += 7;
          v14 = v27++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_45:
        v32 = 16;
      }
      *(_DWORD *)(a1 + v32) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C2015408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C20154BC(_Unwind_Exception *a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;

  *v2 = 0;
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C20155C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);

  std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)va);
  _Unwind_Resume(a1);
}

void sub_1C20156E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);

  std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)va);
  _Unwind_Resume(a1);
}

void sub_1C20157CC(_Unwind_Exception *a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;

  *v2 = 0;
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C20158D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);

  std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)va);
  _Unwind_Resume(a1);
}

void sub_1C20159B4(_Unwind_Exception *a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;

  *v2 = 0;
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C2015A7C(_Unwind_Exception *a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;

  *v2 = 0;
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C2015B4C(_Unwind_Exception *a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;

  *v2 = 0;
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C2015C28(_Unwind_Exception *a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;

  *v2 = 0;
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C2015D30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);

  std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)va);
  _Unwind_Resume(a1);
}

void sub_1C2015E18(_Unwind_Exception *a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;

  *v2 = 0;
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);

  _Unwind_Resume(a1);
}

void sub_1C2015F20(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);

  std::unique_ptr<PB::Writer>::reset[abi:ne180100]((PB::Writer **)va);
  _Unwind_Resume(a1);
}

uint64_t SIRICOMMONStringValueReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C20163CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C2016428(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C2016490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C20164E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C201654C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C20165B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C2016624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sirinluexternal::UsoGraph::~UsoGraph(sirinluexternal::UsoGraph *this)
{
  sirinluexternal::UsoGraph::~UsoGraph(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;

  *(_QWORD *)this = &off_1E7BB2398;
  v2 = *((_QWORD *)this + 16);
  *((_QWORD *)this + 16) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = (_QWORD *)*((_QWORD *)this + 13);
  if (v3)
  {
    v4 = (_QWORD *)*((_QWORD *)this + 14);
    v5 = (void *)*((_QWORD *)this + 13);
    if (v4 != v3)
    {
      do
      {
        v7 = *--v4;
        v6 = v7;
        *v4 = 0;
        if (v7)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
      }
      while (v4 != v3);
      v5 = (void *)*((_QWORD *)this + 13);
    }
    *((_QWORD *)this + 14) = v3;
    operator delete(v5);
  }
  v8 = (_QWORD *)*((_QWORD *)this + 10);
  if (v8)
  {
    v9 = (_QWORD *)*((_QWORD *)this + 11);
    v10 = (void *)*((_QWORD *)this + 10);
    if (v9 != v8)
    {
      do
      {
        v12 = *--v9;
        v11 = v12;
        *v9 = 0;
        if (v12)
          (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
      }
      while (v9 != v8);
      v10 = (void *)*((_QWORD *)this + 10);
    }
    *((_QWORD *)this + 11) = v8;
    operator delete(v10);
  }
  v13 = (_QWORD *)*((_QWORD *)this + 7);
  if (v13)
  {
    v14 = (_QWORD *)*((_QWORD *)this + 8);
    v15 = (void *)*((_QWORD *)this + 7);
    if (v14 != v13)
    {
      do
      {
        v17 = *--v14;
        v16 = v17;
        *v14 = 0;
        if (v17)
          (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
      }
      while (v14 != v13);
      v15 = (void *)*((_QWORD *)this + 7);
    }
    *((_QWORD *)this + 8) = v13;
    operator delete(v15);
  }
  v18 = (_QWORD *)*((_QWORD *)this + 4);
  if (v18)
  {
    v19 = (_QWORD *)*((_QWORD *)this + 5);
    v20 = (void *)*((_QWORD *)this + 4);
    if (v19 != v18)
    {
      do
      {
        v22 = *--v19;
        v21 = v22;
        *v19 = 0;
        if (v22)
          (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
      }
      while (v19 != v18);
      v20 = (void *)*((_QWORD *)this + 4);
    }
    *((_QWORD *)this + 5) = v18;
    operator delete(v20);
  }
  v23 = (_QWORD *)*((_QWORD *)this + 1);
  if (v23)
  {
    v24 = (_QWORD *)*((_QWORD *)this + 2);
    v25 = (void *)*((_QWORD *)this + 1);
    if (v24 != v23)
    {
      do
      {
        v27 = *--v24;
        v26 = v27;
        *v24 = 0;
        if (v27)
          (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
      }
      while (v24 != v23);
      v25 = (void *)*((_QWORD *)this + 1);
    }
    *((_QWORD *)this + 2) = v23;
    operator delete(v25);
  }
  PB::Base::~Base(this);
}

uint64_t sirinluexternal::UsoGraph::readFrom(sirinluexternal::UsoGraph *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  BOOL v19;
  char v20;
  unsigned int v21;
  unint64_t v22;
  char v23;
  uint64_t result;
  _DWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  unint64_t v79;
  _QWORD *v80;
  _QWORD *v81;
  uint64_t v82;
  int64x2_t v83;
  uint64_t *v84;
  unint64_t v85;
  _QWORD *v86;
  _QWORD *v87;
  uint64_t v88;
  int64x2_t v89;
  uint64_t *v90;
  unint64_t v91;
  _QWORD *v92;
  _QWORD *v93;
  uint64_t v94;
  int64x2_t v95;
  uint64_t *v96;
  unint64_t v97;
  _QWORD *v98;
  _QWORD *v99;
  uint64_t v100;
  int64x2_t v101;
  uint64_t *v102;
  unint64_t v103;
  _QWORD *v104;
  _QWORD *v105;
  uint64_t v106;
  int64x2_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  int64x2_t v114;
  unint64_t v115;
  char *v116;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  v8 = (char *)this + 120;
  v9 = (char *)this + 24;
  v10 = (char *)this + 72;
  v11 = (char *)this + 48;
  v12 = (char *)this + 96;
  while (1)
  {
    v13 = *(_QWORD *)a2;
    if (v2 <= 0xFFFFFFFFFFFFFFF5 && v2 + 10 <= v3)
    {
      v14 = 0;
      v15 = 0;
      v16 = 0;
      while (1)
      {
        v17 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v18 = *(_BYTE *)(v13 + v2);
        v16 |= (unint64_t)(v18 & 0x7F) << v14;
        if ((v18 & 0x80) == 0)
          break;
        v14 += 7;
        v2 = v17;
        v19 = v15++ > 8;
        if (v19)
          goto LABEL_20;
      }
LABEL_22:
      if ((v16 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      switch((v16 >> 3))
      {
        case 1u:
          v25 = (_DWORD *)operator new();
          *(_QWORD *)v25 = &off_1E7BB15B8;
          v25[5] = 0;
          v26 = *((_QWORD *)this + 16);
          *((_QWORD *)this + 16) = v25;
          if (v26)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
            v25 = (_DWORD *)*((_QWORD *)this + 16);
          }
          goto LABEL_112;
        case 2u:
          v40 = operator new();
          v41 = v40;
          *(_QWORD *)v40 = &off_1E7BB1060;
          *(_OWORD *)(v40 + 8) = 0u;
          *(_OWORD *)(v40 + 24) = 0u;
          *(_OWORD *)(v40 + 40) = 0u;
          *(_OWORD *)(v40 + 56) = 0u;
          *(_QWORD *)(v40 + 72) = 0;
          v43 = (uint64_t *)*((_QWORD *)this + 11);
          v42 = *((_QWORD *)this + 12);
          if ((unint64_t)v43 >= v42)
          {
            v66 = *((_QWORD *)this + 10);
            v67 = ((uint64_t)v43 - v66) >> 3;
            if ((unint64_t)(v67 + 1) >> 61)
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            v68 = v42 - v66;
            v69 = v68 >> 2;
            if (v68 >> 2 <= (unint64_t)(v67 + 1))
              v69 = v67 + 1;
            if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF8)
              v70 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v70 = v69;
            v116 = v12;
            if (v70)
              v70 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v70);
            else
              v71 = 0;
            v96 = (uint64_t *)(v70 + 8 * v67);
            v97 = v70 + 8 * v71;
            v115 = v97;
            *v96 = v41;
            v31 = v96 + 1;
            v114.i64[1] = (uint64_t)(v96 + 1);
            v99 = (_QWORD *)*((_QWORD *)this + 10);
            v98 = (_QWORD *)*((_QWORD *)this + 11);
            if (v98 == v99)
            {
              v101 = vdupq_n_s64((unint64_t)v98);
            }
            else
            {
              do
              {
                v100 = *--v98;
                *v98 = 0;
                *--v96 = v100;
              }
              while (v98 != v99);
              v101 = *((int64x2_t *)this + 5);
              v31 = (_QWORD *)v114.i64[1];
              v97 = v115;
            }
            *((_QWORD *)this + 10) = v96;
            *((_QWORD *)this + 11) = v31;
            v114 = v101;
            v111 = *((_QWORD *)this + 12);
            *((_QWORD *)this + 12) = v97;
            v115 = v111;
            v113 = v101.i64[0];
            std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v113);
          }
          else
          {
            *v43 = v40;
            v31 = v43 + 1;
          }
          *((_QWORD *)this + 11) = v31;
          goto LABEL_111;
        case 3u:
          v32 = operator new();
          v33 = v32;
          *(_QWORD *)(v32 + 8) = 0;
          *(_QWORD *)(v32 + 16) = 0;
          *(_QWORD *)v32 = &off_1E7BAF820;
          *(_DWORD *)(v32 + 24) = 0;
          v35 = (uint64_t *)*((_QWORD *)this + 5);
          v34 = *((_QWORD *)this + 6);
          if ((unint64_t)v35 >= v34)
          {
            v54 = *((_QWORD *)this + 4);
            v55 = ((uint64_t)v35 - v54) >> 3;
            if ((unint64_t)(v55 + 1) >> 61)
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            v56 = v34 - v54;
            v57 = v56 >> 2;
            if (v56 >> 2 <= (unint64_t)(v55 + 1))
              v57 = v55 + 1;
            if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFF8)
              v58 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v58 = v57;
            v116 = v11;
            if (v58)
              v58 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v58);
            else
              v59 = 0;
            v84 = (uint64_t *)(v58 + 8 * v55);
            v85 = v58 + 8 * v59;
            v115 = v85;
            *v84 = v33;
            v31 = v84 + 1;
            v114.i64[1] = (uint64_t)(v84 + 1);
            v87 = (_QWORD *)*((_QWORD *)this + 4);
            v86 = (_QWORD *)*((_QWORD *)this + 5);
            if (v86 == v87)
            {
              v89 = vdupq_n_s64((unint64_t)v86);
            }
            else
            {
              do
              {
                v88 = *--v86;
                *v86 = 0;
                *--v84 = v88;
              }
              while (v86 != v87);
              v89 = *((int64x2_t *)this + 2);
              v31 = (_QWORD *)v114.i64[1];
              v85 = v115;
            }
            *((_QWORD *)this + 4) = v84;
            *((_QWORD *)this + 5) = v31;
            v114 = v89;
            v109 = *((_QWORD *)this + 6);
            *((_QWORD *)this + 6) = v85;
            v115 = v109;
            v113 = v89.i64[0];
            std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v113);
          }
          else
          {
            *v35 = v32;
            v31 = v35 + 1;
          }
          *((_QWORD *)this + 5) = v31;
          goto LABEL_111;
        case 4u:
          v36 = operator new();
          v37 = v36;
          *(_QWORD *)v36 = &off_1E7BB00A0;
          *(_OWORD *)(v36 + 8) = 0u;
          *(_OWORD *)(v36 + 24) = 0u;
          *(_OWORD *)(v36 + 40) = 0u;
          *(_DWORD *)(v36 + 56) = 0;
          v39 = (uint64_t *)*((_QWORD *)this + 8);
          v38 = *((_QWORD *)this + 9);
          if ((unint64_t)v39 >= v38)
          {
            v60 = *((_QWORD *)this + 7);
            v61 = ((uint64_t)v39 - v60) >> 3;
            if ((unint64_t)(v61 + 1) >> 61)
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            v62 = v38 - v60;
            v63 = v62 >> 2;
            if (v62 >> 2 <= (unint64_t)(v61 + 1))
              v63 = v61 + 1;
            if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8)
              v64 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v64 = v63;
            v116 = v10;
            if (v64)
              v64 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v64);
            else
              v65 = 0;
            v90 = (uint64_t *)(v64 + 8 * v61);
            v91 = v64 + 8 * v65;
            v115 = v91;
            *v90 = v37;
            v31 = v90 + 1;
            v114.i64[1] = (uint64_t)(v90 + 1);
            v93 = (_QWORD *)*((_QWORD *)this + 7);
            v92 = (_QWORD *)*((_QWORD *)this + 8);
            if (v92 == v93)
            {
              v95 = vdupq_n_s64((unint64_t)v92);
            }
            else
            {
              do
              {
                v94 = *--v92;
                *v92 = 0;
                *--v90 = v94;
              }
              while (v92 != v93);
              v95 = *(int64x2_t *)((char *)this + 56);
              v31 = (_QWORD *)v114.i64[1];
              v91 = v115;
            }
            *((_QWORD *)this + 7) = v90;
            *((_QWORD *)this + 8) = v31;
            v114 = v95;
            v110 = *((_QWORD *)this + 9);
            *((_QWORD *)this + 9) = v91;
            v115 = v110;
            v113 = v95.i64[0];
            std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v113);
          }
          else
          {
            *v39 = v36;
            v31 = v39 + 1;
          }
          *((_QWORD *)this + 8) = v31;
          goto LABEL_111;
        case 5u:
          v27 = operator new();
          v28 = v27;
          *(_QWORD *)v27 = &off_1E7BAEF58;
          *(_QWORD *)(v27 + 8) = 0;
          *(_QWORD *)(v27 + 16) = 0;
          *(_QWORD *)(v27 + 24) = 0;
          *(_DWORD *)(v27 + 40) = 0;
          v30 = (uint64_t *)*((_QWORD *)this + 2);
          v29 = *((_QWORD *)this + 3);
          if ((unint64_t)v30 >= v29)
          {
            v48 = *((_QWORD *)this + 1);
            v49 = ((uint64_t)v30 - v48) >> 3;
            if ((unint64_t)(v49 + 1) >> 61)
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            v50 = v29 - v48;
            v51 = v50 >> 2;
            if (v50 >> 2 <= (unint64_t)(v49 + 1))
              v51 = v49 + 1;
            if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8)
              v52 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v52 = v51;
            v116 = v9;
            if (v52)
              v52 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v52);
            else
              v53 = 0;
            v78 = (uint64_t *)(v52 + 8 * v49);
            v79 = v52 + 8 * v53;
            v115 = v79;
            *v78 = v28;
            v31 = v78 + 1;
            v114.i64[1] = (uint64_t)(v78 + 1);
            v81 = (_QWORD *)*((_QWORD *)this + 1);
            v80 = (_QWORD *)*((_QWORD *)this + 2);
            if (v80 == v81)
            {
              v83 = vdupq_n_s64((unint64_t)v80);
            }
            else
            {
              do
              {
                v82 = *--v80;
                *v80 = 0;
                *--v78 = v82;
              }
              while (v80 != v81);
              v83 = *(int64x2_t *)((char *)this + 8);
              v31 = (_QWORD *)v114.i64[1];
              v79 = v115;
            }
            *((_QWORD *)this + 1) = v78;
            *((_QWORD *)this + 2) = v31;
            v114 = v83;
            v108 = *((_QWORD *)this + 3);
            *((_QWORD *)this + 3) = v79;
            v115 = v108;
            v113 = v83.i64[0];
            std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v113);
          }
          else
          {
            *v30 = v27;
            v31 = v30 + 1;
          }
          *((_QWORD *)this + 2) = v31;
          goto LABEL_111;
        case 6u:
          v44 = operator new();
          v45 = v44;
          *(_QWORD *)v44 = &off_1E7BAEDD0;
          *(_OWORD *)(v44 + 8) = 0u;
          *(_OWORD *)(v44 + 24) = 0u;
          *(_OWORD *)(v44 + 40) = 0u;
          *(_OWORD *)(v44 + 56) = 0u;
          *(_OWORD *)(v44 + 72) = 0u;
          *(_OWORD *)(v44 + 88) = 0u;
          *(_OWORD *)(v44 + 104) = 0u;
          *(_DWORD *)(v44 + 120) = 0;
          v47 = (uint64_t *)*((_QWORD *)this + 14);
          v46 = *((_QWORD *)this + 15);
          if ((unint64_t)v47 >= v46)
          {
            v72 = *((_QWORD *)this + 13);
            v73 = ((uint64_t)v47 - v72) >> 3;
            if ((unint64_t)(v73 + 1) >> 61)
              std::vector<std::string>::__throw_length_error[abi:ne180100]();
            v74 = v46 - v72;
            v75 = v74 >> 2;
            if (v74 >> 2 <= (unint64_t)(v73 + 1))
              v75 = v73 + 1;
            if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFF8)
              v76 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v76 = v75;
            v116 = v8;
            if (v76)
              v76 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v76);
            else
              v77 = 0;
            v102 = (uint64_t *)(v76 + 8 * v73);
            v103 = v76 + 8 * v77;
            v115 = v103;
            *v102 = v45;
            v31 = v102 + 1;
            v114.i64[1] = (uint64_t)(v102 + 1);
            v105 = (_QWORD *)*((_QWORD *)this + 13);
            v104 = (_QWORD *)*((_QWORD *)this + 14);
            if (v104 == v105)
            {
              v107 = vdupq_n_s64((unint64_t)v104);
            }
            else
            {
              do
              {
                v106 = *--v104;
                *v104 = 0;
                *--v102 = v106;
              }
              while (v104 != v105);
              v107 = *(int64x2_t *)((char *)this + 104);
              v31 = (_QWORD *)v114.i64[1];
              v103 = v115;
            }
            *((_QWORD *)this + 13) = v102;
            *((_QWORD *)this + 14) = v31;
            v114 = v107;
            v112 = *((_QWORD *)this + 15);
            *((_QWORD *)this + 15) = v103;
            v115 = v112;
            v113 = v107.i64[0];
            std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v113);
          }
          else
          {
            *v47 = v44;
            v31 = v47 + 1;
          }
          *((_QWORD *)this + 14) = v31;
LABEL_111:
          v25 = (_DWORD *)*(v31 - 1);
LABEL_112:
          if (!PB::Reader::placeMark()
            || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(_QWORD *)v25 + 16))(v25, a2) & 1) == 0)
          {
            return 0;
          }
          PB::Reader::recallMark();
          break;
        default:
          goto LABEL_20;
      }
      goto LABEL_115;
    }
    v20 = 0;
    v21 = 0;
    v16 = 0;
    if (v2 > v3)
      v3 = v2;
    do
    {
      if (v3 == v2)
      {
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v22 = v2 + 1;
      v23 = *(_BYTE *)(v13 + v2);
      *((_QWORD *)a2 + 1) = v22;
      v16 |= (unint64_t)(v23 & 0x7F) << v20;
      if ((v23 & 0x80) == 0)
        goto LABEL_22;
      v20 += 7;
      v2 = v22;
      v19 = v21++ > 8;
    }
    while (!v19);
LABEL_20:
    result = PB::Reader::skip(a2);
    if (!(_DWORD)result)
      return result;
LABEL_115:
    v2 = *((_QWORD *)a2 + 1);
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || *((_BYTE *)a2 + 24))
      return v4 == 0;
  }
}

void sub_1C2016DE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t sirinluexternal::UsoGraph::writeTo(uint64_t this, PB::Writer *a2)
{
  _QWORD *v3;
  const PB::Base *v4;
  const PB::Base **v5;
  const PB::Base **v6;
  const PB::Base *v7;
  const PB::Base **v8;
  const PB::Base **v9;
  const PB::Base *v10;
  const PB::Base **v11;
  const PB::Base **v12;
  const PB::Base *v13;
  const PB::Base **v14;
  const PB::Base **v15;
  const PB::Base *v16;
  const PB::Base **v17;
  const PB::Base **v18;
  const PB::Base *v19;

  v3 = (_QWORD *)this;
  v4 = *(const PB::Base **)(this + 128);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = (const PB::Base **)v3[10];
  v6 = (const PB::Base **)v3[11];
  while (v5 != v6)
  {
    v7 = *v5++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  v8 = (const PB::Base **)v3[4];
  v9 = (const PB::Base **)v3[5];
  while (v8 != v9)
  {
    v10 = *v8++;
    this = PB::Writer::writeSubmessage(a2, v10);
  }
  v11 = (const PB::Base **)v3[7];
  v12 = (const PB::Base **)v3[8];
  while (v11 != v12)
  {
    v13 = *v11++;
    this = PB::Writer::writeSubmessage(a2, v13);
  }
  v14 = (const PB::Base **)v3[1];
  v15 = (const PB::Base **)v3[2];
  while (v14 != v15)
  {
    v16 = *v14++;
    this = PB::Writer::writeSubmessage(a2, v16);
  }
  v18 = (const PB::Base **)v3[13];
  v17 = (const PB::Base **)v3[14];
  while (v18 != v17)
  {
    v19 = *v18++;
    this = PB::Writer::writeSubmessage(a2, v19);
  }
  return this;
}

uint64_t sirinluexternal::UsoGraph::formatText(sirinluexternal::UsoGraph *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = (uint64_t *)*((_QWORD *)this + 1);
  v6 = (uint64_t *)*((_QWORD *)this + 2);
  while (v5 != v6)
  {
    v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v7 + 32))(v7, a2, "alignments");
  }
  v8 = (uint64_t *)*((_QWORD *)this + 4);
  v9 = (uint64_t *)*((_QWORD *)this + 5);
  while (v8 != v9)
  {
    v10 = *v8++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v10 + 32))(v10, a2, "edges");
  }
  v11 = (uint64_t *)*((_QWORD *)this + 7);
  v12 = (uint64_t *)*((_QWORD *)this + 8);
  while (v11 != v12)
  {
    v13 = *v11++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v13 + 32))(v13, a2, "identifiers");
  }
  v14 = (uint64_t *)*((_QWORD *)this + 10);
  v15 = (uint64_t *)*((_QWORD *)this + 11);
  while (v14 != v15)
  {
    v16 = *v14++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v16 + 32))(v16, a2, "nodes");
  }
  v17 = (uint64_t *)*((_QWORD *)this + 13);
  v18 = (uint64_t *)*((_QWORD *)this + 14);
  while (v17 != v18)
  {
    v19 = *v17++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v19 + 32))(v19, a2, "spans");
  }
  v20 = *((_QWORD *)this + 16);
  if (v20)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v20 + 32))(v20, a2, "version");
  return PB::TextFormatter::endObject(a2);
}

double sirinluexternal::UsoGraph::UsoGraph(sirinluexternal::UsoGraph *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB2398;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB2398;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  return result;
}

sirinluexternal::UsoGraph *sirinluexternal::UsoGraph::UsoGraph(sirinluexternal::UsoGraph *this, const sirinluexternal::SemVer **a2)
{
  int64x2_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const sirinluexternal::UsoNode **v8;
  const sirinluexternal::UsoNode **i;
  const sirinluexternal::UsoNode *v10;
  sirinluexternal::UsoNode *v11;
  unint64_t v12;
  sirinluexternal::UsoNode **v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  sirinluexternal::UsoNode **v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  sirinluexternal::UsoNode *v25;
  int64x2_t v26;
  unint64_t v27;
  const sirinluexternal::UsoEdge **v28;
  const sirinluexternal::UsoEdge **j;
  const sirinluexternal::UsoEdge *v30;
  sirinluexternal::UsoEdge *v31;
  unint64_t v32;
  sirinluexternal::UsoEdge **v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  sirinluexternal::UsoEdge **v41;
  unint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  sirinluexternal::UsoEdge *v45;
  int64x2_t v46;
  unint64_t v47;
  const sirinluexternal::UsoEntityIdentifier **v48;
  const sirinluexternal::UsoEntityIdentifier **k;
  const sirinluexternal::UsoEntityIdentifier *v50;
  sirinluexternal::UsoEntityIdentifier *v51;
  unint64_t v52;
  sirinluexternal::UsoEntityIdentifier **v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  sirinluexternal::UsoEntityIdentifier **v61;
  unint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  sirinluexternal::UsoEntityIdentifier *v65;
  int64x2_t v66;
  unint64_t v67;
  const sirinluexternal::UtteranceAlignment **v68;
  const sirinluexternal::UtteranceAlignment **m;
  const sirinluexternal::UtteranceAlignment *v70;
  sirinluexternal::UtteranceAlignment *v71;
  unint64_t v72;
  sirinluexternal::UtteranceAlignment **v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  sirinluexternal::UtteranceAlignment **v80;
  unint64_t v81;
  _QWORD *v82;
  _QWORD *v83;
  sirinluexternal::UtteranceAlignment *v84;
  int64x2_t v85;
  unint64_t v86;
  const sirinluexternal::UsoEntitySpan **v87;
  const sirinluexternal::UsoEntitySpan **n;
  const sirinluexternal::UsoEntitySpan *v89;
  sirinluexternal::UsoEntitySpan *v90;
  unint64_t v91;
  sirinluexternal::UsoEntitySpan **v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  sirinluexternal::UsoEntitySpan **v100;
  unint64_t v101;
  _QWORD *v102;
  _QWORD *v103;
  sirinluexternal::UsoEntitySpan *v104;
  int64x2_t v105;
  unint64_t v106;
  uint64_t v108;
  int64x2_t v109;
  unint64_t v110;
  char *v111;

  *(_QWORD *)this = &off_1E7BB2398;
  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (int64x2_t *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  if (a2[16])
  {
    v5 = operator new();
    v6 = sirinluexternal::SemVer::SemVer(v5, a2[16]);
    v7 = *((_QWORD *)this + 16);
    *((_QWORD *)this + 16) = v6;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
  v8 = (const sirinluexternal::UsoNode **)a2[10];
  for (i = (const sirinluexternal::UsoNode **)a2[11]; v8 != i; ++v8)
  {
    v10 = *v8;
    v11 = (sirinluexternal::UsoNode *)operator new();
    sirinluexternal::UsoNode::UsoNode(v11, v10);
    v13 = (sirinluexternal::UsoNode **)*((_QWORD *)this + 11);
    v12 = *((_QWORD *)this + 12);
    if ((unint64_t)v13 >= v12)
    {
      v15 = *((_QWORD *)this + 10);
      v16 = ((uint64_t)v13 - v15) >> 3;
      if ((unint64_t)(v16 + 1) >> 61)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v17 = v12 - v15;
      v18 = v17 >> 2;
      if (v17 >> 2 <= (unint64_t)(v16 + 1))
        v18 = v16 + 1;
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
        v19 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v19 = v18;
      v111 = (char *)this + 96;
      if (v19)
        v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v19);
      else
        v20 = 0;
      v21 = (sirinluexternal::UsoNode **)(v19 + 8 * v16);
      v22 = v19 + 8 * v20;
      v110 = v22;
      *v21 = v11;
      v14 = v21 + 1;
      v109.i64[1] = (uint64_t)(v21 + 1);
      v24 = (_QWORD *)*((_QWORD *)this + 10);
      v23 = (_QWORD *)*((_QWORD *)this + 11);
      if (v23 == v24)
      {
        v26 = vdupq_n_s64((unint64_t)v23);
      }
      else
      {
        do
        {
          v25 = (sirinluexternal::UsoNode *)*--v23;
          *v23 = 0;
          *--v21 = v25;
        }
        while (v23 != v24);
        v26 = *((int64x2_t *)this + 5);
        v14 = (_QWORD *)v109.i64[1];
        v22 = v110;
      }
      *((_QWORD *)this + 10) = v21;
      *((_QWORD *)this + 11) = v14;
      v109 = v26;
      v27 = *((_QWORD *)this + 12);
      *((_QWORD *)this + 12) = v22;
      v110 = v27;
      v108 = v26.i64[0];
      std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v108);
    }
    else
    {
      *v13 = v11;
      v14 = v13 + 1;
    }
    *((_QWORD *)this + 11) = v14;
  }
  v28 = (const sirinluexternal::UsoEdge **)a2[4];
  for (j = (const sirinluexternal::UsoEdge **)a2[5]; v28 != j; ++v28)
  {
    v30 = *v28;
    v31 = (sirinluexternal::UsoEdge *)operator new();
    sirinluexternal::UsoEdge::UsoEdge(v31, v30);
    v33 = (sirinluexternal::UsoEdge **)*((_QWORD *)this + 5);
    v32 = *((_QWORD *)this + 6);
    if ((unint64_t)v33 >= v32)
    {
      v35 = *((_QWORD *)this + 4);
      v36 = ((uint64_t)v33 - v35) >> 3;
      if ((unint64_t)(v36 + 1) >> 61)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v37 = v32 - v35;
      v38 = v37 >> 2;
      if (v37 >> 2 <= (unint64_t)(v36 + 1))
        v38 = v36 + 1;
      if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8)
        v39 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v39 = v38;
      v111 = (char *)this + 48;
      if (v39)
        v39 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v39);
      else
        v40 = 0;
      v41 = (sirinluexternal::UsoEdge **)(v39 + 8 * v36);
      v42 = v39 + 8 * v40;
      v110 = v42;
      *v41 = v31;
      v34 = v41 + 1;
      v109.i64[1] = (uint64_t)(v41 + 1);
      v44 = (_QWORD *)*((_QWORD *)this + 4);
      v43 = (_QWORD *)*((_QWORD *)this + 5);
      if (v43 == v44)
      {
        v46 = vdupq_n_s64((unint64_t)v43);
      }
      else
      {
        do
        {
          v45 = (sirinluexternal::UsoEdge *)*--v43;
          *v43 = 0;
          *--v41 = v45;
        }
        while (v43 != v44);
        v46 = *((int64x2_t *)this + 2);
        v34 = (_QWORD *)v109.i64[1];
        v42 = v110;
      }
      *((_QWORD *)this + 4) = v41;
      *((_QWORD *)this + 5) = v34;
      v109 = v46;
      v47 = *((_QWORD *)this + 6);
      *((_QWORD *)this + 6) = v42;
      v110 = v47;
      v108 = v46.i64[0];
      std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v108);
    }
    else
    {
      *v33 = v31;
      v34 = v33 + 1;
    }
    *((_QWORD *)this + 5) = v34;
  }
  v48 = (const sirinluexternal::UsoEntityIdentifier **)a2[7];
  for (k = (const sirinluexternal::UsoEntityIdentifier **)a2[8]; v48 != k; ++v48)
  {
    v50 = *v48;
    v51 = (sirinluexternal::UsoEntityIdentifier *)operator new();
    sirinluexternal::UsoEntityIdentifier::UsoEntityIdentifier(v51, v50);
    v53 = (sirinluexternal::UsoEntityIdentifier **)*((_QWORD *)this + 8);
    v52 = *((_QWORD *)this + 9);
    if ((unint64_t)v53 >= v52)
    {
      v55 = *((_QWORD *)this + 7);
      v56 = ((uint64_t)v53 - v55) >> 3;
      if ((unint64_t)(v56 + 1) >> 61)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v57 = v52 - v55;
      v58 = v57 >> 2;
      if (v57 >> 2 <= (unint64_t)(v56 + 1))
        v58 = v56 + 1;
      if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF8)
        v59 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v59 = v58;
      v111 = (char *)this + 72;
      if (v59)
        v59 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v59);
      else
        v60 = 0;
      v61 = (sirinluexternal::UsoEntityIdentifier **)(v59 + 8 * v56);
      v62 = v59 + 8 * v60;
      v110 = v62;
      *v61 = v51;
      v54 = v61 + 1;
      v109.i64[1] = (uint64_t)(v61 + 1);
      v64 = (_QWORD *)*((_QWORD *)this + 7);
      v63 = (_QWORD *)*((_QWORD *)this + 8);
      if (v63 == v64)
      {
        v66 = vdupq_n_s64((unint64_t)v63);
      }
      else
      {
        do
        {
          v65 = (sirinluexternal::UsoEntityIdentifier *)*--v63;
          *v63 = 0;
          *--v61 = v65;
        }
        while (v63 != v64);
        v66 = *(int64x2_t *)((char *)this + 56);
        v54 = (_QWORD *)v109.i64[1];
        v62 = v110;
      }
      *((_QWORD *)this + 7) = v61;
      *((_QWORD *)this + 8) = v54;
      v109 = v66;
      v67 = *((_QWORD *)this + 9);
      *((_QWORD *)this + 9) = v62;
      v110 = v67;
      v108 = v66.i64[0];
      std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v108);
    }
    else
    {
      *v53 = v51;
      v54 = v53 + 1;
    }
    *((_QWORD *)this + 8) = v54;
  }
  v68 = (const sirinluexternal::UtteranceAlignment **)a2[1];
  for (m = (const sirinluexternal::UtteranceAlignment **)a2[2]; v68 != m; ++v68)
  {
    v70 = *v68;
    v71 = (sirinluexternal::UtteranceAlignment *)operator new();
    sirinluexternal::UtteranceAlignment::UtteranceAlignment(v71, v70);
    v73 = (sirinluexternal::UtteranceAlignment **)*((_QWORD *)this + 2);
    v72 = *((_QWORD *)this + 3);
    if ((unint64_t)v73 >= v72)
    {
      v75 = ((uint64_t)v73 - v4->i64[0]) >> 3;
      if ((unint64_t)(v75 + 1) >> 61)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v76 = v72 - v4->i64[0];
      v77 = v76 >> 2;
      if (v76 >> 2 <= (unint64_t)(v75 + 1))
        v77 = v75 + 1;
      if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFF8)
        v78 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v78 = v77;
      v111 = (char *)this + 24;
      if (v78)
        v78 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v78);
      else
        v79 = 0;
      v80 = (sirinluexternal::UtteranceAlignment **)(v78 + 8 * v75);
      v81 = v78 + 8 * v79;
      v110 = v81;
      *v80 = v71;
      v74 = v80 + 1;
      v109.i64[1] = (uint64_t)(v80 + 1);
      v83 = (_QWORD *)*((_QWORD *)this + 1);
      v82 = (_QWORD *)*((_QWORD *)this + 2);
      if (v82 == v83)
      {
        v85 = vdupq_n_s64((unint64_t)v82);
      }
      else
      {
        do
        {
          v84 = (sirinluexternal::UtteranceAlignment *)*--v82;
          *v82 = 0;
          *--v80 = v84;
        }
        while (v82 != v83);
        v85 = *v4;
        v74 = (_QWORD *)v109.i64[1];
        v81 = v110;
      }
      *((_QWORD *)this + 1) = v80;
      *((_QWORD *)this + 2) = v74;
      v109 = v85;
      v86 = *((_QWORD *)this + 3);
      *((_QWORD *)this + 3) = v81;
      v110 = v86;
      v108 = v85.i64[0];
      std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v108);
    }
    else
    {
      *v73 = v71;
      v74 = v73 + 1;
    }
    *((_QWORD *)this + 2) = v74;
  }
  v87 = (const sirinluexternal::UsoEntitySpan **)a2[13];
  for (n = (const sirinluexternal::UsoEntitySpan **)a2[14]; v87 != n; ++v87)
  {
    v89 = *v87;
    v90 = (sirinluexternal::UsoEntitySpan *)operator new();
    sirinluexternal::UsoEntitySpan::UsoEntitySpan(v90, v89);
    v92 = (sirinluexternal::UsoEntitySpan **)*((_QWORD *)this + 14);
    v91 = *((_QWORD *)this + 15);
    if ((unint64_t)v92 >= v91)
    {
      v94 = *((_QWORD *)this + 13);
      v95 = ((uint64_t)v92 - v94) >> 3;
      if ((unint64_t)(v95 + 1) >> 61)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v96 = v91 - v94;
      v97 = v96 >> 2;
      if (v96 >> 2 <= (unint64_t)(v95 + 1))
        v97 = v95 + 1;
      if ((unint64_t)v96 >= 0x7FFFFFFFFFFFFFF8)
        v98 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v98 = v97;
      v111 = (char *)this + 120;
      if (v98)
        v98 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v98);
      else
        v99 = 0;
      v100 = (sirinluexternal::UsoEntitySpan **)(v98 + 8 * v95);
      v101 = v98 + 8 * v99;
      v110 = v101;
      *v100 = v90;
      v93 = v100 + 1;
      v109.i64[1] = (uint64_t)(v100 + 1);
      v103 = (_QWORD *)*((_QWORD *)this + 13);
      v102 = (_QWORD *)*((_QWORD *)this + 14);
      if (v102 == v103)
      {
        v105 = vdupq_n_s64((unint64_t)v102);
      }
      else
      {
        do
        {
          v104 = (sirinluexternal::UsoEntitySpan *)*--v102;
          *v102 = 0;
          *--v100 = v104;
        }
        while (v102 != v103);
        v105 = *(int64x2_t *)((char *)this + 104);
        v93 = (_QWORD *)v109.i64[1];
        v101 = v110;
      }
      *((_QWORD *)this + 13) = v100;
      *((_QWORD *)this + 14) = v93;
      v109 = v105;
      v106 = *((_QWORD *)this + 15);
      *((_QWORD *)this + 15) = v101;
      v110 = v106;
      v108 = v105.i64[0];
      std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v108);
    }
    else
    {
      *v92 = v90;
      v93 = v92 + 1;
    }
    *((_QWORD *)this + 14) = v93;
  }
  return this;
}

void sub_1C20178A8(void *a1)
{
  __clang_call_terminate(a1);
}

const sirinluexternal::SemVer **sirinluexternal::UsoGraph::operator=(const sirinluexternal::SemVer **a1, const sirinluexternal::SemVer **a2)
{
  sirinluexternal::UsoGraph *v3;
  _BYTE v5[136];

  if (a1 != a2)
  {
    sirinluexternal::UsoGraph::UsoGraph((sirinluexternal::UsoGraph *)v5, a2);
    sirinluexternal::swap(a1, (sirinluexternal::UsoGraph *)v5, v3);
    sirinluexternal::UsoGraph::~UsoGraph((sirinluexternal::UsoGraph *)v5);
  }
  return a1;
}

_QWORD *sirinluexternal::swap(_QWORD *this, sirinluexternal::UsoGraph *a2, sirinluexternal::UsoGraph *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = this[16];
  this[16] = *((_QWORD *)a2 + 16);
  *((_QWORD *)a2 + 16) = v3;
  v4 = this[10];
  this[10] = *((_QWORD *)a2 + 10);
  *((_QWORD *)a2 + 10) = v4;
  v5 = this[11];
  this[11] = *((_QWORD *)a2 + 11);
  *((_QWORD *)a2 + 11) = v5;
  v6 = this[12];
  this[12] = *((_QWORD *)a2 + 12);
  *((_QWORD *)a2 + 12) = v6;
  v7 = this[4];
  this[4] = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v7;
  v8 = this[5];
  this[5] = *((_QWORD *)a2 + 5);
  *((_QWORD *)a2 + 5) = v8;
  v9 = this[6];
  this[6] = *((_QWORD *)a2 + 6);
  *((_QWORD *)a2 + 6) = v9;
  v10 = this[7];
  this[7] = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v10;
  v11 = this[8];
  this[8] = *((_QWORD *)a2 + 8);
  *((_QWORD *)a2 + 8) = v11;
  v12 = this[9];
  this[9] = *((_QWORD *)a2 + 9);
  *((_QWORD *)a2 + 9) = v12;
  v13 = this[1];
  this[1] = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v13;
  v14 = this[2];
  this[2] = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v14;
  v15 = this[3];
  this[3] = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v15;
  v16 = this[13];
  this[13] = *((_QWORD *)a2 + 13);
  *((_QWORD *)a2 + 13) = v16;
  v17 = this[14];
  this[14] = *((_QWORD *)a2 + 14);
  *((_QWORD *)a2 + 14) = v17;
  v18 = this[15];
  this[15] = *((_QWORD *)a2 + 15);
  *((_QWORD *)a2 + 15) = v18;
  return this;
}

uint64_t sirinluexternal::UsoGraph::UsoGraph(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void **v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void **v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  void **v31;
  _QWORD *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;

  *(_OWORD *)(a1 + 8) = 0u;
  v4 = a1 + 8;
  *(_QWORD *)a1 = &off_1E7BB2398;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  v5 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a2 + 128) = 0;
  v6 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 128) = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  v7 = (void **)(a1 + 80);
  v8 = *(_QWORD **)(a1 + 80);
  if (v8)
  {
    v9 = *(_QWORD **)(a1 + 88);
    v10 = *(void **)(a1 + 80);
    if (v9 != v8)
    {
      do
      {
        v12 = *--v9;
        v11 = v12;
        *v9 = 0;
        if (v12)
          (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
      }
      while (v9 != v8);
      v10 = *v7;
    }
    *(_QWORD *)(a1 + 88) = v8;
    operator delete(v10);
    *v7 = 0;
    *(_QWORD *)(a1 + 88) = 0;
    *(_QWORD *)(a1 + 96) = 0;
  }
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 88) = 0;
  *(_QWORD *)(a2 + 96) = 0;
  v13 = *(_QWORD **)(a1 + 32);
  if (v13)
  {
    v14 = (void **)(a1 + 32);
    v15 = *(_QWORD **)(a1 + 40);
    v16 = *(void **)(a1 + 32);
    if (v15 != v13)
    {
      do
      {
        v18 = *--v15;
        v17 = v18;
        *v15 = 0;
        if (v18)
          (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
      }
      while (v15 != v13);
      v16 = *v14;
    }
    *(_QWORD *)(a1 + 40) = v13;
    operator delete(v16);
    *v14 = 0;
    *(_QWORD *)(a1 + 40) = 0;
    *(_QWORD *)(a1 + 48) = 0;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  v19 = *(_QWORD **)(a1 + 56);
  if (v19)
  {
    v20 = (void **)(a1 + 56);
    v21 = *(_QWORD **)(a1 + 64);
    v22 = *(void **)(a1 + 56);
    if (v21 != v19)
    {
      do
      {
        v24 = *--v21;
        v23 = v24;
        *v21 = 0;
        if (v24)
          (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
      }
      while (v21 != v19);
      v22 = *v20;
    }
    *(_QWORD *)(a1 + 64) = v19;
    operator delete(v22);
    *v20 = 0;
    *(_QWORD *)(a1 + 64) = 0;
    *(_QWORD *)(a1 + 72) = 0;
  }
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v25 = *(_QWORD **)(a1 + 8);
  if (v25)
  {
    v26 = *(_QWORD **)(a1 + 16);
    v27 = *(void **)(a1 + 8);
    if (v26 != v25)
    {
      do
      {
        v29 = *--v26;
        v28 = v29;
        *v26 = 0;
        if (v29)
          (*(void (**)(uint64_t))(*(_QWORD *)v28 + 8))(v28);
      }
      while (v26 != v25);
      v27 = *(void **)v4;
    }
    *(_QWORD *)(a1 + 16) = v25;
    operator delete(v27);
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(v4 + 8) = 0;
    *(_QWORD *)(v4 + 16) = 0;
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  v30 = *(_QWORD **)(a1 + 104);
  if (v30)
  {
    v31 = (void **)(a1 + 104);
    v32 = *(_QWORD **)(a1 + 112);
    v33 = *(void **)(a1 + 104);
    if (v32 != v30)
    {
      do
      {
        v35 = *--v32;
        v34 = v35;
        *v32 = 0;
        if (v35)
          (*(void (**)(uint64_t))(*(_QWORD *)v34 + 8))(v34);
      }
      while (v32 != v30);
      v33 = *v31;
    }
    *(_QWORD *)(a1 + 112) = v30;
    operator delete(v33);
    *v31 = 0;
    *(_QWORD *)(a1 + 112) = 0;
    *(_QWORD *)(a1 + 120) = 0;
  }
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a2 + 104) = 0;
  *(_QWORD *)(a2 + 112) = 0;
  *(_QWORD *)(a2 + 120) = 0;
  return a1;
}

_QWORD *sirinluexternal::UsoGraph::operator=(_QWORD *a1, uint64_t a2)
{
  sirinluexternal::UsoGraph *v3;
  _BYTE v5[136];

  if (a1 != (_QWORD *)a2)
  {
    sirinluexternal::UsoGraph::UsoGraph((uint64_t)v5, a2);
    sirinluexternal::swap(a1, (sirinluexternal::UsoGraph *)v5, v3);
    sirinluexternal::UsoGraph::~UsoGraph((sirinluexternal::UsoGraph *)v5);
  }
  return a1;
}

uint64_t sirinluexternal::UsoGraph::operator==(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t result;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;

  v4 = a1[16];
  v5 = a2[16];
  if (v4)
  {
    if (!v5 || !sirinluexternal::SemVer::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v7 = (uint64_t *)a1[10];
  v6 = (uint64_t *)a1[11];
  v8 = (uint64_t *)a2[10];
  if ((char *)v6 - (char *)v7 != a2[11] - (_QWORD)v8)
    return 0;
  while (v7 != v6)
  {
    result = sirinluexternal::UsoNode::operator==(*v7, *v8);
    if (!(_DWORD)result)
      return result;
    ++v7;
    ++v8;
  }
  v11 = (uint64_t *)a1[4];
  v10 = (uint64_t *)a1[5];
  v12 = (uint64_t *)a2[4];
  if ((char *)v10 - (char *)v11 != a2[5] - (_QWORD)v12)
    return 0;
  while (v11 != v10)
  {
    result = sirinluexternal::UsoEdge::operator==(*v11, *v12);
    if (!(_DWORD)result)
      return result;
    ++v11;
    ++v12;
  }
  v14 = (uint64_t *)a1[7];
  v13 = (uint64_t *)a1[8];
  v15 = (uint64_t *)a2[7];
  if ((char *)v13 - (char *)v14 != a2[8] - (_QWORD)v15)
    return 0;
  while (v14 != v13)
  {
    result = sirinluexternal::UsoEntityIdentifier::operator==(*v14, *v15);
    if (!(_DWORD)result)
      return result;
    ++v14;
    ++v15;
  }
  v17 = (uint64_t *)a1[1];
  v16 = (uint64_t *)a1[2];
  v18 = (uint64_t *)a2[1];
  if ((char *)v16 - (char *)v17 != a2[2] - (_QWORD)v18)
    return 0;
  while (v17 != v16)
  {
    result = sirinluexternal::UtteranceAlignment::operator==(*v17, *v18);
    if (!(_DWORD)result)
      return result;
    ++v17;
    ++v18;
  }
  v19 = a1[13];
  v20 = a1[14];
  v22 = a2 + 13;
  v21 = (uint64_t *)a2[13];
  if (v20 - v19 != v22[1] - (_QWORD)v21)
    return 0;
  if (v19 == v20)
    return 1;
  v23 = v19 + 8;
  do
  {
    v24 = *v21++;
    result = sirinluexternal::UsoEntitySpan::operator==(*(_QWORD *)(v23 - 8), v24);
    if ((_DWORD)result)
      v25 = v23 == v20;
    else
      v25 = 1;
    v23 += 8;
  }
  while (!v25);
  return result;
}

uint64_t sirinluexternal::UsoGraph::hash_value(sirinluexternal::UsoGraph *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  sirinluexternal::UsoNode **v7;
  sirinluexternal::UsoNode **v8;
  uint64_t v9;
  sirinluexternal::UsoNode *v10;
  sirinluexternal::UsoEdge **v11;
  sirinluexternal::UsoEdge **v12;
  uint64_t v13;
  sirinluexternal::UsoEdge *v14;
  sirinluexternal::UsoEntityIdentifier **v15;
  sirinluexternal::UsoEntityIdentifier **v16;
  uint64_t v17;
  sirinluexternal::UsoEntityIdentifier *v18;
  sirinluexternal::UtteranceAlignment **v19;
  sirinluexternal::UtteranceAlignment **v20;
  uint64_t v21;
  sirinluexternal::UtteranceAlignment *v22;
  sirinluexternal::UsoEntitySpan **v23;
  sirinluexternal::UsoEntitySpan **v24;
  uint64_t v25;
  sirinluexternal::UsoEntitySpan *v26;

  v2 = *((_QWORD *)this + 16);
  if (!v2)
  {
    v6 = 0;
    goto LABEL_11;
  }
  if ((*(_BYTE *)(v2 + 20) & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)(v2 + 20) & 2) != 0)
      goto LABEL_4;
LABEL_8:
    v4 = 0;
    if ((*(_BYTE *)(v2 + 20) & 4) != 0)
      goto LABEL_5;
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v3 = *(unsigned int *)(v2 + 8);
  if ((*(_BYTE *)(v2 + 20) & 2) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = *(unsigned int *)(v2 + 12);
  if ((*(_BYTE *)(v2 + 20) & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = *(unsigned int *)(v2 + 16);
LABEL_10:
  v6 = v4 ^ v3 ^ v5;
LABEL_11:
  v7 = (sirinluexternal::UsoNode **)*((_QWORD *)this + 10);
  v8 = (sirinluexternal::UsoNode **)*((_QWORD *)this + 11);
  if (v7 == v8)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    do
    {
      v10 = *v7++;
      v9 ^= sirinluexternal::UsoNode::hash_value(v10);
    }
    while (v7 != v8);
  }
  v11 = (sirinluexternal::UsoEdge **)*((_QWORD *)this + 4);
  v12 = (sirinluexternal::UsoEdge **)*((_QWORD *)this + 5);
  if (v11 == v12)
  {
    v13 = 0;
  }
  else
  {
    v13 = 0;
    do
    {
      v14 = *v11++;
      v13 ^= sirinluexternal::UsoEdge::hash_value(v14);
    }
    while (v11 != v12);
  }
  v15 = (sirinluexternal::UsoEntityIdentifier **)*((_QWORD *)this + 7);
  v16 = (sirinluexternal::UsoEntityIdentifier **)*((_QWORD *)this + 8);
  if (v15 == v16)
  {
    v17 = 0;
  }
  else
  {
    v17 = 0;
    do
    {
      v18 = *v15++;
      v17 ^= sirinluexternal::UsoEntityIdentifier::hash_value(v18);
    }
    while (v15 != v16);
  }
  v19 = (sirinluexternal::UtteranceAlignment **)*((_QWORD *)this + 1);
  v20 = (sirinluexternal::UtteranceAlignment **)*((_QWORD *)this + 2);
  if (v19 == v20)
  {
    v21 = 0;
  }
  else
  {
    v21 = 0;
    do
    {
      v22 = *v19++;
      v21 ^= sirinluexternal::UtteranceAlignment::hash_value(v22);
    }
    while (v19 != v20);
  }
  v24 = (sirinluexternal::UsoEntitySpan **)*((_QWORD *)this + 13);
  v23 = (sirinluexternal::UsoEntitySpan **)*((_QWORD *)this + 14);
  if (v24 == v23)
  {
    v25 = 0;
  }
  else
  {
    v25 = 0;
    do
    {
      v26 = *v24++;
      v25 ^= sirinluexternal::UsoEntitySpan::hash_value(v26);
    }
    while (v24 != v23);
  }
  return v9 ^ v6 ^ v13 ^ v17 ^ v21 ^ v25;
}

_QWORD *sirinluexternal::UsoGraph::makeVersion(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[16])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BB15B8;
    *(_DWORD *)(v2 + 20) = 0;
    this = (_QWORD *)v1[16];
    v1[16] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

void sirinluinternal::TurnInputRule::~TurnInputRule(sirinluinternal::TurnInputRule *this)
{
  sirinluinternal::TurnInputRule::~TurnInputRule(this);
  JUMPOUT(0x1C3BB720CLL);
}

{
  uint64_t v2;
  void **v3;

  *(_QWORD *)this = &off_1E7BB23E8;
  v2 = *((_QWORD *)this + 7);
  *((_QWORD *)this + 7) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = (void **)((char *)this + 32);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v3 = (void **)((char *)this + 8);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__destroy_vector::operator()[abi:ne180100](&v3);
  PB::Base::~Base(this);
}

uint64_t sirinluinternal::TurnInputRule::readFrom(sirinluinternal::TurnInputRule *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t **v8;
  uint64_t **v9;
  uint64_t v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  char v17;
  unsigned int v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (uint64_t **)((char *)this + 8);
    v9 = (uint64_t **)((char *)this + 32);
    while (1)
    {
      v10 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        v17 = 0;
        v18 = 0;
        v13 = 0;
        if (v2 > v3)
          v3 = v2;
        while (v3 != v2)
        {
          v19 = v2 + 1;
          v20 = *(_BYTE *)(v10 + v2);
          *((_QWORD *)a2 + 1) = v19;
          v13 |= (unint64_t)(v20 & 0x7F) << v17;
          if ((v20 & 0x80) == 0)
            goto LABEL_21;
          v17 += 7;
          v2 = v19;
          v16 = v18++ > 8;
          if (v16)
            goto LABEL_27;
        }
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v15 = *(_BYTE *)(v10 + v2);
        v13 |= (unint64_t)(v15 & 0x7F) << v11;
        if ((v15 & 0x80) == 0)
          break;
        v11 += 7;
        v2 = v14;
        v16 = v12++ > 8;
        if (v16)
          goto LABEL_27;
      }
LABEL_21:
      if ((v13 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v21 = v13 >> 3;
      if ((v13 >> 3) == 3)
        break;
      if ((_DWORD)v21 == 2)
      {
        PB::PtrVector<sirinluinternal::ContextRule>::emplace_back<>(v9);
        v25 = *((_QWORD *)this + 5);
        goto LABEL_31;
      }
      if ((_DWORD)v21 != 1)
      {
LABEL_27:
        result = PB::Reader::skip(a2);
        if (!(_DWORD)result)
          return result;
        goto LABEL_35;
      }
      v22 = operator new();
      *(_QWORD *)v22 = &off_1E7BB2348;
      *(_OWORD *)(v22 + 8) = 0u;
      *(_OWORD *)(v22 + 24) = 0u;
      *(_OWORD *)(v22 + 40) = 0u;
      v23 = *((_QWORD *)this + 7);
      *((_QWORD *)this + 7) = v22;
      if (v23)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
        v22 = *((_QWORD *)this + 7);
      }
LABEL_32:
      if (!PB::Reader::placeMark()
        || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v22 + 16))(v22, a2) & 1) == 0)
      {
        return 0;
      }
      PB::Reader::recallMark();
LABEL_35:
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((_BYTE *)a2 + 24))
        return v4 == 0;
    }
    PB::PtrVector<sirinluinternal::ContextRule>::emplace_back<>(v8);
    v25 = *((_QWORD *)this + 2);
LABEL_31:
    v22 = *(_QWORD *)(v25 - 8);
    goto LABEL_32;
  }
  return v4 == 0;
}

uint64_t sirinluinternal::TurnInputRule::writeTo(uint64_t this, PB::Writer *a2)
{
  _QWORD *v3;
  const PB::Base *v4;
  const PB::Base **v5;
  const PB::Base **v6;
  const PB::Base *v7;
  const PB::Base **v8;
  const PB::Base **v9;
  const PB::Base *v10;

  v3 = (_QWORD *)this;
  v4 = *(const PB::Base **)(this + 56);
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v5 = (const PB::Base **)v3[4];
  v6 = (const PB::Base **)v3[5];
  while (v5 != v6)
  {
    v7 = *v5++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  v9 = (const PB::Base **)v3[1];
  v8 = (const PB::Base **)v3[2];
  while (v9 != v8)
  {
    v10 = *v9++;
    this = PB::Writer::writeSubmessage(a2, v10);
  }
  return this;
}

uint64_t sirinluinternal::TurnInputRule::formatText(sirinluinternal::TurnInputRule *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = (uint64_t *)*((_QWORD *)this + 1);
  v6 = (uint64_t *)*((_QWORD *)this + 2);
  while (v5 != v6)
  {
    v7 = *v5++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v7 + 32))(v7, a2, "negative_context_rules");
  }
  v8 = (uint64_t *)*((_QWORD *)this + 4);
  v9 = (uint64_t *)*((_QWORD *)this + 5);
  while (v8 != v9)
  {
    v10 = *v8++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v10 + 32))(v10, a2, "positive_context_rules");
  }
  v11 = *((_QWORD *)this + 7);
  if (v11)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v11 + 32))(v11, a2, "utterance_rule");
  return PB::TextFormatter::endObject(a2);
}

uint64_t PB::PtrVector<sirinluinternal::ContextRule>::emplace_back<>(uint64_t **a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  int64x2_t v17;
  unint64_t v18;
  uint64_t v19;
  int64x2_t v20;
  unint64_t v21;
  _QWORD *v22;

  result = operator new();
  v3 = result;
  *(_QWORD *)result = &off_1E7BB0808;
  *(_DWORD *)(result + 48) = 0;
  *(_OWORD *)(result + 8) = 0u;
  *(_OWORD *)(result + 24) = 0u;
  *(_QWORD *)(result + 37) = 0;
  v4 = (unint64_t)a1[2];
  v5 = a1[1];
  if ((unint64_t)v5 >= v4)
  {
    v7 = v5 - *a1;
    if ((unint64_t)(v7 + 1) >> 61)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v8 = v4 - (_QWORD)*a1;
    v9 = v8 >> 2;
    if (v8 >> 2 <= (unint64_t)(v7 + 1))
      v9 = v7 + 1;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v10 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v10 = v9;
    v22 = a1 + 2;
    if (v10)
      v10 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v10);
    else
      v11 = 0;
    v12 = (uint64_t *)(v10 + 8 * v7);
    v13 = v10 + 8 * v11;
    v21 = v13;
    *v12 = v3;
    v6 = v12 + 1;
    v20.i64[1] = (uint64_t)(v12 + 1);
    v15 = *a1;
    v14 = a1[1];
    if (v14 == *a1)
    {
      v17 = vdupq_n_s64((unint64_t)v14);
    }
    else
    {
      do
      {
        v16 = *--v14;
        *v14 = 0;
        *--v12 = v16;
      }
      while (v14 != v15);
      v17 = *(int64x2_t *)a1;
      v6 = (uint64_t *)v20.i64[1];
      v13 = v21;
    }
    *a1 = v12;
    a1[1] = v6;
    v20 = v17;
    v18 = (unint64_t)a1[2];
    a1[2] = (uint64_t *)v13;
    v21 = v18;
    v19 = v17.i64[0];
    result = std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v19);
  }
  else
  {
    *v5 = result;
    v6 = v5 + 1;
  }
  a1[1] = v6;
  return result;
}

void sub_1C20185A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

double sirinluinternal::TurnInputRule::TurnInputRule(sirinluinternal::TurnInputRule *this)
{
  double result;

  *(_QWORD *)this = &off_1E7BB23E8;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_QWORD *)this + 7) = 0;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_1E7BB23E8;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_QWORD *)this + 7) = 0;
  return result;
}

sirinluinternal::TurnInputRule *sirinluinternal::TurnInputRule::TurnInputRule(sirinluinternal::TurnInputRule *this, const sirinluinternal::UtteranceRule **a2)
{
  sirinluinternal::ContextRule ***v4;
  sirinluinternal::UtteranceRule *v5;
  sirinluinternal::UtteranceRule *v6;
  uint64_t v7;
  const sirinluexternal::TurnContext ***v8;
  const sirinluexternal::TurnContext ***i;
  const sirinluexternal::TurnContext ***v10;
  const sirinluexternal::TurnContext ***v11;

  *(_QWORD *)this = &off_1E7BB23E8;
  *(_OWORD *)((char *)this + 8) = 0u;
  v4 = (sirinluinternal::ContextRule ***)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_QWORD *)this + 7) = 0;
  if (a2[7])
  {
    v5 = (sirinluinternal::UtteranceRule *)operator new();
    v6 = sirinluinternal::UtteranceRule::UtteranceRule(v5, a2[7]);
    v7 = *((_QWORD *)this + 7);
    *((_QWORD *)this + 7) = v6;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
  v8 = (const sirinluexternal::TurnContext ***)a2[4];
  for (i = (const sirinluexternal::TurnContext ***)a2[5]; v8 != i; ++v8)
    PB::PtrVector<sirinluinternal::ContextRule>::emplace_back<sirinluinternal::ContextRule const&>((sirinluinternal::ContextRule ***)this + 4, *v8);
  v11 = (const sirinluexternal::TurnContext ***)a2[1];
  v10 = (const sirinluexternal::TurnContext ***)a2[2];
  while (v11 != v10)
    PB::PtrVector<sirinluinternal::ContextRule>::emplace_back<sirinluinternal::ContextRule const&>(v4, *v11++);
  return this;
}

uint64_t PB::PtrVector<sirinluinternal::ContextRule>::emplace_back<sirinluinternal::ContextRule const&>(sirinluinternal::ContextRule ***a1, const sirinluexternal::TurnContext **a2)
{
  sirinluinternal::ContextRule *v4;
  uint64_t result;
  unint64_t v6;
  sirinluinternal::ContextRule **v7;
  sirinluinternal::ContextRule **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  sirinluinternal::ContextRule **v14;
  unint64_t v15;
  sirinluinternal::ContextRule **v16;
  sirinluinternal::ContextRule **v17;
  sirinluinternal::ContextRule *v18;
  int64x2_t v19;
  sirinluinternal::ContextRule **v20;
  uint64_t v21;
  int64x2_t v22;
  unint64_t v23;
  _QWORD *v24;

  v4 = (sirinluinternal::ContextRule *)operator new();
  result = (uint64_t)sirinluinternal::ContextRule::ContextRule(v4, a2);
  v6 = (unint64_t)a1[2];
  v7 = a1[1];
  if ((unint64_t)v7 >= v6)
  {
    v9 = v7 - *a1;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v10 = v6 - (_QWORD)*a1;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    v24 = a1 + 2;
    if (v12)
      v12 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<siricommon::StringValue>>>(v12);
    else
      v13 = 0;
    v14 = (sirinluinternal::ContextRule **)(v12 + 8 * v9);
    v15 = v12 + 8 * v13;
    v23 = v15;
    *v14 = v4;
    v8 = v14 + 1;
    v22.i64[1] = (uint64_t)(v14 + 1);
    v17 = *a1;
    v16 = a1[1];
    if (v16 == *a1)
    {
      v19 = vdupq_n_s64((unint64_t)v16);
    }
    else
    {
      do
      {
        v18 = *--v16;
        *v16 = 0;
        *--v14 = v18;
      }
      while (v16 != v17);
      v19 = *(int64x2_t *)a1;
      v8 = (sirinluinternal::ContextRule **)v22.i64[1];
      v15 = v23;
    }
    *a1 = v14;
    a1[1] = v8;
    v22 = v19;
    v20 = a1[2];
    a1[2] = (sirinluinternal::ContextRule **)v15;
    v23 = (unint64_t)v20;
    v21 = v19.i64[0];
    result = std::__split_buffer<std::unique_ptr<siricommon::StringValue>>::~__split_buffer((uint64_t)&v21);
  }
  else
  {
    *v7 = v4;
    v8 = v7 + 1;
  }
  a1[1] = v8;
  return result;
}

void sub_1C2018898(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t sirinluinternal::TurnInputRule::operator=(uint64_t a1, const sirinluinternal::UtteranceRule **a2)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  if ((const sirinluinternal::UtteranceRule **)a1 != a2)
  {
    sirinluinternal::TurnInputRule::TurnInputRule((sirinluinternal::TurnInputRule *)&v8, a2);
    v3 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v12;
    v12 = v3;
    v4 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v11;
    v11 = v4;
    v5 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    v9 = v5;
    v6 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    v10 = v6;
    sirinluinternal::TurnInputRule::~TurnInputRule((sirinluinternal::TurnInputRule *)&v8);
  }
  return a1;
}

_QWORD *sirinluinternal::swap(_QWORD *this, sirinluinternal::TurnInputRule *a2, sirinluinternal::TurnInputRule *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = this[7];
  this[7] = *((_QWORD *)a2 + 7);
  *((_QWORD *)a2 + 7) = v3;
  v4 = this[4];
  this[4] = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v4;
  v5 = this[5];
  this[5] = *((_QWORD *)a2 + 5);
  *((_QWORD *)a2 + 5) = v5;
  v6 = this[6];
  this[6] = *((_QWORD *)a2 + 6);
  *((_QWORD *)a2 + 6) = v6;
  v7 = this[1];
  this[1] = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v7;
  v8 = this[2];
  this[2] = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v8;
  v9 = this[3];
  this[3] = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v9;
  return this;
}

uint64_t sirinluinternal::TurnInputRule::TurnInputRule(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)a1 = &off_1E7BB23E8;
  *(_OWORD *)(a1 + 8) = 0u;
  v4 = (_QWORD *)(a1 + 8);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 56) = 0;
  v6 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v5;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate((_QWORD *)(a1 + 32));
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  std::vector<std::unique_ptr<sirinluexternal::UserParse>>::__vdeallocate(v4);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return a1;
}

uint64_t sirinluinternal::TurnInputRule::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sirinluinternal::TurnInputRule::TurnInputRule((uint64_t)&v8, a2);
    v3 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v12;
    v12 = v3;
    v4 = *(_OWORD *)(a1 + 40);
    *(_OWORD *)(a1 + 40) = v11;
    v11 = v4;
    v5 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    v9 = v5;
    v6 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v10;
    v10 = v6;
    sirinluinternal::TurnInputRule::~TurnInputRule((sirinluinternal::TurnInputRule *)&v8);
  }
  return a1;
}

BOOL sirinluinternal::TurnInputRule::operator==(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1[7];
  v5 = *(_QWORD *)(a2 + 56);
  if (v4)
  {
    if (!v5 || !sirinluinternal::UtteranceRule::operator==(v4, v5))
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  if (PB::PtrVector<sirinluinternal::ContextRule>::operator==(a1 + 4, *(uint64_t **)(a2 + 32), *(_QWORD *)(a2 + 40)))
    return PB::PtrVector<sirinluinternal::ContextRule>::operator==(a1 + 1, *(uint64_t **)(a2 + 8), *(_QWORD *)(a2 + 16));
  return 0;
}

BOOL PB::PtrVector<sirinluinternal::ContextRule>::operator==(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 result;
  BOOL v9;

  v3 = *a1;
  v4 = a1[1];
  if (v4 - *a1 != a3 - (_QWORD)a2)
    return 0;
  if (v3 == v4)
    return 1;
  v5 = a2;
  v6 = v3 + 8;
  do
  {
    v7 = *v5++;
    result = sirinluinternal::ContextRule::operator==(*(_QWORD *)(v6 - 8), v7);
    v9 = !result || v6 == v4;
    v6 += 8;
  }
  while (!v9);
  return result;
}

unint64_t sirinluinternal::TurnInputRule::hash_value(sirinluinternal::TurnInputRule *this)
{
  sirinluinternal::UtteranceRule *v2;
  unint64_t v3;
  sirinluinternal::ContextRule **v4;
  sirinluinternal::ContextRule **v5;
  uint64_t v6;
  sirinluinternal::ContextRule *v7;
  sirinluinternal::ContextRule **v8;
  sirinluinternal::ContextRule **v9;
  uint64_t v10;
  sirinluinternal::ContextRule *v11;

  v2 = (sirinluinternal::UtteranceRule *)*((_QWORD *)this + 7);
  if (v2)
    v3 = sirinluinternal::UtteranceRule::hash_value(v2);
  else
    v3 = 0;
  v4 = (sirinluinternal::ContextRule **)*((_QWORD *)this + 4);
  v5 = (sirinluinternal::ContextRule **)*((_QWORD *)this + 5);
  if (v4 == v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    do
    {
      v7 = *v4++;
      v6 ^= sirinluinternal::ContextRule::hash_value(v7);
    }
    while (v4 != v5);
  }
  v9 = (sirinluinternal::ContextRule **)*((_QWORD *)this + 1);
  v8 = (sirinluinternal::ContextRule **)*((_QWORD *)this + 2);
  if (v9 == v8)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    do
    {
      v11 = *v9++;
      v10 ^= sirinluinternal::ContextRule::hash_value(v11);
    }
    while (v9 != v8);
  }
  return v6 ^ v3 ^ v10;
}

_QWORD *sirinluinternal::TurnInputRule::makeUtteranceRule(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[7])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E7BB2348;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    this = (_QWORD *)v1[7];
    v1[7] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

uint64_t sub_1C2018CD8()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1C2018CE4()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1C2018CF0()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1C2018CFC()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1C2018D08()
{
  return MEMORY[0x1E0CB0160]();
}

uint64_t sub_1C2018D14()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1C2018D20()
{
  return MEMORY[0x1E0CB0218]();
}

uint64_t sub_1C2018D2C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1C2018D38()
{
  return MEMORY[0x1E0CB0240]();
}

uint64_t sub_1C2018D44()
{
  return MEMORY[0x1E0CB0268]();
}

uint64_t sub_1C2018D50()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1C2018D5C()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1C2018D68()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1C2018D74()
{
  return MEMORY[0x1E0DA04B8]();
}

uint64_t sub_1C2018D80()
{
  return MEMORY[0x1E0DA04C0]();
}

uint64_t sub_1C2018D8C()
{
  return MEMORY[0x1E0DA04D0]();
}

uint64_t sub_1C2018D98()
{
  return MEMORY[0x1E0DA04D8]();
}

uint64_t sub_1C2018DA4()
{
  return MEMORY[0x1E0DA04E0]();
}

uint64_t sub_1C2018DB0()
{
  return MEMORY[0x1E0DA04E8]();
}

uint64_t sub_1C2018DBC()
{
  return MEMORY[0x1E0DA0510]();
}

uint64_t sub_1C2018DC8()
{
  return MEMORY[0x1E0DA0520]();
}

uint64_t sub_1C2018DD4()
{
  return MEMORY[0x1E0DA0528]();
}

uint64_t sub_1C2018DE0()
{
  return MEMORY[0x1E0DA0530]();
}

uint64_t sub_1C2018DEC()
{
  return MEMORY[0x1E0DA0548]();
}

uint64_t sub_1C2018DF8()
{
  return MEMORY[0x1E0DA0550]();
}

uint64_t sub_1C2018E04()
{
  return MEMORY[0x1E0DA0558]();
}

uint64_t sub_1C2018E10()
{
  return MEMORY[0x1E0DA0560]();
}

uint64_t sub_1C2018E1C()
{
  return MEMORY[0x1E0DA0568]();
}

uint64_t sub_1C2018E28()
{
  return MEMORY[0x1E0DA0578]();
}

uint64_t sub_1C2018E34()
{
  return MEMORY[0x1E0DA0588]();
}

uint64_t sub_1C2018E40()
{
  return MEMORY[0x1E0DA0598]();
}

uint64_t sub_1C2018E4C()
{
  return MEMORY[0x1E0DA05A0]();
}

uint64_t sub_1C2018E58()
{
  return MEMORY[0x1E0DA05A8]();
}

uint64_t sub_1C2018E64()
{
  return MEMORY[0x1E0DA05B0]();
}

uint64_t sub_1C2018E70()
{
  return MEMORY[0x1E0DA05D8]();
}

uint64_t sub_1C2018E7C()
{
  return MEMORY[0x1E0DA05E0]();
}

uint64_t sub_1C2018E88()
{
  return MEMORY[0x1E0DA05E8]();
}

uint64_t sub_1C2018E94()
{
  return MEMORY[0x1E0DA0608]();
}

uint64_t sub_1C2018EA0()
{
  return MEMORY[0x1E0DA0610]();
}

uint64_t sub_1C2018EAC()
{
  return MEMORY[0x1E0DA0620]();
}

uint64_t sub_1C2018EB8()
{
  return MEMORY[0x1E0DA0638]();
}

uint64_t sub_1C2018EC4()
{
  return MEMORY[0x1E0DA0650]();
}

uint64_t sub_1C2018ED0()
{
  return MEMORY[0x1E0DA0658]();
}

uint64_t sub_1C2018EDC()
{
  return MEMORY[0x1E0DA0678]();
}

uint64_t sub_1C2018EE8()
{
  return MEMORY[0x1E0DA0680]();
}

uint64_t sub_1C2018EF4()
{
  return MEMORY[0x1E0DA0688]();
}

uint64_t sub_1C2018F00()
{
  return MEMORY[0x1E0DA0698]();
}

uint64_t sub_1C2018F0C()
{
  return MEMORY[0x1E0DA06A0]();
}

uint64_t sub_1C2018F18()
{
  return MEMORY[0x1E0DA06A8]();
}

uint64_t sub_1C2018F24()
{
  return MEMORY[0x1E0DA06B0]();
}

uint64_t sub_1C2018F30()
{
  return MEMORY[0x1E0DA06B8]();
}

uint64_t sub_1C2018F3C()
{
  return MEMORY[0x1E0DA06C0]();
}

uint64_t sub_1C2018F48()
{
  return MEMORY[0x1E0DA06C8]();
}

uint64_t sub_1C2018F54()
{
  return MEMORY[0x1E0DA06D0]();
}

uint64_t sub_1C2018F60()
{
  return MEMORY[0x1E0DA06D8]();
}

uint64_t sub_1C2018F6C()
{
  return MEMORY[0x1E0DA06E8]();
}

uint64_t sub_1C2018F78()
{
  return MEMORY[0x1E0DA06F0]();
}

uint64_t sub_1C2018F84()
{
  return MEMORY[0x1E0DA06F8]();
}

uint64_t sub_1C2018F90()
{
  return MEMORY[0x1E0DA0700]();
}

uint64_t sub_1C2018F9C()
{
  return MEMORY[0x1E0DA0710]();
}

uint64_t sub_1C2018FA8()
{
  return MEMORY[0x1E0DA0DE0]();
}

uint64_t sub_1C2018FB4()
{
  return MEMORY[0x1E0DA0EB0]();
}

uint64_t sub_1C2018FC0()
{
  return MEMORY[0x1E0DA0EE0]();
}

uint64_t sub_1C2018FCC()
{
  return MEMORY[0x1E0DA0EE8]();
}

uint64_t sub_1C2018FD8()
{
  return MEMORY[0x1E0DA0EF0]();
}

uint64_t sub_1C2018FE4()
{
  return MEMORY[0x1E0DA0EF8]();
}

uint64_t sub_1C2018FF0()
{
  return MEMORY[0x1E0DA0FA8]();
}

uint64_t sub_1C2018FFC()
{
  return MEMORY[0x1E0DA0FB0]();
}

uint64_t sub_1C2019008()
{
  return MEMORY[0x1E0DA0FB8]();
}

uint64_t sub_1C2019014()
{
  return MEMORY[0x1E0DA1038]();
}

uint64_t sub_1C2019020()
{
  return MEMORY[0x1E0DA1040]();
}

uint64_t sub_1C201902C()
{
  return MEMORY[0x1E0DA1048]();
}

uint64_t sub_1C2019038()
{
  return MEMORY[0x1E0DA1068]();
}

uint64_t sub_1C2019044()
{
  return MEMORY[0x1E0DA1070]();
}

uint64_t sub_1C2019050()
{
  return MEMORY[0x1E0DA1078]();
}

uint64_t sub_1C201905C()
{
  return MEMORY[0x1E0DA12F8]();
}

uint64_t sub_1C2019068()
{
  return MEMORY[0x1E0DA27D8]();
}

uint64_t sub_1C2019074()
{
  return MEMORY[0x1E0DA27E0]();
}

uint64_t sub_1C2019080()
{
  return MEMORY[0x1E0DA27E8]();
}

uint64_t sub_1C201908C()
{
  return MEMORY[0x1E0DA27F0]();
}

uint64_t sub_1C2019098()
{
  return MEMORY[0x1E0DA27F8]();
}

uint64_t sub_1C20190A4()
{
  return MEMORY[0x1E0DA2810]();
}

uint64_t sub_1C20190B0()
{
  return MEMORY[0x1E0DA2818]();
}

uint64_t sub_1C20190BC()
{
  return MEMORY[0x1E0DA2820]();
}

uint64_t sub_1C20190C8()
{
  return MEMORY[0x1E0DA2828]();
}

uint64_t sub_1C20190D4()
{
  return MEMORY[0x1E0DA2830]();
}

uint64_t sub_1C20190E0()
{
  return MEMORY[0x1E0DA2838]();
}

uint64_t sub_1C20190EC()
{
  return MEMORY[0x1E0DA2850]();
}

uint64_t sub_1C20190F8()
{
  return MEMORY[0x1E0DA2858]();
}

uint64_t sub_1C2019104()
{
  return MEMORY[0x1E0DA2860]();
}

uint64_t sub_1C2019110()
{
  return MEMORY[0x1E0DA2868]();
}

uint64_t sub_1C201911C()
{
  return MEMORY[0x1E0DA2870]();
}

uint64_t sub_1C2019128()
{
  return MEMORY[0x1E0DA2878]();
}

uint64_t sub_1C2019134()
{
  return MEMORY[0x1E0DA2880]();
}

uint64_t sub_1C2019140()
{
  return MEMORY[0x1E0DA2888]();
}

uint64_t sub_1C201914C()
{
  return MEMORY[0x1E0DA2898]();
}

uint64_t sub_1C2019158()
{
  return MEMORY[0x1E0DA28A0]();
}

uint64_t sub_1C2019164()
{
  return MEMORY[0x1E0DA28A8]();
}

uint64_t sub_1C2019170()
{
  return MEMORY[0x1E0DA28B8]();
}

uint64_t sub_1C201917C()
{
  return MEMORY[0x1E0DA28C0]();
}

uint64_t sub_1C2019188()
{
  return MEMORY[0x1E0DA28D0]();
}

uint64_t sub_1C2019194()
{
  return MEMORY[0x1E0DA28D8]();
}

uint64_t sub_1C20191A0()
{
  return MEMORY[0x1E0DA28E8]();
}

uint64_t sub_1C20191AC()
{
  return MEMORY[0x1E0DA28F0]();
}

uint64_t sub_1C20191B8()
{
  return MEMORY[0x1E0DA28F8]();
}

uint64_t sub_1C20191C4()
{
  return MEMORY[0x1E0DA2900]();
}

uint64_t sub_1C20191D0()
{
  return MEMORY[0x1E0DA2930]();
}

uint64_t sub_1C20191DC()
{
  return MEMORY[0x1E0DA2938]();
}

uint64_t sub_1C20191E8()
{
  return MEMORY[0x1E0DA2948]();
}

uint64_t sub_1C20191F4()
{
  return MEMORY[0x1E0DA2950]();
}

uint64_t sub_1C2019200()
{
  return MEMORY[0x1E0DA2958]();
}

uint64_t sub_1C201920C()
{
  return MEMORY[0x1E0DA2960]();
}

uint64_t sub_1C2019218()
{
  return MEMORY[0x1E0DA2970]();
}

uint64_t sub_1C2019224()
{
  return MEMORY[0x1E0DA2978]();
}

uint64_t sub_1C2019230()
{
  return MEMORY[0x1E0DA2988]();
}

uint64_t sub_1C201923C()
{
  return MEMORY[0x1E0DA2990]();
}

uint64_t sub_1C2019248()
{
  return MEMORY[0x1E0DA2998]();
}

uint64_t sub_1C2019254()
{
  return MEMORY[0x1E0DA2B20]();
}

uint64_t sub_1C2019260()
{
  return MEMORY[0x1E0DA2B28]();
}

uint64_t sub_1C201926C()
{
  return MEMORY[0x1E0DA2B30]();
}

uint64_t sub_1C2019278()
{
  return MEMORY[0x1E0DA2B38]();
}

uint64_t sub_1C2019284()
{
  return MEMORY[0x1E0DA2B40]();
}

uint64_t sub_1C2019290()
{
  return MEMORY[0x1E0DA2B48]();
}

uint64_t sub_1C201929C()
{
  return MEMORY[0x1E0DA2B50]();
}

uint64_t sub_1C20192A8()
{
  return MEMORY[0x1E0DA2B58]();
}

uint64_t sub_1C20192B4()
{
  return MEMORY[0x1E0DA2B60]();
}

uint64_t sub_1C20192C0()
{
  return MEMORY[0x1E0DA2B68]();
}

uint64_t sub_1C20192CC()
{
  return MEMORY[0x1E0DA2B70]();
}

uint64_t sub_1C20192D8()
{
  return MEMORY[0x1E0DA2B78]();
}

uint64_t sub_1C20192E4()
{
  return MEMORY[0x1E0DA2B80]();
}

uint64_t sub_1C20192F0()
{
  return MEMORY[0x1E0DA2B88]();
}

uint64_t sub_1C20192FC()
{
  return MEMORY[0x1E0DA2B98]();
}

uint64_t sub_1C2019308()
{
  return MEMORY[0x1E0D3E5C0]();
}

uint64_t sub_1C2019314()
{
  return MEMORY[0x1E0D3E5C8]();
}

uint64_t sub_1C2019320()
{
  return MEMORY[0x1E0D3E5E0]();
}

uint64_t sub_1C201932C()
{
  return MEMORY[0x1E0D3E5E8]();
}

uint64_t sub_1C2019338()
{
  return MEMORY[0x1E0D3E5F8]();
}

uint64_t sub_1C2019344()
{
  return MEMORY[0x1E0D3E600]();
}

uint64_t sub_1C2019350()
{
  return MEMORY[0x1E0D3E620]();
}

uint64_t sub_1C201935C()
{
  return MEMORY[0x1E0D3E628]();
}

uint64_t sub_1C2019368()
{
  return MEMORY[0x1E0D3E638]();
}

uint64_t sub_1C2019374()
{
  return MEMORY[0x1E0D3E640]();
}

uint64_t sub_1C2019380()
{
  return MEMORY[0x1E0D3E660]();
}

uint64_t sub_1C201938C()
{
  return MEMORY[0x1E0D3E668]();
}

uint64_t sub_1C2019398()
{
  return MEMORY[0x1E0D3E678]();
}

uint64_t sub_1C20193A4()
{
  return MEMORY[0x1E0D3E680]();
}

uint64_t sub_1C20193B0()
{
  return MEMORY[0x1E0D3E6A8]();
}

uint64_t sub_1C20193BC()
{
  return MEMORY[0x1E0D3E6B0]();
}

uint64_t sub_1C20193C8()
{
  return MEMORY[0x1E0D3E6C0]();
}

uint64_t sub_1C20193D4()
{
  return MEMORY[0x1E0D3E6C8]();
}

uint64_t sub_1C20193E0()
{
  return MEMORY[0x1E0D3E720]();
}

uint64_t sub_1C20193EC()
{
  return MEMORY[0x1E0D3E728]();
}

uint64_t sub_1C20193F8()
{
  return MEMORY[0x1E0D3E738]();
}

uint64_t sub_1C2019404()
{
  return MEMORY[0x1E0D3E740]();
}

uint64_t sub_1C2019410()
{
  return MEMORY[0x1E0D3E758]();
}

uint64_t sub_1C201941C()
{
  return MEMORY[0x1E0D3E760]();
}

uint64_t sub_1C2019428()
{
  return MEMORY[0x1E0D3E768]();
}

uint64_t sub_1C2019434()
{
  return MEMORY[0x1E0D3E770]();
}

uint64_t sub_1C2019440()
{
  return MEMORY[0x1E0D3E780]();
}

uint64_t sub_1C201944C()
{
  return MEMORY[0x1E0D3E788]();
}

uint64_t sub_1C2019458()
{
  return MEMORY[0x1E0D3E828]();
}

uint64_t sub_1C2019464()
{
  return MEMORY[0x1E0D3E988]();
}

uint64_t _s12SiriNLUTypes0A40_Nlu_Internal_NlRouter_OverrideMatchRuleV16PlannerPromptingVAEycfC_0()
{
  return MEMORY[0x1E0D3E990]();
}

uint64_t sub_1C201947C()
{
  return MEMORY[0x1E0D3E998]();
}

uint64_t sub_1C2019488()
{
  return MEMORY[0x1E0D3EA48]();
}

uint64_t sub_1C2019494()
{
  return MEMORY[0x1E0D3EA50]();
}

uint64_t sub_1C20194A0()
{
  return MEMORY[0x1E0D3EA60]();
}

uint64_t sub_1C20194AC()
{
  return MEMORY[0x1E0D3EA68]();
}

uint64_t sub_1C20194B8()
{
  return MEMORY[0x1E0D3EA80]();
}

uint64_t sub_1C20194C4()
{
  return MEMORY[0x1E0D3EA90]();
}

uint64_t sub_1C20194D0()
{
  return MEMORY[0x1E0D3EA98]();
}

uint64_t sub_1C20194DC()
{
  return MEMORY[0x1E0D3EAB8]();
}

uint64_t sub_1C20194E8()
{
  return MEMORY[0x1E0D3EAC0]();
}

uint64_t sub_1C20194F4()
{
  return MEMORY[0x1E0D3EAC8]();
}

uint64_t sub_1C2019500()
{
  return MEMORY[0x1E0D3EAD0]();
}

uint64_t sub_1C201950C()
{
  return MEMORY[0x1E0D3EAD8]();
}

uint64_t sub_1C2019518()
{
  return MEMORY[0x1E0D3EAE0]();
}

uint64_t sub_1C2019524()
{
  return MEMORY[0x1E0D3EAF8]();
}

uint64_t sub_1C2019530()
{
  return MEMORY[0x1E0D3EB10]();
}

uint64_t sub_1C201953C()
{
  return MEMORY[0x1E0D3EB20]();
}

uint64_t sub_1C2019548()
{
  return MEMORY[0x1E0D3EB30]();
}

uint64_t sub_1C2019554()
{
  return MEMORY[0x1E0D3EB58]();
}

uint64_t sub_1C2019560()
{
  return MEMORY[0x1E0D3EB60]();
}

uint64_t sub_1C201956C()
{
  return MEMORY[0x1E0D3EB70]();
}

uint64_t sub_1C2019578()
{
  return MEMORY[0x1E0D3EB88]();
}

uint64_t sub_1C2019584()
{
  return MEMORY[0x1E0D3EB90]();
}

uint64_t sub_1C2019590()
{
  return MEMORY[0x1E0D3EB98]();
}

uint64_t sub_1C201959C()
{
  return MEMORY[0x1E0D3EBA8]();
}

uint64_t sub_1C20195A8()
{
  return MEMORY[0x1E0D3EBC0]();
}

uint64_t sub_1C20195B4()
{
  return MEMORY[0x1E0D3EBD8]();
}

uint64_t sub_1C20195C0()
{
  return MEMORY[0x1E0D3EC08]();
}

uint64_t sub_1C20195CC()
{
  return MEMORY[0x1E0D3EC38]();
}

uint64_t sub_1C20195D8()
{
  return MEMORY[0x1E0D3EC48]();
}

uint64_t sub_1C20195E4()
{
  return MEMORY[0x1E0D3EC50]();
}

uint64_t sub_1C20195F0()
{
  return MEMORY[0x1E0D3EC58]();
}

uint64_t sub_1C20195FC()
{
  return MEMORY[0x1E0D3EC60]();
}

uint64_t sub_1C2019608()
{
  return MEMORY[0x1E0D3EC68]();
}

uint64_t sub_1C2019614()
{
  return MEMORY[0x1E0D3EC80]();
}

uint64_t sub_1C2019620()
{
  return MEMORY[0x1E0D3ECF0]();
}

uint64_t sub_1C201962C()
{
  return MEMORY[0x1E0D3ECF8]();
}

uint64_t sub_1C2019638()
{
  return MEMORY[0x1E0D3ED00]();
}

uint64_t sub_1C2019644()
{
  return MEMORY[0x1E0D3ED18]();
}

uint64_t sub_1C2019650()
{
  return MEMORY[0x1E0D3ED28]();
}

uint64_t sub_1C201965C()
{
  return MEMORY[0x1E0D3ED30]();
}

uint64_t sub_1C2019668()
{
  return MEMORY[0x1E0D3ED38]();
}

uint64_t sub_1C2019674()
{
  return MEMORY[0x1E0D3ED48]();
}

uint64_t sub_1C2019680()
{
  return MEMORY[0x1E0D3ED50]();
}

uint64_t sub_1C201968C()
{
  return MEMORY[0x1E0D3ED58]();
}

uint64_t sub_1C2019698()
{
  return MEMORY[0x1E0D3ED68]();
}

uint64_t sub_1C20196A4()
{
  return MEMORY[0x1E0D3ED70]();
}

uint64_t sub_1C20196B0()
{
  return MEMORY[0x1E0D3ED78]();
}

uint64_t sub_1C20196BC()
{
  return MEMORY[0x1E0D3ED80]();
}

uint64_t sub_1C20196C8()
{
  return MEMORY[0x1E0D3ED88]();
}

uint64_t sub_1C20196D4()
{
  return MEMORY[0x1E0D3ED98]();
}

uint64_t sub_1C20196E0()
{
  return MEMORY[0x1E0D3EDA8]();
}

uint64_t sub_1C20196EC()
{
  return MEMORY[0x1E0D3EDB0]();
}

uint64_t sub_1C20196F8()
{
  return MEMORY[0x1E0D3EDB8]();
}

uint64_t sub_1C2019704()
{
  return MEMORY[0x1E0D3EDC0]();
}

uint64_t sub_1C2019710()
{
  return MEMORY[0x1E0D3EDC8]();
}

uint64_t sub_1C201971C()
{
  return MEMORY[0x1E0D3EDD0]();
}

uint64_t sub_1C2019728()
{
  return MEMORY[0x1E0D3EDD8]();
}

uint64_t sub_1C2019734()
{
  return MEMORY[0x1E0D3EDE0]();
}

uint64_t sub_1C2019740()
{
  return MEMORY[0x1E0D3EDE8]();
}

uint64_t sub_1C201974C()
{
  return MEMORY[0x1E0D3EDF0]();
}

uint64_t sub_1C2019758()
{
  return MEMORY[0x1E0D3EDF8]();
}

uint64_t sub_1C2019764()
{
  return MEMORY[0x1E0D3EE00]();
}

uint64_t sub_1C2019770()
{
  return MEMORY[0x1E0D3EE08]();
}

uint64_t sub_1C201977C()
{
  return MEMORY[0x1E0D3EE10]();
}

uint64_t sub_1C2019788()
{
  return MEMORY[0x1E0D3EE18]();
}

uint64_t sub_1C2019794()
{
  return MEMORY[0x1E0D3EE20]();
}

uint64_t sub_1C20197A0()
{
  return MEMORY[0x1E0D3EE28]();
}

uint64_t sub_1C20197AC()
{
  return MEMORY[0x1E0D3EE30]();
}

uint64_t sub_1C20197B8()
{
  return MEMORY[0x1E0D3EE38]();
}

uint64_t sub_1C20197C4()
{
  return MEMORY[0x1E0D3EE40]();
}

uint64_t sub_1C20197D0()
{
  return MEMORY[0x1E0D3EE48]();
}

uint64_t sub_1C20197DC()
{
  return MEMORY[0x1E0D3EE50]();
}

uint64_t sub_1C20197E8()
{
  return MEMORY[0x1E0D3EE58]();
}

uint64_t sub_1C20197F4()
{
  return MEMORY[0x1E0D3EE60]();
}

uint64_t sub_1C2019800()
{
  return MEMORY[0x1E0D3EE68]();
}

uint64_t sub_1C201980C()
{
  return MEMORY[0x1E0D3EE70]();
}

uint64_t sub_1C2019818()
{
  return MEMORY[0x1E0D3EE78]();
}

uint64_t sub_1C2019824()
{
  return MEMORY[0x1E0D3EE80]();
}

uint64_t sub_1C2019830()
{
  return MEMORY[0x1E0D3EE88]();
}

uint64_t sub_1C201983C()
{
  return MEMORY[0x1E0D3EE90]();
}

uint64_t sub_1C2019848()
{
  return MEMORY[0x1E0D3EE98]();
}

uint64_t sub_1C2019854()
{
  return MEMORY[0x1E0D3EEA0]();
}

uint64_t sub_1C2019860()
{
  return MEMORY[0x1E0D3EEA8]();
}

uint64_t sub_1C201986C()
{
  return MEMORY[0x1E0D3EEB0]();
}

uint64_t sub_1C2019878()
{
  return MEMORY[0x1E0D3EEB8]();
}

uint64_t sub_1C2019884()
{
  return MEMORY[0x1E0D3EEC0]();
}

uint64_t sub_1C2019890()
{
  return MEMORY[0x1E0D3EEC8]();
}

uint64_t sub_1C201989C()
{
  return MEMORY[0x1E0D3EED0]();
}

uint64_t sub_1C20198A8()
{
  return MEMORY[0x1E0D3EED8]();
}

uint64_t sub_1C20198B4()
{
  return MEMORY[0x1E0D3EEE0]();
}

uint64_t sub_1C20198C0()
{
  return MEMORY[0x1E0D3EEE8]();
}

uint64_t sub_1C20198CC()
{
  return MEMORY[0x1E0D3EEF0]();
}

uint64_t sub_1C20198D8()
{
  return MEMORY[0x1E0D3EEF8]();
}

uint64_t sub_1C20198E4()
{
  return MEMORY[0x1E0D3EF00]();
}

uint64_t sub_1C20198F0()
{
  return MEMORY[0x1E0D3EF28]();
}

uint64_t sub_1C20198FC()
{
  return MEMORY[0x1E0D3EF38]();
}

uint64_t sub_1C2019908()
{
  return MEMORY[0x1E0D3EF40]();
}

uint64_t sub_1C2019914()
{
  return MEMORY[0x1E0D3EF48]();
}

uint64_t sub_1C2019920()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1C201992C()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1C2019938()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1C2019944()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1C2019950()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1C201995C()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t sub_1C2019968()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1C2019974()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1C2019980()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1C201998C()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1C2019998()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1C20199A4()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1C20199B0()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1C20199BC()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1C20199C8()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1C20199D4()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1C20199E0()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1C20199EC()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1C20199F8()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1C2019A04()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1C2019A10()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1C2019A1C()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1C2019A28()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1C2019A34()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1C2019A40()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1C2019A4C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1C2019A58()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1C2019A64()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C2019A70()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteFixed32Field()
{
  return MEMORY[0x1E0D82C40]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1E0D82C50]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBHashBytes()
{
  return MEMORY[0x1E0D82CD0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedFloatAdd()
{
  return MEMORY[0x1E0D82DA0]();
}

uint64_t PBRepeatedFloatClear()
{
  return MEMORY[0x1E0D82DA8]();
}

uint64_t PBRepeatedFloatCopy()
{
  return MEMORY[0x1E0D82DB0]();
}

uint64_t PBRepeatedFloatHash()
{
  return MEMORY[0x1E0D82DB8]();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return MEMORY[0x1E0D82DC0]();
}

uint64_t PBRepeatedFloatNSArray()
{
  return MEMORY[0x1E0D82DC8]();
}

uint64_t PBRepeatedFloatSet()
{
  return MEMORY[0x1E0D82DD0]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1E0D82DD8]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1E0D82DE0]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1E0D82DE8]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1E0D82DF0]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1E0D82DF8]();
}

uint64_t PBRepeatedInt32Set()
{
  return MEMORY[0x1E0D82E08]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x1E0D82E48]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x1E0D82E50]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x1E0D82E58]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x1E0D82E60]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x1E0D82E68]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x1E0D82E70]();
}

uint64_t PBRepeatedUInt32Set()
{
  return MEMORY[0x1E0D82E78]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t PB::TextFormatter::beginObject(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x1E0D82EC0](this, a2);
}

uint64_t PB::TextFormatter::format()
{
  return MEMORY[0x1E0D82EC8]();
}

{
  return MEMORY[0x1E0D82ED0]();
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x1E0D82ED8](this, a2);
}

{
  return MEMORY[0x1E0D82EF0](this, a2);
}

{
  return MEMORY[0x1E0D82EF8](this, a2);
}

{
  return MEMORY[0x1E0D82F00](this, a2);
}

{
  return MEMORY[0x1E0D82F08](this, a2);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, double a3)
{
  return MEMORY[0x1E0D82EE0](this, a2, a3);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, float a3)
{
  return MEMORY[0x1E0D82EE8](this, a2, a3);
}

uint64_t PB::TextFormatter::endObject(PB::TextFormatter *this)
{
  return MEMORY[0x1E0D82F10](this);
}

void PB::Base::~Base(PB::Base *this)
{
  MEMORY[0x1E0D82F18](this);
}

uint64_t PB::Data::Data()
{
  return MEMORY[0x1E0D82F30]();
}

uint64_t PB::Reader::recallMark()
{
  return MEMORY[0x1E0D82F38]();
}

uint64_t PB::Reader::read()
{
  return MEMORY[0x1E0D82F40]();
}

{
  return MEMORY[0x1E0D82F48]();
}

uint64_t PB::Reader::skip(PB::Reader *this)
{
  return MEMORY[0x1E0D82F58](this);
}

uint64_t PB::Reader::placeMark()
{
  return MEMORY[0x1E0D82F60]();
}

uint64_t PB::Reader::Reader(PB::Reader *this, const unsigned __int8 *a2)
{
  return MEMORY[0x1E0D82F68](this, a2);
}

uint64_t PB::Writer::writeFixed(PB::Writer *this)
{
  return MEMORY[0x1E0D82F78](this);
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this)
{
  return MEMORY[0x1E0D82F88](this);
}

{
  return MEMORY[0x1E0D82F90](this);
}

{
  return MEMORY[0x1E0D82F98](this);
}

{
  return MEMORY[0x1E0D82FA0](this);
}

uint64_t PB::Writer::writeSubmessage(PB::Writer *this, const PB::Base *a2)
{
  return MEMORY[0x1E0D82FA8](this, a2);
}

uint64_t PB::Writer::write()
{
  return MEMORY[0x1E0D82FB0]();
}

{
  return MEMORY[0x1E0D82FB8]();
}

uint64_t PB::Writer::write(PB::Writer *this)
{
  return MEMORY[0x1E0D82FC8](this);
}

uint64_t PB::Writer::write(PB::Writer *this, double a2)
{
  return MEMORY[0x1E0D82FD0](this, a2);
}

uint64_t PB::Writer::write(PB::Writer *this, float a2)
{
  return MEMORY[0x1E0D82FD8](this, a2);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x1E0D82FF0](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
  MEMORY[0x1E0D82FF8](this);
}

uint64_t siri::ontology::UsoGraphNode::setSuccessor()
{
  return MEMORY[0x1E0DA2E18]();
}

uint64_t siri::ontology::UsoEntityNode::addEntitySpan()
{
  return MEMORY[0x1E0DA2E20]();
}

uint64_t siri::ontology::UsoEntityNode::addIdentifier()
{
  return MEMORY[0x1E0DA2E28]();
}

uint64_t siri::ontology::UsoEntityNode::addUtteranceAlignment()
{
  return MEMORY[0x1E0DA2E38]();
}

uint64_t siri::ontology::UsoEntitySpan::addAlternative()
{
  return MEMORY[0x1E0DA2E50]();
}

uint64_t siri::ontology::UsoEntitySpan::addSpanProperty()
{
  return MEMORY[0x1E0DA2E58]();
}

uint64_t siri::ontology::UsoVocabManager::createCustomEdgeName()
{
  return MEMORY[0x1E0DA2E60]();
}

uint64_t siri::ontology::UsoVocabManager::createCustomVerbName()
{
  return MEMORY[0x1E0DA2E68]();
}

uint64_t siri::ontology::UsoVocabManager::createCustomEntityName()
{
  return MEMORY[0x1E0DA2E70]();
}

uint64_t siri::ontology::OntologyBaseException::OntologyBaseException()
{
  return MEMORY[0x1E0DA2E78]();
}

uint64_t siri::ontology::UsoUtteranceAlignment::addSpan()
{
  return MEMORY[0x1E0DA2E80]();
}

uint64_t siri::ontology::getSharedUsoVocabManager(siri::ontology *this)
{
  return MEMORY[0x1E0DA2E88](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::primitive_String(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA2FF0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::primitive_Integer(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA3018](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Root(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x1E0DA34A0](this);
}

uint64_t siri::ontology::UsoGraph::createIntNode()
{
  return MEMORY[0x1E0DA34A8]();
}

uint64_t siri::ontology::UsoGraph::createTaskNode()
{
  return MEMORY[0x1E0DA34B0]();
}

uint64_t siri::ontology::UsoGraph::createEntityNode()
{
  return MEMORY[0x1E0DA34B8]();
}

uint64_t siri::ontology::UsoGraph::createStringNode()
{
  return MEMORY[0x1E0DA34C0]();
}

uint64_t siri::ontology::UsoGraph::createOperatorNode()
{
  return MEMORY[0x1E0DA34C8]();
}

uint64_t siri::ontology::UsoGraph::UsoGraph()
{
  return MEMORY[0x1E0DA34D0]();
}

{
  return MEMORY[0x1E0DA34D8]();
}

void siri::ontology::UsoGraph::~UsoGraph(siri::ontology::UsoGraph *this)
{
  MEMORY[0x1E0DA34E0](this);
}

uint64_t siri::ontology::operator==()
{
  return MEMORY[0x1E0DA34E8]();
}

uint64_t PB::Data::operator==()
{
  return MEMORY[0x1E0D83000]();
}

uint64_t siri::ontology::UsoEntityNode::getEntitySpans(siri::ontology::UsoEntityNode *this)
{
  return MEMORY[0x1E0DA34F8](this);
}

uint64_t siri::ontology::UsoEntityNode::getIdentifiers(siri::ontology::UsoEntityNode *this)
{
  return MEMORY[0x1E0DA3500](this);
}

uint64_t siri::ontology::UsoEntityNode::getUtteranceAlignment(siri::ontology::UsoEntityNode *this)
{
  return MEMORY[0x1E0DA3508](this);
}

uint64_t siri::ontology::UsoEntitySpan::getAlternatives(siri::ontology::UsoEntitySpan *this)
{
  return MEMORY[0x1E0DA3510](this);
}

uint64_t siri::ontology::UsoEntitySpan::getSpanProperties(siri::ontology::UsoEntitySpan *this)
{
  return MEMORY[0x1E0DA3518](this);
}

uint64_t siri::ontology::UsoVocabManager::getEdgeName(siri::ontology::UsoVocabManager *this)
{
  return MEMORY[0x1E0DA3528](this);
}

uint64_t siri::ontology::UsoVocabManager::getNodeName(siri::ontology::UsoVocabManager *this)
{
  return MEMORY[0x1E0DA3538](this);
}

uint64_t siri::ontology::UsoVocabManager::getVerbName(siri::ontology::UsoVocabManager *this)
{
  return MEMORY[0x1E0DA3548](this);
}

uint64_t siri::ontology::UsoUtteranceAlignment::getSpans(siri::ontology::UsoUtteranceAlignment *this)
{
  return MEMORY[0x1E0DA3550](this);
}

uint64_t siri::ontology::UsoGraph::prettyPrint()
{
  return MEMORY[0x1E0DA3558]();
}

uint64_t siri::ontology::UsoGraph::deepCopyToGraph()
{
  return MEMORY[0x1E0DA3578]();
}

uint64_t siri::ontology::UsoGraph::getEdges(siri::ontology::UsoGraph *this)
{
  return MEMORY[0x1E0DA3590](this);
}

uint64_t siri::ontology::UsoGraph::getNodes(siri::ontology::UsoGraph *this)
{
  return MEMORY[0x1E0DA3598](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4310](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4468](this, __pos, __s);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D60](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D80](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E7BA5DB0();
}

void operator delete(void *__p)
{
  off_1E7BA5DB8(__p);
}

uint64_t operator delete()
{
  return off_1E7BA5DC0();
}

uint64_t operator new[]()
{
  return off_1E7BA5DC8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E7BA5DD0(__sz);
}

uint64_t operator new()
{
  return off_1E7BA5DD8();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void __cxa_bad_cast(void)
{
  MEMORY[0x1E0DE5070]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1E0DE50E0](lpsrc, lpstype, lpdtype, s2d);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x1E0DEED68]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

