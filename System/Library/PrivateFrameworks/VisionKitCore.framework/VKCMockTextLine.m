@implementation VKCMockTextLine

- (VKCMockTextLine)initWithWordsArray:(id)a3 startingIndex:(unint64_t)a4
{
  id v6;
  VKCMockTextLine *v7;
  VKCMockTextLine *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VKCMockTextLine;
  v7 = -[VKCMockTextLine init](&v10, sel_init);
  v8 = v7;
  if (v7)
    -[VKCMockTextLine loadWordsArrayFromWords:startingIndex:](v7, "loadWordsArrayFromWords:startingIndex:", v6, a4);

  return v8;
}

- (void)loadWordsArrayFromWords:(id)a3 startingIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v8 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __57__VKCMockTextLine_loadWordsArrayFromWords_startingIndex___block_invoke;
  v34[3] = &unk_1E9464DE8;
  v9 = v7;
  v35 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v34);
  v10 = (void *)objc_msgSend(v9, "copy");
  -[VKCMockTextLine setWords:](self, "setWords:", v10);

  v28 = 0;
  v29 = &v28;
  v30 = 0x3010000000;
  v31 = &unk_1D2EE27EA;
  v32 = a4;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__22;
  v26 = __Block_byref_object_dispose__22;
  v27 = 0;
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __57__VKCMockTextLine_loadWordsArrayFromWords_startingIndex___block_invoke_26;
  v17[3] = &unk_1E9465D18;
  v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v18 = v11;
  v20 = &v28;
  v21 = &v22;
  v12 = v9;
  v19 = v12;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);
  -[VKCMockTextLine setRange:](self, "setRange:", v29[4], v29[5]);
  -[VKCMockTextLine setQuad:](self, "setQuad:", v23[5]);
  -[VKCMockTextLine setText:](self, "setText:", v11);
  -[VKCMockTextLine text](self, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");
  -[VKCMockTextLine range](self, "range");
  v16 = v15;

  if (v14 != v16)
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.text.length == self.range.length", "-[VKCMockTextLine loadWordsArrayFromWords:startingIndex:]", 0, 0, CFSTR("Mock Text is unequal to range length"));

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

}

void __57__VKCMockTextLine_loadWordsArrayFromWords_startingIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  VKCMockTextWord *v4;

  v3 = a2;
  v4 = -[VKCMockTextWord initWithWordsDictionary:]([VKCMockTextWord alloc], "initWithWordsDictionary:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

void __57__VKCMockTextLine_loadWordsArrayFromWords_startingIndex___block_invoke_26(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a2;
  objc_msgSend(v5, "text");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v13);
  objc_msgSend(v5, "setRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)+ *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), objc_msgSend(v13, "length"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) += objc_msgSend(v13, "length");
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(v5, "quad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "quadFromUnionWithQuad:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v7;
    v7 = v12;
  }

  if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" "));
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }

}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
  objc_storeStrong((id *)&self->_quad, a3);
}

- (NSArray)words
{
  return self->_words;
}

- (void)setWords:(id)a3
{
  objc_storeStrong((id *)&self->_words, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_words, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
