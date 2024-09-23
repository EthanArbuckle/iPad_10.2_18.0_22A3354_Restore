@implementation _UITextInputSessionMetaAccumulator

- (void)increaseWithActions:(id)a3
{
  id v4;
  uint64_t v5;
  NSArray *accumulators;
  id v7;
  int64_t lastSuccessfulIndex;
  NSUInteger v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t, _BYTE *);
  void *v18;
  id v19;
  _UITextInputSessionMetaAccumulator *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  accumulators = self->_accumulators;
  v26 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __58___UITextInputSessionMetaAccumulator_increaseWithActions___block_invoke;
  v18 = &unk_1E16E5860;
  v22 = v5;
  v7 = v4;
  v20 = self;
  v21 = &v23;
  v19 = v7;
  -[NSArray enumerateObjectsWithOptions:usingBlock:](accumulators, "enumerateObjectsWithOptions:usingBlock:", 2, &v15);
  if (*((_BYTE *)v24 + 24))
    goto LABEL_7;
  ++self->_actionCountWithoutIncrease;
  lastSuccessfulIndex = self->_lastSuccessfulIndex;
  v9 = -[NSArray count](self->_accumulators, "count", v15, v16, v17, v18);
  if (lastSuccessfulIndex + 1 < v9 - 1)
    v10 = lastSuccessfulIndex + 1;
  else
    v10 = v9 - 1;
  -[NSArray objectAtIndex:](self->_accumulators, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "depthRange");
  v14 = v12 + v13;

  if (self->_actionCountWithoutIncrease >= v14)
  {
    self->_lastSuccessfulIndex = -1;
LABEL_7:
    self->_actionCountWithoutIncrease = 0;
  }

  _Block_object_dispose(&v23, 8);
}

+ (id)accumulatorWithName:(id)a3 accumulators:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v5 = a3;
  v6 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "depthRange");
  v10 = v9;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = v8;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = v8 + v10;
  objc_msgSend(v6, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "type");

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71___UITextInputSessionMetaAccumulator_accumulatorWithName_accumulators___block_invoke;
  v18[3] = &unk_1E16E5838;
  v18[4] = &v23;
  v18[5] = &v19;
  v18[6] = &v27;
  v18[7] = v12;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);
  if (*((_BYTE *)v28 + 24) && objc_msgSend(v6, "count"))
  {
    v13 = objc_alloc_init((Class)objc_opt_class());
    v14 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v13, "setName:", v14);

    objc_msgSend(v13, "setType:", v12);
    objc_msgSend(v13, "setDepthRange:", v24[3], v20[3] - v24[3]);
    v15 = objc_msgSend(v6, "copy");
    v16 = (void *)v13[15];
    v13[15] = v15;

    objc_msgSend(v13, "reset");
  }
  else
  {
    v13 = 0;
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (void)reset
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)_UITextInputSessionMetaAccumulator;
  -[_UITextInputSessionAccumulator reset](&v12, sel_reset);
  self->_lastSuccessfulIndex = -1;
  self->_actionCountWithoutIncrease = 0;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_accumulators;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "reset", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_class();
  -[_UITextInputSessionAccumulator name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accumulatorWithName:accumulators:", v5, self->_accumulators);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulators, 0);
}

@end
