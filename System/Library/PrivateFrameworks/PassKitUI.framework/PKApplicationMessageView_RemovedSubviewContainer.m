@implementation PKApplicationMessageView_RemovedSubviewContainer

- (PKApplicationMessageView_RemovedSubviewContainer)init
{

  return 0;
}

- (id)initWithView:(void *)a3 index:(int)a4 layoutMode:(void *)a5 commitAnimation:
{
  id v10;
  id v11;
  id *v12;
  id *v13;
  id *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSString *v19;
  id *v20;
  objc_super v22;

  v10 = a2;
  v11 = a5;
  if (a1 && v10)
  {
    v22.receiver = a1;
    v22.super_class = (Class)PKApplicationMessageView_RemovedSubviewContainer;
    v12 = (id *)objc_msgSendSuper2(&v22, sel_init);
    v13 = v12;
    if (v12)
    {
      v14 = v12 + 4;
      objc_storeStrong(v12 + 4, a2);
      v13[5] = a3;
      v13[6] = a3;
      *((_DWORD *)v13 + 7) = a4;
      *((_BYTE *)v13 + 24) = 0;
      v15 = _Block_copy(v11);
      v16 = v13[1];
      v13[1] = v15;

      objc_msgSend(v13[4], "setUserInteractionEnabled:", 0);
      objc_msgSend(v13[4], "traitCollection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "preferredContentSizeCategory");
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (UIContentSizeCategoryCompareToCategory(v19, (UIContentSizeCategory)*MEMORY[0x1E0DC4938]))
        {
          objc_msgSend(*v14, "setMinimumContentSizeCategory:", v19);
          objc_msgSend(*v14, "setMaximumContentSizeCategory:", v19);
        }

      }
    }
    a1 = v13;
    v20 = a1;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_commitFlag == 1)
    -[PKApplicationMessageView_RemovedSubviewContainer _finishFromDealloc:]((uint64_t)self, 1);
  v3.receiver = self;
  v3.super_class = (Class)PKApplicationMessageView_RemovedSubviewContainer;
  -[PKApplicationMessageView_RemovedSubviewContainer dealloc](&v3, sel_dealloc);
}

- (void)_finishFromDealloc:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 24) == 1)
    {
      *(_BYTE *)(a1 + 24) = 2;
      v3 = *(_QWORD *)(a1 + 16);
      if (v3)
      {
        if (a2)
          v4 = 0;
        else
          v4 = a1;
        (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
        v5 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = 0;

      }
    }
    else
    {
      __break(1u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong(&self->_commitCompletion, 0);
  objc_storeStrong(&self->_commitAnimation, 0);
}

@end
