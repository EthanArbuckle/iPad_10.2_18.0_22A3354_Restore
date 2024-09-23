int set_fieldtype_arg(FIELDTYPE *a1, void *(__cdecl *const make_arg)(va_list *), void *(__cdecl *const copy_arg)(const void *), void (__cdecl *const free_arg)(void *))
{
  int v4;

  v4 = -2;
  if (a1 && make_arg)
  {
    v4 = 0;
    a1->status |= 2u;
    a1->makearg = make_arg;
    a1->copyarg = copy_arg;
    a1->freearg = free_arg;
  }
  *__error() = v4;
  return v4;
}

void *__cdecl field_arg(const FIELD *a1)
{
  const FIELD *v1;

  v1 = (const FIELD *)_nc_Default_Field;
  if (a1)
    v1 = a1;
  return v1->arg;
}

int set_field_fore(FIELD *a1, chtype a2)
{
  int v2;

  if ((_BYTE)a2)
    goto LABEL_2;
  if (!a1)
    a1 = (FIELD *)_nc_Default_Field;
  if (!a1)
  {
LABEL_2:
    v2 = -2;
  }
  else if (a1->fore == a2)
  {
    v2 = 0;
  }
  else
  {
    a1->fore = a2;
    v2 = _nc_Synchronize_Attributes((uint64_t)a1);
  }
  *__error() = v2;
  return v2;
}

chtype field_fore(const FIELD *a1)
{
  const FIELD *v1;

  v1 = (const FIELD *)_nc_Default_Field;
  if (a1)
    v1 = a1;
  return v1->fore & 0xFFFFFF00;
}

int set_field_back(FIELD *a1, chtype a2)
{
  int v2;

  if ((_BYTE)a2)
    goto LABEL_2;
  if (!a1)
    a1 = (FIELD *)_nc_Default_Field;
  if (!a1)
  {
LABEL_2:
    v2 = -2;
  }
  else if (a1->back == a2)
  {
    v2 = 0;
  }
  else
  {
    a1->back = a2;
    v2 = _nc_Synchronize_Attributes((uint64_t)a1);
  }
  *__error() = v2;
  return v2;
}

chtype field_back(const FIELD *a1)
{
  const FIELD *v1;

  v1 = (const FIELD *)_nc_Default_Field;
  if (a1)
    v1 = a1;
  return v1->back & 0xFFFFFF00;
}

int set_current_field(FORM *a1, FIELD *a2)
{
  int v2;
  void (__cdecl *fieldterm)(formnode *);
  int page;
  void (__cdecl *formterm)(formnode *);
  void (__cdecl *forminit)(formnode *);
  void (__cdecl *fieldinit)(formnode *);

  v2 = -2;
  if (a1 && a2)
  {
    if (a2->form != a1 || (~a2->opts & 3) != 0)
    {
      v2 = -12;
    }
    else if ((a1->status & 1) != 0)
    {
      if ((a1->status & 2) != 0)
      {
        v2 = -5;
      }
      else if (a1->current == a2)
      {
        v2 = 0;
      }
      else if (_nc_Internal_Validation((uint64_t)a1))
      {
        fieldterm = a1->fieldterm;
        if (fieldterm)
        {
          a1->status |= 2u;
          ((void (*)(FORM *))fieldterm)(a1);
          a1->status &= ~2u;
        }
        page = (unsigned __int16)a2->page;
        if (page == (unsigned __int16)a1->curpage)
        {
          v2 = _nc_Set_Current_Field((uint64_t)a1, (uint64_t)a2);
        }
        else
        {
          formterm = a1->formterm;
          if (formterm)
          {
            a1->status |= 2u;
            ((void (*)(FORM *))formterm)(a1);
            a1->status &= ~2u;
            LOWORD(page) = a2->page;
          }
          v2 = _nc_Set_Form_Page((uint64_t)a1, (__int16)page, (uint64_t)a2);
          forminit = a1->forminit;
          if (forminit)
          {
            a1->status |= 2u;
            ((void (*)(FORM *))forminit)(a1);
            a1->status &= ~2u;
          }
        }
        fieldinit = a1->fieldinit;
        if (fieldinit)
        {
          a1->status |= 2u;
          ((void (*)(FORM *))fieldinit)(a1);
          a1->status &= ~2u;
        }
        _nc_Refresh_Current_Field((uint64_t)a1);
      }
      else
      {
        v2 = -13;
      }
    }
    else
    {
      v2 = 0;
      a1->current = a2;
      a1->curpage = a2->page;
    }
  }
  *__error() = v2;
  return v2;
}

FIELD *__cdecl current_field(const FORM *a1)
{
  const FORM *v1;

  v1 = (const FORM *)_nc_Default_Form;
  if (a1)
    v1 = a1;
  return v1->current;
}

int field_index(const FIELD *a1)
{
  if (a1 && a1->form)
    return a1->index;
  else
    return -1;
}

_QWORD *_nc_Make_Argument(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  _QWORD *v4;

  if (a1 && (*(_WORD *)a1 & 2) != 0)
  {
    if ((*(_WORD *)a1 & 1) != 0)
    {
      v4 = malloc(0x10uLL);
      if (v4)
      {
        *v4 = _nc_Make_Argument(*(_QWORD *)(a1 + 16), a2, a3);
        v4[1] = _nc_Make_Argument(*(_QWORD *)(a1 + 24), a2, a3);
        return v4;
      }
    }
    else
    {
      v4 = (_QWORD *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a2);
      if (v4)
        return v4;
    }
    ++*a3;
    return v4;
  }
  return 0;
}

_QWORD *_nc_Copy_Argument(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  _QWORD *v4;
  uint64_t (*v7)(_QWORD *);
  _QWORD *v8;
  _QWORD *v9;

  if (!a1 || (*(_WORD *)a1 & 2) == 0)
    return 0;
  v4 = a2;
  if ((*(_WORD *)a1 & 1) != 0)
  {
    v8 = malloc(0x10uLL);
    if (v8)
    {
      v9 = v8;
      *v8 = _nc_Copy_Argument(a1, *v4, a3);
      v9[1] = _nc_Copy_Argument(a1, v4[1], a3);
      return v9;
    }
    v4 = 0;
LABEL_12:
    ++*a3;
    return v4;
  }
  v7 = *(uint64_t (**)(_QWORD *))(a1 + 40);
  if (v7)
  {
    v4 = (_QWORD *)v7(a2);
    if (!v4)
      goto LABEL_12;
  }
  return v4;
}

void _nc_Free_Argument(uint64_t a1, _QWORD *a2)
{
  void (*v4)(_QWORD *);

  if (a1 && (*(_WORD *)a1 & 2) != 0)
  {
    if ((*(_WORD *)a1 & 1) != 0)
    {
      if (a2)
      {
        _nc_Free_Argument(*(_QWORD *)(a1 + 16), *a2);
        _nc_Free_Argument(*(_QWORD *)(a1 + 24), a2[1]);
        free(a2);
      }
    }
    else
    {
      v4 = *(void (**)(_QWORD *))(a1 + 48);
      if (v4)
        v4(a2);
    }
  }
}

BOOL _nc_Copy_Type(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t *v3;
  _QWORD *v4;
  int v5;
  uint64_t v6;
  int v8;

  v8 = 0;
  v2 = *(_QWORD **)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v3 = (uint64_t *)(a1 + 88);
  v4 = _nc_Copy_Argument(*(_QWORD *)(a2 + 88), v2, &v8);
  v3[1] = (uint64_t)v4;
  v5 = v8;
  v6 = *v3;
  if (v8)
  {
    _nc_Free_Argument(v6, v4);
    *v3 = 0;
    v3[1] = 0;
  }
  else if (v6)
  {
    ++*(_QWORD *)(v6 + 8);
  }
  return v5 == 0;
}

void _nc_Free_Type(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 88);
  if (v2)
  {
    --*(_QWORD *)(v2 + 8);
    _nc_Free_Argument(v2, *(_QWORD **)(a1 + 96));
  }
}

FIELD *__cdecl new_field(int a1, int a2, int a3, int a4, int a5, int a6)
{
  int v6;
  __int16 v10;
  __int16 v11;
  _OWORD *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;

  v6 = -2;
  if (a1 < 1)
    goto LABEL_18;
  if (a2 < 1)
    goto LABEL_18;
  v10 = a4;
  v11 = a3;
  if ((a4 | a3 | a5 | a6) < 0)
    goto LABEL_18;
  v13 = malloc(0x88uLL);
  if (!v13)
  {
LABEL_17:
    v6 = -1;
LABEL_18:
    v14 = 0;
    *__error() = v6;
    return (FIELD *)v14;
  }
  v14 = (uint64_t)v13;
  v15 = xmmword_2553E3D98;
  v13[6] = xmmword_2553E3D88;
  v13[7] = v15;
  *((_QWORD *)v13 + 16) = qword_2553E3DA8;
  v16 = xmmword_2553E3D58;
  v13[2] = xmmword_2553E3D48;
  v13[3] = v16;
  v17 = xmmword_2553E3D78;
  v13[4] = xmmword_2553E3D68;
  v13[5] = v17;
  v18 = xmmword_2553E3D38;
  *v13 = xmmword_2553E3D28;
  v13[1] = v18;
  *((_WORD *)v13 + 1) = a1;
  *((_WORD *)v13 + 2) = a2;
  *((_DWORD *)v13 + 3) = a5 + a1;
  *((_DWORD *)v13 + 4) = a2;
  *((_WORD *)v13 + 3) = v11;
  *((_WORD *)v13 + 4) = v10;
  *((_DWORD *)v13 + 6) = a5;
  *((_WORD *)v13 + 14) = a6;
  *((_QWORD *)v13 + 9) = v13;
  *((_QWORD *)v13 + 16) = newpad(1, (a5 + a1) * a2 + 1);
  *(_QWORD *)(v14 + 120) = calloc((a6 + 1), 8uLL);
  if (!_nc_Copy_Type(v14, (uint64_t)&xmmword_2553E3D28)
    || (v19 = *(int *)(v14 + 16) * (uint64_t)*(int *)(v14 + 12),
        v20 = v19 + 1,
        v21 = *(__int16 *)(v14 + 28),
        v22 = malloc(28 * (v20 + v20 * v21)),
        (*(_QWORD *)(v14 + 104) = v22) == 0))
  {
    free_field((FIELD *)v14);
    goto LABEL_17;
  }
  if ((v21 & 0x80000000) == 0)
  {
    v23 = 0;
    v24 = 0;
    do
    {
      v25 = *(_QWORD *)(v14 + 104);
      if ((int)v19 < 1)
      {
        v28 = 0;
      }
      else
      {
        v26 = (_OWORD *)(v25 + v23);
        v27 = v19;
        do
        {
          *v26 = xmmword_21E536A50;
          *(_OWORD *)((char *)v26 + 12) = *(__int128 *)((char *)&xmmword_21E536A50 + 12);
          v26 = (_OWORD *)((char *)v26 + 28);
          --v27;
        }
        while (v27);
        v28 = v19;
      }
      v29 = v25 + 28 * v24 * v20 + 28 * v28;
      *(_QWORD *)v29 = 0;
      *(_QWORD *)(v29 + 8) = 0;
      *(_DWORD *)(v29 + 24) = 0;
      *(_QWORD *)(v29 + 16) = 0;
      v23 += 28 * (int)v19 + 28;
    }
    while (v24++ < *(__int16 *)(v14 + 28));
  }
  return (FIELD *)v14;
}

int free_field(FIELD *a1)
{
  int v2;
  FIELD *link;
  FIELD *v4;
  FIELD *v5;
  FIELD_CELL *buf;
  typenode *type;
  void *v8;
  int nbuf;
  uint64_t v10;
  void *v11;

  if (a1)
  {
    if (a1->form)
    {
      v2 = -4;
    }
    else
    {
      link = a1->link;
      if (link == a1)
      {
        buf = a1->buf;
        if (buf)
          free(buf);
      }
      else
      {
        v4 = a1;
        do
        {
          v5 = v4;
          v4 = v4->link;
        }
        while (v4 != a1);
        v5->link = link;
      }
      type = a1->type;
      if (type)
      {
        --type->ref;
        _nc_Free_Argument((uint64_t)type, (_QWORD *)a1->arg);
      }
      v8 = *(void **)&a1[1].status;
      if (v8)
      {
        nbuf = a1->nbuf;
        if ((nbuf & 0x80000000) == 0)
        {
          v10 = 0;
          do
          {
            v11 = *(void **)(*(_QWORD *)&a1[1].status + 8 * v10);
            if (v11)
            {
              free(v11);
              LOWORD(nbuf) = a1->nbuf;
            }
          }
          while (v10++ < (__int16)nbuf);
          v8 = *(void **)&a1[1].status;
        }
        free(v8);
        delwin(*(WINDOW **)&a1[1].fcol);
      }
      free(a1);
      v2 = 0;
    }
  }
  else
  {
    v2 = -2;
  }
  *__error() = v2;
  return v2;
}

FIELD *__cdecl dup_field(FIELD *a1, int a2, int a3)
{
  int v3;
  __int16 v4;
  __int16 v5;
  char *v7;
  FIELD *v8;
  __int128 *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  size_t v16;
  FIELD_CELL *v17;
  uint64_t v18;
  _OWORD *v19;
  __int128 *v20;
  __int128 v21;

  v3 = -2;
  if (!a1)
    goto LABEL_12;
  v4 = a3;
  v5 = a2;
  if ((a3 | a2) < 0)
    goto LABEL_12;
  v7 = (char *)malloc(0x88uLL);
  if (!v7)
  {
LABEL_11:
    v3 = -1;
LABEL_12:
    v8 = 0;
    *__error() = v3;
    return v8;
  }
  v8 = (FIELD *)v7;
  v9 = _nc_Default_Field;
  *(_OWORD *)v7 = *_nc_Default_Field;
  v10 = v9[1];
  v11 = v9[2];
  v12 = v9[3];
  *((_OWORD *)v7 + 4) = v9[4];
  v13 = v9[5];
  v14 = *((_QWORD *)v9 + 16);
  v15 = v9[7];
  *((_OWORD *)v7 + 6) = v9[6];
  *((_OWORD *)v7 + 7) = v15;
  *((_OWORD *)v7 + 2) = v11;
  *((_OWORD *)v7 + 3) = v12;
  *((_OWORD *)v7 + 1) = v10;
  *((_QWORD *)v7 + 16) = v14;
  *((_OWORD *)v7 + 5) = v13;
  *((_WORD *)v7 + 3) = v5;
  *((_WORD *)v7 + 4) = v4;
  *((_QWORD *)v7 + 9) = v7;
  *(_DWORD *)(v7 + 2) = *(_DWORD *)&a1->rows;
  *(_OWORD *)(v7 + 12) = *(_OWORD *)&a1->drows;
  *((_DWORD *)v7 + 7) = *(_DWORD *)&a1->nbuf;
  *(_OWORD *)(v7 + 36) = *(_OWORD *)&a1->pad;
  *((_QWORD *)v7 + 14) = a1->usrptr;
  if (!_nc_Copy_Type((uint64_t)v7, (uint64_t)a1)
    || (v16 = 28 * (v8->nbuf + 1 + (v8->nbuf + 1) * v8->dcols * (uint64_t)v8->drows),
        v17 = (FIELD_CELL *)malloc(v16),
        (v8->buf = v17) == 0))
  {
    free_field(v8);
    goto LABEL_11;
  }
  if (v16)
  {
    v18 = 0;
    do
    {
      v19 = (_OWORD *)((char *)v8->buf + v18);
      v20 = (__int128 *)((char *)a1->buf + v18);
      v21 = *v20;
      *(_OWORD *)((char *)v19 + 12) = *(__int128 *)((char *)v20 + 12);
      *v19 = v21;
      v18 += 28;
      --v16;
    }
    while (v16);
  }
  return v8;
}

int set_fieldtype_choice(FIELDTYPE *a1, BOOL (__cdecl *const next_choice)(FIELD *, const void *), BOOL (__cdecl *const prev_choice)(FIELD *, const void *))
{
  int v3;

  v3 = -2;
  if (a1 && next_choice && prev_choice)
  {
    v3 = 0;
    a1->status |= 4u;
    a1->next = next_choice;
    a1->prev = prev_choice;
  }
  *__error() = v3;
  return v3;
}

FIELDTYPE *__cdecl link_fieldtype(FIELDTYPE *a1, FIELDTYPE *a2)
{
  FIELDTYPE *result;
  __int128 *v5;
  __int128 v6;
  __int128 v7;
  unsigned __int16 status;
  unsigned __int16 v9;
  unsigned __int16 v10;
  int *v11;
  int v12;

  if (!a1 || !a2)
  {
    v11 = __error();
    result = 0;
    v12 = -2;
LABEL_13:
    *v11 = v12;
    return result;
  }
  result = (FIELDTYPE *)malloc(0x58uLL);
  if (!result)
  {
    v11 = __error();
    result = 0;
    v12 = -1;
    goto LABEL_13;
  }
  v5 = _nc_Default_FieldType;
  v6 = _nc_Default_FieldType[3];
  *(_OWORD *)&result->makearg = _nc_Default_FieldType[2];
  *(_OWORD *)&result->freearg = v6;
  *(_OWORD *)&result->ccheck = v5[4];
  result->prev = (BOOL (__cdecl *)(FIELD *, const void *))*((_QWORD *)v5 + 10);
  v7 = v5[1];
  *(_OWORD *)&result->status = *v5;
  *(_OWORD *)&result->left = v7;
  status = result->status;
  v9 = result->status | 1;
  result->status = v9;
  v10 = a1->status;
  if ((a1->status & 2) != 0 || (a2->status & 2) != 0)
  {
    v9 = status | 3;
    result->status = status | 3;
  }
  if ((v10 & 4) != 0 || (a2->status & 4) != 0)
    result->status = v9 | 4;
  result->left = a1;
  result->right = a2;
  ++a1->ref;
  ++a2->ref;
  return result;
}

int field_info(const FIELD *a1, int *a2, int *a3, int *a4, int *a5, int *a6, int *a7)
{
  int v7;

  if (a1)
  {
    if (a2)
      *a2 = a1->rows;
    if (a3)
      *a3 = a1->cols;
    if (a4)
      *a4 = a1->frow;
    if (a5)
      *a5 = a1->fcol;
    if (a6)
      *a6 = a1->nrow;
    v7 = 0;
    if (a7)
      *a7 = a1->nbuf;
  }
  else
  {
    v7 = -2;
  }
  *__error() = v7;
  return v7;
}

int dynamic_field_info(const FIELD *a1, int *a2, int *a3, int *a4)
{
  int v4;

  if (a1)
  {
    if (a2)
      *a2 = a1->drows;
    if (a3)
      *a3 = a1->dcols;
    v4 = 0;
    if (a4)
      *a4 = a1->maxgrow;
  }
  else
  {
    v4 = -2;
  }
  *__error() = v4;
  return v4;
}

int set_field_just(FIELD *a1, int a2)
{
  int v2;

  if (a2 > 3)
  {
    v2 = -2;
  }
  else
  {
    if (!a1)
      a1 = (FIELD *)_nc_Default_Field;
    if (a1->just == a2)
    {
      v2 = 0;
    }
    else
    {
      a1->just = a2;
      v2 = _nc_Synchronize_Attributes((uint64_t)a1);
    }
  }
  *__error() = v2;
  return v2;
}

int field_just(const FIELD *a1)
{
  const FIELD *v1;

  v1 = (const FIELD *)_nc_Default_Field;
  if (a1)
    v1 = a1;
  return v1->just;
}

FIELD *__cdecl link_field(FIELD *a1, int a2, int a3)
{
  int v3;
  __int16 v4;
  __int16 v5;
  char *v7;
  FIELD *v8;
  __int128 *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;

  v3 = -2;
  if (!a1)
    goto LABEL_7;
  v4 = a3;
  v5 = a2;
  if ((a3 | a2) < 0)
    goto LABEL_7;
  v7 = (char *)malloc(0x88uLL);
  if (!v7)
  {
LABEL_6:
    v3 = -1;
LABEL_7:
    v8 = 0;
    *__error() = v3;
    return v8;
  }
  v8 = (FIELD *)v7;
  v9 = _nc_Default_Field;
  *(_OWORD *)v7 = *_nc_Default_Field;
  v11 = v9[1];
  v10 = v9[2];
  v12 = v9[4];
  *((_OWORD *)v7 + 3) = v9[3];
  *((_OWORD *)v7 + 4) = v12;
  *((_OWORD *)v7 + 1) = v11;
  *((_OWORD *)v7 + 2) = v10;
  v13 = *((_QWORD *)v9 + 16);
  v14 = v9[5];
  v15 = v9[7];
  *((_OWORD *)v7 + 6) = v9[6];
  *((_OWORD *)v7 + 7) = v15;
  *((_QWORD *)v7 + 16) = v13;
  *((_OWORD *)v7 + 5) = v14;
  *((_WORD *)v7 + 3) = v5;
  *((_WORD *)v7 + 4) = v4;
  *((_QWORD *)v7 + 9) = a1->link;
  a1->link = (fieldnode *)v7;
  *(_DWORD *)(v7 + 2) = *(_DWORD *)&a1->rows;
  *((_DWORD *)v7 + 7) = *(_DWORD *)&a1->nbuf;
  *(_OWORD *)(v7 + 12) = *(_OWORD *)&a1->drows;
  *(_OWORD *)(v7 + 36) = *(_OWORD *)&a1->pad;
  *(_OWORD *)(v7 + 104) = *(_OWORD *)&a1->buf;
  if (!_nc_Copy_Type((uint64_t)v7, (uint64_t)a1))
  {
    free_field(v8);
    goto LABEL_6;
  }
  return v8;
}

int set_max_field(FIELD *a1, int a2)
{
  int v2;
  int v3;
  int dcols;
  unsigned __int16 status;
  int drows;

  v2 = -2;
  if (a1 && (a2 & 0x80000000) == 0)
  {
    v3 = a1->nrow + a1->rows;
    if (!a2 || (v3 != 1 ? (dcols = a1->drows) : (dcols = a1->dcols), dcols <= a2))
    {
      a1->maxgrow = a2;
      status = a1->status;
      a1->status &= ~8u;
      if ((a1->opts & 0x200) != 0 || a2 && (v3 != 1 ? (drows = a1->drows) : (drows = a1->dcols), drows >= a2))
      {
        v2 = 0;
      }
      else
      {
        v2 = 0;
        a1->status = status | 8;
      }
    }
  }
  *__error() = v2;
  return v2;
}

int move_field(FIELD *a1, int a2, int a3)
{
  int v3;

  v3 = -2;
  if (a1 && ((a3 | a2) & 0x80000000) == 0)
  {
    if (a1->form)
    {
      v3 = -4;
    }
    else
    {
      v3 = 0;
      a1->frow = a2;
      a1->fcol = a3;
    }
  }
  *__error() = v3;
  return v3;
}

FIELDTYPE *__cdecl new_fieldtype(BOOL (__cdecl *const field_check)(FIELD *, const void *), BOOL (__cdecl *const char_check)(int, const void *))
{
  FIELDTYPE *result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  int *v8;
  int v9;

  if ((unint64_t)field_check | (unint64_t)char_check)
  {
    result = (FIELDTYPE *)malloc(0x58uLL);
    if (result)
    {
      v5 = xmmword_2553E4148;
      v6 = xmmword_2553E4128;
      *(_OWORD *)&result->freearg = unk_2553E4138;
      *(_OWORD *)&result->ccheck = v5;
      result->prev = (BOOL (__cdecl *)(FIELD *, const void *))qword_2553E4158;
      v7 = unk_2553E4118;
      *(_OWORD *)&result->status = xmmword_2553E4108;
      *(_OWORD *)&result->left = v7;
      *(_OWORD *)&result->makearg = v6;
      result->fcheck = field_check;
      result->ccheck = char_check;
      return result;
    }
    v8 = __error();
    result = 0;
    v9 = -1;
  }
  else
  {
    v8 = __error();
    result = 0;
    v9 = -2;
  }
  *v8 = v9;
  return result;
}

int free_fieldtype(FIELDTYPE *a1)
{
  typenode *left;
  typenode *right;
  int v3;

  if (a1)
  {
    if (a1->ref || (a1->status & 8) != 0)
    {
      v3 = -4;
    }
    else
    {
      if ((a1->status & 1) != 0)
      {
        left = a1->left;
        if (left)
          --left->ref;
        right = a1->right;
        if (right)
          --right->ref;
      }
      free(a1);
      v3 = 0;
    }
  }
  else
  {
    v3 = -2;
  }
  *__error() = v3;
  return v3;
}

int set_field_opts(FIELD *a1, Field_Options a2)
{
  int v2;
  int v3;

  v2 = a2 & 0x7FF;
  if (!a1)
    a1 = (FIELD *)_nc_Default_Field;
  v3 = _nc_Synchronize_Options((uint64_t)a1, v2);
  *__error() = v3;
  return v3;
}

Field_Options field_opts(const FIELD *a1)
{
  const FIELD *v1;

  v1 = (const FIELD *)_nc_Default_Field;
  if (a1)
    v1 = a1;
  return v1->opts & 0x7FF;
}

int field_opts_on(FIELD *a1, Field_Options a2)
{
  int v2;

  if (!a1)
    a1 = (FIELD *)_nc_Default_Field;
  v2 = _nc_Synchronize_Options((uint64_t)a1, a1->opts | a2 & 0x7FFu);
  *__error() = v2;
  return v2;
}

