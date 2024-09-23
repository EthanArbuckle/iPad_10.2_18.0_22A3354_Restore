@implementation _UIViewInProcessAnimationReasonArray

- (void)dealloc
{
  objc_super v3;

  free(self->_reasons);
  v3.receiver = self;
  v3.super_class = (Class)_UIViewInProcessAnimationReasonArray;
  -[_UIViewInProcessAnimationReasonArray dealloc](&v3, sel_dealloc);
}

- (_UIViewInProcessAnimationReasonArray)initWithSet:(id)a3
{
  id v4;
  _UIViewInProcessAnimationReasonArray *v5;
  unsigned int v6;
  unsigned int *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v18.receiver = self;
    v18.super_class = (Class)_UIViewInProcessAnimationReasonArray;
    v5 = -[_UIViewInProcessAnimationReasonArray init](&v18, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "count");
      v5->_reasonCount = v6;
      v7 = (unsigned int *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
      v5->_reasons = v7;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v15;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v8);
            *v7++ = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "unsignedIntValue", (_QWORD)v14);
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        }
        while (v10);
      }

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

+ (void)applyReasons:(id)a3 toDisplayLink:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;

  v9 = a3;
  v5 = a4;
  if (v9 && (v6 = *((unsigned int *)v9 + 4), (_DWORD)v6))
  {
    v7 = v9[1];
    v8 = v5;
  }
  else
  {
    v8 = v5;
    v7 = 0;
    v6 = 0;
  }
  objc_msgSend(v8, "setHighFrameRateReasons:count:", v7, v6);

}

@end
