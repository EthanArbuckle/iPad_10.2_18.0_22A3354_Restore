@implementation UIResponderChainFixerUpper

void __77___UIResponderChainFixerUpper__deliverComponents_phase_forEvent_toResponder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[6];
  id v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_nextResponders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "keyEnumerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_callResponder:phase:components:event:", v4, *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 40));

  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = v2;
    v6 = v2;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKey:", v11, v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = *(void **)(a1 + 32);
          objc_msgSend(v13, "currentDelivery");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __77___UIResponderChainFixerUpper__deliverComponents_phase_forEvent_toResponder___block_invoke_2;
          v18[3] = &unk_1E16B2900;
          v15 = *(void **)(a1 + 40);
          v18[4] = *(_QWORD *)(a1 + 32);
          v18[5] = v11;
          v21 = *(_QWORD *)(a1 + 48);
          v19 = v12;
          v20 = v15;
          v16 = v12;
          objc_msgSend(v13, "_snapshotDeliveryOfComponents:map:block:", v16, v14, v18);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

    v2 = v17;
  }

}

uint64_t __77___UIResponderChainFixerUpper__deliverComponents_phase_forEvent_toResponder___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callResponder:phase:components:event:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __69___UIResponderChainFixerUpper_forward_phase_withEvent_fromResponder___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_callResponder:phase:components:event:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), v2, *(_QWORD *)(a1 + 56));

}

void __53___UIResponderChainFixerUpper__recursiveDescription___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_recursiveDescriptionStep:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:", v2);

}

void __57___UIResponderChainFixerUpper__recursiveDescriptionStep___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  __CFString *v7;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = a2;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v6, v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("(nil)");
  }
  objc_msgSend(v2, "addObject:", v7);

}

void __57___UIResponderChainFixerUpper__recursiveDescriptionStep___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(&stru_1E16EDF20, "stringByPaddingToLength:withString:startingAtIndex:", *(_QWORD *)(a1 + 56) + 1, CFSTR(" "), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v3);

  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = v4;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v9, v7);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("(nil)");
  }
  objc_msgSend(v5, "appendFormat:", CFSTR(" - %@\n"), v10);

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "_recursiveDescriptionStep:", *(_QWORD *)(a1 + 56) + 2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendString:", v12);

}

@end
