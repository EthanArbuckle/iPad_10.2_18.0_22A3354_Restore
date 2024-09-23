@implementation WBSURLSuffixChecker

- (WBSURLSuffixChecker)initWithSuffixes:(id)a3
{
  id v4;
  WBSURLSuffixChecker *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  WBSURLSuffixChecker *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[8];
  uint64_t v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WBSURLSuffixChecker;
  v5 = -[WBSURLSuffixChecker init](&v20, sel_init);
  if (v5)
  {
    v5->_trie = ($BB8B2815F19B946069E0C78052E8954D *)malloc_type_calloc(0x36uLL, 2uLL, 0x4266D233uLL);
    v5->_trieNodeCount = 2;
    memset(v18, 0, sizeof(v18));
    WORD1(v18[0]) = 1;
    v19 = 1;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (!-[WBSURLSuffixChecker insertString:intoTrieWithCache:](v5, "insertString:intoTrieWithCache:", v11, v18, (_QWORD)v14))-[WBSURLSuffixChecker addStringToFailedSuffixes:](v5, "addStringToFailedSuffixes:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
      }
      while (v8);
    }

    v12 = v5;
  }

  return v5;
}

- (BOOL)insertString:(id)a3 intoTrieWithCache:(id *)a4
{
  __CFString *v6;
  unint64_t Length;
  unint64_t v8;
  _BYTE *CStringPtr;
  unint64_t maxLength;
  unint64_t var1;
  unint64_t v12;
  $201E9A47BE70A2B12CCA2F48B75AA2F7 *v13;
  unint64_t v14;
  int v15;
  int v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  $BB8B2815F19B946069E0C78052E8954D *trie;
  unint64_t v21;
  unsigned __int16 *p_var1;
  $BB8B2815F19B946069E0C78052E8954D *v23;
  int v24;
  unsigned int v25;
  int v26;
  unsigned int trieNodeCount;
  unsigned __int16 v28;
  $BB8B2815F19B946069E0C78052E8954D *v29;
  $BB8B2815F19B946069E0C78052E8954D *v30;
  BOOL v31;
  int v33;
  uint64_t v34;
  uint64_t v35;
  char buffer[32];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  Length = CFStringGetLength(v6);
  if (Length > 0x20)
    goto LABEL_33;
  v8 = Length;
  CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
  if (!CStringPtr)
  {
    CStringPtr = buffer;
    if (!CFStringGetCString(v6, buffer, 32, 0x600u))
      goto LABEL_33;
  }
  maxLength = self->_maxLength;
  if (maxLength <= v8)
    maxLength = v8;
  self->_maxLength = maxLength;
  if (*CStringPtr == 46)
  {
    var1 = a4->var1;
    if (v8 >= var1)
      v12 = a4->var1;
    else
      v12 = v8;
    if (v12 >= 2)
    {
      v13 = &a4->var0[1];
      v14 = 1;
      do
      {
        v15 = (char)CStringPtr[v14];
        v16 = (v15 | 0x20) - 96;
        if ((v15 | 0x20u) - 123 < 0xFFFFFFE6)
          v16 = -1;
        if (v15 == 46)
          v17 = 0;
        else
          v17 = v16;
        if (v17 != v13->var0)
        {
          a4->var1 = v14;
          var1 = v14;
        }
        ++v14;
        if (v8 >= var1)
          v18 = var1;
        else
          v18 = v8;
        ++v13;
      }
      while (v14 < v18);
    }
    v19 = var1 - 1;
    trie = self->_trie;
    a4->var1 = v8;
    v21 = v8 - 1;
    if (v8 - 1 <= var1 - 1)
    {
      v23 = trie;
    }
    else
    {
      p_var1 = &a4->var0[v8 - 1].var1;
      v23 = trie;
      do
      {
        v24 = (char)CStringPtr[v21];
        if (v24 == 46)
        {
          v25 = 0;
        }
        else
        {
          v26 = v24 | 0x20;
          if ((v26 - 123) < 0xFFFFFFE6)
            goto LABEL_33;
          v25 = v26 - 96;
        }
        trieNodeCount = v23->var0[v25];
        v28 = v25;
        if (!v23->var0[v25])
        {
          trieNodeCount = self->_trieNodeCount;
          self->_trieNodeCount = trieNodeCount + 1;
          v23->var0[v25] = trieNodeCount;
          v29 = ($BB8B2815F19B946069E0C78052E8954D *)malloc_type_realloc(trie, 54 * (trieNodeCount + 1), 0x10000409C08D13AuLL);
          self->_trie = v29;
          v30 = &v29[trieNodeCount];
          *(_QWORD *)&v30->var0[23] = 0;
          *(_OWORD *)&v30->var0[8] = 0u;
          *(_OWORD *)&v30->var0[16] = 0u;
          *(_OWORD *)v30->var0 = 0u;
          trie = self->_trie;
        }
        *(p_var1 - 1) = v28;
        *p_var1 = trieNodeCount;
        p_var1 -= 2;
        v23 = &trie[trieNodeCount];
        --v21;
      }
      while (v21 > v19);
    }
    v33 = (char)CStringPtr[v19];
    LODWORD(v34) = (v33 | 0x20) - 96;
    if ((v33 | 0x20u) - 123 < 0xFFFFFFE6)
      v34 = 0xFFFFFFFFLL;
    else
      v34 = v34;
    if (v33 == 46)
      v35 = 0;
    else
      v35 = v34;
    v23->var0[v35] = a4->var0[v19].var1;
    v31 = 1;
  }
  else
  {
LABEL_33:
    v31 = 0;
  }

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedSuffixes, 0);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_trie);
  v3.receiver = self;
  v3.super_class = (Class)WBSURLSuffixChecker;
  -[WBSURLSuffixChecker dealloc](&v3, sel_dealloc);
}