int field_opts_off(FIELD *a1, Field_Options a2)
{
  int v2;

  if (!a1)
    a1 = (FIELD *)_nc_Default_Field;
  v2 = _nc_Synchronize_Options((uint64_t)a1, a1->opts & ((unsigned __int16)~(_WORD)a2 | 0xFFFFF800));
  *__error() = v2;
  return v2;
}

int set_field_pad(FIELD *a1, int a2)
{
  FIELD *v3;
  int v4;

  if (a1)
    v3 = a1;
  else
    v3 = (FIELD *)_nc_Default_Field;
  if (a2 <= 0x7Fu)
  {
    if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a2 + 60) & 0x40000) != 0)
      goto LABEL_6;
LABEL_9:
    v4 = -2;
    goto LABEL_11;
  }
  if (!__maskrune(a2, 0x40000uLL))
    goto LABEL_9;
LABEL_6:
  if (v3->pad == a2)
  {
    v4 = 0;
  }
  else
  {
    v3->pad = a2;
    v4 = _nc_Synchronize_Attributes((uint64_t)v3);
  }
LABEL_11:
  *__error() = v4;
  return v4;
}

int field_pad(const FIELD *a1)
{
  const FIELD *v1;

  v1 = (const FIELD *)_nc_Default_Field;
  if (a1)
    v1 = a1;
  return v1->pad;
}

int set_new_page(FIELD *a1, BOOL a2)
{
  FIELD *v2;
  int v3;
  __int16 v4;

  v2 = (FIELD *)_nc_Default_Field;
  if (a1)
    v2 = a1;
  if (v2->form)
  {
    v3 = -4;
  }
  else
  {
    v3 = 0;
    if (a2)
      v4 = 4;
    else
      v4 = 0;
    v2->status = v2->status & 0xFFFB | v4;
  }
  *__error() = v3;
  return v3;
}

BOOL new_page(const FIELD *a1)
{
  const FIELD *v1;

  v1 = (const FIELD *)_nc_Default_Field;
  if (a1)
    v1 = a1;
  return (v1->status >> 2) & 1;
}

int set_field_status(FIELD *a1, BOOL a2)
{
  FIELD *v2;

  v2 = (FIELD *)_nc_Default_Field;
  if (a1)
    v2 = a1;
  v2->status = v2->status & 0xFFFE | a2;
  *__error() = 0;
  return 0;
}

BOOL field_status(const FIELD *a1)
{
  const FIELD *v1;

  v1 = (const FIELD *)_nc_Default_Field;
  if (a1)
    v1 = a1;
  return v1->status & 1;
}

int set_field_type(FIELD *a1, FIELDTYPE *a2, ...)
{
  FIELD *v3;
  uint64_t *p_type;
  _QWORD *Argument;
  uint64_t v6;
  int v7;
  int v9;
  va_list v10;
  va_list va;

  va_start(va, a2);
  v9 = 0;
  va_copy(v10, va);
  if (a1)
    v3 = a1;
  else
    v3 = (FIELD *)_nc_Default_Field;
  _nc_Free_Type((uint64_t)v3);
  v3->type = a2;
  p_type = (uint64_t *)&v3->type;
  Argument = _nc_Make_Argument((uint64_t)a2, (uint64_t)&v10, &v9);
  p_type[1] = (uint64_t)Argument;
  v6 = *p_type;
  if (v9)
  {
    _nc_Free_Argument(v6, Argument);
    *p_type = 0;
    p_type[1] = 0;
    v7 = -1;
  }
  else
  {
    v7 = 0;
    if (v6)
      ++*(_QWORD *)(v6 + 8);
  }
  *__error() = v7;
  return v7;
}

FIELDTYPE *__cdecl field_type(const FIELD *a1)
{
  const FIELD *v1;

  v1 = (const FIELD *)_nc_Default_Field;
  if (a1)
    v1 = a1;
  return v1->type;
}

int set_field_userptr(FIELD *a1, void *a2)
{
  FIELD *v2;

  v2 = (FIELD *)_nc_Default_Field;
  if (a1)
    v2 = a1;
  v2->usrptr = a2;
  *__error() = 0;
  return 0;
}

void *__cdecl field_userptr(const FIELD *a1)
{
  const FIELD *v1;

  v1 = (const FIELD *)_nc_Default_Field;
  if (a1)
    v1 = a1;
  return v1->usrptr;
}

int pos_form_cursor(FORM *a1)
{
  int v1;

  if (a1)
  {
    if ((a1->status & 1) != 0)
      v1 = _nc_Position_Form_Cursor((uint64_t)a1);
    else
      v1 = -7;
  }
  else
  {
    v1 = -2;
  }
  *__error() = v1;
  return v1;
}

BOOL data_behind(const FORM *a1)
{
  FIELD *current;
  BOOL v2;
  uint64_t v3;

  if (a1)
  {
    if ((a1->status & 1) != 0 && (current = a1->current) != 0)
    {
      v2 = current->nrow + current->rows == 1;
      v3 = 16;
      if (v2)
        v3 = 20;
      LOBYTE(a1) = *(_DWORD *)((char *)&a1->status + v3) != 0;
    }
    else
    {
      LOBYTE(a1) = 0;
    }
  }
  return (char)a1;
}

BOOL data_ahead(const FORM *a1)
{
  FIELD *current;
  int rows;
  int v4;
  int v5;
  int dcols;
  int v7;
  int v8;
  WINDOW *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  WINDOW *w;
  int v15;
  int v16;
  int cols;
  int pad_low;
  BOOL v19;

  if (!a1)
    return 0;
  if ((a1->status & 1) == 0)
    return 0;
  current = a1->current;
  if (!current)
    return 0;
  rows = current->rows;
  if (current->nrow + rows != 1)
  {
    v13 = a1->toprow + rows;
    if (v13 < current->drows)
    {
      do
      {
        wmove(a1->w, v13, 0);
        w = a1->w;
        if (w)
        {
          v15 = *(__int16 *)w;
          v16 = *((__int16 *)w + 1);
        }
        else
        {
          v15 = -1;
          v16 = -1;
        }
        cols = current->cols;
        if (cols >= 1)
        {
          pad_low = LOBYTE(current->pad);
          while (wmove(w, v15, v16) != -1)
          {
            if (win_wch() != -1 && pad_low)
            {
LABEL_34:
              v19 = 1;
              goto LABEL_35;
            }
            ++v16;
            if (!--cols)
              break;
          }
        }
        ++v13;
      }
      while (v13 < current->drows);
      goto LABEL_31;
    }
    return 0;
  }
  v4 = current->cols;
  v5 = a1->begincol + v4;
  dcols = current->dcols;
  if (v5 >= dcols)
    return 0;
  do
  {
    v7 = dcols - v5;
    if (v7 >= (__int16)v4)
      v8 = (__int16)v4;
    else
      v8 = v7;
    wmove(a1->w, 0, v5);
    v9 = a1->w;
    if (v9)
    {
      v10 = *(__int16 *)v9;
      v11 = *((__int16 *)v9 + 1);
    }
    else
    {
      v10 = -1;
      v11 = -1;
    }
    if (v8 >= 1)
    {
      v12 = LOBYTE(current->pad);
      while (wmove(v9, v10, v11) != -1)
      {
        if (win_wch() != -1 && v12)
          goto LABEL_34;
        ++v11;
        if (!--v8)
          break;
      }
    }
    LOWORD(v4) = current->cols;
    v5 += (__int16)v4;
    dcols = current->dcols;
  }
  while (v5 < dcols);
LABEL_31:
  v19 = 0;
LABEL_35:
  wmove(a1->w, a1->currow, a1->curcol);
  return v19;
}

FORM *__cdecl new_form(FIELD **a1)
{
  uint64_t v1;
  int v2;
  FORM *v3;
  FORM *v6;
  __int128 *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  WINDOW *v14;
  int v15;

  v1 = *MEMORY[0x24BEDCA70];
  if (!*MEMORY[0x24BEDCA70] || !*(_QWORD *)(v1 + 48) || *(_BYTE *)(v1 + 41) || (v6 = (FORM *)malloc(0x80uLL)) == 0)
  {
    v2 = -1;
LABEL_5:
    v3 = 0;
    *__error() = v2;
    return v3;
  }
  v3 = v6;
  v7 = _nc_Default_Form;
  v8 = _nc_Default_Form[2];
  v9 = _nc_Default_Form[3];
  v10 = _nc_Default_Form[1];
  *(_OWORD *)&v6->status = *_nc_Default_Form;
  *(_OWORD *)&v6->toprow = v10;
  v11 = v7[4];
  v12 = v7[5];
  v13 = v7[7];
  *(_OWORD *)&v6->forminit = v7[6];
  *(_OWORD *)&v6->fieldinit = v13;
  *(_OWORD *)&v6->field = v11;
  *(_OWORD *)&v6->page = v12;
  *(_OWORD *)&v6->opts = v8;
  *(_OWORD *)&v6->sub = v9;
  v14 = *(WINDOW **)(v1 + 152);
  v6->win = v14;
  v6->sub = v14;
  v15 = sub_21E52FCB4((uint64_t)v6, a1);
  if (v15)
  {
    v2 = v15;
    free_form(v3);
    goto LABEL_5;
  }
  if (v3->maxpage < 1)
  {
    v3->curpage = -1;
    v3->current = 0;
  }
  else
  {
    v3->curpage = 0;
    form_driver(v3, -291056);
  }
  return v3;
}

int free_form(FORM *a1)
{
  _PAGE *page;
  int v3;

  if (a1)
  {
    if ((a1->status & 1) != 0)
    {
      v3 = -3;
    }
    else
    {
      sub_21E52FB9C((uint64_t)a1);
      page = a1->page;
      if (page)
        free(page);
      free(a1);
      v3 = 0;
    }
  }
  else
  {
    v3 = -2;
  }
  *__error() = v3;
  return v3;
}

void sub_21E52FB9C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;

  v1 = *(uint64_t **)(a1 + 64);
  if (v1)
  {
    v3 = *v1;
    if (*v1)
    {
      v4 = v1 + 1;
      do
      {
        if (*(_QWORD *)(v3 + 80) == a1)
          *(_QWORD *)(v3 + 80) = 0;
        v5 = *v4++;
        v3 = v5;
      }
      while (v5);
    }
    *(_DWORD *)(a1 + 2) = 0;
    *(_DWORD *)(a1 + 24) = -1;
    *(_QWORD *)(a1 + 64) = 0;
    v6 = *(void **)(a1 + 80);
    if (v6)
      free(v6);
    *(_QWORD *)(a1 + 80) = 0;
  }
}

int set_form_fields(FORM *a1, FIELD **a2)
{
  FIELD **field;
  int v5;

  if (a1)
  {
    if ((a1->status & 1) != 0)
    {
      v5 = -3;
    }
    else
    {
      field = a1->field;
      sub_21E52FB9C((uint64_t)a1);
      v5 = sub_21E52FCB4((uint64_t)a1, a2);
      if (v5)
      {
        sub_21E52FCB4((uint64_t)a1, field);
      }
      else if (a1->maxpage < 1)
      {
        a1->curpage = -1;
        a1->current = 0;
      }
      else
      {
        a1->curpage = 0;
        form_driver(a1, -291056);
      }
    }
  }
  else
  {
    v5 = -2;
  }
  *__error() = v5;
  return v5;
}

uint64_t sub_21E52FCB4(uint64_t a1, _QWORD *a2)
{
  _WORD *v3;
  uint64_t v5;
  int v6;
  int v7;
  _WORD *v8;
  uint64_t v9;
  __int16 v10;
  _WORD *v11;
  __int16 v12;
  _WORD *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  __int16 *v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;

  *(_QWORD *)(a1 + 64) = a2;
  *(_DWORD *)(a1 + 24) = 0;
  if (!a2)
    goto LABEL_47;
  v3 = (_WORD *)*a2;
  if (!*a2)
    goto LABEL_48;
  v5 = 0;
  v6 = 0;
  do
  {
    if (*((_QWORD *)v3 + 10))
    {
      v32 = 4294967292;
      goto LABEL_50;
    }
    if (!v5 || (*v3 & 4) != 0)
      ++v6;
    *((_QWORD *)v3 + 10) = a1;
    v7 = v5 + 1;
    v3 = (_WORD *)a2[++v5];
  }
  while (v3);
  if (!v7 || (v7 & 0x8000) != 0)
  {
LABEL_48:
    v32 = 4294967294;
    goto LABEL_50;
  }
  v8 = malloc(8 * v6);
  if (!v8)
  {
    v32 = 0xFFFFFFFFLL;
    goto LABEL_50;
  }
  v9 = 0;
  *(_QWORD *)(a1 + 80) = v8;
  v10 = *(_WORD *)(a1 + 2);
  v11 = v8;
  v12 = *(_WORD *)(a1 + 4);
  do
  {
    if (v9)
    {
      v13 = (_WORD *)a2[v9];
      if ((*v13 & 4) != 0)
      {
        v11[4] = v9;
        v11 += 4;
        *(v11 - 3) = v9 - 1;
      }
    }
    else
    {
      *v11 = 0;
      v13 = (_WORD *)*a2;
    }
    v14 = (__int16)v13[1] + (__int16)v13[3];
    v15 = (__int16)v13[4];
    v16 = (__int16)v13[2];
    if (v14 > v10)
    {
      *(_WORD *)(a1 + 2) = v14;
      v10 = v14;
    }
    v17 = v16 + v15;
    if (v17 > v12)
    {
      *(_WORD *)(a1 + 4) = v17;
      v12 = v17;
    }
    ++v9;
  }
  while (v7 != v9);
  v11[1] = v7 - 1;
  *(_WORD *)(a1 + 24) = v7;
  *(_WORD *)(a1 + 26) = v6;
  if (v6 << 16 >= 1)
  {
    v18 = 0;
    if ((unsigned __int16)v6 <= 1u)
      v19 = 1;
    else
      v19 = (unsigned __int16)v6;
    do
    {
      v20 = &v8[4 * v18];
      v21 = v20[1];
      if (*v20 <= v21)
      {
        v23 = 0;
        v24 = *v20;
        do
        {
          v25 = a2[v24];
          *(_WORD *)(v25 + 34) = v24;
          *(_WORD *)(v25 + 32) = v18;
          if (v23)
          {
            v26 = *(__int16 *)(v25 + 6);
            v27 = v23;
            while (1)
            {
              v28 = *(__int16 *)(v27 + 6);
              if (v28 >= v26 && (v28 != v26 || *(__int16 *)(v27 + 8) >= *(__int16 *)(v25 + 8)))
                break;
              v27 = *(_QWORD *)(v27 + 56);
              if (v27 == v23)
              {
                v29 = 0;
                v27 = v23;
                goto LABEL_38;
              }
            }
            v29 = v23;
LABEL_38:
            v30 = *(_QWORD *)(v27 + 64);
            *(_QWORD *)(v25 + 56) = v27;
            *(_QWORD *)(v25 + 64) = v30;
            *(_QWORD *)(v27 + 64) = v25;
            *(_QWORD *)(*(_QWORD *)(v25 + 64) + 56) = v25;
            if (v27 == v29)
              v23 = v25;
          }
          else
          {
            *(_QWORD *)(v25 + 56) = v25;
            *(_QWORD *)(v25 + 64) = v25;
            v23 = v25;
          }
        }
        while (v24++ != v21);
        if (v23)
        {
          v22 = *(_WORD *)(v23 + 34);
          LOWORD(v23) = *(_WORD *)(*(_QWORD *)(v23 + 64) + 34);
        }
        else
        {
          v22 = 0;
        }
      }
      else
      {
        v22 = 0;
        LOWORD(v23) = 0;
      }
      v32 = 0;
      v20[2] = v22;
      v20[3] = v23;
      ++v18;
    }
    while (v18 != v19);
  }
  else
  {
LABEL_47:
    v32 = 0;
  }
LABEL_50:
  *__error() = v32;
  return v32;
}

FIELD **__cdecl form_fields(const FORM *a1)
{
  const FORM *v1;

  v1 = (const FORM *)_nc_Default_Form;
  if (a1)
    v1 = a1;
  return v1->field;
}

int field_count(const FORM *a1)
{
  const FORM *v1;

  v1 = (const FORM *)_nc_Default_Form;
  if (a1)
    v1 = a1;
  return v1->maxfield;
}

uint64_t _nc_get_fieldbuffer(uint64_t result, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  _DWORD *v7;
  int v8;
  int v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v15;
  _DWORD *v16;
  _DWORD *v17;
  int v18;
  __int128 *v19;
  __int128 v20;
  int v21;

  v4 = *(_QWORD *)(result + 56);
  if (!v4 || (v5 = *(__int16 *)(v4 + 4), v5 < 0))
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_DWORD *)(a3 + 24) = 0;
    *(_QWORD *)(a3 + 16) = 0;
  }
  else
  {
    v21 = a2[9];
    result = ((uint64_t (*)(void))*MEMORY[0x24BEDCA78])();
    v7 = (_DWORD *)result;
    v8 = 0;
    v9 = 0;
    do
    {
      if (v8 >= a2[3])
        break;
      wmove((WINDOW *)v4, v8, 0);
      v10 = (_DWORD *)(a3 + 28 * v9);
      v11 = a2[4];
      result = win_wchnstr();
      if ((int)v11 >= 1)
      {
        v12 = v11;
        do
        {
          v13 = *(unsigned __int8 *)v10;
          *v10 = v13;
          if (*v7 >= 0x60000u)
            v10[6] = 0;
          *v10 = v13;
          v10 += 7;
          --v12;
        }
        while (v12);
      }
      v9 += v11;
    }
    while (v8++ != v5);
    v15 = a3 + 28 * v9;
    *(_QWORD *)v15 = 0;
    *(_QWORD *)(v15 + 8) = 0;
    *(_DWORD *)(v15 + 24) = 0;
    *(_QWORD *)(v15 + 16) = 0;
    if (v21 != 32 && v9 >= 1)
    {
      v16 = (_DWORD *)(a3 + 4);
      v17 = (_DWORD *)(a3 + 4);
      do
      {
        v18 = *v17;
        v17 += 7;
        if (v18 == v21 && !v16[1])
        {
          v19 = (__int128 *)(v16 - 1);
          v20 = xmmword_2553E3E48;
          *(__int128 *)((char *)v19 + 12) = *(__int128 *)((char *)&xmmword_2553E3E48 + 12);
          *v19 = v20;
        }
        v16 = v17;
        --v9;
      }
      while (v9);
    }
  }
  return result;
}

uint64_t _nc_Position_Form_Cursor(uint64_t a1)
{
  WINDOW *v2;
  uint64_t v3;
  WINDOW *v4;

  if (!a1)
    return 4294967294;
  v2 = *(WINDOW **)(a1 + 56);
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = *(_QWORD *)(a1 + 72);
  if (!v3)
    return 0xFFFFFFFFLL;
  v4 = *(WINDOW **)(a1 + 48);
  if (!v4)
  {
    v4 = *(WINDOW **)(a1 + 40);
    if (!v4)
      v4 = *(WINDOW **)(*MEMORY[0x24BEDCA70] + 152);
  }
  wmove(v2, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  if ((*(_BYTE *)(v3 + 48) & 4) != 0
    && *(_DWORD *)(v3 + 12) <= *(__int16 *)(v3 + 2)
    && *(_DWORD *)(v3 + 16) <= *(__int16 *)(v3 + 4))
  {
    v4 = *(WINDOW **)(a1 + 56);
  }
  else
  {
    wmove(v4, *(_DWORD *)(a1 + 8) + *(__int16 *)(v3 + 6) - *(_DWORD *)(a1 + 16), *(_DWORD *)(a1 + 12) + *(__int16 *)(v3 + 8) - *(_DWORD *)(a1 + 20));
  }
  wcursyncup(v4);
  return 0;
}

uint64_t _nc_Refresh_Current_Field(uint64_t a1)
{
  const WINDOW *v2;
  __int16 *v3;
  WINDOW *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  __int16 v9;
  int *v10;
  uint64_t result;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;

  if (!a1)
  {
    v10 = __error();
    result = 4294967294;
    goto LABEL_21;
  }
  v2 = *(const WINDOW **)(a1 + 56);
  if (!v2 || (v3 = *(__int16 **)(a1 + 72)) == 0)
  {
    v10 = __error();
    result = 0xFFFFFFFFLL;
LABEL_21:
    *v10 = result;
    return result;
  }
  v4 = *(WINDOW **)(a1 + 48);
  if (!v4)
  {
    v4 = *(WINDOW **)(a1 + 40);
    if (!v4)
      v4 = *(WINDOW **)(*MEMORY[0x24BEDCA70] + 152);
  }
  if ((v3[24] & 4) == 0)
    goto LABEL_35;
  v5 = v3[1];
  if (*((_DWORD *)v3 + 3) > v5)
  {
    if (*((_DWORD *)v3 + 6) + v5 != 1)
    {
      v6 = *(_DWORD *)(a1 + 16);
      v7 = v6 + v5;
      v8 = *(_DWORD *)(a1 + 8);
      v9 = *v3;
      if (v8 < v6)
      {
        *(_DWORD *)(a1 + 16) = v8;
        v9 |= 2u;
        *v3 = v9;
        v6 = v8;
      }
      if (v8 >= v7)
      {
        v6 = v8 - v5 + 1;
        *(_DWORD *)(a1 + 16) = v6;
        v9 |= 2u;
        *v3 = v9;
      }
      if ((v9 & 2) != 0)
      {
        v15 = v6 + v5;
        *v3 = v9 & 0xFFFD;
      }
      else
      {
        if (v6 < v7)
        {
          while (!is_linetouched(*(WINDOW **)(a1 + 56), v6))
          {
            if (v7 == ++v6)
              goto LABEL_33;
          }
        }
        if (v6 >= v7)
          goto LABEL_33;
        v15 = v6;
        while (is_linetouched(*(WINDOW **)(a1 + 56), v15))
        {
          if (v7 == ++v15)
          {
            v15 = v7;
            goto LABEL_31;
          }
        }
      }
      goto LABEL_31;
    }
    goto LABEL_24;
  }
  if (*((_DWORD *)v3 + 4) > v3[2])
  {
    if (*((_DWORD *)v3 + 6) + v5 != 1)
    {
      v6 = *(_DWORD *)(a1 + 16);
      v15 = v6 + v5;
LABEL_31:
      if (v15 != v6)
        copywin(*(const WINDOW **)(a1 + 56), v4, v6, 0, v6 + v3[3] - *(_DWORD *)(a1 + 16), v3[4], v15 + v3[3] + ~*(_DWORD *)(a1 + 16), v3[4] + v3[2] - 1, 0);
LABEL_33:
      v2 = v4;
      goto LABEL_34;
    }
LABEL_24:
    v12 = *(_DWORD *)(a1 + 12);
    v13 = *(_DWORD *)(a1 + 20);
    if (v12 >= v13)
    {
      v14 = v3[2];
      if (v12 >= v13 + v14)
      {
        v13 = v12 - v14 + 1;
        *(_DWORD *)(a1 + 20) = v13;
      }
    }
    else
    {
      *(_DWORD *)(a1 + 20) = v12;
      v14 = v3[2];
      v13 = v12;
    }
    copywin(v2, v4, 0, v13, v3[3], v3[4], v3[3], v3[4] + v14 - 1, 0);
    goto LABEL_33;
  }
LABEL_34:
  wsyncup(v2);
LABEL_35:
  v16 = *(_QWORD *)(a1 + 56);
  if (v16)
    v17 = *(__int16 *)(v16 + 4) + 1;
  else
    v17 = -1;
  wtouchln((WINDOW *)v16, 0, v17, 0);
  return _nc_Position_Form_Cursor(a1);
}

uint64_t _nc_Synchronize_Attributes(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  int v5;
  int v6;
  WINDOW *v7;

  if (!a1)
    return 4294967294;
  v2 = *(_QWORD *)(a1 + 80);
  if (v2
    && (*(_WORD *)v2 & 1) != 0
    && (*(_BYTE *)(a1 + 48) & 1) != 0
    && *(unsigned __int16 *)(a1 + 32) == *(unsigned __int16 *)(v2 + 28))
  {
    if (*(_QWORD *)(v2 + 72) != a1)
      return sub_21E5307D0(a1, 0);
    sub_21E5305A4(*(_QWORD *)(a1 + 80));
    wbkgdset(*(WINDOW **)(v2 + 56), *(_DWORD *)(a1 + 44) | *(_DWORD *)(a1 + 36));
    v4 = *(_QWORD *)(v2 + 56);
    if (v4)
    {
      v5 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)(v4 + 116) = BYTE1(v5);
      *(_DWORD *)(v4 + 16) = v5;
    }
    werase((WINDOW *)v4);
    wmove(*(WINDOW **)(v2 + 56), *(_DWORD *)(v2 + 8), *(_DWORD *)(v2 + 12));
    v6 = *(_DWORD *)(a1 + 48);
    if ((v6 & 4) == 0)
    {
      v7 = *(WINDOW **)(v2 + 48);
      if (!v7)
      {
        v7 = *(WINDOW **)(v2 + 40);
        if (!v7)
          v7 = *(WINDOW **)(*MEMORY[0x24BEDCA70] + 152);
      }
      copywin(*(const WINDOW **)(v2 + 56), v7, 0, 0, *(__int16 *)(a1 + 6), *(__int16 *)(a1 + 8), *(__int16 *)(a1 + 2) - 1, *(__int16 *)(a1 + 4) - 1, 0);
      wsyncup(v7);
      sub_21E5306CC(a1, *(WINDOW **)(v2 + 56));
      *(_WORD *)a1 |= 2u;
      _nc_Refresh_Current_Field(v2);
      return 0;
    }
    if (*(_WORD *)(a1 + 30) && *(_DWORD *)(a1 + 24) + *(__int16 *)(a1 + 2) == 1)
    {
      if ((v6 & 0x200) != 0)
      {
        if ((v6 & 0x400) != 0 || *(_DWORD *)(a1 + 16) == *(__int16 *)(a1 + 4))
          goto LABEL_25;
      }
      else if ((v6 & 0x400) != 0)
      {
LABEL_25:
        sub_21E5305F4(a1, *(WINDOW **)(v2 + 56));
        return 0;
      }
    }
    sub_21E5306CC(a1, *(WINDOW **)(v2 + 56));
  }
  return 0;
}

