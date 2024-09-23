@implementation EMFReader

- (EMFReader)initWithEMFPlayer:(id)a3
{
  objc_storeStrong((id *)&self->m_player, a3);
  return self;
}

- (int)play:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  int v11;
  int v12;
  _BOOL4 v13;
  BOOL v14;
  int v15;
  int v16;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");
  if (v6)
  {
    v7 = 0;
    v8 = v5 + v6;
    while (v5 + 8 <= v8)
    {
      v9 = *(_DWORD *)(v5 + 4);
      if (v9 < 8)
        break;
      v10 = v5 + v9;
      if (v10 > v8)
        break;
      v11 = -[EMFPlayer play:in_pRecord:](self->m_player, "play:in_pRecord:");
      if (v11 == -7)
        v12 = 0;
      else
        v12 = v11;
      v7 |= v11 == -7;
      v13 = v12 == 0;
      if (v12)
        v14 = 1;
      else
        v14 = v10 == v8;
      v5 = v10;
      if (v14)
        goto LABEL_17;
    }
    v13 = 0;
    v12 = -7;
  }
  else
  {
    v12 = 0;
    v7 = 0;
    v13 = 1;
  }
LABEL_17:
  -[EMFPlayer done](self->m_player, "done");
  if ((v7 & 1) != 0)
    v15 = -7;
  else
    v15 = 0;
  if (v13)
    v16 = v15;
  else
    v16 = v12;

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_player, 0);
}

@end
