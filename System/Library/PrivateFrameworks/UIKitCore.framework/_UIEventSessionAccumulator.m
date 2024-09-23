@implementation _UIEventSessionAccumulator

+ (id)accumulatorWithName:(id)a3 depthRange:(_NSRange)a4 block:(id)a5 allowedActionSourceTypes:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v21;
  NSObject *v22;
  uint8_t v23[16];

  length = a4.length;
  location = a4.location;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc_init((Class)objc_opt_class());
  v14 = objc_msgSend(v12, "copy");

  v15 = (void *)v13[2];
  v13[2] = v14;

  v13[6] = location;
  v13[7] = length;
  v16 = objc_msgSend(v11, "copy");

  v17 = (void *)v13[3];
  v13[3] = v16;

  v18 = objc_msgSend(v10, "copy");
  v19 = (void *)v13[4];
  v13[4] = v18;

  objc_msgSend(v13, "reset");
  if (os_variant_has_internal_diagnostics())
  {
    v21 = accumulatorWithName_depthRange_block_allowedActionSourceTypes____s_category;
    if (!accumulatorWithName_depthRange_block_allowedActionSourceTypes____s_category)
    {
      v21 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v21, (unint64_t *)&accumulatorWithName_depthRange_block_allowedActionSourceTypes____s_category);
    }
    if ((*(_BYTE *)v21 & 1) != 0)
    {
      v22 = *(NSObject **)(v21 + 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "_UIEventSessionAccumulator: Created new accumulator!", v23, 2u);
      }
    }
  }
  return v13;
}

- (void)performIncreaseWithActions:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIEventSessionAccumulator.m"), 45, CFSTR("_UIEventSessionAccumulator: performIncreaseWithActions() called! Please implement this method or use a child class."));

}

- (BOOL)isActionAllowed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_allowedActionSourceTypes, "objectForKeyedSubscript:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "source"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)increaseWithAction:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  unint64_t v8;
  NSUInteger v9;
  int64_t sequenceNumber;
  NSMutableOrderedSet *recentActions;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_UIEventSessionAccumulator isActionAllowed:](self, "isActionAllowed:", v4))
  {
    -[NSMutableOrderedSet firstObject](self->_recentActions, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = v5;
    if (!v5)
    {
LABEL_6:
      objc_msgSend(v4, "setSequenceNumber:", self->_sequenceNumber, v6);
      sequenceNumber = self->_sequenceNumber;
      if (sequenceNumber >= 999)
        sequenceNumber = 999;
      self->_sequenceNumber = sequenceNumber + 1;
      recentActions = self->_recentActions;
      v12 = (void *)objc_msgSend(v4, "copy");
      -[NSMutableOrderedSet insertObject:atIndex:](recentActions, "insertObject:atIndex:", v12, 0);

      goto LABEL_9;
    }
    if (!-[NSObject mergeActionIfPossible:](v5, "mergeActionIfPossible:", v4))
    {
      -[_UIEventSessionAccumulator performIncreaseWithActions:](self, "performIncreaseWithActions:", self->_recentActions);
      v8 = -[NSMutableOrderedSet count](self->_recentActions, "count");
      v9 = self->_depthRange.length + self->_depthRange.location;
      v6 = v8 - v9;
      if (v8 > v9)
        -[NSMutableOrderedSet removeObjectsInRange:](self->_recentActions, "removeObjectsInRange:");
      goto LABEL_6;
    }
LABEL_9:

    goto LABEL_11;
  }
  if (os_variant_has_internal_diagnostics())
  {
    v13 = increaseWithAction____s_category;
    if (!increaseWithAction____s_category)
    {
      v13 = __UILogCategoryGetNode("UIEventSessionActionAnalytics", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&increaseWithAction____s_category);
    }
    if ((*(_BYTE *)v13 & 1) != 0)
    {
      v14 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v7 = v14;
        v15 = 138412290;
        v16 = objc_opt_class();
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "_UIEventSessionAccumulator: increaseWithActions() skipping action of class %@", (uint8_t *)&v15, 0xCu);
        goto LABEL_9;
      }
    }
  }
LABEL_11:

}

- (void)flushAccumulator
{
  if (-[NSMutableOrderedSet count](self->_recentActions, "count"))
  {
    -[_UIEventSessionAccumulator performIncreaseWithActions:](self, "performIncreaseWithActions:", self->_recentActions);
    -[NSMutableOrderedSet removeAllObjects](self->_recentActions, "removeAllObjects");
  }
}

- (void)reset
{
  NSMutableOrderedSet *recentActions;
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *v5;

  self->_sequenceNumber = 0;
  recentActions = self->_recentActions;
  if (recentActions)
  {
    -[NSMutableOrderedSet removeAllObjects](recentActions, "removeAllObjects");
  }
  else
  {
    v4 = (NSMutableOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 20);
    v5 = self->_recentActions;
    self->_recentActions = v4;

  }
}

- (void)enumerateAnalytics:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIEventSessionAccumulator.m"), 138, CFSTR("_UIEventSessionAccumulator: enumerateAnalytics() called! Please implement this method or use a child class."));

}

- (NSString)name
{
  return self->_name;
}

- (_NSRange)depthRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_depthRange.length;
  location = self->_depthRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (id)block
{
  return self->_block;
}

- (NSDictionary)allowedActionSourceTypes
{
  return self->_allowedActionSourceTypes;
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int64_t)a3
{
  self->_sequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedActionSourceTypes, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_recentActions, 0);
}

@end