uint64_t sub_21E5305A4(uint64_t result)
{
  uint64_t v1;

  if ((*(_WORD *)result & 0x10) != 0)
  {
    v1 = result;
    *(_WORD *)result = *(_WORD *)result & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(result, *(_DWORD **)(result + 72), *(_QWORD *)(*(_QWORD *)(result + 72) + 104));
    return wmove(*(WINDOW **)(v1 + 56), *(_DWORD *)(v1 + 8), *(_DWORD *)(v1 + 12));
  }
  return result;
}

uint64_t sub_21E5305F4(uint64_t result, WINDOW *a2)
{
  unint64_t v2;
  int v3;
  unint64_t v4;
  unint64_t v5;

  v2 = *(_QWORD *)(result + 104);
  v3 = *(_DWORD *)(result + 16) * *(_DWORD *)(result + 12);
  v4 = v2 + 28 * v3;
  if (v3 >= 1)
  {
    v5 = *(_QWORD *)(result + 104);
    do
    {
      if (*(_DWORD *)(v5 + 4) != 32)
        break;
      if (*(_DWORD *)(v5 + 8))
        break;
      v5 += 28;
    }
    while (v5 < v4);
    if (v5 == v4)
      v5 = *(_QWORD *)(result + 104);
    do
    {
      if (*(_DWORD *)(v4 - 24) != 32)
        break;
      if (*(_DWORD *)(v4 - 20))
        break;
      v4 -= 28;
    }
    while (v4 > v2);
    v2 = v5;
  }
  if ((int)(-1227133513 * ((v4 - v2) >> 2)) >= 1)
  {
    wmove(a2, 0, 0);
    return wadd_wchnstr();
  }
  return result;
}

uint64_t sub_21E5306CC(uint64_t a1, WINDOW *a2)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  int v13;
  int v14;

  if (a2)
  {
    v3 = *(__int16 *)a2;
    v4 = *((__int16 *)a2 + 1);
    v5 = *((__int16 *)a2 + 2);
    if ((v5 & 0x80000000) == 0)
    {
      v13 = v3;
      v14 = *((__int16 *)a2 + 1);
      v6 = 0;
      v7 = *((__int16 *)a2 + 3);
      v8 = v7 + 1;
      v9 = *(_QWORD *)(a1 + 104);
      do
      {
        v10 = v9 + 28 * v8;
        if ((v7 & 0x80000000) == 0)
        {
          v10 = v9 + 28 * v8;
          do
          {
            if (*(_DWORD *)(v10 - 24) != 32)
              break;
            if (*(_DWORD *)(v10 - 20))
              break;
            v10 -= 28;
          }
          while (v10 > v9);
        }
        if ((int)(-1227133513 * ((v10 - v9) >> 2)) >= 1)
        {
          wmove(a2, v6, 0);
          wadd_wchnstr();
        }
        v9 += 28 * v8;
      }
      while (v6++ != v5);
      v3 = v13;
      v4 = v14;
    }
  }
  else
  {
    v4 = -1;
    v3 = -1;
  }
  return wmove(a2, v3, v4);
}

uint64_t sub_21E5307D0(uint64_t a1, char a2)
{
  uint64_t v4;
  WINDOW *v5;
  WINDOW *v6;
  WINDOW *v7;
  int *v8;
  int v10;
  int v11;

  if (!a1)
    return 0xFFFFFFFFLL;
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(WINDOW **)(v4 + 48);
  if (!v5)
  {
    v5 = *(WINDOW **)(v4 + 40);
    if (!v5)
      v5 = *(WINDOW **)(*MEMORY[0x24BEDCA70] + 152);
  }
  v6 = derwin(v5, *(__int16 *)(a1 + 2), *(__int16 *)(a1 + 4), *(__int16 *)(a1 + 6), *(__int16 *)(a1 + 8));
  if (!v6)
    return 0xFFFFFFFFLL;
  v7 = v6;
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    wbkgdset(v6, *(_DWORD *)(a1 + 44) | *(_DWORD *)(a1 + 36));
    v8 = (int *)(a1 + 40);
  }
  else
  {
    v8 = (int *)((char *)v5 + 16);
  }
  v10 = *v8;
  *((_DWORD *)v7 + 29) = BYTE1(v10);
  *((_DWORD *)v7 + 4) = v10;
  werase(v7);
  if ((a2 & 1) == 0)
  {
    v11 = *(_DWORD *)(a1 + 48);
    if ((v11 & 4) != 0)
    {
      if (*(_WORD *)(a1 + 30) && *(_DWORD *)(a1 + 24) + *(__int16 *)(a1 + 2) == 1)
      {
        if ((v11 & 0x200) != 0)
        {
          if ((v11 & 0x400) != 0 || *(_DWORD *)(a1 + 16) == *(__int16 *)(a1 + 4))
            goto LABEL_23;
        }
        else if ((v11 & 0x400) != 0)
        {
LABEL_23:
          sub_21E530DD4(a1, v7);
          goto LABEL_21;
        }
      }
      sub_21E5306CC(a1, v7);
    }
LABEL_21:
    *(_WORD *)a1 &= ~2u;
  }
  wsyncup(v7);
  delwin(v7);
  return 0;
}

uint64_t _nc_Synchronize_Options(uint64_t a1, int a2)
{
  __int16 v2;
  int v4;
  __int16 v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  int v9;
  int v10;
  _WORD *v12;

  if (!a1)
    return 4294967294;
  v2 = a2;
  v4 = *(_DWORD *)(a1 + 48);
  v5 = v4 ^ a2;
  *(_DWORD *)(a1 + 48) = a2;
  v6 = *(_QWORD *)(a1 + 80);
  if (!v6 || (*(_WORD *)v6 & 1) == 0)
    goto LABEL_10;
  if (*(_QWORD *)(v6 + 72) == a1)
  {
    *(_DWORD *)(a1 + 48) = v4;
    return 4294967282;
  }
  if (*(unsigned __int16 *)(v6 + 28) != *(unsigned __int16 *)(a1 + 32))
    goto LABEL_10;
  if ((v5 & 1) != 0)
  {
    v7 = (a2 & 1) == 0;
LABEL_34:
    v8 = sub_21E5307D0(a1, v7);
    if ((v5 & 0x200) == 0)
      return v8;
    goto LABEL_12;
  }
  if ((a2 & 1) == 0)
  {
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  v7 = 0;
  v8 = 0;
  if ((v5 & 4) != 0)
    goto LABEL_34;
LABEL_11:
  if ((v5 & 0x200) == 0)
    return v8;
LABEL_12:
  v9 = *(_DWORD *)(a1 + 24) + *(__int16 *)(a1 + 2);
  if ((v2 & 0x200) != 0)
  {
    *(_WORD *)a1 &= ~8u;
    if (v9 != 1 || *(_DWORD *)(a1 + 16) != *(__int16 *)(a1 + 4))
      return v8;
    goto LABEL_24;
  }
  v10 = *(_DWORD *)(a1 + 20);
  if (!v10)
  {
    *(_WORD *)a1 |= 8u;
    if (v9 != 1)
      return v8;
LABEL_24:
    if (*(_WORD *)(a1 + 30))
    {
      v12 = *(_WORD **)(a1 + 80);
      if (v12)
      {
        if ((*v12 & 1) != 0
          && (*(_BYTE *)(a1 + 48) & 1) != 0
          && *(unsigned __int16 *)(a1 + 32) == (unsigned __int16)v12[14]
          && sub_21E5307D0(a1, 0))
        {
          return 0xFFFFFFFFLL;
        }
      }
    }
    return v8;
  }
  if (v9 == 1)
  {
    if (*(_DWORD *)(a1 + 16) >= v10)
      return v8;
    *(_WORD *)a1 |= 8u;
    goto LABEL_24;
  }
  if (*(_DWORD *)(a1 + 12) < v10)
    *(_WORD *)a1 |= 8u;
  return v8;
}

uint64_t _nc_Set_Current_Field(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  int v6;
  int v7;
  __int16 v8;
  __int16 v9;
  int v10;
  int v11;
  int v12;
  WINDOW *v13;
  WINDOW *v14;
  WINDOW *v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  WINDOW *v24;
  BOOL v25;
  BOOL v26;
  uint64_t v27;
  WINDOW *v28;

  result = 4294967294;
  if (a1)
  {
    if (a2)
    {
      v5 = *(_QWORD *)(a1 + 72);
      if (v5)
      {
        if (*(_QWORD *)(a2 + 80) == a1)
        {
          if ((*(_WORD *)a1 & 2) != 0)
            return 4294967291;
          if (!*(_QWORD *)(a1 + 64))
            return 4294967285;
          if (v5 == a2 && (*(_WORD *)a1 & 1) != 0)
          {
LABEL_44:
            result = 0;
            *(_QWORD *)(a1 + 8) = 0;
            *(_QWORD *)(a1 + 16) = 0;
            return result;
          }
          if (!*(_QWORD *)(a1 + 56)
            || (*(_BYTE *)(v5 + 48) & 1) == 0
            || *(unsigned __int16 *)(*(_QWORD *)(v5 + 80) + 28) != *(unsigned __int16 *)(v5 + 32))
          {
LABEL_26:
            v10 = *(_DWORD *)(a2 + 12);
            if ((*(_BYTE *)(a2 + 48) & 4) != 0
              && (v11 = *(__int16 *)(a2 + 2), v10 <= v11)
              && (v12 = *(__int16 *)(a2 + 4), *(_DWORD *)(a2 + 16) <= v12))
            {
              v24 = *(WINDOW **)(a1 + 48);
              if (!v24)
              {
                v24 = *(WINDOW **)(a1 + 40);
                if (!v24)
                  v24 = *(WINDOW **)(*MEMORY[0x24BEDCA70] + 152);
              }
              v13 = derwin(v24, v11, v12, *(__int16 *)(a2 + 6), *(__int16 *)(a2 + 8));
            }
            else
            {
              v13 = newpad(v10, *(_DWORD *)(a2 + 16));
            }
            v14 = v13;
            if (!v13)
              return 0xFFFFFFFFLL;
            *(_QWORD *)(a1 + 72) = a2;
            v15 = *(WINDOW **)(a1 + 56);
            if (v15)
              delwin(v15);
            *(_QWORD *)(a1 + 56) = v14;
            *(_WORD *)a1 &= ~0x10u;
            wbkgdset(v14, *(_DWORD *)(a2 + 44) | *(_DWORD *)(a2 + 36));
            v16 = *(_QWORD *)(a1 + 56);
            if (v16)
            {
              v17 = *(_DWORD *)(a2 + 40);
              *(_DWORD *)(v16 + 116) = BYTE1(v17);
              *(_DWORD *)(v16 + 16) = v17;
            }
            v18 = *(_DWORD *)(a2 + 48);
            if ((v18 & 4) != 0
              && (v19 = *(__int16 *)(a2 + 2), *(_DWORD *)(a2 + 12) <= v19)
              && (v20 = *(_DWORD *)(a2 + 16), v21 = *(__int16 *)(a2 + 4), v20 <= v21))
            {
              if (*(_WORD *)(a2 + 30) && *(_DWORD *)(a2 + 24) + v19 == 1)
              {
                v25 = (v18 & 0x200) != 0 && v20 == v21;
                v26 = !v25;
                if ((v18 & 0x400) != 0 || !v26)
                {
                  werase((WINDOW *)v16);
                  sub_21E5305F4(a2, *(WINDOW **)(a1 + 56));
                  wsyncup(*(WINDOW **)(a1 + 56));
                }
              }
            }
            else
            {
              werase((WINDOW *)v16);
              sub_21E5306CC(a2, *(WINDOW **)(a1 + 56));
            }
            v22 = *(_QWORD *)(a1 + 56);
            if (v22)
              v23 = *(__int16 *)(v22 + 4) + 1;
            else
              v23 = -1;
            wtouchln((WINDOW *)v22, 0, v23, 0);
            goto LABEL_44;
          }
          _nc_Refresh_Current_Field(a1);
          v6 = *(_DWORD *)(v5 + 48);
          if ((v6 & 4) != 0)
          {
            v7 = *(__int16 *)(v5 + 2);
            if (*(_DWORD *)(v5 + 12) > v7)
            {
              v8 = *(_WORD *)v5;
              if (*(_DWORD *)(a1 + 16))
                v9 = v8 | 2;
              else
                v9 = v8 & 0xFFFD;
              *(_WORD *)v5 = v9;
              goto LABEL_25;
            }
            if (*(_WORD *)(v5 + 30) && *(_DWORD *)(v5 + 24) + v7 == 1)
            {
              if ((v6 & 0x200) != 0)
              {
                if ((v6 & 0x400) == 0 && *(_DWORD *)(v5 + 16) != *(__int16 *)(v5 + 4))
                  goto LABEL_25;
              }
              else if ((v6 & 0x400) == 0)
              {
                goto LABEL_25;
              }
              _nc_get_fieldbuffer(a1, (_DWORD *)v5, *(_QWORD *)(v5 + 104));
              werase(*(WINDOW **)(a1 + 56));
              sub_21E530DD4(v5, *(WINDOW **)(a1 + 56));
              v27 = *(_QWORD *)(a1 + 56);
              if ((*(_BYTE *)(v5 + 49) & 4) != 0 && !*(_QWORD *)(v27 + 64))
              {
                v28 = *(WINDOW **)(a1 + 48);
                if (!v28)
                {
                  v28 = *(WINDOW **)(a1 + 40);
                  if (!v28)
                    v28 = *(WINDOW **)(*MEMORY[0x24BEDCA70] + 152);
                }
                copywin((const WINDOW *)v27, v28, 0, 0, *(__int16 *)(v5 + 6), *(__int16 *)(v5 + 8), *(__int16 *)(v5 + 6), *(__int16 *)(v5 + 8) + *(__int16 *)(v5 + 4) - 1, 0);
                v27 = *(_QWORD *)(a1 + 48);
                if (!v27)
                {
                  v27 = *(_QWORD *)(a1 + 40);
                  if (!v27)
                    v27 = *(_QWORD *)(*MEMORY[0x24BEDCA70] + 152);
                }
              }
              wsyncup((WINDOW *)v27);
            }
          }
LABEL_25:
          delwin(*(WINDOW **)(a1 + 56));
          *(_QWORD *)(a1 + 56) = 0;
          goto LABEL_26;
        }
      }
    }
  }
  return result;
}

uint64_t sub_21E530DD4(uint64_t result, WINDOW *a2)
{
  unint64_t v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  int v10;

  v2 = *(_QWORD *)(result + 104);
  v3 = *(_DWORD *)(result + 16) * *(_DWORD *)(result + 12);
  v4 = v2 + 28 * v3;
  if (v3 >= 1)
  {
    v5 = *(_QWORD *)(result + 104);
    do
    {
      if (*(_DWORD *)(v5 + 4) != 32)
        break;
      if (*(_DWORD *)(v5 + 8))
        break;
      v5 += 28;
    }
    while (v5 < v4);
    if (v5 == v4)
      v5 = *(_QWORD *)(result + 104);
    do
    {
      if (*(_DWORD *)(v4 - 24) != 32)
        break;
      if (*(_DWORD *)(v4 - 20))
        break;
      v4 -= 28;
    }
    while (v4 > v2);
    v2 = v5;
  }
  v6 = -1227133513 * ((v4 - v2) >> 2);
  if (v6 >= 1)
  {
    v7 = *(__int16 *)(result + 4) - v6;
    if (v7 < 0)
    {
      v10 = 0;
    }
    else
    {
      v8 = *(__int16 *)(result + 30);
      v9 = v7 >> 1;
      if (v8 != 2)
        v9 = 0;
      if (v8 == 3)
        v10 = *(__int16 *)(result + 4) - v6;
      else
        v10 = v9;
    }
    wmove(a2, 0, v10);
    return wadd_wchnstr();
  }
  return result;
}

uint64_t _nc_Internal_Validation(uint64_t a1)
{
  uint64_t v2;
  __int16 v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_WORD *)a1;
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = v3 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, *(_QWORD *)(v2 + 104));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    v3 = *(_WORD *)a1;
  }
  if ((v3 & 0x20) != 0 || (*(_BYTE *)(v2 + 49) & 1) == 0)
  {
    result = sub_21E530F68(*(_QWORD *)(v2 + 88), v2, *(_QWORD **)(v2 + 96));
    if (!(_DWORD)result)
      return result;
    *(_WORD *)a1 &= ~0x20u;
    *(_WORD *)v2 |= 1u;
    sub_21E531014(v2);
  }
  return 1;
}

uint64_t sub_21E530F68(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  int *v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t, _QWORD *);

  if (a1)
  {
    v5 = a1;
    while (1)
    {
      if ((*(_BYTE *)(a2 + 48) & 0x80) != 0)
      {
        v6 = (int *)(*(_QWORD *)(a2 + 104) + 8);
        while (1)
        {
          v7 = *(v6 - 1);
          if (v7 != 32)
            break;
          v8 = *v6;
          v6 += 7;
          if (v8)
            goto LABEL_9;
        }
        if (!v7)
          break;
      }
LABEL_9:
      if ((*(_WORD *)v5 & 1) == 0)
      {
        v9 = *(uint64_t (**)(uint64_t, _QWORD *))(v5 + 56);
        if (!v9)
          return 1;
        return v9(a2, a3);
      }
      if ((sub_21E530F68(*(_QWORD *)(v5 + 16), a2, *a3) & 1) == 0)
      {
        v5 = *(_QWORD *)(v5 + 24);
        a3 = (_QWORD *)a3[1];
        if (v5)
          continue;
      }
      return 1;
    }
  }
  return 1;
}

uint64_t sub_21E531014(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  BOOL v5;

  if (!a1)
    return 4294967294;
  v2 = *(_QWORD *)(a1 + 72);
  if (!v2)
    return 0xFFFFFFFFLL;
  if (v2 == a1)
    return 0;
  LODWORD(v3) = 0;
  do
  {
    v4 = sub_21E532718(v2);
    if ((_DWORD)v3)
      v5 = 1;
    else
      v5 = v4 == 0;
    if (v5)
      v3 = v3;
    else
      v3 = v4;
    v2 = *(_QWORD *)(v2 + 72);
  }
  while (v2 != a1 && v2 != 0);
  return v3;
}

uint64_t _nc_First_Active_Field(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  __int16 *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t result;
  int v13;
  uint64_t *v16;
  uint64_t *v17;
  int v18;
  BOOL v20;

  v1 = *(_QWORD *)(a1 + 64);
  v2 = *(_QWORD *)(a1 + 80);
  v3 = *(__int16 *)(a1 + 28);
  v4 = (uint64_t *)(v1 + 8 * *(__int16 *)(v2 + 8 * v3 + 2));
  v5 = *v4;
  v6 = *(_QWORD *)(*v4 + 80);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = (uint64_t *)(v7 + 8 * *(__int16 *)(*v4 + 34));
  v9 = (__int16 *)(*(_QWORD *)(v6 + 80) + 8 * *(__int16 *)(v6 + 28));
  v10 = (uint64_t *)(v7 + 8 * *v9);
  v11 = (uint64_t *)(v7 + 8 * v9[1]);
  do
  {
    if (v8 == v11)
      v8 = v10;
    else
      ++v8;
    result = *v8;
    v13 = *(_DWORD *)(*v8 + 48) & 3;
  }
  while (*v8 != v5 && v13 != 3);
  if (v13 != 3 && result == v5)
  {
    v16 = (uint64_t *)(v1 + 8 * *(__int16 *)(result + 34));
    v17 = (uint64_t *)(v1 + 8 * *(__int16 *)(v2 + 8 * v3));
    do
    {
      if (v16 == v4)
        v16 = v17;
      else
        ++v16;
      v18 = *(_DWORD *)(*v16 + 48) & 1;
    }
    while (result != *v16 && v18 == 0);
    v20 = *v16 == v5 && v18 == 0;
    result = *v16;
    if (v20)
      return *v17;
  }
  return result;
}

uint64_t _nc_Set_Form_Page(uint64_t a1, int a2, uint64_t a3)
{
  WINDOW *v7;
  uint64_t v8;
  uint64_t v9;

  if (*(__int16 *)(a1 + 28) == a2)
    return 0;
  v7 = *(WINDOW **)(a1 + 48);
  if (!v7)
  {
    v7 = *(WINDOW **)(a1 + 40);
    if (!v7)
      v7 = *(WINDOW **)(*MEMORY[0x24BEDCA70] + 152);
  }
  werase(v7);
  *(_WORD *)(a1 + 28) = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * *(__int16 *)(*(_QWORD *)(a1 + 80) + 8 * a2 + 4));
  v9 = v8;
  do
  {
    if ((*(_BYTE *)(v9 + 48) & 1) != 0 && sub_21E5307D0(v9, 0))
      return 0xFFFFFFFFLL;
    v9 = *(_QWORD *)(v9 + 56);
  }
  while (v9 != v8);
  if (a3)
    return _nc_Set_Current_Field(a1, a3);
  else
    return sub_21E53122C(a1);
}

uint64_t sub_21E53122C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  __int16 *v5;
  uint64_t *v6;
  uint64_t *v7;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * *(__int16 *)(*(_QWORD *)(a1 + 80) + 8 * *(__int16 *)(a1 + 28) + 2));
  v2 = *(_QWORD *)(v1 + 80);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = (uint64_t *)(v3 + 8 * *(__int16 *)(v1 + 34));
  v5 = (__int16 *)(*(_QWORD *)(v2 + 80) + 8 * *(__int16 *)(v2 + 28));
  v6 = (uint64_t *)(v3 + 8 * *v5);
  v7 = (uint64_t *)(v3 + 8 * v5[1]);
  do
  {
    if (v4 == v7)
      v4 = v6;
    else
      ++v4;
  }
  while (*v4 != v1 && (*(_DWORD *)(*v4 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, *v4);
}

int form_driver(FORM *a1, int a2)
{
  int v4;
  int *v5;
  uint64_t v6;
  unint64_t v7;
  WINDOW *win;
  WINDOW *sub;
  int v10;
  FORM *v11;
  int v12;
  unint64_t v14;
  uint64_t (*v15)(FORM *);
  int v16;
  _PAGE *v17;
  int pmin;
  int pmax;
  uint64_t v21;
  uint64_t v22;
  FIELD *v23;
  int x;
  int y;
  MEVENT v26;

  if (!a1)
  {
    v5 = __error();
    v4 = -2;
LABEL_55:
    *v5 = v4;
    return v4;
  }
  if (!a1->field)
  {
    v5 = __error();
    v4 = -11;
    goto LABEL_55;
  }
  if (a2 != -291056)
  {
    if ((a1->status & 2) != 0)
    {
      v5 = __error();
      v4 = -5;
      goto LABEL_55;
    }
    if ((a1->status & 1) == 0)
    {
      v5 = __error();
      v4 = -7;
      goto LABEL_55;
    }
    v6 = (a2 - 512);
    if (v6 <= 0x38)
    {
      v7 = *((unsigned int *)&unk_24E2B0300 + 4 * (a2 - 512));
      if (a2 == (unsigned __int16)v7)
      {
        if (WORD1(v7) > 8u)
        {
          v4 = -1;
LABEL_54:
          _nc_Refresh_Current_Field((uint64_t)a1);
          v5 = __error();
          goto LABEL_55;
        }
        v14 = v7 >> 16;
        v15 = (uint64_t (*)(FORM *))*((_QWORD *)&unk_24E2B0300 + 2 * v6 + 1);
        if (((0x1C4uLL >> v14) & 1) != 0)
          v16 = v15(a1);
        else
          v16 = ((uint64_t (*)(uint64_t (*)(FORM *), FORM *))off_24E2B0690[v14])(v15, a1);
LABEL_53:
        v4 = v16;
        goto LABEL_54;
      }
      goto LABEL_36;
    }
    if (a2 != 409)
    {
      if (a2 <= 0xFF
        && !(a2 > 0x7F
           ? __maskrune(a2, 0x200uLL)
           : *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a2 + 60) & 0x200))
      {
        v16 = sub_21E531988((uint64_t)a1, a2);
        goto LABEL_53;
      }
LABEL_36:
      v4 = -8;
      goto LABEL_54;
    }
    memset(&v26, 0, sizeof(v26));
    win = a1->win;
    if (!win)
      win = *(WINDOW **)(*MEMORY[0x24BEDCA70] + 152);
    if (a1->sub)
      sub = a1->sub;
    else
      sub = win;
    getmouse(&v26);
    if ((v26.bstate & 0x1C) != 0 && wenclose(win, v26.y, v26.x))
    {
      x = v26.x;
      y = v26.y;
      if (wmouse_trafo((const WINDOW *)*MEMORY[0x24BEDCAD8], &y, &x, 0))
      {
        v10 = *((__int16 *)sub + 4);
        if (y >= v10)
        {
          if (y <= *((__int16 *)sub + 2) + v10)
          {
            if (wenclose(sub, v26.y, v26.x))
            {
              x = v26.x;
              y = v26.y;
              if (wmouse_trafo(sub, &y, &x, 0))
              {
                v17 = &a1->page[a1->curpage];
                pmin = v17->pmin;
                pmax = v17->pmax;
                if (pmin <= pmax)
                {
                  v21 = pmin;
                  v22 = pmax + 1;
                  while (1)
                  {
                    v23 = a1->field[v21];
                    if ((~v23->opts & 3) == 0 && !sub_21E53191C((__int16 *)a1->field[v21], y, x))
                      break;
                    ++v21;
                    v4 = -12;
                    if (v22 == v21)
                      goto LABEL_54;
                  }
                  v4 = _nc_Set_Current_Field((uint64_t)a1, (uint64_t)v23);
                  if (!v4)
                  {
                    v4 = _nc_Position_Form_Cursor((uint64_t)a1);
                    if (!v4)
                      v4 = (LOBYTE(v26.bstate) << 28 >> 31) & 0xFFFFFFF8;
                  }
                  goto LABEL_54;
                }
              }
            }
          }
          else
          {
            if ((v26.bstate & 4) != 0)
            {
              v11 = a1;
              v12 = 516;
              goto LABEL_52;
            }
            if ((v26.bstate & 8) != 0)
            {
              v11 = a1;
              v12 = 512;
              goto LABEL_52;
            }
            if ((v26.bstate & 0x10) != 0)
            {
              v11 = a1;
              v12 = 519;
              goto LABEL_52;
            }
          }
        }
        else
        {
          if ((v26.bstate & 4) != 0)
          {
            v11 = a1;
            v12 = 517;
            goto LABEL_52;
          }
          if ((v26.bstate & 8) != 0)
          {
            v11 = a1;
            v12 = 513;
            goto LABEL_52;
          }
          if ((v26.bstate & 0x10) != 0)
          {
            v11 = a1;
            v12 = 518;
LABEL_52:
            v16 = form_driver(v11, v12);
            goto LABEL_53;
          }
        }
      }
    }
    v4 = -12;
    goto LABEL_54;
  }
  a1->current = (FIELD *)_nc_First_Active_Field((uint64_t)a1);
  v4 = 0;
  *__error() = 0;
  return v4;
}

