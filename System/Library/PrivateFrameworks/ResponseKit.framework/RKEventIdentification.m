@implementation RKEventIdentification

- (RKEventIdentification)initWithOwnedTokenSequences:(id)a3 probabilities:(float *)a4
{
  id v7;
  RKEventIdentification *v8;
  RKEventIdentification *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RKEventIdentification;
  v8 = -[RKEventIdentification init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_tokenSequences, a3);
    v9->_probabilities = a4;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_probabilities);
  v3.receiver = self;
  v3.super_class = (Class)RKEventIdentification;
  -[RKEventIdentification dealloc](&v3, sel_dealloc);
}

- (void)enumerateClassifiedTokens:(id)a3
{
  void (**v4)(id, _QWORD *, float *, unsigned __int8 *);
  unint64_t v5;
  float *probabilities;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[3];
  unsigned __int8 v16;

  v4 = (void (**)(id, _QWORD *, float *, unsigned __int8 *))a3;
  v5 = 0;
  probabilities = self->_probabilities;
  while (v5 < -[NSArray count](self->_tokenSequences, "count"))
  {
    -[NSArray objectAtIndex:](self->_tokenSequences, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 >= kMaxSequenceLength)
      v9 = kMaxSequenceLength;
    else
      v9 = v8;
    if (v9)
    {
      v10 = 0;
      do
      {
        -[NSArray objectAtIndex:](self->_tokenSequences, "objectAtIndex:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "location");
        v14 = objc_msgSend(v12, "length");
        v16 = 0;
        v15[0] = v5;
        v15[1] = v13;
        v15[2] = v14;
        v4[2](v4, v15, probabilities, &v16);
        LODWORD(v13) = v16;

        if ((_DWORD)v13)
          goto LABEL_11;
        probabilities += 5;
      }
      while (v9 != ++v10);
    }
    ++v5;
  }
LABEL_11:

}

- (void)enumerateTopKClassificationsForEachString:(unint64_t)a3 block:(id)a4
{
  void (**v6)(id, _QWORD *);
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD *))a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v14 = self->_tokenSequences;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v14);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "count");
        if (v11 >= kMaxSequenceLength)
          v12 = kMaxSequenceLength;
        else
          v12 = v11;
        findTopKClassifications(&v13 - 2 * a3, a3, (uint64_t)self->_probabilities, v8, v12);
        v6[2](v6, &v13 - 2 * a3);
        v8 += v12;
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void)getTopKClassifications:(unint64_t)a3 block:(id)a4
{
  void (**v6)(id, _OWORD *);
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _OWORD *))a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_tokenSequences;
  v8 = 0;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "count", (_QWORD)v14);
        if (kMaxSequenceLength >= v12)
          v13 = v12;
        else
          v13 = kMaxSequenceLength;
        v8 += v13;
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  findTopKClassifications(&v14 - a3, a3, (uint64_t)self->_probabilities, 0, v8);
  v6[2](v6, &v14 - a3);

}

- ($A8567127CD1317684890FBE2DC5448B6)topClassification
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  __n128 (*v10)(__n128 *, __n128 *);
  uint64_t (*v11)();
  const char *v12;
  $A8567127CD1317684890FBE2DC5448B6 result;

  v7 = 0;
  v8 = &v7;
  v9 = 0x4012000000;
  v10 = __Block_byref_object_copy__74;
  v11 = __Block_byref_object_dispose__75;
  v12 = "";
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__RKEventIdentification_topClassification__block_invoke;
  v6[3] = &unk_24C6AFCC0;
  v6[4] = &v7;
  -[RKEventIdentification getTopKClassifications:block:](self, "getTopKClassifications:block:", 1, v6);
  v2 = v8[6];
  v3 = v8[7];
  _Block_object_dispose(&v7, 8);
  v4 = v2;
  v5 = v3;
  result.var1 = *(float *)&v5;
  result.var0 = v4;
  return result;
}

__n128 __42__RKEventIdentification_topClassification__block_invoke(uint64_t a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *a2;
  return result;
}

- (id)description
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__3;
  v9 = __Block_byref_object_dispose__3;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__RKEventIdentification_description__block_invoke;
  v4[3] = &unk_24C6AFCE8;
  v4[4] = self;
  v4[5] = &v5;
  -[RKEventIdentification getTopKClassifications:block:](self, "getTopKClassifications:block:", 2, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __36__RKEventIdentification_description__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  objc_class *v5;
  uint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)a2 > 4uLL)
    v7 = CFSTR("INVALID");
  else
    v7 = off_24C6AFD48[*(_QWORD *)a2];
  v8 = *(_QWORD *)(a2 + 16);
  if (v8 > 4)
    v9 = CFSTR("INVALID");
  else
    v9 = off_24C6AFD48[v8];
  v13 = (id)v6;
  v10 = objc_msgSend(v4, "initWithFormat:", CFSTR("[%@ %@=%0.2f, %@=%0.2f]"), v6, v7, *(float *)(a2 + 8), v9, *(float *)(a2 + 24));
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (NSArray)tokenSequences
{
  return self->_tokenSequences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSequences, 0);
}

@end
