@implementation _UIResponderChainFixerUpper

- (_UIResponderChainFixerUpper)init
{
  _UIResponderChainFixerUpper *v2;
  uint64_t v3;
  NSMapTable *deliveryRecords;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIResponderChainFixerUpper;
  v2 = -[_UIResponderChainFixerUpper init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    deliveryRecords = v2->_deliveryRecords;
    v2->_deliveryRecords = (NSMapTable *)v3;

  }
  return v2;
}

- (void)_snapshotDeliveryOfComponents:(id)a3 map:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  _UIResponderChainFixerUpper *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v20 = self;
  -[_UIResponderChainFixerUpper currentDelivery](self, "currentDelivery");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v9, "keyEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsObject:", v17, v19))
        {
          objc_msgSend(v9, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v18, v17);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  -[_UIResponderChainFixerUpper setCurrentDelivery:](v20, "setCurrentDelivery:", v11);
  v10[2](v10);
  -[_UIResponderChainFixerUpper setCurrentDelivery:](v20, "setCurrentDelivery:", v19);

}

- (void)deliverTouchesEvent:(id)a3 toResponder:(id)a4
{
  id v6;
  uint64_t i;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  for (i = 0; i != 5; ++i)
  {
    objc_msgSend(v9, "_touchesForResponder:withPhase:", v6, i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[_UIResponderChainFixerUpper _deliverComponents:phase:forEvent:toResponder:](self, "_deliverComponents:phase:forEvent:toResponder:", v8, i, v9, v6);
      objc_msgSend((id)UIApp, "_registerEstimatedTouches:event:forTouchable:", v8, v9, v6);
    }

  }
}

- (void)deliverPressesEvent:(id)a3 toResponder:(id)a4
{
  id v6;
  uint64_t i;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  for (i = 0; i != 5; ++i)
  {
    objc_msgSend(v9, "_pressesForResponder:withPhase:", v6, i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[_UIResponderChainFixerUpper _deliverComponents:phase:forEvent:toResponder:](self, "_deliverComponents:phase:forEvent:toResponder:", v8, i, v9, v6);

  }
}

- (void)_deliverComponents:(id)a3 phase:(int64_t)a4 forEvent:(id)a5 toResponder:(id)a6
{
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  _WORD *v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  objc_class *v28;
  void *v29;
  __CFString *v30;
  _QWORD v31[5];
  id v32;
  int64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  int64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v11 || !objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIResponderChainFixerUpper.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("components != nil && components.count > 0"));

  }
  v14 = _deliverComponents_phase_forEvent_toResponder____s_category;
  if (!_deliverComponents_phase_forEvent_toResponder____s_category)
  {
    v14 = __UILogCategoryGetNode("EventDelivery", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v14, (unint64_t *)&_deliverComponents_phase_forEvent_toResponder____s_category);
  }
  if ((*(_BYTE *)v14 & 1) != 0)
  {
    v25 = *(id *)(v14 + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = v13;
      if (v26)
      {
        v27 = (void *)MEMORY[0x1E0CB3940];
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("<%@: %p>"), v29, v26);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v30 = CFSTR("(nil)");
      }

      *(_DWORD *)buf = 134218498;
      v40 = a4;
      v41 = 2112;
      v42 = v11;
      v43 = 2112;
      v44 = v30;
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Delivering phase %ld components %@ to responder %@", buf, 0x20u);

    }
  }
  switch(a4)
  {
    case 0:
      -[_UIResponderChainFixerUpper _recordDeliveryOfComponents:toResponder:](self, "_recordDeliveryOfComponents:toResponder:", v11, v13);
      -[_UIResponderChainFixerUpper _callResponder:phase:components:event:](self, "_callResponder:phase:components:event:", v13, 0, v11, v12);
      break;
    case 1:
    case 4:
      goto LABEL_24;
    case 3:
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v15 = v11;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v35 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_WORD **)(*((_QWORD *)&v34 + 1) + 8 * i);
            if (objc_msgSend(v20, "_eventComponentType") == 1)
            {
              objc_msgSend(v20, "setSentPressesEnded:", 1);
            }
            else
            {
              v21 = objc_msgSend(v20, "_eventComponentType");
              if (v20)
                v22 = v21 == 0;
              else
                v22 = 0;
              if (v22)
                v20[118] |= 8u;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v17);
      }

LABEL_24:
      -[_UIResponderChainFixerUpper deliveryRecords](self, "deliveryRecords");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __77___UIResponderChainFixerUpper__deliverComponents_phase_forEvent_toResponder___block_invoke;
      v31[3] = &unk_1E16B1C28;
      v31[4] = self;
      v33 = a4;
      v32 = v12;
      -[_UIResponderChainFixerUpper _snapshotDeliveryOfComponents:map:block:](self, "_snapshotDeliveryOfComponents:map:block:", v11, v23, v31);

      if (a4 != 1)
        -[_UIResponderChainFixerUpper _removeDeliveryRecordForComponents:](self, "_removeDeliveryRecordForComponents:", v11);

      break;
    default:
      break;
  }

}