uint64_t sub_21E5315FC(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  void (*v3)(uint64_t);
  void (*v4)(uint64_t);
  uint64_t v5;
  void (*v6)(uint64_t);
  void (*v7)(uint64_t);

  if (!_nc_Internal_Validation(a2))
    return 4294967283;
  if (a2)
  {
    v3 = *(void (**)(uint64_t))(a2 + 120);
    if (v3)
    {
      *(_WORD *)a2 |= 2u;
      v3(a2);
      *(_WORD *)a2 &= ~2u;
    }
    v4 = *(void (**)(uint64_t))(a2 + 104);
    if (v4)
    {
      *(_WORD *)a2 |= 2u;
      v4(a2);
      *(_WORD *)a2 &= ~2u;
    }
    v5 = a1(a2);
    v6 = *(void (**)(uint64_t))(a2 + 96);
    if (v6)
    {
      *(_WORD *)a2 |= 2u;
      v6(a2);
      *(_WORD *)a2 &= ~2u;
    }
    v7 = *(void (**)(uint64_t))(a2 + 112);
    if (v7)
    {
      *(_WORD *)a2 |= 2u;
      v7(a2);
      *(_WORD *)a2 &= ~2u;
    }
    return v5;
  }
  return a1(0);
}

uint64_t sub_21E531708(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  void (*v3)(uint64_t);
  uint64_t v4;
  void (*v5)(uint64_t);

  if (!_nc_Internal_Validation(a2))
    return 4294967283;
  if (a2)
  {
    v3 = *(void (**)(uint64_t))(a2 + 120);
    if (v3)
    {
      *(_WORD *)a2 |= 2u;
      v3(a2);
      *(_WORD *)a2 &= ~2u;
    }
    v4 = a1(a2);
    v5 = *(void (**)(uint64_t))(a2 + 112);
    if (v5)
    {
      *(_WORD *)a2 |= 2u;
      v5(a2);
      *(_WORD *)a2 &= ~2u;
    }
    return v4;
  }
  return a1(0);
}

uint64_t sub_21E5317C4(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  uint64_t result;

  if (*(_DWORD *)(*(_QWORD *)(a2 + 72) + 24) + *(__int16 *)(*(_QWORD *)(a2 + 72) + 2) == 1)
    return 4294967284;
  result = a1(a2);
  if (!(_DWORD)result)
    **(_WORD **)(a2 + 72) |= 2u;
  return result;
}

uint64_t sub_21E531820(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  if (*(_DWORD *)(*(_QWORD *)(a2 + 72) + 24) + *(__int16 *)(*(_QWORD *)(a2 + 72) + 2) == 1)
    return a1(a2);
  else
    return 4294967284;
}

uint64_t sub_21E53184C(uint64_t (*a1)(uint64_t a1), uint64_t a2)
{
  uint64_t result;
  uint64_t (*v4)(uint64_t);

  if (a1 == sub_21E533DC4)
  {
    if ((*(_BYTE *)(a2 + 32) & 2) != 0 && !*(_DWORD *)(a2 + 8) && !*(_DWORD *)(a2 + 12))
    {
      v4 = sub_21E532BE0;
      return sub_21E531708(v4, a2);
    }
  }
  else if (a1 == sub_21E533934)
  {
    if ((*(_BYTE *)(a2 + 32) & 1) == 0 || *(_DWORD *)(a2 + 8) || *(_DWORD *)(a2 + 12))
      return sub_21E533934(a2);
    v4 = sub_21E532B88;
    return sub_21E531708(v4, a2);
  }
  if ((*(_BYTE *)(*(_QWORD *)(a2 + 72) + 48) & 8) == 0)
    return 4294967284;
  result = a1(a2);
  if (!(_DWORD)result)
    *(_WORD *)a2 |= 0x10u;
  return result;
}

uint64_t sub_21E53191C(__int16 *a1, int a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  if (a1 && (v3 = a1[3], v3 <= a2) && a1[1] + v3 > a2 && (v4 = a1[4], v4 <= a3) && a1[2] + v4 > a3)
    v5 = 0;
  else
    v5 = 4294967283;
  *__error() = v5;
  return v5;
}

uint64_t sub_21E531988(uint64_t a1, chtype a2)
{
  uint64_t v2;
  int v3;
  WINDOW *v6;
  int v7;
  uint64_t v9;
  int v10;
  int v11;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_DWORD *)(v2 + 48);
  if ((~v3 & 0xA) != 0)
    goto LABEL_23;
  if ((v3 & 0x20) != 0 && !*(_DWORD *)(a1 + 8) && !*(_DWORD *)(a1 + 12) && (*(_WORD *)a1 & 0x30) == 0)
    werase(*(WINDOW **)(a1 + 56));
  v6 = *(WINDOW **)(a1 + 56);
  if ((*(_WORD *)a1 & 4) != 0)
  {
    waddch(v6, a2);
  }
  else
  {
    wmove(v6, *(_DWORD *)(a1 + 8), *(_DWORD *)(*(_QWORD *)(a1 + 72) + 16) - 1);
    v7 = winch(*(WINDOW **)(a1 + 56));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    if (v7 != 32 && v7 != *(_DWORD *)(*(_QWORD *)(a1 + 72) + 36))
    {
      if (*(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) != 1 || (*(_WORD *)v2 & 8) == 0)
      {
LABEL_23:
        v9 = 4294967284;
        goto LABEL_24;
      }
      if (!sub_21E532338(v2, 1))
      {
LABEL_32:
        v9 = 0xFFFFFFFFLL;
        goto LABEL_24;
      }
    }
    winsch(*(WINDOW **)(a1 + 56), a2);
  }
  v9 = sub_21E534664(a1);
  if (!(_DWORD)v9)
  {
    if (*(_DWORD *)(v2 + 12) - 1 == *(_DWORD *)(a1 + 8))
    {
      v10 = *(_DWORD *)(v2 + 16) - 1;
      v11 = *(_DWORD *)(a1 + 12);
      *(_WORD *)a1 |= 0x10u;
      if (v10 == v11)
      {
        if ((*(_WORD *)v2 & 8) != 0)
        {
          if (!sub_21E532338(v2, 1))
            goto LABEL_32;
        }
        else if ((*(_BYTE *)(v2 + 48) & 0x40) != 0)
        {
          v9 = sub_21E531708(sub_21E532B88, a1);
          goto LABEL_24;
        }
      }
    }
    else
    {
      *(_WORD *)a1 |= 0x10u;
    }
    if (!*(_DWORD *)(*(_QWORD *)(a1 + 56) + 176))
      sub_21E532F14(a1);
    v9 = 0;
  }
LABEL_24:
  *__error() = v9;
  return v9;
}

uint64_t form_driver_w(uint64_t a1, int a2, int a3)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  unint64_t v7;
  const WINDOW *v8;
  const WINDOW *v9;
  int v10;
  FORM *v11;
  int v12;
  unint64_t v13;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;
  __int16 *v16;
  int v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int x;
  int y;
  MEVENT v25;

  if (!a1)
  {
    v5 = __error();
    v4 = 4294967294;
LABEL_52:
    *v5 = v4;
    return v4;
  }
  if (!*(_QWORD *)(a1 + 64))
  {
    v5 = __error();
    v4 = 4294967285;
    goto LABEL_52;
  }
  if (a3 != -291056)
  {
    if ((*(_WORD *)a1 & 2) != 0)
    {
      v5 = __error();
      v4 = 4294967291;
      goto LABEL_52;
    }
    if ((*(_WORD *)a1 & 1) == 0)
    {
      v5 = __error();
      v4 = 4294967289;
      goto LABEL_52;
    }
    if (a2 == 256)
    {
      v6 = (a3 - 512);
      if (v6 <= 0x38)
      {
        v7 = *((unsigned int *)&unk_24E2B0300 + 4 * (a3 - 512));
        if (a3 == (unsigned __int16)v7)
        {
          if (WORD1(v7) > 8u)
          {
            v4 = 0xFFFFFFFFLL;
LABEL_51:
            _nc_Refresh_Current_Field(a1);
            v5 = __error();
            goto LABEL_52;
          }
          v13 = v7 >> 16;
          v14 = (uint64_t (*)(uint64_t))*((_QWORD *)&unk_24E2B0300 + 2 * v6 + 1);
          if (((0x1C4uLL >> v13) & 1) != 0)
            v15 = v14(a1);
          else
            v15 = ((uint64_t (*)(uint64_t (*)(uint64_t), uint64_t))off_24E2B0690[v13])(v14, a1);
LABEL_50:
          v4 = v15;
          goto LABEL_51;
        }
        goto LABEL_31;
      }
    }
    if (a3 != 409)
    {
      if (!a2)
      {
        v15 = sub_21E531E70(a1);
        goto LABEL_50;
      }
LABEL_31:
      v4 = 4294967288;
      goto LABEL_51;
    }
    memset(&v25, 0, sizeof(v25));
    v8 = *(const WINDOW **)(a1 + 40);
    if (!v8)
      v8 = *(const WINDOW **)(*MEMORY[0x24BEDCA70] + 152);
    if (*(_QWORD *)(a1 + 48))
      v9 = *(const WINDOW **)(a1 + 48);
    else
      v9 = v8;
    getmouse(&v25);
    if ((v25.bstate & 0x1C) != 0 && wenclose(v8, v25.y, v25.x))
    {
      x = v25.x;
      y = v25.y;
      if (wmouse_trafo((const WINDOW *)*MEMORY[0x24BEDCAD8], &y, &x, 0))
      {
        v10 = *((__int16 *)v9 + 4);
        if (y >= v10)
        {
          if (y <= *((__int16 *)v9 + 2) + v10)
          {
            if (wenclose(v9, v25.y, v25.x))
            {
              x = v25.x;
              y = v25.y;
              if (wmouse_trafo(v9, &y, &x, 0))
              {
                v16 = (__int16 *)(*(_QWORD *)(a1 + 80) + 8 * *(__int16 *)(a1 + 28));
                v17 = *v16;
                v18 = v16[1];
                if (v17 <= v18)
                {
                  v20 = v17;
                  v21 = v18 + 1;
                  while (1)
                  {
                    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v20);
                    if ((~*(_DWORD *)(v22 + 48) & 3) == 0
                      && !sub_21E53191C(*(__int16 **)(*(_QWORD *)(a1 + 64) + 8 * v20), y, x))
                    {
                      break;
                    }
                    ++v20;
                    v4 = 4294967284;
                    if (v21 == v20)
                      goto LABEL_51;
                  }
                  v4 = _nc_Set_Current_Field(a1, v22);
                  if (!(_DWORD)v4)
                  {
                    v4 = _nc_Position_Form_Cursor(a1);
                    if (!(_DWORD)v4)
                      v4 = (LOBYTE(v25.bstate) << 28 >> 31) & 0xFFFFFFF8;
                  }
                  goto LABEL_51;
                }
              }
            }
          }
          else
          {
            if ((v25.bstate & 4) != 0)
            {
              v11 = (FORM *)a1;
              v12 = 516;
              goto LABEL_49;
            }
            if ((v25.bstate & 8) != 0)
            {
              v11 = (FORM *)a1;
              v12 = 512;
              goto LABEL_49;
            }
            if ((v25.bstate & 0x10) != 0)
            {
              v11 = (FORM *)a1;
              v12 = 519;
              goto LABEL_49;
            }
          }
        }
        else
        {
          if ((v25.bstate & 4) != 0)
          {
            v11 = (FORM *)a1;
            v12 = 517;
            goto LABEL_49;
          }
          if ((v25.bstate & 8) != 0)
          {
            v11 = (FORM *)a1;
            v12 = 513;
            goto LABEL_49;
          }
          if ((v25.bstate & 0x10) != 0)
          {
            v11 = (FORM *)a1;
            v12 = 518;
LABEL_49:
            v15 = form_driver(v11, v12);
            goto LABEL_50;
          }
        }
      }
    }
    v4 = 4294967284;
    goto LABEL_51;
  }
  *(_QWORD *)(a1 + 72) = _nc_First_Active_Field(a1);
  v4 = 0;
  *__error() = 0;
  return v4;
}

uint64_t sub_21E531E70(uint64_t a1)
{
  uint64_t v1;
  int v3;
  uint64_t v4;
  int v5;
  int v6;

  v1 = *(_QWORD *)(a1 + 72);
  if ((~*(_DWORD *)(v1 + 48) & 0xA) != 0)
    goto LABEL_12;
  setcchar();
  if ((*(_BYTE *)(v1 + 48) & 0x20) != 0 && !*(_DWORD *)(a1 + 8) && !*(_DWORD *)(a1 + 12) && (*(_WORD *)a1 & 0x30) == 0)
    werase(*(WINDOW **)(a1 + 56));
  if ((*(_WORD *)a1 & 4) != 0)
  {
    wadd_wch();
  }
  else
  {
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(*(_QWORD *)(a1 + 72) + 16) - 1);
    v3 = winch(*(WINDOW **)(a1 + 56));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    if (v3 != 32 && v3 != *(_DWORD *)(*(_QWORD *)(a1 + 72) + 36))
    {
      if (*(_DWORD *)(v1 + 24) + *(__int16 *)(v1 + 2) != 1 || (*(_WORD *)v1 & 8) == 0)
      {
LABEL_12:
        v4 = 4294967284;
        goto LABEL_26;
      }
      if (!sub_21E532338(v1, 1))
        goto LABEL_28;
    }
    wins_wch();
  }
  v4 = sub_21E534664(a1);
  if ((_DWORD)v4)
    goto LABEL_26;
  if (*(_DWORD *)(v1 + 12) - 1 == *(_DWORD *)(a1 + 8))
  {
    v5 = *(_DWORD *)(v1 + 16) - 1;
    v6 = *(_DWORD *)(a1 + 12);
    *(_WORD *)a1 |= 0x10u;
    if (v5 == v6)
    {
      if ((*(_WORD *)v1 & 8) == 0)
      {
        if ((*(_BYTE *)(v1 + 48) & 0x40) != 0)
        {
          v4 = sub_21E531708(sub_21E532B88, a1);
          goto LABEL_26;
        }
        goto LABEL_23;
      }
      if (!sub_21E532338(v1, 1))
      {
LABEL_28:
        v4 = 0xFFFFFFFFLL;
        goto LABEL_26;
      }
    }
  }
  else
  {
    *(_WORD *)a1 |= 0x10u;
  }
LABEL_23:
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 56) + 176))
    sub_21E532F14(a1);
  v4 = 0;
LABEL_26:
  *__error() = v4;
  return v4;
}

int set_field_buffer(FIELD *a1, int a2, const char *a3)
{
  int v3;
  int v7;
  int v8;
  int v9;
  WINDOW *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  int v14;
  _DWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _OWORD *v20;
  __int128 v21;
  int v22;
  int v23;
  BOOL v24;
  uint64_t v26;
  __int128 *v27;
  __int128 v28;

  v3 = -2;
  if (a2 < 0 || !a1 || !a3 || a1->nbuf < a2)
    goto LABEL_38;
  v7 = a1->dcols * a1->drows;
  if ((a1->status & 8) != 0)
  {
    v8 = strlen(a3);
    if (v8 > v7)
    {
      if (!sub_21E532338((uint64_t)a1, (v8 - v7) / ((a1->nrow + a1->rows) * a1->cols) + 1))
      {
LABEL_31:
        v3 = -1;
        goto LABEL_38;
      }
      v7 = a1->dcols * a1->drows;
    }
  }
  v9 = wresize(*(WINDOW **)&a1[1].fcol, 1, v7 + 1);
  v10 = *(WINDOW **)&a1[1].fcol;
  if (v9 == -1)
  {
    delwin(v10);
    v10 = newpad(1, a1->dcols * a1->drows + 1);
    *(_QWORD *)&a1[1].fcol = v10;
  }
  v11 = (a1->dcols * a1->drows);
  wclear(v10);
  if (wmove(*(WINDOW **)&a1[1].fcol, 0, 0) != -1)
    waddnstr(*(WINDOW **)&a1[1].fcol, a3, -1);
  v12 = (char *)calloc((int)v11 + 1, 0x1CuLL);
  if (!v12)
    goto LABEL_31;
  v13 = v12;
  if (a1->drows >= 1)
  {
    v14 = 0;
    do
    {
      if (wmove(*(WINDOW **)&a1[1].fcol, 0, a1->dcols * v14) != -1)
        win_wchnstr();
      ++v14;
    }
    while (v14 < a1->drows);
  }
  if ((int)v11 >= 1)
  {
    v15 = (_DWORD *)((uint64_t (*)(void))*MEMORY[0x24BEDCA78])();
    v17 = 0;
    v18 = 0;
    while (1)
    {
      v19 = &v13[v17];
      if (!*(_DWORD *)&v13[v17]
        && !*((_DWORD *)v19 + 1)
        && !*(_DWORD *)&v13[v17 + 8]
        && !*(_QWORD *)&v13[v17 + 12]
        && !*(_DWORD *)&v13[v17 + 20]
        && (*v15 < 0x60000u || !*(_DWORD *)&v13[v17 + 24]))
      {
        break;
      }
      v20 = (_OWORD *)(v16 + v17);
      v21 = *(_OWORD *)v19;
      *(_OWORD *)((char *)v20 + 12) = *(_OWORD *)(v19 + 12);
      *v20 = v21;
      ++v18;
      v17 += 28;
      if (28 * v11 == v17)
        goto LABEL_29;
    }
    if ((int)v11 > (int)v18)
    {
      v26 = v11 - v18;
      v27 = (__int128 *)(v16 + v17);
      do
      {
        v28 = xmmword_2553E3E48;
        *(__int128 *)((char *)v27 + 12) = *(__int128 *)((char *)&xmmword_2553E3E48 + 12);
        *v27 = v28;
        v27 = (__int128 *)((char *)v27 + 28);
        --v26;
      }
      while (v26);
    }
  }
LABEL_29:
  free(v13);
  if (a2)
  {
    v3 = 0;
  }
  else
  {
    v22 = sub_21E532718((uint64_t)a1);
    v23 = sub_21E531014((uint64_t)a1);
    if (v23)
      v24 = v22 == 0;
    else
      v24 = 0;
    if (v24)
      v3 = v23;
    else
      v3 = v22;
  }
LABEL_38:
  *__error() = v3;
  return v3;
}

uint64_t sub_21E532338(uint64_t a1, int a2)
{
  _BOOL8 v3;
  int v6;
  __int128 *v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  __int128 *v27;
  uint64_t v28;
  uint64_t v29;
  _OWORD *v30;
  uint64_t v31;
  __int128 *v32;
  __int128 v33;
  int v34;
  __int128 *v35;
  unint64_t v36;
  __int128 v37;
  uint64_t v38;
  int v40;
  char v41;
  WINDOW *v42;
  WINDOW *v43;
  WINDOW *v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int v48;
  int v49;
  _QWORD *v50;
  int v51;
  int v52;

  if (!a1 || (*(_WORD *)a1 & 8) == 0)
    return 0;
  v6 = *(_DWORD *)(a1 + 24) + *(__int16 *)(a1 + 2);
  v51 = *(_DWORD *)(a1 + 16);
  v52 = *(_DWORD *)(a1 + 12);
  v7 = *(__int128 **)(a1 + 104);
  v8 = *(_QWORD *)(a1 + 80);
  if (v8 && (v9 = *(_WORD *)v8, (*(_WORD *)v8 & 1) != 0) && *(_QWORD *)(v8 + 72) == a1)
  {
    if ((v9 & 0x10) != 0)
    {
      *(_WORD *)v8 = v9 & 0xFFCF | 0x20;
      _nc_get_fieldbuffer(v8, (_DWORD *)a1, (uint64_t)v7);
      wmove(*(WINDOW **)(v8 + 56), *(_DWORD *)(v8 + 8), *(_DWORD *)(v8 + 12));
    }
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }
  if (v6 == 1)
  {
    v11 = *(__int16 *)(a1 + 4) * a2;
    v12 = *(_DWORD *)(a1 + 16);
    v13 = *(_DWORD *)(a1 + 20);
    v14 = v13 - v12;
    if (v13 - v12 >= v11)
      v14 = *(__int16 *)(a1 + 4) * a2;
    if (v13)
      v11 = v14;
    v15 = v12 + v11;
    *(_DWORD *)(a1 + 16) = v15;
  }
  else
  {
    v13 = *(_DWORD *)(a1 + 20);
    v16 = (*(_DWORD *)(a1 + 24) + *(__int16 *)(a1 + 2)) * a2;
    v17 = *(_DWORD *)(a1 + 12);
    v18 = v13 - v17;
    if (v13 - v17 >= v16)
      v18 = (*(_DWORD *)(a1 + 24) + *(__int16 *)(a1 + 2)) * a2;
    if (v13)
      v16 = v18;
    v15 = v17 + v16;
    *(_DWORD *)(a1 + 12) = v15;
  }
  if (v15 == v13)
    *(_WORD *)a1 &= ~8u;
  v19 = *(int *)(a1 + 16) * (uint64_t)*(int *)(a1 + 12);
  v20 = v19 + 1;
  v21 = *(__int16 *)(a1 + 28);
  v22 = malloc(28 * (v20 + v20 * v21));
  if (!v22)
  {
    *(_DWORD *)(a1 + 12) = v52;
    *(_DWORD *)(a1 + 16) = v51;
    if (v6 == 1)
    {
      if (v51 != v13)
        goto LABEL_55;
    }
    else if (v52 != v13)
    {
LABEL_55:
      v3 = 0;
      *(_WORD *)a1 |= 8u;
      return v3;
    }
    return 0;
  }
  v23 = v22;
  *(_QWORD *)(a1 + 104) = v22;
  if ((v21 & 0x80000000) == 0)
  {
    v24 = 0;
    v25 = 0;
    v26 = v51 * v52;
    v27 = v7;
    do
    {
      v28 = *(_QWORD *)(a1 + 104);
      v29 = *(int *)(a1 + 16) * (uint64_t)*(int *)(a1 + 12) + 1;
      if (v26 < 1)
      {
        v34 = 0;
      }
      else
      {
        v30 = (_OWORD *)(v28 + v24 * v29);
        v31 = (v51 * v52);
        v32 = v27;
        do
        {
          v33 = *v32;
          *(_OWORD *)((char *)v30 + 12) = *(__int128 *)((char *)v32 + 12);
          *v30 = v33;
          v30 = (_OWORD *)((char *)v30 + 28);
          v32 = (__int128 *)((char *)v32 + 28);
          --v31;
        }
        while (v31);
        v34 = v51 * v52;
      }
      if (v34 < (int)v19)
      {
        v35 = (__int128 *)(v28 + 28 * (v26 & ~(v26 >> 31)) + v24 * v29);
        v36 = v19 - (unint64_t)(v26 & ~(v26 >> 31));
        do
        {
          v37 = xmmword_2553E3E48;
          *(__int128 *)((char *)v35 + 12) = *(__int128 *)((char *)&xmmword_2553E3E48 + 12);
          *v35 = v37;
          v35 = (__int128 *)((char *)v35 + 28);
          --v36;
        }
        while (v36);
      }
      v38 = v28 + 28 * v25 * v29 + 28 * (int)v19;
      *(_QWORD *)v38 = 0;
      *(_QWORD *)(v38 + 8) = 0;
      *(_DWORD *)(v38 + 24) = 0;
      *(_QWORD *)(v38 + 16) = 0;
      v27 = (__int128 *)((char *)v27 + 28 * v26 + 28);
      v24 += 28;
    }
    while (v25++ < *(__int16 *)(a1 + 28));
    LODWORD(v20) = *(_DWORD *)(a1 + 16) * *(_DWORD *)(a1 + 12) + 1;
  }
  v40 = wresize(*(WINDOW **)(a1 + 128), 1, v20);
  v3 = v40 != -1;
  if (v40 == -1)
    v41 = 1;
  else
    v41 = v10;
  if ((v41 & 1) != 0)
  {
    if (v40 == -1)
    {
LABEL_51:
      *(_DWORD *)(a1 + 12) = v52;
      *(_DWORD *)(a1 + 16) = v51;
      *(_QWORD *)(a1 + 104) = v7;
      v49 = *(_DWORD *)(a1 + 20);
      if (v6 == 1)
      {
        if (v51 == v49)
          goto LABEL_61;
      }
      else if (v52 == v49)
      {
LABEL_61:
        free(v23);
        return 0;
      }
      *(_WORD *)a1 |= 8u;
      goto LABEL_61;
    }
  }
  else
  {
    v42 = newpad(*(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 16));
    if (!v42)
      goto LABEL_51;
    v43 = v42;
    v44 = *(WINDOW **)(v8 + 56);
    if (v44)
      delwin(v44);
    *(_QWORD *)(v8 + 56) = v43;
    wbkgdset(v43, *(_DWORD *)(a1 + 44) | *(_DWORD *)(a1 + 36));
    v45 = *(_QWORD *)(v8 + 56);
    if (v45)
    {
      v46 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)(v45 + 116) = BYTE1(v46);
      *(_DWORD *)(v45 + 16) = v46;
    }
    werase((WINDOW *)v45);
    sub_21E5306CC(a1, *(WINDOW **)(v8 + 56));
    v47 = *(_QWORD *)(v8 + 56);
    if (v47)
      v48 = *(__int16 *)(v47 + 4) + 1;
    else
      v48 = -1;
    wtouchln((WINDOW *)v47, 0, v48, 0);
    wmove(*(WINDOW **)(v8 + 56), *(_DWORD *)(v8 + 8), *(_DWORD *)(v8 + 12));
  }
  free(v7);
  v50 = *(_QWORD **)(a1 + 72);
  if (v50 == (_QWORD *)a1)
    return 1;
  do
  {
    v50[13] = *(_QWORD *)(a1 + 104);
    *(_QWORD *)((char *)v50 + 12) = *(_QWORD *)(a1 + 12);
    v50 = (_QWORD *)v50[9];
  }
  while (v50 != (_QWORD *)a1);
  return v3;
}

