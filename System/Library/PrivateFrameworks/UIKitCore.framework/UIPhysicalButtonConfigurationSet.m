@implementation UIPhysicalButtonConfigurationSet

void __71___UIPhysicalButtonConfigurationSet__enumerateConfigurationsWithBlock___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1[4] + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    (*(void (**)(void))(a1[5] + 16))();
    v7 = v8;
    if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
      *a3 = 1;
  }

}

void __71___UIPhysicalButtonConfigurationSet__initWithConfigurationsDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (v10)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v8 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

    v6 = v10;
  }

}

void __56___UIPhysicalButtonConfigurationSet_initWithBSXPCCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  if ((unint64_t)(a2 - 1) <= 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", *(_QWORD *)(a1 + 48), off_1E16ED080[a2 - 1]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v10 = v4;
      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v5)
      {
        v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;

        v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v10, v9);

      v4 = v10;
    }

  }
}

uint64_t __58___UIPhysicalButtonConfigurationSet_encodeWithBSXPCCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "_button");
  if ((unint64_t)(result - 1) <= 4)
    return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", a2, off_1E16ED080[result - 1]);
  return result;
}

uint64_t __147___UIPhysicalButtonConfigurationSet__validateRequirementsForCandidateButton_andConfiguration_allowingNilRequiredConfiguration_withOutErrorMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v7), "unsignedIntegerValue", (_QWORD)v15);
        if (v8 != *(_QWORD *)(a1 + 56))
        {
          objc_msgSend(*(id *)(a1 + 32), "_configurationForButton:", v8);
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = *(_QWORD *)(a1 + 40);
            if (v10 != v9
              && (!v10
               || *(_QWORD *)(v9 + 24) != *(_QWORD *)(v10 + 24)
               || *(unsigned __int8 *)(v9 + 8) != *(unsigned __int8 *)(v10 + 8)))
            {
LABEL_18:
              v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              v13 = *(void **)(v12 + 40);
              *(_QWORD *)(v12 + 40) = v9;

              v11 = 1;
              goto LABEL_19;
            }
          }
          else if (!*(_BYTE *)(a1 + 64))
          {
            goto LABEL_18;
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_19:

  return v11;
}

uint64_t __57___UIPhysicalButtonConfigurationSet__nsSetRepresentation__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __63___UIPhysicalButtonConfigurationSet__configurationPassingTest___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __75___UIPhysicalButtonConfigurationSet_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("pauseButtonRequirementValidation"), 1);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75___UIPhysicalButtonConfigurationSet_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v7[3] = &unk_1E16B1B50;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  objc_msgSend(v3, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v7);

}

void __75___UIPhysicalButtonConfigurationSet_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __75___UIPhysicalButtonConfigurationSet_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v2[3] = &unk_1E16ECFC0;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_enumerateConfigurationsWithBlock:", v2);

}

void __75___UIPhysicalButtonConfigurationSet_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  _NSStringFromUIPhysicalButton(objc_msgSend(a2, "_button"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", a2, v5);

}

uint64_t __53___UIPhysicalButtonConfigurationSet_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "_button");
  if ((unint64_t)(result - 1) <= 4)
    return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", a2, off_1E16ED080[result - 1]);
  return result;
}

void __51___UIPhysicalButtonConfigurationSet_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  if ((unint64_t)(a2 - 1) <= 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", *(_QWORD *)(a1 + 48), off_1E16ED080[a2 - 1]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v10 = v4;
      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v5)
      {
        v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;

        v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v10, v9);

      v4 = v10;
    }

  }
}

uint64_t __61___UIPhysicalButtonConfigurationSet_encodeWithXPCDictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "_button");
  if ((unint64_t)(result - 1) <= 4)
  {
    -[__CFString UTF8String](off_1E16ED080[result - 1], "UTF8String");
    return BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
  return result;
}

void __59___UIPhysicalButtonConfigurationSet_initWithXPCDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  if ((unint64_t)(a2 - 1) <= 4)
  {
    -[__CFString UTF8String](off_1E16ED080[a2 - 1], "UTF8String");
    v4 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
    if (v4)
    {
      v10 = v4;
      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v5)
      {
        v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;

        v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v10, v9);

      v4 = v10;
    }

  }
}

@end