- (id)_nextResponders
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  _UIResponderChainFixerUpper *v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[_UIResponderChainFixerUpper currentDelivery](self, "currentDelivery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIResponderChainFixerUpper.m"), 225, CFSTR("Trying to enumerate responders without a current delivery record."));

  }
  v21 = self;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v4, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9, v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectAtIndex:", 0);
        objc_msgSend(v5, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "mutableCopy");
        v15 = v14;
        if (v14)
          v16 = v14;
        else
          v16 = (id)objc_opt_new();
        v17 = v16;

        objc_msgSend(v17, "addObject:", v9);
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(v5, "setObject:forKey:", v18, v12);

        if (objc_msgSend(v11, "count"))
          objc_msgSend(v4, "setObject:forKey:", v11, v9);
        else
          objc_msgSend(v4, "removeObjectForKey:", v9);

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v24);
  }

  -[_UIResponderChainFixerUpper setCurrentDelivery:](v21, "setCurrentDelivery:", v4);
  return v5;
}

- (void)forward:(id)a3 phase:(int64_t)a4 withEvent:(id)a5 fromResponder:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  id obj;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  _UIResponderChainFixerUpper *v29;
  id v30;
  int64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v25 = a5;
  v10 = a6;
  v11 = v10;
  if ((unint64_t)(a4 - 3) < 2 || a4 == 1)
  {
    -[_UIResponderChainFixerUpper _nextResponders](self, "_nextResponders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      if (objc_msgSend(v13, "count") == 1)
      {
        objc_msgSend(v13, "keyEnumerator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "nextObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIResponderChainFixerUpper _callResponder:phase:components:event:](self, "_callResponder:phase:components:event:", v15, a4, v16, v25);

      }
      else
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v13, "keyEnumerator");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v33 != v19)
                objc_enumerationMutation(obj);
              v21 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
              -[_UIResponderChainFixerUpper currentDelivery](self, "currentDelivery");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v26[0] = MEMORY[0x1E0C809B0];
              v26[1] = 3221225472;
              v26[2] = __69___UIResponderChainFixerUpper_forward_phase_withEvent_fromResponder___block_invoke;
              v26[3] = &unk_1E16B2900;
              v27 = v13;
              v28 = v21;
              v29 = self;
              v31 = a4;
              v30 = v25;
              -[_UIResponderChainFixerUpper _snapshotDeliveryOfComponents:map:block:](self, "_snapshotDeliveryOfComponents:map:block:", v24, v22, v26);

            }
            v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          }
          while (v18);
        }

      }
    }

  }
  else if (!a4)
  {
    objc_msgSend(v10, "nextResponder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[_UIResponderChainFixerUpper _recordDeliveryOfComponents:toResponder:](self, "_recordDeliveryOfComponents:toResponder:", v24, v12);
      -[_UIResponderChainFixerUpper _callResponder:phase:components:event:](self, "_callResponder:phase:components:event:", v12, 0, v24, v25);
    }

  }
}

- (void)_callResponder:(id)a3 phase:(int64_t)a4 components:(id)a5 event:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v10, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_eventComponentType");

  if (v13 == 1)
  {
    switch(a4)
    {
      case 0:
        objc_msgSend(v15, "pressesBegan:withEvent:", v10, v11);
        break;
      case 1:
        objc_msgSend(v15, "pressesChanged:withEvent:", v10, v11);
        goto LABEL_16;
      case 3:
        objc_msgSend(v15, "pressesEnded:withEvent:", v10, v11);
        goto LABEL_16;
      case 4:
        objc_msgSend(v15, "pressesCancelled:withEvent:", v10, v11);
        goto LABEL_16;
      case 5:
LABEL_9:
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Invalid phase."));
        goto LABEL_16;
      default:
        goto LABEL_16;
    }
  }
  else if (v13)
  {
    if (a4)
    {
LABEL_16:
      -[_UIResponderChainFixerUpper currentDelivery](self, "currentDelivery");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
        -[_UIResponderChainFixerUpper forward:phase:withEvent:fromResponder:](self, "forward:phase:withEvent:fromResponder:", v10, a4, v11, v15);

    }
  }
  else
  {
    switch(a4)
    {
      case 0:
        objc_msgSend(v15, "touchesBegan:withEvent:", v10, v11);
        break;
      case 1:
        objc_msgSend(v15, "touchesMoved:withEvent:", v10, v11);
        goto LABEL_16;
      case 3:
        objc_msgSend(v15, "touchesEnded:withEvent:", v10, v11);
        goto LABEL_16;
      case 4:
        objc_msgSend(v15, "touchesCancelled:withEvent:", v10, v11);
        goto LABEL_16;
      case 5:
        goto LABEL_9;
      default:
        goto LABEL_16;
    }
  }

}

- (void)_recordDeliveryOfComponents:(id)a3 toResponder:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "_eventComponentPhase");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "value");

        if (v14)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIResponderChainFixerUpper.m"), 372, CFSTR("Only components in the begin phase can be recorded."));

        }
        -[_UIResponderChainFixerUpper deliveryRecords](self, "deliveryRecords");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[_UIResponderChainFixerUpper deliveryRecords](self, "deliveryRecords");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v16, "arrayByAddingObject:", v7);
        }
        else
        {
          v25 = v7;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v18, v12);

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

}