uint64_t sub_21E532718(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 80);
    if (!v2
      || (*(_WORD *)v2 & 1) == 0
      || (*(_BYTE *)(a1 + 48) & 1) == 0
      || *(unsigned __int16 *)(a1 + 32) != *(unsigned __int16 *)(v2 + 28))
    {
      result = 0;
      goto LABEL_9;
    }
    if (*(_QWORD *)(v2 + 72) != a1)
    {
      result = sub_21E5307D0(a1, 0);
LABEL_9:
      *(_WORD *)a1 |= 1u;
      return result;
    }
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 16) = 0;
    werase(*(WINDOW **)(v2 + 56));
    v4 = *(_DWORD *)(a1 + 48);
    if ((v4 & 4) != 0 && *(_WORD *)(a1 + 30) && *(_DWORD *)(a1 + 24) + *(__int16 *)(a1 + 2) == 1)
    {
      if ((v4 & 0x200) != 0)
      {
        if ((v4 & 0x400) != 0 || *(_DWORD *)(a1 + 16) == *(__int16 *)(a1 + 4))
          goto LABEL_21;
      }
      else if ((v4 & 0x400) != 0)
      {
LABEL_21:
        sub_21E5305F4(a1, *(WINDOW **)(v2 + 56));
        goto LABEL_20;
      }
    }
    sub_21E5306CC(a1, *(WINDOW **)(v2 + 56));
LABEL_20:
    *(_WORD *)a1 |= 2u;
    result = _nc_Refresh_Current_Field(v2);
    goto LABEL_9;
  }
  return 4294967294;
}

char *__cdecl field_buffer(const FIELD *a1, int a2)
{
  char *v2;
  FIELD_CELL *buf;
  uint64_t v6;
  int v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _DWORD *v13;

  v2 = 0;
  if (a1 && (a2 & 0x80000000) == 0)
  {
    if (a1->nbuf >= a2)
    {
      buf = a1->buf;
      v6 = (a1->dcols * a1->drows);
      v7 = a2 + a2 * v6;
      if ((int)v6 < 1)
      {
        v8 = 0;
      }
      else
      {
        v8 = 0;
        v9 = (_DWORD *)buf + 7 * v7 + 1;
        v10 = (a1->dcols * a1->drows);
        do
        {
          if ((*(v9 - 1) & 0xFEu) - 2 >= 0x1E && *v9)
            v8 += _nc_wcrtomb();
          v9 += 7;
          --v10;
        }
        while (v10);
      }
      v11 = *(_QWORD *)&a1[1].status;
      v12 = *(void **)(v11 + 8 * a2);
      if (v12)
      {
        free(v12);
        v11 = *(_QWORD *)&a1[1].status;
      }
      *(_QWORD *)(v11 + 8 * a2) = malloc(v8 + 1);
      v2 = *(char **)(*(_QWORD *)&a1[1].status + 8 * a2);
      if (v2)
      {
        wclear(*(WINDOW **)&a1[1].fcol);
        wmove(*(WINDOW **)&a1[1].fcol, 0, 0);
        if ((int)v6 >= 1)
        {
          v13 = (_DWORD *)buf + 7 * v7;
          do
          {
            if ((*v13 & 0xFEu) - 2 >= 0x1E && v13[1])
              wadd_wch();
            v13 += 7;
            --v6;
          }
          while (v6);
        }
        wmove(*(WINDOW **)&a1[1].fcol, 0, 0);
        winnstr(*(WINDOW **)&a1[1].fcol, v2, v8);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

_DWORD *_nc_Widen_String(const char *a1, unsigned int *a2)
{
  size_t v3;
  char v4;
  size_t v5;
  unsigned int v6;
  const char *v7;
  size_t v8;
  char v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  _DWORD *v14;
  _DWORD *v17;
  __int32 v18;

  v18 = 0;
  v3 = strlen(a1);
  v17 = 0;
  v4 = 1;
  while (v3)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      while (v3 == v5)
      {
LABEL_8:
        if ((v4 & 1) == 0)
        {
          v17[v6] = a1[v5];
          v13 = 1;
          goto LABEL_15;
        }
        ++v5;
        ++v6;
        if (v5 >= v3)
          goto LABEL_17;
      }
      v7 = &a1[v5];
      v8 = 1;
      while (1)
      {
        v9 = v7[v8];
        v7[v8] = 0;
        v10 = mblen(0, 0);
        *__error() = v10;
        v11 = mbtowc(0, 0, 0);
        *__error() = v11;
        v12 = mbtowc(&v18, &a1[v5], v8);
        v7[v8] = v9;
        if (v12 >= 1)
          break;
        if (++v8 > v3 - v5)
          goto LABEL_8;
      }
      if ((v4 & 1) == 0)
        v17[v6] = v18;
      v13 = v12;
LABEL_15:
      v5 += v13;
      ++v6;
    }
    while (v5 < v3);
    if ((v4 & 1) == 0)
      return v17;
LABEL_17:
    if (!v6)
      return v17;
    v14 = calloc(v6, 4uLL);
    v4 = 0;
    *a2 = v6;
    v17 = v14;
    if (!v14)
      return 0;
  }
  return v17;
}

uint64_t sub_21E532B34(uint64_t a1)
{
  return _nc_Set_Form_Page(a1, (*(__int16 *)(a1 + 28) + 1) % *(__int16 *)(a1 + 26), 0);
}

uint64_t sub_21E532B50(uint64_t a1)
{
  __int16 v1;

  v1 = *(_WORD *)(a1 + 28);
  if (!v1)
    v1 = *(_WORD *)(a1 + 26);
  return _nc_Set_Form_Page(a1, v1 - 1, 0);
}

uint64_t sub_21E532B6C(uint64_t a1)
{
  return _nc_Set_Form_Page(a1, 0, 0);
}

uint64_t sub_21E532B78(uint64_t a1)
{
  return _nc_Set_Form_Page(a1, *(__int16 *)(a1 + 26) - 1, 0);
}

uint64_t sub_21E532B88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  __int16 *v5;
  uint64_t *v6;
  uint64_t *v7;

  v1 = *(_QWORD *)(a1 + 72);
  v2 = *(_QWORD *)(v1 + 80);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = (uint64_t *)(v3 + 8 * *(__int16 *)(v1 + 34));
  v5 = (__int16 *)(*(_QWORD *)(v2 + 80) + 8 * *(__int16 *)(v2 + 28));
  v6 = (uint64_t *)(v3 + 8 * *v5);
  v7 = (uint64_t *)(v3 + 8 * v5[1]);
  do
  {
    if (v4 == v7)
      v4 = v6;
    else
      ++v4;
  }
  while (*v4 != v1 && (*(_DWORD *)(*v4 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, *v4);
}

uint64_t sub_21E532BE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  __int16 *v5;
  uint64_t *v6;
  uint64_t *v7;

  v1 = *(_QWORD *)(a1 + 72);
  v2 = *(_QWORD *)(v1 + 80);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = (uint64_t *)(v3 + 8 * *(__int16 *)(v1 + 34));
  v5 = (__int16 *)(*(_QWORD *)(v2 + 80) + 8 * *(__int16 *)(v2 + 28));
  v6 = (uint64_t *)(v3 + 8 * *v5);
  v7 = (uint64_t *)(v3 + 8 * v5[1]);
  do
  {
    if (v4 == v6)
      v4 = v7;
    else
      --v4;
  }
  while (*v4 != v1 && (*(_DWORD *)(*v4 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, *v4);
}

uint64_t sub_21E532C38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  __int16 *v5;
  uint64_t *v6;
  uint64_t *v7;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * *(__int16 *)(*(_QWORD *)(a1 + 80) + 8 * *(__int16 *)(a1 + 28)));
  v2 = *(_QWORD *)(v1 + 80);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = (uint64_t *)(v3 + 8 * *(__int16 *)(v1 + 34));
  v5 = (__int16 *)(*(_QWORD *)(v2 + 80) + 8 * *(__int16 *)(v2 + 28));
  v6 = (uint64_t *)(v3 + 8 * *v5);
  v7 = (uint64_t *)(v3 + 8 * v5[1]);
  do
  {
    if (v4 == v6)
      v4 = v7;
    else
      --v4;
  }
  while (*v4 != v1 && (*(_DWORD *)(*v4 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, *v4);
}

uint64_t sub_21E532CA4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 72);
  do
    v1 = *(_QWORD *)(v1 + 56);
  while (v1 != *(_QWORD *)(a1 + 72) && (*(_DWORD *)(v1 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, v1);
}

uint64_t sub_21E532CC8(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 72);
  do
    v1 = *(_QWORD *)(v1 + 64);
  while (v1 != *(_QWORD *)(a1 + 72) && (*(_DWORD *)(v1 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, v1);
}

uint64_t sub_21E532CEC(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * *(__int16 *)(*(_QWORD *)(a1 + 80) + 8 * *(__int16 *)(a1 + 28) + 6));
  do
    v1 = *(_QWORD *)(v1 + 56);
  while (v1 != *(_QWORD *)(*(_QWORD *)(a1 + 64)
                          + 8 * *(__int16 *)(*(_QWORD *)(a1 + 80) + 8 * *(__int16 *)(a1 + 28) + 6))
       && (*(_DWORD *)(v1 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, v1);
}

uint64_t sub_21E532D24(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * *(__int16 *)(*(_QWORD *)(a1 + 80) + 8 * *(__int16 *)(a1 + 28) + 4));
  do
    v1 = *(_QWORD *)(v1 + 64);
  while (v1 != *(_QWORD *)(*(_QWORD *)(a1 + 64)
                          + 8 * *(__int16 *)(*(_QWORD *)(a1 + 80) + 8 * *(__int16 *)(a1 + 28) + 4))
       && (*(_DWORD *)(v1 + 48) & 3) != 3);
  return _nc_Set_Current_Field(a1, v1);
}

uint64_t sub_21E532D5C(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 72);
  v2 = *(unsigned __int16 *)(v1 + 6);
  v3 = v1;
  while (1)
  {
    v3 = *(_QWORD *)(v3 + 64);
    if (v3 == v1 || (*(_DWORD *)(v3 + 48) & 3) == 3)
    {
      v1 = v3;
      if (*(unsigned __int16 *)(v3 + 6) == v2)
        break;
    }
  }
  return _nc_Set_Current_Field(a1, v3);
}

uint64_t sub_21E532D94(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 72);
  v2 = *(unsigned __int16 *)(v1 + 6);
  v3 = v1;
  while (1)
  {
    v3 = *(_QWORD *)(v3 + 56);
    if (v3 == v1 || (*(_DWORD *)(v3 + 48) & 3) == 3)
    {
      v1 = v3;
      if (*(unsigned __int16 *)(v3 + 6) == v2)
        break;
    }
  }
  return _nc_Set_Current_Field(a1, v3);
}

uint64_t sub_21E532DCC(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  int v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 72);
  v2 = *(unsigned __int16 *)(v1 + 6);
  v3 = *(unsigned __int16 *)(v1 + 8);
  v4 = v1;
  while (1)
  {
    do
      v4 = *(_QWORD *)(v4 + 64);
    while (v4 != v1 && (*(_DWORD *)(v4 + 48) & 3) != 3);
    v6 = *(unsigned __int16 *)(v4 + 6);
    if (v6 != v2)
      break;
    v1 = v4;
    if (*(unsigned __int16 *)(v4 + 8) == v3)
      return _nc_Set_Current_Field(a1, v4);
  }
  while (*(__int16 *)(v4 + 8) > (__int16)v3)
  {
    v7 = v4;
    do
      v7 = *(_QWORD *)(v7 + 64);
    while (v7 != v4 && (*(_DWORD *)(v7 + 48) & 3) != 3);
    v4 = v7;
    if (*(unsigned __int16 *)(v7 + 6) != v6)
    {
      v4 = v7;
      do
        v4 = *(_QWORD *)(v4 + 56);
      while (v4 != v7 && (*(_DWORD *)(v4 + 48) & 3) != 3);
      return _nc_Set_Current_Field(a1, v4);
    }
  }
  return _nc_Set_Current_Field(a1, v4);
}

uint64_t sub_21E532E70(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  int v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 72);
  v2 = *(unsigned __int16 *)(v1 + 6);
  v3 = *(unsigned __int16 *)(v1 + 8);
  v4 = v1;
  while (1)
  {
    do
      v4 = *(_QWORD *)(v4 + 56);
    while (v4 != v1 && (*(_DWORD *)(v4 + 48) & 3) != 3);
    v6 = *(unsigned __int16 *)(v4 + 6);
    if (v6 != v2)
      break;
    v1 = v4;
    if (*(unsigned __int16 *)(v4 + 8) == v3)
      return _nc_Set_Current_Field(a1, v4);
  }
  while (*(__int16 *)(v4 + 8) < (__int16)v3)
  {
    v7 = v4;
    do
      v7 = *(_QWORD *)(v7 + 56);
    while (v7 != v4 && (*(_DWORD *)(v7 + 48) & 3) != 3);
    v4 = v7;
    if (*(unsigned __int16 *)(v7 + 6) != v6)
    {
      v4 = v7;
      do
        v4 = *(_QWORD *)(v4 + 64);
      while (v4 != v7 && (*(_DWORD *)(v4 + 48) & 3) != 3);
      return _nc_Set_Current_Field(a1, v4);
    }
  }
  return _nc_Set_Current_Field(a1, v4);
}

uint64_t sub_21E532F14(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = sub_21E534568(*(_QWORD *)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  v4 = *(_DWORD *)(a1 + 12) + v3;
  *(_DWORD *)(a1 + 12) = v4;
  if (v4 != *(_DWORD *)(v2 + 16))
    return 0;
  v5 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 8) = v5 + 1;
  if (v5 + 1 == *(_DWORD *)(v2 + 12))
  {
    v6 = v3;
    v7 = *(__int16 *)(v2 + 2);
    v8 = *(_DWORD *)(v2 + 24);
    if (v8 + v7 != 1)
    {
      if ((sub_21E532338(v2, 1) & 1) != 0)
        goto LABEL_5;
      v7 = *(__int16 *)(v2 + 2);
      v8 = *(_DWORD *)(v2 + 24);
      v5 = *(_DWORD *)(a1 + 8) - 1;
    }
    *(_DWORD *)(a1 + 8) = v5;
    if (v8 + v7 != 1 || (sub_21E532338(v2, 1) & 1) == 0)
    {
      v9 = *(_DWORD *)(a1 + 12) - v6;
      result = 4294967284;
      goto LABEL_11;
    }
    return 0;
  }
LABEL_5:
  v9 = 0;
  result = 0;
LABEL_11:
  *(_DWORD *)(a1 + 12) = v9;
  return result;
}

uint64_t sub_21E532FF4(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t result;
  int v5;

  v2 = sub_21E534568(*(_QWORD *)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12) - 1);
  v3 = *(_DWORD *)(a1 + 12);
  *(_DWORD *)(a1 + 12) = v3 - v2;
  if (v3 - v2 >= 0)
    return 0;
  v5 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 8) = v5 - 1;
  if (v5 <= 0)
  {
    *(_DWORD *)(a1 + 8) = v5;
    result = 4294967284;
  }
  else
  {
    result = 0;
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 72) + 16) - 1;
  }
  *(_DWORD *)(a1 + 12) = v3;
  return result;
}

uint64_t sub_21E53306C(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 8) = v3 + 1;
  if (v3 + 1 == *(_DWORD *)(v2 + 12))
  {
    if (*(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) != 1)
    {
      if ((sub_21E532338(v2, 1) & 1) != 0)
        return 0;
      v3 = *(_DWORD *)(a1 + 8) - 1;
    }
    *(_DWORD *)(a1 + 8) = v3;
    return 4294967284;
  }
  else
  {
    result = 0;
    *(_DWORD *)(a1 + 12) = 0;
  }
  return result;
}

uint64_t sub_21E5330E8(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 8) = v1 - 1;
  if (v1 <= 0)
  {
    *(_DWORD *)(a1 + 8) = v1;
    return 4294967284;
  }
  else
  {
    v2 = 0;
    *(_DWORD *)(a1 + 12) = 0;
  }
  return v2;
}

uint64_t sub_21E533118(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(v2 + 104);
  v4 = *(_DWORD *)(v2 + 16);
  v5 = v3 + 28 * *(_DWORD *)(a1 + 8) * v4 + 28 * *(int *)(a1 + 12);
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, v3);
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    v4 = *(_DWORD *)(v2 + 16);
    v3 = *(_QWORD *)(v2 + 104);
  }
  v6 = v4 * *(_DWORD *)(v2 + 12);
  v7 = v6 + 1227133513 * ((unint64_t)(v5 - v3) >> 2);
  v8 = v5 + 28 * v7;
  if (v7 < 1)
  {
    v9 = v5;
  }
  else
  {
    v9 = v5;
    do
    {
      if (*(_DWORD *)(v9 + 4) == 32 && !*(_DWORD *)(v9 + 8))
        break;
      v9 += 28;
    }
    while (v9 < v8);
  }
  if (v9 == v8)
    v10 = v5;
  else
    v10 = v9;
  v11 = v6 + 1227133513 * ((unint64_t)(v10 - v3) >> 2);
  v12 = v10 + 28 * v11;
  if (v11 < 1)
  {
    v13 = v10;
  }
  else
  {
    v13 = v10;
    do
    {
      if (*(_DWORD *)(v13 + 4) != 32)
        break;
      if (*(_DWORD *)(v13 + 8))
        break;
      v13 += 28;
    }
    while (v13 < v12);
  }
  if (v13 == v12)
    v14 = v10;
  else
    v14 = v13;
  v15 = *(_QWORD *)(a1 + 72);
  v16 = -1227133513 * ((unint64_t)(v14 - *(_QWORD *)(v15 + 104)) >> 2);
  v17 = *(_DWORD *)(v15 + 12);
  v18 = v16 / *(_DWORD *)(v15 + 16);
  v19 = v16 - v18 * *(__int16 *)(v15 + 4);
  *(_DWORD *)(a1 + 8) = v18;
  *(_DWORD *)(a1 + 12) = v19;
  if (v17 < v18)
    *(_DWORD *)(a1 + 8) = 0;
  return 0;
}

uint64_t sub_21E533280(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(v2 + 104);
  v4 = v3 + 28 * *(_DWORD *)(a1 + 8) * *(_DWORD *)(v2 + 16) + 28 * *(int *)(a1 + 12);
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, v3);
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    v3 = *(_QWORD *)(v2 + 104);
  }
  v5 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v4 - v3) >> 2);
  v6 = v3 + 28 * (int)v5;
  if ((int)v5 >= 1)
  {
    do
    {
      if (*(_DWORD *)(v6 - 24) != 32)
        break;
      if (*(_DWORD *)(v6 - 20))
        break;
      v6 -= 28;
    }
    while (v6 > v3);
  }
  v7 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v6 - v3) >> 2);
  v8 = v3 + 28 * (int)v7;
  if ((int)v7 >= 1)
  {
    do
    {
      if (*(_DWORD *)(v8 - 24) == 32 && !*(_DWORD *)(v8 - 20))
        break;
      v8 -= 28;
    }
    while (v8 > v3);
  }
  if (v6 == v4)
  {
    v9 = -1227133513 * ((uint64_t)(v8 - v3) >> 2);
    v10 = v3 + 28 * v9;
    if (v9 >= 1)
    {
      do
      {
        if (*(_DWORD *)(v10 - 24) != 32)
          break;
        if (*(_DWORD *)(v10 - 20))
          break;
        v10 -= 28;
      }
      while (v10 > v3);
    }
    v11 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v10 - v3) >> 2);
    v8 = v3 + 28 * (int)v11;
    if ((int)v11 >= 1)
    {
      do
      {
        if (*(_DWORD *)(v8 - 24) == 32 && !*(_DWORD *)(v8 - 20))
          break;
        v8 -= 28;
      }
      while (v8 > v3);
    }
  }
  v12 = *(_QWORD *)(a1 + 72);
  v13 = -1227133513 * ((v8 - *(_QWORD *)(v12 + 104)) >> 2);
  v14 = *(_DWORD *)(v12 + 12);
  v15 = v13 / *(_DWORD *)(v12 + 16);
  v16 = v13 - v15 * *(__int16 *)(v12 + 4);
  *(_DWORD *)(a1 + 8) = v15;
  *(_DWORD *)(a1 + 12) = v16;
  if (v14 < v15)
    *(_DWORD *)(a1 + 8) = 0;
  return 0;
}

uint64_t sub_21E533448(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;

  v2 = *(_QWORD *)(a1 + 72);
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, *(_QWORD *)(v2 + 104));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  }
  v3 = *(_QWORD *)(v2 + 104);
  v4 = *(_DWORD *)(v2 + 16) * *(_DWORD *)(v2 + 12);
  v5 = v3 + 28 * v4;
  if (v4 < 1)
  {
    v6 = *(_QWORD *)(v2 + 104);
  }
  else
  {
    v6 = *(_QWORD *)(v2 + 104);
    do
    {
      if (*(_DWORD *)(v6 + 4) != 32)
        break;
      if (*(_DWORD *)(v6 + 8))
        break;
      v6 += 28;
    }
    while (v6 < v5);
  }
  if (v6 != v5)
    v3 = v6;
  v7 = *(_QWORD *)(a1 + 72);
  v8 = -1227133513 * ((v3 - *(_QWORD *)(v7 + 104)) >> 2);
  v9 = *(_DWORD *)(v7 + 12);
  v10 = v8 / *(_DWORD *)(v7 + 16);
  v11 = v8 - v10 * *(__int16 *)(v7 + 4);
  *(_DWORD *)(a1 + 8) = v10;
  *(_DWORD *)(a1 + 12) = v11;
  if (v9 < v10)
    *(_DWORD *)(a1 + 8) = 0;
  return 0;
}