- (void)addStringToFailedSuffixes:(id)a3
{
  id v4;
  NSMutableArray *failedSuffixes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  failedSuffixes = self->_failedSuffixes;
  v8 = v4;
  if (!failedSuffixes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_failedSuffixes;
    self->_failedSuffixes = v6;

    v4 = v8;
    failedSuffixes = self->_failedSuffixes;
  }
  -[NSMutableArray addObject:](failedSuffixes, "addObject:", v4);

}

- (BOOL)hasSuffix:(id)a3
{
  const __CFString *v4;
  __CFString *v5;
  unint64_t Length;
  char *CStringPtr;
  unint64_t maxLength;
  char *v9;
  $BB8B2815F19B946069E0C78052E8954D *trie;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  NSMutableArray *failedSuffixes;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26[128];
  char buffer[32];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFString *)a3;
  v5 = (__CFString *)v4;
  if (!v4)
    goto LABEL_30;
  Length = CFStringGetLength(v4);
  CStringPtr = (char *)CFStringGetCStringPtr(v5, 0x600u);
  if (CStringPtr || (CStringPtr = buffer, CFStringGetCString(v5, buffer, 32, 0x600u)))
  {
    if (Length >= self->_maxLength)
      maxLength = self->_maxLength;
    else
      maxLength = Length;
    if (maxLength)
    {
      v9 = &CStringPtr[Length - 1];
      trie = self->_trie;
      while (1)
      {
        v12 = *v9--;
        v11 = v12;
        if (v12 == 46)
        {
          v13 = 0;
        }
        else
        {
          v14 = v11 | 0x20;
          if ((v14 - 123) < 0xFFFFFFE6)
            break;
          v13 = v14 - 96;
        }
        v15 = trie->var0[v13];
        if (!v15)
          break;
        if (v15 == 1)
          goto LABEL_19;
        trie = &self->_trie[v15];
        if (!--maxLength)
          goto LABEL_18;
      }
    }
    else
    {
      trie = self->_trie;
LABEL_18:
      if (trie->var0[0] == 1)
      {
LABEL_19:
        LOBYTE(v16) = 1;
        goto LABEL_33;
      }
    }
  }
  failedSuffixes = self->_failedSuffixes;
  if (!failedSuffixes)
  {
LABEL_30:
    LOBYTE(v16) = 0;
    goto LABEL_33;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v18 = failedSuffixes;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v19 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v18);
        if (-[__CFString rangeOfString:options:](v5, "rangeOfString:options:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), 15, (_QWORD)v22) != 0x7FFFFFFFFFFFFFFFLL)
        {
          LOBYTE(v16) = 1;
          goto LABEL_32;
        }
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_32:

LABEL_33:
  return v16;
}

@end
