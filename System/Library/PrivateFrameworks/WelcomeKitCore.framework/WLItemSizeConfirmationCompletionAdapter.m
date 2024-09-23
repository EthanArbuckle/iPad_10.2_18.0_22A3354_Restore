@implementation WLItemSizeConfirmationCompletionAdapter

- (WLItemSizeConfirmationCompletionAdapter)initWithUnconfirmedItemSize:(unint64_t)a3 segmentSize:(unint64_t)a4 originalSegmentCompletion:(id)a5 originalCompletion:(id)a6
{
  id v10;
  id v11;
  WLItemSizeConfirmationCompletionAdapter *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id segmentCompletion;
  uint64_t v17;
  id completion;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD v31[4];
  objc_super v32;

  v10 = a5;
  v11 = a6;
  v32.receiver = self;
  v32.super_class = (Class)WLItemSizeConfirmationCompletionAdapter;
  v12 = -[WLItemSizeConfirmationCompletionAdapter init](&v32, sel_init);
  if (v12)
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0;
    v13 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __128__WLItemSizeConfirmationCompletionAdapter_initWithUnconfirmedItemSize_segmentSize_originalSegmentCompletion_originalCompletion___block_invoke;
    v26[3] = &unk_24E3763A0;
    v28 = v31;
    v29 = a3;
    v30 = a4;
    v14 = v10;
    v27 = v14;
    v15 = MEMORY[0x2207BB4C4](v26);
    segmentCompletion = v12->_segmentCompletion;
    v12->_segmentCompletion = (id)v15;

    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __128__WLItemSizeConfirmationCompletionAdapter_initWithUnconfirmedItemSize_segmentSize_originalSegmentCompletion_originalCompletion___block_invoke_2;
    v20[3] = &unk_24E3763C8;
    v23 = v31;
    v24 = a3;
    v25 = a4;
    v21 = v14;
    v22 = v11;
    v17 = MEMORY[0x2207BB4C4](v20);
    completion = v12->_completion;
    v12->_completion = (id)v17;

    _Block_object_dispose(v31, 8);
  }

  return v12;
}

uint64_t __128__WLItemSizeConfirmationCompletionAdapter_initWithUnconfirmedItemSize_segmentSize_originalSegmentCompletion_originalCompletion___block_invoke(uint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(result + 48);
  v2 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v3 = *(_QWORD *)(v2 + 24);
  if (v1 > v3)
  {
    v4 = result;
    if (*(_QWORD *)(result + 56) + v3 <= v1)
      v5 = *(_QWORD *)(result + 56);
    else
      v5 = v1 - v3;
    result = *(_QWORD *)(result + 32);
    if (result)
    {
      result = (*(uint64_t (**)(uint64_t, unint64_t))(result + 16))(result, v5);
      v2 = *(_QWORD *)(*(_QWORD *)(v4 + 40) + 8);
      v3 = *(_QWORD *)(v2 + 24);
    }
    *(_QWORD *)(v2 + 24) = v3 + v5;
  }
  return result;
}

void __128__WLItemSizeConfirmationCompletionAdapter_initWithUnconfirmedItemSize_segmentSize_originalSegmentCompletion_originalCompletion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v12 = v3;
  if (!v3)
  {
    v5 = a1[6];
    v6 = a1[7];
    while (1)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(v5 + 8) + 24);
      if (v7 >= v6)
        break;
      v8 = a1[8] + v7;
      v9 = v6 - v7;
      if (v8 <= v6)
        v10 = a1[8];
      else
        v10 = v9;
      v11 = a1[4];
      if (v11)
      {
        (*(void (**)(uint64_t, unint64_t))(v11 + 16))(v11, v10);
        v3 = 0;
        v5 = a1[6];
        v6 = a1[7];
      }
      *(_QWORD *)(*(_QWORD *)(v5 + 8) + 24) += v10;
      v5 = a1[6];
    }
  }
  v4 = a1[5];
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v12);
    v3 = v12;
  }

}

- (id)segmentCompletion
{
  return self->_segmentCompletion;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_segmentCompletion, 0);
}

@end