uint64_t sub_21E533528(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  int v11;

  v2 = *(_QWORD *)(a1 + 72);
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, *(_QWORD *)(v2 + 104));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  }
  v3 = *(_QWORD *)(v2 + 104);
  v4 = *(_DWORD *)(v2 + 16) * *(_DWORD *)(v2 + 12);
  v5 = v3 + 28 * v4;
  if (v4 < 1)
  {
    v6 = v3 + 28 * v4;
  }
  else
  {
    v6 = v3 + 28 * v4;
    do
    {
      if (*(_DWORD *)(v6 - 24) != 32)
        break;
      if (*(_DWORD *)(v6 - 20))
        break;
      v6 -= 28;
    }
    while (v6 > v3);
  }
  if (v6 == v5)
    v7 = -1;
  else
    v7 = 0;
  v8 = v6 + 28 * v7;
  v9 = *(_QWORD *)(a1 + 72);
  LODWORD(v8) = -1227133513 * ((v8 - *(_QWORD *)(v9 + 104)) >> 2);
  v10 = *(_DWORD *)(v9 + 12);
  v11 = (int)v8 / *(_DWORD *)(v9 + 16);
  LODWORD(v8) = v8 - v11 * *(__int16 *)(v9 + 4);
  *(_DWORD *)(a1 + 8) = v11;
  *(_DWORD *)(a1 + 12) = v8;
  if (v10 < v11)
    *(_DWORD *)(a1 + 8) = 0;
  return 0;
}

uint64_t sub_21E533610(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  int v11;
  int v12;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = v2;
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, *(_QWORD *)(v2 + 104));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    v3 = *(_QWORD *)(a1 + 72);
  }
  v4 = *(_QWORD *)(v3 + 104);
  v5 = *(_DWORD *)(v3 + 16);
  v6 = v4 + 28 * *(_DWORD *)(a1 + 8) * v5;
  v7 = *(_DWORD *)(v2 + 16);
  v8 = v6 + 28 * v7;
  if (v7 < 1)
  {
    v9 = v4 + 28 * *(_DWORD *)(a1 + 8) * v5;
  }
  else
  {
    v9 = v4 + 28 * *(_DWORD *)(a1 + 8) * v5;
    do
    {
      if (*(_DWORD *)(v9 + 4) != 32)
        break;
      if (*(_DWORD *)(v9 + 8))
        break;
      v9 += 28;
    }
    while (v9 < v8);
  }
  if (v9 != v8)
    v6 = v9;
  v10 = -1227133513 * ((v6 - v4) >> 2);
  v11 = v10 / v5;
  v12 = v10 - v11 * *(__int16 *)(v3 + 4);
  *(_DWORD *)(a1 + 8) = v11;
  *(_DWORD *)(a1 + 12) = v12;
  if (*(_DWORD *)(v3 + 12) < v11)
    *(_DWORD *)(a1 + 8) = 0;
  return 0;
}

uint64_t sub_21E5336FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = v2;
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, *(_QWORD *)(v2 + 104));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    v3 = *(_QWORD *)(a1 + 72);
  }
  v4 = *(_QWORD *)(v3 + 104);
  v5 = *(_DWORD *)(v3 + 16);
  v6 = v4 + 28 * *(_DWORD *)(a1 + 8) * v5;
  v7 = *(_DWORD *)(v2 + 16);
  v8 = v6 + 28 * v7;
  if (v7 >= 1)
  {
    do
    {
      if (*(_DWORD *)(v8 - 24) != 32)
        break;
      if (*(_DWORD *)(v8 - 20))
        break;
      v8 -= 28;
    }
    while (v8 > v6);
  }
  if (v8 == v6 + 28 * v7)
    v9 = -1;
  else
    v9 = 0;
  v10 = -1227133513 * ((v8 + 28 * v9 - v4) >> 2);
  v11 = v10 / v5;
  v12 = v10 - v11 * *(__int16 *)(v3 + 4);
  *(_DWORD *)(a1 + 8) = v11;
  *(_DWORD *)(a1 + 12) = v12;
  if (*(_DWORD *)(v3 + 12) < v11)
    *(_DWORD *)(a1 + 8) = 0;
  return 0;
}

uint64_t sub_21E5337E8(uint64_t a1)
{
  int v2;
  int v3;
  int v4;

  v2 = sub_21E534568(*(_QWORD *)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12) - 1);
  v3 = *(_DWORD *)(a1 + 12);
  v4 = v3 - v2;
  if (v3 >= v2)
    v3 -= v2;
  *(_DWORD *)(a1 + 12) = v3;
  return (v4 >> 31) & 0xFFFFFFF4;
}

uint64_t sub_21E53382C(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;

  v2 = sub_21E534568(*(_QWORD *)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  v3 = *(_DWORD *)(a1 + 12);
  v4 = v3 + v2;
  *(_DWORD *)(a1 + 12) = v3 + v2;
  v5 = *(_QWORD *)(a1 + 72);
  if (v4 < *(_DWORD *)(v5 + 16) || *(_DWORD *)(v5 + 24) + *(__int16 *)(v5 + 2) == 1 && (sub_21E532338(v5, 1) & 1) != 0)
    return 0;
  *(_DWORD *)(a1 + 12) = v3;
  return 4294967284;
}

uint64_t sub_21E5338A0(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(a1 + 8);
  if (v1 <= 0)
    v2 = 4294967284;
  else
    v2 = 0;
  *(_DWORD *)(a1 + 8) = v1 - (v1 > 0);
  return v2;
}

uint64_t sub_21E5338C4(uint64_t a1)
{
  uint64_t v2;
  int v3;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 8) = v3 + 1;
  if (v3 + 1 != *(_DWORD *)(v2 + 12))
    return 0;
  if (*(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) != 1)
  {
    if ((sub_21E532338(v2, 1) & 1) != 0)
      return 0;
    v3 = *(_DWORD *)(a1 + 8) - 1;
  }
  *(_DWORD *)(a1 + 8) = v3;
  return 4294967284;
}

uint64_t sub_21E533934(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  __int16 v5;
  uint64_t result;
  int v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  int v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  unsigned int v15;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_DWORD *)(v2 + 12) - 1;
  v4 = *(_DWORD *)(a1 + 8);
  v5 = *(_WORD *)a1;
  if ((*(_WORD *)a1 & 4) != 0)
  {
    if (v3 == v4)
    {
      if ((*(_WORD *)v2 & 8) == 0 || *(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) == 1)
      {
        if ((*(_BYTE *)(a1 + 32) & 1) != 0)
        {
          wmove(*(WINDOW **)(a1 + 56), v3, *(_DWORD *)(a1 + 12));
          wclrtoeol(*(WINDOW **)(a1 + 56));
          *(_WORD *)a1 |= 0x10u;
          return sub_21E531708(sub_21E532B88, a1);
        }
        return 4294967284;
      }
      if (!sub_21E532338(*(_QWORD *)(a1 + 72), 1))
        return 0xFFFFFFFFLL;
      v4 = *(_DWORD *)(a1 + 8);
    }
    wmove(*(WINDOW **)(a1 + 56), v4, *(_DWORD *)(a1 + 12));
    wclrtoeol(*(WINDOW **)(a1 + 56));
    result = 0;
    *(_QWORD *)(a1 + 8) = (*(_DWORD *)(a1 + 8) + 1);
LABEL_32:
    *(_WORD *)a1 |= 0x10u;
    return result;
  }
  if (v3 != v4)
  {
    if ((v5 & 0x10) != 0)
    {
      *(_WORD *)a1 = v5 & 0xFFCF | 0x20;
      _nc_get_fieldbuffer(a1, (_DWORD *)v2, *(_QWORD *)(v2 + 104));
      wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
      v3 = *(_DWORD *)(v2 + 12) - 1;
    }
    v7 = *(_DWORD *)(v2 + 16);
    v8 = *(_QWORD *)(v2 + 104) + 28 * v3 * v7;
    v9 = v8 + 28 * v7;
    if (v7 >= 1)
    {
      do
      {
        if (*(_DWORD *)(v9 - 24) != 32)
          break;
        if (*(_DWORD *)(v9 - 20))
          break;
        v9 -= 28;
      }
      while (v9 > v8);
    }
    if (v9 == v8)
      goto LABEL_24;
    if ((*(_WORD *)v2 & 8) != 0)
      goto LABEL_22;
    return 4294967284;
  }
  if ((*(_WORD *)v2 & 8) == 0 || *(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) == 1)
  {
    if ((*(_BYTE *)(a1 + 32) & 1) == 0)
      return 4294967284;
    return sub_21E531708(sub_21E532B88, a1);
  }
LABEL_22:
  if (sub_21E532338(v2, 1))
  {
    v7 = *(_DWORD *)(v2 + 16);
LABEL_24:
    v10 = *(_DWORD *)(a1 + 8);
    v11 = *(_DWORD *)(a1 + 12);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 104) + 28 * v10 * *(_DWORD *)(*(_QWORD *)(a1 + 72) + 16) + 28 * v11;
    v13 = v7 - v11;
    v14 = v12 + 28 * v13;
    if (v13 >= 1)
    {
      do
      {
        if (*(_DWORD *)(v14 - 24) != 32)
          break;
        if (*(_DWORD *)(v14 - 20))
          break;
        v14 -= 28;
      }
      while (v14 > v12);
    }
    wmove(*(WINDOW **)(a1 + 56), v10, v11);
    wclrtoeol(*(WINDOW **)(a1 + 56));
    v15 = *(_DWORD *)(a1 + 8) + 1;
    *(_QWORD *)(a1 + 8) = v15;
    wmove(*(WINDOW **)(a1 + 56), v15, 0);
    winsdelln(*(WINDOW **)(a1 + 56), 1);
    wadd_wchnstr();
    result = 0;
    goto LABEL_32;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_21E533BA8(uint64_t a1)
{
  uint64_t v2;
  int v3;

  v2 = *(_QWORD *)(a1 + 72);
  if (!sub_21E5345E0(*(_QWORD *)(v2 + 88), *(_QWORD **)(v2 + 96)))
    return 4294967284;
  wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(*(_QWORD *)(a1 + 72) + 16) - 1);
  v3 = winch(*(WINDOW **)(a1 + 56));
  wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  if (v3 == 32 || v3 == *(_DWORD *)(*(_QWORD *)(a1 + 72) + 36))
    goto LABEL_7;
  if (*(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) != 1 || (*(_WORD *)v2 & 8) == 0)
    return 4294967284;
  if (sub_21E532338(v2, 1))
  {
LABEL_7:
    winsch(*(WINDOW **)(a1 + 56), 0x20u);
    return sub_21E534664(a1);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_21E533C78(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;

  v2 = *(_QWORD *)(a1 + 72);
  if (!sub_21E5345E0(*(_QWORD *)(v2 + 88), *(_QWORD **)(v2 + 96)))
    return 4294967284;
  if (*(_DWORD *)(a1 + 8) == *(_DWORD *)(v2 + 12) - 1)
  {
    if (*(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) == 1)
      return 4294967284;
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 72);
    if ((*(_WORD *)a1 & 0x10) != 0)
    {
      *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
      _nc_get_fieldbuffer(a1, (_DWORD *)v3, *(_QWORD *)(v3 + 104));
      wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    }
    v4 = *(_DWORD *)(v3 + 16);
    v5 = *(_QWORD *)(v3 + 104) + 28 * (*(_DWORD *)(v3 + 12) - 1) * v4;
    v6 = v5 + 28 * v4;
    if (v4 >= 1)
    {
      do
      {
        if (*(_DWORD *)(v6 - 24) != 32)
          break;
        if (*(_DWORD *)(v6 - 20))
          break;
        v6 -= 28;
      }
      while (v6 > v5);
    }
    if (*(_DWORD *)(v2 + 24) + *(__int16 *)(v2 + 2) == 1)
      return 4294967284;
    if (v6 == v5)
    {
LABEL_16:
      *(_DWORD *)(a1 + 12) = 0;
      winsdelln(*(WINDOW **)(a1 + 56), 1);
      return 0;
    }
  }
  if ((*(_WORD *)v2 & 8) == 0)
    return 4294967284;
  if (sub_21E532338(v2, 1))
    goto LABEL_16;
  return 0xFFFFFFFFLL;
}

uint64_t sub_21E533DAC(uint64_t a1)
{
  sub_21E534A20(a1);
  return 0;
}

uint64_t sub_21E533DC4(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;

  v2 = *(_DWORD *)(a1 + 8);
  v1 = *(_DWORD *)(a1 + 12);
  if (!*(_QWORD *)(a1 + 8))
    return 4294967284;
  v5 = *(_QWORD *)(a1 + 72);
  *(_DWORD *)(a1 + 12) = v1 - 1;
  if (v1 <= 0)
  {
    *(_DWORD *)(a1 + 12) = v1;
    v6 = *(_WORD *)a1;
    if ((*(_WORD *)a1 & 4) != 0)
      return 4294967284;
    v7 = *(_QWORD *)(v5 + 104);
    v8 = *(_DWORD *)(v5 + 16);
    v9 = v7 + 28 * v8 * (v2 - 1);
    v10 = v8 * v2;
    if ((v6 & 0x10) != 0)
    {
      *(_WORD *)a1 = v6 & 0xFFCF | 0x20;
      _nc_get_fieldbuffer(a1, (_DWORD *)v5, v7);
      wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
      v8 = *(_DWORD *)(v5 + 16);
    }
    v11 = v7 + 28 * v10;
    v12 = v9 + 28 * v8;
    if (v8 < 1)
    {
      v13 = v11 + 28 * v8;
    }
    else
    {
      do
      {
        if (*(_DWORD *)(v12 - 24) != 32)
          break;
        if (*(_DWORD *)(v12 - 20))
          break;
        v12 -= 28;
      }
      while (v12 > v9);
      v13 = v11 + 28 * v8;
      do
      {
        if (*(_DWORD *)(v13 - 24) != 32)
          break;
        if (*(_DWORD *)(v13 - 20))
          break;
        v13 -= 28;
      }
      while (v13 > v11);
    }
    if ((int)(*(__int16 *)(v5 + 4) + 1227133513 * ((v12 - v9) >> 2)) < (int)(-1227133513 * ((v13 - v11) >> 2)))
      return 4294967284;
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
    winsdelln(*(WINDOW **)(a1 + 56), -1);
    v14 = *(_QWORD *)(a1 + 72);
    v15 = -1227133513 * ((v12 - *(_QWORD *)(v14 + 104)) >> 2);
    v16 = *(_DWORD *)(v14 + 12);
    v17 = v15 / *(_DWORD *)(v14 + 16);
    v18 = v15 - v17 * *(__int16 *)(v14 + 4);
    *(_DWORD *)(a1 + 8) = v17;
    *(_DWORD *)(a1 + 12) = v18;
    if (v16 < v17)
    {
      v17 = 0;
      *(_DWORD *)(a1 + 8) = 0;
    }
    if (v2 < 1 || v17 != v2)
    {
      wmove(*(WINDOW **)(a1 + 56), v17, v18);
      wadd_wchnstr();
      return 0;
    }
    v19 = *(_DWORD *)(v5 + 16) - 1;
    *(_DWORD *)(a1 + 8) = v2 - 1;
    *(_DWORD *)(a1 + 12) = v19;
  }
  sub_21E534A20(a1);
  return 0;
}

uint64_t sub_21E533FB4(uint64_t a1)
{
  *(_DWORD *)(a1 + 12) = 0;
  winsdelln(*(WINDOW **)(a1 + 56), -1);
  return 0;
}

uint64_t sub_21E533FD8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(v2 + 104);
  v4 = *(_DWORD *)(v2 + 16);
  v5 = *(_DWORD *)(a1 + 12);
  v6 = v3 + 28 * *(_DWORD *)(a1 + 8) * v4;
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v2, v3);
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  }
  if (*(_DWORD *)(v6 + 28 * v5 + 4) == 32 && !*(_DWORD *)(v6 + 28 * v5 + 8))
    return 4294967284;
  v7 = *(_DWORD *)(a1 + 12);
  v8 = v6 + 28 * v7;
  if (v7 >= 1)
  {
    do
    {
      if (*(_DWORD *)(v8 - 24) == 32 && !*(_DWORD *)(v8 - 20))
        break;
      v8 -= 28;
    }
    while (v8 > v6);
  }
  v9 = v6 + 28 * v5;
  v10 = v6 + 28 * v4;
  v11 = *(_QWORD *)(a1 + 72);
  v12 = -1227133513 * ((v8 - *(_QWORD *)(v11 + 104)) >> 2);
  v13 = *(_DWORD *)(v11 + 12);
  v14 = v12 / *(_DWORD *)(v11 + 16);
  v15 = v12 - v14 * *(__int16 *)(v11 + 4);
  *(_DWORD *)(a1 + 8) = v14;
  *(_DWORD *)(a1 + 12) = v15;
  if (v13 < v14)
  {
    v14 = 0;
    *(_DWORD *)(a1 + 8) = 0;
  }
  wmove(*(WINDOW **)(a1 + 56), v14, v15);
  wclrtoeol(*(WINDOW **)(a1 + 56));
  v16 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v10 - v9) >> 2);
  v17 = v9 + 28 * (int)v16;
  if ((int)v16 < 1)
  {
    v18 = v9;
  }
  else
  {
    v18 = v9;
    do
    {
      if (*(_DWORD *)(v18 + 4) == 32 && !*(_DWORD *)(v18 + 8))
        break;
      v18 += 28;
    }
    while (v18 < v17);
  }
  if (v18 == v17)
    v19 = v9;
  else
    v19 = v18;
  v20 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v10 - v19) >> 2);
  v21 = v19 + 28 * (int)v20;
  v22 = v19;
  if ((int)v20 >= 1)
  {
    do
    {
      if (*(_DWORD *)(v22 + 4) != 32)
        break;
      if (*(_DWORD *)(v22 + 8))
        break;
      v22 += 28;
    }
    while (v22 < v21);
  }
  if (v22 == v21)
    v23 = v19;
  else
    v23 = v22;
  if (v23 != v9 && (*(_DWORD *)(v23 + 4) != 32 || *(_DWORD *)(v23 + 8)))
  {
    v24 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v10 - v23) >> 2);
    v25 = v23 + 28 * (int)v24;
    if ((int)v24 >= 1)
    {
      do
      {
        if (*(_DWORD *)(v25 - 24) != 32)
          break;
        if (*(_DWORD *)(v25 - 20))
          break;
        v25 -= 28;
      }
      while (v25 > v23);
    }
    wadd_wchnstr();
  }
  return 0;
}

uint64_t sub_21E534230(uint64_t a1)
{
  wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  wclrtoeol(*(WINDOW **)(a1 + 56));
  return 0;
}

uint64_t sub_21E534264(uint64_t a1)
{
  wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  wclrtobot(*(WINDOW **)(a1 + 56));
  return 0;
}

uint64_t sub_21E534298(uint64_t a1)
{
  *(_QWORD *)(a1 + 8) = 0;
  werase(*(WINDOW **)(a1 + 56));
  return 0;
}

uint64_t sub_21E5342B8(_WORD *a1)
{
  *a1 |= 4u;
  return 0;
}

uint64_t sub_21E5342CC(_WORD *a1)
{
  *a1 &= ~4u;
  return 0;
}

uint64_t sub_21E5342E0(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v4;
  int v5;
  uint64_t v6;

  v1 = *(_DWORD *)(a1 + 16);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 72) + 12) - *(__int16 *)(*(_QWORD *)(a1 + 72) + 2);
  v3 = __OFSUB__(v2, v1);
  v4 = v2 - v1;
  if ((v4 < 0) ^ v3 | (v4 == 0))
    v5 = v4;
  else
    v5 = 1;
  if (v5 < 1)
    return 4294967284;
  v6 = 0;
  *(_DWORD *)(a1 + 8) += v5;
  *(_DWORD *)(a1 + 16) = v5 + v1;
  return v6;
}

uint64_t sub_21E53432C(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v3;
  uint64_t result;

  v1 = *(_DWORD *)(a1 + 16);
  v2 = __OFSUB__(v1, 1);
  v3 = v1 - 1;
  if (v3 < 0 != v2)
    return 4294967284;
  result = 0;
  --*(_DWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_21E53435C(uint64_t a1)
{
  return sub_21E534B58(a1, *(__int16 *)(*(_QWORD *)(a1 + 72) + 2));
}

uint64_t sub_21E534368(uint64_t a1)
{
  return sub_21E534B58(a1, -*(__int16 *)(*(_QWORD *)(a1 + 72) + 2));
}

uint64_t sub_21E534378(uint64_t a1)
{
  int v1;
  int v2;

  v1 = *(__int16 *)(*(_QWORD *)(a1 + 72) + 2);
  if (v1 >= -1)
    v2 = v1 + 1;
  else
    v2 = v1 + 2;
  return sub_21E534B58(a1, v2 >> 1);
}

uint64_t sub_21E534394(uint64_t a1)
{
  int v1;
  int v2;

  v1 = *(__int16 *)(*(_QWORD *)(a1 + 72) + 2);
  if (v1 >= -1)
    v2 = v1 + 1;
  else
    v2 = v1 + 2;
  return sub_21E534B58(a1, -(v2 >> 1));
}

uint64_t sub_21E5343B0(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v4;
  int v5;
  uint64_t v6;

  v1 = *(_DWORD *)(a1 + 20);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 72) + 16) - *(__int16 *)(*(_QWORD *)(a1 + 72) + 4);
  v3 = __OFSUB__(v2, v1);
  v4 = v2 - v1;
  if ((v4 < 0) ^ v3 | (v4 == 0))
    v5 = v4;
  else
    v5 = 1;
  if (v5 < 1)
    return 4294967284;
  v6 = 0;
  *(_DWORD *)(a1 + 12) += v5;
  *(_DWORD *)(a1 + 20) = v5 + v1;
  return v6;
}

uint64_t sub_21E5343FC(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v3;
  uint64_t result;

  v1 = *(_DWORD *)(a1 + 20);
  v2 = __OFSUB__(v1, 1);
  v3 = v1 - 1;
  if (v3 < 0 != v2)
    return 4294967284;
  result = 0;
  --*(_DWORD *)(a1 + 12);
  *(_DWORD *)(a1 + 20) = v3;
  return result;
}

uint64_t sub_21E53442C(uint64_t a1)
{
  return sub_21E534BE8(a1, *(__int16 *)(*(_QWORD *)(a1 + 72) + 4));
}

uint64_t sub_21E534438(uint64_t a1)
{
  return sub_21E534BE8(a1, -*(__int16 *)(*(_QWORD *)(a1 + 72) + 4));
}

uint64_t sub_21E534448(uint64_t a1)
{
  int v1;
  int v2;

  v1 = *(__int16 *)(*(_QWORD *)(a1 + 72) + 4);
  if (v1 >= -1)
    v2 = v1 + 1;
  else
    v2 = v1 + 2;
  return sub_21E534BE8(a1, v2 >> 1);
}

uint64_t sub_21E534464(uint64_t a1)
{
  int v1;
  int v2;

  v1 = *(__int16 *)(*(_QWORD *)(a1 + 72) + 4);
  if (v1 >= -1)
    v2 = v1 + 1;
  else
    v2 = v1 + 2;
  return sub_21E534BE8(a1, -(v2 >> 1));
}

uint64_t sub_21E534480(uint64_t a1)
{
  if (_nc_Internal_Validation(a1))
    return 0;
  else
    return 4294967283;
}

uint64_t sub_21E5344A0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 72);
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v1, *(_QWORD *)(v1 + 104));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  }
  if (sub_21E534C78(*(_QWORD *)(v1 + 88), v1, *(_QWORD **)(v1 + 96)))
    return 0;
  else
    return 4294967284;
}

uint64_t sub_21E534504(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 72);
  if ((*(_WORD *)a1 & 0x10) != 0)
  {
    *(_WORD *)a1 = *(_WORD *)a1 & 0xFFCF | 0x20;
    _nc_get_fieldbuffer(a1, (_DWORD *)v1, *(_QWORD *)(v1 + 104));
    wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  }
  if (sub_21E534CFC(*(_QWORD *)(v1 + 88), v1, *(_QWORD **)(v1 + 96)))
    return 0;
  else
    return 4294967284;
}

uint64_t sub_21E534568(uint64_t a1, unsigned int a2, int a3)
{
  int v3;
  uint64_t v4;
  BOOL v5;

  if (a1 && (a3 & 0x80000000) == 0 && (a2 & 0x80000000) == 0)
  {
    v3 = a3;
    while (*(__int16 *)(a1 + 6) >= a3 && *(__int16 *)(a1 + 4) >= (int)a2)
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16 * a2);
      if ((*(_DWORD *)(v4 + 28 * v3) & 0xFEu) - 2 >= 0x1E)
        return wcwidth(*(_DWORD *)(v4 + 28 * v3 + 4));
      v5 = __OFSUB__(v3--, 1);
      if (v3 < 0 != v5)
        return 1;
    }
  }
  return 1;
}

uint64_t sub_21E5345E0(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, _QWORD *);

  if (!a1)
    return (*(_BYTE *)(MEMORY[0x24BDAC740] + 189) & 2) == 0;
  v3 = a1;
  while ((*(_WORD *)v3 & 1) != 0)
  {
    if ((sub_21E5345E0(*(_QWORD *)(v3 + 16), *a2) & 1) != 0)
      return 1;
    v3 = *(_QWORD *)(v3 + 24);
    a2 = (_QWORD *)a2[1];
    if (!v3)
      return (*(_BYTE *)(MEMORY[0x24BDAC740] + 189) & 2) == 0;
  }
  v4 = *(uint64_t (**)(uint64_t, _QWORD *))(v3 + 64);
  if (!v4)
    return (*(_BYTE *)(MEMORY[0x24BDAC740] + 189) & 2) == 0;
  return v4(32, a2);
}

