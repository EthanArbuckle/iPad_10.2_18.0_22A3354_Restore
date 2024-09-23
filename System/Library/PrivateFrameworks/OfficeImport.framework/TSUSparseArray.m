@implementation TSUSparseArray

+ (id)array
{
  objc_opt_class();
  return (id)objc_opt_new();
}

- (void)dealloc
{
  tsuSaPage *topPage;
  objc_super v4;

  topPage = self->_topPage;
  if (topPage)
  {
    (*((void (**)(tsuSaPage *, SEL))topPage->var0 + 1))(topPage, a2);
    self->_topPage = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUSparseArray;
  -[TSUSparseArray dealloc](&v4, sel_dealloc);
}

- (id)description
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p>:"), objc_opt_class(), self);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__TSUSparseArray_description__block_invoke;
  v5[3] = &unk_24F39B5B0;
  v5[4] = &v6;
  -[TSUSparseArray foreach:](self, "foreach:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __29__TSUSparseArray_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n   [%lu] = %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3, v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (unint64_t)maxIndexForCurrentDepth
{
  unsigned int depth;
  char v3;
  void *v4;
  void *v5;

  depth = self->_depth;
  if (!depth)
    return 0;
  v3 = 8 * depth;
  if (8 * depth >= 0x21)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUSparseArray maxIndexForCurrentDepth]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUSparseArray.mm");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 215, 0, "Not expecting a shiftedDepth larger than 32");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  return ~(-1 << v3);
}

- (id)objectForKey:(unint64_t)a3
{
  uint64_t depth;
  unint64_t v6;
  uint64_t v8;
  char *v9;
  tsuSaPage *topPage;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  depth = self->_depth;
  if (!(_DWORD)depth)
    return 0;
  v6 = -[TSUSparseArray maxIndexForCurrentDepth](self, "maxIndexForCurrentDepth");
  if (v6 < a3)
    return 0;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v17 - v8;
  topPage = self->_topPage;
  v11 = depth;
  do
  {
    v12 = a3;
    a3 >>= 8;
    *(_QWORD *)&v9[8 * --v11] = v12;
  }
  while (v11);
  v13 = (depth - 1);
  if ((_DWORD)depth == 1)
  {
    v13 = 0;
    return topPage[*(_QWORD *)&v9[8 * v13] + 1].var0;
  }
  else
  {
    v14 = (depth - 1);
    v15 = (uint64_t *)v9;
    while (1)
    {
      v16 = *v15++;
      topPage = (tsuSaPage *)topPage[v16 + 1].var0;
      if (!topPage)
        break;
      if (!--v14)
        return topPage[*(_QWORD *)&v9[8 * v13] + 1].var0;
    }
    return 0;
  }
}

- (void)increaseDepth
{
  unsigned int depth;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  tsuSaPage *v13;
  uint64_t v14;

  depth = self->_depth;
  if (depth)
  {
    if (depth >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUSparseArray increaseDepth]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUSparseArray.mm");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 249, 1, "TSUSparseArray - getting too deep");

      TSUCrash((uint64_t)"TSUSparseArray - getting too deep", v6, v7, v8, v9, v10, v11, v12, v14);
    }
    v13 = (tsuSaPage *)operator new();
    v13->var0 = (void **)&off_24F39B588;
    bzero(&v13[2], 0x7F8uLL);
    v13[1].var0 = (void **)&self->_topPage->var0;
  }
  else
  {
    v13 = (tsuSaPage *)operator new();
    v13->var0 = (void **)&off_24F39B558;
    bzero(&v13[1], 0x800uLL);
  }
  self->_topPage = v13;
  ++self->_depth;
}

- (void)setObject:(id)a3 forKey:(unint64_t)a4
{
  unint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned int depth;
  uint64_t v10;
  uint64_t v11;
  uint64_t topPage;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  objc_object *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v18 = (objc_object *)a3;
  while (1)
  {
    v6 = -[TSUSparseArray maxIndexForCurrentDepth](self, "maxIndexForCurrentDepth", v18, v19);
    if (v6 >= a4)
    {
      if (self->_depth)
        break;
    }
    -[TSUSparseArray increaseDepth](self, "increaseDepth");
  }
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - v7;
  depth = self->_depth;
  if (depth)
  {
    v10 = self->_depth;
    do
    {
      v11 = a4;
      a4 >>= 8;
      *(_QWORD *)&v8[8 * --v10] = v11;
    }
    while (v10);
    topPage = (uint64_t)self->_topPage;
    if (depth == 1)
    {
      v13 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    topPage = (uint64_t)self->_topPage;
  }
  v14 = 0;
  do
  {
    v15 = topPage + 8 * *(_QWORD *)&v8[8 * v14];
    v17 = *(_QWORD *)(v15 + 8);
    v16 = (uint64_t *)(v15 + 8);
    topPage = v17;
    if (!v17)
    {
      if (v14 == depth - 2)
      {
        topPage = operator new();
        *(_QWORD *)topPage = &off_24F39B558;
      }
      else
      {
        topPage = operator new();
        *(_QWORD *)topPage = &off_24F39B588;
      }
      bzero((void *)(topPage + 8), 0x800uLL);
      *v16 = topPage;
      depth = self->_depth;
    }
    ++v14;
    v13 = depth - 1;
  }
  while (v14 < v13);
LABEL_18:
  self->_nonNilCount += (int)tsuSaObjectPage::setObjectAtIndex((tsuSaObjectPage *)topPage, v18, *(_QWORD *)&v8[8 * v13]);

}

- (BOOL)hasObjectForKey:(unint64_t)a3
{
  void *v3;
  BOOL v4;

  -[TSUSparseArray objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)removeObjectForKey:(unint64_t)a3
{
  -[TSUSparseArray setObject:forKey:](self, "setObject:forKey:", 0, a3);
}

- (void)foreach:(id)a3
{
  id v4;
  tsuSaPage *topPage;
  char v6;

  v4 = a3;
  topPage = self->_topPage;
  if (topPage)
  {
    v6 = 0;
    (*((void (**)(tsuSaPage *, id, _QWORD, char *))topPage->var0 + 2))(topPage, v4, 0, &v6);
  }

}

- (void)clear
{
  tsuSaPage *topPage;

  topPage = self->_topPage;
  if (topPage)
  {
    (*((void (**)(tsuSaPage *, SEL))topPage->var0 + 1))(topPage, a2);
    self->_topPage = 0;
    self->_depth = 0;
  }
}

- (unint64_t)count
{
  return self->_nonNilCount;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  tsuSaPage *topPage;

  v4 = objc_opt_new();
  *(_DWORD *)(v4 + 24) = self->_depth;
  topPage = self->_topPage;
  *(_QWORD *)(v4 + 16) = self->_nonNilCount;
  if (topPage)
    topPage = (tsuSaPage *)(*((uint64_t (**)(tsuSaPage *))topPage->var0 + 3))(topPage);
  *(_QWORD *)(v4 + 8) = topPage;
  return (id)v4;
}

@end
