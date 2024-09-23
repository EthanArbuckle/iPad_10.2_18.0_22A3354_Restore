@implementation _NSTextAttributeStorage

- (BOOL)setAttribute:(id)a3 value:(id)a4 forTextRange:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  NSTextRange *v11;
  NSTextRange *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[9];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t);
  void *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  uint64_t v39;
  _BYTE v40[128];
  id v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v34 = 0;
  v35 = &v34;
  v36 = 0x3052000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v29 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v31 = __59___NSTextAttributeStorage_setAttribute_value_forTextRange___block_invoke;
  v32 = &unk_1E2602DF8;
  v33 = &v34;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = (id)objc_msgSend(a5, "location");
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __59___NSTextAttributeStorage_setAttribute_value_forTextRange___block_invoke_2;
  v23[3] = &unk_1E2602E20;
  v23[8] = &v24;
  v23[4] = a5;
  v23[5] = a4;
  v23[6] = a3;
  v23[7] = v30;
  -[_NSTextRunStorage enumerateObjectsFromLocation:options:usingBlock:](self, "enumerateObjectsFromLocation:options:usingBlock:", objc_msgSend(a5, "location"), 0, v23);
  v10 = objc_msgSend((id)v25[5], "compare:", objc_msgSend(a5, "endLocation"));
  if (a4 && v10 == -1)
  {
    v11 = [NSTextRange alloc];
    v12 = -[NSTextRange initWithLocation:endLocation:](v11, "initWithLocation:endLocation:", v25[5], objc_msgSend(a5, "endLocation"));
    v41 = a3;
    v42[0] = a4;
    v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v31((uint64_t)v30, (uint64_t)v12, v13);

  }
  v14 = (void *)v35[5];
  if (v14)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v40, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v14);
          -[_NSTextAttributeStorage _setAttributes:forTextRange:checkForChange:](self, "_setAttributes:forTextRange:checkForChange:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17), "objectAtIndexedSubscript:", 1), objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17), "objectAtIndexedSubscript:", 0), 0);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v40, 16);
      }
      while (v15);
    }

  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v34, 8);
  return v14 != 0;
}

- (BOOL)removeAttribute:(id)a3 forTextRange:(id)a4
{
  return -[_NSTextAttributeStorage setAttribute:value:forTextRange:](self, "setAttribute:value:forTextRange:", a3, 0, a4);
}

- (BOOL)_attributesInTextRange:(id)a3 areEqualToAttributes:(id)a4
{
  uint64_t v7;
  _QWORD *v8;
  char v9;
  _QWORD v11[6];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  if (a4)
  {
    v16 = 0;
    v7 = objc_msgSend(a3, "location");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71___NSTextAttributeStorage__attributesInTextRange_areEqualToAttributes___block_invoke;
    v12[3] = &unk_1E2602E48;
    v12[5] = a4;
    v12[6] = &v13;
    v12[4] = a3;
    v8 = v12;
  }
  else
  {
    v16 = 1;
    v7 = objc_msgSend(a3, "location");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71___NSTextAttributeStorage__attributesInTextRange_areEqualToAttributes___block_invoke_2;
    v11[3] = &unk_1E2602E70;
    v11[4] = a3;
    v11[5] = &v13;
    v8 = v11;
  }
  -[_NSTextAttributeStorage enumerateAttributesFromLocation:reverse:usingBlock:](self, "enumerateAttributesFromLocation:reverse:usingBlock:", v7, 0, v8);
  v9 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v9;
}

- (BOOL)_setAttributes:(id)a3 forTextRange:(id)a4 checkForChange:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  void *v10;
  BOOL v11;

  v5 = a5;
  if (objc_msgSend(a3, "count"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = a3;
    else
      v9 = +[NSAttributeDictionary newWithDictionary:](NSAttributeDictionary, "newWithDictionary:", a3);
    v10 = v9;
    if (!v5)
      goto LABEL_10;
  }
  else
  {
    v10 = 0;
    if (!v5)
      goto LABEL_10;
  }
  if (!-[_NSTextAttributeStorage _attributesInTextRange:areEqualToAttributes:](self, "_attributesInTextRange:areEqualToAttributes:", a4, v10))
  {
LABEL_10:
    -[_NSTextRunStorage setObject:forRange:](self, "setObject:forRange:", v10, a4);
    v11 = 1;
    goto LABEL_11;
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)setAttributes:(id)a3 forTextRange:(id)a4
{
  return -[_NSTextAttributeStorage _setAttributes:forTextRange:checkForChange:](self, "_setAttributes:forTextRange:checkForChange:", a3, a4, 1);
}

- (void)enumerateAttributesFromLocation:(id)a3 reverse:(BOOL)a4 usingBlock:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78___NSTextAttributeStorage_enumerateAttributesFromLocation_reverse_usingBlock___block_invoke;
  v5[3] = &unk_1E2602E98;
  v5[4] = a5;
  -[_NSTextRunStorage enumerateObjectsFromLocation:options:usingBlock:](self, "enumerateObjectsFromLocation:options:usingBlock:", a3, a4, v5);
}

@end