uint64_t sub_21E534664(uint64_t a1)
{
  uint64_t v1;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  unint64_t v8;
  int v9;
  unint64_t v10;
  int v11;
  uint64_t result;
  int v13;
  BOOL v14;
  int v15;

  v1 = *(_QWORD *)(a1 + 72);
  if ((*(_BYTE *)(v1 + 48) & 0x10) == 0 || *(_DWORD *)(v1 + 24) + *(__int16 *)(v1 + 2) == 1)
    return 0;
  v3 = *(_DWORD *)(a1 + 8);
  v4 = *(_DWORD *)(v1 + 12);
  wmove(*(WINDOW **)(a1 + 56), v3, *(_DWORD *)(v1 + 16) - 1);
  v5 = winch(*(WINDOW **)(a1 + 56));
  wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  v6 = *(_QWORD *)(a1 + 72);
  if (v5 == 32 || v5 == *(_DWORD *)(v6 + 36))
    return 0;
  if (v4 - 1 != v3)
  {
LABEL_11:
    v8 = *(_QWORD *)(v6 + 104) + 28 * *(_DWORD *)(a1 + 8) * *(_DWORD *)(v6 + 16);
    _nc_get_fieldbuffer(a1, (_DWORD *)v1, *(_QWORD *)(v1 + 104));
    v9 = *(_DWORD *)(v1 + 16);
    v10 = v8 + 28 * v9;
    if (v9 >= 1)
    {
      do
      {
        if (*(_DWORD *)(v10 - 24) == 32 && !*(_DWORD *)(v10 - 20))
          break;
        v10 -= 28;
      }
      while (v10 > v8);
    }
    v11 = -1227133513 * ((v10 - v8) >> 2);
    if (v11 >= 1)
    {
      if (sub_21E53480C(a1, *(_DWORD *)(a1 + 8) + 1, v10, v9 - v11))
      {
        sub_21E534A20(a1);
        _nc_get_fieldbuffer(a1, (_DWORD *)v1, *(_QWORD *)(v1 + 104));
        return 4294967284;
      }
      wmove(*(WINDOW **)(a1 + 56), *(_DWORD *)(a1 + 8), v11);
      wclrtoeol(*(WINDOW **)(a1 + 56));
      v13 = *(_DWORD *)(a1 + 12);
      v14 = __OFSUB__(v13, v11);
      v15 = v13 - v11;
      if (v15 < 0 == v14)
      {
        result = 0;
        ++*(_DWORD *)(a1 + 8);
        *(_DWORD *)(a1 + 12) = v15;
        return result;
      }
    }
    return 0;
  }
  if ((*(_WORD *)v1 & 8) == 0)
    return 0;
  if (sub_21E532338(v1, 1))
  {
    v6 = *(_QWORD *)(a1 + 72);
    goto LABEL_11;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_21E53480C(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  WINDOW **v12;
  uint64_t result;
  int v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  WINDOW *v21;

  v8 = *(_QWORD *)(a1 + 72);
  v9 = *(_DWORD *)(v8 + 16);
  v10 = *(_QWORD *)(v8 + 104) + 28 * v9 * a2;
  v11 = v10 + 28 * v9;
  if (v9 >= 1)
  {
    do
    {
      if (*(_DWORD *)(v11 - 24) != 32)
        break;
      if (*(_DWORD *)(v11 - 20))
        break;
      v11 -= 28;
    }
    while (v11 > v10);
  }
  if ((int)(v9 + 1227133513 * ((v11 - v10) >> 2)) > a4)
  {
    v12 = (WINDOW **)(a1 + 56);
LABEL_7:
    wmove(*v12, a2, 0);
    sub_21E534AD4((uint64_t)*v12, a3, a4);
    wmove(*v12, a2, a4);
    sub_21E534AD4((uint64_t)*v12, (uint64_t)&xmmword_2553E3E48, 1);
    return 0;
  }
  v14 = *(_DWORD *)(v8 + 12) - 1;
  if (v14 == a2 && (*(_WORD *)v8 & 8) != 0)
  {
    if (!sub_21E532338(*(_QWORD *)(a1 + 72), 1))
      return 0xFFFFFFFFLL;
    v9 = *(_DWORD *)(v8 + 16);
    v10 = *(_QWORD *)(v8 + 104) + 28 * v9 * a2;
    v14 = *(_DWORD *)(v8 + 12) - 1;
  }
  if (v14 <= a2)
    return 4294967284;
  v15 = v10 + 28 * v9 + 28 * ~a4;
  v16 = v15 + 28 * (a4 + 1);
  v17 = v15;
  if ((a4 & 0x80000000) == 0)
  {
    do
    {
      if (*(_DWORD *)(v17 + 4) != 32)
        break;
      if (*(_DWORD *)(v17 + 8))
        break;
      v17 += 28;
    }
    while (v17 < v16);
  }
  if (v17 != v16)
    v15 = v17;
  v18 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v15 - v10) >> 2);
  v19 = v10 + 28 * (int)v18;
  if ((int)v18 >= 1)
  {
    do
    {
      if (*(_DWORD *)(v19 - 24) == 32 && !*(_DWORD *)(v19 - 20))
        break;
      v19 -= 28;
    }
    while (v19 > v10);
  }
  v20 = -1227133513 * ((v19 - v10) >> 2);
  result = sub_21E53480C(a1, (a2 + 1));
  if (!(_DWORD)result)
  {
    v21 = *(WINDOW **)(a1 + 56);
    v12 = (WINDOW **)(a1 + 56);
    wmove(v21, a2, v20);
    wclrtoeol(*v12);
    goto LABEL_7;
  }
  return result;
}

uint64_t sub_21E534A20(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t result;
  unsigned int v9;

  v2 = sub_21E534568(*(_QWORD *)(a1 + 56), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(unsigned int *)(a1 + 8);
  v5 = *(_DWORD *)(a1 + 12);
  if (v3)
  {
    v6 = *(_DWORD *)(a1 + 12);
    while ((v6 & 0x80000000) == 0
         && (v4 & 0x80000000) == 0
         && (int)v6 <= *(__int16 *)(v3 + 6)
         && (int)v4 <= *(__int16 *)(v3 + 4))
    {
      v7 = (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 16 * v4) + 28 * v6--) & 0xFE) - 2;
      if (v7 >= 0x1E)
      {
        v5 = v6 + 1;
        break;
      }
    }
  }
  *(_DWORD *)(a1 + 12) = v5;
  result = wmove((WINDOW *)v3, v4, v5);
  if (v2 >= 1)
  {
    v9 = v2 + 1;
    do
    {
      result = wdelch(*(WINDOW **)(a1 + 56));
      --v9;
    }
    while (v9 > 1);
  }
  return result;
}

uint64_t sub_21E534AD4(uint64_t result, uint64_t a2, int a3)
{
  int v3;
  WINDOW *v5;
  int v6;
  int v7;
  BOOL v8;

  if (a3 >= 1)
  {
    v3 = a3;
    v5 = (WINDOW *)result;
    do
    {
      if (v5)
      {
        v6 = *(__int16 *)v5;
        v7 = *((__int16 *)v5 + 1);
      }
      else
      {
        v6 = -1;
        v7 = -1;
      }
      result = wins_wch();
      if ((_DWORD)result)
        break;
      result = wmove(v5, v6, v7 + 1);
      v8 = v3-- != 0;
      if ((_DWORD)result)
        break;
      a2 += 28;
    }
    while (v3 != 0 && v8);
  }
  return result;
}

uint64_t sub_21E534B58(uint64_t a1, int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;

  if (a2 >= 0)
    v2 = a2;
  else
    v2 = -a2;
  if (a2 < 1)
  {
    v8 = *(_DWORD *)(a1 + 16);
    if (v2 >= v8)
      v9 = *(_DWORD *)(a1 + 16);
    else
      v9 = v2;
    if (v9 >= 1)
    {
      v6 = 0;
      *(_DWORD *)(a1 + 8) -= v9;
      v7 = v8 - v9;
      goto LABEL_15;
    }
    return 4294967284;
  }
  v3 = *(_DWORD *)(a1 + 16);
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 72) + 12) - *(__int16 *)(*(_QWORD *)(a1 + 72) + 2);
  if (v3 + v2 <= v4)
    v5 = v2;
  else
    v5 = v4 - v3;
  if (v5 < 1)
    return 4294967284;
  v6 = 0;
  *(_DWORD *)(a1 + 8) += v5;
  v7 = v5 + v3;
LABEL_15:
  *(_DWORD *)(a1 + 16) = v7;
  return v6;
}

uint64_t sub_21E534BE8(uint64_t a1, int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;

  if (a2 >= 0)
    v2 = a2;
  else
    v2 = -a2;
  if (a2 < 1)
  {
    v8 = *(_DWORD *)(a1 + 20);
    if (v2 >= v8)
      v9 = *(_DWORD *)(a1 + 20);
    else
      v9 = v2;
    if (v9 >= 1)
    {
      v6 = 0;
      *(_DWORD *)(a1 + 12) -= v9;
      v7 = v8 - v9;
      goto LABEL_15;
    }
    return 4294967284;
  }
  v3 = *(_DWORD *)(a1 + 20);
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 72) + 16) - *(__int16 *)(*(_QWORD *)(a1 + 72) + 4);
  if (v3 + v2 <= v4)
    v5 = v2;
  else
    v5 = v4 - v3;
  if (v5 < 1)
    return 4294967284;
  v6 = 0;
  *(_DWORD *)(a1 + 12) += v5;
  v7 = v5 + v3;
LABEL_15:
  *(_DWORD *)(a1 + 20) = v7;
  return v6;
}

uint64_t sub_21E534C78(uint64_t result, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;

  if (result)
  {
    v5 = result;
    while (1)
    {
      if ((*(_WORD *)v5 & 4) == 0)
        return 0;
      if ((*(_WORD *)v5 & 1) == 0)
        return (*(uint64_t (**)(uint64_t, _QWORD *))(v5 + 72))(a2, a3);
      if ((sub_21E534C78(*(_QWORD *)(v5 + 16), a2, *a3) & 1) != 0)
        break;
      v5 = *(_QWORD *)(v5 + 24);
      a3 = (_QWORD *)a3[1];
      if (!v5)
        return 0;
    }
    return 1;
  }
  return result;
}

uint64_t sub_21E534CFC(uint64_t result, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;

  if (result)
  {
    v5 = result;
    while (1)
    {
      if ((*(_WORD *)v5 & 4) == 0)
        return 0;
      if ((*(_WORD *)v5 & 1) == 0)
        return (*(uint64_t (**)(uint64_t, _QWORD *))(v5 + 80))(a2, a3);
      if ((sub_21E534CFC(*(_QWORD *)(v5 + 16), a2, *a3) & 1) != 0)
        break;
      v5 = *(_QWORD *)(v5 + 24);
      a3 = (_QWORD *)a3[1];
      if (!v5)
        return 0;
    }
    return 1;
  }
  return result;
}

int set_field_init(FORM *a1, Form_Hook a2)
{
  FORM *v2;

  v2 = (FORM *)_nc_Default_Form;
  if (a1)
    v2 = a1;
  v2->fieldinit = a2;
  *__error() = 0;
  return 0;
}

Form_Hook field_init(const FORM *a1)
{
  const FORM *v1;

  v1 = (const FORM *)_nc_Default_Form;
  if (a1)
    v1 = a1;
  return v1->fieldinit;
}

int set_field_term(FORM *a1, Form_Hook a2)
{
  FORM *v2;

  v2 = (FORM *)_nc_Default_Form;
  if (a1)
    v2 = a1;
  v2->fieldterm = a2;
  *__error() = 0;
  return 0;
}

Form_Hook field_term(const FORM *a1)
{
  const FORM *v1;

  v1 = (const FORM *)_nc_Default_Form;
  if (a1)
    v1 = a1;
  return v1->fieldterm;
}

int set_form_init(FORM *a1, Form_Hook a2)
{
  FORM *v2;

  v2 = (FORM *)_nc_Default_Form;
  if (a1)
    v2 = a1;
  v2->forminit = a2;
  *__error() = 0;
  return 0;
}

Form_Hook form_init(const FORM *a1)
{
  const FORM *v1;

  v1 = (const FORM *)_nc_Default_Form;
  if (a1)
    v1 = a1;
  return v1->forminit;
}

int set_form_term(FORM *a1, Form_Hook a2)
{
  FORM *v2;

  v2 = (FORM *)_nc_Default_Form;
  if (a1)
    v2 = a1;
  v2->formterm = a2;
  *__error() = 0;
  return 0;
}

Form_Hook form_term(const FORM *a1)
{
  const FORM *v1;

  v1 = (const FORM *)_nc_Default_Form;
  if (a1)
    v1 = a1;
  return v1->formterm;
}

int set_form_opts(FORM *a1, Form_Options a2)
{
  FORM *v2;

  v2 = (FORM *)_nc_Default_Form;
  if (a1)
    v2 = a1;
  v2->opts = a2 & 3;
  *__error() = 0;
  return 0;
}

Form_Options form_opts(const FORM *a1)
{
  const FORM *v1;

  v1 = (const FORM *)_nc_Default_Form;
  if (a1)
    v1 = a1;
  return v1->opts & 3;
}

int form_opts_on(FORM *a1, Form_Options a2)
{
  FORM *v2;

  v2 = (FORM *)_nc_Default_Form;
  if (a1)
    v2 = a1;
  v2->opts |= a2 & 3;
  *__error() = 0;
  return 0;
}

int form_opts_off(FORM *a1, Form_Options a2)
{
  FORM *v2;

  v2 = (FORM *)_nc_Default_Form;
  if (a1)
    v2 = a1;
  v2->opts &= ~(_BYTE)a2 | 0xFFFFFFFC;
  *__error() = 0;
  return 0;
}

int set_form_page(FORM *a1, int a2)
{
  int v2;
  void (__cdecl *fieldterm)(formnode *);
  void (__cdecl *formterm)(formnode *);
  void (__cdecl *forminit)(formnode *);
  void (__cdecl *fieldinit)(formnode *);

  v2 = -2;
  if (a1 && (a2 & 0x80000000) == 0 && a1->maxpage > a2)
  {
    if ((a1->status & 1) != 0)
    {
      if ((a1->status & 2) != 0)
      {
        v2 = -5;
      }
      else if (a1->curpage == a2)
      {
        v2 = 0;
      }
      else if (_nc_Internal_Validation((uint64_t)a1))
      {
        fieldterm = a1->fieldterm;
        if (fieldterm)
        {
          a1->status |= 2u;
          ((void (*)(FORM *))fieldterm)(a1);
          a1->status &= ~2u;
        }
        formterm = a1->formterm;
        if (formterm)
        {
          a1->status |= 2u;
          ((void (*)(FORM *))formterm)(a1);
          a1->status &= ~2u;
        }
        v2 = _nc_Set_Form_Page((uint64_t)a1, a2, 0);
        forminit = a1->forminit;
        if (forminit)
        {
          a1->status |= 2u;
          ((void (*)(FORM *))forminit)(a1);
          a1->status &= ~2u;
        }
        fieldinit = a1->fieldinit;
        if (fieldinit)
        {
          a1->status |= 2u;
          ((void (*)(FORM *))fieldinit)(a1);
          a1->status &= ~2u;
        }
        _nc_Refresh_Current_Field((uint64_t)a1);
      }
      else
      {
        v2 = -13;
      }
    }
    else
    {
      a1->curpage = a2;
      v2 = 0;
      a1->current = (FIELD *)_nc_First_Active_Field((uint64_t)a1);
    }
  }
  *__error() = v2;
  return v2;
}

int form_page(const FORM *a1)
{
  const FORM *v1;

  v1 = (const FORM *)_nc_Default_Form;
  if (a1)
    v1 = a1;
  return v1->curpage;
}

int post_form(FORM *a1)
{
  WINDOW *sub;
  int cols;
  int v4;
  int v5;
  int curpage;
  unsigned __int16 status;
  unsigned __int16 v8;
  void (__cdecl *forminit)(formnode *);
  void (__cdecl *fieldinit)(formnode *);

  if (!a1)
  {
    v5 = -2;
    goto LABEL_20;
  }
  if ((a1->status & 1) != 0)
  {
    v5 = -3;
    goto LABEL_20;
  }
  if (!a1->field)
  {
    v5 = -11;
    goto LABEL_20;
  }
  sub = a1->sub;
  if (sub || (sub = a1->win) != 0)
  {
    LOWORD(cols) = a1->cols;
  }
  else
  {
    sub = *(WINDOW **)(*MEMORY[0x24BEDCA70] + 152);
    cols = a1->cols;
    if (!sub)
    {
      if ((cols & 0x80000000) == 0)
        goto LABEL_10;
      v4 = -1;
      goto LABEL_9;
    }
  }
  if (*((__int16 *)sub + 3) + 1 < (__int16)cols)
  {
LABEL_10:
    v5 = -6;
    goto LABEL_20;
  }
  v4 = *((__int16 *)sub + 2) + 1;
LABEL_9:
  if (v4 < a1->rows)
    goto LABEL_10;
  curpage = a1->curpage;
  a1->curpage = -1;
  v5 = _nc_Set_Form_Page((uint64_t)a1, curpage, (uint64_t)a1->current);
  if (!v5)
  {
    status = a1->status;
    v8 = a1->status | 1;
    a1->status = v8;
    forminit = a1->forminit;
    if (forminit)
    {
      a1->status = status | 3;
      ((void (*)(FORM *))forminit)(a1);
      v8 = a1->status & 0xFFFD;
      a1->status = v8;
    }
    fieldinit = a1->fieldinit;
    if (fieldinit)
    {
      a1->status = v8 | 2;
      ((void (*)(FORM *))fieldinit)(a1);
      a1->status &= ~2u;
    }
    _nc_Refresh_Current_Field((uint64_t)a1);
    v5 = 0;
  }
LABEL_20:
  *__error() = v5;
  return v5;
}

int unpost_form(FORM *a1)
{
  unsigned __int16 status;
  int v3;
  void (__cdecl *fieldterm)(formnode *);
  void (__cdecl *formterm)(formnode *);
  WINDOW *sub;

  if (a1)
  {
    status = a1->status;
    if ((a1->status & 1) != 0)
    {
      if ((status & 2) != 0)
      {
        v3 = -5;
      }
      else
      {
        fieldterm = a1->fieldterm;
        if (fieldterm)
        {
          a1->status = status | 2;
          ((void (*)(FORM *))fieldterm)(a1);
          status = a1->status & 0xFFFD;
          a1->status = status;
        }
        formterm = a1->formterm;
        if (formterm)
        {
          a1->status = status | 2;
          ((void (*)(FORM *))formterm)(a1);
          a1->status &= ~2u;
        }
        sub = a1->sub;
        if (!sub)
        {
          sub = a1->win;
          if (!sub)
            sub = *(WINDOW **)(*MEMORY[0x24BEDCA70] + 152);
        }
        werase(sub);
        delwin(a1->w);
        v3 = 0;
        a1->w = 0;
        a1->status &= ~1u;
      }
    }
    else
    {
      v3 = -7;
    }
  }
  else
  {
    v3 = -2;
  }
  *__error() = v3;
  return v3;
}

const char *__cdecl form_request_name(int a1)
{
  int *v1;
  const char *result;

  if ((a1 - 569) > 0xFFFFFFC6)
    return &aNextPage[13 * (a1 - 512)];
  v1 = __error();
  result = 0;
  *v1 = -2;
  return result;
}

int form_request_by_name(const char *a1)
{
  size_t v1;
  uint64_t v2;
  __darwin_ct_rune_t v3;
  unsigned __int8 *v4;
  __darwin_ct_rune_t v5;
  uint64_t v6;
  const char *v7;
  int *v9;
  int result;
  unsigned __int8 v11;
  _BYTE v12[23];

  *(_QWORD *)&v12[15] = *MEMORY[0x24BDAC8D0];
  if (a1 && (v1 = strlen(a1)) != 0)
  {
    if (v1 >= 0xE)
      v2 = 14;
    else
      v2 = v1;
    __memcpy_chk();
    v12[v2 - 1] = 0;
    v3 = v11;
    if (v11)
    {
      v4 = v12;
      do
      {
        *(v4 - 1) = __toupper(v3);
        v5 = *v4++;
        v3 = v5;
      }
      while (v5);
    }
    v6 = -57;
    v7 = "NEXT_PAGE";
    while (strcmp(v7, (const char *)&v11))
    {
      v7 += 13;
      if (__CFADD__(v6++, 1))
        goto LABEL_13;
    }
    return v6 + 569;
  }
  else
  {
LABEL_13:
    v9 = __error();
    result = -9;
    *v9 = -9;
  }
  return result;
}

int scale_form(const FORM *a1, int *a2, int *a3)
{
  int v3;

  if (a1)
  {
    if (a1->field)
    {
      if (a2)
        *a2 = a1->rows;
      v3 = 0;
      if (a3)
        *a3 = a1->cols;
    }
    else
    {
      v3 = -11;
    }
  }
  else
  {
    v3 = -2;
  }
  *__error() = v3;
  return v3;
}

int set_form_sub(FORM *a1, WINDOW *a2)
{
  int v2;
  FORM *v3;

  if (a1 && (a1->status & 1) != 0)
  {
    v2 = -3;
  }
  else
  {
    v2 = 0;
    v3 = (FORM *)_nc_Default_Form;
    if (a1)
      v3 = a1;
    v3->sub = a2;
  }
  *__error() = v2;
  return v2;
}

WINDOW *__cdecl form_sub(const FORM *a1)
{
  const FORM *v1;
  WINDOW *result;

  v1 = (const FORM *)_nc_Default_Form;
  if (a1)
    v1 = a1;
  result = v1->sub;
  if (!result)
  {
    result = v1->win;
    if (!result)
      return *(WINDOW **)(*MEMORY[0x24BEDCA70] + 152);
  }
  return result;
}

int set_form_userptr(FORM *a1, void *a2)
{
  FORM *v2;

  v2 = (FORM *)_nc_Default_Form;
  if (a1)
    v2 = a1;
  v2->usrptr = a2;
  *__error() = 0;
  return 0;
}

void *__cdecl form_userptr(const FORM *a1)
{
  const FORM *v1;

  v1 = (const FORM *)_nc_Default_Form;
  if (a1)
    v1 = a1;
  return v1->usrptr;
}

int set_form_win(FORM *a1, WINDOW *a2)
{
  int v2;
  FORM *v3;

  if (a1 && (a1->status & 1) != 0)
  {
    v2 = -3;
  }
  else
  {
    v2 = 0;
    v3 = (FORM *)_nc_Default_Form;
    if (a1)
      v3 = a1;
    v3->win = a2;
  }
  *__error() = v2;
  return v2;
}

WINDOW *__cdecl form_win(const FORM *a1)
{
  const FORM *v1;
  WINDOW *win;

  v1 = (const FORM *)_nc_Default_Form;
  if (a1)
    v1 = a1;
  win = v1->win;
  if (win)
    return win;
  else
    return (WINDOW *)*MEMORY[0x24BEDCAD8];
}

_DWORD *sub_21E535614(int **a1)
{
  int *v1;
  int v2;
  _DWORD *result;

  v1 = *a1;
  *a1 += 2;
  v2 = *v1;
  result = malloc(4uLL);
  if (result)
    *result = v2;
  return result;
}

_DWORD *sub_21E53564C(_DWORD *a1)
{
  _DWORD *result;

  result = malloc(4uLL);
  if (result)
    *result = *a1;
  return result;
}

void sub_21E53567C(void *a1)
{
  if (a1)
    free(a1);
}

uint64_t sub_21E535688(const FIELD *a1, int *a2)
{
  unint64_t v2;
  const char *v3;
  int v4;
  int v5;
  uint64_t v6;
  _DWORD *v7;
  _DWORD *v8;
  signed int v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  unsigned int v13;
  int v15;

  v2 = *a2;
  v3 = field_buffer(a1, 0) - 1;
  do
  {
    v5 = *(unsigned __int8 *)++v3;
    v4 = v5;
  }
  while (v5 == 32);
  v6 = (v2 >> 31) & 1;
  if (!v4)
    return v6;
  v15 = 0;
  v7 = _nc_Widen_String(v3, (unsigned int *)&v15);
  if (!v7)
    return v6 & 1;
  v8 = v7;
  v9 = v15;
  if (v15 < 1)
  {
    LOBYTE(v6) = 1;
    goto LABEL_19;
  }
  v10 = 0;
  v11 = 0;
  v12 = v2 - 1;
  LOBYTE(v6) = 1;
  while (1)
  {
    v13 = v8[v10];
    if ((v11 & 1) != 0)
    {
      if (v13 != 32)
        goto LABEL_18;
      goto LABEL_12;
    }
    if (v13 != 32)
      break;
    LOBYTE(v6) = v10 >= v12;
LABEL_12:
    v11 = 1;
LABEL_15:
    if (++v10 >= v9)
      goto LABEL_19;
  }
  if (sub_21E53576C(v13))
  {
    v11 = 0;
    v9 = v15;
    goto LABEL_15;
  }
LABEL_18:
  LOBYTE(v6) = 0;
LABEL_19:
  free(v8);
  return v6 & 1;
}

BOOL sub_21E53576C(unsigned int a1)
{
  unsigned __int8 v1;
  int v3;

  v1 = a1;
  if (a1 > 0x7F)
  {
    if (__maskrune(a1, 0x500uLL))
      return 1;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a1 + 60) & 0x500) != 0)
  {
    return 1;
  }
  if (v1 > 0x7Fu)
    v3 = __maskrune(v1, 0x500uLL);
  else
    v3 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v1 + 60) & 0x500;
  return v3 != 0;
}

