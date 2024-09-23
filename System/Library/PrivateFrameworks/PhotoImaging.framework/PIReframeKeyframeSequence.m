@implementation PIReframeKeyframeSequence

- (PIReframeKeyframeSequence)initWithKeyframeArray:(id)a3
{
  id v4;
  size_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  void *v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  _DWORD *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  NUKeyframeSequenceMatrixFloat33 *homographySequence;
  size_t v26;
  PIReframeKeyframeSequence *v27;
  char *v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PIReframeKeyframeSequence;
  v27 = -[PIReframeKeyframeSequence init](&v35, sel_init);
  v5 = objc_msgSend(v4, "count");
  v6 = (char *)malloc_type_calloc(v5, 0x18uLL, 0x1000040504FFAC1uLL);
  v26 = v5;
  v28 = (char *)malloc_type_calloc(v5, 0x30uLL, 0x1000040EED21634uLL);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v32;
    do
    {
      v12 = 0;
      v13 = &v28[48 * v10 + 32];
      v14 = &v6[24 * v10];
      do
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v12);
        if (v15)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v12), "time");
        }
        else
        {
          v29 = 0uLL;
          v30 = 0;
        }
        *((_QWORD *)v14 + 2) = v30;
        *(_OWORD *)v14 = v29;
        v14 += 24;
        objc_msgSend(v15, "homography", v26);
        *((_DWORD *)v13 - 6) = v16;
        *((_QWORD *)v13 - 4) = v17;
        *((_DWORD *)v13 - 2) = v18;
        *((_QWORD *)v13 - 2) = v19;
        v20 = v13 + 8;
        ++v12;
        *(_QWORD *)v13 = v21;
        v13 += 48;
        *v20 = v22;
      }
      while (v9 != v12);
      v10 += v12;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v9);
  }

  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0D52190]), "initWithCount:times:values:", v26, v6, v28);
  homographySequence = v27->_homographySequence;
  v27->_homographySequence = (NUKeyframeSequenceMatrixFloat33 *)v23;

  free(v6);
  free(v28);

  return v27;
}

- (unint64_t)count
{
  return -[NUKeyframeSequenceMatrixFloat33 count](self->_homographySequence, "count");
}

- (int64_t)interpolation
{
  return -[NUKeyframeSequenceMatrixFloat33 interpolation](self->_homographySequence, "interpolation");
}

- (uint64_t)homographyAtTime:(__int128 *)a3
{
  void *v3;
  __int128 v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 8);
  v5 = *a3;
  v6 = *((_QWORD *)a3 + 2);
  return objc_msgSend(v3, "sampleAtTime:", &v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homographySequence, 0);
}

@end
