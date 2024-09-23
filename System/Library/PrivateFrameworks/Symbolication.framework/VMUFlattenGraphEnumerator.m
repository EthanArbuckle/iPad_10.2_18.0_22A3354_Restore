@implementation VMUFlattenGraphEnumerator

- (VMUFlattenGraphEnumerator)initWithGraph:(id)a3 graphEnumerator:(id)a4
{
  VMUGraphEnumerator *v6;
  VMUFlattenGraphEnumerator *v7;
  VMUGraphEnumerator *graphEnumerator;
  void *v9;
  _DWORD *v10;
  void *v11;
  _DWORD *v12;
  objc_super v14;

  v6 = (VMUGraphEnumerator *)a4;
  v14.receiver = self;
  v14.super_class = (Class)VMUFlattenGraphEnumerator;
  v7 = -[VMUGraphEnumerator initWithGraph:](&v14, sel_initWithGraph_, a3);
  graphEnumerator = v7->_graphEnumerator;
  v7->_graphEnumerator = v6;

  -[VMUGraphEnumerator graph](v7, "graph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "nodeNamespaceSize");
  v10 = malloc_type_calloc(1uLL, (((_DWORD)v6 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v10 = (_DWORD)v6;
  v7->_deliveredReachable = v10;

  -[VMUGraphEnumerator graph](v7, "graph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v11, "nodeNamespaceSize");
  v12 = malloc_type_calloc(1uLL, (((_DWORD)v6 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *v12 = (_DWORD)v6;
  v7->_topLevel = v12;

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_deliveredReachable);
  free(self->_topLevel);
  v3.receiver = self;
  v3.super_class = (Class)VMUFlattenGraphEnumerator;
  -[VMUFlattenGraphEnumerator dealloc](&v3, sel_dealloc);
}

- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  unsigned int *deliveredReachable;
  uint64_t v9;
  int v10;
  int v11;
  unsigned int *v12;
  void *v13;
  int v14;
  _DWORD *v15;
  void *v16;
  size_t v17;
  unsigned int *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  VMUGraphEnumerator *graphEnumerator;
  unsigned int *topLevel;
  _DWORD *v30;
  int v31;
  unint64_t v32;
  char *v33;
  _BYTE *v34;
  unint64_t v35;
  char v36;
  _QWORD *v37;
  unsigned int v38;
  unsigned int v39;
  int v40;
  char *v41;
  unsigned int v42;
  unsigned int v43;
  void *v45;
  _QWORD v46[2];
  uint64_t (*v47)(uint64_t, int);
  void *v48;
  id v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t, uint64_t, int);
  void *v54;
  uint64_t *v55;
  unsigned int *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  int __pattern4[3];

  v6 = a4;
  v7 = v6;
  if (!self->_iteratingTopLevel)
  {
    deliveredReachable = (unsigned int *)self->_deliveredReachable;
    if (*deliveredReachable <= a3
      || (v9 = (a3 >> 3) + 4,
          v10 = *((unsigned __int8 *)deliveredReachable + v9),
          v11 = 1 << (a3 & 7),
          (v11 & v10) == 0)
      || (v12 = (unsigned int *)self->_topLevel, *v12 > a3) && (v11 & *((_BYTE *)v12 + v9)) != 0)
    {
      v45 = v6;
      self->_iteratingTopLevel = 1;
      -[VMUGraphEnumerator graph](self, "graph");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "nodeNamespaceSize");
      v15 = malloc_type_calloc(1uLL, ((v14 + 7) >> 3) + 4, 0xFF42C4F3uLL);
      *v15 = v14;

      v57 = 0;
      v58 = &v57;
      v59 = 0x2020000000;
      v60 = 0;
      -[VMUGraphEnumerator graph](self, "graph");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 4 * objc_msgSend(v16, "nodeNamespaceSize");
      v18 = (unsigned int *)malloc_type_malloc(v17, 0x100004052888210uLL);
      __pattern4[0] = -1;
      memset_pattern4(v18, __pattern4, v17);

      v19 = v58[3];
      v58[3] = v19 + 1;
      v18[v19] = a3;
      v20 = v58;
      v21 = v58[3];
      v22 = MEMORY[0x1E0C809B0];
      if (v21 >= 1)
      {
        while (1)
        {
          v23 = v21 - 1;
          v20[3] = v23;
          v24 = v18[v23];
          if (*v15 <= v24)
            goto LABEL_10;
          v25 = (v24 >> 3) + 4;
          v26 = *((unsigned __int8 *)v15 + v25);
          v27 = 1 << (v24 & 7);
          if ((v27 & v26) == 0)
            break;
LABEL_11:
          v21 = v20[3];
          if (v21 <= 0)
            goto LABEL_12;
        }
        *((_BYTE *)v15 + v25) = v26 | v27;
LABEL_10:
        graphEnumerator = self->_graphEnumerator;
        v51 = v22;
        v52 = 3221225472;
        v53 = __60__VMUFlattenGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke;
        v54 = &unk_1E4E01C28;
        v55 = &v57;
        v56 = v18;
        -[VMUGraphEnumerator enumerateEdgesOfNode:withBlock:](graphEnumerator, "enumerateEdgesOfNode:withBlock:");
        v20 = v58;
        goto LABEL_11;
      }
LABEL_12:
      free(v18);
      topLevel = (unsigned int *)self->_topLevel;
      if (*topLevel > a3)
        *((_BYTE *)topLevel + (a3 >> 3) + 4) |= 1 << (a3 & 7);
      v7 = v45;
      v30 = self->_deliveredReachable;
      v31 = *v30;
      if (*v30 >= *v15)
        v31 = *v15;
      v32 = (v31 + 7);
      if (v32 >= 8)
      {
        v33 = (char *)(v15 + 1);
        v34 = v30 + 1;
        v35 = v32 >> 3;
        do
        {
          v36 = *v33++;
          *v34++ |= v36;
          --v35;
        }
        while (v35);
      }
      v46[0] = v22;
      v46[1] = 3221225472;
      v47 = __60__VMUFlattenGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke_2;
      v48 = &unk_1E4E01C78;
      v50 = a3;
      v49 = v45;
      v37 = v46;
      v38 = *v15;
      if (*v15)
      {
        v39 = 0;
        v40 = 1;
        do
        {
          v41 = (char *)v15 + (v39 >> 3);
          v42 = v41[4];
          v43 = v40;
          if (v41[4])
          {
            do
            {
              if ((v42 & 1) != 0)
                v47((uint64_t)v37, v43 - 1);
              if (v42 < 2)
                break;
              v42 >>= 1;
            }
            while (v43++ < v38);
          }
          v39 += 8;
          v40 += 8;
        }
        while (v39 < v38);
      }

      free(v15);
      self->_iteratingTopLevel = 0;

      _Block_object_dispose(&v57, 8);
    }
  }

}

uint64_t __60__VMUFlattenGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(result + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v6 = *(_QWORD *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6 + 1;
  *(_DWORD *)(v4 + 4 * v6) = a4;
  return result;
}

uint64_t __60__VMUFlattenGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke_2(uint64_t result, int a2)
{
  char v2;

  v2 = 0;
  if (*(_DWORD *)(result + 40) != a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (id)statusDisplayDescription
{
  return CFSTR("flatten");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphEnumerator, 0);
}

@end