_DWORD *sub_21E5357FC(int **a1)
{
  int *v1;
  int v2;
  _DWORD *result;

  v1 = *a1;
  *a1 += 2;
  v2 = *v1;
  result = malloc(4uLL);
  if (result)
    *result = v2;
  return result;
}

_DWORD *sub_21E535834(_DWORD *a1)
{
  _DWORD *result;

  result = malloc(4uLL);
  if (result)
    *result = *a1;
  return result;
}

void sub_21E535864(void *a1)
{
  if (a1)
    free(a1);
}

uint64_t sub_21E535870(const FIELD *a1, int *a2)
{
  unint64_t v2;
  const char *v3;
  int v4;
  int v5;
  uint64_t v6;
  _DWORD *v7;
  _DWORD *v8;
  signed int v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  unsigned int v13;
  int v15;

  v2 = *a2;
  v3 = field_buffer(a1, 0) - 1;
  do
  {
    v5 = *(unsigned __int8 *)++v3;
    v4 = v5;
  }
  while (v5 == 32);
  v6 = (v2 >> 31) & 1;
  if (!v4)
    return v6;
  v15 = 0;
  v7 = _nc_Widen_String(v3, (unsigned int *)&v15);
  if (!v7)
    return v6 & 1;
  v8 = v7;
  v9 = v15;
  if (v15 < 1)
  {
    LOBYTE(v6) = 1;
    goto LABEL_19;
  }
  v10 = 0;
  v11 = 0;
  v12 = v2 - 1;
  LOBYTE(v6) = 1;
  while (1)
  {
    v13 = v8[v10];
    if ((v11 & 1) != 0)
    {
      if (v13 != 32)
        goto LABEL_18;
      goto LABEL_12;
    }
    if (v13 != 32)
      break;
    LOBYTE(v6) = v10 >= v12;
LABEL_12:
    v11 = 1;
LABEL_15:
    if (++v10 >= v9)
      goto LABEL_19;
  }
  if (sub_21E535954(v13))
  {
    v11 = 0;
    v9 = v15;
    goto LABEL_15;
  }
LABEL_18:
  LOBYTE(v6) = 0;
LABEL_19:
  free(v8);
  return v6 & 1;
}

BOOL sub_21E535954(unsigned int a1)
{
  unsigned __int8 v1;
  int v3;

  v1 = a1;
  if (a1 > 0x7F)
  {
    if (__maskrune(a1, 0x100uLL))
      return 1;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a1 + 60) & 0x100) != 0)
  {
    return 1;
  }
  if (v1 > 0x7Fu)
    v3 = __maskrune(v1, 0x100uLL);
  else
    v3 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v1 + 60) & 0x100;
  return v3 != 0;
}

_BYTE *sub_21E5359DC(uint64_t *a1)
{
  uint64_t v1;
  const char **v2;
  int v3;
  int v4;
  _BYTE *v5;
  _BYTE *v6;
  int v7;
  size_t v8;
  char **v10;
  char **v11;
  const char *v12;
  const char **v13;
  const char *v14;

  v1 = *a1;
  *a1 += 8;
  v2 = *(const char ***)v1;
  *a1 = v1 + 16;
  v3 = *(_DWORD *)(v1 + 8);
  *a1 = v1 + 24;
  v4 = *(_DWORD *)(v1 + 16);
  v5 = malloc(0x10uLL);
  v6 = v5;
  if (v5)
  {
    v5[12] = v3 != 0;
    v5[13] = v4 != 0;
    *(_QWORD *)v5 = 0;
    if (v2 && *v2)
    {
      v7 = 0;
      v8 = 1;
      do
        ++v7;
      while (v2[v8++]);
      *((_DWORD *)v6 + 2) = v7;
      v10 = (char **)malloc(v8 * 8);
      *(_QWORD *)v6 = v10;
      if (v10)
      {
        v11 = v10;
        v12 = *v2;
        if (*v2)
        {
          v13 = v2 + 1;
          do
          {
            *v11++ = strdup(v12);
            v14 = *v13++;
            v12 = v14;
          }
          while (v14);
        }
        *v11 = 0;
      }
    }
    else
    {
      *((_DWORD *)v5 + 2) = 0;
    }
  }
  return v6;
}

char ***sub_21E535AB4(uint64_t a1)
{
  char ***v2;
  char ***v3;
  uint64_t v4;
  const char **v5;
  char **v6;
  char **v7;
  const char *v8;
  const char **v9;
  const char *v10;

  if (!a1)
    return 0;
  v2 = (char ***)malloc(0x10uLL);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)v2 = *(_OWORD *)a1;
    v4 = *(unsigned int *)(a1 + 8);
    if ((int)v4 >= 1)
    {
      v5 = *(const char ***)a1;
      v6 = (char **)malloc(8 * v4 + 8);
      *v3 = v6;
      if (v6)
      {
        v7 = v6;
        if (v5)
        {
          v8 = *v5;
          if (*v5)
          {
            v9 = v5 + 1;
            do
            {
              *v7++ = strdup(v8);
              v10 = *v9++;
              v8 = v10;
            }
            while (v10);
          }
        }
        *v7 = 0;
      }
    }
  }
  return v3;
}

void sub_21E535B4C(int *a1)
{
  void **v2;
  void *v3;
  void **v4;
  void *v5;

  if (a1)
  {
    v2 = *(void ***)a1;
    if (v2 && a1[2] >= 1)
    {
      v3 = *v2;
      if (*v2)
      {
        v4 = v2 + 1;
        do
        {
          free(v3);
          v5 = *v4++;
          v3 = v5;
        }
        while (v5);
        v2 = *(void ***)a1;
      }
      free(v2);
    }
    free(a1);
  }
}

uint64_t sub_21E535BAC(FIELD *a1, uint64_t a2)
{
  unsigned __int8 **v3;
  int v4;
  int v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int v8;
  unsigned __int8 *v9;
  uint64_t v10;
  int v11;

  v3 = *(unsigned __int8 ***)a2;
  v4 = *(unsigned __int8 *)(a2 + 12);
  v5 = *(unsigned __int8 *)(a2 + 13);
  v6 = (unsigned __int8 *)field_buffer(a1, 0);
  do
  {
    if (!v3)
      return 0;
    v7 = *v3;
    if (!*v3)
      return 0;
    ++v3;
    v8 = sub_21E535E40(v7, v6, v4 != 0);
  }
  while (!v8);
  if (v5)
  {
    if (v8 != 2)
    {
      v9 = *v3;
      if (*v3)
      {
        v10 = 1;
        do
        {
          v11 = sub_21E535E40(v9, v6, v4 != 0);
          if (v11)
          {
            if (v11 == 2)
            {
              v7 = v9;
              goto LABEL_16;
            }
            v7 = 0;
          }
          v9 = v3[v10++];
        }
        while (v9);
        if (v7)
          goto LABEL_16;
        return 0;
      }
    }
  }
LABEL_16:
  set_field_buffer(a1, 0, (const char *)v7);
  return 1;
}

uint64_t sub_21E535C8C(FIELD *a1, uint64_t a2)
{
  const char **v4;
  int v5;
  int v6;
  char *v7;
  unsigned __int8 *v8;
  int v9;
  char *v10;

  v4 = *(const char ***)a2;
  v5 = *(unsigned __int8 *)(a2 + 12);
  v6 = *(_DWORD *)(a2 + 8);
  v7 = field_buffer(a1, 0);
  if (!v4)
    return 0;
  v8 = (unsigned __int8 *)v7;
  v9 = v6 + 1;
  do
  {
    if (!--v9)
    {
      v4 = *(const char ***)a2;
      goto LABEL_9;
    }
    v10 = (char *)*v4++;
  }
  while (sub_21E535E40((unsigned __int8 *)v10, v8, v5 != 0) != 2);
  if (v9 > 1)
    goto LABEL_10;
  v4 = *(const char ***)a2;
  if (v9 == 1)
    goto LABEL_10;
LABEL_9:
  if (sub_21E535E40(byte_2553E4160, v8, v5 != 0) != 2)
    return 0;
LABEL_10:
  set_field_buffer(a1, 0, *v4);
  return 1;
}

uint64_t sub_21E535D54(FIELD *a1, uint64_t *a2)
{
  int v4;
  uint64_t v5;
  int v6;
  char *v7;
  unsigned __int8 *v8;
  const char **v9;
  int v10;
  char *v11;

  v4 = *((_DWORD *)a2 + 2);
  v5 = *a2;
  v6 = *((unsigned __int8 *)a2 + 12);
  v7 = field_buffer(a1, 0);
  if (!v5)
    return 0;
  v8 = (unsigned __int8 *)v7;
  v9 = (const char **)(v5 + 8 * (v4 - 1));
  v10 = v4 + 1;
  do
  {
    if (!--v10)
    {
      v9 = (const char **)(*a2 + 8 * *((int *)a2 + 2) - 8);
      goto LABEL_9;
    }
    v11 = (char *)*v9--;
  }
  while (sub_21E535E40((unsigned __int8 *)v11, v8, v6 != 0) != 2);
  if (v10 > 1)
    goto LABEL_10;
  v9 = (const char **)(*a2 + 8 * *((int *)a2 + 2) - 8);
  if (v10 == 1)
    goto LABEL_10;
LABEL_9:
  if (sub_21E535E40(byte_2553E4160, v8, v6 != 0) != 2)
    return 0;
LABEL_10:
  set_field_buffer(a1, 0, *v9);
  return 1;
}

uint64_t sub_21E535E40(unsigned __int8 *a1, unsigned __int8 *a2, char a3)
{
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t i;
  int v10;
  uint64_t j;
  __darwin_ct_rune_t v13;
  __darwin_ct_rune_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;

  do
  {
    v6 = *a2++;
    v5 = v6;
  }
  while (v6 == 32);
  do
  {
    v8 = *a1++;
    v7 = v8;
  }
  while (v8 == 32);
  if (!v5)
    return 2 * (v7 == 0);
  if ((a3 & 1) != 0)
  {
    for (i = -1; ; ++i)
    {
      v10 = a1[i];
      if (v10 != a2[i])
        break;
      if (!v10)
        return 2;
    }
    v15 = &a1[i];
    v16 = &a2[i];
  }
  else
  {
    for (j = -1; ; ++j)
    {
      v13 = __toupper(a1[j]);
      v14 = a2[j];
      if (v13 != __toupper(v14))
        break;
      if (!v14)
        return 2;
    }
    v15 = &a1[j];
    v16 = &a2[j];
  }
  while (*v16 == 32)
    ++v16;
  if (*v16)
    return 0;
  if (*v15)
    return 1;
  return 2;
}

_DWORD *sub_21E535F3C(int **a1)
{
  int *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  _DWORD *result;

  v1 = *a1;
  *a1 += 2;
  v2 = *v1;
  *a1 = v1 + 4;
  v3 = *((_QWORD *)v1 + 1);
  *a1 = v1 + 6;
  v4 = *((_QWORD *)v1 + 2);
  result = malloc(0x18uLL);
  if (result)
  {
    *result = v2;
    result[1] = 0;
    *((_QWORD *)result + 1) = v3;
    *((_QWORD *)result + 2) = v4;
  }
  return result;
}

__n128 sub_21E535F98(__n128 *a1)
{
  __n128 *v2;
  __n128 result;

  if (a1)
  {
    v2 = (__n128 *)malloc(0x18uLL);
    if (v2)
    {
      result = *a1;
      *v2 = *a1;
      v2[1].n128_u64[0] = a1[1].n128_u64[0];
    }
  }
  return result;
}

void sub_21E535FD4(void *a1)
{
  if (a1)
    free(a1);
}

uint64_t sub_21E535FE0(FIELD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  char *v6;
  const char *v7;
  int v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  char v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v19;
  char v20[4];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_DWORD *)a2;
  v6 = field_buffer(a1, 0);
  v7 = v6;
  do
    v8 = *v6++;
  while (v8 == 32);
  if (!*(v6 - 1))
    return 0;
  if (v8 == 45)
  {
    if (!*v6)
      return 0;
  }
  else
  {
    --v6;
  }
  *(_DWORD *)v20 = 0;
  result = (uint64_t)_nc_Widen_String(v6, (unsigned int *)v20);
  if (!result)
    return result;
  if (*(int *)v20 <= 0)
  {
    free((void *)result);
    v14 = 1;
    goto LABEL_26;
  }
  v10 = 0;
  v11 = 0;
  v12 = 0;
  while (1)
  {
    v13 = *(unsigned int *)(result + 4 * v10);
    if ((v12 & 1) != 0)
    {
      if ((_DWORD)v13 != 32)
        break;
LABEL_15:
      v12 = 1;
      goto LABEL_16;
    }
    if ((_DWORD)v13 == 32)
      goto LABEL_15;
    if (v13 <= 0xFF && (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v13 + 60) & 0x400) != 0)
    {
      v12 = 0;
      goto LABEL_16;
    }
    v12 = 0;
    if ((*(_DWORD *)(result + 4 * v10) & 0xFEu) - 48 > 9)
      break;
LABEL_16:
    v11 = ++v10 >= (unint64_t)*(unsigned int *)v20;
    if (*(unsigned int *)v20 == v10)
    {
      v14 = 1;
      goto LABEL_25;
    }
  }
  v14 = 0;
LABEL_25:
  free((void *)result);
  if (!v11)
    return 0;
LABEL_26:
  v15 = atol(v7);
  v16 = v15;
  if ((v15 > v4 || v15 < v3) && v3 < v4)
    v19 = 0;
  else
    v19 = v14;
  result = v19 != 0;
  if (v19)
  {
    __sprintf_chk(v20, 0, 0x64uLL, "%.*ld", v5 & ~(v5 >> 31), v16);
    set_field_buffer(a1, 0, v20);
    return 1;
  }
  return result;
}

uint64_t sub_21E5361AC(int a1)
{
  unsigned int v1;

  if (a1 - 48 < 0xA)
    v1 = 1;
  else
    v1 = (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a1 + 60) >> 10) & 1;
  if (a1 == 45)
    return 1;
  else
    return v1;
}

uint64_t sub_21E5361DC(const FIELD *a1)
{
  char *v1;
  uint64_t result;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  v1 = field_buffer(a1, 0);
  result = 0;
  v7 = 0;
  v8 = 0;
  v6 = 0;
  if (*v1 - 48 <= 9)
  {
    if (sscanf(v1, "%u.%u.%u.%u%n", &v8, (char *)&v7 + 4, &v7, &v6, (char *)&v8 + 4) == 4)
    {
      v3 = &v1[SHIDWORD(v8)];
      v4 = MEMORY[0x24BDAC740];
      do
      {
        v5 = *v3;
        if (*v3 < 0)
          result = __maskrune(v5, 0x4000uLL);
        else
          result = *(_DWORD *)(v4 + 4 * v5 + 60) & 0x4000;
        ++v3;
      }
      while ((_DWORD)result);
      if (!*(v3 - 1) && v8 <= 0xFF && HIDWORD(v7) <= 0xFF && v7 <= 0xFF)
        return v6 < 0x100;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL sub_21E5362D8(int a1)
{
  return a1 == 46 || (a1 & 0xFEu) - 48 < 0xA;
}

_QWORD *sub_21E5362F0(int **a1)
{
  int *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v1 = *a1;
  *a1 += 2;
  v2 = *v1;
  *a1 = v1 + 4;
  v3 = *((_QWORD *)v1 + 1);
  *a1 = v1 + 6;
  v4 = *((_QWORD *)v1 + 2);
  v5 = malloc(0x20uLL);
  v6 = v5;
  if (v5)
  {
    *(_DWORD *)v5 = v2;
    v5[1] = v3;
    v5[2] = v4;
    v5[3] = localeconv();
  }
  return v6;
}

__n128 sub_21E53635C(uint64_t a1)
{
  _OWORD *v2;
  __n128 result;
  __int128 v4;

  if (a1)
  {
    v2 = malloc(0x20uLL);
    if (v2)
    {
      result = *(__n128 *)a1;
      v4 = *(_OWORD *)(a1 + 16);
      *v2 = *(_OWORD *)a1;
      v2[1] = v4;
    }
  }
  return result;
}

void sub_21E536390(void *a1)
{
  if (a1)
    free(a1);
}

uint64_t sub_21E53639C(FIELD *a1, uint64_t a2)
{
  double v4;
  double v5;
  int v6;
  char *v7;
  const char *v8;
  _QWORD *v9;
  int v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  int v14;
  char v15;
  uint64_t v16;
  int v17;
  int v18;
  double v19;
  int v22;
  char v23[4];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *(double *)(a2 + 8);
  v5 = *(double *)(a2 + 16);
  v6 = *(_DWORD *)a2;
  v7 = field_buffer(a1, 0);
  v8 = v7;
  v9 = *(_QWORD **)(a2 + 24);
  do
    v10 = *v7++;
  while (v10 == 32);
  if (!*(v7 - 1))
    return 0;
  if (v10 == 43 || v10 == 45)
  {
    if (!*v7)
      return 0;
  }
  else
  {
    --v7;
  }
  *(_DWORD *)v23 = 0;
  result = (uint64_t)_nc_Widen_String(v7, (unsigned int *)v23);
  if (!result)
    return result;
  if (*(int *)v23 <= 0)
  {
    free((void *)result);
    v18 = 1;
    goto LABEL_34;
  }
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  while (1)
  {
    v16 = *(unsigned int *)(result + 4 * v12);
    if ((v15 & 1) != 0)
    {
      if ((_DWORD)v16 != 32)
        break;
LABEL_16:
      v15 = 1;
      goto LABEL_17;
    }
    if ((_DWORD)v16 == 32)
      goto LABEL_16;
    if (v9 && *v9)
      v17 = *(char *)*v9;
    else
      v17 = 46;
    if ((_DWORD)v16 == v17)
    {
      if (v14 > 0)
        break;
      v15 = 0;
      v14 = 1;
      goto LABEL_17;
    }
    if (v16 <= 0xFF && (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v16 + 60) & 0x400) != 0)
    {
      v15 = 0;
      goto LABEL_17;
    }
    v15 = 0;
    if ((*(_DWORD *)(result + 4 * v12) & 0xFEu) - 48 > 9)
      break;
LABEL_17:
    v13 = ++v12 >= (unint64_t)*(unsigned int *)v23;
    if (*(unsigned int *)v23 == v12)
    {
      v18 = 1;
      goto LABEL_33;
    }
  }
  v18 = 0;
LABEL_33:
  free((void *)result);
  if (!v13)
    return 0;
LABEL_34:
  v19 = atof(v8);
  if ((v19 > v5 || v19 < v4) && v4 < v5)
    v22 = 0;
  else
    v22 = v18;
  result = v22 != 0;
  if (v22)
  {
    __sprintf_chk(v23, 0, 0x40uLL, "%.*f", v6 & ~(v6 >> 31), v19);
    set_field_buffer(a1, 0, v23);
    return 1;
  }
  return result;
}

BOOL sub_21E5365B0(unsigned int a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  int v5;

  v2 = *(_QWORD **)(a2 + 24);
  if (a1 <= 0xFF && (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a1 + 60) & 0x400) != 0 || (a1 & 0xFE) - 48 < 0xA)
    return 1;
  v3 = 1;
  if (a1 != 43 && a1 != 45)
  {
    if (v2 && *v2)
      v5 = *(char *)*v2;
    else
      v5 = 46;
    return v5 == a1;
  }
  return v3;
}

void **sub_21E536624(const char ***a1)
{
  const char **v1;
  const char *v2;
  void **v3;
  regex_t *v4;
  _QWORD *v6;

  v1 = (*a1)++;
  v2 = *v1;
  if (!*v1)
    return 0;
  v3 = (void **)calloc(1uLL, 0x10uLL);
  if (v3)
  {
    v4 = (regex_t *)malloc(0x20uLL);
    *v3 = v4;
    if (!v4)
    {
LABEL_7:
      free(v3);
      return 0;
    }
    if (regcomp(v4, v2, 13))
    {
      if (*v3)
        free(*v3);
      goto LABEL_7;
    }
    v6 = malloc(8uLL);
    v3[1] = v6;
    if (v6)
      *v6 = 1;
  }
  return v3;
}

uint64_t sub_21E5366BC(uint64_t result)
{
  if (result)
    ++**(_QWORD **)(result + 8);
  return result;
}

void sub_21E5366D4(_QWORD *a1)
{
  _QWORD *v2;

  if (a1)
  {
    v2 = (_QWORD *)a1[1];
    if ((*v2)-- == 1)
    {
      if (*a1)
      {
        free(v2);
        MEMORY[0x2207AFA94](*a1);
        free((void *)*a1);
      }
      free(a1);
    }
  }
}

BOOL sub_21E536734(const FIELD *a1, const regex_t **a2)
{
  const regex_t *v2;
  char *v3;

  if (!a2)
    return 0;
  v2 = *a2;
  if (!*a2)
    return 0;
  v3 = field_buffer(a1, 0);
  return regexec(v2, v3, 0, 0, 0) == 0;
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x24BDAC8B8](a1, *(_QWORD *)&a2, a3, a4);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
}

uint64_t _nc_wcrtomb()
{
  return MEMORY[0x24BEDCA80]();
}

double atof(const char *a1)
{
  double result;

  MEMORY[0x24BDAD250](a1);
  return result;
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x24BDAD260](a1);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

int copywin(const WINDOW *a1, WINDOW *a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9)
{
  return MEMORY[0x24BEDCA88](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8);
}

int delwin(WINDOW *a1)
{
  return MEMORY[0x24BEDCA98](a1);
}

WINDOW *__cdecl derwin(WINDOW *a1, int a2, int a3, int a4, int a5)
{
  return (WINDOW *)MEMORY[0x24BEDCAA0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int getmouse(MEVENT *a1)
{
  return MEMORY[0x24BEDCAA8](a1);
}

BOOL is_linetouched(WINDOW *a1, int a2)
{
  return MEMORY[0x24BEDCAB0](a1, *(_QWORD *)&a2);
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x24BDAEA90]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

int mblen(const char *__s, size_t __n)
{
  return MEMORY[0x24BDAEE08](__s, __n);
}

int mbtowc(__int32 *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAEE60](a1, a2, a3);
}

WINDOW *__cdecl newpad(int a1, int a2)
{
  return (WINDOW *)MEMORY[0x24BEDCAB8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x24BDAFAF8](a1, a2, *(_QWORD *)&a3);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x24BDAFB08](a1, a2, a3, __pmatch, *(_QWORD *)&a5);
}

void regfree(regex_t *a1)
{
  MEMORY[0x24BDAFB10](a1);
}

uint64_t setcchar()
{
  return MEMORY[0x24BEDCAC8]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t wadd_wch()
{
  return MEMORY[0x24BEDCB18]();
}

uint64_t wadd_wchnstr()
{
  return MEMORY[0x24BEDCB20]();
}

int waddch(WINDOW *a1, const chtype a2)
{
  return MEMORY[0x24BEDCB28](a1, *(_QWORD *)&a2);
}

int waddnstr(WINDOW *a1, const char *a2, int a3)
{
  return MEMORY[0x24BEDCB30](a1, a2, *(_QWORD *)&a3);
}

void wbkgdset(WINDOW *a1, chtype a2)
{
  MEMORY[0x24BEDCB38](a1, *(_QWORD *)&a2);
}

int wclear(WINDOW *a1)
{
  return MEMORY[0x24BEDCB40](a1);
}

int wclrtobot(WINDOW *a1)
{
  return MEMORY[0x24BEDCB48](a1);
}

int wclrtoeol(WINDOW *a1)
{
  return MEMORY[0x24BEDCB50](a1);
}

void wcursyncup(WINDOW *a1)
{
  MEMORY[0x24BEDCB58](a1);
}

int wcwidth(__int32 a1)
{
  return MEMORY[0x24BDB0510](*(_QWORD *)&a1);
}

int wdelch(WINDOW *a1)
{
  return MEMORY[0x24BEDCB60](a1);
}

BOOL wenclose(const WINDOW *a1, int a2, int a3)
{
  return MEMORY[0x24BEDCB68](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int werase(WINDOW *a1)
{
  return MEMORY[0x24BEDCB70](a1);
}

uint64_t win_wch()
{
  return MEMORY[0x24BEDCB78]();
}

uint64_t win_wchnstr()
{
  return MEMORY[0x24BEDCB80]();
}

chtype winch(WINDOW *a1)
{
  return MEMORY[0x24BEDCB88](a1);
}

int winnstr(WINDOW *a1, char *a2, int a3)
{
  return MEMORY[0x24BEDCB90](a1, a2, *(_QWORD *)&a3);
}

uint64_t wins_wch()
{
  return MEMORY[0x24BEDCB98]();
}

int winsch(WINDOW *a1, chtype a2)
{
  return MEMORY[0x24BEDCBA0](a1, *(_QWORD *)&a2);
}

int winsdelln(WINDOW *a1, int a2)
{
  return MEMORY[0x24BEDCBA8](a1, *(_QWORD *)&a2);
}

BOOL wmouse_trafo(const WINDOW *a1, int *a2, int *a3, BOOL a4)
{
  return MEMORY[0x24BEDCBB0](a1, a2, a3, a4);
}

int wmove(WINDOW *a1, int a2, int a3)
{
  return MEMORY[0x24BEDCBB8](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int wresize(WINDOW *a1, int a2, int a3)
{
  return MEMORY[0x24BEDCBC0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

void wsyncup(WINDOW *a1)
{
  MEMORY[0x24BEDCBC8](a1);
}