- (void)_removeDeliveryRecordForComponents:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "_eventComponentPhase");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "value") != 3 && objc_msgSend(v11, "value") != 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIResponderChainFixerUpper.m"), 387, CFSTR("Only components in the ended or cancelled phase can be removed."));

        }
        -[_UIResponderChainFixerUpper deliveryRecords](self, "deliveryRecords");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObjectForKey:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIResponderChainFixerUpper deliveryRecords](self, "deliveryRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[_UIResponderChainFixerUpper deliveryRecords](self, "deliveryRecords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("; currently tracking %lu components>\n"), objc_msgSend(v9, "count"));

    -[_UIResponderChainFixerUpper recursiveDescription](self, "recursiveDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v10);

  }
  else
  {
    objc_msgSend(v6, "appendString:", CFSTR(">"));
  }
  return v6;
}

- (id)recursiveDescription
{
  return -[_UIResponderChainFixerUpper _recursiveDescription:](self, "_recursiveDescription:", 0);
}

- (id)_recursiveDescription:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _UIResponderChainFixerUpper *v16;

  v4 = a3;
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    -[_UIResponderChainFixerUpper deliveryRecords](self, "deliveryRecords");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v8);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIResponderChainFixerUpper deliveryRecords](self, "deliveryRecords");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53___UIResponderChainFixerUpper__recursiveDescription___block_invoke;
  v14[3] = &unk_1E16B1B50;
  v11 = v9;
  v15 = v11;
  v16 = self;
  -[_UIResponderChainFixerUpper _snapshotDeliveryOfComponents:map:block:](self, "_snapshotDeliveryOfComponents:map:block:", v4, v10, v14);

  v12 = v11;
  return v12;
}

- (id)_recursiveDescriptionStep:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  __CFString *v31;
  uint64_t v32;
  _UIResponderChainFixerUpper *v33;
  unint64_t v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[_UIResponderChainFixerUpper _nextResponders](self, "_nextResponders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_msgSend(v5, "count");
    if (a3 && v6 == 1)
    {
      objc_msgSend(v5, "keyEnumerator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nextObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (__CFString *)objc_opt_new();
      v10 = v8;
      if (v10)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v10);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = CFSTR("(nil)");
      }

      -[__CFString appendFormat:](v9, "appendFormat:", CFSTR(" - %@\n"), v14);
      -[_UIResponderChainFixerUpper _recursiveDescriptionStep:](self, "_recursiveDescriptionStep:", a3 + 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendString:](v9, "appendString:", v25);

    }
    else
    {
      v9 = (__CFString *)objc_opt_new();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      objc_msgSend(v5, "keyEnumerator");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v29)
      {
        v28 = *(_QWORD *)v38;
        v15 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v38 != v28)
              objc_enumerationMutation(obj);
            v17 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v5, "objectForKey:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(&stru_1E16EDF20, "stringByPaddingToLength:withString:startingAtIndex:", a3, CFSTR(" "), 0);
            v19 = v5;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString appendString:](v9, "appendString:", v20);

            -[__CFString appendString:](v9, "appendString:", CFSTR(" + "));
            v21 = (void *)objc_opt_new();
            v35[0] = v15;
            v35[1] = 3221225472;
            v35[2] = __57___UIResponderChainFixerUpper__recursiveDescriptionStep___block_invoke;
            v35[3] = &unk_1E16D9808;
            v36 = v21;
            v22 = v21;
            objc_msgSend(v18, "enumerateObjectsUsingBlock:", v35);
            objc_msgSend(v22, "componentsJoinedByString:", CFSTR(", "));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString appendString:](v9, "appendString:", v23);

            -[__CFString appendString:](v9, "appendString:", CFSTR(":\n"));
            -[_UIResponderChainFixerUpper currentDelivery](self, "currentDelivery");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v30[0] = v15;
            v30[1] = 3221225472;
            v30[2] = __57___UIResponderChainFixerUpper__recursiveDescriptionStep___block_invoke_2;
            v30[3] = &unk_1E16C5CA0;
            v31 = v9;
            v32 = v17;
            v33 = self;
            v34 = a3;
            -[_UIResponderChainFixerUpper _snapshotDeliveryOfComponents:map:block:](self, "_snapshotDeliveryOfComponents:map:block:", v18, v24, v30);

            v5 = v19;
          }
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v29);
      }

    }
  }
  else
  {
    v9 = &stru_1E16EDF20;
  }

  return v9;
}

- (NSMapTable)deliveryRecords
{
  return self->_deliveryRecords;
}

- (NSMapTable)currentDelivery
{
  return self->_currentDelivery;
}

- (void)setCurrentDelivery:(id)a3
{
  objc_storeStrong((id *)&self->_currentDelivery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDelivery, 0);
  objc_storeStrong((id *)&self->_deliveryRecords, 0);
}

@end
